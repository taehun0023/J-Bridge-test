'use client'

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

export default function RadarChart({ scores }: RadarChartProps) {
  const data = {
    labels: ['JLPT', 'IT 일본어', '기본 프로그래밍', '프레임워크', '태도/문화'],
    datasets: [
      {
        label: '파견 준비도',
        data: [
          scores.jlpt,
          scores.itJapanese,
          scores.coreProgramming,
          scores.framework,
          scores.attitudeCulture,
        ],
        backgroundColor: 'rgba(59, 130, 246, 0.2)',
        borderColor: 'rgba(59, 130, 246, 1)',
        borderWidth: 2,
        pointBackgroundColor: 'rgba(59, 130, 246, 1)',
        pointBorderColor: '#fff',
        pointRadius: 4,
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
          stepSize: 20,
          display: false,
        },
        pointLabels: {
          font: { size: 12 },
        },
      },
    },
    plugins: {
      legend: { display: false },
    },
  }

  return <Radar data={data} options={options} />
}
