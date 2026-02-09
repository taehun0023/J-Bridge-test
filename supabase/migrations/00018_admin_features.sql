-- 관리자 과제 배정
CREATE TABLE task_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_to UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  target_type TEXT NOT NULL CHECK (target_type IN ('quiz', 'coding_problem', 'coding_exam', 'project')),
  target_id UUID NOT NULL,

  title TEXT,
  description TEXT,
  due_date TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'in_progress', 'completed', 'overdue')),

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_task_assignments_assignee ON task_assignments(assigned_to, status);
CREATE INDEX idx_task_assignments_assigner ON task_assignments(assigned_by, created_at DESC);

-- 관리자 피드백
CREATE TABLE admin_feedbacks (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  admin_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,

  category TEXT NOT NULL DEFAULT 'general' CHECK (category IN (
    'general', 'japanese', 'coding', 'attitude', 'assignment', 'dispatch_readiness'
  )),
  content TEXT NOT NULL,

  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_admin_feedbacks_user ON admin_feedbacks(user_id, created_at DESC);
