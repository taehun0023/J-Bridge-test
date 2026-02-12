-- Question claims table for exam review feedback
CREATE TABLE question_claims (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID NOT NULL REFERENCES quiz_questions(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(question_id, user_id)
);

-- RLS
ALTER TABLE question_claims ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can insert own claims"
  ON question_claims FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view own claims"
  ON question_claims FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all claims"
  ON question_claims FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Mentors can view all claims"
  ON question_claims FOR SELECT
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'mentor')
  );
