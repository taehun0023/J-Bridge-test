import { createClient } from '@/lib/supabase/server'
import type { ProblemDifficulty, CodingLanguage } from '@/lib/supabase/types'

export async function fetchCodingProblems(options?: {
  difficulty?: ProblemDifficulty
  language?: CodingLanguage
  limit?: number
  offset?: number
}) {
  const supabase = await createClient()
  let query = supabase
    .from('coding_problems')
    .select('id, title, difficulty, language, time_limit_ms', { count: 'exact' })
    .order('difficulty', { ascending: true })

  if (options?.difficulty) {
    query = query.eq('difficulty', options.difficulty)
  }
  if (options?.language) {
    query = query.eq('language', options.language)
  }
  if (options?.limit) {
    query = query.limit(options.limit)
  }
  if (options?.offset) {
    query = query.range(options.offset, options.offset + (options.limit ?? 20) - 1)
  }

  return query
}

export async function fetchProblemById(id: string) {
  const supabase = await createClient()
  return supabase
    .from('coding_problems')
    .select('*')
    .eq('id', id)
    .single()
}

export async function fetchTestCases(problemId: string, sampleOnly = true) {
  const supabase = await createClient()
  let query = supabase
    .from('coding_test_cases')
    .select('*')
    .eq('problem_id', problemId)
    .order('sort_order', { ascending: true })

  if (sampleOnly) {
    query = query.eq('is_sample', true)
  }

  return query
}

export async function fetchCodingExams() {
  const supabase = await createClient()
  return supabase
    .from('coding_skill_exams')
    .select('*')
    .eq('is_published', true)
    .order('sort_order', { ascending: true })
}

export async function fetchCodingExamById(examId: string) {
  const supabase = await createClient()
  return supabase
    .from('coding_skill_exams')
    .select('*')
    .eq('id', examId)
    .single()
}
