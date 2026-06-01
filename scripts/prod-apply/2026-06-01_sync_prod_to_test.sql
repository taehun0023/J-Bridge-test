-- AUTO-GENERATED prod -> test sync. Source of truth = TEST. Wrapped in a transaction.
BEGIN;

-- (1) is_admin() -> test definition
CREATE OR REPLACE FUNCTION public.is_admin()
 RETURNS boolean
 LANGUAGE sql
 STABLE SECURITY DEFINER
AS $function$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
  );
$function$
;

-- (2) drop prod-only tables
DROP TABLE IF EXISTS "public"."_backup_00171_misplaced_code_reading" CASCADE;

-- (3) create test-only tables (4)
CREATE TABLE "public"."it_certifications" (
  "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
  "user_id" uuid NOT NULL,
  "cert_name" text NOT NULL,
  "cert_issuer" text,
  "cert_date" date,
  "cert_number" text,
  "created_at" timestamp with time zone DEFAULT now() NOT NULL
);
ALTER TABLE "public"."it_certifications" ADD CONSTRAINT "it_certifications_pkey" PRIMARY KEY (id);
ALTER TABLE "public"."it_certifications" ADD CONSTRAINT "it_certifications_user_id_fkey" FOREIGN KEY (user_id) REFERENCES profiles(id) ON DELETE CASCADE;
ALTER TABLE "public"."it_certifications" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "it_certifications_admin_mentor_select" ON "public"."it_certifications" FOR SELECT TO authenticated USING (is_admin_or_mentor());
CREATE POLICY "it_certifications_own_all" ON "public"."it_certifications" FOR ALL TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));

CREATE TABLE "public"."coding_learning_progress" (
  "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
  "user_id" uuid NOT NULL,
  "problem_id" uuid NOT NULL,
  "status" text DEFAULT 'not_started'::text NOT NULL,
  "last_code" text,
  "last_language" text,
  "completed_at" timestamp with time zone,
  "created_at" timestamp with time zone DEFAULT now() NOT NULL,
  "updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
ALTER TABLE "public"."coding_learning_progress" ADD CONSTRAINT "coding_learning_progress_pkey" PRIMARY KEY (id);
ALTER TABLE "public"."coding_learning_progress" ADD CONSTRAINT "coding_learning_progress_problem_id_fkey" FOREIGN KEY (problem_id) REFERENCES coding_problems(id) ON DELETE CASCADE;
ALTER TABLE "public"."coding_learning_progress" ADD CONSTRAINT "coding_learning_progress_status_check" CHECK ((status = ANY (ARRAY['not_started'::text, 'in_progress'::text, 'completed'::text])));
ALTER TABLE "public"."coding_learning_progress" ADD CONSTRAINT "coding_learning_progress_user_id_fkey" FOREIGN KEY (user_id) REFERENCES profiles(id) ON DELETE CASCADE;
ALTER TABLE "public"."coding_learning_progress" ADD CONSTRAINT "coding_learning_progress_user_id_problem_id_key" UNIQUE (user_id, problem_id);
ALTER TABLE "public"."coding_learning_progress" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "coding_learning_progress_admin_mentor_select" ON "public"."coding_learning_progress" FOR SELECT TO authenticated USING (is_admin_or_mentor());
CREATE POLICY "coding_learning_progress_own_all" ON "public"."coding_learning_progress" FOR ALL TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));

