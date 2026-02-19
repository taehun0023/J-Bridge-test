-- ============================================
-- J-Bridge Seed Data 적용 가이드
-- ============================================
-- 
-- 실행 순서:
-- 1. 이 파일의 기본 seed.sql 내용 실행
-- 2. seed_jlpt_n5.sql 실행
-- 3. seed_jlpt_n4.sql 실행
-- 4. seed_jlpt_n3.sql 실행
-- 5. seed_jlpt_n2.sql 실행
-- 6. seed_jlpt_n1.sql 실행
-- 7. seed_it_glossary.sql 실행
--
-- 주의: 중복 데이터 방지를 위해 기존 데이터 확인 후 실행하세요.
-- ============================================

-- 기존 데이터 확인 (선택사항)
-- SELECT COUNT(*) FROM jlpt_vocabulary;
-- SELECT COUNT(*) FROM it_glossary;
-- SELECT COUNT(*) FROM courses;

-- 중복 방지: 기존 데이터 삭제 후 재삽입 (필요시)
-- TRUNCATE TABLE jlpt_vocabulary CASCADE;
-- TRUNCATE TABLE it_glossary CASCADE;
-- TRUNCATE TABLE courses CASCADE;

-- ============================================
-- 1단계: 기본 seed.sql 실행
-- ============================================
-- supabase/seed.sql 파일의 내용을 복사하여 실행

-- ============================================
-- 2단계: JLPT 단어 데이터 실행
-- ============================================
-- supabase/seed_jlpt_n5.sql 실행
-- supabase/seed_jlpt_n4.sql 실행
-- supabase/seed_jlpt_n3.sql 실행
-- supabase/seed_jlpt_n2.sql 실행
-- supabase/seed_jlpt_n1.sql 실행

-- ============================================
-- 3단계: IT 용어집 데이터 실행
-- ============================================
-- supabase/seed_it_glossary.sql 실행

-- ============================================
-- 실행 후 확인
-- ============================================
-- SELECT COUNT(*) as jlpt_count FROM jlpt_vocabulary;
-- SELECT jlpt_level, COUNT(*) FROM jlpt_vocabulary GROUP BY jlpt_level;
-- SELECT COUNT(*) as it_glossary_count FROM it_glossary;
-- SELECT category, COUNT(*) FROM it_glossary GROUP BY category;
-- SELECT COUNT(*) as courses_count FROM courses;











