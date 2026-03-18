import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function ComputerArchitecturePage() {
  const subject = await getCsSubjectContent('computer-architecture')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
