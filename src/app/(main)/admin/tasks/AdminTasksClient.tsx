'use client'

import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import {
  createLearningAssignment,
  deleteLearningAssignment,
  updateLearningAssignment,
  confirmAssignment,
  reassignAssignment,
  getAssigneeUnlockedLevels,
} from '@/app/actions/learning-assignments'
import { ASSIGNMENT_CATEGORIES, JLPT_LEVELS, DEV_LEVELS, getCategoryLabel, getSubcategoryLabel, getContentLevelLabel } from '@/lib/assignment-categories'
import NameRuby from '@/components/ui/NameRuby'
import { ChevronDown, ChevronRight, Plus } from 'lucide-react'

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
  target_count: number | null
  cumulative_target: number | null
  mastered_snapshot: number | null
  created_at: string
  overdue_reason: string | null
  overdue_reason_at: string | null
}

interface Mentee {
  id: string
  full_name: string | null
  email: string
}

const statusColors: Record<string, string> = {
  pending: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400',
  in_progress: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  completed: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
  awaiting_confirmation: 'bg-orange-100 text-orange-700 dark:bg-orange-900/30 dark:text-orange-400',
  overdue: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
  failed: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
}

const statusLabels: Record<string, string> = {
  pending: '待機',
  in_progress: '進行中',
  completed: '完了',
  awaiting_confirmation: '確認待ち',
  overdue: '期限超過',
  failed: '不合格',
}

interface LearningProgressData {
  mastered: number
  total: number
  pct: number
}

interface Props {
  mentees: Mentee[]
  assignmentsByMentee: Record<string, LearningAssignmentRow[]>
  currentRole: string
  learningProgress: Record<string, LearningProgressData>
}

