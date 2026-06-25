'use server'

import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { ERR } from '@/lib/action-types'
import { getReadingTotalCount } from '@/lib/assignment-categories'
import { resolveQuizIdsForAssignment } from '@/app/actions/learning-assignments'
import { getReportItemProgress } from '@/app/actions/item-assignments'
import { isItemCategory, areaSpec } from '@/lib/item-assignments'

export interface ExamScorePoint {
  examId: string
  category: string
  categoryLabel: string
  score: number
  completedAt: string
}

export interface ExamErrorRate {
  examId: string
  examCategory: string
  completedAt: string
  categories: {
    questionCategory: string
    label: string
    totalAnswered: number
    incorrectCount: number
    errorRate: number
  }[]
}

const EXAM_CATEGORY_GROUPS = {
  nihongo: ['jlpt-mock', 'seikatsu', 'business-jp'],
  kaihatsu: ['cs', 'dev'],
  'business-lit': ['business-lit'],
} as const


const categoryLabels: Record<string, string> = {
  'jlpt-mock': 'JLPT模試',
  seikatsu: 'JLPT',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  'business-lit': 'ビジネスリテラシー',
  vocab: '語彙',
  grammar: '文法',
  reading: '読解',
  listening: '聴解',
  fill_blank: '穴埋め',
  algorithm: 'アルゴリズム',
  data_structure: 'データ構造',
  os: 'OS',
  network: 'ネットワーク',
  java: 'Java',
  spring_boot: 'Spring Boot',
  javascript: 'JavaScript',
  react: 'React',
  sql: 'SQL',
  cwf: '共通業務基礎',
  python: 'Python',
  nextjs: 'Next.js',
  vocabulary: '語彙(ビジネス)',
  sentence_pattern: '文型(ビジネス)',
  business_expression: 'ビジネス表現',
  keigo: '敬語',
  basic_theory: '基本理論',
  database: 'データベース',
  security: 'セキュリティ',
  business_manner: 'ビジネスマナー',
  communication: 'コミュニケーション',
  cross_culture: '異文化理解',
}

/**
 * Verify that the requesting user (mentor) has a mentor_mentee_assignment for the target user.
 * Admin users skip this check.
 */
async function verifyMentorAccess(
  mentorId: string,
  menteeId: string,
  role: string,
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>
): Promise<boolean> {
  if (role === 'admin') return true

  const { data } = await serviceClient
    .from('mentor_mentee_assignments')
    .select('id')
    .eq('mentor_id', mentorId)
    .eq('mentee_id', menteeId)
    .limit(1)
    .maybeSingle()

  return !!data
}

export interface MockPartStat { label: string; total: number; pass: number; correct: number }
export interface MockWrongQ {
  setLabel: string       // 例: N1 模試1
  attemptNo: number      // 회차 번호(1=최초, 2=재시험…)
  attemptLabel: string   // 例: 第1回
  part: string
  number: number
  question: string
  options: { text: string; correct: boolean; selected: boolean }[]
  answered: boolean
}
export interface MockAttemptReport { level: string; setNo: number; setTitle: string; setLabel: string; attemptNo: number; attemptLabel: string; ts: string; score: number | null; passed: boolean | null; parts: MockPartStat[] }
export interface MockExamReport {
  hasData: boolean
  attempts: MockAttemptReport[]
  overall: MockPartStat[]
  attemptCount: number
  wrong: MockWrongQ[]
}

const MOCK_GROUP_ORDER = ['文字', '語彙', '文法', '読解', '聴解'] as const
const SUBTYPE_GROUP: Record<string, string> = {
  KANJI_READING: '文字',
  CONTEXT_WORD: '語彙', PARAPHRASE: '語彙', WORD_USAGE: '語彙',
  GRAMMAR_CHOICE: '文法', SENTENCE_ORDER: '文法', TEXT_GRAMMAR: '文法',
  SHORT_READING: '読解', MEDIUM_READING: '読解', LONG_READING: '読解', INTEGRATED_READING: '読解', INFORMATION_SEARCH: '読解', OPINION_READING: '読解',
  LISTENING_TASK: '聴解', LISTENING_POINT: '聴解', LISTENING_SUMMARY: '聴解', LISTENING_QUICK_RESPONSE: '聴解', LISTENING_INTEGRATED: '聴解',
}
const sectionGroup = (s: string | null) => s === 'dokkai' ? '読解' : s === 'choukai' ? '聴解' : '語彙'

