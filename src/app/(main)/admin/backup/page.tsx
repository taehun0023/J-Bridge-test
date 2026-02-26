import BackupClient from '@/components/admin/BackupClient'

export default function BackupPage() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">データバックアップ</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">主要テーブルのデータをCSV形式でダウンロードできます</p>
      <BackupClient />
    </div>
  )
}
