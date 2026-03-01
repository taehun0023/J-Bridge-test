import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import ExamClient from './ExamClient'
import { getCategoryLabel, getSubcategoryLabel } from '@/lib/assignment-categories'
import Card from '@/components/ui/Card'
import Link from 'next/link'

export default async function ExamPage({ params }: { params: Promise<{ examId: string }> }) {
  const { examId } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: exam } = await supabase
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) redirect('/dashboard/assignments')

  // Determine redirect target: cycle exams go to dashboard, others to assignments
  const backHref = exam.exam_cycle_id ? '/dashboard' : '/dashboard/assignments'
  const backLabel = exam.exam_cycle_id ? 'ダッシュボードへ' : '課題一覧へ'

  const categoryLabel = getCategoryLabel(exam.category)
  const subcategoryLabel = exam.subcategory === 'comprehensive' ? null : getSubcategoryLabel(exam.category, exam.subcategory)
  const levelStr = exam.content_level ? ` (${exam.content_level})` : ''
  const examLabel = subcategoryLabel ? `${categoryLabel} > ${subcategoryLabel}${levelStr}` : `${categoryLabel}${levelStr}`

  // Completed/Failed - show score (no pass/fail message for cycle exams)
  if (exam.status === 'completed' || exam.status === 'failed') {
    return (
      <div className="mx-auto max-w-2xl">
        <Card>
          <div className="py-8 text-center">
            <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
              総合試験 結果
            </h1>
            <p className="mt-2 text-zinc-500 dark:text-zinc-400">
              {examLabel}
            </p>
            <p className="mt-4 text-4xl font-bold font-mono text-zinc-900 dark:text-zinc-100">
              {exam.score}点
            </p>
            <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
              合格点: {exam.passing_score}点
            </p>
            <div className="mt-6 flex justify-center gap-3">
              <Link
                href={backHref}
                className="rounded-lg bg-gray-100 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
              >
                {backLabel}
              </Link>
            </div>
          </div>
        </Card>
      </div>
    )
  }

  // Approved - let ExamClient handle full start→exam transition
  if (exam.status === 'approved') {
    return <ExamClient exam={exam} mode="start" examLabel={examLabel} />
  }

  // In progress - show exam
  if (exam.status === 'in_progress') {
    return <ExamClient exam={exam} mode="exam" />
  }

  // Other statuses
  return (
    <div className="mx-auto max-w-2xl">
      <Card>
        <div className="py-8 text-center">
          <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">
            {exam.status === 'requested' ? '試験承認待ち' : '試験が拒否されました'}
          </h1>
          <p className="mt-2 text-zinc-500 dark:text-zinc-400">
            {examLabel}
          </p>
          <Link
            href={backHref}
            className="mt-4 inline-block rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500"
          >
            {backLabel}
          </Link>
        </div>
      </Card>
    </div>
  )
}
