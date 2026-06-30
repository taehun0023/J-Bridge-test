-- N2 어휘 20개 신규 추가 (2026-06-27) — 사용자 지정 레벨(N2)
-- (jisho 기준 N3~N4 수준이나 사용자 지시로 N2 배치)
WITH base AS (SELECT COALESCE(max(seq),0) AS m FROM jlpt_vocabulary WHERE jlpt_level='N2'),
src AS (
  SELECT * FROM (VALUES
    (1,'さらに','さらに','게다가, 더욱, 한층 더','접속부사'),
    (2,'不十分','ふじゅうぶん','불충분함','な형용사'),
    (3,'不可能','ふかのう','불가능함','な형용사'),
    (4,'不要','ふよう','불필요함','な형용사'),
    (5,'企業','きぎょう','기업','명사'),
    (6,'価格','かかく','가격','명사'),
    (7,'利用','りよう','이용','명사'),
    (8,'参加','さんか','참가','명사'),
    (9,'収入','しゅうにゅう','수입','명사'),
    (10,'報告','ほうこく','보고','명사'),
    (11,'場合','ばあい','경우','명사'),
    (12,'変更','へんこう','변경','명사'),
    (13,'提出','ていしゅつ','제출','명사'),
    (14,'支出','ししゅつ','지출','명사'),
    (15,'確実','かくじつ','확실함','な형용사'),
    (16,'解決','かいけつ','해결','명사'),
    (17,'計画','けいかく','계획','명사'),
    (18,'説明','せつめい','설명','명사'),
    (19,'費用','ひよう','비용','명사'),
    (20,'選択','せんたく','선택','명사')
  ) AS v(ord,word,reading,meaning_ko,pos)
  WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE jlpt_level='N2' AND word=v.word)
)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, seq)
SELECT s.word, s.reading, s.meaning_ko, s.pos, 'N2',
       b.m + row_number() OVER (ORDER BY s.ord)
FROM src s CROSS JOIN base b;

SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
