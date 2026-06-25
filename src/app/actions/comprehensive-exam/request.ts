'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { CS_COMPREHENSIVE_TOTAL_QUESTIONS, jlptMockSessionDef } from '@/lib/assessment-config'
import { createNotification } from '@/app/actions/notifications'
import { startExam } from './execution'

export async function requestExam(category: string, subcategory: string, contentLevel: string | null) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Use serviceClient for RLS bypass (admin/mentor may not have RLS access to comprehensive_exams)
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  // Check for existing pending/in_progress exam
  const { data: existing } = await queryClient
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', user.id)
    .eq('category', category)
    .eq('subcategory', subcategory)
    .in('status', ['requested', 'approved', 'in_progress'])
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既にリクエスト中または進行中の試験があります' }
  }

  // 承認制は廃止 — すべての試験は即座に承認済みで作成される（メンティーは承認なしで受験可能）
  const nowIso = new Date().toISOString()

  const { data, error } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category,
      subcategory,
      content_level: contentLevel,
      status: 'approved',
      total_questions: category === 'cs' && subcategory === 'comprehensive'
        ? CS_COMPREHENSIVE_TOTAL_QUESTIONS
        : undefined,
      approved_at: nowIso,
      approved_by: user.id,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  revalidatePath('/dashboard/assignments')
  return { success: true, examId: data.id }
}

// ─── JLPT 모의시험: 멘토/관리자 배정 + 알림 ───

/** 공개된 모의시험 세트 목록(배정 UI용). */
export async function getPublishedMockSets() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const client = createServiceRoleClient()
  if (!client) return { error: 'Service role key not configured' } as const

  const { data } = await client
    .from('jlpt_mock_sets')
    .select('id, level, set_no, title, is_published')
    .eq('is_published', true)
    .order('level', { ascending: true })
    .order('set_no', { ascending: true })

  return { sets: data ?? [] }
}

/** 멘토/관리자가 멘티에게 JLPT 모의시험(레벨×세트)을 배정하고 알림을 보낸다. */
export async function assignMockExam(menteeId: string, level: string, setNo: number) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const client = createServiceRoleClient()
  if (!client) return { error: 'Service role key not configured' } as const

  const { data: set } = await client
    .from('jlpt_mock_sets')
    .select('id, title, time_limit_minutes, is_published')
    .eq('level', level)
    .eq('set_no', setNo)
    .maybeSingle()
  if (!set || !set.is_published) return { error: '公開された模擬試験が見つかりません' } as const

  // 동일 멘티·레벨·세트의 기존 모의고사(완료/미완료) 조회
  const { data: existingRows } = await client
    .from('comprehensive_exams')
    .select('id, status, score, passed, mock_session, requested_at')
    .eq('user_id', menteeId)
    .eq('category', 'jlpt-mock')
    .eq('content_level', level)
    .eq('mock_set_no', setNo)
    .order('requested_at', { ascending: false })
  const rows = existingRows ?? []

  // 같은 달에 같은 모의고사(레벨·세트)가 이미 부여돼 있으면 → 차단 + 삭제 후 재부여 안내
  const monthStart = `${new Date().toISOString().slice(0, 7)}-01`
  if (rows.some(r => (r.requested_at ?? '') >= monthStart)) {
    return { error: '今月すでに同じ模擬試験が割り当てられています。割り当てを削除してから、再度割り当ててください。' } as const
  }

  const { count } = await client
    .from('jlpt_mock_set_questions')
    .select('id', { count: 'exact', head: true })
    .eq('set_id', set.id)

  const nowIso = new Date().toISOString()
  const { data: exam, error } = await client
    .from('comprehensive_exams')
    .insert({
      user_id: menteeId,
      category: 'jlpt-mock',
      subcategory: 'mock',
      content_level: level,
      mock_set_no: setNo,
      status: 'approved',
      approved_at: nowIso,
      approved_by: auth.user.id,
      time_limit_minutes: set.time_limit_minutes,
      total_questions: count ?? 0,
    })
    .select('id')
    .single()
  if (error) return { error: error.message }

  await createNotification(
    menteeId,
    'exam_approved',
    `JLPT模擬試験（${level}）が割り当てられました`,
    `${set.title} を受験してください。`,
    `/exam/${exam.id}`,
    exam.id
  )

  revalidatePath('/dashboard')
  return { success: true, examId: exam.id }
}

