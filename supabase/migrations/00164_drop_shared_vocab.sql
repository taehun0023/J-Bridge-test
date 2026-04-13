-- 00164_drop_shared_vocab.sql
-- shared_vocab_submissions 기능 삭제 (미사용)
-- 생성일: 2026-04-13

BEGIN;

-- 1. user_mastered_items에서 shared_vocab 관련 데이터 삭제
DELETE FROM user_mastered_items WHERE item_type = 'shared_vocab';

-- 2. item_type CHECK 제약조건 재설정 (shared_vocab 제거)
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary','jlpt_vocabulary','jlpt_grammar','cs_term',
         'security_manual','attitude_manual','culture_manual','jlpt_kanji',
         'jlpt_reading','jlpt_listening'));

-- 3. shared_vocab_submissions 테이블 삭제 (인덱스, RLS 정책 자동 삭제)
DROP TABLE IF EXISTS shared_vocab_submissions;

COMMIT;
