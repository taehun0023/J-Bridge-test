import { describe, expect, it } from 'vitest'
import { summarizeCsUnderstandingTriads } from './cs-understanding-triads'

describe('summarizeCsUnderstandingTriads', () => {
  it('counts complete triads by topic key', () => {
    const summary = summarizeCsUnderstandingTriads([
      { id: '1', topic_key: 'topic-a', difficulty: 'easy', question_category: 'data_structure_check_1', question_usage_scope: 'understanding_only' },
      { id: '2', topic_key: 'topic-a', difficulty: 'medium', question_category: 'data_structure_check_1', question_usage_scope: 'understanding_only' },
      { id: '3', topic_key: 'topic-a', difficulty: 'hard', question_category: 'data_structure_check_1', question_usage_scope: 'understanding_only' },
      { id: '4', topic_key: 'topic-b', difficulty: 'easy', question_category: 'data_structure_check_2', question_usage_scope: 'understanding_only' },
      { id: '5', topic_key: 'topic-b', difficulty: 'medium', question_category: 'data_structure_check_2', question_usage_scope: 'understanding_only' },
      { id: '6', topic_key: 'topic-c', difficulty: 'hard', question_category: 'data_structure_final', question_usage_scope: 'comprehensive_only' },
    ])

    expect(summary).toEqual({
      totalTopics: 2,
      completeTopics: 1,
      incompleteTopics: 1,
      totalRows: 5,
    })
  })

  it('falls back to question id when topic_key is absent', () => {
    const summary = summarizeCsUnderstandingTriads([
      { id: '1', difficulty: 'easy', question_category: 'network_check_1', question_usage_scope: 'understanding_only' },
      { id: '2', difficulty: 'medium', question_category: 'network_check_1', question_usage_scope: 'understanding_only' },
    ])

    expect(summary.totalTopics).toBe(2)
    expect(summary.completeTopics).toBe(0)
    expect(summary.totalRows).toBe(2)
  })
})
