'use server'

import { createSubmission, pollSubmissionResult, getLanguageId, mapJudge0Status } from '@/lib/judge0/client'
import { analyzeCode } from '@/lib/code-review/analyzer'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { recalculateUserScores } from '@/modules/scoring'

export async function submitCode(problemId: string, sourceCode: string, language: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Get all test cases for this problem
  const { data: testCases } = await supabase
    .from('coding_test_cases')
    .select('*')
    .eq('problem_id', problemId)
    .order('sort_order', { ascending: true })

  if (!testCases?.length) return { error: 'テストケースがありません' }

  // Create initial submission record
  const { data: submission, error: insertError } = await supabase
    .from('code_submissions')
    .insert({
      user_id: user.id,
      problem_id: problemId,
      language,
      source_code: sourceCode,
      status: 'running',
      total_test_cases: testCases.length,
    })
    .select('id')
    .single()

  if (insertError || !submission) return { error: '提出作成失敗: ' + (insertError?.message ?? 'unknown') }

  try {
    let passedCount = 0
    let finalStatus = 'accepted'
    const results: { input: string; expected: string; actual: string | null; status: string; isSample: boolean }[] = []

    for (const tc of testCases) {
      const token = await createSubmission({
        source_code: sourceCode,
        language_id: getLanguageId(language),
        stdin: tc.input,
        expected_output: tc.expected_output,
      })

      const result = await pollSubmissionResult(token)
      const status = mapJudge0Status(result.status.id)

      if (status === 'accepted') {
        passedCount++
      } else if (finalStatus === 'accepted') {
        finalStatus = status
      }

      results.push({
        input: tc.input,
        expected: tc.expected_output,
        actual: result.stdout?.trim() ?? result.compile_output ?? result.stderr ?? null,
        status,
        isSample: tc.is_sample,
      })
    }

    // Update submission
    await supabase
      .from('code_submissions')
      .update({
        status: passedCount === testCases.length ? 'accepted' : finalStatus,
        passed_test_cases: passedCount,
        execution_time_ms: null,
      })
      .eq('id', submission.id)

    // Run automated code review
    const reviewItems = analyzeCode(sourceCode, language)
    if (reviewItems.length > 0) {
      await supabase.from('code_reviews').insert(
        reviewItems.map(r => ({
          submission_id: submission.id,
          review_type: r.review_type,
          feedback: r.feedback,
          severity: r.severity,
          line_number: r.line_number,
        }))
      )
    }

    revalidatePath('/coding/problems')

    // Recalculate user scores after coding submission
    recalculateUserScores(user.id).catch((err) =>
      console.error('[Score Recalculation Failed]', user.id, err)
    )

    return {
      submissionId: submission.id,
      status: passedCount === testCases.length ? 'accepted' : finalStatus,
      passedCount,
      totalCount: testCases.length,
      results: results.filter(r => r.isSample), // Only return sample test case results
      reviews: reviewItems.map(r => ({
        feedback: r.feedback,
        severity: r.severity,
        line_number: r.line_number,
        review_type: r.review_type,
      })),
    }
  } catch (err) {
    // Update submission as runtime error
    await supabase
      .from('code_submissions')
      .update({ status: 'runtime_error' })
      .eq('id', submission.id)

    const message = err instanceof Error ? err.message : String(err)
    const isJudge0Error = message.includes('Judge0') || message.includes('submission')
    return {
      error: isJudge0Error
        ? `コード実行サーバー接続失敗: ${message}`
        : `コード実行中にエラーが発生しました: ${message}`,
    }
  }
}

export async function runCode(sourceCode: string, language: string, input: string) {
  const auth = await requireAuth()
  if ('error' in auth) {
    return { error: auth.error, output: '', status: 'runtime_error', time: null, memory: null }
  }

  try {
    const token = await createSubmission({
      source_code: sourceCode,
      language_id: getLanguageId(language),
      stdin: input,
    })

    const result = await pollSubmissionResult(token)

    return {
      output: result.stdout ?? '',
      error: result.stderr ?? result.compile_output ?? '',
      status: mapJudge0Status(result.status.id),
      time: result.time,
      memory: result.memory,
    }
  } catch {
    return { error: 'コード実行中にエラーが発生しました', output: '', status: 'runtime_error', time: null, memory: null }
  }
}
