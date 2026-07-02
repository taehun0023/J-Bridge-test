'use client'

import Link from 'next/link'
import Card from '@/components/ui/Card'
import {
  Users,
  FileEdit,
  ClipboardList,
  BarChart3,
  Volume2,
  ScrollText,
  HardDrive,
  MessageSquare,
  LayoutGrid,
} from 'lucide-react'

const quickLinks = [
  { href: '/admin/users', label: 'ユーザー管理', desc: 'アカウント作成・役割管理', icon: Users },
  { href: '/admin/courses', label: 'コンテンツ管理', desc: 'コース・レッスン管理', icon: FileEdit },
  { href: '/admin/categories', label: 'カテゴリ管理', desc: 'サブカテゴリの有効・無効', icon: LayoutGrid },
  { href: '/admin/tasks', label: '課題配信', desc: 'タスク配信・進捗管理', icon: ClipboardList },
  { href: '/admin/reports', label: 'レポート', desc: '学習分析・取弱点分析', icon: BarChart3 },
  { href: '/admin/tts-cache', label: 'TTSキャッシュ', desc: 'TTS音声事前キャッシュ', icon: Volume2 },
  { href: '/admin/audit-log', label: '監査ログ', desc: '操作履歴・データ復元', icon: ScrollText },
  { href: '/admin/backup', label: 'バックアップ', desc: 'CSV形式データ出力', icon: HardDrive },
  { href: '/profile/feedback', label: 'フィードバック', desc: 'フィードバック作成・履歴確認', icon: MessageSquare },
]

export default function AdminDashboardClient() {
  return (
    <div>
      <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
        {quickLinks.map((link) => (
          <Link key={link.href} href={link.href}>
            <Card className="transition-colors hover:border-blue-500/30 dark:hover:border-blue-500/30">
              <div className="flex items-start gap-3">
                <link.icon className="mt-0.5 h-5 w-5 shrink-0 text-blue-600 dark:text-blue-400" />
                <div>
                  <p className="font-medium text-gray-900 dark:text-white">{link.label}</p>
                  <p className="mt-0.5 text-xs text-gray-500 dark:text-gray-400">{link.desc}</p>
                </div>
              </div>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
