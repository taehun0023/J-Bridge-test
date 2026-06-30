\a
\o C:/Users/dyjun/AppData/Local/Temp/claude/C--workspace-J-Bridge-test/07eb97bd-a1ff-4608-aef9-2b60e236bb62/scratchpad/sample_qq.txt
\echo '=== READING quiz_question (full) ==='
SELECT 'TEXT: '||qq.question_text||E'\n--subtype:'||coalesce(qq.question_subtype,'')||' cat:'||coalesce(qq.question_category,'')||' pts:'||coalesce(qq.points::text,'')
FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id
WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N1%' LIMIT 1;
\echo '--- its options ---'
SELECT o.sort_order||'. '||o.option_text||CASE WHEN o.is_correct THEN '  <=정답' ELSE '' END
FROM quiz_question_options o WHERE o.question_id = (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_reading' AND q.title LIKE 'N1%' LIMIT 1)
ORDER BY o.sort_order;

\echo '=== LISTENING quiz_question (full) ==='
SELECT 'TEXT: '||qq.question_text||E'\n--audio:'||coalesce(qq.audio_url,'(none)')
FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id
WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N1%' LIMIT 1;
\echo '--- its options ---'
SELECT o.sort_order||'. '||o.option_text||CASE WHEN o.is_correct THEN '  <=정답' ELSE '' END
FROM quiz_question_options o WHERE o.question_id = (SELECT qq.id FROM quiz_questions qq JOIN quizzes q ON q.id=qq.quiz_id WHERE q.quiz_type='jlpt_listening' AND q.title LIKE 'N1%' LIMIT 1)
ORDER BY o.sort_order;
\o
