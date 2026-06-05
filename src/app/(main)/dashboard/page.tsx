import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import type { AxisKey } from '@/lib/assessment-config'
import DashboardClient from './DashboardClient'
import AdminDashboard from './AdminDashboard'
import DashboardAnnouncements from './DashboardAnnouncements'
import ExamGatePage from '@/components/dashboard/ExamGatePage'
import { checkAndCreateExamCycle, getNextExamDate } from '@/app/actions/exam-scheduling'
import { expireStaleExams } from '@/app/actions/comprehensive-exam'
import {
  aggregateJapaneseProgress,
  type JapaneseAssignmentRow,
  type JapaneseProgressStat,
} from '@/lib/japanese-progress'
import { aggregateItemProgress, aggregateQuizProgress, getMyItemAssignmentProgress, runMonthlyAutoAssignment } from '@/app/actions/item-assignments'
import { resolveQuizIdsForAssignment } from '@/app/actions/learning-assignments'
import MenteeItemProgressCard from '@/components/dashboard/MenteeItemProgressCard'

/** 生活/ビジネス 집계를 "완료항목 / 부여항목"(항목 수 기준)으로 덮어쓴다. */
async function overrideWithItemProgress(
  jpStats: Map<string, JapaneseProgressStat>,
  menteeIds: string[],
) {
  if (menteeIds.length === 0) return
  const itemProg = await aggregateItemProgress(menteeIds)
  for (const id of menteeIds) {
    const s = jpStats.get(id)
    const ip = itemProg[id]
    if (s && ip) {
      s.seikatsu = { completed: ip.seikatsu.completed, total: ip.seikatsu.assigned }
      s.businessJp = { completed: ip.businessJp.completed, total: ip.businessJp.assigned }
      // 全体進捗 = 목표 자격증 레벨의 生活日本語 항목만
      s.all = { completed: ip.overall.completed, total: ip.overall.assigned }
    }
  }
}

interface ExamPair { score: number | null; passing_score: number }
/** comprehensive_exams(완료/실패, completed_at desc 정렬) → 유저별 최신 試験 점수(생활/비즈니스). */
function buildLatestExamMap(
  exams: { user_id: string; category: string; score: number | null; passing_score: number }[],
): Map<string, { seikatsu?: ExamPair; businessJp?: ExamPair }> {
  const m = new Map<string, { seikatsu?: ExamPair; businessJp?: ExamPair }>()
  for (const e of exams) {
    const bucket = e.category === 'seikatsu' || e.category === '生活日本語'
      ? 'seikatsu'
      : (e.category === 'business-jp' || e.category === 'business_jp' || e.category === 'ビジネス日本語')
        ? 'businessJp' : null
    if (!bucket) continue
    const cur = m.get(e.user_id) ?? {}
    if (!cur[bucket]) { cur[bucket] = { score: e.score, passing_score: e.passing_score }; m.set(e.user_id, cur) }
  }
  return m
}

const JP_CATEGORIES = ['seikatsu', 'business-jp', 'business_jp', '生活日本語', 'ビジネス日本語'] as const

type MenteeProfile = { id: string; full_name: string | null; email: string; target_certification: string | null }

/**
 * 대시보드 테이블 1행(EmployeeRow) 데이터를 멘티 목록 기준으로 생성한다.
 * 관리자 = 전체 멘티, 멘토 = 담당 멘티만 — 대상 목록만 다르고 집계 로직은 동일.
 */
