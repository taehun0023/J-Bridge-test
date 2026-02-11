import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import ResultsSummary from './ResultsSummary'

export default async function ResultsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('onboarding_step, is_onboarded')
    .eq('id', user.id)
    .single()

  if (!profile) redirect('/login')
  if (profile.is_onboarded) redirect('/dashboard')
  if (profile.onboarding_step < 6) {
    if (profile.onboarding_step === 0) redirect('/onboarding')
    redirect(`/onboarding/assessment/${profile.onboarding_step}`)
  }

  // Fetch latest dispatch readiness scores
  const { data: scores } = await supabase
    .from('dispatch_readiness_scores')
    .select('*')
    .eq('user_id', user.id)
    .order('recorded_at', { ascending: false })
    .limit(1)
    .single()

  const radarScores = {
    jlpt: scores?.jlpt_score ?? 0,
    itJapanese: scores?.it_japanese_score ?? 0,
    coreProgramming: scores?.core_programming_score ?? 0,
    framework: scores?.framework_score ?? 0,
    attitudeCulture: scores?.attitude_culture_score ?? 0,
  }

  const totalScore = radarScores.jlpt + radarScores.itJapanese + radarScores.coreProgramming + radarScores.framework + radarScores.attitudeCulture

  return (
    <div className="mx-auto max-w-2xl py-8">
      <ResultsSummary radarScores={radarScores} totalScore={totalScore} />
    </div>
  )
}
