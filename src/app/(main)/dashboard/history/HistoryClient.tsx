'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'
import Link from 'next/link'
import { Eye } from 'lucide-react'

const SEVEN_DAYS_MS = 7 * 24 * 60 * 60 * 1000

const CATEGORY_LABELS: Record<string, string> = {
  seikatsu: 'JLPT',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  'business-lit': 'ビジネスリテラシー',
}

const EXAM_STATUS_LABELS: Record<string, { label: string; color: string }> = {
  requested: { label: '申請中', color: 'text-amber-400' },
  approved: { label: '承認済', color: 'text-blue-400' },
  denied: { label: '拒否', color: 'text-red-400' },
  in_progress: { label: '受験中', color: 'text-indigo-400' },
  completed: { label: '完了', color: 'text-emerald-400' },
  failed: { label: '不合格', color: 'text-red-400' },
}

interface QuizAttempt {
  id: string
  score: number
  passed: boolean
  completed_at: string
  quizzes: { title: string; quiz_type: string; is_assessment: boolean } | null
}

interface ComprehensiveExam {
  id: string
  category: string
  subcategory: string
  content_level: string | null
  status: string
  score: number | null
  passed: boolean | null
  passing_score: number
  total_questions: number
  requested_at: string
  completed_at: string | null
}

interface UnifiedExamEntry {
  id: string
  title: string
  type: 'quiz' | 'comprehensive'
  status: string
  statusColor: string
  score: string
  passed: boolean | null
  isReviewable: boolean
  date: string
}

type Tab = 'mock' | 'comprehensive'

