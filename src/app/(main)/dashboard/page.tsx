import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import type { AxisKey } from '@/lib/assessment-config'
import { computeRankingEntry, filterUnscoredUsers, sortByCategory } from '@/lib/ranking'
import type { RankingUserData } from '@/lib/ranking'
import DashboardClient from './DashboardClient'
import ExamGatePage from '@/components/dashboard/ExamGatePage'
import { checkAndCreateExamCycle, getNextExamDate } from '@/app/actions/exam-scheduling'
import { expireStaleExams } from '@/app/actions/comprehensive-exam'

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
  // Phase 1: user.id만 필요한 쿼리 10개를 동시 실행
  // ──────────────────────────────────────────────
  const [
    { data: japaneseSkills },
    { data: codingSkills },
    { data: attitudeSkills },
    { data: recentQuizzes },
    { data: recentExams },
    { data: rankProfiles },
    { data: learningAssignments },
    { data: recentFeedbacks },
    { data: userCompExams },
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
    // 6. 랭킹용 전체 프로필 (user.id 불필요)
    supabase.from('profiles').select(`
      id, full_name, avatar_url, is_japanese,
      japanese_skills(jlpt_normalized, it_japanese_normalized, updated_at),
      coding_skills(core_normalized, framework_normalized, updated_at)
    `).in('role', ['mentee', 'mentor']),
    // 8. 학습과제 요약
    supabase.from('learning_assignments').select('id, status').eq('assigned_to', user.id),
    // 9. 최근 피드백
    supabase.from('admin_feedbacks')
      .select('id, category, content, created_at, admin:profiles!admin_feedbacks_admin_id_fkey(full_name)')
      .eq('user_id', user.id).order('created_at', { ascending: false }).limit(3),
    // 10. 종합시험 재시험 정보
    supabase.from('comprehensive_exams').select('id, category, score, status')
      .eq('user_id', user.id).in('status', ['completed', 'failed', 'requested', 'approved', 'in_progress'])
      .order('requested_at', { ascending: false }),
  ])

  // ──────────────────────────────────────────────
  // 후처리: 쿼리 결과를 가공 (CPU 연산, 네트워크 없음)
  // ──────────────────────────────────────────────

  // 랭킹 계산
  let userRanking: {
    overall_score: number
    overall_rank: number
    japanese_score: number
    programming_score: number
  } | null = null
  let topRanking: { user_id: string; full_name: string | null; avatar_url: string | null; overall_score: number }[] | null = null

  const rankingUsers: RankingUserData[] = (rankProfiles ?? [])
    .filter((u: Record<string, unknown>) => u.japanese_skills !== null || u.coding_skills !== null)
    .map((u: Record<string, unknown>) => {
      const jp = u.japanese_skills as { jlpt_normalized: number; it_japanese_normalized: number; updated_at: string } | null
      const cs = u.coding_skills as { core_normalized: number; framework_normalized: number; updated_at: string } | null
      return {
        user_id: u.id as string,
        full_name: u.full_name as string | null,
        avatar_url: u.avatar_url as string | null,
        is_japanese: u.is_japanese as boolean,
        jlpt_level: null,
        jlpt_normalized: jp?.jlpt_normalized ?? 0,
        it_japanese_normalized: jp?.it_japanese_normalized ?? 0,
        core_normalized: cs?.core_normalized ?? 0,
        framework_normalized: cs?.framework_normalized ?? 0,
        japanese_skills_updated_at: jp?.updated_at ?? null,
        coding_skills_updated_at: cs?.updated_at ?? null,
      }
    })

  const entries = rankingUsers.map(computeRankingEntry)
  const sorted = sortByCategory(filterUnscoredUsers(entries), 'overall')

  if (isAdmin) {
    topRanking = sorted.slice(0, 5).map(e => ({
      user_id: e.user_id,
      full_name: e.full_name,
      avatar_url: e.avatar_url,
      overall_score: e.overall_score,
    }))
  } else {
    const myIndex = sorted.findIndex(e => e.user_id === user.id)
    if (myIndex !== -1) {
      const me = sorted[myIndex]
      userRanking = {
        overall_score: me.overall_score,
        overall_rank: myIndex + 1,
        japanese_score: me.japanese_score,
        programming_score: me.programming_score,
      }
    }
  }

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

  const dashboardProps = {
    profile,
    radarScores,
    recentResults,
    isJapanese,
    userRanking,
    topRanking,
    learningStats,
    recentFeedbacks: feedbackProps,
    compExamRetakeByCategory,
    hasCompletedExamByCategory,
    role: profile?.role ?? 'mentee',
    nextExamDate,
    activeCycle,
  }

  return <DashboardClient {...dashboardProps} />
}
