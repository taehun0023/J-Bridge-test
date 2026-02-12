-- ============================================
-- JLPT Reading Passages Table
-- ============================================

CREATE TABLE jlpt_reading_passages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  passage TEXT NOT NULL,
  passage_type TEXT NOT NULL CHECK (passage_type IN (
    'notice','email','article','advertisement','instruction','essay','letter','report'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  word_count INTEGER DEFAULT 0,
  topic TEXT,
  vocabulary_notes JSONB NOT NULL DEFAULT '[]',
  grammar_notes TEXT[],
  translation_ko TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_reading_level ON jlpt_reading_passages(jlpt_level);
CREATE INDEX idx_jlpt_reading_type ON jlpt_reading_passages(passage_type);

-- RLS
ALTER TABLE jlpt_reading_passages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read passages" ON jlpt_reading_passages FOR SELECT USING (true);
CREATE POLICY "Admin can manage passages" ON jlpt_reading_passages FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');
