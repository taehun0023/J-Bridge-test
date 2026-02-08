CREATE TABLE jlpt_vocabulary (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  word TEXT NOT NULL,
  reading TEXT NOT NULL,
  meaning_ko TEXT NOT NULL,
  jlpt_level TEXT NOT NULL CHECK (jlpt_level IN ('N5', 'N4', 'N3', 'N2', 'N1')),
  part_of_speech TEXT,
  example_sentence TEXT,
  example_sentence_ko TEXT,
  audio_url TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_jlpt_vocabulary_level ON jlpt_vocabulary(jlpt_level);

CREATE TABLE it_glossary (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  term_ja TEXT NOT NULL,
  reading TEXT,
  term_ko TEXT NOT NULL,
  term_en TEXT,
  category TEXT NOT NULL CHECK (category IN (
    'development', 'testing', 'design_doc', 'infrastructure',
    'project_management', 'business'
  )),
  description TEXT,
  example_sentence TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_it_glossary_category ON it_glossary(category);
