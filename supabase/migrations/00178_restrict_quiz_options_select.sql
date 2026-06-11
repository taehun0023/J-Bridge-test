-- ============================================================
-- 00178_restrict_quiz_options_select.sql
-- ============================================================
-- 보안 수정 (C1): quiz_question_options의 SELECT 정책이 authenticated 전체에
-- 열려 있어, 로그인한 누구나 base 테이블을 직접 조회해 모든 문제의 정답
-- (is_correct)을 읽을 수 있었다 (00013_rls_policies.sql:85-86).
--
-- 멘티 화면 표시는 quiz_question_options_safe 뷰(is_correct 제외, security
-- definer 뷰라 base 테이블 RLS의 영향을 받지 않음)로만 이루어지므로,
-- base 테이블 SELECT는 admin/mentor로 제한한다. admin은 기존
-- "Admins can manage quiz_question_options" (FOR ALL USING (is_admin()))
-- 정책으로도 커버된다.
--
-- 앱 측 대응 (같은 커밋에서 is_correct 조회를 service role로 전환):
--   - quiz.ts submitQuizAnswers / assessment.ts submitAssessment (채점)
--   - review.ts getQuizAttemptReview / getCompExamReview (본인 리뷰)
--   - coding/problems/page.tsx (코드리딩 연습 퀴즈)

DROP POLICY IF EXISTS "Authenticated users can view quiz_options" ON quiz_question_options;

DROP POLICY IF EXISTS "Admins and mentors can view quiz_options" ON quiz_question_options;
CREATE POLICY "Admins and mentors can view quiz_options"
  ON quiz_question_options FOR SELECT USING (is_admin_or_mentor());
