'use client'

import dynamic from 'next/dynamic'
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
  AlertTriangle,
  Calendar,
  BookOpen,
  Code2,
  Bell,
  ArrowRight,
  MessageSquare,
} from 'lucide-react'

import NameRuby from '@/components/ui/NameRuby'

const UserRoleChart = dynamic(() => import('@/components/charts/UserRoleChart'), { ssr: false })
const ActivityTrendChart = dynamic(() => import('@/components/charts/ActivityTrendChart'), { ssr: false })
const MentorWorkloadChart = dynamic(() => import('@/components/charts/MentorWorkloadChart'), { ssr: false })

interface AuditEntry {
  id: string
  action: string
  resource_type: string
  created_at: string
  actorName: string
  actorFullName: string | null
}

interface AdminDashboardProps {
  userStats: {
    total: number
    admin: number
    mentor: number
    mentee: number
    japanese: number
    korean: number
    recentSignups: number
  }
  examHealth: {
    active: number
    pending: number
    completed: number
    overdue: number
    total: number
  }
  weeklyActivity: { week: string; quizAttempts: number; codeSubmissions: number }[]
  contentMetrics: {
    coursesTotal: number
    coursesPublished: number
    questions: number
    glossary: number
  }
  taskOverview: {
    pending: number
    inProgress: number
    completed: number
    overdue: number
  }
  mentorWorkload: { mentorName: string; menteeCount: number }[]
  recentAuditLog: AuditEntry[]
  unreadNotifications: number
}

const ACTION_LABELS: Record<string, string> = {
  create: '作成',
  update: '更新',
  delete: '削除',
  approve: '承認',
  reject: '却下',
  restore: '復元',
}

const quickLinks = [
  { href: '/admin/users', label: 'ユーザー管理', desc: 'アカウント作成・役割管理', icon: Users },
  { href: '/admin/courses', label: 'コンテンツ管理', desc: 'コース・レッスン管理', icon: FileEdit },
  { href: '/admin/tasks', label: '課題配信', desc: 'タスク配信・進捗管理', icon: ClipboardList },
  { href: '/admin/reports', label: 'レポート', desc: '学習分析・取弱点分析', icon: BarChart3 },
  { href: '/admin/tts-cache', label: 'TTSキャッシュ', desc: 'TTS音声事前キャッシュ', icon: Volume2 },
  { href: '/admin/audit-log', label: '監査ログ', desc: '操作履歴・データ復元', icon: ScrollText },
  { href: '/admin/backup', label: 'バックアップ', desc: 'CSV形式データ出力', icon: HardDrive },
  { href: '/profile/feedback', label: 'フィードバック', desc: 'フィードバック作成・履歴確認', icon: MessageSquare },
]

