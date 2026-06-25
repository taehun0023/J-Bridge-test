-- ============================================================
-- JLPT N1 모의시험 3세트 — 기존 로컬 JLPT 문항(이해도테스트 콘텐츠) 재활용.
-- 제목 접두사로 레벨이 구분된 N1 문항(N1 文法/漢字/読解/聴解/語彙 テスト)에서
-- 세트당 言語知識15 + 読解6 + 聴解6 = 27문을 랜덤·비중복 분배.
-- (기존 hand-authored set1/컨테이너는 정리)
-- ============================================================

-- 0) 기존 N1 모의시험 정리
DELETE FROM jlpt_mock_sets WHERE level = 'N1';  -- junction은 CASCADE
DELETE FROM quizzes WHERE id IN (
  'ab000001-0000-0000-0000-000000000111',
  'ab000001-0000-0000-0000-000000000112',
  'ab000001-0000-0000-0000-000000000113'
);  -- hand-authored 컨테이너 + 그 문항/보기 CASCADE

-- 1) 3개 세트
INSERT INTO jlpt_mock_sets (id, level, set_no, title, time_limit_minutes, section_config, is_published) VALUES
('aa000001-0000-0000-0000-000000000011', 'N1', 1, 'N1 模擬試験 1', 60, '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":15,"pass_pct":70},{"section":"dokkai","label":"読解","question_count":6,"pass_pct":70},{"section":"choukai","label":"聴解","question_count":6,"pass_pct":70}]'::jsonb, true),
('aa000001-0000-0000-0000-000000000012', 'N1', 2, 'N1 模擬試験 2', 60, '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":15,"pass_pct":70},{"section":"dokkai","label":"読解","question_count":6,"pass_pct":70},{"section":"choukai","label":"聴解","question_count":6,"pass_pct":70}]'::jsonb, true),
('aa000001-0000-0000-0000-000000000013', 'N1', 3, 'N1 模擬試験 3', 60, '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":15,"pass_pct":70},{"section":"dokkai","label":"読解","question_count":6,"pass_pct":70},{"section":"choukai","label":"聴解","question_count":6,"pass_pct":70}]'::jsonb, true);

-- 2) 言語知識 (grammar+kanji+vocab) — 45문 → 세트별 15
WITH picked AS (
  SELECT qq.id
  FROM quiz_questions qq JOIN quizzes q ON q.id = qq.quiz_id
  WHERE q.quiz_type IN ('jlpt_grammar','jlpt_kanji','jlpt_vocab')
    AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模試%'
  ORDER BY random() LIMIT 45
), num AS (SELECT id, row_number() OVER () AS rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013'])[((rn-1)/15)+1]::uuid,
       id, 'gengo_chishiki', ((rn-1)%15)+1
FROM num;

-- 3) 読解 — 18문 → 세트별 6
WITH picked AS (
  SELECT qq.id
  FROM quiz_questions qq JOIN quizzes q ON q.id = qq.quiz_id
  WHERE q.quiz_type = 'jlpt_reading'
    AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模試%'
  ORDER BY random() LIMIT 18
), num AS (SELECT id, row_number() OVER () AS rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013'])[((rn-1)/6)+1]::uuid,
       id, 'dokkai', ((rn-1)%6)+1
FROM num;

-- 4) 聴解 — 18문 → 세트별 6
WITH picked AS (
  SELECT qq.id
  FROM quiz_questions qq JOIN quizzes q ON q.id = qq.quiz_id
  WHERE q.quiz_type = 'jlpt_listening'
    AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模試%'
  ORDER BY random() LIMIT 18
), num AS (SELECT id, row_number() OVER () AS rn FROM picked)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT (ARRAY['aa000001-0000-0000-0000-000000000011','aa000001-0000-0000-0000-000000000012','aa000001-0000-0000-0000-000000000013'])[((rn-1)/6)+1]::uuid,
       id, 'choukai', ((rn-1)%6)+1
FROM num;
