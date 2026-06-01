-- ============================================================
-- Fix Step 4 (Dev Practical) question_subtype and question_category
--
-- Problem 1: 180 seed questions have NULL question_subtype → invisible to fetchStep4DevStyle
-- Problem 2: seed categories (java_code, java_core, javascript_core) don't match
--            the filter categories (java, spring_boot, sql, javascript, react)
-- Problem 3: 이해도テスト code-analysis questions incorrectly marked as 'concept'
-- ============================================================

-- ── Part 1: Fix seed NULL subtype + category unification (quiz_id = a0000004-*) ──

-- 1a) quiz4_framework.sql (90 questions): NULL → concept + category unification
UPDATE quiz_questions
SET question_subtype = 'concept', question_category = 'java'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
  AND question_category = 'java_core'
  AND question_subtype IS NULL;

UPDATE quiz_questions
SET question_subtype = 'concept', question_category = 'javascript'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
  AND question_category = 'javascript_core'
  AND question_subtype IS NULL;

UPDATE quiz_questions
SET question_subtype = 'concept'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
  AND question_category IN ('spring_boot', 'react', 'sql')
  AND question_subtype IS NULL;

-- 1b) quiz4_java_code.sql (30 questions): NULL → code_reading + category unification
UPDATE quiz_questions
SET question_subtype = 'code_reading', question_category = 'java'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
  AND question_category = 'java_code'
  AND question_subtype IS NULL;

-- 1c) quiz4_javascript_code.sql (30 questions): NULL → code_reading + category unification
UPDATE quiz_questions
SET question_subtype = 'code_reading', question_category = 'javascript'
WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004'
  AND question_category = 'javascript_code'
  AND question_subtype IS NULL;

-- ── Part 2: Fix 이해도テスト subtype (source quizzes e1000001-*) ──

UPDATE quiz_questions
SET question_subtype = 'code_reading'
WHERE quiz_id IN (
  'e1000001-0000-0000-0000-000000000001',  -- Java
  'e1000001-0000-0000-0000-000000000002',  -- Spring Boot
  'e1000001-0000-0000-0000-000000000003',  -- SQL
  'e1000001-0000-0000-0000-000000000004',  -- JavaScript
  'e1000001-0000-0000-0000-000000000005',  -- React
  'e1000001-0000-0000-0000-000000000007',  -- CWF
  'e1000001-0000-0000-0000-000000000008',  -- Python
  'e1000001-0000-0000-0000-000000000009'   -- Next.js
)
AND question_subtype = 'concept'
AND (
  question_text LIKE '%次のコードの実行結果%'
  OR question_text LIKE '%次のコードの出力%'
  OR question_text LIKE '%次のコードで出力される%'
  OR question_text LIKE '%次のコードの問題点%'
  OR question_text LIKE '%次のコードでコンパイルエラー%'
  OR question_text LIKE '%次のコードにおいて%'
  OR question_text LIKE '%次のコードで%エラーが発生する%'
  OR question_text LIKE '%を呼び出した場合の戻り値%'
  OR question_text LIKE '%実行後、%の値はどれ%'
  OR question_text LIKE '%を定義した場合の動作%'
  OR question_text LIKE '%を付与した場合の動作%'
  OR question_text LIKE '%出力順序はどれ%'
  OR question_text LIKE '%ポート番号はいくつ%'
  OR question_text LIKE '%内のthis.name%'
  OR question_text LIKE '%の戻り値に対して%'
  OR question_text LIKE '%次のSQLが正しく動作しない%'
);
