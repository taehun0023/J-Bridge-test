\echo '== N2 오분류(어휘속 문법) 정체 =='
SELECT v.word, v.reading, v.part_of_speech,
  (SELECT g.pattern FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g')=v.word LIMIT 1) AS matched_grammar
FROM jlpt_vocabulary v
WHERE v.jlpt_level='N2'
  AND (v.word ~ '[〜～]' OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g')=v.word));

\echo '== 품사 확인 =='
SELECT word, reading, part_of_speech FROM jlpt_vocabulary
WHERE word IN ('潔い','やむを得ず','顕著','膨大','心強い','画期的') AND jlpt_level='N2' ORDER BY word;
