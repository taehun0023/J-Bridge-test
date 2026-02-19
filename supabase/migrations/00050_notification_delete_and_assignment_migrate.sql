-- Allow users to delete their own notifications
CREATE POLICY "user_delete_own" ON notifications
  FOR DELETE USING (user_id = auth.uid());

-- Migrate old business-lit subcategories: attitude/culture → attitude-culture
UPDATE learning_assignments
  SET subcategory = 'attitude-culture'
  WHERE category = 'business-lit' AND subcategory IN ('attitude', 'culture');
