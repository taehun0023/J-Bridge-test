'use client'

import { useState, useTransition } from 'react'
import Badge from '@/components/ui/Badge'
import { createQuestion, updateQuestion, deleteQuestion, toggleQuestionPublished } from '@/app/actions/admin'

interface QuestionOption {
  id: string
  option_text: string
  is_correct: boolean
  sort_order: number
}

interface ClaimDetail {
  userName: string
  reason: string | null
  createdAt: string
}

interface QuestionData {
  id: string
  quiz_id: string
  question_text: string
  question_type: string
  difficulty: string
  question_category: string | null
  explanation: string | null
  is_published: boolean
  sort_order: number
  options: QuestionOption[]
  claim_count: number
  claim_details: ClaimDetail[]
}

interface TabConfig {
  key: string
  label: string
  quizId: string
}

interface OptionFormData {
  option_text: string
  is_correct: boolean
}

const categoryLabels: Record<string, string> = {
  vocab: '語彙',
  grammar: '文法',
  reading: '読解',
  listening: '聴解',
  fill_blank: '穴埋め',
  algorithm: 'アルゴリズム',
  data_structure: 'データ構造',
  os: 'OS',
  network: 'ネットワーク',
  java_core: 'Java基礎',
  spring_boot: 'Spring Boot',
  javascript_core: 'JavaScript基礎',
  react: 'React',
  sql: 'SQL',
  java_code: 'Javaコード',
  javascript_code: 'JSコード',
  business_manner: 'ビジネスマナー',
  communication: 'コミュニケーション',
  cross_culture: '異文化理解',
}

const difficultyLabels: Record<string, string> = {
  easy: '初級',
  medium: '中級',
  hard: '上級',
}

type FilterState = {
  difficulty: string
  published: string
  claimsOnly: boolean
  sortByClaims: boolean
}