/** 멘티의 JLPT 모의고사 결과: 회차별(模試1/2/3) 파트(文字/語彙/文法/読解/聴解) 그래프(전체문항·합격선·정답수, 미응답=오답) + 종합 + 틀린 문항. */
export async function getMockExamReport(menteeId: string): Promise<MockExamReport> {
  const empty: MockExamReport = { hasData: false, attempts: [], overall: [], attemptCount: 0, wrong: [] }
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return empty
  const service = createServiceRoleClient()
  if (!service) return empty
  if (!(await verifyMentorAccess(auth.user.id, menteeId, auth.profile.role, service))) return empty

  const { data: exams } = await service.from('comprehensive_exams')
    .select('id, content_level, mock_set_no, mock_session, score, passed, completed_at, requested_at')
    .eq('user_id', menteeId).eq('category', 'jlpt-mock').in('status', ['completed', 'failed'])
    .order('mock_set_no', { ascending: true }).order('completed_at', { ascending: true })
  if (!exams?.length) return empty
  const examIds = exams.map(e => e.id)

  // 독립적인 3 fetch를 병렬로: 세트 타이틀 + 전체 출제문항(미응답 포함) + 답안
  const fetchExamQs = (async () => {
    const rows: { exam_id: string; question_id: string; section: string | null; sort_order: number | null }[] = []
    for (let i = 0; i < examIds.length; i += 50) {
      const { data } = await service.from('comprehensive_exam_questions')
        .select('exam_id, question_id, section, sort_order').in('exam_id', examIds.slice(i, i + 50))
      for (const r of data ?? []) rows.push(r)
    }
    return rows
  })()
  const [{ data: mockSetRows }, examQs, { data: answers }] = await Promise.all([
    service.from('jlpt_mock_sets').select('level, set_no, title')
      .in('level', [...new Set(exams.map(e => e.content_level ?? 'N1'))]),
    fetchExamQs,
    service.from('comprehensive_exam_answers')
      .select('exam_id, question_id, is_correct, selected_option_id').in('exam_id', examIds),
  ])
  const setTitleByKey = new Map<string, string>()
  for (const s of mockSetRows ?? []) setTitleByKey.set(`${s.level}::${s.set_no}`, (s.title ?? '').replace(/^N[1-5]\s*/, ''))

  const correctKey = new Set<string>()
  const selectedByKey = new Map<string, string | null>()
  for (const a of answers ?? []) {
    if (a.is_correct) correctKey.add(`${a.exam_id}:${a.question_id}`)
    selectedByKey.set(`${a.exam_id}:${a.question_id}`, a.selected_option_id)
  }

  const qids = [...new Set(examQs.map(q => q.question_id))]
  const qMeta = new Map<string, { subtype: string; text: string }>()
  for (let i = 0; i < qids.length; i += 500) {
    const { data: qs } = await service.from('quiz_questions').select('id, question_subtype, question_text').in('id', qids.slice(i, i + 500))
    for (const q of qs ?? []) qMeta.set(q.id, { subtype: q.question_subtype ?? '', text: q.question_text ?? '' })
  }
  const groupOf = (qid: string, section: string | null) => SUBTYPE_GROUP[qMeta.get(qid)?.subtype ?? ''] ?? sectionGroup(section)
  const PASS = 0.7

  // 회차별 파트 집계
  const byExam = new Map<string, Map<string, { total: number; correct: number }>>()
  for (const q of examQs) {
    if (!byExam.has(q.exam_id)) byExam.set(q.exam_id, new Map())
    const pm = byExam.get(q.exam_id)!
    const g = groupOf(q.question_id, q.section)
    const v = pm.get(g) ?? { total: 0, correct: 0 }
    v.total++; if (correctKey.has(`${q.exam_id}:${q.question_id}`)) v.correct++
    pm.set(g, v)
  }
  const toParts = (pm: Map<string, { total: number; correct: number }>): MockPartStat[] =>
    MOCK_GROUP_ORDER.filter(g => pm.has(g)).map(g => {
      const v = pm.get(g)!
      return { label: g, total: v.total, pass: Math.ceil(v.total * PASS), correct: v.correct }
    })

  // 회차(attempt) 번호 — 세트별로 requested_at 순회, 세션1(또는 단일세션=null)이 새 회차 시작, 세션2는 직전 회차에 합류
  const examMeta = new Map(exams.map(e => [e.id, e]))
  const attemptNoByExam = new Map<string, number>()
  {
    const bySetSorted = new Map<string, typeof exams>()
    for (const e of [...exams].sort((a, b) => (a.requested_at ?? '').localeCompare(b.requested_at ?? ''))) {
      if (!byExam.has(e.id)) continue
      const sk = `${e.content_level ?? 'N1'}::${e.mock_set_no ?? '?'}`
      if (!bySetSorted.has(sk)) bySetSorted.set(sk, [])
      bySetSorted.get(sk)!.push(e)
    }
    for (const [, list] of bySetSorted) {
      let no = 0
      for (const e of list) {
        if (e.mock_session === 1 || e.mock_session == null) no++
        if (no === 0) no = 1
        attemptNoByExam.set(e.id, no)
      }
    }
  }

  // 회차(세트·회차) 단위 집계 — 같은 회차의 세션들은 합산(파트 겹침 없음). 재시험은 별도 회차로 분리.
  // 합/불 판정은 최종 판정 행(2교시 합산 또는 단일세션=null)에서만.
  const byAttempt = new Map<string, { level: string; setNo: number; attemptNo: number; ts: string; final: { passed: boolean | null; score: number | null } | null; partMap: Map<string, { total: number; correct: number }> }>()
  for (const e of exams) {
    const pm = byExam.get(e.id); if (!pm) continue
    const no = attemptNoByExam.get(e.id) ?? 1
    const level = e.content_level ?? 'N1'
    const setNo = e.mock_set_no ?? 0
    const key = `${level}::${setNo}::${no}`
    let g = byAttempt.get(key)
    if (!g) { g = { level, setNo, attemptNo: no, ts: '', final: null, partMap: new Map() }; byAttempt.set(key, g) }
    const t = e.completed_at ?? e.requested_at ?? ''
    if (t > g.ts) g.ts = t // 회차 내 가장 최근 시각 (정렬용)
    for (const [grp, v] of pm) {
      const cur = g.partMap.get(grp) ?? { total: 0, correct: 0 }
      cur.total += v.total; cur.correct += v.correct; g.partMap.set(grp, cur)
    }
    if (e.mock_session == null || e.mock_session === 2) g.final = { passed: e.passed, score: e.score }
  }
  const attempts: MockAttemptReport[] = [...byAttempt.values()].map(g => ({
    level: g.level,
    setNo: g.setNo,
    setTitle: setTitleByKey.get(`${g.level}::${g.setNo}`) ?? `模擬試験 ${g.setNo}`,
    setLabel: `${g.level} 模試${g.setNo}`,
    attemptNo: g.attemptNo,
    attemptLabel: `第${g.attemptNo}回`,
    ts: g.ts,
    score: g.final?.score ?? null,
    passed: g.final ? g.final.passed : null,
    parts: toParts(g.partMap),
  }))

  const overallMap = new Map<string, { total: number; correct: number }>()
  for (const g of byAttempt.values()) {
    for (const [grp, v] of g.partMap) {
      const o = overallMap.get(grp) ?? { total: 0, correct: 0 }
      o.total += v.total; o.correct += v.correct; overallMap.set(grp, o)
    }
  }
  const overall = toParts(overallMap)

  // 응시한 모든 인스턴스의 틀린(미응답 포함) 문항 — 세트·회차·파트 태그 포함
  const stripHtml = (s: string) => s.replace(/<[^>]*>/g, ' ').replace(/&nbsp;/gi, ' ').replace(/&[a-z]+;/gi, ' ').replace(/\s+/g, ' ').trim()
  // 지문(読解)은 줄바꿈을 보존해야 가독성↑ — 태그만 제거하고 개행은 유지
  const stripText = (s: string) => s
    .replace(/<br\s*\/?>/gi, '\n').replace(/<\/p>/gi, '\n').replace(/<[^>]*>/g, ' ')
    .replace(/&nbsp;/gi, ' ').replace(/&[a-z]+;/gi, ' ')
    .replace(/[ \t]+/g, ' ').replace(/\n{3,}/g, '\n\n').replace(/ *\n */g, '\n').trim()
  const wrongQs = examQs.filter(q => !correctKey.has(`${q.exam_id}:${q.question_id}`))
  const wQids = [...new Set(wrongQs.map(q => q.question_id))]
  const optionsByQ = new Map<string, { id: string; text: string; correct: boolean }[]>()
  for (let i = 0; i < wQids.length; i += 500) {
    const { data: opts } = await service.from('quiz_question_options').select('id, question_id, option_text, is_correct').in('question_id', wQids.slice(i, i + 500))
    for (const o of opts ?? []) {
      if (!optionsByQ.has(o.question_id)) optionsByQ.set(o.question_id, [])
      optionsByQ.get(o.question_id)!.push({ id: o.id, text: stripHtml(o.option_text ?? ''), correct: !!o.is_correct })
    }
  }
  const wrong: MockWrongQ[] = wrongQs
    .sort((a, b) => (a.sort_order ?? 0) - (b.sort_order ?? 0))
    .slice(0, 600).map(q => {
      const e = examMeta.get(q.exam_id)
      const no = attemptNoByExam.get(q.exam_id) ?? 1
      const selId = selectedByKey.get(`${q.exam_id}:${q.question_id}`)
      const opts = optionsByQ.get(q.question_id) ?? []
      return {
        setLabel: `${e?.content_level ?? 'N1'} 模試${e?.mock_set_no ?? '?'}`,
        attemptNo: no,
        attemptLabel: `第${no}回`,
        part: groupOf(q.question_id, q.section),
        number: q.sort_order ?? 0,
        question: stripText(qMeta.get(q.question_id)?.text ?? ''),
        options: opts.map(o => ({ text: o.text, correct: o.correct, selected: !!selId && o.id === selId })),
        answered: !!selId,
      }
    })

  return { hasData: true, attempts, overall, attemptCount: byAttempt.size, wrong }
}

