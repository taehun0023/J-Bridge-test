-- 00049_add_missing_indexes.sql
-- Performance indexes identified in architecture analysis (09_refactoring_candidates.md 5.3절)

-- 1. Assessment core query: fetchAllQuestions() filters by quiz_id + is_published + difficulty
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_published_diff
  ON quiz_questions (quiz_id, is_published, difficulty);

-- 2. fetchRandomByCategory() filters by quiz_id + question_category
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_category
  ON quiz_questions (quiz_id, question_category);

-- 3. recalculateUserScores() only queries passed=true exam attempts
CREATE INDEX IF NOT EXISTS idx_coding_exam_attempts_user_passed
  ON coding_exam_attempts (user_id)
  WHERE passed = TRUE;

-- 4. quiz_attempts: retake_request_status filtering (admin tasks page)
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_retake_status
  ON quiz_attempts (retake_request_status)
  WHERE retake_request_status IS NOT NULL;

-- 5. comprehensive_exams: approval workflow queries
CREATE INDEX IF NOT EXISTS idx_comprehensive_exams_status
  ON comprehensive_exams (status)
  WHERE status IN ('requested', 'approved', 'in_progress');

-- 6. learning_assignments: progress check by assigned_to + status
CREATE INDEX IF NOT EXISTS idx_learning_assignments_progress
  ON learning_assignments (assigned_to, status)
  WHERE status != 'completed';
