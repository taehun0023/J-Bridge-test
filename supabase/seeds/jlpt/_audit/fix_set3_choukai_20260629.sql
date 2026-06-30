-- ============================================================
-- fix_set3_choukai_20260629.sql
-- N1 Set 3 聴解 全面修正
--   A. daimon/subtype 全30問設定
--   B. P0: sort17/20 正答修正 (P1で上書き、記録用)
--   C. P1: 問題4(sort17-27) 即時応答11問 全面書換 (選択肢3個)
--   D. P1: 問題5(sort28-30) 統合理解3問 全面書換
--   E. P2: sort1,7,10,13,15,16 \n\n ブロック区切り追加
-- 適用環境: ローカルDB (jpjvzlmwzeiyukqqbdit) のみ
-- ============================================================

BEGIN;

-- ==================================================
-- A. daimon / subtype 設定 (全30問)
-- ==================================================
DO $$
DECLARE
  v_set_id uuid;
BEGIN
  SELECT id INTO v_set_id
  FROM jlpt_mock_sets
  WHERE level = 'N1' AND set_no = 3;

  UPDATE jlpt_mock_set_questions
  SET daimon = 1, subtype = '課題理解'
  WHERE set_id = v_set_id AND section = 'choukai'
    AND sort_order BETWEEN 1 AND 5;

  UPDATE jlpt_mock_set_questions
  SET daimon = 2, subtype = 'ポイント理解'
  WHERE set_id = v_set_id AND section = 'choukai'
    AND sort_order BETWEEN 6 AND 11;

  UPDATE jlpt_mock_set_questions
  SET daimon = 3, subtype = '概要理解'
  WHERE set_id = v_set_id AND section = 'choukai'
    AND sort_order BETWEEN 12 AND 16;

  UPDATE jlpt_mock_set_questions
  SET daimon = 4, subtype = '即時応答'
  WHERE set_id = v_set_id AND section = 'choukai'
    AND sort_order BETWEEN 17 AND 27;

  UPDATE jlpt_mock_set_questions
  SET daimon = 5, subtype = '統合理解'
  WHERE set_id = v_set_id AND section = 'choukai'
    AND sort_order BETWEEN 28 AND 30;
END $$;

-- ==================================================
-- B. P0: sort17/20 正答修正 (直後のDELETEで上書き)
-- sort17: 正答「家庭での食品廃棄…」→「自主回収の手続きを開始すること」
-- sort20: 正答「とんでもございません…」→「地域コミュニティへの参画促進…」
-- ==================================================
UPDATE quiz_question_options
SET option_text = '自主回収の手続きを開始すること'
WHERE question_id = 'b8d815ba-010a-4aa0-8e88-b2460ddaa80c'
  AND is_correct = TRUE;

UPDATE quiz_question_options
SET option_text = '地域コミュニティへの参画促進と、移住者が起業・就職しやすい環境整備'
WHERE question_id = 'b75c64d2-0ee4-4737-b312-72d419e2293d'
  AND is_correct = TRUE;

-- ==================================================
-- C. P1: 問題4 (sort 17-27) 即時応答 全面書換
-- ==================================================

DELETE FROM quiz_question_options WHERE question_id IN (
  'b8d815ba-010a-4aa0-8e88-b2460ddaa80c',
  '469baa30-f4d7-4034-a85e-ec64443a789b',
  '73013059-9208-4590-9fa5-eef45cf5fa7f',
  'b75c64d2-0ee4-4737-b312-72d419e2293d',
  'a4d44b0c-0ba3-4610-b302-9efd3ac32775',
  '8a962d5e-7715-4adf-8d76-29d8779effd9',
  'daff3d54-eb0b-41d5-9a36-ecb2b4258df7',
  'df94d083-671c-427c-91ab-d70df942faaa',
  '72245cb1-beed-4463-8941-31c56bca7503',
  '82fccb96-8d9c-458b-831a-bfbf6fdc7e15',
  '7d418668-d157-4b40-991c-204037cfb7e7'
);

