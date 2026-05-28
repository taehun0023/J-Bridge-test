-- 00176_enable_missing_rls.sql
-- 리모트 DB 점검 결과 RLS 비활성 상태였던 9개 테이블에 RLS + 정책 적용.
-- (00174 등 일부 마이그레이션이 트래킹 누락된 상태로 데이터만 적용된 흔적)
-- 정책 패턴: 본인 데이터 ALL + 관리자/멘토 SELECT 가능.
-- 멱등성을 위해 모든 정책은 DROP POLICY IF EXISTS 후 재생성.

BEGIN;

-- ============================================
-- 1. announcements / announcement_attachments / announcement_reads
--    (00174 가 적용되지 않은 잔재. 정책도 다시 정의)
-- ============================================
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

-- ============================================
-- 2. coding_learning_progress (個人の学習進捗)
-- ============================================
ALTER TABLE coding_learning_progress ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "coding_learning_progress_own_all" ON coding_learning_progress;
DROP POLICY IF EXISTS "coding_learning_progress_admin_mentor_select" ON coding_learning_progress;
CREATE POLICY "coding_learning_progress_own_all" ON coding_learning_progress FOR ALL TO authenticated
  USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());
CREATE POLICY "coding_learning_progress_admin_mentor_select" ON coding_learning_progress FOR SELECT TO authenticated
  USING (is_admin_or_mentor());

-- ============================================
-- 3. dev_course_progress / dev_lesson_progress (個人の学習進捗)
-- ============================================
ALTER TABLE dev_course_progress ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "dev_course_progress_own_all" ON dev_course_progress;
DROP POLICY IF EXISTS "dev_course_progress_admin_mentor_select" ON dev_course_progress;
CREATE POLICY "dev_course_progress_own_all" ON dev_course_progress FOR ALL TO authenticated
  USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());
CREATE POLICY "dev_course_progress_admin_mentor_select" ON dev_course_progress FOR SELECT TO authenticated
  USING (is_admin_or_mentor());

ALTER TABLE dev_lesson_progress ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "dev_lesson_progress_own_all" ON dev_lesson_progress;
DROP POLICY IF EXISTS "dev_lesson_progress_admin_mentor_select" ON dev_lesson_progress;
CREATE POLICY "dev_lesson_progress_own_all" ON dev_lesson_progress FOR ALL TO authenticated
  USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());
CREATE POLICY "dev_lesson_progress_admin_mentor_select" ON dev_lesson_progress FOR SELECT TO authenticated
  USING (is_admin_or_mentor());

-- ============================================
-- 4. it_certifications (個人の資格情報)
-- ============================================
ALTER TABLE it_certifications ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "it_certifications_own_all" ON it_certifications;
DROP POLICY IF EXISTS "it_certifications_admin_mentor_select" ON it_certifications;
CREATE POLICY "it_certifications_own_all" ON it_certifications FOR ALL TO authenticated
  USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());
CREATE POLICY "it_certifications_admin_mentor_select" ON it_certifications FOR SELECT TO authenticated
  USING (is_admin_or_mentor());

-- ============================================
-- 5. writing_exercises (個人の作文練習)
-- ============================================
ALTER TABLE writing_exercises ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "writing_exercises_own_all" ON writing_exercises;
DROP POLICY IF EXISTS "writing_exercises_admin_mentor_select" ON writing_exercises;
CREATE POLICY "writing_exercises_own_all" ON writing_exercises FOR ALL TO authenticated
  USING (user_id = auth.uid()) WITH CHECK (user_id = auth.uid());
CREATE POLICY "writing_exercises_admin_mentor_select" ON writing_exercises FOR SELECT TO authenticated
  USING (is_admin_or_mentor());

-- ============================================
-- 6. writing_claims (作文への異議申立)
--   ユーザ: 自分の claim を作成・閲覧
--   管理者: 全 claim 閲覧・解決
-- ============================================
ALTER TABLE writing_claims ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "writing_claims_own_select" ON writing_claims;
DROP POLICY IF EXISTS "writing_claims_own_insert" ON writing_claims;
DROP POLICY IF EXISTS "writing_claims_admin_select" ON writing_claims;
DROP POLICY IF EXISTS "writing_claims_admin_update" ON writing_claims;
DROP POLICY IF EXISTS "writing_claims_admin_delete" ON writing_claims;
CREATE POLICY "writing_claims_own_select" ON writing_claims FOR SELECT TO authenticated
  USING (user_id = auth.uid());
CREATE POLICY "writing_claims_own_insert" ON writing_claims FOR INSERT TO authenticated
  WITH CHECK (user_id = auth.uid());
CREATE POLICY "writing_claims_admin_select" ON writing_claims FOR SELECT TO authenticated
  USING (is_admin());
CREATE POLICY "writing_claims_admin_update" ON writing_claims FOR UPDATE TO authenticated
  USING (is_admin());
CREATE POLICY "writing_claims_admin_delete" ON writing_claims FOR DELETE TO authenticated
  USING (is_admin());

COMMIT;
