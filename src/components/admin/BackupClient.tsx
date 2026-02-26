'use client'

import { useState, useTransition } from 'react'
import Card from '@/components/ui/Card'
import { Download } from 'lucide-react'
import { exportTableCsv } from '@/app/actions/admin/backup'

const TABLES = [
  { key: 'profiles', label: 'ユーザー', description: 'ユーザープロフィール情報' },
  { key: 'shared_vocab_submissions', label: 'みんなの単語帳', description: '共有単語帳の全投稿' },
  { key: 'quiz_questions', label: 'クイズ問題', description: 'クイズの問題データ' },
  { key: 'learning_assignments', label: '学習課題', description: '学習課題の配信履歴' },
  { key: 'task_assignments', label: '課題配信', description: '課題配信の履歴' },
  { key: 'admin_feedbacks', label: 'フィードバック', description: '管理者フィードバック' },
  { key: 'coding_problems', label: 'コーディング問題', description: 'コーディング問題データ' },
]

export default function BackupClient() {
  const [pending, startTransition] = useTransition()
  const [downloading, setDownloading] = useState<string | null>(null)

  function handleDownload(tableKey: string) {
    setDownloading(tableKey)
    startTransition(async () => {
      const result = await exportTableCsv(tableKey)
      if (result.csv) {
        const blob = new Blob(['\uFEFF' + result.csv], { type: 'text/csv;charset=utf-8;' })
        const url = URL.createObjectURL(blob)
        const a = document.createElement('a')
        a.href = url
        a.download = `${tableKey}_${new Date().toISOString().split('T')[0]}.csv`
        a.click()
        URL.revokeObjectURL(url)
      }
      setDownloading(null)
    })
  }

  return (
    <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {TABLES.map(table => (
        <Card key={table.key} className="flex flex-col justify-between">
          <div>
            <h3 className="font-semibold text-gray-900 dark:text-white">{table.label}</h3>
            <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{table.description}</p>
            <p className="mt-1 text-xs text-gray-400 dark:text-gray-500 font-mono">{table.key}</p>
          </div>
          <button
            onClick={() => handleDownload(table.key)}
            disabled={pending}
            className="mt-4 inline-flex w-full items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            <Download className="h-4 w-4" />
            {downloading === table.key ? 'ダウンロード中...' : 'CSVダウンロード'}
          </button>
        </Card>
      ))}
    </div>
  )
}