-- sort17: 書類確認依頼
UPDATE quiz_questions
SET question_text = 'この書類、明日の朝までに確認していただけますか。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = 'b8d815ba-010a-4aa0-8e88-b2460ddaa80c';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('b8d815ba-010a-4aa0-8e88-b2460ddaa80c', 'わかりました。今日中に目を通しておきます。', TRUE,  1),
  ('b8d815ba-010a-4aa0-8e88-b2460ddaa80c', 'ありがとうございます。どうぞよろしくお願いいたします。', FALSE, 2),
  ('b8d815ba-010a-4aa0-8e88-b2460ddaa80c', 'では、明日の朝に会議室を予約しておきます。', FALSE, 3);

-- sort18: プロジェクトの閉塞感
UPDATE quiz_questions
SET question_text = 'このプロジェクト、正直なところ先が見えてきませんね…' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '469baa30-f4d7-4034-a85e-ec64443a789b';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('469baa30-f4d7-4034-a85e-ec64443a789b', 'おっしゃる通りです。もうしばらく様子を見ましょう。', FALSE, 1),
  ('469baa30-f4d7-4034-a85e-ec64443a789b', '一度立ち止まって、現状を洗い出してみましょうか。', TRUE,  2),
  ('469baa30-f4d7-4034-a85e-ec64443a789b', 'それはちょっと言い過ぎじゃないですか。', FALSE, 3);

-- sort19: プレゼンへの称賛
UPDATE quiz_questions
SET question_text = '先日のプレゼン、大変わかりやすくて勉強になりました。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '73013059-9208-4590-9fa5-eef45cf5fa7f';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('73013059-9208-4590-9fa5-eef45cf5fa7f', 'おほめいただきありがとうございます。励みになります。', TRUE,  1),
  ('73013059-9208-4590-9fa5-eef45cf5fa7f', 'こちらこそ、よろしくお願いいたします。', FALSE, 2),
  ('73013059-9208-4590-9fa5-eef45cf5fa7f', 'そうでしたか。また機会があればぜひご参加ください。', FALSE, 3);

-- sort20: 仕様変更への対応
UPDATE quiz_questions
SET question_text = '先方から急に仕様変更の依頼が来たんですが、どうしましょうか。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = 'b75c64d2-0ee4-4737-b312-72d419e2293d';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('b75c64d2-0ee4-4737-b312-72d419e2293d', 'それはお断りしましょう。契約書にそういう条項はありません。', FALSE, 1),
  ('b75c64d2-0ee4-4737-b312-72d419e2293d', 'まず影響範囲を確認してから、追加費用の見積もりを出しましょう。', TRUE,  2),
  ('b75c64d2-0ee4-4737-b312-72d419e2293d', 'すぐに対応します。仕様変更は当然のことです。', FALSE, 3);

-- sort21: 根回しの提案
UPDATE quiz_questions
SET question_text = 'この件、担当者に根回ししておいた方がよくないですか。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = 'a4d44b0c-0ba3-4610-b302-9efd3ac32775';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('a4d44b0c-0ba3-4610-b302-9efd3ac32775', 'そうですね。会議の前に一度話しておくと、スムーズに進みそうです。', TRUE,  1),
  ('a4d44b0c-0ba3-4610-b302-9efd3ac32775', '根回しなんて必要ないですよ。正面からぶつかりましょう。', FALSE, 2),
  ('a4d44b0c-0ba3-4610-b302-9efd3ac32775', 'ありがとうございます。では担当者に伝えておきます。', FALSE, 3);

-- sort22: 提出期限確認
UPDATE quiz_questions
SET question_text = 'この報告書、提出期限は明後日ですよね？' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '8a962d5e-7715-4adf-8d76-29d8779effd9';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('8a962d5e-7715-4adf-8d76-29d8779effd9', 'ええ、私も今さっき確認したところです。', FALSE, 1),
  ('8a962d5e-7715-4adf-8d76-29d8779effd9', 'はい。間に合わなさそうなら、早めに上司に相談した方がいいですよ。', TRUE,  2),
  ('8a962d5e-7715-4adf-8d76-29d8779effd9', 'そうですか。では明日必ず提出してください。', FALSE, 3);

