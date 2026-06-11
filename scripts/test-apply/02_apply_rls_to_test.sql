-- ============================================================
-- 02_apply_rls_to_test.sql
-- ============================================================
-- 用途: test (ダンプ) DB の Supabase Dashboard SQL Editor で実行
-- 目的: 本番 (PROD / wxhyczlwdmeelcshqgci) から抽出した RLS 状態を
--       test DB に 1:1 適用する
-- 出典: PROD で 01_extract_rls_from_prod.sql を実行した結果 (2026-05-28 時点)
--        - 65 テーブル (public 57 + storage 8) の RLS 有効化
--        - 181 ポリシー (public + storage)
-- 特性:
--   - 冪等 (DROP POLICY IF EXISTS + CREATE POLICY)
--   - BEGIN/COMMIT で包むので途中失敗時はロールバック
--   - ヘルパー関数 4 個 (is_admin / is_mentor / is_admin_or_mentor / is_mentor_of) を先に保証
-- 注意:
--   - storage.* に対する ALTER TABLE / CREATE POLICY が権限エラーで失敗した場合は
--     該当行をコメントアウトして再実行 (DROP/CREATE は冪等)
-- ============================================================

BEGIN;

-- ============================================
-- (0) ヘルパー関数の存在保証 (CREATE OR REPLACE)
--     pg_policies から抽出されないため別途定義
--     scripts/prod-apply/2026-05-28_announcement_fix_and_rls.sql:22-41 と同じ
--     + is_mentor_of (supabase/migrations/00035_mentor_mentee_rls.sql:2-8 と同じ)
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

