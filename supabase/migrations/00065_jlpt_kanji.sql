-- JLPT Kanji learning table
CREATE TABLE jlpt_kanji (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  kanji TEXT NOT NULL,
  reading_on TEXT,
  reading_kun TEXT,
  meaning_ko TEXT NOT NULL,
  meaning_en TEXT,
  stroke_count INT,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  example_words JSONB,
  sort_order INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_jlpt_kanji_level ON jlpt_kanji(jlpt_level);

-- RLS
ALTER TABLE jlpt_kanji ENABLE ROW LEVEL SECURITY;

-- Everyone can read kanji
CREATE POLICY "Anyone can read kanji"
  ON jlpt_kanji FOR SELECT
  USING (true);
