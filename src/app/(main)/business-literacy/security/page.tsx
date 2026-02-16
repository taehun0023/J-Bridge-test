import { getMasteredIds } from '@/app/actions/mastery'
import { SECURITY_MANUAL_SECTIONS, getAllSubsectionIds } from '@/lib/security-manual-data'
import ManualClient from '@/components/business-literacy/ManualClient'

export const metadata = {
  title: 'セキュリティ | J-Bridge',
  description: '情報セキュリティの基礎知識に関するチェックリスト',
}

export default async function SecurityPage() {
  const allSubsectionIds = getAllSubsectionIds()
  const masteredIds = await getMasteredIds('security_manual')

  const progressPct = allSubsectionIds.length > 0
    ? Math.round((allSubsectionIds.filter(id => masteredIds.includes(id)).length / allSubsectionIds.length) * 100)
    : 0

  return (
    <ManualClient
      sections={SECURITY_MANUAL_SECTIONS}
      masteredIds={masteredIds}
      allSubsectionIds={allSubsectionIds}
      title="セキュリティ"
      subtitle="情報セキュリティの基礎知識"
      quizUrl="/business-literacy/security/quiz"
      quizLocked={progressPct < 100}
    />
  )
}
