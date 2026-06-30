-- =============================================================================
-- fix_set3_choukai_daemon3_sokuji_20260629.sql
-- N1 Set3 聴解 2点修正
--   1) Q14/Q15 (問題3 概要理解): 質問文+選択肢を概要理解形式に差し替え
--      - 大話/スクリプトは変更しない
--      - Q14: 正答は引き続き sort_order=1
--      - Q15: 正答を sort_order=2→1 に変更 (is_correct 操作を2段階で実施)
--   2) Q17~Q27 (問題4 即時応答): 3択→4択 (sort_order=4 のダミー選択肢追加)
-- =============================================================================

BEGIN;

-- ===========================================================================
-- [1] Q14 (sort_order=14) 概要理解 質問文差し替え
--     question_id: bf533fbd-a1e2-4aba-99b1-0c8889708413
-- ===========================================================================

-- 1-a. 質問文の最終行を概要理解スタイルに変更 (大話ブロックは保持)
UPDATE quiz_questions
SET question_text = replace(
  question_text,
  '質問：編集者が月曜日までにしなければならないことは何ですか。',
  '質問：この会話で二人が主に話し合っているのは何ですか。'
)
WHERE id = 'bf533fbd-a1e2-4aba-99b1-0c8889708413';

-- 1-b. Q14 選択肢テキスト差し替え (正答は引き続き sort_order=1)
UPDATE quiz_question_options
SET option_text = '企画の出版方向性の決定と著者への確認について'
WHERE question_id = 'bf533fbd-a1e2-4aba-99b1-0c8889708413' AND sort_order = 1;

UPDATE quiz_question_options
SET option_text = '専門書として出版するための原稿修正の進め方について'
WHERE question_id = 'bf533fbd-a1e2-4aba-99b1-0c8889708413' AND sort_order = 2;

UPDATE quiz_question_options
SET option_text = '一般読者向けアンケートの実施計画について'
WHERE question_id = 'bf533fbd-a1e2-4aba-99b1-0c8889708413' AND sort_order = 3;

UPDATE quiz_question_options
SET option_text = '編集長が新たな企画案を検討する理由について'
WHERE question_id = 'bf533fbd-a1e2-4aba-99b1-0c8889708413' AND sort_order = 4;

-- ===========================================================================
-- [2] Q15 (sort_order=15) 概要理解 質問文差し替え
--     question_id: 7fad8057-fac4-4c25-ac05-5065dafc6a9e
--     is_correct: sort_order=2(旧)→sort_order=1(新)
--     uq_quiz_question_options_one_correct 制約のため 2段階操作
-- ===========================================================================

-- 2-a. 質問文の最終行を概要理解スタイルに変更
UPDATE quiz_questions
SET question_text = replace(
  question_text,
  '質問：法務委員が不正認定に際して争点として挙げたのは何ですか。',
  '質問：この会話で二人が主に話し合っているのは何ですか。'
)
WHERE id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e';

-- 2-b. 正答制約を外すため全選択肢を false に
UPDATE quiz_question_options
SET is_correct = false
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e';

-- 2-c. 選択肢テキストを全差し替え (sort_order=1 が新しい正答)
UPDATE quiz_question_options
SET option_text = '研究論文における画像流用の不正疑惑と研究機関としての対応方針について'
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e' AND sort_order = 1;

UPDATE quiz_question_options
SET option_text = '不正を行った研究者に対する刑事告発の手続きと時期について'
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e' AND sort_order = 2;

UPDATE quiz_question_options
SET option_text = 'ソフトウェア操作ミスの原因解明を専門機関に依頼する必要性について'
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e' AND sort_order = 3;

UPDATE quiz_question_options
SET option_text = '共著者全員に対する個別ヒアリングの法的根拠と実施時期について'
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e' AND sort_order = 4;

-- 2-d. sort_order=1 を正答に設定
UPDATE quiz_question_options
SET is_correct = true
WHERE question_id = '7fad8057-fac4-4c25-ac05-5065dafc6a9e' AND sort_order = 1;

-- ===========================================================================
-- [3] Q17~Q27 (問題4 即時応答) 3択→4択: sort_order=4 ダミー選択肢追加
--     各 INSERT はサブクエリで question_id を解決
-- ===========================================================================

-- Q17: この書類、明日の朝までに確認していただけますか。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'では、先ほどのご説明についてもう少しお聞かせいただけますか。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 17;

-- Q18: このプロジェクト、正直なところ先が見えてきませんね…
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'それもそうですね。来月からの新規案件に期待しましょうか。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 18;

-- Q19: 先日のプレゼン、大変わかりやすくて勉強になりました。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'それはよかったです。今後もこのシリーズを続けていく予定です。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 19;

-- Q20: 先方から急に仕様変更の依頼が来たんですが、どうしましょうか。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'それより、今月の売上報告を先に片付けましょう。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 20;

-- Q21: この件、担当者に根回ししておいた方がよくないですか。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'そうですね。では、会議室の予約を先に取っておきましょう。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 21;

-- Q22: この報告書、提出期限は明後日ですよね？
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  '報告書の書き方について、もう一度マニュアルを確認してみてください。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 22;

-- Q23: このたびの件、ご迷惑をおかけしまして大変申し訳ございませんでした。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'おっしゃる通りです。次回からは十分にお気をつけください。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 23;

-- Q24: お客様から同じ内容のクレームが二件届いているんですが。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'そちらのお客様とは、以前もトラブルがあったんですか。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 24;

-- Q25: 会議室のプロジェクターが故障してしまいました。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  '修理の見積もりを取ってから、どうするか判断しましょう。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 25;

-- Q26: 今週末のイベント、手伝ってもらえませんか？
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  '今週末は少し立て込んでいますが、来週なら大丈夫ですよ。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 26;

-- Q27: 注文した商品がまだ届いていないんですが。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT qq.id,
  'ただいま在庫を確認しておりますので、少々お待ちください。',
  false, 4
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'choukai' AND msq.sort_order = 27;

COMMIT;

-- ===========================================================================
-- 確認クエリ: Q14/Q15 変更後
-- ===========================================================================
\echo '--- Q14/Q15 AFTER ---'
SELECT msq.sort_order,
  right(replace(replace(qq.question_text, '\\n', chr(10)), '\n', chr(10)), 50) AS question_tail,
  string_agg(qo.sort_order || '. ' || left(qo.option_text, 30) || CASE WHEN qo.is_correct THEN ' ★' ELSE '' END, E'\n' ORDER BY qo.sort_order) AS opts
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3 AND msq.section = 'choukai'
  AND msq.sort_order IN (14, 15)
GROUP BY msq.sort_order, qq.id, qq.question_text
ORDER BY msq.sort_order;

-- ===========================================================================
-- 確認クエリ: Q17~Q27 選択肢数
-- ===========================================================================
\echo '--- Q17~Q27 option count AFTER ---'
SELECT msq.sort_order, count(qo.id) AS opt_count
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3 AND msq.section = 'choukai'
  AND msq.sort_order BETWEEN 17 AND 27
GROUP BY msq.sort_order
ORDER BY msq.sort_order;
