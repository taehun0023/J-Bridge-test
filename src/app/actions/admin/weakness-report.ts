'use server'

import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { ERR } from '@/lib/action-types'

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
