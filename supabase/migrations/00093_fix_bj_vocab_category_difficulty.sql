-- ============================================
-- Migration 00093: Fix BJ vocab NULL category/difficulty
--
-- mock_vocab.sql INSERT omits difficulty/question_category columns,
-- causing NULL values in DB. Migration 00089 ran before seed data existed
-- so its UPDATEs matched 0 rows. This migration fixes existing data
-- using quiz_type-based lookup instead of hardcoded quiz_ids.
-- ============================================

-- ──────────────────────────────────────────────
-- 1. Set question_category = 'vocabulary' for all IT terminology practice questions
-- ──────────────────────────────────────────────
UPDATE quiz_questions
SET question_category = 'vocabulary'
WHERE question_category IS NULL
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'it_terminology'
      AND is_assessment = false
  );

-- ──────────────────────────────────────────────
-- 2. Set difficulty by sort_order ranges
--    初級: 1-10, 中級: 11-30, 上級: 31-50
-- ──────────────────────────────────────────────
UPDATE quiz_questions SET difficulty = '初級'
WHERE difficulty IS NULL
  AND sort_order BETWEEN 1 AND 10
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'it_terminology'
      AND is_assessment = false
  );

UPDATE quiz_questions SET difficulty = '中級'
WHERE difficulty IS NULL
  AND sort_order BETWEEN 11 AND 30
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'it_terminology'
      AND is_assessment = false
  );

UPDATE quiz_questions SET difficulty = '上級'
WHERE difficulty IS NULL
  AND sort_order BETWEEN 31 AND 50
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'it_terminology'
      AND is_assessment = false
  );

-- Fallback: any remaining NULL difficulty → 中級
UPDATE quiz_questions SET difficulty = '中級'
WHERE difficulty IS NULL
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'it_terminology'
      AND is_assessment = false
  );
