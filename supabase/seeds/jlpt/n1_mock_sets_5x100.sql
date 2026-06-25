-- N1 모의시험 100문항 5세트 distinct 재조립.
-- 세트당: 言語知識45(어휘25[vocab+kanji] + 문법20) + 読解25 + 聴解30 = 100. 시간 170분.
-- 풀 비중복 분배(5세트 distinct). 어휘 pool 230·문법100·読解125·聴解150 가정.
\set ON_ERROR_STOP on

DELETE FROM jlpt_mock_sets WHERE level='N1';  -- junction CASCADE

INSERT INTO jlpt_mock_sets (id, level, set_no, title, time_limit_minutes, section_config, is_published) VALUES
('aa000001-0000-0000-0000-000000000011','N1',1,'N1 模擬試験 1',170,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000001-0000-0000-0000-000000000012','N1',2,'N1 模擬試験 2',170,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000001-0000-0000-0000-000000000013','N1',3,'N1 模擬試験 3',170,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000001-0000-0000-0000-000000000014','N1',4,'N1 模擬試験 4',170,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000001-0000-0000-0000-000000000015','N1',5,'N1 模擬試験 5',170,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true);

-- 어휘(vocab+kanji) 125 → 세트별 25, gengo_chishiki, sort 1~25
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type IN ('jlpt_vocab','jlpt_kanji') AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 125), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013','aa000001-0000-0000-0000-000000000014','aa000001-0000-0000-0000-000000000015'])[((rn-1)/25)+1]::uuid, id, 'gengo_chishiki', ((rn-1)%25)+1 FROM num;

-- 문법 100 → 세트별 20, gengo_chishiki, sort 26~45
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_grammar' AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 100), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013','aa000001-0000-0000-0000-000000000014','aa000001-0000-0000-0000-000000000015'])[((rn-1)/20)+1]::uuid, id, 'gengo_chishiki', ((rn-1)%20)+26 FROM num;

-- 読解 125 → 세트별 25, dokkai, sort 1~25
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 125), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013','aa000001-0000-0000-0000-000000000014','aa000001-0000-0000-0000-000000000015'])[((rn-1)/25)+1]::uuid, id, 'dokkai', ((rn-1)%25)+1 FROM num;

-- 聴解 150 → 세트별 30, choukai, sort 1~30
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 150), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013','aa000001-0000-0000-0000-000000000014','aa000001-0000-0000-0000-000000000015'])[((rn-1)/30)+1]::uuid, id, 'choukai', ((rn-1)%30)+1 FROM num;
