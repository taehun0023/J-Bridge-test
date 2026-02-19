-- Add 'awaiting_confirmation' status to learning_assignments
-- This enables admin/mentor confirmation before marking assignments as completed

-- Drop & recreate CHECK constraint to add 'awaiting_confirmation'
ALTER TABLE learning_assignments DROP CONSTRAINT IF EXISTS learning_assignments_status_check;
ALTER TABLE learning_assignments ADD CONSTRAINT learning_assignments_status_check
  CHECK (status IN ('pending', 'in_progress', 'awaiting_confirmation', 'completed'));

-- Add confirmation tracking columns
ALTER TABLE learning_assignments ADD COLUMN IF NOT EXISTS confirmed_by UUID REFERENCES profiles(id);
ALTER TABLE learning_assignments ADD COLUMN IF NOT EXISTS confirmed_at TIMESTAMPTZ;
