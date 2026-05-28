-- 00175_create_announcement_attachments_bucket.sql
-- お知らせ添付ファイル用の Storage Bucket 작성
-- 비공개 버킷 (서버 액션이 createSignedUrl 로 단기 URL 발급)

BEGIN;

INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'announcement-attachments',
  'announcement-attachments',
  false,
  26214400, -- 25MB (アプリ側の MAX_FILE_SIZE と一致)
  NULL      -- MIME 제한은 애플리케이션 레이어의 BLOCKED_EXTENSIONS 로 관리
)
ON CONFLICT (id) DO NOTHING;

-- 認証済みユーザは添付メタを参照可能 (createSignedUrl 用)
CREATE POLICY "announcement_attachments_select"
  ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id = 'announcement-attachments');

-- 管理者のみアップロード可能
CREATE POLICY "announcement_attachments_insert_admin"
  ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (
    bucket_id = 'announcement-attachments'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- 管理者のみ削除可能
CREATE POLICY "announcement_attachments_delete_admin"
  ON storage.objects FOR DELETE TO authenticated
  USING (
    bucket_id = 'announcement-attachments'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

COMMIT;
