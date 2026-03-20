import { notFound } from 'next/navigation'
import CsStaticLessonPage from '@/components/cs/CsStaticLessonPage'
import { getCsLessonDetail } from '@/lib/cs-content'

export default async function CsLessonDetailPage({
  params,
  searchParams,
}: {
  params: Promise<{ lessonId: string }>
  searchParams: Promise<{ lang?: string }>
}) {
  const { lessonId } = await params
  const { lang } = await searchParams
  const lesson = await getCsLessonDetail(lessonId)

  if (!lesson) notFound()

  const initialLang = lang === 'ko' && lesson.contentKo ? 'ko' : 'ja'

  return <CsStaticLessonPage lesson={lesson} initialLang={initialLang} />
}
