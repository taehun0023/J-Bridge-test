'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'

/**
 * avatarsバケットが存在しない場合に作成します。
 */
async function ensureAvatarsBucket(supabase: Awaited<ReturnType<typeof import('@/lib/supabase/server').createClient>>) {
  // バケットの存在確認
  const { data: buckets } = await supabase.storage.listBuckets()
  const exists = buckets?.find((b) => b.name === 'avatars')
  if (exists) return { ok: true }

  // Service roleクライアントで作成を試行
  const adminClient = createServiceRoleClient()
  if (adminClient) {
    const { error } = await adminClient.storage.createBucket('avatars', {
      public: true,
      fileSizeLimit: 5 * 1024 * 1024,
      allowedMimeTypes: ['image/jpeg', 'image/png', 'image/gif', 'image/webp'],
    })
    if (error && !error.message.includes('already exists')) {
      return { ok: false, error: `バケット作成失敗: ${error.message}` }
    }
    return { ok: true }
  }

  // Service role keyがない場合は通常のクライアントで試行
  const { error } = await supabase.storage.createBucket('avatars', {
    public: true,
    fileSizeLimit: 5 * 1024 * 1024,
    allowedMimeTypes: ['image/jpeg', 'image/png', 'image/gif', 'image/webp'],
  })
  if (error && !error.message.includes('already exists')) {
    return {
      ok: false,
      error: `avatars Storageバケットを作成できません。Supabaseダッシュボード → Storageで"avatars"バケットをpublicで作成するか、.env.localにSUPABASE_SERVICE_ROLE_KEYを追加してください。`,
    }
  }
  return { ok: true }
}

export async function uploadAvatar(formData: FormData) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const file = formData.get('avatar') as File | null
  if (!file) {
    return { error: 'ファイルがありません' }
  }

  // ファイルサイズ制限 (5MB)
  if (file.size > 5 * 1024 * 1024) {
    return { error: 'ファイルサイズは5MB以下にしてください' }
  }

  // ファイルタイプ検証
  if (!file.type.startsWith('image/')) {
    return { error: '画像ファイルのみアップロード可能です' }
  }

  // バケット確認/作成
  const bucketResult = await ensureAvatarsBucket(supabase)
  if (!bucketResult.ok) {
    return { error: bucketResult.error }
  }

  const fileExt = file.name.split('.').pop()
  const fileName = `${user.id}-${Date.now()}.${fileExt}`
  const filePath = fileName

  // 既存アバター削除
  const { data: profile } = await supabase
    .from('profiles')
    .select('avatar_url')
    .eq('id', user.id)
    .single()

  if (profile?.avatar_url) {
    const urlParts = profile.avatar_url.split('/')
    const oldFileName = urlParts[urlParts.length - 1]
    if (oldFileName) {
      await supabase.storage.from('avatars').remove([oldFileName])
    }
  }

  // 新ファイルアップロード
  const { error: uploadError } = await supabase.storage
    .from('avatars')
    .upload(filePath, file, {
      cacheControl: '3600',
      upsert: false,
    })

  if (uploadError) {
    return { error: `アップロード失敗: ${uploadError.message}` }
  }

  // Public URLの取得
  const { data: { publicUrl } } = supabase.storage.from('avatars').getPublicUrl(filePath)

  // プロフィール更新
  const { error: updateError } = await supabase
    .from('profiles')
    .update({ avatar_url: publicUrl })
    .eq('id', user.id)

  if (updateError) {
    return { error: updateError.message }
  }

  revalidatePath('/profile')
  return { success: true, url: publicUrl }
}

export async function removeAvatar() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data: profile } = await supabase
    .from('profiles')
    .select('avatar_url')
    .eq('id', user.id)
    .single()

  if (profile?.avatar_url) {
    const urlParts = profile.avatar_url.split('/')
    const oldFileName = urlParts[urlParts.length - 1]
    if (oldFileName) {
      await supabase.storage.from('avatars').remove([oldFileName])
    }
  }

  const { error } = await supabase
    .from('profiles')
    .update({ avatar_url: null })
    .eq('id', user.id)

  if (error) {
    return { error: error.message }
  }

  revalidatePath('/profile')
  return { success: true }
}
