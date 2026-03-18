import { readdir, readFile } from 'node:fs/promises'
import path from 'node:path'

export type DevLang = 'ja' | 'ko'

export type DevSubjectSlug =
  | 'common-workplace-fundamentals'
  | 'java'
  | 'javascript'
  | 'python'
  | 'sql'
  | 'spring-boot'
  | 'react'
  | 'nextjs'

export interface DevLessonMeta {
  lesson_id: string
  category: 'dev-practical-skills'
  subject: string
  topic: string
  summary: string
  key_points: string[]
  misconceptions: string[]
  check_questions: string[]
  exam_extractables: {
    fact_candidates: string[]
    practical_judgment_candidates: string[]
    error_interpretation_candidates: string[]
    scenario_candidates: string[]
    common_wrong_answer_patterns: string[]
  }
}

export interface DevLessonSummary {
  lessonId: string
  title: string
  estMinutes: number
  subject: string
  tags: string[]
  summary: string
}

export interface DevModuleContent {
  moduleId: string
  title: string
  description: string
  level: string
  lessons: DevLessonSummary[]
}

export interface DevSubjectContent {
  slug: DevSubjectSlug
  modules: DevModuleContent[]
}

export interface DevLessonDetail {
  lessonId: string
  title: string
  subject: string
  subjectSlug: DevSubjectSlug
  moduleId: string
  moduleTitle: string
  estMinutes: number
  tags: string[]
  content: string
  meta: DevLessonMeta
  lang: DevLang
  hasKo: boolean
}

const CONTENT_ROOT = path.join(
  process.cwd(),
  'data',
  'training-content-factory',
  'content',
  'dev-practical-skills'
)

const SUBJECT_CONFIG: Record<DevSubjectSlug, { moduleIds: string[] }> = {
  'common-workplace-fundamentals': {
    moduleIds: [
      'DEV-CWF-01', 'DEV-CWF-02', 'DEV-CWF-03', 'DEV-CWF-04',
      'DEV-CWF-05', 'DEV-CWF-06', 'DEV-CWF-07', 'DEV-CWF-08',
    ],
  },
  java: { moduleIds: ['DEV-JAVA-01', 'DEV-JAVA-02', 'DEV-JAVA-03', 'DEV-JAVA-04'] },
  javascript: { moduleIds: ['DEV-JS-01', 'DEV-JS-02', 'DEV-JS-03', 'DEV-JS-04'] },
  python: { moduleIds: ['DEV-PY-01', 'DEV-PY-02', 'DEV-PY-03'] },
  sql: { moduleIds: ['DEV-SQL-01', 'DEV-SQL-02', 'DEV-SQL-03'] },
  'spring-boot': { moduleIds: ['DEV-SB-01', 'DEV-SB-02', 'DEV-SB-03', 'DEV-SB-04'] },
  react: { moduleIds: ['DEV-REACT-01', 'DEV-REACT-02', 'DEV-REACT-03', 'DEV-REACT-04'] },
  nextjs: { moduleIds: ['DEV-NEXT-01', 'DEV-NEXT-02', 'DEV-NEXT-03'] },
}

const LEVEL_ORDER: Record<string, number> = {
  foundation: 0,
  intermediate: 1,
  advanced: 2,
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

  if (!titleMatch || !descriptionMatch || !levelMatch) {
    throw new Error('Invalid module.yaml format')
  }

  return {
    title: stripQuotes(titleMatch[1]),
    description: stripQuotes(descriptionMatch[1]),
    level: stripQuotes(levelMatch[1]),
  }
}

function getModuleDir(moduleId: string) {
  return path.join(CONTENT_ROOT, 'modules', moduleId)
}

async function readModule(moduleId: string): Promise<DevModuleContent> {
  const moduleDir = getModuleDir(moduleId)
  const moduleYaml = await readFile(path.join(moduleDir, 'module.yaml'), 'utf8')
  const parsedModule = parseModuleYaml(moduleYaml)
  const lessonsDir = path.join(moduleDir, 'lessons')

  let lessons: DevLessonSummary[] = []
  try {
    const lessonFiles = (await readdir(lessonsDir))
      .filter((file) => file.endsWith('.mdx') && !file.endsWith('.ko.mdx'))
      .sort()

    lessons = await Promise.all(
      lessonFiles.map(async (file) => {
        const content = await readFile(path.join(lessonsDir, file), 'utf8')
        const frontmatter = parseFrontmatter(content)
        const lessonId = String(frontmatter.lesson_id)
        const meta = JSON.parse(
          await readFile(path.join(lessonsDir, `${lessonId}.meta.json`), 'utf8')
        ) as DevLessonMeta

        return {
          lessonId,
          title: String(frontmatter.title),
          estMinutes: Number(frontmatter.est_minutes),
          subject: String(frontmatter.subject),
          tags: Array.isArray(frontmatter.tags) ? frontmatter.tags.map(String) : [],
          summary: meta.summary,
        } satisfies DevLessonSummary
      })
    )
  } catch {
    // lessons directory doesn't exist — return empty array
  }

  return {
    moduleId,
    ...parsedModule,
    lessons,
  }
}

export async function getDevSubjectContent(slug: DevSubjectSlug): Promise<DevSubjectContent | null> {
  const config = SUBJECT_CONFIG[slug]
  if (!config) return null

  const modules = await Promise.all(config.moduleIds.map((id) => readModule(id)))

  modules.sort((a, b) => (LEVEL_ORDER[a.level] ?? 99) - (LEVEL_ORDER[b.level] ?? 99))

  return { slug, modules }
}

export async function getDevLessonDetail(
  lessonId: string,
  lang: DevLang = 'ja'
): Promise<DevLessonDetail | null> {
  const entries = Object.entries(SUBJECT_CONFIG) as Array<
    [DevSubjectSlug, { moduleIds: string[] }]
  >

  for (const [subjectSlug, config] of entries) {
    for (const moduleId of config.moduleIds) {
      const moduleDir = getModuleDir(moduleId)
      const mdxFile = lang === 'ko' ? `${lessonId}.ko.mdx` : `${lessonId}.mdx`
      const lessonPath = path.join(moduleDir, 'lessons', mdxFile)

      try {
        const content = await readFile(lessonPath, 'utf8')
        const frontmatter = parseFrontmatter(content)
        const moduleYaml = await readFile(path.join(moduleDir, 'module.yaml'), 'utf8')
        const moduleData = parseModuleYaml(moduleYaml)
        const meta = JSON.parse(
          await readFile(path.join(moduleDir, 'lessons', `${lessonId}.meta.json`), 'utf8')
        ) as DevLessonMeta

        // Check if Korean version exists
        let hasKo = true
        if (lang !== 'ko') {
          try {
            await readFile(path.join(moduleDir, 'lessons', `${lessonId}.ko.mdx`), 'utf8')
          } catch {
            hasKo = false
          }
        }

        return {
          lessonId,
          title: String(frontmatter.title),
          subject: String(frontmatter.subject),
          subjectSlug,
          moduleId,
          moduleTitle: moduleData.title,
          estMinutes: Number(frontmatter.est_minutes),
          tags: Array.isArray(frontmatter.tags) ? frontmatter.tags.map(String) : [],
          content,
          meta,
          lang,
          hasKo,
        }
      } catch {
        continue
      }
    }
  }

  return null
}
