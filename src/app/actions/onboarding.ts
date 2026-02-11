'use server'

import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'

export async function completeOnboarding(formData: FormData) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) {
    return { error: '認証が必要です' }
  }

  const targetJlptLevel = formData.get('target_jlpt_level') as string
  const targetCodingArea = formData.get('target_coding_area') as string

  const validJlptLevels = ['N5', 'N4', 'N3', 'N2', 'N1']
  const validCodingAreas = ['java', 'javascript']

  if (!validJlptLevels.includes(targetJlptLevel)) {
    return { error: '有効なJLPTレベルを選択してください' }
  }
  if (!validCodingAreas.includes(targetCodingArea)) {
    return { error: '有効なコーディング分野を選択してください' }
  }

  const { error } = await supabase
    .from('profiles')
    .update({
      target_jlpt_level: targetJlptLevel,
      target_coding_area: targetCodingArea,
      is_onboarded: true,
      updated_at: new Date().toISOString(),
    })
    .eq('id', user.id)

  if (error) {
    return { error: '保存中にエラーが発生しました' }
  }

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}
