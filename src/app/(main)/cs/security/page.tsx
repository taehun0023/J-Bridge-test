import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function SecurityPage() {
  const subject = await getCsSubjectContent('security')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
