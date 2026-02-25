import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import PersonalVocabClient from '@/components/personal-vocab/PersonalVocabClient'

export default async function PersonalVocabPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  return <PersonalVocabClient />
}
