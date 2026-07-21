import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import type { AxisKey } from '@/lib/assessment-config'
import { jlptMockTotalPass } from '@/lib/assessment-config'
import DashboardClient from './DashboardClient'
import AdminDashboard from './AdminDashboard'
import DashboardAnnouncements from './DashboardAnnouncements'
import DashboardJlptProgress, { type MenteeJlptProgress } from './DashboardJlptProgress'
import { getNextExamDate } from '@/app/actions/exam-scheduling'
import { expireStaleExams } from '@/app/actions/comprehensive-exam'
import {
  aggregateJapaneseProgress,
  type JapaneseAssignmentRow,
  type JapaneseProgressStat,
} from '@/lib/japanese-progress'
import { aggregateItemProgress, aggregateJlptPartProgress, aggregateQuizProgress, aggregateTestPoolProgress, getMyItemAssignmentProgress, runMonthlyAutoAssignment } from '@/app/actions/item-assignments'
import { resolveQuizIdsForAssignment } from '@/app/actions/learning-assignments'
import { getCategoryLabel, getSubcategoryLabel, getContentLevelLabel, getContentUrl } from '@/lib/assignment-categories'
import { isItemCategory, itemContentUrl, type ItemCategory } from '@/lib/item-assignments'
import { getMenteeMentorsMap } from '@/lib/mentor-helpers'

/** 課題(生活/ビジネス) 집계를 "当月 완료 / 当月 부여"(항목 수)로, 全体進捗은 목표레벨 누적으로 덮어쓴다. */
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
      // 今月課題 = 이번 달 부여분 / 完了 = 누적 완료·부여
      s.seikatsu = { completed: ip.seikatsuThisMonth.completed, total: ip.seikatsuThisMonth.assigned }
      s.seikatsuCumulative = { completed: ip.seikatsu.completed, total: ip.seikatsu.assigned }
      s.businessJp = { completed: ip.businessJpThisMonth.completed, total: ip.businessJpThisMonth.assigned }
      // 全体進捗 = 목표 자격증 레벨의 生活日本語 항목만
      s.all = { completed: ip.overall.completed, total: ip.overall.assigned }
      // 遅延 = 항목 기준(과거 누적목표 − 습득항목). 행 기준 target_count 합산을 대체.
      s.overdue = ip.overdueItems
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

type MenteeProfile = { id: string; full_name: string | null; email: string; target_certification: string | null; monthly_auto_assign?: boolean | null; is_active?: boolean | null }

