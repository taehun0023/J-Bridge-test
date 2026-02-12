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

  const categoryLabel = getCategoryLabel(exam.category)
  const subcategoryLabel = getSubcategoryLabel(exam.category, exam.subcategory)
  const levelStr = exam.content_level ? ` (${exam.content_level})` : ''

  // Completed/Failed - show results
  if (exam.status === 'completed' || exam.status === 'failed') {
    return (
      <div className="mx-auto max-w-2xl">
        <Card>
          <div className="py-8 text-center">
            <div className={`mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full ${
              exam.passed ? 'bg-emerald-100 dark:bg-emerald-500/10' : 'bg-red-100 dark:bg-red-500/10'
            }`}>
              <span className="text-3xl">{exam.passed ? '合' : '不'}</span>
            </div>
            <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
              {exam.passed ? '合格' : '不合格'}
            </h1>
            <p className="mt-2 text-zinc-500 dark:text-zinc-400">
              {categoryLabel} &gt; {subcategoryLabel}{levelStr}
            </p>
            <p className="mt-4 text-4xl font-bold font-mono text-zinc-900 dark:text-zinc-100">
              {exam.score}点
            </p>
            <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
              合格点: {exam.passing_score}点
            </p>
            <div className="mt-6 flex justify-center gap-3">
              <Link
                href="/dashboard/assignments"
                className="rounded-lg bg-gray-100 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
              >
                課題一覧へ
              </Link>
              {!exam.passed && (
                <ExamClient exam={exam} mode="retake" />
              )}
            </div>
          </div>
        </Card>
      </div>
    )
  }

  // Approved - show start button
  if (exam.status === 'approved') {
    return (
      <div className="mx-auto max-w-2xl">
        <Card>
          <div className="py-8 text-center">
            <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">総合試験</h1>
            <p className="mt-2 text-zinc-500 dark:text-zinc-400">
              {categoryLabel} &gt; {subcategoryLabel}{levelStr}
            </p>
            <div className="mt-6 space-y-2 text-sm text-zinc-600 dark:text-zinc-300">
              <p>問題数: {exam.total_questions}問</p>
              <p>制限時間: {exam.time_limit_minutes}分</p>
              <p>合格点: {exam.passing_score}点</p>
            </div>
            <ExamClient exam={exam} mode="start" />
          </div>
        </Card>
      </div>
    )
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
            {categoryLabel} &gt; {subcategoryLabel}{levelStr}
          </p>
          <Link
            href="/dashboard/assignments"
            className="mt-4 inline-block rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500"
          >
            課題一覧へ
          </Link>
        </div>
      </Card>
    </div>
  )
}
