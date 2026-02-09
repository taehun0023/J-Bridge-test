'use server'

import { createClient } from '@/lib/supabase/server'
import { createSubmission, pollSubmissionResult, getLanguageId, mapJudge0Status } from '@/lib/judge0/client'
import { analyzeCode } from '@/lib/code-review/analyzer'
import { revalidatePath } from 'next/cache'
import { recalculateUserScores } from './scores'

export async function submitCode(problemId: string, sourceCode: string, language: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '인증이 필요합니다' }

  // Get all test cases for this problem
  const { data: testCases } = await supabase
    .from('coding_test_cases')
    .select('*')
    .eq('problem_id', problemId)
    .order('sort_order', { ascending: true })

  if (!testCases?.length) return { error: '테스트 케이스가 없습니다' }

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

  if (insertError || !submission) return { error: '제출 생성 실패: ' + (insertError?.message ?? 'unknown') }

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
    recalculateUserScores(user.id).catch(() => {})

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
        ? `코드 실행 서버 연결 실패: ${message}`
        : `코드 실행 중 오류가 발생했습니다: ${message}`,
    }
  }
}

export async function runCode(sourceCode: string, language: string, input: string) {
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
    return { error: '코드 실행 중 오류가 발생했습니다', output: '', status: 'runtime_error', time: null, memory: null }
  }
}
