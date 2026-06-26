-- 어휘를 권위레벨 한 곳으로 통합. 입력: final_levels.tsv (word<TAB>target_level).
-- 각 단어: keeper 1행만 target레벨로 두고, 나머지 행은 체크 remap 후 삭제. encoding: UTF-8
\set ON_ERROR_STOP on

CREATE TEMP TABLE lvl(word text, target text);
\copy lvl FROM 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_audit/level_resolution/final_levels.tsv' WITH (FORMAT csv, DELIMITER E'\t')

-- 유효성: target은 N1~N5만
DELETE FROM lvl WHERE target !~ '^N[1-5]$';

BEGIN;

-- keeper 결정: target레벨에 이미 있으면 그 행, 없으면 최소 id 행
CREATE TEMP TABLE keeper AS
SELECT l.word, l.target,
  COALESCE(
    (SELECT v.id FROM jlpt_vocabulary v WHERE v.word=l.word AND v.jlpt_level=l.target ORDER BY v.id LIMIT 1),
    (SELECT v.id FROM jlpt_vocabulary v WHERE v.word=l.word ORDER BY v.id LIMIT 1)
  ) AS keeper_id
FROM lvl l;
DELETE FROM keeper WHERE keeper_id IS NULL;  -- vocab에 없는 단어 skip

-- 1) keeper 레벨을 target으로
UPDATE jlpt_vocabulary v SET jlpt_level = k.target FROM keeper k WHERE v.id = k.keeper_id;

-- 2) non-keeper 행의 체크 중, 유저가 이미 keeper 체크를 가진 경우(충돌) 삭제
DELETE FROM user_mastered_items u
USING jlpt_vocabulary v, keeper k
WHERE u.item_type='jlpt_vocabulary' AND u.item_id = v.id::text
  AND v.word = k.word AND v.id <> k.keeper_id
  AND EXISTS (SELECT 1 FROM user_mastered_items u2
              WHERE u2.user_id=u.user_id AND u2.item_type='jlpt_vocabulary' AND u2.item_id = k.keeper_id::text);

-- 3) 나머지 non-keeper 체크를 keeper로 remap (마스터리 보존)
UPDATE user_mastered_items u SET item_id = k.keeper_id::text
FROM jlpt_vocabulary v, keeper k
WHERE u.item_type='jlpt_vocabulary' AND u.item_id = v.id::text
  AND v.word = k.word AND v.id <> k.keeper_id;

-- 4) non-keeper 행 삭제
DELETE FROM jlpt_vocabulary v USING keeper k WHERE v.word = k.word AND v.id <> k.keeper_id;

COMMIT;

\echo '== 적용 후: 같은 단어가 2레벨 이상 존재(0 기대) =='
SELECT word, count(DISTINCT jlpt_level) FROM jlpt_vocabulary GROUP BY word HAVING count(DISTINCT jlpt_level)>1 LIMIT 20;
\echo '== 레벨별 어휘 수 =='
SELECT jlpt_level, count(*) FROM jlpt_vocabulary GROUP BY 1 ORDER BY 1;
