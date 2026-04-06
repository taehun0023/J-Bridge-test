'use client'

import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'

export default function ResetPasswordPage() {
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [ready, setReady] = useState(false)
  const [success, setSuccess] = useState(false)
  const router = useRouter()
  const supabase = createClient()

  useEffect(() => {
    // Supabase browser client auto-detects #access_token in hash
    // Listen for PASSWORD_RECOVERY event to confirm session is ready
    const { data: { subscription } } = supabase.auth.onAuthStateChange((event) => {
      if (event === 'PASSWORD_RECOVERY') {
        setReady(true)
      }
    })

    // Also check if session already exists (e.g., page refresh after hash processed)
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session) {
        setReady(true)
      }
    })

    return () => subscription.unsubscribe()
  }, [supabase.auth])

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError(null)

    if (password.length < 6) {
      setError('パスワードは6文字以上で入力してください')
      return
    }

    if (password !== confirmPassword) {
      setError('パスワードが一致しません')
      return
    }

    setLoading(true)

    const { error: updateError } = await supabase.auth.updateUser({
      password,
    })

    if (updateError) {
      setError('パスワードの更新に失敗しました。もう一度お試しください。')
      setLoading(false)
      return
    }

    // Sign out so user logs in with new password
    await supabase.auth.signOut()
    setSuccess(true)
  }

  if (success) {
    return (
      <div className="rounded-2xl border border-white/10 bg-white/[0.07] p-8 shadow-2xl backdrop-blur-xl">
        <div className="mb-6 text-center">
          <h1 className="text-2xl font-bold text-white">パスワード更新完了</h1>
          <p className="mt-3 text-sm text-gray-400">
            パスワードが正常に更新されました。新しいパスワードでログインしてください。
          </p>
        </div>
        <button
          onClick={() => router.push('/login')}
          className="w-full rounded-xl bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors"
        >
          ログインページへ
        </button>
      </div>
    )
  }

  if (!ready) {
    return (
      <div className="rounded-2xl border border-white/10 bg-white/[0.07] p-8 shadow-2xl backdrop-blur-xl">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-white">パスワードリセット</h1>
          <p className="mt-3 text-sm text-gray-400">
            認証情報を確認中です...
          </p>
          <div className="mt-4 flex justify-center">
            <div className="h-6 w-6 animate-spin rounded-full border-2 border-indigo-500 border-t-transparent" />
          </div>
          <p className="mt-6 text-xs text-gray-500">
            しばらく経っても表示されない場合は、リセットリンクの有効期限が切れている可能性があります。
            <br />管理者に再発行を依頼してください。
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="rounded-2xl border border-white/10 bg-white/[0.07] p-8 shadow-2xl backdrop-blur-xl">
      <div className="mb-8 text-center">
        <h1 className="text-2xl font-bold text-white">新しいパスワード設定</h1>
        <p className="mt-2 text-sm text-gray-400">
          新しいパスワードを入力してください
        </p>
      </div>

      <form onSubmit={handleSubmit} className="space-y-5">
        <div>
          <label htmlFor="password" className="block text-sm font-medium text-gray-300">
            新しいパスワード
          </label>
          <input
            id="password"
            type="password"
            required
            minLength={6}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="mt-1 block w-full rounded-xl border border-white/10 bg-white/[0.06] px-3 py-2.5 text-sm text-white shadow-sm placeholder-gray-500 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            placeholder="6文字以上"
          />
        </div>

        <div>
          <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-300">
            パスワード確認
          </label>
          <input
            id="confirmPassword"
            type="password"
            required
            minLength={6}
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            className="mt-1 block w-full rounded-xl border border-white/10 bg-white/[0.06] px-3 py-2.5 text-sm text-white shadow-sm placeholder-gray-500 focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            placeholder="もう一度入力"
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
          {loading ? '更新中...' : 'パスワードを更新'}
        </button>
      </form>
    </div>
  )
}
