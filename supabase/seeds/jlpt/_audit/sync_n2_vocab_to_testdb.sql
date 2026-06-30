-- N2 어휘 테스트 DB 동기화 (2026-06-27)
-- 로컬에서 1508개까지 쌓은 N2 어휘를 테스트 DB(295개)에 누락분 추가
-- Export 파일 기준(1515개, 문법이동 7개 제외), 이미 있는 항목은 스킵

CREATE TEMP TABLE n2v_import (
  word         text,
  reading      text,
  meaning_ko   text,
  part_of_speech text
);

\copy n2v_import FROM 'C:/workspace/J-Bridge-test/_export/N2_01_vocab.tsv' WITH (FORMAT csv, DELIMITER E'\t', QUOTE E'\x01', ENCODING 'UTF8')

-- 문법으로 이동된 7개 + 이미 존재하는 항목 제외하고 seq 채번 후 INSERT
WITH base AS (
  SELECT COALESCE(max(seq), 0) AS m FROM jlpt_vocabulary WHERE jlpt_level = 'N2'
),
new_rows AS (
  SELECT
    i.word, i.reading, i.meaning_ko, i.part_of_speech,
    row_number() OVER () AS rn
  FROM n2v_import i
  WHERE NOT EXISTS (
    SELECT 1 FROM jlpt_vocabulary v WHERE v.jlpt_level = 'N2' AND v.word = i.word
  )
    AND i.word NOT IN ('とは限らない','において','に他ならない','に伴って','に沿って','に過ぎない','に関して')
)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, jlpt_level, part_of_speech, seq)
SELECT r.word, r.reading, r.meaning_ko, 'N2', r.part_of_speech, b.m + r.rn
FROM new_rows r CROSS JOIN base b;

-- 결과 확인
SELECT count(*) AS n2_vocab_total FROM jlpt_vocabulary WHERE jlpt_level = 'N2';
