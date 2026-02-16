export type ManualItemType = 'attitude_manual' | 'culture_manual' | 'security_manual'

export interface ManualSubsection {
  id: string
  title: string
  content: string[]
  noteKo?: string
}

export interface ManualSection {
  id: string
  title: string
  titleKo: string
  icon: string
  itemType: ManualItemType
  subsections: ManualSubsection[]
}
