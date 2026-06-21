import type { QuizType } from '@/lib/supabase/types'
import { getAllSubsectionIds as getAttitudeIds } from '@/lib/attitude-manual-data'
import { getAllSubsectionIds as getCultureIds } from '@/lib/culture-manual-data'
import { getAllSubsectionIds as getSecurityIds } from '@/lib/security-manual-data'
import { isItemCategory, categoryLabel as itemCategoryLabel, areaLabel as itemAreaLabel } from '@/lib/item-assignments'

export interface SubcategoryConfig {
  label: string
  quizType: QuizType | null
  hasLevel: boolean
  titlePatterns?: string[]
  readingItemTypes?: string[]
  courseSubcategory?: string
}

export interface CategoryConfig {
  label: string
  levelOnly?: boolean
  quizTypes?: QuizType[]
  subcategories: Record<string, SubcategoryConfig>
}

export const ASSIGNMENT_CATEGORIES: Record<string, CategoryConfig> = {
  seikatsu: {
    label: 'JLPT',
    levelOnly: true,
    quizTypes: ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji'],
    subcategories: {},
  },
  'business-jp': {
    label: 'ビジネス日本語',
    subcategories: {
      glossary: { label: 'IT語彙', quizType: 'it_terminology', hasLevel: false },
      'sentence-patterns': { label: '文章パターン', quizType: 'sentence_pattern', hasLevel: false },
      expressions: { label: 'ビジネス表現', quizType: 'business_expression', hasLevel: false },
      keigo: { label: '敬語', quizType: 'keigo', hasLevel: false },
    },
  },
  cs: {
    label: 'CS知識',
    subcategories: {
      'basic-theory': { label: '基礎理論', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%基礎理論%'] },
      algorithms: { label: 'アルゴリズム', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%アルゴリズム%'] },
      'data-structures': { label: 'データ構造', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%データ構造%'] },
      'computer-architecture': { label: 'コンピュータシステム', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%コンピュータシステム%'] },
      database: { label: 'データベース', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%データベース%'] },
      networking: { label: 'ネットワーク', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%ネットワーク%'] },
      security: { label: 'セキュリティ', quizType: 'cs_knowledge', hasLevel: false, titlePatterns: ['%セキュリティ%'] },
    },
  },
  dev: {
    label: '開発実務能力',
    subcategories: {
      java: { label: 'Java', quizType: 'core_programming', hasLevel: true, courseSubcategory: 'java' },
      javascript: { label: 'JavaScript', quizType: 'core_programming', hasLevel: true, courseSubcategory: 'javascript' },
      'spring-boot': { label: 'Spring Boot', quizType: 'framework', hasLevel: true, courseSubcategory: 'spring-boot' },
      react: { label: 'React', quizType: 'framework', hasLevel: true, courseSubcategory: 'react' },
      nextjs: { label: 'Next.js', quizType: 'framework', hasLevel: true, courseSubcategory: 'nextjs' },
      python: { label: 'Python', quizType: 'core_programming', hasLevel: true, courseSubcategory: 'python' },
      sql: { label: 'SQL', quizType: 'core_programming', hasLevel: true, courseSubcategory: 'sql' },
    },
  },
  'business-lit': {
    label: 'ビジネスリテラシー',
    subcategories: {
      'attitude-culture': {
        label: '態度・企業文化',
        quizType: 'attitude_culture',
        hasLevel: false,
        titlePatterns: ['%服務態度%', '%ビジネスマナー%'],
        readingItemTypes: ['attitude_manual', 'culture_manual'],
      },
      security: {
        label: 'セキュリティ',
        quizType: 'attitude_culture',
        hasLevel: false,
        titlePatterns: ['%セキュリティ%'],
        readingItemTypes: ['security_manual'],
      },
    },
  },
}

export const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

export const DEV_LEVELS = [
  { value: 'beginner', label: 'Bronze' },
  { value: 'intermediate', label: 'Silver' },
  { value: 'advanced', label: 'Gold' },
] as const

export function getCategoryLabel(category: string): string {
  return ASSIGNMENT_CATEGORIES[category]?.label
    ?? (isItemCategory(category) ? itemCategoryLabel(category) : category)
}

export function getSubcategoryLabel(category: string, subcategory: string): string {
  const direct = ASSIGNMENT_CATEGORIES[category]?.subcategories[subcategory]?.label
  if (direct) return direct
  if (isItemCategory(category)) return itemAreaLabel(category, subcategory)
  return subcategory
}

export function getContentUrl(category: string, subcategory: string): string {
  switch (category) {
    case 'seikatsu': return '/japanese/jlpt'
    case 'business-jp': return `/japanese/business/${subcategory}`
    case 'cs': return `/cs/${subcategory}`
    case 'dev': return `/dev/${subcategory}`
    case 'business-lit': return `/business-literacy/${subcategory}`
    default: return '/dashboard/assignments'
  }
}

export function getContentLevelLabel(category: string, contentLevel: string | null): string {
  if (!contentLevel) return ''
  if (category === 'dev') {
    const found = DEV_LEVELS.find(l => l.value === contentLevel)
    return found?.label ?? contentLevel
  }
  return contentLevel
}

/** 과제 제목을 카테고리·서브카테고리·레벨에서 자동 생성. (예: 「生活日本語 N4」「開発実務能力 Java Gold」) */
export function buildAssignmentTitle(category: string, subcategory: string, contentLevel: string | null): string {
  const parts = [getCategoryLabel(category)]
  if (subcategory && subcategory !== 'all') parts.push(getSubcategoryLabel(category, subcategory))
  const levelLabel = getContentLevelLabel(category, contentLevel)
  if (levelLabel) parts.push(levelLabel)
  return parts.join(' ')
}

/** 부여한 달의 말일 23:59:59 (ISO). 課題の期限は手動設定せず常にこの値に自動設定する。 */
export function endOfMonthDueDate(): string {
  const now = new Date()
  return new Date(now.getFullYear(), now.getMonth() + 1, 0, 23, 59, 59, 999).toISOString()
}

export function getQuizUrl(
  quizType: string,
  quizId: string,
  lessonId?: string | null,
  courseId?: string | null,
  title?: string,
): string {
  switch (quizType) {
    case 'jlpt_vocab':
    case 'jlpt_grammar':
    case 'jlpt_reading':
    case 'jlpt_listening':
    case 'jlpt_kanji':
      return `/japanese/jlpt/quiz/${quizId}`
    case 'it_terminology':
    case 'sentence_pattern':
    case 'business_expression':
    case 'keigo':
      return `/japanese/business/quiz/${quizId}`
    case 'cs_knowledge':
      return `/cs/quiz/${quizId}`
    case 'core_programming':
    case 'framework':
      // Pool quizzes go to /dev/quiz/, course quizzes go to course lesson
      if (courseId && lessonId) {
        return `/courses/${courseId}/lessons/${lessonId}/quiz/${quizId}`
      }
      return `/dev/quiz/${quizId}`
    case 'attitude_culture':
      if (title && title.includes('セキュリティ')) {
        return `/business-literacy/security/quiz/${quizId}`
      }
      return `/business-literacy/attitude-culture/quiz/${quizId}`
    default:
      return '/dashboard/assignments'
  }
}

export function getReadingTotalCount(category: string, subcategory: string): number {
  if (category !== 'business-lit') return 0
  switch (subcategory) {
    case 'attitude-culture': return getAttitudeIds().length + getCultureIds().length
    case 'security': return getSecurityIds().length
    default: return 0
  }
}
