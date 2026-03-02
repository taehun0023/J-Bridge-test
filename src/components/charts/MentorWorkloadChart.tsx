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
} from 'recharts'

interface MentorWorkloadChartProps {
  data: { mentorName: string; menteeCount: number }[]
}

export default function MentorWorkloadChart({ data }: MentorWorkloadChartProps) {
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
      <div className="flex h-[200px] items-center justify-center text-sm text-zinc-500">
        メンター割り当てデータがありません
      </div>
    )
  }

  return (
    <ResponsiveContainer width="100%" height={Math.max(200, data.length * 50)}>
      <BarChart data={data} layout="vertical" margin={{ top: 5, right: 30, bottom: 5, left: 80 }}>
        <CartesianGrid strokeDasharray="3 3" stroke={gridStroke} horizontal={false} />
        <XAxis
          type="number"
          tick={{ fill: labelFill, fontSize: 11 }}
          axisLine={{ stroke: gridStroke }}
          allowDecimals={false}
        />
        <YAxis
          type="category"
          dataKey="mentorName"
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
          formatter={((value: number) => [`${value}人`, 'メンティー数']) as never}
        />
        <Bar dataKey="menteeCount" fill="#3b82f6" radius={[0, 4, 4, 0]} />
      </BarChart>
    </ResponsiveContainer>
  )
}
