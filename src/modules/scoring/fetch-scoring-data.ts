import { ASSESSMENT_QUIZ_IDS, COMP_EXAM_CATEGORY_TO_STEP, JLPT_MOCK_LEVEL_RANK, JLPT_MOCK_LEVEL_NORMALIZED, type JlptLevel } from '@/lib/assessment-config'
import { DIFFICULTY_MULTIPLIER, RANK_SCORES } from './utils'
import type { Joined } from '@/lib/supabase/types'
import type { ScoringClient, ScoringData, AssessmentScores, QuizScoresByType, BestSubmission } from './types'

type QuizAttemptWithQuiz = Joined<{
  score: number | null
  passed: boolean | null
  quiz_id: string
  quizzes: { quiz_type: string } | null
}>
type CodeSubmissionWithProblem = Joined<{
  problem_id: string | null
  language: string
  status: string
  passed_test_cases: number | null
  total_test_cases: number | null
  coding_problems: { difficulty: string } | null
}>
type CodingExamAttemptWithExam = Joined<{
  score: number | null
  passed: boolean | null
  coding_skill_exams: { target_rank: string } | null
}>

// Reverse map: quiz_id → assessment step number
const ASSESSMENT_ID_TO_STEP = new Map(
  Object.entries(ASSESSMENT_QUIZ_IDS).map(([step, quizId]) => [quizId, parseInt(step)])
)

/**
 * Fetch all data needed for score calculation in parallel where possible.
 * This replaces the 4 sequential queries in the original function.
 */
export async function fetchScoringData(
  client: ScoringClient,
  userId: string
): Promise<ScoringData> {
  // Run independent queries in parallel
  const [profileResult, quizAttemptsResult, submissionsResult, examAttemptsResult, compExamResult] =
    await Promise.all([
      client
        .from('profiles')
        .select('is_japanese')
        .eq('id', userId)
        .single(),
      client
        .from('quiz_attempts')
        .select('score, passed, quiz_id, quizzes(quiz_type)')
        .eq('user_id', userId)
        .not('completed_at', 'is', null),
      client
        .from('code_submissions')
        .select('problem_id, language, status, passed_test_cases, total_test_cases, coding_problems(difficulty)')
        .eq('user_id', userId),
      client
        .from('coding_exam_attempts')
        .select('score, passed, coding_skill_exams(target_rank)')
        .eq('user_id', userId)
        .eq('passed', true),
      client
        .from('comprehensive_exams')
        .select('category, score, content_level, completed_at, passed')
        .eq('user_id', userId)
        .in('status', ['completed', 'failed'])
        .not('score', 'is', null)
        .order('completed_at', { ascending: false }),
    ])

  const isJapanese = profileResult.data?.is_japanese ?? false

  // Classify quiz attempts into assessment vs regular
  const assessmentScores: AssessmentScores = {}
  const regularBestPerQuiz: Record<string, number> = {}

  for (const attempt of (quizAttemptsResult.data ?? []) as unknown as QuizAttemptWithQuiz[]) {
    const quizType = attempt.quizzes?.quiz_type
    if (!quizType || attempt.score == null) continue

    const assessmentStep = ASSESSMENT_ID_TO_STEP.get(attempt.quiz_id)
    if (assessmentStep) {
      // JLPT축(step 1)은 JLPT模試(jlpt-mock) 결과만 반영 — 옛 온보딩 JLPT総合試験 평가퀴즈는 제외
      if (assessmentStep === 1) continue
      if (!assessmentScores[assessmentStep] || attempt.score > assessmentScores[assessmentStep]) {
        assessmentScores[assessmentStep] = attempt.score
      }
    } else {
      const key = `${quizType}:${attempt.quiz_id}`
      if (!regularBestPerQuiz[key] || attempt.score > regularBestPerQuiz[key]) {
        regularBestPerQuiz[key] = attempt.score
      }
    }
  }

  // Merge comprehensive exam scores (latest strategy — most recent exam per category wins)
  mergeCompExamScores(assessmentScores, compExamResult.data ?? [])

  // Organize regular quiz scores by type
  const quizScoresByType: QuizScoresByType = {}
  for (const [key, score] of Object.entries(regularBestPerQuiz)) {
    const quizType = key.split(':')[0]
    if (!quizScoresByType[quizType]) quizScoresByType[quizType] = []
    quizScoresByType[quizType].push(score)
  }

  // Process code submissions: best per problem
  const bestByProblem: Record<string, BestSubmission> = {}
  for (const sub of (submissionsResult.data ?? []) as unknown as CodeSubmissionWithProblem[]) {
    if (!sub.problem_id || !sub.total_test_cases || sub.passed_test_cases == null) continue
    const ratio = sub.passed_test_cases / sub.total_test_cases
    const difficulty = sub.coding_problems?.difficulty ?? 'easy'
    if (!bestByProblem[sub.problem_id] || ratio > bestByProblem[sub.problem_id].ratio) {
      bestByProblem[sub.problem_id] = { language: sub.language, ratio, difficulty }
    }
  }

  // Process coding exam attempts: highest rank score
  let highestRankScore = 0
  for (const ea of (examAttemptsResult.data ?? []) as unknown as CodingExamAttemptWithExam[]) {
    const rank = ea.coding_skill_exams?.target_rank
    const rs = RANK_SCORES[rank ?? 'D'] ?? 0
    if (rs > highestRankScore) highestRankScore = rs
  }

  return {
    isJapanese,
    assessmentScores,
    quizScoresByType,
    bestByProblem,
    highestRankScore,
  }
}

