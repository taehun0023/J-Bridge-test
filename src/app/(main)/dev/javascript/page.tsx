import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function JavaScriptPage() {
  const subject = await getDevSubjectContent('javascript')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