CREATE TABLE "public"."content_access_requests" (
  "id" uuid DEFAULT uuid_generate_v4() NOT NULL,
  "user_id" uuid NOT NULL,
  "content_category" text NOT NULL,
  "content_path" text NOT NULL,
  "reason" text,
  "status" text DEFAULT 'pending'::text NOT NULL,
  "reviewed_by" uuid,
  "reviewed_at" timestamp with time zone,
  "review_note" text,
  "created_at" timestamp with time zone DEFAULT now() NOT NULL,
  "updated_at" timestamp with time zone DEFAULT now() NOT NULL
);
ALTER TABLE "public"."content_access_requests" ADD CONSTRAINT "content_access_requests_pkey" PRIMARY KEY (id);
ALTER TABLE "public"."content_access_requests" ADD CONSTRAINT "content_access_requests_reviewed_by_fkey" FOREIGN KEY (reviewed_by) REFERENCES profiles(id) ON DELETE SET NULL;
ALTER TABLE "public"."content_access_requests" ADD CONSTRAINT "content_access_requests_status_check" CHECK ((status = ANY (ARRAY['pending'::text, 'approved'::text, 'denied'::text])));
ALTER TABLE "public"."content_access_requests" ADD CONSTRAINT "content_access_requests_user_id_fkey" FOREIGN KEY (user_id) REFERENCES profiles(id) ON DELETE CASCADE;
CREATE UNIQUE INDEX idx_unique_pending_request ON public.content_access_requests USING btree (user_id, content_category) WHERE (status = 'pending'::text);
ALTER TABLE "public"."content_access_requests" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Admins can manage all access requests" ON "public"."content_access_requests" FOR ALL TO public USING (is_admin());
CREATE POLICY "Mentors can update access requests" ON "public"."content_access_requests" FOR UPDATE TO public USING (is_mentor());
CREATE POLICY "Mentors can view all access requests" ON "public"."content_access_requests" FOR SELECT TO public USING (is_mentor());
CREATE POLICY "Users can create own access requests" ON "public"."content_access_requests" FOR INSERT TO public WITH CHECK ((( SELECT auth.uid() AS uid) = user_id));
CREATE POLICY "Users can view own access requests" ON "public"."content_access_requests" FOR SELECT TO public USING ((( SELECT auth.uid() AS uid) = user_id));
CREATE TRIGGER set_content_access_requests_updated_at BEFORE UPDATE ON public.content_access_requests FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TABLE "public"."shared_vocab_submissions" (
  "id" uuid DEFAULT gen_random_uuid() NOT NULL,
  "submitted_by" uuid NOT NULL,
  "term_ja" text NOT NULL,
  "term_reading" text,
  "term_ko" text,
  "term_en" text,
  "example_sentence" text,
  "category" text DEFAULT 'general'::text,
  "status" text DEFAULT 'pending'::text NOT NULL,
  "reviewed_by" uuid,
  "reviewed_at" timestamp with time zone,
  "rejection_reason" text,
  "term_normalized" text NOT NULL,
  "created_at" timestamp with time zone DEFAULT now(),
  "updated_at" timestamp with time zone DEFAULT now()
);
ALTER TABLE "public"."shared_vocab_submissions" ADD CONSTRAINT "shared_vocab_submissions_category_check" CHECK ((category = ANY (ARRAY['general'::text, 'business'::text, 'it'::text])));
ALTER TABLE "public"."shared_vocab_submissions" ADD CONSTRAINT "shared_vocab_submissions_pkey" PRIMARY KEY (id);
ALTER TABLE "public"."shared_vocab_submissions" ADD CONSTRAINT "shared_vocab_submissions_reviewed_by_fkey" FOREIGN KEY (reviewed_by) REFERENCES profiles(id);
ALTER TABLE "public"."shared_vocab_submissions" ADD CONSTRAINT "shared_vocab_submissions_status_check" CHECK ((status = ANY (ARRAY['pending'::text, 'approved'::text, 'rejected'::text])));
ALTER TABLE "public"."shared_vocab_submissions" ADD CONSTRAINT "shared_vocab_submissions_submitted_by_fkey" FOREIGN KEY (submitted_by) REFERENCES profiles(id);
CREATE INDEX idx_shared_vocab_status ON public.shared_vocab_submissions USING btree (status);
CREATE INDEX idx_shared_vocab_submitted_by ON public.shared_vocab_submissions USING btree (submitted_by);
CREATE UNIQUE INDEX idx_shared_vocab_normalized ON public.shared_vocab_submissions USING btree (term_normalized) WHERE (status = ANY (ARRAY['pending'::text, 'approved'::text]));
ALTER TABLE "public"."shared_vocab_submissions" ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Authenticated users can read vocab" ON "public"."shared_vocab_submissions" FOR SELECT TO public USING ((auth.uid() IS NOT NULL));
CREATE POLICY "Authenticated users can submit vocab" ON "public"."shared_vocab_submissions" FOR INSERT TO public WITH CHECK ((auth.uid() = submitted_by));

