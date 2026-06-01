import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import AdminUsersClient from './AdminUsersClient'
import {
  aggregateJapaneseProgress,
  type JapaneseAssignmentRow,
} from '@/lib/japanese-progress'

const JP_CATEGORIES = ['seikatsu', 'business-jp', 'business_jp', '生活日本語', 'ビジネス日本語'] as const

function normalizeExamCategory(c: string | null): 'seikatsu' | 'businessJp' | null {
  if (c === 'seikatsu' || c === '生活日本語') return 'seikatsu'
  if (c === 'business-jp' || c === 'business_jp' || c === 'ビジネス日本語') return 'businessJp'
  return null
}

export default async function AdminUsersPage() {
  const supabase = await createClient()

  const [
    { data: rawUsers },
    { data: mentorAssignments },
    { data: mentorList },
    { data: jpAssignments },
    { data: jpExams },
  ] = await Promise.all([
    supabase
      .from('profiles')
      .select(`
        *,
        japanese_skills(jlpt_normalized, it_japanese_normalized),
        coding_skills(core_normalized, framework_normalized)
      `)
      .order('created_at', { ascending: false }),
    supabase
      .from('mentor_mentee_assignments')
      .select('mentor_id, mentee_id'),
    supabase
      .from('profiles')
      .select('id, full_name')
      .eq('role', 'mentor')
      .order('full_name'),
    supabase
      .from('learning_assignments')
      .select('assigned_to, category, status, due_date, created_at, completed_at')
      .in('category', JP_CATEGORIES as unknown as string[]),
    supabase
      .from('comprehensive_exams')
      .select('user_id, category, score, passing_score, completed_at, status')
      .in('category', JP_CATEGORIES as unknown as string[])
      .in('status', ['completed', 'failed'])
      .order('completed_at', { ascending: false }),
  ])

  const mentorMap = new Map<string, string>()
  for (const a of mentorAssignments ?? []) {
    mentorMap.set(a.mentee_id, a.mentor_id)
  }

  const mentorNameById = new Map<string, string>()
  for (const m of mentorList ?? []) {
    mentorNameById.set(m.id, m.full_name ?? '')
  }

  // 最新試験スコア（カテゴリ別、各ユーザーごと）
  type ExamRow = { user_id: string; category: string; score: number | null; passing_score: number; completed_at: string | null }
  const latestExam = new Map<string, { seikatsu?: ExamRow; businessJp?: ExamRow }>()
  for (const e of (jpExams ?? []) as ExamRow[]) {
    const bucket = normalizeExamCategory(e.category)
    if (!bucket) continue
    const cur = latestExam.get(e.user_id) ?? {}
    // jpExams は completed_at desc。各 bucket の初出を採用
    if (!cur[bucket]) {
      cur[bucket] = e
      latestExam.set(e.user_id, cur)
    }
  }

  const allUserIds = (rawUsers ?? []).map((u) => u.id)
  const jpStats = aggregateJapaneseProgress(
    (jpAssignments ?? []) as JapaneseAssignmentRow[],
    allUserIds,
  )

  const users = (rawUsers ?? []).map((u) => {
    const jp = u.japanese_skills as { jlpt_normalized: number; it_japanese_normalized: number } | null
    const cs = u.coding_skills as { core_normalized: number; framework_normalized: number } | null
    const jpScore = u.is_japanese ? 200 : ((jp?.jlpt_normalized ?? 0) + (jp?.it_japanese_normalized ?? 0))
    const progScore = (cs?.core_normalized ?? 0) + (cs?.framework_normalized ?? 0)
    const mentorId = mentorMap.get(u.id) ?? null
    const exams = latestExam.get(u.id) ?? {}
    const stat = jpStats.get(u.id) ?? {
      seikatsu: { completed: 0, total: 0 },
      businessJp: { completed: 0, total: 0 },
      incomplete: 0,
      overdue: 0,
      thisMonth: { completed: 0, total: 0 },
      all: { completed: 0, total: 0 },
    }
    return {
      ...u,
      japanese_score: jpScore,
      programming_score: progScore,
      assigned_mentor_id: mentorId,
      mentor_name: mentorId ? (mentorNameById.get(mentorId) ?? null) : null,
      exam_seikatsu: exams.seikatsu
        ? { score: exams.seikatsu.score, passing_score: exams.seikatsu.passing_score }
        : null,
      exam_business_jp: exams.businessJp
        ? { score: exams.businessJp.score, passing_score: exams.businessJp.passing_score }
        : null,
      progress: stat,
    }
  })

  const stats = {
    total: users?.length ?? 0,
    admin: users?.filter(u => u.role === 'admin').length ?? 0,
    mentor: users?.filter(u => u.role === 'mentor').length ?? 0,
    mentee: users?.filter(u => u.role === 'mentee').length ?? 0,
  }

  return (
    <div>
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ユーザー管理</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">アカウント作成及び役割管理</p>
        </div>
        <Link
          href="/admin/mentors"
          className="rounded-xl bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-500 transition-colors"
        >
          メンター管理
        </Link>
      </div>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{stats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">管理者</p>
          <p className="text-2xl font-bold text-red-600">{stats.admin}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">メンター</p>
          <p className="text-2xl font-bold text-blue-600">{stats.mentor}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">メンティー</p>
          <p className="text-2xl font-bold text-green-600">{stats.mentee}</p>
        </Card>
      </div>

      <AdminUsersClient users={users ?? []} mentors={mentorList ?? []} />
    </div>
  )
}
