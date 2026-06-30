-- 의성어·의태어 4개 추가 (2026-06-27), priority C
-- あっさり/おどおど → N1, のろのろ/はらはら → N2

-- N1 2개
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_vocabulary WHERE jlpt_level='N1'),
src AS (
  SELECT * FROM (VALUES
    (1,'あっさり','あっさり','산뜻하게, 깔끔하게, 시원스럽게','부사'),
    (2,'おどおど','おどおど','주뼛주뼛, 안절부절못하는 모양','부사')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word=v.word)
)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, seq, priority)
SELECT s.word, s.reading, s.meaning_ko, s.pos, 'N1', b.m + row_number() OVER (ORDER BY s.ord), 'C'
FROM src s CROSS JOIN base b;

-- N2 2개
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_vocabulary WHERE jlpt_level='N2'),
src AS (
  SELECT * FROM (VALUES
    (1,'のろのろ','のろのろ','느릿느릿, 굼뜬 모양','부사'),
    (2,'はらはら','はらはら','조마조마, 마음 졸이는 모양','부사')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word=v.word)
)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, seq, priority)
SELECT s.word, s.reading, s.meaning_ko, s.pos, 'N2', b.m + row_number() OVER (ORDER BY s.ord), 'C'
FROM src s CROSS JOIN base b;

SELECT word, jlpt_level, seq, priority FROM jlpt_vocabulary
WHERE word IN ('あっさり','おどおど','のろのろ','はらはら') ORDER BY jlpt_level, seq;
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
