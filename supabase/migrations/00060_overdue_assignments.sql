-- Add overdue status and reason fields to learning_assignments

ALTER TABLE learning_assignments DROP CONSTRAINT IF EXISTS learning_assignments_status_check;
ALTER TABLE learning_assignments ADD CONSTRAINT learning_assignments_status_check
  CHECK (status IN ('pending', 'in_progress', 'awaiting_confirmation', 'completed', 'overdue'));

ALTER TABLE learning_assignments ADD COLUMN IF NOT EXISTS overdue_reason TEXT;
ALTER TABLE learning_assignments ADD COLUMN IF NOT EXISTS overdue_reason_at TIMESTAMPTZ;
