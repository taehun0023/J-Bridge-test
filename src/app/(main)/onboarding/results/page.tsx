import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { getRelevantAxes, getMaxTotalScore } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
import ResultsSummary from './ResultsSummary'

export default async function ResultsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  if (!profile) redirect('/login')
  if (profile.is_onboarded) redirect('/dashboard')
  if (profile.onboarding_step < 6) {
    if (profile.onboarding_step === 0) redirect('/onboarding')
    redirect(`/onboarding/assessment/${profile.onboarding_step}`)
  }

  const isJapanese = profile.is_japanese ?? false

  // Fetch latest dispatch readiness scores
  const { data: scores } = await supabase
    .from('dispatch_readiness_scores')
    .select('*')
    .eq('user_id', user.id)
    .order('recorded_at', { ascending: false })
    .limit(1)
    .single()

  const allScores: Record<AxisKey, number> = {
    jlpt: scores?.jlpt_score ?? 0,
    itJapanese: scores?.it_japanese_score ?? 0,
    coreProgramming: scores?.core_programming_score ?? 0,
    framework: scores?.framework_score ?? 0,
    attitudeCulture: scores?.attitude_culture_score ?? 0,
  }

  const relevantAxes = getRelevantAxes(isJapanese)
  const totalScore = relevantAxes.reduce((sum, key) => sum + allScores[key], 0)
  const maxScore = getMaxTotalScore(isJapanese)

  return (
    <div className="mx-auto max-w-2xl py-8">
      <ResultsSummary
        radarScores={allScores}
        totalScore={totalScore}
        maxScore={maxScore}
        isJapanese={isJapanese}
      />
    </div>
  )
}
