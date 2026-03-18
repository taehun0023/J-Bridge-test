import { readdir, readFile } from 'node:fs/promises'
import path from 'node:path'

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

export interface CsLessonSummary {
  lessonId: string
  title: string
  estMinutes: number
  subject: string
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

function stripQuotes(value: string) {
  return value.trim().replace(/^['"]|['"]$/g, '')
}

function parseFrontmatter(content: string) {
  const match = content.match(/^---\n([\s\S]*?)\n---/)
  if (!match) {
    throw new Error('Missing lesson frontmatter')
  }

  const result: Record<string, string | number | string[]> = {}
  for (const line of match[1].split('\n')) {
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
        title: String(frontmatter.title),
        estMinutes: Number(frontmatter.est_minutes),
        subject: String(frontmatter.subject),
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
  const entries = Object.entries(SUBJECT_CONFIG) as Array<
    [CsSubjectSlug, { moduleId: string }]
  >

  return Promise.all(
    entries.map(async ([slug, config]) => {
      const moduleData = await readModule(config.moduleId)
      return {
        slug,
        moduleId: config.moduleId,
        title: moduleData.title,
        description: moduleData.description,
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
    title: moduleData.title,
    description: moduleData.description,
    level: moduleData.level,
    lessons: moduleData.lessons,
  } satisfies CsSubjectContent
}

export async function getCsLessonDetail(lessonId: string): Promise<CsLessonDetail | null> {
  const entries = Object.entries(SUBJECT_CONFIG) as Array<
    [CsSubjectSlug, { moduleId: string }]
  >

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

      return {
        lessonId,
        title: String(frontmatter.title),
        subject: String(frontmatter.subject),
        subjectSlug,
        moduleId: config.moduleId,
        moduleTitle: moduleData.title,
        estMinutes: Number(frontmatter.est_minutes),
        tags: Array.isArray(frontmatter.tags) ? frontmatter.tags.map(String) : [],
        content,
        contentKo,
        meta,
      }
    } catch {
      continue
    }
  }

  return null
}
