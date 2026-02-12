'use client'

import { useState, useTransition } from 'react'
import { approveRetakeRequest, denyRetakeRequest } from '@/app/actions/admin'
import { createLearningAssignment, deleteLearningAssignment } from '@/app/actions/learning-assignments'
import { approveExam, denyExam } from '@/app/actions/comprehensive-exam'
import { ASSIGNMENT_CATEGORIES, JLPT_LEVELS, getCategoryLabel, getSubcategoryLabel } from '@/lib/assignment-categories'

interface RetakeRequest {
  attempt_id: string
  user_id: string
  user_name: string | null
  quiz_title: string | null
  retake_requested_at: string | null
}

interface LearningAssignmentRow {
  id: string
  assigned_to: string
  category: string
  subcategory: string
  content_level: string | null
  title: string
  description: string | null
  due_date: string | null
  status: string
  required_quiz_ids: string[]
  passed_quiz_ids: string[]
  created_at: string
  assignee: { full_name: string | null; email: string } | null
}

interface ExamRequest {
  id: string
  user_id: string
  category: string
  subcategory: string
  content_level: string | null
  status: string
  requested_at: string
  score: number | null
  user: { full_name: string | null; email: string } | null
}

interface User {
  id: string
  full_name: string | null
  email: string
  role: string
}

const statusColors: Record<string, string> = {
  pending: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400',
  in_progress: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  completed: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
  overdue: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
  requested: 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400',
  approved: 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400',
  denied: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
  failed: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
}

const statusLabels: Record<string, string> = {
  pending: '待機',
  in_progress: '進行中',
  completed: '完了',
  overdue: '期限超過',
  requested: 'リクエスト中',
  approved: '承認済',
  denied: '拒否',
  failed: '不合格',
}

interface QuestionClaim {
  question_id: string
  question_text: string
  quiz_title: string
  claim_count: number
}

interface Props {
  learningAssignments: LearningAssignmentRow[]
  examRequests: ExamRequest[]
  retakeRequests: RetakeRequest[]
  questionClaims: QuestionClaim[]
  users: User[]
  currentRole: string
}

