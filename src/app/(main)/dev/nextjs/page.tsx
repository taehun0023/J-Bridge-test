import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function NextjsPage() {
  const subject = await getDevSubjectContent('nextjs')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
