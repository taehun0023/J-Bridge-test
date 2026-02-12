-- helper function
CREATE OR REPLACE FUNCTION is_mentor_of(target_user_id UUID)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM mentor_mentee_assignments
    WHERE mentor_id = auth.uid() AND mentee_id = target_user_id
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- helper function
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
  );
$$ LANGUAGE sql SECURITY DEFINER STABLE;

-- mentor_mentee_assignments RLS
ALTER TABLE mentor_mentee_assignments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON mentor_mentee_assignments FOR ALL USING (is_admin());
CREATE POLICY "mentor_read_own" ON mentor_mentee_assignments FOR SELECT USING (mentor_id = auth.uid());
CREATE POLICY "mentee_read_own" ON mentor_mentee_assignments FOR SELECT USING (mentee_id = auth.uid());

-- notifications RLS
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
CREATE POLICY "user_read_own" ON notifications FOR SELECT USING (user_id = auth.uid());
CREATE POLICY "user_update_own" ON notifications FOR UPDATE USING (user_id = auth.uid());
CREATE POLICY "admin_insert" ON notifications FOR INSERT WITH CHECK (is_admin());
CREATE POLICY "mentor_insert" ON notifications FOR INSERT WITH CHECK (
  EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role IN ('admin','mentor'))
);

-- learning_assignments RLS
ALTER TABLE learning_assignments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON learning_assignments FOR ALL USING (is_admin());
CREATE POLICY "mentor_manage_own" ON learning_assignments FOR ALL USING (
  assigned_by = auth.uid() OR is_mentor_of(assigned_to)
);
CREATE POLICY "mentee_read_own" ON learning_assignments FOR SELECT USING (assigned_to = auth.uid());

-- comprehensive_exams RLS
ALTER TABLE comprehensive_exams ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_full_access" ON comprehensive_exams FOR ALL USING (is_admin());
CREATE POLICY "mentor_manage_mentee" ON comprehensive_exams FOR ALL USING (is_mentor_of(user_id));
CREATE POLICY "user_own" ON comprehensive_exams FOR ALL USING (user_id = auth.uid());

-- comprehensive_exam_answers RLS
ALTER TABLE comprehensive_exam_answers ENABLE ROW LEVEL SECURITY;
CREATE POLICY "admin_read" ON comprehensive_exam_answers FOR SELECT USING (is_admin());
CREATE POLICY "user_own" ON comprehensive_exam_answers FOR ALL USING (
  EXISTS (SELECT 1 FROM comprehensive_exams WHERE id = exam_id AND user_id = auth.uid())
);

NOTIFY pgrst, 'reload schema';
