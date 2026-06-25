-- 모의시험 진행상황 보존(중단 후 재개): 임시 답안 + 저장시각.
ALTER TABLE comprehensive_exams ADD COLUMN IF NOT EXISTS draft_answers JSONB;
ALTER TABLE comprehensive_exams ADD COLUMN IF NOT EXISTS progress_saved_at TIMESTAMPTZ;
COMMENT ON COLUMN comprehensive_exams.draft_answers IS '응시 중 임시 답안 {question_id: option_id}. 제출 전 보존용.';

NOTIFY pgrst, 'reload schema';
