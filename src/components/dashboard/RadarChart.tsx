'use client'

import { useEffect, useState } from 'react'
import {
  ResponsiveContainer,
  RadarChart as RechartsRadarChart,
  PolarGrid,
  PolarAngleAxis,
  PolarRadiusAxis,
  Radar,
  Legend,
  Tooltip,
} from 'recharts'
import { getGrade, getRelevantAxes, AXIS_DISPLAY_LABELS } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'

interface RadarChartProps {
  scores: Record<AxisKey, number>
  isJapanese?: boolean
  role?: string
}

export default function RadarChart({ scores, isJapanese = false, role }: RadarChartProps) {
  const [isDark, setIsDark] = useState(false)

  useEffect(() => {
    const check = () => setIsDark(document.documentElement.classList.contains('dark'))
    check()
    const observer = new MutationObserver(check)
    observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })
    return () => observer.disconnect()
  }, [])

  const relevantAxes = getRelevantAxes(isJapanese, role)

  const data = relevantAxes.map((key) => ({
    axis: AXIS_DISPLAY_LABELS[key],
    score: scores[key],
    threshold: 70,
    fullMark: 100,
  }))

  const gridStroke = isDark ? 'rgba(255,255,255,0.1)' : 'rgba(0,0,0,0.08)'
  const labelFill = isDark ? '#a1a1aa' : '#52525b'

  return (
    <ResponsiveContainer width="100%" height={320}>
      <RechartsRadarChart data={data} cx="50%" cy="50%" outerRadius="75%">
        <PolarGrid stroke={gridStroke} />
        <PolarAngleAxis
          dataKey="axis"
          tick={{ fill: labelFill, fontSize: 12 }}
        />
        <PolarRadiusAxis
          angle={90}
          domain={[0, 100]}
          tick={{ fill: isDark ? '#71717a' : '#a1a1aa', fontSize: 9 }}
          tickCount={6}
          axisLine={false}
        />
        <Radar
          name="派遣基準 (B)"
          dataKey="threshold"
          stroke="#f59e0b"
          strokeWidth={2}
          strokeDasharray="6 4"
          fill="transparent"
          dot={false}
        />
        <Radar
          name="エンジニア能力"
          dataKey="score"
          stroke="#6366f1"
          strokeWidth={2}
          fill="#6366f1"
          fillOpacity={0.15}
          dot={{ r: 4, fill: '#6366f1', stroke: isDark ? '#09090b' : '#fafafa', strokeWidth: 2 }}
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
          formatter={((value: number | undefined, name: string | undefined) => {
            if (name === '派遣基準 (B)') return ['70点 (B)', '派遣基準']
            const grade = getGrade(value ?? 0)
            return [`${value ?? 0}点 (${grade})`, 'スコア']
          }) as never}
        />
        <Legend
          wrapperStyle={{ fontSize: '0.75rem', color: labelFill }}
          iconType="line"
        />
      </RechartsRadarChart>
    </ResponsiveContainer>
  )
}
