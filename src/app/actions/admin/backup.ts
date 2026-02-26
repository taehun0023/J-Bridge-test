'use server'

import { requireAdmin } from '@/lib/auth-helpers'

/** Whitelist of exportable tables with column selections (sensitive data excluded) */
const TABLE_CONFIGS: Record<string, { label: string; columns: string }> = {
  profiles: {
    label: 'ユーザー',
    columns: 'id, email, full_name, role, mentor_specialty, created_at, updated_at',
  },
  shared_vocab_submissions: {
    label: 'みんなの単語帳',
    columns: 'id, term_ja, term_reading, term_ko, term_en, example_sentence, category, status, submitted_by, created_at',
  },
  quiz_questions: {
    label: 'クイズ問題',
    columns: 'id, quiz_id, question_text, question_type, difficulty, question_category, explanation, points, sort_order, is_published, created_at',
  },
  learning_assignments: {
    label: '学習課題',
    columns: 'id, assigned_by, assigned_to, category, subcategory, content_level, title, description, status, due_date, created_at',
  },
  task_assignments: {
    label: '課題配信',
    columns: 'id, assigned_by, assigned_to, target_type, target_id, title, description, status, due_date, created_at',
  },
  admin_feedbacks: {
    label: 'フィードバック',
    columns: 'id, admin_id, user_id, category, content, created_at',
  },
  coding_problems: {
    label: 'コーディング問題',
    columns: 'id, title, difficulty, language, description, is_published, created_at',
  },
}

export async function getExportableTables() {
  return Object.entries(TABLE_CONFIGS).map(([key, cfg]) => ({
    key,
    label: cfg.label,
  }))
}

export async function exportTableCsv(tableName: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { csv: '' }

  const config = TABLE_CONFIGS[tableName]
  if (!config) return { csv: '' }

  const { supabase } = auth
  const columns = config.columns

  const { data } = await supabase
    .from(tableName)
    .select(columns)
    .order('created_at', { ascending: false })
    .limit(10000)

  if (!data || data.length === 0) return { csv: '' }

  // Build CSV
  const headers = columns.split(',').map(c => c.trim())
  const headerRow = headers.join(',')
  const rows = data.map(row => {
    return headers.map(h => {
      const val = (row as unknown as Record<string, unknown>)[h]
      if (val === null || val === undefined) return ''
      const str = String(val).replace(/"/g, '""')
      return `"${str}"`
    }).join(',')
  })

  return { csv: [headerRow, ...rows].join('\n') }
}