export default function AdminTasksClient({ learningAssignments, examRequests, retakeRequests, questionClaims, users, currentRole }: Props) {
  const [activeTab, setActiveTab] = useState<'learning' | 'approvals' | 'claims'>('learning')
  const [showForm, setShowForm] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)

  // Cascade form state
  const [selectedCategory, setSelectedCategory] = useState('')
  const [selectedSubcategory, setSelectedSubcategory] = useState('')

  function showMsg(msg: string) {
    setMessage(msg)
    setTimeout(() => setMessage(null), 3000)
  }

  const catConfig = selectedCategory ? ASSIGNMENT_CATEGORIES[selectedCategory] : null
  const isLevelOnly = catConfig?.levelOnly === true

  const subcategories = selectedCategory && !isLevelOnly
    ? catConfig?.subcategories ?? {}
    : {}

  const hasLevel = isLevelOnly
    ? true
    : (selectedCategory && selectedSubcategory
      ? ASSIGNMENT_CATEGORIES[selectedCategory]?.subcategories[selectedSubcategory]?.hasLevel ?? false
      : false)

  async function handleCreateLearning(formData: FormData) {
    startTransition(async () => {
      const result = await createLearningAssignment(formData)
      if (result.error) showMsg(result.error)
      else {
        showMsg('学習課題を配信しました')
        setShowForm(false)
        setSelectedCategory('')
        setSelectedSubcategory('')
      }
    })
  }

  function handleApproveRetake(attemptId: string) {
    startTransition(async () => {
      const result = await approveRetakeRequest(attemptId)
      if (result.error) showMsg(result.error)
      else showMsg('再試験を承認しました')
    })
  }

  function handleDenyRetake(attemptId: string) {
    if (!confirm('再試験リクエストを拒否しますか？')) return
    startTransition(async () => {
      const result = await denyRetakeRequest(attemptId)
      if (result.error) showMsg(result.error)
      else showMsg('再試験を拒否しました')
    })
  }

  function handleDeleteLearning(id: string) {
    if (!confirm('学習課題を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteLearningAssignment(id)
      if (result.error) showMsg(result.error)
      else showMsg('削除されました')
    })
  }

  function handleApproveExam(examId: string) {
    startTransition(async () => {
      const result = await approveExam(examId)
      if (result.error) showMsg(result.error)
      else showMsg('試験を承認しました')
    })
  }

  function handleDenyExam(examId: string) {
    if (!confirm('試験リクエストを拒否しますか？')) return
    startTransition(async () => {
      const result = await denyExam(examId)
      if (result.error) showMsg(result.error)
      else showMsg('試験を拒否しました')
    })
  }

  function getProgressPercent(assignment: LearningAssignmentRow) {
    const total = assignment.required_quiz_ids?.length ?? 0
    const passed = assignment.passed_quiz_ids?.length ?? 0
    if (total === 0) return 0
    return Math.round((passed / total) * 100)
  }

  const pendingApprovals = retakeRequests.length + examRequests.filter(e => e.status === 'requested').length

  const tabs = [
    { key: 'learning' as const, label: '学習課題' },
    { key: 'approvals' as const, label: '承認リクエスト' },
    { key: 'claims' as const, label: '問題クレーム' },
  ]

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      {/* Tabs */}
      <div className="flex gap-1 rounded-lg bg-gray-100 p-1 dark:bg-gray-800 mb-4">
        {tabs.map(tab => (
          <button
            key={tab.key}
            onClick={() => { setActiveTab(tab.key); setShowForm(false) }}
            className={`flex-1 rounded-md px-3 py-2 text-sm font-medium transition-colors ${
              activeTab === tab.key
                ? 'bg-white text-gray-900 shadow-sm dark:bg-gray-700 dark:text-white'
                : 'text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200'
            }`}
          >
            {tab.label}
            {tab.key === 'approvals' && pendingApprovals > 0 && (
              <span className="ml-1.5 inline-flex h-5 min-w-5 items-center justify-center rounded-full bg-red-500 px-1 text-[10px] font-bold text-white">
                {pendingApprovals}
              </span>
            )}
            {tab.key === 'claims' && questionClaims.length > 0 && (
              <span className="ml-1.5 inline-flex h-5 min-w-5 items-center justify-center rounded-full bg-amber-500 px-1 text-[10px] font-bold text-white">
                {questionClaims.length}
              </span>
            )}
          </button>
        ))}
      </div>

      {/* Learning Assignments Tab */}
      {activeTab === 'learning' && (
        <>
          <button
            onClick={() => setShowForm(!showForm)}
            className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700"
          >
            {showForm ? 'キャンセル' : '+ 学習課題配信'}
          </button>

          {showForm && (
            <form action={handleCreateLearning} className="mt-4 rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-800">
              <h3 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">新規学習課題</h3>
              <div className="grid gap-4 sm:grid-cols-2">
                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">配分対象 *</label>
                  <select name="assigned_to" required
                    className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    <option value="">選択...</option>
                    {users.map(u => (
                      <option key={u.id} value={u.id}>{u.full_name ?? u.email}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">カテゴリ *</label>
                  <select
                    name="category"
                    required
                    value={selectedCategory}
                    onChange={e => { setSelectedCategory(e.target.value); setSelectedSubcategory('') }}
                    className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                  >
                    <option value="">選択...</option>
                    {Object.entries(ASSIGNMENT_CATEGORIES).map(([key, cat]) => (
                      <option key={key} value={key}>{cat.label}</option>
                    ))}
                  </select>
                </div>
                {isLevelOnly ? (
                  <input type="hidden" name="subcategory" value="all" />
                ) : (
                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">サブカテゴリ *</label>
                    <select
                      name="subcategory"
                      required
                      value={selectedSubcategory}
                      onChange={e => setSelectedSubcategory(e.target.value)}
                      disabled={!selectedCategory}
                      className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none disabled:opacity-50 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                    >
                      <option value="">選択...</option>
                      {Object.entries(subcategories).map(([key, sub]) => (
                        <option key={key} value={key}>{sub.label}</option>
                      ))}
                    </select>
                  </div>
                )}
                {hasLevel && (
                  <div>
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">レベル{isLevelOnly ? ' *' : ''}</label>
                    <select name="content_level" required={isLevelOnly}
                      className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                      <option value="">{isLevelOnly ? '選択...' : '全レベル'}</option>
                      {JLPT_LEVELS.map(level => (
                        <option key={level} value={level}>{level}</option>
                      ))}
                    </select>
                  </div>
                )}
                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">タイトル *</label>
                  <input name="title" required
                    className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">期限</label>
                  <input name="due_date" type="date"
                    className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                </div>
                <div className="sm:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">説明</label>
                  <textarea name="description" rows={2}
                    className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                </div>
              </div>
              <button type="submit" disabled={pending}
                className="mt-4 rounded-lg bg-indigo-600 px-6 py-2 text-sm font-medium text-white hover:bg-indigo-700 disabled:opacity-50">
                {pending ? '配信中...' : '配信'}
              </button>
            </form>
          )}

          {/* Learning assignments table */}
          <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead className="bg-gray-50 dark:bg-gray-700">
                  <tr>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">対象者</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">カテゴリ</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">進捗</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">期限</th>
                    <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                  {learningAssignments.map(la => {
                    const progress = getProgressPercent(la)
                    return (
                      <tr key={la.id}>
                        <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{la.title}</td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {(la.assignee as { full_name: string | null } | null)?.full_name ?? '-'}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {getCategoryLabel(la.category)} &gt; {getSubcategoryLabel(la.category, la.subcategory)}
                          {la.content_level && ` (${la.content_level})`}
                        </td>
                        <td className="px-4 py-3">
                          <div className="flex items-center gap-2">
                            <div className="h-2 w-16 rounded-full bg-gray-200 dark:bg-gray-600">
                              <div
                                className="h-2 rounded-full bg-indigo-500 transition-all"
                                style={{ width: `${progress}%` }}
                              />
                            </div>
                            <span className="text-xs text-gray-500 dark:text-gray-400">{progress}%</span>
                          </div>
                        </td>
                        <td className="px-4 py-3">
                          <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${statusColors[la.status] ?? 'bg-gray-100 text-gray-600'}`}>
                            {statusLabels[la.status] ?? la.status}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                          {la.due_date ? new Date(la.due_date).toLocaleDateString('ja-JP') : '-'}
                        </td>
                        <td className="px-4 py-3 text-right">
                          <button
                            onClick={() => handleDeleteLearning(la.id)}
                            disabled={pending}
                            className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                          >
                            削除
                          </button>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
            {learningAssignments.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">学習課題がありません</div>
            )}
          </div>
        </>
      )}

      {/* Claims Tab */}
      {activeTab === 'claims' && (
        <div>
          <h3 className="mb-3 text-sm font-semibold text-gray-700 dark:text-gray-300">問題クレーム集計</h3>
          <div className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead className="bg-gray-50 dark:bg-gray-700">
                  <tr>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">クレーム数</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">クイズ</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">問題テキスト</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                  {questionClaims.map(claim => (
                    <tr key={claim.question_id}>
                      <td className="px-4 py-3">
                        <span className="inline-flex h-6 min-w-6 items-center justify-center rounded-full bg-red-100 px-2 text-xs font-bold text-red-700 dark:bg-red-900/30 dark:text-red-400">
                          {claim.claim_count}
                        </span>
                      </td>
                      <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                        {claim.quiz_title || '-'}
                      </td>
                      <td className="px-4 py-3 text-sm text-gray-900 dark:text-white max-w-md truncate">
                        {claim.question_text}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            {questionClaims.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">クレームがありません</div>
            )}
          </div>
        </div>
      )}

      {/* Approvals Tab */}
      {activeTab === 'approvals' && (
        <div className="space-y-6">
          {/* Retake Requests */}
          <div>
            <h3 className="mb-3 text-sm font-semibold text-gray-700 dark:text-gray-300">再試験リクエスト</h3>
            <div className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                  <thead className="bg-gray-50 dark:bg-gray-700">
                    <tr>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">ユーザー名</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">クイズ</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">リクエスト日</th>
                      <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                    {retakeRequests.map(req => (
                      <tr key={req.attempt_id}>
                        <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">
                          {req.user_name ?? '-'}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {req.quiz_title ?? '-'}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                          {req.retake_requested_at ? new Date(req.retake_requested_at).toLocaleDateString('ja-JP') : '-'}
                        </td>
                        <td className="px-4 py-3 text-right">
                          <div className="flex justify-end gap-2">
                            <button
                              onClick={() => handleApproveRetake(req.attempt_id)}
                              disabled={pending}
                              className="rounded-md bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-700 disabled:opacity-50"
                            >
                              承認
                            </button>
                            <button
                              onClick={() => handleDenyRetake(req.attempt_id)}
                              disabled={pending}
                              className="rounded-md bg-red-600 px-3 py-1 text-xs font-medium text-white hover:bg-red-700 disabled:opacity-50"
                            >
                              拒否
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {retakeRequests.length === 0 && (
                <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">再試験リクエストがありません</div>
              )}
            </div>
          </div>

          {/* Comprehensive Exam Requests */}
          <div>
            <h3 className="mb-3 text-sm font-semibold text-gray-700 dark:text-gray-300">総合試験リクエスト</h3>
            <div className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                  <thead className="bg-gray-50 dark:bg-gray-700">
                    <tr>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">ユーザー名</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">カテゴリ</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">リクエスト日</th>
                      <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                    {examRequests.map(exam => (
                      <tr key={exam.id}>
                        <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">
                          {(exam.user as { full_name: string | null } | null)?.full_name ?? '-'}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {getCategoryLabel(exam.category)} &gt; {getSubcategoryLabel(exam.category, exam.subcategory)}
                          {exam.content_level && ` (${exam.content_level})`}
                        </td>
                        <td className="px-4 py-3">
                          <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${statusColors[exam.status] ?? 'bg-gray-100 text-gray-600'}`}>
                            {statusLabels[exam.status] ?? exam.status}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                          {new Date(exam.requested_at).toLocaleDateString('ja-JP')}
                        </td>
                        <td className="px-4 py-3 text-right">
                          {exam.status === 'requested' && (
                            <div className="flex justify-end gap-2">
                              <button
                                onClick={() => handleApproveExam(exam.id)}
                                disabled={pending}
                                className="rounded-md bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-700 disabled:opacity-50"
                              >
                                承認
                              </button>
                              <button
                                onClick={() => handleDenyExam(exam.id)}
                                disabled={pending}
                                className="rounded-md bg-red-600 px-3 py-1 text-xs font-medium text-white hover:bg-red-700 disabled:opacity-50"
                              >
                                拒否
                              </button>
                            </div>
                          )}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {examRequests.length === 0 && (
                <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">試験リクエストがありません</div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
