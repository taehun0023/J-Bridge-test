-- 減少 N2 신규 추가 / 職場 N1→N2 이동 (2026-06-27)

-- 1) 職場: N1 → N2 이동 (해당 레벨 맨 뒤, 체크는 id 유지라 재매핑 불필요)
UPDATE jlpt_vocabulary
SET jlpt_level='N2', seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_vocabulary WHERE jlpt_level='N2')
WHERE word='職場' AND jlpt_level='N1';

-- 2) 減少: N2 신규 추가 (없을 때만, 맨 뒤 append)
INSERT INTO jlpt_vocabulary (word, reading, meaning_ko, part_of_speech, jlpt_level, seq)
SELECT '減少','げんしょう','감소','명사','N2',
       (SELECT COALESCE(max(seq),0)+1 FROM jlpt_vocabulary WHERE jlpt_level='N2')
WHERE NOT EXISTS (SELECT 1 FROM jlpt_vocabulary WHERE word='減少' AND jlpt_level='N2');

-- 확인
SELECT word, jlpt_level, seq FROM jlpt_vocabulary
WHERE word IN ('減少','職場') AND jlpt_level IN ('N1','N2') ORDER BY word, jlpt_level;
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
