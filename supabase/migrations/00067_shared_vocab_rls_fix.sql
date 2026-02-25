-- 모두의 단어장: 역할별 승인 워크플로우
-- 멘티: pending → 멘토/관리자 승인, 멘토/관리자: 바로 approved
-- UPDATE/DELETE는 server action에서 service role 사용

-- 1) 기존 정책 삭제 (original + 이전 구현 모두)
DROP POLICY IF EXISTS "Anyone can read approved vocab" ON shared_vocab_submissions;
DROP POLICY IF EXISTS "Submitter can update own pending" ON shared_vocab_submissions;
DROP POLICY IF EXISTS "Authenticated users can read approved vocab" ON shared_vocab_submissions;
DROP POLICY IF EXISTS "Authenticated users can update approved vocab" ON shared_vocab_submissions;
DROP POLICY IF EXISTS "Authenticated users can delete vocab" ON shared_vocab_submissions;
DROP POLICY IF EXISTS "Authenticated users can read vocab" ON shared_vocab_submissions;

-- 2) SELECT: 모든 인증 유저가 전체 읽기 (server action이 status 필터링)
-- 멘토/관리자가 pending 항목도 읽어야 하므로 전체 열람
CREATE POLICY "Authenticated users can read vocab"
  ON shared_vocab_submissions FOR SELECT
  USING (auth.uid() IS NOT NULL);

-- INSERT: 기존 유지 (별도 변경 불필요)
-- UPDATE/DELETE: RLS 정책 없음 → server action에서 service role client 사용

-- 3) unique index: pending+approved 중복 방지
DROP INDEX IF EXISTS idx_shared_vocab_normalized;
CREATE UNIQUE INDEX idx_shared_vocab_normalized
  ON shared_vocab_submissions(term_normalized)
  WHERE status IN ('pending', 'approved');

-- 4) status default를 'pending'으로 (멘티 기본 경로)
ALTER TABLE shared_vocab_submissions ALTER COLUMN status SET DEFAULT 'pending';

-- 5) user_mastered_items에 'shared_vocab' 타입 추가
ALTER TABLE user_mastered_items DROP CONSTRAINT IF EXISTS user_mastered_items_item_type_check;
ALTER TABLE user_mastered_items ADD CONSTRAINT user_mastered_items_item_type_check
  CHECK (item_type IN ('it_glossary', 'jlpt_vocabulary', 'jlpt_grammar', 'cs_term',
         'security_manual', 'attitude_manual', 'culture_manual', 'jlpt_kanji', 'shared_vocab'));
