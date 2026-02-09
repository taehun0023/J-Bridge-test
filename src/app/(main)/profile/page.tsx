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
      <h1 className="text-2xl font-bold text-gray-900">프로필</h1>
      <p className="mt-1 text-gray-500">내 정보와 학습 현황을 확인하세요</p>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        {/* Profile edit form */}
        <ProfileForm profile={profile} />

        {/* Skills summary */}
        <Card title="스킬 요약">
          <div className="space-y-4">
            <div>
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-700">코딩 등급</span>
                <Badge label={profile?.coding_rank ?? 'D'} variant="coding_rank" />
              </div>
            </div>
            <div>
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium text-gray-700">JLPT 레벨</span>
                <Badge label={profile?.jlpt_level ?? '미정'} variant="jlpt" />
              </div>
            </div>
            {japaneseSkills && (
              <div>
                <p className="text-xs font-medium text-gray-500">일본어 스킬</p>
                <div className="mt-2 space-y-1">
                  <SkillBar label="어휘" value={japaneseSkills.vocab_mastery} />
                  <SkillBar label="문법" value={japaneseSkills.grammar_mastery} />
                  <SkillBar label="독해" value={japaneseSkills.reading_mastery} />
                  <SkillBar label="IT 용어" value={japaneseSkills.it_terminology_score} />
                </div>
              </div>
            )}
            {codingSkills && (
              <div>
                <p className="text-xs font-medium text-gray-500">코딩 스킬</p>
                <div className="mt-2 space-y-1">
                  <SkillBar label="Java" value={codingSkills.java_score} />
                  <SkillBar label="JavaScript" value={codingSkills.javascript_score} />
                  <SkillBar label="SQL" value={codingSkills.sql_score} />
                  <SkillBar label="알고리즘" value={codingSkills.algorithm_score} />
                </div>
              </div>
            )}
          </div>
        </Card>
      </div>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        {/* Quiz history */}
        <Card title="퀴즈 이력">
          {!quizHistory?.length ? (
            <p className="py-4 text-center text-sm text-gray-400">퀴즈 이력이 없습니다</p>
          ) : (
            <div className="divide-y divide-gray-100">
              {quizHistory.map((q) => (
                <div key={q.id} className="flex items-center justify-between py-2.5">
                  <div>
                    <p className="text-sm text-gray-900">{(q.quizzes as { title: string } | null)?.title ?? '퀴즈'}</p>
                    <p className="text-xs text-gray-500">{new Date(q.completed_at).toLocaleDateString('ko-KR')}</p>
                  </div>
                  <span className={`text-sm font-bold ${q.passed ? 'text-green-600' : 'text-red-600'}`}>
                    {q.score}점
                  </span>
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Coding history */}
        <Card title="코딩 제출 이력">
          {!codingHistory?.length ? (
            <p className="py-4 text-center text-sm text-gray-400">제출 이력이 없습니다</p>
          ) : (
            <div className="divide-y divide-gray-100">
              {codingHistory.map((s) => (
                <div key={s.id} className="flex items-center justify-between py-2.5">
                  <div>
                    <p className="text-sm text-gray-900">
                      {(s.coding_problems as { title: string } | null)?.title ?? '문제'}
                    </p>
                    <p className="text-xs text-gray-500">
                      {new Date(s.submitted_at).toLocaleDateString('ko-KR')} · {s.language}
                    </p>
                  </div>
                  <div className="text-right">
                    <Badge label={s.status === 'accepted' ? '통과' : s.status} variant="default" />
                    <p className="text-xs text-gray-500">{s.passed_test_cases}/{s.total_test_cases}</p>
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
      <span className="w-16 text-xs text-gray-600">{label}</span>
      <div className="flex-1 h-2 rounded-full bg-gray-100">
        <div
          className="h-2 rounded-full bg-blue-500"
          style={{ width: `${Math.min(100, value)}%` }}
        />
      </div>
      <span className="w-8 text-right text-xs text-gray-500">{value}</span>
    </div>
  )
}
