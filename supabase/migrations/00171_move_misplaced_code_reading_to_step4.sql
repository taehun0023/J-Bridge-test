-- ============================================================
-- 00171_move_misplaced_code_reading_to_step4.sql
--
-- 00170_coding_learning.sql 의 UUID 충돌 (a0000001-...0001/0002/0003 이
-- Step 1 JLPT 생활일본어 종합시험 quiz 와 충돌) 로 인해 dev 코드 해석
-- 문제들이 Step 1 quiz_questions 에 잘못 삽입된 상태를 정정한다.
--
-- Java/JavaScript/SQL code_reading 문제들을 quiz_id = a0000004-...0004
-- (Step 4 開発実務総合試験) 로 재할당한다.
--
-- Idempotent: 재실행해도 0행 영향.
-- 00170 자체는 별도로 비충돌 UUID (c0de0001-...) 로 수정됨 — fresh DB
-- 적용 시 충돌이 발생하지 않으므로 본 00171 은 broken 상태인 기존 DB
-- 만 정정한다.
-- ============================================================

BEGIN;

-- 롤백용 백업 (이미 존재하면 만들지 않음)
CREATE TABLE IF NOT EXISTS _backup_00171_misplaced_code_reading AS
SELECT id, quiz_id AS original_quiz_id, sort_order AS original_sort_order
FROM quiz_questions
WHERE quiz_id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000001-0000-0000-0000-000000000002',
  'a0000001-0000-0000-0000-000000000003'
)
AND question_type = 'code_reading'
AND question_category IN ('java','javascript','sql','spring_boot','react','cwf','python','nextjs');

-- 이동 (sort_order 재할당 — Step 4 의 max + ROW_NUMBER)
WITH base AS (
  SELECT COALESCE(MAX(sort_order), 0) AS s
  FROM quiz_questions
  WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
),
moved AS (
  SELECT id, ROW_NUMBER() OVER (ORDER BY quiz_id, sort_order, id) AS rn
  FROM quiz_questions
  WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000001-0000-0000-0000-000000000002',
    'a0000001-0000-0000-0000-000000000003'
  )
  AND question_type = 'code_reading'
  AND question_category IN ('java','javascript','sql','spring_boot','react','cwf','python','nextjs')
)
UPDATE quiz_questions q
SET quiz_id    = 'a0000004-0000-0000-0000-000000000004',
    sort_order = base.s + moved.rn
FROM moved, base
WHERE q.id = moved.id;

-- 사후 검증 (남은 행이 있으면 트랜잭션 롤백)
DO $$
DECLARE remaining INT;
BEGIN
  SELECT COUNT(*) INTO remaining
  FROM quiz_questions
  WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000001-0000-0000-0000-000000000002',
    'a0000001-0000-0000-0000-000000000003'
  )
  AND question_type = 'code_reading';
  IF remaining > 0 THEN
    RAISE EXCEPTION '00171: Step 1 에 code_reading 행이 여전히 % 건 남음', remaining;
  END IF;
END $$;

COMMIT;

NOTIFY pgrst, 'reload schema';
