import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { ASSIGNMENT_CATEGORIES, getCategoryLabel, getSubcategoryLabel, getContentUrl, getReadingTotalCount, getContentLevelLabel, getQuizUrl } from '@/lib/assignment-categories'
import { AlertTriangle, ArrowLeft, BookOpen, CheckCircle2, Clock, GraduationCap, Lock } from 'lucide-react'
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

  // Resolve quizzes for assignments with empty required_quiz_ids (backfill)
  const resolvedQuizIdsMap: Record<string, string[]> = {}
  const emptyAssignments = (assignments ?? []).filter(a =>
    (a.required_quiz_ids ?? []).length === 0
  )

  for (const a of emptyAssignments) {
    const catConfig = ASSIGNMENT_CATEGORIES[a.category]
    if (!catConfig) continue

    const isLevelOnly = catConfig.levelOnly === true
    let resolvedIds: string[] = []

    if (isLevelOnly && catConfig.quizTypes) {
      let query = supabase
        .from('quizzes')
        .select('id')
        .in('quiz_type', catConfig.quizTypes)

      if (a.content_level) {
        query = query.eq('content_level', a.content_level)
      }

      const { data: quizzes } = await query.order('created_at')
      resolvedIds = (quizzes ?? []).map(q => q.id)
    } else {
      const subcatConfig = catConfig.subcategories[a.subcategory]
      if (!subcatConfig) continue

      if (subcatConfig.courseSubcategory && a.content_level) {
        const { data: courses } = await supabase
          .from('courses')
          .select('id')
          .eq('subcategory', subcatConfig.courseSubcategory)
          .eq('difficulty', a.content_level)
          .eq('is_published', true)

        if (courses?.length) {
          const courseIds = courses.map(c => c.id)
          const { data: lessons } = await supabase
            .from('lessons')
            .select('id')
            .in('course_id', courseIds)

          if (lessons?.length) {
            const lessonIds = lessons.map(l => l.id)
            const { data: quizzes } = await supabase
              .from('quizzes')
              .select('id')
              .in('lesson_id', lessonIds)
              .order('created_at')

            resolvedIds = (quizzes ?? []).map(q => q.id)
          }
        }
      } else if (subcatConfig.quizType) {
        let query = supabase
          .from('quizzes')
          .select('id')
          .eq('quiz_type', subcatConfig.quizType)

        if (a.content_level) {
          query = query.eq('content_level', a.content_level)
        }

        if (subcatConfig.titlePatterns?.length) {
          const orFilter = subcatConfig.titlePatterns
            .map(p => `title.ilike.${p}`)
            .join(',')
          query = query.or(orFilter)
        }

        const { data: quizzes } = await query.order('created_at')
        resolvedIds = (quizzes ?? []).map(q => q.id)
      }
    }

    if (resolvedIds.length > 0) {
      resolvedQuizIdsMap[a.id] = resolvedIds

      // Backfill the DB record so progress tracking works
      const serviceClient = createServiceRoleClient()
      if (serviceClient) {
        await serviceClient
          .from('learning_assignments')
          .update({ required_quiz_ids: resolvedIds })
          .eq('id', a.id)
      }
    }
  }

  // Fetch quiz titles for display
  const allQuizIds = (assignments ?? []).flatMap(a => [
    ...(resolvedQuizIdsMap[a.id] ?? a.required_quiz_ids ?? []),
  ]).filter(Boolean)

  let quizMap: Record<string, { title: string; quiz_type: string; lesson_id: string | null; course_id: string | null }> = {}
  if (allQuizIds.length > 0) {
    const { data: quizzes } = await supabase
      .from('quizzes')
      .select('id, title, quiz_type, lesson_id')
      .in('id', [...new Set(allQuizIds)])

    // Resolve course_id for lesson-based quizzes
    const lessonIds = (quizzes ?? []).map(q => q.lesson_id).filter(Boolean) as string[]
    let lessonCourseMap: Record<string, string> = {}
    if (lessonIds.length > 0) {
      const { data: lessons } = await supabase
        .from('lessons')
        .select('id, course_id')
        .in('id', [...new Set(lessonIds)])

      for (const l of lessons ?? []) {
        lessonCourseMap[l.id] = l.course_id
      }
    }

    for (const q of quizzes ?? []) {
      quizMap[q.id] = {
        title: q.title,
        quiz_type: q.quiz_type,
        lesson_id: q.lesson_id,
        course_id: q.lesson_id ? lessonCourseMap[q.lesson_id] ?? null : null,
      }
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

  // Fetch JLPT mastery progress for seikatsu assignments
  const seikatsuAssignments = (assignments ?? []).filter(a => a.category === 'seikatsu')
  const jlptLevels = [...new Set(seikatsuAssignments.map(a => a.content_level).filter(Boolean))] as string[]

  const jlptProgressMap: Record<string, { mastered: number; total: number; pct: number }> = {}

  if (jlptLevels.length > 0) {
    const JLPT_ITEM_TYPES = ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_kanji', 'jlpt_reading', 'jlpt_listening']

    const { data: jlptMastered } = await supabase
      .from('user_mastered_items')
      .select('item_type, item_id')
      .eq('user_id', user.id)
      .in('item_type', JLPT_ITEM_TYPES)

    for (const level of jlptLevels) {
      const [vocabIds, grammarIds, kanjiIds, readingIds, listeningIds] = await Promise.all([
        supabase.from('jlpt_vocabulary').select('id').eq('jlpt_level', level),
        supabase.from('jlpt_grammar').select('id').eq('jlpt_level', level),
        supabase.from('jlpt_kanji').select('id').eq('jlpt_level', level),
        supabase.from('jlpt_reading_passages').select('id').eq('jlpt_level', level),
        supabase.from('jlpt_listening_scripts').select('id').eq('jlpt_level', level),
      ])

      const vocabIdSet = new Set(vocabIds.data?.map(v => v.id) ?? [])
      const grammarIdSet = new Set(grammarIds.data?.map(g => g.id) ?? [])
      const kanjiIdSet = new Set(kanjiIds.data?.map(k => k.id) ?? [])
      const readingIdSet = new Set(readingIds.data?.map(r => r.id) ?? [])
      const listeningIdSet = new Set(listeningIds.data?.map(l => l.id) ?? [])

      const total = vocabIdSet.size + grammarIdSet.size + kanjiIdSet.size + readingIdSet.size + listeningIdSet.size

      const mastered = (jlptMastered ?? []).filter(m =>
        (m.item_type === 'jlpt_vocabulary' && vocabIdSet.has(m.item_id)) ||
        (m.item_type === 'jlpt_grammar' && grammarIdSet.has(m.item_id)) ||
        (m.item_type === 'jlpt_kanji' && kanjiIdSet.has(m.item_id)) ||
        (m.item_type === 'jlpt_reading' && readingIdSet.has(m.item_id)) ||
        (m.item_type === 'jlpt_listening' && listeningIdSet.has(m.item_id))
      ).length

      jlptProgressMap[level] = {
        mastered,
        total,
        pct: total > 0 ? Math.round((mastered / total) * 100) : 0,
      }
    }
  }

  // Fetch business-jp mastery progress
  const bizJpAssignments = (assignments ?? []).filter(a => a.category === 'business-jp')
  const bizJpProgressMap: Record<string, { mastered: number; total: number; pct: number }> = {}

  if (bizJpAssignments.length > 0) {
    const { data: bizMastered } = await supabase
      .from('user_mastered_items')
      .select('item_id')
      .eq('user_id', user.id)
      .eq('item_type', 'it_glossary')

    const masteredIdSet = new Set((bizMastered ?? []).map(m => m.item_id))

    const subcatDbMap: Record<string, string[]> = {
      glossary: ['business', 'it', 'dev'],
      'sentence-patterns': ['sentence_pattern'],
      expressions: ['expression'],
    }

    const neededSubcats = [...new Set(bizJpAssignments.map(a => a.subcategory))]
    for (const subcat of neededSubcats) {
      const dbCategories = subcatDbMap[subcat]
      if (!dbCategories) continue
      const { data: items } = await supabase
        .from('it_glossary')
        .select('id')
        .in('category', dbCategories)
      const total = items?.length ?? 0
      const mastered = items?.filter(i => masteredIdSet.has(i.id)).length ?? 0
      bizJpProgressMap[subcat] = {
        mastered, total,
        pct: total > 0 ? Math.round((mastered / total) * 100) : 0,
      }
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
            const requiredIds = resolvedQuizIdsMap[assignment.id] ?? assignment.required_quiz_ids ?? []
            const passedIds = new Set(assignment.passed_quiz_ids ?? [])
            const total = requiredIds.length
            const passed = passedIds.size
            const progress = total > 0 ? Math.round((passed / total) * 100) : 0

            // Reading progress (used for business-lit quiz gate)
            const readingTotal = getReadingTotalCount(assignment.category, assignment.subcategory)
            const subcatConfig = ASSIGNMENT_CATEGORIES[assignment.category]?.subcategories[assignment.subcategory]
            const readingPassed = (subcatConfig?.readingItemTypes ?? []).reduce(
              (sum: number, t: string) => sum + (masteredMap[t] ?? 0), 0
            )
            const readingProgress = readingTotal > 0 ? Math.round((readingPassed / readingTotal) * 100) : 0
            const isOverdue = assignment.status === 'overdue'
            const jlptProgress = assignment.category === 'seikatsu' && assignment.content_level
              ? jlptProgressMap[assignment.content_level] : null
            const bizJpProgress = assignment.category === 'business-jp'
              ? bizJpProgressMap[assignment.subcategory] : null
            const isQuizLocked = isOverdue
              || (assignment.category === 'business-lit' && readingTotal > 0 && readingProgress < 100)
              || (assignment.category === 'seikatsu' && (jlptProgress?.pct ?? 0) < 80)
              || (assignment.category === 'business-jp' && (bizJpProgress?.pct ?? 0) < 80)

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
                {assignment.category === 'business-lit' && readingTotal > 0 && (
                  <div className="mt-4">
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-xs text-zinc-500 dark:text-zinc-400">読了進捗: {readingPassed}/{readingTotal}</span>
                      <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">{readingProgress}%</span>
                    </div>
                    <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                      <div className="h-2 rounded-full bg-amber-500 transition-all" style={{ width: `${readingProgress}%` }} />
                    </div>
                  </div>
                )}

                {/* JLPT learning progress (seikatsu only) */}
                {assignment.category === 'seikatsu' && jlptProgress && jlptProgress.total > 0 && (
                  <div className="mt-4">
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-xs text-zinc-500 dark:text-zinc-400">学習進捗: {jlptProgress.mastered}/{jlptProgress.total}</span>
                      <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">{jlptProgress.pct}%</span>
                    </div>
                    <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                      <div className="h-2 rounded-full bg-amber-500 transition-all" style={{ width: `${jlptProgress.pct}%` }} />
                    </div>
                  </div>
                )}

                {/* Business JP learning progress */}
                {assignment.category === 'business-jp' && bizJpProgress && bizJpProgress.total > 0 && (
                  <div className="mt-4">
                    <div className="flex items-center justify-between mb-1">
                      <span className="text-xs text-zinc-500 dark:text-zinc-400">学習進捗: {bizJpProgress.mastered}/{bizJpProgress.total}</span>
                      <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">{bizJpProgress.pct}%</span>
                    </div>
                    <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                      <div className="h-2 rounded-full bg-amber-500 transition-all" style={{ width: `${bizJpProgress.pct}%` }} />
                    </div>
                  </div>
                )}

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
                      className={`h-2 rounded-full transition-all ${total > 0 && passed >= total ? 'bg-emerald-500' : 'bg-indigo-500'}`}
                      style={{ width: `${progress}%` }}
                    />
                  </div>
                </div>

                {/* Quiz list */}
                {requiredIds.length > 0 ? (
                  <div className="mt-3 space-y-1">
                    {requiredIds.map((quizId: string) => {
                      const isPassed = passedIds.has(quizId)
                      const quiz = quizMap[quizId]
                      const quizTitle = quiz?.title ?? 'クイズ'
                      const baseQuizUrl = quiz ? getQuizUrl(quiz.quiz_type, quizId, quiz.lesson_id, quiz.course_id, quiz.title) : null
                      const quizUrl = baseQuizUrl ? `${baseQuizUrl}?from=assignments` : null
                      return (
                        <div key={quizId} className="flex items-center gap-2 text-sm">
                          {isPassed ? (
                            <CheckCircle2 className="h-4 w-4 text-emerald-500 shrink-0" />
                          ) : isQuizLocked ? (
                            <Lock className="h-4 w-4 text-zinc-400 shrink-0" />
                          ) : (
                            <div className="h-4 w-4 rounded-full border-2 border-gray-300 dark:border-gray-500 shrink-0" />
                          )}
                          {isQuizLocked && !isPassed ? (
                            <span className="text-zinc-400 dark:text-zinc-500">
                              {quizTitle}
                            </span>
                          ) : quizUrl ? (
                            <Link
                              href={quizUrl}
                              className={isPassed
                                ? 'text-zinc-500 dark:text-zinc-400 line-through hover:text-indigo-500 dark:hover:text-indigo-400 transition-colors'
                                : 'text-indigo-600 dark:text-indigo-400 hover:underline'}
                            >
                              {quizTitle}
                            </Link>
                          ) : (
                            <span className={isPassed ? 'text-zinc-500 dark:text-zinc-400 line-through' : 'text-zinc-700 dark:text-zinc-300'}>
                              {quizTitle}
                            </span>
                          )}
                        </div>
                      )
                    })}
                    {isQuizLocked && (
                      <p className="mt-2 text-xs text-amber-600 dark:text-amber-400">
                        {isOverdue
                          ? '期限超過のため、テストは受けられません'
                          : assignment.category === 'seikatsu' || assignment.category === 'business-jp'
                            ? '進行率80%以上でテストが解放されます'
                            : '全項目を読了するとテストを受けられます'}
                      </p>
                    )}
                  </div>
                ) : (
                  <div className="mt-3 rounded-lg bg-amber-50 px-3 py-2 text-sm text-amber-700 dark:bg-amber-900/20 dark:text-amber-300">
                    対象テストが見つかりません。
                    <Link href={getContentUrl(assignment.category, assignment.subcategory)} className="ml-1 underline hover:text-amber-800 dark:hover:text-amber-200">
                      コンテンツページへ →
                    </Link>
                  </div>
                )}

                {/* Due date */}
                {assignment.due_date && (
                  <p className="mt-3 text-xs text-zinc-400 dark:text-zinc-500">
                    締切: {new Date(assignment.due_date).toLocaleDateString('ja-JP')}
                  </p>
                )}

              </Card>
            )
          })}
        </div>
      )}
    </div>
  )
}
