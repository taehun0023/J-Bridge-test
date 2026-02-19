import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminCoursesClient from './AdminCoursesClient'
import { ASSESSMENT_QUIZ_IDS, ASSESSMENT_LABELS } from '@/lib/assessment-config'

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

export default async function AdminCoursesPage() {
  const supabase = await createClient()

  // Fetch all quiz questions for the 5 assessment quizzes
  const quizIds = Object.values(ASSESSMENT_QUIZ_IDS)
  const { data: allQuestions } = await supabase
    .from('quiz_questions')
    .select('*, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('quiz_id', quizIds)
    .order('sort_order')

  // Fetch claims by question IDs (batched to avoid URL length overflow)
  const questionIds = (allQuestions ?? []).map(q => q.id as string)
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
  const questions = (allQuestions ?? []).map(q => ({
    id: q.id as string,
    quiz_id: q.quiz_id as string,
    question_text: q.question_text as string,
    question_type: q.question_type as string,
    difficulty: (q.difficulty ?? 'medium') as string,
    question_category: q.question_category as string | null,
    explanation: q.explanation as string | null,
    is_published: q.is_published as boolean,
    sort_order: q.sort_order as number,
    options: ((q.quiz_question_options ?? []) as { id: string; option_text: string; is_correct: boolean; sort_order: number }[])
      .sort((a, b) => a.sort_order - b.sort_order),
    claim_count: claimMap[q.id]?.count ?? 0,
    claim_details: claimMap[q.id]?.details ?? [],
  }))

  // Stats
  const stats = {
    totalQuestions: questions.length,
    published: questions.filter(q => q.is_published).length,
    totalClaims: claimsData.length,
    categories: 5,
  }

  // Build tab data
  const tabs = [
    { key: 'step1', label: ASSESSMENT_LABELS[1], quizId: ASSESSMENT_QUIZ_IDS[1] },
    { key: 'step2', label: ASSESSMENT_LABELS[2], quizId: ASSESSMENT_QUIZ_IDS[2] },
    { key: 'step3', label: ASSESSMENT_LABELS[3], quizId: ASSESSMENT_QUIZ_IDS[3] },
    { key: 'step4', label: ASSESSMENT_LABELS[4], quizId: ASSESSMENT_QUIZ_IDS[4] },
    { key: 'step5', label: ASSESSMENT_LABELS[5], quizId: ASSESSMENT_QUIZ_IDS[5] },
  ]

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コンテンツ管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">配置試験問題の管理・クレーム対応</p>

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
        tabs={tabs}
      />
    </div>
  )
}
