import { avg } from './utils'
import type { ScoringData, JapaneseAxisResult } from './types'

/**
 * Axis 1 (生活日本語) + Axis 2 (ビジネス日本語) calculation.
 * Both are skipped (zeroed) for Japanese native users.
 */
export function calcJapaneseAxes(data: ScoringData): JapaneseAxisResult {
  if (data.isJapanese) {
    return {
      vocabMastery: 0,
      grammarMastery: 0,
      readingMastery: 0,
      listeningMastery: 0,
      jlptNormalized: 0,
      itTermScore: 0,
      docReadingScore: 0,
      businessConvScore: 0,
      itJapaneseNormalized: 0,
    }
  }

  const { quizScoresByType, assessmentScores } = data

  // ─── Axis 1: 生活日本語 ───
  const vocabMastery = avg(quizScoresByType['jlpt_vocab'] ?? [])
  const grammarMastery = avg(quizScoresByType['jlpt_grammar'] ?? [])
  const readingMastery = avg(quizScoresByType['jlpt_reading'] ?? [])
  const listeningMastery = avg(quizScoresByType['jlpt_listening'] ?? [])

  const jlptParts = [
    { score: vocabMastery, weight: 0.3 },
    { score: grammarMastery, weight: 0.3 },
    { score: readingMastery, weight: 0.25 },
    { score: listeningMastery, weight: 0.15 },
  ]
  const activeJlptParts = jlptParts.filter(p => p.score > 0)
  const learningJlpt = activeJlptParts.length > 0
    ? Math.round(
        activeJlptParts.reduce((s, p) => s + p.score * p.weight, 0) /
        activeJlptParts.reduce((s, p) => s + p.weight, 0)
      )
    : 0

  const jlptNormalized = assessmentScores[1] ?? 0

  // ─── Axis 2: ビジネス日本語 ───
  const itTermScore = avg(quizScoresByType['it_terminology'] ?? [])
  const businessConvScore = avg(quizScoresByType['role_play_scenario'] ?? [])
  const docReadingScore = Math.round(itTermScore * 0.8)

  const learningItJapanese = itTermScore > 0 || businessConvScore > 0
    ? Math.round(
        (itTermScore * 0.4 + docReadingScore * 0.3 + businessConvScore * 0.3) /
        ((itTermScore > 0 ? 0.4 : 0) + (docReadingScore > 0 ? 0.3 : 0) + (businessConvScore > 0 ? 0.3 : 0) || 1)
      )
    : 0

  const itJapaneseNormalized = assessmentScores[2] ?? 0

  return {
    vocabMastery,
    grammarMastery,
    readingMastery,
    listeningMastery,
    jlptNormalized,
    itTermScore,
    docReadingScore,
    businessConvScore,
    itJapaneseNormalized,
  }
}
