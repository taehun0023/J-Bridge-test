-- fix_set2_choukai_content_20260629.sql
-- N1 Set2 聴解 3工事:
--   作業1: Q1/Q3/Q4/Q5/Q6 → 課題理解 形式 全文交替
--   作業2: Q16 正答テキスト修正 (option 3 が別問題内容になっていた)
--   作業3: Q17~Q27 → 即時応答 形式 全文交替
-- 対象: ローカルDB (jpjvzlmwzeiyukqqbdit)
-- 作成: 2026-06-29
--
-- ※ is_correct の変更は2パスで実施:
--    Pass1: option_text 更新 + is_correct=false に全件統一
--    Pass2: 正答1件だけ is_correct=true にセット
--   (uq_quiz_question_options_one_correct 制約回避のため)

BEGIN;

-- ===========================================================
-- 作業1: Q1 / Q3 / Q4 / Q5 / Q6 → 課題理解 全文交替
-- 形式: 状況説明\n\n質問\n\n会話 (3ブロック \n\n 区切り)
-- ===========================================================

-- -------------------------------------------------------
-- Q1 (sort_order=1): IT システム障害対応 / 正答 option 1
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'本番環境で重大な障害が発生した。システムエンジニアの山田さんはインシデント対応チームのリーダーとして呼ばれた。\n\n質問：山田さんはこの後まず何をしなければなりませんか。\n\nチーフ：山田さん、本番のAPIサーバーが全台ダウンしています。ユーザーからのエラー報告が急増しています。\n山田：ログを確認しました。30分前のデプロイ直後から発生しています。直前のリリースが原因の可能性が高いです。\nチーフ：どうしますか。\n山田：まず、サービス責任者に障害発生と原因の見立てを報告して、ロールバックの承認を得る必要があります。自己判断で動くのはまずいので。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 1
  AND qq.id = msq.question_id;

-- Pass1: text + all false
UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'サービス責任者に障害発生を報告してロールバックの承認を得る'
    WHEN 2 THEN 'ロールバックを即座に実行してサービスを復旧させる'
    WHEN 3 THEN 'ユーザーへの障害通知メールを一斉送信する'
    WHEN 4 THEN '開発チーム全員を緊急招集して原因究明会議を開く'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 1
  AND qo.question_id = qq.id;

-- Pass2: set correct
UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 1
  AND qo.question_id = qq.id AND qo.sort_order = 1;

-- -------------------------------------------------------
-- Q3 (sort_order=3): プロジェクト納期変更 / 正答 option 2
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'システム開発PMの鈴木さんは、テスト工程で重大な脆弱性が発見され、来週の納品期限に間に合わないことが判明した。\n\n質問：鈴木さんはこの後まず何をしなければなりませんか。\n\nチームリード：鈴木さん、セキュリティ上の重大な脆弱性が見つかりました。修正に最低2週間かかります。来週の納品は厳しいです。\n鈴木：それは困りましたね。まず社内の工程表を組み直して——\nチームリード：クライアントへの連絡はどうしますか。\n鈴木：そうだ、まずクライアントに状況を正直に説明して、納期延長のご了承をいただかないといけません。社内の調整はその後です。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 3
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '社内の品質保証チームに追加テストを依頼する'
    WHEN 2 THEN 'クライアントに状況を説明して納期延長の了承を得る'
    WHEN 3 THEN '不具合修正のためにエンジニアを増員する'
    WHEN 4 THEN '不具合箇所を無効化して予定通りに納品する'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 3
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 3
  AND qo.question_id = qq.id AND qo.sort_order = 2;

