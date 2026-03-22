'use server'

import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { ERR, type ActionResult } from '@/lib/action-types'
import {
  buildCsGovernanceInventory,
  buildCsShortageTable,
  type CsGovernanceRow,
} from '@/lib/cs-governance-inventory'
import { CS_COMPREHENSIVE_CATEGORIES } from '@/lib/assessment-config'
import { CS_QUIZ_SET_DEFINITIONS } from '@/lib/cs-quiz'

const CS_UNDERSTANDING_CATEGORIES = [...new Set(CS_QUIZ_SET_DEFINITIONS.map(def => def.questionCategory))]

export async function getCsGovernanceInventory(): Promise<ActionResult<{
  inventory: ReturnType<typeof buildCsGovernanceInventory>
  shortages: ReturnType<typeof buildCsShortageTable>
}>> {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error ?? ERR.FORBIDDEN }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const { data, error } = await serviceClient
    .from('quiz_questions')
    .select('id, question_category, difficulty, curriculum_status, question_usage_scope')
    .in('question_category', [...CS_COMPREHENSIVE_CATEGORIES, ...CS_UNDERSTANDING_CATEGORIES])
    .eq('is_published', true)

  if (error) return { error: error.message }

  const rows = (data ?? []) as CsGovernanceRow[]
  const inventory = buildCsGovernanceInventory(rows)
  const shortages = buildCsShortageTable(inventory)

  return { success: true, inventory, shortages }
}