CREATE OR REPLACE FUNCTION is_mentor_of(target_user_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM mentor_mentee_assignments
    WHERE mentor_id = auth.uid() AND mentee_id = target_user_id
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- ============================================
-- (A) RLS 有効化 (65 tables)
-- ============================================
ALTER TABLE public._backup_00171_misplaced_code_reading ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.admin_feedbacks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.announcement_attachments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.announcement_reads ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.attitude_culture_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.audit_log ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.code_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.code_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_exam_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_exam_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_skill_exams ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coding_test_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comprehensive_exam_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comprehensive_exam_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comprehensive_exams ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cs_course_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cs_lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cs_terms ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.dev_course_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.dev_lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.dispatch_readiness_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.exam_cycles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.feedback_replies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.it_glossary ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.japanese_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jlpt_grammar ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jlpt_kanji ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jlpt_listening_scripts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jlpt_reading_passages ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.jlpt_vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.learning_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.mentor_mentee_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.personal_vocab ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.project_requirements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.question_claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ranking_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.task_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_mastered_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_rankings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.writing_claims ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.writing_exercises ENABLE ROW LEVEL SECURITY;
-- storage.* は Supabase managed のため、権限エラーが出る場合は以下8行をコメントアウト
ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;
ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

-- ============================================
-- (B) 既存ポリシー削除 (DROP IF EXISTS / 冪等)
-- ============================================
DROP POLICY IF EXISTS "Admin can manage grammar" ON public.jlpt_grammar;
DROP POLICY IF EXISTS "Admin can manage passages" ON public.jlpt_reading_passages;
DROP POLICY IF EXISTS "Admin can manage scripts" ON public.jlpt_listening_scripts;
DROP POLICY IF EXISTS "Admins can delete cs_terms" ON public.cs_terms;
DROP POLICY IF EXISTS "Admins can insert cs_terms" ON public.cs_terms;
DROP POLICY IF EXISTS "Admins can manage all admin_feedbacks" ON public.admin_feedbacks;
DROP POLICY IF EXISTS "Admins can manage all feedback_replies" ON public.feedback_replies;
DROP POLICY IF EXISTS "Admins can manage all task_assignments" ON public.task_assignments;
DROP POLICY IF EXISTS "Admins can manage coding_exam_problems" ON public.coding_exam_problems;
DROP POLICY IF EXISTS "Admins can manage coding_problems" ON public.coding_problems;
DROP POLICY IF EXISTS "Admins can manage coding_skill_exams" ON public.coding_skill_exams;
DROP POLICY IF EXISTS "Admins can manage coding_test_cases" ON public.coding_test_cases;
DROP POLICY IF EXISTS "Admins can manage courses" ON public.courses;
DROP POLICY IF EXISTS "Admins can manage lessons" ON public.lessons;
DROP POLICY IF EXISTS "Admins can manage quiz_question_options" ON public.quiz_question_options;
DROP POLICY IF EXISTS "Admins can manage quiz_questions" ON public.quiz_questions;
DROP POLICY IF EXISTS "Admins can manage quizzes" ON public.quizzes;
DROP POLICY IF EXISTS "Admins can manage ranking_seasons" ON public.ranking_seasons;
DROP POLICY IF EXISTS "Admins can manage user_rankings" ON public.user_rankings;
DROP POLICY IF EXISTS "Admins can read audit log" ON public.audit_log;
DROP POLICY IF EXISTS "Admins can update all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Admins can update all quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Admins can update cs_terms" ON public.cs_terms;
DROP POLICY IF EXISTS "Admins can view all attitude_culture_skills" ON public.attitude_culture_skills;
DROP POLICY IF EXISTS "Admins can view all claims" ON public.question_claims;
DROP POLICY IF EXISTS "Admins can view all code_reviews" ON public.code_reviews;
DROP POLICY IF EXISTS "Admins can view all code_submissions" ON public.code_submissions;
DROP POLICY IF EXISTS "Admins can view all coding_skills" ON public.coding_skills;
DROP POLICY IF EXISTS "Admins can view all dispatch_readiness_scores" ON public.dispatch_readiness_scores;
DROP POLICY IF EXISTS "Admins can view all exam attempts" ON public.coding_exam_attempts;
DROP POLICY IF EXISTS "Admins can view all japanese_skills" ON public.japanese_skills;
DROP POLICY IF EXISTS "Admins can view all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Admins can view all quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Admins can view all writing claims" ON public.writing_claims;
DROP POLICY IF EXISTS "Anyone authenticated can view cs_terms" ON public.cs_terms;
DROP POLICY IF EXISTS "Anyone can read grammar" ON public.jlpt_grammar;
DROP POLICY IF EXISTS "Anyone can read kanji" ON public.jlpt_kanji;
DROP POLICY IF EXISTS "Anyone can read passages" ON public.jlpt_reading_passages;
DROP POLICY IF EXISTS "Anyone can read scripts" ON public.jlpt_listening_scripts;
DROP POLICY IF EXISTS "Authenticated can view all coding_skills" ON public.coding_skills;
DROP POLICY IF EXISTS "Authenticated can view all japanese_skills" ON public.japanese_skills;
DROP POLICY IF EXISTS "Authenticated can view all profiles" ON public.profiles;
DROP POLICY IF EXISTS "Authenticated users can insert audit log" ON public.audit_log;
DROP POLICY IF EXISTS "Authenticated users can upload tts cache" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can view all test_cases" ON public.coding_test_cases;
DROP POLICY IF EXISTS "Authenticated users can view coding_problems" ON public.coding_problems;
DROP POLICY IF EXISTS "Authenticated users can view courses" ON public.courses;
DROP POLICY IF EXISTS "Authenticated users can view exam problems" ON public.coding_exam_problems;
DROP POLICY IF EXISTS "Authenticated users can view it_glossary" ON public.it_glossary;
DROP POLICY IF EXISTS "Authenticated users can view jlpt_vocabulary" ON public.jlpt_vocabulary;
DROP POLICY IF EXISTS "Authenticated users can view lesson_resources" ON public.lesson_resources;
DROP POLICY IF EXISTS "Authenticated users can view lessons" ON public.lessons;
DROP POLICY IF EXISTS "Authenticated users can view project_requirements" ON public.project_requirements;
DROP POLICY IF EXISTS "Authenticated users can view projects" ON public.projects;
DROP POLICY IF EXISTS "Authenticated users can view published exams" ON public.coding_skill_exams;
DROP POLICY IF EXISTS "Authenticated users can view quiz_options" ON public.quiz_question_options;
DROP POLICY IF EXISTS "Admins and mentors can view quiz_options" ON public.quiz_question_options;
DROP POLICY IF EXISTS "Authenticated users can view quiz_questions" ON public.quiz_questions;
DROP POLICY IF EXISTS "Authenticated users can view quizzes" ON public.quizzes;
DROP POLICY IF EXISTS "Authenticated users can view ranking_seasons" ON public.ranking_seasons;
DROP POLICY IF EXISTS "Authenticated users can view rankings" ON public.user_rankings;
DROP POLICY IF EXISTS "Feedback authors can view own feedbacks" ON public.admin_feedbacks;
DROP POLICY IF EXISTS "Feedback participants can create replies" ON public.feedback_replies;
DROP POLICY IF EXISTS "Feedback participants can view replies" ON public.feedback_replies;
DROP POLICY IF EXISTS "Mentors can delete own feedbacks" ON public.admin_feedbacks;
DROP POLICY IF EXISTS "Mentors can update mentee quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Mentors can update own feedbacks" ON public.admin_feedbacks;
DROP POLICY IF EXISTS "Mentors can view all claims" ON public.question_claims;
DROP POLICY IF EXISTS "Mentors can view all writing claims" ON public.writing_claims;
DROP POLICY IF EXISTS "Public avatar access" ON storage.objects;
DROP POLICY IF EXISTS "Public tts cache access" ON storage.objects;
DROP POLICY IF EXISTS "Service role full access writing claims" ON public.writing_claims;
DROP POLICY IF EXISTS "Service role full access writing exercises" ON public.writing_exercises;
DROP POLICY IF EXISTS "Users can delete own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can delete own mastered items" ON public.user_mastered_items;
DROP POLICY IF EXISTS "Users can delete own replies" ON public.feedback_replies;
DROP POLICY IF EXISTS "Users can insert code_reviews for own submissions" ON public.code_reviews;
DROP POLICY IF EXISTS "Users can insert own attitude_culture_skills" ON public.attitude_culture_skills;
DROP POLICY IF EXISTS "Users can insert own claims" ON public.question_claims;
DROP POLICY IF EXISTS "Users can insert own code_submissions" ON public.code_submissions;
DROP POLICY IF EXISTS "Users can insert own coding_skills" ON public.coding_skills;
DROP POLICY IF EXISTS "Users can insert own cs_course_progress" ON public.cs_course_progress;
DROP POLICY IF EXISTS "Users can insert own cs_lesson_progress" ON public.cs_lesson_progress;
DROP POLICY IF EXISTS "Users can insert own dev_course_progress" ON public.dev_course_progress;
DROP POLICY IF EXISTS "Users can insert own dev_lesson_progress" ON public.dev_lesson_progress;
DROP POLICY IF EXISTS "Users can insert own dispatch_readiness_scores" ON public.dispatch_readiness_scores;
DROP POLICY IF EXISTS "Users can insert own enrollments" ON public.enrollments;
DROP POLICY IF EXISTS "Users can insert own exam attempts" ON public.coding_exam_attempts;
DROP POLICY IF EXISTS "Users can insert own japanese_skills" ON public.japanese_skills;
DROP POLICY IF EXISTS "Users can insert own lesson_progress" ON public.lesson_progress;
DROP POLICY IF EXISTS "Users can insert own mastered items" ON public.user_mastered_items;
DROP POLICY IF EXISTS "Users can insert own quiz_answers" ON public.quiz_answers;
DROP POLICY IF EXISTS "Users can insert own quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Users can insert own writing claims" ON public.writing_claims;
DROP POLICY IF EXISTS "Users can insert own writing exercises" ON public.writing_exercises;
DROP POLICY IF EXISTS "Users can read own writing exercises" ON public.writing_exercises;
DROP POLICY IF EXISTS "Users can update own assignment status" ON public.task_assignments;
DROP POLICY IF EXISTS "Users can update own attitude_culture_skills" ON public.attitude_culture_skills;
DROP POLICY IF EXISTS "Users can update own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can update own code_submissions" ON public.code_submissions;
DROP POLICY IF EXISTS "Users can update own coding_exam_attempts" ON public.coding_exam_attempts;
DROP POLICY IF EXISTS "Users can update own coding_skills" ON public.coding_skills;
DROP POLICY IF EXISTS "Users can update own cs_course_progress" ON public.cs_course_progress;
DROP POLICY IF EXISTS "Users can update own cs_lesson_progress" ON public.cs_lesson_progress;
DROP POLICY IF EXISTS "Users can update own dev_course_progress" ON public.dev_course_progress;
DROP POLICY IF EXISTS "Users can update own dev_lesson_progress" ON public.dev_lesson_progress;
DROP POLICY IF EXISTS "Users can update own japanese_skills" ON public.japanese_skills;
DROP POLICY IF EXISTS "Users can update own lesson_progress" ON public.lesson_progress;
DROP POLICY IF EXISTS "Users can update own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can update own quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Users can update own replies" ON public.feedback_replies;
DROP POLICY IF EXISTS "Users can update own writing exercises" ON public.writing_exercises;
DROP POLICY IF EXISTS "Users can upload own avatar" ON storage.objects;
DROP POLICY IF EXISTS "Users can view own assignments" ON public.task_assignments;
DROP POLICY IF EXISTS "Users can view own attitude_culture_skills" ON public.attitude_culture_skills;
DROP POLICY IF EXISTS "Users can view own claims" ON public.question_claims;
DROP POLICY IF EXISTS "Users can view own code_reviews" ON public.code_reviews;
DROP POLICY IF EXISTS "Users can view own code_submissions" ON public.code_submissions;
DROP POLICY IF EXISTS "Users can view own coding_skills" ON public.coding_skills;
DROP POLICY IF EXISTS "Users can view own cs_course_progress" ON public.cs_course_progress;
DROP POLICY IF EXISTS "Users can view own cs_lesson_progress" ON public.cs_lesson_progress;
DROP POLICY IF EXISTS "Users can view own dev_course_progress" ON public.dev_course_progress;
DROP POLICY IF EXISTS "Users can view own dev_lesson_progress" ON public.dev_lesson_progress;
DROP POLICY IF EXISTS "Users can view own dispatch_readiness_scores" ON public.dispatch_readiness_scores;
DROP POLICY IF EXISTS "Users can view own enrollments" ON public.enrollments;
DROP POLICY IF EXISTS "Users can view own exam attempts" ON public.coding_exam_attempts;
DROP POLICY IF EXISTS "Users can view own feedbacks" ON public.admin_feedbacks;
DROP POLICY IF EXISTS "Users can view own japanese_skills" ON public.japanese_skills;
DROP POLICY IF EXISTS "Users can view own lesson_progress" ON public.lesson_progress;
DROP POLICY IF EXISTS "Users can view own mastered items" ON public.user_mastered_items;
DROP POLICY IF EXISTS "Users can view own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can view own quiz_answers" ON public.quiz_answers;
DROP POLICY IF EXISTS "Users can view own quiz_attempts" ON public.quiz_attempts;
DROP POLICY IF EXISTS "Users can view own writing claims" ON public.writing_claims;
DROP POLICY IF EXISTS "Users manage own personal vocab" ON public.personal_vocab;
DROP POLICY IF EXISTS admin_full_access ON public.comprehensive_exams;
DROP POLICY IF EXISTS admin_full_access ON public.learning_assignments;
DROP POLICY IF EXISTS admin_full_access ON public.mentor_mentee_assignments;
DROP POLICY IF EXISTS admin_insert ON public.notifications;
DROP POLICY IF EXISTS admin_read ON public.comprehensive_exam_answers;
DROP POLICY IF EXISTS admin_read ON public.comprehensive_exam_questions;
DROP POLICY IF EXISTS announcement_attachments_delete ON storage.objects;
DROP POLICY IF EXISTS announcement_attachments_delete_admin ON storage.objects;
DROP POLICY IF EXISTS announcement_attachments_download ON storage.objects;
DROP POLICY IF EXISTS announcement_attachments_insert_admin ON storage.objects;
DROP POLICY IF EXISTS announcement_attachments_select ON storage.objects;
DROP POLICY IF EXISTS announcement_attachments_upload ON storage.objects;
DROP POLICY IF EXISTS announcements_delete ON public.announcements;
DROP POLICY IF EXISTS announcements_insert ON public.announcements;
DROP POLICY IF EXISTS announcements_select ON public.announcements;
DROP POLICY IF EXISTS announcements_update ON public.announcements;
DROP POLICY IF EXISTS attachments_delete ON public.announcement_attachments;
DROP POLICY IF EXISTS attachments_insert ON public.announcement_attachments;
DROP POLICY IF EXISTS attachments_select ON public.announcement_attachments;
DROP POLICY IF EXISTS dev_course_progress_admin_mentor_select ON public.dev_course_progress;
DROP POLICY IF EXISTS dev_course_progress_own_all ON public.dev_course_progress;
DROP POLICY IF EXISTS dev_lesson_progress_admin_mentor_select ON public.dev_lesson_progress;
DROP POLICY IF EXISTS dev_lesson_progress_own_all ON public.dev_lesson_progress;
DROP POLICY IF EXISTS exam_cycles_insert_service ON public.exam_cycles;
DROP POLICY IF EXISTS exam_cycles_select_own ON public.exam_cycles;
DROP POLICY IF EXISTS exam_cycles_update_service ON public.exam_cycles;
DROP POLICY IF EXISTS mentee_read_own ON public.learning_assignments;
DROP POLICY IF EXISTS mentee_read_own ON public.mentor_mentee_assignments;
DROP POLICY IF EXISTS mentor_insert ON public.notifications;
DROP POLICY IF EXISTS mentor_manage_mentee ON public.comprehensive_exams;
DROP POLICY IF EXISTS mentor_manage_own ON public.learning_assignments;
DROP POLICY IF EXISTS mentor_read_own ON public.mentor_mentee_assignments;
DROP POLICY IF EXISTS reads_insert ON public.announcement_reads;
DROP POLICY IF EXISTS reads_select ON public.announcement_reads;
DROP POLICY IF EXISTS user_delete_own ON public.notifications;
DROP POLICY IF EXISTS user_own ON public.comprehensive_exam_answers;
DROP POLICY IF EXISTS user_own ON public.comprehensive_exam_questions;
DROP POLICY IF EXISTS user_own ON public.comprehensive_exams;
DROP POLICY IF EXISTS user_read_own ON public.notifications;
DROP POLICY IF EXISTS user_update_own ON public.notifications;
DROP POLICY IF EXISTS writing_claims_admin_delete ON public.writing_claims;
DROP POLICY IF EXISTS writing_claims_admin_select ON public.writing_claims;
DROP POLICY IF EXISTS writing_claims_admin_update ON public.writing_claims;
DROP POLICY IF EXISTS writing_claims_own_insert ON public.writing_claims;
DROP POLICY IF EXISTS writing_claims_own_select ON public.writing_claims;
DROP POLICY IF EXISTS writing_exercises_admin_mentor_select ON public.writing_exercises;
DROP POLICY IF EXISTS writing_exercises_own_all ON public.writing_exercises;

-- ============================================
-- (C) ポリシー作成 (181 policies)
-- ============================================
CREATE POLICY "Admin can manage grammar" ON public.jlpt_grammar FOR ALL TO public USING ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.id = ( SELECT auth.uid() AS uid))) = 'admin'::text));
CREATE POLICY "Admin can manage passages" ON public.jlpt_reading_passages FOR ALL TO public USING ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.id = ( SELECT auth.uid() AS uid))) = 'admin'::text));
CREATE POLICY "Admin can manage scripts" ON public.jlpt_listening_scripts FOR ALL TO public USING ((( SELECT profiles.role
   FROM profiles
  WHERE (profiles.id = ( SELECT auth.uid() AS uid))) = 'admin'::text));
