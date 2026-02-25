-- Shared vocabulary submissions (みんなの単語帳)
CREATE TABLE shared_vocab_submissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  submitted_by UUID NOT NULL REFERENCES profiles(id),
  term_ja TEXT NOT NULL,
  term_reading TEXT,
  term_ko TEXT,
  term_en TEXT,
  example_sentence TEXT,
  category TEXT DEFAULT 'general' CHECK (category IN ('general', 'business', 'it')),
  status TEXT NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_by UUID REFERENCES profiles(id),
  reviewed_at TIMESTAMPTZ,
  rejection_reason TEXT,
  term_normalized TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Only one pending/approved entry per normalized term
CREATE UNIQUE INDEX idx_shared_vocab_normalized
  ON shared_vocab_submissions(term_normalized)
  WHERE status IN ('pending', 'approved');

CREATE INDEX idx_shared_vocab_status ON shared_vocab_submissions(status);
CREATE INDEX idx_shared_vocab_submitted_by ON shared_vocab_submissions(submitted_by);

-- RLS
ALTER TABLE shared_vocab_submissions ENABLE ROW LEVEL SECURITY;

-- Everyone can read approved entries
CREATE POLICY "Anyone can read approved vocab"
  ON shared_vocab_submissions FOR SELECT
  USING (status = 'approved' OR submitted_by = auth.uid());

-- Authenticated users can insert
CREATE POLICY "Authenticated users can submit vocab"
  ON shared_vocab_submissions FOR INSERT
  WITH CHECK (auth.uid() = submitted_by);

-- Submitter can update their own pending entries
CREATE POLICY "Submitter can update own pending"
  ON shared_vocab_submissions FOR UPDATE
  USING (submitted_by = auth.uid() AND status = 'pending');

-- Mentors/admins update for approval (handled via service role in server actions)
