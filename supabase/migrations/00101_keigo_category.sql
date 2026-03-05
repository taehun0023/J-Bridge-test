-- ============================================
-- Add 'keigo' category to it_glossary and quizzes
-- ============================================

-- it_glossary category CHECK
ALTER TABLE it_glossary DROP CONSTRAINT IF EXISTS it_glossary_category_check;
ALTER TABLE it_glossary ADD CONSTRAINT it_glossary_category_check
  CHECK (category IN ('it', 'dev', 'business', 'expression', 'sentence_pattern', 'keigo'));

-- quizzes quiz_type CHECK
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge', 'keigo'
  ));