export async function getWeaknessReport(userId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const hasAccess = await verifyMentorAccess(auth.user.id, userId, auth.profile.role, serviceClient)
  if (!hasAccess) return { error: ERR.FORBIDDEN }

  // ── Score Trend (per exam, date-based) ──
  const { data: exams } = await serviceClient
    .from('comprehensive_exams')
    .select('id, category, status, score, completed_at')
    .eq('user_id', userId)
    .eq('subcategory', 'comprehensive')
    .in('status', ['completed', 'failed'])
    .not('score', 'is', null)
    .order('completed_at', { ascending: true })

  // Group by (category, date), keep best score per day
  const rawScores: ExamScorePoint[] = (exams ?? []).map(e => ({
    examId: e.id,
    category: e.category,
    categoryLabel: categoryLabels[e.category] ?? e.category,
    score: e.score as number,
    completedAt: e.completed_at ?? '',
  }))
  const scoreMap = new Map<string, ExamScorePoint>()
  for (const s of rawScores) {
    const key = `${s.category}|${s.completedAt.slice(0, 10)}`
    const existing = scoreMap.get(key)
    if (!existing || s.score > existing.score) scoreMap.set(key, s)
  }
  const examScores = [...scoreMap.values()]
    .sort((a, b) => a.completedAt.localeCompare(b.completedAt))

  // ── Error Rates (per exam) ──
  const { data: allExamsRaw } = await serviceClient
    .from('comprehensive_exams')
    .select('id, category, completed_at, score')
    .eq('user_id', userId)
    .eq('subcategory', 'comprehensive')
    .in('status', ['completed', 'failed'])
    .order('completed_at', { ascending: true })

  // Deduplicate: keep only the best-score exam per (category, date)
  const bestExamMap = new Map<string, typeof allExamsRaw extends (infer T)[] | null ? T : never>()
  for (const e of allExamsRaw ?? []) {
    const key = `${e.category}|${(e.completed_at ?? '').slice(0, 10)}`
    const existing = bestExamMap.get(key)
    if (!existing || (e.score ?? 0) > (existing.score ?? 0)) bestExamMap.set(key, e)
  }
  const allExams = [...bestExamMap.values()]
    .sort((a, b) => (a.completed_at ?? '').localeCompare(b.completed_at ?? ''))

  const examErrorRates: ExamErrorRate[] = []

  if (allExams.length > 0) {
    const examIds = allExams.map(e => e.id)

    // Get all answers with exam_id
    const { data: answers } = await serviceClient
      .from('comprehensive_exam_answers')
      .select('exam_id, question_id, is_correct')
      .in('exam_id', examIds)

    if (answers && answers.length > 0) {
      const questionIds = [...new Set(answers.map(a => a.question_id))]

      const { data: questions } = await serviceClient
        .from('quiz_questions')
        .select('id, question_category')
        .in('id', questionIds)

      const questionCategoryMap = new Map<string, string>()
      for (const q of questions ?? []) {
        if (q.question_category) {
          questionCategoryMap.set(q.id, q.question_category)
        }
      }

      // Group answers by exam_id
      const answersByExam = new Map<string, typeof answers>()
      for (const a of answers) {
        const arr = answersByExam.get(a.exam_id) ?? []
        arr.push(a)
        answersByExam.set(a.exam_id, arr)
      }

      for (const exam of allExams) {
        const examAnswers = answersByExam.get(exam.id)
        if (!examAnswers || examAnswers.length === 0) continue

        // Aggregate by question_category
        const stats = new Map<string, { total: number; incorrect: number }>()
        for (const a of examAnswers) {
          const cat = questionCategoryMap.get(a.question_id)
          if (!cat) continue
          const s = stats.get(cat) ?? { total: 0, incorrect: 0 }
          s.total++
          if (!a.is_correct) s.incorrect++
          stats.set(cat, s)
        }

        const categories = [...stats.entries()]
          .map(([cat, s]) => ({
            questionCategory: cat,
            label: categoryLabels[cat] ?? cat,
            totalAnswered: s.total,
            incorrectCount: s.incorrect,
            errorRate: Math.round((s.incorrect / s.total) * 100),
          }))
          .sort((a, b) => b.errorRate - a.errorRate)

        examErrorRates.push({
          examId: exam.id,
          examCategory: exam.category,
          completedAt: exam.completed_at ?? '',
          categories,
        })
      }
    }
  }

  return { success: true, examScores, examErrorRates }
}

