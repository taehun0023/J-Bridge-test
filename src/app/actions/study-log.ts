'use server'

import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'

export type StudyContentType = 'jlpt_vocab' | 'jlpt_grammar' | 'jlpt_reading' | 'jlpt_listening'

export interface StudyHistoryRow {
  contentType: string
  label: string
  answerText: string | null
  isCorrect: boolean
  wrongCount: number
  durationMs: number | null
  createdAt: string
}

const LABEL_TABLE: Record<string, { table: string; col: string }> = {
  jlpt_vocab: { table: 'jlpt_vocabulary', col: 'word' },
  jlpt_grammar: { table: 'jlpt_grammar', col: 'pattern' },
  jlpt_reading: { table: 'jlpt_reading_passages', col: 'title' },
  jlpt_listening: { table: 'jlpt_listening_scripts', col: 'title' },
}

/** 관리자/멘토용: 특정 멘티의 학습 시도 이력(어떤 문항을 맞았/틀렸는지). */
export async function getStudyHistoryForAdmin(menteeId: string, contentType?: string): Promise<{ rows: StudyHistoryRow[] } | { error: string }> {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error ?? '権限がありません' }
  const service = createServiceRoleClient()
  if (!service) return { error: 'サービスが利用できません' }

  let q = service.from('study_attempts')
    .select('content_type, item_id, is_correct, answer_text, wrong_count, duration_ms, created_at')
    .eq('user_id', menteeId).order('created_at', { ascending: false }).limit(300)
  if (contentType) q = q.eq('content_type', contentType)
  const { data } = await q
  const attempts = data ?? []

  // 문항 라벨(word/pattern/title) 해석
  const idsByType = new Map<string, Set<string>>()
  for (const a of attempts) {
    if (!idsByType.has(a.content_type)) idsByType.set(a.content_type, new Set())
    idsByType.get(a.content_type)!.add(a.item_id)
  }
  const labelMap = new Map<string, string>() // `${type}:${id}` → label
  for (const [type, ids] of idsByType) {
    const spec = LABEL_TABLE[type]
    if (!spec) continue
    const idArr = [...ids]
    for (let i = 0; i < idArr.length; i += 200) {
      const { data: rows } = await service.from(spec.table).select(`id, ${spec.col}`).in('id', idArr.slice(i, i + 200))
      for (const r of (rows ?? []) as unknown as Record<string, string>[]) labelMap.set(`${type}:${r.id}`, r[spec.col])
    }
  }

  const rows: StudyHistoryRow[] = attempts.map(a => ({
    contentType: a.content_type,
    label: labelMap.get(`${a.content_type}:${a.item_id}`) ?? a.item_id,
    answerText: a.answer_text ?? null,
    isCorrect: a.is_correct,
    wrongCount: a.wrong_count,
    durationMs: a.duration_ms,
    createdAt: a.created_at,
  }))
  return { rows }
}

/**
 * 학습 시도 1건 기록 (暗記 확인 / 독해·청해 테스트 정오답). fire-and-forget.
 * wrongCount = 정답 전 오답 횟수, durationMs = 문제 표시~응답 소요 시간.
 */
export async function logStudyAttempt(input: {
  contentType: StudyContentType
  itemId: string
  isCorrect: boolean
  answerText?: string
  wrongCount?: number
  durationMs?: number
}): Promise<void> {
  const auth = await requireAuth()
  if ('error' in auth) return
  const { supabase, user } = auth
  await supabase.from('study_attempts').insert({
    user_id: user.id,
    content_type: input.contentType,
    item_id: input.itemId,
    is_correct: input.isCorrect,
    answer_text: input.answerText ? input.answerText.slice(0, 300) : null,
    wrong_count: Math.max(0, input.wrongCount ?? 0),
    duration_ms: input.durationMs && input.durationMs > 0 ? Math.round(input.durationMs) : null,
  })
}
