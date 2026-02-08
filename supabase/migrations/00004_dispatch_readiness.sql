CREATE TABLE dispatch_readiness_scores (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  jlpt_score SMALLINT NOT NULL CHECK (jlpt_score BETWEEN 0 AND 100),
  it_japanese_score SMALLINT NOT NULL CHECK (it_japanese_score BETWEEN 0 AND 100),
  core_programming_score SMALLINT NOT NULL CHECK (core_programming_score BETWEEN 0 AND 100),
  framework_score SMALLINT NOT NULL CHECK (framework_score BETWEEN 0 AND 100),
  attitude_culture_score SMALLINT NOT NULL CHECK (attitude_culture_score BETWEEN 0 AND 100),
  overall_score SMALLINT GENERATED ALWAYS AS (
    (jlpt_score + it_japanese_score + core_programming_score + framework_score + attitude_culture_score) / 5
  ) STORED,
  recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_dispatch_readiness_user_date ON dispatch_readiness_scores(user_id, recorded_at DESC);
