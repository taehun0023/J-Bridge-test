-- 암기 체크 (마스터리) 테이블
CREATE TABLE user_mastered_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  item_type TEXT NOT NULL CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar')),
  item_id UUID NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE(user_id, item_type, item_id)
);

CREATE INDEX idx_user_mastered_user ON user_mastered_items(user_id, item_type);

ALTER TABLE user_mastered_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own mastered items"
  ON user_mastered_items FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own mastered items"
  ON user_mastered_items FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own mastered items"
  ON user_mastered_items FOR DELETE
  USING (auth.uid() = user_id);
