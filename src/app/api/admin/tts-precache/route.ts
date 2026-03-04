import { NextRequest, NextResponse } from 'next/server'
import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { createHash } from 'crypto'
import { env } from '@/lib/env'

const BUCKET = 'tts-cache'
const BATCH_SIZE = 10

const narratorVoice = { name: 'ja-JP-Neural2-B', ssmlGender: 'FEMALE' }

function getCacheKey(text: string, speed: number): string {
  return createHash('sha256').update(`${text}__${speed}`).digest('hex')
}

/** Extract the TTS script portion from a listening quiz question_text.
 *  Tries 質問： marker first (QuizTaker), then \n\n split (ExamClient). */
function extractListeningScript(questionText: string): string | null {
  const cleaned = questionText.replace(/\\n/g, '\n')

  // QuizTaker style: split at 質問：
  const marker = '質問：'
  const markerIdx = cleaned.lastIndexOf(marker)
  if (markerIdx !== -1) {
    const script = cleaned.substring(0, markerIdx).trim()
    if (script) return script
  }

  // ExamClient style: split by \n\n, take all but last part
  const parts = cleaned.split('\n\n')
  if (parts.length >= 3) {
    const script = parts.slice(0, parts.length - 1).join('\n\n')
    if (script) return script
  }

  return null
}

type SourceName = 'jlpt_vocabulary' | 'jlpt_grammar' | 'it_glossary' | 'jlpt_listening' | 'listening_quiz'

const SOURCE_LABELS: Record<SourceName, string> = {
  jlpt_vocabulary: 'JLPT語彙',
  jlpt_grammar: 'JLPT文法',
  it_glossary: 'IT用語',
  jlpt_listening: 'JLPT聴解スクリプト',
  listening_quiz: '聴解クイズ問題',
}

const ALL_SOURCES: SourceName[] = [
  'jlpt_vocabulary', 'jlpt_grammar', 'it_glossary',
  'jlpt_listening', 'listening_quiz',
]

interface CacheItem {
  text: string
  cacheFile: string
}

/**
 * List all cached file names from the tts-cache bucket (paginated).
 */
async function listAllCachedFiles(
  storageClient: ReturnType<typeof createServiceRoleClient>
): Promise<Set<string>> {
  const fileSet = new Set<string>()
  if (!storageClient) return fileSet

  const PAGE_SIZE = 1000
  let offset = 0

  while (true) {
    const { data, error } = await storageClient.storage
      .from(BUCKET)
      .list('', { limit: PAGE_SIZE, offset })

    if (error || !data || data.length === 0) break

    for (const file of data) {
      if (file.name) fileSet.add(file.name)
    }

    if (data.length < PAGE_SIZE) break
    offset += data.length
  }

  return fileSet
}

/** Convert text to a CacheItem (applies \\n normalization matching TTS route) */
function toCacheItem(text: string): CacheItem {
  const cleaned = text.replace(/\\n/g, '\n')
  const hash = getCacheKey(cleaned, 1.0)
  return { text: cleaned, cacheFile: `${hash}.mp3` }
}

/**
 * Fetch items for a given source, returning text + cacheFile pairs.
 */
