\echo '=== VOCAB with part_of_speech = 표현 (문법 의심 후보) ==='
SELECT seq, word, part_of_speech, meaning_ko
FROM jlpt_vocabulary WHERE jlpt_level='N1' AND part_of_speech='표현'
ORDER BY seq;

\echo ''
\echo '=== VOCAB word that ALSO exists as a grammar pattern (교차중복) ==='
SELECT v.seq, v.word, v.part_of_speech
FROM jlpt_vocabulary v
WHERE v.jlpt_level='N1'
  AND EXISTS (SELECT 1 FROM jlpt_grammar g WHERE replace(replace(g.pattern,'〜',''),'～','') = v.word)
ORDER BY v.seq;

\echo ''
\echo '=== GRAMMAR patterns that look like a single vocab word (no 助詞/접속, 어휘 의심) ==='
SELECT seq, pattern, category, meaning_ko
FROM jlpt_grammar WHERE jlpt_level='N1'
  AND pattern NOT LIKE '%〜%' AND pattern NOT LIKE '%～%' AND pattern NOT LIKE '%を%' AND pattern NOT LIKE '%に%'
  AND pattern NOT LIKE '%と%' AND pattern NOT LIKE '%が%' AND pattern NOT LIKE '%は%' AND pattern NOT LIKE '%ば%'
  AND pattern NOT LIKE '%て%' AND pattern NOT LIKE '%の%'
ORDER BY seq;
