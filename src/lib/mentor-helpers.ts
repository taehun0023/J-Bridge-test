import { createClient, createServiceRoleClient } from '@/lib/supabase/server'

/**
 * 担当メンター 분리: 멘티는 「일본어 멘토(specialty=japanese)」와 「기술 멘토(specialty=technical)」를
 * 각각 0~1명 가질 수 있다. 슬롯은 배정된 멘토의 mentor_specialty 로 구분 (별도 스키마 없음).
 */

type DbClient =
  | Awaited<ReturnType<typeof createClient>>
  | NonNullable<ReturnType<typeof createServiceRoleClient>>

export type MentorSpecialty = 'japanese' | 'technical'

export interface MentorRef { id: string; name: string | null }
export interface MenteeMentors { japanese: MentorRef | null; technical: MentorRef | null }

function pickMentor(raw: unknown): { id: string; full_name: string | null; mentor_specialty: string | null } | null {
  const m = (Array.isArray(raw) ? raw[0] : raw) as
    | { id: string; full_name: string | null; mentor_specialty: string | null }
    | null
  return m ?? null
}

/** 여러 멘티의 (일본어/기술) 멘토를 한 번에 조회 */
export async function getMenteeMentorsMap(
  client: DbClient,
  menteeIds: string[],
): Promise<Record<string, MenteeMentors>> {
  const result: Record<string, MenteeMentors> = {}
  for (const id of menteeIds) result[id] = { japanese: null, technical: null }
  if (menteeIds.length === 0) return result

  const { data } = await client
    .from('mentor_mentee_assignments')
    .select('mentee_id, mentor:profiles!mentor_mentee_assignments_mentor_id_fkey(id, full_name, mentor_specialty)')
    .in('mentee_id', menteeIds)

  for (const row of (data ?? []) as Array<{ mentee_id: string; mentor: unknown }>) {
    const m = pickMentor(row.mentor)
    if (!m) continue
    const ref: MentorRef = { id: m.id, name: m.full_name }
    if (m.mentor_specialty === 'japanese') result[row.mentee_id].japanese = ref
    else if (m.mentor_specialty === 'technical') result[row.mentee_id].technical = ref
  }
  return result
}

/** 단일 멘티의 (일본어/기술) 멘토 조회 */
export async function getMenteeMentors(client: DbClient, menteeId: string): Promise<MenteeMentors> {
  const map = await getMenteeMentorsMap(client, [menteeId])
  return map[menteeId] ?? { japanese: null, technical: null }
}

/**
 * 멘티의 특정 전문분야 슬롯에 멘토를 배정/해제한다. 같은 전문분야의 기존 배정만 교체(다른 슬롯 보존).
 * mentorId=null 이면 해당 슬롯만 해제.
 */
export async function setMenteeMentorForSpecialty(
  service: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  menteeId: string,
  mentorId: string | null,
  specialty: MentorSpecialty,
  assignedBy: string,
): Promise<{ error?: string }> {
  const { data: existing } = await service
    .from('mentor_mentee_assignments')
    .select('mentor_id, mentor:profiles!mentor_mentee_assignments_mentor_id_fkey(mentor_specialty)')
    .eq('mentee_id', menteeId)

  const sameSpecIds = (existing ?? [])
    .filter(r => pickMentor((r as { mentor: unknown }).mentor)?.mentor_specialty === specialty)
    .map(r => (r as { mentor_id: string }).mentor_id)

  if (mentorId) {
    const { error } = await service
      .from('mentor_mentee_assignments')
      .upsert(
        { mentor_id: mentorId, mentee_id: menteeId, assigned_by: assignedBy },
        { onConflict: 'mentor_id,mentee_id' },
      )
    if (error) return { error: error.message }
    const toRemove = sameSpecIds.filter(id => id !== mentorId)
    if (toRemove.length) {
      await service.from('mentor_mentee_assignments').delete().eq('mentee_id', menteeId).in('mentor_id', toRemove)
    }
  } else if (sameSpecIds.length) {
    await service.from('mentor_mentee_assignments').delete().eq('mentee_id', menteeId).in('mentor_id', sameSpecIds)
  }
  return {}
}
