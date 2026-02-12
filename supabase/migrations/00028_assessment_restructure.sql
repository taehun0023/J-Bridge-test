-- ============================================================
-- 00028: Assessment Restructure (idempotent)
-- Category rename + is_japanese mode + retake system
-- ============================================================

-- 1A. Add is_japanese column to profiles
DO $$ BEGIN
  ALTER TABLE profiles ADD COLUMN is_japanese BOOLEAN NOT NULL DEFAULT FALSE;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 1B. Remove SQL from target_coding_area options
UPDATE profiles SET target_coding_area = 'java' WHERE target_coding_area = 'sql';
ALTER TABLE profiles DROP CONSTRAINT IF EXISTS profiles_target_coding_area_check;
ALTER TABLE profiles ADD CONSTRAINT profiles_target_coding_area_check
  CHECK (target_coding_area IN ('java', 'javascript') OR target_coding_area IS NULL);

-- 1C. dispatch_readiness_scores: make jlpt/it_japanese nullable
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ALTER COLUMN jlpt_score DROP NOT NULL;
EXCEPTION WHEN others THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ALTER COLUMN it_japanese_score DROP NOT NULL;
EXCEPTION WHEN others THEN NULL;
END $$;

-- Drop the generated column and re-add as a regular column
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores DROP COLUMN overall_score;
EXCEPTION WHEN undefined_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ADD COLUMN overall_score SMALLINT;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE dispatch_readiness_scores ADD COLUMN is_japanese BOOLEAN NOT NULL DEFAULT FALSE;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- Overall score trigger: average of non-null axes
CREATE OR REPLACE FUNCTION compute_dispatch_overall_score()
RETURNS TRIGGER AS $$
DECLARE
  total INT := 0;
  cnt INT := 0;
BEGIN
  IF NEW.jlpt_score IS NOT NULL THEN
    total := total + NEW.jlpt_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.it_japanese_score IS NOT NULL THEN
    total := total + NEW.it_japanese_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.core_programming_score IS NOT NULL THEN
    total := total + NEW.core_programming_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.framework_score IS NOT NULL THEN
    total := total + NEW.framework_score;
    cnt := cnt + 1;
  END IF;
  IF NEW.attitude_culture_score IS NOT NULL THEN
    total := total + NEW.attitude_culture_score;
    cnt := cnt + 1;
  END IF;

  IF cnt > 0 THEN
    NEW.overall_score := total / cnt;
  ELSE
    NEW.overall_score := NULL;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS compute_overall_before_insert ON dispatch_readiness_scores;
CREATE TRIGGER compute_overall_before_insert
  BEFORE INSERT OR UPDATE ON dispatch_readiness_scores
  FOR EACH ROW EXECUTE FUNCTION compute_dispatch_overall_score();

-- 1D. Add new sub-scores to attitude_culture_skills
DO $$ BEGIN
  ALTER TABLE attitude_culture_skills
    ADD COLUMN business_culture_score SMALLINT DEFAULT 0 CHECK (business_culture_score BETWEEN 0 AND 100);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE attitude_culture_skills
    ADD COLUMN it_security_score SMALLINT DEFAULT 0 CHECK (it_security_score BETWEEN 0 AND 100);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;

-- 1E. Update Quiz 5 metadata (10 questions -> 30 questions, 10 min -> 25 min)
UPDATE quizzes SET questions_per_attempt = 30, time_limit_minutes = 25
WHERE id = 'a0000005-0000-0000-0000-000000000005';

-- 9A. Retake request system columns on quiz_attempts
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_request_status TEXT DEFAULT NULL
    CHECK (retake_request_status IN ('requested', 'approved', 'denied') OR retake_request_status IS NULL);
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_requested_at TIMESTAMPTZ;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
DO $$ BEGIN
  ALTER TABLE quiz_attempts ADD COLUMN retake_approved_at TIMESTAMPTZ;
EXCEPTION WHEN duplicate_column THEN NULL;
END $$;
