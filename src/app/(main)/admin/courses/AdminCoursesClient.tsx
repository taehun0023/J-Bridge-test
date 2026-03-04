'use client'

import React, { useState, useTransition, useEffect, useCallback } from 'react'
import Badge from '@/components/ui/Badge'
import { createQuestion, updateQuestion, deleteQuestion, toggleQuestionPublished } from '@/app/actions/admin/questions'
import { resolveQuestionClaims } from '@/app/actions/claims'
import { useRouter } from 'next/navigation'

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
  difficulty: string | null
  question_category: string | null
  explanation: string | null
  is_published: boolean
  sort_order: number
  options: QuestionOption[]
  claim_count: number
  claim_details: ClaimDetail[]
}

interface PracticeType {
  quizType: string
  label: string
  quizIds: string[]
}

interface AxisConfig {
  step: number
  label: string
  assessmentQuizId: string
  practiceTypes: PracticeType[]
  totalCount: number
}

interface OptionFormData {
  option_text: string
  is_correct: boolean
}

const categoryLabels: Record<string, string> = {
  vocab: '語彙',
  vocabulary: '語彙',
  grammar: '文法',
  reading: '読解',
  listening: '聴解',
  fill_blank: '穴埋め',
  sentence_pattern: '文章パターン',
  business_expression: 'ビジネス表現',
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
  basic_theory: '基礎理論',
  database: 'データベース',
  security: 'セキュリティ',
}

const difficultyLabels: Record<string, string> = {
  easy: 'ブロンズ',
  medium: 'シルバー',
  hard: 'ゴールド',
  N5: 'N5',
  N4: 'N4',
  N3: 'N3',
  N2: 'N2',
  N1: 'N1',
  '初級': '初級',
  '中級': '中級',
  '上級': '上級',
}

type FilterState = {
  difficulty: string
  published: string
  category: string
  claimsOnly: boolean
}

const N_LEVEL_OPTIONS = [
  { value: 'N5', label: 'N5' },
  { value: 'N4', label: 'N4' },
  { value: 'N3', label: 'N3' },
  { value: 'N2', label: 'N2' },
  { value: 'N1', label: 'N1' },
]

const TRADITIONAL_DIFFICULTY_OPTIONS = [
  { value: '初級', label: '初級' },
  { value: '中級', label: '中級' },
  { value: '上級', label: '上級' },
]

