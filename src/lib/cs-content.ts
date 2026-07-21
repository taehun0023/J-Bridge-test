import { readdir, readFile } from 'node:fs/promises'
import path from 'node:path'
import {
  getCsLessonDisplayTitle,
  getCsSubjectDisplayDescription,
  getCsSubjectDisplayTitle,
} from './cs-display'

export type CsSubjectSlug =
  | 'basic-theory'
  | 'data-structures'
  | 'algorithms'
  | 'computer-architecture'
  | 'operating-systems'
  | 'database'
  | 'networking'
  | 'security'

export interface CsLessonMeta {
  lesson_id: string
  category: 'cs-knowledge'
  subject: string
  topic: string
  difficulty: 'foundation' | 'intermediate' | 'advanced'
  default_language: 'ja'
  available_languages: string[]
  summary: string
  key_points: string[]
  misconceptions: string[]
  check_questions: string[]
  exam_extractables: {
    fact_candidates: string[]
    concept_contrast_candidates: string[]
    scenario_candidates: string[]
    common_wrong_answer_patterns: string[]
  }
}

export interface CsLessonChoiceOption {
  id: string
  text: string
}

export type CsLessonStep =
  | {
      id: string
      type: 'concept'
      title: string
      body: string
      bullets?: string[]
    }
  | {
      id: string
      type: 'mini_check' | 'apply_check'
      title: string
      prompt: string
      /** 문제에서 다루는 코드 스니펫(있으면 코드블록으로 표시) */
      code?: string
      options: CsLessonChoiceOption[]
      correctOptionId: string
      explanation: string
    }
  | {
      id: string
      type: 'fill_blank'
      title: string
      prompt: string
      codeBefore: string
      codeAfter: string
      options: CsLessonChoiceOption[]
      correctOptionId: string
      explanation: string
    }
  | {
      id: string
      type: 'order'
      title: string
      prompt: string
      items: CsLessonChoiceOption[]
      /** 오답 카드(선택). 있으면 풀에 섞여 표시되며 정답 순서에는 포함되면 안 됨. '확인' 제출로 채점 */
      distractors?: CsLessonChoiceOption[]
      explanation: string
    }
  | {
      id: string
      type: 'worked_example'
      title: string
      situation: string
      reasoning: string[]
      takeaway: string
    }
  | {
      id: string
      type: 'summary'
      title: string
      bullets: string[]
    }
  | {
      id: string
      type: 'code_exercise'
      title: string
      prompt: string
      /** 'html' | 'css' | 'js' | 'java' | 'python' | 'sql' 등 */
      lang: string
      /** 빈칸은 [[0]] [[1]] … 로 표기 */
      codeTemplate: string
      /** 공유 토큰 뱅크(정답+오답 섞음, 값은 고유하게) */
      tokens: string[]
      /** 빈칸별 정답 토큰(순서대로). 개수 = 빈칸 수 */
      answers: string[]
      /** 웹 직접 입력용 빈칸별 추가 허용 답안(예: `"a"`↔`'a'`, trim↔strip). 인덱스=빈칸. 토큰 선택엔 영향 없음 */
      acceptedAnswers?: string[][]
      /** 'tokens'면 웹에서도 타이핑 대신 카드(토큰) 선택으로 채운다(긴 코드 한 줄 토큰용) */
      inputMode?: 'tokens'
      /** 정답 시 보여줄 결과 — 브라우저(iframe 라이브) / 콘솔(사전출력) / 테이블 */
      result:
        | { kind: 'browser' }
        | { kind: 'console'; output: string }
        | { kind: 'table'; columns: string[]; rows: string[][] }
      explanation: string
    }

export interface CsLessonStageLocale {
  hook: {
    title: string
    prompt: string
    takeaway?: string
  }
  steps: CsLessonStep[]
  referenceLabel?: string
}

export interface CsLessonInteractiveContent {
  version: 1
  ja: CsLessonStageLocale
  ko?: CsLessonStageLocale
}

export interface CsLessonSummary {
  lessonId: string
  title: string
  estMinutes: number
  subject: string
  difficulty: CsLessonMeta['difficulty']
  tags: string[]
  summary: string
}

