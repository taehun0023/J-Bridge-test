-- 학습 시도 이력: 暗記 확인/독해·청해 테스트 정오답 기록 (부정패턴 탐지 + 감사로그용)
CREATE TABLE IF NOT EXISTS study_attempts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content_type text NOT NULL,            -- jlpt_vocab | jlpt_grammar | jlpt_reading | jlpt_listening
  item_id text NOT NULL,
  is_correct boolean NOT NULL,
  wrong_count integer NOT NULL DEFAULT 0, -- 정답 전 오답(클릭) 횟수
  duration_ms integer,                    -- 문제 표시~응답까지 소요(ms)
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_study_attempts_user_created ON study_attempts(user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_study_attempts_created ON study_attempts(created_at);

ALTER TABLE study_attempts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "insert own study attempts" ON study_attempts;
CREATE POLICY "insert own study attempts" ON study_attempts FOR INSERT WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "select own study attempts" ON study_attempts;
CREATE POLICY "select own study attempts" ON study_attempts FOR SELECT USING (auth.uid() = user_id);
