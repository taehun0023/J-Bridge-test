import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ASSESSMENT_QUIZ_IDS, ASSESSMENT_LABELS, getRelevantSteps } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
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

  // Compute radar scores
  const radarScores: Record<AxisKey, number> = {
    jlpt: japaneseSkills?.jlpt_normalized ?? 0,
    itJapanese: japaneseSkills?.it_japanese_normalized ?? 0,
    coreProgramming: codingSkills?.core_normalized ?? 0,
    framework: codingSkills?.framework_normalized ?? 0,
    attitudeCulture: attitudeSkills?.attitude_normalized ?? 0,
  }

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
      recentQuizzes={recentQuizzes ?? []}
      tasks={tasks ?? []}
      pendingAssessments={pendingAssessments}
      isJapanese={isJapanese}
      completedAssessments={completedAssessmentInfo}
    />
  )
}
