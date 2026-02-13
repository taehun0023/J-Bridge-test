-- ============================================
-- ビジネス表現テスト Seed Data (3セット × 20問)
-- quiz_type: 'business_expression', is_assessment: FALSE
-- Total: 60 questions, 240 options
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
    (gen_random_uuid(), q_id, '今日やることを言います', FALSE, 2),
    (gen_random_uuid(), q_id, '会議の内容を教えてあげます', FALSE, 3),
    (gen_random_uuid(), q_id, '今日の話題はこれだよ', FALSE, 4);

  -- Q2: 会議で意見を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議中に自分の意見を述べる際、最も丁寧な表現はどれですか？',
    '「私の意見を申し上げてもよろしいでしょうか」は会議で意見を述べる前に許可を求める丁寧な表現です。「申し上げる」は「言う」の謙譲語です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私の考えを言わせてもらいます', FALSE, 1),
    (gen_random_uuid(), q_id, '私の意見を申し上げてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '意見があるんだけど', FALSE, 3),
    (gen_random_uuid(), q_id, '自分はこう思うんですが', FALSE, 4);

  -- Q3: 会議で補足する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '同僚の発言に対して補足説明を加えたい場合、最も適切な表現はどれですか？',
    '「この点について補足させていただきます」は相手の発言に情報を追加する際の丁寧な表現です。「させていただく」は許可を求める謙譲表現です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっと付け加えさせて', FALSE, 1),
    (gen_random_uuid(), q_id, 'それについて言いたいことがあります', FALSE, 2),
    (gen_random_uuid(), q_id, 'この点について補足させていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, 'もう少し説明してあげます', FALSE, 4);

  -- Q4: 会議の要約
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の内容をまとめる際、最も適切な表現はどれですか？',
    '「ここまでの内容を整理させていただきます」は会議の途中や最後に内容をまとめる際に使う丁寧な表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'じゃあ、まとめるね', FALSE, 1),
    (gen_random_uuid(), q_id, 'ここまでの内容を整理させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '今までの話をまとめてあげます', FALSE, 3),
    (gen_random_uuid(), q_id, '話を整理してやります', FALSE, 4);

  -- Q5: 会議を閉じる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議を終了する際、最も適切な締めくくりの表現はどれですか？',
    '「本日の会議は以上とさせていただきます。お忙しい中ご参加いただきありがとうございました」は会議を締めくくる際の定型表現です。感謝の言葉を添えるのがマナーです。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議を終わります', FALSE, 1),
    (gen_random_uuid(), q_id, 'もう終わりにしましょう', FALSE, 2),
    (gen_random_uuid(), q_id, '本日の会議は以上とさせていただきます。お忙しい中ご参加いただきありがとうございました', TRUE, 3),
    (gen_random_uuid(), q_id, 'じゃあ、ここまでにします', FALSE, 4);

  -- Q6: 会議で質問する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議中に質問をしたい場合、最も適切な切り出し方はどれですか？',
    '「一点確認させていただきたいのですが」は会議中に質問する際の丁寧な導入表現です。「一点」で質問が一つであることを明示し、相手の負担を軽く感じさせます。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '質問です', FALSE, 1),
    (gen_random_uuid(), q_id, '一点確認させていただきたいのですが', TRUE, 2),
    (gen_random_uuid(), q_id, 'ちょっと聞きたいんだけど', FALSE, 3),
    (gen_random_uuid(), q_id, 'わからないところがあるので教えてください', FALSE, 4);

  -- Q7: 会議で賛成する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司の提案に賛成する際、最もビジネスに適した表現はどれですか？',
    '「おっしゃる通りだと思います。その方向で進めさせていただきます」は上司の意見に賛同し、実行に移す意思を示す丁寧な表現です。「おっしゃる」は「言う」の尊敬語です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そうだと思います', FALSE, 1),
    (gen_random_uuid(), q_id, 'おっしゃる通りだと思います。その方向で進めさせていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, 'いいと思うよ', FALSE, 3),
    (gen_random_uuid(), q_id, '賛成します', FALSE, 4);

  -- Q8: 会議で反対意見を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で反対意見を述べる際、最も適切な表現はどれですか？',
    '「恐れ入りますが、別の観点からご提案させていただいてもよろしいでしょうか」は直接的な反対を避けつつ、代替案を提示するための丁寧な表現です。日本のビジネスでは直接的な反対を避けるのがマナーです。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'それは違うと思います', FALSE, 1),
    (gen_random_uuid(), q_id, '反対です', FALSE, 2),
    (gen_random_uuid(), q_id, 'その案はダメだと思います', FALSE, 3),
    (gen_random_uuid(), q_id, '恐れ入りますが、別の観点からご提案させていただいてもよろしいでしょうか', TRUE, 4);

  -- Q9: 会議の議事録について
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の議事録を後で送ることを伝える際、最も適切な表現はどれですか？',
    '「議事録は後ほど共有させていただきます」は議事録の送付を約束する丁寧な表現です。「後ほど」は「後で」の丁寧語です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '議事録は後で送ります', FALSE, 1),
    (gen_random_uuid(), q_id, '議事録は後ほど共有させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモを後で渡すね', FALSE, 3),
    (gen_random_uuid(), q_id, '議事録を書いてあげます', FALSE, 4);

  -- Q10: 会議で進行役を務める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の進行役として次の議題に移る際、最も適切な表現はどれですか？',
    '「それでは、次の議題に移らせていただきます」は進行役が話題を転換する際の定型表現です。スムーズな会議進行に欠かせないフレーズです。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次の話に行きましょう', FALSE, 1),
    (gen_random_uuid(), q_id, '次のテーマに変えます', FALSE, 2),
    (gen_random_uuid(), q_id, 'それでは、次の議題に移らせていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, '次の話題にするよ', FALSE, 4);

  -- Q11: 打ち合わせの日程調整
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせの日程を調整する際、相手の都合を聞く最も適切な表現はどれですか？',
    '「ご都合のよろしい日時をお知らせいただけますでしょうか」は相手のスケジュールを確認する丁寧な表現です。「ご都合」は「都合」の尊敬語表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いつが空いてますか？', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご都合のよろしい日時をお知らせいただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '暇な日を教えてください', FALSE, 3),
    (gen_random_uuid(), q_id, 'スケジュールを出して', FALSE, 4);

  -- Q12: 打ち合わせで確認事項を切り出す
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '打ち合わせで確認事項がある場合、切り出す表現として最も適切なものはどれですか？',
    '「確認させていただきたい点がございます」は確認事項がある旨を伝える丁寧な表現です。「ございます」は「あります」の丁重語です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '確認したいことがあるんだけど', FALSE, 1),
    (gen_random_uuid(), q_id, '聞きたいことがあります', FALSE, 2),
    (gen_random_uuid(), q_id, '確認させていただきたい点がございます', TRUE, 3),
    (gen_random_uuid(), q_id, 'チェックしたいことがある', FALSE, 4);

  -- Q13: 会議で提案する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で新しいアイデアを提案する際、最も適切な表現はどれですか？',
    '「一つご提案がございますが、ご検討いただけますでしょうか」は提案を切り出す際の丁寧な表現です。提案を押し付けず、検討を依頼する姿勢が大切です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こうしたほうがいいと思う', FALSE, 1),
    (gen_random_uuid(), q_id, '一つご提案がございますが、ご検討いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'アイデアがあるので聞いてください', FALSE, 3),
    (gen_random_uuid(), q_id, 'こうすべきだと思います', FALSE, 4);

  -- Q14: 会議でタスクを引き受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で振られたタスクを引き受ける際、最も適切な表現はどれですか？',
    '「承知いたしました。〇〇までに対応いたします」はタスクを引き受け、期限を明示する丁寧な表現です。「承知いたしました」は「わかりました」の謙譲表現です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わかった、やっておきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'はいはい、了解です', FALSE, 2),
    (gen_random_uuid(), q_id, '承知いたしました。金曜日までに対応いたします', TRUE, 3),
    (gen_random_uuid(), q_id, 'OKです', FALSE, 4);

  -- Q15: 会議で時間が押している時
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の時間が押している場合、進行役として最も適切な発言はどれですか？',
    '「お時間が迫っておりますので、残りの議題は次回に持ち越させていただいてもよろしいでしょうか」は時間切れを丁寧に伝え、参加者の合意を得る表現です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '時間がないので終わりにします', FALSE, 1),
    (gen_random_uuid(), q_id, 'お時間が迫っておりますので、残りの議題は次回に持ち越させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'もう時間がないから次にしよう', FALSE, 3),
    (gen_random_uuid(), q_id, '時間オーバーです', FALSE, 4);

  -- Q16: 会議で発言を求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で参加者に意見を求める際、最も適切な表現はどれですか？',
    '「〇〇さん、この件について何かご意見はございますか」は特定の参加者に意見を求める丁寧な表現です。名前を呼んでから質問するのが基本です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '〇〇さん、何か言うことある？', FALSE, 1),
    (gen_random_uuid(), q_id, '〇〇さん、意見を言ってください', FALSE, 2),
    (gen_random_uuid(), q_id, '〇〇さん、この件について何かご意見はございますか', TRUE, 3),
    (gen_random_uuid(), q_id, '〇〇さん、どう思う？', FALSE, 4);

  -- Q17: オンライン会議での音声トラブル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'オンライン会議で相手の音声が途切れた場合、最も適切な表現はどれですか？',
    '「恐れ入りますが、音声が途切れておりましたので、もう一度お願いできますでしょうか」はオンライン会議でのトラブル対応の丁寧な表現です。リモートワークが増えた現在、重要な表現です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '聞こえませんでした。もう一回言ってください', FALSE, 1),
    (gen_random_uuid(), q_id, '恐れ入りますが、音声が途切れておりましたので、もう一度お願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '音が聞こえないよ', FALSE, 3),
    (gen_random_uuid(), q_id, '何て言った？', FALSE, 4);

  -- Q18: 会議で決定事項を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の最後に決定事項を確認する際、最も適切な表現はどれですか？',
    '「本日の決定事項を確認させていただきます」は会議の締めくくりで決定事項を振り返る際の定型表現です。認識の齟齬を防ぐために重要なプロセスです。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決まったことを言います', FALSE, 1),
    (gen_random_uuid(), q_id, '本日の決定事項を確認させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '今日決めたことはこれです', FALSE, 3),
    (gen_random_uuid(), q_id, '確認しておくね', FALSE, 4);

  -- Q19: 会議で資料を共有する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で画面共有をして資料を見せる際、最も適切な表現はどれですか？',
    '「画面を共有させていただきます。資料の〇ページをご覧ください」は画面共有時の丁寧な案内表現です。IT業界のオンライン会議で頻繁に使います。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '画面を見せるね', FALSE, 1),
    (gen_random_uuid(), q_id, '資料を見てください', FALSE, 2),
    (gen_random_uuid(), q_id, '画面を共有させていただきます。資料の3ページをご覧ください', TRUE, 3),
    (gen_random_uuid(), q_id, '画面を出します', FALSE, 4);

  -- Q20: 会議で次回の予定を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議の最後に次回の打ち合わせ予定を確認する際、最も適切な表現はどれですか？',
    '「次回の打ち合わせは〇月〇日を予定しておりますが、ご都合いかがでしょうか」は次回日程を確認する丁寧な表現です。相手の都合を確認する姿勢が大切です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次は来週やります', FALSE, 1),
    (gen_random_uuid(), q_id, '次回の打ち合わせは来週水曜日を予定しておりますが、ご都合いかがでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '次はいつにする？', FALSE, 3),
    (gen_random_uuid(), q_id, '来週また集まってください', FALSE, 4);

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
    (gen_random_uuid(), q_id, 'こんにちは、〇〇会社の△△です', FALSE, 2),
    (gen_random_uuid(), q_id, 'どうも、△△と言います', FALSE, 3),
    (gen_random_uuid(), q_id, '〇〇会社から来ました△△です', FALSE, 4);

  -- Q2: クライアントの要望を受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントから要望を受けた際、最も適切な応答はどれですか？',
    '「ご要望を承りました。社内で検討の上、改めてご回答させていただきます」はクライアントの要望を受け止め、社内検討後に回答する旨を伝える丁寧な表現です。「承る」は「受ける」の謙譲語です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わかりました。やっておきます', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご要望を承りました。社内で検討の上、改めてご回答させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '了解です。確認します', FALSE, 3),
    (gen_random_uuid(), q_id, 'はい、それでいいと思います', FALSE, 4);

  -- Q3: 納期の相談
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに納期についての相談をする際、最も適切な切り出し方はどれですか？',
    '「納期についてご相談がございます」はクライアントに納期の相談を切り出す際の丁寧な表現です。「ご相談」と「ございます」で敬意を示しています。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '納期を変えてほしいんですが', FALSE, 1),
    (gen_random_uuid(), q_id, '納期についてご相談がございます', TRUE, 2),
    (gen_random_uuid(), q_id, '納期が間に合いません', FALSE, 3),
    (gen_random_uuid(), q_id, '締め切りを延ばしてください', FALSE, 4);

  -- Q4: 納期遅延の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに納期の遅延を報告する際、最も適切な表現はどれですか？',
    '「大変申し訳ございませんが、当初の納期より〇日ほど遅れる見込みでございます。リカバリー策として〜を実施いたします」は遅延報告の際に謝罪と対策を同時に伝える適切な表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '納期に間に合いません。すみません', FALSE, 1),
    (gen_random_uuid(), q_id, '大変申し訳ございませんが、当初の納期より3日ほど遅れる見込みでございます。リカバリー策として増員を実施いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '遅れます。仕方ないです', FALSE, 3),
    (gen_random_uuid(), q_id, '納期を延ばしてもらえますか', FALSE, 4);

  -- Q5: 進捗報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに開発の進捗を報告する際、最も適切な表現はどれですか？',
    '「現時点での進捗状況をご報告いたします。全体の70%が完了しており、予定通りに進んでおります」は具体的な数値を用いて進捗を報告する適切な表現です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '順調に進んでいます', FALSE, 1),
    (gen_random_uuid(), q_id, '現時点での進捗状況をご報告いたします。全体の70%が完了しており、予定通りに進んでおります', TRUE, 2),
    (gen_random_uuid(), q_id, 'だいたいできてます', FALSE, 3),
    (gen_random_uuid(), q_id, '問題なく開発中です', FALSE, 4);

  -- Q6: 仕様変更の確認
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントから仕様変更の依頼を受けた際、影響範囲を確認する最も適切な表現はどれですか？',
    '「仕様変更について承知いたしました。影響範囲を調査の上、工数とスケジュールへの影響をお見積もりさせていただきます」は仕様変更を受けつつ、影響調査を約束する適切な表現です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更するのは難しいです', FALSE, 1),
    (gen_random_uuid(), q_id, 'わかりました。やります', FALSE, 2),
    (gen_random_uuid(), q_id, '仕様変更について承知いたしました。影響範囲を調査の上、工数とスケジュールへの影響をお見積もりさせていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, 'それは追加費用がかかりますよ', FALSE, 4);

  -- Q7: 見積書の提出
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに見積書を提出する際、最も適切な表現はどれですか？',
    '「お見積書を作成いたしましたので、ご確認いただけますでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください」は見積書提出時の丁寧な表現です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '見積もりを送ります', FALSE, 1),
    (gen_random_uuid(), q_id, 'お見積書を作成いたしましたので、ご確認いただけますでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください', TRUE, 2),
    (gen_random_uuid(), q_id, '見積書を見てください', FALSE, 3),
    (gen_random_uuid(), q_id, '金額を出したので確認して', FALSE, 4);

  -- Q8: クライアントからのクレーム対応
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントからバグに関するクレームを受けた際、最初に述べるべき最も適切な表現はどれですか？',
    '「ご不便をおかけして大変申し訳ございません。早急に原因を調査し、対応させていただきます」はクレーム対応の基本です。まず謝罪し、迅速な対応を約束することが重要です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'それは仕様です', FALSE, 1),
    (gen_random_uuid(), q_id, 'バグですね。直します', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご不便をおかけして大変申し訳ございません。早急に原因を調査し、対応させていただきます', TRUE, 3),
    (gen_random_uuid(), q_id, 'すみません。確認します', FALSE, 4);

  -- Q9: 要件定義の確認
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントと要件定義を確認する際、認識合わせをする最も適切な表現はどれですか？',
    '「要件について認識に相違がないか確認させていただきたく存じます」は要件定義の確認を丁寧に切り出す表現です。「存じます」は「思います」の謙譲語です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '要件を確認します', FALSE, 1),
    (gen_random_uuid(), q_id, '要件について認識に相違がないか確認させていただきたく存じます', TRUE, 2),
    (gen_random_uuid(), q_id, '要件が合っているか見てください', FALSE, 3),
    (gen_random_uuid(), q_id, 'これで合ってますか？', FALSE, 4);

  -- Q10: 追加機能の提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに追加機能を提案する際、最も適切な表現はどれですか？',
    '「ユーザビリティの観点から、一点ご提案させていただいてもよろしいでしょうか」は追加機能を提案する際の丁寧な切り出し方です。根拠を示してから提案するのが効果的です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この機能を付けたほうがいいと思います', FALSE, 1),
    (gen_random_uuid(), q_id, 'こうしたら便利ですよ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザビリティの観点から、一点ご提案させていただいてもよろしいでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '追加機能を入れましょう', FALSE, 4);

  -- Q11: テスト結果の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにテスト結果を報告する際、最も適切な表現はどれですか？',
    '「テスト結果についてご報告いたします。全テストケース〇件中、〇件が合格しております」は具体的な数値を用いたテスト結果報告の丁寧な表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストは大丈夫でした', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト結果についてご報告いたします。全テストケース150件中、148件が合格しております', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストは終わりました。問題ないです', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト通ったよ', FALSE, 4);

  -- Q12: リリーススケジュールの提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントにリリーススケジュールを提案する際、最も適切な表現はどれですか？',
    '「リリーススケジュールについてご提案させていただきます。段階的なリリースを推奨いたしますが、いかがでしょうか」は段階的リリースを提案する丁寧な表現です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リリーススケジュールについてご提案させていただきます。段階的なリリースを推奨いたしますが、いかがでしょうか', TRUE, 1),
    (gen_random_uuid(), q_id, 'リリースの日程を決めましょう', FALSE, 2),
    (gen_random_uuid(), q_id, '一気にリリースするのは危険です', FALSE, 3),
    (gen_random_uuid(), q_id, 'スケジュールを出します', FALSE, 4);

  -- Q13: クライアントへのお礼メール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントとの打ち合わせ後にお礼のメールを送る際、最も適切な書き出しはどれですか？',
    '「本日はお忙しい中、お打ち合わせのお時間をいただき、誠にありがとうございました」は打ち合わせ後のお礼メールの定型表現です。相手の忙しさへの配慮を示しています。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今日はありがとうございました', FALSE, 1),
    (gen_random_uuid(), q_id, '本日はお忙しい中、お打ち合わせのお時間をいただき、誠にありがとうございました', TRUE, 2),
    (gen_random_uuid(), q_id, 'ミーティングお疲れ様でした', FALSE, 3),
    (gen_random_uuid(), q_id, '今日の会議、ありがとう', FALSE, 4);

  -- Q14: クライアントの質問に即答できない場合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントからの技術的な質問にすぐ回答できない場合、最も適切な表現はどれですか？',
    '「確認の上、本日中にご回答させていただきます」はすぐに回答できない場合に回答期限を明示する丁寧な表現です。期限を切ることで信頼を維持します。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わかりません。調べます', FALSE, 1),
    (gen_random_uuid(), q_id, '確認の上、本日中にご回答させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, 'ちょっとわからないです', FALSE, 3),
    (gen_random_uuid(), q_id, '後で連絡します', FALSE, 4);

  -- Q15: 障害発生時のクライアント連絡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '本番環境で障害が発生した際、クライアントへの第一報として最も適切な表現はどれですか？',
    '「緊急のご連絡でございます。現在、〇〇システムにおいて障害が発生しております。現在、原因の特定と復旧に全力で取り組んでおります」は障害発生時の第一報として適切な表現です。状況と対応状況を簡潔に伝えることが重要です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムが壊れました', FALSE, 1),
    (gen_random_uuid(), q_id, '障害です。直します', FALSE, 2),
    (gen_random_uuid(), q_id, '緊急のご連絡でございます。現在、受注管理システムにおいて障害が発生しております。現在、原因の特定と復旧に全力で取り組んでおります', TRUE, 3),
    (gen_random_uuid(), q_id, 'サーバーが落ちたみたいです', FALSE, 4);

  -- Q16: 機能追加の費用説明
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに追加開発の費用が発生することを伝える際、最も適切な表現はどれですか？',
    '「恐れ入りますが、こちらの追加機能については別途お見積もりとなりますが、よろしいでしょうか」は追加費用の発生を丁寧に伝える表現です。クッション言葉「恐れ入りますが」で柔らかく伝えています。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '追加料金がかかります', FALSE, 1),
    (gen_random_uuid(), q_id, 'それは別料金ですよ', FALSE, 2),
    (gen_random_uuid(), q_id, '恐れ入りますが、こちらの追加機能については別途お見積もりとなりますが、よろしいでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, 'お金がもっと必要です', FALSE, 4);

  -- Q17: 納品物の説明
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに成果物を納品する際、最も適切な表現はどれですか？',
    '「成果物を納品させていただきます。ご確認の上、ご不明な点やご要望がございましたら、お知らせいただけますと幸いです」は納品時の丁寧な表現です。確認依頼とフィードバック受付を含んでいます。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '完成したので送ります', FALSE, 1),
    (gen_random_uuid(), q_id, '成果物を納品させていただきます。ご確認の上、ご不明な点やご要望がございましたら、お知らせいただけますと幸いです', TRUE, 2),
    (gen_random_uuid(), q_id, 'できあがりました。確認してください', FALSE, 3),
    (gen_random_uuid(), q_id, '納品物を渡します', FALSE, 4);

  -- Q18: クライアントとの契約更新
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントに保守契約の更新について連絡する際、最も適切な表現はどれですか？',
    '「保守契約の更新時期が近づいてまいりましたので、ご連絡させていただきました」は契約更新の連絡を丁寧に切り出す表現です。「まいりました」は「きました」の丁重語です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '契約を更新してください', FALSE, 1),
    (gen_random_uuid(), q_id, '保守契約の更新時期が近づいてまいりましたので、ご連絡させていただきました', TRUE, 2),
    (gen_random_uuid(), q_id, '契約の期限が来ます', FALSE, 3),
    (gen_random_uuid(), q_id, '更新の時期なので連絡しました', FALSE, 4);

  -- Q19: クライアントへの代替案提示
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'クライアントの要望が技術的に難しい場合、代替案を提示する最も適切な表現はどれですか？',
    '「ご要望の実装は技術的に難しい状況でございますが、代替案としてこちらの方法をご提案させていただけますでしょうか」は要望を否定せず代替案を提案する丁寧な表現です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'それは無理です。別の方法にしましょう', FALSE, 1),
    (gen_random_uuid(), q_id, 'できません。他の案があります', FALSE, 2),
    (gen_random_uuid(), q_id, '技術的に不可能です', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご要望の実装は技術的に難しい状況でございますが、代替案としてこちらの方法をご提案させていただけますでしょうか', TRUE, 4);

  -- Q20: プロジェクト完了の報告
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'プロジェクト完了をクライアントに報告する際、最も適切な表現はどれですか？',
    '「プロジェクトが無事完了いたしましたことをご報告申し上げます。ご支援いただき、誠にありがとうございました」はプロジェクト完了報告の丁寧な表現です。クライアントへの感謝を忘れないことが大切です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトが終わりました', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトが無事完了いたしましたことをご報告申し上げます。ご支援いただき、誠にありがとうございました', TRUE, 2),
    (gen_random_uuid(), q_id, '開発が全部終わりました。お疲れ様でした', FALSE, 3),
    (gen_random_uuid(), q_id, '完了です', FALSE, 4);

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
    (gen_random_uuid(), q_id, 'さようなら', FALSE, 2),
    (gen_random_uuid(), q_id, 'バイバイ', FALSE, 3),
    (gen_random_uuid(), q_id, '帰ります', FALSE, 4);

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
    (gen_random_uuid(), q_id, '作業は順調です', FALSE, 2),
    (gen_random_uuid(), q_id, 'だいたいできました', FALSE, 3),
    (gen_random_uuid(), q_id, '進んでいます', FALSE, 4);

  -- Q4: 助けを求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩エンジニアに技術的な質問をする際、最も適切な表現はどれですか？',
    '「お忙しいところ恐れ入りますが、一点ご教示いただけますでしょうか」は先輩や上司に質問する際の丁寧な前置き表現です。相手の忙しさへの配慮と謙虚な姿勢を示しています。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっと教えてください', FALSE, 1),
    (gen_random_uuid(), q_id, 'お忙しいところ恐れ入りますが、一点ご教示いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'これ、わかりません', FALSE, 3),
    (gen_random_uuid(), q_id, '質問があるんですけど', FALSE, 4);

  -- Q5: ミスの謝罪
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '自分のコーディングミスでバグが発生した場合、上司に報告する最も適切な表現はどれですか？',
    '「申し訳ございません。私の確認不足によりバグが発生いたしました。現在修正対応中でございます」はミスを認め、対応状況を報告する適切な表現です。原因の明示と対応状況の報告がポイントです。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグが出ました。すみません', FALSE, 1),
    (gen_random_uuid(), q_id, '申し訳ございません。私の確認不足によりバグが発生いたしました。現在修正対応中でございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'エラーが出ちゃいました', FALSE, 3),
    (gen_random_uuid(), q_id, 'バグを見つけました', FALSE, 4);

  -- Q6: 休暇申請
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に有給休暇を申請する際、最も適切な表現はどれですか？',
    '「恐れ入りますが、〇月〇日にお休みをいただきたく存じますが、よろしいでしょうか」は休暇申請の丁寧な表現です。「いただきたく存じます」は「もらいたいと思います」の謙譲語です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '来週の金曜日、休みます', FALSE, 1),
    (gen_random_uuid(), q_id, '恐れ入りますが、来週金曜日にお休みをいただきたく存じますが、よろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '有給を使いたいんですけど', FALSE, 3),
    (gen_random_uuid(), q_id, '休暇を取ります', FALSE, 4);

  -- Q7: 電話対応の取り次ぎ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '電話を受けて担当者に取り次ぐ際、最も適切な表現はどれですか？',
    '「少々お待ちいただけますでしょうか。担当の者に代わります」は電話の取り次ぎ時の基本表現です。「少々」は「少し」の丁寧語で、待ち時間が短いことを暗示します。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっと待ってください', FALSE, 1),
    (gen_random_uuid(), q_id, '少々お待ちいただけますでしょうか。担当の者に代わります', TRUE, 2),
    (gen_random_uuid(), q_id, '担当者を呼んできます', FALSE, 3),
    (gen_random_uuid(), q_id, '待って。代わるから', FALSE, 4);

  -- Q8: 遅刻の連絡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '電車の遅延で遅刻する場合、上司に連絡する最も適切な表現はどれですか？',
    '「申し訳ございません。電車の遅延により、30分ほど遅れる見込みです。到着後すぐに業務に入ります」は遅刻の連絡として適切な表現です。理由・遅延時間・到着後の対応を簡潔に伝えることが重要です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '遅れます', FALSE, 1),
    (gen_random_uuid(), q_id, '電車が遅れているので遅刻します', FALSE, 2),
    (gen_random_uuid(), q_id, '申し訳ございません。電車の遅延により、30分ほど遅れる見込みです。到着後すぐに業務に入ります', TRUE, 3),
    (gen_random_uuid(), q_id, 'すみません、遅れそうです', FALSE, 4);

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
    (gen_random_uuid(), q_id, 'お疲れ様です', FALSE, 1),
    (gen_random_uuid(), q_id, 'いつもお世話になっております', TRUE, 2),
    (gen_random_uuid(), q_id, 'こんにちは', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご苦労様です', FALSE, 4);

  -- Q11: 作業依頼を受ける
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司から急ぎの作業を依頼された際、最も適切な応答はどれですか？',
    '「承知いたしました。優先的に対応いたします」は急ぎの依頼を受ける際の適切な応答です。「承知いたしました」は「わかりました」の謙譲表現で、ビジネスで最も適切な受諾表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はい、わかりました', FALSE, 1),
    (gen_random_uuid(), q_id, '了解です', FALSE, 2),
    (gen_random_uuid(), q_id, '承知いたしました。優先的に対応いたします', TRUE, 3),
    (gen_random_uuid(), q_id, 'OK、やります', FALSE, 4);

  -- Q12: 体調不良で早退する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '体調不良で早退したい場合、上司に伝える最も適切な表現はどれですか？',
    '「申し訳ございませんが、体調がすぐれないため、早退させていただいてもよろしいでしょうか」は体調不良を理由に早退を申し出る丁寧な表現です。許可を求める形にするのがマナーです。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '具合が悪いので帰ります', FALSE, 1),
    (gen_random_uuid(), q_id, '申し訳ございませんが、体調がすぐれないため、早退させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '体調が悪いから早退したい', FALSE, 3),
    (gen_random_uuid(), q_id, '気分が悪いです', FALSE, 4);

  -- Q13: 会議室の予約
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議室を予約したいことを管理部門に伝える際、最も適切な表現はどれですか？',
    '「お手数ですが、〇月〇日の〇時から会議室Aの予約をお願いできますでしょうか」は会議室予約を依頼する丁寧な表現です。「お手数ですが」は相手に手間をかけることへの配慮を示すクッション言葉です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室を予約してください', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数ですが、来週月曜日の14時から会議室Aの予約をお願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '会議室を取っておいて', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室を使いたいのですが', FALSE, 4);

  -- Q14: 資料の確認依頼
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に作成した資料の確認を依頼する際、最も適切な表現はどれですか？',
    '「お手すきの際に、こちらの資料をご確認いただけますでしょうか」は上司に資料確認を依頼する丁寧な表現です。「お手すき」は「手が空いている」の尊敬語で、相手のスケジュールを配慮しています。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料を見てください', FALSE, 1),
    (gen_random_uuid(), q_id, 'この資料チェックしてもらえますか', FALSE, 2),
    (gen_random_uuid(), q_id, 'お手すきの際に、こちらの資料をご確認いただけますでしょうか', TRUE, 3),
    (gen_random_uuid(), q_id, '資料を確認して', FALSE, 4);

  -- Q15: タスクの優先順位を確認する
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '複数のタスクを抱えている場合、上司に優先順位を確認する最も適切な表現はどれですか？',
    '「現在、〇〇と△△のタスクを抱えておりますが、優先順位についてご指示いただけますでしょうか」は上司に優先順位の指示を仰ぐ丁寧な表現です。現状を説明した上で指示を求めるのがポイントです。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'どっちを先にやればいいですか', FALSE, 1),
    (gen_random_uuid(), q_id, '現在、API開発とテスト作成のタスクを抱えておりますが、優先順位についてご指示いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '仕事が多すぎます', FALSE, 3),
    (gen_random_uuid(), q_id, '優先順位を教えてください', FALSE, 4);

  -- Q16: 相談したいことがある場合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に相談したいことがある場合、切り出す最も適切な表現はどれですか？',
    '「お時間をいただけますでしょうか。ご相談したいことがございます」は上司に相談を持ちかける際の丁寧な表現です。まず時間を確保できるか確認するのがマナーです。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっといいですか', FALSE, 1),
    (gen_random_uuid(), q_id, '相談があるんですけど', FALSE, 2),
    (gen_random_uuid(), q_id, 'お時間をいただけますでしょうか。ご相談したいことがございます', TRUE, 3),
    (gen_random_uuid(), q_id, '話したいことがあります', FALSE, 4);

  -- Q17: コードレビューの依頼
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩にコードレビューを依頼する際、最も適切な表現はどれですか？',
    '「お忙しいところ恐縮ですが、プルリクエストのレビューをお願いできますでしょうか」はコードレビュー依頼の丁寧な表現です。「恐縮ですが」は「恐れ入りますが」と同様のクッション言葉です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レビューお願いします', FALSE, 1),
    (gen_random_uuid(), q_id, 'お忙しいところ恐縮ですが、プルリクエストのレビューをお願いできますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'コードを見てもらえませんか', FALSE, 3),
    (gen_random_uuid(), q_id, 'PRのレビューよろしく', FALSE, 4);

  -- Q18: お礼を述べる
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '先輩にコードレビューをしてもらった後、お礼を述べる最も適切な表現はどれですか？',
    '「丁寧なレビューをいただき、ありがとうございます。いただいたフィードバックを反映いたします」はレビュー後のお礼として適切な表現です。感謝とアクションの両方を伝えることが重要です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レビューありがとう', FALSE, 1),
    (gen_random_uuid(), q_id, '丁寧なレビューをいただき、ありがとうございます。いただいたフィードバックを反映いたします', TRUE, 2),
    (gen_random_uuid(), q_id, 'ありがとうございます', FALSE, 3),
    (gen_random_uuid(), q_id, '見てくれてサンキュー', FALSE, 4);

  -- Q19: 残業の許可を求める
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'タスクが終わらず残業したい場合、上司に許可を求める最も適切な表現はどれですか？',
    '「〇〇の対応が残っておりますので、本日残業させていただいてもよろしいでしょうか」は残業の許可を求める丁寧な表現です。残業理由を明示した上で許可を求めるのがポイントです。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '残業します', FALSE, 1),
    (gen_random_uuid(), q_id, 'バグ修正の対応が残っておりますので、本日残業させていただいてもよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, '仕事が終わらないので帰れません', FALSE, 3),
    (gen_random_uuid(), q_id, '今日は遅くなります', FALSE, 4);

  -- Q20: ホウレンソウの「連絡」と「相談」の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「ホウレンソウ」における「連絡」と「相談」の違いとして最も正しい説明はどれですか？',
    '「連絡」は事実やスケジュールなどの情報を関係者に伝えること、「相談」は判断に迷う事項について上司や先輩の意見を求めることです。この違いを理解することは日本の職場で非常に重要です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「連絡」は事実を伝えること、「相談」は意見を求めること', TRUE, 1),
    (gen_random_uuid(), q_id, '「連絡」も「相談」も同じ意味である', FALSE, 2),
    (gen_random_uuid(), q_id, '「連絡」は口頭で、「相談」はメールで行う', FALSE, 3),
    (gen_random_uuid(), q_id, '「連絡」は上司に、「相談」は同僚に行う', FALSE, 4);

END $$;

COMMIT;
