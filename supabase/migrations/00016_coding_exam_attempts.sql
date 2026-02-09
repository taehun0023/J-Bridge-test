-- 유저의 등급 시험 도전 기록
CREATE TABLE coding_exam_attempts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  exam_id UUID NOT NULL REFERENCES coding_skill_exams(id) ON DELETE CASCADE,
  score SMALLINT,
  passed BOOLEAN,
  achieved_rank TEXT CHECK (achieved_rank IN ('S', 'A', 'B', 'C', 'D', NULL)),
  started_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_coding_exam_attempts_user ON coding_exam_attempts(user_id, started_at DESC);
