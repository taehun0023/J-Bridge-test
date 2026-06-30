-- SET2 언지 11번 - 訴求し
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=11
ORDER BY qo.sort_order;

-- SET2 언지 15번 - 玄人好み
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=15
ORDER BY qo.sort_order;

-- SET2 언지 21번 - 敷衍して
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=21
ORDER BY qo.sort_order;

-- SET2 언지 40번 - 称賛に余りある
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=40
ORDER BY qo.sort_order;

-- SET3 언지 24번 - 喫緊
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=24
ORDER BY qo.sort_order;

-- SET3 언지 25번 - 喧伝
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=25
ORDER BY qo.sort_order;

-- SET3 언지 34번 - をきっかけに
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=34
ORDER BY qo.sort_order;

-- SET3 언지 39번 - 今の組織に
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=39
ORDER BY qo.sort_order;

-- SET2 청해 16번 - 생활의 질
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='choukai' AND msq.sort_order=16
ORDER BY qo.sort_order;

-- SET3 청해 17번 - 食品ロス
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='choukai' AND msq.sort_order=17
ORDER BY qo.sort_order;

-- SET3 청해 20번 - お越しいただきまして
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text,
       qo.id as opt_id, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='choukai' AND msq.sort_order=20
ORDER BY qo.sort_order;
