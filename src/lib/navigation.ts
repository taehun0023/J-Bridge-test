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
  Terminal,
  Megaphone,
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

export const categoryChildren: Record<
  string,
  {
    title: string
    description: string
    children: CategoryChild[]
  }
> = {
  seikatsu: {
    title: 'JLPT',
    description: 'JLPT の語彙、文法、読解、聴解、漢字を段階的に学習します。',
    children: [
      { href: '/japanese/jlpt/n5', label: 'N5', description: '基礎的な日本語を学びます' },
      { href: '/japanese/jlpt/n4', label: 'N4', description: '基本的な日本語を理解します' },
      { href: '/japanese/jlpt/n3', label: 'N3', description: '日常的な日本語をある程度理解します' },
      { href: '/japanese/jlpt/n2', label: 'N2', description: '日常的な場面に加え幅広い場面の日本語を理解します' },
      { href: '/japanese/jlpt/n1', label: 'N1', description: '幅広い場面で使われる日本語を理解します' },
    ],
  },
  'business-jp': {
    title: 'ビジネス日本語',
    description: '職場でよく使う表現、敬語、用語、文型を中心に学習します。',
    children: [
      { href: '/japanese/business/glossary', label: 'ビジネス用語', description: '職場でよく使う基本用語を確認します' },
      { href: '/japanese/business/sentence-patterns', label: '文型', description: 'ビジネス文型を整理します' },
      { href: '/japanese/business/expressions', label: '表現', description: '実務で使う定番表現を学びます' },
      { href: '/japanese/business/keigo', label: '敬語', description: '敬語の使い方を確認します' },
      { href: '/japanese/business/writing', label: '作文 (Beta)', description: '韓国語の意味を見て日本語で書く練習をします' },
    ],
  },
  cs: {
    title: 'CS知識',
    description: 'IT 基礎知識を科目別に学び、用語確認と理解度テストにつなげます。',
    children: [
      { href: '/cs/basic-theory', label: '基礎理論', description: '情報表現、数値、コードの基礎' },
      { href: '/cs/algorithms', label: 'アルゴリズム', description: '探索、整列、再帰、計算量の基本' },
      { href: '/cs/data-structures', label: 'データ構造', description: '配列、リスト、木、ハッシュの使い分け' },
      { href: '/cs/computer-architecture', label: 'コンピュータアーキテクチャ', description: 'CPU、メモリ、入出力、性能指標' },
      { href: '/cs/operating-systems', label: 'オペレーティングシステム', description: 'プロセス、スレッド、仮想メモリ、排他制御' },
      { href: '/cs/database', label: 'データベース', description: '関係モデル、索引、トランザクション、実行計画' },
      { href: '/cs/networking', label: 'ネットワーク', description: 'OSI/TCP/IP、ルーティング、HTTP、DNS' },
      { href: '/cs/security', label: 'セキュリティ', description: '認証、暗号、脆弱性、インシデント対応' },
    ],
  },
  dev: {
    title: '開発実務',
    description: '開発現場で必要な実践スキルを科目別に学習します。',
    children: [
      { href: '/dev/cwf', label: '共通業務基礎', description: '開発現場で共通して必要な基礎スキル' },
      { href: '/dev/java', label: 'Java', description: 'Java の実務基礎' },
      { href: '/dev/javascript', label: 'JavaScript', description: 'Web 開発の基本言語' },
      { href: '/dev/spring-boot', label: 'Spring Boot', description: 'Java バックエンド開発の基本' },
      { href: '/dev/react', label: 'React', description: 'React を使った UI 開発' },
      { href: '/dev/nextjs', label: 'Next.js', description: 'Next.js を使った実践開発' },
      { href: '/dev/python', label: 'Python', description: 'Python の基本と実務活用' },
      { href: '/dev/sql', label: 'SQL', description: 'データベース操作の基礎' },
    ],
  },
  'business-lit': {
    title: 'ビジネスリテラシー',
    description: '職場で必要な態度、文化理解、情報セキュリティを学習します。',
    children: [
      { href: '/business-literacy/attitude-culture', label: '態度・文化', description: '職場で求められる姿勢と文化理解' },
      { href: '/business-literacy/security', label: 'セキュリティ', description: '情報セキュリティの基本知識' },
    ],
  },
}

export const mainNavItems: NavItem[] = [
  { key: 'dashboard', href: '/dashboard', label: 'ダッシュボード', icon: LayoutDashboard },
  { key: 'seikatsu', href: '/japanese/jlpt', label: 'JLPT', icon: Languages },
  { key: 'business-jp', href: '/japanese/business', label: 'ビジネス日本語', icon: Briefcase },
  { key: 'cs', href: '/cs', label: 'CS知識', icon: Cpu },
  { key: 'dev', href: '/dev', label: '開発実務', icon: Code2 },
  { key: 'business-lit', href: '/business-literacy', label: 'ビジネスリテラシー', icon: Handshake },
  { key: 'coding', href: '/coding/problems', label: 'コーディング (Betatest)', icon: Terminal },
  { key: 'announcements', href: '/announcements', label: 'お知らせ', icon: Megaphone },
]

export const adminNavItems: AdminNavItem[] = [
  { href: '/admin', label: 'ダッシュボード', icon: LayoutDashboard, allowedRoles: ['admin', 'mentor'] },
  { href: '/mentor', label: 'メンター管理', icon: Users, allowedRoles: ['mentor'] },
  { href: '/admin/users', label: 'ユーザー管理', icon: Users, allowedRoles: ['admin'] },
  { href: '/admin/mentors', label: 'メンター一覧', icon: UserCog, allowedRoles: ['admin'] },
  { href: '/admin/courses', label: 'コース管理', icon: FileEdit, allowedRoles: ['admin'] },
  { href: '/admin/tasks', label: '課題管理', icon: ClipboardList, allowedRoles: ['admin', 'mentor'] },
  { href: '/admin/reports', label: 'レポート', icon: BarChart3, allowedRoles: ['admin', 'mentor'] },
  { href: '/admin/tts-cache', label: 'TTSキャッシュ', icon: Volume2, allowedRoles: ['admin'] },
  { href: '/admin/audit-log', label: '監査ログ', icon: ScrollText, allowedRoles: ['admin'] },
  { href: '/admin/backup', label: 'バックアップ', icon: HardDrive, allowedRoles: ['admin'] },
]

export function getAdminNavForRole(role: UserRole): AdminNavItem[] {
  return adminNavItems.filter((item) => item.allowedRoles.includes(role))
}
