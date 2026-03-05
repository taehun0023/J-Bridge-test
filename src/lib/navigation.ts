import {
  LayoutDashboard,
  Languages,
  Briefcase,
  Cpu,
  Code2,
  Handshake,
  Users,
  FileEdit,
  ClipboardList,
  BarChart3,
  UserCog,
  Volume2,
  ScrollText,
  HardDrive,
  type LucideIcon,
} from 'lucide-react'
import type { UserRole } from '@/lib/supabase/types'

export interface NavItem {
  key: string
  href: string
  label: string
  icon: LucideIcon
}

export interface AdminNavItem {
  href: string
  label: string
  icon: LucideIcon
  allowedRoles: UserRole[]
}

export interface CategoryChild {
  href: string
  label: string
  description: string
}

export const categoryChildren: Record<string, {
  title: string
  description: string
  children: CategoryChild[]
}> = {
  seikatsu: {
    title: '生活日本語',
    description: 'JLPT対策の語彙・文法・読解・聴解・漢字を学習しましょう',
    children: [
      { href: '/japanese/jlpt/vocabulary', label: '語彙', description: 'JLPT級別の単語学習とフラッシュカード' },
      { href: '/japanese/jlpt/grammar', label: '文法', description: 'JLPT級別の文法パターン' },
      { href: '/japanese/jlpt/reading', label: '読解', description: '読解問題で読む力を鍛える' },
      { href: '/japanese/jlpt/listening', label: '聴解', description: 'リスニング問題で聞く力を鍛える' },
      { href: '/japanese/jlpt/kanji', label: '漢字', description: 'JLPT級別の漢字学習' },
    ],
  },
  'business-jp': {
    title: 'ビジネス日本語',
    description: 'ビジネス語彙、文章パターン、ビジネス表現を学習しましょう',
    children: [
      { href: '/japanese/business/glossary', label: 'ビジネス語彙', description: 'ビジネス・IT現場の専門用語' },
      { href: '/japanese/business/sentence-patterns', label: '文章パターン', description: '日本語の文章パターン' },
      { href: '/japanese/business/expressions', label: 'ビジネス表現', description: 'ビジネスで使える表現' },
      { href: '/japanese/business/keigo', label: '敬語', description: '敬語の変換規則・よくある間違い' },
      { href: '/japanese/business/shared-vocab', label: 'みんなの単語帳', description: 'みんなで作る共有単語帳' },
    ],
  },
  cs: {
    title: 'CS知識',
    description: 'ITパスポート・基本情報技術者試験のテクノロジ系を学習しましょう',
    children: [
      { href: '/cs/basic-theory', label: '基礎理論', description: '2進数、論理演算、情報理論、確率統計' },
      { href: '/cs/algorithms', label: 'アルゴリズム', description: 'ソート、探索、再帰、計算量、動的計画法' },
      { href: '/cs/data-structures', label: 'データ構造', description: '配列、リスト、スタック、キュー、ツリー、ハッシュ' },
      { href: '/cs/computer-architecture', label: 'コンピュータシステム', description: 'CPU、メモリ、プロセス、OS機能' },
      { href: '/cs/database', label: 'データベース', description: '正規化、SQL理論、トランザクション、ER図' },
      { href: '/cs/networking', label: 'ネットワーク', description: 'OSI/TCP/IP、プロトコル、ルーティング' },
      { href: '/cs/security', label: 'セキュリティ', description: '暗号化、認証、攻撃手法、セキュリティ対策' },
    ],
  },
  dev: {
    title: '開発実務能力',
    description: 'プログラミング言語とフレームワークを学習しましょう',
    children: [
      { href: '/dev/java', label: 'Java', description: 'エンタープライズ開発の基盤' },
      { href: '/dev/javascript', label: 'JavaScript', description: 'Web開発の必須言語' },
      { href: '/dev/spring-boot', label: 'Spring Boot', description: 'Javaバックエンドフレームワーク' },
      { href: '/dev/react', label: 'React', description: 'フロントエンドUIライブラリ' },
      { href: '/dev/nextjs', label: 'Next.js', description: 'Reactフルスタックフレームワーク' },
      { href: '/dev/python', label: 'Python', description: '汎用プログラミング言語' },
      { href: '/dev/sql', label: 'SQL', description: 'データベース操作言語' },
    ],
  },
  'business-lit': {
    title: 'ビジネスリテラシー',
    description: 'ビジネスマナーと企業文化を学習しましょう',
    children: [
      { href: '/business-literacy/attitude-culture', label: '態度・企業文化', description: '社会人としての姿勢と日本企業の文化' },
      { href: '/business-literacy/security', label: 'セキュリティ', description: '情報セキュリティの基礎知識' },
    ],
  },
}

export const mainNavItems: NavItem[] = [
  { key: 'dashboard', href: '/dashboard', label: 'ダッシュボード', icon: LayoutDashboard },
  { key: 'seikatsu', href: '/japanese/jlpt', label: '生活日本語', icon: Languages },
  { key: 'business-jp', href: '/japanese/business', label: 'ビジネス日本語', icon: Briefcase },
  { key: 'cs', href: '/cs', label: 'CS知識', icon: Cpu },
  { key: 'dev', href: '/dev', label: '開発実務能力', icon: Code2 },
  { key: 'business-lit', href: '/business-literacy', label: 'ビジネスリテラシー', icon: Handshake },
]

export const adminNavItems: AdminNavItem[] = [
  { href: '/admin', label: 'ダッシュボード', icon: LayoutDashboard, allowedRoles: ['admin', 'mentor'] },
  { href: '/mentor', label: 'メンティ管理', icon: Users, allowedRoles: ['mentor'] },
  { href: '/admin/users', label: 'ユーザー管理', icon: Users, allowedRoles: ['admin'] },
  { href: '/admin/mentors', label: 'メンター管理', icon: UserCog, allowedRoles: ['admin'] },
  { href: '/admin/courses', label: 'コンテンツ管理', icon: FileEdit, allowedRoles: ['admin'] },
  { href: '/admin/tasks', label: '課題配信', icon: ClipboardList, allowedRoles: ['admin', 'mentor'] },
  { href: '/admin/reports', label: 'レポート', icon: BarChart3, allowedRoles: ['admin', 'mentor'] },
  { href: '/admin/tts-cache', label: 'TTSキャッシュ', icon: Volume2, allowedRoles: ['admin'] },
  { href: '/admin/audit-log', label: '監査ログ', icon: ScrollText, allowedRoles: ['admin'] },
  { href: '/admin/backup', label: 'バックアップ', icon: HardDrive, allowedRoles: ['admin'] },
]

export function getAdminNavForRole(role: UserRole): AdminNavItem[] {
  return adminNavItems.filter((item) => item.allowedRoles.includes(role))
}
