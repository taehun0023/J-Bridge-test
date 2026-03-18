import Link from 'next/link'
import { ArrowRight } from 'lucide-react'

const TRACKS = [
  { label: 'Java トラック', description: 'Java基礎・Spring Boot・SQL', track: 'java' },
  { label: 'JavaScript トラック', description: 'JavaScript基礎・React・SQL', track: 'javascript' },
] as const

export default function DevTestBlock() {
  return (
    <div className="max-w-2xl space-y-4">
      <div>
        <h2 className="text-lg font-semibold text-gray-900 dark:text-white">理解度テスト</h2>
        <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
          ランダム出題・難易度別配分で出題されます
        </p>
      </div>

      <div className="space-y-3">
        {TRACKS.map(t => (
          <Link
            key={t.track}
            href={`/dev/quiz?track=${t.track}`}
            className="group block"
          >
            <div className="rounded-xl border border-gray-200 p-4 transition-all hover:shadow-md dark:border-gray-700">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="font-semibold text-gray-900 dark:text-white">{t.label}</h3>
                  <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">{t.description}</p>
                </div>
                <span className="inline-flex items-center gap-1.5 text-sm font-medium text-indigo-600 dark:text-indigo-400">
                  テスト一覧へ
                  <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
                </span>
              </div>
            </div>
          </Link>
        ))}
      </div>
    </div>
  )
}