-- -------------------------------------------------------
-- Q4 (sort_order=4): 新入社員教育担当 / 正答 option 3
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'4月から新入社員研修の担当メンターになった中川さん。今日は新入社員の田村さんが入社初日を迎える。\n\n質問：中川さんは今日まず何をしなければなりませんか。\n\n上司：中川さん、田村さんのメンターをよろしくお願いします。今日から実際の業務に入ってもらう予定ですが、まず何から始めますか。\n中川：はい。パソコンのセットアップや具体的な業務は後でも対応できますので、まず会社のルールと基本的な業務フローについてオリエンテーションを行います。\n上司：なるほど、基礎から固めるわけですね。\n中川：はい。ベースを理解してから実務に入ってもらうほうが、結果的に早く戦力になると思います。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 4
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '田村さんの業務用パソコンのセットアップを完了させる'
    WHEN 2 THEN '田村さんに高度な技術課題を与えてスキルレベルを把握する'
    WHEN 3 THEN '会社のルールと基本的な業務フローについてオリエンテーションを行う'
    WHEN 4 THEN '田村さんを社内会議に同席させて実際の業務を見せる'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 4
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 4
  AND qo.question_id = qq.id AND qo.sort_order = 3;

-- -------------------------------------------------------
-- Q5 (sort_order=5): 契約書誤記発見 / 正答 option 4
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'法務部の吉田さんは、明日締結予定の取引先との契約書を最終確認中に、金額条項に重大な誤記を発見した。\n\n質問：吉田さんはこの後まず何をしなければなりませんか。\n\n同僚：吉田さん、どうかしましたか。難しい顔をして。\n吉田：大変です。契約書の第5条に誤記があります。支払い金額が「100万円」となっていますが、正しくは「1,000万円」のはずです。\n同僚：それは大変。明日の締結まで時間がないですよね。\n吉田：まず法務部長に報告して対応指示を仰がなければなりません。勝手に修正して送ると後から問題になりますから。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 5
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '自分で誤記箇所を修正した契約書を取引先にすぐ送付する'
    WHEN 2 THEN '取引先の担当者に直接電話して誤記について謝罪する'
    WHEN 3 THEN '明日の締結日を延期するよう事務局に連絡する'
    WHEN 4 THEN '法務部長に誤記の発見を報告して対応指示を仰ぐ'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 5
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 5
  AND qo.question_id = qq.id AND qo.sort_order = 4;

-- -------------------------------------------------------
-- Q6 (sort_order=6): クライアントのクレーム電話 / 正答 option 3
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'営業担当の林さんのもとに、担当クライアントから納品済みシステムの不具合に関するクレームの電話が入った。\n\n質問：林さんはこの後まず何をしなければなりませんか。\n\nクライアント：先週納品いただいたシステムですが、データ保存時にエラーが出て業務に支障が出ています。早急に対応をお願いしたいのですが。\n林：それは大変失礼いたしました。詳細をお聞かせいただけますか。どのような操作をされたときに発生しますか。\nクライアント：商品登録画面で保存ボタンを押すとエラーになって、データが消えてしまいます。\n林：承知いたしました。まず開発部門にこの状況を詳しく報告して、本日中に対応策をご連絡いたします。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 6
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'クライアントのオフィスに今すぐ駆けつけて直接謝罪する'
    WHEN 2 THEN '無償でシステムを交換する旨の文書をクライアントに送付する'
    WHEN 3 THEN '不具合の詳細を開発部門に報告して対応を依頼する'
    WHEN 4 THEN '問題が解決するまでシステムの使用中止をクライアントに依頼する'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 6
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 6
  AND qo.question_id = qq.id AND qo.sort_order = 3;

-- ===========================================================
-- 作業2: Q16 正答テキスト修正
-- sort_order=3 (is_correct=true) のテキストを地文内容に合わせて教替
-- 地文: 教員の多忙化が子どもの教育に直接影響、部活・事務負担軽減が必要
-- is_correct は変更しない (既に option 3 が正答)
-- ===========================================================

UPDATE quiz_question_options qo
SET option_text = '教員の多忙化が子どもの教育の質に直結しており、部活・事務の負担軽減が急務だということ'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 16
  AND qo.question_id = qq.id
  AND qo.sort_order = 3;

-- ===========================================================
-- 作業3: Q17~Q27 → 即時応答 全文交替
-- 形式: 次の文を聴いて、最も適切な応答を選びなさい。\n\n[発話]
-- ===========================================================

