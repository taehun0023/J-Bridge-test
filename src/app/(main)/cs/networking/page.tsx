import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function NetworkingPage() {
  const subject = await getCsSubjectContent('networking')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
