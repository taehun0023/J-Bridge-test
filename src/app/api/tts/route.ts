import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { createHash } from 'crypto'

const MAX_TEXT_LENGTH = 5000
const BUCKET = 'tts-cache'

// 話者ごとに異なる音声を割り当てるための音声プール
const voicePool = [
  { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' },
  { name: 'ja-JP-Neural2-C', ssmlGender: 'MALE' },
  { name: 'ja-JP-Neural2-D', ssmlGender: 'MALE' },
  { name: 'ja-JP-Standard-A', ssmlGender: 'FEMALE' },
]

const narratorVoice = { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' }

interface Segment {
  speaker: string | null
  text: string
}

/**
 * テキスト+速度からキャッシュ用ハッシュを生成
 */
function getCacheKey(text: string, speed: number): string {
  return createHash('sha256').update(`${text}__${speed}`).digest('hex')
}

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

/**
 * スクリプトを解析して、話者名と台詞に分割する
 * 「田中：セリフ」形式の行を検出
 */
function parseDialogueScript(text: string): { isDialogue: boolean; segments: Segment[] } {
  const lines = text.split('\n')
  // 全角コロン「：」で話者名と台詞を分離（話者名は1〜15文字）
  const dialoguePattern = /^(.{1,15})：(.+)$/

  let dialogueLineCount = 0
  const segments: Segment[] = []

  for (const line of lines) {
    const trimmed = line.trim()
    if (!trimmed) continue

    const match = trimmed.match(dialoguePattern)
    if (match) {
      dialogueLineCount++
      segments.push({ speaker: match[1].trim(), text: match[2].trim() })
    } else {
      segments.push({ speaker: null, text: trimmed })
    }
  }

  // 2行以上が対話形式の場合のみダイアログとして扱う
  if (dialogueLineCount >= 2) {
    return { isDialogue: true, segments }
  }

  return { isDialogue: false, segments: [{ speaker: null, text }] }
}

/**
 * 連続する同一話者のセグメントを結合する
 */
function groupSegments(segments: Segment[]): Segment[] {
  const grouped: Segment[] = []
  for (const seg of segments) {
    const last = grouped[grouped.length - 1]
    if (last && last.speaker === seg.speaker) {
      last.text += '\n' + seg.text
    } else {
      grouped.push({ ...seg })
    }
  }
  return grouped
}

/**
 * Google Cloud TTS APIを呼び出して音声を合成する
 */
async function synthesize(
  apiKey: string,
  text: string,
  voice: { name: string; ssmlGender: string },
  speakingRate: number
): Promise<Buffer> {
  const response = await fetch(
    `https://texttospeech.googleapis.com/v1/text:synthesize?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        input: { text },
        voice: { languageCode: 'ja-JP', ...voice },
        audioConfig: { audioEncoding: 'MP3', speakingRate },
      }),
    }
  )

  if (!response.ok) {
    const error = await response.text()
    throw new Error(`TTS API error: ${error}`)
  }

  const data = await response.json()
  return Buffer.from(data.audioContent, 'base64')
}

export async function POST(request: NextRequest) {
  // 認証チェック
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  const apiKey = process.env.GOOGLE_CLOUD_TTS_API_KEY
  if (!apiKey) {
    return NextResponse.json({ error: 'TTS API key not configured' }, { status: 500 })
  }

  let body: { text?: string; speed?: number; speakers?: string[] }
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

  const speakingRate = Math.max(0.5, Math.min(2.0, speed))
  const cacheKey = getCacheKey(text, speakingRate)

  // Storage用クライアント（serviceClient優先、なければ通常クライアント）
  const storageClient = createServiceRoleClient() ?? supabase

  // キャッシュ確認
  const cached = await getFromCache(storageClient, cacheKey)
  if (cached) {
    return new NextResponse(cached, {
      headers: {
        'Content-Type': 'audio/mpeg',
        'Content-Length': String(cached.length),
        'X-TTS-Cache': 'hit',
      },
    })
  }

  try {
    const { isDialogue, segments } = parseDialogueScript(text)
    let audioBuffer: Buffer

    if (!isDialogue) {
      // 非対話：単一音声で全文を読む
      audioBuffer = await synthesize(apiKey, text, narratorVoice, speakingRate)
    } else {
      // 対話モード：話者ごとに異なる音声を割り当て
      const grouped = groupSegments(segments)
      const speakerVoiceMap = new Map<string, (typeof voicePool)[0]>()
      let voiceIndex = 0

      const audioBuffers: Buffer[] = []

      for (const seg of grouped) {
        let voice = narratorVoice

        if (seg.speaker) {
          if (!speakerVoiceMap.has(seg.speaker)) {
            speakerVoiceMap.set(seg.speaker, voicePool[voiceIndex % voicePool.length])
            voiceIndex++
          }
          voice = speakerVoiceMap.get(seg.speaker)!
        }

        const buf = await synthesize(apiKey, seg.text, voice, speakingRate)
        audioBuffers.push(buf)
      }

      audioBuffer = Buffer.concat(audioBuffers)
    }

    // キャッシュに保存（失敗しても音声は返す）
    saveToCache(storageClient, cacheKey, audioBuffer).catch(() => {})

    return new NextResponse(audioBuffer, {
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
