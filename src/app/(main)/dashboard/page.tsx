import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { ASSESSMENT_QUIZ_IDS, ASSESSMENT_LABELS } from '@/lib/assessment-config'
import DashboardClient from './DashboardClient'

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

  // Check which assessment quizzes are not yet completed
  const allQuizIds = Object.values(ASSESSMENT_QUIZ_IDS)
  const { data: completedAssessments } = await supabase
    .from('quiz_attempts')
    .select('quiz_id')
    .eq('user_id', user.id)
    .in('quiz_id', allQuizIds)
    .not('completed_at', 'is', null)

  const completedQuizIds = new Set(completedAssessments?.map(a => a.quiz_id) ?? [])
  const pendingAssessments = Object.entries(ASSESSMENT_QUIZ_IDS)
    .filter(([, quizId]) => !completedQuizIds.has(quizId))
    .map(([stepStr]) => {
      const step = parseInt(stepStr, 10)
      return {
        step,
        label: ASSESSMENT_LABELS[step],
        link: `/onboarding/assessment/${step}`,
      }
    })

  // Compute radar scores
  const radarScores = {
    jlpt: japaneseSkills?.jlpt_normalized ?? 0,
    itJapanese: japaneseSkills?.it_japanese_normalized ?? 0,
    coreProgramming: codingSkills?.core_normalized ?? 0,
    framework: codingSkills?.framework_normalized ?? 0,
    attitudeCulture: attitudeSkills?.attitude_normalized ?? 0,
  }

  return (
    <DashboardClient
      profile={profile}
      radarScores={radarScores}
      recentQuizzes={recentQuizzes ?? []}
      tasks={tasks ?? []}
      pendingAssessments={pendingAssessments}
    />
  )
}
