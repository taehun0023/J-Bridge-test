import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import AdminCoursesClient from './AdminCoursesClient'
import {
  ASSESSMENT_QUIZ_IDS,
  ALL_PRACTICE_QUIZ_TYPES,
  PRACTICE_QUIZ_TYPE_LABELS,
  ADMIN_CONTENT_QUIZ_TYPES,
  AXIS_DISPLAY_LABELS,
  ALL_AXES,
  CS_COMPREHENSIVE_CATEGORIES,
} from '@/lib/assessment-config'
import { CS_QUIZ_SET_DEFINITIONS } from '@/lib/cs-quiz'
import { DEV_QUIZ_SET_DEFINITIONS } from '@/lib/dev-quiz'
import { createClient } from '@/lib/supabase/server'

const DEV_SUBJECT_ORDER = ['cwf', 'java', 'javascript', 'python', 'sql', 'spring_boot', 'react', 'nextjs'] as const

const DEV_SUBJECT_LABELS: Record<string, string> = {
  cwf: '共通業務基礎',
  java: 'Java',
  javascript: 'JavaScript',
  python: 'Python',
  sql: 'SQL',
  spring_boot: 'Spring Boot',
  react: 'React',
  nextjs: 'Next.js',
}

const CS_UNDERSTANDING_QUESTION_CATEGORIES = [...new Set(CS_QUIZ_SET_DEFINITIONS.map(def => def.questionCategory))]

export default async function AdminCoursesPage() {
  const supabase = await createClient()

  // Admin-only page guard
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')
  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  if (profile?.role !== 'admin') redirect('/dashboard')

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
      assessmentQuizIds: [ASSESSMENT_QUIZ_IDS[step]],
      sourceQuizIds: [] as string[],
      practiceTypes,
      assessmentCount,
      practiceCount,
      totalCount: assessmentCount + practiceCount,
    }
  })

  const step3 = axes.find(a => a.step === 3)
  if (step3) {
    const csAssessmentQuizIds = [...new Set(CS_QUIZ_SET_DEFINITIONS.map(def => def.quizId))]
    const { data: csSourceQuizzes } = await supabase
      .from('quizzes')
      .select('id')
      .eq('quiz_type', 'cs_knowledge')
      .eq('is_assessment', false)
      .eq('is_pool', false)
    const csSourceQuizIds = (csSourceQuizzes ?? []).map(q => q.id as string)
    let csAssessmentCount = 0
    let csComprehensiveCount = 0

    for (let i = 0; i < csSourceQuizIds.length; i += 10) {
      const batch = csSourceQuizIds.slice(i, i + 10)
      const { count } = await supabase
        .from('quiz_questions')
        .select('id', { count: 'exact', head: true })
        .in('quiz_id', batch)
        .in('question_category', CS_UNDERSTANDING_QUESTION_CATEGORIES)
        .eq('is_published', true)
        .eq('question_usage_scope', 'understanding_only')
        .or('curriculum_status.is.null,curriculum_status.eq.aligned,curriculum_status.eq.adaptable')
      csAssessmentCount += count ?? 0
    }

    for (let i = 0; i < csSourceQuizIds.length; i += 10) {
      const batch = csSourceQuizIds.slice(i, i + 10)
      const { count } = await supabase
        .from('quiz_questions')
        .select('id', { count: 'exact', head: true })
        .in('quiz_id', batch)
        .in('question_category', [...CS_COMPREHENSIVE_CATEGORIES])
        .eq('is_published', true)
        .eq('question_usage_scope', 'comprehensive_only')
        .or('curriculum_status.is.null,curriculum_status.eq.aligned,curriculum_status.eq.adaptable')
      csComprehensiveCount += count ?? 0
    }

    step3.assessmentQuizId = csAssessmentQuizIds[0] ?? ASSESSMENT_QUIZ_IDS[3]
    step3.assessmentQuizIds = csAssessmentQuizIds
    step3.sourceQuizIds = csSourceQuizIds
    step3.assessmentCount = csComprehensiveCount
    step3.practiceCount = csAssessmentCount
    step3.totalCount = step3.assessmentCount + step3.practiceCount
  }

  // Override Step 4 with per-subject grouping
  // Questions live in source quizzes (non-pool, non-assessment) with question_category
  const step4 = axes.find(a => a.step === 4)
  if (step4) {
    const { data: devSourceQuizzes } = await supabase
      .from('quizzes')
      .select('id')
      .in('quiz_type', ['core_programming', 'framework'])
      .eq('is_pool', false)
      .eq('is_assessment', false)

    const devSourceIds = (devSourceQuizzes ?? []).map(q => q.id as string)

    const practiceQuizIdSet = new Set(practiceQuizzes.map(pq => pq.id as string))
    const sortedDefs = [...DEV_QUIZ_SET_DEFINITIONS]
      .filter(d => practiceQuizIdSet.has(d.quizId))
      .sort((a, b) => DEV_SUBJECT_ORDER.indexOf(a.category as typeof DEV_SUBJECT_ORDER[number]) - DEV_SUBJECT_ORDER.indexOf(b.category as typeof DEV_SUBJECT_ORDER[number]))

    // Count questions per subject via question_category on source quizzes
    const devCountPromises = sortedDefs.map(async (def) => {
      if (devSourceIds.length === 0) return { def, count: 0 }
      const { count } = await supabase
        .from('quiz_questions')
        .select('id', { count: 'exact', head: true })
        .in('quiz_id', devSourceIds)
        .eq('question_category', def.questionCategory)
        .eq('is_published', true)
      return { def, count: count ?? 0 }
    })
    const devCounts = await Promise.all(devCountPromises)

    step4.practiceTypes = devCounts
      .filter(({ count }) => count > 0)
      .map(({ def }) => ({
        quizType: def.questionCategory,
        label: DEV_SUBJECT_LABELS[def.category] ?? def.category,
        quizIds: devSourceIds,
      }))
    step4.practiceCount = devCounts.reduce((sum, dc) => sum + dc.count, 0)
    step4.totalCount = step4.assessmentCount + step4.practiceCount
  }

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
