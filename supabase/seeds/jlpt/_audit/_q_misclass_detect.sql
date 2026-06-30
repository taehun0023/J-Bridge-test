-- 오분류 탐지: 어휘 테이블에 들어간 문법(grammar-in-vocab)
\echo '== 레벨별 오분류(어휘속 문법) 카운트 =='
SELECT v.jlpt_level, count(*)
FROM jlpt_vocabulary v
WHERE v.word ~ '[〜～]'
   OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word)
GROUP BY v.jlpt_level ORDER BY v.jlpt_level;

\echo '== 전체 목록 (레벨/단어/품사/사유) =='
SELECT v.jlpt_level AS lv, v.word, v.part_of_speech AS pos,
  CASE WHEN v.word ~ '[〜～]' THEN 'tilde'
       ELSE 'matches_grammar' END AS reason
FROM jlpt_vocabulary v
WHERE v.word ~ '[〜～]'
   OR EXISTS (SELECT 1 FROM jlpt_grammar g WHERE regexp_replace(g.pattern,'[〜～]','','g') = v.word)
ORDER BY v.jlpt_level, reason, v.word;

\echo '== 반대: 문법 테이블에 단일어처럼 들어간 것 (틸드 없고 3자 이하) =='
SELECT jlpt_level, pattern FROM jlpt_grammar
WHERE pattern !~ '[〜～]' AND char_length(pattern) <= 3
ORDER BY jlpt_level, pattern;
