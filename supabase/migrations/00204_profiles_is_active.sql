-- 멘티 활성/비활성 상태. 비활성 멘티는 대시보드·과제배분(수동 팝업/월자동)에서 제외.
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS is_active boolean NOT NULL DEFAULT true;
