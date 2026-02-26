/** Normalize a term for duplicate checking */
export function normalizeTerm(term: string): string {
  let s = term
  // Full-width alphanumeric → half-width
  s = s.replace(/[\uFF01-\uFF5E]/g, (ch) =>
    String.fromCharCode(ch.charCodeAt(0) - 0xFEE0)
  )
  // Katakana → Hiragana
  s = s.replace(/[\u30A1-\u30F6]/g, (ch) =>
    String.fromCharCode(ch.charCodeAt(0) - 0x60)
  )
  // Collapse whitespace
  s = s.replace(/[\s\t\n]+/g, ' ').trim()
  // Lowercase
  s = s.toLowerCase()
  // Remove common punctuation
  s = s.replace(/[・、。,.!?！？]/g, '')
  return s
}
