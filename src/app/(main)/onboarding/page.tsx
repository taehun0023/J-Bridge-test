'use client'

import { useState } from 'react'
import { savePreferences } from '@/app/actions/assessment'

const codingOptions = [
  { value: 'java', label: 'Java', desc: 'Spring Boot基盤のサーバー開発' },
  { value: 'javascript', label: 'JavaScript', desc: 'React基盤のフロントエンド開発' },
]

export default function OnboardingPage() {
  const [selectedCoding, setSelectedCoding] = useState('')
  const [error, setError] = useState('')
  const [pending, setPending] = useState(false)

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    if (!selectedCoding) return
    setPending(true)
    setError('')

    const formData = new FormData()
    formData.set('is_japanese', 'false')
    formData.set('target_coding_area', selectedCoding)

    const result = await savePreferences(formData)
    if (result?.error) {
      setError(result.error)
      setPending(false)
    }
  }

  return (
    <div className="mx-auto max-w-2xl py-8">
      <div className="text-center">
        <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
          <span className="text-indigo-500">J</span>-Bridgeへようこそ！
        </h1>
        <p className="mt-2 text-zinc-600 dark:text-zinc-400">基本設定を完了するとダッシュボードに移動します。</p>
      </div>

      <form onSubmit={handleSubmit} className="mt-8 space-y-8">
        <div>
          <h2 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">メインで使用する言語を選択してください</h2>
          <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">開発実務能力テストの出題内容が変わります</p>
          <div className="mt-4 grid gap-3 sm:grid-cols-2">
            {codingOptions.map((opt) => (
              <label
                key={opt.value}
                className={`flex cursor-pointer flex-col items-center gap-2 rounded-2xl border-2 p-6 text-center transition-colors backdrop-blur-md ${
                  selectedCoding === opt.value
                    ? 'border-indigo-500 bg-indigo-500/5 dark:bg-indigo-500/10'
                    : 'border-gray-200/60 dark:border-white/[0.08] hover:border-gray-300 dark:hover:border-white/[0.15]'
                }`}
              >
                <input
                  type="radio"
                  name="coding"
                  value={opt.value}
                  checked={selectedCoding === opt.value}
                  onChange={(e) => setSelectedCoding(e.target.value)}
                  className="sr-only"
                />
                <div className="text-lg font-bold text-zinc-900 dark:text-zinc-100">{opt.label}</div>
                <div className="text-sm text-zinc-500 dark:text-zinc-400">{opt.desc}</div>
              </label>
            ))}
          </div>

          {error && (
            <p className="mt-4 text-sm text-red-500">{error}</p>
          )}

          <button
            type="submit"
            disabled={!selectedCoding || pending}
            className="mt-6 w-full rounded-xl bg-indigo-600 py-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
          >
            {pending ? '保存中...' : '確認'}
          </button>
        </div>
      </form>
    </div>
  )
}
