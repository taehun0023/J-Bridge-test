import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { getAssessmentForStep } from '@/app/actions/assessment'
import { ASSESSMENT_LABELS, ASSESSMENT_TIME_LIMITS, ASSESSMENT_QUIZ_IDS, getRelevantSteps } from '@/lib/assessment-config'
import AssessmentTaker from './AssessmentTaker'

interface Props {
  params: Promise<{ step: string }>
}

const THIRTY_DAYS_MS = 30 * 24 * 60 * 60 * 1000

export default async function AssessmentPage({ params }: Props) {
  const { step: stepParam } = await params
  const step = parseInt(stepParam, 10)

  if (isNaN(step) || step < 1 || step > 5) {
    redirect('/onboarding')
  }

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  if (!profile) redirect('/login')

  const isJapanese = profile.is_japanese ?? false
  const relevantSteps = getRelevantSteps(isJapanese)
  const totalSteps = relevantSteps.length

  // Japanese users cannot access steps 1 and 2
  if (isJapanese && (step === 1 || step === 2)) {
    redirect('/dashboard')
  }

  // Check if this specific assessment has been completed
  const quizId = ASSESSMENT_QUIZ_IDS[step]
  const { data: completedAttempt } = await supabase
    .from('quiz_attempts')
    .select('*')
    .eq('user_id', user.id)
    .eq('quiz_id', quizId)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (completedAttempt) {
    // Allow retake if 30+ days elapsed or admin approved
    const completedAt = new Date(completedAttempt.completed_at).getTime()
    const daysSinceCompletion = Date.now() - completedAt
    const isAutoRetake = daysSinceCompletion > THIRTY_DAYS_MS
    const isApprovedRetake = completedAttempt.retake_request_status === 'approved'

    if (!isAutoRetake && !isApprovedRetake) {
      redirect('/dashboard')
    }
  }

  const result = await getAssessmentForStep(step, profile.target_coding_area)
  if ('error' in result || !result.questions) {
    return (
      <div className="mx-auto max-w-2xl py-8 text-center">
        <p className="text-red-600">{result.error ?? '問題を読み込めません'}</p>
      </div>
    )
  }

  const label = ASSESSMENT_LABELS[step]
  const timeLimit = ASSESSMENT_TIME_LIMITS[step]

  // Compute display step number (e.g. for Japanese users, step 3 is displayed as 1)
  const displayStep = relevantSteps.indexOf(step) + 1

  // Shuffle options so correct answer isn't always in position 1
  const serializedQuestions = result.questions.map(q => {
    const shuffled = [...q.quiz_question_options_safe]
      .sort(() => Math.random() - 0.5)
      .map((o, i) => ({
        id: o.id,
        option_text: o.option_text,
        sort_order: i + 1,
      }))
    return { id: q.id, question_text: q.question_text, options: shuffled }
  })

  return (
    <div className="mx-auto max-w-3xl py-6">
      <AssessmentTaker
        step={step}
        label={label}
        timeLimit={timeLimit}
        questions={serializedQuestions}
        totalSteps={totalSteps}
        displayStep={displayStep}
      />
    </div>
  )
}