-- (4) column alterations (existing tables; type/default/nullable)
ALTER TABLE "public"."announcements" ALTER COLUMN "id" SET DEFAULT uuid_generate_v4();
ALTER TABLE "public"."announcement_attachments" ALTER COLUMN "id" SET DEFAULT uuid_generate_v4();
ALTER TABLE "public"."announcement_attachments" ALTER COLUMN "file_size" SET DEFAULT 0;
ALTER TABLE "public"."announcement_attachments" ALTER COLUMN "file_size" DROP NOT NULL;
ALTER TABLE "public"."writing_exercises" ALTER COLUMN "user_id" DROP NOT NULL;
ALTER TABLE "public"."writing_exercises" ALTER COLUMN "glossary_id" DROP NOT NULL;
ALTER TABLE "public"."writing_exercises" ALTER COLUMN "auto_score" TYPE integer USING "auto_score"::integer;
ALTER TABLE "public"."writing_exercises" ALTER COLUMN "auto_score" DROP NOT NULL;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "id" SET DEFAULT uuid_generate_v4();
ALTER TABLE "public"."writing_claims" ALTER COLUMN "glossary_id" DROP NOT NULL;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "user_id" DROP NOT NULL;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "auto_score" TYPE integer USING "auto_score"::integer;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "auto_score" DROP NOT NULL;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "resolved" DROP NOT NULL;
ALTER TABLE "public"."dev_course_progress" ALTER COLUMN "started_at" DROP DEFAULT;
ALTER TABLE "public"."dev_course_progress" ALTER COLUMN "started_at" DROP NOT NULL;
ALTER TABLE "public"."dev_lesson_progress" ALTER COLUMN "started_at" DROP DEFAULT;
ALTER TABLE "public"."dev_lesson_progress" ALTER COLUMN "started_at" DROP NOT NULL;
ALTER TABLE "public"."profiles" ALTER COLUMN "it_certifications" TYPE jsonb USING "it_certifications"::jsonb;
ALTER TABLE "public"."writing_exercises" ALTER COLUMN "user_answer" DROP NOT NULL;
ALTER TABLE "public"."writing_claims" ALTER COLUMN "user_answer" DROP NOT NULL;
ALTER TABLE "public"."dev_lesson_progress" ALTER COLUMN "status" SET DEFAULT 'not_started'::text;
ALTER TABLE "public"."dev_lesson_progress" ALTER COLUMN "status" DROP NOT NULL;
ALTER TABLE "public"."announcement_reads" ADD COLUMN IF NOT EXISTS "id" uuid DEFAULT uuid_generate_v4() NOT NULL;
ALTER TABLE "public"."learning_assignments" ADD COLUMN IF NOT EXISTS "confirmation_note" text;

