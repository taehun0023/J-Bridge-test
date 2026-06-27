\set ON_ERROR_STOP on
CREATE TEMP TABLE lvl(word text, target text);
\copy lvl FROM 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_audit/level_resolution/final_levels_172.tsv' WITH (FORMAT csv, DELIMITER E'\t')
DELETE FROM lvl WHERE target !~ '^N[1-5]$';
BEGIN;
CREATE TEMP TABLE keeper AS
SELECT l.word, l.target,
  COALESCE(
    (SELECT v.id FROM jlpt_vocabulary v WHERE v.word=l.word AND v.jlpt_level=l.target ORDER BY v.id LIMIT 1),
    (SELECT v.id FROM jlpt_vocabulary v WHERE v.word=l.word ORDER BY v.id LIMIT 1)
  ) AS keeper_id
FROM lvl l;
DELETE FROM keeper WHERE keeper_id IS NULL;
UPDATE jlpt_vocabulary v SET jlpt_level = k.target FROM keeper k WHERE v.id = k.keeper_id;
DELETE FROM user_mastered_items u USING jlpt_vocabulary v, keeper k
 WHERE u.item_type='jlpt_vocabulary' AND u.item_id = v.id::text AND v.word = k.word AND v.id <> k.keeper_id
   AND EXISTS (SELECT 1 FROM user_mastered_items u2 WHERE u2.user_id=u.user_id AND u2.item_type='jlpt_vocabulary' AND u2.item_id = k.keeper_id::text);
DELETE FROM user_mastered_items u USING jlpt_vocabulary v, keeper k
 WHERE u.item_type='jlpt_vocabulary' AND u.item_id = v.id::text AND v.word = k.word AND v.id <> k.keeper_id
   AND EXISTS (SELECT 1 FROM user_mastered_items u2, jlpt_vocabulary v2
               WHERE u2.user_id=u.user_id AND u2.item_type='jlpt_vocabulary' AND u2.item_id=v2.id::text
                 AND v2.word=k.word AND v2.id<>k.keeper_id AND v2.id < v.id);
UPDATE user_mastered_items u SET item_id = k.keeper_id::text FROM jlpt_vocabulary v, keeper k
 WHERE u.item_type='jlpt_vocabulary' AND u.item_id = v.id::text AND v.word = k.word AND v.id <> k.keeper_id;
DELETE FROM jlpt_vocabulary v USING keeper k WHERE v.word = k.word AND v.id <> k.keeper_id;
COMMIT;
\echo '== 적용후 2레벨이상 잔존 단어수(0기대) =='
SELECT count(*) FROM (SELECT word FROM jlpt_vocabulary GROUP BY word HAVING count(DISTINCT jlpt_level)>1) t;
\echo '== 레벨별 어휘수 =='
SELECT jlpt_level, count(*) FROM jlpt_vocabulary GROUP BY 1 ORDER BY 1;
