-- encoding: UTF-8
-- JLPT N2 模試(公式) 聴解 32問 — Set 5
-- quiz_id: ad000002-0000-0000-0000-000000000253
-- 問題1 課題理解(LISTENING_TASK) 5問/問題2 ポイント理解(LISTENING_POINT) 6問
-- 問題3 概要理解(LISTENING_SUMMARY) 5問/問題4 即時応答(LISTENING_QUICK_RESPONSE) 12問
-- 問題5 統合理解(LISTENING_INTEGRATED) 4問

-- ============================================================
-- 問題1 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000001',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女の人が引っ越し業者に電話で相談しています。\n\n女：もしもし、来月引っ越しを考えているんですが、見積もりをお願いできますか。\n男：かしこまりました。まずお荷物の量を確認させていただきたいのですが、写真を撮って送っていただくことは可能でしょうか。\n女：写真ですか。はい、大丈夫です。\n男：ありがとうございます。専用のアプリがございますので、そちらからお部屋の写真をアップロードしていただけますか。ダウンロードのURLをメールでお送りします。\n女：わかりました。\n男：写真を確認しましたら、翌日中にお見積もり金額をご連絡いたします。もしご不明な点があれば、いつでもお電話ください。\n女：はい、ありがとうございます。それでは、メールを待っています。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '男性(業者)が「専用のアプリがございますので、そちらからお部屋の写真をアップロードしていただけますか」と依頼し、女性も了承した。정답은 1번 「アプリをダウンロードして部屋の写真を送る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000001', 'アプリをダウンロードして部屋の写真を送る', true, 1),
('adc20005-0000-0000-0000-000000000001', '業者に来てもらって直接荷物を見てもらう', false, 2),
('adc20005-0000-0000-0000-000000000001', '見積書にサインして返送する', false, 3),
('adc20005-0000-0000-0000-000000000001', '引っ越し日を業者に正式に伝える', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000002',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'病院で男の人と受付が話しています。\n\n男：すみません、来週火曜日の診察の予約を変更したいんですが。\n受付：かしこまりました。お名前とご希望の日程を伺ってもよろしいですか。\n男：田中と申します。できれば木曜日の午後にお願いしたいんですが。\n受付：少々お待ちください……木曜日の午後は現在満席となっておりまして、金曜日の午前でしたら空きがございます。\n男：金曜日の午前ですか。うーん、その日は仕事があって難しいかもしれません。\n受付：でしたら、キャンセル待ちのリストにお名前を入れておくことも可能です。木曜午後にキャンセルが出ましたら、すぐにご連絡いたします。\n男：あ、それでお願いします。連絡先は前と同じでよろしいですか。\n受付：はい、登録されている番号にご連絡いたします。\n\n質問：男の人はこの後どうすることになりましたか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '受付が提案した「木曜午後のキャンセル待ちのリストにお名前を入れておく」に男性が同意した。정답은 2번 「木曜午後のキャンセル待ちに登録する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000002', '金曜日の午前に予約を確定する', false, 1),
('adc20005-0000-0000-0000-000000000002', '木曜午後のキャンセル待ちに登録する', true, 2),
('adc20005-0000-0000-0000-000000000002', '予約を来月まで延期する', false, 3),
('adc20005-0000-0000-0000-000000000002', '電話番号を新しく登録し直す', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000003',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女の人が宅配業者の男性と電話で話しています。\n\n女：もしもし、不在票が入っていたので、再配達をお願いしたいんですが。\n男：かしこまりました。伝票番号を教えていただけますか。\n女：えっと、12345678です。\n男：確認いたします……こちらの荷物ですね。お届け希望の時間帯はいつがよろしいでしょうか。\n女：今日の夜、19時から21時の間でお願いできますか。\n男：申し訳ございません、本日19時以降の便はすでに予約がいっぱいでして、明日の同じ時間帯でしたらご案内できます。\n女：そうですか……。それなら明日で大丈夫です。\n男：かしこまりました。明日19時から21時の間でお届けいたします。\n女：お願いします。\n\n質問：女の人の荷物はいつ届けられることになりましたか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '男性は「明日の同じ時間帯でしたらご案内できます」と言い、女性が了承した。정답은 3번 「明日の19時から21時の間」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000003', '今日の19時から21時の間', false, 1),
('adc20005-0000-0000-0000-000000000003', '今日の午前中', false, 2),
('adc20005-0000-0000-0000-000000000003', '明日の19時から21時の間', true, 3),
('adc20005-0000-0000-0000-000000000003', '明日の午前中', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000004',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'家電量販店で女の人と店員が話しています。\n\n女：すみません、先週買った掃除機なんですが、電源が急に切れてしまうことがあって。\n店員：それは申し訳ございません。レシートと保証書はお持ちでしょうか。\n女：はい、両方持ってきました。\n店員：確認いたします……購入から1週間以内ですので、初期不良として無料で交換させていただけます。ただ、今店頭に同じ型番の在庫がなく、取り寄せになりますが、よろしいでしょうか。\n女：どのくらいかかりますか。\n店員：3日ほどお時間をいただきます。届き次第、お電話でご連絡いたしますので、その際にご来店いただければと思います。\n女：わかりました。それでお願いします。\n店員：では、こちらの交換申込書にご記入いただけますか。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '店員が最後に「こちらの交換申込書にご記入いただけますか」と依頼している。정답은 4번 「交換申込書に記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000004', '新しい掃除機を店頭で受け取る', false, 1),
('adc20005-0000-0000-0000-000000000004', '修理代金を支払う', false, 2),
('adc20005-0000-0000-0000-000000000004', '3日後に店に電話をする', false, 3),
('adc20005-0000-0000-0000-000000000004', '交換申込書に記入する', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000005',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'大学の研究室で女子学生と教授が話しています。\n\n学生：先生、卒業論文のテーマなんですが、少し変更したいと思っていて。\n教授：どのように変えたいんですか。\n学生：最初は地域経済について書こうと思っていたんですが、もっと環境政策について調べたくなって。\n教授：なるほど、面白そうですね。ただ、テーマを変更する場合は、研究計画書を書き直して、来週の金曜日までに提出してもらう必要がありますよ。\n学生：わかりました。書式は前と同じでいいですか。\n教授：ええ、同じフォーマットで大丈夫です。書き終えたら、メールで送ってください。先に目を通しておきますので。\n学生：ありがとうございます。今日中に書き始めます。\n\n質問：学生はこれから何をしなければなりませんか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  '教授は「研究計画書を書き直して来週金曜日までに提出」「書き終えたらメールで送ってください」と言った。정답은 1번 「研究計画書を書き直してメールで送る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000005', '研究計画書を書き直してメールで送る', true, 1),
('adc20005-0000-0000-0000-000000000005', '地域経済についての資料を集める', false, 2),
('adc20005-0000-0000-0000-000000000005', '卒業論文をすぐに書き始める', false, 3),
('adc20005-0000-0000-0000-000000000005', '教授に新しいテーマの許可を口頭でもらう', false, 4);

-- ============================================================
-- 問題2 ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000006',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'ラジオで住宅ローンの専門家が話しています。\n\n男：今日は住宅ローンを選ぶ際の注意点についてお話しします。多くの方が金利の低さだけに注目しがちですが、実は変動金利と固定金利、それぞれにリスクがあります。変動金利は現在の金利が低くても、将来上昇する可能性があり、返済額が増えるおそれがあります。一方、固定金利は最初の金利が高めですが、返済計画が立てやすいという利点があります。大切なのは、金利の数字だけでなく、自分の収入の見通しやライフプランに合わせて、無理のない返済計画を立てることです。\n\n質問：この専門家が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「大切なのは...自分の収入の見通しやライフプランに合わせて、無理のない返済計画を立てることです」と明言している。정답은 2번 「自分の状況に合わせて無理のない返済計画を立てることが重要だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000006', '変動金利を選んだほうが必ず得をする', false, 1),
('adc20005-0000-0000-0000-000000000006', '自分の状況に合わせて無理のない返済計画を立てることが重要だ', true, 2),
('adc20005-0000-0000-0000-000000000006', '固定金利は将来的に必ず値上がりする', false, 3),
('adc20005-0000-0000-0000-000000000006', '住宅ローンは金利が最も低い銀行を選ぶべきだ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000007',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'会社で男女社員が話しています。\n\n男：今週の新人研修、どうでしたか。\n女：思ったより内容が濃くて、正直ついていくのが大変でした。特にシステムの操作説明が早くて、メモを取る時間もあまりなくて。\n男：ああ、それはよく聞きます。私も新人の頃、同じように感じました。\n女：あと、資料は配られたんですけど、専門用語が多くて、後で読み返しても理解できないところが結構あって。\n男：それなら、わからないところは遠慮せずに先輩に聞いたほうがいいですよ。\n女：そうですね。今度からそうします。\n\n質問：女の人は新人研修について何を感じていますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '女性は「操作説明が早くて」「専門用語が多くて後で読み返しても理解できない」と述べている。정답은 3번 「説明のスピードが速く資料も理解しにくかったこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000007', '研修の日数が短すぎたこと', false, 1),
('adc20005-0000-0000-0000-000000000007', '先輩が質問に答えてくれなかったこと', false, 2),
('adc20005-0000-0000-0000-000000000007', '説明のスピードが速く資料も理解しにくかったこと', true, 3),
('adc20005-0000-0000-0000-000000000007', '研修の場所が不便だったこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000008',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'空港のアナウンスを聞いています。\n\n男：ご搭乗のお客様にお知らせいたします。天候不良の影響により、東京行き123便は出発が約1時間遅れる見込みでございます。新しい出発時刻は決まり次第、こちらの案内板にてお知らせいたします。お客様には大変ご迷惑をおかけいたしますが、しばらく搭乗口付近でお待ちいただきますようお願いいたします。なお、お飲み物のサービスをただいま搭乗口カウンターにてご用意しておりますので、ご自由にお取りください。\n\n質問：このアナウンスによると、乗客はどうすればよいですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '「新しい出発時刻は...案内板にてお知らせいたします」「搭乗口付近でお待ちいただきますよう」라고 안내하고 있다. 정답은 4번 「搭乗口付近で新しい出発時刻の案内を待つ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000008', 'すぐに別の便に振り替える', false, 1),
('adc20005-0000-0000-0000-000000000008', '案内カウンターで払い戻しを申請する', false, 2),
('adc20005-0000-0000-0000-000000000008', '荷物を預けなおす', false, 3),
('adc20005-0000-0000-0000-000000000008', '搭乗口付近で新しい出発時刻の案内を待つ', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000009',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'スポーツジムで女性客と店員が話しています。\n\n店員：本日は体験にお越しいただきありがとうございます。ご入会をご検討されているとのことですが、コースについて何かご希望はありますか。\n客：そうですね、仕事が忙しいので、好きな時間に通えるコースがいいんですが。\n店員：でしたら、こちらの24時間いつでも利用できるプランがおすすめです。ただ、混雑する夜の時間帯は器具が使えないこともあります。\n客：そうなんですね。あと、初めてなので、トレーナーの方に教えてもらえるプランもありますか。\n店員：はい、月2回まで無料でパーソナルトレーニングが受けられるプランもございます。\n客：それ、魅力的ですね。ちょっと料金表を見せていただけますか。\n\n質問：客がジムに求めている最も重要な条件は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '客は最初に「好きな時間に通えるコースがいい」と述べている。정답은 1번 「好きな時間にいつでも通えること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000009', '好きな時間にいつでも通えること', true, 1),
('adc20005-0000-0000-0000-000000000009', 'トレーナーが無料で教えてくれること', false, 2),
('adc20005-0000-0000-0000-000000000009', '料金がなるべく安いこと', false, 3),
('adc20005-0000-0000-0000-000000000009', '器具の種類が豊富であること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000010',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'テレビでインタビューを聞いています。\n\n司会：中村さんは30年間、伝統的な陶芸の技術を守り続けていらっしゃいますね。この仕事を続ける理由は何ですか。\n中村：正直、若い頃は苦しいことばかりでした。何年も同じ作業を繰り返して、なかなか納得のいく作品ができなかった。それでも続けられたのは、土と向き合う時間そのものが好きだったからです。今でも、思い通りの形ができた瞬間の喜びは何ものにも代えがたいですね。それが、これまで続けてこられた一番の理由だと思います。\n\n質問：中村さんが陶芸を続けている最も大きな理由は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '「土と向き合う時間そのものが好きだった」「思い通りの形ができた瞬間の喜びは何ものにも代えがたい」と述べている。정답은 2번 「作品を作る過程そのものに喜びを感じるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000010', '高い収入が得られるから', false, 1),
('adc20005-0000-0000-0000-000000000010', '作品を作る過程そのものに喜びを感じるから', true, 2),
('adc20005-0000-0000-0000-000000000010', '弟子に技術を伝える使命があるから', false, 3),
('adc20005-0000-0000-0000-000000000010', '若い頃から有名になりたかったから', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000011',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'電話で男性客と不動産屋の女性が話しています。\n\n女：はい、さくら不動産でございます。\n男：あの、ホームページに載っていた駅前のマンションについて、内見を予約したいんですが。\n女：ありがとうございます。ご希望の日時はございますか。\n男：今週の土曜日の午後は空いていますか。\n女：確認します……申し訳ございません、土曜日の午後はすでに予約が入っておりまして、日曜日の午前でしたらご案内できます。\n男：日曜日の午前ですね。大丈夫です。\n女：かしこまりました。当日は身分証明書をお持ちいただけますでしょうか。\n男：わかりました、持って行きます。\n女：では日曜日の10時に現地でお待ちしております。\n\n質問：男の人はいつ物件を見に行くことになりましたか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '女性は「日曜日の午前でしたらご案内できます」と提案し、男性も了承した。정답은 3번 「今週の日曜日の午前」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000011', '今週の土曜日の午後', false, 1),
('adc20005-0000-0000-0000-000000000011', '今週の土曜日の午前', false, 2),
('adc20005-0000-0000-0000-000000000011', '今週の日曜日の午前', true, 3),
('adc20005-0000-0000-0000-000000000011', '今週の日曜日の午後', false, 4);

-- ============================================================
-- 問題3 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000012',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：在宅勤務が広まってから数年が経ちますが、私が最近特に感じているのは、働く時間と休む時間の境目がなくなってしまう危うさです。オフィスに行かない分、通勤時間はなくなりましたが、その分いつでも仕事ができてしまうので、つい夜遅くまでパソコンに向かってしまう人が増えています。効率的に働くためには、始業と終業の時間をきちんと決めて、仕事用の空間と休む空間を分けるといった工夫が必要だと思います。\n\n質問：この女の人が最も心配していることは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '「働く時間と休む時間の境目がなくなってしまう危うさ」を最も心配している。정답은 4번 「仕事と休みの境目がなくなってしまうこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000012', '在宅勤務では仕事の効率が落ちること', false, 1),
('adc20005-0000-0000-0000-000000000012', '通勤時間がなくなり運動不足になること', false, 2),
('adc20005-0000-0000-0000-000000000012', '在宅勤務のための設備費用がかかること', false, 3),
('adc20005-0000-0000-0000-000000000012', '仕事と休みの境目がなくなってしまうこと', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000013',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'講演会で男の人が話しています。\n\n男：リーダーシップというと、強く引っ張っていく力をイメージする方が多いかもしれません。しかし、私がこれまで多くの現場で見てきた優れたリーダーに共通しているのは、むしろ「聞く力」なんです。部下やチームメンバーの意見にきちんと耳を傾け、彼らが何を考え、何に困っているのかを理解しようとする姿勢。それがあってこそ、初めて的確な判断ができるし、周りもついてきてくれる。指示を出す前に、まず聞く。これが私の考えるリーダーシップの基本です。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '「優れたリーダーに共通しているのは...聞く力」「指示を出す前に、まず聞く」と明言している。정답은 1번 「優れたリーダーには相手の話をよく聞く姿勢が欠かせない」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000013', '優れたリーダーには相手の話をよく聞く姿勢が欠かせない', true, 1),
('adc20005-0000-0000-0000-000000000013', 'リーダーは強い意志で部下を引っ張るべきだ', false, 2),
('adc20005-0000-0000-0000-000000000013', 'リーダーになるには豊富な経験が必要だ', false, 3),
('adc20005-0000-0000-0000-000000000013', 'リーダーはチームの意見をまとめて指示を出すだけでよい', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000014',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'ニュースで女の人がレポートしています。\n\n女：来月、市内の中央公園で、地域住民が中心となって企画した秋祭りが開催されます。これまで自治体が主催してきた祭りですが、今年から住民ボランティアが企画から運営まで担当することになりました。参加者からは「地域の人がもっと交流できる祭りになりそうで楽しみ」という声がある一方、「ボランティアだけで運営できるのか」と不安視する意見も出ています。実行委員会は、当日はスタッフを増員して対応する予定だと説明しています。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '住民主催での秋祭り開催と、期待の声・不安の声の両方をバランスよく伝えている。정답은 2번 「住民主催の秋祭りの開催とそれに対する期待と不安の声」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000014', '秋祭りが今年から中止になったこと', false, 1),
('adc20005-0000-0000-0000-000000000014', '住民主催の秋祭りの開催とそれに対する期待と不安の声', true, 2),
('adc20005-0000-0000-0000-000000000014', '自治体が祭りの予算を全額負担すること', false, 3),
('adc20005-0000-0000-0000-000000000014', '秋祭りの参加者数が過去最多になったこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000015',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'インタビューで男の人が話しています。\n\n男：私が里山の保全活動を始めたのは10年前です。最初は近所の数人で草刈りをするだけでしたが、今では市外からも参加者が集まるようになりました。活動を通じて実感しているのは、自然は放っておけば守られるわけではなく、人の手が入ることで初めて豊かな環境が保たれるということです。里山も、昔は人々が薪を取ったり田畑を耕したりする中で、多様な生き物が住める環境が保たれていました。今、私たちがやっているのは、その関わりを取り戻す作業なんです。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '「自然は放っておけば守られるわけではなく、人の手が入ることで初めて豊かな環境が保たれる」と述べている。정답은 3번 「自然環境は人が適切に関わることで豊かに保たれる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000015', '里山の保全には多くの資金が必要だ', false, 1),
('adc20005-0000-0000-0000-000000000015', '自然は人が関わらないほうがよく守られる', false, 2),
('adc20005-0000-0000-0000-000000000015', '自然環境は人が適切に関わることで豊かに保たれる', true, 3),
('adc20005-0000-0000-0000-000000000015', '里山の活動は市外の人には難しい', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000016',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：忙しい毎日の中で、読書の時間がなかなか取れないという声をよく聞きます。私自身もそうでしたが、あるとき「毎日30分」ではなく「毎日5分でもいい」と考え方を変えたら、驚くほど読書が続くようになりました。完璧を目指すと、時間が取れない日に「今日はもう無理だ」とやめてしまいがちです。でも、少しでも本を開く習慣を大切にすれば、気づいたときには一冊読み終えている。大切なのは量より、続けることなんです。\n\n質問：この女の人が話しているテーマは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '「毎日5分でもいい」「大切なのは量より、続けること」と述べ、無理なく読書を続ける方法がテーマである。정답은 4번 「無理なく読書を習慣として続ける方法」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000016', '速く本を読むためのテクニック', false, 1),
('adc20005-0000-0000-0000-000000000016', 'おすすめの本の選び方', false, 2),
('adc20005-0000-0000-0000-000000000016', '電子書籍と紙の本の違い', false, 3),
('adc20005-0000-0000-0000-000000000016', '無理なく読書を習慣として続ける方法', true, 4);

-- ============================================================
-- 問題4 即時応答 (LISTENING_QUICK_RESPONSE) — 12問 (sort_order 17-28)
-- 3択のみ
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000017',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：お先に失礼します。お疲れ様でした。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '帰り際の挨拶に対する最も自然な返し。정답은 1번 「お疲れ様でした。お気をつけて」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000017', 'お疲れ様でした。お気をつけて。', true, 1),
('adc20005-0000-0000-0000-000000000017', 'いいえ、先に帰ってください。', false, 2),
('adc20005-0000-0000-0000-000000000017', 'はい、まだ仕事が残っています。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000018',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：この資料、明日までに直しておいてもらえますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '依頼に対して引き受ける返答が最も自然。정답은 2번 「わかりました。今日中に仕上げます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000018', 'いいえ、資料は要りません。', false, 1),
('adc20005-0000-0000-0000-000000000018', 'わかりました。今日中に仕上げます。', true, 2),
('adc20005-0000-0000-0000-000000000018', 'はい、明日の会議は中止です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000019',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：これ、私が作ったクッキーなんですが、よかったらどうぞ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '差し入れをもらった際の感謝の返答が最も自然。정답은 3번 「わあ、ありがとうございます。いただきます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000019', 'いいえ、料理は苦手なんです。', false, 1),
('adc20005-0000-0000-0000-000000000019', 'はい、材料を買ってきます。', false, 2),
('adc20005-0000-0000-0000-000000000019', 'わあ、ありがとうございます。いただきます。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000020',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：荷物、重そうですね。半分持ちましょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '親切な申し出に対して感謝しながら受け入れる返答が最も自然。정답은 1번 「すみません、助かります。お願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000020', 'すみません、助かります。お願いします。', true, 1),
('adc20005-0000-0000-0000-000000000020', 'いいえ、荷物はもうありません。', false, 2),
('adc20005-0000-0000-0000-000000000020', 'はい、私が持ってあげます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000021',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：あの、これ、私の傘だと思うんですが。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  '相手の傘を間違えて持っていたことに気づいた際の謝罪の返答が最も自然。정답은 2번 「あ、すみません、間違えました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000021', 'はい、雨が降っていますね。', false, 1),
('adc20005-0000-0000-0000-000000000021', 'あ、すみません、間違えました。', true, 2),
('adc20005-0000-0000-0000-000000000021', 'いいえ、傘は持っていません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000022',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：今度の休み、予定ありますか。よかったら食事でもどうですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '誘いを承諾する自然な返答。정답은 3번 「いいですね。ぜひご一緒させてください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000022', 'はい、休みはとても大切です。', false, 1),
('adc20005-0000-0000-0000-000000000022', 'いいえ、食事はもう済みました。', false, 2),
('adc20005-0000-0000-0000-000000000022', 'いいですね。ぜひご一緒させてください。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000023',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：課長、この件、ご相談してもよろしいでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '相談を持ちかけられた上司の自然な応答。정답은 1번 「ええ、いいですよ。どうしましたか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000023', 'ええ、いいですよ。どうしましたか。', true, 1),
('adc20005-0000-0000-0000-000000000023', 'はい、相談は禁止されています。', false, 2),
('adc20005-0000-0000-0000-000000000023', 'いいえ、課長はお休みです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000024',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：あの、コピー機の使い方がよくわからなくて…。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '困っている相手に手助けを申し出るのが最も自然。정답은 2번 「あ、私が使い方を教えましょうか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000024', 'はい、コピー機は壊れています。', false, 1),
('adc20005-0000-0000-0000-000000000024', 'あ、私が使い方を教えましょうか。', true, 2),
('adc20005-0000-0000-0000-000000000024', 'いいえ、コピーは必要ありません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000025',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：さっきお願いしたメール、もう送っていただけましたか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  'まだ完了していない依頼への謝罪と即対応の意志を示す返答が最も自然。정답은 3번 「あ、すみません、今すぐ送ります」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000025', 'いいえ、メールは届いていません。', false, 1),
('adc20005-0000-0000-0000-000000000025', 'はい、明日送るつもりです。', false, 2),
('adc20005-0000-0000-0000-000000000025', 'あ、すみません、今すぐ送ります。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000026',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：申し訳ありませんが、明日の集合時間を1時間早めてもらえますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '依頼への承諾と確認の返答が最も自然。정답은 1번 「わかりました。何時に集まればいいですか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000026', 'わかりました。何時に集まればいいですか。', true, 1),
('adc20005-0000-0000-0000-000000000026', 'いいえ、集合時間は変えられません。', false, 2),
('adc20005-0000-0000-0000-000000000026', 'はい、明日は休みにします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000027',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'女：この書類、印鑑はどこに押せばいいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '場所を尋ねる質問に対して具体的に案内する返答が最も自然。정답은 2번 「こちらの枠の中にお願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000027', 'はい、印鑑をお持ちください。', false, 1),
('adc20005-0000-0000-0000-000000000027', 'こちらの枠の中にお願いします。', true, 2),
('adc20005-0000-0000-0000-000000000027', 'いいえ、印鑑は必要ありません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000028',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'男：明日の説明会、参加人数は何人になりそうですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  28,
  '人数を尋ねる質問に具体的な数字で答えるのが最も自然。정답은 3번 「今のところ、20人ほどの予定です」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000028', 'いいえ、説明会はまだ始まっていません。', false, 1),
('adc20005-0000-0000-0000-000000000028', 'はい、会場は広いです。', false, 2),
('adc20005-0000-0000-0000-000000000028', '今のところ、20人ほどの予定です。', true, 3);

-- ============================================================
-- 問題5 統合理解 (LISTENING_INTEGRATED) — 4問 (sort_order 29-32)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000029',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'大学の休憩室で男女の学生が話しています。\n\n男：来週、面接があるんだけど、何を準備すればいいか迷っていて。\n女：どこの面接？\n男：IT企業なんだけど、志望動機はもう考えてあるんだ。ただ、自己PRがまだうまくまとまらなくて。\n女：それなら、具体的なエピソードを一つ用意しておくといいよ。数字とか結果があると説得力が増すし。\n男：なるほど。あと、逆質問って何を聞けばいいのかもわからなくて。\n女：逆質問は、その会社でしか聞けないことを準備しておくといいよ。給料の話とかはあまり印象がよくないかも。\n男：確かに。じゃあ、まずは自己PRのエピソードから考えてみるよ。\n女：うん、頑張って。\n\n質問：男の学生はこれからまず何をしますか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '男性は最後に「まずは自己PRのエピソードから考えてみるよ」と言った。정답은 1번 「自己PR用の具体的なエピソードを考える」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000029', '自己PR用の具体的なエピソードを考える', true, 1),
('adc20005-0000-0000-0000-000000000029', '逆質問の内容を先に準備する', false, 2),
('adc20005-0000-0000-0000-000000000029', '志望動機を書き直す', false, 3),
('adc20005-0000-0000-0000-000000000029', '給料についての質問を用意する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000030',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'家で夫婦が子供の習い事について話しています。\n\n妻：そろそろ何か習い事を始めさせたいんだけど、何がいいと思う？\n夫：本人はサッカーがやりたいって言ってたよね。\n妻：うん、でも週末の練習が多くて、送り迎えが大変そうなのが心配で。\n夫：それなら、近所にあるスイミングスクールはどう？体力もつくし、送迎バスもあるみたいだよ。\n妻：あ、それいいね。でも本人がやりたいって言ってるのはサッカーだから、無理に変えるのもね…。\n夫：じゃあ、まずは本人にスイミングも見学してもらって、どっちがいいか選んでもらうのはどうかな。\n妻：それがいいかも。無理に決めつけないほうがいいもんね。\n夫：うん、今週末にでも両方の見学に連れて行ってみよう。\n\n質問：夫婦はこれからどうすることにしましたか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '夫が「本人にスイミングも見学してもらって、どっちがいいか選んでもらう」と提案し、妻も同意して「両方の見学に連れて行ってみよう」となった。정답은 2번 「サッカーとスイミングの両方を子供に見学させる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000030', 'すぐにサッカー教室に申し込む', false, 1),
('adc20005-0000-0000-0000-000000000030', 'サッカーとスイミングの両方を子供に見学させる', true, 2),
('adc20005-0000-0000-0000-000000000030', 'スイミングスクールの送迎バスを予約する', false, 3),
('adc20005-0000-0000-0000-000000000030', '子供の意見を聞かずに習い事を決める', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000031',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'健康番組でコメンテーターのAさんとBさんが話しています。\n\n司会：今日は健康診断の受け方について、お二人に伺います。Aさん、まず何が大切だとお考えですか。\nAさん（女）：多くの人が結果の数値だけを見て一喜一憂しますが、それだけでは不十分です。前回の数値と比較して、どう変化しているかを見ることが大事なんです。\nBさん（男）：私も同感です。一回の結果だけで判断せず、経年の変化を追うことで、体の異変に早く気づけます。\nAさん：それから、異常がなかったからといって安心しきってしまうのも問題ですね。生活習慣を見直すきっかけとして活用してほしいです。\nBさん：ええ、結果を受け取って終わりにせず、日々の生活にどう反映させるかが本当に重要だと思います。\n司会：お二人とも、数値の推移と生活への活用が大切だというお考えなんですね。\n\n質問：AさんとBさんが共通して述べていることは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  31,
  '両者とも「前回との比較・経年の変化を見ること」「生活習慣への反映が重要であること」を共通して述べている。정답은 3번 「数値の変化を追い、生活改善に活用することが大切だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000031', '健康診断は毎月受けるべきだ', false, 1),
('adc20005-0000-0000-0000-000000000031', '数値が正常なら何もしなくてよい', false, 2),
('adc20005-0000-0000-0000-000000000031', '数値の変化を追い、生活改善に活用することが大切だ', true, 3),
('adc20005-0000-0000-0000-000000000031', '健康診断の結果は医師にしか判断できない', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20005-0000-0000-0000-000000000032',
  'ad000002-0000-0000-0000-000000000253',
  'audio_listening',
  E'会社で社内システムの移行について社員が話しています。\n\n田中：来月から新しい勤怠管理システムに切り替わりますが、皆さんに周知しておきたいことがあります。\n山田：新しいシステム、今のものと結構違うんですか。\n田中：はい、スマートフォンアプリからも打刻できるようになりますし、有給申請もアプリ上で完結します。\n佐藤：それは便利ですね。でも、みんなすぐに使いこなせるか少し心配です。\n木村：確かに、年配の社員の方は操作に慣れるまで時間がかかるかもしれませんね。\n田中：そのために、来週、全部署対象の説明会を2回開催する予定です。実際に操作しながら説明しますので、わからないことはその場で質問してもらえればと思います。\n佐藤：それなら安心ですね。\n田中：はい、参加できない方には後日、録画した動画も共有しますので、ご安心ください。\n\n質問：新しいシステムへの移行に際して、会社が対応することは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  32,
  '田中が「説明会を2回開催」「参加できない方には録画した動画も共有します」と説明している。정답은 4번 「操作説明会を開催し録画も共有する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20005-0000-0000-0000-000000000032', '年配の社員だけを対象に個別指導を行う', false, 1),
('adc20005-0000-0000-0000-000000000032', 'アプリの機能を制限して使いやすくする', false, 2),
('adc20005-0000-0000-0000-000000000032', 'システムの導入を来年まで延期する', false, 3),
('adc20005-0000-0000-0000-000000000032', '操作説明会を開催し録画も共有する', true, 4);
