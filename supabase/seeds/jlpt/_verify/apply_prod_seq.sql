-- 본방 순서(pseq)를 로컬 seq로 박고, 본방에 없는 로컬 추가분은 레벨별 맨 뒤에 append.
\set ON_ERROR_STOP on

-- ===== VOCAB =====
CREATE TEMP TABLE po_v(id uuid, lvl text, pseq int);
\copy po_v from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_vocabulary.csv' csv
UPDATE jlpt_vocabulary t SET seq = p.pseq FROM po_v p WHERE t.id = p.id;
WITH maxp AS (SELECT lvl, max(pseq) mx FROM po_v GROUP BY lvl),
lr AS (SELECT v.id, row_number() OVER (PARTITION BY v.jlpt_level ORDER BY v.created_at ASC, v.id ASC) rn
       FROM jlpt_vocabulary v WHERE NOT EXISTS (SELECT 1 FROM po_v p WHERE p.id=v.id))
UPDATE jlpt_vocabulary t SET seq = COALESCE((SELECT mx FROM maxp WHERE maxp.lvl=t.jlpt_level),0) + lr.rn
FROM lr WHERE t.id = lr.id;

-- ===== GRAMMAR =====
CREATE TEMP TABLE po_g(id uuid, lvl text, pseq int);
\copy po_g from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_grammar.csv' csv
UPDATE jlpt_grammar t SET seq = p.pseq FROM po_g p WHERE t.id = p.id;
WITH maxp AS (SELECT lvl, max(pseq) mx FROM po_g GROUP BY lvl),
lr AS (SELECT v.id, row_number() OVER (PARTITION BY v.jlpt_level ORDER BY v.created_at ASC, v.id ASC) rn
       FROM jlpt_grammar v WHERE NOT EXISTS (SELECT 1 FROM po_g p WHERE p.id=v.id))
UPDATE jlpt_grammar t SET seq = COALESCE((SELECT mx FROM maxp WHERE maxp.lvl=t.jlpt_level),0) + lr.rn
FROM lr WHERE t.id = lr.id;

-- ===== KANJI =====
CREATE TEMP TABLE po_k(id uuid, lvl text, pseq int);
\copy po_k from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_kanji.csv' csv
UPDATE jlpt_kanji t SET seq = p.pseq FROM po_k p WHERE t.id = p.id;
WITH maxp AS (SELECT lvl, max(pseq) mx FROM po_k GROUP BY lvl),
lr AS (SELECT v.id, row_number() OVER (PARTITION BY v.jlpt_level ORDER BY v.created_at ASC, v.id ASC) rn
       FROM jlpt_kanji v WHERE NOT EXISTS (SELECT 1 FROM po_k p WHERE p.id=v.id))
UPDATE jlpt_kanji t SET seq = COALESCE((SELECT mx FROM maxp WHERE maxp.lvl=t.jlpt_level),0) + lr.rn
FROM lr WHERE t.id = lr.id;

-- ===== READING =====
CREATE TEMP TABLE po_r(id uuid, lvl text, pseq int);
\copy po_r from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_reading_passages.csv' csv
UPDATE jlpt_reading_passages t SET seq = p.pseq FROM po_r p WHERE t.id = p.id;
WITH maxp AS (SELECT lvl, max(pseq) mx FROM po_r GROUP BY lvl),
lr AS (SELECT v.id, row_number() OVER (PARTITION BY v.jlpt_level ORDER BY v.created_at ASC, v.id ASC) rn
       FROM jlpt_reading_passages v WHERE NOT EXISTS (SELECT 1 FROM po_r p WHERE p.id=v.id))
UPDATE jlpt_reading_passages t SET seq = COALESCE((SELECT mx FROM maxp WHERE maxp.lvl=t.jlpt_level),0) + lr.rn
FROM lr WHERE t.id = lr.id;

-- ===== LISTENING =====
CREATE TEMP TABLE po_l(id uuid, lvl text, pseq int);
\copy po_l from 'C:/workspace/J-Bridge-test/supabase/seeds/jlpt/_verify/prodorder/jlpt_listening_scripts.csv' csv
UPDATE jlpt_listening_scripts t SET seq = p.pseq FROM po_l p WHERE t.id = p.id;
WITH maxp AS (SELECT lvl, max(pseq) mx FROM po_l GROUP BY lvl),
lr AS (SELECT v.id, row_number() OVER (PARTITION BY v.jlpt_level ORDER BY v.created_at ASC, v.id ASC) rn
       FROM jlpt_listening_scripts v WHERE NOT EXISTS (SELECT 1 FROM po_l p WHERE p.id=v.id))
UPDATE jlpt_listening_scripts t SET seq = COALESCE((SELECT mx FROM maxp WHERE maxp.lvl=t.jlpt_level),0) + lr.rn
FROM lr WHERE t.id = lr.id;
