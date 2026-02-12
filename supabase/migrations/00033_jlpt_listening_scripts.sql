-- ============================================
-- JLPT Listening Scripts Table
-- ============================================

CREATE TABLE jlpt_listening_scripts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  script TEXT NOT NULL,
  script_type TEXT NOT NULL CHECK (script_type IN (
    'dialogue','monologue','announcement','instruction','meeting','phone_call'
  )),
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  speakers TEXT[],
  situation TEXT,
  vocabulary_notes JSONB NOT NULL DEFAULT '[]',
  translation_ko TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_listening_level ON jlpt_listening_scripts(jlpt_level);
CREATE INDEX idx_jlpt_listening_type ON jlpt_listening_scripts(script_type);

-- RLS
ALTER TABLE jlpt_listening_scripts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read scripts" ON jlpt_listening_scripts FOR SELECT USING (true);
CREATE POLICY "Admin can manage scripts" ON jlpt_listening_scripts FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');
