import { notFound } from 'next/navigation'
import CsStaticSubjectPage from '@/components/cs/CsStaticSubjectPage'
import { getCsSubjectContent } from '@/lib/cs-content'

export default async function DatabasePage() {
  const subject = await getCsSubjectContent('database')
  if (!subject) notFound()

  return <CsStaticSubjectPage subject={subject} />
}
