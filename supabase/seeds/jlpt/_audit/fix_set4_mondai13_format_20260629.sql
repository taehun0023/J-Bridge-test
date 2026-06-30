-- Set 4 問題13 情報検索: 問N: → 問Ｎ　 (Set 1 기준)
UPDATE quiz_questions
SET question_text =
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
    question_text,
    '問1：', '問１　'),
    '問2：', '問２　'),
    '問3：', '問３　'),
    '問4：', '問４　'),
    '問5：', '問５　'),
    '問6：', '問６　'),
    '問7：', '問７　'),
    '問8：', '問８　'),
    '問9：', '問９　'),
    '問10：', '問１０　')
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no = 4
    AND msq.section = 'dokkai' AND msq.daimon = 13
);

-- 확인
SELECT msq.sort_order, RIGHT(qq.question_text, 100) AS tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 4
  AND msq.section = 'dokkai' AND msq.daimon = 13
ORDER BY msq.sort_order;
