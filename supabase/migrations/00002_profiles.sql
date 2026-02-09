CREATE TABLE profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  role TEXT NOT NULL DEFAULT 'mentee' CHECK (role IN ('mentee', 'mentor', 'admin')),
  jlpt_level TEXT CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  years_of_experience INTEGER DEFAULT 0,
  target_dispatch_date DATE,
  bio TEXT,

  -- 온보딩 필드
  target_jlpt_level TEXT CHECK (target_jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  target_coding_area TEXT CHECK (target_coding_area IN ('java', 'javascript', 'sql', NULL)),
  coding_rank TEXT DEFAULT 'D' CHECK (coding_rank IN ('S', 'A', 'B', 'C', 'D')),
  is_onboarded BOOLEAN NOT NULL DEFAULT FALSE,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
