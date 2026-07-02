-- 서브카테고리 활성화/비활성화 설정. subcat_key = 서브카테고리 href (예: '/japanese/jlpt/n5').
-- 행이 없으면 활성(기본값 true). 비활성(false)이면 멘티에게 메뉴 숨김 + 페이지 접근 차단(미들웨어).
CREATE TABLE IF NOT EXISTS subcategory_settings (
  subcat_key text PRIMARY KEY,
  is_active   boolean NOT NULL DEFAULT true,
  updated_at  timestamptz NOT NULL DEFAULT now(),
  updated_by  uuid REFERENCES profiles(id) ON DELETE SET NULL
);

ALTER TABLE subcategory_settings ENABLE ROW LEVEL SECURITY;

-- 읽기: 모든 인증 사용자(미들웨어·허브에서 조회). 쓰기: 서버 액션의 service role 로만(정책 불필요).
DROP POLICY IF EXISTS subcat_settings_read_authenticated ON subcategory_settings;
CREATE POLICY subcat_settings_read_authenticated ON subcategory_settings
  FOR SELECT TO authenticated USING (true);