export default function HistoryClient({
  quizAttempts,
  comprehensiveExams,
}: {
  quizAttempts: QuizAttempt[]
  comprehensiveExams: ComprehensiveExam[]
}) {
  const [activeTab, setActiveTab] = useState<Tab>('mock')

  const mockExamAttempts = quizAttempts.filter(q => !q.quizzes?.is_assessment)
  const assessmentAttempts = quizAttempts.filter(q => q.quizzes?.is_assessment)

  const tabs: { key: Tab; label: string; count: number }[] = [
    { key: 'mock', label: 'テスト結果', count: mockExamAttempts.length },
    { key: 'comprehensive', label: '総合試験', count: assessmentAttempts.length + comprehensiveExams.length },
  ]

  // Build unified comprehensive entries
  const unifiedEntries: UnifiedExamEntry[] = [
    ...assessmentAttempts.map(q => ({
      id: q.id,
      title: (q.quizzes as { title: string } | null)?.title ?? '総合試験',
      type: 'quiz' as const,
      status: '完了',
      statusColor: 'text-emerald-400',
      score: `${q.score}点`,
      passed: q.passed,
      isReviewable: Date.now() - new Date(q.completed_at).getTime() < SEVEN_DAYS_MS,
      date: q.completed_at,
    })),
    ...comprehensiveExams.map(ce => {
      const statusInfo = EXAM_STATUS_LABELS[ce.status] ?? { label: ce.status, color: 'text-zinc-400' }
      const isFinished = ce.status === 'completed' || ce.status === 'failed'
      return {
        id: ce.id,
        title: CATEGORY_LABELS[ce.category] ?? ce.category,
        type: 'comprehensive' as const,
        status: statusInfo.label,
        statusColor: statusInfo.color,
        score: ce.score !== null ? `${ce.score}/${ce.total_questions}` : '—',
        passed: ce.passed,
        isReviewable: isFinished && !!ce.completed_at && Date.now() - new Date(ce.completed_at).getTime() < SEVEN_DAYS_MS,
        date: ce.completed_at ?? ce.requested_at,
      }
    }),
  ].sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime())

  return (
    <div>
      {/* Tab bar */}
      <div className="mb-4 flex gap-1 rounded-xl bg-gray-100 dark:bg-white/5 p-1">
        {tabs.map((tab) => (
          <button
            key={tab.key}
            onClick={() => setActiveTab(tab.key)}
            className={`flex-1 rounded-lg px-4 py-2 text-sm font-medium transition-colors ${
              activeTab === tab.key
                ? 'bg-white dark:bg-white/10 text-zinc-900 dark:text-white shadow-sm'
                : 'text-zinc-500 dark:text-zinc-400 hover:text-zinc-700 dark:hover:text-zinc-300'
            }`}
          >
            {tab.label} ({tab.count})
          </button>
        ))}
      </div>

      {/* 7日間レビュー期限の案内 */}
      <div className="mb-4 flex items-start gap-2 rounded-xl bg-indigo-500/5 px-4 py-3 text-sm text-indigo-400 ring-1 ring-indigo-500/10">
        <Eye className="mt-0.5 h-4 w-4 shrink-0" />
        <p>
          試験完了後<span className="font-semibold">7日間</span>のみ、解答内容の振り返り（レビュー）が可能です。
          期間内は<Eye className="inline h-3.5 w-3.5 mx-0.5" />アイコンが表示されます。
        </p>
      </div>

      {/* Mock exam results (is_assessment=false) */}
      {activeTab === 'mock' && (
        <Card>
          {mockExamAttempts.length === 0 ? (
            <p className="py-8 text-center text-sm text-zinc-500">テストの受験履歴がありません</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-white/[0.06]">
                    <th className="py-3 pr-4 text-left font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">結果</th>
                    <th className="py-3 pl-4 text-right font-medium text-zinc-500 dark:text-zinc-400">日時</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                  {mockExamAttempts.map((q) => {
                    const isReviewable = Date.now() - new Date(q.completed_at).getTime() < SEVEN_DAYS_MS
                    return (
                      <tr key={q.id}>
                        <td className="py-3 pr-4 text-zinc-900 dark:text-zinc-100">
                          <div className="flex items-center gap-2">
                            {isReviewable ? (
                              <Link href={`/dashboard/history/${q.id}?type=quiz`} className="hover:text-indigo-400 transition-colors flex items-center gap-1.5">
                                {(q.quizzes as { title: string } | null)?.title ?? 'クイズ'}
                                <Eye className="h-3.5 w-3.5 text-indigo-400" />
                              </Link>
                            ) : (
                              <span>{(q.quizzes as { title: string } | null)?.title ?? 'クイズ'}</span>
                            )}
                          </div>
                        </td>
                        <td className="py-3 px-4 text-center font-mono font-bold text-zinc-900 dark:text-zinc-100">{q.score}点</td>
                        <td className="py-3 px-4 text-center">
                          <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                            q.passed
                              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
                          }`}>
                            {q.passed ? '合格' : '不合格'}
                          </span>
                        </td>
                        <td className="py-3 pl-4 text-right text-zinc-500 dark:text-zinc-400">
                          {new Date(q.completed_at).toLocaleDateString('ja-JP')}
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          )}
        </Card>
      )}

      {/* Unified comprehensive exam results (assessment quiz_attempts + comprehensive_exams) */}
      {activeTab === 'comprehensive' && (
        <Card>
          {unifiedEntries.length === 0 ? (
            <p className="py-8 text-center text-sm text-zinc-500">総合試験の履歴がありません</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-white/[0.06]">
                    <th className="py-3 pr-4 text-left font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">ステータス</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">結果</th>
                    <th className="py-3 pl-4 text-right font-medium text-zinc-500 dark:text-zinc-400">日時</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                  {unifiedEntries.map((entry) => (
                    <tr key={entry.id}>
                      <td className="py-3 pr-4 text-zinc-900 dark:text-zinc-100">
                        <div className="flex items-center gap-2">
                          {entry.isReviewable ? (
                            <Link href={`/dashboard/history/${entry.id}?type=${entry.type}`} className="hover:text-indigo-400 transition-colors flex items-center gap-1.5">
                              {entry.title}
                              <Eye className="h-3.5 w-3.5 text-indigo-400" />
                            </Link>
                          ) : (
                            <span>{entry.title}</span>
                          )}
                        </div>
                      </td>
                      <td className="py-3 px-4 text-center">
                        <span className={`text-xs font-medium ${entry.statusColor}`}>{entry.status}</span>
                      </td>
                      <td className="py-3 px-4 text-center font-mono font-bold text-zinc-900 dark:text-zinc-100">
                        {entry.score}
                      </td>
                      <td className="py-3 px-4 text-center">
                        {entry.passed !== null ? (
                          <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                            entry.passed
                              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
                          }`}>
                            {entry.passed ? '合格' : '不合格'}
                          </span>
                        ) : (
                          <span className="text-xs text-zinc-400">—</span>
                        )}
                      </td>
                      <td className="py-3 pl-4 text-right text-zinc-500 dark:text-zinc-400">
                        {new Date(entry.date).toLocaleDateString('ja-JP')}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </Card>
      )}
    </div>
  )
}
