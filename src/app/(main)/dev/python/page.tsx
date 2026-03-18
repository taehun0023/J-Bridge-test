import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function PythonPage() {
  const subject = await getDevSubjectContent('python')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
