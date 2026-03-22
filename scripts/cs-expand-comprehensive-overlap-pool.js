const fs = require('fs')
const crypto = require('crypto')
const { createClient } = require('@supabase/supabase-js')

const TARGET_COUNTS = {
  os: 80,
  network: 42,
  computer_architecture: 42,
  data_structure: 48,
  security: 48,
}

const DIFFICULTY_TARGETS = {
  os: { easy: 28, medium: 28, hard: 24 },
  network: { easy: 14, medium: 14, hard: 14 },
  computer_architecture: { easy: 14, medium: 14, hard: 14 },
  data_structure: { easy: 16, medium: 16, hard: 16 },
  security: { easy: 16, medium: 16, hard: 16 },
}

const GENERATED_MARKER = '[cs-comprehensive-overlap-generated]'

const CATEGORY_SCENARIO_PREFIXES = {
  os: [
    '次のOS運用場面を想定するとき、',
    '次のシステム障害対応の文脈で、',
    '次のプロセス管理の状況で、',
    '次のメモリ管理の観点から、',
  ],
  network: [
    '次のネットワーク運用場面を想定するとき、',
    '次の通信障害の切り分けで、',
    '次のパケット転送の文脈で、',
    '次のプロトコル設計の観点から、',
  ],
  data_structure: [
    '次のデータ構造選定の場面で、',
    '次の探索・更新処理の文脈で、',
    '次の格納方式の観点から、',
    '次の性能要件を満たすとき、',
  ],
  computer_architecture: [
    '次のハードウェア設計の場面で、',
    '次のCPU動作の文脈で、',
    '次の性能評価の観点から、',
    '次の命令実行の状況で、',
  ],
  security: [
    '次のセキュリティ運用の場面で、',
    '次の脅威対策の文脈で、',
    '次の認証・認可設計の観点から、',
    '次のインシデント対応の状況で、',
  ],
}

const DIFFICULTY_SUFFIX = {
  easy: '基本事項として最も適切なものを選べ。',
  medium: '前提条件を踏まえて最も適切なものを選べ。',
  hard: '実装や運用上の含意まで含めて最も適切なものを選べ。',
}

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

function buildQuestionText(question, targetDifficulty, variantIndex) {
  const prefixes = CATEGORY_SCENARIO_PREFIXES[question.question_category] ?? ['次の状況で、']
  const prefix = prefixes[variantIndex % prefixes.length]
  const stem = cleanText(question.question_text)
  return `${prefix}${stem}\n\n${DIFFICULTY_SUFFIX[targetDifficulty]}`
}

function buildExplanation(question, targetDifficulty) {
  const base = (question.explanation || '').trim()
  const focus =
    targetDifficulty === 'easy'
      ? '基礎知識として正しい結論を押さえることが重要です。'
      : targetDifficulty === 'medium'
        ? '前提条件と因果関係を結びつけて判断できることが重要です。'
        : '実務上のトレードオフや影響範囲まで踏まえて判断できることが重要です。'

  return `${base}\n\n${focus}\n\n${GENERATED_MARKER}`.trim()
}

function buildGeneratedRow(question, targetDifficulty, sortOrder, variantIndex) {
  return {
    id: crypto.randomUUID(),
    quiz_id: question.quiz_id,
    question_text: buildQuestionText(question, targetDifficulty, variantIndex),
    question_type: question.question_type,
    difficulty: targetDifficulty,
    question_category: question.question_category,
    question_subtype: question.question_subtype,
    explanation: buildExplanation(question, targetDifficulty),
    points: question.points ?? 1,
    sort_order: sortOrder,
    is_published: true,
    question_usage_scope: 'comprehensive_only',
    curriculum_status: question.curriculum_status ?? null,
    lesson_mapping: question.lesson_mapping ?? null,
  }
}

