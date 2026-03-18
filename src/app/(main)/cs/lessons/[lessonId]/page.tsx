import { notFound } from 'next/navigation'
import CsStaticLessonPage from '@/components/cs/CsStaticLessonPage'
import { getCsLessonDetail } from '@/lib/cs-content'

export default async function CsLessonDetailPage({
  params,
}: {
  params: Promise<{ lessonId: string }>
}) {
  const { lessonId } = await params
  const lesson = await getCsLessonDetail(lessonId)

  if (!lesson) notFound()

  return <CsStaticLessonPage lesson={lesson} />
}
