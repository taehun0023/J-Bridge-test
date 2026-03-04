-- 00088: Fix pool quiz settings (questions_per_attempt + time_limit_minutes)
-- 語彙: 100問/30分, 文法: 20問/20分, 読解: 20問/20分, 聴解: 20問/25分

-- 語彙: 100問 / 30分
UPDATE quizzes SET questions_per_attempt = 100, time_limit_minutes = 30
WHERE quiz_type = 'jlpt_vocab' AND is_pool = true;

-- 文法: 20問 / 20分
UPDATE quizzes SET questions_per_attempt = 20, time_limit_minutes = 20
WHERE quiz_type = 'jlpt_grammar' AND is_pool = true;

-- 読解: 20問 / 20分
UPDATE quizzes SET questions_per_attempt = 20, time_limit_minutes = 20
WHERE quiz_type = 'jlpt_reading' AND is_pool = true;

-- 聴解: 20問 / 25分
UPDATE quizzes SET questions_per_attempt = 20, time_limit_minutes = 25
WHERE quiz_type = 'jlpt_listening' AND is_pool = true;
