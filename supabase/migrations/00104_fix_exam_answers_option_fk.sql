-- Fix: comprehensive_exam_answers.selected_option_id FK missing ON DELETE SET NULL
-- This caused option deletion to fail silently when editing questions that were
-- referenced by exam answers, resulting in duplicate options (4→8→12).
-- quiz_answers already has ON DELETE SET NULL; this aligns comprehensive_exam_answers.

ALTER TABLE comprehensive_exam_answers
  DROP CONSTRAINT comprehensive_exam_answers_selected_option_id_fkey,
  ADD CONSTRAINT comprehensive_exam_answers_selected_option_id_fkey
    FOREIGN KEY (selected_option_id)
    REFERENCES quiz_question_options(id)
    ON DELETE SET NULL;
