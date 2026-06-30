-- seq를 레벨별 1..N 연속번호로 압축(빈틈 제거). 현재 순서(seq) 보존. encoding: UTF-8
\set ON_ERROR_STOP on

WITH r AS (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY seq, created_at, id) rn FROM jlpt_vocabulary)
UPDATE jlpt_vocabulary t SET seq = r.rn FROM r WHERE t.id = r.id;

WITH r AS (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY seq, created_at, id) rn FROM jlpt_grammar)
UPDATE jlpt_grammar t SET seq = r.rn FROM r WHERE t.id = r.id;

WITH r AS (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY seq, created_at, id) rn FROM jlpt_kanji)
UPDATE jlpt_kanji t SET seq = r.rn FROM r WHERE t.id = r.id;

WITH r AS (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY seq, created_at, id) rn FROM jlpt_reading_passages)
UPDATE jlpt_reading_passages t SET seq = r.rn FROM r WHERE t.id = r.id;

WITH r AS (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY seq, created_at, id) rn FROM jlpt_listening_scripts)
UPDATE jlpt_listening_scripts t SET seq = r.rn FROM r WHERE t.id = r.id;
