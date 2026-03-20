import type { CsSubjectSlug } from './cs-content'

export const CS_SUBJECT_DISPLAY_TITLES: Record<CsSubjectSlug, string> = {
  'basic-theory': '情報表現',
  'data-structures': 'データ構造',
  algorithms: 'アルゴリズム',
  'computer-architecture': 'コンピュータ構成',
  'operating-systems': 'オペレーティングシステム',
  database: 'データベース',
  networking: 'ネットワーク',
  security: 'セキュリティ',
}

export const CS_SUBJECT_DISPLAY_DESCRIPTIONS: Record<CsSubjectSlug, string> = {
  'basic-theory': '2進数、文字コード、整数表現、浮動小数点の基礎を学びます。',
  'data-structures': '配列、リスト、スタック、キュー、木、ハッシュの使い分けを学びます。',
  algorithms: '手順の読み方、探索・整列、再帰、計算量の考え方を学びます。',
  'computer-architecture': 'CPU、メモリ、入出力、性能指標の基本を学びます。',
  'operating-systems': 'プロセス、スレッド、スケジューリング、仮想メモリを学びます。',
  database: '関係モデル、インデックス、トランザクション、実行計画を学びます。',
  networking: 'ネットワーク層、IP、TCP/UDP、HTTP、DNS の基礎を学びます。',
  security: '認証、暗号、脆弱性、運用保安の基本を学びます。',
}

const LESSON_DISPLAY_TITLES: Record<string, string> = {
  'CSK-BT-01-01': '2進数とビット',
  'CSK-BT-01-02': '文字コードと数値表現',
  'CSK-BT-01-03': '整数表現とオーバーフロー',
  'CSK-BT-01-04': '浮動小数点と誤差',
  'CSK-DS-01-01': '配列とリスト',
  'CSK-DS-01-02': 'スタックとキュー',
  'CSK-DS-01-03': '木構造とヒープ',
  'CSK-DS-01-04': 'ハッシュと探索性能',
  'CSK-AL-01-01': '手順・分岐・反復',
  'CSK-AL-01-02': '整列と探索',
  'CSK-AL-01-03': '再帰と分割統治',
  'CSK-AL-01-04': '計算量とトレードオフ',
  'CSK-CA-01-01': 'CPUと命令実行',
  'CSK-CA-01-02': 'メモリ階層とキャッシュ',
  'CSK-CA-01-03': '入出力と割込み',
  'CSK-CA-01-04': '性能指標とボトルネック',
  'CSK-OS-01-01': 'プロセスとスレッド',
  'CSK-OS-01-02': 'スケジューリングと文脈切替',
  'CSK-OS-01-03': 'メモリ管理と仮想メモリ',
  'CSK-OS-01-04': 'ファイルシステムと排他制御',
  'CSK-DB-01-01': '関係モデルとキー',
  'CSK-DB-01-02': 'インデックスと検索性能',
  'CSK-DB-01-03': 'トランザクションと分離レベル',
  'CSK-DB-01-04': '実行計画と運用判断',
  'CSK-NW-01-01': 'ネットワーク層とパケット',
  'CSK-NW-01-02': 'IPとルーティング',
  'CSK-NW-01-03': 'TCPとUDP',
  'CSK-NW-01-04': 'HTTP・DNS・障害解析',
  'CSK-SC-01-01': 'CIAと認証・認可',
  'CSK-SC-01-02': '暗号化とハッシュ',
  'CSK-SC-01-03': 'Web脆弱性の基礎',
  'CSK-SC-01-04': '運用保安とインシデント対応',
}

export function getCsSubjectDisplayTitle(slug: CsSubjectSlug) {
  return CS_SUBJECT_DISPLAY_TITLES[slug]
}

export function getCsSubjectDisplayDescription(slug: CsSubjectSlug) {
  return CS_SUBJECT_DISPLAY_DESCRIPTIONS[slug]
}

export function getCsLessonDisplayTitle(lessonId: string, fallback: string) {
  return LESSON_DISPLAY_TITLES[lessonId] ?? fallback
}
