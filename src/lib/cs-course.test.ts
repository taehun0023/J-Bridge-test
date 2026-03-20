import { describe, expect, it } from 'vitest'
import { getAllCsSubjectContents } from './cs-content'
import {
  buildCsLockState,
  fromCsCourseId,
  isCsCourseCompleted,
  toCsCourseId,
} from './cs-course'

describe('cs-course helpers', () => {
  it('maps CS subject slugs to stable virtual course ids', () => {
    expect(toCsCourseId('basic-theory')).toBe('cs-basic-theory')
    expect(fromCsCourseId('cs-basic-theory')).toBe('basic-theory')
    expect(fromCsCourseId('cs-unknown')).toBeNull()
  })

  it('calculates sequential lock state from completed course ids', async () => {
    const subjects = await getAllCsSubjectContents()
    const completed = new Set(['cs-basic-theory'])
    const lockMap = buildCsLockState(subjects, completed, false)

    expect(lockMap.get('cs-basic-theory')).toBe(false)
    expect(lockMap.get('cs-data-structures')).toBe(false)
    expect(lockMap.get('cs-algorithms')).toBe(true)
  })

  it('treats a CS course as completed only when all lessons are done', () => {
    expect(isCsCourseCompleted(2, 2)).toBe(true)
    expect(isCsCourseCompleted(2, 1)).toBe(false)
    expect(isCsCourseCompleted(0, 0)).toBe(false)
  })
})
