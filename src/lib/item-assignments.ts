/**
 * 항목 수 기반 과제 (생활일본어 JLPT + 비즈니스 일본어) 공용 정의.
 *
 * 멘토가 (카테고리 · [레벨] · 영역)별로 "항목 N개"를 부여하고, 같은 조합에 쌓이면
 * 누적 사다리를 이룬다. 완료 = 해당 풀에서 마스터한 항목 수(user_mastered_items) ≥ cumulative_target.
 *
 * - 생활일본어(seikatsu): 레벨 N1~N5 × 영역(어휘/문법/독해/청해/한자), 풀 = jlpt_* 테이블의 jlpt_level
 * - 비즈니스(business-jp): 레벨 없음 × 영역(IT語彙/文型/表現/敬語), 풀 = it_glossary 의 category 필터
 *
 * learning_assignments.target_count 가 NOT NULL 이면 항목 과제로 식별 (기존 퀴즈형과 분리 공존).
 */

export type ItemCategory = 'seikatsu' | 'business-jp'

export interface AreaSpec {
  label: string
  /** user_mastered_items.item_type */
  itemType: string
  /** 풀(콘텐츠) 테이블 */
  table: string
  /** 존재 시: 과제의 content_level 로 풀을 필터 (jlpt_level) */
  levelColumn?: string
  /** 고정 풀 필터 (비즈니스: it_glossary.category IN values) */
  filter?: { column: string; values: string[] }
}

export interface CategorySpec {
  label: string
  hasLevel: boolean
  contentBase: string
  areas: Record<string, AreaSpec>
}

export const ITEM_CATEGORIES: Record<ItemCategory, CategorySpec> = {
  seikatsu: {
    label: '生活日本語',
    hasLevel: true,
    contentBase: '/japanese/jlpt',
    areas: {
      vocabulary: { label: '語彙', itemType: 'jlpt_vocabulary', table: 'jlpt_vocabulary', levelColumn: 'jlpt_level' },
      grammar:    { label: '文法', itemType: 'jlpt_grammar',    table: 'jlpt_grammar', levelColumn: 'jlpt_level' },
      reading:    { label: '読解', itemType: 'jlpt_reading',    table: 'jlpt_reading_passages', levelColumn: 'jlpt_level' },
      listening:  { label: '聴解', itemType: 'jlpt_listening',  table: 'jlpt_listening_scripts', levelColumn: 'jlpt_level' },
      kanji:      { label: '漢字', itemType: 'jlpt_kanji',      table: 'jlpt_kanji', levelColumn: 'jlpt_level' },
    },
  },
  'business-jp': {
    label: 'ビジネス日本語',
    hasLevel: false,
    contentBase: '/japanese/business',
    areas: {
      glossary:            { label: 'IT語彙',      itemType: 'it_glossary', table: 'it_glossary', filter: { column: 'category', values: ['business', 'it', 'dev'] } },
      'sentence-patterns': { label: '文章パターン', itemType: 'it_glossary', table: 'it_glossary', filter: { column: 'category', values: ['sentence_pattern'] } },
      expressions:         { label: 'ビジネス表現', itemType: 'it_glossary', table: 'it_glossary', filter: { column: 'category', values: ['expression'] } },
      keigo:               { label: '敬語',        itemType: 'it_glossary', table: 'it_glossary', filter: { column: 'category', values: ['keigo'] } },
    },
  },
}

export const ITEM_CATEGORY_KEYS = Object.keys(ITEM_CATEGORIES) as ItemCategory[]

export const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
export type JlptLevel = (typeof JLPT_LEVELS)[number]

/** 진전 없음 → 지연(스톨) 판정/알림 기준 일수 */
export const STALL_DAYS = 7

export function isItemCategory(x: string): x is ItemCategory {
  return Object.prototype.hasOwnProperty.call(ITEM_CATEGORIES, x)
}
export function areaKeys(cat: ItemCategory): string[] {
  return Object.keys(ITEM_CATEGORIES[cat].areas)
}
export function areaSpec(cat: ItemCategory, area: string): AreaSpec | undefined {
  return ITEM_CATEGORIES[cat].areas[area]
}
export function areaLabel(cat: string, area: string): string {
  return isItemCategory(cat) ? ITEM_CATEGORIES[cat].areas[area]?.label ?? area : area
}
export function categoryLabel(cat: string): string {
  return isItemCategory(cat) ? ITEM_CATEGORIES[cat].label : cat
}
export function isJlptLevel(x: string): x is JlptLevel {
  return (JLPT_LEVELS as readonly string[]).includes(x)
}
export function itemContentUrl(cat: ItemCategory, area: string, level: string | null): string {
  const base = ITEM_CATEGORIES[cat].contentBase
  return cat === 'seikatsu' ? `${base}/${area}${level ? `?level=${level}` : ''}` : `${base}/${area}`
}
