'use client'

import { useEffect, useRef, useState, useTransition } from 'react'
import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import TabBar from '@/components/ui/TabBar'
import { getWeaknessReport, getMenteeAssignments, getAssignmentDetail, generateAIPrompt } from '@/app/actions/admin/weakness-report'
import type { ExamScorePoint, ExamErrorRate, MenteeAssignment, AssignmentDetailData } from '@/app/actions/admin/weakness-report'

const EXAM_CATEGORY_GROUPS = {
  nihongo: ['seikatsu', 'business-jp'],
  kaihatsu: ['cs', 'dev'],
  'business-lit': ['business-lit'],
} as const
type TabKey = keyof typeof EXAM_CATEGORY_GROUPS
import { getCategoryLabel, getSubcategoryLabel, getContentLevelLabel } from '@/lib/assignment-categories'
import { QUIZ_CATEGORIES } from '@/lib/item-assignments'
import { ClipboardCopy, Check, Sparkles, X } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'
import NameSelect from '@/components/ui/NameSelect'

const ScoreBarChart = dynamic(() => import('@/components/charts/ScoreBarChart'), { ssr: false })
const ErrorRateTrendChart = dynamic(() => import('@/components/charts/ErrorRateTrendChart'), { ssr: false })

interface User {
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
}

const statusLabels: Record<string, string> = {
  pending: '待機',
  in_progress: '進行中',
  completed: '完了',
  awaiting_confirmation: '確認待ち',
  overdue: '期限超過',
}

