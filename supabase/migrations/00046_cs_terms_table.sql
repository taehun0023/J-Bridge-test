-- CS知識 用語テーブル (ITパスポート + 基本情報技術者試験)
CREATE TABLE cs_terms (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'basic_theory','algorithms','data_structures',
    'computer_architecture','database','networking','security'
  )),
  difficulty_level TEXT NOT NULL DEFAULT 'ip' CHECK (difficulty_level IN ('ip', 'fe')),
  description TEXT,
  example_sentence TEXT,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_cs_terms_category ON cs_terms(category);
CREATE INDEX idx_cs_terms_difficulty ON cs_terms(difficulty_level);
CREATE INDEX idx_cs_terms_cat_diff ON cs_terms(category, difficulty_level);

ALTER TABLE cs_terms ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone authenticated can view cs_terms"
  ON cs_terms FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can insert cs_terms"
  ON cs_terms FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admins can update cs_terms"
  ON cs_terms FOR UPDATE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

CREATE POLICY "Admins can delete cs_terms"
  ON cs_terms FOR DELETE
  TO authenticated
  USING (
    EXISTS (SELECT 1 FROM profiles WHERE id = auth.uid() AND role = 'admin')
  );

-- user_mastered_items に cs_term を追加
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term'));

-- quizzes の quiz_type に cs_knowledge を追加
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge'
  ));
