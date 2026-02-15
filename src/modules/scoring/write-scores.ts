import type { ScoringClient, AllAxisResults } from './types'

/**
 * Write all calculated scores to the database.
 * Currently uses sequential UPSERTs — can be replaced with a Supabase RPC
 * for transaction guarantees in the future.
 */
export async function writeScores(
  client: ScoringClient,
  userId: string,
  isJapanese: boolean,
  results: AllAxisResults
) {
  const { japanese, coding, attitude } = results
  const now = new Date().toISOString()

  await client.from('japanese_skills').upsert({
    user_id: userId,
    vocab_mastery: japanese.vocabMastery,
    grammar_mastery: japanese.grammarMastery,
    reading_mastery: japanese.readingMastery,
    listening_mastery: japanese.listeningMastery,
    jlpt_normalized: japanese.jlptNormalized,
    it_terminology_score: japanese.itTermScore,
    doc_reading_score: japanese.docReadingScore,
    business_conv_score: japanese.businessConvScore,
    it_japanese_normalized: japanese.itJapaneseNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  await client.from('coding_skills').upsert({
    user_id: userId,
    java_score: coding.javaScore,
    javascript_score: coding.jsScore,
    sql_score: 0,
    algorithm_score: coding.algorithmScore,
    core_normalized: coding.coreNormalized,
    spring_boot_score: coding.springBootScore,
    react_score: coding.reactScore,
    db_design_score: coding.dbDesignScore,
    project_score: coding.projectScore,
    framework_normalized: coding.frameworkNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  await client.from('attitude_culture_skills').upsert({
    user_id: userId,
    punctuality_score: attitude.attitudeNormalized,
    horenso_score: attitude.attitudeNormalized,
    teamwork_score: attitude.attitudeNormalized,
    business_manner_score: attitude.attitudeNormalized,
    business_culture_score: attitude.attitudeNormalized,
    it_security_score: attitude.attitudeNormalized,
    attitude_normalized: attitude.attitudeNormalized,
    updated_at: now,
  }, { onConflict: 'user_id' })

  // Dispatch readiness snapshot
  await client.from('dispatch_readiness_scores').insert({
    user_id: userId,
    jlpt_score: isJapanese ? null : japanese.jlptNormalized,
    it_japanese_score: isJapanese ? null : japanese.itJapaneseNormalized,
    core_programming_score: coding.coreNormalized,
    framework_score: coding.frameworkNormalized,
    attitude_culture_score: attitude.attitudeNormalized,
    is_japanese: isJapanese,
  })
}