export interface MenteeAssignment {
  id: string
  title: string
  category: string
  subcategory: string
  content_level: string | null
  status: string
  due_date: string | null
  created_at: string
  required_quiz_ids: string[]
  passed_quiz_ids: string[]
  mastery: { mastered: number; total: number; pct: number }
  /** 카운트형(항목/이해테스트) 과제의 부여 개수 — 수정 UI용 (그 외는 null) */
  target_count: number | null
}

export async function getMenteeAssignments(userId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const hasAccess = await verifyMentorAccess(auth.user.id, userId, auth.profile.role, serviceClient)
  if (!hasAccess) return { error: ERR.FORBIDDEN }

  const { data: assignments } = await serviceClient
    .from('learning_assignments')
    .select('id, title, category, subcategory, content_level, status, due_date, created_at, required_quiz_ids, passed_quiz_ids, cumulative_target, target_count')
    .eq('assigned_to', userId)
    .order('created_at', { ascending: false })

  if (!assignments || assignments.length === 0) {
    return { success: true, assignments: [] as MenteeAssignment[] }
  }

  // Fetch mastered items for this user (페이지네이션 — 1000행 기본 제한 회피)
  const allMastered: { item_type: string; item_id: string }[] = []
  for (let offset = 0; ; offset += 1000) {
    const { data } = await serviceClient
      .from('user_mastered_items')
      .select('item_type, item_id')
      .eq('user_id', userId)
      .range(offset, offset + 999)
    if (!data || data.length === 0) break
    allMastered.push(...data)
    if (data.length < 1000) break
  }

  // Build mastery lookup: item_type → Set<item_id>
  const masteryByType = new Map<string, Set<string>>()
  for (const m of allMastered ?? []) {
    if (!masteryByType.has(m.item_type)) masteryByType.set(m.item_type, new Set())
    masteryByType.get(m.item_type)!.add(m.item_id)
  }

  // 리포트 과제탭은 월별 이력(과거 달 포함)을 보여주므로 통합하지 않고 각 rung(월별 행)을 그대로 노출한다.
  const consolidated: typeof assignments = [...assignments].sort((a, b) => (b.created_at ?? '').localeCompare(a.created_at ?? ''))

  // Dynamically resolve quiz IDs and calculate mastery per assignment
  const result: MenteeAssignment[] = []
  for (const la of consolidated) {
    let mastered = 0
    let total = 0

    // Item / 理解テスト assignments (seikatsu, business-jp, seikatsu-quiz, business-jp-quiz):
    // reuse the canonical per-area progress so mentee activity — including kanji and
    // quiz passes — is reflected for mentors/admins, consistent with the mentee's own view.
    const itemProg = await getReportItemProgress(
      serviceClient, userId, la.category, la.subcategory, la.content_level, la.cumulative_target
    )
    if (itemProg) {
      // rung(월별)별로 "부여한 갯수(target_count) / 그 rung에서 완료한 수"로 표시.
      if (la.cumulative_target != null && la.target_count != null) {
        const prevCum = la.cumulative_target - la.target_count
        mastered = Math.max(0, Math.min(itemProg.mastered - prevCum, la.target_count))
        total = la.target_count
      } else {
        mastered = itemProg.mastered
        total = itemProg.total
      }
    } else if (la.category === 'business-lit') {
      total = getReadingTotalCount(la.category, la.subcategory)
      const types = la.subcategory === 'attitude-culture'
        ? ['attitude_manual', 'culture_manual']
        : la.subcategory === 'security' ? ['security_manual'] : []
      for (const t of types) {
        mastered += masteryByType.get(t)?.size ?? 0
      }
    }

    // Dynamically resolve quiz IDs (always use latest from DB)
    const resolvedQuizIds = await resolveQuizIdsForAssignment(la.category, la.subcategory, la.content_level, serviceClient)

    // 월별 rung을 그대로 노출 — 저장된 그 달의 付与 타이틀(예: "N1 漢字 170項目")을 유지.
    const title = la.title

    result.push({
      id: la.id,
      title,
      category: la.category,
      subcategory: la.subcategory,
      content_level: la.content_level,
      status: la.status,
      due_date: la.due_date,
      created_at: la.created_at,
      required_quiz_ids: resolvedQuizIds.length > 0 ? resolvedQuizIds : (la.required_quiz_ids ?? []),
      passed_quiz_ids: la.passed_quiz_ids ?? [],
      mastery: { mastered, total, pct: total > 0 ? Math.round((mastered / total) * 100) : 0 },
      target_count: la.target_count ?? null,
    })
  }

  // 배정된 JLPT模試도 "課題"로 포함 (모의고사는 comprehensive_exams라 별도 조회)
  const { data: mockExams } = await serviceClient
    .from('comprehensive_exams')
    .select('id, content_level, mock_set_no, mock_session, status, requested_at')
    .eq('user_id', userId)
    .eq('category', 'jlpt-mock')
    .order('requested_at', { ascending: false })
  const mockBySet = new Map<string, NonNullable<typeof mockExams>[number]>()
  for (const e of mockExams ?? []) {
    if (e.mock_session === 1) continue // 1교시 placeholder 제외 (최종 인스턴스만)
    const key = `${e.content_level}::${e.mock_set_no}`
    if (!mockBySet.has(key)) mockBySet.set(key, e) // requested desc → 세트별 최신 1건
  }
  for (const e of mockBySet.values()) {
    const taken = e.status === 'completed' || e.status === 'failed'
    result.push({
      id: e.id,
      title: `${e.content_level ?? ''} 模試${e.mock_set_no ?? ''}`.trim(),
      category: 'jlpt-mock',
      subcategory: 'mock',
      content_level: e.content_level,
      status: taken ? 'completed' : (e.status === 'in_progress' ? 'in_progress' : 'pending'),
      due_date: null,
      created_at: e.requested_at ?? '',
      required_quiz_ids: [],
      passed_quiz_ids: [],
      // 모의고사도 과제처럼 0/1 (응시 완료 시 1/1)
      mastery: { mastered: taken ? 1 : 0, total: 1, pct: taken ? 100 : 0 },
      target_count: null,
    })
  }

  return { success: true, assignments: result }
}

