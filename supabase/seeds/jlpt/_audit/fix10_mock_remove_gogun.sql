-- 並べ替え(배열) 문제 정리(user 지시): 문제문 안의 （語群：…） 줄 제거.
-- 이유: 語群의 4단어가 보기(quiz_question_options)와 완전 중복이고 정답 단어까지 본문에 노출됨.
-- 보기 4개는 그대로 유지(답안 선택지). 대상 15문항.
UPDATE quiz_questions
SET question_text = regexp_replace(question_text, '\n*（語群：[^）]*）', '')
WHERE question_text LIKE '%（語群：%';
