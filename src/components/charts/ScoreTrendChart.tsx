'use client'

import { useEffect, useState } from 'react'
import {
  ResponsiveContainer,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
} from 'recharts'
import type { ScoreTrendPoint } from '@/app/actions/admin/weakness-report'

const CATEGORY_COLORS: Record<string, string> = {
  seikatsu: '#f59e0b',
  'business-jp': '#8b5cf6',
  cs: '#06b6d4',
  dev: '#6366f1',
  'business-lit': '#10b981',
}

const CATEGORY_LABELS: Record<string, string> = {
  seikatsu: '生活日本語',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  'business-lit': 'ビジネスリテラシー',
}

interface ScoreTrendChartProps {
  data: ScoreTrendPoint[]
}

export default function ScoreTrendChart({ data }: ScoreTrendChartProps) {
  const [isDark, setIsDark] = useState(false)

  useEffect(() => {
    const check = () => setIsDark(document.documentElement.classList.contains('dark'))
    check()
    const observer = new MutationObserver(check)
    observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })
    return () => observer.disconnect()
  }, [])

  // Flatten data for recharts
  const chartData = data.map(point => ({
    name: `#${point.cycleNumber}`,
    ...point.scores,
  }))

  // Collect all categories that appear
  const allCategories = new Set<string>()
  for (const point of data) {
    for (const cat of Object.keys(point.scores)) {
      allCategories.add(cat)
    }
  }

  const gridStroke = isDark ? 'rgba(255,255,255,0.08)' : 'rgba(0,0,0,0.06)'
  const labelFill = isDark ? '#a1a1aa' : '#52525b'

  if (data.length === 0) {
    return (
      <div className="flex h-[300px] items-center justify-center text-sm text-zinc-500">
        スコアデータがありません
      </div>
    )
  }

  return (
    <ResponsiveContainer width="100%" height={300}>
      <LineChart data={chartData} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
        <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} />
        <XAxis
          dataKey="name"
          tick={{ fill: labelFill, fontSize: 12 }}
          axisLine={{ stroke: gridStroke }}
        />
        <YAxis
          domain={[0, 100]}
          tick={{ fill: labelFill, fontSize: 11 }}
          axisLine={{ stroke: gridStroke }}
          tickCount={6}
        />
        <Tooltip
          contentStyle={{
            backgroundColor: isDark ? 'rgba(24,24,27,0.95)' : 'rgba(255,255,255,0.95)',
            border: isDark ? '1px solid rgba(255,255,255,0.08)' : '1px solid rgba(0,0,0,0.08)',
            borderRadius: '0.75rem',
            backdropFilter: 'blur(12px)',
            color: isDark ? '#fafafa' : '#09090b',
            fontSize: '0.875rem',
          }}
          formatter={((value: number | null | undefined, name: string | undefined) => [
            value != null ? `${value}点` : '未受験',
            CATEGORY_LABELS[name ?? ''] ?? name ?? '',
          ]) as never}
        />
        <Legend
          wrapperStyle={{ fontSize: '0.75rem', color: labelFill }}
          formatter={(value: string) => CATEGORY_LABELS[value] ?? value}
        />
        {[...allCategories].map(cat => (
          <Line
            key={cat}
            type="monotone"
            dataKey={cat}
            stroke={CATEGORY_COLORS[cat] ?? '#888'}
            strokeWidth={2}
            dot={{ r: 4, fill: CATEGORY_COLORS[cat] ?? '#888', stroke: isDark ? '#09090b' : '#fafafa', strokeWidth: 2 }}
            connectNulls
          />
        ))}
      </LineChart>
    </ResponsiveContainer>
  )
}
