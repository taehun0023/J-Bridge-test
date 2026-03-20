CREATE TABLE IF NOT EXISTS cs_course_progress (
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  course_id TEXT NOT NULL,
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  completed_at TIMESTAMPTZ,
  PRIMARY KEY (user_id, course_id)
);

CREATE TABLE IF NOT EXISTS cs_lesson_progress (
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  lesson_id TEXT NOT NULL,
  course_id TEXT NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('started', 'completed')),
  started_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  completed_at TIMESTAMPTZ,
  PRIMARY KEY (user_id, lesson_id)
);

CREATE INDEX IF NOT EXISTS idx_cs_course_progress_user_id
  ON cs_course_progress(user_id);

CREATE INDEX IF NOT EXISTS idx_cs_lesson_progress_user_course
  ON cs_lesson_progress(user_id, course_id);

ALTER TABLE cs_course_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE cs_lesson_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own cs_course_progress"
  ON cs_course_progress FOR SELECT
  USING ((SELECT auth.uid()) = user_id);

CREATE POLICY "Users can insert own cs_course_progress"
  ON cs_course_progress FOR INSERT
  WITH CHECK ((SELECT auth.uid()) = user_id);

CREATE POLICY "Users can update own cs_course_progress"
  ON cs_course_progress FOR UPDATE
  USING ((SELECT auth.uid()) = user_id);

CREATE POLICY "Users can view own cs_lesson_progress"
  ON cs_lesson_progress FOR SELECT
  USING ((SELECT auth.uid()) = user_id);

CREATE POLICY "Users can insert own cs_lesson_progress"
  ON cs_lesson_progress FOR INSERT
  WITH CHECK ((SELECT auth.uid()) = user_id);

CREATE POLICY "Users can update own cs_lesson_progress"
  ON cs_lesson_progress FOR UPDATE
  USING ((SELECT auth.uid()) = user_id);
