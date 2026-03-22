const fs = require('fs')
const crypto = require('crypto')
const { createClient } = require('@supabase/supabase-js')

const UNDERSTANDING_CATEGORIES = [
  'basic_theory_check_1',
  'basic_theory_check_2',
  'basic_theory_final',
  'data_structure_check_1',
  'data_structure_check_2',
  'data_structure_final',
  'algorithm_check_1',
  'algorithm_check_2',
  'algorithm_final',
  'computer_architecture_check_1',
  'computer_architecture_check_2',
  'computer_architecture_final',
  'database_check_1',
  'database_check_2',
  'database_final',
  'network_check_1',
  'network_check_2',
  'network_final',
  'os_check_1',
  'os_check_2',
  'os_final',
  'security_check_1',
  'security_check_2',
  'security_final',
]

const TRIAD_DIFFICULTIES = ['easy', 'medium', 'hard']
const GENERATED_MARKER = '[cs-understanding-triad-generated]'

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

function firstSentence(text) {
  if (!text) return ''
  const normalized = text.replace(/\s+/g, ' ').trim()
  const match = normalized.match(/^.+?[。.!?]/)
  return (match ? match[0] : normalized).trim()
}

function cleanQuestionText(text) {
  return text.replace(/\s+/g, ' ').trim()
}

function buildQuestionText(question, targetDifficulty) {
  const base = cleanQuestionText(question.question_text)
  const summary = firstSentence(question.explanation)

  if (targetDifficulty === 'easy') {
    return `${base}\n\n基本事項として最も適切なものを選べ。`
  }

  if (targetDifficulty === 'medium') {
    return `${base}\n\n前提: ${summary || '基本原理を踏まえて考える。'}\nこの前提を踏まえて最も適切なものを選べ。`
  }

  return `${base}\n\n前提: ${summary || '基本原理を踏まえて考える。'}\n実装や運用の現場でも同じ原理が成り立つとき、最も適切なものを選べ。`
}

function buildExplanation(question, targetDifficulty) {
  const base = (question.explanation || '').trim()
  const suffix =
    targetDifficulty === 'easy'
      ? 'この難易度では、まず基本用語と正しい結論を結びつけられることが重要です。'
      : targetDifficulty === 'medium'
        ? 'この難易度では、前提となる理由を踏まえて同じ結論に到達できることが重要です。'
        : 'この難易度では、前提条件と実務上の文脈を結びつけて判断できることが重要です。'

  const composed = base ? `${base}\n\n${suffix}` : suffix
  return `${composed}\n\n${GENERATED_MARKER}`
}

function buildTopicKey(question) {
  return `cs-understanding:${question.id}`
}

function isGeneratedTriadRow(question) {
  return (
    (question.explanation || '').includes(GENERATED_MARKER) ||
    question.question_text.includes('基本事項として最も適切なものを選べ。') ||
    question.question_text.includes('この前提を踏まえて最も適切なものを選べ。') ||
    question.question_text.includes('実装や運用の現場でも同じ原理が成り立つとき、最も適切なものを選べ。')
  )
}

function createGeneratedQuestion(question, targetDifficulty, nextSortOrder, hasTopicKey) {
  const generated = {
    id: crypto.randomUUID(),
    quiz_id: question.quiz_id,
    question_text: buildQuestionText(question, targetDifficulty),
    question_type: question.question_type,
    difficulty: targetDifficulty,
    question_category: question.question_category,
    question_subtype: question.question_subtype,
    explanation: buildExplanation(question, targetDifficulty),
    points: question.points ?? 1,
    sort_order: nextSortOrder,
    is_published: true,
    question_usage_scope: 'understanding_only',
    curriculum_status: question.curriculum_status ?? null,
    lesson_mapping: question.lesson_mapping ?? null,
  }

  if (hasTopicKey) {
    generated.topic_key = buildTopicKey(question)
  }

  return generated
}

