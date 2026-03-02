'use client'

import { useEffect, useState } from 'react'
import {
  ResponsiveContainer,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Cell,
} from 'recharts'
import type { ErrorRateItem } from '@/app/actions/admin/weakness-report'

function getBarColor(errorRate: number): string {
  if (errorRate > 50) return '#ef4444'
  if (errorRate >= 30) return '#f59e0b'
  return '#22c55e'
}

interface ErrorRateChartProps {
  data: ErrorRateItem[]
}

export default function ErrorRateChart({ data }: ErrorRateChartProps) {
  const [isDark, setIsDark] = useState(false)

  useEffect(() => {
    const check = () => setIsDark(document.documentElement.classList.contains('dark'))
    check()
    const observer = new MutationObserver(check)
    observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })
    return () => observer.disconnect()
  }, [])

  const gridStroke = isDark ? 'rgba(255,255,255,0.08)' : 'rgba(0,0,0,0.06)'
  const labelFill = isDark ? '#a1a1aa' : '#52525b'

  if (data.length === 0) {
    return (
      <div className="flex h-[300px] items-center justify-center text-sm text-zinc-500">
        誤答データがありません
      </div>
    )
  }

  return (
    <ResponsiveContainer width="100%" height={Math.max(300, data.length * 40)}>
      <BarChart data={data} layout="vertical" margin={{ top: 5, right: 30, bottom: 5, left: 80 }}>
        <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} horizontal={false} />
        <XAxis
          type="number"
          domain={[0, 100]}
          tick={{ fill: labelFill, fontSize: 11 }}
          axisLine={{ stroke: gridStroke }}
          tickFormatter={(v: number) => `${v}%`}
        />
        <YAxis
          type="category"
          dataKey="label"
          tick={{ fill: labelFill, fontSize: 12 }}
          axisLine={{ stroke: gridStroke }}
          width={75}
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
          formatter={((value: number | undefined, _name: string | undefined, props: { payload: ErrorRateItem }) => [
            `${value ?? 0}% (${props.payload.incorrectCount}/${props.payload.totalAnswered}問)`,
            '誤答率',
          ]) as never}
        />
        <Bar dataKey="errorRate" radius={[0, 4, 4, 0]}>
          {data.map((entry, index) => (
            <Cell key={index} fill={getBarColor(entry.errorRate)} />
          ))}
        </Bar>
      </BarChart>
    </ResponsiveContainer>
  )
}