/** 배정된 JLPT模試 과제 삭제 — 해당 (멘티·레벨·세트)의 모든 인스턴스 제거 */
export async function deleteMockExamAssignment(examId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const service = createServiceRoleClient()
  if (!service) return { error: ERR.SERVICE_KEY_MISSING }

  const { data: exam } = await service
    .from('comprehensive_exams')
    .select('user_id, content_level, mock_set_no')
    .eq('id', examId).eq('category', 'jlpt-mock')
    .maybeSingle()
  if (!exam) return { error: '模試課題が見つかりません' }
  if (!(await verifyMentorAccess(auth.user.id, exam.user_id, auth.profile.role, service))) return { error: ERR.FORBIDDEN }

  const { data: rows } = await service
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', exam.user_id).eq('category', 'jlpt-mock')
    .eq('content_level', exam.content_level).eq('mock_set_no', exam.mock_set_no)
  const ids = (rows ?? []).map(r => r.id)
  if (ids.length) {
    await service.from('comprehensive_exam_answers').delete().in('exam_id', ids)
    await service.from('comprehensive_exam_questions').delete().in('exam_id', ids)
    await service.from('comprehensive_exams').delete().in('id', ids)
  }
  revalidatePath('/admin/reports')
  revalidatePath('/dashboard')
  revalidatePath('/admin/tasks')
  return { success: true }
}