export default function AdminDashboardClient({
  userStats,
  examHealth,
  weeklyActivity,
  contentMetrics,
  taskOverview,
  mentorWorkload,
  recentAuditLog,
  unreadNotifications,
}: AdminDashboardProps) {
  const examCompletionRate = examHealth.total > 0
    ? Math.round((examHealth.completed / examHealth.total) * 100)
    : 0

  const roleChartData = userStats ? [
    { name: '管理者', value: userStats.admin, color: '#ef4444' },
    { name: 'メンター', value: userStats.mentor, color: '#3b82f6' },
    { name: 'メンティー', value: userStats.mentee, color: '#22c55e' },
  ] : []

  return (
    <div className="space-y-6">
      {/* Section 0: Quick links (管理ツール) */}
      {(
        <div>
          <h2 className="mb-4 text-lg font-semibold text-zinc-900 dark:text-zinc-100">管理ツール</h2>
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
      )}

      {/* Section 1: Top stat cards */}
      {(
        <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
          <Card>
            <p className="text-sm text-gray-500 dark:text-gray-400">総ユーザー数</p>
            <p className="text-2xl font-bold text-gray-900 dark:text-white">{userStats.total}</p>
            {userStats.recentSignups > 0 && (
              <p className="mt-1 text-xs text-emerald-600 dark:text-emerald-400">+{userStats.recentSignups} (7日間)</p>
            )}
          </Card>
          <Card>
            <p className="text-sm text-gray-500 dark:text-gray-400">メンティー数</p>
            <p className="text-2xl font-bold text-emerald-600">{userStats.mentee}</p>
          </Card>
          <Card>
            <p className="text-sm text-gray-500 dark:text-gray-400">活性試験サイクル</p>
            <p className="text-2xl font-bold text-blue-600">{examHealth.active}</p>
          </Card>
          <Card>
            <div className="flex items-center gap-2">
              <p className="text-sm text-gray-500 dark:text-gray-400">期限超過</p>
              {examHealth.overdue > 0 && <AlertTriangle className="h-4 w-4 text-red-500" />}
            </div>
            <p className={`text-2xl font-bold ${examHealth.overdue > 0 ? 'text-red-600' : 'text-gray-900 dark:text-white'}`}>
              {examHealth.overdue}
            </p>
          </Card>
        </div>
      )}

      {/* Section 2: User distribution + Exam system */}
      {(
        <div className="grid gap-6 lg:grid-cols-2">
          <Card title="ユーザー統計">
            <UserRoleChart data={roleChartData} />
            <div className="mt-4 flex gap-4 text-sm text-gray-600 dark:text-gray-400">
              <span>日本人: <strong className="text-gray-900 dark:text-white">{userStats.japanese}</strong></span>
              <span>韓国人: <strong className="text-gray-900 dark:text-white">{userStats.korean}</strong></span>
            </div>
          </Card>

          <Card title="試験システム">
            <div className="grid grid-cols-2 gap-4">
              <div className="rounded-xl bg-blue-50 p-4 dark:bg-blue-500/10">
                <p className="text-xs text-blue-600 dark:text-blue-400">進行中</p>
                <p className="text-xl font-bold text-blue-700 dark:text-blue-300">{examHealth.active}</p>
              </div>
              <div className="rounded-xl bg-amber-50 p-4 dark:bg-amber-500/10">
                <p className="text-xs text-amber-600 dark:text-amber-400">待機</p>
                <p className="text-xl font-bold text-amber-700 dark:text-amber-300">{examHealth.pending}</p>
              </div>
              <div className="rounded-xl bg-emerald-50 p-4 dark:bg-emerald-500/10">
                <p className="text-xs text-emerald-600 dark:text-emerald-400">完了</p>
                <p className="text-xl font-bold text-emerald-700 dark:text-emerald-300">{examHealth.completed}</p>
              </div>
              <div className={`rounded-xl p-4 ${examHealth.overdue > 0 ? 'bg-red-50 dark:bg-red-500/10' : 'bg-gray-50 dark:bg-zinc-800'}`}>
                <p className={`text-xs ${examHealth.overdue > 0 ? 'text-red-600 dark:text-red-400' : 'text-gray-500 dark:text-gray-400'}`}>期限超過</p>
                <p className={`text-xl font-bold ${examHealth.overdue > 0 ? 'text-red-700 dark:text-red-300' : 'text-gray-900 dark:text-white'}`}>{examHealth.overdue}</p>
              </div>
            </div>
            <div className="mt-4 flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
              <Calendar className="h-4 w-4" />
              <span>完了率: <strong className="text-gray-900 dark:text-white">{examCompletionRate}%</strong> ({examHealth.completed}/{examHealth.total})</span>
            </div>
          </Card>
        </div>
      )}

      {/* Section 3: Weekly activity trend */}
      {(
        <Card title="週間アクティビティ">
          <ActivityTrendChart data={weeklyActivity} />
        </Card>
      )}

      {/* Section 4: Content + Tasks + Notifications */}
      {(
        <div className="grid gap-6 lg:grid-cols-3">
          <Card title="コンテンツ">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
                  <BookOpen className="h-4 w-4" />
                  <span>コース</span>
                </div>
                <span className="text-sm font-medium text-gray-900 dark:text-white">
                  {contentMetrics.coursesPublished}/{contentMetrics.coursesTotal}
                  <span className="ml-1 text-xs text-gray-500">公開</span>
                </span>
              </div>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
                  <Code2 className="h-4 w-4" />
                  <span>クイズ問題</span>
                </div>
                <span className="text-sm font-medium text-gray-900 dark:text-white">{contentMetrics.questions}</span>
              </div>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
                  <BookOpen className="h-4 w-4" />
                  <span>IT用語集</span>
                </div>
                <span className="text-sm font-medium text-gray-900 dark:text-white">{contentMetrics.glossary}</span>
              </div>
            </div>
          </Card>

          <Card title="課題概要">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm text-gray-600 dark:text-gray-400">待機中</span>
                <span className="text-sm font-medium text-amber-600 dark:text-amber-400">{taskOverview.pending}</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-sm text-gray-600 dark:text-gray-400">進行中</span>
                <span className="text-sm font-medium text-blue-600 dark:text-blue-400">{taskOverview.inProgress}</span>
              </div>
              <div className="flex items-center justify-between">
                <span className="text-sm text-gray-600 dark:text-gray-400">完了</span>
                <span className="text-sm font-medium text-emerald-600 dark:text-emerald-400">{taskOverview.completed}</span>
              </div>
              {taskOverview.overdue > 0 && (
                <div className="flex items-center justify-between">
                  <span className="text-sm text-red-600 dark:text-red-400">期限超過</span>
                  <span className="text-sm font-bold text-red-600 dark:text-red-400">{taskOverview.overdue}</span>
                </div>
              )}
            </div>
          </Card>

          <Card title="通知">
            <div className="flex flex-col items-center justify-center py-4">
              <Bell className={`h-8 w-8 ${(unreadNotifications ?? 0) > 0 ? 'text-amber-500' : 'text-gray-400 dark:text-gray-600'}`} />
              <p className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{unreadNotifications ?? 0}</p>
              <p className="text-sm text-gray-500 dark:text-gray-400">未読通知</p>
            </div>
          </Card>
        </div>
      )}

      {/* Section 5: Mentor workload + Recent audit log */}
      {(
        <div className="grid gap-6 lg:grid-cols-2">
          <Card title="メンター負荷分布">
            <MentorWorkloadChart data={mentorWorkload} />
          </Card>

          <Card title="最近の監査ログ">
            {recentAuditLog.length === 0 ? (
              <p className="py-4 text-center text-sm text-gray-500 dark:text-gray-400">
                監査ログがありません
              </p>
            ) : (
              <div className="space-y-2">
                {recentAuditLog.map((entry) => (
                  <div
                    key={entry.id}
                    className="flex items-center justify-between rounded-lg bg-gray-50 px-3 py-2 text-sm dark:bg-zinc-800"
                  >
                    <div className="min-w-0 flex-1">
                      <span className="font-medium text-gray-900 dark:text-white">
                        <NameRuby name={entry.actorFullName} fallback={entry.actorName} />
                      </span>
                      <span className="mx-1 text-gray-400">·</span>
                      <span className="text-gray-600 dark:text-gray-400">
                        {ACTION_LABELS[entry.action] ?? entry.action}
                      </span>
                      <span className="mx-1 text-gray-400">·</span>
                      <span className="text-gray-500 dark:text-gray-500">{entry.resource_type}</span>
                    </div>
                    <span className="ml-2 shrink-0 text-xs text-gray-400">
                      {new Date(entry.created_at).toLocaleDateString('ja-JP', { month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' })}
                    </span>
                  </div>
                ))}
              </div>
            )}
            <Link
              href="/admin/audit-log"
              className="mt-3 flex items-center gap-1 text-sm text-blue-600 hover:text-blue-700 dark:text-blue-400 dark:hover:text-blue-300"
            >
              すべての監査ログを表示 <ArrowRight className="h-3 w-3" />
            </Link>
          </Card>
        </div>
      )}

    </div>
  )
}
