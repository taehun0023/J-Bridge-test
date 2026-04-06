'use client'

import { signIn } from '@/app/actions/auth'
import { useEffect, useState } from 'react'

export default function LoginPage() {
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)

  // Detect password recovery hash and redirect to reset-password page
  useEffect(() => {
    const hash = window.location.hash
    if (hash && hash.includes('type=recovery')) {
      // Preserve hash fragment so Supabase client on reset-password page can process it
      window.location.href = '/reset-password' + hash
    }
  }, [])

  async function handleSubmit(formData: FormData) {
    setLoading(true)
    setError(null)
    const result = await signIn(formData)
    if (result?.error) {
      setError(result.error)
      setLoading(false)
    }
  }

  return (
    <div className="rounded-2xl border border-white/10 bg-white/[0.07] p-8 shadow-2xl backdrop-blur-xl">
      <div className="mb-8 text-center">
        <h1 className="text-3xl font-bold text-white">
          <span className="text-indigo-400">J</span>-Bridge
        </h1>
        <p className="mt-2 text-sm text-gray-400">
          Japan IT Engineer Dispatch Platform
        </p>
      </div>

      <form action={handleSubmit} className="space-y-5">
        <div>
          <label htmlFor="email" className="block text-sm font-medium text-gray-300">
            メールアドレス
          </label>
          <input
            id="email"
            name="email"
            type="email"
            required
            className="mt-1 block w-full rounded-xl border border-white/10 bg-white/[0.06] px-3 py-2.5 text-sm text-white shadow-sm placeholder-gray-500 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            placeholder="name@company.com"
          />
        </div>

        <div>
          <label htmlFor="password" className="block text-sm font-medium text-gray-300">
            パスワード
          </label>
          <input
            id="password"
            name="password"
            type="password"
            required
            className="mt-1 block w-full rounded-xl border border-white/10 bg-white/[0.06] px-3 py-2.5 text-sm text-white shadow-sm placeholder-gray-500 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            placeholder="••••••••"
          />
        </div>

        {error && (
          <p className="text-sm text-red-400">{error}</p>
        )}

        <button
          type="submit"
          disabled={loading}
          className="w-full rounded-xl bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-black disabled:opacity-50 transition-colors"
        >
          {loading ? 'ログイン中...' : 'ログイン'}
        </button>
      </form>

      <p className="mt-6 text-center text-xs text-gray-500">
        アカウントがない場合は管理者にお問い合わせください
      </p>
    </div>
  )
}
