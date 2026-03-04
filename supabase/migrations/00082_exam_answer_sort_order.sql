-- Add sort_order column to preserve question presentation order in exam reviews
ALTER TABLE comprehensive_exam_answers ADD COLUMN sort_order SMALLINT;
ALTER TABLE quiz_answers ADD COLUMN sort_order SMALLINT;
