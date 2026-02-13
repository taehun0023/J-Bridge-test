import type { QuizType } from '@/lib/supabase/types'

export interface SubcategoryConfig {
  label: string
  quizType: QuizType | null
  hasLevel: boolean
}

export interface CategoryConfig {
  label: string
  levelOnly?: boolean
  quizTypes?: QuizType[]
  subcategories: Record<string, SubcategoryConfig>
}

export const ASSIGNMENT_CATEGORIES: Record<string, CategoryConfig> = {
  seikatsu: {
    label: '生活日本語',
    levelOnly: true,
    quizTypes: ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening'],
    subcategories: {},
  },
  'business-jp': {
    label: 'ビジネス日本語',
    subcategories: {
      glossary: { label: 'IT語彙', quizType: 'it_terminology', hasLevel: false },
      'sentence-patterns': { label: '文章パターン', quizType: 'role_play_scenario', hasLevel: false },
      expressions: { label: 'ビジネス表現', quizType: 'role_play_scenario', hasLevel: false },
    },
  },
  cs: {
    label: 'CS知識',
    subcategories: {
      'basic-theory': { label: '基礎理論', quizType: 'cs_knowledge', hasLevel: false },
      algorithms: { label: 'アルゴリズム', quizType: 'cs_knowledge', hasLevel: false },
      'data-structures': { label: 'データ構造', quizType: 'cs_knowledge', hasLevel: false },
      'computer-architecture': { label: 'コンピュータシステム', quizType: 'cs_knowledge', hasLevel: false },
      database: { label: 'データベース', quizType: 'cs_knowledge', hasLevel: false },
      networking: { label: 'ネットワーク', quizType: 'cs_knowledge', hasLevel: false },
      security: { label: 'セキュリティ', quizType: 'cs_knowledge', hasLevel: false },
    },
  },
  dev: {
    label: '開発実務能力',
    subcategories: {
      java: { label: 'Java', quizType: 'core_programming', hasLevel: false },
      javascript: { label: 'JavaScript', quizType: 'core_programming', hasLevel: false },
      'spring-boot': { label: 'Spring Boot', quizType: 'framework', hasLevel: false },
      react: { label: 'React', quizType: 'framework', hasLevel: false },
      nextjs: { label: 'Next.js', quizType: 'framework', hasLevel: false },
      python: { label: 'Python', quizType: 'core_programming', hasLevel: false },
      sql: { label: 'SQL', quizType: 'core_programming', hasLevel: false },
    },
  },
  'business-lit': {
    label: 'ビジネスリテラシー',
    subcategories: {
      attitude: { label: '態度', quizType: 'attitude_culture', hasLevel: false },
      culture: { label: '企業文化', quizType: 'attitude_culture', hasLevel: false },
      security: { label: 'セキュリティ', quizType: 'attitude_culture', hasLevel: false },
    },
  },
}

export const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

export function getCategoryLabel(category: string): string {
  return ASSIGNMENT_CATEGORIES[category]?.label ?? category
}

export function getSubcategoryLabel(category: string, subcategory: string): string {
  return ASSIGNMENT_CATEGORIES[category]?.subcategories[subcategory]?.label ?? subcategory
}
