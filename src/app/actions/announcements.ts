'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdmin, requireAuth } from '@/lib/auth-helpers'
import { logAuditEvent } from '@/app/actions/audit'

const BLOCKED_EXTENSIONS = new Set([
  '.exe', '.bat', '.sh', '.cmd', '.ps1', '.js', '.vbs', '.scr',
  '.msi', '.com', '.pif', '.hta', '.wsf', '.wsh',
])

const MAX_FILE_SIZE = 25 * 1024 * 1024
const MAX_FILES = 5

export async function createAnnouncement(formData: FormData) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const title = formData.get('title') as string
  const body = formData.get('body') as string
  const files = formData.getAll('files') as File[]

  if (!title?.trim() || !body?.trim()) {
    return { error: 'タイトルと本文を入力してください' }
  }

  const validFiles = files.filter(f => f.size > 0)
  if (validFiles.length > MAX_FILES) {
    return { error: `添付ファイルは最大${MAX_FILES}個までです` }
  }
  for (const f of validFiles) {
    if (f.size > MAX_FILE_SIZE) {
      return { error: `${f.name} のサイズが25MBを超えています` }
    }
    const ext = '.' + f.name.split('.').pop()?.toLowerCase()
    if (BLOCKED_EXTENSIONS.has(ext)) {
      return { error: `${f.name} は許可されていないファイル形式です` }
    }
  }

  const { data: announcement, error } = await auth.serviceClient
    .from('announcements')
    .insert({ title: title.trim(), body: body.trim(), author_id: auth.user.id })
    .select('id')
    .single()

  if (error) return { error: error.message }

  if (validFiles.length > 0) {
    for (const file of validFiles) {
      const filePath = `${announcement.id}/${crypto.randomUUID()}_${file.name}`
      const { error: uploadError } = await auth.serviceClient.storage
        .from('announcement-attachments')
        .upload(filePath, file, { contentType: file.type })

      if (uploadError) continue

      await auth.serviceClient.from('announcement_attachments').insert({
        announcement_id: announcement.id,
        file_path: filePath,
        file_name: file.name,
        file_size: file.size,
        mime_type: file.type || null,
      })
    }
  }

  await logAuditEvent(auth.user.id, 'create', 'announcements', announcement.id, null, { title })

  revalidatePath('/announcements')
  revalidatePath('/dashboard')
  return { success: true, id: announcement.id }
}

export async function updateAnnouncement(id: string, formData: FormData) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const title = formData.get('title') as string
  const body = formData.get('body') as string
  const newFiles = formData.getAll('new_files') as File[]

  if (!title?.trim() || !body?.trim()) {
    return { error: 'タイトルと本文を入力してください' }
  }

  const { error } = await auth.serviceClient
    .from('announcements')
    .update({ title: title.trim(), body: body.trim(), updated_at: new Date().toISOString() })
    .eq('id', id)

  if (error) return { error: error.message }

  const validFiles = newFiles.filter(f => f.size > 0)
  for (const file of validFiles) {
    if (file.size > MAX_FILE_SIZE) continue
    const ext = '.' + file.name.split('.').pop()?.toLowerCase()
    if (BLOCKED_EXTENSIONS.has(ext)) continue

    const filePath = `${id}/${crypto.randomUUID()}_${file.name}`
    const { error: uploadError } = await auth.serviceClient.storage
      .from('announcement-attachments')
      .upload(filePath, file, { contentType: file.type })

    if (uploadError) continue

    await auth.serviceClient.from('announcement_attachments').insert({
      announcement_id: id,
      file_path: filePath,
      file_name: file.name,
      file_size: file.size,
      mime_type: file.type || null,
    })
  }

  await logAuditEvent(auth.user.id, 'update', 'announcements', id, null, { title })

  revalidatePath('/announcements')
  revalidatePath(`/announcements/${id}`)
  revalidatePath('/dashboard')
  return { success: true }
}

export async function deleteAnnouncement(id: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { data: attachments } = await auth.serviceClient
    .from('announcement_attachments')
    .select('file_path')
    .eq('announcement_id', id)

  if (attachments?.length) {
    await auth.serviceClient.storage
      .from('announcement-attachments')
      .remove(attachments.map(a => a.file_path))
  }

  const { error } = await auth.serviceClient
    .from('announcements')
    .delete()
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'announcements', id, null, null)

  revalidatePath('/announcements')
  revalidatePath('/dashboard')
  return { success: true }
}

export async function markAnnouncementRead(announcementId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const

  await auth.supabase
    .from('announcement_reads')
    .upsert({ announcement_id: announcementId, user_id: auth.user.id }, { onConflict: 'announcement_id,user_id' })

  revalidatePath('/announcements')
  revalidatePath('/dashboard')
  return { success: true }
}

export async function getAttachmentUrl(filePath: string, fileName: string) {
  const supabase = await createClient()
  const { data } = await supabase.storage
    .from('announcement-attachments')
    .createSignedUrl(filePath, 3600, { download: fileName })

  return data?.signedUrl ?? null
}
