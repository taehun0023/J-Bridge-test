import { createHash } from 'crypto'

/**
 * TTS Cache Version — increment when TTS generation logic changes
 * to automatically invalidate old cached audio.
 */
const CACHE_VERSION = 3

export const BUCKET = 'tts-cache'

export interface TtsVoice {
  name: string
  ssmlGender: string
}

export interface Segment {
  speaker: string | null
  text: string
}

// 話者ごとに異なる音声を割り当てるための音声プール
export const voicePool: TtsVoice[] = [
  { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' },
  { name: 'ja-JP-Neural2-C', ssmlGender: 'MALE' },
  { name: 'ja-JP-Neural2-D', ssmlGender: 'MALE' },
  { name: 'ja-JP-Standard-A', ssmlGender: 'FEMALE' },
]

export const narratorVoice: TtsVoice = { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' }

/**
 * テキスト+速度からキャッシュ用ハッシュを生成（バージョン付き）
 */
export function getCacheKey(text: string, speed: number): string {
  return createHash('sha256').update(`v${CACHE_VERSION}__${text}__${speed}`).digest('hex')
}

/**
 * スクリプトを解析して、話者名と台詞に分割する
 * 「田中：セリフ」形式の行を検出
 */
export function parseDialogueScript(text: string): { isDialogue: boolean; segments: Segment[] } {
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

  // 1行以上が対話形式の場合、話者マーカーを除去して話者別音声で合成する
  // (独白型モノローグ「アナウンス：...」「研究者：...」も含む)
  if (dialogueLineCount >= 1) {
    return { isDialogue: true, segments }
  }

  return { isDialogue: false, segments: [{ speaker: null, text }] }
}

/**
 * 連続する同一話者のセグメントを結合する
 */
export function groupSegments(segments: Segment[]): Segment[] {
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
export async function synthesize(
  apiKey: string,
  text: string,
  voice: TtsVoice,
  speakingRate: number
): Promise<Buffer> {
  const response = await fetch(
    'https://texttospeech.googleapis.com/v1/text:synthesize',
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': apiKey,
      },
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

/**
 * テキストを対話解析し、話者ごとに異なる音声で合成する
 */
export async function synthesizeWithDialogue(
  apiKey: string,
  text: string,
  speakingRate: number
): Promise<Buffer> {
  const { isDialogue, segments } = parseDialogueScript(text)

  if (!isDialogue) {
    return synthesize(apiKey, text, narratorVoice, speakingRate)
  }

  // 対話モード：話者ごとに異なる音声を割り当て
  const grouped = groupSegments(segments)
  const speakerVoiceMap = new Map<string, TtsVoice>()
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

  return Buffer.concat(audioBuffers)
}
