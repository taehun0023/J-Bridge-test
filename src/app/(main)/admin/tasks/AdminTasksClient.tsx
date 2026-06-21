'use client'

import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import {
  deleteLearningAssignment,
  updateLearningAssignment,
  confirmAssignment,
  reassignAssignment,
} from '@/app/actions/learning-assignments'
import { getCategoryLabel, getSubcategoryLabel, getContentLevelLabel } from '@/lib/assignment-categories'
import { areaLabel, categoryLabel as itemCategoryLabel, isItemCategory } from '@/lib/item-assignments'
import { updateMonthlyAssignmentConfig, type MonthlyAssignConfig } from '@/app/actions/item-assignments'
import ItemAssignModal from '@/app/(main)/dashboard/ItemAssignModal'
import NameRuby from '@/components/ui/NameRuby'
import { Plus, Languages, ChevronDown, ChevronRight } from 'lucide-react'

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
  target_certification?: string | null
  japanese_mentor_name?: string | null
  tech_mentor_name?: string | null
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

/** 우측 상세 페이징: 한 페이지 과제 수 */
const PAGE_SIZE = 20

/**
 * 서브카테고리 라벨. 항목 과제(target_count)는 subcategory에 영역키(vocabulary/kanji 등)를
 * 영어로 저장하므로 item-assignments의 일본어 영역 라벨을 사용. 그 외(퀴즈형)는 기존 매핑.
 */
function subcategoryLabel(la: LearningAssignmentRow): string {
  if (la.target_count != null && isItemCategory(la.category)) {
    return areaLabel(la.category, la.subcategory)
  }
  return getSubcategoryLabel(la.category, la.subcategory)
}

/**
 * 카테고리 라벨. 항목/이해테스트 과제(seikatsu-quiz/business-jp-quiz 등)는 ASSIGNMENT_CATEGORIES에
 * 없어 영어 키가 노출되므로 item-assignments의 일본어 라벨을 사용.
 */
function categoryDisplayLabel(la: LearningAssignmentRow): string {
  if (la.target_count != null && isItemCategory(la.category)) {
    return itemCategoryLabel(la.category)
  }
  return getCategoryLabel(la.category)
}

/**
 * 期限 표시 — 정책상 "부여한 달 말일 23:59". due_date가 있으면 그 달, 없으면(항목/자동 과제)
 * created_at 의 달 말일로 계산해 「M月D日 23時59分」으로 표기.
 */
function formatDeadline(la: LearningAssignmentRow): string {
  const base = la.due_date ? new Date(la.due_date) : new Date(la.created_at)
  const eom = new Date(base.getFullYear(), base.getMonth() + 1, 0)
  return `${eom.getMonth() + 1}月${eom.getDate()}日 23時59分`
}

interface Props {
  mentees: Mentee[]
  /** 課題/理解テスト 배분 모달용 전체 멘티 목록 (target 포함) */
  allMentees: Mentee[]
  assignmentsByMentee: Record<string, LearningAssignmentRow[]>
  currentRole: string
  learningProgress: Record<string, LearningProgressData>
  monthlyConfig: MonthlyAssignConfig
}

/** 월별 자동부여 설정 영역 키 (생활일본어 5영역) */
const CONFIG_AREAS = ['vocabulary', 'grammar', 'reading', 'listening', 'kanji'] as const

