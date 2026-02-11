'use client'

import { useState } from 'react'
import { savePreferences } from '@/app/actions/assessment'

const jlptOptions = [
  { value: 'N5', label: 'N5', desc: '基礎日本語（漢字100字、語彙800）' },
  { value: 'N4', label: 'N4', desc: '初級日本語（漢字300字、語彙1500）' },
  { value: 'N3', label: 'N3', desc: '中級日本語（漢字650字、語彙3750）' },
  { value: 'N2', label: 'N2', desc: '中上級日本語（漢字1000字、語彙6000）' },
  { value: 'N1', label: 'N1', desc: '上級日本語（漢字2000字、語彙10000）' },
]

const codingOptions = [
  { value: 'java', label: 'Java', desc: 'Spring Boot基盤のサーバー開発' },
  { value: 'javascript', label: 'JavaScript', desc: 'React基盤のフロントエンド開発' },
  { value: 'sql', label: 'SQL', desc: 'データベース設計とクエリ' },
]

export default function OnboardingPage() {
  const [selectedJlpt, setSelectedJlpt] = useState('')
  const [selectedCoding, setSelectedCoding] = useState('')
  const [error, setError] = useState('')
  const [pending, setPending] = useState(false)

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setPending(true)
    setError('')

    const formData = new FormData()
    formData.set('target_jlpt_level', selectedJlpt)
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">J-Bridgeへようこそ！</h1>
        <p className="mt-2 text-gray-600 dark:text-gray-400">学習目標を設定した後、初期等級テストを行います。</p>
        <div className="mt-3 inline-flex items-center gap-2 rounded-full bg-blue-50 dark:bg-blue-900/30 px-4 py-1.5 text-sm text-blue-700 dark:text-blue-300">
          <span className="font-medium">ステップ 1/7</span>
          <span className="text-blue-400">|</span>
          <span>環境設定</span>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="mt-8 space-y-8">
        {/* JLPT目標 */}
        <div>
          <h2 className="text-lg font-semibold text-gray-900 dark:text-white">目標JLPTレベル</h2>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">達成したいJLPT級数を選択してください</p>
          <div className="mt-4 grid gap-3">
            {jlptOptions.map((opt) => (
              <label
                key={opt.value}
                className={`flex cursor-pointer items-center gap-4 rounded-xl border-2 p-4 transition-colors ${
                  selectedJlpt === opt.value
                    ? 'border-blue-600 bg-blue-50 dark:bg-blue-900/20'
                    : 'border-gray-200 dark:border-gray-700 hover:border-gray-300 dark:hover:border-gray-600'
                }`}
              >
                <input
                  type="radio"
                  name="jlpt"
                  value={opt.value}
                  checked={selectedJlpt === opt.value}
                  onChange={(e) => setSelectedJlpt(e.target.value)}
                  className="sr-only"
                />
                <div className={`flex h-10 w-10 items-center justify-center rounded-lg text-sm font-bold ${
                  selectedJlpt === opt.value ? 'bg-blue-600 text-white' : 'bg-gray-100 dark:bg-gray-800 text-gray-700 dark:text-gray-300'
                }`}>
                  {opt.label}
                </div>
                <div>
                  <div className="font-medium text-gray-900 dark:text-white">{opt.label}</div>
                  <div className="text-sm text-gray-500 dark:text-gray-400">{opt.desc}</div>
                </div>
              </label>
            ))}
          </div>
        </div>

        {/* コーディング分野 */}
        <div>
          <h2 className="text-lg font-semibold text-gray-900 dark:text-white">主力コーディング分野</h2>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">主に学習するプログラミング言語を選択してください</p>
          <div className="mt-4 grid gap-3 sm:grid-cols-3">
            {codingOptions.map((opt) => (
              <label
                key={opt.value}
                className={`flex cursor-pointer flex-col items-center gap-2 rounded-xl border-2 p-6 text-center transition-colors ${
                  selectedCoding === opt.value
                    ? 'border-blue-600 bg-blue-50 dark:bg-blue-900/20'
                    : 'border-gray-200 dark:border-gray-700 hover:border-gray-300 dark:hover:border-gray-600'
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
                <div className="text-lg font-bold text-gray-900 dark:text-white">{opt.label}</div>
                <div className="text-sm text-gray-500 dark:text-gray-400">{opt.desc}</div>
              </label>
            ))}
          </div>
        </div>

        {error && (
          <p className="text-sm text-red-600">{error}</p>
        )}

        <button
          type="submit"
          disabled={!selectedJlpt || !selectedCoding || pending}
          className="w-full rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {pending ? '保存中...' : '次へ：初期等級テスト開始'}
        </button>
      </form>
    </div>
  )
}
