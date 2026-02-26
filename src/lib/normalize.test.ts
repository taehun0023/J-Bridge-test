import { describe, it, expect } from 'vitest'
import { normalizeTerm } from './normalize'

describe('normalizeTerm()', () => {
  it('returns empty string for empty input', () => {
    expect(normalizeTerm('')).toBe('')
  })

  it('converts full-width alphanumeric to half-width', () => {
    expect(normalizeTerm('ＡＢＣ')).toBe('abc')
    expect(normalizeTerm('１２３')).toBe('123')
    expect(normalizeTerm('ｈｅｌｌｏ')).toBe('hello')
  })

  it('converts katakana to hiragana', () => {
    expect(normalizeTerm('カタカナ')).toBe('かたかな')
    expect(normalizeTerm('テスト')).toBe('てすと')
    expect(normalizeTerm('サーバー')).toBe('さーばー')
  })

  it('collapses whitespace and trims', () => {
    expect(normalizeTerm('  hello   world  ')).toBe('hello world')
    expect(normalizeTerm('foo\t\nbar')).toBe('foo bar')
  })

  it('converts to lowercase', () => {
    expect(normalizeTerm('Hello World')).toBe('hello world')
    expect(normalizeTerm('ABC')).toBe('abc')
  })

  it('removes common punctuation', () => {
    expect(normalizeTerm('テスト・データ')).toBe('てすとでーた')
    expect(normalizeTerm('こんにちは、世界。')).toBe('こんにちは世界')
    expect(normalizeTerm('hello!')).toBe('hello')
    expect(normalizeTerm('test?')).toBe('test')
    expect(normalizeTerm('日本語！質問？')).toBe('日本語質問')
  })

  it('handles combined transformations', () => {
    // Full-width + katakana + punctuation + whitespace
    expect(normalizeTerm('Ｈｅｌｌｏ・ワールド')).toBe('helloわーるど')
  })

  it('preserves hiragana and kanji as-is', () => {
    expect(normalizeTerm('漢字')).toBe('漢字')
    expect(normalizeTerm('ひらがな')).toBe('ひらがな')
  })
})
