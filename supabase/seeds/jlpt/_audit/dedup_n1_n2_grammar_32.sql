-- N1/N2 교차레벨 중복 문법 32개 정리 (2026-06-27)
-- 규칙: 지정 유지레벨만 남기고 반대 레벨 행 삭제. 삭제행의 user_mastered_items 체크는 유지행으로 재매핑(보존),
--       유저가 양쪽 다 체크한 경우는 중복체크 삭제(유니크 충돌 방지). seq 재번호 없음(본방순서 보존).

CREATE TEMP TABLE gmap AS
WITH spec(np, keep) AS (VALUES
 ('かたわら','N1'),('が早いか','N1'),('すら','N1'),('ずにはおかない','N1'),('であれであれ','N1'),
 ('とあっては','N1'),('ところを','N1'),('ともなると','N1'),('ないまでも','N1'),('にほかならない','N1'),
 ('に至るまで','N1'),('のみか','N1'),('べく','N1'),('まい','N1'),('もさることながら','N1'),
 ('ものがある','N1'),('ものを','N1'),('ようものなら','N1'),
 ('かねない','N2'),('ことなしに','N2'),('ずにはいられない','N2'),('たところで','N2'),('てこそ','N2'),
 ('てまで','N2'),('としても','N2'),('とはいえ','N2'),('とみられる','N2'),('ながらも','N2'),
 ('にしては','N2'),('のみならず','N2'),('ようがない','N2'),('を限りに','N2')
),
g AS (SELECT id, jlpt_level, regexp_replace(pattern,'[〜～]','','g') AS np
      FROM jlpt_grammar WHERE jlpt_level IN ('N1','N2'))
SELECT d.id AS del_id, k.id AS keep_id, spec.np, spec.keep
FROM spec
JOIN g d ON d.np = spec.np AND d.jlpt_level <> spec.keep
JOIN g k ON k.np = spec.np AND k.jlpt_level =  spec.keep;

-- 가드: 정확히 32쌍이어야 진행
DO $$ BEGIN
  IF (SELECT count(*) FROM gmap) <> 32 THEN
    RAISE EXCEPTION 'gmap row count = %, expected 32', (SELECT count(*) FROM gmap);
  END IF;
END $$;

-- 1) 유저가 유지행도 이미 체크한 경우, 삭제행 쪽 중복체크 제거(유니크 충돌 방지)
DELETE FROM user_mastered_items umi USING gmap m
WHERE umi.item_type='jlpt_grammar' AND umi.item_id = m.del_id::text
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.item_type='jlpt_grammar' AND u2.item_id = m.keep_id::text
                AND u2.user_id = umi.user_id);

-- 2) 남은 삭제행 체크를 유지행으로 재매핑(보존)
UPDATE user_mastered_items umi SET item_id = m.keep_id::text
FROM gmap m
WHERE umi.item_type='jlpt_grammar' AND umi.item_id = m.del_id::text;

-- 3) 비유지 레벨 문법행 삭제
DELETE FROM jlpt_grammar g USING gmap m WHERE g.id = m.del_id;