export default function AdminCoursesClient({
  questions,
  tabs,
}: {
  questions: QuestionData[]
  tabs: TabConfig[]
}) {
  const [activeTab, setActiveTab] = useState(tabs[0].key)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [filters, setFilters] = useState<FilterState>({
    difficulty: '',
    published: '',
    claimsOnly: false,
    sortByClaims: false,
  })

  // Modal states
  const [showAddForm, setShowAddForm] = useState(false)
  const [editingQuestion, setEditingQuestion] = useState<QuestionData | null>(null)
  const [claimDetailId, setClaimDetailId] = useState<string | null>(null)

  // Form state for add/edit
  const [formText, setFormText] = useState('')
  const [formDifficulty, setFormDifficulty] = useState('medium')
  const [formCategory, setFormCategory] = useState('')
  const [formExplanation, setFormExplanation] = useState('')
  const [formOptions, setFormOptions] = useState<OptionFormData[]>([
    { option_text: '', is_correct: true },
    { option_text: '', is_correct: false },
    { option_text: '', is_correct: false },
    { option_text: '', is_correct: false },
  ])

  function showMsg(msg: string) {
    setMessage(msg)
    setTimeout(() => setMessage(null), 3000)
  }

  const currentTab = tabs.find(t => t.key === activeTab)!
  const currentQuizId = currentTab.quizId

  // Filter and sort questions for current tab
  let tabQuestions = questions.filter(q => q.quiz_id === currentQuizId)

  if (filters.difficulty) {
    tabQuestions = tabQuestions.filter(q => q.difficulty === filters.difficulty)
  }
  if (filters.published === 'published') {
    tabQuestions = tabQuestions.filter(q => q.is_published)
  } else if (filters.published === 'unpublished') {
    tabQuestions = tabQuestions.filter(q => !q.is_published)
  }
  if (filters.claimsOnly) {
    tabQuestions = tabQuestions.filter(q => q.claim_count > 0)
  }
  if (filters.sortByClaims) {
    tabQuestions = [...tabQuestions].sort((a, b) => b.claim_count - a.claim_count)
  }

  function resetForm() {
    setFormText('')
    setFormDifficulty('medium')
    setFormCategory('')
    setFormExplanation('')
    setFormOptions([
      { option_text: '', is_correct: true },
      { option_text: '', is_correct: false },
      { option_text: '', is_correct: false },
      { option_text: '', is_correct: false },
    ])
  }

  function openAddForm() {
    resetForm()
    setEditingQuestion(null)
    setShowAddForm(true)
  }

  function openEditForm(q: QuestionData) {
    setFormText(q.question_text)
    setFormDifficulty(q.difficulty)
    setFormCategory(q.question_category ?? '')
    setFormExplanation(q.explanation ?? '')
    setFormOptions(
      q.options.length >= 2
        ? q.options.map(o => ({ option_text: o.option_text, is_correct: o.is_correct }))
        : [
            { option_text: '', is_correct: true },
            { option_text: '', is_correct: false },
            { option_text: '', is_correct: false },
            { option_text: '', is_correct: false },
          ]
    )
    setEditingQuestion(q)
    setShowAddForm(true)
  }

  function closeForm() {
    setShowAddForm(false)
    setEditingQuestion(null)
    resetForm()
  }

  function handleOptionChange(index: number, field: 'option_text' | 'is_correct', value: string | boolean) {
    setFormOptions(prev => {
      const next = [...prev]
      if (field === 'is_correct') {
        // Radio behavior: only one correct
        next.forEach((o, i) => { o.is_correct = i === index })
      } else {
        next[index] = { ...next[index], [field as string]: value }
      }
      return next
    })
  }

  function handleSubmitForm() {
    if (!formText.trim()) { showMsg('問題テキストを入力してください'); return }
    const validOptions = formOptions.filter(o => o.option_text.trim())
    if (validOptions.length < 2) { showMsg('選択肢を最低2つ入力してください'); return }
    if (!validOptions.some(o => o.is_correct)) { showMsg('正解を1つ選択してください'); return }

    const data = {
      question_text: formText.trim(),
      question_type: 'multiple_choice',
      difficulty: formDifficulty,
      question_category: formCategory || null,
      explanation: formExplanation.trim() || null,
      options: validOptions.map((o, i) => ({
        option_text: o.option_text.trim(),
        is_correct: o.is_correct,
        sort_order: i + 1,
      })),
    }

    startTransition(async () => {
      const result = editingQuestion
        ? await updateQuestion(editingQuestion.id, data)
        : await createQuestion(currentQuizId, data)

      if (result.error) showMsg(result.error)
      else {
        showMsg(editingQuestion ? '問題を更新しました' : '問題を追加しました')
        closeForm()
      }
    })
  }

  function handleTogglePublished(q: QuestionData) {
    startTransition(async () => {
      const result = await toggleQuestionPublished(q.id, !q.is_published)
      if (result.error) showMsg(result.error)
      else showMsg(q.is_published ? '非公開にしました' : '公開しました')
    })
  }

  function handleDelete(q: QuestionData) {
    if (!confirm(`この問題を削除しますか？\n「${q.question_text.slice(0, 50)}...」`)) return
    startTransition(async () => {
      const result = await deleteQuestion(q.id)
      if (result.error) showMsg(result.error)
      else showMsg('問題を削除しました')
    })
  }

  // Get unique categories for current tab
  const allTabQuestions = questions.filter(q => q.quiz_id === currentQuizId)
  const uniqueCategories = [...new Set(allTabQuestions.map(q => q.question_category).filter(Boolean) as string[])]

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      {/* Tabs */}
      <div className="flex gap-1 overflow-x-auto border-b border-gray-200 dark:border-white/[0.06] pb-px">
        {tabs.map(tab => (
          <button
            key={tab.key}
            onClick={() => { setActiveTab(tab.key); setShowAddForm(false); setClaimDetailId(null) }}
            className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
              tab.key === activeTab
                ? 'border-indigo-600 text-indigo-700 dark:border-indigo-500 dark:text-indigo-400'
                : 'border-transparent text-zinc-500 hover:text-zinc-900 dark:text-zinc-400 dark:hover:text-zinc-200'
            }`}
          >
            {tab.label}
            <span className="ml-1.5 rounded-full bg-zinc-100 px-2 py-0.5 text-xs text-zinc-600 dark:bg-zinc-700 dark:text-zinc-400">
              {questions.filter(q => q.quiz_id === tab.quizId).length}
            </span>
          </button>
        ))}
      </div>

      {/* Toolbar: filters + add button */}
      <div className="mt-4 flex flex-wrap items-center gap-3">
        <button
          onClick={openAddForm}
          className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700"
        >
          + 問題追加
        </button>

        <select
          value={filters.difficulty}
          onChange={e => setFilters(f => ({ ...f, difficulty: e.target.value }))}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
        >
          <option value="">全難易度</option>
          <option value="easy">初級</option>
          <option value="medium">中級</option>
          <option value="hard">上級</option>
        </select>

        <select
          value={filters.published}
          onChange={e => setFilters(f => ({ ...f, published: e.target.value }))}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
        >
          <option value="">全状態</option>
          <option value="published">公開</option>
          <option value="unpublished">非公開</option>
        </select>

        <label className="flex items-center gap-1.5 text-sm text-gray-700 dark:text-gray-300">
          <input
            type="checkbox"
            checked={filters.claimsOnly}
            onChange={e => setFilters(f => ({ ...f, claimsOnly: e.target.checked }))}
            className="rounded border-gray-300"
          />
          クレームあり
        </label>

        <label className="flex items-center gap-1.5 text-sm text-gray-700 dark:text-gray-300">
          <input
            type="checkbox"
            checked={filters.sortByClaims}
            onChange={e => setFilters(f => ({ ...f, sortByClaims: e.target.checked }))}
            className="rounded border-gray-300"
          />
          クレーム順
        </label>
      </div>

      {/* Add/Edit Form */}
      {showAddForm && (
        <div className="mt-4 rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-800">
          <h3 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">
            {editingQuestion ? '問題編集' : '新規問題追加'}
          </h3>
          <div className="grid gap-4 sm:grid-cols-2">
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">問題テキスト *</label>
              <textarea
                value={formText}
                onChange={e => setFormText(e.target.value)}
                rows={3}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">難易度 *</label>
              <select
                value={formDifficulty}
                onChange={e => setFormDifficulty(e.target.value)}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              >
                <option value="easy">初級 (easy)</option>
                <option value="medium">中級 (medium)</option>
                <option value="hard">上級 (hard)</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">カテゴリ</label>
              <select
                value={formCategory}
                onChange={e => setFormCategory(e.target.value)}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              >
                <option value="">未設定</option>
                {uniqueCategories.map(cat => (
                  <option key={cat} value={cat}>{categoryLabels[cat] ?? cat}</option>
                ))}
              </select>
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">解説（任意）</label>
              <textarea
                value={formExplanation}
                onChange={e => setFormExplanation(e.target.value)}
                rows={2}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              />
            </div>

            {/* Options */}
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">選択肢 *</label>
              <div className="space-y-2">
                {formOptions.map((opt, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <input
                      type="radio"
                      name="correct_option"
                      checked={opt.is_correct}
                      onChange={() => handleOptionChange(i, 'is_correct', true)}
                      className="text-indigo-600"
                    />
                    <input
                      type="text"
                      value={opt.option_text}
                      onChange={e => handleOptionChange(i, 'option_text', e.target.value)}
                      placeholder={`選択肢 ${i + 1}`}
                      className="flex-1 rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                    />
                    {opt.is_correct && (
                      <span className="text-xs font-medium text-emerald-600 dark:text-emerald-400">正解</span>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>

          <div className="mt-4 flex gap-2">
            <button
              onClick={handleSubmitForm}
              disabled={pending}
              className="rounded-lg bg-indigo-600 px-6 py-2 text-sm font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
            >
              {pending ? '保存中...' : editingQuestion ? '更新' : '追加'}
            </button>
            <button
              onClick={closeForm}
              className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700"
            >
              キャンセル
            </button>
          </div>
        </div>
      )}

      {/* Questions Table */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
            <thead className="bg-gray-50 dark:bg-gray-700">
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">問題テキスト</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">カテゴリ</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">難易度</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">クレーム</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
              {tabQuestions.map(q => (
                <tr key={q.id} className={!q.is_published ? 'bg-gray-50/50 dark:bg-gray-800/50' : ''}>
                  <td className="px-4 py-3 text-sm text-gray-900 dark:text-white max-w-xs">
                    <span className="line-clamp-2">{q.question_text}</span>
                  </td>
                  <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                    {q.question_category ? (categoryLabels[q.question_category] ?? q.question_category) : '-'}
                  </td>
                  <td className="px-4 py-3">
                    <Badge label={difficultyLabels[q.difficulty] ?? q.difficulty} variant="difficulty" />
                  </td>
                  <td className="px-4 py-3">
                    <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                      q.is_published
                        ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'
                        : 'bg-gray-100 text-gray-600 dark:bg-gray-600 dark:text-gray-300'
                    }`}>
                      {q.is_published ? '公開' : '非公開'}
                    </span>
                  </td>
                  <td className="px-4 py-3">
                    {q.claim_count > 0 ? (
                      <button
                        onClick={() => setClaimDetailId(claimDetailId === q.id ? null : q.id)}
                        className="inline-flex h-6 min-w-6 items-center justify-center rounded-full bg-red-100 px-2 text-xs font-bold text-red-700 hover:bg-red-200 dark:bg-red-900/30 dark:text-red-400 dark:hover:bg-red-900/50"
                      >
                        {q.claim_count}
                      </button>
                    ) : (
                      <span className="text-xs text-gray-400">0</span>
                    )}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <div className="flex justify-end gap-2">
                      <button
                        onClick={() => openEditForm(q)}
                        disabled={pending}
                        className="text-xs text-blue-600 hover:underline disabled:opacity-50 dark:text-blue-400"
                      >
                        編集
                      </button>
                      <button
                        onClick={() => handleTogglePublished(q)}
                        disabled={pending}
                        className="text-xs text-amber-600 hover:underline disabled:opacity-50 dark:text-amber-400"
                      >
                        {q.is_published ? '非公開' : '公開'}
                      </button>
                      <button
                        onClick={() => handleDelete(q)}
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
        {tabQuestions.length === 0 && (
          <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">問題がありません</div>
        )}
      </div>

      {/* Claim Detail Modal */}
      {claimDetailId && (() => {
        const q = questions.find(q => q.id === claimDetailId)
        if (!q || q.claim_details.length === 0) return null
        return (
          <div className="mt-4 rounded-xl border border-amber-200 bg-amber-50 p-4 dark:border-amber-800 dark:bg-amber-900/20">
            <div className="flex items-center justify-between mb-3">
              <h4 className="text-sm font-semibold text-amber-800 dark:text-amber-300">
                クレーム詳細 ({q.claim_count}件)
              </h4>
              <button
                onClick={() => setClaimDetailId(null)}
                className="text-xs text-amber-600 hover:text-amber-800 dark:text-amber-400"
              >
                閉じる
              </button>
            </div>
            <p className="mb-3 text-xs text-amber-700 dark:text-amber-400 line-clamp-2">
              問題: {q.question_text}
            </p>
            <div className="space-y-2">
              {q.claim_details.map((d, i) => (
                <div key={i} className="rounded-lg bg-white p-3 text-sm dark:bg-gray-800">
                  <div className="flex items-center justify-between">
                    <span className="font-medium text-gray-900 dark:text-white">{d.userName}</span>
                    <span className="text-xs text-gray-500 dark:text-gray-400">
                      {new Date(d.createdAt).toLocaleDateString('ja-JP')}
                    </span>
                  </div>
                  {d.reason && (
                    <p className="mt-1 text-gray-600 dark:text-gray-400">{d.reason}</p>
                  )}
                  {!d.reason && (
                    <p className="mt-1 text-gray-400 italic dark:text-gray-500">理由未記入</p>
                  )}
                </div>
              ))}
            </div>
          </div>
        )
      })()}
    </div>
  )
}
