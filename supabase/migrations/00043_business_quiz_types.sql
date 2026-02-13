-- Extend quiz_type constraint to include business quiz types
ALTER TABLE quizzes DROP CONSTRAINT quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check CHECK (quiz_type IN (
  'jlpt_vocab','jlpt_grammar','jlpt_reading','jlpt_listening',
  'it_terminology','role_play_scenario','attitude_culture',
  'core_programming','framework',
  'sentence_pattern','business_expression'
));
