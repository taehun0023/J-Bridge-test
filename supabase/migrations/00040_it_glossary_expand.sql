-- ============================================
-- IT Glossary 카테고리 확장 + subcategory 컬럼 추가
-- expression, sentence_pattern 카테고리 추가
-- ============================================

-- 1. 기존 CHECK 제약조건 삭제
ALTER TABLE it_glossary DROP CONSTRAINT IF EXISTS it_glossary_category_check;

-- 2. 새 CHECK 제약조건 추가 (expression, sentence_pattern 추가)
ALTER TABLE it_glossary ADD CONSTRAINT it_glossary_category_check
  CHECK (category IN (
    'development', 'testing', 'design_doc', 'infrastructure',
    'project_management', 'business',
    'expression', 'sentence_pattern'
  ));

-- 3. subcategory 컬럼 추가 (expression, sentence_pattern 세부 분류용)
ALTER TABLE it_glossary ADD COLUMN IF NOT EXISTS subcategory TEXT;

-- 4. subcategory 인덱스 추가
CREATE INDEX IF NOT EXISTS idx_it_glossary_subcategory ON it_glossary(subcategory);
