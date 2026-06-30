-- 어휘 테이블 속 문법(오분류) 정리 — 39개 제거.
-- 유지(오탐/카운터): 得る, あまり, ～代/倍/割/回/泊/点/畳/届け
-- 딸린 user_mastered_items 체크도 함께 삭제(고아 방지).
\set ON_ERROR_STOP on

\echo '== 제거 대상 (레벨별 목록) =='
SELECT v.jlpt_level AS lv, count(*) AS n, string_agg(v.word, ', ' ORDER BY v.word) AS words
FROM jlpt_vocabulary v
WHERE (v.word ~ '[〜～]'
   OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word))
  AND regexp_replace(v.word,'[〜～]','','g') NOT IN ('代','倍','割','回','泊','点','畳','届け','得る','あまり')
GROUP BY v.jlpt_level ORDER BY v.jlpt_level;

BEGIN;

DELETE FROM user_mastered_items
WHERE item_type='jlpt_vocabulary' AND item_id IN (
  SELECT v.id::text FROM jlpt_vocabulary v
  WHERE (v.word ~ '[〜～]'
     OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word))
    AND regexp_replace(v.word,'[〜～]','','g') NOT IN ('代','倍','割','回','泊','点','畳','届け','得る','あまり'));

DELETE FROM jlpt_vocabulary v
WHERE (v.word ~ '[〜～]'
   OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word))
  AND regexp_replace(v.word,'[〜～]','','g') NOT IN ('代','倍','割','回','泊','点','畳','届け','得る','あまり');

COMMIT;

\echo '== 정리 후: 잔여 오분류(0이어야, 단 유지대상 카운터 제외) =='
SELECT v.jlpt_level, count(*)
FROM jlpt_vocabulary v
WHERE (v.word ~ '[〜～]'
   OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word))
  AND regexp_replace(v.word,'[〜～]','','g') NOT IN ('代','倍','割','回','泊','点','畳','届け','得る','あまり')
GROUP BY v.jlpt_level;
