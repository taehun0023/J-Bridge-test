'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'

export async function updateUserRole(userId: string, role: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
    .from('profiles')
    .update({ role, updated_at: new Date().toISOString() })
    .eq('id', userId)

  if (error) return { error: error.message }
  revalidatePath('/admin/users')
  return { success: true }
}

export async function createUserAccount(formData: FormData) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const email = formData.get('email') as string
  const password = formData.get('password') as string
  const fullName = formData.get('full_name') as string
  const role = formData.get('role') as string

  if (!email || !password || !fullName) {
    return { error: '必須フィールドをすべて入力してください' }
  }

  // Create auth user via admin API (requires service role key)
  const { data: authData, error: authError } = await auth.serviceClient.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { full_name: fullName },
  })

  if (authError) return { error: authError.message }

  // Update profile role if not default mentee
  if (authData.user && role !== 'mentee') {
    const { error: updateError } = await auth.serviceClient
      .from('profiles')
      .update({ role, full_name: fullName })
      .eq('id', authData.user.id)

    if (updateError) {
      return { error: `ユーザーは作成されましたが、ロール設定に失敗しました: ${updateError.message}` }
    }
  }

  revalidatePath('/admin/users')
  return { success: true }
}
