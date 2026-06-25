'use client'

import Link from 'next/link'
import Card from '@/components/ui/Card'
import { ClipboardList, BarChart3, MessageSquare, Users } from 'lucide-react'

const MENTOR_TOOLS = [
  {
    href: '/admin/tasks',
    label: '課題配信',
    desc: '学習課題の配信・管理',
    icon: ClipboardList,
  },
  {
    href: '/admin/reports',
    label: 'レポート',
    desc: '取弱点分析・成績レポート',
    icon: BarChart3,
  },
  {
    href: '/profile/feedback',
    label: 'フィードバック',
    desc: 'フィードバック履歴の確認',
    icon: MessageSquare,
  },
  {
    href: '/mentor/mentees',
    label: 'メンティ管理',
    desc: '担当メンティ一覧・学習状況',
    icon: Users,
  },
]

export default function MentorDashboardClient() {
  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">メンター管理</h1>
      </div>

      {/* 管理ツール */}
      <h2 className="mb-4 text-lg font-semibold text-zinc-900 dark:text-zinc-100">管理ツール</h2>
      <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
        {MENTOR_TOOLS.map((tool) => (
          <Link key={tool.href} href={tool.href}>
            <Card className="transition-colors hover:border-blue-500/30 dark:hover:border-blue-500/30">
              <div className="flex items-start gap-3">
                <tool.icon className="mt-0.5 h-5 w-5 shrink-0 text-blue-600 dark:text-blue-400" />
                <div>
                  <p className="font-medium text-gray-900 dark:text-white">{tool.label}</p>
                  <p className="mt-0.5 text-xs text-gray-500 dark:text-gray-400">{tool.desc}</p>
                </div>
              </div>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
