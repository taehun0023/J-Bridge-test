/**
 * 청해/독해 보기 길이 밸런스 감사 (읽기 전용)
 *
 * 종합시험 Step1 출제 풀(마스터 퀴즈 a0000001 + jlpt_reading/jlpt_listening 풀)에서
 * question_category가 reading/listening인 문제를 전수 조회하여
 * "정답 보기가 유일하게 가장 길다" 패턴을 탐지한다.
 *
 * 실행: node scripts/audit-option-balance.mjs
 * 출력: scripts/option-balance-report.json
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

// .env.local 파싱 (dotenv 미설치 환경 대응)
const env = {}
for (const line of readFileSync('.env.local', 'utf8').split(/\r?\n/)) {
  const m = line.match(/^([A-Za-z0-9_]+)\s*=\s*(.*)$/)
  if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '')
}

const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('NEXT_PUBLIC_SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY not found in .env.local')
  process.exit(1)
}
const supabase = createClient(url, key)

const MASTER_QUIZ_ID = 'a0000001-0000-0000-0000-000000000001'

// 1. 대상 퀴즈 수집
const { data: poolQuizzes, error: quizErr } = await supabase
  .from('quizzes')
  .select('id, title, quiz_type')
  .in('quiz_type', ['jlpt_reading', 'jlpt_listening'])
if (quizErr) { console.error(quizErr); process.exit(1) }

const quizIds = [MASTER_QUIZ_ID, ...poolQuizzes.map(q => q.id)]
console.log(`Target quizzes: ${quizIds.length} (master + ${poolQuizzes.length} pools)`)

// 2. 문제 전수 조회 (페이지네이션)
let questions = []
for (let offset = 0; ; offset += 1000) {
  const { data, error } = await supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_category, difficulty, question_text, is_published')
    .in('quiz_id', quizIds)
    .in('question_category', ['reading', 'listening'])
    .eq('is_published', true)
    .range(offset, offset + 999)
  if (error) { console.error(error); process.exit(1) }
  questions = questions.concat(data ?? [])
  if (!data || data.length < 1000) break
}
console.log(`Questions (reading/listening, published): ${questions.length}`)

// 3. 옵션 조회 (배치)
const optionsByQ = new Map()
const qIds = questions.map(q => q.id)
for (let i = 0; i < qIds.length; i += 100) {
  const batch = qIds.slice(i, i + 100)
  const { data, error } = await supabase
    .from('quiz_question_options')
    .select('id, question_id, option_text, is_correct, sort_order')
    .in('question_id', batch)
  if (error) { console.error(error); process.exit(1) }
  for (const o of data ?? []) {
    if (!optionsByQ.has(o.question_id)) optionsByQ.set(o.question_id, [])
    optionsByQ.get(o.question_id).push(o)
  }
}

// 4. 길이 분석: 정답이 "유일 최장"인 문제 탐지
const len = s => [...(s ?? '')].length // 코드포인트 기준
const offenders = []
let stats = { total: 0, correctLongest: 0, byMargin: { m1_2: 0, m3_5: 0, m6plus: 0 } }

for (const q of questions) {
  const opts = (optionsByQ.get(q.id) ?? []).sort((a, b) => a.sort_order - b.sort_order)
  const correct = opts.filter(o => o.is_correct)
  const wrong = opts.filter(o => !o.is_correct)
  if (correct.length !== 1 || wrong.length < 2) continue
  stats.total++

  const cLen = len(correct[0].option_text)
  const maxWrong = Math.max(...wrong.map(o => len(o.option_text)))
  const margin = cLen - maxWrong

  if (margin > 0) {
    stats.correctLongest++
    if (margin <= 2) stats.byMargin.m1_2++
    else if (margin <= 5) stats.byMargin.m3_5++
    else stats.byMargin.m6plus++

    offenders.push({
      question_id: q.id,
      quiz_id: q.quiz_id,
      is_master: q.quiz_id === MASTER_QUIZ_ID,
      category: q.question_category,
      difficulty: q.difficulty,
      margin,
      correct_len: cLen,
      question_text: q.question_text,
      options: opts.map(o => ({
        id: o.id,
        text: o.option_text,
        len: len(o.option_text),
        is_correct: o.is_correct,
      })),
    })
  }
}

offenders.sort((a, b) => b.margin - a.margin)
writeFileSync('scripts/option-balance-report.json', JSON.stringify({ stats, offenders }, null, 2), 'utf8')

console.log('--- 결과 ---')
console.log(`분석 대상(정답1+오답2 이상): ${stats.total}`)
console.log(`정답=유일 최장: ${stats.correctLongest} (margin 1-2자: ${stats.byMargin.m1_2}, 3-5자: ${stats.byMargin.m3_5}, 6자+: ${stats.byMargin.m6plus})`)
const byCat = {}
for (const o of offenders) byCat[o.category] = (byCat[o.category] ?? 0) + 1
console.log('카테고리별:', JSON.stringify(byCat))
console.log('리포트: scripts/option-balance-report.json')