CREATE POLICY "Admins can delete cs_terms" ON public.cs_terms FOR DELETE TO authenticated USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Admins can insert cs_terms" ON public.cs_terms FOR INSERT TO authenticated WITH CHECK ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Admins can manage all admin_feedbacks" ON public.admin_feedbacks FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage all feedback_replies" ON public.feedback_replies FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage all task_assignments" ON public.task_assignments FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage coding_exam_problems" ON public.coding_exam_problems FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage coding_problems" ON public.coding_problems FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage coding_skill_exams" ON public.coding_skill_exams FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage coding_test_cases" ON public.coding_test_cases FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage courses" ON public.courses FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage lessons" ON public.lessons FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage quiz_question_options" ON public.quiz_question_options FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage quiz_questions" ON public.quiz_questions FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage quizzes" ON public.quizzes FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage ranking_seasons" ON public.ranking_seasons FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can manage user_rankings" ON public.user_rankings FOR ALL TO public USING (is_admin());
CREATE POLICY "Admins can read audit log" ON public.audit_log FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Admins can update all profiles" ON public.profiles FOR UPDATE TO public USING (is_admin());
CREATE POLICY "Admins can update all quiz_attempts" ON public.quiz_attempts FOR UPDATE TO public USING (is_admin());
CREATE POLICY "Admins can update cs_terms" ON public.cs_terms FOR UPDATE TO authenticated USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Admins can view all attitude_culture_skills" ON public.attitude_culture_skills FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all claims" ON public.question_claims FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Admins can view all code_reviews" ON public.code_reviews FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all code_submissions" ON public.code_submissions FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all coding_skills" ON public.coding_skills FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all dispatch_readiness_scores" ON public.dispatch_readiness_scores FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all exam attempts" ON public.coding_exam_attempts FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all japanese_skills" ON public.japanese_skills FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all profiles" ON public.profiles FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all quiz_attempts" ON public.quiz_attempts FOR SELECT TO public USING (is_admin());
CREATE POLICY "Admins can view all writing claims" ON public.writing_claims FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text)))));
CREATE POLICY "Anyone authenticated can view cs_terms" ON public.cs_terms FOR SELECT TO authenticated USING (true);
CREATE POLICY "Anyone can read grammar" ON public.jlpt_grammar FOR SELECT TO public USING (true);
CREATE POLICY "Anyone can read kanji" ON public.jlpt_kanji FOR SELECT TO public USING (true);
CREATE POLICY "Anyone can read passages" ON public.jlpt_reading_passages FOR SELECT TO public USING (true);
CREATE POLICY "Anyone can read scripts" ON public.jlpt_listening_scripts FOR SELECT TO public USING (true);
CREATE POLICY "Authenticated can view all coding_skills" ON public.coding_skills FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated can view all japanese_skills" ON public.japanese_skills FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated can view all profiles" ON public.profiles FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can insert audit log" ON public.audit_log FOR INSERT TO public WITH CHECK ((auth.uid() = actor_id));
CREATE POLICY "Authenticated users can upload tts cache" ON storage.objects FOR INSERT TO public WITH CHECK (((bucket_id = 'tts-cache'::text) AND (auth.role() = 'authenticated'::text)));
CREATE POLICY "Authenticated users can view all test_cases" ON public.coding_test_cases FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view coding_problems" ON public.coding_problems FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view courses" ON public.courses FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view exam problems" ON public.coding_exam_problems FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view it_glossary" ON public.it_glossary FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view jlpt_vocabulary" ON public.jlpt_vocabulary FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view lesson_resources" ON public.lesson_resources FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view lessons" ON public.lessons FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view project_requirements" ON public.project_requirements FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view projects" ON public.projects FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view published exams" ON public.coding_skill_exams FOR SELECT TO public USING (((auth.role() = 'authenticated'::text) AND (is_published = true)));
-- [2026-06-11 / 00178] is_correct(정답) 노출 차단: SELECT를 admin/mentor로 제한
-- (멘티 표시는 quiz_question_options_safe 뷰 경유, 채점은 service role)
CREATE POLICY "Admins and mentors can view quiz_options" ON public.quiz_question_options FOR SELECT TO public USING (is_admin_or_mentor());
CREATE POLICY "Authenticated users can view quiz_questions" ON public.quiz_questions FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view quizzes" ON public.quizzes FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view ranking_seasons" ON public.ranking_seasons FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Authenticated users can view rankings" ON public.user_rankings FOR SELECT TO public USING ((auth.role() = 'authenticated'::text));
CREATE POLICY "Feedback authors can view own feedbacks" ON public.admin_feedbacks FOR SELECT TO public USING ((auth.uid() = admin_id));
CREATE POLICY "Feedback participants can create replies" ON public.feedback_replies FOR INSERT TO public WITH CHECK (((auth.uid() = user_id) AND (EXISTS ( SELECT 1
   FROM admin_feedbacks f
  WHERE ((f.id = feedback_replies.feedback_id) AND ((f.admin_id = auth.uid()) OR (f.user_id = auth.uid())))))));