export interface AssignmentDetailData {
  masteryTrend: { day: string; count: number }[]
  quizResults: {
    quizId: string
    quizTitle: string
    quizType: string
    latestScore: number | null
    passed: boolean
    completedAt: string | null
    attemptId: string | null
  }[]
}

export async function getAssignmentDetail(assignmentId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // 1. Fetch assignment
  const { data: assignment } = await serviceClient
    .from('learning_assignments')
    .select('assigned_to, category, subcategory, content_level, required_quiz_ids, passed_quiz_ids')
    .eq('id', assignmentId)
    .single()

  if (!assignment) return { error: '課題が見つかりません' }

  // 2. Verify access
  const hasAccess = await verifyMentorAccess(auth.user.id, assignment.assigned_to, auth.profile.role, serviceClient)
  if (!hasAccess) return { error: ERR.FORBIDDEN }

  // 3. Mastery trend (last 7 days)
  const now = new Date()
  const sevenDaysAgo = new Date(now)
  sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 6)
  sevenDaysAgo.setHours(0, 0, 0, 0)

  const { data: masteredItems } = await serviceClient
    .from('user_mastered_items')
    .select('item_type, item_id, created_at')
    .eq('user_id', assignment.assigned_to)
    .gte('created_at', sevenDaysAgo.toISOString())

  // Filter mastered items to this assignment's scope (area-specific).
  // Item areas → that area's item_type (kanji included); 理解テスト(quiz) areas have no
  // item mastery, so their trend stays empty (progress shows via test results instead).
  const scopedItems = (masteredItems ?? []).filter(m => {
    if (isItemCategory(assignment.category)) {
      const spec = areaSpec(assignment.category, assignment.subcategory)
      if (!spec || spec.quizType) return false
      return m.item_type === spec.itemType
    }
    if (assignment.category === 'business-lit') {
      const types = assignment.subcategory === 'attitude-culture'
        ? ['attitude_manual', 'culture_manual']
        : assignment.subcategory === 'security' ? ['security_manual'] : []
      return types.includes(m.item_type)
    }
    return false
  })

  // Group by day
  const dayCounts = new Map<string, number>()
  for (let i = 0; i < 7; i++) {
    const d = new Date(sevenDaysAgo)
    d.setDate(d.getDate() + i)
    dayCounts.set(d.toISOString().slice(0, 10), 0)
  }
  for (const item of scopedItems) {
    const day = new Date(item.created_at).toISOString().slice(0, 10)
    if (dayCounts.has(day)) {
      dayCounts.set(day, (dayCounts.get(day) ?? 0) + 1)
    }
  }
  const masteryTrend = [...dayCounts.entries()].map(([day, count]) => ({ day, count }))

  // 4. Quiz results (dynamically resolve quiz IDs)
  const resolvedQuizIds = await resolveQuizIdsForAssignment(assignment.category, assignment.subcategory, assignment.content_level, serviceClient)
  const requiredQuizIds = resolvedQuizIds.length > 0 ? resolvedQuizIds : (assignment.required_quiz_ids ?? [])
  const quizResults: AssignmentDetailData['quizResults'] = []

  if (requiredQuizIds.length > 0) {
    // Fetch quiz info
    const { data: quizzes } = await serviceClient
      .from('quizzes')
      .select('id, title, quiz_type')
      .in('id', requiredQuizIds)

    // Fetch latest attempt per quiz
    const { data: attempts } = await serviceClient
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed, completed_at')
      .eq('user_id', assignment.assigned_to)
      .in('quiz_id', requiredQuizIds)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })

    const quizMap = new Map((quizzes ?? []).map(q => [q.id, q]))
    // Keep only latest attempt per quiz
    const latestAttempts = new Map<string, typeof attempts extends (infer T)[] | null ? T : never>()
    for (const a of attempts ?? []) {
      if (!latestAttempts.has(a.quiz_id)) {
        latestAttempts.set(a.quiz_id, a)
      }
    }

    for (const qid of requiredQuizIds) {
      const quiz = quizMap.get(qid)
      const attempt = latestAttempts.get(qid)
      quizResults.push({
        quizId: qid,
        quizTitle: quiz?.title ?? qid,
        quizType: quiz?.quiz_type ?? '',
        latestScore: attempt?.score ?? null,
        passed: attempt?.passed ?? false,
        completedAt: attempt?.completed_at ?? null,
        attemptId: attempt?.id ?? null,
      })
    }
  }

  return { success: true, masteryTrend, quizResults }
}

