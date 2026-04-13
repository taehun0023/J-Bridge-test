-- 00169_fix_writing_explanation.sql
-- writing quiz_questions の explanation を正解文のみに修正
-- 既存: "term_ja\n---\nexample_sentence" → 修正後: "example_sentence" のみ

UPDATE quiz_questions
SET explanation = SPLIT_PART(explanation, E'\n---\n', 2)
WHERE question_category = 'writing'
  AND explanation LIKE E'%\n---\n%';

-- it_glossary category CHECK に 'writing' 追加
ALTER TABLE it_glossary DROP CONSTRAINT IF EXISTS it_glossary_category_check;
ALTER TABLE it_glossary ADD CONSTRAINT it_glossary_category_check
  CHECK (category IN ('it', 'dev', 'business', 'expression', 'sentence_pattern', 'keigo', 'writing'));