-- sort23: 謝罪への応答
UPDATE quiz_questions
SET question_text = 'このたびの件、ご迷惑をおかけしまして大変申し訳ございませんでした。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = 'daff3d54-eb0b-41d5-9a36-ecb2b4258df7';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('daff3d54-eb0b-41d5-9a36-ecb2b4258df7', 'いいえ、こちらこそ至らない点がありまして。今後ともよろしくお願いいたします。', TRUE,  1),
  ('daff3d54-eb0b-41d5-9a36-ecb2b4258df7', 'ありがとうございます。今後もよろしくお願いいたします。', FALSE, 2),
  ('daff3d54-eb0b-41d5-9a36-ecb2b4258df7', 'はい、ご迷惑をおかけしたことは十分わかっています。', FALSE, 3);

-- sort24: クレーム二重着信
UPDATE quiz_questions
SET question_text = 'お客様から同じ内容のクレームが二件届いているんですが。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = 'df94d083-671c-427c-91ab-d70df942faaa';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('df94d083-671c-427c-91ab-d70df942faaa', '速やかに原因を確認して、対応策を検討しましょう。', TRUE,  1),
  ('df94d083-671c-427c-91ab-d70df942faaa', 'では、担当者に伝えておきます。', FALSE, 2),
  ('df94d083-671c-427c-91ab-d70df942faaa', 'ご不便をおかけしまして、大変失礼いたしました。', FALSE, 3);

-- sort25: プロジェクター故障
UPDATE quiz_questions
SET question_text = '会議室のプロジェクターが故障してしまいました。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '72245cb1-beed-4463-8941-31c56bca7503';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('72245cb1-beed-4463-8941-31c56bca7503', 'それは困りましたね。代わりに資料を印刷して配りましょうか。', TRUE,  1),
  ('72245cb1-beed-4463-8941-31c56bca7503', 'ありがとうございます。引き続きよろしくお願いします。', FALSE, 2),
  ('72245cb1-beed-4463-8941-31c56bca7503', 'では、明日の朝一番で確認してみます。', FALSE, 3);

-- sort26: イベント手伝い依頼
UPDATE quiz_questions
SET question_text = '今週末のイベント、手伝ってもらえませんか？' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '82fccb96-8d9c-458b-831a-bfbf6fdc7e15';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('82fccb96-8d9c-458b-831a-bfbf6fdc7e15', 'もちろんです。何をすればいいですか。', TRUE,  1),
  ('82fccb96-8d9c-458b-831a-bfbf6fdc7e15', 'ありがとうございます。楽しみにしています。', FALSE, 2),
  ('82fccb96-8d9c-458b-831a-bfbf6fdc7e15', 'では、会場の予約をしておきます。', FALSE, 3);

-- sort27: 商品未着クレーム
UPDATE quiz_questions
SET question_text = '注文した商品がまだ届いていないんですが。' || E'\n\n' || '最も適切な応答を選びなさい。'
WHERE id = '7d418668-d157-4b40-991c-204037cfb7e7';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('7d418668-d157-4b40-991c-204037cfb7e7', 'ありがとうございます。またのご利用をお待ちしております。', FALSE, 1),
  ('7d418668-d157-4b40-991c-204037cfb7e7', 'それは承知しております。少々お待ちください。', FALSE, 2),
  ('7d418668-d157-4b40-991c-204037cfb7e7', '大変失礼いたしました。すぐに配送状況を確認いたします。', TRUE,  3);

-- ==================================================
-- D. P1: 問題5 (sort 28-30) 統合理解 全面書換
-- ==================================================

DELETE FROM quiz_question_options WHERE question_id IN (
  '114def5d-6e34-4c79-8d98-188a15b6e9fb',
  '3d7ac754-1d72-4c2c-a164-bb6cd457175d',
  '2b3807bf-59f9-44f6-a7cd-06073e82a572'
);

