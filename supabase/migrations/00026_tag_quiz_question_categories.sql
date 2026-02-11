-- ============================================
-- Tag Quiz 3 (Programming) and Quiz 4 (Framework) questions
-- with question_category for language-group-based selection
-- ============================================

BEGIN;

-- ============================================
-- Quiz 3: Core Programming (a0000003-0000-0000-0000-000000000003)
-- Each difficulty group of 30 → 10 java + 10 javascript + 10 sql
-- ============================================

-- EASY (sort_order 1-30)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 11 AND 20;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 21 AND 30;

-- MEDIUM (sort_order 31-60)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 31 AND 40;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 41 AND 50;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 51 AND 60;

-- HARD (sort_order 61-90)
UPDATE quiz_questions SET question_category = 'java'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 61 AND 70;

UPDATE quiz_questions SET question_category = 'javascript'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 71 AND 80;

UPDATE quiz_questions SET question_category = 'sql'
WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 81 AND 90;

-- ============================================
-- Quiz 4: Framework (a0000004-0000-0000-0000-000000000004)
-- Each difficulty group of 30 → 10 spring_boot + 10 react + 10 db_design
-- ============================================

-- EASY (sort_order 1-30)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 11 AND 20;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 21 AND 30;

-- MEDIUM (sort_order 31-60)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 31 AND 40;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 41 AND 50;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 51 AND 60;

-- HARD (sort_order 61-90)
UPDATE quiz_questions SET question_category = 'spring_boot'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 61 AND 70;

UPDATE quiz_questions SET question_category = 'react'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 71 AND 80;

UPDATE quiz_questions SET question_category = 'db_design'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 81 AND 90;

COMMIT;
