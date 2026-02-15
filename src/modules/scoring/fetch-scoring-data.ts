import { ASSESSMENT_QUIZ_IDS } from '@/lib/assessment-config'
import { DIFFICULTY_MULTIPLIER, RANK_SCORES } from './utils'
import type { ScoringClient, ScoringData, AssessmentScores, QuizScoresByType, BestSubmission } from './types'

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
  const [profileResult, quizAttemptsResult, submissionsResult, examAttemptsResult] =
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
    ])

  const isJapanese = profileResult.data?.is_japanese ?? false

  // Classify quiz attempts into assessment vs regular
  const assessmentScores: AssessmentScores = {}
  const regularBestPerQuiz: Record<string, number> = {}

  for (const attempt of quizAttemptsResult.data ?? []) {
    const quizType = (attempt.quizzes as unknown as { quiz_type: string } | null)?.quiz_type
    if (!quizType || attempt.score == null) continue

    const assessmentStep = ASSESSMENT_ID_TO_STEP.get(attempt.quiz_id)
    if (assessmentStep) {
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

  // Organize regular quiz scores by type
  const quizScoresByType: QuizScoresByType = {}
  for (const [key, score] of Object.entries(regularBestPerQuiz)) {
    const quizType = key.split(':')[0]
    if (!quizScoresByType[quizType]) quizScoresByType[quizType] = []
    quizScoresByType[quizType].push(score)
  }

  // Process code submissions: best per problem
  const bestByProblem: Record<string, BestSubmission> = {}
  for (const sub of submissionsResult.data ?? []) {
    if (!sub.problem_id || !sub.total_test_cases) continue
    const ratio = sub.passed_test_cases / sub.total_test_cases
    const difficulty = (sub.coding_problems as unknown as { difficulty: string } | null)?.difficulty ?? 'easy'
    if (!bestByProblem[sub.problem_id] || ratio > bestByProblem[sub.problem_id].ratio) {
      bestByProblem[sub.problem_id] = { language: sub.language, ratio, difficulty }
    }
  }

  // Process coding exam attempts: highest rank score
  let highestRankScore = 0
  for (const ea of examAttemptsResult.data ?? []) {
    const rank = (ea.coding_skill_exams as unknown as { target_rank: string } | null)?.target_rank
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
