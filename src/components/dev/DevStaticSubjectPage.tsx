import Link from 'next/link'
import { CheckCircle2, Lock } from 'lucide-react'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import DevSubjectPathMobile from './DevSubjectPathMobile'
import type { DevVirtualCourse } from '@/lib/dev-course'

const DIFFICULTY_LABELS: Record<string, string> = {
  foundation: '初級',
  intermediate: '応用',
  advanced: '上級',
}

const CERT_LEVEL_LABELS: Record<string, string> = {
  beginner: 'ブロンズ',
  intermediate: 'シルバー',
  advanced: 'ゴールド',
}

interface CertCourse {
  id: string
  title: string
  difficulty: string
  isLocked: boolean
  isCompleted: boolean
  lessons: Array<{ id: string; title: string; sort_order: number; duration_minutes: number }>
}

export default function DevStaticSubjectPage({
  course,
  subjectLabel,
  quizCategory,
  activeTab = 'learn',
  certCourses,
}: {
  course: DevVirtualCourse
  subjectLabel: string
  quizCategory?: string
  activeTab?: 'learn' | 'cert'
  certCourses?: CertCourse[]
}) {
  const progress =
    course.totalLessons > 0
      ? Math.round((course.completedLessons / course.totalLessons) * 100)
      : 0

  const pathname = `/dev/${quizCategory ?? 'java'}`
  const totalCertLessons = certCourses?.reduce((sum, c) => sum + c.lessons.length, 0) ?? 0

  return (
    <div>
      <div className="mb-6">
        <Badge label="dev" variant="default" />
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{subjectLabel}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{course.description}</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty}
        </span>
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {course.completedLessons}/{course.totalLessons} レッスン
        </span>
      </div>

      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
            <div className="h-2 rounded-full bg-orange-500" style={{ width: `${progress}%` }} />
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">{progress}% 進行</span>
        </div>
      </div>

      {/* Tab bar — only show when cert content exists */}
      {certCourses !== undefined ? (
        <div className="mb-6 flex gap-1 overflow-x-auto border-b border-gray-200 pb-px dark:border-white/[0.06]">
          <Link
            href={pathname}
            className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
              activeTab === 'learn'
                ? 'border-orange-600 text-orange-700 dark:border-orange-500 dark:text-orange-400'
                : 'border-transparent text-zinc-500 hover:border-zinc-300 hover:text-zinc-700 dark:text-zinc-400 dark:hover:border-zinc-600 dark:hover:text-zinc-200'
            }`}
          >
            学習
          </Link>
          <Link
            href={`${pathname}?tab=cert`}
            className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
              activeTab === 'cert'
                ? 'border-orange-600 text-orange-700 dark:border-orange-500 dark:text-orange-400'
                : 'border-transparent text-zinc-500 hover:border-zinc-300 hover:text-zinc-700 dark:text-zinc-400 dark:hover:border-zinc-600 dark:hover:text-zinc-200'
            }`}
          >
            資格証
            {totalCertLessons > 0 && (
              <span className="ml-1.5 rounded-full bg-zinc-100 px-2 py-0.5 text-xs text-zinc-600 dark:bg-white/10 dark:text-zinc-400">
                {totalCertLessons}
              </span>
            )}
          </Link>
        </div>
      ) : null}

      {activeTab === 'cert' && certCourses ? (
        /* Cert tab content */
        <div className="space-y-6">
          <div className="mb-4">
            <h2 className="text-lg font-semibold text-gray-900 dark:text-white">Java 資格証コース</h2>
            <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
              ブロンズ・シルバー・ゴールドの3段階で構成された詳細なJava学習コースです。
            </p>
          </div>
          {certCourses.map(certCourse => (
            <Card
              key={certCourse.id}
              title={`${CERT_LEVEL_LABELS[certCourse.difficulty] ?? certCourse.difficulty} — ${certCourse.title} (${certCourse.lessons.length})`}
            >
              {certCourse.isLocked ? (
                <div className="flex items-center gap-3 py-4 text-sm text-gray-400 dark:text-gray-500">
                  <Lock className="h-5 w-5" />
                  <span>前のコースを完了すると解放されます</span>
                </div>
              ) : (
                <div className="divide-y divide-gray-100 dark:divide-gray-700">
                  {certCourse.lessons.map((lesson, index) => (
                    <Link
                      key={lesson.id}
                      href={`/courses/${certCourse.id}/lessons/${lesson.id}`}
                      className="flex items-center gap-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-800"
                    >
                      <div className="flex h-8 w-8 items-center justify-center rounded-full bg-gray-100 text-xs font-bold text-gray-500 dark:bg-gray-700 dark:text-gray-400">
                        {index + 1}
                      </div>
                      <div className="flex-1">
                        <div className="text-xs text-gray-500 dark:text-gray-400">
                          {lesson.duration_minutes}分
                        </div>
                        <p className="mt-1 text-sm font-medium text-gray-900 dark:text-white">
                          {lesson.title}
                        </p>
                      </div>
                    </Link>
                  ))}
                </div>
              )}
            </Card>
          ))}
        </div>
      ) : (
        <>
          {/* 리스트 — 화면폭과 무관하게 항상 웹 레이아웃 */}
          <div>
            <Card title={`レッスン (${course.totalLessons})`}>
              <div className="divide-y divide-gray-100 dark:divide-gray-700">
                {course.lessons.map((lesson, index) => (
                  <Link
                    key={lesson.lessonId}
                    href={`/dev/lessons/${lesson.lessonId}`}
                    className="flex items-center gap-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-800"
                  >
                    <div
                      className={`flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold ${
                        lesson.isCompleted
                          ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-300'
                          : 'bg-gray-100 text-gray-500 dark:bg-gray-700 dark:text-gray-400'
                      }`}
                    >
                      {lesson.isCompleted ? <CheckCircle2 className="h-4 w-4" /> : index + 1}
                    </div>
                    <div className="flex-1">
                      <div className="flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                        <span>{lesson.estMinutes}分</span>
                        <span>{DIFFICULTY_LABELS[lesson.difficulty] ?? lesson.difficulty}</span>
                      </div>
                      <p className="mt-1 text-sm font-medium text-gray-900 dark:text-white">
                        {lesson.title}
                      </p>
                      <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{lesson.summary}</p>
                    </div>
                  </Link>
                ))}
              </div>
            </Card>
          </div>

          {/* Mobile Mimo식 학습 경로 — 비활성(항상 숨김) */}
          <div className="hidden">
            <DevSubjectPathMobile course={course} />
          </div>
        </>
      )}
    </div>
  )
}
