import AuditLogClient from '@/components/admin/AuditLogClient'
import StudyHistoryPanel from '@/components/admin/StudyHistoryPanel'
import { createClient } from '@/lib/supabase/server'

export default async function AuditLogPage() {
  const supabase = await createClient()
  const { data } = await supabase
    .from('profiles')
    .select('id, full_name, email, role')
    .order('full_name')
  const profiles = (data ?? []).map(p => ({ id: p.id, name: p.full_name ?? p.email, role: p.role }))
  const users = profiles.map(p => ({ id: p.id, name: p.name }))
  const mentees = profiles.filter(p => p.role === 'mentee').map(p => ({ id: p.id, name: p.name }))

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">監査ログ</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">コンテンツの変更履歴・学習履歴を確認できます</p>
      <AuditLogClient users={users} />
      <StudyHistoryPanel mentees={mentees} />
    </div>
  )
}
