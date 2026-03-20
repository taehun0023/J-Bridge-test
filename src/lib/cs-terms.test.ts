import { describe, expect, it } from 'vitest'
import { getCsTermCategoryForSubject, getCsTermsIntro } from './cs-terms'

describe('cs terms helpers', () => {
  it('maps subject slugs to cs_terms categories', () => {
    expect(getCsTermCategoryForSubject('basic-theory')).toBe('basic_theory')
    expect(getCsTermCategoryForSubject('data-structures')).toBe('data_structures')
    expect(getCsTermCategoryForSubject('algorithms')).toBe('algorithms')
    expect(getCsTermCategoryForSubject('computer-architecture')).toBe('computer_architecture')
    expect(getCsTermCategoryForSubject('operating-systems')).toBe('os')
    expect(getCsTermCategoryForSubject('database')).toBe('database')
    expect(getCsTermCategoryForSubject('networking')).toBe('networking')
    expect(getCsTermCategoryForSubject('security')).toBe('security')
  })

  it('builds subject-specific cs terms intro copy', () => {
    const intro = getCsTermsIntro('オペレーティングシステム')
    expect(intro.title).toBe('オペレーティングシステム CS用語')
    expect(intro.description).toContain('ITパスポート')
    expect(intro.description).toContain('基本情報技術者試験')
    expect(intro.description).toContain('CS用語集')
  })
})
