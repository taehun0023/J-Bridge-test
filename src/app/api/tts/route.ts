import { NextRequest, NextResponse } from 'next/server'
import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { env } from '@/lib/env'
import { BUCKET, getCacheKey, synthesizeWithDialogue } from '@/lib/tts-utils'

const MAX_TEXT_LENGTH = 5000

/**
 * Supabase StorageからMP3を取得（あれば返す、なければnull）
 */
async function getFromCache(supabase: ReturnType<typeof createServiceRoleClient>, hash: string): Promise<Buffer | null> {
  if (!supabase) return null
  const { data, error } = await supabase.storage
    .from(BUCKET)
    .download(`${hash}.mp3`)

  if (error || !data) return null
  return Buffer.from(await data.arrayBuffer())
}

/**
 * MP3をSupabase Storageに保存
 */
async function saveToCache(supabase: ReturnType<typeof createServiceRoleClient>, hash: string, data: Buffer): Promise<void> {
  if (!supabase) return
  await supabase.storage
    .from(BUCKET)
    .upload(`${hash}.mp3`, data, {
      contentType: 'audio/mpeg',
      upsert: true,
    })
}

export async function POST(request: NextRequest) {
  // 認証チェック
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const apiKey = env.GOOGLE_CLOUD_TTS_API_KEY
  if (!apiKey) {
    return NextResponse.json({ error: 'TTS API key not configured' }, { status: 500 })
  }

  let body: { text?: string; speed?: number }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }

  const { text, speed = 1.0 } = body

  if (!text || typeof text !== 'string' || text.trim().length === 0) {
    return NextResponse.json({ error: 'Text is required' }, { status: 400 })
  }

  if (text.length > MAX_TEXT_LENGTH) {
    return NextResponse.json({ error: `Text exceeds ${MAX_TEXT_LENGTH} character limit` }, { status: 400 })
  }

  // リテラルな \n（バックスラッシュ+n）を実際の改行に変換（キャッシュキー計算前に実施）
  const cleanedText = text.replace(/\\n/g, '\n')

  const speakingRate = Math.max(0.5, Math.min(2.0, speed))
  const cacheKey = getCacheKey(cleanedText, speakingRate)

  // Storage用クライアント（serviceClient優先、なければ通常クライアント）
  const storageClient = createServiceRoleClient() ?? supabase

  // キャッシュ確認
  const cached = await getFromCache(storageClient, cacheKey)
  if (cached) {
    return new NextResponse(new Uint8Array(cached), {
      headers: {
        'Content-Type': 'audio/mpeg',
        'Content-Length': String(cached.length),
        'X-TTS-Cache': 'hit',
      },
    })
  }

  try {
    const audioBuffer = await synthesizeWithDialogue(apiKey, cleanedText, speakingRate)

    // キャッシュに保存（失敗しても音声は返す）
    saveToCache(storageClient, cacheKey, audioBuffer).catch((err) =>
      console.error('[TTS Cache Save Failed]', cacheKey, err)
    )

    return new NextResponse(new Uint8Array(audioBuffer), {
      headers: {
        'Content-Type': 'audio/mpeg',
        'Content-Length': String(audioBuffer.length),
        'X-TTS-Cache': 'miss',
      },
    })
  } catch (err) {
    console.error('TTS error:', err)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