-- (5) constraints
ALTER TABLE "public"."it_glossary" DROP CONSTRAINT IF EXISTS "it_glossary_category_check";
ALTER TABLE "public"."quizzes" DROP CONSTRAINT IF EXISTS "quizzes_quiz_type_check";
ALTER TABLE "public"."writing_exercises" DROP CONSTRAINT IF EXISTS "writing_exercises_auto_score_check";
ALTER TABLE "public"."writing_exercises" DROP CONSTRAINT IF EXISTS "writing_exercises_glossary_id_fkey";
ALTER TABLE "public"."writing_claims" DROP CONSTRAINT IF EXISTS "writing_claims_glossary_id_fkey";
ALTER TABLE "public"."writing_claims" DROP CONSTRAINT IF EXISTS "writing_claims_glossary_id_user_id_key";
ALTER TABLE "public"."dev_lesson_progress" DROP CONSTRAINT IF EXISTS "dev_lesson_progress_status_check";
ALTER TABLE "public"."quiz_questions" DROP CONSTRAINT IF EXISTS "quiz_questions_curriculum_status_check";
ALTER TABLE "public"."quiz_questions" DROP CONSTRAINT IF EXISTS "quiz_questions_question_subtype_check";
ALTER TABLE "public"."quiz_questions" DROP CONSTRAINT IF EXISTS "quiz_questions_question_type_check";
ALTER TABLE "public"."quiz_questions" DROP CONSTRAINT IF EXISTS "quiz_questions_question_usage_scope_check";
ALTER TABLE "public"."announcement_reads" ADD CONSTRAINT "announcement_reads_announcement_id_user_id_key" UNIQUE (announcement_id, user_id);
ALTER TABLE "public"."announcement_reads" DROP CONSTRAINT IF EXISTS "announcement_reads_pkey";
ALTER TABLE "public"."announcement_reads" ADD CONSTRAINT "announcement_reads_pkey" PRIMARY KEY (id);
ALTER TABLE "public"."announcements" DROP CONSTRAINT IF EXISTS "announcements_author_id_fkey";
ALTER TABLE "public"."announcements" ADD CONSTRAINT "announcements_author_id_fkey" FOREIGN KEY (author_id) REFERENCES profiles(id) ON DELETE CASCADE;
ALTER TABLE "public"."user_mastered_items" DROP CONSTRAINT IF EXISTS "user_mastered_items_item_type_check";
ALTER TABLE "public"."user_mastered_items" ADD CONSTRAINT "user_mastered_items_item_type_check" CHECK ((item_type = ANY (ARRAY['it_glossary'::text, 'jlpt_vocabulary'::text, 'jlpt_grammar'::text, 'cs_term'::text, 'security_manual'::text, 'attitude_manual'::text, 'culture_manual'::text, 'jlpt_kanji'::text, 'shared_vocab'::text, 'jlpt_reading'::text, 'jlpt_listening'::text])));

-- (6) indexes
DROP INDEX IF EXISTS "public"."idx_announcements_created_at";
DROP INDEX IF EXISTS "public"."idx_attachments_announcement";
DROP INDEX IF EXISTS "public"."idx_reads_user";
DROP INDEX IF EXISTS "public"."idx_writing_exercises_user";
DROP INDEX IF EXISTS "public"."idx_writing_exercises_glossary";
DROP INDEX IF EXISTS "public"."idx_writing_claims_resolved";
DROP INDEX IF EXISTS "public"."idx_dev_course_progress_user_id";
DROP INDEX IF EXISTS "public"."idx_dev_lesson_progress_user_course";
DROP INDEX IF EXISTS "public"."idx_quiz_questions_curriculum_status";
DROP INDEX IF EXISTS "public"."idx_quiz_questions_usage_scope";
DROP INDEX IF EXISTS "public"."idx_quiz_questions_lesson_mapping";
DROP INDEX IF EXISTS "public"."idx_quiz_questions_topic_key";
CREATE INDEX idx_coding_exam_attempts_user_passed ON public.coding_exam_attempts USING btree (user_id) WHERE (passed = true);
CREATE INDEX idx_quiz_attempts_retake_status ON public.quiz_attempts USING btree (retake_request_status) WHERE (retake_request_status IS NOT NULL);
CREATE INDEX idx_quiz_questions_quiz_published_diff ON public.quiz_questions USING btree (quiz_id, is_published, difficulty);
CREATE INDEX idx_quiz_questions_quiz_category ON public.quiz_questions USING btree (quiz_id, question_category);
CREATE INDEX idx_comprehensive_exams_status ON public.comprehensive_exams USING btree (status) WHERE (status = ANY (ARRAY['requested'::text, 'approved'::text, 'in_progress'::text]));
CREATE INDEX idx_learning_assignments_progress ON public.learning_assignments USING btree (assigned_to, status) WHERE (status <> 'completed'::text);