CREATE POLICY "Feedback participants can view replies" ON public.feedback_replies FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM admin_feedbacks f
  WHERE ((f.id = feedback_replies.feedback_id) AND ((f.admin_id = auth.uid()) OR (f.user_id = auth.uid()))))));
CREATE POLICY "Mentors can delete own feedbacks" ON public.admin_feedbacks FOR DELETE TO public USING ((is_mentor() AND (admin_id = auth.uid())));
CREATE POLICY "Mentors can update mentee quiz_attempts" ON public.quiz_attempts FOR UPDATE TO public USING ((EXISTS ( SELECT 1
   FROM mentor_mentee_assignments
  WHERE ((mentor_mentee_assignments.mentor_id = auth.uid()) AND (mentor_mentee_assignments.mentee_id = quiz_attempts.user_id)))));
CREATE POLICY "Mentors can update own feedbacks" ON public.admin_feedbacks FOR UPDATE TO public USING ((is_mentor() AND (admin_id = auth.uid())));
CREATE POLICY "Mentors can view all claims" ON public.question_claims FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'mentor'::text)))));
CREATE POLICY "Mentors can view all writing claims" ON public.writing_claims FOR SELECT TO public USING ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'mentor'::text)))));
CREATE POLICY "Public avatar access" ON storage.objects FOR SELECT TO public USING ((bucket_id = 'avatars'::text));
CREATE POLICY "Public tts cache access" ON storage.objects FOR SELECT TO public USING ((bucket_id = 'tts-cache'::text));
CREATE POLICY "Service role full access writing claims" ON public.writing_claims FOR ALL TO public USING ((auth.role() = 'service_role'::text));
CREATE POLICY "Service role full access writing exercises" ON public.writing_exercises FOR ALL TO public USING ((auth.role() = 'service_role'::text));
CREATE POLICY "Users can delete own avatar" ON storage.objects FOR DELETE TO public USING (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text)));
CREATE POLICY "Users can delete own mastered items" ON public.user_mastered_items FOR DELETE TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can delete own replies" ON public.feedback_replies FOR DELETE TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can insert code_reviews for own submissions" ON public.code_reviews FOR INSERT TO public WITH CHECK ((submission_id IN ( SELECT code_submissions.id
   FROM code_submissions
  WHERE (code_submissions.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can insert own attitude_culture_skills" ON public.attitude_culture_skills FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own claims" ON public.question_claims FOR INSERT TO public WITH CHECK ((auth.uid() = user_id));
CREATE POLICY "Users can insert own code_submissions" ON public.code_submissions FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own coding_skills" ON public.coding_skills FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own cs_course_progress" ON public.cs_course_progress FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own cs_lesson_progress" ON public.cs_lesson_progress FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own dev_course_progress" ON public.dev_course_progress FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own dev_lesson_progress" ON public.dev_lesson_progress FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own dispatch_readiness_scores" ON public.dispatch_readiness_scores FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own enrollments" ON public.enrollments FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own exam attempts" ON public.coding_exam_attempts FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own japanese_skills" ON public.japanese_skills FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own lesson_progress" ON public.lesson_progress FOR INSERT TO public WITH CHECK ((enrollment_id IN ( SELECT enrollments.id
   FROM enrollments
  WHERE (enrollments.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can insert own mastered items" ON public.user_mastered_items FOR INSERT TO public WITH CHECK ((auth.uid() = user_id));
CREATE POLICY "Users can insert own quiz_answers" ON public.quiz_answers FOR INSERT TO public WITH CHECK ((attempt_id IN ( SELECT quiz_attempts.id
   FROM quiz_attempts
  WHERE (quiz_attempts.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can insert own quiz_attempts" ON public.quiz_attempts FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can insert own writing claims" ON public.writing_claims FOR INSERT TO public WITH CHECK ((auth.uid() = user_id));
CREATE POLICY "Users can insert own writing exercises" ON public.writing_exercises FOR INSERT TO public WITH CHECK ((auth.uid() = user_id));
CREATE POLICY "Users can read own writing exercises" ON public.writing_exercises FOR SELECT TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can update own assignment status" ON public.task_assignments FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = assigned_to));
CREATE POLICY "Users can update own attitude_culture_skills" ON public.attitude_culture_skills FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own avatar" ON storage.objects FOR UPDATE TO public USING (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text)));
CREATE POLICY "Users can update own code_submissions" ON public.code_submissions FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own coding_exam_attempts" ON public.coding_exam_attempts FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own coding_skills" ON public.coding_skills FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own cs_course_progress" ON public.cs_course_progress FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own cs_lesson_progress" ON public.cs_lesson_progress FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own dev_course_progress" ON public.dev_course_progress FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own dev_lesson_progress" ON public.dev_lesson_progress FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own japanese_skills" ON public.japanese_skills FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own lesson_progress" ON public.lesson_progress FOR UPDATE TO public USING ((enrollment_id IN ( SELECT enrollments.id
   FROM enrollments
  WHERE (enrollments.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = id));
CREATE POLICY "Users can update own quiz_attempts" ON public.quiz_attempts FOR UPDATE TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can update own replies" ON public.feedback_replies FOR UPDATE TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can update own writing exercises" ON public.writing_exercises FOR UPDATE TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can upload own avatar" ON storage.objects FOR INSERT TO public WITH CHECK (((bucket_id = 'avatars'::text) AND (auth.role() = 'authenticated'::text)));
CREATE POLICY "Users can view own assignments" ON public.task_assignments FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = assigned_to));
CREATE POLICY "Users can view own attitude_culture_skills" ON public.attitude_culture_skills FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own claims" ON public.question_claims FOR SELECT TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can view own code_reviews" ON public.code_reviews FOR SELECT TO public USING ((submission_id IN ( SELECT code_submissions.id
   FROM code_submissions
  WHERE (code_submissions.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can view own code_submissions" ON public.code_submissions FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own coding_skills" ON public.coding_skills FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own cs_course_progress" ON public.cs_course_progress FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own cs_lesson_progress" ON public.cs_lesson_progress FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own dev_course_progress" ON public.dev_course_progress FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own dev_lesson_progress" ON public.dev_lesson_progress FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own dispatch_readiness_scores" ON public.dispatch_readiness_scores FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own enrollments" ON public.enrollments FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own exam attempts" ON public.coding_exam_attempts FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own feedbacks" ON public.admin_feedbacks FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own japanese_skills" ON public.japanese_skills FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own lesson_progress" ON public.lesson_progress FOR SELECT TO public USING ((enrollment_id IN ( SELECT enrollments.id
   FROM enrollments
  WHERE (enrollments.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can view own mastered items" ON public.user_mastered_items FOR SELECT TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users can view own profile" ON public.profiles FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = id));
CREATE POLICY "Users can view own quiz_answers" ON public.quiz_answers FOR SELECT TO public USING ((attempt_id IN ( SELECT quiz_attempts.id
   FROM quiz_attempts
  WHERE (quiz_attempts.user_id = ( SELECT auth.uid() AS uid)))));
CREATE POLICY "Users can view own quiz_attempts" ON public.quiz_attempts FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own writing claims" ON public.writing_claims FOR SELECT TO public USING ((auth.uid() = user_id));
CREATE POLICY "Users manage own personal vocab" ON public.personal_vocab FOR ALL TO public USING ((auth.uid() = user_id)) WITH CHECK ((auth.uid() = user_id));
CREATE POLICY admin_full_access ON public.comprehensive_exams FOR ALL TO public USING (is_admin());
CREATE POLICY admin_full_access ON public.learning_assignments FOR ALL TO public USING (is_admin());
CREATE POLICY admin_full_access ON public.mentor_mentee_assignments FOR ALL TO public USING (is_admin());
CREATE POLICY admin_insert ON public.notifications FOR INSERT TO public WITH CHECK (is_admin());
CREATE POLICY admin_read ON public.comprehensive_exam_answers FOR SELECT TO public USING (is_admin());
CREATE POLICY admin_read ON public.comprehensive_exam_questions FOR SELECT TO public USING (is_admin());
CREATE POLICY announcement_attachments_delete ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'announcement-attachments'::text) AND (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text))))));
CREATE POLICY announcement_attachments_delete_admin ON storage.objects FOR DELETE TO authenticated USING (((bucket_id = 'announcement-attachments'::text) AND (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text))))));
CREATE POLICY announcement_attachments_download ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'announcement-attachments'::text));
CREATE POLICY announcement_attachments_insert_admin ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'announcement-attachments'::text) AND (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text))))));
CREATE POLICY announcement_attachments_select ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'announcement-attachments'::text));
CREATE POLICY announcement_attachments_upload ON storage.objects FOR INSERT TO authenticated WITH CHECK (((bucket_id = 'announcement-attachments'::text) AND (EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = 'admin'::text))))));
CREATE POLICY announcements_delete ON public.announcements FOR DELETE TO authenticated USING (is_admin());
CREATE POLICY announcements_insert ON public.announcements FOR INSERT TO authenticated WITH CHECK (is_admin());
CREATE POLICY announcements_select ON public.announcements FOR SELECT TO authenticated USING (true);
CREATE POLICY announcements_update ON public.announcements FOR UPDATE TO authenticated USING (is_admin());
CREATE POLICY attachments_delete ON public.announcement_attachments FOR DELETE TO authenticated USING (is_admin());
CREATE POLICY attachments_insert ON public.announcement_attachments FOR INSERT TO authenticated WITH CHECK (is_admin());
CREATE POLICY attachments_select ON public.announcement_attachments FOR SELECT TO authenticated USING (true);
CREATE POLICY dev_course_progress_admin_mentor_select ON public.dev_course_progress FOR SELECT TO authenticated USING (is_admin_or_mentor());
CREATE POLICY dev_course_progress_own_all ON public.dev_course_progress FOR ALL TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));
CREATE POLICY dev_lesson_progress_admin_mentor_select ON public.dev_lesson_progress FOR SELECT TO authenticated USING (is_admin_or_mentor());
CREATE POLICY dev_lesson_progress_own_all ON public.dev_lesson_progress FOR ALL TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));
CREATE POLICY exam_cycles_insert_service ON public.exam_cycles FOR INSERT TO public WITH CHECK (((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::text, 'mentor'::text]))))) OR (auth.uid() = user_id)));
CREATE POLICY exam_cycles_select_own ON public.exam_cycles FOR SELECT TO public USING ((auth.uid() = user_id));
CREATE POLICY exam_cycles_update_service ON public.exam_cycles FOR UPDATE TO public USING (((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::text, 'mentor'::text]))))) OR (auth.uid() = user_id)));
CREATE POLICY mentee_read_own ON public.learning_assignments FOR SELECT TO public USING ((assigned_to = auth.uid()));
CREATE POLICY mentee_read_own ON public.mentor_mentee_assignments FOR SELECT TO public USING ((mentee_id = auth.uid()));
CREATE POLICY mentor_insert ON public.notifications FOR INSERT TO public WITH CHECK ((EXISTS ( SELECT 1
   FROM profiles
  WHERE ((profiles.id = auth.uid()) AND (profiles.role = ANY (ARRAY['admin'::text, 'mentor'::text]))))));
