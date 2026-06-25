import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import EmptyState from '@/components/ui/EmptyState'
import { ArrowLeft } from 'lucide-react'
import { jlptMockSessionsFor, jlptMockSectionsFor, jlptMockTotalPass } from '@/lib/assessment-config'
import MockListClient, { type SetInfo } from './MockListClient'

export const dynamic = 'force-dynamic'

const LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

interface SectionConfig { section: string; label: string; question_count: number }
interface MockSet { id: string; level: string; set_no: number; title: string; time_limit_minutes: number; section_config: SectionConfig[] }
interface MockExam {
  id: string; mock_session: number | null; status: string; score: number | null; passed: boolean | null
  started_at: string | null; completed_at: string | null
  draft_answers: Record<string, unknown> | null
}

export default async function JlptMockListPage({ searchParams }: { searchParams: Promise<{ level?: string }> }) {
  const { level } = await searchParams
  if (!level || !LEVELS.includes(level as typeof LEVELS[number])) redirect('/japanese/jlpt')

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: setsData } = await supabase
    .from('jlpt_mock_sets')
    .select('id, level, set_no, title, time_limit_minutes, section_config')
    .eq('level', level).eq('is_published', true).order('set_no', { ascending: true })
  const sets = (setsData ?? []) as MockSet[]

  const { data: examData } = await supabase
    .from('comprehensive_exams')
    .select('id, mock_set_no, mock_session, status, score, passed, started_at, completed_at, draft_answers')
    .eq('user_id', user.id).eq('category', 'jlpt-mock').eq('content_level', level)
    .order('requested_at', { ascending: false })
  const examsBySet = new Map<number, MockExam[]>()
  for (const e of (examData ?? []) as (MockExam & { mock_set_no: number | null })[]) {
    if (e.mock_set_no == null) continue
    const arr = examsBySet.get(e.mock_set_no) ?? []
    arr.push(e)
    examsBySet.set(e.mock_set_no, arr)
  }

  const setInfos: SetInfo[] = sets.map(set => {
    const cfg = set.section_config ?? []
    const countOf = (sec: string) => cfg.find(c => c.section === sec)?.question_count ?? 0
    const instances = examsBySet.get(set.set_no) ?? []
    const sessions = jlptMockSessionsFor(level).map(def => {
      const inst = instances.find(i => i.mock_session === def.session) ?? null // already desc → latest
      const answered = inst?.status === 'in_progress' && inst.draft_answers ? Object.keys(inst.draft_answers).length : null
      const qCount = def.sections.reduce((s, sec) => s + countOf(sec), 0)
      return {
        session: def.session, label: def.label, timeMin: def.timeMin, qCount,
        remaining: answered != null ? Math.max(0, qCount - answered) : null,
        status: inst?.status ?? null, examId: inst?.id ?? null, score: inst?.score ?? null,
        startedAt: inst?.started_at ?? null, completedAt: inst?.completed_at ?? null,
      }
    })
    const finalInst = instances.find(i => i.mock_session === 2 && (i.status === 'completed' || i.status === 'failed')) ?? null
    const started = instances.some(i => i.status === 'in_progress' || i.status === 'completed' || i.status === 'failed')
    // 최종(2교시까지) 완료 시에만 합격/불합격, 그 전엔 進行中
    const status: 'pass' | 'fail' | 'progress' | null = finalInst ? (finalInst.passed ? 'pass' : 'fail') : (started ? 'progress' : null)
    return {
      id: set.id, title: set.title, level: set.level, setNo: set.set_no, timeLimit: set.time_limit_minutes,
      sections: cfg.map(c => ({ section: c.section, label: c.label, count: c.question_count })),
      totalQuestions: cfg.reduce((s, c) => s + (c.question_count ?? 0), 0),
      finalScore: finalInst?.score ?? null, finalPassed: finalInst?.passed ?? null, status,
      sessions,
    }
  })

  const passRows = jlptMockSessionsFor(level).length > 0
    ? jlptMockSectionsFor(level).map(d => ({ label: d.label.replace(/（.*?）/, ''), min: d.minScaled, max: d.maxScaled }))
    : []

  return (
    <div>
      <Link href={`/japanese/jlpt/${level.toLowerCase()}`} className="mb-4 inline-flex items-center gap-1 text-sm text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200">
        <ArrowLeft className="h-4 w-4" /> 学習画面に戻る
      </Link>

      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} 模擬試験</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">本番形式（領域別・制限時間）の模擬試験です。「詳細・受験」から時限を選んで開始します。</p>
        {passRows.length > 0 && (
          <div className="mt-2 text-sm text-gray-500 dark:text-gray-400">
            <p className="font-medium">合格には次の2つを両方満たす必要があります:</p>
            <p className="mt-0.5">① 各分野が基準点（足切り）以上</p>
            <ul className="ml-3 space-y-0.5">
              {passRows.map(r => (
                <li key={r.label}>・{r.label}: {r.min} / {r.max}点</li>
              ))}
            </ul>
            <p className="mt-0.5">② 総合 {jlptMockTotalPass(level)} / 180点 以上</p>
          </div>
        )}
      </div>

      {setInfos.length === 0 ? (
        <EmptyState title="模擬試験がありません" description="このレベルの公開された模擬試験はまだありません" icon="📝" />
      ) : (
        <MockListClient level={level} sets={setInfos} />
      )}
    </div>
  )
}