-- sort28: テレワーク制度見直し
UPDATE quiz_questions SET question_text =
  'ある会社で、部長と二人の課長がテレワーク制度の見直しについて話し合っています。' || E'\n\n' ||
  '部長：来月から全員週3日以上の出社を義務付けようと思う。鈴木課長、どう思う？' || E'\n' ||
  '鈴木課長：若手の育成やチームワークの観点からは、出社日を増やすことに賛成です。画面越しでは伝わらないことが多くて。' || E'\n' ||
  '田中課長：私は反対ではないのですが、優秀な人材の確保という観点からは、テレワークの柔軟性が採用の強みになっているのも事実です。週3日という数字が、その強みを損なわないか心配で。' || E'\n' ||
  '部長：田中課長の言う点も重要だ。では、週3日の義務化はするが、例外申請の仕組みも設けようか。育児や介護など特別な事情がある場合は柔軟に対応できるように。' || E'\n' ||
  '鈴木課長：それであれば、育成の観点を大切にしつつ、柔軟性も保てますね。' || E'\n' ||
  '田中課長：賛成です。例外の運用ルールを明確にすれば、現場も混乱しないと思います。' || E'\n\n' ||
  '質問：最終的に決まったことはどれですか。'
WHERE id = '114def5d-6e34-4c79-8d98-188a15b6e9fb';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('114def5d-6e34-4c79-8d98-188a15b6e9fb', 'テレワークを全面廃止し、全員毎日出社を義務付ける', FALSE, 1),
  ('114def5d-6e34-4c79-8d98-188a15b6e9fb', '週3日以上の出社を義務化するが、特別な事情には例外申請で対応する', TRUE,  2),
  ('114def5d-6e34-4c79-8d98-188a15b6e9fb', '出社日数の変更はせず、現行制度を継続する', FALSE, 3),
  ('114def5d-6e34-4c79-8d98-188a15b6e9fb', '月に一度だけ全員出社の日を設ける', FALSE, 4);

-- sort29: 図書館リニューアル
UPDATE quiz_questions SET question_text =
  '市の会議室で、市議会議員と二人の市民代表が図書館のリニューアル計画について話し合っています。' || E'\n\n' ||
  '議員：現在の中央図書館のリニューアルについて、市民の皆様のご意見をいただきたいと思います。' || E'\n' ||
  '田村さん（市民代表A）：もっとコワーキングスペースを増やしてほしいです。最近テレワークの方が多く、静かに仕事ができる場所を求めている声をよく聞きます。' || E'\n' ||
  '佐野さん（市民代表B）：子育て世代としては、絵本や読み聞かせコーナーの充実を優先していただきたいです。子どもと一緒に来やすい環境を作ってほしいんです。' || E'\n' ||
  '議員：両方とも大切なご要望ですね。予算の関係で全ての実現は難しいかもしれませんが、コワーキングスペースの一部と、子ども向けコーナーの拡充を組み合わせた案はいかがでしょうか。' || E'\n' ||
  '田村さん：面積が小さくてもいいので、静かに使える個別ブースが数席あれば助かります。' || E'\n' ||
  '佐野さん：子どもコーナーが充実するなら、コワーキングの規模は多少小さくなっても理解できます。' || E'\n\n' ||
  '質問：話し合いの結果、どのような方向性でリニューアルすることになりましたか。'
WHERE id = '3d7ac754-1d72-4c2c-a164-bb6cd457175d';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('3d7ac754-1d72-4c2c-a164-bb6cd457175d', 'コワーキングスペースを優先して大きく設け、子どもコーナーは維持する', FALSE, 1),
  ('3d7ac754-1d72-4c2c-a164-bb6cd457175d', '子ども向けコーナーのみを拡充し、コワーキングスペースは設けない', FALSE, 2),
  ('3d7ac754-1d72-4c2c-a164-bb6cd457175d', 'コワーキングスペースと子ども向けコーナーの両方を組み合わせた形でリニューアルする', TRUE,  3),
  ('3d7ac754-1d72-4c2c-a164-bb6cd457175d', '予算不足のため、今回はリニューアルを見送ることにした', FALSE, 4);

