export interface RankingUserData {
  user_id: string
  full_name: string | null
  avatar_url: string | null
  is_japanese: boolean
  jlpt_level: string | null
  jlpt_normalized: number
  it_japanese_normalized: number
  core_normalized: number
  framework_normalized: number
  japanese_skills_updated_at: string | null
  coding_skills_updated_at: string | null
}

export interface ComputedRankingEntry {
  user_id: string
  full_name: string | null
  avatar_url: string | null
  is_japanese: boolean
  japanese_score: number      // max 200 (is_japanese → 200固定)
  programming_score: number   // max 200
  overall_score: number       // max 400
  jlpt_normalized: number
  it_japanese_normalized: number
  core_normalized: number
  framework_normalized: number
  jlpt_level: string | null
  last_exam_date: string | null
}

export type RankingCategory = 'overall' | 'japanese' | 'programming'

export function computeRankingEntry(user: RankingUserData): ComputedRankingEntry {
  const japanese_score = user.is_japanese ? 200 : (user.jlpt_normalized + user.it_japanese_normalized)
  const programming_score = user.core_normalized + user.framework_normalized
  const overall_score = japanese_score + programming_score

  let last_exam_date: string | null = null
  if (user.japanese_skills_updated_at && user.coding_skills_updated_at) {
    last_exam_date = user.japanese_skills_updated_at > user.coding_skills_updated_at
      ? user.japanese_skills_updated_at
      : user.coding_skills_updated_at
  } else {
    last_exam_date = user.japanese_skills_updated_at ?? user.coding_skills_updated_at
  }

  return {
    user_id: user.user_id,
    full_name: user.full_name,
    avatar_url: user.avatar_url,
    is_japanese: user.is_japanese,
    japanese_score,
    programming_score,
    overall_score,
    jlpt_normalized: user.jlpt_normalized,
    it_japanese_normalized: user.it_japanese_normalized,
    core_normalized: user.core_normalized,
    framework_normalized: user.framework_normalized,
    jlpt_level: user.jlpt_level,
    last_exam_date,
  }
}

export function sortByCategory(entries: ComputedRankingEntry[], category: RankingCategory): ComputedRankingEntry[] {
  const key = category === 'overall' ? 'overall_score'
    : category === 'japanese' ? 'japanese_score'
    : 'programming_score'
  return [...entries].sort((a, b) => b[key] - a[key])
}

export function filterUnscoredUsers(entries: ComputedRankingEntry[]): ComputedRankingEntry[] {
  return entries.filter(e =>
    e.jlpt_normalized > 0 ||
    e.it_japanese_normalized > 0 ||
    e.core_normalized > 0 ||
    e.framework_normalized > 0
  )
}

export function filterForCategory(entries: ComputedRankingEntry[], category: RankingCategory): ComputedRankingEntry[] {
  if (category === 'japanese') {
    return entries.filter(e => !e.is_japanese)
  }
  return entries
}
