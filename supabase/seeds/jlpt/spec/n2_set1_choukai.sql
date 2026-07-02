-- encoding: UTF-8
-- JLPT N2 模試(公式) 聴解 32問 — Set 1
-- quiz_id: ad000002-0000-0000-0000-000000000213
-- 問題1 課題理解(LISTENING_TASK) 5問/問題2 ポイント理解(LISTENING_POINT) 6問
-- 問題3 概要理解(LISTENING_SUMMARY) 5問/問題4 即時応答(LISTENING_QUICK_RESPONSE) 12問
-- 問題5 統合理解(LISTENING_INTEGRATED) 4問

-- ============================================================
-- 問題1 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000001',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'スーパーで女の人と店員が話しています。\n\n女：すみません、このヨーグルト、昨日買ったんですが、フタを開けたら中身が少し変な感じで。\n店員：それは大変申し訳ございません。レシートはお持ちですか。\n女：あ、捨ててしまったんですが…。\n店員：レシートがなくても、商品をお持ちいただければ、同じ商品と交換いたします。\n女：あ、商品はここにあります。\n店員：ありがとうございます。では、今すぐ交換いたしますので、少々お待ちください。\n女：ありがとうございます。\n\n質問：女の人はこれからどうしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '점원이 「商品をお持ちいただければ交換いたします」「では、今すぐ交換いたしますので、少々お待ちください」라고 했으므로, 여성은 여기서 기다리면 된다. 정답은 3번 「店員が交換するのをその場で待つ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000001', 'レシートを探して持ってくる', false, 1),
('adc20001-0000-0000-0000-000000000001', '別のスーパーで同じ商品を買う', false, 2),
('adc20001-0000-0000-0000-000000000001', '店員が交換するのをその場で待つ', true, 3),
('adc20001-0000-0000-0000-000000000001', '返金を求めてサービスカウンターへ行く', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000002',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'大学で男の学生と教授が話しています。\n\n学生：先生、来週の発表なんですが、体調が悪くて準備が間に合いそうになくて。\n教授：そうですか。それは困りましたね。一週間延ばすことはできますが、その場合は学務課に延長申請書を出す必要があります。\n学生：わかりました。申請書はどこにありますか。\n教授：学務課のウェブサイトからダウンロードできますよ。印刷して今日中に提出してください。\n学生：はい。それから、発表の代わりにレポートを提出するというのは無理でしょうか。\n教授：それは認められません。発表はきちんとやっていただきます。申請書を出してから準備を進めてください。\n\n質問：学生はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '교수는 「申請書はウェブサイトからダウンロードできます。印刷して今日中に提出してください」라고 했다. 학생이 먼저 해야 할 일은 4번 「延長申請書を印刷して学務課に提出する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000002', '教授にレポートを提出する', false, 1),
('adc20001-0000-0000-0000-000000000002', '発表の準備をすぐに始める', false, 2),
('adc20001-0000-0000-0000-000000000002', '病院に行って診断書をもらう', false, 3),
('adc20001-0000-0000-0000-000000000002', '延長申請書を印刷して学務課に提出する', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000003',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'会社で男女が話しています。\n\n男：鈴木さん、来週の月曜日の会議室なんですが、予約できていますか？\n女：あ、まだなんです。今日やろうと思っていたんですが…。\n男：実はさっき確認したら、第1会議室は先に埋まってしまったみたいで。\n女：えっ、本当ですか。じゃあ、第2会議室が空いているか確認してみます。\n男：そうしてください。もし第2も空いていなかったら、総務部に相談して別の部屋を手配してもらうしかないかもしれないですね。\n女：わかりました。今すぐ確認して、ご報告します。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '여성은 「第2会議室が空いているか確認してみます」「今すぐ確認して、ご報告します」라고 했다. 정답은 2번 「第2会議室の空き状況を確認する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000003', '総務部に会議室の手配を依頼する', false, 1),
('adc20001-0000-0000-0000-000000000003', '第2会議室の空き状況を確認する', true, 2),
('adc20001-0000-0000-0000-000000000003', '月曜日の会議のスケジュールを変更する', false, 3),
('adc20001-0000-0000-0000-000000000003', '第1会議室を使った部署に交渉する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000004',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'旅行代理店で男の人と店員が話しています。\n\n店員：いらっしゃいませ。どのようなご旅行をお考えですか。\n男：来月、北海道に2人で行きたいんですが。\n店員：かしこまりました。出発日はいつ頃がよろしいですか。\n男：えっと、20日前後で。\n店員：ご予算はいかがでしょうか。\n男：お土産代込みで、お一人5万円くらいで考えています。\n店員：少々お待ちください。……いくつかプランをご用意できますが、パンフレットをお持ちしますので、ご覧になってからお選びいただけますか。\n男：はい、お願いします。\n店員：こちらをどうぞ。気になるプランがあれば、また声をかけてください。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '점원이 「パンフレットをお持ちしますのでご覧になってからお選びください」라고 했고 남성도 「お願いします」라고 했으므로, 먼저 할 일은 3번 「パンフレットを見てプランを選ぶ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000004', 'すぐに旅行の予約を入れる', false, 1),
('adc20001-0000-0000-0000-000000000004', '予算を増やせるか家族に相談する', false, 2),
('adc20001-0000-0000-0000-000000000004', 'パンフレットを見てプランを選ぶ', true, 3),
('adc20001-0000-0000-0000-000000000004', '別の旅行代理店で料金を比較する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000005',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'図書館で女の人とスタッフが話しています。\n\n女：すみません、この本を借りたいんですが、棚に見つからなくて。\nスタッフ：タイトルを教えていただけますか。\n女：「現代の食文化」という本です。\nスタッフ：お調べします……現在、他の方がお借り中で、来週の火曜日に返却予定となっております。\n女：そうですか。予約はできますか。\nスタッフ：はい。図書館カードをお持ちでしたら、予約できます。\n女：はい、持っています。\nスタッフ：では、カードをお見せいただいたあと、こちらの予約用紙にお名前とご連絡先をご記入ください。\n女：わかりました。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  '스태프는 「カードをお見せいただいたあと、予約用紙にお名前とご連絡先をご記入ください」라고 했으므로, 먼저 할 일은 1번 「図書館カードをスタッフに見せる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000005', '図書館カードをスタッフに見せる', true, 1),
('adc20001-0000-0000-0000-000000000005', '来週火曜日に図書館に来る', false, 2),
('adc20001-0000-0000-0000-000000000005', '図書館カードを新しく作る', false, 3),
('adc20001-0000-0000-0000-000000000005', '別の本を探して借りる', false, 4);

-- ============================================================
-- 問題2 ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000006',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'ラジオで料理研究家が話しています。\n\n女：今日は、誰でも簡単においしい料理が作れるコツをお伝えします。多くの方が見落としがちなのが「下ごしらえ」の重要性です。材料を切る大きさをそろえること、肉や魚に事前に下味をつけること。こういった準備が料理の仕上がりを大きく変えます。どんなに新鮮な食材を使っても、下ごしらえをしっかりしなければ、料理はおいしくなりません。反対に、普通の食材でも丁寧な下ごしらえがあれば、ぐっとおいしくなりますよ。\n\n質問：この料理研究家によると、おいしい料理を作るために最も重要なことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「下ごしらえ」の重要性を繰り返し強調し、「下ごしらえをしっかりしなければ料理はおいしくなりません」と述べている。정답은 2번 「下ごしらえをていねいに行うこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000006', '新鮮で高品質な食材を選ぶこと', false, 1),
('adc20001-0000-0000-0000-000000000006', '下ごしらえをていねいに行うこと', true, 2),
('adc20001-0000-0000-0000-000000000006', '調理にたっぷり時間をかけること', false, 3),
('adc20001-0000-0000-0000-000000000006', '専門的な調理器具を使うこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000007',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'会社で男女が話しています。\n\n男：山田さん、昨日の取引先へのプレゼン、どうでしたか。\n女：内容には自信があったんですが、途中でパソコンが固まってしまって。\n男：えっ、それは大変でしたね。取引先の反応は？\n女：皆さん、待ってくださったんですが、私がかなり焦ってしまって、説明が途切れ途切れになってしまって。内容は最終的に伝えられたんですが、印象が悪くなったかもしれないと気になっています。\n男：なるほど。プレゼン本番前にちゃんと動作確認はしていましたか。\n女：それが、バッテリー切れで直前に起動できなくて。机の上で電源を入れたらすぐ始まってしまったんです。\n\n質問：女の人は何を反省していますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '여성은 パソコンが固まって焦り、説明が途切れ途切れになり印象が悪くなったと反省している。根本原因는 직전에 동작 확인을 못 한 것이지만, 여성이 직접 반성하는 것은 「準備不足でトラブル対応に失敗したこと」이다. 정답은 3번 「機器トラブルの対処が不十分で説明が乱れたこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000007', 'プレゼンの内容が相手に伝わらなかったこと', false, 1),
('adc20001-0000-0000-0000-000000000007', '取引先の担当者を怒らせてしまったこと', false, 2),
('adc20001-0000-0000-0000-000000000007', '機器トラブルの対処が不十分で説明が乱れたこと', true, 3),
('adc20001-0000-0000-0000-000000000007', 'プレゼンの準備に時間をかけすぎたこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000008',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'駅のアナウンスを聞いています。\n\n男：お客様にお知らせいたします。悪天候の影響により、ただいまから東山線は全線で運転を一時見合わせております。復旧の見通しは現在のところ未定でございます。お急ぎのところ大変ご不便をおかけいたしますが、振替輸送として南口バスターミナルよりシャトルバスを運行しておりますので、ご利用ください。なお、最新の情報は駅の電光掲示板およびこちらの案内所にてご確認ください。\n\n質問：このアナウンスによると、電車が止まっている間、乗客はどうすればよいですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '「南口バスターミナルよりシャトルバスを運行しております」라고 안내하고 있다. 정답은 1번 「南口バスターミナルからシャトルバスに乗る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000008', '南口バスターミナルからシャトルバスに乗る', true, 1),
('adc20001-0000-0000-0000-000000000008', '電車が復旧するまでホームで待つ', false, 2),
('adc20001-0000-0000-0000-000000000008', '案内所で代替ルートを購入する', false, 3),
('adc20001-0000-0000-0000-000000000008', '他の路線に乗り換えて目的地に向かう', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000009',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'服屋で女の人と店員が話しています。\n\n店員：いらっしゃいませ。何かお探しですか。\n客：このジャケット、サイズのMはありますか。\n店員：大変申し訳ございません。Mサイズは昨日完売してしまいまして。SとLのみ在庫がある状況です。\n客：そうですか…。Lは少し大きいかな。\n店員：来週の木曜日に新しい入荷がございますので、Mサイズをお取り置きすることもできますよ。\n客：あ、そうなんですか。でも来週まで待てないかもしれなくて…。\n店員：もしよろしければ、お電話番号を教えていただければ、入荷次第すぐにご連絡いたします。\n客：じゃあ、番号を教えておきます。でも、もし他店に在庫があれば、そちらを紹介してもらえますか。\n店員：確認してみます。少々お待ちください。\n\n質問：客がまず希望したことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '客は最初に「このジャケット、サイズのMはありますか」と聞いており、Mサイズを購入したいという希望が最初にあった。정답은 2번 「Mサイズのジャケットをすぐに購入すること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000009', '来週まで待ってMサイズを取り置きしてもらうこと', false, 1),
('adc20001-0000-0000-0000-000000000009', 'Mサイズのジャケットをすぐに購入すること', true, 2),
('adc20001-0000-0000-0000-000000000009', '電話番号を登録して入荷を待つこと', false, 3),
('adc20001-0000-0000-0000-000000000009', 'Lサイズを試着してみること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000010',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'テレビでインタビューを聞いています。\n\n司会：山本さんは15年以上、地域で子供に剣道を教えていらっしゃいますね。続けている理由を教えてください。\n山本：最初はただ剣道が好きだから始めたんですよ。でも、指導を続けるうちに、子供たちが礼儀や忍耐を身につけて成長していくのを見ることが、本当に喜びになってきて。もちろん大変なこともたくさんありますが、卒業した子供たちが大人になって「先生のおかげです」と言いに来てくれると、それだけで続けてきてよかったと思えますね。\n\n質問：山本さんが剣道指導を長年続けている主な理由は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '「子供たちが礼儀や忍耐を身につけて成長していくのを見ることが本当に喜びになってきた」「続けてきてよかったと思える」라고 말하고 있다. 정답은 3번 「子供たちの成長を見届けることに喜びを感じるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000010', '地域から高い報酬をもらえるから', false, 1),
('adc20001-0000-0000-0000-000000000010', '自分の剣道の技術を磨くことができるから', false, 2),
('adc20001-0000-0000-0000-000000000010', '子供たちの成長を見届けることに喜びを感じるから', true, 3),
('adc20001-0000-0000-0000-000000000010', '全国大会優勝者を育てることが目標だから', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000011',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'電話で男女が話しています。\n\n男：はい、田中自動車修理工場です。\n女：あ、もしもし。先週、車を修理に出した佐藤と申しますが。\n男：佐藤様、ありがとうございます。実は本日確認しましたところ、エンジンオイルの交換に加えて、右後ろのタイヤにひびが入っているのが見つかりました。\n女：えっ、タイヤにひびが？危ないですね。\n男：はい、このままですと走行中に危険ですので、交換をお勧めします。費用はオイル交換と合わせて2万8千円ほどになりますが、いかがでしょうか。\n女：わかりました。お願いします。\n男：ありがとうございます。では明日の夕方5時以降にお受け取りいただけます。\n\n質問：当初の修理に追加されることになったのは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '「エンジンオイルの交換に加えて、右後ろのタイヤにひびが入っているのが見つかりました」라고 했으므로, 추가된 수리는 4번 「右後ろのタイヤ交換」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000011', 'エンジン本体のオーバーホール', false, 1),
('adc20001-0000-0000-0000-000000000011', '左後ろのタイヤ交換', false, 2),
('adc20001-0000-0000-0000-000000000011', 'ブレーキパッドの交換', false, 3),
('adc20001-0000-0000-0000-000000000011', '右後ろのタイヤ交換', true, 4);

-- ============================================================
-- 問題3 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000012',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：最近、若い人のスマートフォン依存が話題になっていますね。電車の中でも、食事中でも、ひっきりなしに画面を見ている人をよく見かけます。私が心配しているのは、単純な使いすぎの問題だけじゃないんです。スマートフォンに夢中になることで、実際に目の前にいる人と話す機会がどんどん減っている。オンラインには友達がたくさんいるのに、いざというときに頼れる人がいないという若者が増えているのが、気になっています。\n\n質問：この女の人が最も心配していることは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '「スマートフォンに夢中になることで、実際に目の前にいる人と話す機会がどんどん減っている」「いざというときに頼れる人がいない」と述べており、人間関係の希薄化を最も心配している。정답은 3번 「スマートフォン依存が対面での人間関係を希薄にしていること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000012', '若者の視力や健康への悪影響', false, 1),
('adc20001-0000-0000-0000-000000000012', 'SNS上での誹謗中傷が増えていること', false, 2),
('adc20001-0000-0000-0000-000000000012', 'スマートフォン依存が対面での人間関係を希薄にしていること', true, 3),
('adc20001-0000-0000-0000-000000000012', '若者がスマートフォンに使うお金が多すぎること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000013',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'講演会で男の人が話しています。\n\n男：「健康的な生活」というと、多くの方が食事や運動を思い浮かべるでしょう。もちろんそれも大切です。ただ、近年の研究では、睡眠の質が健康に与える影響が非常に大きいことがわかっています。睡眠が不足すると、免疫力が落ちたり、集中力が下がったりするだけでなく、生活習慣病やうつ病のリスクも高まります。いくら食事に気をつけても、運動をしても、睡眠が足りなければ体は回復できません。忙しいからといって、睡眠だけは削ってはいけない。これが私の最も伝えたいメッセージです。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '「睡眠だけは削ってはいけない。これが私の最も伝えたいメッセージです」と明言している。정답은 2번 「睡眠の質を確保することが健康の最重要課題だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000013', '毎日の食事内容を細かく管理すべきだ', false, 1),
('adc20001-0000-0000-0000-000000000013', '睡眠の質を確保することが健康の最重要課題だ', true, 2),
('adc20001-0000-0000-0000-000000000013', 'ストレスを減らすために運動習慣を持つべきだ', false, 3),
('adc20001-0000-0000-0000-000000000013', '忙しい現代人には定期的な休暇が必要だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000014',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'ニュースで女の人がレポートしています。\n\n女：この春から、全国の公立小学校で英語が正式な教科として始まりました。これまでは「外国語活動」として行われていましたが、国語や算数と同様に成績がつくようになります。教育関係者からは「早い段階からの英語教育はグローバル化への対応に必要だ」という肯定的な意見がある一方、「日本語の基礎がまだ育っていない段階で外国語教育を進めると、言語力全体の発達を妨げるおそれがある」と懸念する声も出ています。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '小学校英語の正式教科化が始まり、肯定・懸念の両意見があることをバランスよく伝えている。정답은 1번 「小学校での英語の正式教科化とそれに対する賛否の声」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000014', '小学校での英語の正式教科化とそれに対する賛否の声', true, 1),
('adc20001-0000-0000-0000-000000000014', '英語教育の廃止が決まり反対運動が起きていること', false, 2),
('adc20001-0000-0000-0000-000000000014', '日本の英語教育が世界最高水準に達したこと', false, 3),
('adc20001-0000-0000-0000-000000000014', '英語教育の予算が大幅に削減されたこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000015',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'インタビューで女の人が話しています。\n\n女：私が環境ボランティアを始めたのは8年前です。最初は週末に近くの公園を掃除するだけでしたが、今は地元の企業とも協力して、川の清掃や子供たちへの環境教育なども行っています。活動を通じて気づいたのは、一人でできることは限られていても、みんなで力を合わせれば大きな変化が生み出せるということです。環境問題は遠い話ではなく、私たちの日常と直結しています。まず自分ができることから少しずつ、周りの人と一緒に取り組んでほしいですね。\n\n質問：この女の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '「まず自分ができることから少しずつ、周りの人と一緒に取り組んでほしい」「みんなで力を合わせれば大きな変化が生み出せる」という点を最も伝えたい内容として述べている。정답은 4번 「環境問題にはできることから皆で協力して取り組むことが大切だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000015', '環境ボランティアに参加するには企業の支援が必要だ', false, 1),
('adc20001-0000-0000-0000-000000000015', '川や公園の清掃は自治体が責任を持って行うべきだ', false, 2),
('adc20001-0000-0000-0000-000000000015', '子供への環境教育が最も効果的な対策だ', false, 3),
('adc20001-0000-0000-0000-000000000015', '環境問題にはできることから皆で協力して取り組むことが大切だ', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000016',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'ラジオで男の人が話しています。\n\n男：最近よく「ミニマリスト」という言葉を耳にしますね。モノを極力少なくして、シンプルに暮らすライフスタイルです。私も実践してみましたが、最初は不安もありました。でも、モノが減ると、掃除や整理にかかる時間がぐっと減って、本当に大切なことに使える時間が増えたんです。今は、数よりも「自分の生活をどれだけ豊かにしてくれるか」という質を重視して物を選ぶようにしています。必要なものだけに囲まれる生活は、想像以上に心にゆとりをもたらしてくれますよ。\n\n質問：この男の人が話しているテーマは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '男性はミニマリストの実践体験を通じ、モノを減らすことで時間や心のゆとりが生まれると話している。정답은 3번 「モノを減らすことで得られる時間や心のゆとり」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000016', '断捨離の具体的なやり方と手順', false, 1),
('adc20001-0000-0000-0000-000000000016', 'ミニマリストになることのデメリット', false, 2),
('adc20001-0000-0000-0000-000000000016', 'モノを減らすことで得られる時間や心のゆとり', true, 3),
('adc20001-0000-0000-0000-000000000016', '部屋をきれいに保つための整理術', false, 4);

-- ============================================================
-- 問題4 即時応答 (LISTENING_QUICK_RESPONSE) — 12問 (sort_order 17-28)
-- 3択のみ
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000017',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：お荷物、お持ちしましょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '親切な申し出に対して、感謝しながら受け入れる表現が最も自然。정답은 1번 「ありがとうございます。お願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000017', 'ありがとうございます。お願いします。', true, 1),
('adc20001-0000-0000-0000-000000000017', 'いいえ、荷物はここにあります。', false, 2),
('adc20001-0000-0000-0000-000000000017', 'はい、お荷物はかなり重いです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000018',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：すみません、ちょっとよろしいですか。少しお時間いただけますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '「少しお時間いただけますか」という問いかけに対して、時間的に応じられることを伝えるのが自然な返答。정답은 2번 「ええ、少しでしたら大丈夫ですよ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000018', 'はい、5分ほどかかります。', false, 1),
('adc20001-0000-0000-0000-000000000018', 'ええ、少しでしたら大丈夫ですよ。', true, 2),
('adc20001-0000-0000-0000-000000000018', 'いいえ、時間はたっぷりあります。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000019',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：先生、このレポート、もう少し詳しく書いたほうがよかったでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '先生としてレポートの改善点を具体的に示す応答が最も自然。정답은 1번 「そうですね、具体例をもう少し加えるといいでしょう」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000019', 'そうですね、具体例をもう少し加えるといいでしょう。', true, 1),
('adc20001-0000-0000-0000-000000000019', 'いいえ、レポートは書かなくていいですよ。', false, 2),
('adc20001-0000-0000-0000-000000000019', 'はい、レポートはもう受け取りました。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000020',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：明日の朝が早いのに、大丈夫ですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '心配してくれた相手に対して、問題ないことを伝える自然な返答。정답은 3번 「大丈夫ですよ。早起きは慣れているので」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000020', 'はい、明日は学校があります。', false, 1),
('adc20001-0000-0000-0000-000000000020', 'いいえ、今日は早く寝ます。', false, 2),
('adc20001-0000-0000-0000-000000000020', '大丈夫ですよ。早起きは慣れているので。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000021',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：先日はわざわざお越しいただき、ありがとうございました。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  '訪問への礼に対して、謙遜しながら感謝を示す慣用的な返しが最も自然。정답은 2번 「いいえ、こちらこそお世話になりました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000021', '遠いところからわざわざありがとうございました。', false, 1),
('adc20001-0000-0000-0000-000000000021', 'いいえ、こちらこそお世話になりました。', true, 2),
('adc20001-0000-0000-0000-000000000021', 'はい、ぜひまたお越しください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000022',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：このプロジェクト、うまくいくかどうか、ちょっと心配で。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '不安を打ち明けた相手に対して、励ましながら前向きに取り組もうと促す返答が最も自然。정답은 1번 「大丈夫ですよ。みんなで頑張りましょう」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000022', '大丈夫ですよ。みんなで頑張りましょう。', true, 1),
('adc20001-0000-0000-0000-000000000022', 'そうですか。プロジェクトって楽しいですね。', false, 2),
('adc20001-0000-0000-0000-000000000022', 'はい、うまくいきましたよ。よかったですね。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000023',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：田中さんって、料理が得意だって聞きましたよ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '自分のことを褒められた際に、日本語では謙遜するのが自然な応答。정답은 3번 「そんなことないですよ。趣味程度なので」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000023', 'ええ、田中さんはすごいですよね。', false, 1),
('adc20001-0000-0000-0000-000000000023', 'はい、料理は毎日食べています。', false, 2),
('adc20001-0000-0000-0000-000000000023', 'そんなことないですよ。趣味程度なので。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000024',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：すみません、トイレはどちらですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '場所を尋ねる質問に対して、具体的な方向を案内する返答が正解。정답은 2번 「あちらの廊下を右に曲がったところです」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000024', 'はい、トイレは使えますよ。', false, 1),
('adc20001-0000-0000-0000-000000000024', 'あちらの廊下を右に曲がったところです。', true, 2),
('adc20001-0000-0000-0000-000000000024', 'いいえ、ここはトイレではありません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000025',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：会議の資料、もうコピーしてありますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  '資料の準備状況を確認する質問に対して、準備完了を具体的に答えるのが最も自然。정답은 1번 「はい、30部ずつ用意してあります」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000025', 'はい、30部ずつ用意してあります。', true, 1),
('adc20001-0000-0000-0000-000000000025', 'いいえ、コピーは必要ありません。', false, 2),
('adc20001-0000-0000-0000-000000000025', 'ええ、今から会議に行きます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000026',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：この仕事、急ぎですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '締め切りの確認をしている質問に対して、期限を具体的に伝えるのが最も適切な返答。정답은 2번 「はい、できれば今日中にお願いできますか」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000026', 'いいえ、仕事はそれほど忙しくないです。', false, 1),
('adc20001-0000-0000-0000-000000000026', 'はい、できれば今日中にお願いできますか。', true, 2),
('adc20001-0000-0000-0000-000000000026', 'ええ、急いで食べてください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000027',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'女：最近、ちょっと疲れた顔してるけど、大丈夫？\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '心配してくれた相手に対して、状況を説明しながら感謝する自然な返答。정답은 1번 「ありがとう。ちょっと忙しくてね」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000027', 'ありがとう。ちょっと忙しくてね。', true, 1),
('adc20001-0000-0000-0000-000000000027', 'そうですか。お疲れ様でした。', false, 2),
('adc20001-0000-0000-0000-000000000027', 'はい、顔を洗ってきます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000028',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'男：ご注文はお決まりですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  28,
  'レストランでの注文の確認に対して、具体的に注文を伝えるのが正しい返答。정답은 3번 「えっと、このパスタとサラダをお願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000028', 'はい、お腹がすきました。', false, 1),
('adc20001-0000-0000-0000-000000000028', 'いいえ、まだ食べていません。', false, 2),
('adc20001-0000-0000-0000-000000000028', 'えっと、このパスタとサラダをお願いします。', true, 3);

-- ============================================================
-- 問題5 統合理解 (LISTENING_INTEGRATED) — 4問 (sort_order 29-32)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000029',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'大学のカフェで男女の学生が話しています。\n\n男：あいこ、アルバイト探してるって言ってたよね。どんなの考えてる？\n女：うん。週3日くらいで、夕方から夜のシフトがいいんだけど。\n男：なんで夕方から？\n女：午前中は授業があるし、昼はちゃんと自炊したいから。でも、できればパソコンを使う仕事がいいな。\n男：え、なんで？\n女：将来はITの仕事したいから、少しでも経験積みたくて。\n男：そしたら、事務のバイトとかは？でも、事務って昼間が多いんじゃない？\n女：そうなんだよね。だから困ってて。\n男：データ入力とか、在宅でできる仕事は夕方でもできるんじゃない？\n女：あ、それいいかも！未経験でも大丈夫かな。\n男：未経験OKのところいっぱいあるよ。探してみなよ。\n女：そうする。ありがとう！\n\n質問：女の人がアルバイトに求めている条件に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '여성의 조건: 週3日、夕方から、パソコンを使う仕事(IT경험)。これに最もあてはまるのは2번 「週3日・夕方から・パソコンを使う仕事」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000029', '週5日・午前から・接客の仕事', false, 1),
('adc20001-0000-0000-0000-000000000029', '週3日・夕方から・パソコンを使う仕事', true, 2),
('adc20001-0000-0000-0000-000000000029', '週3日・昼間・事務の仕事', false, 3),
('adc20001-0000-0000-0000-000000000029', '週5日・在宅・接客の仕事', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000030',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'家で夫婦が旅行の計画について話しています。\n\n妻：今年の夏休み、どこかに行きたいね。\n夫：去年は国内だったから、今年は海外はどうかな。\n妻：いいね。でも子供がまだ小さいから、長時間のフライトは避けたほうがよさそう。\n夫：近いところなら台湾や韓国とか。\n妻：台湾いいね。食べ物がおいしいって聞くし、子供も食べやすそう。\n夫：そうだね。ただ夏休みはホテルが混んで高いんじゃないかな。\n妻：早めに予約すれば少し安くなるんじゃない？\n夫：それもそうだね。あと子供が博物館好きだし、台湾にも有名な博物館があるって聞いたな。\n妻：国立故宮博物院でしょ。すごいって評判よ。子供も喜ぶと思う。\n夫：じゃあ、台湾に決めよう！早めに予約しよう。\n\n質問：夫婦が台湾を選んだ理由として、会話の内容に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '台湾を選んだ主な理由として会話に出てきたのは、①フライト時間が短い、②食べ物が子供にも食べやすい、③有名な博物館がある、の3点。これをすべてカバーする1번이 정답.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000030', 'フライトが短く、食事が子供向けで、博物館もある', true, 1),
('adc20001-0000-0000-0000-000000000030', '国内より費用が安く、有名な観光地が多い', false, 2),
('adc20001-0000-0000-0000-000000000030', '去年も行って子供が気に入っていた', false, 3),
('adc20001-0000-0000-0000-000000000030', 'ホテルが空いていて安く泊まれる', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000031',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'健康番組でコメンテーターのAさんとBさんが話しています。\n\n司会：今日はダイエットと健康についてお二人に伺います。まずAさん、食事制限についてはどうお考えですか。\nAさん（女）：食事制限だけのダイエットには反対なんです。カロリーを減らせばやせるのは確かですが、必要な栄養素が不足して体の機能が下がることが多い。特にたんぱく質が不足すると筋肉が落ちてしまいます。\nBさん（男）：私も同じ考えです。体重の数字だけを見るのではなく、脂肪と筋肉の比率、つまり体の組成に注目することが大切だと思います。\nAさん：そうですね。筋肉量を保ちながら脂肪を減らすには、適度な運動、特に筋トレが大事だと思います。\nBさん：まったく同感です。食事も完全に制限するのではなく、質と量のバランスを考えることが重要です。極端な制限は長続きしませんから。\n司会：お二人に共通しているのは、バランスを大切にするということですね。\n\n質問：AさんとBさんが共通して述べていることは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  31,
  'Aさんは「たんぱく質不足で筋肉が落ちる、運動が必要」、Bさんは「体の組成が重要、食事の質と量のバランスを考えるべき」と述べ、両者とも「極端な食事制限より、バランスを大切にすることが重要」という点で一致している。정답은 4번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000031', 'カロリーを大幅に制限することが最も効果的だ', false, 1),
('adc20001-0000-0000-0000-000000000031', '体重の数字を毎日測定することが大切だ', false, 2),
('adc20001-0000-0000-0000-000000000031', '筋トレだけがダイエットに効果的な方法だ', false, 3),
('adc20001-0000-0000-0000-000000000031', '極端な食事制限より、栄養バランスと運動を組み合わせることが大切だ', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20001-0000-0000-0000-000000000032',
  'ad000002-0000-0000-0000-000000000213',
  'audio_listening',
  E'会社でイベントの企画について社員が話しています。\n\n田中：来月の社員旅行の行き先なんですが、意見を聞かせてください。候補は、箱根の温泉と横浜の観光コースの2つです。\n山田：箱根の温泉はいいですね。みんなでゆっくりできるし、リフレッシュになる。\n佐藤：でも、温泉が苦手な方もいるんじゃないですかね。\n田中：そこが少し気になっているんです。\n木村：横浜観光なら中華街でご飯を食べたり観光スポットを巡ったりできますよ。ただ去年も行きませんでしたっけ。\n田中：そうなんです。去年の秋に行ったので、また横浜は新鮮味がないかなと。\n佐藤：箱根は温泉以外にもハイキングとか美術館とかアクティビティが多いですよね。\n木村：それなら、温泉が苦手な人も別の楽しみ方ができますね。\n田中：なるほど。それなら幅広く楽しめますね。じゃあ、箱根で決まりかな。\n\n質問：箱根が選ばれた最も大きな理由は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  32,
  '箱根が選ばれた決め手は「温泉以外にもハイキングや美術館などアクティビティが多く、幅広く楽しめる」という点。横浜は去年行った、温泉は苦手な人がいるという問題があった。정답은 3번 「温泉以外にも様々なアクティビティがあり全員が楽しめるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20001-0000-0000-0000-000000000032', '参加者全員が温泉を楽しみにしているから', false, 1),
('adc20001-0000-0000-0000-000000000032', '横浜より交通費が安くて行きやすいから', false, 2),
('adc20001-0000-0000-0000-000000000032', '温泉以外にも様々なアクティビティがあり全員が楽しめるから', true, 3),
('adc20001-0000-0000-0000-000000000032', '去年も箱根に行って社員に好評だったから', false, 4);
