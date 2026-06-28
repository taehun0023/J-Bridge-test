import { createHash } from 'crypto'

/**
 * TTS Cache Version — increment when TTS generation logic changes
 * to automatically invalidate old cached audio.
 */
const CACHE_VERSION = 4  // v4: Google → Azure Neural migration

export const BUCKET = 'tts-cache'

export interface TtsVoice {
  name: string
  gender: 'Female' | 'Male'
}

export interface Segment {
  speaker: string | null
  text: string
}

// Azure Neural Japanese voices — 話者ごとに異なる音声を割り当て
export const voicePool: TtsVoice[] = [
  { name: 'ja-JP-NanamiNeural', gender: 'Female' },
  { name: 'ja-JP-KeitaNeural',  gender: 'Male'   },
  { name: 'ja-JP-AoiNeural',    gender: 'Female' },
  { name: 'ja-JP-DaichiNeural', gender: 'Male'   },
]

export const narratorVoice: TtsVoice = { name: 'ja-JP-NanamiNeural', gender: 'Female' }

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

function escapeXml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

function buildSsml(text: string, voiceName: string, speed: number): string {
  const ratePercent = Math.round((speed - 1) * 100)
  const rateStr = ratePercent >= 0 ? `+${ratePercent}%` : `${ratePercent}%`
  const inner = speed !== 1.0
    ? `<prosody rate="${rateStr}">${escapeXml(text)}</prosody>`
    : escapeXml(text)
  return `<speak version="1.0" xmlns="http://www.w3.org/2001/10/synthesis" xml:lang="ja-JP"><voice name="${voiceName}">${inner}</voice></speak>`
}

/**
 * Azure Cognitive Services TTS を呼び出して MP3 を返す
 */
export async function synthesize(
  apiKey: string,
  region: string,
  text: string,
  voice: TtsVoice,
  speakingRate: number
): Promise<Buffer> {
  const response = await fetch(
    `https://${region}.tts.speech.microsoft.com/cognitiveservices/v1`,
    {
      method: 'POST',
      headers: {
        'Ocp-Apim-Subscription-Key': apiKey,
        'Content-Type': 'application/ssml+xml',
        'X-Microsoft-OutputFormat': 'audio-24khz-48kbitrate-mono-mp3',
      },
      body: buildSsml(text, voice.name, speakingRate),
    }
  )

  if (!response.ok) {
    const error = await response.text()
    throw new Error(`Azure TTS error ${response.status}: ${error}`)
  }

  return Buffer.from(await response.arrayBuffer())
}

/**
 * テキストを対話解析し、話者ごとに異なる音声で合成する
 */
export async function synthesizeWithDialogue(
  apiKey: string,
  region: string,
  text: string,
  speakingRate: number
): Promise<Buffer> {
  const { isDialogue, segments } = parseDialogueScript(text)

  if (!isDialogue) {
    return synthesize(apiKey, region, text, narratorVoice, speakingRate)
  }

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
    const buf = await synthesize(apiKey, region, seg.text, voice, speakingRate)
    audioBuffers.push(buf)
  }

  return Buffer.concat(audioBuffers)
}
