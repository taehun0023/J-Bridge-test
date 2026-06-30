\echo '== 모의 풀 (모의제외 N1/N2 문항수, quiz_type별) =='
SELECT q.quiz_type,
  count(*) FILTER (WHERE q.title LIKE 'N1%') AS n1,
  count(*) FILTER (WHERE q.title LIKE 'N2%') AS n2
FROM quiz_questions qq JOIN quizzes q ON q.id = qq.quiz_id
WHERE q.quiz_type IN ('jlpt_grammar','jlpt_kanji','jlpt_vocab','jlpt_reading','jlpt_listening')
  AND q.title NOT LIKE '%模試%' AND q.title NOT LIKE '%模擬%'
GROUP BY q.quiz_type ORDER BY 1;

\echo '== 5세트 필요량 vs 현재 (gengo=grammar+kanji+vocab 합산) =='
SELECT 'N1 gengo 필요225' lbl, count(*) cur FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type IN ('jlpt_grammar','jlpt_kanji','jlpt_vocab') AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%'
UNION ALL SELECT 'N1 dokkai 필요125', count(*) FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%'
UNION ALL SELECT 'N1 choukai 필요150', count(*) FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N1%' AND q.title NOT LIKE '%模%'
UNION ALL SELECT 'N2 gengo 필요75', count(*) FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type IN ('jlpt_grammar','jlpt_kanji','jlpt_vocab') AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%'
UNION ALL SELECT 'N2 dokkai 필요30', count(*) FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%'
UNION ALL SELECT 'N2 choukai 필요30', count(*) FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N2%' AND q.title NOT LIKE '%模%';
