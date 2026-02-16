import { getMasteredIdsMultiple } from '@/app/actions/mastery'
import { ATTITUDE_MANUAL_SECTIONS, getAllSubsectionIds as getAttitudeIds } from '@/lib/attitude-manual-data'
import { CULTURE_MANUAL_SECTIONS, getAllSubsectionIds as getCultureIds } from '@/lib/culture-manual-data'
import ManualClient from '@/components/business-literacy/ManualClient'

export const metadata = {
  title: '態度・企業文化 | J-Bridge',
  description: '社会人としての姿勢と日本企業の文化に関するチェックリスト',
}

export default async function AttitudeCulturePage() {
  const sections = [...ATTITUDE_MANUAL_SECTIONS, ...CULTURE_MANUAL_SECTIONS]
  const allSubsectionIds = [...getAttitudeIds(), ...getCultureIds()]
  const masteredIds = await getMasteredIdsMultiple(['attitude_manual', 'culture_manual'])

  const progressPct = allSubsectionIds.length > 0
    ? Math.round((allSubsectionIds.filter(id => masteredIds.includes(id)).length / allSubsectionIds.length) * 100)
    : 0

  return (
    <ManualClient
      sections={sections}
      masteredIds={masteredIds}
      allSubsectionIds={allSubsectionIds}
      title="態度・企業文化"
      subtitle="社会人としての姿勢と日本企業の文化"
      quizUrl="/business-literacy/attitude-culture/quiz"
      quizLocked={progressPct < 100}
    />
  )
}
