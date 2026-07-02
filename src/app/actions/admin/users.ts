'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { logAuditEvent } from '@/app/actions/audit'
import { setMenteeMentorForSpecialty, type MentorSpecialty } from '@/lib/mentor-helpers'

export async function updateUserRole(userId: string, role: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  // Fetch old data for audit
  const { data: oldData } = await auth.serviceClient
    .from('profiles')
    .select('role, mentor_specialty')
    .eq('id', userId)
    .single()

  // Clear mentor_specialty when role is not mentor
  const updateData: Record<string, unknown> = { role, updated_at: new Date().toISOString() }
  if (role !== 'mentor') {
    updateData.mentor_specialty = null
  }

  const { error } = await auth.serviceClient
    .from('profiles')
    .update(updateData)
    .eq('id', userId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'profiles', userId, oldData, { ...oldData, ...updateData })

  revalidatePath('/admin/users')
  return { success: true }
}

export async function updateMentorSpecialty(userId: string, specialty: string | null) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  if (specialty !== null && specialty !== 'japanese' && specialty !== 'technical') {
    return { error: '無効な専門分野です' }
  }

  // Fetch old data for audit
  const { data: oldData } = await auth.serviceClient
    .from('profiles')
    .select('mentor_specialty')
    .eq('id', userId)
    .single()

  const { error } = await auth.serviceClient
    .from('profiles')
    .update({ mentor_specialty: specialty, updated_at: new Date().toISOString() })
    .eq('id', userId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'profiles', userId, oldData, { mentor_specialty: specialty })

  revalidatePath('/admin/users')
  return { success: true }
}

export async function deleteUser(userId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  if (userId === auth.user.id) {
    return { error: '自分のアカウントは削除できません' }
  }

  const { data: oldData } = await auth.serviceClient
    .from('profiles')
    .select('email, full_name, role')
    .eq('id', userId)
    .single()

  const { error } = await auth.serviceClient.auth.admin.deleteUser(userId)
  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'profiles', userId, oldData, null)

  revalidatePath('/admin/users')
  return { success: true }
}

/** 선택한 계정 일괄 삭제. 본인 계정은 자동 제외. */
export async function bulkDeleteUsers(userIds: string[]) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const ids = [...new Set(userIds)].filter(id => id && id !== auth.user.id)
  if (ids.length === 0) return { error: '削除対象がありません' }

  let deleted = 0
  const errors: string[] = []
  for (const id of ids) {
    const { data: oldData } = await auth.serviceClient
      .from('profiles')
      .select('email, full_name, role')
      .eq('id', id)
      .single()

    const { error } = await auth.serviceClient.auth.admin.deleteUser(id)
    if (error) {
      errors.push(`${oldData?.email ?? id}: ${error.message}`)
      continue
    }
    await logAuditEvent(auth.user.id, 'delete', 'profiles', id, oldData, null)
    deleted++
  }

  revalidatePath('/admin/users')
  return { success: true, deleted, errors }
}

export async function assignMentor(
  menteeId: string,
  mentorId: string | null,
  specialty: MentorSpecialty,
) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const res = await setMenteeMentorForSpecialty(auth.serviceClient, menteeId, mentorId, specialty, auth.user.id)
  if (res.error) return { error: res.error }

  await logAuditEvent(
    auth.user.id,
    mentorId ? 'update' : 'delete',
    'mentor_mentee_assignments',
    menteeId,
    null,
    { specialty, mentor_id: mentorId },
  )

  revalidatePath('/admin/users')
  return { success: true }
}

export interface AdminUserUpdate {
  full_name?: string | null
  role?: string
  mentor_specialty?: string | null
  japanese_mentor_id?: string | null
  tech_mentor_id?: string | null
  target_certification?: string | null
  jlpt_level?: string | null
  it_certifications?: string | null
  new_password?: string | null
}

export async function updateUserByAdmin(userId: string, payload: AdminUserUpdate) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  if (payload.new_password != null && payload.new_password !== '' && payload.new_password.length < 6) {
    return { error: 'パスワードは6文字以上必要です' }
  }

  const { data: oldData } = await auth.serviceClient
    .from('profiles')
    .select('full_name, role, mentor_specialty, target_certification, jlpt_level, it_certifications')
    .eq('id', userId)
    .single()

  const update: Record<string, unknown> = { updated_at: new Date().toISOString() }
  if (payload.full_name !== undefined) update.full_name = payload.full_name
  if (payload.target_certification !== undefined) update.target_certification = payload.target_certification
  if (payload.jlpt_level !== undefined) update.jlpt_level = payload.jlpt_level
  if (payload.it_certifications !== undefined) update.it_certifications = payload.it_certifications
  if (payload.role !== undefined) {
    update.role = payload.role
    update.mentor_specialty = payload.role === 'mentor' ? (payload.mentor_specialty ?? null) : null
  } else if (payload.mentor_specialty !== undefined) {
    update.mentor_specialty = payload.mentor_specialty
  }

  const { error: profErr } = await auth.serviceClient
    .from('profiles')
    .update(update)
    .eq('id', userId)
  if (profErr) return { error: profErr.message }

  // 担当メンター 배정 (mentee 일 때만 의미, 일본어/기술 슬롯별) — role 최종값 기준
  const finalRole = payload.role ?? oldData?.role
  if (finalRole === 'mentee') {
    if (payload.japanese_mentor_id !== undefined) {
      const r = await setMenteeMentorForSpecialty(auth.serviceClient, userId, payload.japanese_mentor_id, 'japanese', auth.user.id)
      if (r.error) return { error: r.error }
    }
    if (payload.tech_mentor_id !== undefined) {
      const r = await setMenteeMentorForSpecialty(auth.serviceClient, userId, payload.tech_mentor_id, 'technical', auth.user.id)
      if (r.error) return { error: r.error }
    }
  }

  // 비밀번호 초기화
  if (payload.new_password) {
    const { error } = await auth.serviceClient.auth.admin.updateUserById(userId, {
      password: payload.new_password,
    })
    if (error) return { error: error.message }
  }

  await logAuditEvent(auth.user.id, 'update', 'profiles', userId, oldData, update)

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

  if (authData.user) {
    await logAuditEvent(auth.user.id, 'create', 'profiles', authData.user.id, null, { email, full_name: fullName, role })
  }

  revalidatePath('/admin/users')
  return { success: true }
}
