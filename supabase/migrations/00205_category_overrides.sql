-- 카테고리/서브카테고리 표시 이름·설명 오버라이드 + 삭제(전체 숨김) 플래그.
-- subcat_key = 최상위/세부 모두 href 기준(예: '/dev', '/dev/java').
-- 코드(navigation.ts)의 기본값을 유지하되, 관리자가 이름/설명을 덮어쓰거나(override) 메뉴에서 제거(deleted)할 수 있게 한다.
--   * label_override / description_override: NULL이면 코드 기본값 사용.
--   * deleted = true: 전체 사용자(관리자 포함) 메뉴에서 숨김. 기존 is_active(false=멘티만 숨김 토글)와 별개.
ALTER TABLE subcategory_settings
  ADD COLUMN IF NOT EXISTS label_override       text,
  ADD COLUMN IF NOT EXISTS description_override text,
  ADD COLUMN IF NOT EXISTS deleted              boolean NOT NULL DEFAULT false;
