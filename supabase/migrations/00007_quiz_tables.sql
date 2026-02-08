CREATE TABLE quizzes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  quiz_type TEXT NOT NULL CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening',
    'it_terminology', 'role_play_scenario', 'attitude_culture'
  )),
  passing_score SMALLINT DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
  time_limit_minutes INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE quiz_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  quiz_id UUID NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  question_type TEXT NOT NULL CHECK (question_type IN (
    'multiple_choice', 'fill_in_blank', 'audio_listening', 'ordering'
  )),
  question_text TEXT NOT NULL,
  audio_url TEXT,
  image_url TEXT,
  explanation TEXT,
  points SMALLINT NOT NULL DEFAULT 1,
  sort_order INTEGER DEFAULT 0
);

CREATE TABLE quiz_question_options (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  option_text TEXT NOT NULL,
  is_correct BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);
