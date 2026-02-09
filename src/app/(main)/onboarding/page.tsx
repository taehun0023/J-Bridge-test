'use client'

import { useState } from 'react'
import { completeOnboarding } from '@/app/actions/onboarding'

const jlptOptions = [
  { value: 'N5', label: 'N5', desc: '기초 일본어 (한자 100자, 어휘 800)' },
  { value: 'N4', label: 'N4', desc: '초급 일본어 (한자 300자, 어휘 1500)' },
  { value: 'N3', label: 'N3', desc: '중급 일본어 (한자 650자, 어휘 3750)' },
  { value: 'N2', label: 'N2', desc: '중상급 일본어 (한자 1000자, 어휘 6000)' },
  { value: 'N1', label: 'N1', desc: '상급 일본어 (한자 2000자, 어휘 10000)' },
]

const codingOptions = [
  { value: 'java', label: 'Java', desc: 'Spring Boot 기반 서버 개발' },
  { value: 'javascript', label: 'JavaScript', desc: 'React 기반 프론트엔드 개발' },
  { value: 'sql', label: 'SQL', desc: '데이터베이스 설계 및 쿼리' },
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

    const result = await completeOnboarding(formData)
    if (result?.error) {
      setError(result.error)
      setPending(false)
    }
  }

  return (
    <div className="mx-auto max-w-2xl py-8">
      <div className="text-center">
        <h1 className="text-2xl font-bold text-gray-900">J-Bridge에 오신 것을 환영합니다!</h1>
        <p className="mt-2 text-gray-600">학습 목표를 설정해주세요. 맞춤형 학습 경로를 제공해드립니다.</p>
      </div>

      <form onSubmit={handleSubmit} className="mt-8 space-y-8">
        {/* JLPT 목표 */}
        <div>
          <h2 className="text-lg font-semibold text-gray-900">목표 JLPT 레벨</h2>
          <p className="mt-1 text-sm text-gray-500">달성하고자 하는 JLPT 급수를 선택하세요</p>
          <div className="mt-4 grid gap-3">
            {jlptOptions.map((opt) => (
              <label
                key={opt.value}
                className={`flex cursor-pointer items-center gap-4 rounded-xl border-2 p-4 transition-colors ${
                  selectedJlpt === opt.value
                    ? 'border-blue-600 bg-blue-50'
                    : 'border-gray-200 hover:border-gray-300'
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
                  selectedJlpt === opt.value ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-700'
                }`}>
                  {opt.label}
                </div>
                <div>
                  <div className="font-medium text-gray-900">{opt.label}</div>
                  <div className="text-sm text-gray-500">{opt.desc}</div>
                </div>
              </label>
            ))}
          </div>
        </div>

        {/* 코딩 분야 */}
        <div>
          <h2 className="text-lg font-semibold text-gray-900">주력 코딩 분야</h2>
          <p className="mt-1 text-sm text-gray-500">주로 학습할 프로그래밍 언어를 선택하세요</p>
          <div className="mt-4 grid gap-3 sm:grid-cols-3">
            {codingOptions.map((opt) => (
              <label
                key={opt.value}
                className={`flex cursor-pointer flex-col items-center gap-2 rounded-xl border-2 p-6 text-center transition-colors ${
                  selectedCoding === opt.value
                    ? 'border-blue-600 bg-blue-50'
                    : 'border-gray-200 hover:border-gray-300'
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
                <div className="text-lg font-bold text-gray-900">{opt.label}</div>
                <div className="text-sm text-gray-500">{opt.desc}</div>
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
          {pending ? '저장 중...' : '학습 시작하기'}
        </button>
      </form>
    </div>
  )
}
