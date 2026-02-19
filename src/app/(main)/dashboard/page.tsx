import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ASSESSMENT_QUIZ_IDS, ASSESSMENT_LABELS, getRelevantSteps } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
import { getCoursesWithProgress } from '@/lib/course-progress'
import { computeRankingEntry, filterUnscoredUsers, sortByCategory } from '@/lib/ranking'
import type { RankingUserData } from '@/lib/ranking'
import DashboardClient from './DashboardClient'

const THIRTY_DAYS_MS = 30 * 24 * 60 * 60 * 1000

type BadgeType = '未受験' | '再試験' | '再試験承認済'

export default async function DashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  // Fetch profile
  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  const isJapanese = profile?.is_japanese ?? false

  // Fetch skills
  const { data: japaneseSkills } = await supabase
    .from('japanese_skills')
    .select('*')
    .eq('user_id', user.id)
    .single()

  const { data: codingSkills } = await supabase
    .from('coding_skills')
    .select('*')
    .eq('user_id', user.id)
    .single()

  const { data: attitudeSkills } = await supabase
    .from('attitude_culture_skills')
    .select('*')
    .eq('user_id', user.id)
    .single()

  // Fetch recent quiz attempts
  const { data: recentQuizzes } = await supabase
    .from('quiz_attempts')
    .select('*, quizzes(title)')
    .eq('user_id', user.id)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(5)

  // Fetch recent comprehensive exams (completed/failed only)
  const { data: recentExams } = await supabase
    .from('comprehensive_exams')
    .select('id, category, score, passed, completed_at')
    .eq('user_id', user.id)
    .in('status', ['completed', 'failed'])
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(5)

  // Fetch assigned tasks
  const { data: tasks } = await supabase
    .from('task_assignments')
    .select('*')
    .eq('assigned_to', user.id)
    .in('status', ['pending', 'in_progress'])
    .order('due_date', { ascending: true })
    .limit(5)

  // Check which assessment quizzes are not yet completed / need retake
  const relevantSteps = getRelevantSteps(isJapanese)
  const relevantQuizIds = relevantSteps.map(s => ASSESSMENT_QUIZ_IDS[s])

  const { data: completedAssessments } = await supabase
    .from('quiz_attempts')
    .select('*')
    .eq('user_id', user.id)
    .in('quiz_id', relevantQuizIds)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })

  // Build map of latest attempt per quiz
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
      // Never completed
      pendingAssessments.push({
        step,
        label: ASSESSMENT_LABELS[step],
        link: `/onboarding/assessment/${step}`,
        badge: '未受験',
      })
    } else {
      // Check for retake conditions
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

  // Compute ranking: admin sees top-5 leaderboard, others see personal rank
  // Use raw-data JOIN (same as /ranking page) for all roles — no RPC dependency
  let userRanking: {
    overall_score: number
    overall_rank: number
    japanese_score: number
    programming_score: number
  } | null = null
  let topRanking: { user_id: string; full_name: string | null; avatar_url: string | null; overall_score: number }[] | null = null

  const { data: rankProfiles } = await supabase
    .from('profiles')
    .select(`
      id, full_name, avatar_url, is_japanese,
      japanese_skills(jlpt_normalized, it_japanese_normalized, updated_at),
      coding_skills(core_normalized, framework_normalized, updated_at)
    `)
    .in('role', ['mentee', 'mentor'])

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

  if (profile?.role === 'admin') {
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

  // Fetch learning assignments summary
  const { data: learningAssignments } = await supabase
    .from('learning_assignments')
    .select('id, status')
    .eq('assigned_to', user.id)

  const learningStats = {
    total: learningAssignments?.length ?? 0,
    inProgress: learningAssignments?.filter(a => a.status === 'in_progress').length ?? 0,
    completed: learningAssignments?.filter(a => a.status === 'completed').length ?? 0,
  }

  // Fetch enrolled courses (mentee only)
  let enrolledCourses: { id: string; course_id: string; courses: { title: string; category: string; subcategory: string | null } | null }[] = []
  if (profile?.role === 'mentee' || profile?.role === 'mentor') {
    const { data } = await supabase
      .from('enrollments')
      .select('id, course_id, courses(title, category, subcategory)')
      .eq('user_id', user.id)
      .limit(5)
    enrolledCourses = (data ?? []).map(d => ({
      ...d,
      courses: Array.isArray(d.courses) ? d.courses[0] ?? null : d.courses,
    })) as typeof enrolledCourses
  }

  // Fetch recent feedbacks
  const { data: recentFeedbacks } = await supabase
    .from('admin_feedbacks')
    .select('id, category, content, created_at, admin:profiles!admin_feedbacks_admin_id_fkey(full_name)')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(5)

  // Fetch comprehensive exam retake info (failed + active retakes)
  const { data: userCompExams } = await supabase
    .from('comprehensive_exams')
    .select('id, category, subcategory, content_level, score, status')
    .eq('user_id', user.id)
    .in('status', ['failed', 'requested', 'approved'])
    .order('created_at', { ascending: false })

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

  // Fetch Java course badges
  const isAdmin = profile?.role === 'admin'
  const javaBadges = await getCoursesWithProgress(supabase, user.id, 'java', isAdmin ?? false)

  // Compute radar scores
  const radarScores: Record<AxisKey, number> = {
    jlpt: japaneseSkills?.jlpt_normalized ?? 0,
    itJapanese: japaneseSkills?.it_japanese_normalized ?? 0,
    coreProgramming: codingSkills?.core_normalized ?? 0,
    framework: codingSkills?.framework_normalized ?? 0,
    attitudeCulture: attitudeSkills?.attitude_normalized ?? 0,
  }

  // Build unified recent results (quiz_attempts + comprehensive_exams)
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

  // Build completed assessments info for retake request UI
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

  return (
    <DashboardClient
      profile={profile}
      radarScores={radarScores}
      recentResults={recentResults}
      tasks={tasks ?? []}
      pendingAssessments={pendingAssessments}
      isJapanese={isJapanese}
      completedAssessments={completedAssessmentInfo}
      userRanking={userRanking}
      topRanking={topRanking}
      enrolledCourses={enrolledCourses}
      learningStats={learningStats}
      recentFeedbacks={(recentFeedbacks ?? []).map(f => ({
        ...f,
        admin: Array.isArray(f.admin) ? f.admin[0] ?? null : f.admin,
      })) as { id: string; category: string; content: string; created_at: string; admin: { full_name: string | null } | null }[]}
      compExamRetakes={compExamRetakes}
      javaBadges={javaBadges}
    />
  )
}
