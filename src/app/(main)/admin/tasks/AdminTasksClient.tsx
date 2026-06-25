'use client'

import { useState, useEffect } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { useRouter } from 'next/navigation'
import {
  deleteLearningAssignment,
  updateLearningAssignment,
  confirmAssignment,
  reassignAssignment,
} from '@/app/actions/learning-assignments'
import { getCategoryLabel, getSubcategoryLabel, getContentLevelLabel } from '@/lib/assignment-categories'
import { areaLabel, categoryLabel as itemCategoryLabel, isItemCategory } from '@/lib/item-assignments'
import { updateMonthlyAssignmentConfig, setMenteeAutoAssign, type MonthlyAssignConfig } from '@/app/actions/item-assignments'
import { getJlptLevelColor, type JlptLevel } from '@/lib/assessment-config'

const MONTHLY_CONFIG_LEVELS = ['N1', 'N2', 'N3', 'N4', 'N5'] as const
const isJlpt = (v: string): v is JlptLevel => (MONTHLY_CONFIG_LEVELS as readonly string[]).includes(v)
import ItemAssignModal from '@/app/(main)/dashboard/ItemAssignModal'
import MockExamAssignModal from './MockExamAssignModal'
import NameRuby from '@/components/ui/NameRuby'
import { Languages, ChevronDown, ChevronRight, GraduationCap } from 'lucide-react'

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
  monthly_auto_assign?: boolean
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
  monthlyConfigs: Record<string, MonthlyAssignConfig>
}

/** 월별 자동부여 설정 영역 키 (생활일본어 5영역) */
const CONFIG_AREAS = ['vocabulary', 'grammar', 'reading', 'listening'] as const

