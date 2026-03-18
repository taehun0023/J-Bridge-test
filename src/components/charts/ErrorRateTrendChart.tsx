'use client'

import { useEffect, useMemo, useState } from 'react'
import {
  ResponsiveContainer,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ReferenceLine,
  Cell,
} from 'recharts'
import { ChevronLeft, ChevronRight } from 'lucide-react'
import type { ExamErrorRate } from '@/app/actions/admin/weakness-report'
import { useDarkMode } from '@/lib/hooks/useDarkMode'
import { EXAM_CATEGORY_COLORS, EXAM_CATEGORY_LABELS } from '@/lib/chart-constants'

function getSeverityColor(errorRate: number): string {
  if (errorRate > 50) return '#ef4444'
  if (errorRate >= 30) return '#f59e0b'
  return '#22c55e'
}

const DATES_PER_PAGE = 3

interface ErrorRateTrendChartProps {
  data: ExamErrorRate[]
  aggregated?: boolean
}

interface AggregatedEntry {
  index: number
  dateKey: string
  label: string
  errorRate: number
  fill: string
  examCategory: string
  categories: ExamErrorRate['categories']
}

interface DetailEntry {
  index: number
  dateKey: string
  label: string
  categories: { key: string; label: string; errorRate: number; fill: string; totalAnswered: number; incorrectCount: number }[]
}

