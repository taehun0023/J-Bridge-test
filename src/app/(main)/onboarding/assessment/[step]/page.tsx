import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { getAssessmentForStep } from '@/app/actions/assessment'
import { ASSESSMENT_LABELS, ASSESSMENT_TIME_LIMITS, ASSESSMENT_QUIZ_IDS } from '@/lib/assessment-config'
import AssessmentTaker from './AssessmentTaker'

interface Props {
  params: Promise<{ step: string }>
}

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
    .select('onboarding_step, is_onboarded, target_coding_area')
    .eq('id', user.id)
    .single()

  if (!profile) redirect('/login')

  if (profile.is_onboarded) {
    // Onboarded user: allow access only if this specific assessment is not yet completed
    const quizId = ASSESSMENT_QUIZ_IDS[step]
    const { data: completedAttempt } = await supabase
      .from('quiz_attempts')
      .select('id')
      .eq('user_id', user.id)
      .eq('quiz_id', quizId)
      .not('completed_at', 'is', null)
      .limit(1)
      .maybeSingle()

    if (completedAttempt) redirect('/dashboard')
  } else {
    // Non-onboarded user: follow the step-based onboarding flow
    if (profile.onboarding_step === 0) redirect('/onboarding')

    const expectedStep = profile.onboarding_step
    if (step > expectedStep) {
      if (expectedStep <= 5) {
        redirect(`/onboarding/assessment/${expectedStep}`)
      } else {
        redirect('/onboarding/results')
      }
    }

    if (expectedStep >= 6) redirect('/onboarding/results')
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
        isOnboarded={profile.is_onboarded}
      />
    </div>
  )
}