CREATE POLICY mentor_manage_mentee ON public.comprehensive_exams FOR ALL TO public USING (is_mentor_of(user_id));
CREATE POLICY mentor_manage_own ON public.learning_assignments FOR ALL TO public USING (((assigned_by = auth.uid()) OR is_mentor_of(assigned_to)));
CREATE POLICY mentor_read_own ON public.mentor_mentee_assignments FOR SELECT TO public USING ((mentor_id = auth.uid()));
CREATE POLICY reads_insert ON public.announcement_reads FOR INSERT TO authenticated WITH CHECK ((user_id = auth.uid()));
CREATE POLICY reads_select ON public.announcement_reads FOR SELECT TO authenticated USING ((user_id = auth.uid()));
CREATE POLICY user_delete_own ON public.notifications FOR DELETE TO public USING ((user_id = auth.uid()));
CREATE POLICY user_own ON public.comprehensive_exam_answers FOR ALL TO public USING ((EXISTS ( SELECT 1
   FROM comprehensive_exams
  WHERE ((comprehensive_exams.id = comprehensive_exam_answers.exam_id) AND (comprehensive_exams.user_id = auth.uid())))));
CREATE POLICY user_own ON public.comprehensive_exam_questions FOR ALL TO public USING ((EXISTS ( SELECT 1
   FROM comprehensive_exams
  WHERE ((comprehensive_exams.id = comprehensive_exam_questions.exam_id) AND (comprehensive_exams.user_id = auth.uid())))));