export default function ErrorRateTrendChart({ data, aggregated = false }: ErrorRateTrendChartProps) {
  const isDark = useDarkMode()
  const [aggPage, setAggPage] = useState(0)
  const [detailPage, setDetailPage] = useState(0)

  // Reset pages when data changes
  useEffect(() => { setAggPage(0); setDetailPage(0) }, [data])

  const gridStroke = isDark ? 'rgba(255,255,255,0.08)' : 'rgba(0,0,0,0.06)'
  const labelFill = isDark ? '#a1a1aa' : '#52525b'
  const separatorStroke = isDark ? 'rgba(255,255,255,0.25)' : 'rgba(0,0,0,0.20)'

  // Aggregated mode: one bar per exam with weighted average error rate
  const allAggregatedData = useMemo<AggregatedEntry[]>(() => {
    if (!aggregated) return []
    return data.map((exam, i) => {
      const totalAnswered = exam.categories.reduce((s, c) => s + c.totalAnswered, 0)
      const totalIncorrect = exam.categories.reduce((s, c) => s + c.incorrectCount, 0)
      const avgRate = totalAnswered > 0 ? Math.round((totalIncorrect / totalAnswered) * 100) : 0
      const dateKey = new Date(exam.completedAt).toLocaleDateString('ja-JP', { year: 'numeric', month: 'numeric', day: 'numeric' })
      const dateLabel = new Date(exam.completedAt).toLocaleDateString('ja-JP', { month: 'numeric', day: 'numeric' })
      return {
        index: i,
        dateKey,
        label: dateLabel,
        errorRate: avgRate,
        fill: EXAM_CATEGORY_COLORS[exam.examCategory] ?? getSeverityColor(avgRate),
        examCategory: exam.examCategory,
        categories: exam.categories,
      }
    })
  }, [data, aggregated])

  // Aggregated: unique dates + pagination
  const aggUniqueDates = useMemo(() => {
    const seen = new Set<string>()
    const dates: string[] = []
    for (const d of allAggregatedData) {
      if (!seen.has(d.dateKey)) { seen.add(d.dateKey); dates.push(d.dateKey) }
    }
    return dates
  }, [allAggregatedData])

  const aggTotalPages = Math.ceil(aggUniqueDates.length / DATES_PER_PAGE)
  const aggShowPag = aggUniqueDates.length > DATES_PER_PAGE

  const aggVisibleDates = useMemo(() => {
    const start = aggPage * DATES_PER_PAGE
    return new Set(aggUniqueDates.slice(start, start + DATES_PER_PAGE))
  }, [aggUniqueDates, aggPage])

  const aggregatedData = useMemo(() => {
    return allAggregatedData
      .filter(d => aggVisibleDates.has(d.dateKey))
      .map((d, i) => ({ ...d, index: i }))
  }, [allAggregatedData, aggVisibleDates])

  const aggDateGroups = useMemo(() => {
    const groups: { dateKey: string; startIndex: number; endIndex: number }[] = []
    for (let i = 0; i < aggregatedData.length; i++) {
      const last = groups[groups.length - 1]
      if (last && last.dateKey === aggregatedData[i].dateKey) {
        last.endIndex = i
      } else {
        groups.push({ dateKey: aggregatedData[i].dateKey, startIndex: i, endIndex: i })
      }
    }
    return groups
  }, [aggregatedData])

  // Detail mode: category-level bars with severity colors
  const { allDetailData } = useMemo(() => {
    if (aggregated) return { allDetailData: [] as DetailEntry[] }

    const catFreq = new Map<string, number>()
    for (const exam of data) {
      for (const c of exam.categories) {
        catFreq.set(c.questionCategory, (catFreq.get(c.questionCategory) ?? 0) + c.totalAnswered)
      }
    }
    const top = [...catFreq.entries()]
      .sort((a, b) => b[1] - a[1])
      .slice(0, 5)
      .map(([cat]) => cat)

    const labelMap = new Map<string, string>()
    for (const exam of data) {
      for (const c of exam.categories) {
        if (!labelMap.has(c.questionCategory)) labelMap.set(c.questionCategory, c.label)
      }
    }

    const dd: DetailEntry[] = data.map((exam, idx) => {
      const dateKey = new Date(exam.completedAt).toLocaleDateString('ja-JP', { year: 'numeric', month: 'numeric', day: 'numeric' })
      const dateLabel = new Date(exam.completedAt).toLocaleDateString('ja-JP', { month: 'numeric', day: 'numeric' })
      const cats = top.map(cat => {
        const found = exam.categories.find(c => c.questionCategory === cat)
        return {
          key: cat,
          label: labelMap.get(cat) ?? cat,
          errorRate: found?.errorRate ?? 0,
          fill: getSeverityColor(found?.errorRate ?? 0),
          totalAnswered: found?.totalAnswered ?? 0,
          incorrectCount: found?.incorrectCount ?? 0,
        }
      })
      return { index: idx, dateKey, label: dateLabel, categories: cats }
    })

    return { allDetailData: dd }
  }, [data, aggregated])

  // Detail: unique dates + pagination
  const detailUniqueDates = useMemo(() => {
    const seen = new Set<string>()
    const dates: string[] = []
    for (const d of allDetailData) {
      if (!seen.has(d.dateKey)) { seen.add(d.dateKey); dates.push(d.dateKey) }
    }
    return dates
  }, [allDetailData])

  const detailTotalPages = Math.ceil(detailUniqueDates.length / DATES_PER_PAGE)
  const detailShowPag = detailUniqueDates.length > DATES_PER_PAGE

  const detailVisibleDates = useMemo(() => {
    const start = detailPage * DATES_PER_PAGE
    return new Set(detailUniqueDates.slice(start, start + DATES_PER_PAGE))
  }, [detailUniqueDates, detailPage])

  const detailData = useMemo(() => {
    return allDetailData
      .filter(d => detailVisibleDates.has(d.dateKey))
      .map((d, i) => ({ ...d, index: i }))
  }, [allDetailData, detailVisibleDates])

  if (data.length === 0) {
    return (
      <div className="flex h-[300px] items-center justify-center text-sm text-zinc-500">
        誤答データがありません
      </div>
    )
  }

  const severityLegend = (
    <div className="flex flex-wrap justify-center gap-4 pt-2">
      <div className="flex items-center gap-1.5">
        <span className="inline-block h-3 w-3 rounded-sm bg-red-500" />
        <span style={{ color: labelFill }} className="text-xs">50%超</span>
      </div>
      <div className="flex items-center gap-1.5">
        <span className="inline-block h-3 w-3 rounded-sm bg-amber-500" />
        <span style={{ color: labelFill }} className="text-xs">30-50%</span>
      </div>
      <div className="flex items-center gap-1.5">
        <span className="inline-block h-3 w-3 rounded-sm bg-green-500" />
        <span style={{ color: labelFill }} className="text-xs">30%未満</span>
      </div>
    </div>
  )

  // Category color legend for aggregated mode (matches ScoreBarChart)
  const categoryLegend = useMemo(() => {
    const seen = new Set<string>()
    const items: { key: string; label: string; color: string }[] = []
    for (const entry of allAggregatedData) {
      if (!seen.has(entry.examCategory)) {
        seen.add(entry.examCategory)
        items.push({
          key: entry.examCategory,
          label: EXAM_CATEGORY_LABELS[entry.examCategory] ?? entry.examCategory,
          color: EXAM_CATEGORY_COLORS[entry.examCategory] ?? '#888',
        })
      }
    }
    return (
      <div className="flex flex-wrap justify-center gap-4 pt-2">
        {items.map(item => (
          <div key={item.key} className="flex items-center gap-1.5">
            <span className="inline-block h-3 w-3 rounded-sm" style={{ backgroundColor: item.color }} />
            <span style={{ color: labelFill }} className="text-xs">{item.label}</span>
          </div>
        ))}
      </div>
    )
  }, [allAggregatedData, labelFill])

  // Pagination UI component
  const PaginationUI = ({ currentPage, totalPgs, totalDates, onPrev, onNext }: {
    currentPage: number; totalPgs: number; totalDates: number
    onPrev: () => void; onNext: () => void
  }) => {
    const start = currentPage * DATES_PER_PAGE + 1
    const end = Math.min((currentPage + 1) * DATES_PER_PAGE, totalDates)
    return (
      <div className="flex items-center justify-center gap-2 pt-1 text-xs" style={{ color: labelFill }}>
        <button
          onClick={onPrev}
          disabled={currentPage === 0}
          className="rounded p-0.5 transition-opacity hover:opacity-70 disabled:opacity-30 disabled:cursor-not-allowed"
        >
          <ChevronLeft className="h-4 w-4" />
        </button>
        <span>{start}-{end} / {totalDates}</span>
        <button
          onClick={onNext}
          disabled={currentPage >= totalPgs - 1}
          className="rounded p-0.5 transition-opacity hover:opacity-70 disabled:opacity-30 disabled:cursor-not-allowed"
        >
          <ChevronRight className="h-4 w-4" />
        </button>
      </div>
    )
  }

  // Detail mode: build per-category bars with labels underneath
  // (must be computed before any early return to keep hook order stable)
  const perCatData = useMemo(() => {
    let idx = 0
    return detailData.flatMap(entry =>
      entry.categories.map(c => ({
        barIndex: idx++,
        barKey: `${entry.index}_${c.key}`,
        dateKey: entry.dateKey,
        dateLabel: entry.label,
        catLabel: c.label,
        errorRate: c.errorRate,
        fill: c.fill,
        totalAnswered: c.totalAnswered,
        incorrectCount: c.incorrectCount,
      }))
    )
  }, [detailData])

  // Date groups for detail perCatData
  const detailDateGroups = useMemo(() => {
    const groups: { dateKey: string; startIndex: number; endIndex: number }[] = []
    for (let i = 0; i < perCatData.length; i++) {
      const last = groups[groups.length - 1]
      if (last && last.dateKey === perCatData[i].dateKey) {
        last.endIndex = i
      } else {
        groups.push({ dateKey: perCatData[i].dateKey, startIndex: i, endIndex: i })
      }
    }
    return groups
  }, [perCatData])

  // Aggregated mode rendering
  if (aggregated) {
    return (
      <div>
        <ResponsiveContainer width="100%" height={300}>
          <BarChart data={aggregatedData} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} />
            <XAxis
              dataKey="index"
              type="number"
              domain={[-0.5, aggregatedData.length - 0.5]}
              ticks={aggregatedData.map((_, i) => i)}
              tick={(props: Record<string, unknown>) => {
                const x = Number(props.x ?? 0)
                const y = Number(props.y ?? 0)
                const pl = props.payload as { value?: number } | undefined
                const item = aggregatedData[pl?.value ?? 0]
                return (
                  <g transform={`translate(${x},${y})`}>
                    <text x={0} y={0} dy={12} textAnchor="middle" fill={labelFill} fontSize={11}>
                      {item?.label ?? ''}
                    </text>
                  </g>
                )
              }}
              axisLine={{ stroke: gridStroke }}
              interval={0}
            />
            <YAxis
              domain={[0, 100]}
              tick={{ fill: labelFill, fontSize: 11 }}
              axisLine={{ stroke: gridStroke }}
              tickFormatter={(v: number) => `${v}%`}
              tickCount={6}
            />
            <Tooltip
              content={({ active, payload }) => {
                if (!active || !payload?.[0]) return null
                const entry = payload[0].payload as AggregatedEntry
                return (
                  <div
                    className="rounded-xl p-3 text-sm shadow-lg backdrop-blur-sm"
                    style={{
                      backgroundColor: isDark ? 'rgba(24,24,27,0.95)' : 'rgba(255,255,255,0.95)',
                      border: isDark ? '1px solid rgba(255,255,255,0.08)' : '1px solid rgba(0,0,0,0.08)',
                      color: isDark ? '#fafafa' : '#09090b',
                    }}
                  >
                    <div className="font-medium">{entry.label} — {EXAM_CATEGORY_LABELS[entry.examCategory] ?? entry.examCategory}</div>
                    <div className="mt-1" style={{ color: entry.fill }}>
                      全体誤答率: {entry.errorRate}%
                    </div>
                    {entry.categories.length > 0 && (
                      <div className="mt-2 space-y-0.5 border-t border-zinc-200 pt-2 dark:border-zinc-700">
                        {entry.categories.map(c => (
                          <div key={c.questionCategory} className="flex items-center justify-between gap-4 text-xs">
                            <span style={{ color: isDark ? '#a1a1aa' : '#71717a' }}>{c.label}</span>
                            <span style={{ color: getSeverityColor(c.errorRate) }}>{c.errorRate}%</span>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>
                )
              }}
            />
            <Legend content={() => categoryLegend} />
            <ReferenceLine y={50} stroke="#ef4444" strokeDasharray="4 4" strokeOpacity={0.5} />
            <ReferenceLine y={30} stroke="#f59e0b" strokeDasharray="4 4" strokeOpacity={0.5} />
            {aggDateGroups.slice(1).map(g => (
              <ReferenceLine
                key={`sep-${g.dateKey}`}
                x={g.startIndex - 0.5}
                stroke={separatorStroke}
                strokeDasharray="6 4"
              />
            ))}
            <Bar dataKey="errorRate" radius={[2, 2, 0, 0]}>
              {aggregatedData.map((entry, i) => (
                <Cell key={i} fill={entry.fill} />
              ))}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
        {aggShowPag && (
          <PaginationUI
            currentPage={aggPage}
            totalPgs={aggTotalPages}
            totalDates={aggUniqueDates.length}
            onPrev={() => setAggPage(p => p - 1)}
            onNext={() => setAggPage(p => p + 1)}
          />
        )}
      </div>
    )
  }

  return (
    <div>
      <ResponsiveContainer width="100%" height={340}>
        <BarChart data={perCatData} margin={{ top: 5, right: 20, bottom: 40, left: 0 }}>
          <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} />
          <XAxis
            dataKey="barIndex"
            type="number"
            domain={[-0.5, perCatData.length - 0.5]}
            ticks={perCatData.map((_, i) => i)}
            tick={(props: Record<string, unknown>) => {
              const x = Number(props.x ?? 0)
              const y = Number(props.y ?? 0)
              const pl = props.payload as { value?: number } | undefined
              const item = perCatData[pl?.value ?? 0]
              return (
                <g transform={`translate(${x},${y})`}>
                  <text x={0} y={0} dy={12} textAnchor="middle" fill={labelFill} fontSize={10}>
                    {item?.catLabel ?? ''}
                  </text>
                  <text x={0} y={0} dy={25} textAnchor="middle" fill={isDark ? '#71717a' : '#a1a1aa'} fontSize={9}>
                    {item?.dateLabel ?? ''}
                  </text>
                </g>
              )
            }}
            axisLine={{ stroke: gridStroke }}
            interval={0}
            height={40}
          />
          <YAxis
            domain={[0, 100]}
            tick={{ fill: labelFill, fontSize: 11 }}
            axisLine={{ stroke: gridStroke }}
            tickFormatter={(v: number) => `${v}%`}
            tickCount={6}
          />
          <Tooltip
            content={({ active, payload }) => {
              if (!active || !payload?.[0]) return null
              const item = payload[0].payload as typeof perCatData[number]
              return (
                <div
                  className="rounded-xl p-3 text-sm shadow-lg backdrop-blur-sm"
                  style={{
                    backgroundColor: isDark ? 'rgba(24,24,27,0.95)' : 'rgba(255,255,255,0.95)',
                    border: isDark ? '1px solid rgba(255,255,255,0.08)' : '1px solid rgba(0,0,0,0.08)',
                    color: isDark ? '#fafafa' : '#09090b',
                  }}
                >
                  <div className="font-medium">{item.dateLabel} — {item.catLabel}</div>
                  <div className="mt-1" style={{ color: item.fill }}>
                    誤答率: {item.errorRate}%
                  </div>
                  <div className="mt-0.5 text-xs" style={{ color: isDark ? '#a1a1aa' : '#71717a' }}>
                    {item.incorrectCount}/{item.totalAnswered}問 不正解
                  </div>
                </div>
              )
            }}
          />
          <Legend content={() => severityLegend} />
          <ReferenceLine y={50} stroke="#ef4444" strokeDasharray="4 4" strokeOpacity={0.5} />
          <ReferenceLine y={30} stroke="#f59e0b" strokeDasharray="4 4" strokeOpacity={0.5} />
          {detailDateGroups.slice(1).map(g => (
            <ReferenceLine
              key={`sep-${g.dateKey}`}
              x={g.startIndex - 0.5}
              stroke={separatorStroke}
              strokeDasharray="6 4"
            />
          ))}
          <Bar dataKey="errorRate" radius={[2, 2, 0, 0]}>
            {perCatData.map((item, i) => (
              <Cell key={i} fill={item.fill} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
      {detailShowPag && (
        <PaginationUI
          currentPage={detailPage}
          totalPgs={detailTotalPages}
          totalDates={detailUniqueDates.length}
          onPrev={() => setDetailPage(p => p - 1)}
          onNext={() => setDetailPage(p => p + 1)}
        />
      )}
    </div>
  )
}
