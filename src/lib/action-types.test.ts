import { describe, it, expect } from 'vitest'
import { ERR } from './action-types'

describe('ERR constants', () => {
  it('has AUTH_REQUIRED defined', () => {
    expect(ERR.AUTH_REQUIRED).toBeDefined()
    expect(typeof ERR.AUTH_REQUIRED).toBe('string')
  })

  it('has FORBIDDEN defined', () => {
    expect(ERR.FORBIDDEN).toBeDefined()
    expect(typeof ERR.FORBIDDEN).toBe('string')
  })

  it('has SERVICE_KEY_MISSING defined', () => {
    expect(ERR.SERVICE_KEY_MISSING).toBeDefined()
    expect(typeof ERR.SERVICE_KEY_MISSING).toBe('string')
  })

  it('has REQUIRED_FIELDS defined', () => {
    expect(ERR.REQUIRED_FIELDS).toBeDefined()
    expect(typeof ERR.REQUIRED_FIELDS).toBe('string')
  })

  it('has INVALID_INPUT defined', () => {
    expect(ERR.INVALID_INPUT).toBeDefined()
    expect(typeof ERR.INVALID_INPUT).toBe('string')
  })

  it('has NOT_FOUND defined', () => {
    expect(ERR.NOT_FOUND).toBeDefined()
    expect(typeof ERR.NOT_FOUND).toBe('string')
  })

  it('has QUIZ_NOT_FOUND defined', () => {
    expect(ERR.QUIZ_NOT_FOUND).toBeDefined()
  })

  it('has EXAM_NOT_FOUND defined', () => {
    expect(ERR.EXAM_NOT_FOUND).toBeDefined()
  })

  it('has ALREADY_REQUESTED defined', () => {
    expect(ERR.ALREADY_REQUESTED).toBeDefined()
  })

  it('all values are unique', () => {
    const values = Object.values(ERR)
    const unique = new Set(values)
    expect(unique.size).toBe(values.length)
  })
})
