-- メンター⇔メンティー紐付けテーブル
CREATE TABLE mentor_mentee_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  mentor_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  mentee_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE(mentor_id, mentee_id)
);

-- 汎用通知テーブル
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  type TEXT NOT NULL,  -- 'task_assigned','exam_requested','exam_approved','exam_denied','exam_completed'
  title TEXT NOT NULL,
  message TEXT,
  link TEXT,             -- クリック時の遷移先
  is_read BOOLEAN NOT NULL DEFAULT FALSE,
  related_id UUID,       -- 関連オブジェクトID
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_notifications_user ON notifications(user_id, is_read, created_at DESC);

-- 学習課題テーブル (カテゴリ/サブカテゴリ/レベル指定)
CREATE TABLE learning_assignments (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  assigned_by UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  assigned_to UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,      -- 'seikatsu','business-jp','cs','dev','business-lit'
  subcategory TEXT NOT NULL,   -- 'vocabulary','grammar','reading','listening','java' 等
  content_level TEXT,          -- 'N5','N4'... or null
  title TEXT NOT NULL,
  description TEXT,
  due_date TIMESTAMPTZ,
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending','in_progress','completed')),
  required_quiz_ids UUID[] DEFAULT '{}',  -- この課題に必要なクイズID
  passed_quiz_ids UUID[] DEFAULT '{}',    -- 合格済みクイズID
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);
CREATE INDEX idx_learning_assignments_assignee ON learning_assignments(assigned_to, status);

-- 総合試験テーブル
CREATE TABLE comprehensive_exams (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  category TEXT NOT NULL,
  subcategory TEXT NOT NULL,
  content_level TEXT,
  status TEXT NOT NULL DEFAULT 'requested'
    CHECK (status IN ('requested','approved','denied','in_progress','completed','failed')),
  requested_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  approved_at TIMESTAMPTZ,
  approved_by UUID REFERENCES profiles(id),
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  time_limit_minutes INT NOT NULL DEFAULT 40,
  total_questions INT NOT NULL DEFAULT 30,
  score SMALLINT,
  passed BOOLEAN,
  passing_score SMALLINT NOT NULL DEFAULT 70
);
CREATE INDEX idx_comprehensive_exams_user ON comprehensive_exams(user_id, status);

-- 総合試験回答テーブル
CREATE TABLE comprehensive_exam_answers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  exam_id UUID NOT NULL REFERENCES comprehensive_exams(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES quiz_questions(id),
  selected_option_id UUID REFERENCES quiz_question_options(id),
  is_correct BOOLEAN,
  answered_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- quizzesテーブルにcontent_level列を追加
ALTER TABLE quizzes ADD COLUMN IF NOT EXISTS content_level TEXT;

-- 既存クイズタイトルからレベルをバックフィル
UPDATE quizzes SET content_level = 'N5' WHERE title ILIKE '%N5%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N4' WHERE title ILIKE '%N4%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N3' WHERE title ILIKE '%N3%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N2' WHERE title ILIKE '%N2%' AND content_level IS NULL;
UPDATE quizzes SET content_level = 'N1' WHERE title ILIKE '%N1%' AND content_level IS NULL;
