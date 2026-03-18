'use client'

import {
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Tooltip,
  Legend,
} from 'recharts'
import { useDarkMode } from '@/lib/hooks/useDarkMode'

interface UserRoleChartProps {
  data: { name: string; value: number; color: string }[]
}

export default function UserRoleChart({ data }: UserRoleChartProps) {
  const isDark = useDarkMode()

  if (data.every(d => d.value === 0)) {
    return (
      <div className="flex h-[250px] items-center justify-center text-sm text-zinc-500">
        ユーザーデータがありません
      </div>
    )
  }

  return (
    <ResponsiveContainer width="100%" height={250}>
      <PieChart>
        <Pie
          data={data}
          cx="50%"
          cy="50%"
          innerRadius={55}
          outerRadius={85}
          paddingAngle={3}
          dataKey="value"
          nameKey="name"
        >
          {data.map((entry, index) => (
            <Cell key={index} fill={entry.color} />
          ))}
        </Pie>
        <Tooltip
          contentStyle={{
            backgroundColor: isDark ? 'rgba(24,24,27,0.95)' : 'rgba(255,255,255,0.95)',
            border: isDark ? '1px solid rgba(255,255,255,0.08)' : '1px solid rgba(0,0,0,0.08)',
            borderRadius: '0.75rem',
            backdropFilter: 'blur(12px)',
            color: isDark ? '#fafafa' : '#09090b',
            fontSize: '0.875rem',
          }}
          formatter={((value: number) => [`${value}人`, '']) as never}
        />
        <Legend
          wrapperStyle={{ fontSize: '0.75rem' }}
          formatter={(value: string) => (
            <span style={{ color: isDark ? '#a1a1aa' : '#52525b' }}>{value}</span>
          )}
        />
      </PieChart>
    </ResponsiveContainer>
  )
}
