'use client'

import { useEffect, useRef, useState } from 'react'
import {
  Chart as ChartJS,
  RadialLinearScale,
  PointElement,
  LineElement,
  Filler,
  Tooltip,
  Legend,
} from 'chart.js'
import { Radar } from 'react-chartjs-2'
import { getGrade } from '@/lib/assessment-config'

ChartJS.register(RadialLinearScale, PointElement, LineElement, Filler, Tooltip, Legend)

interface RadarChartProps {
  scores: {
    jlpt: number
    itJapanese: number
    coreProgramming: number
    framework: number
    attitudeCulture: number
  }
}

const LABELS = ['JLPT', 'IT日本語', '基本プログラミング', 'フレームワーク', '態度・文化']

function getPointColor(score: number, isDark: boolean): string {
  if (score >= 90) return isDark ? 'rgba(74, 222, 128, 1)' : 'rgba(22, 163, 74, 1)' // green
  if (score >= 70) return isDark ? 'rgba(96, 165, 250, 1)' : 'rgba(59, 130, 246, 1)' // blue
  return isDark ? 'rgba(248, 113, 113, 1)' : 'rgba(220, 38, 38, 1)' // red
}

export default function RadarChart({ scores }: RadarChartProps) {
  const [isDark, setIsDark] = useState(false)
  const chartRef = useRef<ChartJS<'radar'>>(null)

  useEffect(() => {
    const check = () => setIsDark(document.documentElement.classList.contains('dark'))
    check()
    const observer = new MutationObserver(check)
    observer.observe(document.documentElement, { attributes: true, attributeFilter: ['class'] })
    return () => observer.disconnect()
  }, [])

  const labelColor = isDark ? '#d1d5db' : '#374151'
  const gridColor = isDark ? 'rgba(107,114,128,0.3)' : 'rgba(0,0,0,0.1)'
  const tickColor = isDark ? '#9ca3af' : '#6b7280'

  const scoreValues = [
    scores.jlpt,
    scores.itJapanese,
    scores.coreProgramming,
    scores.framework,
    scores.attitudeCulture,
  ]

  const pointColors = scoreValues.map(s => getPointColor(s, isDark))

  const data = {
    labels: LABELS,
    datasets: [
      {
        label: 'エンジニア能力',
        data: scoreValues,
        backgroundColor: isDark ? 'rgba(96, 165, 250, 0.15)' : 'rgba(59, 130, 246, 0.12)',
        borderColor: isDark ? 'rgba(96, 165, 250, 1)' : 'rgba(59, 130, 246, 1)',
        borderWidth: 2,
        pointBackgroundColor: pointColors,
        pointBorderColor: isDark ? '#1f2937' : '#fff',
        pointRadius: 5,
        pointHoverRadius: 7,
      },
      {
        label: '派遣基準 (Bランク)',
        data: [70, 70, 70, 70, 70],
        borderColor: 'rgba(245, 158, 11, 0.6)',
        borderDash: [6, 4],
        borderWidth: 2,
        backgroundColor: 'transparent',
        pointRadius: 0,
        pointHoverRadius: 0,
      },
    ],
  }

  const options = {
    responsive: true,
    maintainAspectRatio: true,
    scales: {
      r: {
        min: 0,
        max: 100,
        ticks: {
          stepSize: 10,
          display: true,
          color: tickColor,
          backdropColor: 'transparent',
          font: { size: 9 },
        },
        grid: {
          color: gridColor,
        },
        angleLines: {
          color: gridColor,
        },
        pointLabels: {
          font: { size: 12 },
          color: labelColor,
        },
      },
    },
    plugins: {
      legend: {
        display: true,
        position: 'bottom' as const,
        labels: {
          color: labelColor,
          font: { size: 11 },
          usePointStyle: true,
          padding: 16,
        },
      },
      tooltip: {
        callbacks: {
          label: (context: { datasetIndex: number; dataIndex: number; raw: unknown }) => {
            if (context.datasetIndex === 1) return '派遣基準: 70点 (B)'
            const score = context.raw as number
            const grade = getGrade(score)
            return `${LABELS[context.dataIndex]}: ${score}点 (${grade})`
          },
        },
      },
    },
  }

  return <Radar ref={chartRef} data={data} options={options} />
}
