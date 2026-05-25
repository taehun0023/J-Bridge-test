'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { logAuditEvent } from '@/app/actions/audit'

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

export async function assignMentor(menteeId: string, mentorId: string | null) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  if (mentorId) {
    const { error } = await auth.serviceClient
      .from('mentor_mentee_assignments')
      .upsert(
        { mentor_id: mentorId, mentee_id: menteeId, assigned_by: auth.user.id },
        { onConflict: 'mentor_id,mentee_id' }
      )
    if (error) return { error: error.message }

    await auth.serviceClient
      .from('mentor_mentee_assignments')
      .delete()
      .eq('mentee_id', menteeId)
      .neq('mentor_id', mentorId)

    await logAuditEvent(auth.user.id, 'update', 'mentor_mentee_assignments', menteeId, null, { mentor_id: mentorId })
  } else {
    await auth.serviceClient
      .from('mentor_mentee_assignments')
      .delete()
      .eq('mentee_id', menteeId)

    await logAuditEvent(auth.user.id, 'delete', 'mentor_mentee_assignments', menteeId, null, null)
  }

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