export default function AdminTasksClient({ mentees, allMentees, assignmentsByMentee, learningProgress, monthlyConfig }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [messageType, setMessageType] = useState<'success' | 'error'>('success')

  // 課題(JLPT項目) / 理解テスト 배분 모달 (대시보드와 동일한 ItemAssignModal)
  const [jlptOpen, setJlptOpen] = useState(false)
  const [quizOpen, setQuizOpen] = useState(false)

  // 월별 자동부여 개수 설정
  const [cfg, setCfg] = useState<MonthlyAssignConfig>(monthlyConfig)

  // Mentee-centric state (마스터-디테일: 선택 멘티 + 날짜 드롭다운 + 페이징)
  const [searchName, setSearchName] = useState('')
  const [selectedMentee, setSelectedMentee] = useState<string | null>(null)
  const [openDates, setOpenDates] = useState<Record<string, boolean>>({})
  const [page, setPage] = useState(1)

  function selectMentee(id: string) {
    setSelectedMentee(id)
    setPage(1)
    setOpenDates({})
  }

  // Overdue handling state
  const [reassignDate, setReassignDate] = useState<Record<string, string>>({})
  const [expandedReassign, setExpandedReassign] = useState<Record<string, boolean>>({})

  // Edit state — 付与個数(target_count)만 수정 가능. 타이틀·期限·説明은 자동/제거됨.
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editValues, setEditValues] = useState<{ target_count: string }>({ target_count: '' })

  function showMsg(msg: string, type: 'success' | 'error' = 'success') {
    setMessage(msg)
    setMessageType(type)
    setTimeout(() => setMessage(null), 4000)
  }

  function handleSaveConfig() {
    startTransition(async () => {
      const res = await updateMonthlyAssignmentConfig(cfg)
      if (res.error) showMsg(res.error, 'error')
      else showMsg('月別自動付与の個数を保存しました')
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
    setEditValues({ target_count: la.target_count != null ? String(la.target_count) : '' })
  }

  function handleSaveEdit(la: LearningAssignmentRow) {
    startTransition(async () => {
      const result = await updateLearningAssignment(la.id, {
        target_count: la.target_count != null && editValues.target_count !== ''
          ? parseInt(editValues.target_count, 10)
          : undefined,
      })
      if (result.error) showMsg(result.error, 'error')
      else { showMsg('修正しました'); setEditingId(null) }
    })
  }

  const modalMentees = allMentees.map(m => ({
    id: m.id, full_name: m.full_name, email: m.email, target: m.target_certification ?? null,
  }))

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

  /** 개별 과제 행 (요약 드릴다운 / 퀴즈형 평면 리스트 공용) */
  function renderAssignmentRow(la: LearningAssignmentRow) {
    return (
      <li key={la.id} className="px-4 py-3">
        {editingId === la.id ? (
          /* ── Edit form (付与個数のみ) ── */
          <div className="space-y-2">
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
                {categoryDisplayLabel(la)} &gt; {subcategoryLabel(la)}
                {la.content_level && ` (${getContentLevelLabel(la.category, la.content_level)})`}
                {' · '}{progressLabel(la)}
                {' · '}付与 {new Date(la.created_at).toLocaleDateString('ja-JP')}
                {' · '}期限 {formatDeadline(la)}
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
              {la.target_count != null && (
                <button onClick={() => startEdit(la)} disabled={pending}
                  className="rounded-md bg-gray-100 px-3 py-1 text-xs font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-200 dark:hover:bg-gray-600">修正</button>
              )}
              <button onClick={() => handleDeleteLearning(la.id)} disabled={pending}
                className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400">削除</button>
            </div>
          </div>
        )}
      </li>
    )
  }

  /** 선택된 멘티의 과제 이력 상세 — 부여한 날짜별 드롭다운 + 20건 페이징 (최신순) */
  function renderMenteeDetail(menteeId: string) {
    const list = assignmentsByMentee[menteeId] ?? []
    if (list.length === 0) {
      return <div className="px-4 py-12 text-center text-sm text-gray-400">配信された課題がありません</div>
    }
    const sorted = [...list].sort((a, b) => {
      // 1차: 부여일 최신순. 2차: 영역 순서(漢字→語彙→読解→文法→聴解). 그 외 항목/동률은 안정 정렬
      const byDate = new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
      if (byDate !== 0) return byDate
      const areaRank = (s: string) => {
        const order = ['kanji', 'vocabulary', 'reading', 'grammar', 'listening']
        const i = order.indexOf(s)
        return i === -1 ? order.length : i
      }
      return areaRank(a.subcategory) - areaRank(b.subcategory)
        || a.category.localeCompare(b.category)
        || a.subcategory.localeCompare(b.subcategory)
        || (a.content_level ?? '').localeCompare(b.content_level ?? '')
        || a.title.localeCompare(b.title)
        || a.id.localeCompare(b.id)
    })
    const totalPages = Math.max(1, Math.ceil(sorted.length / PAGE_SIZE))
    const safePage = Math.min(page, totalPages)
    const pageItems = sorted.slice((safePage - 1) * PAGE_SIZE, safePage * PAGE_SIZE)

    const byDate = new Map<string, LearningAssignmentRow[]>()
    for (const a of pageItems) {
      const d = new Date(a.created_at).toLocaleDateString('ja-JP')
      if (!byDate.has(d)) byDate.set(d, [])
      byDate.get(d)!.push(a)
    }

    return (
      <div>
        {/* 20건 페이징 영역 — 고정 높이, 내부 스크롤 */}
        <div className="h-[600px] divide-y divide-gray-100 overflow-y-auto dark:divide-gray-700">
          {[...byDate.entries()].map(([date, rows]) => {
            const open = openDates[date] === true
            return (
              <div key={date}>
                <button
                  onClick={() => setOpenDates(prev => ({ ...prev, [date]: !prev[date] }))}
                  className="flex w-full items-center gap-2 bg-gray-50 px-4 py-2 text-left text-xs font-semibold text-gray-600 hover:bg-gray-100 dark:bg-gray-900/30 dark:text-gray-300 dark:hover:bg-gray-900/50"
                >
                  {open ? <ChevronDown className="h-3.5 w-3.5 shrink-0 text-gray-400" /> : <ChevronRight className="h-3.5 w-3.5 shrink-0 text-gray-400" />}
                  {date}
                  <span className="font-normal text-gray-400">· {rows.length}件</span>
                </button>
                {open && (
                  <ul className="divide-y divide-gray-100 dark:divide-gray-700">
                    {rows.map(renderAssignmentRow)}
                  </ul>
                )}
              </div>
            )
          })}
        </div>
        {totalPages > 1 && (
          <div className="flex items-center justify-between gap-2 border-t border-gray-100 px-4 py-2.5 text-xs text-gray-500 dark:border-gray-700 dark:text-gray-400">
            <span>{sorted.length}件中 {(safePage - 1) * PAGE_SIZE + 1}–{Math.min(safePage * PAGE_SIZE, sorted.length)}</span>
            <div className="flex items-center gap-1">
              <button
                onClick={() => setPage(p => Math.max(1, p - 1))}
                disabled={safePage <= 1}
                className="rounded-md border border-gray-200 px-2 py-1 hover:bg-gray-50 disabled:opacity-40 dark:border-gray-600 dark:hover:bg-gray-700"
              >前へ</button>
              <span className="px-1 tabular-nums">{safePage} / {totalPages}</span>
              <button
                onClick={() => setPage(p => Math.min(totalPages, p + 1))}
                disabled={safePage >= totalPages}
                className="rounded-md border border-gray-200 px-2 py-1 hover:bg-gray-50 disabled:opacity-40 dark:border-gray-600 dark:hover:bg-gray-700"
              >次へ</button>
            </div>
          </div>
        )}
      </div>
    )
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

      {/* 課題(JLPT項目) / 理解テスト 배분 — 대시보드와 동일한 ItemAssignModal */}
      <div className="flex flex-wrap items-center gap-2">
        <button
          type="button"
          onClick={() => setJlptOpen(true)}
          disabled={allMentees.length === 0}
          className="inline-flex items-center gap-1.5 rounded-lg bg-violet-600 px-4 py-2 text-sm font-medium text-white hover:bg-violet-500 disabled:cursor-not-allowed disabled:opacity-50"
        >
          <Languages className="h-4 w-4" /> 課題
        </button>
        <button
          type="button"
          onClick={() => setQuizOpen(true)}
          disabled={allMentees.length === 0}
          className="inline-flex items-center gap-1.5 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:cursor-not-allowed disabled:opacity-50"
        >
          <Plus className="h-4 w-4" /> 理解テスト
        </button>
      </div>

      <ItemAssignModal
        open={jlptOpen}
        onClose={() => setJlptOpen(false)}
        mentees={modalMentees}
      />
      <ItemAssignModal
        open={quizOpen}
        onClose={() => setQuizOpen(false)}
        mentees={modalMentees}
        categories={['seikatsu-quiz', 'business-jp-quiz']}
        heading="理解テストを割り当てる（増分）"
      />

      {/* 월별 자동부여 개수 설정 (생활일본어) */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-800">
        <div className="flex items-center justify-between gap-2">
          <h3 className="text-sm font-semibold text-gray-900 dark:text-white">月別自動付与の個数（JLPT）</h3>
          <button
            type="button"
            onClick={handleSaveConfig}
            disabled={pending}
            className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
          >保存</button>
        </div>
        <p className="mt-1 text-xs text-gray-400">毎月1日、目標レベル設定済みのメンティーへ自動付与される領域別の項目数。</p>
        <div className="mt-3 grid grid-cols-2 gap-3 sm:grid-cols-5">
          {CONFIG_AREAS.map(a => (
            <div key={a}>
              <label className="block text-xs font-medium text-gray-600 dark:text-gray-300">{areaLabel('seikatsu', a)}</label>
              <input
                type="number"
                min={0}
                value={cfg[a]}
                onChange={e => setCfg(prev => ({ ...prev, [a]: Math.max(0, parseInt(e.target.value || '0', 10) || 0) }))}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-2 py-1.5 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              />
            </div>
          ))}
        </div>
      </div>

      {/* 마스터-디테일: 좌측 멘티 목록 / 우측 선택 멘티 상세 (높이 독립) */}
      <div className="mt-4 flex flex-col gap-4 lg:flex-row lg:items-start">
        {/* Left: mentee list */}
        <div className="w-full shrink-0 lg:max-w-xs">
          <input
            type="text"
            placeholder="メンティー名で検索..."
            value={searchName}
            onChange={e => setSearchName(e.target.value)}
            className="w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400"
          />
          <div className="mt-3 divide-y divide-gray-100 overflow-hidden rounded-xl border border-gray-200 bg-white dark:divide-gray-700 dark:border-gray-700 dark:bg-gray-800">
            {filteredMentees.map(m => {
              const list = assignmentsByMentee[m.id] ?? []
              // 항목 수(target_count) 기준 — rung 행 수가 아니라 실제 항목 수
              const overdueCount = list.filter(a => a.status === 'overdue').reduce((s, a) => s + (a.target_count ?? 0), 0)
              const totalItems = list.reduce((s, a) => s + (a.target_count ?? 0), 0)
              const sel = selectedMentee === m.id
              return (
                <button
                  key={m.id}
                  onClick={() => selectMentee(m.id)}
                  className={`flex w-full items-center gap-2 px-3 py-2.5 text-left transition-colors ${
                    sel
                      ? 'bg-indigo-50 dark:bg-indigo-500/15'
                      : 'hover:bg-gray-50 dark:hover:bg-gray-700/50'
                  }`}
                >
                  <span className="min-w-0 flex-1 truncate font-medium text-gray-900 dark:text-white">
                    <NameRuby name={m.full_name} fallback={m.email} />
                  </span>
                  {overdueCount > 0 && (
                    <span className="inline-flex shrink-0 items-center rounded-full bg-red-100 px-1.5 py-0.5 text-[10px] font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">遅延 {overdueCount}</span>
                  )}
                  <span className="inline-flex shrink-0 items-center rounded-full bg-gray-100 px-1.5 py-0.5 text-[10px] font-medium text-gray-600 dark:bg-gray-700 dark:text-gray-300">{totalItems}</span>
                </button>
              )
            })}
            {filteredMentees.length === 0 && (
              <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">
                {mentees.length === 0 ? 'メンティーがいません' : '該当なし'}
              </div>
            )}
          </div>
        </div>

        {/* Right: selected mentee detail */}
        <div className="min-w-0 flex-1 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
          {(() => {
            const sm = selectedMentee ? mentees.find(x => x.id === selectedMentee) : null
            if (!sm) {
              return (
                <div className="flex min-h-[20rem] items-center justify-center px-4 py-16 text-center text-sm text-gray-400 dark:text-gray-500">
                  左のメンティーを選択すると、課題履歴が表示されます
                </div>
              )
            }
            return (
              <>
                <div className="flex flex-wrap items-center gap-x-6 gap-y-1 border-b border-gray-100 px-4 py-3 dark:border-gray-700">
                  <span className="flex items-center gap-2">
                    <span className="font-medium text-gray-500 dark:text-gray-400">日本語メンター</span>
                    {sm.japanese_mentor_name
                      ? <span className="font-semibold text-gray-900 dark:text-white"><NameRuby name={sm.japanese_mentor_name} /></span>
                      : <span className="text-gray-400">未割り当て</span>}
                  </span>
                  <span className="flex items-center gap-2">
                    <span className="font-medium text-gray-500 dark:text-gray-400">技術メンター</span>
                    {sm.tech_mentor_name
                      ? <span className="font-semibold text-gray-900 dark:text-white"><NameRuby name={sm.tech_mentor_name} /></span>
                      : <span className="text-gray-400">未割り当て</span>}
                  </span>
                </div>
                {renderMenteeDetail(sm.id)}
              </>
            )
          })()}
        </div>
      </div>
    </div>
  )
}
