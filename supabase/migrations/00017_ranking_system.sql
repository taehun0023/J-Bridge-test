-- 3개월 시즌 관리
CREATE TABLE ranking_seasons (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CHECK (end_date > start_date)
);

CREATE INDEX idx_ranking_seasons_active ON ranking_seasons(is_active) WHERE is_active = TRUE;

-- 시즌별 유저 랭킹 스냅샷
CREATE TABLE user_rankings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  season_id UUID NOT NULL REFERENCES ranking_seasons(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  overall_score SMALLINT NOT NULL DEFAULT 0 CHECK (overall_score BETWEEN 0 AND 100),
  jlpt_score SMALLINT NOT NULL DEFAULT 0 CHECK (jlpt_score BETWEEN 0 AND 100),
  coding_score SMALLINT NOT NULL DEFAULT 0 CHECK (coding_score BETWEEN 0 AND 100),
  attitude_score SMALLINT NOT NULL DEFAULT 0 CHECK (attitude_score BETWEEN 0 AND 100),
  coding_rank TEXT DEFAULT 'D' CHECK (coding_rank IN ('S', 'A', 'B', 'C', 'D')),

  overall_rank INTEGER,
  jlpt_rank INTEGER,
  coding_rank_position INTEGER,
  attitude_rank INTEGER,

  recorded_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

  UNIQUE(season_id, user_id)
);

CREATE INDEX idx_user_rankings_season ON user_rankings(season_id, overall_rank);
