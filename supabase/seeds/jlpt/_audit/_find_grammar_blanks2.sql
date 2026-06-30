-- 감동させ 문제 전체 검색
SELECT qq.id, qq.question_text
FROM quiz_questions qq
WHERE qq.question_text LIKE '%感動%';
