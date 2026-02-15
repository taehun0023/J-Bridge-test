import type { SupabaseClient } from '@supabase/supabase-js'

/** Assessment step → best score (direct radar axis mapping) */
export type AssessmentScores = Record<number, number>

/** Quiz type → array of best scores per quiz */
export type QuizScoresByType = Record<string, number[]>

/** Best submission result per coding problem */
export interface BestSubmission {
  language: string
  ratio: number
  difficulty: string
}

/** All data needed for score calculation, fetched in one pass */
export interface ScoringData {
  isJapanese: boolean
  assessmentScores: AssessmentScores
  quizScoresByType: QuizScoresByType
  bestByProblem: Record<string, BestSubmission>
  highestRankScore: number
}

/** Per-axis sub-scores for japanese_skills table */
export interface JapaneseAxisResult {
  vocabMastery: number
  grammarMastery: number
  readingMastery: number
  listeningMastery: number
  jlptNormalized: number
  itTermScore: number
  docReadingScore: number
  businessConvScore: number
  itJapaneseNormalized: number
}

/** Per-axis sub-scores for coding_skills table */
export interface CodingAxisResult {
  javaScore: number
  jsScore: number
  algorithmScore: number
  coreNormalized: number
  springBootScore: number
  reactScore: number
  dbDesignScore: number
  projectScore: number
  frameworkNormalized: number
}

/** Per-axis sub-scores for attitude_culture_skills table */
export interface AttitudeAxisResult {
  attitudeNormalized: number
}

/** Combined result from all axis calculators */
export interface AllAxisResults {
  japanese: JapaneseAxisResult
  coding: CodingAxisResult
  attitude: AttitudeAxisResult
}

export type ScoringClient = SupabaseClient
