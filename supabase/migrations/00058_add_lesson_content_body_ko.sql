-- Add Korean translation column for lesson content
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS content_body_ko TEXT;