CREATE POLICY user_own ON public.comprehensive_exams FOR ALL TO public USING ((user_id = auth.uid()));
CREATE POLICY user_read_own ON public.notifications FOR SELECT TO public USING ((user_id = auth.uid()));
CREATE POLICY user_update_own ON public.notifications FOR UPDATE TO public USING ((user_id = auth.uid()));
CREATE POLICY writing_claims_admin_delete ON public.writing_claims FOR DELETE TO authenticated USING (is_admin());
CREATE POLICY writing_claims_admin_select ON public.writing_claims FOR SELECT TO authenticated USING (is_admin());
CREATE POLICY writing_claims_admin_update ON public.writing_claims FOR UPDATE TO authenticated USING (is_admin());
CREATE POLICY writing_claims_own_insert ON public.writing_claims FOR INSERT TO authenticated WITH CHECK ((user_id = auth.uid()));
CREATE POLICY writing_claims_own_select ON public.writing_claims FOR SELECT TO authenticated USING ((user_id = auth.uid()));
CREATE POLICY writing_exercises_admin_mentor_select ON public.writing_exercises FOR SELECT TO authenticated USING (is_admin_or_mentor());
CREATE POLICY writing_exercises_own_all ON public.writing_exercises FOR ALL TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));

-- ============================================
-- (D) スキーマキャッシュ再読込
-- ============================================
NOTIFY pgrst, 'reload schema';

COMMIT;
