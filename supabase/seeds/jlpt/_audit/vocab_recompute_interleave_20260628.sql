-- 비율 균등 인터리빙 재계산 (2026-06-28)
-- sort_key = (그룹내 순위 - 0.5) / 그룹 크기  → 각 그룹을 [0,1]에 균등 분산(셀 중앙)
-- 결과: 블록마다 A:B:C 비율이 고르게(예 비율 1:3:1이면 블록당 A1 B3 C1)
-- 이전(순위-1)/크기 방식은 각 그룹 첫 항목이 0에 뭉쳐 초반 편향 → 개선

-- 1) sort_key 재계산
UPDATE jlpt_vocabulary v SET sort_key = sub.sk
FROM (
  SELECT id,
    (row_number() OVER (PARTITION BY jlpt_level, priority ORDER BY seq) - 0.5)::real
    / GREATEST(count(*) OVER (PARTITION BY jlpt_level, priority), 1) AS sk
  FROM jlpt_vocabulary
) sub
WHERE v.id = sub.id;

-- 2) display_seq 재계산 (sort_key 순서대로 레벨별 1,2,3…)
UPDATE jlpt_vocabulary v SET display_seq = sub.n
FROM (
  SELECT id, row_number() OVER (PARTITION BY jlpt_level ORDER BY sort_key, priority, seq) AS n
  FROM jlpt_vocabulary
) sub
WHERE v.id = sub.id;

-- 확인: N2 앞 15개 비율 균등 분배 확인
SELECT display_seq, priority, word FROM jlpt_vocabulary
WHERE jlpt_level='N2' ORDER BY display_seq LIMIT 15;
-- N2 priority 비율
SELECT priority, count(*), round(100.0*count(*)/sum(count(*)) OVER (),1) AS pct
FROM jlpt_vocabulary WHERE jlpt_level='N2' GROUP BY priority ORDER BY priority;
