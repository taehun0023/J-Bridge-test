-- ============================================
-- Migration 00089: Business JP category/difficulty remap
-- Step2 (ビジネス日本語) 종합시험 블렌딩 대응
-- ============================================

-- ──────────────────────────────────────────────
-- 0. Extend difficulty CHECK to include 初級/中級/上級
-- ──────────────────────────────────────────────
ALTER TABLE quiz_questions DROP CONSTRAINT IF EXISTS quiz_questions_difficulty_check;
ALTER TABLE quiz_questions ADD CONSTRAINT quiz_questions_difficulty_check
  CHECK (difficulty IN ('easy','medium','hard','N5','N4','N3','N2','N1','初級','中級','上級'));

-- ──────────────────────────────────────────────
-- 1. Assessment quiz (a0000002): remap categories
--    vocab → vocabulary, fill_blank → sentence_pattern, reading unchanged
-- ──────────────────────────────────────────────
UPDATE quiz_questions
SET question_category = 'vocabulary'
WHERE quiz_id = 'a0000002-0000-0000-0000-000000000002'
  AND question_category = 'vocab';

UPDATE quiz_questions
SET question_category = 'sentence_pattern'
WHERE quiz_id = 'a0000002-0000-0000-0000-000000000002'
  AND question_category = 'fill_blank';

-- ──────────────────────────────────────────────
-- 2. Assessment quiz (a0000002): remap difficulty
--    easy → 初級, medium → 中級, hard → 上級
-- ──────────────────────────────────────────────
UPDATE quiz_questions
SET difficulty = '初級'
WHERE quiz_id = 'a0000002-0000-0000-0000-000000000002'
  AND difficulty = 'easy';

UPDATE quiz_questions
SET difficulty = '中級'
WHERE quiz_id = 'a0000002-0000-0000-0000-000000000002'
  AND difficulty = 'medium';

UPDATE quiz_questions
SET difficulty = '上級'
WHERE quiz_id = 'a0000002-0000-0000-0000-000000000002'
  AND difficulty = 'hard';

-- ──────────────────────────────────────────────
-- 3. Practice quizzes: set question_category
-- ──────────────────────────────────────────────

-- IT vocabulary (b1000001~b1000005): question_category = 'vocabulary'
UPDATE quiz_questions
SET question_category = 'vocabulary'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
);

-- Sentence patterns (b2000001~b2000003): question_category = 'sentence_pattern'
UPDATE quiz_questions
SET question_category = 'sentence_pattern'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
);

-- Business expressions (b3000001~b3000003): question_category = 'business_expression'
UPDATE quiz_questions
SET question_category = 'business_expression'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
);

-- ──────────────────────────────────────────────
-- 4. Practice quizzes: set difficulty by sort_order
--    初級 20% / 中級 40% / 上級 40%
-- ──────────────────────────────────────────────

-- IT vocabulary (50 questions each): 初級 1-10, 中級 11-30, 上級 31-50
UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 11 AND 30;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 31 AND 50;

-- Sentence patterns (10 questions each): 初級 1-2, 中級 3-6, 上級 7-10
UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 1 AND 2;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 3 AND 6;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 7 AND 10;

-- Business expressions (20 questions each): 初級 1-4, 中級 5-12, 上級 13-20
UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 1 AND 4;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 5 AND 12;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 13 AND 20;
