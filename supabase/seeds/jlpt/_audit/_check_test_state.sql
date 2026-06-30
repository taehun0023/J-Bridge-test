\encoding UTF8
-- 1) daimon 컬럼 존재 여부
SELECT column_name FROM information_schema.columns
WHERE table_name='jlpt_mock_set_questions' AND column_name='daimon';

-- 2) N1 세트 개수 + 각 세트 문항수
SELECT ms.set_no, count(*) AS q
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
WHERE ms.level='N1'
GROUP BY ms.set_no ORDER BY ms.set_no;

-- 3) Set3 Q35 현재 보기 상태
SELECT msq.sort_order, qo.sort_order AS opt, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
JOIN quiz_question_options qo ON qo.question_id=qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND qq.question_text LIKE '幼い子供たちが難民%'
ORDER BY qo.sort_order;

-- 4) daimon 값이 채워져 있는지 (gengo 용법=4 샘플)
SELECT ms.set_no, msq.daimon, count(*)
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
WHERE ms.level='N1' AND msq.section='gengo_chishiki'
GROUP BY ms.set_no, msq.daimon ORDER BY ms.set_no, msq.daimon;
