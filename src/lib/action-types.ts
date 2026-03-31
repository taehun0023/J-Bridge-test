/**
 * Standardized Server Action response types.
 *
 * Usage:
 *   async function myAction(): Promise<ActionResult<{ id: string }>> { ... }
 *
 * Error convention:
 *   - User-facing errors: Japanese (日本語)
 *   - System/config errors: English
 *   - DB errors: pass through error.message as-is
 */

/** Error response from a Server Action */
export type ActionError = { error: string }

/** Success response with optional payload */
export type ActionSuccess<T = Record<string, never>> = { success: true } & T

/** Union type: either an error or a success with optional data */
export type ActionResult<T = Record<string, never>> = ActionError | ActionSuccess<T>

// ─── Common error messages ───

/** Auth / Permission errors (reused across all action files via auth-helpers) */
export const ERR = {
  // Auth (used by auth-helpers.ts)
  AUTH_REQUIRED: '認証が必要です',
  FORBIDDEN: '権限がありません',
  SERVICE_KEY_MISSING: 'Service role key not configured',

  // Validation
  REQUIRED_FIELDS: '必須フィールドをすべて入力してください',
  INVALID_INPUT: '入力内容が正しくありません',

  // Not found
  NOT_FOUND: '見つかりません',
  QUIZ_NOT_FOUND: 'クイズが見つかりません',
  EXAM_NOT_FOUND: '試験が見つかりません',

  // State
  ALREADY_REQUESTED: '既にリクエスト済みです',
  QUESTION_IN_ACTIVE_EXAM: '進行中の試験で使用されている問題は編集できません',
} as const