/**
 * Merge comprehensive exam scores into assessment scores.
 *
 * Strategy per category:
 *   - jlpt-mock (JLPT模試): highest passed content_level → level-based normalized score.
 *     This is the only source for the JLPT axis (step 1).
 *   - seikatsu (legacy 生活日本語 総合試験): no longer reflected in scores.
 *   - other categories: latest completed_at wins (compExams sorted DESC).
 *
 * compExams must be sorted by completed_at DESC (most recent first).
 */
export function mergeCompExamScores(
  assessmentScores: AssessmentScores,
  compExams: { category: string; score: number | null; content_level?: string | null; completed_at?: string | null; passed?: boolean | null }[]
): void {
  const byCategory = new Map<string, typeof compExams>()
  for (const e of compExams) {
    if (e.score == null) continue
    const arr = byCategory.get(e.category)
    if (arr) arr.push(e)
    else byCategory.set(e.category, [e])
  }

  for (const [category, exams] of byCategory) {
    const step = COMP_EXAM_CATEGORY_TO_STEP[category]
    if (!step) continue

    // 레거시 seikatsu 종합시험은 더 이상 점수에 반영하지 않음 (JLPT축은 JLPT模試만)
    if (category === 'seikatsu') continue

    // JLPT 모의시험: 합격한 최고 레벨 → 레벨 기반 정규화 점수
    if (category === 'jlpt-mock') {
      const passedExams = exams.filter(e => e.passed)
      if (passedExams.length === 0) continue
      const chosen = passedExams.reduce((best, cur) => {
        const bestRank = JLPT_MOCK_LEVEL_RANK[(best.content_level ?? '') as JlptLevel] ?? 0
        const curRank = JLPT_MOCK_LEVEL_RANK[(cur.content_level ?? '') as JlptLevel] ?? 0
        if (curRank > bestRank) return cur
        if (curRank < bestRank) return best
        return (cur.completed_at ?? '') > (best.completed_at ?? '') ? cur : best
      })
      assessmentScores[step] = JLPT_MOCK_LEVEL_NORMALIZED[(chosen.content_level ?? '') as JlptLevel] ?? chosen.score ?? 0
      continue
    }

    // 기타 카테고리: 최신 완료
    assessmentScores[step] = exams[0].score!
  }
}
