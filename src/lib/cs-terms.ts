import type { CsSubjectSlug } from './cs-content'

export interface CsTermItem {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  difficulty_level: string
  description: string | null
  example_sentence: string | null
  sort_order: number
}

export interface CsTermsIntro {
  title: string
  description: string
}

export const CS_TERMS_BY_SUBJECT: Record<CsSubjectSlug, string | null> = {
  'basic-theory': 'basic_theory',
  'data-structures': 'data_structures',
  algorithms: 'algorithms',
  'computer-architecture': 'computer_architecture',
  'operating-systems': 'os',
  database: 'database',
  networking: 'networking',
  security: 'security',
}

export function getCsTermCategoryForSubject(slug: CsSubjectSlug) {
  return CS_TERMS_BY_SUBJECT[slug]
}

export function getCsTermsIntro(subjectTitle: string): CsTermsIntro {
  return {
    title: `${subjectTitle} CS用語`,
    description:
      'ITパスポート基本情報技術者試験に出てくる基礎技術用語をもとに、現在の学習科目に合わせて整理した CS用語集です。',
  }
}
