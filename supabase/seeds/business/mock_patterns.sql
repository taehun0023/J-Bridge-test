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
    (gen_random_uuid(), q_id, 'ミーティングの日程を変更してくださいますでしょうか。', FALSE, 2),
    (gen_random_uuid(), q_id, 'ミーティングの日程を変更のほうさせていただきます。', FALSE, 3),
    (gen_random_uuid(), q_id, 'ミーティングの日程を変更させてもらってよろしいですか。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに資料を確認してもらいたい場合、最も適切な敬語表現はどれですか？',
    '「ご確認いただけますでしょうか」は、「ご〜いただく」（謙譲語）＋「でしょうか」（丁寧な疑問）の組み合わせで、顧客への依頼に最適な敬語表現です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料をご確認してくださいますでしょうか。', FALSE, 1),
    (gen_random_uuid(), q_id, '資料をご確認いただけますでしょうか。', TRUE, 2),
    (gen_random_uuid(), q_id, '資料をお確認いただけますようお願いします。', FALSE, 3),
    (gen_random_uuid(), q_id, '資料のご確認をされていただけますか。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '自分の意見を会議で述べる際、最も適切な丁寧表現はどれですか？',
    '「〜と考えております」は、「考えている」の謙譲語＋丁寧語で、会議など公式な場で自分の意見を述べるのに適した表現です。断定を避け、柔らかい印象を与えます。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私の考えですが、〜とお考えしております。', FALSE, 1),
    (gen_random_uuid(), q_id, '私の意見ですが、〜と考えております。', TRUE, 2),
    (gen_random_uuid(), q_id, '私の所見ですが、〜と存じ上げております。', FALSE, 3),
    (gen_random_uuid(), q_id, '私の見解ですが、〜とお思いいたします。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に自社のサービスを説明する際、「やります」の最も適切な敬語表現はどれですか？',
    '「させていただきます」は謙譲語で、自分の行為をへりくだって表現します。ビジネスシーンで相手に対して自分の行動を説明する際に最も適切です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弊社で対応させていただきます。', TRUE, 1),
    (gen_random_uuid(), q_id, '弊社にて対応してさしあげます。', FALSE, 2),
    (gen_random_uuid(), q_id, '弊社で対応のほういたしますね。', FALSE, 3),
    (gen_random_uuid(), q_id, '弊社が対応をさせてもらいます。', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様からの問い合わせに対して「知りません」と伝えたい場合、最も適切な表現はどれですか？',
    '「存じ上げておりません」は「知らない」の最も丁寧な謙譲語表現です。「存じる」（知るの謙譲語）＋「上げる」（さらに丁寧に）＋「おりません」（丁寧な否定）の構成です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お知りしておりませんでした。', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご存じしかねております。', FALSE, 2),
    (gen_random_uuid(), q_id, '存じ上げておりません。', TRUE, 3),
    (gen_random_uuid(), q_id, '存じておられませんでした。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に「少し待ってほしい」と伝える場合、最も適切な表現はどれですか？',
    '「少々お待ちいただけますでしょうか」は、「お〜いただく」（謙譲語）＋「でしょうか」（丁寧な疑問）の組み合わせで、上司やクライアントに待機を依頼する際に最も丁寧な表現です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '少々お待ちになられますでしょうか。', FALSE, 1),
    (gen_random_uuid(), q_id, '少々お待ちしていただけますでしょうか。', FALSE, 2),
    (gen_random_uuid(), q_id, '少々お待ちくださいますでしょうか。', FALSE, 3),
    (gen_random_uuid(), q_id, '少々お待ちいただけますでしょうか。', TRUE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに「了解しました」と伝える場合、最も適切なビジネス敬語はどれですか？',
    '「かしこまりました」は、了解・承知を表す最も丁寧な謙譲語です。クライアントや目上の人に対して使用します。「承知いたしました」も丁寧ですが、「かしこまりました」がより格式高い表現です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '了解いたしました。', FALSE, 1),
    (gen_random_uuid(), q_id, 'かしこまりました。', TRUE, 2),
    (gen_random_uuid(), q_id, '承知させていただきます。', FALSE, 3),
    (gen_random_uuid(), q_id, 'お受けいたしました。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先の部長に「会いたい」と伝える場合、最も適切な敬語表現はどれですか？',
    '「お目にかかりたく存じます」は、「会う」の謙譲語「お目にかかる」＋「思う」の謙譲語「存じる」を組み合わせた最も丁寧な表現です。取引先の上位者への面談依頼に適しています。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご面会をさせていただきたく存じます。', FALSE, 1),
    (gen_random_uuid(), q_id, 'お会いさせていただきたく思います。', FALSE, 2),
    (gen_random_uuid(), q_id, 'お目にかかりたく存じます。', TRUE, 3),
    (gen_random_uuid(), q_id, 'お目にかからせていただきたいです。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトマネージャーに作業の進め方について許可を求める際、最も適切な表現はどれですか？',
    '「〜してもよろしいでしょうか」は、許可を求める際の最も丁寧なビジネス表現です。「よろしいでしょうか」で相手の判断を仰ぐ形になり、上司への確認に適しています。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この方法で進めさせてもらってよろしいですか。', FALSE, 1),
    (gen_random_uuid(), q_id, 'この方法で進めてもよろしいでしょうか。', TRUE, 2),
    (gen_random_uuid(), q_id, 'この方法で進めさせていただいてよろしいですか。', FALSE, 3),
    (gen_random_uuid(), q_id, 'この方法で進行のほうしてもよろしいですか。', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様に自社の担当者を紹介する際、「田中が説明します」の最も適切な敬語表現はどれですか？',
    '社外の人に自社の人間の行動を説明する際は、自社側を謙譲語で表現します。「ご説明申し上げます」は「説明する」の二重謙譲語で、最も丁寧な表現です。社内の人には敬称を付けないのもポイントです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中がご説明させていただきます。', FALSE, 1),
    (gen_random_uuid(), q_id, '田中がご説明いたします。', FALSE, 2),
    (gen_random_uuid(), q_id, '田中がご説明申し上げます。', TRUE, 3),
    (gen_random_uuid(), q_id, '田中がお説明をして差し上げます。', FALSE, 4);

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
    (gen_random_uuid(), q_id, '本番環境のシステム障害についてご報告されます。', FALSE, 2),
    (gen_random_uuid(), q_id, '本番環境のシステム障害をお報告申し上げます。', FALSE, 3),
    (gen_random_uuid(), q_id, '本番環境のシステム障害について報告してあげます。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトの進捗報告書で、完了した作業を記述する際の最も適切な文書表現はどれですか？',
    '「〜が完了し、現在〜に着手しております」は進捗報告の標準パターンです。完了した作業と現在取り組み中の作業を一文で簡潔に伝えられます。「おります」は「いる」の謙譲語で、報告書に適した丁寧さです。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API設計を完了させていただき、結合テストを着手いたします。', FALSE, 1),
    (gen_random_uuid(), q_id, 'API設計が完了し、現在結合テストに着手しております。', TRUE, 2),
    (gen_random_uuid(), q_id, 'API設計が完了されまして、結合テストに着手されております。', FALSE, 3),
    (gen_random_uuid(), q_id, 'API設計のほうが完了となり、結合テストを着手中でございます。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '納期の遅延が予想される場合、上司への報告で最も適切な表現はどれですか？',
    '「〜の可能性がございます」は、問題を報告しつつ断定を避ける丁寧な表現です。遅延リスクを早期に報告する「報連相」の文化に沿った表現で、原因と対策も併せて報告することが重要です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '納期に遅延が生じさせていただく可能性がございます。ご報告いたします。', FALSE, 1),
    (gen_random_uuid(), q_id, '納期に遅延が生じるかもしれません。原因と対策をお報告させていただきます。', FALSE, 2),
    (gen_random_uuid(), q_id, '納期に遅延が生じる可能性がございます。原因と対策をご報告いたします。', TRUE, 3),
    (gen_random_uuid(), q_id, '納期に遅延が生じる見込みでございます。原因と対策を報告してあげます。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '設計書の「目的」セクションで、システムの目的を記述する場合、最も適切な文書表現はどれですか？',
    '設計書などの技術文書では「だ・である」調（常体）を使用するのが一般的です。「〜を目的として設計されており」は設計書の目的記述の定型パターンです。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本システムは社内の勤怠管理を目的として設計されており、出退勤記録の機能を提供する。', TRUE, 1),
    (gen_random_uuid(), q_id, '本システムは社内の勤怠管理を目的として設計いたしましたので、出退勤記録の機能を提供します。', FALSE, 2),
    (gen_random_uuid(), q_id, '本システムは社内の勤怠管理を目的としており、出退勤記録の機能を提供させていただきます。', FALSE, 3),
    (gen_random_uuid(), q_id, '本システムは社内における勤怠管理を目的に作成されていて、出退勤記録機能があります。', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'テスト結果を報告書にまとめる際、最も適切な結果記述の表現はどれですか？',
    '「〜件中、〜件が合格、〜件が不合格となりました」はテスト結果報告の標準パターンです。全体件数、合格件数、不合格件数を明確に数値で示すことで、正確な状況把握が可能になります。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト項目150件中、おおよそ合格であり、5件ほどが不合格でした。', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト項目150件中、145件が合格、5件が不合格となりました。', TRUE, 2),
    (gen_random_uuid(), q_id, 'テスト項目150件の実施結果、145件は問題なく、5件は不合格です。', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト項目150件を実施させていただき、145件合格で5件が不合格です。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '業務トラブルの報告書で、トラブルの発生から対応完了までを記述する際、最も適切な文書表現はどれですか？',
    'トラブル報告書では、発生時刻、対象業務、内容、原因、対応内容を時系列で簡潔に記述します。「〜にて〜が発生。原因は〜であり、〜にて対応完了。」が標準的なパターンです。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3月10日14時35分、受注処理において入力データの不備が発生いたしました。注文番号の重複が原因で、番号の再採番にて対応させていただきました。', FALSE, 1),
    (gen_random_uuid(), q_id, '3月10日14時35分、受注処理にて入力データの不備が発生。原因は注文番号の重複であり、番号の再採番にて対応完了。', TRUE, 2),
    (gen_random_uuid(), q_id, '3月10日の14時35分頃に受注処理の入力データに不備が発生されました。注文番号の重複が原因となり、番号を再採番して対応しました。', FALSE, 3),
    (gen_random_uuid(), q_id, '3月10日14時35分、受注処理で入力データの不備が起きてしまいました。注文番号の重複が原因でございまして、番号の再採番にて対応済みです。', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の議事録で、決定事項と次回アクションを記述する際の最も適切な表現はどれですか？',
    '議事録では「決定事項」と「次回アクション」を明確に分けて記載することが重要です。「本日の決定事項は以下の通りです」に続けて箇条書きにし、「次回までに〜を対応いたします」で担当と期限を明記します。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の決定事項をご報告させていただきます。①認証方式はOAuth2.0に決定されました。次回までにAPI設計書のドラフトを作成してあげます（田中、3/15）。', FALSE, 1),
    (gen_random_uuid(), q_id, '本日の決定事項は以下の通りです。①認証方式はOAuth2.0を採用。次回までにAPI設計書のドラフトを作成いたします（担当：田中、期限：3/15）。', TRUE, 2),
    (gen_random_uuid(), q_id, '本日の決定事項は以下となります。①認証方式はOAuth2.0を採用させていただきます。次回までにAPI設計書のドラフトを作成します（担当：田中、3/15）。', FALSE, 3),
    (gen_random_uuid(), q_id, '本日決定されました事項は以下でございます。①認証方式はOAuth2.0になります。次回までにAPI設計書のドラフトを作成する予定です（田中、期限3/15）。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '業務変更の申請書で、変更内容と影響範囲を記述する際の最も適切な表現はどれですか？',
    '変更申請書では「変更内容」「変更理由」「影響範囲」「対応予定日」を明確に記載する必要があります。それぞれを項目立てて簡潔に記述するのが標準的なフォーマットです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更内容：出張申請書に承認欄を追加させていただきます。理由：承認フローの明確化に必要でございます。影響範囲：出張申請等。対応日：3月20日。', FALSE, 1),
    (gen_random_uuid(), q_id, '変更内容：出張申請書に承認欄を追加。変更理由：承認フローの明確化に必要。影響範囲：出張申請・経費精算フォーム。対応予定日：3月20日。', TRUE, 2),
    (gen_random_uuid(), q_id, '変更内容：出張申請書への承認欄追加。変更理由：承認フローの明確化のため。影響範囲：出張申請や経費精算フォームになります。対応日：3月20日。', FALSE, 3),
    (gen_random_uuid(), q_id, '変更をさせていただく内容：出張申請書に承認欄を追加。理由：承認フロー明確化に必要。影響：出張申請・経費精算フォーム。予定日：3月20日。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '手順書（マニュアル）で、操作手順を記述する際の最も適切な表現はどれですか？',
    '手順書では「手順1:」「手順2:」のように番号を付けて、各ステップを「〜する」の常体で簡潔に記述します。誰が読んでも同一の手順で作業できるよう、具体的かつ明確に書くことが重要です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '手順1: 社内システムにログインいたします。手順2: 勤怠管理メニューから出退勤一覧を選択いたします。手順3: 対象日を選択し、「申請」をクリックいたします。', FALSE, 1),
    (gen_random_uuid(), q_id, '手順1: 社内システムにログインしてください。手順2: 勤怠管理メニューから出退勤一覧をお選びください。手順3: 対象日を選択して、「申請」を押してください。', FALSE, 2),
    (gen_random_uuid(), q_id, '手順1: 社内システムにログインする。手順2: 勤怠管理メニューから出退勤一覧を選択する。手順3: 対象日を選択し、「申請」をクリックする。', TRUE, 3),
    (gen_random_uuid(), q_id, '手順1: 社内システムにログインされる。手順2: 勤怠管理メニューより出退勤一覧をご選択される。手順3: 対象日を選択し、「申請」をクリックされる。', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '業務監査で指摘事項を記録する際、最も適切な文書表現はどれですか？',
    '「指摘事項」「指摘理由」「改善案」の3項目を明記するのが監査記録の標準パターンです。何が問題で、なぜ問題で、どう改善すべきかを簡潔に記述します。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '指摘事項：経費精算の承認漏れがございます。理由：月末処理で未承認の申請が残り、決算に影響するかもしれません。改善案：二重チェック体制を導入させていただき、承認漏れを防止する。', FALSE, 1),
    (gen_random_uuid(), q_id, '指摘事項：経費精算の承認漏れ。指摘理由：月末処理で未承認の申請が残り、決算に影響する可能性がある。改善案：二重チェック体制を導入し、承認漏れを防止する。', TRUE, 2),
    (gen_random_uuid(), q_id, '指摘させていただく事項：経費精算の承認漏れです。理由：月末処理で未承認の申請が残った場合、決算に影響いたします。改善案：二重チェック体制を導入し、承認漏れを防止いたします。', FALSE, 3),
    (gen_random_uuid(), q_id, '指摘事項：経費精算の承認漏れについて。指摘理由：月末処理で未承認の申請が残り、決算に影響される可能性がございます。改善案：二重チェック体制にて承認漏れを防止。', FALSE, 4);

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
    (gen_random_uuid(), q_id, 'いつもお世話になっております。株式会社ABCシステムの金と申します。', FALSE, 2),
    (gen_random_uuid(), q_id, '初めてご連絡させていただきます。ABCシステムの金でございます。', FALSE, 3),
    (gen_random_uuid(), q_id, 'お忙しいところ失礼します。株式会社ABCシステムの金と言います。', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクトの進捗をクライアントにメールで報告する際、最も適切な書き出しはどれですか？',
    '「いつもお世話になっております」は既に取引のある相手へのメールの定型冒頭挨拶です。続けて「〜の進捗状況につきまして、ご報告いたします」が報告メールの標準パターンです。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でございます。受注管理システムプロジェクトの進捗状況につきまして、ご報告させていただきます。', FALSE, 1),
    (gen_random_uuid(), q_id, 'いつもお世話になっております。受注管理システムプロジェクトの進捗状況につきまして、ご報告いたします。', TRUE, 2),
    (gen_random_uuid(), q_id, 'いつもお世話になっております。受注管理システムプロジェクトの進捗状況について、報告してさしあげます。', FALSE, 3),
    (gen_random_uuid(), q_id, '平素よりお世話になっております。受注管理システムプロジェクトの進捗について、ご報告されていただきます。', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにシステム障害の謝罪メールを送る際、最も適切な書き出しはどれですか？',
    '「この度は〜の件でご迷惑をおかけし、誠に申し訳ございません」は謝罪メールの定型パターンです。問題の内容を明示し、「誠に申し訳ございません」で深い謝罪を表します。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この度はシステム障害の件でご迷惑をおかけしまして、深くお詫びいたします。', FALSE, 1),
    (gen_random_uuid(), q_id, 'この度はシステム障害の件でご迷惑をおかけし、誠に申し訳ございません。', TRUE, 2),
    (gen_random_uuid(), q_id, 'この度はシステム障害の件でご迷惑をおかけされ、大変申し訳ございません。', FALSE, 3),
    (gen_random_uuid(), q_id, 'この度のシステム障害でご不便をおかけしまして、お詫び申させていただきます。', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせの日程調整メールで、候補日を提示する際の最も適切な表現はどれですか？',
    '「下記日程でご都合のよい日時をお知らせいただけますでしょうか」は日程調整メールの定型パターンです。候補日を3つ程度提示し、相手の都合を伺う形が標準的です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '下記日程でご都合のよい日時をお知らせしてくださいませんか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜', FALSE, 1),
    (gen_random_uuid(), q_id, '下記日程でご都合のよい日時をお知らせいただけますでしょうか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜', TRUE, 2),
    (gen_random_uuid(), q_id, '下記日程でご都合をお聞かせいただけますと幸いでございます。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜', FALSE, 3),
    (gen_random_uuid(), q_id, '下記日程でお都合のよい日時をお教えいただけますでしょうか。①3月15日（月）10:00〜 ②3月16日（火）14:00〜 ③3月18日（木）15:00〜', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ミーティング後のお礼メールで、最も適切な書き出しはどれですか？',
    '「先日はお忙しい中、お時間をいただきありがとうございました」はミーティング後のお礼メールの定型パターンです。相手の時間への感謝を表し、会議内容の要約と後続アクションを記載するのが一般的です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日はお忙しい中、お時間をいただきありがとうございました。', TRUE, 1),
    (gen_random_uuid(), q_id, '先日はお忙しい中、お時間を頂戴してくださりありがとうございます。', FALSE, 2),
    (gen_random_uuid(), q_id, '先日はご多忙の中、お時間をいただけまして感謝申させていただきます。', FALSE, 3),
    (gen_random_uuid(), q_id, '先日はお忙しいところ、お時間を取らせてしまいありがとうございます。', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '以前送った設計書の確認を催促するメールを送る際、最も適切な表現はどれですか？',
    '「先日お送りした〜について、ご確認いただけましたでしょうか」は催促メールの定型パターンです。直接的な催促を避け、柔らかく確認の有無を尋ねる表現で、相手のプレッシャーを和らげます。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日お送りした設計書について、ご確認のほうされましたでしょうか。修正点がございましたら、今週中にご連絡くださいますと幸いです。', FALSE, 1),
    (gen_random_uuid(), q_id, '先日お送りいたしました設計書について、ご確認いただけましたでしょうか。修正点がありましたら、今週中にお知らせしてくださいませんか。', FALSE, 2),
    (gen_random_uuid(), q_id, '先日お送りした設計書について、ご確認いただけましたでしょうか。修正点がございましたら、今週中にご連絡いただけますと幸いです。', TRUE, 3),
    (gen_random_uuid(), q_id, '先日お送りさせていただいた設計書について、確認いただけたでしょうか。修正点がございましたら、今週中にご連絡いただけると幸いです。', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ビジネスメールの末尾に添える定型表現として、最も適切なものはどれですか？',
    '「ご不明な点がございましたら、お気軽にお問い合わせください」はビジネスメールの締めくくりの定型表現です。追加の質問や問い合わせを歓迎する姿勢を示し、ほぼすべてのビジネスメールの末尾に使用できます。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご不明な点がございましたら、お気軽にお申し付けしてください。', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご不明な点がおありでしたら、遠慮なくご質問してくださいませ。', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご不明な点がございましたら、お気軽にお問い合わせください。', TRUE, 3),
    (gen_random_uuid(), q_id, 'ご不明な点がございましたら、お気軽にご連絡のほどお願いします。', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に有給休暇の取得をメールで連絡する際、最も適切な表現はどれですか？',
    '「〜を取得させていただきたく、ご連絡いたします」は休暇申請メールの定型パターンです。「させていただく」で許可を求めるニュアンスを含み、引き継ぎ状況や緊急連絡先も併記するのがマナーです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3月15日に有給休暇を取得いたしたく、ご連絡させていただきます。当日の対応事項は佐藤さんにお引き継ぎ済みです。', FALSE, 1),
    (gen_random_uuid(), q_id, '3月15日に有給休暇を取得させていただきたく、ご連絡いたします。当日の対応事項は佐藤さんに引き継ぎ済みです。', TRUE, 2),
    (gen_random_uuid(), q_id, '3月15日に有給休暇を取らせてもらいたく存じます。当日の対応事項につきましては佐藤さんに引き継ぎしております。', FALSE, 3),
    (gen_random_uuid(), q_id, '3月15日に有給休暇をいただきたく、ご報告させていただきます。当日の対応事項を佐藤さんへ引き継ぎ済みです。', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'チームメンバーに情報共有のメールを送る際、最も適切な書き出しはどれですか？',
    '「お疲れ様です」は社内メールの定型冒頭挨拶です。続けて「〜に関する情報を共有いたします。ご確認のほどよろしくお願いいたします」が情報共有メールの標準パターンです。「ご確認のほど」は相手に確認を促す丁寧な表現です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様です。フレームワークのセキュリティアップデートに関する情報をご共有させていただきます。ご確認お願いいたします。', FALSE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です。フレームワークのセキュリティアップデートに関する情報を共有いたします。ご確認のほどよろしくお願いいたします。', TRUE, 2),
    (gen_random_uuid(), q_id, 'お疲れ様でございます。フレームワークのセキュリティアップデートの情報を共有してさしあげます。ご確認よろしくお願いします。', FALSE, 3),
    (gen_random_uuid(), q_id, 'お疲れ様です。フレームワークのセキュリティアップデートに関しまして、情報をお知らせいたします。ご確認をお願い申し上げます。', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにメールで業務を依頼する際、最も適切な表現はどれですか？',
    '「お忙しいところ恐れ入りますが」は依頼メールの定型前置き表現で、相手の忙しさへの配慮を示します。続けて「ご確認のほどよろしくお願いいたします」で確認を依頼する形が、最も丁寧なビジネスメールの依頼パターンです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お忙しいところ恐縮でございますが、添付資料をご確認してくださいますようお願いいたします。', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご多忙のところ申し訳ございませんが、添付資料のご確認をしていただけますと幸いでございます。', FALSE, 2),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、添付資料のご確認のほどよろしくお願いいたします。', TRUE, 3),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、添付資料の確認のほうをよろしくお願いさせていただきます。', FALSE, 4);

  -- Question 11: 返信が遅れたことへの謝罪
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'メールの返信が遅れた場合、最も適切なお詫びの書き出しはどれですか？',
    '「ご返信が遅くなり、大変申し訳ございません」は返信遅延の謝罪として最も丁寧な定型表現です。「大変」を付けることで深いお詫びの気持ちを表します。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご返信が遅れまして、誠に失礼させていただきました。', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご返信が遅くなり、大変申し訳ございません。', TRUE, 2),
    (gen_random_uuid(), q_id, 'お返事が遅くなられまして、大変申し訳ございません。', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご返信のほうが遅くなりまして、申し訳なく存じます。', FALSE, 4);

  -- Question 12: CCメールの宛名パターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'CCに上司を入れてメールを送る際、本文中で上司に言及する最も適切な表現はどれですか？',
    '「CCにて○○にも共有させていただいております」はCC受信者への言及として適切なビジネスパターンです。情報共有の透明性を示しつつ、丁寧に伝えています。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CCにて部長の田中にもご共有してくださっております。', FALSE, 1),
    (gen_random_uuid(), q_id, 'CCにて部長の田中にも共有のほうさせてもらっています。', FALSE, 2),
    (gen_random_uuid(), q_id, 'CCにて部長の田中にも共有させていただいております。', TRUE, 3),
    (gen_random_uuid(), q_id, 'CCにて部長の田中様にも情報を共有いたしております。', FALSE, 4);

  -- Question 13: 添付ファイルの案内パターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'メールに資料を添付して送る際、最も適切な案内表現はどれですか？',
    '「添付ファイルにてお送りいたしますので、ご査収のほどよろしくお願いいたします」は添付ファイル送付時の定型表現です。「ご査収」は「受け取って内容を確認する」という意味のビジネス用語です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '添付ファイルにてお送りさせていただきますので、ご査収してくださいますようお願いします。', FALSE, 1),
    (gen_random_uuid(), q_id, '添付ファイルにてお送りいたしますので、ご査収のほどよろしくお願いいたします。', TRUE, 2),
    (gen_random_uuid(), q_id, '添付ファイルにてお送りいたしますので、ご査収のほうをよろしくお願い申し上げます。', FALSE, 3),
    (gen_random_uuid(), q_id, '添付ファイルにてお送りいたしますので、お目通しいただけますようお願いいたします。', FALSE, 4);

  -- Question 14: 社内チャットでの簡潔な依頼パターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内チャット（Slack等）で同僚に資料の確認を依頼する際、最も適切な表現はどれですか？',
    '社内チャットではメールほど堅くなくてもよいですが、「お手すきの際に」「いただけますでしょうか」など丁寧さは保ちます。チャットでも基本的な敬語は必要です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お手すきの際に、資料の確認をしてくださいますでしょうか。', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手すきの際に、資料の確認をお願いできますでしょうか。', TRUE, 2),
    (gen_random_uuid(), q_id, 'お手すきの際に、資料の確認をさせていただけますでしょうか。', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご都合のよい際に、資料の確認をお願いしてよろしいですか。', FALSE, 4);

  -- Question 15: メールの締めくくりパターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ビジネスメールの最後に添える定型表現として、今後の関係継続を示す最も適切なものはどれですか？',
    '「今後とも何卒よろしくお願い申し上げます」はビジネスメールの締めくくりとして最もフォーマルな表現です。「何卒」は「どうか」の丁寧語で、強い依頼の気持ちを込めています。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今後ともご指導ご鞭撻のほどお願いいたします。', FALSE, 1),
    (gen_random_uuid(), q_id, '今後とも何卒よろしくお願いさせていただきます。', FALSE, 2),
    (gen_random_uuid(), q_id, '今後とも何卒よろしくお願い申し上げます。', TRUE, 3),
    (gen_random_uuid(), q_id, '今後とも変わらぬお引き立てのほどお願いいたします。', FALSE, 4);

END $$;

-- ============================================
-- Post-insert: set question_category and difficulty
-- question_category = 'sentence_pattern' for all pattern questions
-- difficulty by sort_order: 初級 1-3, 中級 4-9, 上級 10-15
-- ============================================
UPDATE quiz_questions SET question_category = 'sentence_pattern'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
);

UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 1 AND 3;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 4 AND 9;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b2000001-0000-0000-0000-000000000001',
  'b2000002-0000-0000-0000-000000000002',
  'b2000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 10 AND 15;

COMMIT;
