import AuditLogClient from '@/components/admin/AuditLogClient'

export default function AuditLogPage() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">監査ログ</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">コンテンツの変更履歴を確認・復元できます</p>
      <AuditLogClient />
    </div>
  )
}
