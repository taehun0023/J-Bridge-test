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
  { key: 'courses', label: '코스' },
  { key: 'quizzes', label: '퀴즈' },
  { key: 'problems', label: '코딩 문제' },
]

const categoryLabels: Record<string, string> = {
  jlpt_prep: 'JLPT',
  it_japanese: 'IT 일본어',
  core_programming: '프로그래밍',
  framework: '프레임워크',
  algorithm: '알고리즘',
  project: '프로젝트',
  attitude_culture: '태도/문화',
}

const quizTypeLabels: Record<string, string> = {
  jlpt_vocab: 'JLPT 어휘',
  jlpt_grammar: 'JLPT 문법',
  jlpt_reading: 'JLPT 독해',
  jlpt_listening: 'JLPT 청해',
  it_terminology: 'IT 용어',
  role_play_scenario: '롤플레이',
  attitude_culture: '태도/문화',
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
      else setMessage(current ? '비공개 처리되었습니다' : '공개되었습니다')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDelete(courseId: string) {
    if (!confirm('정말 삭제하시겠습니까?')) return
    startTransition(async () => {
      const result = await deleteCourse(courseId)
      if (result.error) setMessage(result.error)
      else setMessage('삭제되었습니다')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700">{message}</div>
      )}

      <TabBar tabs={tabs} activeKey={tab} onChange={setTab} />

      {tab === 'courses' && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">제목</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">카테고리</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">난이도</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">상태</th>
                  <th className="px-4 py-3 text-right text-xs font-medium text-gray-500">작업</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {courses.map(course => (
                  <tr key={course.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900">{course.title}</td>
                    <td className="px-4 py-3 text-sm text-gray-600">
                      {categoryLabels[course.category] ?? course.category}
                    </td>
                    <td className="px-4 py-3">
                      <Badge label={course.difficulty} variant="difficulty" />
                    </td>
                    <td className="px-4 py-3">
                      <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                        course.is_published ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'
                      }`}>
                        {course.is_published ? '공개' : '비공개'}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-right">
                      <button
                        onClick={() => togglePublish(course.id, course.is_published)}
                        disabled={pending}
                        className="mr-2 text-xs text-blue-600 hover:underline disabled:opacity-50"
                      >
                        {course.is_published ? '비공개' : '공개'}
                      </button>
                      <button
                        onClick={() => handleDelete(course.id)}
                        disabled={pending}
                        className="text-xs text-red-600 hover:underline disabled:opacity-50"
                      >
                        삭제
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
        <div className="mt-4 rounded-xl border border-gray-200 bg-white">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">제목</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">유형</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">합격 점수</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">제한 시간</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">생성일</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {quizzes.map(quiz => (
                  <tr key={quiz.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900">{quiz.title}</td>
                    <td className="px-4 py-3 text-sm text-gray-600">
                      {quizTypeLabels[quiz.quiz_type] ?? quiz.quiz_type}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600">{quiz.passing_score}점</td>
                    <td className="px-4 py-3 text-sm text-gray-600">
                      {quiz.time_limit_minutes ? `${quiz.time_limit_minutes}분` : '-'}
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-500">
                      {new Date(quiz.created_at).toLocaleDateString('ko-KR')}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {quizzes.length === 0 && (
            <div className="py-8 text-center text-sm text-gray-400">퀴즈가 없습니다</div>
          )}
        </div>
      )}

      {tab === 'problems' && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">제목</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">난이도</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">언어</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">생성일</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {codingProblems.map(problem => (
                  <tr key={problem.id}>
                    <td className="px-4 py-3 text-sm font-medium text-gray-900">{problem.title}</td>
                    <td className="px-4 py-3">
                      <Badge label={problem.difficulty} variant="difficulty" />
                    </td>
                    <td className="px-4 py-3 text-sm text-gray-600 uppercase">{problem.language}</td>
                    <td className="px-4 py-3 text-sm text-gray-500">
                      {new Date(problem.created_at).toLocaleDateString('ko-KR')}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          {codingProblems.length === 0 && (
            <div className="py-8 text-center text-sm text-gray-400">코딩 문제가 없습니다</div>
          )}
        </div>
      )}
    </div>
  )
}
