'use server'

import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { ERR } from '@/lib/action-types'
import { getReadingTotalCount } from '@/lib/assignment-categories'
import { resolveQuizIdsForAssignment } from '@/app/actions/learning-assignments'

export interface ScoreTrendPoint {
  cycleNumber: number
  completedAt: string
  scores: Record<string, number | null>
}

export interface ErrorRateItem {
  questionCategory: string
  label: string
  totalAnswered: number
  incorrectCount: number
  errorRate: number
}

export interface WeaknessReportData {
  scoreTrend: ScoreTrendPoint[]
  errorRates: ErrorRateItem[]
}

const categoryLabels: Record<string, string> = {
  seikatsu: '生活日本語',
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
  java_core: 'Java基礎',
  spring_boot: 'Spring Boot',
  javascript_core: 'JavaScript基礎',
  react: 'React',
  sql: 'SQL',
  java_code: 'Javaコード',
  db_design: 'DB設計',
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

export async function getWeaknessReport(userId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const hasAccess = await verifyMentorAccess(auth.user.id, userId, auth.profile.role, serviceClient)
  if (!hasAccess) return { error: ERR.FORBIDDEN }

  // ── Score Trend ──
  // 1. Get completed cycles
  const { data: cycles } = await serviceClient
    .from('exam_cycles')
    .select('id, cycle_number, created_at, completed_at')
    .eq('user_id', userId)
    .eq('status', 'completed')
    .order('cycle_number', { ascending: true })

  const scoreTrend: ScoreTrendPoint[] = []

  if (cycles && cycles.length > 0) {
    // 2. Get all comprehensive exams for this user
    const { data: exams } = await serviceClient
      .from('comprehensive_exams')
      .select('id, category, subcategory, status, score, requested_at')
      .eq('user_id', userId)
      .eq('subcategory', 'comprehensive')
      .in('status', ['completed', 'failed'])
      .order('requested_at', { ascending: true })

    // 3. Map exams to cycles by timestamp
    for (const cycle of cycles) {
      const cycleExams = (exams ?? []).filter(e =>
        e.requested_at >= cycle.created_at &&
        (!cycle.completed_at || e.requested_at <= cycle.completed_at)
      )

      // Deduplicate by category (keep highest priority)
      const STATUS_PRIORITY: Record<string, number> = { completed: 4, failed: 3 }
      const byCategory = new Map<string, typeof cycleExams[number]>()
      for (const e of cycleExams) {
        const existing = byCategory.get(e.category)
        if (!existing || (STATUS_PRIORITY[e.status] ?? 0) > (STATUS_PRIORITY[existing.status] ?? 0)) {
          byCategory.set(e.category, e)
        }
      }

      const scores: Record<string, number | null> = {}
      for (const [cat, exam] of byCategory) {
        scores[cat] = exam.score
      }

      scoreTrend.push({
        cycleNumber: cycle.cycle_number,
        completedAt: cycle.completed_at ?? cycle.created_at,
        scores,
      })
    }
  }

  // ── Error Rates ──
  // 1. Get all comprehensive exams for user
  const { data: allExams } = await serviceClient
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', userId)
    .in('status', ['completed', 'failed'])

  const errorRates: ErrorRateItem[] = []

  if (allExams && allExams.length > 0) {
    const examIds = allExams.map(e => e.id)

    // 2. Get all answers
    const { data: answers } = await serviceClient
      .from('comprehensive_exam_answers')
      .select('question_id, is_correct')
      .in('exam_id', examIds)

    if (answers && answers.length > 0) {
      const questionIds = [...new Set(answers.map(a => a.question_id))]

      // 3. Get question categories
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

      // 4. Aggregate by category
      const stats = new Map<string, { total: number; incorrect: number }>()
      for (const a of answers) {
        const cat = questionCategoryMap.get(a.question_id)
        if (!cat) continue
        const s = stats.get(cat) ?? { total: 0, incorrect: 0 }
        s.total++
        if (!a.is_correct) s.incorrect++
        stats.set(cat, s)
      }

      for (const [cat, s] of stats) {
        errorRates.push({
          questionCategory: cat,
          label: categoryLabels[cat] ?? cat,
          totalAnswered: s.total,
          incorrectCount: s.incorrect,
          errorRate: Math.round((s.incorrect / s.total) * 100),
        })
      }

      // Sort by error rate descending
      errorRates.sort((a, b) => b.errorRate - a.errorRate)
    }
  }

  return { success: true, scoreTrend, errorRates }
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
    .select('id, title, category, subcategory, content_level, status, due_date, created_at, required_quiz_ids, passed_quiz_ids')
    .eq('assigned_to', userId)
    .order('created_at', { ascending: false })

  if (!assignments || assignments.length === 0) {
    return { success: true, assignments: [] as MenteeAssignment[] }
  }

  // Fetch mastered items for this user
  const { data: allMastered } = await serviceClient
    .from('user_mastered_items')
    .select('item_type, item_id')
    .eq('user_id', userId)

  // Build mastery lookup: item_type → Set<item_id>
  const masteryByType = new Map<string, Set<string>>()
  for (const m of allMastered ?? []) {
    if (!masteryByType.has(m.item_type)) masteryByType.set(m.item_type, new Set())
    masteryByType.get(m.item_type)!.add(m.item_id)
  }

  // Collect unique levels/subcategories needed
  const seikatsuLevels = [...new Set(
    assignments.filter(a => a.category === 'seikatsu' && a.content_level).map(a => a.content_level as string)
  )]
  const bizSubcats = [...new Set(
    assignments.filter(a => a.category === 'business-jp').map(a => a.subcategory)
  )]

  // JLPT item sets
  const jlptItemSets: Record<string, { vocab: Set<string>; grammar: Set<string>; reading: Set<string>; listening: Set<string>; total: number }> = {}
  for (const level of seikatsuLevels) {
    const [vocabRes, grammarRes, readingRes, listeningRes] = await Promise.all([
      serviceClient.from('jlpt_vocabulary').select('id').eq('jlpt_level', level),
      serviceClient.from('jlpt_grammar').select('id').eq('jlpt_level', level),
      serviceClient.from('jlpt_reading_passages').select('id').eq('jlpt_level', level),
      serviceClient.from('jlpt_listening_scripts').select('id').eq('jlpt_level', level),
    ])
    const vocab = new Set((vocabRes.data ?? []).map(v => v.id))
    const grammar = new Set((grammarRes.data ?? []).map(g => g.id))
    const reading = new Set((readingRes.data ?? []).map(r => r.id))
    const listening = new Set((listeningRes.data ?? []).map(l => l.id))
    jlptItemSets[level] = { vocab, grammar, reading, listening, total: vocab.size + grammar.size + reading.size + listening.size }
  }

  // Business JP item sets
  const bizSubcatDbMap: Record<string, string[]> = {
    glossary: ['business', 'it', 'dev'],
    'sentence-patterns': ['sentence_pattern'],
    expressions: ['expression'],
    keigo: ['keigo'],
  }
  const bizJpInfo: Record<string, { ids: Set<string>; total: number }> = {}
  for (const subcat of bizSubcats) {
    const cats = bizSubcatDbMap[subcat]
    if (!cats) continue
    const { data: items } = await serviceClient.from('it_glossary').select('id').in('category', cats)
    const ids = new Set((items ?? []).map(i => i.id))
    bizJpInfo[subcat] = { ids, total: ids.size }
  }

  // Dynamically resolve quiz IDs and calculate mastery per assignment
  const result: MenteeAssignment[] = []
  for (const la of assignments) {
    let mastered = 0
    let total = 0

    if (la.category === 'seikatsu' && la.content_level) {
      const sets = jlptItemSets[la.content_level]
      if (sets) {
        total = sets.total
        for (const [type, idSet] of [
          ['jlpt_vocabulary', sets.vocab],
          ['jlpt_grammar', sets.grammar],
          ['jlpt_reading', sets.reading],
          ['jlpt_listening', sets.listening],
        ] as const) {
          const masteredIds = masteryByType.get(type)
          if (masteredIds) {
            for (const id of masteredIds) {
              if ((idSet as Set<string>).has(id)) mastered++
            }
          }
        }
      }
    } else if (la.category === 'business-jp') {
      const info = bizJpInfo[la.subcategory]
      if (info) {
        total = info.total
        const masteredIds = masteryByType.get('it_glossary')
        if (masteredIds) {
          for (const id of masteredIds) {
            if (info.ids.has(id)) mastered++
          }
        }
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

    result.push({
      id: la.id,
      title: la.title,
      category: la.category,
      subcategory: la.subcategory,
      content_level: la.content_level,
      status: la.status,
      due_date: la.due_date,
      created_at: la.created_at,
      required_quiz_ids: resolvedQuizIds.length > 0 ? resolvedQuizIds : (la.required_quiz_ids ?? []),
      passed_quiz_ids: la.passed_quiz_ids ?? [],
      mastery: { mastered, total, pct: total > 0 ? Math.round((mastered / total) * 100) : 0 },
    })
  }

  return { success: true, assignments: result }
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

  // Filter mastered items to assignment scope
  const scopedItems = (masteredItems ?? []).filter(m => {
    if (assignment.category === 'seikatsu') {
      return ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening'].includes(m.item_type)
    }
    if (assignment.category === 'business-jp') {
      return m.item_type === 'it_glossary'
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
  const reportResult = await getWeaknessReport(userId)
  if ('error' in reportResult) return { error: reportResult.error ?? 'エラーが発生しました' }

  const { scoreTrend, errorRates } = reportResult

  // Get user name
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const { data: profile } = await serviceClient
    .from('profiles')
    .select('full_name, email')
    .eq('id', userId)
    .single()

  const userName = profile?.full_name ?? profile?.email ?? 'Unknown'

  let prompt = `# ${userName}の学習弱点分析レポート\n\n`

  if (scoreTrend.length > 0) {
    prompt += '## サイクル別スコア推移\n'
    for (const point of scoreTrend) {
      const date = new Date(point.completedAt).toLocaleDateString('ja-JP')
      prompt += `\n### サイクル ${point.cycleNumber} (${date})\n`
      for (const [cat, score] of Object.entries(point.scores)) {
        prompt += `- ${categoryLabels[cat] ?? cat}: ${score ?? '未受験'}点\n`
      }
    }
  }

  if (errorRates.length > 0) {
    prompt += '\n## カテゴリ別誤答率\n'
    for (const item of errorRates) {
      prompt += `- ${item.label}: ${item.errorRate}% (${item.incorrectCount}/${item.totalAnswered}問)\n`
    }
  }

  prompt += '\n---\n'
  prompt += '上記のデータを分析し、この学習者の弱点と改善のための具体的な学習計画を提案してください。\n'
  prompt += '特に誤答率が高いカテゴリに焦点を当て、効果的な復習方法を提案してください。\n'

  return { success: true, prompt }
}
