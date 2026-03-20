'use client'

import React, { useState, useTransition, useEffect, useCallback, useRef } from 'react'
import Badge from '@/components/ui/Badge'
import { createQuestion, updateQuestion, deleteQuestion, toggleQuestionPublished, fetchQuestionsPage } from '@/app/actions/admin/questions'
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
  assessmentCount: number
  practiceCount: number
  totalCount: number
}

interface OptionFormData {
  option_text: string
  is_correct: boolean
}

const categoryLabels: Record<string, string> = {
  vocab: '語彙',
  vocabulary: '語彙',
  kanji: '漢字',
  jlpt_kanji: '漢字',
  grammar: '文法',
  reading: '読解',
  listening: '聴解',
  fill_blank: '穴埋め',
  sentence_pattern: '文章パターン',
  business_expression: 'ビジネス表現',
  keigo: '敬語',
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

const normalizedCategoryLabels: Record<string, string> = {
  vocab: '語彙',
  vocabulary: '語彙',
  kanji: '漢字',
  jlpt_kanji: '漢字',
  grammar: '文法',
  reading: '読解',
  listening: '聴解',
  fill_blank: '穴埋め',
  sentence_pattern: '文型パターン',
  business_expression: 'ビジネス表現',
  keigo: '敬語',
  algorithm: 'アルゴリズム',
  data_structure: 'データ構造',
  basic_theory: '情報表現',
  computer_architecture: 'コンピュータ構成',
  database: 'データベース',
  network: 'ネットワーク',
  os: 'オペレーティングシステム',
  security: 'セキュリティ',
  java_core: 'Java基礎',
  spring_boot: 'Spring Boot',
  javascript_core: 'JavaScript基礎',
  react: 'React',
  sql: 'SQL',
  python: 'Python',
  nextjs: 'Next.js',
  java_code: 'Javaコード',
  javascript_code: 'JavaScriptコード',
  business_manner: 'ビジネスマナー',
  communication: 'コミュニケーション',
  cross_culture: '異文化理解',
}

const normalizedDifficultyLabels: Record<string, string> = {
  easy: '初級',
  medium: '中級',
  hard: '上級',
  N5: 'N5',
  N4: 'N4',
  N3: 'N3',
  N2: 'N2',
  N1: 'N1',
  初級: '初級',
  中級: '中級',
  上級: '上級',
  '?앯킎': '初級',
  '訝?킎': '中級',
  '訝딁킎': '上級',
}

Object.assign(categoryLabels, normalizedCategoryLabels, {
  basic_theory_check_1: '情報表現',
  basic_theory_check_2: '情報表現',
  basic_theory_final: '情報表現',
  data_structure_check_1: 'データ構造',
  data_structure_check_2: 'データ構造',
  data_structure_final: 'データ構造',
  algorithm_check_1: 'アルゴリズム',
  algorithm_check_2: 'アルゴリズム',
  algorithm_final: 'アルゴリズム',
  computer_architecture_check_1: 'コンピュータ構成',
  computer_architecture_check_2: 'コンピュータ構成',
  computer_architecture_final: 'コンピュータ構成',
  database_check_1: 'データベース',
  database_check_2: 'データベース',
  database_final: 'データベース',
  network_check_1: 'ネットワーク',
  network_check_2: 'ネットワーク',
  network_final: 'ネットワーク',
  os_check_1: 'オペレーティングシステム',
  os_check_2: 'オペレーティングシステム',
  os_final: 'オペレーティングシステム',
  security_check_1: 'セキュリティ',
  security_check_2: 'セキュリティ',
  security_final: 'セキュリティ',
})

Object.assign(difficultyLabels, normalizedDifficultyLabels)

export default function AdminCoursesClient({
  axes,
}: {
  axes: AxisConfig[]
}) {
  const router = useRouter()
  const [selectedStep, setSelectedStep] = useState(1)
  const [activeSection, setActiveSection] = useState<'assessment' | 'practice'>('assessment')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [messageType, setMessageType] = useState<'success' | 'error'>('success')
  const [filters, setFilters] = useState<FilterState>({
    difficulty: '',
    published: '',
    category: '',
    claimsOnly: false,
  })

  // ── Paginated question loading ──
  const PAGE_SIZE = 200
  const [questions, setQuestions] = useState<QuestionData[]>([])
  const [totalCount, setTotalCount] = useState(0)
  const [hasMore, setHasMore] = useState(false)
  const [availableCategories, setAvailableCategories] = useState<string[]>([])
  const [loading, setLoading] = useState(false)
  const [loadingMore, setLoadingMore] = useState(false)
  // Track what we've loaded: "step:section:filters"
  const loadedRef = useRef<string | null>(null)
  const sentinelRef = useRef<HTMLDivElement>(null)

  const currentAxis = axes.find(a => a.step === selectedStep)!
  const hasPractice = currentAxis.practiceTypes.length > 0
  const isCsPracticeSection = currentAxis.step === 3 && activeSection === 'practice'

  const CS_SUBJECT_LABELS: Record<string, string> = {
    basic_theory: '情報表現',
    data_structure: 'データ構造',
    algorithm: 'アルゴリズム',
    computer_architecture: 'コンピュータ構成',
    database: 'データベース',
    network: 'ネットワーク',
    os: 'オペレーティングシステム',
    security: 'セキュリティ',
  }

  const csSubjectLabels = {
    basic_theory: '情報表現',
    data_structure: 'データ構造',
    algorithm: 'アルゴリズム',
    computer_architecture: 'コンピュータ構成',
    database: 'データベース',
    network: 'ネットワーク',
    os: 'オペレーティングシステム',
    security: 'セキュリティ',
  } as const

  const CS_SUBJECT_ORDER = [
    'basic_theory',
    'data_structure',
    'algorithm',
    'computer_architecture',
    'database',
    'network',
    'os',
    'security',
  ] as const

  function getCsSubjectCategory(rawCategory: string | null | undefined) {
    if (!rawCategory) return null
    const direct = rawCategory.replace(/_(check_[12]|final)$/, '')
    return csSubjectLabels[direct as keyof typeof csSubjectLabels] ? direct : null
  }

  function getCsDifficultyLabel(value: string | null | undefined) {
    if (value === 'easy') return '初級'
    if (value === 'medium') return '中級'
    if (value === 'hard') return '上級'
    return value ?? '未設定'
  }

  function getCategoryLabel(rawCategory: string | null | undefined) {
    if (!rawCategory) return '未分類(旧データ)'
    if (isCsPracticeSection) {
      const subject = getCsSubjectCategory(rawCategory)
      return subject ? CS_SUBJECT_LABELS[subject] : '未分類(旧データ)'
    }
    return categoryLabels[rawCategory] ?? rawCategory
  }

  function getDifficultyLabel(value: string | null | undefined) {
    if (isCsPracticeSection) return getCsDifficultyLabel(value)
    return value ? (difficultyLabels[value] ?? value) : '未設定'
  }

  function getDisplayCategoryLabel(rawCategory: string | null | undefined) {
    if (!rawCategory) return '未分類(旧データ)'
    if (isCsPracticeSection) {
      const direct = rawCategory.replace(/_(check_[12]|final)$/, '')
      return csSubjectLabels[direct as keyof typeof csSubjectLabels] ?? '未分類(旧データ)'
    }
    return normalizedCategoryLabels[rawCategory] ?? categoryLabels[rawCategory] ?? rawCategory
  }

  function getDisplayDifficultyLabel(value: string | null | undefined) {
    if (!value) return '未設定'
    if (isCsPracticeSection) return normalizedDifficultyLabels[value] ?? value
    return normalizedDifficultyLabels[value] ?? difficultyLabels[value] ?? value
  }

  const getQuizIds = useCallback(() => {
    return activeSection === 'assessment'
      ? [currentAxis.assessmentQuizId]
      : currentAxis.practiceTypes.flatMap(pt => pt.quizIds)
  }, [activeSection, currentAxis])

  const loadPage = useCallback(async (quizIds: string[], filtersArg: FilterState, offset: number, append: boolean) => {
    if (quizIds.length === 0) {
      setQuestions([])
      setTotalCount(0)
      setHasMore(false)
      setAvailableCategories([])
      return
    }

    if (append) setLoadingMore(true)
    else setLoading(true)

    const result = await fetchQuestionsPage(quizIds, {
      difficulty: filtersArg.difficulty || undefined,
      category: filtersArg.category || undefined,
      published: (filtersArg.published as 'published' | 'unpublished' | '') || '',
      claimsOnly: filtersArg.claimsOnly,
    }, offset, PAGE_SIZE)

    if (append) {
      setQuestions(prev => [...prev, ...(result.questions ?? [])])
    } else {
      setQuestions(result.questions ?? [])
    }
    setTotalCount(result.totalCount)
    setHasMore(result.hasMore)
    setAvailableCategories(result.availableCategories ?? [])

    if (append) setLoadingMore(false)
    else setLoading(false)
  }, [])

  // Load questions when step/section changes
  const filterSkipRef = useRef(false)
  useEffect(() => {
    const key = `${selectedStep}:${activeSection}`
    if (loadedRef.current === key) return
    loadedRef.current = key

    // Skip next filter effect since step/section change resets filters
    filterSkipRef.current = true
    const quizIds = getQuizIds()
    loadPage(quizIds, { difficulty: '', published: '', category: '', claimsOnly: false }, 0, false)
  }, [selectedStep, activeSection, getQuizIds, loadPage])

  // Reload when filters change (skip on step/section changes which reset filters)
  const filterInitRef = useRef(false)
  useEffect(() => {
    if (!filterInitRef.current) {
      filterInitRef.current = true
      return
    }
    if (filterSkipRef.current) {
      filterSkipRef.current = false
      return
    }
    const quizIds = getQuizIds()
    loadPage(quizIds, filters, 0, false)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters.difficulty, filters.published, filters.category, filters.claimsOnly])

  // Infinite scroll observer
  useEffect(() => {
    if (!sentinelRef.current || !hasMore) return
    const observer = new IntersectionObserver(entries => {
      if (entries[0].isIntersecting && hasMore && !loadingMore) {
        const quizIds = getQuizIds()
        loadPage(quizIds, filters, questions.length, true)
      }
    }, { threshold: 0.1 })
    observer.observe(sentinelRef.current)
    return () => observer.disconnect()
  }, [hasMore, loadingMore, questions.length, filters, getQuizIds, loadPage])

  // Invalidate cache on mutation (force reload from offset 0)
  function invalidateCache() {
    loadedRef.current = `${selectedStep}:${activeSection}`
    const quizIds = getQuizIds()
    loadPage(quizIds, filters, 0, false)
  }

  // Modal states
  const [showAddForm, setShowAddForm] = useState(false)
  const [editingQuestion, setEditingQuestion] = useState<QuestionData | null>(null)
  const [claimDetailId, setClaimDetailId] = useState<string | null>(null)
  const [formSection, setFormSection] = useState<'assessment' | 'practice'>('assessment')

  // Form state
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

  function showMsg(msg: string, type: 'success' | 'error' = 'success') {
    setMessage(msg)
    setMessageType(type)
    setTimeout(() => setMessage(null), 3000)
  }

  const normalizedCsDevDifficultyOptions = [
    { value: 'easy', label: '初級' },
    { value: 'medium', label: '中級' },
    { value: 'hard', label: '上級' },
  ]

  const CS_DEV_DIFFICULTY_OPTIONS = [
    { value: 'easy', label: 'ブロンズ' },
    { value: 'medium', label: 'シルバー' },
    { value: 'hard', label: 'ゴールド' },
  ]

  function getDifficultyOptions(): { value: string; label: string }[] {
    if (currentAxis.step === 1) return N_LEVEL_OPTIONS
    if (currentAxis.step === 3 || currentAxis.step === 4) return normalizedCsDevDifficultyOptions
    return TRADITIONAL_DIFFICULTY_OPTIONS
  }

  // Server-side filtering — questions state already contains filtered results
  const filteredQuestions = questions
  const activeDifficultyOptions = getDifficultyOptions()

  // Quiz type → default question_category mapping
  const quizTypeToCategoryMap: Record<string, string> = {
    jlpt_vocab: 'vocab',
    jlpt_grammar: 'grammar',
    jlpt_reading: 'reading',
    jlpt_listening: 'listening',
    jlpt_kanji: 'jlpt_kanji',
  }

  const categoryToQuizTypeMap: Record<string, string> = {}
  currentAxis.practiceTypes.forEach(pt => {
    const cat = quizTypeToCategoryMap[pt.quizType]
    if (cat) categoryToQuizTypeMap[cat] = pt.quizType
  })

  const rawPracticeCategories = currentAxis.practiceTypes
    .map(pt => ({ value: quizTypeToCategoryMap[pt.quizType] ?? pt.quizType, label: pt.label }))
    .filter(c => c.value)

  const practiceCategories = isCsPracticeSection
    ? CS_SUBJECT_ORDER.map((cat) => ({ value: cat, label: csSubjectLabels[cat] }))
    : rawPracticeCategories

  const toolbarCategories = activeSection === 'practice'
    ? (
        isCsPracticeSection
          ? [
              ...CS_SUBJECT_ORDER.map((cat) => ({
                value: `__cs_subject__:${cat}`,
                label: csSubjectLabels[cat],
              })),
              { value: '__legacy_unclassified__', label: '未分類(旧データ)' },
            ]
          : practiceCategories
      )
    : availableCategories.map(cat => ({ value: cat, label: normalizedCategoryLabels[cat] ?? categoryLabels[cat] ?? cat }))

  const displayToolbarCategories = toolbarCategories.map((cat) => (
    cat.value === '__legacy_unclassified__'
      ? { ...cat, label: '未分類(旧データ)' }
      : cat
  ))
  const filteredToolbarCategories = displayToolbarCategories.filter((cat) => cat.value !== '__legacy_unclassified__')

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

  function openManagedAddForm(section: 'assessment' | 'practice') {
    setFormSection(section)
    setEditingQuestion(null)
    setFormText('')
    setFormDifficulty(currentAxis.step === 1 ? 'N3' : (isCsPracticeSection ? 'medium' : '中級'))
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

  function openManagedEditForm(q: QuestionData) {
    const isAssessment = q.quiz_id === currentAxis.assessmentQuizId
    setFormSection(isAssessment ? 'assessment' : 'practice')
    setFormText(q.question_text)
    setFormDifficulty(q.difficulty ?? (isCsPracticeSection ? 'medium' : '中級'))
    setFormCategory(isCsPracticeSection ? (getCsSubjectCategory(q.question_category) ?? '') : (q.question_category ?? ''))
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

  useEffect(() => {
    if (!showAddForm) return
    function handleKeyDown(e: KeyboardEvent) {
      if (e.key === 'Escape') closeForm()
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [showAddForm, closeForm])

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

  function getCreateQuizId(): string | undefined {
    if (formSection === 'assessment') return currentAxis.assessmentQuizId
    const quizType = categoryToQuizTypeMap[formCategory]
    const pt = currentAxis.practiceTypes.find(p => p.quizType === quizType)
    return pt?.quizIds[0] ?? currentAxis.practiceTypes[0]?.quizIds[0]
  }

  function getManagedCreateQuizId(): string | undefined {
    if (formSection === 'assessment') return currentAxis.assessmentQuizId
    if (isCsPracticeSection) return currentAxis.practiceTypes[0]?.quizIds[0]
    return getCreateQuizId()
  }

  function getQuestionCategoryForSave() {
    if (formSection !== 'practice') return formCategory || null
    if (!isCsPracticeSection) return formCategory || null
    if (!formCategory) return null

    const editingCategory = getCsSubjectCategory(editingQuestion?.question_category)
    if (editingQuestion?.question_category && editingCategory === formCategory) {
      return editingQuestion.question_category
    }

    return formCategory
  }

  function handleSubmitForm() {
    if (!formText.trim()) { showMsg('問題テキストを入力してください', 'error'); return }
    if (formSection === 'practice' && !formCategory) { showMsg('カテゴリを選択してください', 'error'); return }
    const validOptions = formOptions.filter(o => o.option_text.trim())
    if (validOptions.length < 2) { showMsg('選択肢を最低2つ入力してください', 'error'); return }
    if (!validOptions.some(o => o.is_correct)) { showMsg('正解を1つ選択してください', 'error'); return }
    const createQuizId = getManagedCreateQuizId()
    if (!createQuizId) { showMsg('クイズIDが見つかりません', 'error'); return }

    const data = {
      question_text: formText.trim(),
      question_type: 'multiple_choice',
      difficulty: formDifficulty,
      question_category: getQuestionCategoryForSave(),
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

      if (result.error) showMsg(result.error, 'error')
      else {
        showMsg(editingQuestion ? '問題を更新しました' : '問題を追加しました', 'success')
        closeForm()
        invalidateCache()
      }
    })
  }

  function handleTogglePublished(q: QuestionData) {
    startTransition(async () => {
      const result = await toggleQuestionPublished(q.id, !q.is_published)
      if (result.error) showMsg(result.error, 'error')
      else {
        showMsg(q.is_published ? '非公開にしました' : '公開しました', 'success')
        invalidateCache()
      }
    })
  }

  function handleDelete(q: QuestionData) {
    if (!confirm(`この問題を削除しますか？\n「${q.question_text.slice(0, 50)}...」`)) return
    startTransition(async () => {
      const result = await deleteQuestion(q.id)
      if (result.error) showMsg(result.error, 'error')
      else {
        showMsg('問題を削除しました', 'success')
        invalidateCache()
      }
    })
  }

  function handleResolveClaims(questionId: string) {
    startTransition(async () => {
      const result = await resolveQuestionClaims(questionId)
      if (result.error) {
        showMsg(result.error, 'error')
      } else {
        showMsg('クレームを全件解決しました', 'success')
        setClaimDetailId(null)
        invalidateCache()
        router.refresh()
      }
    })
  }

  const formDifficultyOptions = getDifficultyOptions()

  // Render question row
  function renderQuestionRow(q: QuestionData) {
    return (
      <tr key={q.id} className={!q.is_published ? 'bg-gray-50/50 dark:bg-gray-800/50' : ''}>
        <td className="px-4 py-3 text-sm text-gray-900 dark:text-white max-w-xs">
          <span className="line-clamp-2">{q.question_text}</span>
        </td>
        <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
          {getDisplayCategoryLabel(q.question_category)}
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
              onClick={() => openManagedEditForm(q)}
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

  // Render toolbar
  function renderToolbar(section: 'assessment' | 'practice') {
    return (
      <div className="flex flex-wrap items-center gap-3">
        <button
          onClick={() => openManagedAddForm(section)}
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

        {filteredToolbarCategories.length > 0 && (
          <select
            value={filters.category}
            onChange={e => setFilters(f => ({ ...f, category: e.target.value }))}
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
          >
            <option value="">全カテゴリ</option>
            {filteredToolbarCategories.map(cat => (
              <option key={cat.value} value={cat.value}>{cat.label}</option>
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
        <span className="text-sm text-gray-500 dark:text-gray-400">
          {filteredQuestions.length} / {totalCount}件 表示中
        </span>
      </div>
    )
  }

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

  function renderLoadingState() {
    return (
      <div className="py-12 text-center">
        <div className="inline-block h-6 w-6 animate-spin rounded-full border-2 border-indigo-600 border-t-transparent" />
        <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">読み込み中...</p>
      </div>
    )
  }

  function renderSentinel() {
    if (!hasMore) return null
    return (
      <div ref={sentinelRef} className="py-4 text-center">
        {loadingMore && (
          <div className="inline-block h-5 w-5 animate-spin rounded-full border-2 border-indigo-600 border-t-transparent" />
        )}
      </div>
    )
  }

  function renderQuestionTable() {
    if (loading) return renderLoadingState()

    return (
      <div className="mt-3 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
            {renderTableHead()}
            <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
              {filteredQuestions.map(q => renderQuestionRow(q))}
            </tbody>
          </table>
        </div>
        {filteredQuestions.length === 0 && !loading && (
          <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">問題がありません</div>
        )}
        {renderSentinel()}
      </div>
    )
  }

  return (
    <div className="mt-6">
      {message && (
        <div className={`fixed inset-x-0 top-6 z-50 mx-auto w-fit animate-bounce rounded-lg border px-4 py-3 text-sm font-medium shadow-lg ${
          messageType === 'error'
            ? 'border-red-300 bg-red-50 text-red-700 dark:border-red-700 dark:bg-red-900/30 dark:text-red-300'
            : 'border-green-300 bg-green-50 text-green-700 dark:border-green-700 dark:bg-green-900/30 dark:text-green-300'
        }`}>
          {messageType === 'error' ? '⚠ ' : '✓ '}{message}
        </div>
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

      {/* Section Toggle Tabs */}
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
              {currentAxis.assessmentCount}
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
              {currentAxis.practiceCount}
            </span>
          </button>
        </div>
      )}

      {/* Content */}
      <div className={hasPractice ? 'mt-4' : 'mt-6'}>
        {!hasPractice && (
          <h2 className="flex items-center gap-2 text-base font-semibold text-gray-900 dark:text-white">
            総合試験
            <span className="rounded-full bg-indigo-100 px-2.5 py-0.5 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
              {currentAxis.assessmentCount}問
            </span>
          </h2>
        )}

        <div className={hasPractice ? '' : 'mt-3'}>
          {renderToolbar(activeSection)}
        </div>

        {renderQuestionTable()}
      </div>

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

      {/* Edit/Add Modal */}
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
                      {availableCategories.map(cat => (
                        <option key={cat} value={cat}>{normalizedCategoryLabels[cat] ?? categoryLabels[cat] ?? cat}</option>
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
