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
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
