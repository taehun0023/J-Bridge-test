-- ============================================================
-- 本番DB (wxhyczlwdmeelcshqgci / edu-cha) 適用スクリプト
-- 適用日: 2026-05-28
-- 内容:
--   1. announcement-attachments バケットの file_size_limit を 25MB に設定
--   2. announcement-attachments 用 RLS ポリシー (00175 相当)
--   3. 9テーブルの欠落 RLS 有効化 + ポリシー再作成 (00176 相当)
-- 注意:
--   - すべて idempotent。再実行しても壊れない。
--   - DROP POLICY IF EXISTS + CREATE POLICY なので既存ポリシーは置き換わる。
--   - comprehensive_exam_questions と quiz_questions の追加カラムは
--     本番に既に存在するため本スクリプトでは扱わない。
-- ============================================================

BEGIN;

-- ============================================
-- (0) ヘルパー関数の存在保証 (本番に欠落していても安全)
--     - is_admin / is_mentor / is_admin_or_mentor
--     - CREATE OR REPLACE なので既存定義は上書きされない (同一なら)
-- ============================================
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'mentor'
  );
$$ LANGUAGE sql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION is_admin_or_mentor()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role IN ('admin', 'mentor')
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================
-- (1) Storage bucket: file_size_limit を 25MB に
-- ============================================
UPDATE storage.buckets
   SET file_size_limit = 26214400
 WHERE id = 'announcement-attachments';

