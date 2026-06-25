'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { completeOnboarding } from '@/app/actions/onboarding'

export default function OnboardingPage() {
  const router = useRouter()
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [error, setError] = useState('')
  const [pending, setPending] = useState(false)

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setError('')
    if (password.length < 8) { setError('パスワードは8文字以上で入力してください'); return }
    if (password !== confirm) { setError('パスワードが一致しません'); return }

    setPending(true)
    const result = await completeOnboarding(password)
    if ('error' in result) {
      setError(result.error)
      setPending(false)
      return
    }
    router.replace('/dashboard')
    router.refresh()
  }

  const inputCls = 'mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2.5 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100'

  return (
    <div className="mx-auto max-w-md py-10">
      <div className="text-center">
        <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
          <span className="text-indigo-500">J</span>-Bridgeへようこそ！
        </h1>
        <p className="mt-2 text-sm text-zinc-600 dark:text-zinc-400">
          安全のため、最初のログイン時にパスワードをご自身で変更してください。<br />変更が完了するとダッシュボードに移動します。
        </p>
      </div>

      <form onSubmit={handleSubmit} className="mt-8 space-y-4">
        <div>
          <label className="text-sm font-medium text-zinc-700 dark:text-zinc-300">新しいパスワード</label>
          <input type="password" value={password} onChange={e => setPassword(e.target.value)} autoComplete="new-password" placeholder="8文字以上" className={inputCls} />
        </div>
        <div>
          <label className="text-sm font-medium text-zinc-700 dark:text-zinc-300">新しいパスワード（確認）</label>
          <input type="password" value={confirm} onChange={e => setConfirm(e.target.value)} autoComplete="new-password" className={inputCls} />
        </div>

        {error && <p className="text-sm text-red-500">{error}</p>}

        <button
          type="submit"
          disabled={pending || !password || !confirm}
          className="w-full rounded-xl bg-indigo-600 py-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 disabled:cursor-not-allowed disabled:opacity-50 transition-colors"
        >
          {pending ? '変更中...' : 'パスワードを変更して開始'}
        </button>
      </form>
    </div>
  )
}