-- -------------------------------------------------------
-- Q17: 上司への失敗報告 / 正答 option 4
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n田中部長、申し訳ありません。私の確認不足で、お客様に誤った金額の見積書をお送りしてしまいました。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 17
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'それは仕方がないですね。次回から気をつけてください。'
    WHEN 2 THEN 'なぜそんなミスをするのですか。もう任せられません。'
    WHEN 3 THEN 'それは私には関係ありません。自分で対処してください。'
    WHEN 4 THEN 'わかりました。至急お客様にお詫びと訂正のご連絡をしてください。状況をもう少し詳しく話してください。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 17
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 17
  AND qo.question_id = qq.id AND qo.sort_order = 4;

-- -------------------------------------------------------
-- Q18: 取引先への日程変更要請 / 正答 option 1
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n山本様、誠に恐れ入りますが、来週水曜日にご予定いただいていた打ち合わせを、木曜日の午後に変更していただくことは可能でしょうか。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 18
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '木曜日の午後でございますね。確認の上、折り返しご連絡いたします。'
    WHEN 2 THEN '変更は一切お受けできません。予定通りにお越しください。'
    WHEN 3 THEN 'なぜ変更が必要なのですか。理由をお聞かせください。'
    WHEN 4 THEN '打ち合わせはキャンセルにしましょうか。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 18
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 18
  AND qo.question_id = qq.id AND qo.sort_order = 1;

-- -------------------------------------------------------
-- Q19: 同僚の褒めに対する反応 / 正答 option 1
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n鈴木さん、今日のプレゼン、本当に素晴らしかったですよ。お客様の反応もとても良くて、さすがでした。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 19
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'ありがとうございます。チームのサポートがあってこそです。今後ともよろしくお願いします。'
    WHEN 2 THEN 'そんなことはありません。まだまだ未熟です。'
    WHEN 3 THEN '当然です。私が一番頑張ったのですから。'
    WHEN 4 THEN 'お世辞はいいので、次の仕事を進めましょう。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 19
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 19
  AND qo.question_id = qq.id AND qo.sort_order = 1;

-- -------------------------------------------------------
-- Q20: 会議開始の挨拶への返答 / 正答 option 4
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\nそれでは定刻になりましたので、第3四半期業績報告会議を始めさせていただきます。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 20
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '少々お待ちください。まだ一名参加されていない方がいらっしゃいます。'
    WHEN 2 THEN '急に始めるのは困ります。事前にご連絡いただけないでしょうか。'
    WHEN 3 THEN '私は本日欠席とさせていただきます。どうぞよろしくお願いいたします。'
    WHEN 4 THEN 'かしこまりました。それではよろしくお願いいたします。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 20
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 20
  AND qo.question_id = qq.id AND qo.sort_order = 4;

-- -------------------------------------------------------
-- Q21: 納期延長要請への対応 / 正答 option 2
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n田口様、現在ご依頼いただいているシステム開発についてですが、追加いただいた機能要件を反映しますと、当初の納期では対応が困難な状況でございます。2週間の延長をご検討いただけますでしょうか。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 21
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '2週間の延長は絶対に認められません。契約通りに納品してください。'
    WHEN 2 THEN '承知しました。社内でスケジュールを確認の上、改めてご回答いたします。'
    WHEN 3 THEN '品質を下げてもいいので、期日だけは守ってください。'
    WHEN 4 THEN 'それでは追加の機能要件はすべてキャンセルにします。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 21
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 21
  AND qo.question_id = qq.id AND qo.sort_order = 2;

-- -------------------------------------------------------
-- Q22: 電話応対（担当者不在）/ 正答 option 3
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\nこちら山田物産の田中と申します。営業部の佐藤さんをお願いできますでしょうか。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 22
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '佐藤は今席にいません。また後でかけなおしてください。'
    WHEN 2 THEN '佐藤に用があるなら直接携帯にご連絡いただけますか。'
    WHEN 3 THEN '佐藤は只今外出しております。よろしければご用件をお伺いして、折り返しご連絡いたします。'
    WHEN 4 THEN '佐藤はただいま休憩中でございます。少々お待ちいただけますか。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 22
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 22
  AND qo.question_id = qq.id AND qo.sort_order = 3;

