-- 問題4 用法 question_text 통일: 지시문 제거하고 단어만 저장
-- Sets 1-4: 「X」の使い方として〜 → X 추출
-- Set 5:   次の言葉の使い方として...\n\n単語 → 단어 추출

DO $$
DECLARE
  qid UUID;
  old_text TEXT;
  new_text TEXT;
BEGIN
  -- Sets 1-4: 「X」 패턴에서 X 추출
  FOR qid, old_text IN
    SELECT msq.question_id, qq.question_text
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3,4)
      AND msq.section = 'gengo_chishiki' AND msq.daimon = 4
  LOOP
    new_text := (regexp_match(old_text, '「([^」]+)」'))[1];
    IF new_text IS NOT NULL AND new_text != old_text THEN
      UPDATE quiz_questions SET question_text = new_text WHERE id = qid;
    END IF;
  END LOOP;

  -- Set 5: \n\n 뒤 단어 추출
  FOR qid, old_text IN
    SELECT msq.question_id, qq.question_text
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.daimon = 4
  LOOP
    -- \n\n 이후 단어 부분만 추출
    new_text := trim(split_part(old_text, E'\n\n', 2));
    IF new_text = '' THEN
      -- fallback: 마지막 줄
      new_text := trim((regexp_match(old_text, E'([^\n]+)$'))[1]);
    END IF;
    IF new_text IS NOT NULL AND new_text != old_text THEN
      UPDATE quiz_questions SET question_text = new_text WHERE id = qid;
    END IF;
  END LOOP;

END$$;

-- 확인
SELECT ms.set_no, msq.sort_order, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3,4,5)
  AND msq.section = 'gengo_chishiki' AND msq.daimon = 4
ORDER BY ms.set_no, msq.sort_order;
