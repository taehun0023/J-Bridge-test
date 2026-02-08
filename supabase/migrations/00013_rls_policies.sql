-- ============================================
-- RLS 활성화 (모든 테이블)
-- ============================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE japanese_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE attitude_culture_skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE dispatch_readiness_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;
ALTER TABLE lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE lesson_resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_test_cases ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_requirements ENABLE ROW LEVEL SECURITY;
ALTER TABLE quizzes ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_question_options ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE quiz_answers ENABLE ROW LEVEL SECURITY;
ALTER TABLE code_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE code_reviews ENABLE ROW LEVEL SECURITY;
ALTER TABLE jlpt_vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE it_glossary ENABLE ROW LEVEL SECURITY;

-- ============================================
-- profiles: 본인만 읽기/수정
-- ============================================
CREATE POLICY "Users can view own profile"
  ON profiles FOR SELECT USING ((SELECT auth.uid()) = id);
CREATE POLICY "Users can update own profile"
  ON profiles FOR UPDATE USING ((SELECT auth.uid()) = id);

-- ============================================
-- 스킬 테이블: 본인만 읽기
-- ============================================
CREATE POLICY "Users can view own japanese_skills"
  ON japanese_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own coding_skills"
  ON coding_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT USING ((SELECT auth.uid()) = user_id);

-- ============================================
-- enrollments & lesson_progress: 본인만
-- ============================================
CREATE POLICY "Users can view own enrollments"
  ON enrollments FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own enrollments"
  ON enrollments FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own lesson_progress"
  ON lesson_progress FOR SELECT USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can update own lesson_progress"
  ON lesson_progress FOR UPDATE USING (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );

-- ============================================
-- 콘텐츠: 인증된 사용자 읽기 가능
-- ============================================
CREATE POLICY "Authenticated users can view courses"
  ON courses FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view lessons"
  ON lessons FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view lesson_resources"
  ON lesson_resources FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view coding_problems"
  ON coding_problems FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view sample test_cases"
  ON coding_test_cases FOR SELECT USING (is_sample = TRUE);
CREATE POLICY "Authenticated users can view projects"
  ON projects FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view project_requirements"
  ON project_requirements FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quizzes"
  ON quizzes FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quiz_questions"
  ON quiz_questions FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view quiz_options"
  ON quiz_question_options FOR SELECT USING (auth.role() = 'authenticated');

-- ============================================
-- 퀴즈/코딩 제출: 본인만
-- ============================================
CREATE POLICY "Users can view own quiz_attempts"
  ON quiz_attempts FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own quiz_attempts"
  ON quiz_attempts FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own quiz_answers"
  ON quiz_answers FOR SELECT USING (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can insert own quiz_answers"
  ON quiz_answers FOR INSERT WITH CHECK (
    attempt_id IN (SELECT id FROM quiz_attempts WHERE user_id = (SELECT auth.uid()))
  );
CREATE POLICY "Users can view own code_submissions"
  ON code_submissions FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own code_submissions"
  ON code_submissions FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can view own code_reviews"
  ON code_reviews FOR SELECT USING (
    submission_id IN (SELECT id FROM code_submissions WHERE user_id = (SELECT auth.uid()))
  );

-- ============================================
-- 일본어 콘텐츠: 인증된 사용자 읽기 가능
-- ============================================
CREATE POLICY "Authenticated users can view jlpt_vocabulary"
  ON jlpt_vocabulary FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can view it_glossary"
  ON it_glossary FOR SELECT USING (auth.role() = 'authenticated');
