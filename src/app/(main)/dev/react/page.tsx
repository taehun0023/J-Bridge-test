import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function ReactPage() {
  const subject = await getDevSubjectContent('react')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
