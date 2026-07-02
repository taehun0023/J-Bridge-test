-- encoding: UTF-8
-- JLPT N2 模試(公式) 聴解 32問 — Set 2
-- quiz_id: ad000002-0000-0000-0000-000000000223
-- 問題1 課題理解(LISTENING_TASK) 5問/問題2 ポイント理解(LISTENING_POINT) 6問
-- 問題3 概要理解(LISTENING_SUMMARY) 5問/問題4 即時応答(LISTENING_QUICK_RESPONSE) 12問
-- 問題5 統合理解(LISTENING_INTEGRATED) 4問

-- ============================================================
-- 問題1 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000001',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'市役所の窓口で女性職員と男の人が話しています。\n\n男：来月、県外に引っ越すことになったので、手続きに来ました。\n女性職員：転出届ですね。まず本人確認書類をご提示いただけますか。\n男：はい、免許証です。\n女性職員：ありがとうございます。転出届を記入していただいた後、転出証明書をお渡しします。それを引っ越し先の市役所に提出してください。\n男：わかりました。今ここで書けばいいですか。\n女性職員：はい、こちらの用紙にご記入ください。記入が終わりましたら、番号札をお取りになってお待ちください。\n男：はい、わかりました。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '職員が「こちらの用紙にご記入ください」と言い、その後「番号札をお取りになってお待ちください」と続けているので、まず行うのは書類への記入。정답은 3번 「転出届の用紙に記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000001', '番号札を取って待つ', false, 1),
('adc20002-0000-0000-0000-000000000001', '転出証明書を引っ越し先に提出する', false, 2),
('adc20002-0000-0000-0000-000000000001', '転出届の用紙に記入する', true, 3),
('adc20002-0000-0000-0000-000000000001', '免許証を新しく作る', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000002',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'電話で男の人と病院の受付が話しています。\n\n男：もしもし、来週火曜日の診察の予約をしているんですが、その日に急な出張が入ってしまって、日程を変更したいんです。\n受付：かしこまりました。お名前を確認させていただけますか。\n男：鈴木と申します。\n受付：鈴木様ですね。ご希望の日程はございますか。\n男：木曜日か金曜日の午後でお願いできますか。\n受付：確認いたします。……木曜日の午後3時でしたら空いております。\n男：では、それでお願いします。\n受付：かしこまりました。変更後の予約確認メールをお送りしますので、届きましたら内容をご確認いただけますか。\n男：はい、わかりました。\n\n質問：男の人はこれから何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '受付が「予約確認メールをお送りしますので、届きましたら内容をご確認いただけますか」と言い、男性も「わかりました」と応じている。정답은 3번 「届いたメールの内容を確認する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000002', '木曜日に病院へ行く', false, 1),
('adc20002-0000-0000-0000-000000000002', '出張の予定を変更する', false, 2),
('adc20002-0000-0000-0000-000000000002', '届いたメールの内容を確認する', true, 3),
('adc20002-0000-0000-0000-000000000002', '診察券を新しく作る', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000003',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'家電量販店で女の人と店員が話しています。\n\n客：すみません、先週買った掃除機なんですが、電源を入れてもすぐ止まってしまうんです。\n店員：それは申し訳ございません。レシートと保証書はお持ちですか。\n客：はい、両方持ってきました。\n店員：ありがとうございます。確認したところ、まだ保証期間内ですので、無料で修理か交換のどちらかをお選びいただけます。\n客：交換のほうがいいです。同じ商品ならすぐ在庫ありますか。\n店員：少々お待ちください。……はい、在庫がございます。では、こちらで交換の手続きをいたしますので、レシートと保証書を一度お預かりしてもよろしいですか。\n客：はい、どうぞ。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '店員が「レシートと保証書を一度お預かりしてもよろしいですか」と聞き、客が「はい、どうぞ」と応じている。정답은 2번 「レシートと保証書を店員に渡す」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000003', '修理が終わるまで待つ', false, 1),
('adc20002-0000-0000-0000-000000000003', 'レシートと保証書を店員に渡す', true, 2),
('adc20002-0000-0000-0000-000000000003', '別の店で同じ商品を探す', false, 3),
('adc20002-0000-0000-0000-000000000003', '保証書を新しく発行してもらう', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000004',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'大学でサークルの先輩と後輩が話しています。\n\n先輩：来週の新歓イベントなんだけど、会場の予約はできてる?\n後輩：はい、学生会館の3階の部屋を予約しました。\n先輩：ありがとう。じゃあ、次はチラシの準備だね。新入生に配るチラシ、もうデザインできてる?\n後輩：デザインはまだで、今日の夜、作ろうと思っています。\n先輩：わかった。デザインができたら、印刷は僕がやっておくよ。それより先に、参加者のリストを作って、飲み物や軽食の数を決めないといけないな。\n後輩：あ、それなら私が今から名簿を確認して、リストを作ります。\n先輩：助かるよ。よろしく。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '後輩が「私が今から名簿を確認して、リストを作ります」と言っている。정답은 3번 「参加者リストを作る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000004', 'チラシのデザインを作る', false, 1),
('adc20002-0000-0000-0000-000000000004', 'チラシを印刷する', false, 2),
('adc20002-0000-0000-0000-000000000004', '参加者リストを作る', true, 3),
('adc20002-0000-0000-0000-000000000004', '飲み物を買いに行く', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000005',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'語学学校の受付で男の学生とスタッフが話しています。\n\n生徒：すみません、今受けている初級クラスなんですが、少し簡単すぎる気がして、中級に変えたいんですが。\nスタッフ：かしこまりました。クラス変更にはレベルチェックのテストを受けていただく必要があります。\n生徒：テストはいつ受けられますか。\nスタッフ：来週の月曜日と水曜日に実施しています。ご都合のよい日を教えていただけますか。\n生徒：月曜日でお願いします。\nスタッフ：かしこまりました。では、こちらの申込用紙にお名前と希望日を記入していただけますか。\n生徒：わかりました。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  'スタッフが「こちらの申込用紙にお名前と希望日を記入していただけますか」と言い、生徒が「わかりました」と応じている。정답은 3번 「申込用紙に記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000005', '中級クラスの授業を受ける', false, 1),
('adc20002-0000-0000-0000-000000000005', 'レベルチェックのテストを受ける', false, 2),
('adc20002-0000-0000-0000-000000000005', '申込用紙に記入する', true, 3),
('adc20002-0000-0000-0000-000000000005', '初級クラスをやめる', false, 4);

