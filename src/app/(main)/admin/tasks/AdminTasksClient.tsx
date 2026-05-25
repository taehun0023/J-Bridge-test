'use client'

import { Fragment, useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { createLearningAssignment, deleteLearningAssignment, confirmAssignment, reassignAssignment, getAssigneeUnlockedLevels } from '@/app/actions/learning-assignments'
import { approveExam, denyExam, deleteExam } from '@/app/actions/comprehensive-exam'
import { approveQuizRetake, denyQuizRetake } from '@/app/actions/quiz-retake'
import { ASSIGNMENT_CATEGORIES, JLPT_LEVELS, DEV_LEVELS, getCategoryLabel, getSubcategoryLabel, getContentLevelLabel } from '@/lib/assignment-categories'

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
  overdue_reason: string | null
  overdue_reason_at: string | null
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

interface QuizRetakeRequest {
  id: string
  user_id: string
  user_name: string
  quiz_title: string
  score: number | null
  retake_request_status: string | null
  retake_requested_at: string | null
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
  awaiting_confirmation: 'bg-orange-100 text-orange-700 dark:bg-orange-900/30 dark:text-orange-400',
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
  awaiting_confirmation: '確認待ち',
  overdue: '期限超過',
  requested: 'リクエスト中',
  approved: '承認済',
  denied: '拒否',
  failed: '不合格',
}

interface LearningProgressData {
  mastered: number
  total: number
  pct: number
}

interface Props {
  learningAssignments: LearningAssignmentRow[]
  examRequests: ExamRequest[]
  quizRetakeRequests: QuizRetakeRequest[]
  users: User[]
  currentRole: string
  learningProgress: Record<string, LearningProgressData>
}

export default function AdminTasksClient({ learningAssignments, examRequests, quizRetakeRequests, users, currentRole, learningProgress }: Props) {
  const [activeTab, setActiveTab] = useState<'learning' | 'approvals'>('learning')
  const router = useRouter()
  const [showForm, setShowForm] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [messageType, setMessageType] = useState<'success' | 'error'>('success')

  // Cascade form state
  const [selectedCategory, setSelectedCategory] = useState('')
  const [selectedSubcategory, setSelectedSubcategory] = useState('')
  const [selectedAssignees, setSelectedAssignees] = useState<string[]>([])
  const [assigneeSearch, setAssigneeSearch] = useState('')
  const [showAssigneeDropdown, setShowAssigneeDropdown] = useState(false)

  // Search/filter state
  const [searchName, setSearchName] = useState('')
  const [statusFilter, setStatusFilter] = useState<string>('all')
  const [approvalSearchName, setApprovalSearchName] = useState('')

  // Overdue handling state
  const [reassignDate, setReassignDate] = useState<Record<string, string>>({})
  const [expandedReassign, setExpandedReassign] = useState<Record<string, boolean>>({})

  // Dev level unlock state
  const [devLevelLocks, setDevLevelLocks] = useState<Record<string, boolean>>({})
  const [loadingLevels, setLoadingLevels] = useState(false)

  function showMsg(msg: string, type: 'success' | 'error' = 'success') {
    setMessage(msg)
    setMessageType(type)
    setTimeout(() => setMessage(null), 4000)
  }

  const catConfig = selectedCategory ? ASSIGNMENT_CATEGORIES[selectedCategory] : null
  const isLevelOnly = catConfig?.levelOnly === true

  const subcategories = selectedCategory && !isLevelOnly
    ? catConfig?.subcategories ?? {}
    : {}

  const subcatConfig = selectedCategory && selectedSubcategory
    ? ASSIGNMENT_CATEGORIES[selectedCategory]?.subcategories[selectedSubcategory]
    : null

  const hasLevel = isLevelOnly
    ? true
    : (subcatConfig?.hasLevel ?? false)

  const isDevLevel = subcatConfig?.courseSubcategory != null

  const menteeUsers = users.filter(u => u.role === 'mentee')
  const filteredMentees = menteeUsers.filter(u =>
    (u.full_name ?? '').toLowerCase().includes(assigneeSearch.toLowerCase()) ||
    u.email.toLowerCase().includes(assigneeSearch.toLowerCase())
  )

  function toggleAssignee(userId: string) {
    setSelectedAssignees(prev =>
      prev.includes(userId) ? prev.filter(id => id !== userId) : [...prev, userId]
    )
  }

  async function handleCreateLearning(formData: FormData) {
    if (selectedAssignees.length === 0) {
      showMsg('1名以上を選択してください', 'error')
      return
    }
    startTransition(async () => {
      const result = await createLearningAssignment(formData)
      if (result.error) showMsg(result.error, 'error')
      else {
        const msg = ('message' in result && result.message) ? result.message : '学習課題を配信しました'
        showMsg(msg as string)
        setShowForm(false)
        setSelectedCategory('')
        setSelectedSubcategory('')
        setSelectedAssignees([])
        setAssigneeSearch('')
        setDevLevelLocks({})
      }
    })
  }

  function handleConfirmAssignment(id: string) {
    startTransition(async () => {
      const result = await confirmAssignment(id)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('確認完了しました')
    })
  }

  function handleDeleteLearning(id: string) {
    if (!confirm('学習課題を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteLearningAssignment(id)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('削除されました')
    })
  }

  function handleReassign(id: string) {
    const newDate = reassignDate[id]
    if (!newDate) { showMsg('新しい期限を入力してください', 'error'); return }
    startTransition(async () => {
      const result = await reassignAssignment(id, newDate)
      if (result.error) showMsg(result.error, 'error')
      else {
        showMsg('再配信しました')
        setReassignDate(prev => { const n = { ...prev }; delete n[id]; return n })
        setExpandedReassign(prev => { const n = { ...prev }; delete n[id]; return n })
      }
    })
  }

  async function loadDevLevels(assigneeId: string, courseSubcategory: string) {
    setLoadingLevels(true)
    try {
      const result = await getAssigneeUnlockedLevels(assigneeId, courseSubcategory)
      const locks: Record<string, boolean> = {}
      for (const l of result.levels) {
        locks[l.difficulty] = l.isLocked
      }
      setDevLevelLocks(locks)
    } finally {
      setLoadingLevels(false)
    }
  }

  function handleApproveExam(examId: string) {
    startTransition(async () => {
      const result = await approveExam(examId)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('試験を承認しました')
    })
  }

  function handleDenyExam(examId: string) {
    if (!confirm('試験リクエストを拒否しますか？')) return
    startTransition(async () => {
      const result = await denyExam(examId)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('試験を拒否しました')
    })
  }

  function handleDeleteExam(examId: string) {
    if (!confirm('この試験リクエストを削除しますか？関連する回答データも削除されます。')) return
    startTransition(async () => {
      const result = await deleteExam(examId)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('試験を削除しました')
    })
  }

  function handleApproveQuizRetake(attemptId: string) {
    startTransition(async () => {
      const result = await approveQuizRetake(attemptId)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('再試験を承認しました')
    })
  }

  function handleDenyQuizRetake(attemptId: string) {
    if (!confirm('再試験リクエストを拒否しますか？')) return
    startTransition(async () => {
      const result = await denyQuizRetake(attemptId)
      if (result.error) showMsg(result.error, 'error')
      else showMsg('再試験を拒否しました')
    })
  }

  function getProgressPercent(assignment: LearningAssignmentRow) {
    const total = assignment.required_quiz_ids?.length ?? 0
    const passed = assignment.passed_quiz_ids?.length ?? 0
    if (total === 0) return 0
    return Math.round((passed / total) * 100)
  }

  // Filtered data
  const filteredAssignments = learningAssignments.filter(la => {
    const nameMatch = !searchName || (la.assignee as { full_name: string | null } | null)?.full_name?.toLowerCase().includes(searchName.toLowerCase())
    const statusMatch = statusFilter === 'all' || la.status === statusFilter
    return nameMatch && statusMatch
  })

  const filteredExamRequests = examRequests.filter(e => {
    return !approvalSearchName || (e.user as { full_name: string | null } | null)?.full_name?.toLowerCase().includes(approvalSearchName.toLowerCase())
  })

  const filteredRetakeRequests = quizRetakeRequests.filter(r => {
    return !approvalSearchName || r.user_name.toLowerCase().includes(approvalSearchName.toLowerCase())
  })

  const pendingApprovals = examRequests.filter(e => e.status === 'requested').length + quizRetakeRequests.length

  const tabs = [
    { key: 'learning' as const, label: '学習課題' },
    { key: 'approvals' as const, label: '承認リクエスト' },
  ]

  return (
    <div className="mt-6">
      {message && (
        <div className="fixed inset-x-0 top-6 z-50 mx-auto w-fit animate-bounce">
          <div className={`rounded-xl px-6 py-4 text-base font-bold shadow-lg ${
            messageType === 'error'
              ? 'border-2 border-red-400 bg-red-50 text-red-700 dark:border-red-500 dark:bg-red-900/80 dark:text-red-200'
              : 'border-2 border-green-400 bg-green-50 text-green-700 dark:border-green-500 dark:bg-green-900/80 dark:text-green-200'
          }`}>
            {messageType === 'error' ? '⚠ ' : '✓ '}{message}
          </div>
        </div>
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
                <div className="sm:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">
                    配分対象 * <span className="text-xs font-normal text-gray-400">({selectedAssignees.length}名選択)</span>
                  </label>
                  {selectedAssignees.map(id => (
                    <input key={id} type="hidden" name="assigned_to" value={id} />
                  ))}
                  {selectedAssignees.length > 0 && (
                    <div className="mt-1 flex flex-wrap gap-1.5">
                      {selectedAssignees.map(id => {
                        const u = users.find(u => u.id === id)
                        return (
                          <span key={id} className="inline-flex items-center gap-1 rounded-full bg-indigo-500/10 px-2.5 py-1 text-xs font-medium text-indigo-600 ring-1 ring-indigo-500/20 dark:text-indigo-400">
                            {u?.full_name ?? u?.email ?? id}
                            <button type="button" onClick={() => toggleAssignee(id)} className="ml-0.5 text-indigo-400 hover:text-indigo-600">×</button>
                          </span>
                        )
                      })}
                    </div>
                  )}
                  <div className="relative mt-1">
                    <input
                      type="text"
                      placeholder="名前またはメールで検索..."
                      value={assigneeSearch}
                      onChange={e => { setAssigneeSearch(e.target.value); setShowAssigneeDropdown(true) }}
                      onFocus={() => setShowAssigneeDropdown(true)}
                      className="w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400"
                    />
                    {showAssigneeDropdown && (
                      <div className="absolute z-20 mt-1 max-h-48 w-full overflow-y-auto rounded-lg border border-gray-200 bg-white shadow-lg dark:border-gray-600 dark:bg-gray-700">
                        {filteredMentees.length === 0 ? (
                          <div className="px-3 py-2 text-xs text-gray-400">該当なし</div>
                        ) : (
                          filteredMentees.map(u => (
                            <label key={u.id} className="flex cursor-pointer items-center gap-2 px-3 py-2 text-sm hover:bg-gray-50 dark:hover:bg-gray-600">
                              <input
                                type="checkbox"
                                checked={selectedAssignees.includes(u.id)}
                                onChange={() => toggleAssignee(u.id)}
                                className="h-3.5 w-3.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                              />
                              <span className="text-gray-900 dark:text-white">{u.full_name ?? u.email}</span>
                              <span className="ml-auto text-[10px] text-gray-400">{u.email}</span>
                            </label>
                          ))
                        )}
                        <button
                          type="button"
                          onClick={() => setShowAssigneeDropdown(false)}
                          className="w-full border-t border-gray-100 px-3 py-1.5 text-center text-xs text-gray-500 hover:bg-gray-50 dark:border-gray-600 dark:hover:bg-gray-600"
                        >
                          閉じる
                        </button>
                      </div>
                    )}
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">カテゴリ *</label>
                  <select
                    name="category"
                    required
                    value={selectedCategory}
                    onChange={e => { setSelectedCategory(e.target.value); setSelectedSubcategory(''); setDevLevelLocks({}) }}
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
                      onChange={e => {
                        setSelectedSubcategory(e.target.value)
                        setDevLevelLocks({})
                        const newSubcatConfig = ASSIGNMENT_CATEGORIES[selectedCategory]?.subcategories[e.target.value]
                        if (selectedAssignees[0] && newSubcatConfig?.courseSubcategory) {
                          loadDevLevels(selectedAssignees[0], newSubcatConfig.courseSubcategory)
                        }
                      }}
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
                    <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">レベル{isLevelOnly || isDevLevel ? ' *' : ''}</label>
                    <select name="content_level" required={isLevelOnly || isDevLevel}
                      disabled={isDevLevel && loadingLevels}
                      className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none disabled:opacity-50 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                      <option value="">{isLevelOnly || isDevLevel ? '選択...' : '全レベル'}</option>
                      {isDevLevel ? (
                        DEV_LEVELS.map(level => (
                          <option key={level.value} value={level.value} disabled={devLevelLocks[level.value] === true}>
                            {level.label}{devLevelLocks[level.value] === true ? ' (ロック)' : ''}
                          </option>
                        ))
                      ) : (
                        JLPT_LEVELS.map(level => (
                          <option key={level} value={level}>{level}</option>
                        ))
                      )}
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

          {/* Filter bar */}
          <div className="mt-4 flex flex-wrap items-center gap-3">
            <input
              type="text"
              placeholder="対象者名で検索..."
              value={searchName}
              onChange={e => setSearchName(e.target.value)}
              className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400"
            />
            <select
              value={statusFilter}
              onChange={e => setStatusFilter(e.target.value)}
              className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
            >
              <option value="all">全て</option>
              <option value="pending">待機</option>
              <option value="in_progress">進行中</option>
              <option value="completed">完了</option>
              <option value="awaiting_confirmation">確認待ち</option>
              <option value="overdue">期限超過</option>
            </select>
            {(searchName || statusFilter !== 'all') && (
              <span className="text-xs text-gray-500 dark:text-gray-400">
                {filteredAssignments.length}/{learningAssignments.length}件
              </span>
            )}
          </div>

          {/* Learning assignments table */}
          <div className="mt-3 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead className="bg-gray-50 dark:bg-gray-700">
                  <tr>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">対象者</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">カテゴリ</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">学習進捗</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">テスト進捗</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                    <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">期限</th>
                    <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                  {filteredAssignments.map(la => {
                    const progress = getProgressPercent(la)
                    const totalQuizzes = la.required_quiz_ids?.length ?? 0
                    const passedQuizzes = la.passed_quiz_ids?.length ?? 0
                    const lp = learningProgress[la.id]
                    return (
                      <Fragment key={la.id}>
                        <tr
                          onClick={() => router.push(`/admin/reports?mentee=${la.assigned_to}`)}
                          className="cursor-pointer transition-colors hover:bg-gray-50 dark:hover:bg-gray-700/50"
                        >
                          <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{la.title}</td>
                          <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                            {(la.assignee as { full_name: string | null } | null)?.full_name ?? '-'}
                          </td>
                          <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                            {getCategoryLabel(la.category)} &gt; {getSubcategoryLabel(la.category, la.subcategory)}
                            {la.content_level && ` (${getContentLevelLabel(la.category, la.content_level)})`}
                          </td>
                          <td className="px-4 py-3">
                            {lp && lp.total > 0 ? (
                              <div className="flex items-center gap-2">
                                <div className="h-2 w-16 rounded-full bg-gray-200 dark:bg-gray-600">
                                  <div
                                    className="h-2 rounded-full bg-amber-500 transition-all"
                                    style={{ width: `${lp.pct}%` }}
                                  />
                                </div>
                                <span className="text-xs text-gray-500 dark:text-gray-400">{lp.pct}%</span>
                              </div>
                            ) : (
                              <span className="text-xs text-gray-400">-</span>
                            )}
                          </td>
                          <td className="px-4 py-3">
                            <div className="flex items-center gap-2">
                              <div className="h-2 w-16 rounded-full bg-gray-200 dark:bg-gray-600">
                                <div
                                  className="h-2 rounded-full bg-indigo-500 transition-all"
                                  style={{ width: `${progress}%` }}
                                />
                              </div>
                              <span className="text-xs text-gray-500 dark:text-gray-400">{passedQuizzes}/{totalQuizzes}</span>
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
                          <td className="px-4 py-3 text-right" onClick={(e) => e.stopPropagation()}>
                            <div className="flex flex-col items-end gap-2">
                              <div className="flex justify-end gap-2">
                                {la.status === 'awaiting_confirmation' && (
                                  <button
                                    onClick={() => handleConfirmAssignment(la.id)}
                                    disabled={pending}
                                    className="rounded-md bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-700 disabled:opacity-50"
                                  >
                                    確認完了
                                  </button>
                                )}
                                {la.status === 'overdue' && !expandedReassign[la.id] && (
                                  <button
                                    onClick={() => setExpandedReassign(prev => ({ ...prev, [la.id]: true }))}
                                    disabled={pending}
                                    className="rounded-md bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
                                  >
                                    再配信
                                  </button>
                                )}
                                <button
                                  onClick={() => handleDeleteLearning(la.id)}
                                  disabled={pending}
                                  className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                                >
                                  削除
                                </button>
                              </div>
                              {la.status === 'overdue' && expandedReassign[la.id] && (
                                <div className="flex items-center gap-1">
                                  <input
                                    type="date"
                                    value={reassignDate[la.id] ?? ''}
                                    onChange={e => setReassignDate(prev => ({ ...prev, [la.id]: e.target.value }))}
                                    className="rounded border border-gray-300 px-2 py-1 text-xs dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                  />
                                  <button
                                    onClick={() => handleReassign(la.id)}
                                    disabled={pending}
                                    className="rounded-md bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
                                  >
                                    確定
                                  </button>
                                  <button
                                    onClick={() => {
                                      setExpandedReassign(prev => { const n = { ...prev }; delete n[la.id]; return n })
                                      setReassignDate(prev => { const n = { ...prev }; delete n[la.id]; return n })
                                    }}
                                    className="rounded-md bg-gray-200 px-3 py-1 text-xs font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                                  >
                                    取消
                                  </button>
                                </div>
                              )}
                            </div>
                          </td>
                        </tr>
                        {la.status === 'overdue' && (
                          <tr>
                            <td colSpan={8} className="px-4 py-2">
                              {la.overdue_reason ? (
                                <div className="rounded-lg bg-red-50 px-3 py-2 text-sm text-red-700 dark:bg-red-900/20 dark:text-red-300">
                                  <span className="font-medium">遅延理由:</span> {la.overdue_reason}
                                  <span className="ml-2 text-xs text-red-400">
                                    ({la.overdue_reason_at ? new Date(la.overdue_reason_at).toLocaleDateString('ja-JP') : ''})
                                  </span>
                                </div>
                              ) : (
                                <div className="rounded-lg bg-yellow-50 px-3 py-2 text-sm text-yellow-700 dark:bg-yellow-900/20 dark:text-yellow-300">
                                  <span className="font-medium">遅延理由:</span> 未提出
                                </div>
                              )}
                            </td>
                          </tr>
                        )}
                      </Fragment>
                    )
                  })}
                </tbody>
              </table>
            </div>
            {filteredAssignments.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">
                {learningAssignments.length === 0 ? '学習課題がありません' : '該当する課題がありません'}
              </div>
            )}
          </div>
        </>
      )}

      {/* Approvals Tab */}
      {activeTab === 'approvals' && (
        <div className="space-y-6">
          {/* Approval search bar */}
          <div className="flex items-center gap-3">
            <input
              type="text"
              placeholder="ユーザー名で検索..."
              value={approvalSearchName}
              onChange={e => setApprovalSearchName(e.target.value)}
              className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400"
            />
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
                    {filteredExamRequests.map(exam => (
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
                          <div className="flex justify-end gap-2">
                            {exam.status === 'requested' && (
                              <>
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
                              </>
                            )}
                            <button
                              onClick={() => handleDeleteExam(exam.id)}
                              disabled={pending}
                              className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                            >
                              削除
                            </button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {filteredExamRequests.length === 0 && (
                <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">
                  {examRequests.length === 0 ? '試験リクエストがありません' : '該当するリクエストがありません'}
                </div>
              )}
            </div>
          </div>

          {/* Quiz Retake Requests */}
          <div>
            <h3 className="mb-3 text-sm font-semibold text-gray-700 dark:text-gray-300">理解度テスト再試験リクエスト</h3>
            <div className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                  <thead className="bg-gray-50 dark:bg-gray-700">
                    <tr>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">ユーザー名</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">テスト名</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">スコア</th>
                      <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">リクエスト日</th>
                      <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                    {filteredRetakeRequests.map(req => (
                      <tr key={req.id}>
                        <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">
                          {req.user_name}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {req.quiz_title}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                          {req.score != null ? `${req.score}点` : '-'}
                        </td>
                        <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                          {req.retake_requested_at ? new Date(req.retake_requested_at).toLocaleDateString('ja-JP') : '-'}
                        </td>
                        <td className="px-4 py-3 text-right">
                          <div className="flex justify-end gap-2">
                            <button
                              onClick={() => handleApproveQuizRetake(req.id)}
                              disabled={pending}
                              className="rounded-md bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-700 disabled:opacity-50"
                            >
                              承認
                            </button>
                            <button
                              onClick={() => handleDenyQuizRetake(req.id)}
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
              {filteredRetakeRequests.length === 0 && (
                <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">
                  {quizRetakeRequests.length === 0 ? '再試験リクエストがありません' : '該当するリクエストがありません'}
                </div>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
