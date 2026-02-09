'use server'

import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'

export async function completeOnboarding(formData: FormData) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) {
    return { error: '인증이 필요합니다' }
  }

  const targetJlptLevel = formData.get('target_jlpt_level') as string
  const targetCodingArea = formData.get('target_coding_area') as string

  const validJlptLevels = ['N5', 'N4', 'N3', 'N2', 'N1']
  const validCodingAreas = ['java', 'javascript', 'sql']

  if (!validJlptLevels.includes(targetJlptLevel)) {
    return { error: '유효한 JLPT 레벨을 선택해주세요' }
  }
  if (!validCodingAreas.includes(targetCodingArea)) {
    return { error: '유효한 코딩 분야를 선택해주세요' }
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
    return { error: '저장 중 오류가 발생했습니다' }
  }

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}
