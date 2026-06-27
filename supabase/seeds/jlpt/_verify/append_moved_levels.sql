-- apply_prod_seq.sql 실행 후 보정용: 레벨이 바뀐 본방단어(prod레벨 != 현재레벨)는
-- 옛 레벨의 pseq를 들고 와 새 레벨 native와 seq 충돌 → 규칙대로 "새 레벨 맨 뒤"로 append.
-- (콘텐츠 학습순서 규칙: 본방순서 보존 + 새/이동분은 레벨 끝에 추가. CLAUDE.md Pitfall #6)
\set ON_ERROR_STOP on
CREATE TEMP TABLE po_v(id uuid, lvl text, pseq int);
\copy po_v from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_vocabulary.csv' csv
BEGIN;
CREATE TEMP TABLE movedin AS
SELECT v.id, v.jlpt_level AS lvl,
  row_number() OVER (PARTITION BY v.jlpt_level ORDER BY p.pseq, v.id) rn
FROM jlpt_vocabulary v JOIN po_v p ON p.id=v.id
WHERE p.lvl <> v.jlpt_level;
WITH mx AS (
  SELECT jlpt_level lvl, max(seq) m FROM jlpt_vocabulary v
  WHERE NOT EXISTS (SELECT 1 FROM movedin mi WHERE mi.id=v.id)
  GROUP BY jlpt_level)
UPDATE jlpt_vocabulary t SET seq = COALESCE((SELECT m FROM mx WHERE mx.lvl=movedin.lvl),0) + movedin.rn
FROM movedin WHERE t.id = movedin.id;
COMMIT;
\echo '== 레벨내 중복 seq(0기대) =='
SELECT count(*) FROM (SELECT jlpt_level, seq FROM jlpt_vocabulary GROUP BY 1,2 HAVING count(*)>1) t;
