-- 통일 순번 display_seq (2026-06-28)
-- sort_key(우선순위 비율 인터리빙) 순서대로 레벨별 1,2,3… 정수 연속번호 부여
-- 화면 출력·화면 번호·과제 범위·범위 퀴즈·대시보드 점프 전부 이 컬럼 기준으로 통일
-- DB seq(본방 순서)는 불변 — display_seq는 별도 표시/과제 순번

ALTER TABLE jlpt_vocabulary ADD COLUMN IF NOT EXISTS display_seq INTEGER;

UPDATE jlpt_vocabulary v SET display_seq = sub.n
FROM (
  SELECT id,
    row_number() OVER (PARTITION BY jlpt_level ORDER BY sort_key, priority, seq) AS n
  FROM jlpt_vocabulary
) sub
WHERE v.id = sub.id;

-- 인덱스 (정렬·범위 조회 성능)
CREATE INDEX IF NOT EXISTS idx_jlpt_vocab_level_display_seq
  ON jlpt_vocabulary (jlpt_level, display_seq);

-- 확인: N2 앞 12개가 1,2,3… 연속 + ABCABC 비율
SELECT display_seq, priority, word FROM jlpt_vocabulary
WHERE jlpt_level='N2' ORDER BY display_seq LIMIT 12;
-- 레벨별 범위 확인
SELECT jlpt_level, min(display_seq), max(display_seq), count(*) FROM jlpt_vocabulary
WHERE jlpt_level IN ('N1','N2') GROUP BY jlpt_level;
