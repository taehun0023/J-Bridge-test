-- Paiza식 등급 시험 세트 정의
CREATE TABLE coding_skill_exams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  target_rank TEXT NOT NULL CHECK (target_rank IN ('S', 'A', 'B', 'C', 'D')),
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript', 'sql')),
  description TEXT,
  time_limit_minutes INTEGER NOT NULL DEFAULT 60,
  passing_score SMALLINT NOT NULL DEFAULT 70 CHECK (passing_score BETWEEN 0 AND 100),
  is_published BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 등급 시험 ↔ 코딩 문제 연결 (M:N)
CREATE TABLE coding_exam_problems (
  exam_id UUID NOT NULL REFERENCES coding_skill_exams(id) ON DELETE CASCADE,
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  sort_order INTEGER DEFAULT 0,
  points SMALLINT NOT NULL DEFAULT 10,
  PRIMARY KEY (exam_id, problem_id)
);
