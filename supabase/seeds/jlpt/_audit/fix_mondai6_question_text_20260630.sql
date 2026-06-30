-- 問題6 文の組み立て: question_text에서 지시문 제거, 문장만 남김
-- "次の文の ★ に入る最もよいものはどれか。\n\n文章" → "文章"
UPDATE quiz_questions
  SET question_text = trim(split_part(question_text, E'\n\n', 2))
  WHERE id IN (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3,4,5)
      AND msq.section = 'gengo_chishiki' AND msq.daimon = 6
  )
  AND question_text LIKE '次の文の%' AND position(E'\n\n' IN question_text) > 0;

-- 확인
SELECT ms.set_no, msq.sort_order, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3,4,5)
  AND msq.section = 'gengo_chishiki' AND msq.daimon = 6
ORDER BY ms.set_no, msq.sort_order;
