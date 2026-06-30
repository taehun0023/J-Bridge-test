-- 전체 quiz_questions에서 검색
SELECT qq.id, LEFT(qq.question_text, 200) as preview
FROM quiz_questions qq
WHERE qq.question_text LIKE '%納期%'
   OR qq.question_text LIKE '%感動させ%'
   OR qq.question_text LIKE '%ラストシーン%'
LIMIT 10;
