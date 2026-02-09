import { createClient } from '@/lib/supabase/server'
import CodingProblemsClient from './CodingProblemsClient'

interface SearchParams {
  difficulty?: string
  language?: string
  page?: string
}

const ITEMS_PER_PAGE = 20

export default async function CodingProblemsPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const difficulty = params.difficulty ?? ''
  const language = params.language ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let query = supabase
    .from('coding_problems')
    .select('id, title, difficulty, language, time_limit_ms', { count: 'exact' })
    .order('difficulty', { ascending: true })

  if (difficulty) query = query.eq('difficulty', difficulty)
  if (language) query = query.eq('language', language)

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const { data: problems, count } = await query
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  // Get user's submission statuses
  let solvedMap: Record<string, string> = {}
  if (user && problems?.length) {
    const problemIds = problems.map(p => p.id)
    const { data: submissions } = await supabase
      .from('code_submissions')
      .select('problem_id, status')
      .eq('user_id', user.id)
      .in('problem_id', problemIds)
      .order('submitted_at', { ascending: false })

    submissions?.forEach((s) => {
      if (!solvedMap[s.problem_id] || s.status === 'accepted') {
        solvedMap[s.problem_id] = s.status
      }
    })
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">코딩 문제</h1>
        <p className="mt-1 text-gray-500">난이도별 알고리즘 문제를 풀고 코딩 실력을 키우세요</p>
      </div>

      <CodingProblemsClient
        problems={problems ?? []}
        solvedMap={solvedMap}
        difficulty={difficulty}
        language={language}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
      />
    </div>
  )
}