/** self-serve: 본인이 목록에서 직접 모의시험을 시작(진행 중 인스턴스 재사용, 없으면 생성) 후 /exam로 이동. */
export async function selfStartMockExam(level: string, setNo: number) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth
  const client = createServiceRoleClient()
  if (!client) return { error: 'Service role key not configured' } as const

  const { data: set } = await client
    .from('jlpt_mock_sets')
    .select('id, time_limit_minutes, is_published')
    .eq('level', level)
    .eq('set_no', setNo)
    .maybeSingle()
  if (!set || !set.is_published) return { error: '公開された模擬試験が見つかりません' }

  const { data: existing } = await client
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', user.id)
    .eq('category', 'jlpt-mock')
    .eq('content_level', level)
    .eq('mock_set_no', setNo)
    .in('status', ['approved', 'in_progress'])
    .order('requested_at', { ascending: false })
    .limit(1)

  let examId = existing?.[0]?.id as string | undefined
  if (!examId) {
    const { count } = await client
      .from('jlpt_mock_set_questions')
      .select('id', { count: 'exact', head: true })
      .eq('set_id', set.id)
    const nowIso = new Date().toISOString()
    const { data: created, error } = await client
      .from('comprehensive_exams')
      .insert({
        user_id: user.id,
        category: 'jlpt-mock',
        subcategory: 'mock',
        content_level: level,
        mock_set_no: setNo,
        status: 'approved',
        approved_at: nowIso,
        approved_by: user.id,
        time_limit_minutes: set.time_limit_minutes,
        total_questions: count ?? 0,
      })
      .select('id')
      .single()
    if (error) return { error: error.message }
    examId = created.id
  }

  redirect(`/exam/${examId}`)
}

/** self-serve: 특정 교시를 시작(진행중 재사용/없으면 생성) 후 /exam로 이동. retake=true면 미완료분 폐기 후 새로 시작. */
export async function selfStartMockSession(level: string, setNo: number, session: number, retake = false) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth
  const client = createServiceRoleClient()
  if (!client) return { error: 'Service role key not configured' } as const

  const def = jlptMockSessionDef(level, session)
  if (!def) return { error: '無効な時限です' }

  const { data: set } = await client
    .from('jlpt_mock_sets')
    .select('id, is_published')
    .eq('level', level)
    .eq('set_no', setNo)
    .maybeSingle()
  if (!set || !set.is_published) return { error: '公開された模擬試験が見つかりません' }

  // 再試験: 진행 중/미시작(미완료) 인스턴스를 폐기하고 새로 시작 (완료된 이력은 보존)
  if (retake) {
    const { data: unfinished } = await client
      .from('comprehensive_exams')
      .select('id')
      .eq('user_id', user.id)
      .eq('category', 'jlpt-mock')
      .eq('content_level', level)
      .eq('mock_set_no', setNo)
      .eq('mock_session', session)
      .in('status', ['approved', 'in_progress'])
    const ids = (unfinished ?? []).map(o => o.id)
    if (ids.length) {
      await client.from('comprehensive_exam_answers').delete().in('exam_id', ids)
      await client.from('comprehensive_exam_questions').delete().in('exam_id', ids)
      await client.from('comprehensive_exams').delete().in('id', ids)
    }
  }

  const { data: existing } = await client
    .from('comprehensive_exams')
    .select('id, status')
    .eq('user_id', user.id)
    .eq('category', 'jlpt-mock')
    .eq('content_level', level)
    .eq('mock_set_no', setNo)
    .eq('mock_session', session)
    .in('status', ['approved', 'in_progress'])
    .order('requested_at', { ascending: false })
    .limit(1)

  let examId = existing?.[0]?.id as string | undefined
  let needStart = false
  if (!examId) {
    const nowIso = new Date().toISOString()
    const { data: created, error } = await client
      .from('comprehensive_exams')
      .insert({
        user_id: user.id,
        category: 'jlpt-mock',
        subcategory: 'mock',
        content_level: level,
        mock_set_no: setNo,
        mock_session: session,
        status: 'approved',
        approved_at: nowIso,
        approved_by: user.id,
        time_limit_minutes: def.timeMin,
        total_questions: 0,
      })
      .select('id')
      .single()
    if (error) return { error: error.message }
    examId = created.id
    needStart = true
  } else if (existing![0].status === 'approved') {
    needStart = true
  }

  // 시작 화면 없이 바로 응시: 여기서 출제·in_progress 처리까지 수행
  if (needStart) {
    const res = await startExam(examId!)
    if ('error' in res && res.error) return { error: res.error } as const
  }

  redirect(`/exam/${examId}`)
}

export async function requestRetakeExam(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Use serviceClient if available, otherwise fall back to regular client
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  const { data: exam } = await queryClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'failed' && exam.status !== 'completed') return { error: '完了済みまたは不合格の試験のみ再試験リクエストできます' }

  // Create a new exam — auto-approved for all roles (no approval gate)
  const { data: newExam, error: insertError } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category: exam.category,
      subcategory: exam.subcategory,
      content_level: exam.content_level,
      status: 'approved',
      total_questions: exam.category === 'cs' && exam.subcategory === 'comprehensive'
        ? CS_COMPREHENSIVE_TOTAL_QUESTIONS
        : undefined,
    })
    .select('id')
    .single()

  if (insertError) return { error: insertError.message }

  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true, examId: newExam.id }
}
