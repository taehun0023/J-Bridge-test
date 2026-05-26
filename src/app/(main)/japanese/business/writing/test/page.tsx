import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { requireAuth } from '@/lib/auth-helpers'
import { getMasteredIds } from '@/app/actions/mastery'
import { getWritingTestQuestions } from '@/app/actions/writing'
import { startQuizAttempt } from '@/app/actions/quiz'
import WritingTestClient from '@/components/japanese/business/WritingTestClient'

export const dynamic = 'force-dynamic'

const PROGRESS_CATEGORIES = ['expression', 'sentence_pattern', 'keigo']
const UNLOCK_THRESHOLD = 70
const WRITING_POOL_QUIZ_ID = 'f0000001-0000-0000-0000-000000000005'

export default async function WritingTestPage() {
  const auth = await requireAuth()
  if ('error' in auth) redirect('/login')

  const supabase = await createClient()
  const { data: prof } = await supabase.from('profiles').select('role').eq('id', auth.user.id).single()
  const bypassLock = prof?.role === 'admin' || prof?.role === 'mentor'

  // Unlock check
  if (!bypassLock) {
    const masteredIds = await getMasteredIds('it_glossary')
    const { count: totalInCategory } = await supabase
      .from('it_glossary')
      .select('id', { count: 'exact', head: true })
      .in('category', PROGRESS_CATEGORIES)
      .not('example_sentence', 'is', null)

    const totalItems = totalInCategory ?? 0
    const masteredInCategory = masteredIds.length > 0
      ? (await supabase.from('it_glossary').select('id').in('category', PROGRESS_CATEGORIES).not('example_sentence', 'is', null).in('id', masteredIds)).data?.length ?? 0
      : 0
    const progress = totalItems > 0 ? Math.round((masteredInCategory / totalItems) * 100) : 0

    if (progress < UNLOCK_THRESHOLD) {
      redirect('/japanese/business/writing')
    }
  }

  // Mentees can freely retake writing quizzes

  // Create quiz attempt
  const attemptResult = await startQuizAttempt(WRITING_POOL_QUIZ_ID)
  if ('error' in attemptResult) redirect('/japanese/business/writing')

  // Fetch questions
  const result = await getWritingTestQuestions()
  if ('error' in result || !result.questions) redirect('/japanese/business/writing')

  return (
    <WritingTestClient
      questions={result.questions}
      attemptId={attemptResult.attemptId}
    />
  )
}
