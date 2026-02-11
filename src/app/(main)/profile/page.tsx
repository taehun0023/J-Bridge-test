import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import ProfileForm from './ProfileForm'

export default async function ProfilePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  const { data: japaneseSkills } = await supabase
    .from('japanese_skills')
    .select('*')
    .eq('user_id', user.id)
    .single()

  const { data: codingSkills } = await supabase
    .from('coding_skills')
    .select('*')
    .eq('user_id', user.id)
    .single()

  // Recent quiz attempts
  const { data: quizHistory } = await supabase
    .from('quiz_attempts')
    .select('*, quizzes(title)')
    .eq('user_id', user.id)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(10)

  // Recent coding submissions
  const { data: codingHistory } = await supabase
    .from('code_submissions')
    .select('id, status, language, passed_test_cases, total_test_cases, submitted_at, coding_problems(title)')
    .eq('user_id', user.id)
    .order('submitted_at', { ascending: false })
    .limit(10)

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">プロフィール</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">個人情報と学習状況を確認してください</p>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        {/* Profile edit form */}
        <ProfileForm profile={profile} />

        {/* Skills summary */}
        <Card title="スキル概要">
          <div className="space-y-4">
            <div>
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-700 dark:text-gray-300">コーディング等級</span>
                <Badge label={profile?.coding_rank ?? 'D'} variant="coding_rank" />
              </div>
            </div>
            <div>
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-700 dark:text-gray-300">JLPTレベル</span>
                <Badge label={profile?.jlpt_level ?? '未定'} variant="jlpt" />
              </div>
            </div>
            {japaneseSkills && (
              <div>
                <p className="text-xs font-medium text-gray-500 dark:text-gray-400">日本語スキル</p>
                <div className="mt-2 space-y-1">
                  <SkillBar label="語彙" value={japaneseSkills.vocab_mastery} />
                  <SkillBar label="文法" value={japaneseSkills.grammar_mastery} />
                  <SkillBar label="読解" value={japaneseSkills.reading_mastery} />
                  <SkillBar label="IT用語" value={japaneseSkills.it_terminology_score} />
                </div>
              </div>
            )}
            {codingSkills && (
              <div>
                <p className="text-xs font-medium text-gray-500 dark:text-gray-400">コーディングスキル</p>
                <div className="mt-2 space-y-1">
                  <SkillBar label="Java" value={codingSkills.java_score} />
                  <SkillBar label="JavaScript" value={codingSkills.javascript_score} />
                  <SkillBar label="SQL" value={codingSkills.sql_score} />
                  <SkillBar label="アルゴリズム" value={codingSkills.algorithm_score} />
                </div>
              </div>
            )}
          </div>
        </Card>
      </div>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        {/* Quiz history */}
        <Card title="クイズ履歴">
          {!quizHistory?.length ? (
            <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">クイズ履歴がありません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {quizHistory.map((q) => (
                <div key={q.id} className="flex items-center justify-between py-2.5">
                  <div>
                    <p className="text-sm text-gray-900 dark:text-white">{(q.quizzes as { title: string } | null)?.title ?? 'クイズ'}</p>
                    <p className="text-xs text-gray-500 dark:text-gray-400">{new Date(q.completed_at).toLocaleDateString('ja-JP')}</p>
                  </div>
                  <span className={`text-sm font-bold ${q.passed ? 'text-green-600 dark:text-green-400' : 'text-red-600 dark:text-red-400'}`}>
                    {q.score}点
                  </span>
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Coding history */}
        <Card title="コーディング提出履歴">
          {!codingHistory?.length ? (
            <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">提出履歴がありません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {codingHistory.map((s) => (
                <div key={s.id} className="flex items-center justify-between py-2.5">
                  <div>
                    <p className="text-sm text-gray-900 dark:text-white">
                      {(s.coding_problems as unknown as { title: string } | null)?.title ?? '問題'}
                    </p>
                    <p className="text-xs text-gray-500 dark:text-gray-400">
                      {new Date(s.submitted_at).toLocaleDateString('ja-JP')} · {s.language}
                    </p>
                  </div>
                  <div className="text-right">
                    <Badge label={s.status === 'accepted' ? '合格' : s.status} variant="default" />
                    <p className="text-xs text-gray-500 dark:text-gray-400">{s.passed_test_cases}/{s.total_test_cases}</p>
                  </div>
                </div>
              ))}
            </div>
          )}
        </Card>
      </div>
    </div>
  )
}

function SkillBar({ label, value }: { label: string; value: number }) {
  return (
    <div className="flex items-center gap-3">
      <span className="w-16 text-xs text-gray-600 dark:text-gray-400">{label}</span>
      <div className="flex-1 h-2 rounded-full bg-gray-100 dark:bg-gray-700">
        <div
          className="h-2 rounded-full bg-blue-500 dark:bg-blue-400"
          style={{ width: `${Math.min(100, value)}%` }}
        />
      </div>
      <span className="w-8 text-right text-xs text-gray-500 dark:text-gray-400">{value}</span>
    </div>
  )
}
