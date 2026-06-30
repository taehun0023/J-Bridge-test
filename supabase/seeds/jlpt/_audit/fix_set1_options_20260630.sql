-- Set 1 文法 複数正答可能 選択肢修正
-- 2026-06-30
-- 対象: Q26, Q31, Q33, Q34 (Q29は既存選択肢が明確な誤りのため変更不要)
--
-- Q26: 天才__________、この問題を易々と解いてしまうのも当然かもしれない。
--   正解: だけあって
--   ならば(so=1) → にして  ← 「天才にして」は逆接・例外ニュアンスで「当然かもしれない」と矛盾
--   だからこそ(so=4) → とはいえ  ← 「天才とはいえ」は譲歩・逆接で文脈と逆
--
-- Q31: クライアント（　）、納期の延長は受け入れがたいだろう。
--   正解: にしてみれば
--   にとって(so=2) → にかかわりなく  ← 「クライアントにかかわりなく」は文脈上明確に誤り
--
-- Q33: 周囲の心配__________、彼は独断でプロジェクトを進めてしまった。
--   正解: をよそに
--   をものともせず(so=1) → をよそながら  ← 存在しない疑似表現、明確に誤り
--
-- Q34: この難局を乗り越えられる人物は、彼__________ほかにいない。
--   正解: をおいて
--   を除いて(so=2) → ともなれば  ← 「彼ともなれば〜ほかにいない」は構造上不自然
--   以外に(so=4) → においては  ← 「彼においては〜ほかにいない」は「においては」の用法と不合

-- Q26: ならば → にして (so=1)
UPDATE quiz_question_options
  SET option_text = 'にして'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 26
  ) AND sort_order = 1 AND is_correct = false;

-- Q26: だからこそ → とはいえ (so=4)
UPDATE quiz_question_options
  SET option_text = 'とはいえ'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 26
  ) AND sort_order = 4 AND is_correct = false;

-- Q31: にとって → にかかわりなく (so=2)
UPDATE quiz_question_options
  SET option_text = 'にかかわりなく'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 31
  ) AND sort_order = 2 AND is_correct = false;

-- Q33: をものともせず → をよそながら (so=1)
UPDATE quiz_question_options
  SET option_text = 'をよそながら'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 33
  ) AND sort_order = 1 AND is_correct = false;

-- Q34: を除いて → ともなれば (so=2)
UPDATE quiz_question_options
  SET option_text = 'ともなれば'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 34
  ) AND sort_order = 2 AND is_correct = false;

-- Q34: 以外に → においては (so=4)
UPDATE quiz_question_options
  SET option_text = 'においては'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 1
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 34
  ) AND sort_order = 4 AND is_correct = false;

-- 適用後確認
SELECT msq.sort_order,
  json_agg(json_build_object('so', qo.sort_order, 'text', qo.option_text, 'correct', qo.is_correct) ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_question_options qo ON qo.question_id = msq.question_id
WHERE ms.level = 'N1' AND ms.set_no = 1 AND msq.section = 'gengo_chishiki'
  AND msq.sort_order IN (26, 31, 33, 34)
GROUP BY msq.sort_order
ORDER BY msq.sort_order;
