-- ============================================
-- Comprehensive RLS Policy Fixes
-- Addresses multiple missing policies that prevent
-- server actions from working properly
-- ============================================

-- 1. Fix coding_test_cases: Allow authenticated users to read ALL test cases
-- Server actions filter results before returning to client (only sample cases shown)
DROP POLICY IF EXISTS "Authenticated users can view sample test_cases" ON coding_test_cases;
CREATE POLICY "Authenticated users can view all test_cases"
  ON coding_test_cases FOR SELECT USING (auth.role() = 'authenticated');

-- 2. Add code_reviews INSERT policy (for submitCode code review saving)
CREATE POLICY "Users can insert code_reviews for own submissions"
  ON code_reviews FOR INSERT WITH CHECK (
    submission_id IN (SELECT id FROM code_submissions WHERE user_id = (SELECT auth.uid()))
  );

-- 3. Add japanese_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own japanese_skills"
  ON japanese_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own japanese_skills"
  ON japanese_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 4. Add coding_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own coding_skills"
  ON coding_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own coding_skills"
  ON coding_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 5. Add attitude_culture_skills INSERT/UPDATE policies (for recalculateUserScores upsert)
CREATE POLICY "Users can insert own attitude_culture_skills"
  ON attitude_culture_skills FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);
CREATE POLICY "Users can update own attitude_culture_skills"
  ON attitude_culture_skills FOR UPDATE USING ((SELECT auth.uid()) = user_id);

-- 6. Add dispatch_readiness_scores INSERT policy (for recalculateUserScores snapshot)
CREATE POLICY "Users can insert own dispatch_readiness_scores"
  ON dispatch_readiness_scores FOR INSERT WITH CHECK ((SELECT auth.uid()) = user_id);

-- 7. Add lesson_progress INSERT policy (for course progress tracking)
CREATE POLICY "Users can insert own lesson_progress"
  ON lesson_progress FOR INSERT WITH CHECK (
    enrollment_id IN (SELECT id FROM enrollments WHERE user_id = (SELECT auth.uid()))
  );
