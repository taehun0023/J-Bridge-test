CREATE TABLE code_submissions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  problem_id UUID REFERENCES coding_problems(id) ON DELETE SET NULL,
  project_id UUID REFERENCES projects(id) ON DELETE SET NULL,
  language TEXT NOT NULL,
  source_code TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN (
    'pending', 'running', 'accepted', 'wrong_answer',
    'time_limit', 'memory_limit', 'runtime_error', 'compile_error'
  )),
  execution_time_ms INTEGER,
  memory_used_mb INTEGER,
  passed_test_cases INTEGER DEFAULT 0,
  total_test_cases INTEGER DEFAULT 0,
  submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (problem_id IS NOT NULL OR project_id IS NOT NULL)
);

CREATE INDEX idx_code_submissions_user ON code_submissions(user_id, submitted_at DESC);

CREATE TABLE code_reviews (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  submission_id UUID NOT NULL REFERENCES code_submissions(id) ON DELETE CASCADE,
  review_type TEXT NOT NULL CHECK (review_type IN (
    'style', 'logic', 'performance', 'japan_convention'
  )),
  feedback TEXT NOT NULL,
  severity TEXT NOT NULL DEFAULT 'info' CHECK (severity IN ('info', 'warning', 'error')),
  line_number INTEGER,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
