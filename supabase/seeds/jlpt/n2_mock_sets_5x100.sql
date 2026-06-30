-- N2 모의시험 100문항 구조 5세트 재설계.
-- 세트당: 言語知識50(어휘30[vocab+kanji] + 문법20) + 読解20 + 聴解30 = 100. 시간 155분.
-- 풀에서 비중복 분배(5세트 distinct). 어휘 pool 330·문법100·読解100·聴解150 가정.
\set ON_ERROR_STOP on

DELETE FROM jlpt_mock_sets WHERE level='N2';  -- junction은 CASCADE

INSERT INTO jlpt_mock_sets (id, level, set_no, title, time_limit_minutes, section_config, is_published) VALUES
('aa000002-0000-0000-0000-000000000021','N2',1,'N2 模擬試験 1',155,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":50,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":20,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000002-0000-0000-0000-000000000022','N2',2,'N2 模擬試験 2',155,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":50,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":20,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000002-0000-0000-0000-000000000023','N2',3,'N2 模擬試験 3',155,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":50,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":20,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000002-0000-0000-0000-000000000024','N2',4,'N2 模擬試験 4',155,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":50,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":20,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true),
('aa000002-0000-0000-0000-000000000025','N2',5,'N2 模擬試験 5',155,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":50,"pass_pct":60},{"section":"dokkai","label":"読解","question_count":20,"pass_pct":60},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":60}]'::jsonb,true);

-- 어휘(vocab+kanji) 150 → 세트별 30, gengo_chishiki, sort 1~30
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type IN ('jlpt_vocab','jlpt_kanji') AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 150), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000021','aa000002-0000-0000-0000-000000000022','aa000002-0000-0000-0000-000000000023','aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/30)+1]::uuid, id, 'gengo_chishiki', ((rn-1)%30)+1 FROM num;

-- 문법 100 → 세트별 20, gengo_chishiki, sort 31~50
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_grammar' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 100), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000021','aa000002-0000-0000-0000-000000000022','aa000002-0000-0000-0000-000000000023','aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/20)+1]::uuid, id, 'gengo_chishiki', ((rn-1)%20)+31 FROM num;

-- 読解 100 → 세트별 20, dokkai, sort 1~20
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 100), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000021','aa000002-0000-0000-0000-000000000022','aa000002-0000-0000-0000-000000000023','aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/20)+1]::uuid, id, 'dokkai', ((rn-1)%20)+1 FROM num;

-- 聴解 150 → 세트별 30, choukai, sort 1~30
WITH picked AS (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%' ORDER BY random() LIMIT 150), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000021','aa000002-0000-0000-0000-000000000022','aa000002-0000-0000-0000-000000000023','aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/30)+1]::uuid, id, 'choukai', ((rn-1)%30)+1 FROM num;
