-- N1/N2 어휘 교차 중복 26개 정리 (2026-06-27)
-- N2 유지(N1 삭제) 24개 + N1 유지(N2 삭제) 2개(体制·論点)
-- 삭제행 user_mastered_items 체크는 유지행으로 재매핑

CREATE TEMP TABLE vmap AS
-- N2 유지: N1 행 삭제 → N2 행 유지
SELECT vd.id AS del_id, vk.id AS keep_id
FROM jlpt_vocabulary vd
JOIN jlpt_vocabulary vk ON vk.word=vd.word AND vk.jlpt_level='N2'
WHERE vd.jlpt_level='N1' AND vd.word = ANY(ARRAY[
  'すなわち','仕組み','兼ねる','報酬','好ましい','妨げる','対応する','強引','慌ただしい',
  '摩擦','普及','曖昧','望ましい','潔い','潤う','目覚ましい','空しい','築く','絶えず',
  '要因','費やす','資源','趣旨','過程'
])
UNION ALL
-- N1 유지: N2 행 삭제 → N1 행 유지
SELECT vd.id AS del_id, vk.id AS keep_id
FROM jlpt_vocabulary vd
JOIN jlpt_vocabulary vk ON vk.word=vd.word AND vk.jlpt_level='N1'
WHERE vd.jlpt_level='N2' AND vd.word = ANY(ARRAY['体制','論点']);

-- 가드: 정확히 26쌍
DO $$ BEGIN
  IF (SELECT count(*) FROM vmap) <> 26 THEN
    RAISE EXCEPTION 'vmap 쌍 수 = %, 기대값 26', (SELECT count(*) FROM vmap);
  END IF;
END $$;

-- 1) 양쪽 다 체크한 유저: 삭제행 중복체크 제거
DELETE FROM user_mastered_items umi USING vmap m
WHERE umi.item_type='jlpt_vocabulary' AND umi.item_id=m.del_id::text
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.item_type='jlpt_vocabulary' AND u2.item_id=m.keep_id::text
                AND u2.user_id=umi.user_id);

-- 2) 나머지 체크 유지행으로 재매핑
UPDATE user_mastered_items SET item_id=m.keep_id::text
FROM vmap m
WHERE item_type='jlpt_vocabulary' AND item_id=m.del_id::text;

-- 3) 삭제행 제거
DELETE FROM jlpt_vocabulary v USING vmap m WHERE v.id=m.del_id;

-- 결과
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;

-- 잔여 교차중복 (0이어야 함)
SELECT count(*) AS 잔여중복
FROM jlpt_vocabulary n1
JOIN jlpt_vocabulary n2 ON n2.word=n1.word AND n2.jlpt_level='N2'
WHERE n1.jlpt_level='N1';

-- 고아 체크 (0이어야 함)
SELECT count(*) AS 고아체크
FROM user_mastered_items umi
WHERE umi.item_type='jlpt_vocabulary'
  AND NOT EXISTS (SELECT 1 FROM jlpt_vocabulary v WHERE v.id::text=umi.item_id);
