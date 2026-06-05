-- 00180 매달 자동 항목과제 부여용: 마지막 자동부여 월 기록 (중복 방지)
-- 'YYYY-MM' 형식. 달이 바뀐 뒤 첫 접근 시 1회만 부여되도록 dedup.

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS last_auto_assign_month text DEFAULT NULL;

COMMENT ON COLUMN profiles.last_auto_assign_month IS '월간 자동 항목과제가 마지막으로 부여된 월(YYYY-MM). 같은 달 재부여 방지.';
