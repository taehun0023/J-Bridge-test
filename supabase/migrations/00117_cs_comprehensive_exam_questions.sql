-- Persist the presented question set for comprehensive exams.
-- Required for the rebuilt CS comprehensive exam so refresh/reload does not re-randomize the exam.

CREATE TABLE comprehensive_exam_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID NOT NULL REFERENCES comprehensive_exams(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  question_category TEXT,
  difficulty TEXT,
  sort_order SMALLINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (exam_id, question_id),
  UNIQUE (exam_id, sort_order)
);

CREATE INDEX idx_comprehensive_exam_questions_exam
  ON comprehensive_exam_questions(exam_id, sort_order);

CREATE INDEX idx_comprehensive_exam_questions_question
  ON comprehensive_exam_questions(question_id);

ALTER TABLE comprehensive_exam_questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "admin_read" ON comprehensive_exam_questions FOR SELECT USING (is_admin());

CREATE POLICY "user_own" ON comprehensive_exam_questions FOR ALL USING (
  EXISTS (
    SELECT 1
    FROM comprehensive_exams
    WHERE comprehensive_exams.id = comprehensive_exam_questions.exam_id
      AND comprehensive_exams.user_id = auth.uid()
  )
);

NOTIFY pgrst, 'reload schema';
