import { avg, DIFFICULTY_MULTIPLIER } from './utils'
import type { ScoringData, CodingAxisResult } from './types'

/**
 * Axis 3 (CS知識) + Axis 4 (開発実務能力) calculation.
 * Combines code submission results, quiz scores, and coding exam ranks.
 */
export function calcCodingAxes(data: ScoringData): CodingAxisResult {
  const { quizScoresByType, assessmentScores, bestByProblem, highestRankScore } = data

  // ─── Axis 3: CS知識 (Core Programming) ───
  const langScores: Record<string, number[]> = { java: [], javascript: [] }
  let algorithmTotal = 0
  let algorithmCount = 0

  for (const best of Object.values(bestByProblem)) {
    const score = Math.round(best.ratio * 100 * (DIFFICULTY_MULTIPLIER[best.difficulty] ?? 0.6))
    const lang = best.language.toLowerCase()
    if (langScores[lang]) langScores[lang].push(score)

    if (best.difficulty === 'medium' || best.difficulty === 'hard') {
      algorithmTotal += score
      algorithmCount++
    }
  }

  const javaScore = avg(langScores['java'] ?? [])
  const jsScore = avg(langScores['javascript'] ?? [])
  const algorithmScore = algorithmCount > 0 ? Math.round(algorithmTotal / algorithmCount) : 0

  const coreQuizAvg = avg(quizScoresByType['core_programming'] ?? [])
  const learningCoreScores = [javaScore, jsScore, algorithmScore, coreQuizAvg].filter(s => s > 0)
  const learningCore = avg(learningCoreScores)

  const coreNormalized = Math.max(assessmentScores[3] ?? 0, learningCore)

  // ─── Axis 4: 開発実務能力 (Framework) ───
  const springBootScore = Math.min(100, Math.round(highestRankScore * 0.8))
  const reactScore = Math.min(100, Math.round(highestRankScore * 0.7))
  const dbDesignScore = Math.min(100, Math.round((javaScore || jsScore) * 0.9))
  const projectScore = Math.min(100, Math.round(highestRankScore * 0.6))
  const fwQuizAvg = avg(quizScoresByType['framework'] ?? [])
  const learningFramework = avg(
    [springBootScore, reactScore, dbDesignScore, projectScore, fwQuizAvg].filter(s => s > 0)
  )

  const frameworkNormalized = Math.max(assessmentScores[4] ?? 0, learningFramework)

  return {
    javaScore,
    jsScore,
    algorithmScore,
    coreNormalized,
    springBootScore,
    reactScore,
    dbDesignScore,
    projectScore,
    frameworkNormalized,
  }
}
