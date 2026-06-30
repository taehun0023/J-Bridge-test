-- jisho N1 태그 직접 확인된 6개 N2→N1 이동 (2026-06-27)
-- seq는 N1 맨 뒤 append, user 체크는 id 유지라 재매핑 불필요
-- 순차 실행으로 각 단어가 N1 max+1 연속 부여

DO $$
DECLARE w TEXT;
BEGIN
  FOREACH w IN ARRAY ARRAY['要因','背景','人権','格差','文化財','避難'] LOOP
    UPDATE jlpt_vocabulary
    SET jlpt_level='N1',
        seq=(SELECT COALESCE(max(seq),0)+1 FROM jlpt_vocabulary WHERE jlpt_level='N1')
    WHERE word=w AND jlpt_level='N2';
  END LOOP;
END $$;

-- 확인
SELECT word, jlpt_level, seq FROM jlpt_vocabulary
WHERE word IN ('要因','背景','人権','格差','文化財','避難') ORDER BY seq;
SELECT jlpt_level, count(*) FROM jlpt_vocabulary WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
-- 교차중복 0 확인
SELECT count(*) AS 잔여중복
FROM jlpt_vocabulary n1 JOIN jlpt_vocabulary n2 ON n2.word=n1.word AND n2.jlpt_level='N2'
WHERE n1.jlpt_level='N1';
