-- ============================================
-- 누락된 UPDATE RLS 정책 추가
-- quiz_attempts, code_submissions, coding_exam_attempts
-- ============================================

-- quiz_attempts: submitQuizAnswers()에서 score/passed/completed_at UPDATE 필요
CREATE POLICY "Users can update own quiz_attempts"
  ON quiz_attempts FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- code_submissions: submitCode()에서 status/passed_test_cases UPDATE 필요
CREATE POLICY "Users can update own code_submissions"
  ON code_submissions FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- coding_exam_attempts: 시험 완료 시 UPDATE 필요
CREATE POLICY "Users can update own coding_exam_attempts"
  ON coding_exam_attempts FOR UPDATE USING ((SELECT auth.uid()) = user_id);
