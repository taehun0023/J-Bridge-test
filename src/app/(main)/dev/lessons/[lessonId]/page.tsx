import { notFound } from 'next/navigation'
import DevStaticLessonPage from '@/components/dev/DevStaticLessonPage'
import { getDevLessonDetail } from '@/lib/dev-content'
import type { DevLang } from '@/lib/dev-content'

export default async function DevLessonDetailPage({
  params,
  searchParams,
}: {
  params: Promise<{ lessonId: string }>
  searchParams: Promise<Record<string, string | string[] | undefined>>
}) {
  const { lessonId } = await params
  const sp = await searchParams
  const lang = (sp.lang === 'ko' ? 'ko' : 'ja') satisfies DevLang
  const lesson = await getDevLessonDetail(lessonId, lang)

  if (!lesson) notFound()

  return <DevStaticLessonPage lesson={lesson} />
}