async function buildEmployeeRows(
  supabase: Awaited<ReturnType<typeof createClient>>,
  menteeProfiles: MenteeProfile[],
) {
  const menteeIds = menteeProfiles.map(p => p.id)
  if (menteeIds.length === 0) return []

  const [{ data: jpAssignments }, { data: jpExams }, { data: mentorAssignments }, { data: mentorProfiles }] = await Promise.all([
    supabase.from('learning_assignments')
      .select('assigned_to, category, status, due_date, created_at, completed_at')
      .in('assigned_to', menteeIds)
      .in('category', JP_CATEGORIES as unknown as string[]),
    supabase.from('comprehensive_exams')
      .select('user_id, category, score, passing_score, completed_at, status')
      .in('user_id', menteeIds)
      .in('category', JP_CATEGORIES as unknown as string[])
      .in('status', ['completed', 'failed'])
      .order('completed_at', { ascending: false }),
    supabase.from('mentor_mentee_assignments').select('mentor_id, mentee_id').in('mentee_id', menteeIds),
    supabase.from('profiles').select('id, full_name').eq('role', 'mentor'),
  ])

  const mentorMap = new Map((mentorProfiles ?? []).map(p => [p.id, p.full_name]))
  const menteeToMentor = new Map<string, string>()
  for (const a of mentorAssignments ?? []) {
    menteeToMentor.set(a.mentee_id, mentorMap.get(a.mentor_id) ?? '—')
  }

  const jpStats = aggregateJapaneseProgress((jpAssignments ?? []) as JapaneseAssignmentRow[], menteeIds)
  await overrideWithItemProgress(jpStats, menteeIds)
  const latestExam = buildLatestExamMap((jpExams ?? []) as Parameters<typeof buildLatestExamMap>[0])

  // 理解度テスト 진척: 부여된 (카테고리·영역·레벨)의 현재 퀴즈 풀을 동적 재조회
  // → 콘텐츠(理解度テスト)가 추가되면 분모(total)에 자동 반영, 추가분도 합격 대상
  const { data: quizAssigns } = await supabase
    .from('learning_assignments')
    .select('assigned_to, category, subcategory, content_level')
    .in('assigned_to', menteeIds)
    .in('category', ['seikatsu', 'business-jp', 'business_jp'])
    .is('target_count', null)
  const comboKeyOf = (c: string, s: string, l: string | null) => `${c}::${s}::${l ?? ''}`
  const comboPool = new Map<string, string[]>()
  const menteeCombos: Record<string, Set<string>> = {}
  for (const id of menteeIds) menteeCombos[id] = new Set()
  for (const q of quizAssigns ?? []) {
    const k = comboKeyOf(q.category, q.subcategory, q.content_level)
    menteeCombos[q.assigned_to]?.add(k)
    if (!comboPool.has(k)) {
      comboPool.set(k, await resolveQuizIdsForAssignment(q.category, q.subcategory, q.content_level, supabase))
    }
  }
  const allAssignedQuizIds = new Set<string>()
  for (const ids of comboPool.values()) ids.forEach(i => allAssignedQuizIds.add(i))
  const passingByQuiz: Record<string, number> = {}
  const bestScore: Record<string, number> = {} // key = `${userId}::${quizId}`
  if (allAssignedQuizIds.size) {
    const idList = [...allAssignedQuizIds]
    const [{ data: qz }, { data: att }] = await Promise.all([
      supabase.from('quizzes').select('id, passing_score').in('id', idList),
      supabase.from('quiz_attempts').select('user_id, quiz_id, score').in('user_id', menteeIds).in('quiz_id', idList).not('score', 'is', null),
    ])
    for (const x of qz ?? []) passingByQuiz[x.id] = x.passing_score ?? 70
    for (const a of att ?? []) {
      const k = `${a.user_id}::${a.quiz_id}`
      if (bestScore[k] == null || a.score > bestScore[k]) bestScore[k] = a.score
    }
  }
  const quizProg: Record<string, { total: number; passed: number; attempted: number }> = {}
  for (const id of menteeIds) {
    const qids = new Set<string>()
    for (const k of menteeCombos[id]) (comboPool.get(k) ?? []).forEach(i => qids.add(i))
    let passed = 0, attempted = 0
    for (const q of qids) {
      const score = bestScore[`${id}::${q}`]
      if (score != null) {
        attempted++
        if (score >= (passingByQuiz[q] ?? 70)) passed++
      }
    }
    quizProg[id] = { total: qids.size, passed, attempted }
  }

  // 새 방식 理解テスト(seikatsu-quiz / business-jp-quiz) 집계를 합산
  const newQuizProg = await aggregateQuizProgress(menteeIds)
  for (const id of menteeIds) {
    const a = quizProg[id] ?? { total: 0, passed: 0, attempted: 0 }
    const b = newQuizProg[id] ?? { total: 0, passed: 0, attempted: 0 }
    quizProg[id] = {
      total: a.total + b.total,
      passed: a.passed + b.passed,
      attempted: a.attempted + b.attempted,
    }
  }

  return menteeProfiles.map(p => {
    const exams = latestExam.get(p.id) ?? {}
    return {
      id: p.id,
      full_name: p.full_name,
      email: p.email,
      mentor_name: menteeToMentor.get(p.id) ?? null,
      target_certification: p.target_certification ?? null,
      stat: jpStats.get(p.id)!,
      exam_seikatsu: exams.seikatsu ?? null,
      exam_business_jp: exams.businessJp ?? null,
      quiz: quizProg[p.id] ?? { total: 0, passed: 0, attempted: 0 },
    }
  })
}

