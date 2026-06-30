-- N1/N2 문법 교차 중복 11개 정리 (2026-06-27) — N2 유지, N1 삭제
-- 체크 재매핑 포함

CREATE TEMP TABLE gmap AS
SELECT vd.id AS del_id, vk.id AS keep_id
FROM jlpt_grammar vd
JOIN jlpt_grammar vk ON vk.pattern=vd.pattern AND vk.jlpt_level='N2'
WHERE vd.jlpt_level='N1' AND vd.pattern = ANY(ARRAY[
  '〜ことなしに','〜だけあって','〜てはじめて','〜にあたって','〜にかかわらず',
  '〜につれて','〜に先立ち','〜ばかりか','〜はともかく','〜ものか','〜ものがある'
]);

DO $$ BEGIN
  IF (SELECT count(*) FROM gmap) <> 11 THEN
    RAISE EXCEPTION 'gmap 쌍 수 = %, 기대값 11', (SELECT count(*) FROM gmap);
  END IF;
END $$;

-- 양쪽 체크한 유저 중복 제거
DELETE FROM user_mastered_items umi USING gmap m
WHERE umi.item_type='jlpt_grammar' AND umi.item_id=m.del_id::text
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.item_type='jlpt_grammar' AND u2.item_id=m.keep_id::text
                AND u2.user_id=umi.user_id);
-- 재매핑
UPDATE user_mastered_items SET item_id=m.keep_id::text
FROM gmap m
WHERE item_type='jlpt_grammar' AND item_id=m.del_id::text;
-- N1 행 삭제
DELETE FROM jlpt_grammar v USING gmap m WHERE v.id=m.del_id;

-- 결과
SELECT jlpt_level, count(*) FROM jlpt_grammar WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
-- 잔여 교차중복(정규화) 0 확인
SELECT count(*) AS 잔여중복
FROM (SELECT regexp_replace(pattern,'[〜～（）()　 ]','','g') k FROM jlpt_grammar WHERE jlpt_level='N1') a
JOIN (SELECT regexp_replace(pattern,'[〜～（）()　 ]','','g') k FROM jlpt_grammar WHERE jlpt_level='N2') b USING (k);
-- 고아 체크 0 확인
SELECT count(*) AS 고아체크 FROM user_mastered_items umi
WHERE umi.item_type='jlpt_grammar'
  AND NOT EXISTS (SELECT 1 FROM jlpt_grammar v WHERE v.id::text=umi.item_id);
