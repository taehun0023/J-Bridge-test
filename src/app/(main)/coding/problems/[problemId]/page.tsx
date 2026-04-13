import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import CodeEditor from './CodeEditor'

interface Params {
  problemId: string
}

export default async function ProblemPage({ params }: { params: Promise<Params> }) {
  const { problemId } = await params
  const supabase = await createClient()

  const { data: problem } = await supabase
    .from('coding_problems')
    .select('*')
    .eq('id', problemId)
    .single()

  if (!problem) notFound()

  // Get sample test cases only
  const { data: sampleCases } = await supabase
    .from('coding_test_cases')
    .select('input, expected_output, sort_order')
    .eq('problem_id', problemId)
    .eq('is_sample', true)
    .order('sort_order', { ascending: true })

  return (
    <CodeEditor
      problem={problem}
      sampleCases={sampleCases ?? []}
    />
  )
}
