-- 問題3 言い換え類義: 예문 속 타깃 단어에 [word] 마킹
-- Set 1/3: 타깃 단어 비표시 → [word] 추가
-- Set 2: 예문의 「word」→ [word] 통일 (질문행의 「word」는 유지)
-- 방법: split_part로 예문(첫행)과 질문행(둘째행) 분리해서 예문만 수정

-- Set 1 Q14: 平静
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '平静', '[平静]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=14);
-- Set 1 Q15: 摩擦
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '摩擦', '[摩擦]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=15);
-- Set 1 Q16: 忌まわしい
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '忌まわしい', '[忌まわしい]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=16);
-- Set 1 Q17: 実態
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '実態', '[実態]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=17);
-- Set 1 Q18: 歪曲
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '歪曲', '[歪曲]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=18);
-- Set 1 Q19: 募っている
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '募っている', '[募っている]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=1 AND msq.section='gengo_chishiki' AND msq.sort_order=19);

-- Set 2: 예문 첫행의 「word」→ [word]  (질문행은 그대로)
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「風潮」', '[風潮]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=14);
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「一環」', '[一環]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=15);
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「兆候」', '[兆候]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=16);
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「打開」', '[打開]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=17);
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「是正」', '[是正]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=18);
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '「収束」', '[収束]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=19);

-- Set 3 Q14: とりわけ
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), 'とりわけ', '[とりわけ]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=14);
-- Set 3 Q15: 何気なく
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '何気なく', '[何気なく]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=15);
-- Set 3 Q16: 台頭
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '台頭', '[台頭]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=16);
-- Set 3 Q17: 一蹴された
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '一蹴された', '[一蹴された]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=17);
-- Set 3 Q18: 危殆に瀕している
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '危殆に瀕している', '[危殆に瀕している]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=18);
-- Set 3 Q19: 憔悴しきっていた
UPDATE quiz_questions SET question_text =
  replace(split_part(question_text, chr(10), 1), '憔悴しきっていた', '[憔悴しきっていた]') || chr(10) || split_part(question_text, chr(10), 2)
WHERE id = (SELECT qq.id FROM jlpt_mock_sets ms JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id JOIN quiz_questions qq ON msq.question_id=qq.id WHERE ms.level='N1' AND ms.set_no=3 AND msq.section='gengo_chishiki' AND msq.sort_order=19);

-- 결과 확인
SELECT ms.set_no, msq.sort_order, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND ms.set_no IN (1,2,3)
  AND msq.section='gengo_chishiki' AND msq.daimon=3
ORDER BY ms.set_no, msq.sort_order;