export default function AdminTasksClient({ mentees, allMentees, assignmentsByMentee, learningProgress, monthlyConfigs, currentRole }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useLoadingTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [messageType, setMessageType] = useState<'success' | 'error'>('success')

  // 課題(JLPT項目) / 理解テスト 배분 모달 (대시보드와 동일한 ItemAssignModal)
  const [jlptOpen, setJlptOpen] = useState(false)
  const [mockOpen, setMockOpen] = useState(false)

  // 월별 자동부여 개수 설정
  const [configs, setConfigs] = useState<Record<string, MonthlyAssignConfig>>(monthlyConfigs)
  const [cfgLevel, setCfgLevel] = useState<string>('N1')
  const [assignYear, setAssignYear] = useState<string>(String(new Date().getFullYear()))
  const cfg = configs[cfgLevel] ?? { vocabulary: 0, grammar: 0, reading: 0, listening: 0 }
  const [autoSet, setAutoSet] = useState<Set<string>>(() => new Set(allMentees.filter(m => m.monthly_auto_assign !== false).map(m => m.id)))
  function toggleAutoAssign(id: string, enabled: boolean) {
    setAutoSet(prev => { const n = new Set(prev); if (enabled) n.add(id); else n.delete(id); return n })
    startTransition(async () => { await setMenteeAutoAssign(id, enabled) })
  }

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

  // 첫 진입 시 첫 멘티 자동 선택 → 상세(월별 과제)가 바로 표시됨
  useEffect(() => {
    if (!selectedMentee && mentees.length > 0) setSelectedMentee(mentees[0].id)
  }, [selectedMentee, mentees])

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
      const res = await updateMonthlyAssignmentConfig(cfgLevel, configs[cfgLevel])
      if (res.error) showMsg(res.error, 'error')
      else showMsg(`${cfgLevel} の月別自動付与の個数を保存しました`)
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

  function handleDeleteMonth(items: LearningAssignmentRow[], label: string) {
    if (!items.length) return
    if (!confirm(`${label}の課題 ${items.length}件をすべて削除しますか？`)) return
    startTransition(async () => {
      let ok = 0
      for (const a of items) {
        const result = await deleteLearningAssignment(a.id)
        if (result.error) { showMsg(`${result.error}（${ok}件削除済み）`, 'error'); return }
        ok++
      }
      showMsg(`${ok}件を削除しました`)
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
    // 카운트형(항목): 그 회차에서 완료한 수 / 부여한 갯수(target_count)
    if (la.target_count != null) {
      const tc = la.target_count
      const prevCum = (la.cumulative_target ?? tc) - tc
      const done = Math.max(0, Math.min((la.mastered_snapshot ?? 0) - prevCum, tc))
      return `習得 ${done}/${tc}`
    }
    // 레거시: 학습 진척 + 테스트 진척
    const lp = learningProgress[la.id]
    const total = la.required_quiz_ids?.length ?? 0
    const passed = la.passed_quiz_ids?.length ?? 0
    const parts: string[] = []
    if (lp && lp.total > 0) parts.push(`学習 ${lp.mastered}/${lp.total}`)
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
    // 년도 필터 + 월별 그룹 (멘티 레포트와 동일 형식)
    const now = new Date()
    const yearOf = (a: LearningAssignmentRow) => (a.due_date ?? a.created_at ?? '').slice(0, 4)
    const years = [...new Set([String(now.getFullYear()), ...list.map(yearOf).filter(Boolean)])].sort((a, b) => b.localeCompare(a))
    const year = years.includes(assignYear) ? assignYear : (years[0] ?? String(now.getFullYear()))
    const filtered = list.filter(a => yearOf(a) === year)
    const byMonth = new Map<string, LearningAssignmentRow[]>()
    for (const a of filtered) {
      const m = (a.due_date ?? a.created_at ?? '').slice(0, 7) || '0000-00'
      if (!byMonth.has(m)) byMonth.set(m, [])
      byMonth.get(m)!.push(a)
    }
    const months = [...byMonth.keys()].sort((a, b) => b.localeCompare(a))

    return (
      <div>
        <div className="flex items-center justify-end border-b border-gray-100 px-4 py-2 dark:border-gray-700">
          <select value={year} onChange={e => setAssignYear(e.target.value)}
            className="rounded-lg border border-gray-300 bg-white px-2 py-1 text-xs font-medium text-gray-700 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
            {years.map(y => <option key={y} value={y}>{y}年</option>)}
          </select>
        </div>
        <div className="h-[600px] overflow-y-auto">
          {filtered.length === 0 ? (
            <div className="px-4 py-12 text-center text-sm text-gray-400">{year}年の課題がありません</div>
          ) : months.map(m => {
            const mm = m.split('-')[1]
            const label = mm ? `${parseInt(mm, 10)}月` : '期限なし'
            const isOpen = openDates[m] ?? false
            return (
              <div key={m}>
                <div className="flex items-center bg-gray-50 hover:bg-gray-100 dark:bg-gray-900/30 dark:hover:bg-gray-900/50">
                  <button
                    type="button"
                    onClick={() => setOpenDates(prev => ({ ...prev, [m]: !isOpen }))}
                    className="flex flex-1 items-center gap-1.5 px-4 py-2 text-left text-xs font-semibold text-gray-600 dark:text-gray-300"
                  >
                    {isOpen ? <ChevronDown className="h-3.5 w-3.5 shrink-0" /> : <ChevronRight className="h-3.5 w-3.5 shrink-0" />}
                    {label} <span className="font-normal text-gray-400">· {byMonth.get(m)!.length}件</span>
                  </button>
                  <button
                    type="button"
                    onClick={() => handleDeleteMonth(byMonth.get(m)!, label)}
                    disabled={pending}
                    className="mr-3 shrink-0 text-xs font-medium text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                  >全削除</button>
                </div>
                {isOpen && (
                  <ul className="divide-y divide-gray-100 dark:divide-gray-700">
                    {byMonth.get(m)!.map(renderAssignmentRow)}
                  </ul>
                )}
              </div>
            )
          })}
        </div>
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
          onClick={() => setMockOpen(true)}
          disabled={allMentees.length === 0}
          className="inline-flex items-center gap-1.5 rounded-lg bg-emerald-600 px-4 py-2 text-sm font-medium text-white hover:bg-emerald-500 disabled:cursor-not-allowed disabled:opacity-50"
        >
          <GraduationCap className="h-4 w-4" /> JLPT模試
        </button>
      </div>

      <ItemAssignModal
        open={jlptOpen}
        onClose={() => setJlptOpen(false)}
        mentees={modalMentees}
        autoAssignIds={[...autoSet]}
      />
      <MockExamAssignModal
        open={mockOpen}
        onClose={() => setMockOpen(false)}
        mentees={modalMentees}
      />

      {/* 월별 자동부여 개수 설정 (생활일본어) */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-800">
        <div className="flex items-center justify-between gap-2">
          <h3 className="text-sm font-semibold text-gray-900 dark:text-white">月別自動付与の個数（JLPT）</h3>
          <div className="flex items-center gap-3">
            <span className="flex items-center gap-1.5 text-xs font-bold text-indigo-600 dark:text-indigo-400">
              <span className={`rounded px-1.5 py-0.5 text-[10px] font-bold ${isJlpt(cfgLevel) ? getJlptLevelColor(cfgLevel) : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300'}`}>{cfgLevel}</span>
              合計 {cfg.vocabulary + cfg.grammar + cfg.reading + cfg.listening} 項目/月
            </span>
            <button
              type="button"
              onClick={handleSaveConfig}
              disabled={pending}
              className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
            >保存</button>
          </div>
        </div>
        <div className="mt-2 flex flex-wrap gap-1">
          {MONTHLY_CONFIG_LEVELS.map(lv => (
            <button key={lv} type="button" onClick={() => setCfgLevel(lv)}
              className={`rounded-lg px-3 py-1 text-xs font-medium transition-colors ${cfgLevel === lv ? 'bg-indigo-600 text-white' : 'bg-zinc-100 text-zinc-600 hover:bg-zinc-200 dark:bg-zinc-800 dark:text-zinc-300'}`}>
              {lv}
            </button>
          ))}
        </div>
        <p className="mt-1 text-xs text-gray-400">毎月1日、{cfgLevel} 目標のメンティーへ自動付与される領域別の項目数。</p>
        <div className="mt-3 grid grid-cols-2 gap-3 sm:grid-cols-5">
          {CONFIG_AREAS.map(a => (
            <div key={a}>
              <label className="block text-xs font-medium text-gray-600 dark:text-gray-300">{areaLabel('seikatsu', a)}</label>
              <input
                type="number"
                min={0}
                value={cfg[a]}
                onChange={e => { const v = Math.max(0, parseInt(e.target.value || '0', 10) || 0); setConfigs(prev => ({ ...prev, [cfgLevel]: { ...(prev[cfgLevel] ?? cfg), [a]: v } })) }}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-2 py-1.5 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
              />
            </div>
          ))}
        </div>
        <div className="mt-4 border-t border-gray-200 pt-3 dark:border-gray-700">
          <p className="mb-2 text-xs font-medium text-gray-600 dark:text-gray-300">月別自動付与の対象（チェック＝毎月自動付与 / 解除＝課題ボタンで個別付与）</p>
          {(() => {
            const byMentor = new Map<string, typeof allMentees>()
            for (const m of allMentees) {
              const k = m.japanese_mentor_name ?? '未割当'
              if (!byMentor.has(k)) byMentor.set(k, [])
              byMentor.get(k)!.push(m)
            }
            const groups = [...byMentor.keys()].sort((a, b) => a === '未割当' ? 1 : b === '未割当' ? -1 : a.localeCompare(b, 'ja'))
            return (
              <div className="space-y-3">
                {groups.map(mentor => (
                  <div key={mentor}>
                    <p className="mb-1 text-xs font-semibold text-indigo-600 dark:text-indigo-400">{mentor === '未割当' ? 'メンター未割当' : `担当メンター: ${mentor}`}</p>
                    <div className="grid grid-cols-2 gap-x-3 gap-y-1 sm:grid-cols-3 lg:grid-cols-4">
                      {byMentor.get(mentor)!.map(m => {
                        // 관리자 화면에서 멘토 담당 멘티는 멘토가 관리 → 체크 불가(이름만 표시)
                        const adminReadonly = currentRole === 'admin' && mentor !== '未割当'
                        const cert = m.target_certification
                        const certBadge = cert ? (
                          <span className={`shrink-0 rounded px-1 py-0.5 text-[9px] font-bold ${isJlpt(cert) ? getJlptLevelColor(cert) : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300'}`}>{cert}</span>
                        ) : (
                          <span className="shrink-0 rounded px-1 py-0.5 text-[9px] font-medium bg-gray-100 text-gray-400 dark:bg-gray-700 dark:text-gray-500">未設定</span>
                        )
                        const name = m.full_name ?? m.email
                        return adminReadonly ? (
                          <div key={m.id} className="flex items-center gap-1.5 rounded px-2 py-1 text-sm text-gray-500 dark:text-gray-400" title="担当メンターが管理">
                            <span className={`h-2 w-2 shrink-0 rounded-full ${autoSet.has(m.id) ? 'bg-emerald-500' : 'bg-gray-300 dark:bg-gray-600'}`} />
                            {certBadge}
                            <span className="min-w-0 truncate">{name}</span>
                          </div>
                        ) : (
                          <label key={m.id} className="flex items-center gap-1.5 rounded px-2 py-1 text-sm text-gray-700 hover:bg-gray-50 dark:text-gray-200 dark:hover:bg-gray-700/50">
                            <input type="checkbox" checked={autoSet.has(m.id)} onChange={e => toggleAutoAssign(m.id, e.target.checked)} className="h-4 w-4 shrink-0 rounded border-gray-300 text-emerald-600 focus:ring-emerald-500" />
                            {certBadge}
                            <span className="min-w-0 truncate">{name}</span>
                          </label>
                        )
                      })}
                    </div>
                  </div>
                ))}
              </div>
            )
          })()}
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
                  {m.target_certification && (
                    <span className={`shrink-0 rounded px-1.5 py-0.5 text-[10px] font-bold ${isJlpt(m.target_certification) ? getJlptLevelColor(m.target_certification) : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300'}`}>{m.target_certification}</span>
                  )}
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
        <div className="min-w-0 flex-1 max-h-[calc(100vh-10rem)] overflow-y-auto rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
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
