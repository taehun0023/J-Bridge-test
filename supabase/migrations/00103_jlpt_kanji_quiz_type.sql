-- ============================================
-- Add 'jlpt_kanji' quiz type to quizzes
-- ============================================

ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge', 'keigo'
  ));
