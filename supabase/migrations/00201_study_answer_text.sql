-- 학습 시도 시 실제 입력/선택한 값(정답 여부와 함께 이력 보존)
ALTER TABLE study_attempts ADD COLUMN IF NOT EXISTS answer_text text;