export interface CsSubjectContent {
  slug: CsSubjectSlug
  moduleId: string
  title: string
  description: string
  level: string
  lessons: CsLessonSummary[]
}

export interface CsLessonDetail {
  lessonId: string
  title: string
  subject: string
  subjectSlug: CsSubjectSlug
  moduleId: string
  moduleTitle: string
  estMinutes: number
  tags: string[]
  content: string
  contentKo: string | null
  interactiveContent: CsLessonInteractiveContent | null
  meta: CsLessonMeta
}

const CONTENT_ROOT = path.join(
  process.cwd(),
  'data',
  'training-content-factory',
  'content',
  'cs-knowledge'
)

const SUBJECT_CONFIG: Record<CsSubjectSlug, { moduleId: string }> = {
  'basic-theory': { moduleId: 'CSK-BT-01' },
  'data-structures': { moduleId: 'CSK-DS-01' },
  algorithms: { moduleId: 'CSK-AL-01' },
  'computer-architecture': { moduleId: 'CSK-CA-01' },
  'operating-systems': { moduleId: 'CSK-OS-01' },
  database: { moduleId: 'CSK-DB-01' },
  networking: { moduleId: 'CSK-NW-01' },
  security: { moduleId: 'CSK-SC-01' },
}

const SUBJECT_ORDER: CsSubjectSlug[] = [
  'basic-theory',
  'data-structures',
  'algorithms',
  'computer-architecture',
  'operating-systems',
  'database',
  'networking',
  'security',
]

