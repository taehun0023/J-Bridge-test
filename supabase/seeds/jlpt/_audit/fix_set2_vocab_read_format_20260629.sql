-- N1 모의고사2 언어지식 読み方 형식 수정
-- Set 1 기준: 「漸く」の読み方として正しいものはどれか。
-- Set 2 현재: ＿＿の言葉の読み方〜\n\n문장에 <u>단어</u>  → Set 1 형식으로 통일

UPDATE quiz_questions
SET question_text = '「' ||
  (regexp_match(replace(question_text, '\n', chr(10)), '<u>([^<]+)</u>'))[1] ||
  '」の読み方として正しいものはどれか。'
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no = 2
    AND msq.section = 'gengo_chishiki'
    AND qq.question_text LIKE '%＿＿の言葉の読み方%'
);

-- 결과 확인
SELECT msq.sort_order, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'gengo_chishiki'
ORDER BY msq.sort_order
LIMIT 8;
