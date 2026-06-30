-- Set 4 問題11 統合理解: 【文章A】/【文章B】 → A/B (Set 1 기준)
UPDATE quiz_questions
SET question_text =
  replace(replace(
    question_text,
    '【文章A】', 'A'
  ), '【文章B】', 'B')
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no = 4
    AND msq.section = 'dokkai' AND msq.daimon = 11
);

-- 확인
SELECT msq.sort_order, LEFT(qq.question_text, 200)
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 4
  AND msq.section = 'dokkai' AND msq.daimon = 11
ORDER BY msq.sort_order;
