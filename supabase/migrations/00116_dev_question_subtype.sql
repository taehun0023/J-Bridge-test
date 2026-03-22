-- Phase 1: Add question_subtype column to quiz_questions
-- Supports 'concept' (知識問題) and 'code_reading' (コード解析) subtypes
-- Used by Step 4 (開発実務) for balanced concept/code question selection

-- 1. Add column with CHECK constraint
ALTER TABLE quiz_questions
ADD COLUMN question_subtype TEXT
CHECK (question_subtype IN ('concept', 'code_reading'));

-- 2. Backfill existing 150 questions in assessment quiz a0000004
-- sort_order 1-90 = concept questions (from quiz4_framework.sql: java_core, js_core, spring_boot, react, sql)
-- sort_order 91-150 = code_reading questions (from quiz4_java_code.sql, quiz4_javascript_code.sql)
UPDATE quiz_questions
SET question_subtype = CASE
  WHEN sort_order <= 90 THEN 'concept'
  ELSE 'code_reading'
END
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004';
