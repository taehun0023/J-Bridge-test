'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import type { UserRole } from '@/lib/supabase/types'

/**
 * テスト用ロール切替。テスト環境(Supabase ref)でのみ動作する。
 * 本番(honban)は別refのため、この関数は常に拒否される(権限昇格防止)。
 */
// 許可する Supabase ref: テスト(nyymasirfrawsxobmfwi) と ローカル(jpjvzlmwzeiyukqqbdit)。
// 本番(honban: wxhyczlwdmeelcshqgci)は含めない。
const ENABLED_SUPABASE_REFS = ['nyymasirfrawsxobmfwi', 'jpjvzlmwzeiyukqqbdit']
const VALID_ROLES: UserRole[] = ['admin', 'mentor', 'mentee']

// 'use server' ファイルでは export 関数は async 必須のため、内部ヘルパー(非 export)にする。
function isRoleSwitcherEnabled(): boolean {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL ?? ''
  return ENABLED_SUPABASE_REFS.some((ref) => url.includes(ref))
}

export async function switchMyRole(role: UserRole) {
  if (!isRoleSwitcherEnabled()) {
    return { error: 'この機能はテスト環境でのみ利用できます' }
  }
  if (!VALID_ROLES.includes(role)) {
    return { error: '不正なロールです' }
  }

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) return { error: '未認証です' }

  // 自分のプロフィールのみ更新 (profiles RLS: auth.uid() = id で許可)
  const { error } = await supabase
    .from('profiles')
    .update({ role, updated_at: new Date().toISOString() })
    .eq('id', user.id)

  if (error) return { error: error.message }

  revalidatePath('/', 'layout')
  return { success: true }
}
