// IT 関連資格 카탈로그 + 파싱/직렬화 헬퍼.
// プロフィール(本人編集) と 管理者ユーザー編集モーダル で共有。

export const IT_CERTIFICATIONS: Record<string, readonly string[]> = {
  '情報処理 (IPA)': [
    'ITパスポート',
    '情報セキュリティマネジメント',
    '基本情報技術者',
    '応用情報技術者',
    'ネットワークスペシャリスト',
    'データベーススペシャリスト',
    '情報処理安全確保支援士',
    'システムアーキテクト',
    'ITストラテジスト',
    'プロジェクトマネージャ',
    'ITサービスマネージャ',
    'システム監査技術者',
    'エンベデッドシステムスペシャリスト',
  ],
  'AWS': [
    'AWS Cloud Practitioner (Foundational)',
    'AWS AI Practitioner (Foundational)',
    'AWS Solutions Architect Associate (SAA)',
    'AWS Developer Associate (DVA)',
    'AWS SysOps Administrator Associate (SOA)',
    'AWS Data Engineer Associate (DEA)',
    'AWS Machine Learning Engineer Associate (MLA)',
    'AWS Solutions Architect Professional (SAP)',
    'AWS DevOps Engineer Professional (DOP)',
    'AWS Advanced Networking Specialty',
    'AWS Security Specialty',
    'AWS Machine Learning Specialty',
  ],
  'Microsoft Azure': [
    'Azure Fundamentals (AZ-900)',
    'Azure Administrator Associate (AZ-104)',
    'Azure Developer Associate (AZ-204)',
    'Azure Solutions Architect Expert (AZ-305)',
    'Azure DevOps Engineer Expert (AZ-400)',
    'Azure Security Engineer Associate (AZ-500)',
    'Azure Data Engineer Associate (DP-203)',
    'Azure Database Administrator Associate (DP-300)',
  ],
  'Google Cloud': [
    'Google Cloud Digital Leader',
    'Google Cloud Associate Cloud Engineer',
    'Google Cloud Professional Cloud Architect',
    'Google Cloud Professional Data Engineer',
    'Google Cloud Professional DevOps Engineer',
    'Google Cloud Professional Cloud Security Engineer',
    'Google Cloud Professional ML Engineer',
  ],
  'Oracle / Java': [
    'Oracle Certified Java Programmer Bronze (OCJP Bronze)',
    'Oracle Certified Java Programmer Silver (OCJP Silver)',
    'Oracle Certified Java Programmer Gold (OCJP Gold)',
    'Oracle Master Bronze (DB)',
    'Oracle Master Silver (DB)',
    'Oracle Master Gold (DB)',
    'Oracle Master Platinum (DB)',
    'Oracle Cloud Infrastructure Foundations (OCI)',
  ],
  'ネットワーク / Linux': [
    'CCNA (Cisco)',
    'CCNP (Cisco)',
    'CCIE (Cisco)',
    'LPIC-1',
    'LPIC-2',
    'LPIC-3',
    'RHCSA (Red Hat)',
    'RHCE (Red Hat)',
    'CompTIA Network+',
  ],
  'セキュリティ': [
    'CISSP',
    'CEH (Certified Ethical Hacker)',
    'CompTIA Security+',
    'CompTIA CySA+',
  ],
  'プロジェクト管理 / ITIL': [
    'PMP',
    'PRINCE2',
    'ITIL Foundation',
    'Scrum Master (CSM)',
    'Scrum Master (PSM)',
  ],
  '韓国国家資格': [
    '정보처리기사',
    '정보처리산업기사',
    '정보보안기사',
    '정보보안산업기사',
    'SQLD',
    'SQLP',
    'ADsP',
    'ADP',
    '빅데이터분석기사',
  ],
}

export const ALL_CERT_VALUES: ReadonlySet<string> = new Set(
  Object.values(IT_CERTIFICATIONS).flat(),
)

export function parseCertifications(raw: string | null): string[] {
  if (!raw) return []
  return raw
    .split(/[、,]/)
    .map((s) => s.trim())
    .filter((s) => s && ALL_CERT_VALUES.has(s))
}

export function buildCertifications(known: string[]): string {
  return known.join('、')
}
