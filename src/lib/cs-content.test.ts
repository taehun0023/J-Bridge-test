import { describe, expect, it } from 'vitest'
import { getAllCsSubjectContents, getCsLessonDetail, parseInteractiveContent } from './cs-content'

describe('cs-content loader', () => {
  const stageLessonIds = [
    'CSK-BT-01-01',
    'CSK-BT-01-02',
    'CSK-BT-01-03',
    'CSK-BT-01-04',
    'CSK-DS-01-01',
    'CSK-DS-01-02',
    'CSK-DS-01-03',
    'CSK-DS-01-04',
    'CSK-AL-01-01',
    'CSK-AL-01-02',
    'CSK-AL-01-03',
    'CSK-AL-01-04',
    'CSK-CA-01-01',
    'CSK-CA-01-02',
    'CSK-CA-01-03',
    'CSK-CA-01-04',
    'CSK-OS-01-01',
    'CSK-OS-01-02',
    'CSK-OS-01-03',
    'CSK-OS-01-04',
    'CSK-DB-01-01',
    'CSK-DB-01-02',
    'CSK-DB-01-03',
    'CSK-DB-01-04',
    'CSK-NW-01-01',
    'CSK-NW-01-02',
    'CSK-NW-01-03',
    'CSK-NW-01-04',
    'CSK-SC-01-01',
    'CSK-SC-01-02',
    'CSK-SC-01-03',
    'CSK-SC-01-04',
  ] as const

  it('loads all configured CS subjects with four lessons each', async () => {
    const subjects = await getAllCsSubjectContents()

    expect(subjects).toHaveLength(8)
    expect(subjects.every((subject) => subject.lessons.length === 4)).toBe(true)
  })

  it('loads a lesson detail with japanese and korean content', async () => {
    const lesson = await getCsLessonDetail('CSK-DB-01-01')

    expect(lesson).not.toBeNull()
    expect(lesson?.meta.default_language).toBe('ja')
    expect(lesson?.contentKo).not.toBeNull()
    expect(lesson?.content).toContain('## 1) 学習目標')
    expect(lesson?.contentKo).toContain('## 1) 학습 목표')
    expect(lesson?.interactiveContent).not.toBeNull()
  })

  it('loads structured interactive content for pilot lessons', async () => {
    const lesson = await getCsLessonDetail('CSK-BT-01-01')

    expect(lesson).not.toBeNull()
    expect(lesson?.interactiveContent).not.toBeNull()
    expect(lesson?.interactiveContent?.ja.steps.length).toBeGreaterThanOrEqual(6)
    expect(lesson?.interactiveContent?.ko?.steps.length).toBeGreaterThanOrEqual(6)
  })

  it('loads newly added lessons in expanded subjects with korean content and interactive stages', async () => {
    const lessons = await Promise.all([
      getCsLessonDetail('CSK-DS-01-03'),
      getCsLessonDetail('CSK-AL-01-03'),
      getCsLessonDetail('CSK-CA-01-03'),
      getCsLessonDetail('CSK-OS-01-03'),
      getCsLessonDetail('CSK-DB-01-03'),
      getCsLessonDetail('CSK-NW-01-03'),
      getCsLessonDetail('CSK-SC-01-03'),
    ])

    for (const lesson of lessons) {
      expect(lesson?.contentKo).not.toBeNull()
      expect(lesson?.interactiveContent).not.toBeNull()
    }
  })

  it('ensures every stage lesson has enough checks in both locales', async () => {
    for (const lessonId of stageLessonIds) {
      const lesson = await getCsLessonDetail(lessonId)

      expect(lesson).not.toBeNull()
      expect(lesson?.interactiveContent).not.toBeNull()

      for (const locale of [lesson?.interactiveContent?.ja, lesson?.interactiveContent?.ko]) {
        expect(locale).toBeTruthy()

        const miniChecks =
          locale?.steps.filter((step) => step.type === 'mini_check').length ?? 0
        const applyChecks =
          locale?.steps.filter((step) => step.type === 'apply_check').length ?? 0
        const summaryCount =
          locale?.steps.filter((step) => step.type === 'summary').length ?? 0

        expect(miniChecks).toBeGreaterThanOrEqual(3)
        expect(applyChecks).toBeGreaterThanOrEqual(2)
        expect(summaryCount).toBeGreaterThanOrEqual(1)
      }
    }
  })

  it('rejects invalid interactive content when correct option is missing', () => {
    const invalid = JSON.stringify({
      version: 1,
      ja: {
        hook: {
          title: 't',
          prompt: 'p',
        },
        steps: [
          {
            id: 's1',
            type: 'mini_check',
            title: 'q',
            prompt: 'prompt',
            options: [{ id: 'A', text: 'a' }],
            correctOptionId: 'B',
            explanation: 'x',
          },
        ],
      },
    })

    expect(() => parseInteractiveContent(invalid)).toThrow(
      'Invalid CS lesson interactive content schema'
    )
  })
})
