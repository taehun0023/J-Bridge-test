import Card from '@/components/ui/Card'
import AdminCoursesClient from './AdminCoursesClient'
import { ASSESSMENT_QUIZ_IDS, ALL_PRACTICE_QUIZ_TYPES, PRACTICE_QUIZ_TYPE_LABELS, ADMIN_CONTENT_QUIZ_TYPES, AXIS_DISPLAY_LABELS, ALL_AXES } from '@/lib/assessment-config'
import { createClient } from '@/lib/supabase/server'

export default async function AdminCoursesPage() {
  const supabase = await createClient()

  // ── Lightweight: only fetch quiz metadata + counts ──

  // Assessment quiz question counts (one count query per axis)
  const assessmentCounts: Record<string, number> = {}
  const countPromises = Object.entries(ASSESSMENT_QUIZ_IDS).map(async ([step, quizId]) => {
    const { count } = await supabase
      .from('quiz_questions')
      .select('id', { count: 'exact', head: true })
      .eq('quiz_id', quizId)
    assessmentCounts[step] = count ?? 0
  })

  // Practice quiz metadata (just id + quiz_type, no questions)
  const practicePromise = supabase
    .from('quizzes')
    .select('id, quiz_type')
    .in('quiz_type', [...ALL_PRACTICE_QUIZ_TYPES])
    .eq('is_assessment', false)

  // Total claims count
  const claimsPromise = supabase
    .from('question_claims')
    .select('id', { count: 'exact', head: true })

  const [, practiceResult, claimsResult] = await Promise.all([
    Promise.all(countPromises),
    practicePromise,
    claimsPromise,
  ])

  const practiceQuizzes = practiceResult.data ?? []

  // Build quiz_type → quizId[] mapping
  const practiceTypeToQuizIds: Record<string, string[]> = {}
  for (const pq of practiceQuizzes) {
    const qt = pq.quiz_type as string
    if (!practiceTypeToQuizIds[qt]) practiceTypeToQuizIds[qt] = []
    practiceTypeToQuizIds[qt].push(pq.id as string)
  }

  // Count practice questions per type (batch count queries)
  const practiceCounts: Record<string, number> = {}
  const practiceCountPromises = Object.entries(practiceTypeToQuizIds).map(async ([qt, quizIds]) => {
    let total = 0
    // Count in batches of 10 quiz IDs
    for (let i = 0; i < quizIds.length; i += 10) {
      const batch = quizIds.slice(i, i + 10)
      const { count } = await supabase
        .from('quiz_questions')
        .select('id', { count: 'exact', head: true })
        .in('quiz_id', batch)
      total += count ?? 0
    }
    practiceCounts[qt] = total
  })
  await Promise.all(practiceCountPromises)

  // Build axis data
  const axes = [1, 2, 3, 4, 5].map(step => {
    const contentTypes = ADMIN_CONTENT_QUIZ_TYPES[step] ?? []
    const practiceTypes = contentTypes
      .filter(qt => practiceTypeToQuizIds[qt]?.length)
      .map(qt => ({
        quizType: qt,
        label: PRACTICE_QUIZ_TYPE_LABELS[qt].replace('(練習)', ''),
        quizIds: practiceTypeToQuizIds[qt],
      }))

    const assessmentCount = assessmentCounts[String(step)] ?? 0
    const practiceCount = practiceTypes.reduce((sum, pt) => sum + (practiceCounts[pt.quizType] ?? 0), 0)

    return {
      step,
      label: AXIS_DISPLAY_LABELS[ALL_AXES[step - 1]],
      assessmentQuizId: ASSESSMENT_QUIZ_IDS[step],
      practiceTypes,
      assessmentCount,
      practiceCount,
      totalCount: assessmentCount + practiceCount,
    }
  })

  // Stats
  const totalQuestions = axes.reduce((s, a) => s + a.totalCount, 0)
  const totalClaims = claimsResult.count ?? 0

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コンテンツ管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">総合試験・理解度テスト問題の管理・クレーム対応</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全問題数</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{totalQuestions}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">カテゴリ</p>
          <p className="text-2xl font-bold text-blue-600">{axes.reduce((s, a) => s + (a.practiceTypes.length > 0 ? 1 + a.practiceTypes.length : 1), 0)}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">クレーム</p>
          <p className="text-2xl font-bold text-red-600">{totalClaims}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">軸数</p>
          <p className="text-2xl font-bold text-purple-600">5</p>
        </Card>
      </div>

      <AdminCoursesClient axes={axes} />
    </div>
  )
}
