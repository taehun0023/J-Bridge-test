-- N2 공식구성 Set3(107문) 조립: 컨테이너 3개 → jlpt_mock_set_questions (section + daimon + sort_order)
-- set_id = aa000002-0000-0000-0000-000000000023 (N2 set_no=3)
BEGIN;

DELETE FROM jlpt_mock_set_questions WHERE set_id = 'aa000002-0000-0000-0000-000000000023';

UPDATE jlpt_mock_sets
SET time_limit_minutes = 155,
    section_config = '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":54,"pass_pct":0},{"section":"dokkai","label":"読解","question_count":21,"pass_pct":0},{"section":"choukai","label":"聴解","question_count":32,"pass_pct":0}]'::jsonb,
    is_published = true
WHERE id = 'aa000002-0000-0000-0000-000000000023';

INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, sort_order)
SELECT 'aa000002-0000-0000-0000-000000000023', qq.id,
  CASE qq.quiz_id
    WHEN 'ad000002-0000-0000-0000-000000000231' THEN 'gengo_chishiki'
    WHEN 'ad000002-0000-0000-0000-000000000232' THEN 'dokkai'
    WHEN 'ad000002-0000-0000-0000-000000000233' THEN 'choukai'
  END AS section,
  CASE qq.question_subtype
    WHEN 'KANJI_READING' THEN 1 WHEN 'NOTATION' THEN 2 WHEN 'WORD_FORMATION' THEN 3
    WHEN 'CONTEXT_WORD' THEN 4 WHEN 'PARAPHRASE' THEN 5 WHEN 'WORD_USAGE' THEN 6
    WHEN 'GRAMMAR_CHOICE' THEN 7 WHEN 'SENTENCE_ORDER' THEN 8 WHEN 'TEXT_GRAMMAR' THEN 9
    WHEN 'SHORT_READING' THEN 10 WHEN 'MEDIUM_READING' THEN 11 WHEN 'INTEGRATED_READING' THEN 12
    WHEN 'OPINION_READING' THEN 13 WHEN 'INFORMATION_SEARCH' THEN 14
    WHEN 'LISTENING_TASK' THEN 1 WHEN 'LISTENING_POINT' THEN 2 WHEN 'LISTENING_SUMMARY' THEN 3
    WHEN 'LISTENING_QUICK_RESPONSE' THEN 4 WHEN 'LISTENING_INTEGRATED' THEN 5
  END AS daimon,
  qq.sort_order
FROM quiz_questions qq
WHERE qq.quiz_id IN (
  'ad000002-0000-0000-0000-000000000231',
  'ad000002-0000-0000-0000-000000000232',
  'ad000002-0000-0000-0000-000000000233'
);

-- 검증
SELECT section, count(*) FROM jlpt_mock_set_questions
WHERE set_id='aa000002-0000-0000-0000-000000000023' GROUP BY section ORDER BY section;

COMMIT;
