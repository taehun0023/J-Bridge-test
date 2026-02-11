-- Assessment System Migration
-- Adds support for onboarding assessment quizzes with random question selection

-- 1) Extend quiz_type CHECK to include new types
ALTER TABLE quizzes DROP CONSTRAINT quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check CHECK (quiz_type IN (
  'jlpt_vocab','jlpt_grammar','jlpt_reading','jlpt_listening',
  'it_terminology','role_play_scenario','attitude_culture',
  'core_programming','framework'
));

-- 2) Assessment quiz flags + random question selection
ALTER TABLE quizzes ADD COLUMN is_assessment BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE quizzes ADD COLUMN questions_per_attempt SMALLINT;

-- 3) Question difficulty + category tags for balanced random selection
ALTER TABLE quiz_questions ADD COLUMN difficulty TEXT CHECK (difficulty IN ('easy','medium','hard'));
ALTER TABLE quiz_questions ADD COLUMN question_category TEXT;

-- 4) Onboarding step tracking (0=not started, 1=preferences done, 2-6=test 1-5 done)
ALTER TABLE profiles ADD COLUMN onboarding_step SMALLINT NOT NULL DEFAULT 0;

-- Set existing onboarded users to step 6 (fully complete)
UPDATE profiles SET onboarding_step = 6 WHERE is_onboarded = TRUE;
