'use server'

import { requireAdmin } from '@/lib/auth-helpers'
import { TABLE_CONFIGS, QUIZ_TYPE_GROUPS, COURSE_CATEGORY_GROUPS } from '@/lib/backup-config'

function buildCsv(headers: string[], data: Record<string, unknown>[]): string {
  const headerRow = headers.join(',')
  const rows = data.map(row =>
    headers.map(h => {
      const val = row[h]
      if (val === null || val === undefined) return ''
      let str = String(val).replace(/"/g, '""')
      // Excel/Sheets evaluate cells starting with = + - @ or tab/CR as formulas;
      // user-authored content (shared_vocab, profiles) flows into this export.
      if (/^[=+\-@\t\r]/.test(str)) str = `'${str}`
      return `"${str}"`
    }).join(',')
  )
  return [headerRow, ...rows].join('\n')
}

export async function exportTableCsv(tableName: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { csv: '' }

  const config = TABLE_CONFIGS[tableName]
  if (!config) return { csv: '' }

  const { supabase } = auth
  const columns = config.columns

  const { data } = await supabase
    .from(tableName)
    .select(columns)
    .order('created_at', { ascending: false })
    .limit(10000)

  if (!data || data.length === 0) return { csv: '' }

  const headers = columns.split(',').map(c => c.trim())
  return { csv: buildCsv(headers, data as unknown as Record<string, unknown>[]) }
}

export async function exportQuizQuestionsCsv(groupKey: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { questionsCsv: '', optionsCsv: '' }

  const qtGroup = QUIZ_TYPE_GROUPS[groupKey]
  if (!qtGroup) return { questionsCsv: '', optionsCsv: '' }

  const { supabase } = auth

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('id')
    .in('quiz_type', qtGroup.quizTypes)

  if (!quizzes?.length) return { questionsCsv: '', optionsCsv: '' }
  const quizIds = quizzes.map(q => q.id as string)

  const allQuestions: Record<string, unknown>[] = []
  for (let i = 0; i < quizIds.length; i += 10) {
    const batch = quizIds.slice(i, i + 10)
    const { data } = await supabase
      .from('quiz_questions')
      .select('id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published')
      .in('quiz_id', batch)
      .limit(10000)
    if (data) allQuestions.push(...(data as unknown as Record<string, unknown>[]))
  }

  if (!allQuestions.length) return { questionsCsv: '', optionsCsv: '' }

  const questionIds = allQuestions.map(q => q.id as string)

  const allOptions: Record<string, unknown>[] = []
  for (let i = 0; i < questionIds.length; i += 50) {
    const batch = questionIds.slice(i, i + 50)
    const { data } = await supabase
      .from('quiz_question_options')
      .select('id, question_id, option_text, is_correct, sort_order')
      .in('question_id', batch)
      .limit(10000)
    if (data) allOptions.push(...(data as unknown as Record<string, unknown>[]))
  }

  const qHeaders = ['id', 'quiz_id', 'question_type', 'question_text', 'explanation', 'points', 'sort_order', 'difficulty', 'question_category', 'is_published']
  const oHeaders = ['id', 'question_id', 'option_text', 'is_correct', 'sort_order']

  return {
    questionsCsv: buildCsv(qHeaders, allQuestions),
    optionsCsv: allOptions.length ? buildCsv(oHeaders, allOptions) : '',
  }
}

export async function exportCoursesCsv(groupKey: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { coursesCsv: '', lessonsCsv: '' }

  const ccGroup = COURSE_CATEGORY_GROUPS[groupKey]
  if (!ccGroup) return { coursesCsv: '', lessonsCsv: '' }

  const { supabase } = auth

  const { data: courses } = await supabase
    .from('courses')
    .select('id, title, description, category, subcategory, difficulty, is_published, sort_order, created_at')
    .in('category', ccGroup.categories)
    .order('created_at', { ascending: false })
    .limit(10000)

  if (!courses?.length) return { coursesCsv: '', lessonsCsv: '' }

  const courseIds = courses.map(c => (c as unknown as Record<string, unknown>).id as string)

  const allLessons: Record<string, unknown>[] = []
  for (let i = 0; i < courseIds.length; i += 10) {
    const batch = courseIds.slice(i, i + 10)
    const { data } = await supabase
      .from('lessons')
      .select('id, course_id, title, content_type, duration_minutes, sort_order, created_at')
      .in('course_id', batch)
      .order('sort_order', { ascending: true })
      .limit(10000)
    if (data) allLessons.push(...(data as unknown as Record<string, unknown>[]))
  }

  const cHeaders = ['id', 'title', 'description', 'category', 'subcategory', 'difficulty', 'is_published', 'sort_order', 'created_at']
  const lHeaders = ['id', 'course_id', 'title', 'content_type', 'duration_minutes', 'sort_order', 'created_at']

  return {
    coursesCsv: buildCsv(cHeaders, courses as unknown as Record<string, unknown>[]),
    lessonsCsv: allLessons.length ? buildCsv(lHeaders, allLessons) : '',
  }
}
