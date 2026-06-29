-- Set 2 語彙 3문제 오류 수정

-- Q11 文脈規定: 訴え→弊害 (長時間労働の弊害として)
UPDATE quiz_question_options
SET option_text = '弊害'
WHERE question_id = (
  SELECT qq.id FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2
    AND msq.section='gengo_chishiki' AND msq.sort_order=11
)
AND option_text = '訴え';

-- Q15 言い換え類義: 一環 정의 교체
-- 先: 専門家には好まれるが、一般には受けにくい傾向があること → 後: 一連の活動や計画の中の一部分であること
UPDATE quiz_question_options
SET option_text = '一連の活動や計画の中の一部分であること'
WHERE question_id = (
  SELECT qq.id FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2
    AND msq.section='gengo_chishiki' AND msq.sort_order=15
)
AND option_text = '専門家には好まれるが、一般には受けにくい傾向があること';

-- Q21 用法: 敷衍文장→尺度 올바른 예문으로 교체
-- 先: 専門用語の意味を敷衍して一般の人にもわかるよう説明した。
-- 後: 人材の能力を測る尺度として、資格や学歴だけでなく実績も重視すべきだ。
UPDATE quiz_question_options
SET option_text = '人材の能力を測る尺度として、資格や学歴だけでなく実績も重視すべきだ。'
WHERE question_id = (
  SELECT qq.id FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2
    AND msq.section='gengo_chishiki' AND msq.sort_order=21
)
AND option_text = '専門用語の意味を敷衍して一般の人にもわかるよう説明した。';

-- 결과 확인
SELECT msq.sort_order,
  replace(qq.question_text, '\n', chr(10)) AS qt,
  string_agg(qo.sort_order || '. ' || qo.option_text || CASE WHEN qo.is_correct THEN ' ★' ELSE '' END, E'\n' ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2
  AND msq.section='gengo_chishiki' AND msq.sort_order IN (11,15,21)
GROUP BY msq.sort_order, qq.question_text
ORDER BY msq.sort_order;
