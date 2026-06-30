-- 우선순위 비율 인터리빙용 sort_key (2026-06-27)
-- 각 단어 = (그룹내 seq 순위) / (그룹 크기)  → 0~1 정규화
-- A는 많아 촘촘, C는 적어 드문드문 → ORDER BY sort_key 시 ABCABC 비율 배분
-- DB seq는 불변, 정렬 보조 컬럼만 추가

ALTER TABLE jlpt_vocabulary ADD COLUMN IF NOT EXISTS sort_key REAL;

UPDATE jlpt_vocabulary v SET sort_key = sub.sk
FROM (
  SELECT id,
    (row_number() OVER (PARTITION BY jlpt_level, priority ORDER BY seq) - 1)::real
    / GREATEST(count(*) OVER (PARTITION BY jlpt_level, priority), 1) AS sk
  FROM jlpt_vocabulary
) sub
WHERE v.id = sub.id;

-- 확인: N2 앞 20개가 ABCABC 비율로 섞이는지
SELECT priority, sort_key, word FROM jlpt_vocabulary
WHERE jlpt_level='N2'
ORDER BY sort_key, priority, seq
LIMIT 20;
