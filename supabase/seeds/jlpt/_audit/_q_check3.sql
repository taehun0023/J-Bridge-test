\echo '== N1/N2 오분류(어휘속 문법) 목록 + 매칭패턴 =='
SELECT v.jlpt_level, v.word, v.part_of_speech AS pos,
  (SELECT g.pattern FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g')=v.word LIMIT 1) AS matched
FROM jlpt_vocabulary v
WHERE v.jlpt_level IN ('N1','N2')
  AND (v.word ~ '[〜～]' OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g')=v.word))
ORDER BY v.jlpt_level, v.word;

\echo '== N2 어휘 내부 중복(같은 word 2회+) =='
SELECT word, count(*) FROM jlpt_vocabulary WHERE jlpt_level='N2' GROUP BY word HAVING count(*)>1;

\echo '== N2 문법 중복 =='
SELECT pattern, count(*) FROM jlpt_grammar WHERE jlpt_level='N2' GROUP BY pattern HAVING count(*)>1;
