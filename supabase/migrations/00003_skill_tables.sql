-- 축1 & 축2: JLPT + IT/비즈니스 일본어
CREATE TABLE japanese_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  jlpt_level TEXT CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1', NULL)),
  vocab_mastery SMALLINT DEFAULT 0 CHECK (vocab_mastery BETWEEN 0 AND 100),
  grammar_mastery SMALLINT DEFAULT 0 CHECK (grammar_mastery BETWEEN 0 AND 100),
  reading_mastery SMALLINT DEFAULT 0 CHECK (reading_mastery BETWEEN 0 AND 100),
  listening_mastery SMALLINT DEFAULT 0 CHECK (listening_mastery BETWEEN 0 AND 100),
  jlpt_normalized SMALLINT DEFAULT 0 CHECK (jlpt_normalized BETWEEN 0 AND 100),
  it_terminology_score SMALLINT DEFAULT 0 CHECK (it_terminology_score BETWEEN 0 AND 100),
  doc_reading_score SMALLINT DEFAULT 0 CHECK (doc_reading_score BETWEEN 0 AND 100),
  business_conv_score SMALLINT DEFAULT 0 CHECK (business_conv_score BETWEEN 0 AND 100),
  it_japanese_normalized SMALLINT DEFAULT 0 CHECK (it_japanese_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 축3 & 축4: Core Programming + Framework/Practical
CREATE TABLE coding_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  java_score SMALLINT DEFAULT 0 CHECK (java_score BETWEEN 0 AND 100),
  javascript_score SMALLINT DEFAULT 0 CHECK (javascript_score BETWEEN 0 AND 100),
  sql_score SMALLINT DEFAULT 0 CHECK (sql_score BETWEEN 0 AND 100),
  algorithm_score SMALLINT DEFAULT 0 CHECK (algorithm_score BETWEEN 0 AND 100),
  core_normalized SMALLINT DEFAULT 0 CHECK (core_normalized BETWEEN 0 AND 100),
  spring_boot_score SMALLINT DEFAULT 0 CHECK (spring_boot_score BETWEEN 0 AND 100),
  react_score SMALLINT DEFAULT 0 CHECK (react_score BETWEEN 0 AND 100),
  db_design_score SMALLINT DEFAULT 0 CHECK (db_design_score BETWEEN 0 AND 100),
  project_score SMALLINT DEFAULT 0 CHECK (project_score BETWEEN 0 AND 100),
  framework_normalized SMALLINT DEFAULT 0 CHECK (framework_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 축5: Attitude/Culture
CREATE TABLE attitude_culture_skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL UNIQUE REFERENCES profiles(id) ON DELETE CASCADE,
  punctuality_score SMALLINT DEFAULT 0 CHECK (punctuality_score BETWEEN 0 AND 100),
  horenso_score SMALLINT DEFAULT 0 CHECK (horenso_score BETWEEN 0 AND 100),
  teamwork_score SMALLINT DEFAULT 0 CHECK (teamwork_score BETWEEN 0 AND 100),
  business_manner_score SMALLINT DEFAULT 0 CHECK (business_manner_score BETWEEN 0 AND 100),
  attitude_normalized SMALLINT DEFAULT 0 CHECK (attitude_normalized BETWEEN 0 AND 100),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
