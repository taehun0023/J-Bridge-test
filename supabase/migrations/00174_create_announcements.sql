-- 00174_create_announcements.sql
-- 공지사항(お知らせ) 기능 신규 추가

BEGIN;

-- 공지사항 본체
CREATE TABLE IF NOT EXISTS announcements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id UUID NOT NULL REFERENCES profiles(id) ON DELETE RESTRICT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_announcements_created_at ON announcements(created_at DESC);

-- 첨부파일 메타 (실제 파일은 Storage)
CREATE TABLE IF NOT EXISTS announcement_attachments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  announcement_id UUID NOT NULL REFERENCES announcements(id) ON DELETE CASCADE,
  file_path TEXT NOT NULL,
  file_name TEXT NOT NULL,
  file_size BIGINT NOT NULL,
  mime_type TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_attachments_announcement ON announcement_attachments(announcement_id);

-- 읽음 추적
CREATE TABLE IF NOT EXISTS announcement_reads (
  announcement_id UUID NOT NULL REFERENCES announcements(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  read_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  PRIMARY KEY (announcement_id, user_id)
);
CREATE INDEX IF NOT EXISTS idx_reads_user ON announcement_reads(user_id);

-- RLS
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE announcement_attachments ENABLE ROW LEVEL SECURITY;
ALTER TABLE announcement_reads ENABLE ROW LEVEL SECURITY;

-- announcements: 全員読み取り可、admin のみ書き込み
CREATE POLICY "announcements_select" ON announcements FOR SELECT TO authenticated USING (true);
CREATE POLICY "announcements_insert" ON announcements FOR INSERT TO authenticated
  WITH CHECK (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "announcements_update" ON announcements FOR UPDATE TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "announcements_delete" ON announcements FOR DELETE TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'));

-- announcement_attachments: 全員読み取り可、admin のみ書き込み
CREATE POLICY "attachments_select" ON announcement_attachments FOR SELECT TO authenticated USING (true);
CREATE POLICY "attachments_insert" ON announcement_attachments FOR INSERT TO authenticated
  WITH CHECK (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'));
CREATE POLICY "attachments_delete" ON announcement_attachments FOR DELETE TO authenticated
  USING (EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'));

-- announcement_reads: 自分のレコードのみ読み書き
CREATE POLICY "reads_select" ON announcement_reads FOR SELECT TO authenticated
  USING (user_id = auth.uid());
CREATE POLICY "reads_insert" ON announcement_reads FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());

-- Storage bucket (Supabase Dashboard で手動作成が必要な場合あり)
-- INSERT INTO storage.buckets (id, name, public) VALUES ('announcement-attachments', 'announcement-attachments', false)
-- ON CONFLICT DO NOTHING;

COMMIT;
