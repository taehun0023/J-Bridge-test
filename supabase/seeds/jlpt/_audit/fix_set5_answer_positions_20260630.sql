-- Set 5 정답 위치 편중 수정: gengo(Q1-Q45) + choukai daimon 1/2/3/5 (4択のみ)
-- 정답 내용은 그대로, sort_order만 SWAP (cycling 1→2→3→4→1...)
DO $$
DECLARE
  set_id_var UUID;
  q RECORD;
  correct_so INTEGER;
  target_so INTEGER;
  p INTEGER;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=5;

  -- 言語知識 Q1-Q45
  p := 0;
  FOR q IN
    SELECT msq.question_id
    FROM jlpt_mock_set_questions msq
    WHERE msq.set_id = set_id_var AND msq.section = 'gengo_chishiki'
    ORDER BY msq.sort_order
  LOOP
    p := p + 1;
    target_so := ((p - 1) % 4) + 1;

    SELECT sort_order INTO correct_so
      FROM quiz_question_options
      WHERE question_id = q.question_id AND is_correct = true LIMIT 1;

    IF correct_so IS NOT NULL AND correct_so != target_so THEN
      UPDATE quiz_question_options SET sort_order = 999
        WHERE question_id = q.question_id AND sort_order = correct_so;
      UPDATE quiz_question_options SET sort_order = correct_so
        WHERE question_id = q.question_id AND sort_order = target_so;
      UPDATE quiz_question_options SET sort_order = target_so
        WHERE question_id = q.question_id AND sort_order = 999;
    END IF;
  END LOOP;

  -- 聴解 daimon 1/2/3/5 (4択, 即時応答=daimon4は3択なのでスキップ)
  p := 0;
  FOR q IN
    SELECT msq.question_id
    FROM jlpt_mock_set_questions msq
    WHERE msq.set_id = set_id_var AND msq.section = 'choukai'
      AND msq.daimon IN (1, 2, 3, 5)
    ORDER BY msq.daimon, msq.sort_order
  LOOP
    p := p + 1;
    target_so := ((p - 1) % 4) + 1;

    SELECT sort_order INTO correct_so
      FROM quiz_question_options
      WHERE question_id = q.question_id AND is_correct = true LIMIT 1;

    IF correct_so IS NOT NULL AND correct_so != target_so THEN
      UPDATE quiz_question_options SET sort_order = 999
        WHERE question_id = q.question_id AND sort_order = correct_so;
      UPDATE quiz_question_options SET sort_order = correct_so
        WHERE question_id = q.question_id AND sort_order = target_so;
      UPDATE quiz_question_options SET sort_order = target_so
        WHERE question_id = q.question_id AND sort_order = 999;
    END IF;
  END LOOP;

END$$;

-- 결과 확인
SELECT
  count(*) FILTER (WHERE ans = 1) AS "1번",
  count(*) FILTER (WHERE ans = 2) AS "2번",
  count(*) FILTER (WHERE ans = 3) AS "3번",
  count(*) FILTER (WHERE ans = 4) AS "4번"
FROM (
  SELECT qo.sort_order AS ans
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_question_options qo
    ON qo.question_id = msq.question_id AND qo.is_correct = true
  WHERE ms.level='N1' AND ms.set_no=5
) t;
