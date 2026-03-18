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
import type { ExamScorePoint } from '@/app/actions/admin/weakness-report'
import { useDarkMode } from '@/lib/hooks/useDarkMode'
import { EXAM_CATEGORY_COLORS, EXAM_CATEGORY_LABELS } from '@/lib/chart-constants'

const DATES_PER_PAGE = 3

interface ScoreBarChartProps {
  data: ExamScorePoint[]
}

export default function ScoreBarChart({ data }: ScoreBarChartProps) {
  const isDark = useDarkMode()
  const [page, setPage] = useState(0)

  // Reset page when data changes
  useEffect(() => { setPage(0) }, [data])

  const gridStroke = isDark ? 'rgba(255,255,255,0.08)' : 'rgba(0,0,0,0.06)'
  const labelFill = isDark ? '#a1a1aa' : '#52525b'
  const separatorStroke = isDark ? 'rgba(255,255,255,0.25)' : 'rgba(0,0,0,0.20)'

  // Build chart data: each item = one exam bar
  const allChartData = useMemo(() => data.map((d, i) => ({
    index: i,
    dateKey: new Date(d.completedAt).toLocaleDateString('ja-JP', { year: 'numeric', month: 'numeric', day: 'numeric' }),
    label: new Date(d.completedAt).toLocaleDateString('ja-JP', { month: 'numeric', day: 'numeric' }),
    score: d.score,
    category: d.category,
    categoryLabel: d.categoryLabel,
  })), [data])

  // Unique dates in order
  const uniqueDates = useMemo(() => {
    const seen = new Set<string>()
    const dates: string[] = []
    for (const d of allChartData) {
      if (!seen.has(d.dateKey)) {
        seen.add(d.dateKey)
        dates.push(d.dateKey)
      }
    }
    return dates
  }, [allChartData])

  const totalPages = Math.ceil(uniqueDates.length / DATES_PER_PAGE)
  const showPagination = uniqueDates.length > DATES_PER_PAGE

  // Visible dates for current page
  const visibleDates = useMemo(() => {
    const start = page * DATES_PER_PAGE
    return new Set(uniqueDates.slice(start, start + DATES_PER_PAGE))
  }, [uniqueDates, page])

  // Filtered + re-indexed chart data
  const chartData = useMemo(() => {
    return allChartData
      .filter(d => visibleDates.has(d.dateKey))
      .map((d, i) => ({ ...d, index: i }))
  }, [allChartData, visibleDates])

  // Date groups: each group = { dateKey, startIndex, endIndex }
  const dateGroups = useMemo(() => {
    const groups: { dateKey: string; startIndex: number; endIndex: number }[] = []
    for (let i = 0; i < chartData.length; i++) {
      const last = groups[groups.length - 1]
      if (last && last.dateKey === chartData[i].dateKey) {
        last.endIndex = i
      } else {
        groups.push({ dateKey: chartData[i].dateKey, startIndex: i, endIndex: i })
      }
    }
    return groups
  }, [chartData])

  if (data.length === 0) {
    return (
      <div className="flex h-[300px] items-center justify-center text-sm text-zinc-500">
        スコアデータがありません
      </div>
    )
  }

  // Deduplicate legend entries
  const seenCategories = new Set<string>()
  const legendPayload = data
    .filter(d => {
      if (seenCategories.has(d.category)) return false
      seenCategories.add(d.category)
      return true
    })
    .map(d => ({
      value: EXAM_CATEGORY_LABELS[d.category] ?? d.category,
      type: 'rect' as const,
      color: EXAM_CATEGORY_COLORS[d.category] ?? '#888',
    }))

  const pageStart = page * DATES_PER_PAGE + 1
  const pageEnd = Math.min((page + 1) * DATES_PER_PAGE, uniqueDates.length)

  return (
    <div>
      <ResponsiveContainer width="100%" height={300}>
        <BarChart data={chartData} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
          <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} />
          <XAxis
            dataKey="index"
            type="number"
            domain={[-0.5, chartData.length - 0.5]}
            ticks={chartData.map((_, i) => i)}
            tick={(props: Record<string, unknown>) => {
              const x = Number(props.x ?? 0)
              const y = Number(props.y ?? 0)
              const pl = props.payload as { value?: number } | undefined
              const item = chartData[pl?.value ?? 0]
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
            tickCount={6}
          />
          <Tooltip
            content={({ active, payload }) => {
              if (!active || !payload?.[0]) return null
              const entry = payload[0].payload as typeof chartData[number]
              return (
                <div
                  className="rounded-xl p-3 text-sm shadow-lg backdrop-blur-sm"
                  style={{
                    backgroundColor: isDark ? 'rgba(24,24,27,0.95)' : 'rgba(255,255,255,0.95)',
                    border: isDark ? '1px solid rgba(255,255,255,0.08)' : '1px solid rgba(0,0,0,0.08)',
                    color: isDark ? '#fafafa' : '#09090b',
                  }}
                >
                  <div className="font-medium">{entry.label} — {entry.categoryLabel}</div>
                  <div className="mt-1" style={{ color: EXAM_CATEGORY_COLORS[entry.category] ?? '#888' }}>
                    スコア: {entry.score}点
                  </div>
                </div>
              )
            }}
          />
          <Legend
            wrapperStyle={{ fontSize: '0.75rem', color: labelFill }}
            content={() => (
              <div className="flex flex-wrap justify-center gap-4 pt-2">
                {legendPayload.map(item => (
                  <div key={item.value} className="flex items-center gap-1.5">
                    <span className="inline-block h-3 w-3 rounded-sm" style={{ backgroundColor: item.color }} />
                    <span style={{ color: labelFill }}>{item.value}</span>
                  </div>
                ))}
              </div>
            )}
          />
          <ReferenceLine y={70} stroke={isDark ? '#a1a1aa' : '#71717a'} strokeDasharray="4 4" label={{ value: '合格線', fill: labelFill, fontSize: 11, position: 'insideTopRight' }} />
          {dateGroups.slice(1).map(g => (
            <ReferenceLine
              key={`sep-${g.dateKey}`}
              x={g.startIndex - 0.5}
              stroke={separatorStroke}
              strokeDasharray="6 4"
            />
          ))}
          <Bar dataKey="score" radius={[4, 4, 0, 0]}>
            {chartData.map((entry, index) => (
              <Cell key={index} fill={EXAM_CATEGORY_COLORS[entry.category] ?? '#888'} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
      {showPagination && (
        <div className="flex items-center justify-center gap-2 pt-1 text-xs" style={{ color: labelFill }}>
          <button
            onClick={() => setPage(p => p - 1)}
            disabled={page === 0}
            className="rounded p-0.5 transition-opacity hover:opacity-70 disabled:opacity-30 disabled:cursor-not-allowed"
          >
            <ChevronLeft className="h-4 w-4" />
          </button>
          <span>{pageStart}-{pageEnd} / {uniqueDates.length}</span>
          <button
            onClick={() => setPage(p => p + 1)}
            disabled={page >= totalPages - 1}
            className="rounded p-0.5 transition-opacity hover:opacity-70 disabled:opacity-30 disabled:cursor-not-allowed"
          >
            <ChevronRight className="h-4 w-4" />
          </button>
        </div>
      )}
    </div>
  )
}
