import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import { Clock, ArrowLeft } from 'lucide-react'
import { jlptMockSessionsFor } from '@/lib/assessment-config'
import { selfStartMockSession } from '@/app/actions/comprehensive-exam'

export const dynamic = 'force-dynamic'

const LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1']

interface SectionConfig { section: string; label: string; question_count: number }
interface SectionScore { label: string; correct: number; total: number; scaled: number; max: number; passed: boolean; accuracy: number }
interface MockExam { id: string; mock_session: number | null; status: string; score: number | null; passed: boolean | null; section_scores: Record<string, SectionScore> | null }

export default async function JlptMockDetailPage({ searchParams }: { searchParams: Promise<{ level?: string; set?: string }> }) {
  const { level, set: setStr } = await searchParams
  const setNo = Number(setStr)
  if (!level || !LEVELS.includes(level) || !setNo) redirect('/japanese/jlpt')

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: set } = await supabase
    .from('jlpt_mock_sets')
    .select('id, title, level, set_no, section_config, is_published')
    .eq('level', level).eq('set_no', setNo).maybeSingle()
  if (!set || !set.is_published) redirect(`/japanese/jlpt/quiz?level=${level}`)

  const sectionConfig = (set.section_config ?? []) as SectionConfig[]
  const countOf = (sec: string) => sectionConfig.find(c => c.section === sec)?.question_count ?? 0
  const sessions = jlptMockSessionsFor(level)

  const { data: examData } = await supabase
    .from('comprehensive_exams')
    .select('id, mock_session, status, score, passed, section_scores')
    .eq('user_id', user.id).eq('category', 'jlpt-mock')
    .eq('content_level', level).eq('mock_set_no', setNo)
    .order('requested_at', { ascending: false })
  const bySession = new Map<number, MockExam>()
  for (const e of (examData ?? []) as MockExam[]) {
    if (e.mock_session != null && !bySession.has(e.mock_session)) bySession.set(e.mock_session, e)
  }

  // 최종 득점: 2교시 인스턴스(합산 저장)에서 가져옴
  const s2 = bySession.get(2)
  const finalDone = s2 && (s2.status === 'completed' || s2.status === 'failed')

  return (
    <div className="mx-auto max-w-2xl">
      <Link href={`/japanese/jlpt/quiz?level=${level}`} className="mb-4 inline-flex items-center gap-1 text-sm text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200">
        <ArrowLeft className="h-4 w-4" /> 一覧へ戻る
      </Link>

      <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{set.title}</h1>

      {/* 得点 */}
      <div className="mt-4 flex items-center justify-between rounded-xl border border-gray-200/70 bg-zinc-50 px-4 py-3 dark:border-white/[0.08] dark:bg-white/[0.03]">
        <div>
          <p className="text-[11px] text-zinc-500 dark:text-zinc-400">得点</p>
          <p className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{finalDone ? `${s2!.score} / 180` : 'ー'}</p>
        </div>
        {finalDone && (
          <span className={`rounded-full px-3 py-1 text-sm font-semibold ${s2!.passed ? 'bg-emerald-500/20 text-emerald-600 dark:text-emerald-300' : 'bg-red-500/20 text-red-600 dark:text-red-300'}`}>
            {s2!.passed ? '合格' : '不合格'}
          </span>
        )}
      </div>

      {/* 교시 카드 */}
      <div className="mt-4 space-y-4">
        {sessions.map(sess => {
          const qCount = sess.sections.reduce((s, sec) => s + countOf(sec), 0)
          const inst = bySession.get(sess.session)
          const done = inst && (inst.status === 'completed' || inst.status === 'failed')
          const inProgress = inst && inst.status === 'in_progress'
          return (
            <div key={sess.session} className="rounded-2xl border border-gray-200/70 bg-white p-4 shadow-sm dark:border-white/[0.08] dark:bg-white/[0.03]">
              <div className="flex items-center justify-between gap-3">
                <h3 className="font-bold text-zinc-900 dark:text-zinc-100">{sess.session}時限　{sess.label}</h3>
                {done ? (
                  <Link href={`/exam/${inst!.id}`} className="rounded-lg bg-zinc-200 px-5 py-2 text-sm font-semibold text-zinc-700 hover:bg-zinc-300 dark:bg-white/10 dark:text-zinc-200 dark:hover:bg-white/20">結果を見る</Link>
                ) : inProgress ? (
                  <Link href={`/exam/${inst!.id}`} className="rounded-lg bg-red-600 px-7 py-2 text-sm font-semibold text-white hover:bg-red-500">続ける</Link>
                ) : (
                  <form action={async () => { 'use server'; await selfStartMockSession(level, setNo, sess.session) }}>
                    <button type="submit" className="rounded-lg bg-red-600 px-7 py-2 text-sm font-semibold text-white hover:bg-red-500">開始</button>
                  </form>
                )}
              </div>
              <div className="mt-3 grid grid-cols-2 gap-2">
                <div className="rounded-lg bg-zinc-50 px-3 py-2 dark:bg-white/[0.04]">
                  <p className="text-[11px] text-zinc-500 dark:text-zinc-400">制限時間</p>
                  <p className="text-sm font-semibold text-zinc-800 dark:text-zinc-200">{sess.timeMin}分</p>
                </div>
                <div className="rounded-lg bg-zinc-50 px-3 py-2 dark:bg-white/[0.04]">
                  <p className="text-[11px] text-zinc-500 dark:text-zinc-400">すべての問題数</p>
                  <p className="text-sm font-semibold text-zinc-800 dark:text-zinc-200">{qCount}</p>
                </div>
              </div>
              {done && inst!.section_scores && (
                <p className="mt-2 text-xs text-zinc-500 dark:text-zinc-400">
                  {sess.sections.map(sec => inst!.section_scores?.[sec]).filter(Boolean).map(s => `${s!.label.replace(/（.*）/, '')} ${s!.scaled}/${s!.max}`).join('　')}
                </p>
              )}
            </div>
          )
        })}
      </div>

      <p className="mt-4 text-xs text-zinc-400">※ 合格条件: 総合 100点以上、かつ各領域 19点以上（各領域 60点満点）。1時限・2時限の両方を受験すると最終判定されます。</p>
    </div>
  )
}
