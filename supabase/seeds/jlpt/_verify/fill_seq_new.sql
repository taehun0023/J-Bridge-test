-- seq NULL(오늘 추가한 N2 신규분)에 레벨별 맨 뒤 append 번호 부여. 기존 seq는 불변.
\set ON_ERROR_STOP on

-- VOCAB
WITH mx AS (SELECT jlpt_level lvl, COALESCE(max(seq),0) m FROM jlpt_vocabulary GROUP BY jlpt_level),
nr AS (SELECT id, jlpt_level, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at, id) rn FROM jlpt_vocabulary WHERE seq IS NULL)
UPDATE jlpt_vocabulary t SET seq = (SELECT m FROM mx WHERE mx.lvl=t.jlpt_level) + nr.rn FROM nr WHERE t.id = nr.id;

-- GRAMMAR
WITH mx AS (SELECT jlpt_level lvl, COALESCE(max(seq),0) m FROM jlpt_grammar GROUP BY jlpt_level),
nr AS (SELECT id, jlpt_level, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at, id) rn FROM jlpt_grammar WHERE seq IS NULL)
UPDATE jlpt_grammar t SET seq = (SELECT m FROM mx WHERE mx.lvl=t.jlpt_level) + nr.rn FROM nr WHERE t.id = nr.id;

-- READING
WITH mx AS (SELECT jlpt_level lvl, COALESCE(max(seq),0) m FROM jlpt_reading_passages GROUP BY jlpt_level),
nr AS (SELECT id, jlpt_level, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at, id) rn FROM jlpt_reading_passages WHERE seq IS NULL)
UPDATE jlpt_reading_passages t SET seq = (SELECT m FROM mx WHERE mx.lvl=t.jlpt_level) + nr.rn FROM nr WHERE t.id = nr.id;

-- LISTENING
WITH mx AS (SELECT jlpt_level lvl, COALESCE(max(seq),0) m FROM jlpt_listening_scripts GROUP BY jlpt_level),
nr AS (SELECT id, jlpt_level, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at, id) rn FROM jlpt_listening_scripts WHERE seq IS NULL)
UPDATE jlpt_listening_scripts t SET seq = (SELECT m FROM mx WHERE mx.lvl=t.jlpt_level) + nr.rn FROM nr WHERE t.id = nr.id;
