-- Consolidate dev quiz question categories to match /dev subject names
-- java_core, java_code → java
-- javascript_core, javascript_code → javascript

UPDATE quiz_questions
SET question_category = 'java'
WHERE question_category IN ('java_core', 'java_code');

UPDATE quiz_questions
SET question_category = 'javascript'
WHERE question_category IN ('javascript_core', 'javascript_code');
