-- ============================================================
-- 00078: exam_cycles — Exam cycle scheduling system
-- ============================================================

-- 1. Create exam_cycles table
CREATE TABLE exam_cycles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  cycle_number SMALLINT NOT NULL DEFAULT 1,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'in_progress', 'completed', 'expired')),
  scheduled_at TIMESTAMPTZ NOT NULL,
  deadline_at TIMESTAMPTZ NOT NULL,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(user_id, cycle_number)
);

CREATE INDEX idx_exam_cycles_user_status ON exam_cycles(user_id, status);

-- 2. Add exam_cycle_id to comprehensive_exams (nullable FK)
ALTER TABLE comprehensive_exams
  ADD COLUMN exam_cycle_id UUID REFERENCES exam_cycles(id) ON DELETE SET NULL;

CREATE INDEX idx_comprehensive_exams_cycle ON comprehensive_exams(exam_cycle_id);

-- Notify PostgREST to reload schema (so it recognizes the new column)
NOTIFY pgrst, 'reload schema';

-- 3. RLS policies for exam_cycles
ALTER TABLE exam_cycles ENABLE ROW LEVEL SECURITY;

-- Users can read their own cycles
CREATE POLICY exam_cycles_select_own ON exam_cycles
  FOR SELECT USING (auth.uid() = user_id);

-- Service role handles inserts/updates (via server actions)
-- Mentees cannot directly insert/update cycles
CREATE POLICY exam_cycles_insert_service ON exam_cycles
  FOR INSERT WITH CHECK (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role IN ('admin', 'mentor'))
    OR auth.uid() = user_id
  );

CREATE POLICY exam_cycles_update_service ON exam_cycles
  FOR UPDATE USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role IN ('admin', 'mentor'))
    OR auth.uid() = user_id
  );

