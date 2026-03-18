import { describe, expect, it } from 'vitest'
import { getAllCsSubjectContents, getCsLessonDetail } from './cs-content'

describe('cs-content loader', () => {
  it('loads all configured CS subjects and at least two lessons per subject', async () => {
    const subjects = await getAllCsSubjectContents()

    expect(subjects).toHaveLength(8)
    expect(subjects.every((subject) => subject.lessons.length >= 2)).toBe(true)
  })

  it('loads a lesson detail with japanese and korean content', async () => {
    const lesson = await getCsLessonDetail('CSK-DB-01-01')

    expect(lesson).not.toBeNull()
    expect(lesson?.meta.default_language).toBe('ja')
    expect(lesson?.contentKo).not.toBeNull()
    expect(lesson?.content).toContain('## 1) 学習目標')
    expect(lesson?.contentKo).toContain('## 1) 학습 목표')
  })
})
