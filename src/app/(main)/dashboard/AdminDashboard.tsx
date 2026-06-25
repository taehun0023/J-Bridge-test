'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'
import Link from 'next/link'
import type { JapaneseProgressStat } from '@/lib/japanese-progress'
import ItemAssignModal from './ItemAssignModal'
import MockExamAssignModal from '../admin/tasks/MockExamAssignModal'
import { GraduationCap, Languages } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'
import { getJlptLevel, getJlptLevelColor, type JlptLevel } from '@/lib/assessment-config'

const JLPT_LEVELS = ['N1', 'N2', 'N3', 'N4', 'N5']
function LevelBadge({ level }: { level: string | null }) {
  if (!level) return <span className="text-zinc-400">—</span>
  const cls = JLPT_LEVELS.includes(level)
    ? getJlptLevelColor(level as JlptLevel)
    : 'bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-300'
  return <span className={`inline-flex items-center rounded-md px-2 py-0.5 text-xs font-semibold ${cls}`}>{level}</span>
}

interface ExamScore {
  score: number | null
  passing_score: number
  /** JLPT模試: 합산 판정값(있으면 점수>=커트 재계산 대신 이 값으로 합/불 표시) */
  passed?: boolean | null
  /** JLPT模試: 응시 레벨(content_level). 試験レベル 컬럼에 사용 */
  level?: string | null
}

interface EmployeeRow {
  id: string
  full_name: string | null
  email: string
  japanese_mentor_name: string | null
  tech_mentor_name: string | null
  target_certification: string | null
  monthly_auto_assign?: boolean | null
  stat: JapaneseProgressStat
  exam_seikatsu: ExamScore | null
  exam_business_jp: ExamScore | null
}

interface Props {
  adminName: string | null
  employees: EmployeeRow[]
  unreadAnnouncements?: number
  /** 'admin' = 全社員 / 'mentor' = 担当メンティーのみ。レイアウト・機能は同一、ラベルのみ切替。 */
  variant?: 'admin' | 'mentor'
}

function ExamCell({ exam }: { exam: ExamScore | null }) {
  if (!exam || exam.score === null) {
    return <span className="text-zinc-400">—</span>
  }
  const passed = exam.passed ?? (exam.score >= exam.passing_score)
  return (
    <span className={passed ? 'font-medium text-emerald-500' : 'font-medium text-red-500'}>
      {exam.score}/{exam.passing_score}
    </span>
  )
}

/** JLPT模試 満点(合算) */
const MOCK_MAX = 180

/**
 * 試験判定: 미달 / 합격권 / 안정권
 *  - 不合格(passed=false) → 未達
 *  - 合格だが커트라인 부근 → 合格圏(턱걸이)
 *  - 커트라인 + (満点-커트라인)×0.5 이상 → 安定圏(여유 합격)
 */
function JudgmentCell({ exam }: { exam: ExamScore | null }) {
  if (!exam || exam.score === null) {
    return <span className="text-zinc-400">—</span>
  }
  const cutoff = exam.passing_score
  const passed = exam.passed ?? (exam.score >= cutoff)
  if (!passed) {
    return <span className="inline-flex rounded-md bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-700 dark:bg-red-900/30 dark:text-red-400">未達</span>
  }
  const safe = exam.score >= cutoff + (MOCK_MAX - cutoff) * 0.5
  return safe
    ? <span className="inline-flex rounded-md bg-emerald-100 px-2 py-0.5 text-xs font-semibold text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400">安定圏</span>
    : <span className="inline-flex rounded-md bg-amber-100 px-2 py-0.5 text-xs font-semibold text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">合格圏</span>
}

function fmtPair(c: { completed: number; total: number }): string {
  return `${c.completed}/${c.total}`
}

function fmtPct(c: { completed: number; total: number }): string {
  return c.total > 0 ? `${Math.round((c.completed / c.total) * 100)}%` : '—'
}

