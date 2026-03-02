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
  Legend,
} from 'recharts'

interface ActivityTrendChartProps {
  data: { week: string; quizAttempts: number; codeSubmissions: number }[]
}

export default function ActivityTrendChart({ data }: ActivityTrendChartProps) {
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
        アクティビティデータがありません
      </div>
    )
  }

  return (
    <ResponsiveContainer width="100%" height={300}>
      <BarChart data={data} margin={{ top: 5, right: 20, bottom: 5, left: 0 }}>
        <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} />
        <XAxis
          dataKey="week"
          tick={{ fill: labelFill, fontSize: 12 }}
          axisLine={{ stroke: gridStroke }}
        />
        <YAxis
          tick={{ fill: labelFill, fontSize: 11 }}
          axisLine={{ stroke: gridStroke }}
          allowDecimals={false}
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
          formatter={((value: number, name: string) => [
            `${value}件`,
            name === 'quizAttempts' ? 'クイズ受験' : 'コード提出',
          ]) as never}
        />
        <Legend
          wrapperStyle={{ fontSize: '0.75rem', color: labelFill }}
          formatter={(value: string) =>
            value === 'quizAttempts' ? 'クイズ受験' : 'コード提出'
          }
        />
        <Bar dataKey="quizAttempts" fill="#6366f1" radius={[4, 4, 0, 0]} />
        <Bar dataKey="codeSubmissions" fill="#10b981" radius={[4, 4, 0, 0]} />
      </BarChart>
    </ResponsiveContainer>
  )
}
