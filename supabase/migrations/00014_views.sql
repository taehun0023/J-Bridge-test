-- 퀴즈 정답 보호 뷰 (is_correct 필드 제외)
CREATE VIEW quiz_question_options_safe AS
SELECT id, question_id, option_text, sort_order
FROM quiz_question_options;