-- (7) policies
DROP POLICY IF EXISTS "announcement_attachments_delete" ON "storage"."objects";
DROP POLICY IF EXISTS "announcement_attachments_download" ON "storage"."objects";
DROP POLICY IF EXISTS "announcement_attachments_upload" ON "storage"."objects";
DROP POLICY IF EXISTS "Service role full access writing exercises" ON "public"."writing_exercises";
DROP POLICY IF EXISTS "Users can insert own writing exercises" ON "public"."writing_exercises";
DROP POLICY IF EXISTS "Users can read own writing exercises" ON "public"."writing_exercises";
DROP POLICY IF EXISTS "Users can update own writing exercises" ON "public"."writing_exercises";
DROP POLICY IF EXISTS "user_delete_own" ON "public"."notifications";
DROP POLICY IF EXISTS "Admins can view all writing claims" ON "public"."writing_claims";
DROP POLICY IF EXISTS "Mentors can view all writing claims" ON "public"."writing_claims";
DROP POLICY IF EXISTS "Service role full access writing claims" ON "public"."writing_claims";
DROP POLICY IF EXISTS "Users can insert own writing claims" ON "public"."writing_claims";
DROP POLICY IF EXISTS "Users can view own writing claims" ON "public"."writing_claims";
DROP POLICY IF EXISTS "Users can insert own dev_course_progress" ON "public"."dev_course_progress";
DROP POLICY IF EXISTS "Users can update own dev_course_progress" ON "public"."dev_course_progress";
DROP POLICY IF EXISTS "Users can view own dev_course_progress" ON "public"."dev_course_progress";
DROP POLICY IF EXISTS "Users can insert own dev_lesson_progress" ON "public"."dev_lesson_progress";
DROP POLICY IF EXISTS "Users can update own dev_lesson_progress" ON "public"."dev_lesson_progress";
DROP POLICY IF EXISTS "Users can view own dev_lesson_progress" ON "public"."dev_lesson_progress";
DROP POLICY IF EXISTS "Mentors can view all profiles" ON "public"."profiles";
CREATE POLICY "Mentors can view all profiles" ON "public"."profiles" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can view all japanese_skills" ON "public"."japanese_skills";
CREATE POLICY "Mentors can view all japanese_skills" ON "public"."japanese_skills" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can view all coding_skills" ON "public"."coding_skills";
CREATE POLICY "Mentors can view all coding_skills" ON "public"."coding_skills" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can view all dispatch_readiness_scores" ON "public"."dispatch_readiness_scores";
CREATE POLICY "Mentors can view all dispatch_readiness_scores" ON "public"."dispatch_readiness_scores" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can create task_assignments" ON "public"."task_assignments";
CREATE POLICY "Mentors can create task_assignments" ON "public"."task_assignments" FOR INSERT TO public WITH CHECK ((is_mentor() AND (( SELECT auth.uid() AS uid) = assigned_by)));
DROP POLICY IF EXISTS "Mentors can view all task_assignments" ON "public"."task_assignments";
CREATE POLICY "Mentors can view all task_assignments" ON "public"."task_assignments" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can view all attitude_culture_skills" ON "public"."attitude_culture_skills";
CREATE POLICY "Mentors can view all attitude_culture_skills" ON "public"."attitude_culture_skills" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can view all quiz_attempts" ON "public"."quiz_attempts";
CREATE POLICY "Mentors can view all quiz_attempts" ON "public"."quiz_attempts" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Mentors can create admin_feedbacks" ON "public"."admin_feedbacks";
CREATE POLICY "Mentors can create admin_feedbacks" ON "public"."admin_feedbacks" FOR INSERT TO public WITH CHECK ((is_mentor() AND (( SELECT auth.uid() AS uid) = admin_id)));
DROP POLICY IF EXISTS "Mentors can view all admin_feedbacks" ON "public"."admin_feedbacks";
CREATE POLICY "Mentors can view all admin_feedbacks" ON "public"."admin_feedbacks" FOR SELECT TO public USING (is_mentor());
DROP POLICY IF EXISTS "Users can delete own received feedbacks" ON "public"."admin_feedbacks";
CREATE POLICY "Users can delete own received feedbacks" ON "public"."admin_feedbacks" FOR DELETE TO public USING ((auth.uid() = user_id));

COMMIT;