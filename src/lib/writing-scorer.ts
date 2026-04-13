/**
 * Writing exercise scorer — compares user answer against model answer
 * using character-level matching (handles kanji/hiragana variants like 致す vs いたす)
 * and token extraction for keyword display.
 */

const PUNCTUATION = /[。、！？!?.,・「」『』（）()～〜\s\n\r]/g

/**
 * Extract meaningful tokens from Japanese text for display purposes.
 * Groups: kanji+hiragana sequences, katakana sequences.
 * Excludes single-character particles.
 */
export function extractTokens(text: string): string[] {
  const cleaned = text.replace(PUNCTUATION, ' ')
  const matches = cleaned.match(/[\u4E00-\u9FFF\u3040-\u309F]{2,}|[\u30A0-\u30FF]{2,}|[\u4E00-\u9FFF]+[\u3040-\u309F]+/g)
  if (!matches) return []
  const particles = new Set(['は', 'が', 'を', 'に', 'で', 'と', 'の', 'も', 'へ', 'か', 'や', 'よ', 'ね', 'な', 'わ', 'での', 'には', 'では', 'とは', 'から', 'まで', 'より', 'ので', 'のに'])
  return matches.filter(t => !particles.has(t))
}

export interface ScoringResult {
  score: number
  keywordHits: string[]
  keywordMisses: string[]
}

/**
 * Score by character-level matching with consumption.
 * Handles kanji/hiragana variants naturally (致します vs いたします
 * still shares し/ま/す characters).
 */
export function scoreWriting(userAnswer: string, modelAnswer: string): ScoringResult {
  if (!userAnswer.trim()) {
    return { score: 0, keywordHits: [], keywordMisses: extractTokens(modelAnswer) }
  }

  const cleanModel = modelAnswer.replace(PUNCTUATION, '')
  const cleanUser = userAnswer.replace(PUNCTUATION, '')

  if (cleanModel.length === 0) {
    return { score: 0, keywordHits: [], keywordMisses: [] }
  }

  // 0. Japanese character ratio check — reject non-Japanese answers
  const jpChars = cleanUser.match(/[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FFF]/g)
  const jpRatio = jpChars ? jpChars.length / cleanUser.length : 0
  if (jpRatio < 0.5) {
    return { score: 0, keywordHits: [], keywordMisses: extractTokens(modelAnswer) }
  }

  // 1. Character-level matching with consumption (70 points)
  //    For each character in model, check if it exists in user (consuming to prevent double-count)
  const userChars = [...cleanUser]
  let charHits = 0
  for (const ch of cleanModel) {
    const idx = userChars.indexOf(ch)
    if (idx !== -1) {
      charHits++
      userChars.splice(idx, 1)
    }
  }
  const charScore = Math.round((charHits / cleanModel.length) * 70)

  // 2. Length similarity (30 points)
  const lengthRatio = Math.min(cleanUser.length, cleanModel.length) / Math.max(cleanUser.length, cleanModel.length)
  const lengthScore = Math.round(lengthRatio * 30)

  // 3. Token extraction for keyword display (not used for scoring)
  const modelTokens = extractTokens(modelAnswer)
  const hits: string[] = []
  const misses: string[] = []
  for (const token of modelTokens) {
    if (userAnswer.includes(token)) {
      hits.push(token)
    } else {
      misses.push(token)
    }
  }

  return {
    score: Math.min(charScore + lengthScore, 100),
    keywordHits: hits,
    keywordMisses: misses,
  }
}
