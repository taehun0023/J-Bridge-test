-- ============================================
-- 멘토 헬퍼 함수
-- ============================================
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
-- 멘토: task_assignments 접근
-- ============================================
CREATE POLICY "Mentors can view all task_assignments"
  ON task_assignments FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can create task_assignments"
  ON task_assignments FOR INSERT
  WITH CHECK (is_mentor() AND (SELECT auth.uid()) = assigned_by);

-- ============================================
-- 멘토: 프로필 및 스킬 조회 (레포트용)
-- ============================================
CREATE POLICY "Mentors can view all profiles"
  ON profiles FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all japanese_skills"
  ON japanese_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all coding_skills"
  ON coding_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all attitude_culture_skills"
  ON attitude_culture_skills FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR SELECT
  USING (is_mentor());

-- ============================================
-- 멘토: 퀴즈 시도 및 피드백 조회
-- ============================================
CREATE POLICY "Mentors can view all quiz_attempts"
  ON quiz_attempts FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can view all admin_feedbacks"
  ON admin_feedbacks FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can create admin_feedbacks"
  ON admin_feedbacks FOR INSERT
  WITH CHECK (is_mentor() AND (SELECT auth.uid()) = admin_id);

-- ============================================
-- 멘토: 열람 신청 조회/승인
-- ============================================
CREATE POLICY "Mentors can view all access requests"
  ON content_access_requests FOR SELECT
  USING (is_mentor());

CREATE POLICY "Mentors can update access requests"
  ON content_access_requests FOR UPDATE
  USING (is_mentor());
