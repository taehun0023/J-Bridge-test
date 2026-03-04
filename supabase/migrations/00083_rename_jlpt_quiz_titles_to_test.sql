-- Rename JLPT practice quiz titles: クイズ → テスト
UPDATE quizzes SET title = REPLACE(title, '文法クイズ', '文法テスト')
  WHERE quiz_type = 'jlpt_grammar' AND title LIKE '%文法クイズ%';

UPDATE quizzes SET title = REPLACE(title, '読解クイズ', '読解テスト')
  WHERE quiz_type = 'jlpt_reading' AND title LIKE '%読解クイズ%';

UPDATE quizzes SET title = REPLACE(title, '聴解クイズ', '聴解テスト')
  WHERE quiz_type = 'jlpt_listening' AND title LIKE '%聴解クイズ%';
