-- Set2 Q7: 見なさされる(이중 수동) 수정
-- question_text: される 제거, option3: 見なさ → 見なされる
DO $$
DECLARE
  qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=7;

  UPDATE quiz_questions
    SET question_text = replace(question_text,
      '（　）される場合がある。',
      '（　）場合がある。')
    WHERE id = qq_id;

  UPDATE quiz_question_options
    SET option_text = '見なされる'
    WHERE question_id = qq_id AND option_text = '見なさ';
END$$;

-- Set2 Q29: option4 なしに → を除いて
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=29;

  UPDATE quiz_question_options
    SET option_text = 'を除いて'
    WHERE question_id = qq_id AND sort_order=4;
END$$;

-- Set2 Q37: option1 見て→ただ, 정답 option1→option4(もなしに)
-- 완성 문장: 彼は窓の外をただ見るともなしに物思いにふけっていた。 ★=もなしに(opt4)
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=37;

  UPDATE quiz_question_options
    SET option_text = 'ただ', is_correct = false
    WHERE question_id = qq_id AND sort_order=1;

  UPDATE quiz_question_options
    SET is_correct = true
    WHERE question_id = qq_id AND sort_order=4;
END$$;

-- Set3 Q33: 全択肢が正答 → 문장に と言える追加, option1/2/3 교체
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=33;

  UPDATE quiz_questions
    SET question_text = replace(question_text,
      'はありえなかった。',
      'はありえなかったと言える。')
    WHERE id = qq_id;

  UPDATE quiz_question_options SET option_text='をめぐって' WHERE question_id=qq_id AND sort_order=1;
  UPDATE quiz_question_options SET option_text='に反して'   WHERE question_id=qq_id AND sort_order=2;
  UPDATE quiz_question_options SET option_text='に沿って'   WHERE question_id=qq_id AND sort_order=3;
END$$;

-- Set3 Q35: option2 を流さずにいられない → を流すことにした
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=35;

  UPDATE quiz_question_options
    SET option_text = 'を流すことにした'
    WHERE question_id=qq_id AND sort_order=2;
END$$;

-- Set3 Q38: 정답 option3→option4
-- 완성 문장: その芸術家は時代の批判をものともせず独自の手法で★自らの世界を表現し続けた。
-- ★3번째칸 = 独自の手法で(opt4)
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=38;

  UPDATE quiz_question_options SET is_correct=false WHERE question_id=qq_id AND sort_order=3;
  UPDATE quiz_question_options SET is_correct=true  WHERE question_id=qq_id AND sort_order=4;
END$$;

-- Set4 Q26: option1 のみならず→にもかかわらず, option3 はもとより→をよそに
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=4 AND msq.section='gengo_chishiki' AND msq.sort_order=26;

  UPDATE quiz_question_options SET option_text='にもかかわらず' WHERE question_id=qq_id AND sort_order=1;
  UPDATE quiz_question_options SET option_text='をよそに'       WHERE question_id=qq_id AND sort_order=3;
END$$;

-- Set4 Q35: option2 に加えて → に反して
DO $$
DECLARE qq_id UUID;
BEGIN
  SELECT qq.id INTO qq_id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
  JOIN quiz_questions qq ON msq.question_id=qq.id
  WHERE ms.level='N1' AND ms.set_no=4 AND msq.section='gengo_chishiki' AND msq.sort_order=35;

  UPDATE quiz_question_options SET option_text='に反して' WHERE question_id=qq_id AND sort_order=2;
END$$;

-- 확인
SELECT ms.set_no, msq.sort_order, qq.question_text,
  json_agg(json_build_object('o', qo.sort_order, 't', qo.option_text, 'c', qo.is_correct) ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
JOIN quiz_question_options qo ON qo.question_id=qq.id
WHERE ms.level='N1'
  AND (ms.set_no=2 AND msq.sort_order IN (7,29,37) AND msq.section='gengo_chishiki'
    OR ms.set_no=3 AND msq.sort_order IN (33,35,38) AND msq.section='gengo_chishiki'
    OR ms.set_no=4 AND msq.sort_order IN (26,35) AND msq.section='gengo_chishiki')
GROUP BY ms.set_no, msq.sort_order, qq.question_text
ORDER BY ms.set_no, msq.sort_order;
