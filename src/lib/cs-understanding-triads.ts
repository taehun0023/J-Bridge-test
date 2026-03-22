type Difficulty = 'easy' | 'medium' | 'hard'

export interface CsUnderstandingTriadRow {
  id: string
  difficulty: string | null
  question_category: string | null
  question_usage_scope: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
  topic_key?: string | null
}

export interface CsUnderstandingTriadSummary {
  totalTopics: number
  completeTopics: number
  incompleteTopics: number
  totalRows: number
}

const TRIAD_DIFFICULTIES: Difficulty[] = ['easy', 'medium', 'hard']

function isTriadDifficulty(value: string | null | undefined): value is Difficulty {
  return value === 'easy' || value === 'medium' || value === 'hard'
}

export function summarizeCsUnderstandingTriads(rows: CsUnderstandingTriadRow[]): CsUnderstandingTriadSummary {
  const understandingRows = rows.filter(row => row.question_usage_scope === 'understanding_only')
  const grouped = new Map<string, Set<Difficulty>>()

  for (const row of understandingRows) {
    const key = row.topic_key ?? row.id
    if (!grouped.has(key)) grouped.set(key, new Set<Difficulty>())
    if (isTriadDifficulty(row.difficulty)) {
      grouped.get(key)?.add(row.difficulty)
    }
  }

  let completeTopics = 0
  for (const difficulties of grouped.values()) {
    if (TRIAD_DIFFICULTIES.every(difficulty => difficulties.has(difficulty))) {
      completeTopics += 1
    }
  }

  return {
    totalTopics: grouped.size,
    completeTopics,
    incompleteTopics: grouped.size - completeTopics,
    totalRows: understandingRows.length,
  }
}
