-- 6개 카테고리 → 3개 통합
UPDATE it_glossary SET category = 'it' WHERE category IN ('development', 'infrastructure');
UPDATE it_glossary SET category = 'dev' WHERE category IN ('testing', 'design_doc', 'project_management');
-- 'business' 유지

-- CHECK 제약 업데이트
ALTER TABLE it_glossary DROP CONSTRAINT IF EXISTS it_glossary_category_check;
ALTER TABLE it_glossary ADD CONSTRAINT it_glossary_category_check
  CHECK (category IN ('it', 'dev', 'business', 'expression', 'sentence_pattern'));

-- term_ja 중복 제거 후 UNIQUE 제약 추가 (ON CONFLICT 용)
DELETE FROM it_glossary a USING it_glossary b
  WHERE a.id > b.id AND a.term_ja = b.term_ja;
CREATE UNIQUE INDEX IF NOT EXISTS idx_it_glossary_term_ja_unique ON it_glossary(term_ja);
