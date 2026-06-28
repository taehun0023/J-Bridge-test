BEGIN;

-- ===== Set1 問題7 (41〜45): 末尾の質問プロンプト追加 =====
UPDATE quiz_questions SET question_text = question_text || E'\n\n（ 41 ）に入れるのに最もよいものを選びなさい。'
WHERE id = 'aee10041-0000-0000-0000-000000000001';

UPDATE quiz_questions SET question_text = question_text || E'\n\n（ 42 ）に入れるのに最もよいものを選びなさい。'
WHERE id = 'aee10042-0000-0000-0000-000000000001';

UPDATE quiz_questions SET question_text = question_text || E'\n\n（ 43 ）に入れるのに最もよいものを選びなさい。'
WHERE id = 'aee10043-0000-0000-0000-000000000001';

UPDATE quiz_questions SET question_text = question_text || E'\n\n（ 44 ）に入れるのに最もよいものを選びなさい。'
WHERE id = 'aee10044-0000-0000-0000-000000000001';

UPDATE quiz_questions SET question_text = question_text || E'\n\n（ 45 ）に入れるのに最もよいものを選びなさい。'
WHERE id = 'aee10045-0000-0000-0000-000000000001';

-- 確認
SELECT id, right(question_text, 50) as tail FROM quiz_questions
WHERE id IN (
  'aee10041-0000-0000-0000-000000000001',
  'aee10042-0000-0000-0000-000000000001',
  'aee10043-0000-0000-0000-000000000001',
  'aee10044-0000-0000-0000-000000000001',
  'aee10045-0000-0000-0000-000000000001'
)
ORDER BY id;

COMMIT;
