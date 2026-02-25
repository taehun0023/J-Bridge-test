-- Personal vocabulary (個人単語帳)
CREATE TABLE personal_vocab (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  term TEXT NOT NULL,
  meaning TEXT,
  memo TEXT,
  source_url TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_personal_vocab_user ON personal_vocab(user_id);

-- RLS
ALTER TABLE personal_vocab ENABLE ROW LEVEL SECURITY;

-- Users can only access their own entries
CREATE POLICY "Users manage own personal vocab"
  ON personal_vocab FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
