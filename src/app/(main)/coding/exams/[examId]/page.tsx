import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import ExamTaker from './ExamTaker'

interface Params {
  examId: string
}

export default async function ExamPage({ params }: { params: Promise<Params> }) {
  const { examId } = await params
  const supabase = await createClient()

  const { data: exam } = await supabase
    .from('coding_skill_exams')
    .select('*')
    .eq('id', examId)
    .eq('is_published', true)
    .single()

  if (!exam) notFound()

  // Get problems for this exam
  const { data: examProblems } = await supabase
    .from('coding_exam_problems')
    .select('problem_id, sort_order, points, coding_problems(*)')
    .eq('exam_id', examId)
    .order('sort_order', { ascending: true })

  // Get sample test cases for each problem
  const problems = examProblems?.map(ep => ({
    ...ep.coding_problems,
    sort_order: ep.sort_order,
    points: ep.points,
  })) ?? []

  return (
    <ExamTaker exam={exam} problems={problems} />
  )
}