-- ============================================================
-- 問題2 ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000006',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：在宅勤務を始めてから、集中できないという声をよく聞きます。実はそのカギは「作業スペースを固定すること」なんです。ダイニングテーブルなど、その場その場で作業をすると、脳が「休む場所」と「働く場所」を区別できなくなり、集中力が落ちてしまいます。専用の作業スペースを一つ決めて、そこでしか仕事をしないようにするだけで、驚くほど集中力が上がりますよ。\n\n質問：この人によると、在宅勤務で集中力を上げる最も重要な方法は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「作業スペースを固定すること」がカギだと述べ、専用の作業スペースを決めれば集中力が上がると説明している。정답은 2번 「作業する場所を一つに固定すること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000006', '静かな音楽をかけながら作業すること', false, 1),
('adc20002-0000-0000-0000-000000000006', '作業する場所を一つに固定すること', true, 2),
('adc20002-0000-0000-0000-000000000006', '決まった時間に休憩を取ること', false, 3),
('adc20002-0000-0000-0000-000000000006', '仕事の前に軽い運動をすること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000007',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'会社で男女が話しています。\n\n男：佐藤さん、新入社員の田中さんへの指導、順調ですか。\n女：それが、先週から少し行き詰まっていて。マニュアル通りに説明しているんですが、田中さんがなかなか理解してくれなくて。\n男：具体的にはどんなところで?\n女：システムの操作方法なんですが、私は口頭で説明するばかりで、実際に一緒に操作しながら教えることをしていなかったんです。今思うと、それが良くなかったなと。\n男：なるほど。実際にやってみせることも大事ですね。\n女：はい、次からは画面を見せながら一緒に操作して、理解度を確認しようと思います。\n\n質問：女の人は指導方法について何を反省していますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '「口頭で説明するばかりで、実際に一緒に操作しながら教えることをしていなかった」と反省している。정답은 2번 「口頭説明ばかりで実際の操作を見せなかったこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000007', 'マニュアルの内容が不十分だったこと', false, 1),
('adc20002-0000-0000-0000-000000000007', '口頭説明ばかりで実際の操作を見せなかったこと', true, 2),
('adc20002-0000-0000-0000-000000000007', '田中さんに厳しく接しすぎたこと', false, 3),
('adc20002-0000-0000-0000-000000000007', '指導の時間を十分に取れなかったこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000008',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'空港のアナウンスを聞いています。\n\n男：ご搭乗のお客様にお知らせいたします。悪天候の影響により、大阪行き123便は出発が約1時間遅れる見込みでございます。お客様には大変ご迷惑をおかけいたしますが、搭乗案内は改めて館内放送でお知らせいたしますので、7番搭乗口付近でお待ちください。なお、お食事券をご希望のお客様は、カウンターまでお越しください。\n\n質問：このアナウンスによると、乗客はこれからどうすればいいですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '「搭乗案内は改めて館内放送でお知らせいたしますので、7番搭乗口付近でお待ちください」라고 안내하고 있다. 정답은 2번 「7番搭乗口付近で次の放送を待つ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000008', 'すぐに別の便に乗り換える', false, 1),
('adc20002-0000-0000-0000-000000000008', '7番搭乗口付近で次の放送を待つ', true, 2),
('adc20002-0000-0000-0000-000000000008', '荷物を預けにカウンターへ行く', false, 3),
('adc20002-0000-0000-0000-000000000008', '航空券を払い戻してもらう', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000009',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'携帯ショップで女の人と店員が話しています。\n\n店員：本日はどのようなご用件でしょうか。\n客：今使っているプランのデータ容量が足りなくて、増やしたいんですが。\n店員：かしこまりました。現在は5ギガのプランをご利用ですね。10ギガのプランですと月額が800円増えますが、20ギガのプランに変更されますと、実は今月から始まったキャンペーンで月額はほとんど変わりません。\n客：え、本当ですか。それは魅力的ですね。\n店員：はい、期間限定のキャンペーンです。ただし、契約は2年間の継続が条件となります。\n客：2年ですか…。ちょっと考えます。とりあえず、20ギガのプランの詳しい資料をいただけますか。\n店員：かしこまりました。\n\n質問：店員の説明によると、20ギガプランの特徴は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '「20ギガのプランに変更されますと、今月から始まったキャンペーンで月額はほとんど変わりません」라고 설명하고 있다. 정답은 2번 「キャンペーンで月額がほとんど変わらない」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000009', '契約期間の制限がない', false, 1),
('adc20002-0000-0000-0000-000000000009', 'キャンペーンで月額がほとんど変わらない', true, 2),
('adc20002-0000-0000-0000-000000000009', '今すぐ申し込むと半額になる', false, 3),
('adc20002-0000-0000-0000-000000000009', '10ギガプランより安い', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000010',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'テレビでインタビューを聞いています。\n\n司会：田村さんは10年間、地域のお祭りの実行委員長を務めていらっしゃいますね。準備で最も苦労されることは何ですか。\n田村：やはり人手の確保ですね。祭りの準備は力仕事も多く、若い人の参加が年々減っています。ただ、最近はSNSで呼びかけたところ、大学生のボランティアが集まってくれるようになりました。彼らのアイデアで、屋台のデザインなども新しくなって、地域の人にも好評です。\n\n質問：田村さんは最近、お祭りの準備がどのように改善されたと言っていますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '「SNSで呼びかけたところ、大学生のボランティアが集まってくれるようになりました」라고 말했다. 정답은 2번 「SNSでの呼びかけで大学生の協力を得られるようになった」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000010', '予算が増えて設備が新しくなった', false, 1),
('adc20002-0000-0000-0000-000000000010', 'SNSでの呼びかけで大学生の協力を得られるようになった', true, 2),
('adc20002-0000-0000-0000-000000000010', '地域住民全員が積極的に参加するようになった', false, 3),
('adc20002-0000-0000-0000-000000000010', '屋台の数を減らして負担を軽くした', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000011',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'電話で女の人と引っ越し業者が話しています。\n\n女：もしもし、来週お願いしている引っ越しの件なんですが、荷物が少し増えてしまって。\n男：かしこまりました。どのくらい増えますでしょうか。\n女：大きい本棚が一つ増えます。あと、段ボールも5箱ほど増える予定です。\n男：確認いたします。……本棚のサイズにもよりますが、恐らく追加料金が3千円ほど発生する可能性がございます。トラックのサイズも大きいものに変更する必要があるかもしれません。\n女：わかりました。それでお願いします。\n男：かしこまりました。当日、本棚のサイズを測らせていただいて、正式な金額をお伝えします。\n\n質問：当初の依頼内容に追加されることになったのは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '「大きい本棚が一つ増えます。あと段ボールも5箱ほど増える」라고 했으므로 정답은 3번 「大きい本棚と段ボール数箱」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000011', '引っ越し日を変更すること', false, 1),
('adc20002-0000-0000-0000-000000000011', 'トラックの台数を増やすこと', false, 2),
('adc20002-0000-0000-0000-000000000011', '大きい本棚と段ボール数箱', true, 3),
('adc20002-0000-0000-0000-000000000011', '荷造り用の資材の追加購入', false, 4);

-- ============================================================
-- 問題3 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000012',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：リモートワークが普及して、通勤のストレスがなくなったという声がある一方で、新しい悩みも生まれています。それは「孤独感」です。オフィスでの雑談や、ちょっとした相談が減り、一人で仕事をしているという感覚が強くなる人が増えているんです。仕事の効率だけを追い求めるのではなく、オンラインでも意識的に同僚とコミュニケーションを取る機会を作ることが、これからの働き方には欠かせないと思います。\n\n質問：この人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '「意識的に同僚とコミュニケーションを取る機会を作ることが欠かせない」라고 강조하고 있다. 정답은 2번 「リモートワークでは意識的な同僚との交流が必要だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000012', 'リモートワークは通勤時間を削減できる', false, 1),
('adc20002-0000-0000-0000-000000000012', 'リモートワークでは意識的な同僚との交流が必要だ', true, 2),
('adc20002-0000-0000-0000-000000000012', 'リモートワークより出社のほうが効率的だ', false, 3),
('adc20002-0000-0000-0000-000000000012', '孤独感を感じる人はリモートワークに向いていない', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000013',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'講演会で男の人が話しています。\n\n男：子育てと仕事の両立というと、多くの人が「時間の使い方」を工夫すればいいと考えがちです。もちろんそれも大切ですが、私が20年間、多くの家庭を見てきて感じるのは、一人で完璧にこなそうとしないことが何より重要だということです。家族、職場、地域のサービス、頼れるものは全部頼っていい。周りに助けを求めることを「弱さ」だと感じる必要はありません。むしろ、それができる人こそ、長く両立を続けられるんです。\n\n質問：この人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '「一人で完璧にこなそうとしないことが何より重要」라고 명언하고 있다. 정답은 2번 「一人で完璧にこなそうとせず周りに頼ることが大切だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000013', '時間管理の技術を身につけることが最も重要だ', false, 1),
('adc20002-0000-0000-0000-000000000013', '一人で完璧にこなそうとせず周りに頼ることが大切だ', true, 2),
('adc20002-0000-0000-0000-000000000013', '子育て中は仕事を減らすべきだ', false, 3),
('adc20002-0000-0000-0000-000000000013', '地域のサービスは信頼できないので使わないほうがいい', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000014',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'ニュースで女の人がレポートしています。\n\n女：シャッターが閉まった店が目立っていたこの商店街ですが、若手経営者たちの取り組みによって、少しずつにぎわいを取り戻しています。空き店舗を安く貸し出し、新しく開業したいという若者を積極的に呼び込んだことがきっかけでした。今では、カフェや雑貨店など個性的な店が並び、週末には遠方から訪れる人も増えているということです。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '「若手経営者たちの取り組みによって、少しずつにぎわいを取り戻しています」라고 전달하고 있다. 정답은 2번 「若手経営者の取り組みで商店街がにぎわいを取り戻したこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000014', '商店街の店舗がすべて閉店したこと', false, 1),
('adc20002-0000-0000-0000-000000000014', '若手経営者の取り組みで商店街がにぎわいを取り戻したこと', true, 2),
('adc20002-0000-0000-0000-000000000014', '商店街の家賃が大幅に値上がりしたこと', false, 3),
('adc20002-0000-0000-0000-000000000014', '遠方からの来訪者が減少していること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000015',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'テレビでインタビューを聞いています。\n\n司会：外国語が上達する人には、どんな共通点がありますか。\n女：私がこれまで多くの学習者を見てきて感じるのは、完璧を求めすぎないことです。間違いを恐れて話さない人より、多少間違えてもどんどん話す人のほうが早く上達します。文法や単語を完璧に覚えてから話そうとすると、いつまでも話せるようにならないんです。とにかく使ってみて、間違いから学んでいく姿勢が一番大切だと思います。\n\n質問：この講師が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '「間違いを恐れて話さない人より、多少間違えてもどんどん話す人のほうが早く上達します」라고 강조하고 있다. 정답은 2번 「間違いを恐れずどんどん話すことが上達の鍵だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000015', '文法を完璧に覚えてから話すべきだ', false, 1),
('adc20002-0000-0000-0000-000000000015', '間違いを恐れずどんどん話すことが上達の鍵だ', true, 2),
('adc20002-0000-0000-0000-000000000015', '単語をたくさん暗記することが最も重要だ', false, 3),
('adc20002-0000-0000-0000-000000000015', '語学学校に通うことが上達の近道だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000016',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'ラジオで男の人が話しています。\n\n男：健康診断の結果を見て、数値が悪かった項目だけを気にして一時的に食事制限をする方が多いのですが、それではあまり意味がありません。大事なのは、その数値が悪くなった生活習慣そのものを見直すことです。例えば、コレステロール値が高いなら、一時的に脂っこい物を我慢するのではなく、日々の食事内容や運動習慣を根本から変えていく必要があります。一時的な対処ではなく、習慣そのものを変える意識を持ってほしいですね。\n\n質問：この人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '「一時的な対処ではなく、習慣そのものを変える意識を持ってほしい」라고 결론짓고 있다. 정답은 3번 「生活習慣そのものを根本から見直すことが重要だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000016', '健康診断は毎年必ず受けるべきだ', false, 1),
('adc20002-0000-0000-0000-000000000016', '数値が悪い項目だけ一時的に食事制限すればよい', false, 2),
('adc20002-0000-0000-0000-000000000016', '生活習慣そのものを根本から見直すことが重要だ', true, 3),
('adc20002-0000-0000-0000-000000000016', 'コレステロール値は運動では改善できない', false, 4);

-- ============================================================
-- 問題4 即時応答 (LISTENING_QUICK_RESPONSE) — 12問 (sort_order 17-28)
-- 3択のみ
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000017',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：傘、お持ちですか。午後から雨が降るそうですよ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '雨の予報を教えてくれた相手に対して、感謝しながら対応を伝える返答が最も自然。정답은 1번 「あ、教えてくれてありがとうございます。持っていきます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000017', 'あ、教えてくれてありがとうございます。持っていきます。', true, 1),
('adc20002-0000-0000-0000-000000000017', 'いいえ、傘は先週買いました。', false, 2),
('adc20002-0000-0000-0000-000000000017', 'はい、今は晴れています。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000018',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：すみません、この書類にサインをお願いできますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  'サインの依頼に応じ、具体的な箇所を確認する返答が最も自然。정답은 2번 「はい、かしこまりました。どちらにサインすればよろしいですか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000018', 'いいえ、書類はまだ届いていません。', false, 1),
('adc20002-0000-0000-0000-000000000018', 'はい、かしこまりました。どちらにサインすればよろしいですか。', true, 2),
('adc20002-0000-0000-0000-000000000018', 'ありがとうございます、サインは結構です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000019',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：新しいオフィス、もう慣れましたか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '慣れたかどうかを尋ねる質問に対して、素直に状況を答える返答が最も自然。정답은 1번 「はい、おかげさまで少しずつ慣れてきました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000019', 'はい、おかげさまで少しずつ慣れてきました。', true, 1),
('adc20002-0000-0000-0000-000000000019', 'いいえ、オフィスはまだ完成していません。', false, 2),
('adc20002-0000-0000-0000-000000000019', 'はい、引っ越しはまだです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000020',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：明日の会議、何時からでしたっけ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '時間を尋ねる質問に対して、具体的な時刻で答えるのが最も自然。정답은 2번 「午前10時からです」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000020', '会議室は3階です。', false, 1),
('adc20002-0000-0000-0000-000000000020', '午前10時からです。', true, 2),
('adc20002-0000-0000-0000-000000000020', '昨日、会議がありました。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000021',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：これ、お土産です。皆さんでどうぞ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  'お土産をもらった際に、感謝を示す返答が最も自然。정답은 1번 「わあ、ありがとうございます。皆でいただきますね」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000021', 'わあ、ありがとうございます。皆でいただきますね。', true, 1),
('adc20002-0000-0000-0000-000000000021', 'いいえ、お土産は買っていません。', false, 2),
('adc20002-0000-0000-0000-000000000021', 'はい、旅行は楽しかったです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000022',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：あの、この席、空いていますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '席が空いているか尋ねる質問に対して、着席を促す返答が最も自然。정답은 1번 「はい、どうぞお座りください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000022', 'はい、どうぞお座りください。', true, 1),
('adc20002-0000-0000-0000-000000000022', 'いいえ、席は予約できません。', false, 2),
('adc20002-0000-0000-0000-000000000022', 'はい、この席は高いです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000023',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：宿題、もう終わった?\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '完了したかどうかを尋ねる質問に直接答える返答が最も自然。정답은 1번 「うん、さっき終わったところ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000023', 'うん、さっき終わったところ。', true, 1),
('adc20002-0000-0000-0000-000000000023', 'いや、宿題は好きじゃない。', false, 2),
('adc20002-0000-0000-0000-000000000023', 'うん、明日提出だよ。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000024',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：この道でいいんでしょうか、ちょっと不安で。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '道が合っているか不安を訴える相手に対して、安心させる案内をする返答が最も自然。정답은 1번 「はい、この道で合っていますよ。まっすぐ行けば着きます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000024', 'はい、この道で合っていますよ。まっすぐ行けば着きます。', true, 1),
('adc20002-0000-0000-0000-000000000024', 'いいえ、道に迷ったことはありません。', false, 2),
('adc20002-0000-0000-0000-000000000024', 'はい、道は広いですね。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000025',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：新しいプロジェクトのリーダー、引き受けてくれる?\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  'リーダー就任を依頼された際に、謙遜しながら引き受ける返答が最も自然。정답은 1번 「はい、経験はまだ浅いですが、精一杯やらせていただきます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000025', 'はい、経験はまだ浅いですが、精一杯やらせていただきます。', true, 1),
('adc20002-0000-0000-0000-000000000025', 'いいえ、プロジェクトはもう終わりました。', false, 2),
('adc20002-0000-0000-0000-000000000025', 'はい、リーダーは他の人に任せます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000026',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：さっきのメール、届きましたか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  'メールが届いたかを確認する質問に対して、受け取りを伝える返答が最も自然。정답은 1번 「はい、確認いたしました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000026', 'はい、確認いたしました。', true, 1),
('adc20002-0000-0000-0000-000000000026', 'いいえ、メールは送っていません。', false, 2),
('adc20002-0000-0000-0000-000000000026', 'はい、明日送ります。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000027',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'女：風邪気味なので、お先に失礼してもいいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '体調不良で早退を申し出た相手を気遣う返答が最も自然。정답은 1번 「ええ、どうぞお大事に」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000027', 'ええ、どうぞお大事に。', true, 1),
('adc20002-0000-0000-0000-000000000027', 'いいえ、風邪はうつりません。', false, 2),
('adc20002-0000-0000-0000-000000000027', 'はい、まだ帰らないでください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000028',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'男：この機械、使い方教えてもらえますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  28,
  '使い方を教えてほしいという依頼に応じる返答が最も自然。정답은 1번 「はい、いいですよ。一緒にやってみましょう」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000028', 'はい、いいですよ。一緒にやってみましょう。', true, 1),
('adc20002-0000-0000-0000-000000000028', 'いいえ、機械は壊れています。', false, 2),
('adc20002-0000-0000-0000-000000000028', 'はい、機械は新しく買いました。', false, 3);

-- ============================================================
-- 問題5 統合理解 (LISTENING_INTEGRATED) — 4問 (sort_order 29-32)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000029',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'カフェで女性と男性が話しています。\n\n女：今度、フィットネスジムに入ろうと思ってるんだけど、どのプランがいいか迷ってて。\n男：条件は何かあるの?\n女：うん、仕事帰りに寄りたいから、夜10時くらいまで営業してるところがいい。あと、初心者だからトレーナーに相談できるプランがいいな。\n男：会員費は?\n女：月1万円以内で考えてる。\n男：じゃあ、駅前のジムはどう?夜11時まで営業していて、月額8千円の会員費に、月2回までトレーナー相談が無料でついてくるプランがあるって。\n女：それいいかも!場所も駅前だから通いやすいし。\n男：うん、それに決めたら?\n女：そうする!ありがとう。\n\n質問：女の人がジムに求めている条件に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '女性の条件은 夜遅くまで営業していること、トレーナーに相談できること、月1万円以内であること。これに最もあてはまるのは2번 「夜遅くまで営業・トレーナー相談あり・月1万円以内」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000029', '早朝営業・トレーナー相談なし・月2万円', false, 1),
('adc20002-0000-0000-0000-000000000029', '夜遅くまで営業・トレーナー相談あり・月1万円以内', true, 2),
('adc20002-0000-0000-0000-000000000029', '24時間営業・個人トレーニングのみ・月5千円', false, 3),
('adc20002-0000-0000-0000-000000000029', '昼間営業・少人数制・月1万5千円', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000030',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'家で夫婦が引っ越し先のマンションについて話しています。\n\n夫：来月の引っ越し先、駅から近いマンションと、少し遠いけど広いマンション、どっちがいいと思う?\n妻：子供の通学のことを考えると、駅から近いほうが便利だけど、家の中が狭いと荷物が入らないかも。\n夫：確かに。あと、子供の部屋も欲しいって言ってたよね。\n妻：うん。それに、最近在宅勤務が増えたから、私も仕事用の部屋が一つ欲しいな。\n夫：じゃあ、駅から遠くても部屋数が多いほうがよさそうだね。\n妻：そうね。でも遠すぎると通勤が大変だから、バスで15分以内のところがいいな。\n夫：わかった。それなら、この前見た「さくらマンション」がちょうどいいかも。部屋数も多いし、バスで10分だし。\n妻：いいね、それに決めよう。\n\n質問：夫婦が新しいマンションに求めている条件に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '夫婦는 「バスで15分以内」「部屋数が多いほう」を希望しており、決まった「さくらマンション」はバスで10分・部屋数が多い。정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000030', '駅から徒歩5分・部屋数が少ない', false, 1),
('adc20002-0000-0000-0000-000000000030', 'バスで10分以内・部屋数が多い', true, 2),
('adc20002-0000-0000-0000-000000000030', '駅から遠くて安い・部屋が狭い', false, 3),
('adc20002-0000-0000-0000-000000000030', '駅から近い・在宅勤務用の部屋がない', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000031',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'健康番組でコメンテーターのAさんとBさんが話しています。\n\n司会：今日は腰痛予防について、お二人にお伺いします。まずAさん、原因は何でしょうか。\nAさん（女）：長時間同じ姿勢でいることが大きな原因の一つです。特にデスクワークの方は、座りっぱなしで背中や腰に負担がかかりやすいんです。\nBさん（男）：私も同感です。ただ、姿勢だけでなく、筋力の低下も見逃せません。腹筋や背筋が弱いと、腰への負担がさらに大きくなります。\nAさん：そうですね。ですから、1時間に一度は立ち上がって軽くストレッチをすることをお勧めします。\nBさん：それに加えて、日常的に軽い筋トレを取り入れることも大事です。姿勢を整えるだけでなく、筋力もつけていく。両方が必要だと思います。\n司会：お二人に共通しているのは、姿勢と筋力、両方への対策が必要ということですね。\n\n質問：AさんとBさんが共通して述べていることは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  31,
  'Aさんは姿勢改善(ストレッチ)、Bさんは筋力強化を挙げつつ、両方とも「両方への対策が必要」という点で一致している。정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000031', '腰痛には温めることが最も効果的だ', false, 1),
('adc20002-0000-0000-0000-000000000031', 'デスクワークをやめることが根本的な解決策だ', false, 2),
('adc20002-0000-0000-0000-000000000031', 'こまめな姿勢改善と筋力強化の両方が必要だ', true, 3),
('adc20002-0000-0000-0000-000000000031', '腰痛は年齢とともに自然に治る', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20002-0000-0000-0000-000000000032',
  'ad000002-0000-0000-0000-000000000223',
  'audio_listening',
  E'会社で忘年会の店について社員が話しています。\n\n田中：来月の忘年会なんですが、和食のお店と、洋食のビュッフェのお店、2つで迷っていて、意見を聞かせてください。\n山田：和食のお店、雰囲気は落ち着いていていいですよね。\n佐藤：でも、苦手な食材がある人には向かないかもしれないですね。好き嫌いが分かれそうです。\n田中：確かにそこが気になっていて。\n木村：ビュッフェなら、好きな物を好きなだけ食べられるから、みんな満足できるんじゃないですか。ただ、去年もビュッフェでしたよね。\n田中：そうなんです。去年もビュッフェだったので、また同じだと新鮮味がないかなと。\n佐藤：和食のお店も、実はコースの中に選べるメニューがあって、苦手な食材を別のものに変更できるらしいですよ。\n木村：それなら、好き嫌いのある人も安心して楽しめますね。\n田中：なるほど、それなら幅広く対応できますね。じゃあ、和食のお店で決まりかな。\n\n質問：和食のお店が選ばれた最も大きな理由は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  32,
  '決め手는「コースの中に選べるメニューがあって、苦手な食材を別のものに変更できる」점、즉 好き嫌いのある人も安心して楽しめる점이다。ビュッフェは去年も利用したという問題があった。정답은 2번 「苦手な食材をメニュー変更できて全員が楽しめるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20002-0000-0000-0000-000000000032', '価格がビュッフェより安いから', false, 1),
('adc20002-0000-0000-0000-000000000032', '苦手な食材をメニュー変更できて全員が楽しめるから', true, 2),
('adc20002-0000-0000-0000-000000000032', '去年も和食のお店で好評だったから', false, 3),
('adc20002-0000-0000-0000-000000000032', '店の場所が会社から近いから', false, 4);
