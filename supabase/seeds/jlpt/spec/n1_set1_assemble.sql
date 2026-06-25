-- N1 set1을 사양(本番형식) 100문항으로 재구성. (set2/set3은 별도)
DELETE FROM jlpt_mock_set_questions WHERE set_id = 'aa000001-0000-0000-0000-000000000011';

UPDATE jlpt_mock_sets
SET time_limit_minutes = 165,
    section_config = '[{"section":"gengo_chishiki","label":"言語知識（文字・語彙・文法）","question_count":45,"pass_pct":0},{"section":"dokkai","label":"読解","question_count":25,"pass_pct":0},{"section":"choukai","label":"聴解","question_count":30,"pass_pct":0}]'::jsonb
WHERE id = 'aa000001-0000-0000-0000-000000000011';

INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000011', qq.id,
  CASE qq.quiz_id
    WHEN 'ad000001-0000-0000-0000-000000000111' THEN 'gengo_chishiki'
    WHEN 'ad000001-0000-0000-0000-000000000112' THEN 'dokkai'
    WHEN 'ad000001-0000-0000-0000-000000000113' THEN 'choukai'
  END,
  qq.sort_order
FROM quiz_questions qq
WHERE qq.quiz_id IN (
  'ad000001-0000-0000-0000-000000000111',
  'ad000001-0000-0000-0000-000000000112',
  'ad000001-0000-0000-0000-000000000113'
);
