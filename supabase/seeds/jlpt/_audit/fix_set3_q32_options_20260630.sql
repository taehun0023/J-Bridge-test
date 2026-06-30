-- Set 3 Q32 오답 교체: 복수정답 가능성 제거
-- 願うのみだ → 願うにすぎない
-- 願うほかない → 願うとは限らない
DO $$
DECLARE
  qid UUID;
BEGIN
  SELECT msq.question_id INTO qid
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  WHERE ms.level = 'N1' AND ms.set_no = 3
    AND msq.section = 'gengo_chishiki' AND msq.sort_order = 32;

  UPDATE quiz_question_options
    SET option_text = '願うにすぎない'
    WHERE question_id = qid AND is_correct = false AND option_text LIKE '%のみだ%';

  UPDATE quiz_question_options
    SET option_text = '願うとは限らない'
    WHERE question_id = qid AND is_correct = false AND option_text LIKE '%ほかない%';
END$$;

-- 확인
SELECT qo.sort_order, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_question_options qo ON qo.question_id = msq.question_id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'gengo_chishiki' AND msq.sort_order = 32
ORDER BY qo.sort_order;
