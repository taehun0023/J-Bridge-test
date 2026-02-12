-- Content management improvements

-- 1. quiz_questions に is_published カラム追加
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS is_published BOOLEAN NOT NULL DEFAULT TRUE;

-- 既存の全問題を公開に設定
UPDATE quiz_questions SET is_published = TRUE WHERE is_published = FALSE;

-- 2. question_claims に claim_reason カラム追加 (nullable)
ALTER TABLE question_claims ADD COLUMN IF NOT EXISTS claim_reason TEXT;
