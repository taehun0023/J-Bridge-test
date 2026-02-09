-- ============================================
-- 헬퍼 함수: 현재 유저가 admin인지 확인
-- ============================================
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = (SELECT auth.uid()) AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ============================================
-- Admin이 기존 테이블 전체 조회 가능
-- ============================================

-- profiles
CREATE POLICY "Admins can view all profiles"
  ON profiles FOR SELECT USING (is_admin());

-- 스킬 테이블
CREATE POLICY "Admins can view all japanese_skills"
  ON japanese_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all coding_skills"
  ON coding_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT USING (is_admin());

-- 제출/시도 기록
CREATE POLICY "Admins can view all code_submissions"
  ON code_submissions FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all code_reviews"
  ON code_reviews FOR SELECT USING (is_admin());
CREATE POLICY "Admins can view all quiz_attempts"
  ON quiz_attempts FOR SELECT USING (is_admin());

-- 콘텐츠 CRUD
CREATE POLICY "Admins can manage courses"
  ON courses FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage lessons"
  ON lessons FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage coding_problems"
  ON coding_problems FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage coding_test_cases"
  ON coding_test_cases FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quizzes"
  ON quizzes FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quiz_questions"
  ON quiz_questions FOR ALL USING (is_admin());
CREATE POLICY "Admins can manage quiz_question_options"
  ON quiz_question_options FOR ALL USING (is_admin());

-- ============================================
-- 신규 테이블 RLS 활성화 + 정책
-- ============================================

ALTER TABLE coding_skill_exams ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_exam_problems ENABLE ROW LEVEL SECURITY;
ALTER TABLE coding_exam_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE ranking_seasons ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_rankings ENABLE ROW LEVEL SECURITY;
ALTER TABLE task_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE admin_feedbacks ENABLE ROW LEVEL SECURITY;

-- coding_skill_exams: 인증된 사용자 published만, Admin 전체
CREATE POLICY "Authenticated users can view published exams"
  ON coding_skill_exams FOR SELECT USING (auth.role() = 'authenticated' AND is_published = TRUE);
CREATE POLICY "Admins can manage coding_skill_exams"
  ON coding_skill_exams FOR ALL USING (is_admin());

-- coding_exam_problems: 인증된 사용자 읽기, Admin CRUD
CREATE POLICY "Authenticated users can view exam problems"
  ON coding_exam_problems FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage coding_exam_problems"
  ON coding_exam_problems FOR ALL USING (is_admin());

-- coding_exam_attempts: 본인 + Admin 조회
CREATE POLICY "Users can view own exam attempts"
  ON coding_exam_attempts FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can insert own exam attempts"
  ON coding_exam_attempts FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Admins can view all exam attempts"
  ON coding_exam_attempts FOR SELECT USING (is_admin());

-- ranking_seasons: 인증된 사용자 읽기, Admin CRUD
CREATE POLICY "Authenticated users can view ranking_seasons"
  ON ranking_seasons FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage ranking_seasons"
  ON ranking_seasons FOR ALL USING (is_admin());

-- user_rankings: 인증된 사용자 전원 조회 (랭킹보드)
CREATE POLICY "Authenticated users can view rankings"
  ON user_rankings FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Admins can manage user_rankings"
  ON user_rankings FOR ALL USING (is_admin());

-- task_assignments: 본인 배정 조회/수정 + Admin 전체 관리
CREATE POLICY "Users can view own assignments"
  ON task_assignments FOR SELECT USING ((SELECT auth.uid()) = assigned_to);
CREATE POLICY "Users can update own assignment status"
  ON task_assignments FOR UPDATE USING ((SELECT auth.uid()) = assigned_to);
CREATE POLICY "Admins can manage all task_assignments"
  ON task_assignments FOR ALL USING (is_admin());

-- admin_feedbacks: 본인 피드백 조회 + Admin CRUD
CREATE POLICY "Users can view own feedbacks"
  ON admin_feedbacks FOR SELECT USING ((SELECT auth.uid()) = user_id);
CREATE POLICY "Admins can manage all admin_feedbacks"
  ON admin_feedbacks FOR ALL USING (is_admin());
