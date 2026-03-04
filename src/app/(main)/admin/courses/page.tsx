import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminCoursesClient from './AdminCoursesClient'
import { ASSESSMENT_QUIZ_IDS, ALL_PRACTICE_QUIZ_TYPES, PRACTICE_QUIZ_TYPE_LABELS, ADMIN_CONTENT_QUIZ_TYPES, AXIS_DISPLAY_LABELS, ALL_AXES } from '@/lib/assessment-config'

interface ClaimRow {
  question_id: string
  claim_reason: string | null
  profiles: { full_name: string | null } | null
  created_at: string
}

interface ClaimDetail {
  userName: string
  reason: string | null
  createdAt: string
}

async function fetchClaimsBatched(
  supabase: Awaited<ReturnType<typeof createClient>>,
  questionIds: string[],
): Promise<ClaimRow[]> {
  let claimsData: ClaimRow[] = []
  const BATCH_SIZE = 100
  for (let i = 0; i < questionIds.length; i += BATCH_SIZE) {
    const batch = questionIds.slice(i, i + BATCH_SIZE)
    const { data, error } = await supabase
      .from('question_claims')
      .select('question_id, claim_reason, profiles:user_id(full_name), created_at')
      .in('question_id', batch)

    if (error) {
      console.error('Failed to fetch claims:', error.message)
    } else {
      claimsData = claimsData.concat((data ?? []) as unknown as ClaimRow[])
    }
  }
  return claimsData
}

export default async function AdminCoursesPage() {
  const supabase = await createClient()

  // ── Assessment quizzes (5 tabs) ──
  const assessmentQuizIds = Object.values(ASSESSMENT_QUIZ_IDS)
  const { data: assessmentQuestions } = await supabase
    .from('quiz_questions')
    .select('*, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('quiz_id', assessmentQuizIds)
    .order('sort_order')

  // ── Practice quizzes (6 tabs) ──
  const { data: practiceQuizzes } = await supabase
    .from('quizzes')
    .select('id, quiz_type')
    .in('quiz_type', [...ALL_PRACTICE_QUIZ_TYPES])
    .eq('is_assessment', false)

  const practiceQuizIds = (practiceQuizzes ?? []).map(q => q.id as string)
  const { data: practiceQuestions } = practiceQuizIds.length > 0
    ? await supabase
        .from('quiz_questions')
        .select('*, quiz_question_options(id, option_text, is_correct, sort_order)')
        .in('quiz_id', practiceQuizIds)
        .order('sort_order')
    : { data: [] }

  // ── Build quiz_type → quizId[] mapping for practice tabs ──
  const practiceTypeToQuizIds: Record<string, string[]> = {}
  for (const pq of practiceQuizzes ?? []) {
    const qt = pq.quiz_type as string
    if (!practiceTypeToQuizIds[qt]) practiceTypeToQuizIds[qt] = []
    practiceTypeToQuizIds[qt].push(pq.id as string)
  }

  // ── Merge all questions + fetch claims ──
  const allQuestions = [...(assessmentQuestions ?? []), ...(practiceQuestions ?? [])]
  const questionIds = allQuestions.map(q => q.id as string)
  const claimsData = await fetchClaimsBatched(supabase, questionIds)

  // Aggregate claims by question
  const claimMap: Record<string, { count: number; details: ClaimDetail[] }> = {}
  for (const c of claimsData) {
    if (!claimMap[c.question_id]) {
      claimMap[c.question_id] = { count: 0, details: [] }
    }
    claimMap[c.question_id].count++
    claimMap[c.question_id].details.push({
      userName: (c.profiles as { full_name: string | null } | null)?.full_name ?? '不明',
      reason: c.claim_reason,
      createdAt: c.created_at,
    })
  }

  // Build question data with claims info
  const questions = allQuestions.map(q => ({
    id: q.id as string,
    quiz_id: q.quiz_id as string,
    question_text: q.question_text as string,
    question_type: q.question_type as string,
    difficulty: (q.difficulty as string | null) ?? null,
    question_category: q.question_category as string | null,
    explanation: q.explanation as string | null,
    is_published: q.is_published as boolean,
    sort_order: q.sort_order as number,
    options: ((q.quiz_question_options ?? []) as { id: string; option_text: string; is_correct: boolean; sort_order: number }[])
      .sort((a, b) => a.sort_order - b.sort_order),
    claim_count: claimMap[q.id]?.count ?? 0,
    claim_details: claimMap[q.id]?.details ?? [],
  }))

  // Stats (all questions)
  const stats = {
    totalQuestions: questions.length,
    published: questions.filter(q => q.is_published).length,
    totalClaims: claimsData.length,
    categories: 5 + Object.keys(practiceTypeToQuizIds).length,
  }

  // Build axis data: 5 axes with assessment quiz + practice types
  const axes = [1, 2, 3, 4, 5].map(step => {
    const contentTypes = ADMIN_CONTENT_QUIZ_TYPES[step] ?? []
    const practiceTypes = contentTypes
      .filter(qt => practiceTypeToQuizIds[qt]?.length)
      .map(qt => ({
        quizType: qt,
        label: PRACTICE_QUIZ_TYPE_LABELS[qt].replace('(練習)', ''),
        quizIds: practiceTypeToQuizIds[qt],
      }))

    const assessmentQuizId = ASSESSMENT_QUIZ_IDS[step]
    const assessmentCount = questions.filter(q => q.quiz_id === assessmentQuizId).length
    const practiceCount = practiceTypes.reduce((sum, pt) => sum + questions.filter(q => pt.quizIds.includes(q.quiz_id)).length, 0)

    return {
      step,
      label: AXIS_DISPLAY_LABELS[ALL_AXES[step - 1]],
      assessmentQuizId,
      practiceTypes,
      totalCount: assessmentCount + practiceCount,
    }
  })

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コンテンツ管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">総合試験・理解度テスト問題の管理・クレーム対応</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全問題数</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{stats.totalQuestions}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">公開中</p>
          <p className="text-2xl font-bold text-green-600">{stats.published}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">クレーム</p>
          <p className="text-2xl font-bold text-red-600">{stats.totalClaims}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">カテゴリ</p>
          <p className="text-2xl font-bold text-blue-600">{stats.categories}</p>
        </Card>
      </div>

      <AdminCoursesClient
        questions={questions}
        axes={axes}
      />
    </div>
  )
}
