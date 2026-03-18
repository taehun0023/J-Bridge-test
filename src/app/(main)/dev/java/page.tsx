import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function JavaPage() {
  const subject = await getDevSubjectContent('java')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