export default async function DashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  // ──────────────────────────────────────────────
  // Phase 0: Profile fetch (needed for exam gate check)
  // ──────────────────────────────────────────────
  const { data: profile } = await supabase.from('profiles').select('*').eq('id', user.id).single()

  const isJapanese = profile?.is_japanese ?? false
  const isAdmin = profile?.role === 'admin'

  // ──────────────────────────────────────────────
  // Phase 0.3: Auto-fail expired in_progress exams
  // ──────────────────────────────────────────────
  await expireStaleExams(user.id)

  // 매달 1회 항목과제 자동 부여 (달 바뀐 뒤 첫 대시보드 로드 시 1회 실행, dedup으로 idempotent)
  await runMonthlyAutoAssignment()

  // ──────────────────────────────────────────────
  // Phase 0.5: Mentee active cycle
  // Cycle 1 → full-screen dashboard gate (initial onboarding exams)
  // Cycle 2+ → rendered as an inline card via DashboardClient
  // ──────────────────────────────────────────────
  const activeCycle = profile?.role === 'mentee'
    ? await checkAndCreateExamCycle(user.id, isJapanese)
    : null

  if (activeCycle && activeCycle.cycleNumber === 1) {
    return <ExamGatePage cycle={activeCycle} userName={profile?.full_name ?? null} />
  }

  // ──────────────────────────────────────────────
  // Common: お知らせ (全role共通)
  // ──────────────────────────────────────────────
  const [{ data: recentAnnouncements }, { data: announcementReads }] = await Promise.all([
    supabase.from('announcements').select('id, title, created_at').order('created_at', { ascending: false }).limit(10),
    supabase.from('announcement_reads').select('announcement_id').eq('user_id', user.id),
  ])
  const readAnnouncementSet = new Set((announcementReads ?? []).map(r => r.announcement_id))
  const announcementItems = (recentAnnouncements ?? []).map(a => ({
    id: a.id,
    title: a.title,
    created_at: a.created_at,
    is_read: readAnnouncementSet.has(a.id),
  }))

  // ──────────────────────────────────────────────
  // Mentor dashboard
  // ──────────────────────────────────────────────
  if (profile?.role === 'mentor') {
    const [{ data: menteeAssignments }, { count: totalAnnouncements }, { count: readCount }] = await Promise.all([
      supabase.from('mentor_mentee_assignments').select('mentee_id').eq('mentor_id', user.id),
      supabase.from('announcements').select('id', { count: 'exact', head: true }),
      supabase.from('announcement_reads').select('announcement_id', { count: 'exact', head: true }).eq('user_id', user.id),
    ])
    const unreadAnnouncements = (totalAnnouncements ?? 0) - (readCount ?? 0)
    const menteeIds = (menteeAssignments ?? []).map(a => a.mentee_id)

    const { data: menteeProfiles } = menteeIds.length > 0
      ? await supabase.from('profiles').select('id, full_name, email, target_certification').eq('role', 'mentee').in('id', menteeIds)
      : { data: [] as MenteeProfile[] }

    // 担当メンティーのみ — 管理者ダッシュボードと同一の集計・レイアウトを共有
    const employees = await buildEmployeeRows(supabase, (menteeProfiles ?? []) as MenteeProfile[])

    return (
      <>
        <DashboardAnnouncements announcements={announcementItems} />
        <AdminDashboard adminName={profile.full_name} employees={employees} unreadAnnouncements={unreadAnnouncements} variant="mentor" />
      </>
    )
  }

  // ──────────────────────────────────────────────
  // Admin dashboard
  // ──────────────────────────────────────────────
  if (profile?.role === 'admin') {
    const [{ data: allMentees }, { count: adminTotalAnn }, { count: adminReadAnn }] = await Promise.all([
      supabase.from('profiles').select('id, full_name, email, target_certification').eq('role', 'mentee'),
      supabase.from('announcements').select('id', { count: 'exact', head: true }),
      supabase.from('announcement_reads').select('announcement_id', { count: 'exact', head: true }).eq('user_id', user.id),
    ])
    const adminUnread = (adminTotalAnn ?? 0) - (adminReadAnn ?? 0)

    // 全社員(메ンティー) — メンターダッシュボードと同一の集計・レイアウトを共有
    const employees = await buildEmployeeRows(supabase, (allMentees ?? []) as MenteeProfile[])

    return (
      <>
        <DashboardAnnouncements announcements={announcementItems} />
        <AdminDashboard adminName={profile.full_name} employees={employees} unreadAnnouncements={adminUnread} />
      </>
    )
  }

  // ──────────────────────────────────────────────
  // Mentee dashboard — Phase 1: fetch data
  // ──────────────────────────────────────────────
  const [
    { data: japaneseSkills },
    { data: codingSkills },
    { data: attitudeSkills },
    { data: recentQuizzes },
    { data: recentExams },
    { data: learningAssignments },
    { data: recentAssignmentDetails },
    { data: recentFeedbacks },
    { data: userCompExams },
    { count: menteeTotalAnn },
    { count: menteeReadAnn },
  ] = await Promise.all([
    // 1. 일본어 스킬
    supabase.from('japanese_skills').select('*').eq('user_id', user.id).single(),
    // 2. 코딩 스킬
    supabase.from('coding_skills').select('*').eq('user_id', user.id).single(),
    // 3. 태도/문화 스킬
    supabase.from('attitude_culture_skills').select('*').eq('user_id', user.id).single(),
    // 4. 최근 퀴즈 결과
    supabase.from('quiz_attempts').select('*, quizzes(title)')
      .eq('user_id', user.id).not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }).limit(5),
    // 5. 최근 종합시험 결과
    supabase.from('comprehensive_exams').select('id, category, score, passed, completed_at')
      .eq('user_id', user.id).in('status', ['completed', 'failed'])
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }).limit(5),
    // 6. 학습과제 요약
    supabase.from('learning_assignments').select('id, status').eq('assigned_to', user.id),
    // 6b. 학습과제 최근 5건 (メンターからの課題 카드용)
    supabase.from('learning_assignments')
      .select('id, title, category, subcategory, content_level, status, due_date, created_at, assigner:profiles!learning_assignments_assigned_by_fkey(full_name)')
      .eq('assigned_to', user.id)
      .order('created_at', { ascending: false })
      .limit(5),
    // 9. 최근 피드백
    supabase.from('admin_feedbacks')
      .select('id, category, content, created_at, admin:profiles!admin_feedbacks_admin_id_fkey(full_name)')
      .eq('user_id', user.id).order('created_at', { ascending: false }).limit(3),
    // 10. 종합시험 재시험 정보
    supabase.from('comprehensive_exams').select('id, category, content_level, score, status')
      .eq('user_id', user.id).in('status', ['completed', 'failed', 'requested', 'approved', 'in_progress'])
      .order('requested_at', { ascending: false }),
    // 11. お知らせ未読数
    supabase.from('announcements').select('id', { count: 'exact', head: true }),
    supabase.from('announcement_reads').select('announcement_id', { count: 'exact', head: true }).eq('user_id', user.id),
  ])

  // ──────────────────────────────────────────────
  // 후처리: 쿼리 결과를 가공 (CPU 연산, 네트워크 없음)
  // ──────────────────────────────────────────────

  // 학습과제 통계
  const learningStats = {
    total: learningAssignments?.length ?? 0,
    inProgress: learningAssignments?.filter(a => a.status === 'in_progress').length ?? 0,
    completed: learningAssignments?.filter(a => a.status === 'completed').length ?? 0,
  }

  // 종합시험 재시험 맵 (category 단위로 집약)
  const STATUS_PRIORITY: Record<string, number> = { in_progress: 5, approved: 4, requested: 3, failed: 2, completed: 1 }
  const compExamRetakeByCategory: Record<string, {
    examId: string
    score: number | null
    retakeStatus: 'completed' | 'failed' | 'requested' | 'approved' | 'in_progress'
  }> = {}
  // Track whether a user has ever completed/failed a comprehensive exam per category.
  // Used to show 未受験 styling when no exam has been taken yet.
  const hasCompletedExamByCategory: Record<string, boolean> = {}

  for (const exam of userCompExams ?? []) {
    const key = exam.category
    const existing = compExamRetakeByCategory[key]
    const newPriority = STATUS_PRIORITY[exam.status] ?? 0
    const existingPriority = existing ? (STATUS_PRIORITY[existing.retakeStatus] ?? 0) : 0

    if (!existing || newPriority > existingPriority) {
      compExamRetakeByCategory[key] = {
        examId: exam.id,
        score: exam.score,
        retakeStatus: exam.status as 'completed' | 'failed' | 'requested' | 'approved' | 'in_progress',
      }
    }

    if (exam.status === 'completed' || exam.status === 'failed') {
      hasCompletedExamByCategory[key] = true
    }
  }

  // 레이더 차트 점수
  const radarScores: Record<AxisKey, number> = {
    jlpt: japaneseSkills?.jlpt_normalized ?? 0,
    itJapanese: japaneseSkills?.it_japanese_normalized ?? 0,
    coreProgramming: codingSkills?.core_normalized ?? 0,
    framework: codingSkills?.framework_normalized ?? 0,
    attitudeCulture: attitudeSkills?.attitude_normalized ?? 0,
  }

  // 生活日本語: 응시한 시험중 가장 높은 N-level (N1 > N2 > ... > N5)
  const SEIKATSU_LEVEL_RANK: Record<string, number> = { N1: 5, N2: 4, N3: 3, N4: 2, N5: 1 }
  let seikatsuExamLevel: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null = null
  let _bestSeikatsuRank = 0
  for (const exam of userCompExams ?? []) {
    if (exam.category !== 'seikatsu') continue
    const level = (exam as { content_level?: string | null }).content_level
    const rank = SEIKATSU_LEVEL_RANK[level ?? ''] ?? 0
    if (rank > _bestSeikatsuRank) {
      _bestSeikatsuRank = rank
      seikatsuExamLevel = level as 'N1' | 'N2' | 'N3' | 'N4' | 'N5'
    }
  }

  // 최근 시험결과 통합
  const EXAM_CATEGORY_LABELS: Record<string, string> = {
    seikatsu: '生活日本語 総合試験',
    'business-jp': 'ビジネス日本語 総合試験',
    cs: 'CS知識 総合試験',
    dev: '開発実務能力 総合試験',
    'business-lit': 'ビジネスリテラシー 総合試験',
  }

  const quizResults = (recentQuizzes ?? []).map(q => ({
    id: q.id as string,
    title: (q.quizzes as { title: string } | null)?.title ?? 'クイズ',
    score: q.score as number,
    passed: q.passed as boolean,
    completed_at: q.completed_at as string,
    type: 'quiz' as const,
  }))

  const examResults = (recentExams ?? []).map(e => ({
    id: e.id,
    title: EXAM_CATEGORY_LABELS[e.category] ?? e.category,
    score: e.score ?? 0,
    passed: e.passed ?? false,
    completed_at: e.completed_at!,
    type: 'comprehensive' as const,
  }))

  const recentResults = [...quizResults, ...examResults]
    .sort((a, b) => new Date(b.completed_at).getTime() - new Date(a.completed_at).getTime())
    .slice(0, 5)

  // 다음 시험 예정일 (멘티 only)
  const nextExamDate = profile?.role === 'mentee'
    ? await getNextExamDate(user.id)
    : null

  // ──────────────────────────────────────────────
  // 렌더링
  // ──────────────────────────────────────────────
  const feedbackProps = (recentFeedbacks ?? []).map(f => ({
    ...f,
    admin: Array.isArray(f.admin) ? f.admin[0] ?? null : f.admin,
  })) as { id: string; category: string; content: string; created_at: string; admin: { full_name: string | null } | null }[]

  const assignmentCards = (recentAssignmentDetails ?? []).map(a => ({
    ...a,
    assigner: Array.isArray(a.assigner) ? a.assigner[0] ?? null : a.assigner,
  })) as { id: string; title: string; category: string; subcategory: string; content_level: string | null; status: string; due_date: string | null; created_at: string; assigner: { full_name: string | null } | null }[]

  const dashboardProps = {
    profile,
    radarScores,
    recentResults,
    isJapanese,
    learningStats,
    recentFeedbacks: feedbackProps,
    compExamRetakeByCategory,
    hasCompletedExamByCategory,
    seikatsuExamLevel,
    role: profile?.role ?? 'mentee',
    nextExamDate,
    activeCycle,
    recentAssignments: assignmentCards,
    unreadAnnouncements: (menteeTotalAnn ?? 0) - (menteeReadAnn ?? 0),
  }

  const myItemProgress = await getMyItemAssignmentProgress()

  return (
    <>
      <DashboardAnnouncements announcements={announcementItems} />
      <MenteeItemProgressCard rows={myItemProgress} />
      <DashboardClient {...dashboardProps} />
    </>
  )
}