async function main() {
  const env = loadEnv()
  const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY)
  const targetCategories = Object.keys(TARGET_COUNTS)

  const { data: quizzes, error: quizError } = await supabase
    .from('quizzes')
    .select('id')
    .eq('quiz_type', 'cs_knowledge')

  if (quizError) throw quizError
  const csQuizIds = (quizzes ?? []).map(quiz => quiz.id)

  const { data: allCsRows, error: allCsRowsError } = await supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_text, question_category, question_usage_scope, sort_order')
    .eq('is_published', true)
    .in('quiz_id', csQuizIds)
    .order('sort_order', { ascending: true })

  if (allCsRowsError) throw allCsRowsError

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
      question_usage_scope,
      curriculum_status,
      lesson_mapping,
      quiz_question_options(id, option_text, is_correct, sort_order)
    `)
    .eq('is_published', true)
    .eq('question_usage_scope', 'comprehensive_only')
    .in('question_category', targetCategories)
    .order('sort_order', { ascending: true })

  if (error) throw error

  const sourceRows = (rows ?? []).filter(row => !(row.explanation || '').includes(GENERATED_MARKER))
  const allRows = rows ?? []

  const seenTextKeys = new Set(allRows.map(row => `${row.quiz_id}::${cleanText(row.question_text)}`))
  const sortOrderByQuiz = new Map()
  for (const row of allRows) {
    sortOrderByQuiz.set(row.quiz_id, Math.max(sortOrderByQuiz.get(row.quiz_id) ?? 0, row.sort_order ?? 0))
  }

  const dedupedEffectiveCompCountByCategory = Object.fromEntries(
    targetCategories.map(category => {
      const seen = new Set()
      let count = 0
      for (const row of allCsRows ?? []) {
        const key = cleanText(row.question_text)
        if (seen.has(key)) continue
        seen.add(key)
        if (row.question_category !== category) continue
        if (row.question_usage_scope !== 'comprehensive_only') continue
        count += 1
      }
      return [category, count]
    })
  )

  const generatedQuestions = []
  const generatedOptions = []

  for (const category of targetCategories) {
    const currentCount = dedupedEffectiveCompCountByCategory[category] ?? 0
    const needed = Math.max(0, TARGET_COUNTS[category] - currentCount)
    if (needed === 0) continue

    const categorySource = sourceRows.filter(row => row.question_category === category)
    if (categorySource.length === 0) continue

    const currentByDifficulty = {
      easy: allRows.filter(row => row.question_category === category && row.difficulty === 'easy').length,
      medium: allRows.filter(row => row.question_category === category && row.difficulty === 'medium').length,
      hard: allRows.filter(row => row.question_category === category && row.difficulty === 'hard').length,
    }

    const difficultyQueue = []
    for (const difficulty of ['easy', 'medium', 'hard']) {
      const target = DIFFICULTY_TARGETS[category][difficulty]
      const missing = Math.max(0, target - currentByDifficulty[difficulty])
      for (let i = 0; i < missing; i++) difficultyQueue.push(difficulty)
    }
    while (difficultyQueue.length < needed) {
      difficultyQueue.push('hard', 'medium', 'easy')
    }

    for (let i = 0; i < needed; i++) {
      const template = categorySource[i % categorySource.length]
      const targetDifficulty = difficultyQueue[i]
      let variantIndex = i
      let generated = null

      while (!generated) {
        const candidate = buildGeneratedRow(
          template,
          targetDifficulty,
          (sortOrderByQuiz.get(template.quiz_id) ?? 0) + 1,
          variantIndex
        )
        const textKey = `${candidate.quiz_id}::${cleanText(candidate.question_text)}`
        if (!seenTextKeys.has(textKey)) {
          generated = candidate
          seenTextKeys.add(textKey)
          sortOrderByQuiz.set(template.quiz_id, candidate.sort_order)
          break
        }
        variantIndex += 1
      }

      generatedQuestions.push(generated)
      for (const option of (template.quiz_question_options ?? []).sort((a, b) => a.sort_order - b.sort_order)) {
        generatedOptions.push({
          id: crypto.randomUUID(),
          question_id: generated.id,
          option_text: option.option_text,
          is_correct: option.is_correct,
          sort_order: option.sort_order,
        })
      }
    }
  }

  for (let i = 0; i < generatedQuestions.length; i += 100) {
    const batch = generatedQuestions.slice(i, i + 100)
    if (batch.length === 0) continue
    const { error: insertError } = await supabase.from('quiz_questions').insert(batch)
    if (insertError) throw insertError
  }

  for (let i = 0; i < generatedOptions.length; i += 200) {
    const batch = generatedOptions.slice(i, i + 200)
    if (batch.length === 0) continue
    const { error: insertError } = await supabase.from('quiz_question_options').insert(batch)
    if (insertError) throw insertError
  }

  console.log(
    JSON.stringify(
      {
        insertedQuestions: generatedQuestions.length,
        insertedOptions: generatedOptions.length,
        targets: TARGET_COUNTS,
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
