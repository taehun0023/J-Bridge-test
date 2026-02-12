'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'

const CATEGORY_LABELS: Record<string, string> = {
  seikatsu: '生活日本語',
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
  retake_request_status: string | null
  quizzes: { title: string; quiz_type: string } | null
}

interface CodingExamAttempt {
  id: string
  score: number
  passed: boolean
  started_at: string
  completed_at: string
  coding_skill_exams: { title: string; target_rank: string } | null
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

type Tab = 'quiz' | 'coding' | 'comprehensive'

export default function HistoryClient({
  quizAttempts,
  codingExamAttempts,
  comprehensiveExams,
}: {
  quizAttempts: QuizAttempt[]
  codingExamAttempts: CodingExamAttempt[]
  comprehensiveExams: ComprehensiveExam[]
}) {
  const [activeTab, setActiveTab] = useState<Tab>('quiz')

  const tabs: { key: Tab; label: string; count: number }[] = [
    { key: 'quiz', label: 'クイズ結果', count: quizAttempts.length },
    { key: 'coding', label: '等級テスト', count: codingExamAttempts.length },
    { key: 'comprehensive', label: '総合試験', count: comprehensiveExams.length },
  ]

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

      {/* Quiz results */}
      {activeTab === 'quiz' && (
        <Card>
          {quizAttempts.length === 0 ? (
            <p className="py-8 text-center text-sm text-zinc-500">クイズの受験履歴がありません</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-white/[0.06]">
                    <th className="py-3 pr-4 text-left font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">結果</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">再試験</th>
                    <th className="py-3 pl-4 text-right font-medium text-zinc-500 dark:text-zinc-400">日時</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                  {quizAttempts.map((q) => (
                    <tr key={q.id}>
                      <td className="py-3 pr-4 text-zinc-900 dark:text-zinc-100">
                        {(q.quizzes as { title: string } | null)?.title ?? 'クイズ'}
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
                      <td className="py-3 px-4 text-center text-xs">
                        {q.retake_request_status === 'requested' && <span className="text-amber-400">リクエスト中</span>}
                        {q.retake_request_status === 'approved' && <span className="text-emerald-400">承認済</span>}
                        {q.retake_request_status === 'denied' && <span className="text-red-400">拒否</span>}
                        {!q.retake_request_status && <span className="text-zinc-400">—</span>}
                      </td>
                      <td className="py-3 pl-4 text-right text-zinc-500 dark:text-zinc-400">
                        {new Date(q.completed_at).toLocaleDateString('ja-JP')}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </Card>
      )}

      {/* Coding exam results */}
      {activeTab === 'coding' && (
        <Card>
          {codingExamAttempts.length === 0 ? (
            <p className="py-8 text-center text-sm text-zinc-500">等級テストの受験履歴がありません</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-white/[0.06]">
                    <th className="py-3 pr-4 text-left font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">目標ランク</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">結果</th>
                    <th className="py-3 pl-4 text-right font-medium text-zinc-500 dark:text-zinc-400">日時</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                  {codingExamAttempts.map((ca) => (
                    <tr key={ca.id}>
                      <td className="py-3 pr-4 text-zinc-900 dark:text-zinc-100">
                        {(ca.coding_skill_exams as { title: string } | null)?.title ?? '等級テスト'}
                      </td>
                      <td className="py-3 px-4 text-center">
                        <span className="inline-flex rounded-full bg-indigo-500/10 px-2 py-0.5 text-xs font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                          {(ca.coding_skill_exams as { target_rank: string } | null)?.target_rank ?? '—'}
                        </span>
                      </td>
                      <td className="py-3 px-4 text-center font-mono font-bold text-zinc-900 dark:text-zinc-100">{ca.score}点</td>
                      <td className="py-3 px-4 text-center">
                        <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                          ca.passed
                            ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
                        }`}>
                          {ca.passed ? '合格' : '不合格'}
                        </span>
                      </td>
                      <td className="py-3 pl-4 text-right text-zinc-500 dark:text-zinc-400">
                        {new Date(ca.completed_at).toLocaleDateString('ja-JP')}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </Card>
      )}

      {/* Comprehensive exam results */}
      {activeTab === 'comprehensive' && (
        <Card>
          {comprehensiveExams.length === 0 ? (
            <p className="py-8 text-center text-sm text-zinc-500">総合試験の履歴がありません</p>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-gray-200 dark:border-white/[0.06]">
                    <th className="py-3 pr-4 text-left font-medium text-zinc-500 dark:text-zinc-400">カテゴリ</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">ステータス</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
                    <th className="py-3 px-4 text-center font-medium text-zinc-500 dark:text-zinc-400">結果</th>
                    <th className="py-3 pl-4 text-right font-medium text-zinc-500 dark:text-zinc-400">日時</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                  {comprehensiveExams.map((ce) => {
                    const statusInfo = EXAM_STATUS_LABELS[ce.status] ?? { label: ce.status, color: 'text-zinc-400' }
                    return (
                      <tr key={ce.id}>
                        <td className="py-3 pr-4 text-zinc-900 dark:text-zinc-100">
                          <div>{CATEGORY_LABELS[ce.category] ?? ce.category}</div>
                          <div className="text-xs text-zinc-500 dark:text-zinc-400">{ce.subcategory}{ce.content_level ? ` (${ce.content_level})` : ''}</div>
                        </td>
                        <td className="py-3 px-4 text-center">
                          <span className={`text-xs font-medium ${statusInfo.color}`}>{statusInfo.label}</span>
                        </td>
                        <td className="py-3 px-4 text-center font-mono font-bold text-zinc-900 dark:text-zinc-100">
                          {ce.score !== null ? `${ce.score}/${ce.total_questions}` : '—'}
                        </td>
                        <td className="py-3 px-4 text-center">
                          {ce.passed !== null ? (
                            <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${
                              ce.passed
                                ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                                : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
                            }`}>
                              {ce.passed ? '合格' : '不合格'}
                            </span>
                          ) : (
                            <span className="text-xs text-zinc-400">—</span>
                          )}
                        </td>
                        <td className="py-3 pl-4 text-right text-zinc-500 dark:text-zinc-400">
                          {ce.completed_at
                            ? new Date(ce.completed_at).toLocaleDateString('ja-JP')
                            : new Date(ce.requested_at).toLocaleDateString('ja-JP')}
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
    </div>
  )
}
