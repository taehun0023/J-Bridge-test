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

type TableName = 'jlpt_vocabulary' | 'jlpt_grammar' | 'it_glossary'

const TABLE_CONFIG: Record<TableName, { column: string; label: string }> = {
  jlpt_vocabulary: { column: 'word', label: 'JLPT語彙' },
  jlpt_grammar: { column: 'pattern', label: 'JLPT文法' },
  it_glossary: { column: 'term_ja', label: 'IT用語' },
}

// GET: Return total counts for each table
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

  const counts: Record<string, { total: number; label: string }> = {}
  for (const [table, config] of Object.entries(TABLE_CONFIG)) {
    const { count } = await supabase
      .from(table as TableName)
      .select('*', { count: 'exact', head: true })
    counts[table] = { total: count ?? 0, label: config.label }
  }

  return NextResponse.json({ counts })
}

// POST: Process a batch of items from a specific table
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

  let body: { table?: string; offset?: number }
  try {
    body = await request.json()
  } catch {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 })
  }

  const tableName = body.table as TableName
  const offset = body.offset ?? 0

  if (!tableName || !TABLE_CONFIG[tableName]) {
    return NextResponse.json({ error: 'Invalid table name' }, { status: 400 })
  }

  const config = TABLE_CONFIG[tableName]
  const storageClient = createServiceRoleClient() ?? supabase

  // Fetch a batch of items
  const { data: items, error: fetchError } = await supabase
    .from(tableName)
    .select(config.column)
    .order('id')
    .range(offset, offset + BATCH_SIZE - 1)

  if (fetchError) return NextResponse.json({ error: fetchError.message }, { status: 500 })
  if (!items || items.length === 0) {
    return NextResponse.json({ processed: 0, cached: 0, newlyCached: 0, done: true })
  }

  let cached = 0
  let newlyCached = 0
  let errors = 0

  for (const item of items) {
    const text = String((item as unknown as Record<string, unknown>)[config.column] ?? '')
    if (!text) continue

    const hash = getCacheKey(text, 1.0)

    // Check if already cached
    const { data: existing } = await storageClient.storage
      .from(BUCKET)
      .download(`${hash}.mp3`)

    if (existing) {
      cached++
      continue
    }

    // Synthesize and cache
    try {
      const response = await fetch(
        `https://texttospeech.googleapis.com/v1/text:synthesize?key=${apiKey}`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            input: { text },
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
        .upload(`${hash}.mp3`, audioBuffer, {
          contentType: 'audio/mpeg',
          upsert: true,
        })

      newlyCached++
    } catch {
      errors++
    }
  }

  return NextResponse.json({
    processed: items.length,
    cached,
    newlyCached,
    errors,
    done: items.length < BATCH_SIZE,
  })
}
