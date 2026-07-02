-- encoding: UTF-8
-- JLPT N2 模試(公式) 聴解 32問 — Set 3
-- quiz_id: ad000002-0000-0000-0000-000000000233
-- 問題1 課題理解(LISTENING_TASK) 5問/問題2 ポイント理解(LISTENING_POINT) 6問
-- 問題3 概要理解(LISTENING_SUMMARY) 5問/問題4 即時応答(LISTENING_QUICK_RESPONSE) 12問
-- 問題5 統合理解(LISTENING_INTEGRATED) 4問

-- ============================================================
-- 問題1 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000001',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'病院の受付に女の人が電話をかけています。\n\n女：もしもし、来週の火曜日に予約している田中と申しますが、その日、急な出張が入ってしまって、予約を変更したいんですが。\n男：かしこまりました。田中様ですね。では、いつ頃がご都合よろしいでしょうか。\n女：来週の木曜日か金曜日でお願いできますか。\n男：少々お待ちください……木曜日の午前は空いておりますが、金曜日は予約がいっぱいで難しい状況です。\n女：では、木曜日の午前でお願いします。\n男：かしこまりました。木曜日の午前10時でよろしいでしょうか。確認のメールをお送りしますので、内容をご確認の上、返信をお願いいたします。\n女：はい、わかりました。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '受付が「確認のメールをお送りしますので、内容をご確認の上、返信をお願いいたします」라고 했으므로, 여성이 다음에 할 일은 2번 「確認メールを受け取って返信する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000001', '木曜日の午前に病院へ行く', false, 1),
('adc20003-0000-0000-0000-000000000001', '確認メールを受け取って返信する', true, 2),
('adc20003-0000-0000-0000-000000000001', '金曜日の予約を別の病院で取る', false, 3),
('adc20003-0000-0000-0000-000000000001', '出張の予定を変更する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000002',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'引っ越し業者の事務所で男の人とスタッフが話しています。\n\n男：来月引っ越しをする予定なんですが、見積もりをお願いしたくて。\n女：かしこまりました。荷物の量を確認させていただきたいので、一度お部屋を拝見してもよろしいでしょうか。\n男：はい、大丈夫です。今週末はいかがですか。\n女：土曜日でしたら14時に伺えます。\n男：それでお願いします。\n女：では、当日は大きな家具や家電の数をメモしておいていただけると、お見積もりがスムーズに進みます。\n男：わかりました。リストを作っておきます。\n女：よろしくお願いいたします。\n\n質問：男の人はこれから何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '男性은 마지막에 「リストを作っておきます」라고 했다. 정답은 4번 「家具や家電の数をリストにまとめる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000002', '土曜日に業者の事務所を訪ねる', false, 1),
('adc20003-0000-0000-0000-000000000002', '引っ越し業者を他にも探す', false, 2),
('adc20003-0000-0000-0000-000000000002', '荷物をすぐに段ボールに詰め始める', false, 3),
('adc20003-0000-0000-0000-000000000002', '家具や家電の数をリストにまとめる', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000003',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'会社で上司と部下が話しています。\n\n男：来週の海外支社との会議、オンラインでやることになったんだけど、山口さん、設定お願いできる？\n女：はい、大丈夫です。参加者は何人くらいですか。\n男：うちから5人、向こうから3人だから、合計8人だね。\n女：わかりました。では、会議用のアプリでリンクを作成して、皆さんにメールで送ります。\n男：うん、お願い。あと、時差があるから時間の調整も忘れずに。\n女：あ、そうですね。向こうは何時間遅れでしたっけ。\n男：たしか2時間遅れのはずだから、確認しておいて。\n女：はい、まず時差を確認してから、時間を決めますね。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '여성이 마지막에 「まず時差を確認してから、時間を決めますね」라고 했으므로, 먼저 할 일은 1번 「海外支社との時差を確認する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000003', '海外支社との時差を確認する', true, 1),
('adc20003-0000-0000-0000-000000000003', '会議用のリンクをすぐに作成する', false, 2),
('adc20003-0000-0000-0000-000000000003', '参加者にメールを送る', false, 3),
('adc20003-0000-0000-0000-000000000003', '上司に会議の日程を報告する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000004',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'家電量販店で女の人と店員が話しています。\n\n女：すみません、この洗濯機なんですが、家族4人で使うのに十分な容量はどれくらいでしょうか。\n男：4人家族でしたら、8キロから9キロくらいのものがおすすめです。こちらの製品はいかがでしょうか。\n女：あ、いいですね。色は白しかないんですか。\n男：こちらのモデルはグレーもございます。ただ、グレーは在庫が少なく、お取り寄せになる可能性があります。\n女：そうですか。白なら今日持ち帰れますか。\n男：はい、白でしたら在庫がございますので、今日お持ち帰りいただけます。\n女：じゃあ、白にします。配送もお願いできますか。\n男：はい、配送も承っております。伝票をご記入いただければ手続きします。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '店員이 「伝票をご記入いただければ手続きします」라고 했으므로, 여성이 먼저 할 일은 3번 「配送のための伝票を記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000004', 'グレーのモデルを取り寄せてもらう', false, 1),
('adc20003-0000-0000-0000-000000000004', '別の店で価格を比較する', false, 2),
('adc20003-0000-0000-0000-000000000004', '配送のための伝票を記入する', true, 3),
('adc20003-0000-0000-0000-000000000004', '洗濯機を自分で持って帰る', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000005',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'語学学校の事務室で男の学生とスタッフが話しています。\n\n男：すみません、今、通っている中級クラスなんですが、少しレベルが合わない気がして、クラスを変えたいんですが。\n女：かしこまりました。レベルが高すぎると感じますか、それとも低すぎると感じますか。\n男：高すぎる気がします。授業についていくのが大変で。\n女：わかりました。それでしたら、まずレベルチェックのテストを受けていただいて、結果を見てから初級クラスへの変更を検討しましょう。\n男：テストはいつ受けられますか。\n女：今日の午後にも空きがありますので、よろしければ今すぐ受けていただけます。\n男：はい、お願いします。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  'スタッフは「まずレベルチェックのテストを受けていただいて」と言い、男性も「はい、お願いします」と答えている。정답은 2번 「レベルチェックのテストを受ける」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000005', '初級クラスにすぐ変更する', false, 1),
('adc20003-0000-0000-0000-000000000005', 'レベルチェックのテストを受ける', true, 2),
('adc20003-0000-0000-0000-000000000005', '授業料の返金を申請する', false, 3),
('adc20003-0000-0000-0000-000000000005', '別の語学学校を探す', false, 4);

-- ============================================================
-- 問題2 ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000006',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'ラジオで女の人が天気予報を伝えています。\n\n女：週末の天気予報をお伝えします。土曜日は晴れて過ごしやすい一日になりそうですが、日曜日は午後から急に雲が広がり、夕方には雷を伴う激しい雨が降る見込みです。特に日曜日の午後にお出かけの予定がある方は、折りたたみ傘をお持ちになることをおすすめします。また、気温差が大きいので、体調管理にもご注意ください。\n\n質問：この天気予報で最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「日曜日の午後にお出かけの予定がある方は、折りたたみ傘をお持ちになることをおすすめします」라고 했으므로, 정답은 1번 「日曜日の午後の外出には雨具の準備が必要だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000006', '日曜日の午後の外出には雨具の準備が必要だ', true, 1),
('adc20003-0000-0000-0000-000000000006', '週末は両日とも晴天が続く', false, 2),
('adc20003-0000-0000-0000-000000000006', '土曜日は雷を伴う激しい雨になる', false, 3),
('adc20003-0000-0000-0000-000000000006', '来週も気温差の大きい日が続く', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000007',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'社内放送を聞いています。\n\n男：社員の皆様にお知らせします。本日午後3時より、館内全体で防災訓練を実施いたします。訓練開始の合図とともに、エレベーターは使用せず、非常階段を使って1階の駐車場に避難してください。避難の際は、荷物は最小限にし、貴重品のみをお持ちください。訓練終了後は、担当者の指示があるまでその場でお待ちください。\n\n質問：この放送によると、社員は避難の際どうすればよいですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '「エレベーターは使用せず、非常階段を使って」「荷物は最小限にし、貴重品のみをお持ちください」라고 안내하고 있다. 정답은 3번 「非常階段を使い、貴重品のみを持って避難する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000007', 'エレベーターを使って早く避難する', false, 1),
('adc20003-0000-0000-0000-000000000007', '荷物をすべて持って避難する', false, 2),
('adc20003-0000-0000-0000-000000000007', '非常階段を使い、貴重品のみを持って避難する', true, 3),
('adc20003-0000-0000-0000-000000000007', '訓練終了後すぐに仕事に戻る', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000008',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'カフェで店長とスタッフが話しています。\n\n女：来月から出す新しいメニューなんだけど、どんなのがいいと思う？\n男：今、SNSでよく見かける抹茶系のスイーツはどうですか。人気が出そうな気がします。\n女：うーん、抹茶はもう他の店でもたくさん出しているから、うちらしさが出しにくいかも。\n男：それなら、地元の農家から仕入れている果物を使ったパフェとか。\n女：それいいわね。地元産というのは、うちの店のコンセプトにも合ってるし。\n男：じゃあ、季節ごとに果物を変えられるパフェを考えてみます。\n女：うん、それで進めましょう。\n\n質問：新メニューについて、女の人が最も重視していることは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '女性은 抹茶는 「うちらしさが出しにくい」라며 거절하고, 地元産の果物에는「店のコンセプトにも合ってる」라고 긍정했다. 정답은 2번 「他店と差別化でき、店のコンセプトに合うこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000008', 'SNSで話題になっている流行のメニューを取り入れること', false, 1),
('adc20003-0000-0000-0000-000000000008', '他店と差別化でき、店のコンセプトに合うこと', true, 2),
('adc20003-0000-0000-0000-000000000008', '材料費をできるだけ安く抑えること', false, 3),
('adc20003-0000-0000-0000-000000000008', '季節に関係なく一年中同じメニューを出すこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000009',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'ニュースで女の人がレポートしています。\n\n女：政府はこのほど、企業の柔軟な働き方を推進するため、フレックスタイム制度を導入する中小企業への補助金制度を新たに設けると発表しました。従業員が始業・終業の時刻を自分で調整できるこの制度は、大企業を中心に広がってきましたが、中小企業では導入コストの負担から普及が遅れていました。今回の補助金により、中小企業でも制度を取り入れやすくなることが期待されています。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '「フレックスタイム制度を導入する中小企業への補助金制度を新たに設ける」라는 내용을 전하고 있다. 정답은 4번 「中小企業のフレックスタイム導入を後押しする補助金制度」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000009', 'フレックスタイム制度がすべての企業で廃止されること', false, 1),
('adc20003-0000-0000-0000-000000000009', '大企業が中小企業に働き方の指導をすること', false, 2),
('adc20003-0000-0000-0000-000000000009', '従業員の残業時間が大幅に増加していること', false, 3),
('adc20003-0000-0000-0000-000000000009', '中小企業のフレックスタイム導入を後押しする補助金制度', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000010',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'会社で男女が話しています。\n\n男：来月からテレワークが週3日まで認められることになったけど、山本さんはどう思う？\n女：私はうれしいです。通勤時間がなくなる分、家族との時間が増えるので。\n男：僕は逆に、家だと集中できなくて、かえって仕事が進まないんだよね。\n女：わかります。でも、私はオンオフの切り替えさえできれば、効率は上がると思っています。\n男：なるほど。人によって向き不向きがありそうだね。\n女：そうですね。だから、選べる制度になったのはいいことだと思います。\n\n質問：女の人がテレワークについて最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '女性은 「オンオフの切り替えさえできれば、効率は上がる」「選べる制度になったのはいいこと」라고 말하고 있다. 정답은 1번 「テレワークにはオンオフの切り替えが大事で、選べる制度がよい」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000010', 'テレワークにはオンオフの切り替えが大事で、選べる制度がよい', true, 1),
('adc20003-0000-0000-0000-000000000010', 'テレワークは全社員に強制すべきだ', false, 2),
('adc20003-0000-0000-0000-000000000010', 'テレワークは通勤時間を完全になくすべきだ', false, 3),
('adc20003-0000-0000-0000-000000000010', 'テレワークより出社のほうが効率がよい', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000011',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'大学のサークルで男女の学生が話しています。\n\n男：夏合宿の場所、そろそろ決めないとね。海と山、どっちがいいと思う？\n女：うーん、私は山かな。涼しいし、去年海に行って日焼けがひどかったから。\n男：たしかに。それに、山ならハイキングとかバーベキューもできるしね。\n女：そうそう。それに宿泊費も海の近くより山のほうが安いところが多い気がする。\n男：じゃあ、山の方向で候補を探してみようか。\n女：うん、そうしよう。\n\n質問：女の人が山を勧める理由として、最も当てはまるものはどれですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '여성은 「涼しいし」「宿泊費も…山のほうが安いところが多い」라고 이유를 들고 있다. 정답은 3번 「涼しくて宿泊費も比較的安いから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000011', '海の方が交通の便がよいから', false, 1),
('adc20003-0000-0000-0000-000000000011', 'サークルの伝統で毎年山に行くから', false, 2),
('adc20003-0000-0000-0000-000000000011', '涼しくて宿泊費も比較的安いから', true, 3),
('adc20003-0000-0000-0000-000000000011', '山には行ったことがないから', false, 4);

-- ============================================================
-- 問題3 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000012',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：最近、読書の時間が減ったという声をよく聞きます。スマートフォンで手軽に情報が得られる時代だからこそ、私は本を読む時間を意識してつくることをお勧めしたいんです。ニュースサイトの記事は短時間で読めますが、断片的な情報になりがちです。一方、一冊の本をじっくり読むことで、物事を深く考える力や、長い文章を集中して読む力が養われます。忙しい毎日の中でも、寝る前の15分だけでもいいので、本を開く習慣を持ってみてはいかがでしょうか。\n\n質問：この女の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '「一冊の本をじっくり読むことで、物事を深く考える力…が養われる」「寝る前の15分だけでもいいので、本を開く習慣を持ってみては」라고 제안하고 있다. 정답은 3번 「短時間でも本を読む習慣を持つことで、深く考える力が養われる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000012', 'スマートフォンでニュースを読む習慣をやめるべきだ', false, 1),
('adc20003-0000-0000-0000-000000000012', '読書量は多ければ多いほどよい', false, 2),
('adc20003-0000-0000-0000-000000000012', '短時間でも本を読む習慣を持つことで、深く考える力が養われる', true, 3),
('adc20003-0000-0000-0000-000000000012', '情報は本よりインターネットで得るほうが効率的だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000013',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'講演会で男の人が話しています。\n\n男：優れたリーダーとはどのような人でしょうか。私は長年、様々なチームを率いてきましたが、最も大切なのは、自分が前に出て引っ張ることではなく、メンバー一人ひとりの強みを見極め、それを活かせる役割を与えることだと感じています。指示を出すだけのリーダーでは、チームは長続きしません。メンバーが「自分は必要とされている」と感じられる環境をつくることこそ、リーダーの最も重要な仕事だと思います。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '「メンバー一人ひとりの強みを見極め、それを活かせる役割を与えること」「必要とされていると感じられる環境をつくることこそ最も重要な仕事」라고 말하고 있다. 정답은 1번 「リーダーの役割は、メンバーの強みを活かし必要とされていると感じさせることだ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000013', 'リーダーの役割は、メンバーの強みを活かし必要とされていると感じさせることだ', true, 1),
('adc20003-0000-0000-0000-000000000013', 'リーダーは常にチームの先頭に立って引っ張るべきだ', false, 2),
('adc20003-0000-0000-0000-000000000013', 'リーダーには厳しく指示を出す力が最も求められる', false, 3),
('adc20003-0000-0000-0000-000000000013', 'チームワークよりも個人の実力を重視すべきだ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000014',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'ニュースで女の人がレポートしています。\n\n女：市内の公民館では、高齢者を対象にしたスマートフォンの使い方講座が人気を集めています。この講座では、写真の撮り方や家族とのビデオ通話の方法など、日常生活に役立つ操作を丁寧に教えており、これまでに延べ500人以上が参加しました。参加者からは「孫と気軽に連絡が取れるようになった」といった声が寄せられており、市は今後、講座の開催回数を増やす方針です。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '高齢者向けスマートフォン講座가 인기를 끌고 있으며, 市가 「今後、講座の開催回数を増やす方針」라고 전하고 있다. 정답은 4번 「高齢者向けスマートフォン講座が人気で、市が拡充を検討していること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000014', '高齢者のスマートフォン利用が禁止されたこと', false, 1),
('adc20003-0000-0000-0000-000000000014', '公民館の利用者数が大幅に減少したこと', false, 2),
('adc20003-0000-0000-0000-000000000014', '家族とのビデオ通話が有料化されたこと', false, 3),
('adc20003-0000-0000-0000-000000000014', '高齢者向けスマートフォン講座が人気で、市が拡充を検討していること', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000015',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'インタビューで女の人が話しています。\n\n女：この和紙作りは、祖父の代から60年以上続けています。機械で大量に作る紙とは違い、一枚一枚、手で漉くので、時間も手間もかかります。それでも続けているのは、手で作った紙にしか出せない温かみがあるからです。効率だけを考えれば機械化したほうがいいのかもしれませんが、私はこの手作業の工程こそが、この和紙の価値そのものだと思っています。\n\n質問：この女の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '「手で作った紙にしか出せない温かみがある」「手作業の工程こそが、この和紙の価値そのもの」라고 말하고 있다. 정답은 2번 「手作業でしか出せない価値を大切にしていること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000015', '機械化を進めて生産効率を上げたいこと', false, 1),
('adc20003-0000-0000-0000-000000000015', '手作業でしか出せない価値を大切にしていること', true, 2),
('adc20003-0000-0000-0000-000000000015', '和紙作りを次の世代には継がせたくないこと', false, 3),
('adc20003-0000-0000-0000-000000000015', '和紙の値段をもっと上げるべきだということ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000016',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'ラジオで男の人が話しています。\n\n男：外国語を学ぶというと、文法や単語をたくさん覚えることを想像する方が多いと思います。しかし、私が長年語学を教えてきて感じるのは、間違いを恐れずに話す姿勢のほうがずっと大切だということです。完璧な文を作ろうとして黙ってしまうより、多少間違っていても口に出してみることで、会話は続いていきますし、上達も早くなります。まずは「間違ってもいい」という気持ちで、積極的に話してみてください。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '「間違いを恐れずに話す姿勢のほうがずっと大切」「積極的に話してみてください」라고 말하고 있다. 정답은 3번 「間違いを恐れず積極的に話す姿勢が語学上達には重要だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000016', '文法や単語を完璧に覚えることが最優先だ', false, 1),
('adc20003-0000-0000-0000-000000000016', '語学学習は若いうちに始めるべきだ', false, 2),
('adc20003-0000-0000-0000-000000000016', '間違いを恐れず積極的に話す姿勢が語学上達には重要だ', true, 3),
('adc20003-0000-0000-0000-000000000016', '外国語は独学より教室で学ぶべきだ', false, 4);

-- ============================================================
-- 問題4 即時応答 (LISTENING_QUICK_RESPONSE) — 12問 (sort_order 17-28)
-- 3択のみ
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000017',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：この書類にサインをお願いできますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '書類へのサインを求められたら、応じてペンを借りるのが最も自然な返答。정답은 1번 「はい、ここですね。ペンをお借りします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000017', 'はい、ここですね。ペンをお借りします。', true, 1),
('adc20003-0000-0000-0000-000000000017', 'いいえ、書類はまだ届いていません。', false, 2),
('adc20003-0000-0000-0000-000000000017', 'はい、サインはとても上手です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000018',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：今日、少し早く帰ってもいいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '早退を許可する自然な返答が正解。정답은 2번 「ええ、体調が悪いなら大丈夫ですよ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000018', 'はい、今日は残業してください。', false, 1),
('adc20003-0000-0000-0000-000000000018', 'ええ、体調が悪いなら大丈夫ですよ。', true, 2),
('adc20003-0000-0000-0000-000000000018', 'いいえ、早く来てください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000019',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：明日の天気、雨みたいですよ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '雨の予報を聞いて、傘の準備について反応するのが最も自然。정답은 3번 「そうですか。傘を持って行かないと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000019', 'はい、傘はもう捨てました。', false, 1),
('adc20003-0000-0000-0000-000000000019', 'いいえ、今日は晴れています。', false, 2),
('adc20003-0000-0000-0000-000000000019', 'そうですか。傘を持って行かないと。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000020',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：この資料、コピーしておいてもらえますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '依頼を受けて必要部数を確認する返答が最も自然。정답은 1번 「はい、何部必要ですか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000020', 'はい、何部必要ですか。', true, 1),
('adc20003-0000-0000-0000-000000000020', 'いいえ、資料はもう捨てました。', false, 2),
('adc20003-0000-0000-0000-000000000020', 'はい、コピー機は壊れています。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000021',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：出張のお土産です。どうぞ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  'お土産を渡された際に感謝して受け取るのが自然な返答。정답은 2번 「わあ、ありがとうございます。いただきます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000021', 'いいえ、出張には行きません。', false, 1),
('adc20003-0000-0000-0000-000000000021', 'わあ、ありがとうございます。いただきます。', true, 2),
('adc20003-0000-0000-0000-000000000021', 'はい、お土産は買ってきました。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000022',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：ちょっと道を聞いてもいいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '道を尋ねられたら、行き先を確認するのが最も自然な返答。정답은 3번 「はい、どちらまで行かれますか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000022', 'いいえ、道には興味がありません。', false, 1),
('adc20003-0000-0000-0000-000000000022', 'はい、私も迷っています。', false, 2),
('adc20003-0000-0000-0000-000000000022', 'はい、どちらまで行かれますか。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000023',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：新しいプロジェクト、担当してくれませんか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '仕事の依頼に対して前向きに引き受ける返答が最も自然。정답은 1번 「はい、ぜひやらせてください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000023', 'はい、ぜひやらせてください。', true, 1),
('adc20003-0000-0000-0000-000000000023', 'いいえ、プロジェクトは終わりました。', false, 2),
('adc20003-0000-0000-0000-000000000023', 'はい、担当者は他の人です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000024',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：この椅子、そこに置いてもいいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '置いてよいかの確認に対して許可する返答が最も自然。정답은 2번 「ええ、どうぞそこに置いてください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000024', 'はい、椅子はもう捨てました。', false, 1),
('adc20003-0000-0000-0000-000000000024', 'ええ、どうぞそこに置いてください。', true, 2),
('adc20003-0000-0000-0000-000000000024', 'いいえ、そこには誰もいません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000025',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：風邪、もう治りましたか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  '体調を気遣う質問に対して回復を伝える返答が最も自然。정답은 3번 「おかげさまで、すっかりよくなりました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000025', 'いいえ、まだ風邪をひいていません。', false, 1),
('adc20003-0000-0000-0000-000000000025', 'はい、薬はまだ飲んでいません。', false, 2),
('adc20003-0000-0000-0000-000000000025', 'おかげさまで、すっかりよくなりました。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000026',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：明日までにこの報告書、仕上げられそうですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '締め切りを確認する質問に対して、対応できることを伝える返答が最も自然。정답은 1번 「はい、今日中に終わらせます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000026', 'はい、今日中に終わらせます。', true, 1),
('adc20003-0000-0000-0000-000000000026', 'いいえ、報告書は必要ありません。', false, 2),
('adc20003-0000-0000-0000-000000000026', 'はい、明日はお休みをいただきます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000027',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女：エレベーター、故障しているみたいですよ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '故障の知らせに対して代替手段を提案する返答が最も自然。정답은 2번 「そうなんですか。じゃあ、階段で行きましょう」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000027', 'はい、エレベーターは新しいです。', false, 1),
('adc20003-0000-0000-0000-000000000027', 'そうなんですか。じゃあ、階段で行きましょう。', true, 2),
('adc20003-0000-0000-0000-000000000027', 'いいえ、階段は使いません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000028',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'男：今度の飲み会、参加されますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  28,
  '誘いに対して前向きに応じる返答が最も自然。정답은 3번 「はい、ぜひ参加させてください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000028', 'いいえ、飲み会は嫌いです。', false, 1),
('adc20003-0000-0000-0000-000000000028', 'はい、飲み会は中止になりました。', false, 2),
('adc20003-0000-0000-0000-000000000028', 'はい、ぜひ参加させてください。', true, 3);

-- ============================================================
-- 問題5 統合理解 (LISTENING_INTEGRATED) — 4問 (sort_order 29-32)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000029',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'大学のサークルで3人の学生が話しています。\n\n男A：夏合宿、場所決めなきゃね。候補挙がってる？\n男B：温泉地でのんびりするのはどう？去年は忙しいスケジュールだったから、今年はゆっくりしたいって声が多くて。\n女：私はキャンプがいいな。自然の中でバーベキューとかできるし、費用も抑えられそう。\n男A：たしかに費用は大事だよね。温泉だと宿泊費が高くなりそうだし。\n男B：でも、天候に左右されるのがキャンプの心配な点だよね。雨が降ったら大変だし。\n女：それもそうか…。じゃあ、天候に左右されず、費用も抑えられる場所ってことで、近くの安い宿を探すのはどう？\n男A：それいいね！それなら両方の条件クリアできそう。\n男B：うん、そっちの方向で探してみよう。\n\n質問：3人が最終的に重視することにしたのは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '3人は「天候に左右されず、費用も抑えられる場所」という条件で近くの安い宿を探すことにした。정답은 1번 「天候に左右されず、費用を抑えられること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000029', '天候に左右されず、費用を抑えられること', true, 1),
('adc20003-0000-0000-0000-000000000029', 'とにかく安ければどこでもいいこと', false, 2),
('adc20003-0000-0000-0000-000000000029', '去年と同じ場所に行くこと', false, 3),
('adc20003-0000-0000-0000-000000000029', '温泉に入れることを最優先すること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000030',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'会社で新商品のキャンペーンについて社員が話しています。\n\n男：新商品のキャンペーン、SNS広告とテレビCM、どちらに力を入れるか決めたいんですが。\n女A：ターゲットが20代なら、SNSのほうが効果的だと思います。テレビCMは若い世代の視聴時間が短くなっていますし。\n男：予算的にはどうですか。\n女B：SNS広告のほうが低予算で始められて、効果測定もしやすいです。テレビCMは制作費だけでもかなりかかります。\n女A：ただ、認知度を一気に広げたいなら、テレビCMも捨てがたいですよね。\n男：うーん、今回はターゲット層と予算を考えると、SNS広告を中心に進めるのがよさそうですね。\n女B：はい、私もそれに賛成です。\n男：では、SNS広告を中心に企画を進めましょう。\n\n質問：新商品キャンペーンについて、話し合いの結論に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '男性은「ターゲット層と予算を考えると、SNS広告を中心に進めるのがよさそう」라고 결론지었고, 다른 사람들도 동의했다. 정답은 2번 「ターゲット層と予算を考慮し、SNS広告を中心に進める」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000030', 'テレビCMのみで宣伝することにした', false, 1),
('adc20003-0000-0000-0000-000000000030', 'ターゲット層と予算を考慮し、SNS広告を中心に進める', true, 2),
('adc20003-0000-0000-0000-000000000030', 'SNS広告とテレビCMを同額の予算で行う', false, 3),
('adc20003-0000-0000-0000-000000000030', '予算不足のためキャンペーン自体を中止する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000031',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'家で夫婦が祖母への誕生日プレゼントについて話しています。\n\n妻：来週、お義母さんの誕生日だけど、プレゼント何にしようか。\n夫：去年はマフラーだったよね。今年は何か違うものがいいな。\n妻：健康を気にしてるみたいだから、マッサージ機とかどう？\n夫：それいいけど、場所を取りそうで、お義母さんの部屋には置きにくいかも。\n妻：じゃあ、コンパクトなハンドマッサージ器なら？肩や手をほぐせるし、場所も取らないし。\n夫：それならよさそうだね。予算はどれくらい？\n妻：5千円くらいのものがいくつかあったよ。\n夫：うん、それで探してみよう。\n\n質問：夫婦が選んだプレゼントの条件として、会話の内容に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  31,
  '夫婦は健康を気にする祖母のために、場所を取らないコンパクトなハンドマッサージ器を選ぶことにした。정답은 3번 「健康に配慮でき、場所を取らずコンパクトなもの」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000031', '去年と同じマフラーにすること', false, 1),
('adc20003-0000-0000-0000-000000000031', 'できるだけ大きくて存在感のあるもの', false, 2),
('adc20003-0000-0000-0000-000000000031', '健康に配慮でき、場所を取らずコンパクトなもの', true, 3),
('adc20003-0000-0000-0000-000000000031', '予算を気にせず高価なものを選ぶこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20003-0000-0000-0000-000000000032',
  'ad000002-0000-0000-0000-000000000233',
  'audio_listening',
  E'女性2人がルームシェアする部屋について話しています。\n\n女A：ルームシェアする部屋、そろそろ探し始めない？\n女B：うん。駅から近いところがいいな。歩いて10分以内とか。\n女A：私もそう思う。あと、2人とも在宅で仕事することもあるから、部屋が2つに分かれてる物件がいいよね。\n女B：たしかに。あと、ペット可の物件だと嬉しいけど、それは必須じゃないかな。\n女A：うん、それは条件に入れなくていいと思う。家賃はどれくらいまで出せそう？\n女B：2人合わせて15万円くらいまでかな。\n女A：じゃあ、駅近で部屋が2つ、家賃15万円以内で探してみよう。\n\n質問：2人が部屋探しで最も重視する条件として、会話の内容に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  32,
  '2人은 「駅から近いところ」「部屋が2つに分かれてる物件」を条件とし、ペット可は「必須じゃない」として除外した。정답은 4번 「駅から近く、部屋が2つに分かれていること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20003-0000-0000-0000-000000000032', 'ペットを飼えることを最優先にする', false, 1),
('adc20003-0000-0000-0000-000000000032', '家賃をできるだけ安くすることを最優先にする', false, 2),
('adc20003-0000-0000-0000-000000000032', '駅から遠くても静かな場所を選ぶ', false, 3),
('adc20003-0000-0000-0000-000000000032', '駅から近く、部屋が2つに分かれていること', true, 4);