-- -------------------------------------------------------
-- Q23: 昼食の誘いを丁寧に断る / 正答 option 1
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n佐藤さん、今日のお昼ご一緒しませんか。先日オープンしたイタリアンに行こうと思っているんですが。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 23
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'ありがとうございます。今日はお弁当を持参してきたので、またの機会にぜひ誘ってください。'
    WHEN 2 THEN 'イタリアンは苦手なので結構です。'
    WHEN 3 THEN 'お昼は一人で食べる主義なので遠慮します。'
    WHEN 4 THEN 'そのお店は高そうですね。どこにあるんですか。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 23
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 23
  AND qo.question_id = qq.id AND qo.sort_order = 1;

-- -------------------------------------------------------
-- Q24: 資料の共有依頼を引き受ける / 正答 option 4
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n木村さん、先ほどの会議でお使いになった市場分析の資料をメールで共有していただくことは可能でしょうか。上司への報告資料に使いたいのですが。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 24
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '社外秘なのでお渡しするのは難しいです。'
    WHEN 2 THEN '会議中にメモを取っておけばよかったのではないですか。'
    WHEN 3 THEN 'その資料はもう破棄してしまいました。'
    WHEN 4 THEN 'かしこまりました。後ほどメールでお送りします。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 24
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 24
  AND qo.question_id = qq.id AND qo.sort_order = 4;

-- -------------------------------------------------------
-- Q25: 上司からの指示を受け入れる / 正答 option 2
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n加藤さん、今日の17時までに先月の顧客データの集計をお願いできますか。急ぎで必要なので。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 25
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '17時は難しいです。明日ではいけませんか。'
    WHEN 2 THEN '承知しました。17時までに対応いたします。ご不明な点がございましたらご確認ください。'
    WHEN 3 THEN 'データ量が多いので他の方にお願いできますか。'
    WHEN 4 THEN 'なぜ私がやらなければならないのですか。今別の作業があります。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 25
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 25
  AND qo.question_id = qq.id AND qo.sort_order = 2;

-- -------------------------------------------------------
-- Q26: 来客のお礼への返答 / 正答 option 1
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n本日はお忙しい中、わざわざお越しいただきまして、誠にありがとうございました。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 26
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN 'こちらこそ、貴重なお時間をいただきありがとうございました。またよろしくお願いいたします。'
    WHEN 2 THEN 'いいえ、こちらこそご迷惑をおかけいたしました。'
    WHEN 3 THEN '次回もぜひお越しください。いつでも歓迎いたします。'
    WHEN 4 THEN 'お疲れさまでした。さようなら。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 26
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 26
  AND qo.question_id = qq.id AND qo.sort_order = 1;

-- -------------------------------------------------------
-- Q27: 上司からのサブリーダー指示を受け入れる / 正答 option 3
-- -------------------------------------------------------
UPDATE quiz_questions qq
SET question_text = E'次の文を聴いて、最も適切な応答を選びなさい。\n\n中村さん、来月から新規プロジェクトのサブリーダーを担当していただけますか。大変かもしれませんが、あなたの成長につながると思って。'
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 27
  AND qq.id = msq.question_id;

UPDATE quiz_question_options qo
SET option_text = CASE qo.sort_order
    WHEN 1 THEN '私には向いていないと思います。他の方にお願いできますか。'
    WHEN 2 THEN '追加の手当はいただけますか。それによって判断します。'
    WHEN 3 THEN 'ありがとうございます。精一杯取り組みます。ご指導のほどよろしくお願いいたします。'
    WHEN 4 THEN '大変なのは嫌なので、辞退させていただきます。'
  END,
  is_correct = false
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 27
  AND qo.question_id = qq.id;

UPDATE quiz_question_options qo
SET is_correct = true
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'choukai' AND msq.sort_order = 27
  AND qo.question_id = qq.id AND qo.sort_order = 3;

COMMIT;
