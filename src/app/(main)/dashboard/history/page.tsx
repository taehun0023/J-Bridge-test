import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import HistoryClient from './HistoryClient'

export default async function HistoryPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  // Fetch all quiz attempts
  const { data: quizAttempts } = await supabase
    .from('quiz_attempts')
    .select('id, score, passed, completed_at, retake_request_status, quizzes(title, quiz_type, is_assessment)')
    .eq('user_id', user.id)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })

  // Fetch all coding exam attempts
  const { data: codingExamAttempts } = await supabase
    .from('coding_exam_attempts')
    .select('id, score, passed, started_at, completed_at, coding_skill_exams(title, target_rank)')
    .eq('user_id', user.id)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })

  // Fetch comprehensive exams
  const { data: comprehensiveExams } = await supabase
    .from('comprehensive_exams')
    .select('id, category, subcategory, content_level, status, score, passed, passing_score, total_questions, requested_at, completed_at')
    .eq('user_id', user.id)
    .order('requested_at', { ascending: false })

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">テスト履歴</h1>
        <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">全てのテスト・総合試験の履歴</p>
      </div>
      <HistoryClient
        quizAttempts={(quizAttempts ?? []).map(a => ({
          ...a,
          quizzes: Array.isArray(a.quizzes) ? a.quizzes[0] ?? null : a.quizzes,
        }))}
        codingExamAttempts={(codingExamAttempts ?? []).map(a => ({
          ...a,
          coding_skill_exams: Array.isArray(a.coding_skill_exams) ? a.coding_skill_exams[0] ?? null : a.coding_skill_exams,
        }))}
        comprehensiveExams={comprehensiveExams ?? []}
      />
    </div>
  )
}
