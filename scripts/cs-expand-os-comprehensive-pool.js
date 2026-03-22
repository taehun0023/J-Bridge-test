const fs = require('fs')
const crypto = require('crypto')
const { createClient } = require('@supabase/supabase-js')

const INSERT_COUNT = 24
const GENERATED_MARKER = '[cs-os-comprehensive-generated]'
const DIFFICULTY_SEQUENCE = [
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
  'easy', 'medium', 'hard',
]

const OS_SCENARIO_PREFIXES = [
  'OS運用ケース01',
  'OS運用ケース02',
  'OS運用ケース03',
  'OS運用ケース04',
  'OS運用ケース05',
  'OS運用ケース06',
  'OS運用ケース07',
  'OS運用ケース08',
  'OS運용ケース09',
  'OS運용ケース10',
  'OS運용ケース11',
  'OS運용ケース12',
  'OS運용ケース13',
  'OS運용ケース14',
  'OS運용ケース15',
  'OS運用ケース16',
  'OS運用ケース17',
  'OS運用ケース18',
  'OS運用ケース19',
  'OS運用ケース20',
  'OS運用ケース21',
  'OS運用ケース22',
  'OS運用ケース23',
  'OS運用ケース24',
]

function loadEnv() {
  const raw = fs.readFileSync('.env.local', 'utf8')
  return raw
    .split(/\r?\n/)
    .filter(Boolean)
    .reduce((acc, line) => {
      const index = line.indexOf('=')
      if (index > 0) acc[line.slice(0, index)] = line.slice(index + 1)
      return acc
    }, {})
}

function cleanText(text) {
  return text.replace(/\s+/g, ' ').trim()
}

function buildQuestionText(question, difficulty, index) {
  const prefix = OS_SCENARIO_PREFIXES[index] ?? `OS運用ケース${String(index + 1).padStart(2, '0')}`
  const stem = cleanText(question.question_text)
  const suffix =
    difficulty === 'easy'
      ? '基本事項として最も適切なものを選べ。'
      : difficulty === 'medium'
        ? '原因と結果の関係を踏まえて最も適切なものを選べ。'
        : '実運用上の影響まで踏まえて最も適切なものを選べ。'

  return `${prefix}: ${stem}\n\n${suffix}`
}

function buildExplanation(question, difficulty) {
  const base = (question.explanation || '').trim()
  const suffix =
    difficulty === 'easy'
      ? 'この問題ではOSの基本概念を正確に結びつけられることが重要です。'
      : difficulty === 'medium'
        ? 'この問題ではOS内部の動作理由まで説明できることが重要です。'
        : 'この問題では運用時の副作用やトレードオフまで考慮できることが重要です。'

  return `${base}\n\n${suffix}\n\n${GENERATED_MARKER}`.trim()
}

async function main() {
  const env = loadEnv()
  const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY)

  const { data: rows, error } = await supabase
    .from('quiz_questions')
    .select(`
      id,
      quiz_id,
      question_text,
      question_type,
      difficulty,
      question_category,
      question_subtype,
      explanation,
      points,
      sort_order,
      curriculum_status,
      lesson_mapping,
      quiz_question_options(id, option_text, is_correct, sort_order)
    `)
    .eq('is_published', true)
    .eq('question_usage_scope', 'comprehensive_only')
    .eq('question_category', 'os')
    .order('sort_order', { ascending: true })

  if (error) throw error

  const sourceRows = (rows ?? []).filter(row => !(row.explanation || '').includes(GENERATED_MARKER))
  if (sourceRows.length === 0) {
    throw new Error('No OS comprehensive source questions available')
  }

  const sortOrderByQuiz = new Map()
  for (const row of rows ?? []) {
    sortOrderByQuiz.set(row.quiz_id, Math.max(sortOrderByQuiz.get(row.quiz_id) ?? 0, row.sort_order ?? 0))
  }

  const questionsToInsert = []
  const optionsToInsert = []

  for (let i = 0; i < INSERT_COUNT; i++) {
    const template = sourceRows[i % sourceRows.length]
    const difficulty = DIFFICULTY_SEQUENCE[i] ?? 'medium'
    const nextSortOrder = (sortOrderByQuiz.get(template.quiz_id) ?? 0) + 1
    sortOrderByQuiz.set(template.quiz_id, nextSortOrder)

    const questionId = crypto.randomUUID()
    questionsToInsert.push({
      id: questionId,
      quiz_id: template.quiz_id,
      question_text: buildQuestionText(template, difficulty, i),
      question_type: template.question_type,
      difficulty,
      question_category: 'os',
      question_subtype: template.question_subtype,
      explanation: buildExplanation(template, difficulty),
      points: template.points ?? 1,
      sort_order: nextSortOrder,
      is_published: true,
      question_usage_scope: 'comprehensive_only',
      curriculum_status: template.curriculum_status ?? null,
      lesson_mapping: template.lesson_mapping ?? null,
    })

    for (const option of (template.quiz_question_options ?? []).sort((a, b) => a.sort_order - b.sort_order)) {
      optionsToInsert.push({
        id: crypto.randomUUID(),
        question_id: questionId,
        option_text: option.option_text,
        is_correct: option.is_correct,
        sort_order: option.sort_order,
      })
    }
  }

  const { error: questionInsertError } = await supabase.from('quiz_questions').insert(questionsToInsert)
  if (questionInsertError) throw questionInsertError

  const { error: optionInsertError } = await supabase.from('quiz_question_options').insert(optionsToInsert)
  if (optionInsertError) throw optionInsertError

  console.log(JSON.stringify({
    insertedQuestions: questionsToInsert.length,
    insertedOptions: optionsToInsert.length,
  }, null, 2))
}

main().catch(error => {
  console.error(JSON.stringify(error, null, 2))
  process.exit(1)
})
