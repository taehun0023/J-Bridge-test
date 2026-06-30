-- N1 어휘 7개 신규 추가 (2026-06-27) — 논설·법률·비즈니스 시사어
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_vocabulary WHERE jlpt_level='N1'),
src AS (
  SELECT * FROM (VALUES
    (1,'利害','りがい','이해(관계), 손익','명사'),
    (2,'効率化','こうりつか','효율화','명사'),
    (3,'改ざん','かいざん','변조, 조작, 위조','명사'),
    (4,'判例','はんれい','판례','명사'),
    (5,'持続可能','じぞくかのう','지속 가능(함)','な형용사'),
    (6,'後継者','こうけいしゃ','후계자','명사'),
    (7,'知的財産','ちてきざいさん','지적 재산','명사')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N1' AND word=v.word)
)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, seq)
SELECT s.word, s.reading, s.meaning_ko, s.pos, 'N1',
       b.m + row_number() OVER (ORDER BY s.ord)
FROM src s CROSS JOIN base b;

-- 확인
SELECT word, jlpt_level, seq FROM jlpt_vocabulary
WHERE word IN ('利害','効率化','改ざん','判例','持続可能','後継者','知的財産') ORDER BY seq;
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
