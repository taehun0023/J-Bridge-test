'use client'

import { useEffect, useRef, useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import TabBar from '@/components/ui/TabBar'
import { getWeaknessReport, getMenteeAssignments, getAssignmentDetail, generateAIPrompt, getMockExamReport, deleteMockExamAssignment } from '@/app/actions/admin/weakness-report'
import type { ExamScorePoint, ExamErrorRate, MenteeAssignment, AssignmentDetailData, MockExamReport } from '@/app/actions/admin/weakness-report'
import { updateLearningAssignment, deleteLearningAssignment } from '@/app/actions/learning-assignments'
import MockPartChart from './MockPartChart'
import MockWrongList from './MockWrongList'
import { getJlptLevelColor, type JlptLevel } from '@/lib/assessment-config'

const EXAM_CATEGORY_GROUPS = {
  nihongo: ['jlpt-mock', 'seikatsu', 'business-jp'],
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
  const [mockReport, setMockReport] = useState<MockExamReport | null>(null)
  const [scoreTab, setScoreTab] = useState<TabKey>('nihongo')
  const [errorTab, setErrorTab] = useState<TabKey>('nihongo')
  const [nihongoScoreSub, setNihongoScoreSub] = useState<'all' | 'seikatsu' | 'business-jp'>('all')
  const [nihongoErrorSub, setNihongoErrorSub] = useState<'all' | 'seikatsu' | 'business-jp'>('all')
  const [mainTab, setMainTab] = useState<'kadai' | 'test'>('kadai')
  const [kadaiFilter, setKadaiFilter] = useState<'all' | 'completed' | 'overdue'>('all')
  const [yearFilter, setYearFilter] = useState<number>(() => new Date().getFullYear())
  const [pending, startTransition] = useLoadingTransition()
  const [error, setError] = useState<string | null>(null)
  const [copied, setCopied] = useState(false)
  const [modalAssignment, setModalAssignment] = useState<MenteeAssignment | null>(null)
  const [detailData, setDetailData] = useState<AssignmentDetailData | null>(null)
  const [detailLoading, setDetailLoading] = useState(false)
  const [editCount, setEditCount] = useState('')
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
      const [reportResult, assignResult, mockResult] = await Promise.all([
        getWeaknessReport(userId),
        getMenteeAssignments(userId),
        getMockExamReport(userId),
      ])
      setMockReport(mockResult)
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

  function handleSaveAssignment() {
    if (!modalAssignment) return
    const n = parseInt(editCount, 10)
    if (!Number.isFinite(n) || n < 1) { setError('付与個数は1以上で入力してください'); return }
    startTransition(async () => {
      const res = await updateLearningAssignment(modalAssignment.id, { target_count: n })
      if ('error' in res && res.error) { setError(res.error); return }
      setModalAssignment(null)
      if (selectedId) handleSelect(selectedId) // 목록 갱신 (상태 재계산 반영)
    })
  }

  function handleDeleteAssignment() {
    if (!modalAssignment) return
    if (!confirm('この課題を削除しますか？')) return
    const isMock = modalAssignment.category === 'jlpt-mock'
    startTransition(async () => {
      const res = isMock
        ? await deleteMockExamAssignment(modalAssignment.id)
        : await deleteLearningAssignment(modalAssignment.id)
      if ('error' in res && res.error) { setError(res.error); return }
      setModalAssignment(null)
      if (selectedId) handleSelect(selectedId)
    })
  }

  function handleCardClick(a: MenteeAssignment) {
    setModalAssignment(a)
    setEditCount(a.target_count != null ? String(a.target_count) : '')
    setDetailData(null)
    // 모의고사 과제는 항목 학습추세가 없음 → 상세 fetch 생략 (모달은 항목과제와 동일하게 열림)
    if (a.category === 'jlpt-mock') { setDetailLoading(false); return }
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
      if (sub === 'seikatsu') return ['jlpt-mock', 'seikatsu']
      if (sub === 'business-jp') return ['business-jp']
      return ['jlpt-mock', 'seikatsu', 'business-jp']
    }
    return [...EXAM_CATEGORY_GROUPS[tab]]
  }

  const nihongoSubButtons = [
    { key: 'all' as const, label: '全体' },
    { key: 'seikatsu' as const, label: 'JLPT' },
    { key: 'business-jp' as const, label: 'ビジネス日本語' },
  ]

  const selectedUser = users.find(u => u.id === selectedId)

  // 理解テスト課題(seikatsu-quiz / business-jp-quiz)はテストタブ、項目課題は課題タブへ
  const isTestCategory = (cat: string) => (QUIZ_CATEGORIES as readonly string[]).includes(cat)
  const itemAssignments = assignments.filter(a => !isTestCategory(a.category))
  const testAssignments = assignments.filter(a => isTestCategory(a.category))

  const renderCards = (items: MenteeAssignment[]) => {
    const now = new Date()
    const isOverdueA = (a: MenteeAssignment) => a.status === 'overdue' || (!!a.due_date && new Date(a.due_date) < now && a.status !== 'completed')
    const yearOf = (a: MenteeAssignment) => (a.due_date ?? a.created_at ?? '').slice(0, 4)
    const years = [...new Set([String(now.getFullYear()), ...items.map(yearOf).filter(Boolean)])].sort((a, b) => b.localeCompare(a))
    const filtered = items.filter(a => {
      if (yearOf(a) !== String(yearFilter)) return false
      return kadaiFilter === 'completed' ? a.status === 'completed'
        : kadaiFilter === 'overdue' ? isOverdueA(a)
          : true
    })
    const byMonth = new Map<string, MenteeAssignment[]>()
    for (const a of filtered) {
      const m = (a.due_date ?? a.created_at ?? '').slice(0, 7) || '0000-00'
      const arr = byMonth.get(m) ?? []; arr.push(a); byMonth.set(m, arr)
    }
    const curYear = String(now.getFullYear())
    const curKey = `${curYear}-${String(now.getMonth() + 1).padStart(2, '0')}`
    // 정렬: 지연(과거 미완료) → 이번달 → 과거(완료)·미래
    const monthPrio = (m: string) => {
      if (m === curKey) return 1
      if (m !== '0000-00' && m < curKey) return byMonth.get(m)!.some(a => a.status !== 'completed') ? 0 : 2
      return 2
    }
    const months = [...byMonth.keys()].sort((a, b) => { const p = monthPrio(a) - monthPrio(b); return p !== 0 ? p : a.localeCompare(b) })
    const monthLabel = (m: string) => {
      if (m === '0000-00') return '期限なし'
      const [y, mo] = m.split('-')
      return y === curYear ? `${parseInt(mo, 10)}月` : `${y}年${parseInt(mo, 10)}月`
    }
    return (
      <div>
        {/* 좌: 년도 드롭다운 / 우: 전체·완료·지연 필터 */}
        <div className="mb-4 flex items-center justify-between gap-2">
          <select value={yearFilter} onChange={e => setYearFilter(Number(e.target.value))}
            className="rounded-lg border border-zinc-300 bg-white px-2 py-1 text-xs font-medium text-zinc-700 focus:border-indigo-500 focus:outline-none dark:border-zinc-600 dark:bg-zinc-800 dark:text-zinc-200">
            {years.map(y => <option key={y} value={y}>{y}年</option>)}
          </select>
          <div className="flex gap-1">
            {([['all', '全体'], ['completed', '完了'], ['overdue', '遅延']] as const).map(([k, lbl]) => (
              <button key={k} onClick={() => setKadaiFilter(k)}
                className={`rounded-lg px-3 py-1 text-xs font-medium transition-colors ${kadaiFilter === k ? 'bg-indigo-600 text-white' : 'bg-zinc-100 text-zinc-600 hover:bg-zinc-200 dark:bg-zinc-800 dark:text-zinc-300'}`}>
                {lbl}
              </button>
            ))}
          </div>
        </div>
        {filtered.length === 0 ? (
          <div className="py-10 text-center text-sm text-zinc-500">該当する課題がありません</div>
        ) : months.map(m => {
          const past = m !== '0000-00' && m < curKey
          return (
            <div key={m} className="mb-5">
              <div className="mb-2 flex items-center gap-2">
                <span className={`shrink-0 text-sm font-bold ${past ? 'text-red-500' : 'text-zinc-700 dark:text-zinc-200'}`}>{monthLabel(m)}{past && '（未完了あり）'}</span>
                <div className={`h-px flex-1 ${past ? 'bg-red-300 dark:bg-red-700/50' : 'bg-zinc-200 dark:bg-white/10'}`} />
              </div>
              <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
                {byMonth.get(m)!.map(a => {
                  const isOverdue = isOverdueA(a)
                  const done = a.status === 'completed'
                  return (
                    <button key={a.id} onClick={() => handleCardClick(a)} className={`rounded-xl border p-4 text-left transition-colors cursor-pointer w-full ${done ? 'border-emerald-300 bg-emerald-50 hover:ring-1 hover:ring-emerald-400/30 dark:border-emerald-700/50 dark:bg-emerald-900/15' : 'border-zinc-200 bg-zinc-50 hover:border-indigo-400 hover:ring-1 hover:ring-indigo-400/30 dark:border-zinc-700 dark:bg-zinc-800/50'}`}>
                      <div className="flex items-start justify-between gap-2">
                        <h4 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100 line-clamp-1">{a.title.replace(/\s*\d+\s*項目/g, '').trim()}</h4>
                        <span className={`shrink-0 inline-flex rounded-full px-2 py-0.5 text-[10px] font-medium ${statusColors[a.status] ?? 'bg-gray-100 text-gray-600'}`}>
                          {statusLabels[a.status] ?? a.status}
                        </span>
                      </div>
                      <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">
                        {a.category === 'jlpt-mock' ? (
                          <>JLPT模試{a.content_level ? ` (${a.content_level})` : ''}</>
                        ) : (
                          <>
                            {getCategoryLabel(a.category)} &gt; {getSubcategoryLabel(a.category, a.subcategory)}
                            {a.content_level && ` (${getContentLevelLabel(a.category, a.content_level)})`}
                          </>
                        )}
                      </p>
                      {a.mastery.total > 0 && (
                        <div className="mt-3">
                          <div className="flex items-center justify-between text-xs text-zinc-500 dark:text-zinc-400"><span>{a.category === 'jlpt-mock' ? '受験' : '学習'}</span><span className="tabular-nums">{a.mastery.mastered}/{a.mastery.total}</span></div>
                          <div className="mt-1 h-1.5 w-full rounded-full bg-zinc-200 dark:bg-zinc-600"><div className="h-1.5 rounded-full bg-amber-500 transition-all" style={{ width: `${a.mastery.pct}%` }} /></div>
                        </div>
                      )}
                      {a.due_date && (
                        <p className={`mt-2 text-xs ${isOverdue ? 'font-medium text-red-500 dark:text-red-400' : 'text-zinc-400 dark:text-zinc-500'}`}>期限: {new Date(a.due_date).toLocaleDateString('ja-JP')}</p>
                      )}
                    </button>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>
    )
  }

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
              { key: 'test', label: '模擬試験' },
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
          {/* 모의고사 결과: 파트(유형)별 정답률 + 틀린 문제 */}
          {mockReport?.hasData ? (
            <>
              {/* 회차 카드를 한 줄로 펴서 최신순(시각 desc). 각 카드 앞에 색깔 레벨 뱃지 + 模試N + 第N回 */}
              {[...mockReport.attempts].sort((a, b) => (b.ts ?? '').localeCompare(a.ts ?? '')).map(at => {
                const incomplete = !at.parts.some(p => p.label === '聴解') // 聴解(2교시) 미응시 = 진행중
                const verdict = incomplete ? '（進行中）' : at.passed === true ? '（合格）' : at.passed === false ? '（不合格）' : ''
                const attemptWrong = mockReport.wrong.filter(w => w.setLabel === at.setLabel && w.attemptNo === at.attemptNo)
                return (
                  <div key={`${at.setLabel}-${at.attemptNo}`} className="rounded-2xl border border-gray-200/60 bg-white/80 p-4 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
                    <div className="mb-3 flex items-center gap-2">
                      <span className={`shrink-0 rounded px-1.5 py-0.5 text-xs font-bold ${getJlptLevelColor(at.level as JlptLevel)}`}>{at.level}</span>
                      <span className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">
                        {at.setTitle} {at.attemptLabel}{verdict}{!incomplete && at.score != null ? ` · ${at.score}点` : ''}
                      </span>
                    </div>
                    <MockPartChart parts={at.parts} />
                    {attemptWrong.length > 0 && (
                      <div className="mt-4 border-t border-zinc-200 pt-3 dark:border-zinc-700">
                        <p className="mb-2 text-xs font-semibold text-zinc-600 dark:text-zinc-300">間違えた問題</p>
                        <MockWrongList wrong={attemptWrong} />
                      </div>
                    )}
                  </div>
                )
              })}
            </>
          ) : (
            <Card><div className="py-10 text-center text-sm text-zinc-500">受験した模擬試験がありません</div></Card>
          )}
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
              <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">{modalAssignment.title.replace(/\s*\d+\s*項目/g, '').trim()}</h3>
              <span className={`shrink-0 inline-flex rounded-full px-2 py-0.5 text-[10px] font-medium ${statusColors[modalAssignment.status] ?? 'bg-gray-100 text-gray-600'}`}>
                {statusLabels[modalAssignment.status] ?? modalAssignment.status}
              </span>
            </div>

            {modalAssignment.category === 'jlpt-mock' ? (
              <div className="mt-5 space-y-4">
                <p className="text-sm text-zinc-600 dark:text-zinc-300">
                  JLPT模試の課題です。受験状況: <span className="font-medium">{statusLabels[modalAssignment.status] ?? modalAssignment.status}</span>
                </p>
                <button
                  onClick={() => { setMainTab('test'); setModalAssignment(null) }}
                  className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-500"
                >結果を見る（テスト）</button>
              </div>
            ) : detailLoading ? (
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
              </div>
            ) : (
              <div className="py-12 text-center text-sm text-zinc-500">データの取得に失敗しました</div>
            )}

            {/* 수정·삭제 (공통 액션 재사용 — 모든 페이지에 반영) */}
            <div className="mt-6 flex items-center justify-between gap-3 border-t border-zinc-200 pt-4 dark:border-zinc-700">
              {modalAssignment.target_count != null ? (
                <div className="flex items-center gap-2">
                  <label className="text-xs text-zinc-500 dark:text-zinc-400">付与個数</label>
                  <input
                    type="number" min={1} value={editCount}
                    onChange={e => setEditCount(e.target.value)}
                    className="w-20 rounded-lg border border-zinc-300 bg-white px-2 py-1 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-zinc-600 dark:bg-zinc-800 dark:text-zinc-100"
                  />
                  <button onClick={handleSaveAssignment} disabled={pending}
                    className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-500 disabled:opacity-50">保存</button>
                </div>
              ) : <span />}
              <button onClick={handleDeleteAssignment} disabled={pending}
                className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-50">削除</button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