/** 멘티 목록 → JLPT 영역별 습득 현황(목표레벨 기준) 리스트. 목표가 JLPT가 아닌 멘티는 제외. */
async function buildJlptProgressRows(menteeProfiles: MenteeProfile[]): Promise<MenteeJlptProgress[]> {
  if (menteeProfiles.length === 0) return []
  const progress = await aggregateJlptPartProgress(menteeProfiles.map(p => p.id))
  return menteeProfiles
    .filter(p => progress[p.id])
    .map(p => ({
      id: p.id,
      name: p.full_name,
      fallback: p.email,
      level: progress[p.id].level,
      parts: progress[p.id].parts,
      mock: progress[p.id].mock,
    }))
}

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

  const [{ data: jpAssignments }, { data: jpExams }] = await Promise.all([
    supabase.from('learning_assignments')
      .select('assigned_to, category, status, due_date, created_at, completed_at, target_count')
      .in('assigned_to', menteeIds)
      .in('category', JP_CATEGORIES as unknown as string[]),
    supabase.from('comprehensive_exams')
      .select('user_id, category, score, passing_score, completed_at, status')
      .in('user_id', menteeIds)
      .in('category', JP_CATEGORIES as unknown as string[])
      .in('status', ['completed', 'failed'])
      .order('completed_at', { ascending: false }),
  ])

  const mentorsMap = await getMenteeMentorsMap(supabase, menteeIds)

  const jpStats = aggregateJapaneseProgress((jpAssignments ?? []) as JapaneseAssignmentRow[], menteeIds)
  await overrideWithItemProgress(jpStats, menteeIds)
  const latestExam = buildLatestExamMap((jpExams ?? []) as Parameters<typeof buildLatestExamMap>[0])

  // JLPT 시험 컬럼 = 제일 높은 등급(레벨)의 제일 높은 점수. 더 낮은 점수는 갱신 안 함.
  // 1교시 placeholder(mock_session=1)는 제외(2교시/단일세션=null의 최종판정만).
  const { data: mockExams } = await supabase
    .from('comprehensive_exams')
    .select('user_id, content_level, mock_session, score, passed')
    .in('user_id', menteeIds)
    .eq('category', 'jlpt-mock')
    .in('status', ['completed', 'failed'])
  const JLPT_RANK: Record<string, number> = { N1: 5, N2: 4, N3: 3, N4: 2, N5: 1 }
  const jlptMockByUser = new Map<string, { score: number | null; passed: boolean | null; level: string | null }>()
  for (const e of mockExams ?? []) {
    if (e.mock_session != null && e.mock_session !== 2) continue
    const cur = jlptMockByUser.get(e.user_id)
    if (!cur) { jlptMockByUser.set(e.user_id, { score: e.score, passed: e.passed, level: e.content_level }); continue }
    const eRank = JLPT_RANK[e.content_level ?? ''] ?? 0
    const curRank = JLPT_RANK[cur.level ?? ''] ?? 0
    // 더 높은 등급 우선, 같은 등급이면 더 높은 점수
    if (eRank > curRank || (eRank === curRank && (e.score ?? -1) > (cur.score ?? -1))) {
      jlptMockByUser.set(e.user_id, { score: e.score, passed: e.passed, level: e.content_level })
    }
  }

  // 理解度テスト 진척: 부여된 (카테고리·영역·레벨)의 현재 퀴즈 풀을 동적 재조회
  // → 콘텐츠(理解度テスト)가 추가되면 분모(total)에 자동 반영, 추가분도 합격 대상
  // 今月テスト(=부여된 테스트) 진척: 부여된 (카테고리·영역·레벨)의 현재 퀴즈 풀을 동적 재조회
  // → 콘텐츠가 추가되면 분모(total)에 자동 반영, 추가분도 합격 대상
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

  // 새 방식 理解テスト(seikatsu-quiz / business-jp-quiz) 부여분을 合算
  const newQuizProg = await aggregateQuizProgress(menteeIds)
  for (const id of menteeIds) {
    const a = quizProg[id] ?? { total: 0, passed: 0, attempted: 0 }
    const b = newQuizProg[id] ?? { total: 0, passed: 0, attempted: 0 }
    quizProg[id] = { total: a.total + b.total, passed: a.passed + b.passed, attempted: a.attempted + b.attempted }
  }

  // 全体テスト = 목표레벨 理解度テスト 전체 풀(부여 무관)
  const quizPoolProg = await aggregateTestPoolProgress(menteeIds)

  // 遅延에 합산할 테스트 = 부여 理解度テスト 중 overdue (항목과 동일하게 target_count 기준)
  const { data: overdueTests } = await supabase
    .from('learning_assignments')
    .select('assigned_to, target_count')
    .in('assigned_to', menteeIds)
    .in('category', ['seikatsu-quiz', 'business-jp-quiz'])
    .eq('status', 'overdue')
  const overdueTestByMentee: Record<string, number> = {}
  for (const t of overdueTests ?? []) overdueTestByMentee[t.assigned_to] = (overdueTestByMentee[t.assigned_to] ?? 0) + (t.target_count ?? 0)

  // 테스트도 課題 카운트에 포함:
  //   全体進捗 = 목표레벨 항목 풀 + 理解度テスト 전체 풀
  //   今月課題 = 이번 달 항목 + 부여 테스트(今月テスト)
  //   完了    = 누적 항목 + 부여 테스트
  //   遅延    = 항목 overdue + 테스트 overdue
  for (const id of menteeIds) {
    const s = jpStats.get(id)
    if (!s) continue
    const qp = quizPoolProg[id]
    if (qp) s.all = { completed: s.all.completed + qp.passed, total: s.all.total + qp.total }
    const qa = quizProg[id]
    if (qa) {
      s.seikatsu = { completed: s.seikatsu.completed + qa.passed, total: s.seikatsu.total + qa.total }
      s.seikatsuCumulative = { completed: s.seikatsuCumulative.completed + qa.passed, total: s.seikatsuCumulative.total + qa.total }
    }
    s.overdue += overdueTestByMentee[id] ?? 0
  }

  // 모의시험도 課題 카운트에 세트 단위로 포함
  //   今月課題     = 이번달 배정된 세트 / 그중 응시(완료·불합격)한 세트
  //   完了·全体進捗 = 공개된 전체 세트(레벨) / 응시한 세트
  const mockMonthStart = `${new Date().toISOString().slice(0, 7)}-01`
  const [{ data: pubSets }, { data: allMockRows }] = await Promise.all([
    supabase.from('jlpt_mock_sets').select('level, set_no').eq('is_published', true),
    supabase.from('comprehensive_exams')
      .select('user_id, content_level, mock_set_no, mock_session, status, requested_at')
      .in('user_id', menteeIds)
      .eq('category', 'jlpt-mock'),
  ])
  const setsCountByLevel = new Map<string, number>()
  for (const ps of pubSets ?? []) setsCountByLevel.set(ps.level, (setsCountByLevel.get(ps.level) ?? 0) + 1)
  const takenSetsByUser = new Map<string, Set<string>>()  // 응시(완료·불합격)한 세트
  const monthSetsByUser = new Map<string, Set<string>>()  // 이번달 배정된 세트
  const assignedSetsByUser = new Map<string, Set<string>>()  // 전체 배정된 세트 (完了 분모용)
  for (const m of allMockRows ?? []) {
    if (m.mock_session === 1) continue
    const key = `${m.content_level}::${m.mock_set_no}`
    let aset = assignedSetsByUser.get(m.user_id)
    if (!aset) { aset = new Set(); assignedSetsByUser.set(m.user_id, aset) }
    aset.add(key)
    if (m.status === 'completed' || m.status === 'failed') {
      let set = takenSetsByUser.get(m.user_id)
      if (!set) { set = new Set(); takenSetsByUser.set(m.user_id, set) }
      set.add(key)
    }
    if ((m.requested_at ?? '') >= mockMonthStart) {
      let set = monthSetsByUser.get(m.user_id)
      if (!set) { set = new Set(); monthSetsByUser.set(m.user_id, set) }
      set.add(key)
    }
  }
  const mockTgtById = new Map(menteeProfiles.map(p => [p.id, (p.target_certification as string | null) ?? null]))
  for (const id of menteeIds) {
    const s = jpStats.get(id)
    if (!s) continue
    const tgt = mockTgtById.get(id)
    const taken = takenSetsByUser.get(id) ?? new Set<string>()
    const monthSets = monthSetsByUser.get(id) ?? new Set<string>()
    s.seikatsu = {
      completed: s.seikatsu.completed + [...monthSets].filter(k => taken.has(k)).length,
      total: s.seikatsu.total + monthSets.size,
    }
    const cumTotal = tgt ? (setsCountByLevel.get(tgt) ?? 0) : 0
    const cumDone = tgt ? [...taken].filter(k => k.startsWith(`${tgt}::`)).length : 0
    // 完了(누적 課題): 실제로 부여된 모의세트만 분모에 포함 (부여 안 하면 +0, 하나 부여 시 +1)
    const assignedSets = assignedSetsByUser.get(id) ?? new Set<string>()
    const assignedDone = [...assignedSets].filter(k => taken.has(k)).length
    s.seikatsuCumulative = { completed: s.seikatsuCumulative.completed + assignedDone, total: s.seikatsuCumulative.total + assignedSets.size }
    // 全体進捗: 목표레벨 전체 공개세트 기준 (유지)
    s.all = { completed: s.all.completed + cumDone, total: s.all.total + cumTotal }
  }

  return menteeProfiles.map(p => {
    const exams = latestExam.get(p.id) ?? {}
    const mock = jlptMockByUser.get(p.id)
    return {
      id: p.id,
      full_name: p.full_name,
      email: p.email,
      japanese_mentor_name: mentorsMap[p.id]?.japanese?.name ?? null,
      tech_mentor_name: mentorsMap[p.id]?.technical?.name ?? null,
      target_certification: p.target_certification ?? null,
      monthly_auto_assign: p.monthly_auto_assign ?? null,
      stat: jpStats.get(p.id)!,
      // JLPT 시험 = jlpt-mock 결과 (score는 /180, passing은 레벨별 커트라인, passed는 합산 판정)
      exam_seikatsu: mock
        ? { score: mock.score, passing_score: jlptMockTotalPass(mock.level ?? 'N1'), passed: mock.passed, level: mock.level }
        : null,
      exam_business_jp: exams.businessJp ?? null,
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
  // 온보딩 강제시험 제거: 시험 사이클 자동 생성/풀스크린 게이트 비활성화
  const activeCycle = null

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
      ? await supabase.from('profiles').select('id, full_name, email, target_certification, monthly_auto_assign').eq('role', 'mentee').in('id', menteeIds)
      : { data: [] as MenteeProfile[] }

    // 担当メンティーのみ — 管理者ダッシュボードと同一の集計・レイアウトを共有 (독립 집계 → 병렬)
    const [employees, jlptRows] = await Promise.all([
      buildEmployeeRows(supabase, (menteeProfiles ?? []) as MenteeProfile[]),
      buildJlptProgressRows((menteeProfiles ?? []) as MenteeProfile[]),
    ])

    return (
      <>
        <DashboardAnnouncements announcements={announcementItems} />
        <AdminDashboard adminName={profile.full_name} employees={employees} unreadAnnouncements={unreadAnnouncements} variant="mentor" />
        <div className="mt-6">
          <DashboardJlptProgress mentees={jlptRows} />
        </div>
      </>
    )
  }

  // ──────────────────────────────────────────────
  // Admin dashboard
  // ──────────────────────────────────────────────
  if (profile?.role === 'admin') {
    const [{ data: allMentees }, { count: adminTotalAnn }, { count: adminReadAnn }] = await Promise.all([
      supabase.from('profiles').select('id, full_name, email, target_certification, monthly_auto_assign, is_active').eq('role', 'mentee'),
      supabase.from('announcements').select('id', { count: 'exact', head: true }),
      supabase.from('announcement_reads').select('announcement_id', { count: 'exact', head: true }).eq('user_id', user.id),
    ])
    const adminUnread = (adminTotalAnn ?? 0) - (adminReadAnn ?? 0)

    // 비활성 멘티는 대시보드에서 제외
    const visibleMentees = ((allMentees ?? []) as MenteeProfile[]).filter(m => m.is_active !== false)

    // 全社員(메ンティー) — メンターダッシュボードと同一の集計・レイアウトを共有 (독립 집계 → 병렬)
    const [employees, jlptRows] = await Promise.all([
      buildEmployeeRows(supabase, visibleMentees),
      buildJlptProgressRows(visibleMentees),
    ])

    return (
      <>
        <DashboardAnnouncements announcements={announcementItems} />
        <AdminDashboard adminName={profile.full_name} employees={employees} unreadAnnouncements={adminUnread} />
        <div className="mt-6">
          <DashboardJlptProgress mentees={jlptRows} />
        </div>
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
    supabase.from('comprehensive_exams').select('id, category, content_level, score, status, passed')
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

  // JLPT 레벨: 합격한 모의시험(jlpt-mock) 중 가장 높은 레벨. 없으면 레거시 seikatsu 종합시험 최상위.
  const SEIKATSU_LEVEL_RANK: Record<string, number> = { N1: 5, N2: 4, N3: 3, N4: 2, N5: 1 }
  let seikatsuExamLevel: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null = null
  let _bestMockRank = 0
  let _bestLegacyRank = 0
  let _legacyLevel: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null = null
  for (const exam of userCompExams ?? []) {
    const e = exam as { category: string; content_level?: string | null; passed?: boolean | null }
    const level = e.content_level as 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null
    const rank = SEIKATSU_LEVEL_RANK[level ?? ''] ?? 0
    if (e.category === 'jlpt-mock' && e.passed) {
      if (rank > _bestMockRank) { _bestMockRank = rank; seikatsuExamLevel = level }
    } else if (e.category === 'seikatsu') {
      if (rank > _bestLegacyRank) { _bestLegacyRank = rank; _legacyLevel = level }
    }
  }
  if (!seikatsuExamLevel) seikatsuExamLevel = _legacyLevel
  // 합격한 모의고사가 없으면 → 가장 최근 응시한 모의고사 레벨을 표시(불합격이어도 응시 레벨 반영)
  if (!seikatsuExamLevel) {
    const latestMock = (userCompExams ?? []).find(e => (e as { category: string }).category === 'jlpt-mock')
    const lvl = (latestMock as { content_level?: string | null } | undefined)?.content_level
    if (lvl && ['N1', 'N2', 'N3', 'N4', 'N5'].includes(lvl)) seikatsuExamLevel = lvl as 'N1' | 'N2' | 'N3' | 'N4' | 'N5'
  }

  // 최근 시험결과 통합
  const EXAM_CATEGORY_LABELS: Record<string, string> = {
    'jlpt-mock': 'JLPT模試',
    seikatsu: 'JLPT 総合試験',
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

  // 대시보드 월별 과제 보드: 미완료 + 이번달 완료(초록)만. 지난달 완료는 제외(사라짐).
  const nowMonth = new Date().toISOString().slice(0, 7)
  const myProgressRows = await getMyItemAssignmentProgress()
  const masteredByArea = new Map(myProgressRows.map(r => [`${r.level}::${r.area}`, r.mastered]))
  const { data: openAssignments } = await supabase
    .from('learning_assignments')
    .select('id, category, subcategory, content_level, status, due_date, created_at, target_count, cumulative_target')
    .eq('assigned_to', user.id)
    .or(`status.neq.completed,due_date.gte.${nowMonth}-01`)
    .order('due_date', { ascending: true })
  const assignmentBoardCards = (openAssignments ?? []).map(a => {
    const sub = a.subcategory && a.subcategory !== 'all' ? a.subcategory : ''
    const total = (a.target_count ?? null) as number | null
    const cum = (a.cumulative_target ?? null) as number | null
    let done: number | null = null, rangeFrom: number | null = null, rangeTo: number | null = null
    if (total != null && cum != null) {
      const prev = cum - total
      rangeFrom = prev + 1; rangeTo = cum
      const m = masteredByArea.get(`${a.content_level}::${sub}`)
      if (m != null) done = Math.max(0, Math.min(m - prev, total))
    }
    return {
      id: a.id as string,
      month: (a.due_date ?? a.created_at ?? '').slice(0, 7),
      catLabel: getCategoryLabel(a.category),
      areaLabel: sub ? getSubcategoryLabel(a.category, sub) : '',
      areaKey: sub,
      levelLabel: getContentLevelLabel(a.category, a.content_level),
      count: total,
      done,
      rangeFrom,
      rangeTo,
      status: a.status as string,
      dueDate: a.due_date as string | null,
      // 카드 클릭 시 범위 시작 항목(rangeFrom)이 있는 페이지로 이동 (어휘/문법/독해/청해)
      url: (() => {
        const base = isItemCategory(a.category) ? itemContentUrl(a.category as ItemCategory, sub, a.content_level) : getContentUrl(a.category, sub)
        if (isItemCategory(a.category) && rangeFrom != null) {
          return `${base}${base.includes('?') ? '&' : '?'}start=${rangeFrom}`
        }
        return base
      })(),
    }
  })

  // 이번달 JLPT模試 — 부여되면 課題 보드에 카드로 표시 (모의고사는 월마다 부여 안 될 수 있음)
  const { data: myMocks } = await supabase
    .from('comprehensive_exams')
    .select('id, content_level, status, requested_at')
    .eq('user_id', user.id)
    .eq('category', 'jlpt-mock')
    .gte('requested_at', `${nowMonth}-01`)
    .order('requested_at', { ascending: false })
  const mockRows = myMocks ?? []
  if (mockRows.length > 0) {
    const unfinished = mockRows.find(r => r.status === 'approved' || r.status === 'in_progress')
    const mockStatus = unfinished ? (unfinished.status === 'in_progress' ? 'in_progress' : 'pending') : 'completed'
    // 해당 자격증(레벨)의 모의시험 페이지로 이동
    const mockLevel = mockRows[0].content_level ?? ''
    const mockUrl = `/japanese/jlpt/quiz?level=${mockLevel}`
    assignmentBoardCards.push({
      id: `mock-${mockRows[0].id}`,
      month: nowMonth,
      catLabel: 'JLPT模試',
      areaLabel: '模試',
      areaKey: 'mock',
      levelLabel: mockRows[0].content_level ?? '',
      count: null,
      done: null,
      rangeFrom: null,
      rangeTo: null,
      status: mockStatus,
      dueDate: null,
      url: mockUrl,
    })
  }

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
    assignmentBoardCards,
    assignmentMonth: nowMonth,
    unreadAnnouncements: (menteeTotalAnn ?? 0) - (menteeReadAnn ?? 0),
  }

  return (
    <>
      <DashboardAnnouncements announcements={announcementItems} />
      <DashboardClient {...dashboardProps} />
    </>
  )
}
