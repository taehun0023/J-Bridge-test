import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function BasicTheoryPage() {
  const subject = await getCsSubjectContent('basic-theory')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
