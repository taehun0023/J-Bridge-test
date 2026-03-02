'use client'

import { useEffect, useState } from 'react'
import Card from '@/components/ui/Card'
import { X } from 'lucide-react'

interface Props {
  storageKey: string
  children: React.ReactNode
}

export default function GuideCard({ storageKey, children }: Props) {
  const [visible, setVisible] = useState(false)

  useEffect(() => {
    const dismissed = localStorage.getItem(storageKey)
    if (dismissed !== '1') setVisible(true)
  }, [storageKey])

  if (!visible) return null

  function handleDismiss() {
    localStorage.setItem(storageKey, '1')
    setVisible(false)
  }

  return (
    <Card className="relative mb-6 border-blue-200 bg-blue-50/50 dark:border-blue-800 dark:bg-blue-900/20">
      <button
        onClick={handleDismiss}
        className="absolute right-3 top-3 rounded-md p-1 text-blue-400 hover:bg-blue-100 hover:text-blue-600 dark:text-blue-500 dark:hover:bg-blue-800/50 dark:hover:text-blue-300"
        aria-label="閉じる"
      >
        <X className="h-4 w-4" />
      </button>
      <h2 className="text-base font-semibold text-blue-900 dark:text-blue-200">学習の進め方</h2>
      {children}
    </Card>
  )
}
