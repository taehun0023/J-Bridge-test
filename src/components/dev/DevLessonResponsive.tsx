'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'
import CsLessonLearningPanel from '@/components/cs/CsLessonLearningPanel'
import DevLessonWebSplit from './DevLessonWebSplit'
import DevLessonMobileModes from './DevLessonMobileModes'
import type { DevLessonDetail } from '@/lib/dev-content'

/**
 * 웹(분할화면)과 모바일(3탭)을 동시에 마운트하고 CSS로 하나만 노출한다.
 * 두 뷰가 같은 문제 리스트(steps.filter(needsAnswer))를 같은 인덱스 단위로 순회하므로,
 * 현재 문제 위치(index)를 여기서 소유해 양쪽에 공유한다 → 화면폭 전환 시 위치가 1번으로 초기화되지 않음.
 */
export default function DevLessonResponsive({
  lesson,
  initialLang,
  lessonId,
  courseId,
  isCompleted,
  isAdmin = false,
  previousLessonHref,
  nextLessonHref,
  subjectHref,
}: {
  lesson: DevLessonDetail
  initialLang: 'ja' | 'ko'
  lessonId: string
  courseId: string
  isCompleted: boolean
  isAdmin?: boolean
  previousLessonHref?: string | null
  nextLessonHref?: string | null
  subjectHref: string
}) {
  const [index, setIndex] = useState(0)

  return (
    <>
      {/* 分割画面(理論 | 問題) — 학습사이트식. 화면폭과 무관하게 항상 웹 레이아웃 */}
      <div>
        {lesson.interactiveContent ? (
          <DevLessonWebSplit
            interactiveContent={lesson.interactiveContent}
            initialLang={initialLang}
            contentJa={lesson.contentJa}
            contentKo={lesson.contentKo}
            lessonId={lessonId}
            courseId={courseId}
            isAdmin={isAdmin}
            index={index}
            onIndexChange={setIndex}
          />
        ) : (
          <Card className="overflow-hidden">
            <CsLessonLearningPanel
              contentJa={lesson.contentJa}
              contentKo={lesson.contentKo}
              initialLang={initialLang}
              interactiveContent={lesson.interactiveContent}
            />
          </Card>
        )}
      </div>

      {/* Mobile 3탭(問題/結果/理論) — 비활성(항상 숨김). 필요 시 재노출 */}
      <div className="hidden">
        <DevLessonMobileModes
          lesson={lesson}
          initialLang={initialLang}
          lessonId={lessonId}
          courseId={courseId}
          isCompleted={isCompleted}
          previousLessonHref={previousLessonHref}
          nextLessonHref={nextLessonHref}
          subjectHref={subjectHref}
          index={index}
          onIndexChange={setIndex}
        />
      </div>
    </>
  )
}
