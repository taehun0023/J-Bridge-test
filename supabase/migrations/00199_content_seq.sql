-- 콘텐츠 고정 순번(seq): 레벨별로 created_at 빠른 순(=본방 클론 원본 먼저) → 로컬 추가분 뒤.
-- 앞으로 과제 부여/표시는 이 seq 기준. 멘티 습득체크는 item_id로 보존되므로 seq 변경과 무관.
ALTER TABLE jlpt_vocabulary       ADD COLUMN IF NOT EXISTS seq integer;
ALTER TABLE jlpt_grammar          ADD COLUMN IF NOT EXISTS seq integer;
ALTER TABLE jlpt_kanji            ADD COLUMN IF NOT EXISTS seq integer;
ALTER TABLE jlpt_reading_passages ADD COLUMN IF NOT EXISTS seq integer;
ALTER TABLE jlpt_listening_scripts ADD COLUMN IF NOT EXISTS seq integer;

UPDATE jlpt_vocabulary t SET seq = s.rn
FROM (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at ASC, id ASC) rn FROM jlpt_vocabulary) s
WHERE t.id = s.id;

UPDATE jlpt_grammar t SET seq = s.rn
FROM (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at ASC, id ASC) rn FROM jlpt_grammar) s
WHERE t.id = s.id;

UPDATE jlpt_kanji t SET seq = s.rn
FROM (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at ASC, id ASC) rn FROM jlpt_kanji) s
WHERE t.id = s.id;

UPDATE jlpt_reading_passages t SET seq = s.rn
FROM (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at ASC, id ASC) rn FROM jlpt_reading_passages) s
WHERE t.id = s.id;

UPDATE jlpt_listening_scripts t SET seq = s.rn
FROM (SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY created_at ASC, id ASC) rn FROM jlpt_listening_scripts) s
WHERE t.id = s.id;