async function main() {
  const env = loadEnv()
  const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY)

  const topicKeyProbe = await supabase.from('quiz_questions').select('id, topic_key').limit(1)
  const hasTopicKey = !topicKeyProbe.error

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
      is_published,
      question_usage_scope,
      curriculum_status,
      lesson_mapping,
      ${hasTopicKey ? 'topic_key,' : ''}
      quiz_question_options(id, option_text, is_correct, sort_order)
    `)
    .eq('is_published', true)
    .eq('question_usage_scope', 'understanding_only')
    .in('question_category', UNDERSTANDING_CATEGORIES)
    .order('sort_order', { ascending: true })

  if (error) throw error

  const allUnderstandingRows = rows ?? []
  const sourceRows = allUnderstandingRows.filter(row => !isGeneratedTriadRow(row))
  const generatedRowsNeedingMarker = allUnderstandingRows.filter(
    row => isGeneratedTriadRow(row) && !(row.explanation || '').includes(GENERATED_MARKER)
  )
  const quizIds = [...new Set(allUnderstandingRows.map(row => row.quiz_id))]

  const { data: allQuizRows, error: allQuizRowsError } = await supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_text, sort_order')
    .in('quiz_id', quizIds)

  if (allQuizRowsError) throw allQuizRowsError

  const existingTextKeys = new Set(
    (allQuizRows ?? []).map(row => `${row.quiz_id}::${cleanQuestionText(row.question_text)}`)
  )
  const sortOrderByQuiz = new Map()

  for (const row of allQuizRows ?? []) {
    sortOrderByQuiz.set(row.quiz_id, Math.max(sortOrderByQuiz.get(row.quiz_id) ?? 0, row.sort_order ?? 0))
  }

  for (const row of generatedRowsNeedingMarker) {
    const nextExplanation = row.explanation
      ? `${row.explanation}\n\n${GENERATED_MARKER}`
      : GENERATED_MARKER

    const { error: updateError } = await supabase
      .from('quiz_questions')
      .update({ explanation: nextExplanation })
      .eq('id', row.id)

    if (updateError) throw updateError
  }

  const questionRowsToInsert = []
  const optionRowsToInsert = []
  const topicKeyUpdates = []

  for (const question of sourceRows) {
    if (!TRIAD_DIFFICULTIES.includes(question.difficulty)) continue

    const topicKey = buildTopicKey(question)
    if (hasTopicKey && !question.topic_key) {
      topicKeyUpdates.push({ id: question.id, topic_key: topicKey })
    }

    for (const targetDifficulty of TRIAD_DIFFICULTIES) {
      if (targetDifficulty === question.difficulty) continue

      const nextSortOrder = (sortOrderByQuiz.get(question.quiz_id) ?? 0) + 1
      const generated = createGeneratedQuestion(question, targetDifficulty, nextSortOrder, hasTopicKey)
      const textKey = `${generated.quiz_id}::${cleanQuestionText(generated.question_text)}`

      if (existingTextKeys.has(textKey)) continue

      questionRowsToInsert.push(generated)
      sortOrderByQuiz.set(question.quiz_id, nextSortOrder)
      existingTextKeys.add(textKey)

      for (const option of (question.quiz_question_options ?? []).sort((a, b) => a.sort_order - b.sort_order)) {
        optionRowsToInsert.push({
          id: crypto.randomUUID(),
          question_id: generated.id,
          option_text: option.option_text,
          is_correct: option.is_correct,
          sort_order: option.sort_order,
        })
      }
    }
  }

  if (hasTopicKey) {
    for (const update of topicKeyUpdates) {
      const { error: updateError } = await supabase
        .from('quiz_questions')
        .update({ topic_key: update.topic_key })
        .eq('id', update.id)

      if (updateError) throw updateError
    }
  }

  if (questionRowsToInsert.length > 0) {
    for (let i = 0; i < questionRowsToInsert.length; i += 100) {
      const batch = questionRowsToInsert.slice(i, i + 100)
      const { error: insertError } = await supabase.from('quiz_questions').insert(batch)
      if (insertError) throw insertError
    }
  }

  if (optionRowsToInsert.length > 0) {
    for (let i = 0; i < optionRowsToInsert.length; i += 200) {
      const batch = optionRowsToInsert.slice(i, i + 200)
      const { error: insertError } = await supabase.from('quiz_question_options').insert(batch)
      if (insertError) throw insertError
    }
  }

  const { count, error: countError } = await supabase
    .from('quiz_questions')
    .select('id', { count: 'exact', head: true })
    .eq('is_published', true)
    .eq('question_usage_scope', 'understanding_only')
    .in('question_category', UNDERSTANDING_CATEGORIES)

  if (countError) throw countError

  console.log(
    JSON.stringify(
      {
        hasTopicKey,
        generatedRowsMarked: generatedRowsNeedingMarker.length,
        sourceCount: sourceRows.length,
        insertedQuestions: questionRowsToInsert.length,
        insertedOptions: optionRowsToInsert.length,
        finalUnderstandingCount: count ?? 0,
      },
      null,
      2
    )
  )
}

main().catch(error => {
  console.error(JSON.stringify(error, null, 2))
  process.exit(1)
})
