-- N2 모의시험 4·5세트 추가. 기존 1~3세트는 그대로 두고, 아직 모의에 안 쓰인 문항만 배분(겹침 0).
-- 세트당 言語知識15 + 読解6 + 聴解6 = 27. (N2 풀: 読解 남은12=정확히 2세트분, 聴解 남은12, 言語知識 충분)
\set ON_ERROR_STOP on

INSERT INTO jlpt_mock_sets (id, level, set_no, title, time_limit_minutes, section_config, is_published) VALUES
('aa000002-0000-0000-0000-000000000024','N2',4,'N2 模擬試験 4',60,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":15,"pass_pct":70},{"section":"dokkai","label":"読解","question_count":6,"pass_pct":70},{"section":"choukai","label":"聴解","question_count":6,"pass_pct":70}]'::jsonb,true),
('aa000002-0000-0000-0000-000000000025','N2',5,'N2 模擬試験 5',60,'[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":15,"pass_pct":70},{"section":"dokkai","label":"読解","question_count":6,"pass_pct":70},{"section":"choukai","label":"聴解","question_count":6,"pass_pct":70}]'::jsonb,true);

-- 言語知識 30문(미사용) → 세트별 15
WITH picked AS (
  SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id
  WHERE q.quiz_type IN ('jlpt_grammar','jlpt_kanji','jlpt_vocab') AND q.title LIKE 'N2%'
    AND q.title NOT LIKE '%模%'
    AND qq.id NOT IN (SELECT question_id FROM jlpt_mock_set_questions)
  ORDER BY random() LIMIT 30
), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/15)+1]::uuid, id, 'gengo_chishiki', ((rn-1)%15)+1 FROM num;

-- 読解 12문(미사용) → 세트별 6
WITH picked AS (
  SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id
  WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%'
    AND qq.id NOT IN (SELECT question_id FROM jlpt_mock_set_questions)
  ORDER BY random() LIMIT 12
), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/6)+1]::uuid, id, 'dokkai', ((rn-1)%6)+1 FROM num;

-- 聴解 12문(미사용) → 세트별 6
WITH picked AS (
  SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id
  WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%'
    AND qq.id NOT IN (SELECT question_id FROM jlpt_mock_set_questions)
  ORDER BY random() LIMIT 12
), num AS (SELECT id, row_number() OVER () rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000002-0000-0000-0000-000000000024','aa000002-0000-0000-0000-000000000025'])[((rn-1)/6)+1]::uuid, id, 'choukai', ((rn-1)%6)+1 FROM num;