export default function AdminReportsClient({
  users,
  userRole,
  initialUserId,
}: {
  users: User[]
  userRole: string
  initialUserId?: string
}) {
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [examScores, setExamScores] = useState<ExamScorePoint[]>([])
  const [examErrorRates, setExamErrorRates] = useState<ExamErrorRate[]>([])
  const [assignments, setAssignments] = useState<MenteeAssignment[]>([])
  const [scoreTab, setScoreTab] = useState<TabKey>('nihongo')
  const [errorTab, setErrorTab] = useState<TabKey>('nihongo')
  const [nihongoScoreSub, setNihongoScoreSub] = useState<'all' | 'seikatsu' | 'business-jp'>('all')
  const [nihongoErrorSub, setNihongoErrorSub] = useState<'all' | 'seikatsu' | 'business-jp'>('all')
  const [mainTab, setMainTab] = useState<'kadai' | 'test'>('kadai')
  const [pending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)
  const [copied, setCopied] = useState(false)
  const [modalAssignment, setModalAssignment] = useState<MenteeAssignment | null>(null)
  const [detailData, setDetailData] = useState<AssignmentDetailData | null>(null)
  const [detailLoading, setDetailLoading] = useState(false)
  const initialLoaded = useRef(false)

  useEffect(() => {
    if (initialUserId && !initialLoaded.current) {
      initialLoaded.current = true
      const userExists = users.some(u => u.id === initialUserId)
      if (userExists) {
        handleSelect(initialUserId)
      }
    }
    // initialLoaded ref guards single-run; users/handleSelect intentionally not deps
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [initialUserId])

  function handleSelect(userId: string) {
    setSelectedId(userId)
    setError(null)
    startTransition(async () => {
      const [reportResult, assignResult] = await Promise.all([
        getWeaknessReport(userId),
        getMenteeAssignments(userId),
      ])
      if ('error' in reportResult) {
        setError(reportResult.error ?? 'エラーが発生しました')
        setExamScores([])
        setExamErrorRates([])
      } else {
        setExamScores(reportResult.examScores)
        setExamErrorRates(reportResult.examErrorRates)
      }
      if ('error' in assignResult) {
        setAssignments([])
      } else {
        setAssignments(assignResult.assignments)
      }
    })
  }

  function handleCopyPrompt() {
    if (!selectedId) return
    startTransition(async () => {
      const result = await generateAIPrompt(selectedId)
      if ('error' in result) {
        setError(result.error ?? 'エラーが発生しました')
        return
      }
      await navigator.clipboard.writeText(result.prompt)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    })
  }

  function handleCardClick(a: MenteeAssignment) {
    setModalAssignment(a)
    setDetailData(null)
    setDetailLoading(true)
    getAssignmentDetail(a.id).then(result => {
      if ('error' in result) {
        setDetailData(null)
      } else {
        setDetailData({ masteryTrend: result.masteryTrend, quizResults: result.quizResults })
      }
      setDetailLoading(false)
    })
  }

  function getFilterCategories(tab: TabKey, sub: string): string[] {
    if (tab === 'nihongo') {
      if (sub === 'seikatsu') return ['seikatsu']
      if (sub === 'business-jp') return ['business-jp']
      return ['seikatsu', 'business-jp']
    }
    return [...EXAM_CATEGORY_GROUPS[tab]]
  }

  const nihongoSubButtons = [
    { key: 'all' as const, label: '全体' },
    { key: 'seikatsu' as const, label: '生活日本語' },
    { key: 'business-jp' as const, label: 'ビジネス日本語' },
  ]

  const selectedUser = users.find(u => u.id === selectedId)

  // 理解テスト課題(seikatsu-quiz / business-jp-quiz)はテストタブ、項目課題は課題タブへ
  const isTestCategory = (cat: string) => (QUIZ_CATEGORIES as readonly string[]).includes(cat)
  const itemAssignments = assignments.filter(a => !isTestCategory(a.category))
  const testAssignments = assignments.filter(a => isTestCategory(a.category))

  const renderCards = (items: MenteeAssignment[]) => (
    <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
      {items.map(a => {
        const totalQuizzes = a.required_quiz_ids.length
        const passedQuizzes = a.passed_quiz_ids.length
        const isOverdue = a.due_date && new Date(a.due_date) < new Date() && a.status !== 'completed'
        return (
          <button key={a.id} onClick={() => handleCardClick(a)} className="rounded-xl border border-zinc-200 bg-zinc-50 p-4 dark:border-zinc-700 dark:bg-zinc-800/50 text-left transition-colors hover:border-indigo-400 hover:ring-1 hover:ring-indigo-400/30 cursor-pointer w-full">
            <div className="flex items-start justify-between gap-2">
              <h4 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100 line-clamp-1">{a.title}</h4>
              <span className={`shrink-0 inline-flex rounded-full px-2 py-0.5 text-[10px] font-medium ${statusColors[a.status] ?? 'bg-gray-100 text-gray-600'}`}>
                {statusLabels[a.status] ?? a.status}
              </span>
            </div>
            <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">
              {getCategoryLabel(a.category)} &gt; {getSubcategoryLabel(a.category, a.subcategory)}
              {a.content_level && ` (${getContentLevelLabel(a.category, a.content_level)})`}
            </p>

            {/* Mastery progress */}
            {a.mastery.total > 0 && (
              <div className="mt-3">
                <div className="flex items-center justify-between text-xs text-zinc-500 dark:text-zinc-400">
                  <span>学習</span>
                  <span>{a.mastery.pct}%</span>
                </div>
                <div className="mt-1 h-1.5 w-full rounded-full bg-zinc-200 dark:bg-zinc-600">
                  <div className="h-1.5 rounded-full bg-amber-500 transition-all" style={{ width: `${a.mastery.pct}%` }} />
                </div>
              </div>
            )}

            {/* Quiz progress */}
            {totalQuizzes > 0 && (
              <div className="mt-2">
                <div className="flex items-center justify-between text-xs text-zinc-500 dark:text-zinc-400">
                  <span>テスト</span>
                  <span>{passedQuizzes}/{totalQuizzes}</span>
                </div>
                <div className="mt-1 h-1.5 w-full rounded-full bg-zinc-200 dark:bg-zinc-600">
                  <div className="h-1.5 rounded-full bg-indigo-500 transition-all" style={{ width: `${totalQuizzes > 0 ? Math.round((passedQuizzes / totalQuizzes) * 100) : 0}%` }} />
                </div>
              </div>
            )}

            {/* Due date */}
            {a.due_date && (
              <p className={`mt-2 text-xs ${isOverdue ? 'font-medium text-red-500 dark:text-red-400' : 'text-zinc-400 dark:text-zinc-500'}`}>
                期限: {new Date(a.due_date).toLocaleDateString('ja-JP')}
              </p>
            )}
          </button>
        )
      })}
    </div>
  )

  return (
    <div className="mt-6 space-y-6">
      {/* User select dropdown */}
      <NameSelect
        value={selectedId ?? ''}
        onChange={(v) => {
          if (v) handleSelect(v)
          else setSelectedId(null)
        }}
        options={users}
        placeholder={userRole === 'mentor' ? 'メンティーを選択...' : '社員を選択...'}
      />

      {error && (
        <div className="rounded-xl bg-red-500/10 px-4 py-3 text-sm text-red-400 ring-1 ring-red-500/20">
          {error}
        </div>
      )}

      {pending && (
        <Card>
          <div className="py-12 text-center text-sm text-zinc-500">読み込み中...</div>
        </Card>
      )}

      {selectedUser && !pending ? (
        <>
          <TabBar
            tabs={[
              { key: 'kadai', label: '課題' },
              { key: 'test', label: 'テスト' },
            ]}
            activeKey={mainTab}
            onChange={k => setMainTab(k as 'kadai' | 'test')}
          />

          {/* === 課題タブ: 課題カード（学習記録・進捗） + 詳細モーダル === */}
          {mainTab === 'kadai' && (
          <>
          {itemAssignments.length === 0 ? (
            <Card><div className="py-12 text-center text-sm text-zinc-500">課題がありません</div></Card>
          ) : (
            <Card title="学習課題">{renderCards(itemAssignments)}</Card>
          )}
          </>
          )}

          {/* === テストタブ: 理解テスト課題 + スコア推移・誤答率（弱点分析）・AIプロンプト === */}
          {mainTab === 'test' && (
          <>
          {testAssignments.length > 0 && (
            <Card title="理解度テスト課題">{renderCards(testAssignments)}</Card>
          )}
          <Card title={
            <span>
              {selectedUser.full_name
                ? <NameRuby name={selectedUser.full_name} />
                : selectedUser.email}
              {' - スコア推移'}
            </span>
          }>
            <TabBar
              tabs={[
                { key: 'nihongo', label: '日本語' },
                { key: 'kaihatsu', label: '開発' },
                { key: 'business-lit', label: 'ビジネスリテラシー' },
              ]}
              activeKey={scoreTab}
              onChange={k => { setScoreTab(k as TabKey); setNihongoScoreSub('all') }}
            />
            {scoreTab === 'nihongo' && (
              <div className="mt-2 flex gap-1.5">
                {nihongoSubButtons.map(sub => (
                  <button
                    key={sub.key}
                    onClick={() => setNihongoScoreSub(sub.key)}
                    className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${
                      nihongoScoreSub === sub.key
                        ? 'bg-indigo-600 text-white'
                        : 'bg-zinc-100 text-zinc-600 hover:bg-zinc-200 dark:bg-zinc-700 dark:text-zinc-300 dark:hover:bg-zinc-600'
                    }`}
                  >
                    {sub.label}
                  </button>
                ))}
              </div>
            )}
            <div className="mt-4">
              <ScoreBarChart
                data={examScores.filter(s =>
                  getFilterCategories(scoreTab, nihongoScoreSub).includes(s.category)
                )}
              />
            </div>
          </Card>

          <Card title="誤答率推移">
            <TabBar
              tabs={[
                { key: 'nihongo', label: '日本語' },
                { key: 'kaihatsu', label: '開発' },
                { key: 'business-lit', label: 'ビジネスリテラシー' },
              ]}
              activeKey={errorTab}
              onChange={k => { setErrorTab(k as TabKey); setNihongoErrorSub('all') }}
            />
            {errorTab === 'nihongo' && (
              <div className="mt-2 flex gap-1.5">
                {nihongoSubButtons.map(sub => (
                  <button
                    key={sub.key}
                    onClick={() => setNihongoErrorSub(sub.key)}
                    className={`rounded-full px-3 py-1 text-xs font-medium transition-colors ${
                      nihongoErrorSub === sub.key
                        ? 'bg-indigo-600 text-white'
                        : 'bg-zinc-100 text-zinc-600 hover:bg-zinc-200 dark:bg-zinc-700 dark:text-zinc-300 dark:hover:bg-zinc-600'
                    }`}
                  >
                    {sub.label}
                  </button>
                ))}
              </div>
            )}
            <div className="mt-4">
              <ErrorRateTrendChart
                data={examErrorRates.filter(e =>
                  getFilterCategories(errorTab, nihongoErrorSub).includes(e.examCategory)
                )}
                aggregated={errorTab === 'nihongo' && nihongoErrorSub === 'all'}
              />
            </div>
          </Card>

          <div className="flex justify-end">
            <button
              onClick={handleCopyPrompt}
              disabled={pending}
              className="inline-flex items-center gap-2 rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
            >
              <Sparkles className="h-4 w-4" />
              <ClipboardCopy className="h-4 w-4" />
              AIプロンプトをコピー
            </button>
            {copied && (
              <div className="mt-2 rounded-lg border border-indigo-200 bg-indigo-50 px-4 py-3 text-sm text-indigo-700 dark:border-indigo-800 dark:bg-indigo-900/30 dark:text-indigo-300">
                コピーが完了しました。ChatGPTなどのAIチャットに貼り付けて、指導方法をご参考ください。
              </div>
            )}
          </div>
          </>
          )}
        </>
      ) : !pending && !selectedUser ? (
        <Card>
          <div className="py-12 text-center text-sm text-zinc-500">
            {userRole === 'mentor' ? 'メンティーを選択してください' : '社員を選択してください'}
          </div>
        </Card>
      ) : null}

      {/* Assignment Detail Modal */}
      {modalAssignment && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={() => setModalAssignment(null)}>
          <div className="relative mx-4 w-full max-w-lg rounded-2xl bg-white p-6 shadow-2xl dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <button onClick={() => setModalAssignment(null)} className="absolute right-4 top-4 rounded-lg p-1 text-zinc-400 hover:bg-zinc-100 hover:text-zinc-600 dark:hover:bg-zinc-800 dark:hover:text-zinc-300">
              <X className="h-5 w-5" />
            </button>

            <div className="flex items-center gap-3">
              <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">{modalAssignment.title}</h3>
              <span className={`shrink-0 inline-flex rounded-full px-2 py-0.5 text-[10px] font-medium ${statusColors[modalAssignment.status] ?? 'bg-gray-100 text-gray-600'}`}>
                {statusLabels[modalAssignment.status] ?? modalAssignment.status}
              </span>
            </div>

            {detailLoading ? (
              <div className="py-12 text-center text-sm text-zinc-500">読み込み中...</div>
            ) : detailData ? (
              <div className="mt-5 space-y-6">
                {/* Mastery Trend (7 days) */}
                <div>
                  <h4 className="text-sm font-medium text-zinc-700 dark:text-zinc-300">学習進捗 (7日間)</h4>
                  {(() => {
                    const BAR_MAX_H = 64
                    const maxCount = Math.max(...detailData.masteryTrend.map(d => d.count), 1)
                    const dayLabels = ['日', '月', '火', '水', '木', '金', '土']
                    return (
                      <div className="mt-3 flex items-end gap-2" style={{ height: BAR_MAX_H + 36 }}>
                        {detailData.masteryTrend.map(d => {
                          const date = new Date(d.day + 'T00:00:00')
                          const label = dayLabels[date.getDay()]
                          const barH = d.count > 0 ? Math.max(Math.round((d.count / maxCount) * BAR_MAX_H), 6) : 3
                          return (
                            <div key={d.day} className="flex flex-1 flex-col items-center justify-end" style={{ height: BAR_MAX_H + 36 }}>
                              <span className="mb-1 text-[11px] font-medium text-zinc-600 dark:text-zinc-300">{d.count > 0 ? d.count : ''}</span>
                              <div
                                className={`w-full max-w-[36px] rounded-t-md transition-all ${d.count > 0 ? 'bg-amber-500' : 'bg-zinc-200 dark:bg-zinc-700'}`}
                                style={{ height: barH }}
                              />
                              <span className="mt-1.5 text-[11px] text-zinc-400">{label}</span>
                            </div>
                          )
                        })}
                      </div>
                    )
                  })()}
                  <p className="mt-2 text-xs text-zinc-500">
                    7日間合計: +{detailData.masteryTrend.reduce((sum, d) => sum + d.count, 0)}件
                  </p>
                </div>

                {/* Quiz Results */}
                {detailData.quizResults.length > 0 && (
                  <div>
                    <h4 className="text-sm font-medium text-zinc-700 dark:text-zinc-300">テスト結果</h4>
                    <div className="mt-2 divide-y divide-zinc-100 dark:divide-zinc-800 rounded-xl border border-zinc-200 dark:border-zinc-700 overflow-hidden">
                      {detailData.quizResults.map(qr => (
                        <div key={qr.quizId} className="flex items-center justify-between px-4 py-3">
                          <span className="text-sm text-zinc-800 dark:text-zinc-200 line-clamp-1 mr-3">{qr.quizTitle}</span>
                          <div className="flex items-center gap-2 shrink-0">
                            {qr.completedAt ? (
                              <>
                                <span className="text-sm font-medium text-zinc-900 dark:text-zinc-100">{qr.latestScore}点</span>
                                <span className={`inline-flex rounded-full px-2 py-0.5 text-[10px] font-medium ${qr.passed ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400' : 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400'}`}>
                                  {qr.passed ? '合格' : '不合格'}
                                </span>
                                {qr.attemptId && (
                                  <a
                                    href={`/dashboard/history/${qr.attemptId}?role=mentor`}
                                    className="text-xs text-indigo-500 hover:text-indigo-400 hover:underline"
                                    onClick={e => e.stopPropagation()}
                                  >
                                    レビュー
                                  </a>
                                )}
                              </>
                            ) : (
                              <span className="inline-flex rounded-full bg-zinc-100 px-2 py-0.5 text-[10px] font-medium text-zinc-500 dark:bg-zinc-800 dark:text-zinc-400">
                                未受験
                              </span>
                            )}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            ) : (
              <div className="py-12 text-center text-sm text-zinc-500">データの取得に失敗しました</div>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