export async function generateAIPrompt(userId: string) {
  // JLPT模擬試験 결과만으로 약점 분석 프롬프트 생성 (회차별 파트 정답률 + 틀린 문항)
  const report = await getMockExamReport(userId)
  if (!report.hasData) return { error: '受験した模擬試験がありません' }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }
  const { data: profile } = await serviceClient
    .from('profiles')
    .select('full_name, email')
    .eq('id', userId)
    .single()
  const userName = profile?.full_name ?? profile?.email ?? 'Unknown'

  let prompt = `# ${userName}の JLPT模擬試験 弱点分析レポート\n\n`

  // 회차별(최신순) 파트 정답률
  prompt += '## 模試結果（パート別正解率）\n'
  const sortedAttempts = [...report.attempts].sort((a, b) => (b.ts ?? '').localeCompare(a.ts ?? ''))
  for (const at of sortedAttempts) {
    const incomplete = !at.parts.some(p => p.label === '聴解')
    const verdict = incomplete ? '進行中' : at.passed === true ? '合格' : at.passed === false ? '不合格' : '—'
    const dateStr = at.ts ? new Date(at.ts).toLocaleDateString('ja-JP') : '—'
    prompt += `\n### ${at.setTitle} ${at.attemptLabel}（${verdict}）${!incomplete && at.score != null ? ` ${at.score}点` : ''} ｜ 受験日: ${dateStr}\n`
    for (const p of at.parts) {
      const rate = p.total > 0 ? Math.round((p.correct / p.total) * 100) : 0
      prompt += `- ${p.label}: ${p.correct}/${p.total} (${rate}%)\n`
    }
  }

  // 틀린 문항 (회차·파트별, 최대 60문항)
  if (report.wrong.length) {
    prompt += '\n## 間違えた問題\n'
    const groups = new Map<string, typeof report.wrong>()
    for (const w of report.wrong) {
      const key = `${w.setLabel} ${w.attemptLabel} / ${w.part}`
      if (!groups.has(key)) groups.set(key, [])
      groups.get(key)!.push(w)
    }
    let listed = 0
    const CAP = 60
    for (const [key, ws] of groups) {
      if (listed >= CAP) break
      prompt += `\n### ${key}\n`
      for (const w of [...ws].sort((a, b) => a.number - b.number)) {
        if (listed >= CAP) break
        const correct = w.options.find(o => o.correct)?.text ?? ''
        const selected = w.answered ? (w.options.find(o => o.selected)?.text ?? '—') : '未回答'
        prompt += `- 第${w.number}問: ${w.question.replace(/\s+/g, ' ').slice(0, 80)} → 正解: ${correct} / 選択: ${selected}\n`
        listed++
      }
    }
    if (report.wrong.length > listed) prompt += `\n（他 ${report.wrong.length - listed} 問は省略）\n`
  }

  prompt += '\n---\n'
  prompt += '上記のJLPT模擬試験の結果を分析し、この学習者の弱点と改善のための具体的な学習計画を提案してください。\n'
  prompt += '特に正解率の低いパートに焦点を当て、効果的な復習方法を提案してください。\n'

  return { success: true, prompt }
}
