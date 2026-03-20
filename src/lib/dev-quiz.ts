export type DevQuizSubject =
  | 'common-workplace-fundamentals'
  | 'java'
  | 'javascript'
  | 'python'
  | 'sql'
  | 'spring-boot'
  | 'react'
  | 'nextjs'

export const DEV_QUIZ_UNLOCK_THRESHOLD = 75

export const DEV_QUIZ_SUBJECT_LABELS: Record<DevQuizSubject, string> = {
  'common-workplace-fundamentals': '共通業務基礎',
  java: 'Java',
  javascript: 'JavaScript',
  python: 'Python',
  sql: 'SQL',
  'spring-boot': 'Spring Boot',
  react: 'React',
  nextjs: 'Next.js',
}

export const DEV_QUIZ_SET_DEFINITIONS = [
  { quizId: 'e0000001-0000-0000-0000-000000000001', category: 'java', courseId: 'dev-java', questionCategory: 'java_core' },
  { quizId: 'e0000001-0000-0000-0000-000000000002', category: 'spring_boot', courseId: 'dev-spring-boot', questionCategory: 'spring_boot' },
  { quizId: 'e0000001-0000-0000-0000-000000000003', category: 'sql', courseId: 'dev-sql', questionCategory: 'sql' },
  { quizId: 'e0000001-0000-0000-0000-000000000004', category: 'javascript', courseId: 'dev-javascript', questionCategory: 'javascript_core' },
  { quizId: 'e0000001-0000-0000-0000-000000000005', category: 'react', courseId: 'dev-react', questionCategory: 'react' },
  { quizId: 'e0000001-0000-0000-0000-000000000007', category: 'cwf', courseId: 'dev-common-workplace-fundamentals', questionCategory: 'cwf' },
  { quizId: 'e0000001-0000-0000-0000-000000000008', category: 'python', courseId: 'dev-python', questionCategory: 'python' },
  { quizId: 'e0000001-0000-0000-0000-000000000009', category: 'nextjs', courseId: 'dev-nextjs', questionCategory: 'nextjs' },
] as const

export type DevQuizDef = (typeof DEV_QUIZ_SET_DEFINITIONS)[number]

const defByQuizId = new Map<string, DevQuizDef>(DEV_QUIZ_SET_DEFINITIONS.map((d) => [d.quizId, d]))
const defIndexByQuizId = new Map<string, number>(DEV_QUIZ_SET_DEFINITIONS.map((d, i) => [d.quizId, i]))

export function getDevQuizDef(quizId: string): DevQuizDef | undefined {
  return defByQuizId.get(quizId)
}

export function isKnownDevPoolQuiz(quizId: string): boolean {
  return defByQuizId.has(quizId)
}

export function getDevQuizSortKey(quizId: string): number {
  return defIndexByQuizId.get(quizId) ?? 999
}

export function toDevCourseId(subject: string) {
  return `dev-${subject}` as const
}

export function getDevQuizUnlockState(completedLessons: number, totalLessons: number) {
  const progressPct =
    totalLessons > 0 ? Math.round((completedLessons / totalLessons) * 100) : 0

  return {
    progressPct,
    unlocked: totalLessons > 0 && progressPct >= DEV_QUIZ_UNLOCK_THRESHOLD,
    lockedReason: `進行率${DEV_QUIZ_UNLOCK_THRESHOLD}%以上でテストが解放されます`,
  }
}
