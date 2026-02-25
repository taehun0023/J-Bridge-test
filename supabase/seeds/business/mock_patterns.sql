-- ============================================
-- 文章パターンテスト Seed Data
-- 3 quizzes × 10 questions = 30 questions, 120 options
-- quiz_type: 'sentence_pattern', is_assessment: false
-- Set 1: 丁寧語・敬語パターン (Polite/Keigo patterns)
-- Set 2: 報告・文書パターン (Report/Document patterns)
-- Set 3: メール・連絡パターン (Email/Communication patterns)
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing mock pattern data
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'b2000001-0000-0000-0000-000000000001',
    'b2000002-0000-0000-0000-000000000002',
    'b2000003-0000-0000-0000-000000000003'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'b2000001-0000-0000-0000-000000000001',
    'b2000002-0000-0000-0000-000000000002',
    'b2000003-0000-0000-0000-000000000003'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
);
DELETE FROM quizzes WHERE id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
);

-- ============================================
-- Quiz 1: 文章パターンテスト 第1回
-- 丁寧語・敬語パターン (Polite/Keigo patterns)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b2000001-0000-0000-0000-000000000001';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, '文章パターンテスト 第1回', 'sentence_pattern', 70, 10, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司にミーティングの日程変更をお願いする際、最も適切な表現はどれですか？',
    '「変更させていただけますでしょうか」は、「させていただく」（謙譲語）＋「でしょうか」（丁寧な疑問）を組み合わせた最も丁寧な依頼表現です。上司や顧客への依頼に適しています。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ミーティングの日程を変更させていただけますでしょうか。', TRUE, 1),
    (gen_random_uuid(), q_id, 'ミーティングの日程を変更してください。', FALSE, 2),
    (gen_random_uuid(), q_id, 'ミーティングの日程を変えたいんですが。', FALSE, 3),
    (gen_random_uuid(), q_id, 'ミーティングの日程、変更でいいですか。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに資料を確認してもらいたい場合、最も適切な敬語表現はどれですか？',
    '「ご確認いただけますでしょうか」は、「ご〜いただく」（謙譲語）＋「でしょうか」（丁寧な疑問）の組み合わせで、顧客への依頼に最適な敬語表現です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料を確認してもらえますか。', FALSE, 1),
    (gen_random_uuid(), q_id, '資料をご確認いただけますでしょうか。', TRUE, 2),
    (gen_random_uuid(), q_id, '資料を確認しておいてください。', FALSE, 3),
    (gen_random_uuid(), q_id, '資料、見てくれませんか。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '自分の意見を会議で述べる際、最も適切な丁寧表現はどれですか？',
    '「〜と考えております」は、「考えている」の謙譲語＋丁寧語で、会議など公式な場で自分の意見を述べるのに適した表現です。断定を避け、柔らかい印象を与えます。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私はこうだと思います。', FALSE, 1),
    (gen_random_uuid(), q_id, '私の意見ですが、〜と考えております。', TRUE, 2),
    (gen_random_uuid(), q_id, '私は〜だと思うんですけど。', FALSE, 3),
    (gen_random_uuid(), q_id, '〜と考えるのが当然です。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に自社のサービスを説明する際、「やります」の最も適切な敬語表現はどれですか？',
    '「させていただきます」は謙譲語で、自分の行為をへりくだって表現します。ビジネスシーンで相手に対して自分の行動を説明する際に最も適切です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弊社で対応させていただきます。', TRUE, 1),
    (gen_random_uuid(), q_id, '弊社でやります。', FALSE, 2),
    (gen_random_uuid(), q_id, '弊社で対応してあげます。', FALSE, 3),
    (gen_random_uuid(), q_id, '弊社がやることにします。', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様からの問い合わせに対して「知りません」と伝えたい場合、最も適切な表現はどれですか？',
    '「存じ上げておりません」は「知らない」の最も丁寧な謙譲語表現です。「存じる」（知るの謙譲語）＋「上げる」（さらに丁寧に）＋「おりません」（丁寧な否定）の構成です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '知りません。', FALSE, 1),
    (gen_random_uuid(), q_id, '分かりません。', FALSE, 2),
    (gen_random_uuid(), q_id, '存じ上げておりません。', TRUE, 3),
    (gen_random_uuid(), q_id, '知らないです。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に「少し待ってほしい」と伝える場合、最も適切な表現はどれですか？',
    '「少々お待ちいただけますでしょうか」は、「お〜いただく」（謙譲語）＋「でしょうか」（丁寧な疑問）の組み合わせで、上司やクライアントに待機を依頼する際に最も丁寧な表現です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっと待ってください。', FALSE, 1),
    (gen_random_uuid(), q_id, '少し待ってもらえますか。', FALSE, 2),
    (gen_random_uuid(), q_id, '少々お待ちください。', FALSE, 3),
    (gen_random_uuid(), q_id, '少々お待ちいただけますでしょうか。', TRUE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに「了解しました」と伝える場合、最も適切なビジネス敬語はどれですか？',
    '「かしこまりました」は、了解・承知を表す最も丁寧な謙譲語です。クライアントや目上の人に対して使用します。「承知いたしました」も丁寧ですが、「かしこまりました」がより格式高い表現です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '了解しました。', FALSE, 1),
    (gen_random_uuid(), q_id, 'かしこまりました。', TRUE, 2),
    (gen_random_uuid(), q_id, 'わかりました。', FALSE, 3),
    (gen_random_uuid(), q_id, 'オーケーです。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先の部長に「会いたい」と伝える場合、最も適切な敬語表現はどれですか？',
    '「お目にかかりたく存じます」は、「会う」の謙譲語「お目にかかる」＋「思う」の謙譲語「存じる」を組み合わせた最も丁寧な表現です。取引先の上位者への面談依頼に適しています。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会いたいと思います。', FALSE, 1),
    (gen_random_uuid(), q_id, 'お会いしたいです。', FALSE, 2),
    (gen_random_uuid(), q_id, 'お目にかかりたく存じます。', TRUE, 3),
    (gen_random_uuid(), q_id, '会えればいいんですが。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトマネージャーに作業の進め方について許可を求める際、最も適切な表現はどれですか？',
    '「〜してもよろしいでしょうか」は、許可を求める際の最も丁寧なビジネス表現です。「よろしいでしょうか」で相手の判断を仰ぐ形になり、上司への確認に適しています。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この方法で進めていいですか。', FALSE, 1),
    (gen_random_uuid(), q_id, 'この方法で進めてもよろしいでしょうか。', TRUE, 2),
    (gen_random_uuid(), q_id, 'この方法で進めます。', FALSE, 3),
    (gen_random_uuid(), q_id, 'この方法でやっちゃっていいですか。', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様に自社の担当者を紹介する際、「田中が説明します」の最も適切な敬語表現はどれですか？',
    '社外の人に自社の人間の行動を説明する際は、自社側を謙譲語で表現します。「ご説明申し上げます」は「説明する」の二重謙譲語で、最も丁寧な表現です。社内の人には敬称を付けないのもポイントです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中さんが説明します。', FALSE, 1),
    (gen_random_uuid(), q_id, '田中がご説明いたします。', FALSE, 2),
    (gen_random_uuid(), q_id, '田中がご説明申し上げます。', TRUE, 3),
    (gen_random_uuid(), q_id, '田中が説明してくれます。', FALSE, 4);

END $$;

-- ============================================
-- Quiz 2: 文章パターンテスト 第2回
-- 報告・文書パターン (Report/Document patterns)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b2000002-0000-0000-0000-000000000002';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, '文章パターンテスト 第2回', 'sentence_pattern', 70, 10, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'システム障害の発生を上司に報告する際、最も適切な報告文の書き出しはどれですか？',
    '「〜について報告いたします」は、報告の書き出しとして最も標準的なビジネス表現です。「報告いたします」は「報告する」の謙譲語＋丁寧語で、上司への報告に適しています。障害報告は迅速かつ簡潔に行うことが重要です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本番環境のシステム障害について報告いたします。', TRUE, 1),
    (gen_random_uuid(), q_id, '本番環境でシステム障害が起きました。', FALSE, 2),
    (gen_random_uuid(), q_id, 'システム障害の報告です。', FALSE, 3),
    (gen_random_uuid(), q_id, 'システム障害があったのでお知らせします。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトの進捗報告書で、完了した作業を記述する際の最も適切な文書表現はどれですか？',
    '「〜が完了し、現在〜に着手しております」は進捗報告の標準パターンです。完了した作業と現在取り組み中の作業を一文で簡潔に伝えられます。「おります」は「いる」の謙譲語で、報告書に適した丁寧さです。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API設計が終わって、今テストを書いています。', FALSE, 1),
    (gen_random_uuid(), q_id, 'API設計が完了し、現在結合テストに着手しております。', TRUE, 2),
    (gen_random_uuid(), q_id, 'API設計は終わりました。テストはこれからです。', FALSE, 3),
    (gen_random_uuid(), q_id, 'API設計、完了。結合テスト、着手中。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '納期の遅延が予想される場合、上司への報告で最も適切な表現はどれですか？',
    '「〜の可能性がございます」は、問題を報告しつつ断定を避ける丁寧な表現です。遅延リスクを早期に報告する「報連相」の文化に沿った表現で、原因と対策も併せて報告することが重要です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '納期に間に合いません。', FALSE, 1),
    (gen_random_uuid(), q_id, '納期が遅れるかもしれません。', FALSE, 2),
    (gen_random_uuid(), q_id, '納期に遅延が生じる可能性がございます。原因と対策をご報告いたします。', TRUE, 3),
    (gen_random_uuid(), q_id, '納期、ちょっと厳しいです。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '設計書の「目的」セクションで、システムの目的を記述する場合、最も適切な文書表現はどれですか？',
    '設計書などの技術文書では「だ・である」調（常体）を使用するのが一般的です。「〜を目的として設計されており」は設計書の目的記述の定型パターンです。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本システムは社内の勤怠管理を目的として設計されており、出退勤記録の機能を提供する。', TRUE, 1),
    (gen_random_uuid(), q_id, '本システムは社内の勤怠管理のために作りました。出退勤記録ができます。', FALSE, 2),
    (gen_random_uuid(), q_id, '社内の勤怠管理システムです。出退勤記録機能があります。', FALSE, 3),
    (gen_random_uuid(), q_id, '勤怠管理をするシステムを作ることになっています。', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'テスト結果を報告書にまとめる際、最も適切な結果記述の表現はどれですか？',
    '「〜件中、〜件が合格、〜件が不合格となりました」はテスト結果報告の標準パターンです。全体件数、合格件数、不合格件数を明確に数値で示すことで、正確な状況把握が可能になります。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストはだいたい合格でした。', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト項目150件中、145件が合格、5件が不合格となりました。', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストの結果、ほぼ問題ありませんでした。', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト145件OK、5件NGです。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '障害報告書で、障害の発生から対応完了までを記述する際、最も適切な文書表現はどれですか？',
    '障害報告書では、発生時刻、対象システム、障害内容、原因、対応内容を時系列で簡潔に記述します。「〜にて障害が発生。原因は〜であり、〜にて対応完了。」が標準的なパターンです。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3月10日14時に認証サーバーが落ちました。DBのせいでした。直しました。', FALSE, 1),
    (gen_random_uuid(), q_id, '3月10日14時35分、認証システムにてDB接続障害が発生。原因はコネクションプールの枯渇であり、最大接続数の調整にて対応完了。', TRUE, 2),
    (gen_random_uuid(), q_id, '認証サーバーに問題が起きて、DB接続が原因だったので修正しました。', FALSE, 3),
    (gen_random_uuid(), q_id, '認証システム障害あり。DB接続エラー。対応済み。', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の議事録で、決定事項と次回アクションを記述する際の最も適切な表現はどれですか？',
    '議事録では「決定事項」と「次回アクション」を明確に分けて記載することが重要です。「本日の決定事項は以下の通りです」に続けて箇条書きにし、「次回までに〜を対応いたします」で担当と期限を明記します。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今日決まったこと：OAuth2.0にする。次はAPI設計書を書く。', FALSE, 1),
    (gen_random_uuid(), q_id, '本日の決定事項は以下の通りです。①認証方式はOAuth2.0を採用。次回までにAPI設計書のドラフトを作成いたします（担当：田中、期限：3/15）。', TRUE, 2),
    (gen_random_uuid(), q_id, 'OAuth2.0に決まりました。API設計書はそのうち作ります。', FALSE, 3),
    (gen_random_uuid(), q_id, '決定：OAuth2.0。TODO：API設計書。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '仕様変更の申請書で、変更内容と影響範囲を記述する際の最も適切な表現はどれですか？',
    '変更申請書では「変更内容」「変更理由」「影響範囲」「対応予定日」を明確に記載する必要があります。それぞれを項目立てて簡潔に記述するのが標準的なフォーマットです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ユーザーテーブルにカラムを追加したいです。メール通知に必要です。', FALSE, 1),
    (gen_random_uuid(), q_id, '変更内容：ユーザーテーブルにメールアドレスカラムを追加。変更理由：メール通知機能の実装に必要。影響範囲：ユーザー登録・プロフィール編集画面。対応予定日：3月20日。', TRUE, 2),
    (gen_random_uuid(), q_id, 'DBにカラム追加します。画面に影響あるかもしれません。', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブル変更の件、よろしくお願いします。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '手順書（マニュアル）で、操作手順を記述する際の最も適切な表現はどれですか？',
    '手順書では「手順1:」「手順2:」のように番号を付けて、各ステップを「〜する」の常体で簡潔に記述します。誰が読んでも同一の手順で作業できるよう、具体的かつ明確に書くことが重要です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'まずAWSにログインして、EC2を選んで、インスタンスを再起動する。', FALSE, 1),
    (gen_random_uuid(), q_id, 'AWSにログインしてください。その後EC2を選択し、再起動してください。', FALSE, 2),
    (gen_random_uuid(), q_id, '手順1: AWS管理コンソールにログインする。手順2: EC2メニューからインスタンス一覧を選択する。手順3: 対象インスタンスを選択し、「再起動」をクリックする。', TRUE, 3),
    (gen_random_uuid(), q_id, 'AWS → EC2 → インスタンス → 再起動', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'コードレビューで指摘事項を記録する際、最も適切な文書表現はどれですか？',
    '「指摘事項」「指摘理由」「修正案」の3項目を明記するのがコードレビュー記録の標準パターンです。何が問題で、なぜ問題で、どう直すべきかを簡潔に記述します。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'エラーハンドリングがないので追加してください。', FALSE, 1),
    (gen_random_uuid(), q_id, '指摘事項：エラーハンドリングが未実装。指摘理由：API呼び出し失敗時にアプリがクラッシュする可能性がある。修正案：try-catchブロックで例外を捕捉し、ユーザーにエラーメッセージを表示する。', TRUE, 2),
    (gen_random_uuid(), q_id, 'ここ、エラー処理がないですね。直した方がいいと思います。', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーハンドリング未実装。要修正。', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: 文章パターンテスト 第3回
-- メール・連絡パターン (Email/Communication patterns)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b2000003-0000-0000-0000-000000000003';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, '文章パターンテスト 第3回', 'sentence_pattern', 70, 10, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に初めてメールを送る際、最も適切な書き出しはどれですか？',
    '「突然のご連絡失礼いたします。○○会社の△△と申します。」は、初めての相手にメールを送る際の定型パターンです。まず失礼を詫び、会社名と名前を名乗ることがビジネスメールの基本マナーです。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '突然のご連絡失礼いたします。株式会社ABCシステムの金と申します。', TRUE, 1),
    (gen_random_uuid(), q_id, 'はじめまして。ABCシステムの金です。', FALSE, 2),
    (gen_random_uuid(), q_id, 'お世話になっております。ABCシステムの金です。', FALSE, 3),
    (gen_random_uuid(), q_id, 'こんにちは。ABCシステムの金と言います。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトの進捗をクライアントにメールで報告する際、最も適切な書き出しはどれですか？',
    '「いつもお世話になっております」は既に取引のある相手へのメールの定型冒頭挨拶です。続けて「〜の進捗状況につきまして、ご報告いたします」が報告メールの標準パターンです。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様です。プロジェクトの進捗を報告します。', FALSE, 1),
    (gen_random_uuid(), q_id, 'いつもお世話になっております。受注管理システムプロジェクトの進捗状況につきまして、ご報告いたします。', TRUE, 2),
    (gen_random_uuid(), q_id, 'プロジェクトの進捗報告です。確認お願いします。', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトの進み具合をお知らせします。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにシステム障害の謝罪メールを送る際、最も適切な書き出しはどれですか？',
    '「この度は〜の件でご迷惑をおかけし、誠に申し訳ございません」は謝罪メールの定型パターンです。問題の内容を明示し、「誠に申し訳ございません」で深い謝罪を表します。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システム障害でご迷惑をおかけしてすみません。', FALSE, 1),
    (gen_random_uuid(), q_id, 'この度はシステム障害の件でご迷惑をおかけし、誠に申し訳ございません。', TRUE, 2),
    (gen_random_uuid(), q_id, 'システム障害が起きてしまい、申し訳ないです。', FALSE, 3),
    (gen_random_uuid(), q_id, 'システム障害について、お詫びします。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせの日程調整メールで、候補日を提示する際の最も適切な表現はどれですか？',
    '「下記日程でご都合のよい日時をお知らせいただけますでしょうか」は日程調整メールの定型パターンです。候補日を3つ程度提示し、相手の都合を伺う形が標準的です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '以下の日程で空いている日を教えてください。', FALSE, 1),
    (gen_random_uuid(), q_id, '下記日程でご都合のよい日時をお知らせいただけますでしょうか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜', TRUE, 2),
    (gen_random_uuid(), q_id, 'いつが都合いいですか？3つの候補を出しました。', FALSE, 3),
    (gen_random_uuid(), q_id, '打ち合わせしたいので、日程を決めましょう。', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ミーティング後のお礼メールで、最も適切な書き出しはどれですか？',
    '「先日はお忙しい中、お時間をいただきありがとうございました」はミーティング後のお礼メールの定型パターンです。相手の時間への感謝を表し、会議内容の要約と後続アクションを記載するのが一般的です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日はお忙しい中、お時間をいただきありがとうございました。', TRUE, 1),
    (gen_random_uuid(), q_id, '先日のミーティング、ありがとうございました。', FALSE, 2),
    (gen_random_uuid(), q_id, '先日はお疲れ様でした。', FALSE, 3),
    (gen_random_uuid(), q_id, 'この前の会議、助かりました。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '以前送った設計書の確認を催促するメールを送る際、最も適切な表現はどれですか？',
    '「先日お送りした〜について、ご確認いただけましたでしょうか」は催促メールの定型パターンです。直接的な催促を避け、柔らかく確認の有無を尋ねる表現で、相手のプレッシャーを和らげます。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '設計書の確認はまだですか？', FALSE, 1),
    (gen_random_uuid(), q_id, '設計書を確認してください。早めにお願いします。', FALSE, 2),
    (gen_random_uuid(), q_id, '先日お送りした設計書について、ご確認いただけましたでしょうか。修正点がございましたら、今週中にご連絡いただけますと幸いです。', TRUE, 3),
    (gen_random_uuid(), q_id, '設計書、見ましたか？コメントお待ちしています。', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ビジネスメールの末尾に添える定型表現として、最も適切なものはどれですか？',
    '「ご不明な点がございましたら、お気軽にお問い合わせください」はビジネスメールの締めくくりの定型表現です。追加の質問や問い合わせを歓迎する姿勢を示し、ほぼすべてのビジネスメールの末尾に使用できます。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '何かあれば連絡ください。', FALSE, 1),
    (gen_random_uuid(), q_id, '質問があったら聞いてください。', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご不明な点がございましたら、お気軽にお問い合わせください。', TRUE, 3),
    (gen_random_uuid(), q_id, '分からないことがあればメールしてください。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に有給休暇の取得をメールで連絡する際、最も適切な表現はどれですか？',
    '「〜を取得させていただきたく、ご連絡いたします」は休暇申請メールの定型パターンです。「させていただく」で許可を求めるニュアンスを含み、引き継ぎ状況や緊急連絡先も併記するのがマナーです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3月15日に有給を取ります。', FALSE, 1),
    (gen_random_uuid(), q_id, '3月15日に有給休暇を取得させていただきたく、ご連絡いたします。当日の対応事項は佐藤さんに引き継ぎ済みです。', TRUE, 2),
    (gen_random_uuid(), q_id, '3月15日、お休みさせてください。', FALSE, 3),
    (gen_random_uuid(), q_id, '3月15日は有給を使う予定です。よろしくお願いします。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'チームメンバーに情報共有のメールを送る際、最も適切な書き出しはどれですか？',
    '「お疲れ様です」は社内メールの定型冒頭挨拶です。続けて「〜に関する情報を共有いたします。ご確認のほどよろしくお願いいたします」が情報共有メールの標準パターンです。「ご確認のほど」は相手に確認を促す丁寧な表現です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フレームワークのアップデート情報です。確認してください。', FALSE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です。フレームワークのセキュリティアップデートに関する情報を共有いたします。ご確認のほどよろしくお願いいたします。', TRUE, 2),
    (gen_random_uuid(), q_id, 'フレームワークのセキュリティアップデートがあるのでお知らせします。', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティアップデートの共有です。', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにメールで業務を依頼する際、最も適切な表現はどれですか？',
    '「お忙しいところ恐れ入りますが」は依頼メールの定型前置き表現で、相手の忙しさへの配慮を示します。続けて「ご確認のほどよろしくお願いいたします」で確認を依頼する形が、最も丁寧なビジネスメールの依頼パターンです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '添付資料を確認してください。', FALSE, 1),
    (gen_random_uuid(), q_id, '添付資料のご確認をお願いします。', FALSE, 2),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、添付資料のご確認のほどよろしくお願いいたします。', TRUE, 3),
    (gen_random_uuid(), q_id, '添付資料、見ていただけますか。', FALSE, 4);

END $$;

COMMIT;
