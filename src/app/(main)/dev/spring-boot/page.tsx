import { notFound } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevSubjectContent } from '@/lib/dev-content'

export default async function SpringBootPage() {
  const subject = await getDevSubjectContent('spring-boot')

  if (!subject) notFound()

  return <DevStaticSubjectPage subject={subject} />
}
