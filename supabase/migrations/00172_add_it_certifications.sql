-- 00172_add_it_certifications.sql
-- プロフィールに IT 資格欄を追加
-- 생성일: 2026-05-25

BEGIN;

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS it_certifications text DEFAULT NULL;

COMMENT ON COLUMN profiles.it_certifications IS 'IT関連資格（自由記述）';

COMMIT;
