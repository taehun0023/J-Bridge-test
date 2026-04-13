-- 00165_writing_exercises.sql
-- 작문 연습 결과 저장 테이블
-- 생성일: 2026-04-13

CREATE TABLE writing_exercises (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  glossary_id UUID NOT NULL REFERENCES it_glossary(id),
  user_answer TEXT NOT NULL,
  auto_score SMALLINT NOT NULL CHECK (auto_score BETWEEN 0 AND 100),
  self_result TEXT CHECK (self_result IN ('correct', 'incorrect')),
  memo TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_writing_exercises_user ON writing_exercises(user_id, created_at DESC);
CREATE INDEX idx_writing_exercises_glossary ON writing_exercises(user_id, glossary_id);

ALTER TABLE writing_exercises ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can read own writing exercises"
  ON writing_exercises FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can insert own writing exercises"
  ON writing_exercises FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update own writing exercises"
  ON writing_exercises FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Service role full access writing exercises"
  ON writing_exercises FOR ALL USING (auth.role() = 'service_role');