export default function AdminDashboard({ adminName, employees, variant = 'admin' }: Props) {
  const isMentor = variant === 'mentor'
  const [search, setSearch] = useState('')
  const [assignOpen, setAssignOpen] = useState(false)
  const [jlptOpen, setJlptOpen] = useState(false)
  const [jlptTargetIds, setJlptTargetIds] = useState<string[]>([])

  function openAssignForAll() {
    setAssignOpen(true)
  }
  function openJlptForAll() {
    setJlptTargetIds([])
    setJlptOpen(true)
  }

  const filtered = employees.filter(e =>
    (e.full_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    e.email.toLowerCase().includes(search.toLowerCase()) ||
    (e.japanese_mentor_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    (e.tech_mentor_name ?? '').toLowerCase().includes(search.toLowerCase())
  )

  // 정렬: 遅延 많은 순 → (동률 시) 今月課題 적은 순
  const sorted = [...filtered].sort((a, b) => {
    if (b.stat.overdue !== a.stat.overdue) return b.stat.overdue - a.stat.overdue
    return a.stat.seikatsu.total - b.stat.seikatsu.total
  })

  return (
    <div>
      {!isMentor && (
        <div className="mb-6 flex items-center gap-3">
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ダッシュボード</h1>
          <span className="rounded-full bg-red-500/10 px-3 py-1 text-xs font-bold text-red-500 ring-1 ring-red-500/20">
            管理者
          </span>
        </div>
      )}

      <MockExamAssignModal
        open={assignOpen}
        onClose={() => setAssignOpen(false)}
        mentees={employees.map(e => ({ id: e.id, full_name: e.full_name, email: e.email }))}
      />

      <ItemAssignModal
        open={jlptOpen}
        onClose={() => setJlptOpen(false)}
        mentees={employees.map(e => ({ id: e.id, full_name: e.full_name, email: e.email, target: e.target_certification }))}
        initialMenteeIds={jlptTargetIds}
        autoAssignIds={employees.filter(e => e.monthly_auto_assign !== false).map(e => e.id)}
      />

      <Card
        title={isMentor ? '担当メンティーの日本語進捗' : '全社員の日本語進捗'}
        headerAction={
          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={openJlptForAll}
              disabled={employees.length === 0}
              className="inline-flex items-center gap-1.5 rounded-xl bg-violet-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-violet-500 disabled:cursor-not-allowed disabled:opacity-50 transition-colors"
            >
              <Languages className="h-3.5 w-3.5" />
              課題
            </button>
            <button
              type="button"
              onClick={openAssignForAll}
              disabled={employees.length === 0}
              className="inline-flex items-center gap-1.5 rounded-xl bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:cursor-not-allowed disabled:opacity-50 transition-colors"
            >
              <GraduationCap className="h-3.5 w-3.5" />
              JLPT模試
            </button>
          </div>
        }
      >
        <div className="mb-4">
          <input
            type="text"
            placeholder="名前・メール・メンターで検索..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className="w-full max-w-xs rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
          />
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
            <thead>
              <tr>
                <th className="px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">日本語メンター</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">技術メンター</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">試験レベル</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">試験</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">判定</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">今月課題</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">完了</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">遅延</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">全体進捗</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">%</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
              {sorted.map(e => (
                <tr key={e.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02]">
                  <td className="whitespace-nowrap px-4 py-3 text-left">
                    <Link
                      href={`/admin/reports?mentee=${e.id}`}
                      className="text-sm font-medium text-zinc-900 hover:text-indigo-500 dark:text-zinc-100"
                    >
                      <NameRuby name={e.full_name} fallback={e.email} />
                    </Link>
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">
                    {e.japanese_mentor_name ? <NameRuby name={e.japanese_mentor_name} /> : '—'}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">
                    {e.tech_mentor_name ? <NameRuby name={e.tech_mentor_name} /> : '—'}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm dark:border-white/[0.06]">
                    <LevelBadge level={e.exam_seikatsu?.level ?? (e.exam_seikatsu && e.exam_seikatsu.score != null ? getJlptLevel(e.exam_seikatsu.score) : null)} />
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-3 py-3 text-center text-sm dark:border-white/[0.06]">
                    <ExamCell exam={e.exam_seikatsu} />
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-3 py-3 text-center text-sm dark:border-white/[0.06]">
                    <JudgmentCell exam={e.exam_seikatsu} />
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-3 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                    {fmtPair(e.stat.seikatsu)}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                    {e.stat.seikatsuCumulative.completed}/{e.stat.seikatsuCumulative.total}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm dark:border-white/[0.06]">
                    <span className={e.stat.overdue > 0 ? 'font-semibold text-red-500' : 'text-zinc-500 dark:text-zinc-400'}>
                      {e.stat.overdue}
                    </span>
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                    {fmtPair(e.stat.all)}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm font-semibold text-zinc-800 dark:border-white/[0.06] dark:text-zinc-200">
                    {fmtPct(e.stat.all)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {sorted.length === 0 && (
          <div className="py-8 text-center text-sm text-zinc-500">
            {search ? '該当する社員がいません' : 'メンティーがいません'}
          </div>
        )}
      </Card>
    </div>
  )
}
