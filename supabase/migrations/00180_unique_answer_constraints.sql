-- ============================================================
-- 00180_unique_answer_constraints.sql
-- ============================================================
-- 이중 제출 레이스 대응: 동시 제출 시 같은 문제의 답안 행이 중복 삽입될 수
-- 있었다 (UNIQUE 제약 없음). 기존 중복 행을 정리한 뒤 제약을 추가한다.
-- 앱 측 대응(같은 커밋): submitExam/submitQuizAnswers 완료 update에 상태 가드,
-- 제출 페이로드의 문항 중복 제거 (quiz.ts / assessment.ts / execution.ts).

BEGIN;

-- 기존 중복 제거 (id가 가장 작은 행 유지)
DELETE FROM comprehensive_exam_answers a
USING comprehensive_exam_answers b
WHERE a.exam_id = b.exam_id
  AND a.question_id = b.question_id
  AND a.id > b.id;

DELETE FROM quiz_answers a
USING quiz_answers b
WHERE a.attempt_id = b.attempt_id
  AND a.question_id = b.question_id
  AND a.id > b.id;

-- UNIQUE 제약 (재실행 안전: 이미 있으면 무시)
DO $$ BEGIN
  ALTER TABLE comprehensive_exam_answers
    ADD CONSTRAINT comprehensive_exam_answers_exam_question_key UNIQUE (exam_id, question_id);
EXCEPTION WHEN duplicate_table OR duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  ALTER TABLE quiz_answers
    ADD CONSTRAINT quiz_answers_attempt_question_key UNIQUE (attempt_id, question_id);
EXCEPTION WHEN duplicate_table OR duplicate_object THEN NULL; END $$;

COMMIT;
