'use server'

import { createClient } from '@/lib/supabase/server'
import { loginSchema } from '@/lib/validations/auth'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'

export async function signIn(formData: FormData) {
  const supabase = await createClient()

  let email = String(formData.get('email') ?? '').trim()
  // 'admin' 단독 입력은 관리자 계정 이메일로 매핑 (이메일 형식 예외 허용)
  if (email.toLowerCase() === 'admin') email = 'admin@admin.com'

  const parsed = loginSchema.safeParse({
    email,
    password: formData.get('password'),
  })

  if (!parsed.success) {
    return { error: parsed.error.issues[0].message }
  }

  const { error } = await supabase.auth.signInWithPassword(parsed.data)

  if (error) {
    return { error: 'メールアドレスまたはパスワードが正しくありません' }
  }

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}

export async function signOut() {
  const supabase = await createClient()
  await supabase.auth.signOut()
  revalidatePath('/', 'layout')
  redirect('/login')
}
