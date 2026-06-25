-- 멘티별 월자동부여 옵트인 플래그. 기본 true(기존 동작 유지).
-- 체크 해제된 멘티는 월자동부여 제외 → 멘토/관리자가 課題 버튼으로 개별 부여.
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS monthly_auto_assign boolean NOT NULL DEFAULT true;
