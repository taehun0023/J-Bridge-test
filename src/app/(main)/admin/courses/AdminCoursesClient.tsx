'use client'

import { useState, useTransition } from 'react'
import TabBar from '@/components/ui/TabBar'
import Badge from '@/components/ui/Badge'
import { updateCoursePublished, deleteCourse } from '@/app/actions/admin'

interface Course {
  id: string
  title: string
  description: string | null
  category: string
  difficulty: string
  is_published: boolean
  sort_order: number
}

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
  created_at: string
}

interface CodingProblem {
  id: string
  title: string
  difficulty: string
  language: string
  created_at: string
}

const tabs = [
  { key: 'courses', label: 'コース' },
  { key: 'quizzes', label: 'クイズ' },
  { key: 'problems', label: 'コーディング問題' },
]

const categoryLabels: Record<string, string> = {
  jlpt_prep: 'JLPT',
  it_japanese: 'IT日本語',
  core_programming: 'プログラミング',
  framework: 'フレームワーク',
  algorithm: 'アルゴリズム',
  project: 'プロジェクト',
  attitude_culture: '態度・文化',
}

const quizTypeLabels: Record<string, string> = {
  jlpt_vocab: 'JLPT語彙',
  jlpt_grammar: 'JLPT文法',
  jlpt_reading: 'JLPT読解',
  jlpt_listening: 'JLPT聴解',
  it_terminology: 'IT用語',
  role_play_scenario: 'ロールプレイ',
  attitude_culture: '態度・文化',
}

export default function AdminCoursesClient({
  courses,
  quizzes,
  codingProblems,
}: {
  courses: Course[]
  quizzes: Quiz[]
  codingProblems: CodingProblem[]
}) {
  const [tab, setTab] = useState('courses')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)

  function togglePublish(courseId: string, current: boolean) {
    startTransition(async () => {
      const result = await updateCoursePublished(courseId, !current)
      if (result.error) setMessage(result.error)
      else setMessage(current ? '非公開にしました' : '公開しました')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDelete(courseId: string) {
    if (!confirm('本当に削除しますか？')) return
    startTransition(async () => {
      const result = await deleteCourse(courseId)
      if (result.error) setMessage(result.error)
      else setMessage('削除されました')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      <TabBar tabs={tabs} activeKey={tab} onChange={setTab} />

      {tab === 'courses' && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
              <thead className="bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">カテゴリ</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">難易度</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                  <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                {courses.map(course => (
                  <tr key={course.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{course.title}</td>
                    <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                      {categoryLabels[course.category] ?? course.category}
                    </td>
                    <td className="px-4 py-3">
                      <Badge label={course.difficulty} variant="difficulty" />
                    </td>
                    <td className="px-4 py-3">
                      <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                        course.is_published
                          ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'
                          : 'bg-gray-100 text-gray-600 dark:bg-gray-600 dark:text-gray-300'
                      }`}>
                        {course.is_published ? '公開' : '非公開'}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-right">
                      <button
                        onClick={() => togglePublish(course.id, course.is_published)}
                        disabled={pending}
                        className="mr-2 text-xs text-blue-600 hover:underline disabled:opacity-50 dark:text-blue-400"
                      >
                        {course.is_published ? '非公開' : '公開'}
                      </button>
                      <button
                        onClick={() => handleDelete(course.id)}
                        disabled={pending}
                        className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                      >
                        削除
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {tab === 'quizzes' && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
              <thead className="bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">種類</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">合格点</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">制限時間</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">作成日</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                {quizzes.map(quiz => (
                  <tr key={quiz.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{quiz.title}</td>
                    <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                      {quizTypeLabels[quiz.quiz_type] ?? quiz.quiz_type}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">{quiz.passing_score}点</td>
                    <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                      {quiz.time_limit_minutes ? `${quiz.time_limit_minutes}分` : '-'}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                      {new Date(quiz.created_at).toLocaleDateString('ja-JP')}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {quizzes.length === 0 && (
            <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">クイズがありません</div>
          )}
        </div>
      )}

      {tab === 'problems' && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
              <thead className="bg-gray-50 dark:bg-gray-700">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">難易度</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">言語</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">作成日</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                {codingProblems.map(problem => (
                  <tr key={problem.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{problem.title}</td>
                    <td className="px-4 py-3">
                      <Badge label={problem.difficulty} variant="difficulty" />
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400 uppercase">{problem.language}</td>
                    <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                      {new Date(problem.created_at).toLocaleDateString('ja-JP')}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {codingProblems.length === 0 && (
            <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">コーディング問題がありません</div>
          )}
        </div>
      )}
    </div>
  )
}
