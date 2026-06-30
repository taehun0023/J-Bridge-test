-- =============================================================================
-- fix_set4_set5_options_20260630.sql
-- 目的: Set4/Set5 の複数正答可能な誤答選択肢を明確に誤った選択肢へ差し替え
-- 対象: N1 Set4 Q31/Q32/Q43, N1 Set5 Q26/Q30/Q31/Q33/Q35
-- 作成: 2026-06-30
-- =============================================================================

BEGIN;

-- ============================================================
-- Set 4 Q31 (sort_order=31)
-- 文: 現行の規定（　　）、この手続きが適切かどうかを改めて検討すべきだ。
-- 正答: に即して
-- 問題: に沿って・に従って が正答と同義で置換可能
-- ============================================================

-- に沿って → にかかわらず (規定にかかわらず検討 = 規定を無視して検討 → 意味が逆で明確にNG)
UPDATE quiz_question_options
  SET option_text = 'にかかわらず'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 31
  )
  AND is_correct = false
  AND option_text LIKE '%に沿って%';

-- に従って → を顧みず (規定を顧みず = 規定を無視して → 文脈上逆で明確にNG)
UPDATE quiz_question_options
  SET option_text = 'を顧みず'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 31
  )
  AND is_correct = false
  AND option_text LIKE '%に従って%';

-- ============================================================
-- Set 4 Q32 (sort_order=32)
-- 文: 本日の取締役会の決議（　　）、新社長への権限移譲が正式に発効した。
-- 正答: をもって
-- 問題: によって が置換可能に見える
-- ============================================================

-- によって → にわたって (決議にわたって発効 = 「決議に渡って」は意味不明な組み合わせ → 明確にNG)
UPDATE quiz_question_options
  SET option_text = 'にわたって'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 32
  )
  AND is_correct = false
  AND option_text LIKE '%によって%';

-- を経て → に先立ち (決議に先立ち発効 = 決議の前に発効 → 時系列が逆で論理的にNG)
UPDATE quiz_question_options
  SET option_text = 'に先立ち'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 32
  )
  AND is_correct = false
  AND option_text LIKE '%を経て%';

-- ============================================================
-- Set 4 Q43 (sort_order=43)
-- 文: この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。
-- 正答: 打開すべく
-- 問題: 踏まえて・受けて が文脈上自然に使えてしまう
-- ============================================================

-- 踏まえて → 無視して (状況を無視して絆を再構築 → 動機が矛盾、明確にNG)
UPDATE quiz_question_options
  SET option_text = '無視して'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 43
  )
  AND is_correct = false
  AND option_text LIKE '%踏まえて%';

-- 受けて → 悪化させて (状況を悪化させて絆を再構築 → 文脈が完全に矛盾、明確にNG)
UPDATE quiz_question_options
  SET option_text = '悪化させて'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 4
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 43
  )
  AND is_correct = false
  AND option_text LIKE '%受けて%';

-- ============================================================
-- Set 5 Q26 (sort_order=26)
-- 文: 式典（　　）、担当者が会場内の最終確認を行った。
-- 正答: に先立ち
-- 問題: にあたって・に際して が「式典の際に確認」として置換可能
-- ============================================================

-- にあたって → を皮切りに (式典を皮切りに最終確認 = 式典を開始点として確認 → 最終確認は式典前に行うもので文脈が逆転、明確にNG)
UPDATE quiz_question_options
  SET option_text = 'を皮切りに'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 26
  )
  AND is_correct = false
  AND option_text LIKE '%にあたって%';

-- に際して → にかかわらず (式典にかかわらず最終確認 = 式典の有無と無関係に確認 → 式典準備の文脈と矛盾、明確にNG)
UPDATE quiz_question_options
  SET option_text = 'にかかわらず'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 26
  )
  AND is_correct = false
  AND option_text LIKE '%に際して%';

-- ============================================================
-- Set 5 Q30 (sort_order=30)
-- 文: 過去の判例（　　）、今回の判決を評価すると、正当性が認められる。
-- 正答: に照らして
-- 問題: をもとに が置換可能に見える
-- ============================================================

-- をもとに → にかかわらず (判例にかかわらず評価すると正当性が認められる → 判例無視で正当性を認める、論理的に矛盾・明確にNG)
UPDATE quiz_question_options
  SET option_text = 'にかかわらず'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 30
  )
  AND is_correct = false
  AND option_text LIKE '%をもとに%';

-- ============================================================
-- Set 5 Q31 (sort_order=31)
-- 文: 彼は激しい頭痛（　　）、最後まで試合に出場し続けた。
-- 正答: をものともせず
-- 問題: にもかかわらず が意味的に置換可能
-- ============================================================

-- にもかかわらず → をいいことに (激しい頭痛をいいことに出場し続けた = 頭痛を都合よく利用して出場 → 頭痛は出場継続の口実にならない、文脈が逆で明確にNG)
UPDATE quiz_question_options
  SET option_text = 'をいいことに'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 31
  )
  AND is_correct = false
  AND option_text LIKE '%にもかかわらず%';

-- ============================================================
-- Set 5 Q33 (sort_order=33)
-- 文: 家族の安全のため（　　）、警察に知らせることも厭わない。
-- 正答: とあれば
-- 問題: ならば が条件節として置換可能
-- ============================================================

-- ならば → とはいえ (家族の安全のためとはいえ警察に知らせることも厭わない = 逆接で「家族の安全のためというだけの理由では警察連絡は躊躇が普通」という含意になり文脈と矛盾・明確にNG)
UPDATE quiz_question_options
  SET option_text = 'とはいえ'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 33
  )
  AND is_correct = false
  AND option_text LIKE '%ならば%';

-- ============================================================
-- Set 5 Q35 (sort_order=35)
-- 文: 他の人に多大な迷惑をかけた以上、お詫びせ（　　）だろう。
-- 正答: ずにはすまない
-- 問題: ざるをえない が「謝らざるをえない」として意味的に置換可能
-- ============================================================

-- ざるをえない → ずに済む (お詫びせずに済むだろう = 謝らなくてもいいだろう → 多大な迷惑をかけた状況で謝罪不要は常識的に完全に矛盾、明確にNG)
UPDATE quiz_question_options
  SET option_text = 'ずに済む'
  WHERE question_id = (
    SELECT msq.question_id
    FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    WHERE ms.level = 'N1' AND ms.set_no = 5
      AND msq.section = 'gengo_chishiki' AND msq.sort_order = 35
  )
  AND is_correct = false
  AND option_text LIKE '%ざるをえない%';

-- ============================================================
-- 確認クエリ
-- ============================================================

SELECT 'Set4' AS set_label, ms.set_no, msq.sort_order,
  json_agg(json_build_object('so', qo.sort_order, 'text', qo.option_text, 'correct', qo.is_correct) ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 4 AND msq.section = 'gengo_chishiki'
  AND msq.sort_order IN (31, 32, 43)
GROUP BY ms.set_no, msq.sort_order
UNION ALL
SELECT 'Set5' AS set_label, ms.set_no, msq.sort_order,
  json_agg(json_build_object('so', qo.sort_order, 'text', qo.option_text, 'correct', qo.is_correct) ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 5 AND msq.section = 'gengo_chishiki'
  AND msq.sort_order IN (26, 30, 31, 33, 35)
GROUP BY ms.set_no, msq.sort_order
ORDER BY set_label, sort_order;

COMMIT;
