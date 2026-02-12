-- ============================================
-- 00038: Feedback System Overhaul
-- - カテゴリを5軸(seikatsu, business_jp, cs, dev, business_lit)に変更
-- - feedback_replies テーブル追加（双方向フィードバック）
-- - RLS: 当事者のみ閲覧・作成、本人のみ修正・削除
-- ============================================

-- ヘルパー関数（未作成の場合に備えて再定義）
CREATE OR REPLACE FUNCTION is_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'mentor'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- 1-A. admin_feedbacks カテゴリ CHECK 制約変更
-- 既存データを新カテゴリにマッピング
UPDATE admin_feedbacks SET category = 'seikatsu' WHERE category IN ('general', 'japanese');
UPDATE admin_feedbacks SET category = 'dev' WHERE category IN ('coding', 'assignment');
UPDATE admin_feedbacks SET category = 'business_lit' WHERE category IN ('attitude', 'dispatch_readiness');

ALTER TABLE admin_feedbacks DROP CONSTRAINT admin_feedbacks_category_check;
ALTER TABLE admin_feedbacks ADD CONSTRAINT admin_feedbacks_category_check
  CHECK (category IN ('seikatsu', 'business_jp', 'cs', 'dev', 'business_lit'));

-- デフォルト値も変更
ALTER TABLE admin_feedbacks ALTER COLUMN category SET DEFAULT 'seikatsu';

-- 1-B. feedback_replies テーブル
CREATE TABLE feedback_replies (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  feedback_id UUID NOT NULL REFERENCES admin_feedbacks(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_feedback_replies_feedback ON feedback_replies(feedback_id, created_at ASC);

-- updated_at 自動更新トリガー
CREATE TRIGGER set_updated_at BEFORE UPDATE ON feedback_replies
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- 1-C. RLS
ALTER TABLE feedback_replies ENABLE ROW LEVEL SECURITY;

-- フィードバック当事者（発信者 or 受信者）のみリプライ閲覧
CREATE POLICY "Feedback participants can view replies" ON feedback_replies FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM admin_feedbacks f
    WHERE f.id = feedback_id AND (f.admin_id = auth.uid() OR f.user_id = auth.uid())
  ));

-- フィードバック当事者のみリプライ作成
CREATE POLICY "Feedback participants can create replies" ON feedback_replies FOR INSERT
  WITH CHECK (auth.uid() = user_id AND EXISTS (
    SELECT 1 FROM admin_feedbacks f
    WHERE f.id = feedback_id AND (f.admin_id = auth.uid() OR f.user_id = auth.uid())
  ));

-- 本人リプライのみ修正
CREATE POLICY "Users can update own replies" ON feedback_replies FOR UPDATE
  USING (auth.uid() = user_id);

-- 本人リプライのみ削除
CREATE POLICY "Users can delete own replies" ON feedback_replies FOR DELETE
  USING (auth.uid() = user_id);

-- Admin 全管理
CREATE POLICY "Admins can manage all feedback_replies" ON feedback_replies FOR ALL
  USING (is_admin());

-- Mentor: admin_feedbacks 本人作成分の修正・削除
CREATE POLICY "Mentors can update own feedbacks" ON admin_feedbacks FOR UPDATE
  USING (is_mentor() AND admin_id = auth.uid());
CREATE POLICY "Mentors can delete own feedbacks" ON admin_feedbacks FOR DELETE
  USING (is_mentor() AND admin_id = auth.uid());

-- 発信者も自分のフィードバックを閲覧可能
CREATE POLICY "Feedback authors can view own feedbacks" ON admin_feedbacks FOR SELECT
  USING (auth.uid() = admin_id);
