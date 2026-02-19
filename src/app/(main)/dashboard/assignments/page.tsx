import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { ASSIGNMENT_CATEGORIES, getCategoryLabel, getSubcategoryLabel, getContentUrl, getReadingTotalCount, getContentLevelLabel } from '@/lib/assignment-categories'
import { AlertTriangle, ArrowLeft, BookOpen, CheckCircle2, Clock, GraduationCap } from 'lucide-react'
import ExamRequestButton from './ExamRequestButton'
import OverdueReasonForm from './OverdueReasonForm'
import { detectAndMarkOverdue } from '@/app/actions/learning-assignments'

const statusColors: Record<string, string> = {
  pending: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400',
  in_progress: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  awaiting_confirmation: 'bg-orange-100 text-orange-700 dark:bg-orange-900/30 dark:text-orange-400',
  completed: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
  overdue: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
}

const statusLabels: Record<string, string> = {
  pending: '待機',
  in_progress: '進行中',
  awaiting_confirmation: '確認待ち',
  completed: '完了',
  overdue: '期限超過',
}

export default async function AssignmentsPage() {
  await detectAndMarkOverdue()

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Fetch learning assignments
  const { data: assignments } = await supabase
    .from('learning_assignments')
    .select('*')
    .eq('assigned_to', user.id)
    .order('created_at', { ascending: false })

  // Fetch quiz titles for display
  const allQuizIds = (assignments ?? []).flatMap(a => [
    ...(a.required_quiz_ids ?? []),
  ]).filter(Boolean)

  let quizMap: Record<string, { title: string }> = {}
  if (allQuizIds.length > 0) {
    const { data: quizzes } = await supabase
      .from('quizzes')
      .select('id, title')
      .in('id', [...new Set(allQuizIds)])

    for (const q of quizzes ?? []) {
      quizMap[q.id] = { title: q.title }
    }
  }

  // Fetch existing exam requests to check status
  const { data: exams } = await supabase
    .from('comprehensive_exams')
    .select('id, category, subcategory, content_level, status, score, passed')
    .eq('user_id', user.id)
    .order('requested_at', { ascending: false })

  // Build exam status map keyed by category+subcategory+level
  const examStatusMap: Record<string, { id: string; status: string; score: number | null; passed: boolean | null }> = {}
  for (const exam of exams ?? []) {
    const key = `${exam.category}|${exam.subcategory}|${exam.content_level ?? ''}`
    if (!examStatusMap[key]) {
      examStatusMap[key] = { id: exam.id, status: exam.status, score: exam.score, passed: exam.passed }
    }
  }

  // Fetch reading progress for business-lit assignments
  const businessLitAssignments = (assignments ?? []).filter(a => a.category === 'business-lit')
  const readingItemTypes = businessLitAssignments.flatMap(a => {
    const config = ASSIGNMENT_CATEGORIES['business-lit']?.subcategories[a.subcategory]
    return config?.readingItemTypes ?? []
  })

  let masteredMap: Record<string, number> = {}
  if (readingItemTypes.length > 0) {
    const { data: mastered } = await supabase
      .from('user_mastered_items')
      .select('item_type')
      .eq('user_id', user.id)
      .in('item_type', [...new Set(readingItemTypes)])

    for (const m of mastered ?? []) {
      masteredMap[m.item_type] = (masteredMap[m.item_type] ?? 0) + 1
    }
  }

  const stats = {
    total: assignments?.length ?? 0,
    pending: assignments?.filter(a => a.status === 'pending').length ?? 0,
    inProgress: assignments?.filter(a => a.status === 'in_progress').length ?? 0,
    completed: assignments?.filter(a => a.status === 'completed').length ?? 0,
    overdue: assignments?.filter(a => a.status === 'overdue').length ?? 0,
  }

  return (
    <div>
      <div className="flex items-center gap-3 mb-6">
        <Link href="/dashboard" className="rounded-lg p-1.5 text-zinc-400 hover:bg-gray-100 hover:text-zinc-600 dark:hover:bg-white/5 dark:hover:text-zinc-300">
          <ArrowLeft className="h-5 w-5" />
        </Link>
        <div>
          <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">学習課題</h1>
          <p className="mt-1 text-zinc-500 dark:text-zinc-400">配信された学習課題とテスト進捗</p>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-5 mb-6">
        <Card>
          <div className="flex items-center gap-2">
            <BookOpen className="h-4 w-4 text-zinc-400" />
            <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          </div>
          <p className="mt-1 text-2xl font-bold text-gray-900 dark:text-white">{stats.total}</p>
        </Card>
        <Card>
          <div className="flex items-center gap-2">
            <Clock className="h-4 w-4 text-yellow-500" />
            <p className="text-sm text-gray-500 dark:text-gray-400">待機</p>
          </div>
          <p className="mt-1 text-2xl font-bold text-yellow-600">{stats.pending}</p>
        </Card>
        <Card>
          <div className="flex items-center gap-2">
            <BookOpen className="h-4 w-4 text-blue-500" />
            <p className="text-sm text-gray-500 dark:text-gray-400">進行中</p>
          </div>
          <p className="mt-1 text-2xl font-bold text-blue-600">{stats.inProgress}</p>
        </Card>
        <Card>
          <div className="flex items-center gap-2">
            <CheckCircle2 className="h-4 w-4 text-green-500" />
            <p className="text-sm text-gray-500 dark:text-gray-400">完了</p>
          </div>
          <p className="mt-1 text-2xl font-bold text-green-600">{stats.completed}</p>
        </Card>
        <Card>
          <div className="flex items-center gap-2">
            <AlertTriangle className="h-4 w-4 text-red-500" />
            <p className="text-sm text-gray-500 dark:text-gray-400">期限超過</p>
          </div>
          <p className="mt-1 text-2xl font-bold text-red-600">{stats.overdue}</p>
        </Card>
      </div>

      {/* Assignment cards */}
      {(!assignments || assignments.length === 0) ? (
        <Card>
          <div className="py-8 text-center">
            <GraduationCap className="mx-auto h-10 w-10 text-zinc-400" />
            <p className="mt-3 text-sm text-zinc-500 dark:text-zinc-400">学習課題がありません</p>
          </div>
        </Card>
      ) : (
        <div className="space-y-4">
          {assignments.map(assignment => {
            const requiredIds = assignment.required_quiz_ids ?? []
            const passedIds = new Set(assignment.passed_quiz_ids ?? [])
            const total = requiredIds.length
            const passed = passedIds.size
            const progress = total > 0 ? Math.round((passed / total) * 100) : 0
            const allComplete = total > 0 && passed >= total

            const examKey = `${assignment.category}|${assignment.subcategory}|${assignment.content_level ?? ''}`
            const examStatus = examStatusMap[examKey]

            return (
              <Card key={assignment.id}>
                <div className="flex items-start justify-between">
                  <div>
                    <h3 className="text-base font-semibold">
                      <Link
                        href={getContentUrl(assignment.category, assignment.subcategory)}
                        className="text-zinc-900 dark:text-zinc-100 hover:text-indigo-500 dark:hover:text-indigo-400 transition-colors"
                      >
                        {assignment.title} →
                      </Link>
                    </h3>
                    <div className="mt-1 flex flex-wrap items-center gap-2">
                      <span className="rounded-full bg-indigo-100 px-2 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
                        {getCategoryLabel(assignment.category)}
                      </span>
                      <span className="rounded-full bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600 dark:bg-gray-700 dark:text-gray-300">
                        {getSubcategoryLabel(assignment.category, assignment.subcategory)}
                      </span>
                      {assignment.content_level && (
                        <span className="rounded-full bg-emerald-100 px-2 py-0.5 text-xs font-medium text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400">
                          {getContentLevelLabel(assignment.category, assignment.content_level)}
                        </span>
                      )}
                    </div>
                  </div>
                  <span className={`inline-flex rounded-full px-2.5 py-0.5 text-xs font-medium ${statusColors[assignment.status] ?? ''}`}>
                    {statusLabels[assignment.status] ?? assignment.status}
                  </span>
                </div>

                {assignment.description && (
                  <p className="mt-2 text-sm text-zinc-500 dark:text-zinc-400">{assignment.description}</p>
                )}

                {/* Overdue section */}
                {assignment.status === 'overdue' && (
                  <div className="mt-3 rounded-lg border border-red-200 bg-red-50 p-3 dark:border-red-800 dark:bg-red-900/20">
                    <div className="flex items-center gap-2 text-sm font-medium text-red-700 dark:text-red-300">
                      <AlertTriangle className="h-4 w-4" />
                      期限を超過しました
                    </div>
                    <OverdueReasonForm
                      assignmentId={assignment.id}
                      existingReason={assignment.overdue_reason}
                    />
                  </div>
                )}

                {/* Reading progress (business-lit only) */}
                {(() => {
                  const readingTotal = getReadingTotalCount(assignment.category, assignment.subcategory)
                  const subcatConfig = ASSIGNMENT_CATEGORIES[assignment.category]?.subcategories[assignment.subcategory]
                  const readingPassed = (subcatConfig?.readingItemTypes ?? []).reduce(
                    (sum, t) => sum + (masteredMap[t] ?? 0), 0
                  )
                  const readingProgress = readingTotal > 0 ? Math.round((readingPassed / readingTotal) * 100) : 0

                  return assignment.category === 'business-lit' && readingTotal > 0 ? (
                    <div className="mt-4">
                      <div className="flex items-center justify-between mb-1">
                        <span className="text-xs text-zinc-500 dark:text-zinc-400">読了進捗: {readingPassed}/{readingTotal}</span>
                        <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">{readingProgress}%</span>
                      </div>
                      <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                        <div className="h-2 rounded-full bg-amber-500 transition-all" style={{ width: `${readingProgress}%` }} />
                      </div>
                    </div>
                  ) : null
                })()}

                {/* Test progress bar */}
                <div className="mt-4">
                  <div className="flex items-center justify-between mb-1">
                    <span className="text-xs text-zinc-500 dark:text-zinc-400">
                      テスト進捗: {passed}/{total}
                    </span>
                    <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">{progress}%</span>
                  </div>
                  <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                    <div
                      className={`h-2 rounded-full transition-all ${allComplete ? 'bg-emerald-500' : 'bg-indigo-500'}`}
                      style={{ width: `${progress}%` }}
                    />
                  </div>
                </div>

                {/* Quiz list */}
                {requiredIds.length > 0 && (
                  <div className="mt-3 space-y-1">
                    {requiredIds.map((quizId: string) => {
                      const isPassed = passedIds.has(quizId)
                      const quizTitle = quizMap[quizId]?.title ?? 'クイズ'
                      return (
                        <div key={quizId} className="flex items-center gap-2 text-sm">
                          {isPassed ? (
                            <CheckCircle2 className="h-4 w-4 text-emerald-500 shrink-0" />
                          ) : (
                            <div className="h-4 w-4 rounded-full border-2 border-gray-300 dark:border-gray-500 shrink-0" />
                          )}
                          <span className={isPassed ? 'text-zinc-500 dark:text-zinc-400 line-through' : 'text-zinc-700 dark:text-zinc-300'}>
                            {quizTitle}
                          </span>
                        </div>
                      )
                    })}
                  </div>
                )}

                {/* Due date */}
                {assignment.due_date && (
                  <p className="mt-3 text-xs text-zinc-400 dark:text-zinc-500">
                    締切: {new Date(assignment.due_date).toLocaleDateString('ja-JP')}
                  </p>
                )}

                {/* Exam request button - show when all quizzes are complete */}
                {allComplete && assignment.status === 'completed' && (
                  <div className="mt-4 border-t border-gray-100 pt-4 dark:border-white/[0.06]">
                    {examStatus ? (
                      <div className="flex items-center gap-2">
                        <GraduationCap className="h-4 w-4 text-indigo-500" />
                        <span className="text-sm text-zinc-700 dark:text-zinc-300">
                          {examStatus.status === 'requested' && '総合試験リクエスト中'}
                          {examStatus.status === 'approved' && (
                            <Link href={`/exam/${examStatus.id}`} className="text-indigo-600 hover:underline dark:text-indigo-400">
                              総合試験を開始する
                            </Link>
                          )}
                          {examStatus.status === 'denied' && '試験リクエストが拒否されました'}
                          {examStatus.status === 'in_progress' && (
                            <Link href={`/exam/${examStatus.id}`} className="text-indigo-600 hover:underline dark:text-indigo-400">
                              試験を続ける
                            </Link>
                          )}
                          {examStatus.status === 'completed' && `合格 (${examStatus.score}点)`}
                          {examStatus.status === 'failed' && `不合格 (${examStatus.score}点)`}
                        </span>
                      </div>
                    ) : (
                      <ExamRequestButton
                        category={assignment.category}
                        subcategory={assignment.subcategory}
                        contentLevel={assignment.content_level}
                      />
                    )}
                  </div>
                )}
              </Card>
            )
          })}
        </div>
      )}
    </div>
  )
}
