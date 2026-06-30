-- Sets 1/2/3 問題9(中文) + 問題11(統合理解): 問N： 접두사 추가
-- Set 4는 이미 問N：가 있으므로 제외
-- 문제 라인 = question_text의 마지막 \n\n 이후 부분

DO $$
DECLARE
  rec RECORD;
  sep TEXT := chr(10)||chr(10);
  pos_rev INT;
  before_q TEXT;
  q_line TEXT;
  new_prefix TEXT;
BEGIN
  FOR rec IN (
    SELECT
      qq.id,
      qq.question_text,
      msq.daimon,
      ROW_NUMBER() OVER (
        PARTITION BY ms.set_no, msq.daimon
        ORDER BY msq.sort_order
      ) AS rn
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level = 'N1'
      AND ms.set_no IN (1, 2, 3)
      AND msq.section = 'dokkai'
      AND msq.daimon IN (9, 11)
  )
  LOOP
    -- 이미 問N：가 있으면 skip
    IF rec.question_text ~ E'問[0-9]+：' THEN
      CONTINUE;
    END IF;

    -- sub_number 계산
    IF rec.daimon = 9 THEN
      new_prefix := '問' || (((rec.rn - 1) % 3) + 1)::text || '：';
    ELSIF rec.daimon = 11 THEN
      new_prefix := '問' || (((rec.rn - 1) % 2) + 1)::text || '：';
    ELSE
      CONTINUE;
    END IF;

    -- 마지막 \n\n 위치 찾기 (reverse 이용)
    pos_rev := position(sep IN reverse(rec.question_text));

    IF pos_rev > 0 THEN
      before_q := left(rec.question_text, length(rec.question_text) - pos_rev - 1);
      q_line   := right(rec.question_text, pos_rev - 1);
      UPDATE quiz_questions
        SET question_text = before_q || sep || new_prefix || q_line
        WHERE id = rec.id;
    ELSE
      -- \n\n 없으면 맨 앞에 추가
      UPDATE quiz_questions
        SET question_text = new_prefix || rec.question_text
        WHERE id = rec.id;
    END IF;
  END LOOP;
END$$;

-- 확인
SELECT ms.set_no, msq.daimon, msq.sort_order,
  RIGHT(qq.question_text, 80) AS question_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3)
  AND msq.section = 'dokkai' AND msq.daimon IN (9, 11)
ORDER BY ms.set_no, msq.daimon, msq.sort_order;