async function getSourceItems(
  supabase: Awaited<ReturnType<typeof createClient>>,
  source: SourceName
): Promise<CacheItem[]> {
  // Simple column-based sources
  const SIMPLE_SOURCES: Partial<Record<SourceName, { table: string; column: string }>> = {
    jlpt_vocabulary: { table: 'jlpt_vocabulary', column: 'word' },
    jlpt_grammar: { table: 'jlpt_grammar', column: 'pattern' },
    it_glossary: { table: 'it_glossary', column: 'term_ja' },
    jlpt_listening: { table: 'jlpt_listening_scripts', column: 'script' },
  }

  const simple = SIMPLE_SOURCES[source]
  if (simple) {
    const items: CacheItem[] = []
    let offset = 0
    const PAGE = 1000

    while (true) {
      const { data } = await supabase
        .from(simple.table)
        .select(simple.column)
        .order('id')
        .range(offset, offset + PAGE - 1)

      if (!data || data.length === 0) break

      for (const row of data) {
        const text = String((row as unknown as Record<string, unknown>)[simple.column] ?? '')
        if (!text) continue
        items.push(toCacheItem(text))
      }

      if (data.length < PAGE) break
      offset += data.length
    }

    return items
  }

  // Listening quiz questions — extract script from question_text
  if (source === 'listening_quiz') {
    const items: CacheItem[] = []
    let offset = 0
    const PAGE = 1000

    while (true) {
      const { data } = await supabase
        .from('quiz_questions')
        .select('question_text')
        .eq('question_category', 'listening')
        .eq('is_published', true)
        .order('id')
        .range(offset, offset + PAGE - 1)

      if (!data || data.length === 0) break

      for (const row of data) {
        const questionText = String((row as unknown as Record<string, unknown>).question_text ?? '')
        const script = extractListeningScript(questionText)
        if (script) items.push(toCacheItem(script))
      }

      if (data.length < PAGE) break
      offset += data.length
    }

    return items
  }

  return []
}

// GET: Return counts with cache status per source
export async function GET() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()
  if (profile?.role !== 'admin') return NextResponse.json({ error: 'Forbidden' }, { status: 403 })

  const storageClient = createServiceRoleClient() ?? supabase

  // List all cached files once
  const cachedFiles = await listAllCachedFiles(storageClient)

  // For each source, compute hashes and cross-reference
  const counts: Record<string, { total: number; cached: number; uncached: number; label: string }> = {}

  for (const source of ALL_SOURCES) {
    const items = await getSourceItems(supabase, source)
    const cached = items.filter(i => cachedFiles.has(i.cacheFile)).length
    counts[source] = {
      total: items.length,
      cached,
      uncached: items.length - cached,
      label: SOURCE_LABELS[source],
    }
  }

  return NextResponse.json({ counts })
}

// POST: Process uncached items from a specific source
export async function POST(request: NextRequest) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()
  if (profile?.role !== 'admin') return NextResponse.json({ error: 'Forbidden' }, { status: 403 })

  const apiKey = env.GOOGLE_CLOUD_TTS_API_KEY
  if (!apiKey) return NextResponse.json({ error: 'TTS API key not configured' }, { status: 500 })

  let body: { table?: string }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }

  const sourceName = body.table as SourceName

  if (!sourceName || !ALL_SOURCES.includes(sourceName)) {
    return NextResponse.json({ error: 'Invalid source name' }, { status: 400 })
  }

  const storageClient = createServiceRoleClient() ?? supabase

  // List all cached files once per batch call
  const cachedFiles = await listAllCachedFiles(storageClient)

  // Fetch all items from source, filter to uncached only, take first batch
  const allItems = await getSourceItems(supabase, sourceName)
  const uncachedItems = allItems.filter(i => !cachedFiles.has(i.cacheFile))
  const batch = uncachedItems.slice(0, BATCH_SIZE)

  if (batch.length === 0) {
    return NextResponse.json({
      processed: 0,
      newlyCached: 0,
      errors: 0,
      done: true,
      remaining: 0,
    })
  }

  let newlyCached = 0
  let errors = 0

  for (const item of batch) {
    try {
      const response = await fetch(
        `https://texttospeech.googleapis.com/v1/text:synthesize?key=${apiKey}`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            input: { text: item.text },
            voice: { languageCode: 'ja-JP', ...narratorVoice },
            audioConfig: { audioEncoding: 'MP3', speakingRate: 1.0 },
          }),
        }
      )

      if (!response.ok) {
        errors++
        continue
      }

      const data = await response.json()
      const audioBuffer = Buffer.from(data.audioContent, 'base64')

      await storageClient.storage
        .from(BUCKET)
        .upload(item.cacheFile, audioBuffer, {
          contentType: 'audio/mpeg',
          upsert: true,
        })

      newlyCached++
    } catch {
      errors++
    }
  }

  const remaining = uncachedItems.length - batch.length

  return NextResponse.json({
    processed: batch.length,
    newlyCached,
    errors,
    done: remaining <= 0,
    remaining: Math.max(0, remaining),
  })
}