-- sort30: 新商品開発の方向性
UPDATE quiz_questions SET question_text =
  'ある食品会社で、開発部長と二人の担当者が新商品の開発方向性について話し合っています。' || E'\n\n' ||
  '部長：次の新商品開発について、健康志向路線と従来の味重視路線、どちらを強化するか方針を決めたい。山田さんと木村さんの意見を聞かせてください。' || E'\n' ||
  '山田（開発担当）：市場調査の結果では、30〜50代を中心に健康志向が急速に高まっています。減塩・低糖質の商品は競合他社でも増えていますが、弊社の製造技術を活かせば差別化できると思います。' || E'\n' ||
  '木村（マーケティング担当）：健康志向の市場は成長していますが、弊社の既存ファン層は「おいしさ」にこだわっています。健康を意識しすぎると、コアなお客様が離れるリスクもあります。既存商品のブランドは守りながら、健康商品は別ラインで展開してはどうでしょう。' || E'\n' ||
  '部長：木村さんの言う通り、既存ファンを大切にしながら新しい市場も取りに行く戦略がベストだな。既存ブランドはそのまま残し、新たな健康シリーズを立ち上げることにしよう。' || E'\n' ||
  '山田：賛成です。製造ラインの一部を健康シリーズ専用に改修すれば対応できます。' || E'\n' ||
  '木村：では、既存商品のブランドは守りつつ、健康ラインで新規顧客の獲得を目指す方向で進めましょう。' || E'\n\n' ||
  '質問：新商品開発についての最終的な方針はどれですか。'
WHERE id = '2b3807bf-59f9-44f6-a7cd-06073e82a572';

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('2b3807bf-59f9-44f6-a7cd-06073e82a572', '健康志向路線に完全切り替えし、既存商品の製造を終了する', FALSE, 1),
  ('2b3807bf-59f9-44f6-a7cd-06073e82a572', '既存商品の味を健康志向に合わせてリニューアルする', FALSE, 2),
  ('2b3807bf-59f9-44f6-a7cd-06073e82a572', '現状維持とし、味重視路線を継続する', FALSE, 3),
  ('2b3807bf-59f9-44f6-a7cd-06073e82a572', '既存ブランドを維持しつつ、別ラインで健康シリーズを新展開する', TRUE,  4);

-- ==================================================
-- E. P2: \n\n ブロック区切り追加
-- 対象: sort1,7,10,13,15,16 (3行構成、\n\nなし)
-- 全\nを\n\nに一括変換 (各問とも内部改行なし・2箇所のみ)
-- ==================================================
UPDATE quiz_questions
SET question_text = replace(question_text, chr(10), chr(10) || chr(10))
WHERE id IN (
  '88985abb-2eb0-471c-95f5-8755707d51f5',  -- sort1
  'e24895de-7557-4a81-b1e3-e6aedf0a3b4a',  -- sort7
  '60f7cc14-f2ef-4ff1-a297-580501f14b82',  -- sort10
  '37b646c9-200d-4e01-9569-0cc74db79f30',  -- sort13
  '7fad8057-fac4-4c25-ac05-5065dafc6a9e',  -- sort15
  '07692ca1-0f03-4e21-8136-5a7b95a82a46'   -- sort16
)
AND position(chr(10) || chr(10) IN question_text) = 0;

COMMIT;

-- ==================================================
-- 確認クエリ
-- ==================================================
SELECT
  msq.sort_order,
  msq.daimon,
  msq.subtype,
  LEFT(qq.question_text, 35) AS qt_head,
  COUNT(qo.id)                              AS opt_count,
  SUM(CASE WHEN qo.is_correct THEN 1 ELSE 0 END) AS correct_count
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq             ON msq.question_id = qq.id
LEFT JOIN quiz_question_options qo ON qo.question_id  = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3 AND msq.section = 'choukai'
GROUP BY msq.sort_order, msq.daimon, msq.subtype, qq.id, qq.question_text
ORDER BY msq.sort_order;