function stripQuotes(value: string) {
  return value.trim().replace(/^['"]|['"]$/g, '')
}

function parseFrontmatter(content: string) {
  const match = content.match(/^---\r?\n([\s\S]*?)\r?\n---/)
  if (!match) {
    throw new Error('Missing lesson frontmatter')
  }

  const result: Record<string, string | number | string[]> = {}
  for (const line of match[1].split(/\r?\n/)) {
    const trimmed = line.trim()
    if (!trimmed || !trimmed.includes(':')) continue

    const [key, ...rest] = trimmed.split(':')
    const value = rest.join(':').trim()

    if (value.startsWith('[') && value.endsWith(']')) {
      result[key] = value
        .slice(1, -1)
        .split(',')
        .map((item) => stripQuotes(item))
        .filter(Boolean)
      continue
    }

    if (/^\d+$/.test(value)) {
      result[key] = Number(value)
      continue
    }

    result[key] = stripQuotes(value)
  }

  return result
}

function parseModuleYaml(content: string) {
  const titleMatch = content.match(/^\s*title:\s*(.+)$/m)
  const descriptionMatch = content.match(/^\s*description:\s*(.+)$/m)
  const levelMatch = content.match(/^\s*level:\s*(.+)$/m)
  const subjectMatch = content.match(/^\s*subject:\s*(.+)$/m)

  if (!titleMatch || !descriptionMatch || !levelMatch || !subjectMatch) {
    throw new Error('Invalid module.yaml format')
  }

  return {
    title: stripQuotes(titleMatch[1]),
    description: stripQuotes(descriptionMatch[1]),
    level: stripQuotes(levelMatch[1]),
    subject: stripQuotes(subjectMatch[1]),
  }
}

function isValidStep(step: unknown): step is CsLessonStep {
  if (!step || typeof step !== 'object') return false

  const candidate = step as Partial<CsLessonStep>
  if (!candidate.id || !candidate.type || !candidate.title) return false

  if (candidate.type === 'concept') {
    return typeof candidate.body === 'string'
  }

  if (candidate.type === 'mini_check' || candidate.type === 'apply_check') {
    return (
      typeof candidate.prompt === 'string' &&
      Array.isArray(candidate.options) &&
      candidate.options.length >= 2 &&
      candidate.options.every(
        (option) =>
          option &&
          typeof option === 'object' &&
          'id' in option &&
          'text' in option &&
          typeof option.id === 'string' &&
          typeof option.text === 'string'
      ) &&
      typeof candidate.correctOptionId === 'string' &&
      candidate.options.some((option) => option.id === candidate.correctOptionId) &&
      typeof candidate.explanation === 'string'
    )
  }

  if (candidate.type === 'fill_blank') {
    return (
      typeof candidate.prompt === 'string' &&
      typeof candidate.codeBefore === 'string' &&
      typeof candidate.codeAfter === 'string' &&
      Array.isArray(candidate.options) &&
      candidate.options.length >= 2 &&
      candidate.options.every(
        (option) =>
          option &&
          typeof option === 'object' &&
          'id' in option &&
          'text' in option &&
          typeof option.id === 'string' &&
          typeof option.text === 'string'
      ) &&
      typeof candidate.correctOptionId === 'string' &&
      candidate.options.some((option) => option.id === candidate.correctOptionId) &&
      typeof candidate.explanation === 'string'
    )
  }

  if (candidate.type === 'order') {
    return (
      typeof candidate.prompt === 'string' &&
      Array.isArray(candidate.items) &&
      candidate.items.length >= 2 &&
      candidate.items.every(
        (item) =>
          item &&
          typeof item === 'object' &&
          'id' in item &&
          'text' in item &&
          typeof item.id === 'string' &&
          typeof item.text === 'string'
      ) &&
      (candidate.distractors === undefined ||
        (Array.isArray(candidate.distractors) &&
          candidate.distractors.every(
            (item) =>
              item &&
              typeof item === 'object' &&
              'id' in item &&
              'text' in item &&
              typeof item.id === 'string' &&
              typeof item.text === 'string'
          ))) &&
      typeof candidate.explanation === 'string'
    )
  }

  if (candidate.type === 'worked_example') {
    return (
      typeof candidate.situation === 'string' &&
      Array.isArray(candidate.reasoning) &&
      candidate.reasoning.every((item) => typeof item === 'string') &&
      typeof candidate.takeaway === 'string'
    )
  }

  if (candidate.type === 'summary') {
    return Array.isArray(candidate.bullets) && candidate.bullets.every((item) => typeof item === 'string')
  }

  if (candidate.type === 'code_exercise') {
    const tokens = candidate.tokens
    const answers = candidate.answers
    const result = candidate.result as
      | { kind?: string; output?: unknown; columns?: unknown; rows?: unknown }
      | undefined
    const resultOk =
      !!result &&
      (result.kind === 'browser' ||
        (result.kind === 'console' && typeof result.output === 'string') ||
        (result.kind === 'table' && Array.isArray(result.columns) && Array.isArray(result.rows)))
    return (
      typeof candidate.prompt === 'string' &&
      typeof candidate.lang === 'string' &&
      typeof candidate.codeTemplate === 'string' &&
      Array.isArray(tokens) &&
      tokens.every((t) => typeof t === 'string') &&
      Array.isArray(answers) &&
      answers.length >= 1 &&
      answers.every((t) => typeof t === 'string' && tokens.includes(t)) &&
      resultOk &&
      typeof candidate.explanation === 'string'
    )
  }

  return false
}

function isValidLocale(locale: unknown): locale is CsLessonStageLocale {
  if (!locale || typeof locale !== 'object') return false

  const candidate = locale as Partial<CsLessonStageLocale>
  return (
    !!candidate.hook &&
    typeof candidate.hook.title === 'string' &&
    typeof candidate.hook.prompt === 'string' &&
    Array.isArray(candidate.steps) &&
    candidate.steps.length > 0 &&
    candidate.steps.every(isValidStep)
  )
}

export function parseInteractiveContent(raw: string): CsLessonInteractiveContent {
  const parsed = JSON.parse(raw) as CsLessonInteractiveContent

  if (
    parsed.version !== 1 ||
    !isValidLocale(parsed.ja) ||
    (parsed.ko !== undefined && !isValidLocale(parsed.ko))
  ) {
    throw new Error('Invalid CS lesson interactive content schema')
  }

  return parsed
}

function getModuleDir(moduleId: string) {
  return path.join(CONTENT_ROOT, 'modules', moduleId)
}

async function readModule(moduleId: string) {
  const moduleDir = getModuleDir(moduleId)
  const moduleYaml = await readFile(path.join(moduleDir, 'module.yaml'), 'utf8')
  const parsedModule = parseModuleYaml(moduleYaml)
  const lessonsDir = path.join(moduleDir, 'lessons')
  const lessonFiles = (await readdir(lessonsDir))
    .filter((file) => file.endsWith('.mdx') && !file.endsWith('.ko.mdx'))
    .sort()

  const lessons = await Promise.all(
    lessonFiles.map(async (file) => {
      const content = await readFile(path.join(lessonsDir, file), 'utf8')
      const frontmatter = parseFrontmatter(content)
      const lessonId = String(frontmatter.lesson_id)
      const meta = JSON.parse(
        await readFile(path.join(lessonsDir, `${lessonId}.meta.json`), 'utf8')
      ) as CsLessonMeta

        return {
          lessonId,
          title: getCsLessonDisplayTitle(lessonId, String(frontmatter.title)),
          estMinutes: Number(frontmatter.est_minutes),
          subject: String(frontmatter.subject),
          difficulty: meta.difficulty,
        tags: Array.isArray(frontmatter.tags) ? frontmatter.tags.map(String) : [],
        summary: meta.summary,
      } satisfies CsLessonSummary
    })
  )

  return {
    ...parsedModule,
    lessons,
  }
}

export async function getAllCsSubjectContents(): Promise<CsSubjectContent[]> {
  const entries = SUBJECT_ORDER.map((slug) => [slug, SUBJECT_CONFIG[slug]] as const)

  return Promise.all(
    entries.map(async ([slug, config]) => {
      const moduleData = await readModule(config.moduleId)
      return {
        slug,
        moduleId: config.moduleId,
        title: getCsSubjectDisplayTitle(slug),
        description: getCsSubjectDisplayDescription(slug),
        level: moduleData.level,
        lessons: moduleData.lessons,
      }
    })
  )
}

export async function getCsSubjectContent(slug: CsSubjectSlug) {
  const config = SUBJECT_CONFIG[slug]
  if (!config) return null

  const moduleData = await readModule(config.moduleId)
  return {
    slug,
    moduleId: config.moduleId,
    title: getCsSubjectDisplayTitle(slug),
    description: getCsSubjectDisplayDescription(slug),
    level: moduleData.level,
    lessons: moduleData.lessons,
  } satisfies CsSubjectContent
}

export async function getCsLessonDetail(lessonId: string): Promise<CsLessonDetail | null> {
  const entries = SUBJECT_ORDER.map((slug) => [slug, SUBJECT_CONFIG[slug]] as const)

  for (const [subjectSlug, config] of entries) {
    const moduleDir = getModuleDir(config.moduleId)
    const lessonPath = path.join(moduleDir, 'lessons', `${lessonId}.mdx`)

    try {
      const content = await readFile(lessonPath, 'utf8')
      const frontmatter = parseFrontmatter(content)
      const moduleYaml = await readFile(path.join(moduleDir, 'module.yaml'), 'utf8')
      const moduleData = parseModuleYaml(moduleYaml)
      const meta = JSON.parse(
        await readFile(path.join(moduleDir, 'lessons', `${lessonId}.meta.json`), 'utf8')
      ) as CsLessonMeta

      let contentKo: string | null = null
      try {
        contentKo = await readFile(
          path.join(moduleDir, 'lessons', `${lessonId}.ko.mdx`),
          'utf8'
        )
      } catch {
        contentKo = null
      }

      let interactiveContent: CsLessonInteractiveContent | null = null
      try {
        interactiveContent = parseInteractiveContent(
          await readFile(path.join(moduleDir, 'lessons', `${lessonId}.stage.json`), 'utf8')
        )
      } catch {
        interactiveContent = null
      }

      return {
        lessonId,
        title: getCsLessonDisplayTitle(lessonId, String(frontmatter.title)),
        subject: String(frontmatter.subject),
        subjectSlug,
        moduleId: config.moduleId,
        moduleTitle: getCsSubjectDisplayTitle(subjectSlug),
        estMinutes: Number(frontmatter.est_minutes),
        tags: Array.isArray(frontmatter.tags) ? frontmatter.tags.map(String) : [],
        content,
        contentKo,
        interactiveContent,
        meta,
      }
    } catch {
      continue
    }
  }

  return null
}
