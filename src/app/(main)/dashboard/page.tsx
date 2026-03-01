import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ASSESSMENT_QUIZ_IDS, ASSESSMENT_LABELS, getRelevantSteps } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
import { getCoursesWithProgress } from '@/lib/course-progress'
import { computeRankingEntry, filterUnscoredUsers, sortByCategory } from '@/lib/ranking'
import type { RankingUserData } from '@/lib/ranking'
import DashboardClient from './DashboardClient'
import MentorDashboardClient from '@/components/dashboard/MentorDashboardClient'
import ExamGatePage from '@/components/dashboard/ExamGatePage'
import { getMentorDashboardData } from '@/app/actions/mentor'
import { checkAndCreateExamCycle, getNextExamDate } from '@/app/actions/exam-scheduling'

const THIRTY_DAYS_MS = 30 * 24 * 60 * 60 * 1000

type BadgeType = '未受験' | '再試験' | '再試験承認済'

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
  // Phase 0.5: Mentee exam gate check
  // If mentee has an active exam cycle, show exam gate UI only
  // ──────────────────────────────────────────────
  if (profile?.role === 'mentee') {
    const activeCycle = await checkAndCreateExamCycle(user.id, isJapanese)
    if (activeCycle) {
      return <ExamGatePage cycle={activeCycle} userName={profile?.full_name ?? null} />
    }
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
    { data: tasks },
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
    // 6. 배정 과제
    supabase.from('task_assignments').select('*')
      .eq('assigned_to', user.id).in('status', ['pending', 'in_progress'])
      .order('due_date', { ascending: true }).limit(5),
    // 7. 랭킹용 전체 프로필 (user.id 불필요)
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
    supabase.from('comprehensive_exams').select('id, category, subcategory, content_level, score, status')
      .eq('user_id', user.id).in('status', ['failed', 'requested', 'approved'])
      .order('created_at', { ascending: false }),
  ])

  // ──────────────────────────────────────────────
  // Phase 2: profile 결과에 의존하는 쿼리 4개를 동시 실행
  // ──────────────────────────────────────────────
  const relevantSteps = getRelevantSteps(isJapanese)
  const relevantQuizIds = relevantSteps.map(s => ASSESSMENT_QUIZ_IDS[s])

  const [
    { data: completedAssessments },
    enrolledCoursesResult,
    javaBadges,
    mentorDataResult,
  ] = await Promise.all([
    // 1. 등급평가 완료 현황 (isJapanese 필요)
    supabase.from('quiz_attempts').select('*')
      .eq('user_id', user.id).in('quiz_id', relevantQuizIds)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }),
    // 2. 수강 코스 (role 필요)
    (profile?.role === 'mentee' || profile?.role === 'mentor')
      ? supabase.from('enrollments')
          .select('id, course_id, courses(title, category, subcategory)')
          .eq('user_id', user.id).limit(5)
      : Promise.resolve({ data: null }),
    // 3. Java 뱃지 (isAdmin 필요)
    getCoursesWithProgress(supabase, user.id, 'java', isAdmin ?? false),
    // 4. 멘토 데이터 (role 필요)
    profile?.role === 'mentor'
      ? getMentorDashboardData()
      : Promise.resolve(null),
  ])

  // ──────────────────────────────────────────────
  // 후처리: 쿼리 결과를 가공 (CPU 연산, 네트워크 없음)
  // ──────────────────────────────────────────────

  // 수강 코스 정규화
  let enrolledCourses: { id: string; course_id: string; courses: { title: string; category: string; subcategory: string | null } | null }[] = []
  if (enrolledCoursesResult.data) {
    enrolledCourses = enrolledCoursesResult.data.map((d: Record<string, unknown>) => ({
      ...d,
      courses: Array.isArray(d.courses) ? (d.courses as Record<string, unknown>[])[0] ?? null : d.courses,
    })) as typeof enrolledCourses
  }

  // 멘토 데이터 정규화
  let mentorData: { mentees: Awaited<ReturnType<typeof getMentorDashboardData>>['mentees']; pendingVocabCount: number } | null = null
  if (mentorDataResult && !('error' in mentorDataResult && !mentorDataResult.mentees)) {
    const r = mentorDataResult as Awaited<ReturnType<typeof getMentorDashboardData>>
    mentorData = { mentees: r.mentees, pendingVocabCount: r.pendingVocabCount }
  }

  // 등급평가 맵 구축
  const latestByQuiz: Record<string, { completed_at: string; retake_request_status: string | null }> = {}
  for (const a of completedAssessments ?? []) {
    if (!latestByQuiz[a.quiz_id]) {
      latestByQuiz[a.quiz_id] = {
        completed_at: a.completed_at,
        retake_request_status: a.retake_request_status,
      }
    }
  }

  const pendingAssessments: { step: number; label: string; link: string; badge: BadgeType }[] = []

  for (const step of relevantSteps) {
    const quizId = ASSESSMENT_QUIZ_IDS[step]
    const latest = latestByQuiz[quizId]

    if (!latest) {
      pendingAssessments.push({
        step,
        label: ASSESSMENT_LABELS[step],
        link: `/onboarding/assessment/${step}`,
        badge: '未受験',
      })
    } else {
      const completedAt = new Date(latest.completed_at).getTime()
      const elapsed = Date.now() - completedAt

      if (latest.retake_request_status === 'approved') {
        pendingAssessments.push({
          step,
          label: ASSESSMENT_LABELS[step],
          link: `/onboarding/assessment/${step}`,
          badge: '再試験承認済',
        })
      } else if (elapsed > THIRTY_DAYS_MS) {
        pendingAssessments.push({
          step,
          label: ASSESSMENT_LABELS[step],
          link: `/onboarding/assessment/${step}`,
          badge: '再試験',
        })
      }
    }
  }

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

  // 종합시험 재시험 맵
  const STATUS_PRIORITY: Record<string, number> = { approved: 3, requested: 2, failed: 1 }
  const compExamRetakeMap: Record<string, {
    examId: string
    category: string
    subcategory: string
    contentLevel: string | null
    score: number | null
    retakeStatus: 'failed' | 'requested' | 'approved'
  }> = {}

  for (const exam of userCompExams ?? []) {
    const key = `${exam.category}:${exam.subcategory}`
    const existing = compExamRetakeMap[key]
    const newPriority = STATUS_PRIORITY[exam.status] ?? 0
    const existingPriority = existing ? (STATUS_PRIORITY[existing.retakeStatus] ?? 0) : 0

    if (!existing || newPriority > existingPriority) {
      compExamRetakeMap[key] = {
        examId: exam.id,
        category: exam.category,
        subcategory: exam.subcategory,
        contentLevel: exam.content_level,
        score: exam.score,
        retakeStatus: exam.status as 'failed' | 'requested' | 'approved',
      }
    }
  }

  const compExamRetakes = Object.values(compExamRetakeMap)

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

  // 등급평가 재시험 UI 데이터
  const completedAssessmentInfo = relevantSteps
    .filter(step => {
      const quizId = ASSESSMENT_QUIZ_IDS[step]
      return !!latestByQuiz[quizId]
    })
    .map(step => {
      const quizId = ASSESSMENT_QUIZ_IDS[step]
      const latest = latestByQuiz[quizId]
      return {
        step,
        label: ASSESSMENT_LABELS[step],
        completedAt: latest.completed_at,
        retakeStatus: latest.retake_request_status,
      }
    })

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
    tasks: tasks ?? [],
    pendingAssessments,
    isJapanese,
    completedAssessments: completedAssessmentInfo,
    userRanking,
    topRanking,
    enrolledCourses,
    learningStats,
    recentFeedbacks: feedbackProps,
    compExamRetakes,
    javaBadges,
    role: profile?.role ?? 'mentee',
    nextExamDate,
  }

  if (mentorData) {
    return (
      <div className="space-y-8">
        <MentorDashboardClient
          mentees={mentorData.mentees}
          pendingVocabCount={mentorData.pendingVocabCount}
          mentorSpecialty={profile?.mentor_specialty ?? null}
        />
        <div>
          <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">自分のダッシュボード</h2>
          <DashboardClient {...dashboardProps} />
        </div>
      </div>
    )
  }

  return <DashboardClient {...dashboardProps} />
}
