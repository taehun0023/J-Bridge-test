'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { ASSESSMENT_QUIZ_IDS } from '@/lib/assessment-config'

// Reverse map: quiz_id → assessment step number
const ASSESSMENT_ID_TO_STEP = new Map(
  Object.entries(ASSESSMENT_QUIZ_IDS).map(([step, quizId]) => [quizId, parseInt(step)])
)

/**
 * Recalculate all axis scores for a user based on their quiz attempts and coding submissions.
 *
 * Assessment quizzes (등급테스ト) directly set the _normalized value for each radar axis.
 * Regular learning quizzes supplement via Math.max so improvement is always reflected.
 */
export async function recalculateUserScores(userId: string) {
  const supabase = createServiceRoleClient() ?? await createClient()

  // Fetch profile to check is_japanese
  const { data: profileData } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .single()

  const isJapanese = profileData?.is_japanese ?? false

  // ─── 1. Fetch all completed quiz attempts ───
  const { data: quizAttempts } = await supabase
    .from('quiz_attempts')
    .select('score, passed, quiz_id, quizzes(quiz_type)')
    .eq('user_id', userId)
    .not('completed_at', 'is', null)

  // ─── 1a. Separate assessment vs regular quiz attempts ───
  // Assessment step → best score (direct radar axis mapping)
  const assessmentScores: Record<number, number> = {}
  // Regular quizzes grouped by quiz_type
  const regularBestPerQuiz: Record<string, number> = {}

  for (const attempt of quizAttempts ?? []) {
    const quizType = (attempt.quizzes as unknown as { quiz_type: string } | null)?.quiz_type
    if (!quizType || attempt.score == null) continue

    const assessmentStep = ASSESSMENT_ID_TO_STEP.get(attempt.quiz_id)
    if (assessmentStep) {
      // Assessment quiz → track best score per step
      if (!assessmentScores[assessmentStep] || attempt.score > assessmentScores[assessmentStep]) {
        assessmentScores[assessmentStep] = attempt.score
      }
    } else {
      // Regular learning quiz → group by type
      const key = `${quizType}:${attempt.quiz_id}`
      if (!regularBestPerQuiz[key] || attempt.score > regularBestPerQuiz[key]) {
        regularBestPerQuiz[key] = attempt.score
      }
    }
  }

  // Organize regular quiz best scores by quiz type
  const quizScoresByType: Record<string, number[]> = {}
  for (const [key, score] of Object.entries(regularBestPerQuiz)) {
    const quizType = key.split(':')[0]
    if (!quizScoresByType[quizType]) quizScoresByType[quizType] = []
    quizScoresByType[quizType].push(score)
  }

  function avg(scores: number[]): number {
    if (scores.length === 0) return 0
    return Math.round(scores.reduce((a, b) => a + b, 0) / scores.length)
  }

  // ─── 2. Calculate Axis 1: 生活日本語 (skip for Japanese users) ───
  let jlptNormalized = 0
  let vocabMastery = 0, grammarMastery = 0, readingMastery = 0, listeningMastery = 0

  if (!isJapanese) {
    // Regular learning quiz scores (vocab, grammar, reading, listening separately)
    vocabMastery = avg(quizScoresByType['jlpt_vocab'] ?? [])
    grammarMastery = avg(quizScoresByType['jlpt_grammar'] ?? [])
    readingMastery = avg(quizScoresByType['jlpt_reading'] ?? [])
    listeningMastery = avg(quizScoresByType['jlpt_listening'] ?? [])

    const jlptParts = [
      { score: vocabMastery, weight: 0.3 },
      { score: grammarMastery, weight: 0.3 },
      { score: readingMastery, weight: 0.25 },
      { score: listeningMastery, weight: 0.15 },
    ]
    const activeJlptParts = jlptParts.filter(p => p.score > 0)
    const learningJlpt = activeJlptParts.length > 0
      ? Math.round(activeJlptParts.reduce((s, p) => s + p.score * p.weight, 0) / activeJlptParts.reduce((s, p) => s + p.weight, 0))
      : 0

    // Assessment Step 1 → directly sets jlpt_normalized
    jlptNormalized = Math.max(assessmentScores[1] ?? 0, learningJlpt)
  }

  // ─── 3. Calculate Axis 2: ビジネス日本語 (skip for Japanese users) ───
  let itJapaneseNormalized = 0
  let itTermScore = 0, docReadingScore = 0, businessConvScore = 0

  if (!isJapanese) {
    // Regular learning quiz scores
    itTermScore = avg(quizScoresByType['it_terminology'] ?? [])
    businessConvScore = avg(quizScoresByType['role_play_scenario'] ?? [])
    docReadingScore = Math.round(itTermScore * 0.8)

    const learningItJapanese = itTermScore > 0 || businessConvScore > 0
      ? Math.round((itTermScore * 0.4 + docReadingScore * 0.3 + businessConvScore * 0.3) /
          ((itTermScore > 0 ? 0.4 : 0) + (docReadingScore > 0 ? 0.3 : 0) + (businessConvScore > 0 ? 0.3 : 0) || 1))
      : 0

    // Assessment Step 2 → directly sets it_japanese_normalized
    itJapaneseNormalized = Math.max(assessmentScores[2] ?? 0, learningItJapanese)
  }

  // ─── 4. Calculate Axis 3 & 4: CS知識 & 開発実務能力 ───
  const { data: submissions } = await supabase
    .from('code_submissions')
    .select('problem_id, language, status, passed_test_cases, total_test_cases, coding_problems(difficulty)')
    .eq('user_id', userId)

  const bestByProblem: Record<string, { language: string; ratio: number; difficulty: string }> = {}
  for (const sub of submissions ?? []) {
    if (!sub.problem_id || !sub.total_test_cases) continue
    const ratio = sub.passed_test_cases / sub.total_test_cases
    const difficulty = (sub.coding_problems as unknown as { difficulty: string } | null)?.difficulty ?? 'easy'
    if (!bestByProblem[sub.problem_id] || ratio > bestByProblem[sub.problem_id].ratio) {
      bestByProblem[sub.problem_id] = { language: sub.language, ratio, difficulty }
    }
  }

  const langScores: Record<string, number[]> = { java: [], javascript: [] }
  const difficultyMultiplier: Record<string, number> = { easy: 0.6, medium: 0.8, hard: 1.0 }
  let algorithmTotal = 0
  let algorithmCount = 0

  for (const best of Object.values(bestByProblem)) {
    const score = Math.round(best.ratio * 100 * (difficultyMultiplier[best.difficulty] ?? 0.6))
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

  // Regular learning: CS quiz + code submissions
  const coreQuizAvg = avg(quizScoresByType['core_programming'] ?? [])
  const learningCoreScores = [javaScore, jsScore, algorithmScore, coreQuizAvg].filter(s => s > 0)
  const learningCore = avg(learningCoreScores)

  // Assessment Step 3 → directly sets core_normalized
  const coreNormalized = Math.max(assessmentScores[3] ?? 0, learningCore)

  // Framework / 開発実務能力 scores
  const { data: examAttempts } = await supabase
    .from('coding_exam_attempts')
    .select('score, passed, coding_skill_exams(target_rank)')
    .eq('user_id', userId)
    .eq('passed', true)

  let highestRankScore = 0
  for (const ea of examAttempts ?? []) {
    const rank = (ea.coding_skill_exams as unknown as { target_rank: string } | null)?.target_rank
    const rankScores: Record<string, number> = { D: 20, C: 40, B: 60, A: 80, S: 100 }
    const rs = rankScores[rank ?? 'D'] ?? 0
    if (rs > highestRankScore) highestRankScore = rs
  }

  const springBootScore = Math.min(100, Math.round(highestRankScore * 0.8))
  const reactScore = Math.min(100, Math.round(highestRankScore * 0.7))
  const dbDesignScore = Math.min(100, Math.round((avg(langScores['java'] ?? []) || avg(langScores['javascript'] ?? [])) * 0.9))
  const projectScore = Math.min(100, Math.round(highestRankScore * 0.6))
  const fwQuizAvg = avg(quizScoresByType['framework'] ?? [])
  const learningFramework = avg([springBootScore, reactScore, dbDesignScore, projectScore, fwQuizAvg].filter(s => s > 0))

  // Assessment Step 4 → directly sets framework_normalized
  const frameworkNormalized = Math.max(assessmentScores[4] ?? 0, learningFramework)

  // ─── 5. Calculate Axis 5: ビジネスリテラシー ───
  const learningAttitude = avg(quizScoresByType['attitude_culture'] ?? [])

  // Assessment Step 5 → directly sets attitude_normalized
  const attitudeNormalized = Math.max(assessmentScores[5] ?? 0, learningAttitude)

  const punctualityScore = attitudeNormalized
  const horensoScore = attitudeNormalized
  const teamworkScore = attitudeNormalized
  const businessMannerScore = attitudeNormalized
  const businessCultureScore = attitudeNormalized
  const itSecurityScore = attitudeNormalized

  // ─── 6. Update skill tables ───
  const now = new Date().toISOString()

  await supabase.from('japanese_skills').upsert({
    user_id: userId,
    vocab_mastery: vocabMastery,
    grammar_mastery: grammarMastery,
    reading_mastery: readingMastery,
    listening_mastery: listeningMastery,
    jlpt_normalized: jlptNormalized,
    it_terminology_score: itTermScore,
    doc_reading_score: docReadingScore,
    business_conv_score: businessConvScore,
    it_japanese_normalized: itJapaneseNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  await supabase.from('coding_skills').upsert({
    user_id: userId,
    java_score: javaScore,
    javascript_score: jsScore,
    sql_score: 0,
    algorithm_score: algorithmScore,
    core_normalized: coreNormalized,
    spring_boot_score: springBootScore,
    react_score: reactScore,
    db_design_score: dbDesignScore,
    project_score: projectScore,
    framework_normalized: frameworkNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  await supabase.from('attitude_culture_skills').upsert({
    user_id: userId,
    punctuality_score: punctualityScore,
    horenso_score: horensoScore,
    teamwork_score: teamworkScore,
    business_manner_score: businessMannerScore,
    business_culture_score: businessCultureScore,
    it_security_score: itSecurityScore,
    attitude_normalized: attitudeNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  // ─── 7. Create dispatch readiness snapshot ───
  await supabase.from('dispatch_readiness_scores').insert({
    user_id: userId,
    jlpt_score: isJapanese ? null : jlptNormalized,
    it_japanese_score: isJapanese ? null : itJapaneseNormalized,
    core_programming_score: coreNormalized,
    framework_score: frameworkNormalized,
    attitude_culture_score: attitudeNormalized,
    is_japanese: isJapanese,
  })

  revalidatePath('/dashboard')
  revalidatePath('/profile')
  revalidatePath('/admin/reports')

  return { success: true }
}

/**
 * Recalculate scores for all users (admin batch operation).
 */
export async function recalculateAllScores() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: 'Not authenticated' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') return { error: 'Not authorized' }

  const { data: users } = await supabase
    .from('profiles')
    .select('id')
    .in('role', ['mentee', 'mentor', 'admin'])

  let processed = 0
  for (const u of users ?? []) {
    await recalculateUserScores(u.id)
    processed++
  }

  return { success: true, processed }
}
