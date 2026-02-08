CREATE TABLE coding_problems (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript', 'sql')),
  starter_code TEXT,
  solution_code TEXT,
  time_limit_ms INTEGER DEFAULT 2000,
  memory_limit_mb INTEGER DEFAULT 256,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE coding_test_cases (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  problem_id UUID NOT NULL REFERENCES coding_problems(id) ON DELETE CASCADE,
  input TEXT NOT NULL,
  expected_output TEXT NOT NULL,
  is_sample BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER DEFAULT 0
);

CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  lesson_id UUID REFERENCES lessons(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  starter_repo_url TEXT,
  language TEXT NOT NULL DEFAULT 'java' CHECK (language IN ('java', 'javascript')),
  difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE project_requirements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  project_id UUID NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
  description TEXT NOT NULL,
  test_class_name TEXT,
  test_method_name TEXT,
  sort_order INTEGER DEFAULT 0
);