export default function AdminCoursesClient({
  questions,
  axes,
}: {
  questions: QuestionData[]
  axes: AxisConfig[]
}) {
  const router = useRouter()
  const [selectedStep, setSelectedStep] = useState(1)
  const [activeSection, setActiveSection] = useState<'assessment' | 'practice'>('assessment')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [filters, setFilters] = useState<FilterState>({
    difficulty: '',
    published: '',
    category: '',
    claimsOnly: false,
  })

  // Modal states
  const [showAddForm, setShowAddForm] = useState(false)
  const [editingQuestion, setEditingQuestion] = useState<QuestionData | null>(null)
  const [claimDetailId, setClaimDetailId] = useState<string | null>(null)
  // Which section the form is for: 'assessment' or 'practice'
  const [formSection, setFormSection] = useState<'assessment' | 'practice'>('assessment')

  // Form state for add/edit
  const [formText, setFormText] = useState('')
  const [formDifficulty, setFormDifficulty] = useState('中級')
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

  const currentAxis = axes.find(a => a.step === selectedStep)!
  const hasPractice = currentAxis.practiceTypes.length > 0

  // Determine difficulty options based on context
  function getDifficultyOptions(section: 'assessment' | 'practice'): { value: string; label: string }[] {
    // Step 1 (JLPT) uses N-levels for both assessment and practice
    if (currentAxis.step === 1) return N_LEVEL_OPTIONS
    return TRADITIONAL_DIFFICULTY_OPTIONS
  }

  // Assessment questions
  const assessmentQuestions = questions.filter(q => q.quiz_id === currentAxis.assessmentQuizId)

  // Practice questions grouped by quiz type
  const practiceQuizIdSet = new Set(currentAxis.practiceTypes.flatMap(pt => pt.quizIds))
  const allPracticeQuestions = questions.filter(q => practiceQuizIdSet.has(q.quiz_id))

  // Apply filters
  function applyFilters(qs: QuestionData[]): QuestionData[] {
    let filtered = qs
    if (filters.difficulty) {
      if (filters.difficulty === '__null__') {
        filtered = filtered.filter(q => q.difficulty === null)
      } else {
        filtered = filtered.filter(q => q.difficulty === filters.difficulty)
      }
    }
    if (filters.category) {
      filtered = filtered.filter(q => q.question_category === filters.category)
    }
    if (filters.published === 'published') {
      filtered = filtered.filter(q => q.is_published)
    } else if (filters.published === 'unpublished') {
      filtered = filtered.filter(q => !q.is_published)
    }
    if (filters.claimsOnly) {
      filtered = filtered.filter(q => q.claim_count > 0)
    }
    return filtered
  }

  const filteredAssessment = applyFilters(assessmentQuestions)
  const filteredPractice = applyFilters(allPracticeQuestions)

  // Difficulty options for the active section's filter dropdown
  const activeDifficultyOptions = getDifficultyOptions(activeSection)

  // Quiz type → default question_category mapping
  const quizTypeToCategoryMap: Record<string, string> = {
    jlpt_vocab: 'vocab',
    jlpt_grammar: 'grammar',
    jlpt_reading: 'reading',
    jlpt_listening: 'listening',
  }

  // Reverse map: category → quizType (for deriving quiz ID from category)
  const categoryToQuizTypeMap: Record<string, string> = {}
  currentAxis.practiceTypes.forEach(pt => {
    const cat = quizTypeToCategoryMap[pt.quizType]
    if (cat) categoryToQuizTypeMap[cat] = pt.quizType
  })

  // Practice categories derived from practice types (for the form dropdown)
  const practiceCategories = currentAxis.practiceTypes
    .map(pt => ({ value: quizTypeToCategoryMap[pt.quizType] ?? pt.quizType, label: pt.label }))
    .filter(c => c.value)

  function openAddForm(section: 'assessment' | 'practice') {
    setFormSection(section)
    setEditingQuestion(null)
    setFormText('')
    setFormDifficulty(currentAxis.step === 1 ? 'N3' : '中級')
    setFormCategory(section === 'practice' ? (practiceCategories[0]?.value ?? '') : '')
    setFormExplanation('')
    setFormOptions([
      { option_text: '', is_correct: true },
      { option_text: '', is_correct: false },
      { option_text: '', is_correct: false },
      { option_text: '', is_correct: false },
    ])
    setShowAddForm(true)
  }

  function openEditForm(q: QuestionData) {
    // Determine section from quiz_id
    const isAssessment = q.quiz_id === currentAxis.assessmentQuizId
    setFormSection(isAssessment ? 'assessment' : 'practice')
    setFormText(q.question_text)
    setFormDifficulty(q.difficulty ?? '中級')
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

  const closeForm = useCallback(() => {
    setShowAddForm(false)
    setEditingQuestion(null)
  }, [])

  // ESC key handler for modal
  useEffect(() => {
    if (!showAddForm) return
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') closeForm()
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [showAddForm, closeForm])

  // ESC key handler for claim detail modal
  useEffect(() => {
    if (!claimDetailId) return
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') setClaimDetailId(null)
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [claimDetailId])

  function handleOptionChange(index: number, field: 'option_text' | 'is_correct', value: string | boolean) {
    setFormOptions(prev => {
      const next = [...prev]
      if (field === 'is_correct') {
        next.forEach((o, i) => { o.is_correct = i === index })
      } else {
        next[index] = { ...next[index], [field as string]: value }
      }
      return next
    })
  }

  // Quiz ID for creating new questions (derive from category for practice)
  function getCreateQuizId(): string | undefined {
    if (formSection === 'assessment') return currentAxis.assessmentQuizId
    const quizType = categoryToQuizTypeMap[formCategory]
    const pt = currentAxis.practiceTypes.find(p => p.quizType === quizType)
    return pt?.quizIds[0] ?? currentAxis.practiceTypes[0]?.quizIds[0]
  }

  function handleSubmitForm() {
    if (!formText.trim()) { showMsg('問題テキストを入力してください'); return }
    if (formSection === 'practice' && !formCategory) { showMsg('カテゴリを選択してください'); return }
    const validOptions = formOptions.filter(o => o.option_text.trim())
    if (validOptions.length < 2) { showMsg('選択肢を最低2つ入力してください'); return }
    if (!validOptions.some(o => o.is_correct)) { showMsg('正解を1つ選択してください'); return }
    const createQuizId = getCreateQuizId()
    if (!createQuizId) { showMsg('クイズIDが見つかりません'); return }

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
        : await createQuestion(createQuizId, data)

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

  function handleResolveClaims(questionId: string) {
    startTransition(async () => {
      const result = await resolveQuestionClaims(questionId)
      if (result.error) {
        showMsg(result.error)
      } else {
        showMsg('クレームを全件解決しました')
        setClaimDetailId(null)
        router.refresh()
      }
    })
  }

  // Unique categories for current section
  const currentSectionQuestions = formSection === 'assessment' ? assessmentQuestions : allPracticeQuestions
  const uniqueCategories = [...new Set(currentSectionQuestions.map(q => q.question_category).filter(Boolean) as string[])]

  const formDifficultyOptions = getDifficultyOptions(formSection)

  // Render question row
  function renderQuestionRow(q: QuestionData) {
    return (
      <tr key={q.id} className={!q.is_published ? 'bg-gray-50/50 dark:bg-gray-800/50' : ''}>
        <td className="px-4 py-3 text-sm text-gray-900 dark:text-white max-w-xs">
          <span className="line-clamp-2">{q.question_text}</span>
        </td>
        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
          {q.question_category ? (categoryLabels[q.question_category] ?? q.question_category) : '-'}
        </td>
        <td className="px-4 py-3">
          <Badge label={q.difficulty ? (difficultyLabels[q.difficulty] ?? q.difficulty) : '未設定'} variant="difficulty" />
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
    )
  }

  // Unique categories for the current section's filter dropdown
  function getSectionCategories(section: 'assessment' | 'practice'): string[] {
    const qs = section === 'assessment' ? assessmentQuestions : allPracticeQuestions
    return [...new Set(qs.map(q => q.question_category).filter(Boolean) as string[])]
  }

  // Render toolbar for a section
  function renderToolbar(section: 'assessment' | 'practice') {
    const sectionCategories = getSectionCategories(section)

    return (
      <div className="flex flex-wrap items-center gap-3">
        <button
          onClick={() => openAddForm(section)}
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
          {activeDifficultyOptions.map(d => (
            <option key={d.value} value={d.value}>{d.label}</option>
          ))}
          <option value="__null__">未設定</option>
        </select>

        {sectionCategories.length > 0 && (
          <select
            value={filters.category}
            onChange={e => setFilters(f => ({ ...f, category: e.target.value }))}
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
          >
            <option value="">全カテゴリ</option>
            {sectionCategories.map(cat => (
              <option key={cat} value={cat}>{categoryLabels[cat] ?? cat}</option>
            ))}
          </select>
        )}

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
      </div>
    )
  }

  // Render table header
  function renderTableHead() {
    return (
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
    )
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      {/* 5-Axis Card Navigation */}
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
        {axes.map(axis => (
          <button
            key={axis.step}
            onClick={() => { setSelectedStep(axis.step); setActiveSection('assessment'); setClaimDetailId(null); setFilters({ difficulty: '', published: '', category: '', claimsOnly: false }) }}
            className={`rounded-xl border-2 px-4 py-3 text-left transition-colors ${
              axis.step === selectedStep
                ? 'border-indigo-600 bg-indigo-50 dark:border-indigo-500 dark:bg-indigo-900/20'
                : 'border-gray-200 hover:border-gray-300 dark:border-gray-700 dark:hover:border-gray-600'
            }`}
          >
            <p className={`text-sm font-semibold ${
              axis.step === selectedStep
                ? 'text-indigo-700 dark:text-indigo-400'
                : 'text-gray-900 dark:text-white'
            }`}>
              {axis.label}
            </p>
            <p className={`mt-0.5 text-xs ${
              axis.step === selectedStep
                ? 'text-indigo-500 dark:text-indigo-400'
                : 'text-gray-500 dark:text-gray-400'
            }`}>
              {axis.totalCount}問
            </p>
          </button>
        ))}
      </div>

      {/* ── Section Toggle Tabs (Step 1, 2 only) ── */}
      {hasPractice && (
        <div className="mt-6 flex border-b border-gray-200 dark:border-gray-700">
          <button
            onClick={() => { setActiveSection('assessment'); setFilters({ difficulty: '', published: '', category: '', claimsOnly: false }) }}
            className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
              activeSection === 'assessment'
                ? 'border-indigo-600 text-indigo-700 dark:border-indigo-400 dark:text-indigo-400'
                : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300'
            }`}
          >
            総合試験
            <span className={`ml-1.5 inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
              activeSection === 'assessment'
                ? 'bg-indigo-100 text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400'
                : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-400'
            }`}>
              {assessmentQuestions.length}
            </span>
          </button>
          <button
            onClick={() => { setActiveSection('practice'); setFilters({ difficulty: '', published: '', category: '', claimsOnly: false }) }}
            className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
              activeSection === 'practice'
                ? 'border-teal-600 text-teal-700 dark:border-teal-400 dark:text-teal-400'
                : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300'
            }`}
          >
            理解度テスト
            <span className={`ml-1.5 inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
              activeSection === 'practice'
                ? 'bg-teal-100 text-teal-700 dark:bg-teal-900/30 dark:text-teal-400'
                : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-400'
            }`}>
              {allPracticeQuestions.length}
            </span>
          </button>
        </div>
      )}

      {/* ── Assessment Section ── */}
      {activeSection === 'assessment' && (
        <div className={hasPractice ? 'mt-4' : 'mt-6'}>
          {!hasPractice && (
            <h2 className="flex items-center gap-2 text-base font-semibold text-gray-900 dark:text-white">
              総合試験
              <span className="rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
                {assessmentQuestions.length}問
              </span>
            </h2>
          )}

          <div className={hasPractice ? '' : 'mt-3'}>
            {renderToolbar('assessment')}
          </div>

          <div className="mt-3 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                {renderTableHead()}
                <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                  {filteredAssessment.map(q => renderQuestionRow(q))}
                </tbody>
              </table>
            </div>
            {filteredAssessment.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">問題がありません</div>
            )}
          </div>
        </div>
      )}

      {/* ── Practice Section ── */}
      {hasPractice && activeSection === 'practice' && (
        <div className="mt-4">
          {renderToolbar('practice')}

          <div className="mt-3 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                {renderTableHead()}
                <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
                  {currentAxis.practiceTypes.map(pt => {
                    const ptQuizIdSet = new Set(pt.quizIds)
                    const ptQuestions = filteredPractice.filter(q => ptQuizIdSet.has(q.quiz_id))
                    return (
                      <React.Fragment key={pt.quizType}>
                        {/* Category separator row */}
                        <tr>
                          <td
                            colSpan={6}
                            className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-700"
                          >
                            {pt.label} ({questions.filter(q => ptQuizIdSet.has(q.quiz_id)).length}問)
                          </td>
                        </tr>
                        {ptQuestions.map(q => renderQuestionRow(q))}
                      </React.Fragment>
                    )
                  })}
                </tbody>
              </table>
            </div>
            {filteredPractice.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">問題がありません</div>
            )}
          </div>
        </div>
      )}

      {/* Claim Detail Modal */}
      {claimDetailId && (() => {
        const q = questions.find(q => q.id === claimDetailId)
        if (!q || q.claim_details.length === 0) return null
        return (
          <div
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/50"
            onClick={e => { if (e.target === e.currentTarget) setClaimDetailId(null) }}
          >
            <div className="mx-4 max-h-[85vh] w-full max-w-lg overflow-y-auto rounded-2xl border border-amber-200 bg-amber-50 p-6 shadow-xl dark:border-amber-800 dark:bg-gray-800">
              <div className="flex items-center justify-between mb-3">
                <h4 className="text-sm font-semibold text-amber-800 dark:text-amber-300">
                  クレーム詳細 ({q.claim_count}件)
                </h4>
                <button
                  onClick={() => setClaimDetailId(null)}
                  className="rounded-lg p-1 text-amber-600 hover:bg-amber-100 hover:text-amber-800 dark:text-amber-400 dark:hover:bg-gray-700 dark:hover:text-amber-300"
                >
                  <svg className="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
              <p className="mb-3 text-xs text-amber-700 dark:text-amber-400 line-clamp-2">
                問題: {q.question_text}
              </p>
              <div className="space-y-2">
                {q.claim_details.map((d, i) => (
                  <div key={i} className="rounded-lg bg-white p-3 text-sm dark:bg-gray-700">
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
              <button
                onClick={() => handleResolveClaims(q.id)}
                disabled={pending}
                className="mt-4 w-full rounded-lg bg-emerald-600 px-4 py-2 text-sm font-medium text-white hover:bg-emerald-700 disabled:opacity-50"
              >
                {pending ? '処理中...' : '全件解決'}
              </button>
            </div>
          </div>
        )
      })()}

      {/* ── Edit/Add Modal Overlay ── */}
      {showAddForm && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/50"
          onClick={e => { if (e.target === e.currentTarget) closeForm() }}
        >
          <div className="mx-4 max-h-[85vh] w-full max-w-2xl overflow-y-auto rounded-2xl bg-white p-6 shadow-xl dark:bg-gray-800">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
                {editingQuestion ? '問題編集' : '新規問題追加'}
                <span className="ml-2 text-sm font-normal text-gray-500 dark:text-gray-400">
                  ({formSection === 'assessment' ? '総合試験' : '理解度テスト'})
                </span>
              </h3>
              <button
                onClick={closeForm}
                className="rounded-lg p-1 text-gray-400 hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                <svg className="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>

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
                  {formDifficultyOptions.map(d => (
                    <option key={d.value} value={d.value}>{d.label}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">
                  カテゴリ {formSection === 'practice' ? '*' : ''}
                </label>
                <select
                  value={formCategory}
                  onChange={e => setFormCategory(e.target.value)}
                  className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                >
                  {formSection === 'practice' ? (
                    practiceCategories.map(c => (
                      <option key={c.value} value={c.value}>{c.label}</option>
                    ))
                  ) : (
                    <>
                      <option value="">未設定</option>
                      {uniqueCategories.map(cat => (
                        <option key={cat} value={cat}>{categoryLabels[cat] ?? cat}</option>
                      ))}
                    </>
                  )}
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
        </div>
      )}
    </div>
  )
}
