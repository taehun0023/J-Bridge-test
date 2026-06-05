-- 00179 프로필에 "목표 자격증" 추가 (관리자/멘토 설정, 과제 부여 기준)
-- 단일 값. 당면은 JLPT 레벨(N1~N5)을 값으로 사용하나, 향후 IT 자격증 등으로 확장 가능.
-- 온보딩에서 멘티가 직접 설정하는 target_jlpt_level 과는 별개(이쪽은 관리자/멘토가 지정).

ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS target_certification text DEFAULT NULL;

COMMENT ON COLUMN profiles.target_certification IS '目標資格（管理者/メンターが設定、課題付与の基準）。当面はJLPTレベル(N1~N5)。';
