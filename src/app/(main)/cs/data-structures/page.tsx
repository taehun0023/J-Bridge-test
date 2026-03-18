import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function DataStructuresPage() {
  const subject = await getCsSubjectContent('data-structures')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