-- バケットが万一なければ作る (本番には存在を確認済みだが念のため)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES ('announcement-attachments', 'announcement-attachments', false, 26214400, NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- (2) Storage RLS ポリシー (00175 相当)
-- ============================================
DROP POLICY IF EXISTS "announcement_attachments_select" ON storage.objects;
CREATE POLICY "announcement_attachments_select"
  ON storage.objects FOR SELECT TO authenticated
  USING (bucket_id = 'announcement-attachments');

DROP POLICY IF EXISTS "announcement_attachments_insert_admin" ON storage.objects;
CREATE POLICY "announcement_attachments_insert_admin"
  ON storage.objects FOR INSERT TO authenticated
  WITH CHECK (
    bucket_id = 'announcement-attachments'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

DROP POLICY IF EXISTS "announcement_attachments_delete_admin" ON storage.objects;
CREATE POLICY "announcement_attachments_delete_admin"
  ON storage.objects FOR DELETE TO authenticated
  USING (
    bucket_id = 'announcement-attachments'
    AND EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- ============================================
-- (3) 9テーブル RLS 有効化 + ポリシー (00176 相当)
-- ============================================

-- announcements / announcement_attachments / announcement_reads
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE announcement_attachments ENABLE ROW LEVEL SECURITY;
ALTER TABLE announcement_reads ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "announcements_select" ON announcements;
DROP POLICY IF EXISTS "announcements_insert" ON announcements;
DROP POLICY IF EXISTS "announcements_update" ON announcements;
DROP POLICY IF EXISTS "announcements_delete" ON announcements;
CREATE POLICY "announcements_select" ON announcements FOR SELECT TO authenticated USING (true);
CREATE POLICY "announcements_insert" ON announcements FOR INSERT TO authenticated WITH CHECK (is_admin());
CREATE POLICY "announcements_update" ON announcements FOR UPDATE TO authenticated USING (is_admin());
CREATE POLICY "announcements_delete" ON announcements FOR DELETE TO authenticated USING (is_admin());

DROP POLICY IF EXISTS "attachments_select" ON announcement_attachments;
DROP POLICY IF EXISTS "attachments_insert" ON announcement_attachments;
DROP POLICY IF EXISTS "attachments_delete" ON announcement_attachments;
CREATE POLICY "attachments_select" ON announcement_attachments FOR SELECT TO authenticated USING (true);
CREATE POLICY "attachments_insert" ON announcement_attachments FOR INSERT TO authenticated WITH CHECK (is_admin());
CREATE POLICY "attachments_delete" ON announcement_attachments FOR DELETE TO authenticated USING (is_admin());

DROP POLICY IF EXISTS "reads_select" ON announcement_reads;
DROP POLICY IF EXISTS "reads_insert" ON announcement_reads;
CREATE POLICY "reads_select" ON announcement_reads FOR SELECT TO authenticated USING (user_id = auth.uid());
CREATE POLICY "reads_insert" ON announcement_reads FOR INSERT TO authenticated WITH CHECK (user_id = auth.uid());

-- dev_course_progress / dev_lesson_progress (本番に存在する場合のみ)
DO $$
BEGIN
  IF to_regclass('public.dev_course_progress') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE dev_course_progress ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "dev_course_progress_own_all" ON dev_course_progress';
    EXECUTE 'DROP POLICY IF EXISTS "dev_course_progress_admin_mentor_select" ON dev_course_progress';
    EXECUTE 'CREATE POLICY "dev_course_progress_own_all" ON dev_course_progress FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "dev_course_progress_admin_mentor_select" ON dev_course_progress FOR SELECT TO authenticated USING (is_admin_or_mentor())';
  END IF;

  IF to_regclass('public.dev_lesson_progress') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE dev_lesson_progress ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "dev_lesson_progress_own_all" ON dev_lesson_progress';
    EXECUTE 'DROP POLICY IF EXISTS "dev_lesson_progress_admin_mentor_select" ON dev_lesson_progress';
    EXECUTE 'CREATE POLICY "dev_lesson_progress_own_all" ON dev_lesson_progress FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "dev_lesson_progress_admin_mentor_select" ON dev_lesson_progress FOR SELECT TO authenticated USING (is_admin_or_mentor())';
  END IF;

  -- 以下は test にしかなさそうな表だが、本番にもあれば適用
  IF to_regclass('public.coding_learning_progress') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE coding_learning_progress ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "coding_learning_progress_own_all" ON coding_learning_progress';
    EXECUTE 'DROP POLICY IF EXISTS "coding_learning_progress_admin_mentor_select" ON coding_learning_progress';
    EXECUTE 'CREATE POLICY "coding_learning_progress_own_all" ON coding_learning_progress FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "coding_learning_progress_admin_mentor_select" ON coding_learning_progress FOR SELECT TO authenticated USING (is_admin_or_mentor())';
  END IF;

  IF to_regclass('public.it_certifications') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE it_certifications ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "it_certifications_own_all" ON it_certifications';
    EXECUTE 'DROP POLICY IF EXISTS "it_certifications_admin_mentor_select" ON it_certifications';
    EXECUTE 'CREATE POLICY "it_certifications_own_all" ON it_certifications FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "it_certifications_admin_mentor_select" ON it_certifications FOR SELECT TO authenticated USING (is_admin_or_mentor())';
  END IF;

  IF to_regclass('public.writing_exercises') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE writing_exercises ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "writing_exercises_own_all" ON writing_exercises';
    EXECUTE 'DROP POLICY IF EXISTS "writing_exercises_admin_mentor_select" ON writing_exercises';
    EXECUTE 'CREATE POLICY "writing_exercises_own_all" ON writing_exercises FOR ALL TO authenticated USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "writing_exercises_admin_mentor_select" ON writing_exercises FOR SELECT TO authenticated USING (is_admin_or_mentor())';
  END IF;

  IF to_regclass('public.writing_claims') IS NOT NULL THEN
    EXECUTE 'ALTER TABLE writing_claims ENABLE ROW LEVEL SECURITY';
    EXECUTE 'DROP POLICY IF EXISTS "writing_claims_own_select" ON writing_claims';
    EXECUTE 'DROP POLICY IF EXISTS "writing_claims_own_insert" ON writing_claims';
    EXECUTE 'DROP POLICY IF EXISTS "writing_claims_admin_select" ON writing_claims';
    EXECUTE 'DROP POLICY IF EXISTS "writing_claims_admin_update" ON writing_claims';
    EXECUTE 'DROP POLICY IF EXISTS "writing_claims_admin_delete" ON writing_claims';
    EXECUTE 'CREATE POLICY "writing_claims_own_select" ON writing_claims FOR SELECT TO authenticated USING (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "writing_claims_own_insert" ON writing_claims FOR INSERT TO authenticated WITH CHECK (user_id = auth.uid())';
    EXECUTE 'CREATE POLICY "writing_claims_admin_select" ON writing_claims FOR SELECT TO authenticated USING (is_admin())';
    EXECUTE 'CREATE POLICY "writing_claims_admin_update" ON writing_claims FOR UPDATE TO authenticated USING (is_admin())';
    EXECUTE 'CREATE POLICY "writing_claims_admin_delete" ON writing_claims FOR DELETE TO authenticated USING (is_admin())';
  END IF;
END $$;

COMMIT;

-- ============================================
-- 確認クエリ (適用後に実行して結果を共有してください)
-- ============================================
-- バケット
-- SELECT id, file_size_limit, public FROM storage.buckets WHERE id = 'announcement-attachments';
--
-- ストレージポリシー
-- SELECT polname FROM pg_policy WHERE polrelid = 'storage.objects'::regclass AND polname LIKE 'announcement_attachments%';
--
-- RLS 状態
-- SELECT relname, relrowsecurity FROM pg_class WHERE relname IN (
--   'announcements','announcement_attachments','announcement_reads',
--   'dev_course_progress','dev_lesson_progress',
--   'coding_learning_progress','it_certifications','writing_exercises','writing_claims'
-- ) AND relkind='r';
