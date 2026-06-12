-- Add Korean hun-eum gloss (훈음, e.g. '누를 압') to jlpt_kanji
-- Korean learners recognize hanja by their traditional 새김+음 reading.
ALTER TABLE jlpt_kanji ADD COLUMN IF NOT EXISTS korean_gloss TEXT;

COMMENT ON COLUMN jlpt_kanji.korean_gloss IS 'Korean hun-eum gloss (훈음/새김), e.g. 圧 → 누를 압';
