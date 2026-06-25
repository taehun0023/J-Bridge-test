-- 월 자동부여 개수를 자격증 레벨(N1~N5)별로 저장. 기존 플랫 컬럼은 레거시 fallback으로 유지.
ALTER TABLE monthly_assignment_config ADD COLUMN IF NOT EXISTS per_level jsonb NOT NULL DEFAULT '{}'::jsonb;
