import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function CwfPage() {
  const subject = await getDevSubjectContent('common-workplace-fundamentals')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
