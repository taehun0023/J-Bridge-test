'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'

/**
 * 첫 로그인 온보딩 = 본인 비밀번호 변경. 관리자가 발급한 임시 비밀번호를 사용자가 직접 교체해야
 * is_onboarded=true 가 되어 대시보드로 진입할 수 있다. (未オンボーディング 해제 기준)
 */
export async function completeOnboarding(newPassword: string): Promise<{ ok: true } | { error: string }> {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error ?? '認証が必要です' }
  const { supabase, user } = auth

  if (!newPassword || newPassword.length < 8) {
    return { error: 'パスワードは8文字以上で入力してください' }
  }

  const { error: pwErr } = await supabase.auth.updateUser({ password: newPassword })
  if (pwErr) return { error: pwErr.message }

  const { error } = await supabase
    .from('profiles')
    .update({ is_onboarded: true, updated_at: new Date().toISOString() })
    .eq('id', user.id)
  if (error) return { error: '保存中にエラーが発生しました' }

  revalidatePath('/', 'layout')
  return { ok: true }
}
