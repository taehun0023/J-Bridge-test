-- 問題13 情報検索: 問Ｎ　(全角) → 問N：(半角+コロン) 全セット統一
UPDATE quiz_questions
SET question_text =
  replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
    replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(
    question_text,
    '問１　', '問1：'),
    '問２　', '問2：'),
    '問３　', '問3：'),
    '問４　', '問4：'),
    '問５　', '問5：'),
    '問６　', '問6：'),
    '問７　', '問7：'),
    '問８　', '問8：'),
    '問９　', '問9：'),
    '問１０　', '問10：'),
    '問１１　', '問11：'),
    '問１２　', '問12：'),
    '問１　', '問1：'),
    '問２　', '問2：'),
    '問３　', '問3：'),
    '問４　', '問4：'),
    '問５　', '問5：'),
    '問６　', '問6：'),
    '問７　', '問7：'),
    '問８　', '問8：')
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no IN (1, 2, 3, 4)
    AND msq.section = 'dokkai' AND msq.daimon = 13
);

-- 확인
SELECT ms.set_no, msq.sort_order, RIGHT(qq.question_text, 80) AS tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3,4)
  AND msq.section = 'dokkai' AND msq.daimon = 13
ORDER BY ms.set_no, msq.sort_order;
