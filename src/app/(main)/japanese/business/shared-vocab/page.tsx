import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import SharedVocabClient from '@/components/japanese/business/SharedVocabClient'

export default async function SharedVocabPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const role = (profile?.role ?? 'mentee') as 'admin' | 'mentor' | 'mentee'
  return <SharedVocabClient role={role} />
}
