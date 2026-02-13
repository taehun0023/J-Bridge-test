-- Admin/Mentor can update quiz_attempts (for retake approval/denial)
CREATE POLICY "Admins can update all quiz_attempts"
  ON quiz_attempts FOR UPDATE USING (is_admin());

CREATE POLICY "Mentors can update mentee quiz_attempts"
  ON quiz_attempts FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM mentor_mentee_assignments
      WHERE mentor_id = auth.uid() AND mentee_id = quiz_attempts.user_id
    )
  );
