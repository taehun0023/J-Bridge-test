import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function OperatingSystemsPage() {
  const subject = await getCsSubjectContent('operating-systems')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
