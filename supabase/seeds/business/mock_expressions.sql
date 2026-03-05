-- ============================================
-- ビジネス表現テスト Seed Data (3セット × 25問)
-- quiz_type: 'business_expression', is_assessment: FALSE
-- Total: 75 questions, 300 options
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing data (idempotent)
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'b3000001-0000-0000-0000-000000000001',
    'b3000002-0000-0000-0000-000000000002',
    'b3000003-0000-0000-0000-000000000003'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'b3000001-0000-0000-0000-000000000001',
    'b3000002-0000-0000-0000-000000000002',
    'b3000003-0000-0000-0000-000000000003'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
);
DELETE FROM quizzes WHERE id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
);

-- ============================================
-- Quiz 1: ビジネス表現テスト 第1回
-- テーマ: 会議・打ち合わせ表現
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b3000001-0000-0000-0000-000000000001';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'ビジネス表現テスト 第1回', 'business_expression', 70, 15, FALSE, NULL);

  -- Q1: 会議の冒頭で使う表現
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の冒頭で議題を紹介する際、最も適切な表現はどれですか？',
    '「本日のアジェンダですが」は会議冒頭で議題を紹介する際の定番表現です。「アジェンダ」はIT業界でも頻繁に使用されるビジネス用語です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日のアジェンダですが、画面共有させていただきます', TRUE, 1),
    (gen_random_uuid(), q_id, '前回の議事録について、修正点をお伝えいたします', FALSE, 2),
    (gen_random_uuid(), q_id, '本日の進捗状況につきまして、詳しくご報告申し上げます', FALSE, 3),
    (gen_random_uuid(), q_id, '皆様のご意見を伺いたく、お時間をいただきました', FALSE, 4);

  -- Q2: 会議で意見を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議中に自分の意見を述べる際、最も丁寧な表現はどれですか？',
    '「私の意見を申し上げてもよろしいでしょうか」は会議で意見を述べる前に許可を求める丁寧な表現です。「申し上げる」は「言う」の謙譲語です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本件につきまして、ご確認をお願いいたします', FALSE, 1),
    (gen_random_uuid(), q_id, '私の意見を申し上げてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '先ほどの議題に関して、補足がございます', FALSE, 3),
    (gen_random_uuid(), q_id, '恐れ入りますが、資料の訂正をお願いします', FALSE, 4);

  -- Q3: 会議で補足する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '同僚の発言に対して補足説明を加えたい場合、最も適切な表現はどれですか？',
    '「この点について補足させていただきます」は相手の発言に情報を追加する際の丁寧な表現です。「させていただく」は許可を求める謙譲表現です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次の議題に移らせていただいてよろしいですか', FALSE, 1),
    (gen_random_uuid(), q_id, '本件の結論をまとめさせていただきます', FALSE, 2),
    (gen_random_uuid(), q_id, 'この点について補足させていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, '皆様のご意見を確認させていただきます', FALSE, 4);

  -- Q4: 会議の要約
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の内容をまとめる際、最も適切な表現はどれですか？',
    '「ここまでの内容を整理させていただきます」は会議の途中や最後に内容をまとめる際に使う丁寧な表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の決定事項を改めて共有させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'ここまでの内容を整理させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '次回までの宿題事項を確認いたします', FALSE, 3),
    (gen_random_uuid(), q_id, '各担当者の作業状況をお聞かせください', FALSE, 4);

  -- Q5: 会議を閉じる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議を終了する際、最も適切な締めくくりの表現はどれですか？',
    '「本日の会議は以上とさせていただきます。お忙しい中ご参加いただきありがとうございました」は会議を締めくくる際の定型表現です。感謝の言葉を添えるのがマナーです。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の議事録は後日メールにてお送りいたしますので、ご確認のほどよろしくお願いいたします', FALSE, 1),
    (gen_random_uuid(), q_id, '次回の打ち合わせ日程につきましては、改めてメールにてご連絡させていただきますので', FALSE, 2),
    (gen_random_uuid(), q_id, '本日の会議は以上とさせていただきます。お忙しい中ご参加いただきありがとうございました', TRUE, 3),
    (gen_random_uuid(), q_id, '残りの議題に関しましては、お手数ですが各自でご確認いただけますようお願い申し上げます', FALSE, 4);

  -- Q6: 会議で質問する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議中に質問をしたい場合、最も適切な切り出し方はどれですか？',
    '「一点確認させていただきたいのですが」は会議中に質問する際の丁寧な導入表現です。「一点」で質問が一つであることを明示し、相手の負担を軽く感じさせます。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本件について補足させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '一点確認させていただきたいのですが', TRUE, 2),
    (gen_random_uuid(), q_id, '別の議題をご提案させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '先ほどの件は承知いたしましたので', FALSE, 4);

  -- Q7: 会議で賛成する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司の提案に賛成する際、最もビジネスに適した表現はどれですか？',
    '「おっしゃる通りだと思います。その方向で進めさせていただきます」は上司の意見に賛同し、実行に移す意思を示す丁寧な表現です。「おっしゃる」は「言う」の尊敬語です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、別の観点からぜひご提案させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'おっしゃる通りだと思います。その方向で進めさせていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '本件につきましては、早急に社内にて改めて検討させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご提案の内容を踏まえて、議事録にまとめさせていただきます', FALSE, 4);

  -- Q8: 会議で反対意見を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で反対意見を述べる際、最も適切な表現はどれですか？',
    '「恐れ入りますが、別の観点からご提案させていただいてもよろしいでしょうか」は直接的な反対を避けつつ、代替案を提示するための丁寧な表現です。日本のビジネスでは直接的な反対を避けるのがマナーです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おっしゃる通りかと存じます。ぜひその方向で進めさせていただきたく存じます', FALSE, 1),
    (gen_random_uuid(), q_id, '本件につきましては、一度社内に持ち帰らせていただいてもよろしいでしょうか', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご提案の趣旨は理解いたしました。詳細を改めて確認させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '恐れ入りますが、別の観点からご提案させていただいてもよろしいでしょうか', TRUE, 4);

  -- Q9: 会議の議事録について
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の議事録を後で送ることを伝える際、最も適切な表現はどれですか？',
    '「議事録は後ほど共有させていただきます」は議事録の送付を約束する丁寧な表現です。「後ほど」は「後で」の丁寧語です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の決定事項を改めて確認いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '議事録は後ほど共有させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '次回の会議日程を調整させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '各担当者のタスクを整理させていただきます', FALSE, 4);

  -- Q10: 会議で進行役を務める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の進行役として次の議題に移る際、最も適切な表現はどれですか？',
    '「それでは、次の議題に移らせていただきます」は進行役が話題を転換する際の定型表現です。スムーズな会議進行に欠かせないフレーズです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ここまでの内容を改めて整理させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '皆様のご意見をぜひ伺いたいと存じますが', FALSE, 2),
    (gen_random_uuid(), q_id, 'それでは、次の議題に移らせていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, '本日の会議は以上とさせていただきます', FALSE, 4);

  -- Q11: 打ち合わせの日程調整
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせの日程を調整する際、相手の都合を聞く最も適切な表現はどれですか？',
    '「ご都合のよろしい日時をお知らせいただけますでしょうか」は相手のスケジュールを確認する丁寧な表現です。「ご都合」は「都合」の尊敬語表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室の予約が完了いたしましたので改めてご連絡いたします', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご都合のよろしい日時をお知らせいただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '前回の打ち合わせ内容を踏まえてご報告いたします', FALSE, 3),
    (gen_random_uuid(), q_id, '日程変更のご連絡をいただきありがとうございます', FALSE, 4);

  -- Q12: 打ち合わせで確認事項を切り出す
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせで確認事項がある場合、切り出す表現として最も適切なものはどれですか？',
    '「確認させていただきたい点がございます」は確認事項がある旨を伝える丁寧な表現です。「ございます」は「あります」の丁重語です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の議題について補足がございます', FALSE, 1),
    (gen_random_uuid(), q_id, '先ほどの件で一点ご報告がございます', FALSE, 2),
    (gen_random_uuid(), q_id, '確認させていただきたい点がございます', TRUE, 3),
    (gen_random_uuid(), q_id, '次の議題に移らせていただきたく存じます', FALSE, 4);

  -- Q13: 会議で提案する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で新しいアイデアを提案する際、最も適切な表現はどれですか？',
    '「一つご提案がございますが、ご検討いただけますでしょうか」は提案を切り出す際の丁寧な表現です。提案を押し付けず、検討を依頼する姿勢が大切です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先ほどの決定事項について、一点補足させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '一つご提案がございますが、ご検討いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '本件の進捗につきまして、改めて詳しくご報告させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '前回のご指摘を踏まえまして、内容を修正いたしました', FALSE, 4);

  -- Q14: 会議でタスクを引き受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で振られたタスクを引き受ける際、最も適切な表現はどれですか？',
    '「承知いたしました。〇〇までに対応いたします」はタスクを引き受け、期限を明示する丁寧な表現です。「承知いたしました」は「わかりました」の謙譲表現です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、優先順位をご確認いただけますか', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数ですが、詳細な仕様書をいただけますか', FALSE, 2),
    (gen_random_uuid(), q_id, '承知いたしました。金曜日までに対応いたします', TRUE, 3),
    (gen_random_uuid(), q_id, '申し訳ございませんが、現在対応が難しい状況です', FALSE, 4);

  -- Q15: 会議で時間が押している時
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の時間が押している場合、進行役として最も適切な発言はどれですか？',
    '「お時間が迫っておりますので、残りの議題は次回に持ち越させていただいてもよろしいでしょうか」は時間切れを丁寧に伝え、参加者の合意を得る表現です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ここまでの決定事項を確認させていただきます。なお、議事録は後日メールにてお送りいたします', FALSE, 1),
    (gen_random_uuid(), q_id, 'お時間が迫っておりますので、残りの議題は次回に持ち越させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '本日の会議は以上でございます。皆様、お忙しい中ご参加いただき誠にありがとうございました', FALSE, 3),
    (gen_random_uuid(), q_id, '次回の日程につきましては、改めてメールにてご連絡させていただきますのでご確認ください', FALSE, 4);

  -- Q16: 会議で発言を求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で参加者に意見を求める際、最も適切な表現はどれですか？',
    '「〇〇さん、この件について何かご意見はございますか」は特定の参加者に意見を求める丁寧な表現です。名前を呼んでから質問するのが基本です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '〇〇さん、先ほどの資料について補足をお願いします', FALSE, 1),
    (gen_random_uuid(), q_id, '〇〇さん、次回までの進捗状況をぜひご報告ください', FALSE, 2),
    (gen_random_uuid(), q_id, '〇〇さん、この件について何かご意見はございますか', TRUE, 3),
    (gen_random_uuid(), q_id, '〇〇さん、本件のスケジュールをご確認ください', FALSE, 4);

  -- Q17: オンライン会議での音声トラブル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'オンライン会議で相手の音声が途切れた場合、最も適切な表現はどれですか？',
    '「恐れ入りますが、音声が途切れておりましたので、もう一度お願いできますでしょうか」はオンライン会議でのトラブル対応の丁寧な表現です。リモートワークが増えた現在、重要な表現です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '画面共有の準備ができましたので、こちらの資料をご覧いただけますでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, '恐れ入りますが、音声が途切れておりましたので、もう一度お願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'ネットワークの接続状況を確認いたしますので、少々お待ちいただけますでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'チャット機能にて補足資料を共有させていただきますので、ぜひご確認をお願いいたします', FALSE, 4);

  -- Q18: 会議で決定事項を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の最後に決定事項を確認する際、最も適切な表現はどれですか？',
    '「本日の決定事項を確認させていただきます」は会議の締めくくりで決定事項を振り返る際の定型表現です。認識の齟齬を防ぐために重要なプロセスです。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次回の打ち合わせ日程を改めて調整いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '本日の決定事項を確認させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '議事録を後ほど共有させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '各自のタスク期限をご報告ください', FALSE, 4);

  -- Q19: 会議で資料を共有する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で画面共有をして資料を見せる際、最も適切な表現はどれですか？',
    '「画面を共有させていただきます。資料の〇ページをご覧ください」は画面共有時の丁寧な案内表現です。IT業界のオンライン会議で頻繁に使います。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の議題につきまして、早速ご報告させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '先日いただいたご質問に対して、回答を準備いたしました', FALSE, 2),
    (gen_random_uuid(), q_id, '画面を共有させていただきます。資料の3ページをご覧ください', TRUE, 3),
    (gen_random_uuid(), q_id, '前回の打ち合わせ内容を踏まえまして、修正案を作成いたしました', FALSE, 4);

  -- Q20: 会議で次回の予定を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の最後に次回の打ち合わせ予定を確認する際、最も適切な表現はどれですか？',
    '「次回の打ち合わせは〇月〇日を予定しておりますが、ご都合いかがでしょうか」は次回日程を確認する丁寧な表現です。相手の都合を確認する姿勢が大切です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日の議事録は後日メールにてお送りさせていただきますので、ご確認ください', FALSE, 1),
    (gen_random_uuid(), q_id, '次回の打ち合わせは来週水曜日を予定しておりますが、ご都合いかがでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '本日の決定事項を踏まえまして、各担当者はタスクの対応をお願いいたします', FALSE, 3),
    (gen_random_uuid(), q_id, 'お忙しい中ご参加いただきありがとうございました。引き続きよろしくお願いします', FALSE, 4);

  -- ============================================
  -- Q21-Q25: ウチ・ソト（内と外）表現
  -- ============================================

  -- Q21: 社外の人に自社の上司を紹介する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様に対して自社の部長を紹介する際、最も適切な表現はどれですか？',
    '社外の人に自社の上司を紹介する際は、ウチ（内）の人間として敬称を外し、謙譲語を使います。「部長の田中でございます」のように役職＋名字で紹介し、「様」や「さん」は付けません。これがウチ・ソトの基本ルールです。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中部長様をご紹介いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の部長の田中でございます', TRUE, 2),
    (gen_random_uuid(), q_id, '田中部長さんをご紹介させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '弊社の田中部長がお話しになります', FALSE, 4);

  -- Q22: 電話で自社の社員が不在であることを伝える
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外からの電話で、自社の佐藤課長が席を外している場合、最も適切な応答はどれですか？',
    '社外の人に対して自社の社員について話す場合、ウチの人間には敬称を付けず、謙譲語を使います。「佐藤は席を外しております」が正しく、「佐藤課長は〜」や「いらっしゃいません」（尊敬語）は不適切です。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '佐藤課長はただいま席を外していらっしゃいます', FALSE, 1),
    (gen_random_uuid(), q_id, '佐藤はただいま席を外しております', TRUE, 2),
    (gen_random_uuid(), q_id, '佐藤課長はただいま不在でございます', FALSE, 3),
    (gen_random_uuid(), q_id, '佐藤さんは外出されております', FALSE, 4);

  -- Q23: 弊社・御社・当社・貴社の使い分け
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '口頭でクライアントと会話する際、自社と相手の会社を指す組み合わせとして最も適切なものはどれですか？',
    '口頭では自社を「弊社」、相手の会社を「御社」と言います。「当社」はニュートラルな表現で社内向け、「貴社」は書面で使います。口頭で「貴社」を使うと「帰社」と紛らわしいため、「御社」が適切です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自社＝当社、相手＝貴社', FALSE, 1),
    (gen_random_uuid(), q_id, '自社＝弊社、相手＝御社', TRUE, 2),
    (gen_random_uuid(), q_id, '自社＝我が社、相手＝御社', FALSE, 3),
    (gen_random_uuid(), q_id, '自社＝弊社、相手＝貴社', FALSE, 4);

  -- Q24: 社外の人に自社社員の行動を伝える
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに「弊社の山田が資料を確認した」ことを伝える場合、最も適切な表現はどれですか？',
    'ウチ・ソトの原則に従い、社外の人に対して自社社員の行動を述べる際は謙譲語を使います。「山田が確認いたしました」が適切で、「山田さんが確認されました」のように尊敬語を使うのは不適切です。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '山田さんが確認されました', FALSE, 1),
    (gen_random_uuid(), q_id, '山田が確認なさいました', FALSE, 2),
    (gen_random_uuid(), q_id, '山田が確認いたしました', TRUE, 3),
    (gen_random_uuid(), q_id, '山田様が確認してくださいました', FALSE, 4);

  -- Q25: ウチ・ソトの基本概念
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '日本のビジネスにおける「ウチ・ソト」の考え方について、最も正しい説明はどれですか？',
    '「ウチ・ソト」とは、自分の所属する集団（ウチ＝内）と外部の人（ソト＝外）を区別し、敬語の使い方を変える日本語特有の概念です。ウチの人間には謙譲表現を使い、ソトの人間には尊敬表現を使います。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ウチの人には尊敬語、ソトの人には謙譲語を使う', FALSE, 1),
    (gen_random_uuid(), q_id, 'ソトの人に対してウチの人を高めて話す', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソトの人に対してウチの人を低めて（謙譲語で）話す', TRUE, 3),
    (gen_random_uuid(), q_id, 'ウチの人にもソトの人にも同じ敬語を使う', FALSE, 4);

END $$;

-- ============================================
-- Quiz 2: ビジネス表現テスト 第2回
-- テーマ: クライアント対応
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b3000002-0000-0000-0000-000000000002';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'ビジネス表現テスト 第2回', 'business_expression', 70, 15, FALSE, NULL);

  -- Q1: クライアントへの初回挨拶
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントとの初回ミーティングで自社を紹介する際、最も適切な表現はどれですか？',
    '「本日はお時間をいただき、誠にありがとうございます。株式会社〇〇の△△と申します」はクライアントへの初回挨拶の基本形です。まず感謝を述べてから自己紹介するのがマナーです。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日はお時間をいただき、誠にありがとうございます。株式会社〇〇の△△と申します', TRUE, 1),
    (gen_random_uuid(), q_id, '弊社の新サービスについてご説明させていただきたく、本日お時間を頂戴いたしました', FALSE, 2),
    (gen_random_uuid(), q_id, '先日ご依頼いただきました件につきまして、本日お見積書を持参させていただきました', FALSE, 3),
    (gen_random_uuid(), q_id, '御社のプロジェクトにつきまして、現在の進捗状況を詳しくご報告させていただきます', FALSE, 4);

  -- Q2: クライアントの要望を受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントから要望を受けた際、最も適切な応答はどれですか？',
    '「ご要望を承りました。社内で検討の上、改めてご回答させていただきます」はクライアントの要望を受け止め、社内検討後に回答する旨を伝える丁寧な表現です。「承る」は「受ける」の謙譲語です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、その内容につきましては対応が難しい状況でございます', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご要望を承りました。社内で検討の上、改めてご回答させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '本件につきましては、担当者から改めて折り返しご連絡させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご提案の趣旨は理解いたしました。早急に代替案をご用意いたします', FALSE, 4);

  -- Q3: 納期の相談
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに納期についての相談をする際、最も適切な切り出し方はどれですか？',
    '「納期についてご相談がございます」はクライアントに納期の相談を切り出す際の丁寧な表現です。「ご相談」と「ございます」で敬意を示しています。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '進捗状況についてご報告がございます', FALSE, 1),
    (gen_random_uuid(), q_id, '納期についてご相談がございます', TRUE, 2),
    (gen_random_uuid(), q_id, '仕様変更について確認させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '追加費用のお見積もりを提出いたします', FALSE, 4);

  -- Q4: 納期遅延の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに納期の遅延を報告する際、最も適切な表現はどれですか？',
    '「大変申し訳ございませんが、当初の納期より〇日ほど遅れる見込みでございます。リカバリー策として〜を実施いたします」は遅延報告の際に謝罪と対策を同時に伝える適切な表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '現時点での進捗状況をご報告いたします。全体の80%が完了しており、残りの作業につきましても予定通り進めてまいります', FALSE, 1),
    (gen_random_uuid(), q_id, '大変申し訳ございませんが、当初の納期より3日ほど遅れる見込みでございます。リカバリー策として増員を実施いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '仕様変更について承知いたしました。影響範囲を詳細に調査の上、追加工数のお見積もりを早急にご提出させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト結果についてご報告いたします。全テストケース200件中、198件が合格しており大変順調に推移しております', FALSE, 4);

  -- Q5: 進捗報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに開発の進捗を報告する際、最も適切な表現はどれですか？',
    '「現時点での進捗状況をご報告いたします。全体の70%が完了しており、予定通りに進んでおります」は具体的な数値を用いて進捗を報告する適切な表現です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '納期につきましてご相談がございます。一部機能の仕様変更に伴い、スケジュールの見直しが必要です', FALSE, 1),
    (gen_random_uuid(), q_id, '現時点での進捗状況をご報告いたします。全体の70%が完了しており、予定通りに進んでおります', TRUE, 2),
    (gen_random_uuid(), q_id, '追加機能のご要望について承知いたしました。工数とスケジュールへの影響を確認させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト工程に入りましたので、万が一不具合が見つかった場合は速やかにご報告させていただきます', FALSE, 4);

  -- Q6: 仕様変更の確認
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントから仕様変更の依頼を受けた際、影響範囲を確認する最も適切な表現はどれですか？',
    '「仕様変更について承知いたしました。影響範囲を調査の上、工数とスケジュールへの影響をお見積もりさせていただきます」は仕様変更を受けつつ、影響調査を約束する適切な表現です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご要望いただきました機能につきましては、現在の技術スタックでは実装が困難でございますので代替案をご提示いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '大変申し訳ございませんが、当初のスケジュールより遅延が発生する見込みでございます。具体的な対策をご説明いたします', FALSE, 2),
    (gen_random_uuid(), q_id, '仕様変更について承知いたしました。影響範囲を調査の上、工数とスケジュールへの影響をお見積もりさせていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, 'テスト完了後の結果につきまして詳細にご報告いたします。全体として品質基準を十分に満たしている状況でございます', FALSE, 4);

  -- Q7: 見積書の提出
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに見積書を提出する際、最も適切な表現はどれですか？',
    '「お見積書を作成いたしましたので、ご確認いただけますでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください」は見積書提出時の丁寧な表現です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '仕様変更に伴う追加費用について、影響範囲を整理いたしましたので、詳細をご説明させていただいてもよろしいでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, 'お見積書を作成いたしましたので、ご確認いただけますでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください', TRUE, 2),
    (gen_random_uuid(), q_id, '納品スケジュールにつきまして、段階的なリリース計画を詳細に作成いたしましたので、ご検討いただけますと大変幸いでございます', FALSE, 3),
    (gen_random_uuid(), q_id, '先日ご依頼いただきました要件定義書を作成いたしました。内容にお気づきの点がございましたら何なりとご指摘くださいませ', FALSE, 4);

  -- Q8: クライアントからのクレーム対応
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントからバグに関するクレームを受けた際、最初に述べるべき最も適切な表現はどれですか？',
    '「ご不便をおかけして大変申し訳ございません。早急に原因を調査し、対応させていただきます」はクレーム対応の基本です。まず謝罪し、迅速な対応を約束することが重要です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本件につきましては、仕様書に記載の通りの動作となっておりますので、ご確認をお願いいたします', FALSE, 1),
    (gen_random_uuid(), q_id, '再現手順をお教えいただけますでしょうか。開発環境にて事象の確認を進めさせていただきます', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご不便をおかけして大変申し訳ございません。早急に原因を調査し、対応させていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, '次回のリリースにて改修対応を予定しておりますので、今しばらくお待ちいただけますでしょうか', FALSE, 4);

  -- Q9: 要件定義の確認
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントと要件定義を確認する際、認識合わせをする最も適切な表現はどれですか？',
    '「要件について認識に相違がないか確認させていただきたく存じます」は要件定義の確認を丁寧に切り出す表現です。「存じます」は「思います」の謙譲語です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '設計書の変更点につきまして、ご報告させていただきたく存じます', FALSE, 1),
    (gen_random_uuid(), q_id, '要件について認識に相違がないか確認させていただきたく存じます', TRUE, 2),
    (gen_random_uuid(), q_id, 'テスト計画書を作成いたしましたので、ご確認いただけますか', FALSE, 3),
    (gen_random_uuid(), q_id, '開発スケジュールの見直しにつきまして、ご提案がございます', FALSE, 4);

  -- Q10: 追加機能の提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに追加機能を提案する際、最も適切な表現はどれですか？',
    '「ユーザビリティの観点から、一点ご提案させていただいてもよろしいでしょうか」は追加機能を提案する際の丁寧な切り出し方です。根拠を示してから提案するのが効果的です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セキュリティの観点から、現在の実装方針について一点確認させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'パフォーマンス改善のために、インフラ構成の見直しを検討しております', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザビリティの観点から、一点ご提案させていただいてもよろしいでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '要件定義書に記載のない仕様につきまして、確認させていただきたく存じます', FALSE, 4);

  -- Q11: テスト結果の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにテスト結果を報告する際、最も適切な表現はどれですか？',
    '「テスト結果についてご報告いたします。全テストケース〇件中、〇件が合格しております」は具体的な数値を用いたテスト結果報告の丁寧な表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発工程が予定通り完了いたしましたので、次のフェーズへスムーズに進めさせていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト結果についてご報告いたします。全テストケース150件中、148件が合格しております', TRUE, 2),
    (gen_random_uuid(), q_id, '本番環境へのリリース準備が整いましたので、具体的なリリース日程をご相談させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '不具合の修正が完了いたしましたので、再テストの結果をぜひご確認いただけますでしょうか', FALSE, 4);

  -- Q12: リリーススケジュールの提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにリリーススケジュールを提案する際、最も適切な表現はどれですか？',
    '「リリーススケジュールについてご提案させていただきます。段階的なリリースを推奨いたしますが、いかがでしょうか」は段階的リリースを提案する丁寧な表現です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リリーススケジュールについてご提案させていただきます。段階的なリリースを推奨いたしますが、いかがでしょうか', TRUE, 1),
    (gen_random_uuid(), q_id, '本番環境での障害対応マニュアルを作成いたしましたので、お手すきの際にぜひご確認いただけますと幸いでございます', FALSE, 2),
    (gen_random_uuid(), q_id, '保守運用についての体制を整備いたしました。なお、月次の定例会議を設けさせていただいてもよろしいでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト完了後の品質レポートを作成いたしましたので、改めて詳細をご説明させていただければ幸いに存じます', FALSE, 4);

  -- Q13: クライアントへのお礼メール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントとの打ち合わせ後にお礼のメールを送る際、最も適切な書き出しはどれですか？',
    '「本日はお忙しい中、お打ち合わせのお時間をいただき、誠にありがとうございました」は打ち合わせ後のお礼メールの定型表現です。相手の忙しさへの配慮を示しています。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日ご依頼いただきました追加機能について、お見積書を添付いたしましたのでご査収ください', FALSE, 1),
    (gen_random_uuid(), q_id, '本日はお忙しい中、お打ち合わせのお時間をいただき、誠にありがとうございました', TRUE, 2),
    (gen_random_uuid(), q_id, '次回の打ち合わせにつきましては、来週中に改めて日程を調整させていただきたく存じます', FALSE, 3),
    (gen_random_uuid(), q_id, '議事録を添付いたしましたので、内容にご不明な点がございましたらお気軽にご連絡ください', FALSE, 4);

  -- Q14: クライアントの質問に即答できない場合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントからの技術的な質問にすぐ回答できない場合、最も適切な表現はどれですか？',
    '「確認の上、本日中にご回答させていただきます」はすぐに回答できない場合に回答期限を明示する丁寧な表現です。期限を切ることで信頼を維持します。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、その件は私の担当外でございます', FALSE, 1),
    (gen_random_uuid(), q_id, '確認の上、本日中にご回答させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '社内の技術チームに確認を取らせていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご質問いただきありがとうございます。即答は控えます', FALSE, 4);

  -- Q15: 障害発生時のクライアント連絡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '本番環境で障害が発生した際、クライアントへの第一報として最も適切な表現はどれですか？',
    '「緊急のご連絡でございます。現在、〇〇システムにおいて障害が発生しております。現在、原因の特定と復旧に全力で取り組んでおります」は障害発生時の第一報として適切な表現です。状況と対応状況を簡潔に伝えることが重要です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご報告が遅くなりまして大変申し訳ございません。先日のテスト工程において一部不具合が発見されましたので、修正対応を進めております', FALSE, 1),
    (gen_random_uuid(), q_id, '定期メンテナンスのご案内でございます。来週末にサーバーの更新作業を実施いたしますので、一時的にサービスが停止する予定でございます', FALSE, 2),
    (gen_random_uuid(), q_id, '緊急のご連絡でございます。現在、受注管理システムにおいて障害が発生しております。現在、原因の特定と復旧に全力で取り組んでおります', TRUE, 3),
    (gen_random_uuid(), q_id, 'セキュリティアップデートの適用が完了いたしましたので、ご報告させていただきます。なお、システムへの影響はございませんでした', FALSE, 4);

  -- Q16: 機能追加の費用説明
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに追加開発の費用が発生することを伝える際、最も適切な表現はどれですか？',
    '「恐れ入りますが、こちらの追加機能については別途お見積もりとなりますが、よろしいでしょうか」は追加費用の発生を丁寧に伝える表現です。クッション言葉「恐れ入りますが」で柔らかく伝えています。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご要望の機能につきましては、次期バージョンでの対応を前向きに検討させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '本件の対応に伴いまして、スケジュールと納期の変更が必要となりますがご了承いただけますか', FALSE, 2),
    (gen_random_uuid(), q_id, '恐れ入りますが、こちらの追加機能については別途お見積もりとなりますが、よろしいでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '技術的な制約もございまして、代替案としてこちらの方法をご提案させていただけますでしょうか', FALSE, 4);

  -- Q17: 納品物の説明
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに成果物を納品する際、最も適切な表現はどれですか？',
    '「成果物を納品させていただきます。ご確認の上、ご不明な点やご要望がございましたら、お知らせいただけますと幸いです」は納品時の丁寧な表現です。確認依頼とフィードバック受付を含んでいます。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '保守契約の更新時期が近づいてまいりましたので、次年度の契約内容につきましてご相談させていただきたく存じます', FALSE, 1),
    (gen_random_uuid(), q_id, '成果物を納品させていただきます。ご確認の上、ご不明な点やご要望がございましたら、お知らせいただけますと幸いです', TRUE, 2),
    (gen_random_uuid(), q_id, '運用マニュアルを作成いたしましたので、具体的な操作方法について改めて詳しくご説明させていただいてもよろしいでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトの最終報告書を作成いたしました。つきましては振り返りのミーティングをぜひ設けさせていただけますか', FALSE, 4);

  -- Q18: クライアントとの契約更新
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに保守契約の更新について連絡する際、最も適切な表現はどれですか？',
    '「保守契約の更新時期が近づいてまいりましたので、ご連絡させていただきました」は契約更新の連絡を丁寧に切り出す表現です。「まいりました」は「きました」の丁重語です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日の障害対応につきまして、原因調査の結果をご報告させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '保守契約の更新時期が近づいてまいりましたので、ご連絡させていただきました', TRUE, 2),
    (gen_random_uuid(), q_id, '来月のシステムアップデートにつきまして、事前にご確認いただきたく存じます', FALSE, 3),
    (gen_random_uuid(), q_id, '年末年始の運用体制について、ご案内をお送りさせていただきたく存じます', FALSE, 4);

  -- Q19: クライアントへの代替案提示
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントの要望が技術的に難しい場合、代替案を提示する最も適切な表現はどれですか？',
    '「ご要望の実装は技術的に難しい状況でございますが、代替案としてこちらの方法をご提案させていただけますでしょうか」は要望を否定せず代替案を提案する丁寧な表現です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '仕様変更について承知いたしました。影響範囲を調査の上、スケジュールへの影響をお見積もりさせていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご依頼の追加機能につきましては、次期リリースにて対応させていただく方向で前向きに検討させていただきます', FALSE, 2),
    (gen_random_uuid(), q_id, '本件のお見積もりを作成いたしましたので、ぜひご確認のうえご不明な点がございましたらお気軽にお問い合わせください', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご要望の実装は技術的に難しい状況でございますが、代替案としてこちらの方法をご提案させていただけますでしょうか', TRUE, 4);

  -- Q20: プロジェクト完了の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクト完了をクライアントに報告する際、最も適切な表現はどれですか？',
    '「プロジェクトが無事完了いたしましたことをご報告申し上げます。ご支援いただき、誠にありがとうございました」はプロジェクト完了報告の丁寧な表現です。クライアントへの感謝を忘れないことが大切です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '保守運用の体制が整いましたので、今後のサポート内容につきまして詳しくご説明させていただきたく存じます', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトが無事完了いたしましたことをご報告申し上げます。ご支援いただき、誠にありがとうございました', TRUE, 2),
    (gen_random_uuid(), q_id, '最終的な成果物一式を納品させていただきましたので、ご確認のうえお気づきの点がございましたらご連絡ください', FALSE, 3),
    (gen_random_uuid(), q_id, '本プロジェクトの振り返りレポートを作成いたしましたので、次回の打ち合わせにて詳細をご共有いたします', FALSE, 4);

  -- ============================================
  -- Q21-Q25: ウチ・ソト（内と外）表現
  -- ============================================

  -- Q21: 自社の社長について社外に伝える
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに対して、自社の社長の意向を伝える際、最も適切な表現はどれですか？',
    'ウチ・ソトの原則により、社外の人に対して自社の社長について話す場合は敬称を付けません。「弊社の社長の鈴木が申しておりました」のように、名前を呼び捨てにし、謙譲語（申す）を使います。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弊社の鈴木社長様がおっしゃっておりました', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の社長の鈴木が申しておりました', TRUE, 2),
    (gen_random_uuid(), q_id, '弊社の鈴木社長がお話しになっておりました', FALSE, 3),
    (gen_random_uuid(), q_id, '弊社の鈴木社長さんが言われておりました', FALSE, 4);

  -- Q22: クライアントの社員に敬語を使う
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントの担当者である高橋部長に確認をお願いする際、最も適切な表現はどれですか？',
    'ソト（社外）の人に対しては尊敬語を使います。「高橋部長にご確認いただけますでしょうか」のように、役職＋名前に敬称を付け、尊敬語を使うのが適切です。ウチの人と違い、ソトの人には敬意を表します。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '高橋が確認いたしますでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, '高橋に確認させていただけますか', FALSE, 2),
    (gen_random_uuid(), q_id, '高橋部長にご確認いただけますでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '高橋部長が確認してくれますか', FALSE, 4);

  -- Q23: 自社の同僚をクライアントに紹介する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントとの打ち合わせで、同行した自社のエンジニア中村を紹介する際、最も適切な表現はどれですか？',
    'ウチ・ソトの原則により、社外の人に対して自社の同僚を紹介する際は「さん」を付けず、謙譲表現を使います。「弊社の中村でございます」が適切です。「中村さん」や尊敬語は使いません。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弊社の中村さんをご紹介いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の中村でございます。本日同席させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '弊社のエンジニアの中村様です', FALSE, 3),
    (gen_random_uuid(), q_id, '中村さんが本日参加されます', FALSE, 4);

  -- Q24: 電話での伝言 — ウチの人の行動
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外からの電話で「木村部長はいらっしゃいますか」と聞かれた場合、木村が外出中であることを伝える最も適切な表現はどれですか？',
    '自社の人間について社外の人に伝える際は、敬称を省き謙譲語を使います。「木村は外出しております」が適切です。「木村部長は外出されています」のように役職を付けたり尊敬語を使ったりするのは不適切です。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '木村部長は外出されております', FALSE, 1),
    (gen_random_uuid(), q_id, '木村は外出しております。戻り次第ご連絡いたしましょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '木村部長様は本日お休みを取られております', FALSE, 3),
    (gen_random_uuid(), q_id, '木村さんはただいまいらっしゃいません', FALSE, 4);

  -- Q25: 社内と社外での呼び方の切り替え
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内では「田中部長」と呼んでいる上司について、社外の人との会話での正しい呼び方はどれですか？',
    'ウチ・ソトの切り替えにより、社内では「田中部長」と敬称付きで呼びますが、社外の人に対しては「部長の田中」または「田中」と呼び捨てにします。これは日本のビジネスマナーの基本中の基本です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中部長', FALSE, 1),
    (gen_random_uuid(), q_id, '田中部長さん', FALSE, 2),
    (gen_random_uuid(), q_id, '部長の田中', TRUE, 3),
    (gen_random_uuid(), q_id, '田中部長様', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: ビジネス表現テスト 第3回
-- テーマ: 日常業務表現
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b3000003-0000-0000-0000-000000000003';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'ビジネス表現テスト 第3回', 'business_expression', 70, 15, FALSE, NULL);

  -- Q1: 退社時の挨拶
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '同僚より先に退社する際、最も適切な挨拶はどれですか？',
    '「お先に失礼します」は自分が先に退社する際の基本的な挨拶です。「失礼します」で先に帰ることへの申し訳なさを表現しています。日本の職場では毎日使う表現です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お先に失礼します', TRUE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様でございます', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様でございます', FALSE, 3),
    (gen_random_uuid(), q_id, 'いつもお世話になります', FALSE, 4);

  -- Q2: ホウレンソウの「報告」
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '日本の職場で「ホウレンソウ」の「ホウ」が意味するものとして正しいのはどれですか？',
    '「ホウレンソウ」は「報告・連絡・相談」の略です。「ホウ」は「報告」を意味し、上司に業務の進捗や結果を知らせることです。日本の職場で最も重要視されるコミュニケーション原則です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '報告（ほうこく）', TRUE, 1),
    (gen_random_uuid(), q_id, '放送（ほうそう）', FALSE, 2),
    (gen_random_uuid(), q_id, '方法（ほうほう）', FALSE, 3),
    (gen_random_uuid(), q_id, '訪問（ほうもん）', FALSE, 4);

  -- Q3: 上司への進捗報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に作業の進捗を報告する際、最も適切な表現はどれですか？',
    '「〇〇の件、ご報告いたします。現在、〇〇まで完了しております」は上司への進捗報告の基本形です。具体的な完了状況を伝えることが重要です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API実装の件、ご報告いたします。現在、認証機能まで完了しております', TRUE, 1),
    (gen_random_uuid(), q_id, 'お忙しいところ大変恐れ入りますが、一点ご相談させていただきたく存じます', FALSE, 2),
    (gen_random_uuid(), q_id, '先ほどの件について、補足説明をさせていただいてもよろしいでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, '本件につきましては、改めてメールにてご連絡をさせていただきます', FALSE, 4);

  -- Q4: 助けを求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩社員に業務上の質問をする際、最も適切な表現はどれですか？',
    '「お忙しいところ恐れ入りますが、一点ご教示いただけますでしょうか」は先輩や上司に質問する際の丁寧な前置き表現です。相手の忙しさへの配慮と謙虚な姿勢を示しています。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先日の件につきまして、現在の進捗状況をご報告させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、一点ご教示いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '承知いたしました。早急に確認の上、対応させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '資料のご確認をいただきまして、誠にありがとうございました', FALSE, 4);

  -- Q5: ミスの謝罪
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '自分の確認ミスで書類に誤りが見つかった場合、上司に報告する最も適切な表現はどれですか？',
    '「申し訳ございません。私の確認不足により書類に誤りがございました。現在修正対応中でございます」はミスを認め、対応状況を報告する適切な表現です。原因の明示と対応状況の報告がポイントです。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料の差し替えが完了いたしました。修正箇所は3ページ目となっておりますのでご確認ください', FALSE, 1),
    (gen_random_uuid(), q_id, '申し訳ございません。私の確認不足により書類に誤りがございました。現在修正対応中でございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご指摘いただいた箇所の修正が完了いたしましたので、お手数ですが再度ご確認をお願いいたします', FALSE, 3),
    (gen_random_uuid(), q_id, '本日の作業予定でございますが、見積書の作成と提出資料の整理を優先的に進めてまいります', FALSE, 4);

  -- Q6: 休暇申請
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に有給休暇を申請する際、最も適切な表現はどれですか？',
    '「恐れ入りますが、〇月〇日にお休みをいただきたく存じますが、よろしいでしょうか」は休暇申請の丁寧な表現です。「いただきたく存じます」は「もらいたいと思います」の謙譲語です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '来週金曜日の打ち合わせにつきまして、議題を事前にお送りさせていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '恐れ入りますが、来週金曜日にお休みをいただきたく存じますが、よろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '来週金曜日のスケジュールでございますが、午後から客先への外出をする予定がございます', FALSE, 3),
    (gen_random_uuid(), q_id, '来週金曜日までに資料を完成させますので、ご確認のほどよろしくお願いいたします', FALSE, 4);

  -- Q7: 電話対応の取り次ぎ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '電話を受けて担当者に取り次ぐ際、最も適切な表現はどれですか？',
    '「少々お待ちいただけますでしょうか。担当の者に代わります」は電話の取り次ぎ時の基本表現です。「少々」は「少し」の丁寧語で、待ち時間が短いことを暗示します。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、担当者はただいま外出しております', FALSE, 1),
    (gen_random_uuid(), q_id, '少々お待ちいただけますでしょうか。担当の者に代わります', TRUE, 2),
    (gen_random_uuid(), q_id, 'お電話ありがとうございます。ご用件を改めてお伺いいたします', FALSE, 3),
    (gen_random_uuid(), q_id, '折り返しのお電話をさせていただいてもよろしいですか', FALSE, 4);

  -- Q8: 遅刻の連絡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '電車の遅延で遅刻する場合、上司に連絡する最も適切な表現はどれですか？',
    '「申し訳ございません。電車の遅延により、30分ほど遅れる見込みです。到着後すぐに業務に入ります」は遅刻の連絡として適切な表現です。理由・遅延時間・到着後の対応を簡潔に伝えることが重要です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日は少し体調がすぐれないため、在宅勤務に切り替えさせていただいてもよろしいでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, '恐れ入りますが、本日は通院のため午前中お休みをいただきまして、午後から出社させていただきます', FALSE, 2),
    (gen_random_uuid(), q_id, '申し訳ございません。電車の遅延により、30分ほど遅れる見込みです。到着後すぐに業務に入ります', TRUE, 3),
    (gen_random_uuid(), q_id, 'お疲れ様です。本日の業務予定をお送りいたしますので、ご確認のほどよろしくお願いいたします', FALSE, 4);

  -- Q9: メールの書き出し（社内）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内の同僚にメールを送る際、最も一般的な書き出しはどれですか？',
    '「お疲れ様です」は社内メールの書き出しとして最も一般的な表現です。朝の時間帯は「おはようございます」も使えますが、「お疲れ様です」は時間帯を問わず使えます。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様です', TRUE, 1),
    (gen_random_uuid(), q_id, 'こんにちは', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様です', FALSE, 3),
    (gen_random_uuid(), q_id, 'どうも', FALSE, 4);

  -- Q10: メールの書き出し（社外）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外の方にメールを送る際、最も一般的な書き出しはどれですか？',
    '「いつもお世話になっております」は社外メールの書き出しとして最も広く使われる表現です。取引関係のある相手に対して使います。初めての相手には「初めてご連絡させていただきます」が適切です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大変お疲れ様でございます', FALSE, 1),
    (gen_random_uuid(), q_id, 'いつもお世話になっております', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご無沙汰しておりますが', FALSE, 3),
    (gen_random_uuid(), q_id, '平素より大変お世話になっております', FALSE, 4);

  -- Q11: 作業依頼を受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司から急ぎの作業を依頼された際、最も適切な応答はどれですか？',
    '「承知いたしました。優先的に対応いたします」は急ぎの依頼を受ける際の適切な応答です。「承知いたしました」は「わかりました」の謙譲表現で、ビジネスで最も適切な受諾表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、現在別件を対応しております', FALSE, 1),
    (gen_random_uuid(), q_id, '申し訳ございませんが、少しお時間をいただけますか', FALSE, 2),
    (gen_random_uuid(), q_id, '承知いたしました。優先的に対応いたします', TRUE, 3),
    (gen_random_uuid(), q_id, 'お手数ですが、詳細をメールでお送りください', FALSE, 4);

  -- Q12: 体調不良で早退する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '体調不良で早退したい場合、上司に伝える最も適切な表現はどれですか？',
    '「申し訳ございませんが、体調がすぐれないため、早退させていただいてもよろしいでしょうか」は体調不良を理由に早退を申し出る丁寧な表現です。許可を求める形にするのがマナーです。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、明日の午前中にお休みをいただきたく存じますが、よろしいでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, '申し訳ございませんが、体調がすぐれないため、早退させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '本日の残りの作業につきましては、明朝優先的に対応させていただきますので、ご了承ください', FALSE, 3),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、本日の午後に通院の予定がございますのでご報告します', FALSE, 4);

  -- Q13: 会議室の予約
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議室を予約したいことを管理部門に伝える際、最も適切な表現はどれですか？',
    '「お手数ですが、〇月〇日の〇時から会議室Aの予約をお願いできますでしょうか」は会議室予約を依頼する丁寧な表現です。「お手数ですが」は相手に手間をかけることへの配慮を示すクッション言葉です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室の空き状況を確認いたしましたので、候補日時をご連絡させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数ですが、来週月曜日の14時から会議室Aの予約をお願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '来週月曜日の打ち合わせにつきまして、参加者の出欠を事前にぜひご確認いただけますか', FALSE, 3),
    (gen_random_uuid(), q_id, 'オンライン会議のURLを発行いたしましたので、招待メールをご確認ください', FALSE, 4);

  -- Q14: 資料の確認依頼
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に作成した資料の確認を依頼する際、最も適切な表現はどれですか？',
    '「お手すきの際に、こちらの資料をご確認いただけますでしょうか」は上司に資料確認を依頼する丁寧な表現です。「お手すき」は「手が空いている」の尊敬語で、相手のスケジュールを配慮しています。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '恐れ入りますが、修正箇所を赤字でハイライトしております', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご多忙のところ恐縮ですが、本日中にご回答をお願いします', FALSE, 2),
    (gen_random_uuid(), q_id, 'お手すきの際に、こちらの資料をご確認いただけますでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '先日いただいたフィードバックを反映した修正版をお送りいたします', FALSE, 4);

  -- Q15: タスクの優先順位を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '複数のタスクを抱えている場合、上司に優先順位を確認する最も適切な表現はどれですか？',
    '「現在、〇〇と△△のタスクを抱えておりますが、優先順位についてご指示いただけますでしょうか」は上司に優先順位の指示を仰ぐ丁寧な表現です。現状を説明した上で指示を求めるのがポイントです。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '承知いたしました。本日中にAPI開発の作業を完了させまして、明日からはテスト作成に着手いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '現在、API開発とテスト作成のタスクを抱えておりますが、優先順位についてご指示いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '恐れ入りますが、確実に納期に間に合わせるために追加のリソースをいただくことは可能でございましょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'API開発とテスト作成の進捗状況をご報告いたします。現在どちらも50%ほど完了しており順調でございます', FALSE, 4);

  -- Q16: 相談したいことがある場合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に相談したいことがある場合、切り出す最も適切な表現はどれですか？',
    '「お時間をいただけますでしょうか。ご相談したいことがございます」は上司に相談を持ちかける際の丁寧な表現です。まず時間を確保できるか確認するのがマナーです。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先ほどの件、承知いたしました。早速確認の上、対応いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '本日の作業報告をさせていただきたいのですが、よろしいでしょうか', FALSE, 2),
    (gen_random_uuid(), q_id, 'お時間をいただけますでしょうか。ご相談したいことがございます', TRUE, 3),
    (gen_random_uuid(), q_id, '恐れ入りますが、一点だけご確認をお願いできますでしょうか', FALSE, 4);

  -- Q17: コードレビューの依頼
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩に作成した企画書の確認を依頼する際、最も適切な表現はどれですか？',
    '「お忙しいところ恐縮ですが、企画書のご確認をお願いできますでしょうか」は確認依頼の丁寧な表現です。「恐縮ですが」は「恐れ入りますが」と同様のクッション言葉です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いただいたご指摘を反映いたしましたので、お手数ですが再度ご確認をお願いいたします', FALSE, 1),
    (gen_random_uuid(), q_id, 'お忙しいところ恐縮ですが、企画書のご確認をお願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '報告書の修正が完了いたしましたので、お手すきの際にご確認いただけますでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, '見積書の内容が確定いたしましたので、お手すきの際にご承認をお願いいたします', FALSE, 4);

  -- Q18: お礼を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩に企画書を確認してもらった後、お礼を述べる最も適切な表現はどれですか？',
    '「丁寧にご確認いただき、ありがとうございます。いただいたフィードバックを反映いたします」は確認後のお礼として適切な表現です。感謝とアクションの両方を伝えることが重要です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お忙しいところ大変恐縮でございますが、追加でもう一件ご確認をお願いできますでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, '丁寧にご確認いただき、ありがとうございます。いただいたフィードバックを反映いたします', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご指摘の箇所について確認いたしましたが、意図的にこの表現としておりますのでご了承ください', FALSE, 3),
    (gen_random_uuid(), q_id, '社内規定に基づいて修正いたしましたので、再度お送りさせていただきます。ご確認ください', FALSE, 4);

  -- Q19: 残業の許可を求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'タスクが終わらず残業したい場合、上司に許可を求める最も適切な表現はどれですか？',
    '「〇〇の対応が残っておりますので、本日残業させていただいてもよろしいでしょうか」は残業の許可を求める丁寧な表現です。残業理由を明示した上で許可を求めるのがポイントです。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日のタスクは予定通り完了いたしましたので、何かご指示がなければ退社させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'バグ修正の対応が残っておりますので、本日残業させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '明日の朝一で対応いたしますので、本日の残りのタスクは持ち越しとさせてください', FALSE, 3),
    (gen_random_uuid(), q_id, '恐れ入りますが、明日の午前中にお打ち合わせのお時間をいただけますでしょうか', FALSE, 4);

  -- Q20: ホウレンソウの「連絡」と「相談」の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「ホウレンソウ」における「連絡」と「相談」の違いとして最も正しい説明はどれですか？',
    '「連絡」は事実やスケジュールなどの情報を関係者に伝えること、「相談」は判断に迷う事項について上司や先輩の意見を求めることです。この違いを理解することは日本の職場で非常に重要です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「連絡」は事実を伝えること、「相談」は意見を求めること', TRUE, 1),
    (gen_random_uuid(), q_id, '「連絡」は結果を報告すること、「相談」は経過を説明すること', FALSE, 2),
    (gen_random_uuid(), q_id, '「連絡」は口頭で行うもので、「相談」は書面で行うもの', FALSE, 3),
    (gen_random_uuid(), q_id, '「連絡」は上司に対して行い、「相談」は同僚に対して行う', FALSE, 4);

  -- ============================================
  -- Q21-Q25: ウチ・ソト（内と外）表現
  -- ============================================

  -- Q21: 自社の人間に「いらっしゃる」は使えるか
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外の人から電話があり「鈴木さんはいらっしゃいますか」と聞かれました。鈴木が社内にいる場合、最も適切な応答はどれですか？',
    '「いらっしゃる」は尊敬語なので、社外の人に対して自社の鈴木について使うのは不適切です。「鈴木でございますね。少々お待ちください」のように、ウチの人間には謙譲語や丁重語を使います。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '鈴木さんはいらっしゃいます。少々お待ちください', FALSE, 1),
    (gen_random_uuid(), q_id, '鈴木でございますね。少々お待ちください', TRUE, 2),
    (gen_random_uuid(), q_id, '鈴木様はおります。おつなぎいたします', FALSE, 3),
    (gen_random_uuid(), q_id, '鈴木部長はいらっしゃいますので、お待ちいただけますか', FALSE, 4);

  -- Q22: 「参る」と「いらっしゃる」の使い分け
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに「明日、弊社の担当がそちらに行きます」と伝える場合、最も適切な表現はどれですか？',
    '自社の人間の行動を社外に伝える際は謙譲語を使います。「参る」は「行く」の謙譲語です。「伺う」も謙譲語として適切ですが、「いらっしゃる」や「行かれる」は尊敬語なのでウチの人間には使いません。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '明日、弊社の担当がそちらにいらっしゃいます', FALSE, 1),
    (gen_random_uuid(), q_id, '明日、弊社の担当が行かれます', FALSE, 2),
    (gen_random_uuid(), q_id, '明日、弊社の担当がそちらに参ります', TRUE, 3),
    (gen_random_uuid(), q_id, '明日、弊社の担当者様がお伺いされます', FALSE, 4);

  -- Q23: 自社の家族的呼称（ウチの概念の拡張）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'ウチ・ソトの概念はビジネスだけでなく日常生活にも適用されます。社外の人に自分の家族を紹介する際の正しいルールはどれですか？',
    'ウチ・ソトの概念は会社だけでなく家族にも適用されます。社外の人に対して自分の家族を紹介する際は、謙譲表現を使い、「父」「母」「妻」「夫」のように呼びます。「お父さん」「お母さん」は使いません。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '家族にも敬称を付けて「お父様は〜」と紹介する', FALSE, 1),
    (gen_random_uuid(), q_id, '家族は「父」「母」など謙譲表現で紹介する', TRUE, 2),
    (gen_random_uuid(), q_id, '家族も「さん」付けで「父さんは〜」と紹介する', FALSE, 3),
    (gen_random_uuid(), q_id, '家族にはウチ・ソトの概念は適用されない', FALSE, 4);

  -- Q24: 社内メールと社外メールの敬語の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内の同僚に送るメールと社外のクライアントに送るメールの敬語レベルについて、最も正しい説明はどれですか？',
    'ウチ・ソトの原則により、社内（ウチ）の同僚へは「お疲れ様です」などの丁寧語で十分ですが、社外（ソト）のクライアントへは「いつもお世話になっております」のように、より高い敬語レベルを使います。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '社内も社外も同じ敬語レベルで統一するのがマナーである', FALSE, 1),
    (gen_random_uuid(), q_id, '社内の方が目上なので、社内メールの方が敬語レベルが高い', FALSE, 2),
    (gen_random_uuid(), q_id, '社外（ソト）への方が敬語レベルが高く、社内（ウチ）は丁寧語で十分', TRUE, 3),
    (gen_random_uuid(), q_id, '敬語レベルは個人の判断に任されており、特にルールはない', FALSE, 4);

  -- Q25: 取引先との会話で自社の対応を伝える
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先から「御社の開発チームが対応してくださるのですか」と聞かれた際、最も適切な返答はどれですか？',
    '自社の行動について社外に伝える際は、謙譲語を使います。「弊社の開発チームが対応いたします」が正しく、「対応してくださいます」（尊敬語）や「対応されます」（尊敬語）は自社に使う表現としては不適切です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はい、弊社の開発チームが対応してくださいます', FALSE, 1),
    (gen_random_uuid(), q_id, 'はい、弊社の開発チームが対応されます', FALSE, 2),
    (gen_random_uuid(), q_id, 'はい、弊社の開発チームが対応いたします', TRUE, 3),
    (gen_random_uuid(), q_id, 'はい、弊社の開発チームが対応なさいます', FALSE, 4);

END $$;

-- ============================================
-- Post-insert: set question_category and difficulty
-- question_category = 'business_expression' for all expression questions
-- difficulty by sort_order: 初級 1-4, 中級 5-12, 上級 13-25
-- ============================================
UPDATE quiz_questions SET question_category = 'business_expression'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
);

UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 1 AND 4;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 5 AND 12;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 13 AND 25;

COMMIT;
