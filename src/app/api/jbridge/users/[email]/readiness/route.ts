import { NextRequest, NextResponse } from 'next/server'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { env } from '@/lib/env'
import { getJlptLevel } from '@/lib/assessment-config'

export const dynamic = 'force-dynamic'

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ email: string }> }
) {
  // 1. API key authentication
  const authHeader = request.headers.get('Authorization')
  const token = authHeader?.startsWith('Bearer ') ? authHeader.slice(7) : null
  if (!token || token !== env.WEAVUSYS_API_KEY) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
  }

  // 2. Service role client (bypasses RLS)
  const supabase = createServiceRoleClient()
  if (!supabase) {
    return NextResponse.json({ error: 'Service role client unavailable' }, { status: 500 })
  }

  // 3. Resolve email from URL params
  const { email: rawEmail } = await params
  const email = decodeURIComponent(rawEmail)

  // 4. Look up profile by email
  const { data: profile } = await supabase
    .from('profiles')
    .select('id')
    .eq('email', email)
    .single()

  if (!profile) {
    return NextResponse.json({ error: 'User not found' }, { status: 404 })
  }

  // 5. Fetch latest dispatch readiness score
  const { data: score } = await supabase
    .from('dispatch_readiness_scores')
    .select(
      'jlpt_score, it_japanese_score, core_programming_score, framework_score, attitude_culture_score, overall_score, is_japanese, recorded_at'
    )
    .eq('user_id', profile.id)
    .order('recorded_at', { ascending: false })
    .limit(1)
    .single()

  if (!score) {
    return NextResponse.json({ error: 'No readiness score found' }, { status: 404 })
  }

  // 6. Return B-1 contract fields only
  return NextResponse.json({
    jlpt_score: score.jlpt_score,
    it_japanese_score: score.it_japanese_score,
    core_programming_score: score.core_programming_score,
    framework_score: score.framework_score,
    attitude_culture_score: score.attitude_culture_score,
    overall_score: score.overall_score,
    is_japanese: score.is_japanese,
    jlpt_level: getJlptLevel(score.jlpt_score),
    recorded_at: score.recorded_at,
  })
}
