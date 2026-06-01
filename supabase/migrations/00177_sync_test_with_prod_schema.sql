-- 00177_sync_test_with_prod_schema.sql
-- 본 서버 (PROD) 와 테스트 DB 비교 결과 누락된 항목을 테스트에 추가.
-- PROD 는 read-only — 본 마이그레이션은 test DB 만 대상.
--
-- 추가 항목:
--   1. comprehensive_exam_questions 테이블 + 인덱스 + RLS 정책 (원본: 00117)
--   2. quiz_questions 컬럼: lesson_mapping, question_usage_scope (원본: 00118)
--   3. quiz_questions 컬럼: topic_key (원본: 00141)

BEGIN;

-- ============================================
-- 1. comprehensive_exam_questions
-- ============================================
CREATE TABLE IF NOT EXISTS comprehensive_exam_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID NOT NULL REFERENCES comprehensive_exams(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  question_category TEXT,
  difficulty TEXT,
  sort_order SMALLINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (exam_id, question_id),
  UNIQUE (exam_id, sort_order)
);

CREATE INDEX IF NOT EXISTS idx_comprehensive_exam_questions_exam
  ON comprehensive_exam_questions(exam_id, sort_order);

CREATE INDEX IF NOT EXISTS idx_comprehensive_exam_questions_question
  ON comprehensive_exam_questions(question_id);

ALTER TABLE comprehensive_exam_questions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "admin_read" ON comprehensive_exam_questions;
CREATE POLICY "admin_read" ON comprehensive_exam_questions FOR SELECT USING (is_admin());

DROP POLICY IF EXISTS "user_own" ON comprehensive_exam_questions;
CREATE POLICY "user_own" ON comprehensive_exam_questions FOR ALL USING (
  EXISTS (
    SELECT 1
    FROM comprehensive_exams
    WHERE comprehensive_exams.id = comprehensive_exam_questions.exam_id
      AND comprehensive_exams.user_id = auth.uid()
  )
);

-- ============================================
-- 2. quiz_questions 누락 컬럼 추가
-- ============================================
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS question_usage_scope TEXT;
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS lesson_mapping TEXT;
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS topic_key TEXT;

NOTIFY pgrst, 'reload schema';

COMMIT;
