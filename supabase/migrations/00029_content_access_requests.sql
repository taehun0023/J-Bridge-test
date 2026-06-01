-- ============================================
-- 열람 신청 테이블
-- ============================================
CREATE TABLE content_access_requests (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content_category TEXT NOT NULL,
  content_path TEXT NOT NULL,
  reason TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'denied')),
  reviewed_by UUID REFERENCES profiles(id) ON DELETE SET NULL,
  reviewed_at TIMESTAMPTZ,
  review_note TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 동일 유저의 중복 pending 방지
CREATE UNIQUE INDEX idx_unique_pending_request
  ON content_access_requests(user_id, content_category) WHERE status = 'pending';

-- updated_at 트리거
CREATE TRIGGER set_content_access_requests_updated_at
  BEFORE UPDATE ON content_access_requests
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- ============================================
-- RLS
-- ============================================
ALTER TABLE content_access_requests ENABLE ROW LEVEL SECURITY;

-- 본인 조회
CREATE POLICY "Users can view own access requests"
  ON content_access_requests FOR SELECT
  USING ((SELECT auth.uid()) = user_id);

-- 본인 생성
CREATE POLICY "Users can create own access requests"
  ON content_access_requests FOR INSERT
  WITH CHECK ((SELECT auth.uid()) = user_id);

-- Admin 전체 관리
CREATE POLICY "Admins can manage all access requests"
  ON content_access_requests FOR ALL
  USING (is_admin());
