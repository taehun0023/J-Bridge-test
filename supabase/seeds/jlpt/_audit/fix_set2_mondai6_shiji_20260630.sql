-- Set 2 問題6 (Q36-Q40): 지시문 통일
-- 次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。
-- → 次の文の ★ に入る最もよいものはどれか。
UPDATE quiz_questions
SET question_text = replace(
  question_text,
  '次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。',
  '次の文の ★ に入る最もよいものはどれか。'
)
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=2
    AND msq.section='gengo_chishiki' AND msq.daimon=6
);

-- 확인
SELECT msq.sort_order, LEFT(qq.question_text, 40) AS head
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND ms.set_no=2
  AND msq.section='gengo_chishiki' AND msq.daimon=6
ORDER BY msq.sort_order;
