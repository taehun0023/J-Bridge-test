-- Audit log for content changes
CREATE TABLE audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  actor_id UUID NOT NULL REFERENCES profiles(id),
  action TEXT NOT NULL CHECK (action IN ('create', 'update', 'delete', 'approve', 'reject', 'restore')),
  resource_type TEXT NOT NULL,
  resource_id TEXT NOT NULL,
  old_data JSONB,
  new_data JSONB,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_audit_log_actor ON audit_log(actor_id);
CREATE INDEX idx_audit_log_resource ON audit_log(resource_type, resource_id);
CREATE INDEX idx_audit_log_created ON audit_log(created_at DESC);

-- RLS
ALTER TABLE audit_log ENABLE ROW LEVEL SECURITY;

-- Only admins can read audit log (enforced via server actions with requireAdmin)
CREATE POLICY "Admins can read audit log"
  ON audit_log FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Insert is done via server actions (authenticated users can write their own actions)
CREATE POLICY "Authenticated users can insert audit log"
  ON audit_log FOR INSERT
  WITH CHECK (auth.uid() = actor_id);
