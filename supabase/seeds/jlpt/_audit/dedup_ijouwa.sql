-- 〜以上は(N1) / 〜以上（は）(N2) 중복 통합 (2026-06-27)
-- N2 〜以上（は） 유지, N1 〜以上は 삭제, 체크 재매핑

DO $$
DECLARE
  del_id UUID := '80b1e220-99f0-4d9f-aa0f-1abd8ab30de5'; -- N1 〜以上は
  keep_id UUID := '4c203d93-df50-4e83-a8bb-76883c5cf380'; -- N2 〜以上（は）
BEGIN
  -- 양쪽 다 체크한 유저: 삭제행 중복체크 제거
  DELETE FROM user_mastered_items umi
  WHERE umi.item_type='jlpt_grammar' AND umi.item_id=del_id::text
    AND EXISTS (SELECT 1 FROM user_mastered_items u2
                WHERE u2.item_type='jlpt_grammar' AND u2.item_id=keep_id::text
                  AND u2.user_id=umi.user_id);

  -- 나머지 체크 N2 유지행으로 재매핑
  UPDATE user_mastered_items SET item_id=keep_id::text
  WHERE item_type='jlpt_grammar' AND item_id=del_id::text;

  -- N1 행 삭제
  DELETE FROM jlpt_grammar WHERE id=del_id;
END $$;

-- 확인
SELECT jlpt_level, pattern, meaning_ko FROM jlpt_grammar
WHERE regexp_replace(pattern,'[〜～（）()]','','g') ILIKE '%以上%';
