-- Sets 2/3 問題10(長文4문) + 問題12(主張理解4문): 問N： 접두사 추가
-- Set 1/4는 이미 있음, Set 2/3만 대상
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
      AND ms.set_no IN (2, 3)
      AND msq.section = 'dokkai'
      AND msq.daimon IN (10, 12)
  )
  LOOP
    IF rec.question_text ~ E'問[0-9]+：' THEN
      CONTINUE;
    END IF;

    -- 問題10/12 모두 4문제 1세트 → 問1〜問4
    new_prefix := '問' || (((rec.rn - 1) % 4) + 1)::text || '：';

    pos_rev := position(sep IN reverse(rec.question_text));

    IF pos_rev > 0 THEN
      before_q := left(rec.question_text, length(rec.question_text) - pos_rev - 1);
      q_line   := right(rec.question_text, pos_rev - 1);
      UPDATE quiz_questions
        SET question_text = before_q || sep || new_prefix || q_line
        WHERE id = rec.id;
    ELSE
      UPDATE quiz_questions
        SET question_text = new_prefix || rec.question_text
        WHERE id = rec.id;
    END IF;
  END LOOP;
END$$;

-- 확인
SELECT ms.set_no, msq.daimon, msq.sort_order, RIGHT(qq.question_text, 50) AS tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND ms.set_no IN (2,3)
  AND msq.section='dokkai' AND msq.daimon IN (10,12)
ORDER BY ms.set_no, msq.daimon, msq.sort_order;
