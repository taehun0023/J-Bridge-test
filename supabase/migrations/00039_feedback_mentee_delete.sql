-- Part 1: Allow mentees to delete their own received feedbacks
CREATE POLICY "Users can delete own received feedbacks"
  ON admin_feedbacks FOR DELETE
  USING (auth.uid() = user_id);
