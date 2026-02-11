import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminCoursesClient from './AdminCoursesClient'

export default async function AdminCoursesPage() {
  const supabase = await createClient()

  const { data: courses } = await supabase
    .from('courses')
    .select('*')
    .order('category')
    .order('sort_order')

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('id, title, quiz_type, passing_score, time_limit_minutes, created_at')
    .order('created_at', { ascending: false })

  const { data: codingProblems } = await supabase
    .from('coding_problems')
    .select('id, title, difficulty, language, created_at')
    .order('created_at', { ascending: false })

  const stats = {
    courses: courses?.length ?? 0,
    published: courses?.filter(c => c.is_published).length ?? 0,
    quizzes: quizzes?.length ?? 0,
    problems: codingProblems?.length ?? 0,
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コンテンツ管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">コース、クイズ、コーディング問題管理</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全コース</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{stats.courses}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">公開済み</p>
          <p className="text-2xl font-bold text-green-600">{stats.published}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">クイズ</p>
          <p className="text-2xl font-bold text-blue-600">{stats.quizzes}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">コーディング問題</p>
          <p className="text-2xl font-bold text-purple-600">{stats.problems}</p>
        </Card>
      </div>

      <AdminCoursesClient
        courses={courses ?? []}
        quizzes={quizzes ?? []}
        codingProblems={codingProblems ?? []}
      />
    </div>
  )
}
