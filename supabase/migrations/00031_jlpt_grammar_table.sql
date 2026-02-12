-- ============================================
-- JLPT Grammar Table
-- ============================================

CREATE TABLE jlpt_grammar (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  pattern TEXT NOT NULL,
  meaning_ko TEXT NOT NULL,
  meaning_ja TEXT NOT NULL,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5','N4','N3','N2','N1')),
  formation TEXT NOT NULL,
  formation_detail TEXT,
  category TEXT CHECK (category IN (
    'permission','obligation','desire','ability','condition',
    'reason','contrast','conjecture','change','degree',
    'time','manner','listing','emphasis','formal'
  )),
  example_sentences JSONB NOT NULL DEFAULT '[]',
  related_patterns TEXT[],
  common_mistakes TEXT,
  usage_notes TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_grammar_level ON jlpt_grammar(jlpt_level);
CREATE INDEX idx_jlpt_grammar_category ON jlpt_grammar(category);

-- RLS
ALTER TABLE jlpt_grammar ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read grammar" ON jlpt_grammar FOR SELECT USING (true);
CREATE POLICY "Admin can manage grammar" ON jlpt_grammar FOR ALL
  USING ((SELECT role FROM profiles WHERE id = (SELECT auth.uid())) = 'admin');
