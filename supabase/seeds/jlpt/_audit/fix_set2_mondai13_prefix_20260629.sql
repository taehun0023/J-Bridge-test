UPDATE quiz_questions
SET question_text = replace(question_text,
  chr(10)||chr(10)||'パクさんは',
  chr(10)||chr(10)||'問1：パクさんは')
WHERE id = 'b924580f-55da-46a5-9f61-d5babae02080';

UPDATE quiz_questions
SET question_text = replace(question_text,
  chr(10)||chr(10)||'この案内の内容と合っているものはどれか。',
  chr(10)||chr(10)||'問2：この案内の内容と合っているものはどれか。')
WHERE id = 'c7d095d9-be47-40eb-8a1f-498cbd57bbe1';

SELECT RIGHT(question_text, 80) AS tail
FROM quiz_questions
WHERE id IN ('b924580f-55da-46a5-9f61-d5babae02080','c7d095d9-be47-40eb-8a1f-498cbd57bbe1');
