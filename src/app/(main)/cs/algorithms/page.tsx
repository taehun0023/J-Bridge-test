import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function AlgorithmsPage() {
  const subject = await getCsSubjectContent('algorithms')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