export default function AdminTasksClient({ mentees, assignmentsByMentee, learningProgress }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [messageType, setMessageType] = useState<'success' | 'error'>('success')

  // Create form state
  const [showForm, setShowForm] = useState(false)
  const [selectedCategory, setSelectedCategory] = useState('')
  const [selectedSubcategory, setSelectedSubcategory] = useState('')
  const [selectedAssignees, setSelectedAssignees] = useState<string[]>([])
  const [assigneeSearch, setAssigneeSearch] = useState('')
  const [showAssigneeDropdown, setShowAssigneeDropdown] = useState(false)
  const [devLevelLocks, setDevLevelLocks] = useState<Record<string, boolean>>({})
  const [loadingLevels, setLoadingLevels] = useState(false)

  // Mentee-centric state
  const [searchName, setSearchName] = useState('')
  const [expanded, setExpanded] = useState<Record<string, boolean>>({})

  // Overdue handling state
  const [reassignDate, setReassignDate] = useState<Record<string, string>>({})
  const [expandedReassign, setExpandedReassign] = useState<Record<string, boolean>>({})

  // Edit state
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editValues, setEditValues] = useState<{ title: string; due_date: string; description: string; target_count: string }>({
    title: '', due_date: '', description: '', target_count: '',
  })

  function showMsg(msg: string, type: 'success' | 'error' = 'success') {
    setMessage(msg)
    setMessageType(type)
    setTimeout(() => setMessage(null), 4000)
  }

  const catConfig = selectedCategory ? ASSIGNMENT_CATEGORIES[selectedCategory] : null
  const isLevelOnly = catConfig?.levelOnly === true
  const subcategories = selectedCategory && !isLevelOnly ? catConfig?.subcategories ?? {} : {}
  const subcatConfig = selectedCategory && selectedSubcategory
    ? ASSIGNMENT_CATEGORIES[selectedCategory]?.subcategories[selectedSubcategory]
    : null
  const hasLevel = isLevelOnly ? true : (subcatConfig?.hasLevel ?? false)
  const isDevLevel = subcatConfig?.courseSubcategory != null

  const filteredAssignees = mentees.filter(u =>
    (u.full_name ?? '').toLowerCase().includes(assigneeSearch.toLowerCase()) ||
    u.email.toLowerCase().includes(assigneeSearch.toLowerCase())
  )

  function toggleAssignee(userId: string) {
    setSelectedAssignees(prev => prev.includes(userId) ? prev.filter(id => id !== userId) : [...prev, userId])
  }

  async function handleCreateLearning(formData: FormData) {
    if (selectedAssignees.length === 0) { showMsg('1名以上を選択してください', 'error'); return }
    startTransition(async () => {
      const result = await createLearningAssignment(formData)
      if (result.error) showMsg(result.error, 'error')
      else {
        const msg = ('message' in result && result.message) ? result.message : '学習課題を配信しました'
        showMsg(msg as string)
        setShowForm(false)
        setSelectedCategory(''); setSelectedSubcategory(''); setSelectedAssignees([]); setAssigneeSearch(''); setDevLevelLocks({})
      }
    })
  }

  function handleConfirmAssignment(id: string) {
    startTransition(async () => {
      const result = await confirmAssignment(id)
      if (result.error) showMsg(result.error, 'error'); else showMsg('確認完了しました')
    })
  }

  function handleDeleteLearning(id: string) {
    if (!confirm('この課題を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteLearningAssignment(id)
      if (result.error) showMsg(result.error, 'error'); else showMsg('削除されました')
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

  function startEdit(la: LearningAssignmentRow) {
    setEditingId(la.id)
    setEditValues({
      title: la.title,
      due_date: la.due_date ? la.due_date.slice(0, 10) : '',
      description: la.description ?? '',
      target_count: la.target_count != null ? String(la.target_count) : '',
    })
  }

  function handleSaveEdit(la: LearningAssignmentRow) {
    startTransition(async () => {
      const result = await updateLearningAssignment(la.id, {
        title: editValues.title,
        due_date: editValues.due_date || null,
        description: editValues.description,
        target_count: la.target_count != null && editValues.target_count !== ''
          ? parseInt(editValues.target_count, 10)
          : undefined,
      })
      if (result.error) showMsg(result.error, 'error')
      else { showMsg('修正しました'); setEditingId(null) }
    })
  }

  async function loadDevLevels(assigneeId: string, courseSubcategory: string) {
    setLoadingLevels(true)
    try {
      const result = await getAssigneeUnlockedLevels(assigneeId, courseSubcategory)
      const locks: Record<string, boolean> = {}
      for (const l of result.levels) locks[l.difficulty] = l.isLocked
      setDevLevelLocks(locks)
    } finally {
      setLoadingLevels(false)
    }
  }

  const filteredMentees = mentees.filter(m =>
    !searchName ||
    (m.full_name ?? '').toLowerCase().includes(searchName.toLowerCase()) ||
    m.email.toLowerCase().includes(searchName.toLowerCase())
  )

  function progressLabel(la: LearningAssignmentRow): string {
    // 카운트형(항목/이해테스트): 습득 / 누적목표
    if (la.target_count != null) {
      return `習得 ${la.mastered_snapshot ?? 0}/${la.cumulative_target ?? la.target_count}`
    }
    // 레거시: 학습 진척 + 테스트 진척
    const lp = learningProgress[la.id]
    const total = la.required_quiz_ids?.length ?? 0
    const passed = la.passed_quiz_ids?.length ?? 0
    const parts: string[] = []
    if (lp && lp.total > 0) parts.push(`学習 ${lp.pct}%`)
    if (total > 0) parts.push(`テスト ${passed}/${total}`)
    return parts.join(' · ') || '-'
  }

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

      {/* Create button + form */}
      <button
        onClick={() => setShowForm(!showForm)}
        className="inline-flex items-center gap-1.5 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700"
      >
        {showForm ? 'キャンセル' : <><Plus className="h-4 w-4" /> 学習課題配信</>}
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
                    const u = mentees.find(u => u.id === id)
                    return (
                      <span key={id} className="inline-flex items-center gap-1 rounded-full bg-indigo-500/10 px-2.5 py-1 text-xs font-medium text-indigo-600 ring-1 ring-indigo-500/20 dark:text-indigo-400">
                        {u ? <NameRuby name={u.full_name} fallback={u.email ?? id} /> : id}
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
                    {filteredAssignees.length === 0 ? (
                      <div className="px-3 py-2 text-xs text-gray-400">該当なし</div>
                    ) : (
                      filteredAssignees.map(u => (
                        <label key={u.id} className="flex cursor-pointer items-center gap-2 px-3 py-2 text-sm hover:bg-gray-50 dark:hover:bg-gray-600">
                          <input
                            type="checkbox"
                            checked={selectedAssignees.includes(u.id)}
                            onChange={() => toggleAssignee(u.id)}
                            className="h-3.5 w-3.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                          />
                          <span className="text-gray-900 dark:text-white"><NameRuby name={u.full_name} fallback={u.email} /></span>
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

      {/* Mentee search */}
      <div className="mt-4">
        <input
          type="text"
          placeholder="メンティー名で検索..."
          value={searchName}
          onChange={e => setSearchName(e.target.value)}
          className="w-full max-w-xs rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400"
        />
      </div>

      {/* Mentee-centric accordion */}
      <div className="mt-3 space-y-2">
        {filteredMentees.map(m => {
          const list = assignmentsByMentee[m.id] ?? []
          const overdueCount = list.filter(a => a.status === 'overdue').length
          const isOpen = expanded[m.id] === true
          return (
            <div key={m.id} className="rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
              {/* Mentee header */}
              <button
                onClick={() => setExpanded(prev => ({ ...prev, [m.id]: !prev[m.id] }))}
                className="flex w-full items-center gap-3 px-4 py-3 text-left hover:bg-gray-50 dark:hover:bg-gray-700/50"
              >
                {isOpen ? <ChevronDown className="h-4 w-4 text-gray-400" /> : <ChevronRight className="h-4 w-4 text-gray-400" />}
                <span className="font-medium text-gray-900 dark:text-white">
                  <NameRuby name={m.full_name} fallback={m.email} />
                </span>
                <span className="text-xs text-gray-400">{m.email}</span>
                <span className="ml-auto flex items-center gap-2">
                  {overdueCount > 0 && (
                    <span className="inline-flex items-center rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">
                      遅延 {overdueCount}
                    </span>
                  )}
                  <span className="inline-flex items-center rounded-full bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600 dark:bg-gray-700 dark:text-gray-300">
                    課題 {list.length}
                  </span>
                </span>
              </button>

              {/* Assignment dropdown */}
              {isOpen && (
                <div className="border-t border-gray-100 dark:border-gray-700">
                  {list.length === 0 ? (
                    <div className="px-4 py-6 text-center text-sm text-gray-400">配信された課題がありません</div>
                  ) : (
                    <ul className="divide-y divide-gray-100 dark:divide-gray-700">
                      {list.map(la => (
                        <li key={la.id} className="px-4 py-3">
                          {editingId === la.id ? (
                            /* ── Edit form ── */
                            <div className="space-y-2">
                              <div>
                                <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</label>
                                <input
                                  value={editValues.title}
                                  onChange={e => setEditValues(v => ({ ...v, title: e.target.value }))}
                                  className="mt-0.5 w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                />
                              </div>
                              <div className="grid gap-2 sm:grid-cols-2">
                                <div>
                                  <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">期限</label>
                                  <input
                                    type="date"
                                    value={editValues.due_date}
                                    onChange={e => setEditValues(v => ({ ...v, due_date: e.target.value }))}
                                    className="mt-0.5 w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                  />
                                </div>
                                {la.target_count != null && (
                                  <div>
                                    <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">付与個数</label>
                                    <input
                                      type="number"
                                      min={1}
                                      value={editValues.target_count}
                                      onChange={e => setEditValues(v => ({ ...v, target_count: e.target.value }))}
                                      className="mt-0.5 w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                    />
                                  </div>
                                )}
                              </div>
                              <div>
                                <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">説明</label>
                                <textarea
                                  rows={2}
                                  value={editValues.description}
                                  onChange={e => setEditValues(v => ({ ...v, description: e.target.value }))}
                                  className="mt-0.5 w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                />
                              </div>
                              <div className="flex justify-end gap-2">
                                <button
                                  onClick={() => setEditingId(null)}
                                  className="rounded-md bg-gray-200 px-3 py-1 text-xs font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                                >
                                  取消
                                </button>
                                <button
                                  onClick={() => handleSaveEdit(la)}
                                  disabled={pending}
                                  className="rounded-md bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
                                >
                                  保存
                                </button>
                              </div>
                            </div>
                          ) : (
                            /* ── Display row ── */
                            <div className="flex items-start gap-3">
                              <div className="min-w-0 flex-1">
                                <div className="flex flex-wrap items-center gap-2">
                                  <span className="text-sm font-medium text-gray-900 dark:text-white">{la.title}</span>
                                  <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${statusColors[la.status] ?? 'bg-gray-100 text-gray-600'}`}>
                                    {statusLabels[la.status] ?? la.status}
                                  </span>
                                </div>
                                <div className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                                  {getCategoryLabel(la.category)} &gt; {getSubcategoryLabel(la.category, la.subcategory)}
                                  {la.content_level && ` (${getContentLevelLabel(la.category, la.content_level)})`}
                                  {' · '}{progressLabel(la)}
                                  {' · '}期限 {la.due_date ? new Date(la.due_date).toLocaleDateString('ja-JP') : '-'}
                                </div>
                                {la.status === 'overdue' && (
                                  <div className="mt-1.5 rounded-lg bg-red-50 px-2.5 py-1.5 text-xs text-red-700 dark:bg-red-900/20 dark:text-red-300">
                                    <span className="font-medium">遅延理由:</span>{' '}
                                    {la.overdue_reason ?? '未提出'}
                                    {la.overdue_reason_at && (
                                      <span className="ml-1 text-red-400">({new Date(la.overdue_reason_at).toLocaleDateString('ja-JP')})</span>
                                    )}
                                  </div>
                                )}
                                {la.status === 'overdue' && expandedReassign[la.id] && (
                                  <div className="mt-1.5 flex items-center gap-1">
                                    <input
                                      type="date"
                                      value={reassignDate[la.id] ?? ''}
                                      onChange={e => setReassignDate(prev => ({ ...prev, [la.id]: e.target.value }))}
                                      className="rounded border border-gray-300 px-2 py-1 text-xs dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                                    />
                                    <button onClick={() => handleReassign(la.id)} disabled={pending}
                                      className="rounded-md bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50">確定</button>
                                    <button onClick={() => {
                                      setExpandedReassign(prev => { const n = { ...prev }; delete n[la.id]; return n })
                                      setReassignDate(prev => { const n = { ...prev }; delete n[la.id]; return n })
                                    }} className="rounded-md bg-gray-200 px-3 py-1 text-xs font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500">取消</button>
                                  </div>
                                )}
                              </div>
                              <div className="flex shrink-0 items-center gap-2">
                                <button
                                  onClick={() => router.push(`/admin/reports?mentee=${la.assigned_to}`)}
                                  className="text-xs text-gray-500 hover:underline dark:text-gray-400"
                                >
                                  詳細
                                </button>
                                {la.status === 'awaiting_confirmation' && (
                                  <button onClick={() => handleConfirmAssignment(la.id)} disabled={pending}
                                    className="rounded-md bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-700 disabled:opacity-50">確認完了</button>
                                )}
                                {la.status === 'overdue' && !expandedReassign[la.id] && (
                                  <button onClick={() => setExpandedReassign(prev => ({ ...prev, [la.id]: true }))} disabled={pending}
                                    className="rounded-md bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50">再配信</button>
                                )}
                                <button onClick={() => startEdit(la)} disabled={pending}
                                  className="rounded-md bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-200 dark:hover:bg-gray-600">修正</button>
                                <button onClick={() => handleDeleteLearning(la.id)} disabled={pending}
                                  className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400">削除</button>
                              </div>
                            </div>
                          )}
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              )}
            </div>
          )
        })}
        {filteredMentees.length === 0 && (
          <div className="rounded-xl border border-gray-200 bg-white py-8 text-center text-sm text-gray-400 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-500">
            {mentees.length === 0 ? 'メンティーがいません' : '該当するメンティーがいません'}
          </div>
        )}
      </div>
    </div>
  )
}
