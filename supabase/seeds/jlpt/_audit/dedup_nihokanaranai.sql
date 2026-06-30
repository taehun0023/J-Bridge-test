-- 〜に他ならない(N2, 직전 vocab이동분) 제거 → N1 〜にほかならない로 통합 (2026-06-27)
-- 삭제행 체크는 N1 keeper로 재매핑(유저가 이미 keeper 체크 보유시 중복체크 삭제)

CREATE TEMP TABLE hm AS
SELECT
  (SELECT id FROM jlpt_grammar WHERE jlpt_level='N2' AND regexp_replace(pattern,'[〜～]','','g')='に他ならない') AS del_id,
  (SELECT id FROM jlpt_grammar WHERE jlpt_level='N1' AND regexp_replace(pattern,'[〜～]','','g')='にほかならない') AS keep_id;

DO $$ BEGIN
  IF (SELECT del_id FROM hm) IS NULL OR (SELECT keep_id FROM hm) IS NULL THEN
    RAISE EXCEPTION 'del_id/keep_id lookup failed: %', (SELECT row(del_id,keep_id) FROM hm);
  END IF;
END $$;

-- 유저가 keeper도 이미 체크한 경우 삭제행 중복체크 제거
DELETE FROM user_mastered_items umi USING hm
WHERE umi.item_type='jlpt_grammar' AND umi.item_id = hm.del_id::text
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.item_type='jlpt_grammar' AND u2.item_id = hm.keep_id::text
                AND u2.user_id = umi.user_id);

-- 남은 체크 재매핑
UPDATE user_mastered_items umi SET item_id = hm.keep_id::text
FROM hm WHERE umi.item_type='jlpt_grammar' AND umi.item_id = hm.del_id::text;

-- N2 행 삭제
DELETE FROM jlpt_grammar g USING hm WHERE g.id = hm.del_id;
