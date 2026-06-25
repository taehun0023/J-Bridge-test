-- encoding: UTF-8
-- JLPT N2 Listening Pool — Batch 3 (30 scripts, sort_order 401–430)
-- 作成日: 2026-06-26
-- dialogue: 15本 (401–415), monologue/announcement: 15本 (416–430)
-- 正答分布: 0→8件, 1→8件, 2→7件, 3→7件
-- 品質基準: exam_quality_rubric.md A1/A2/B5/L3(≤80字/発話)
-- quiz_id: bb000002-0000-0000-0000-000000000003 (N2 聴解テスト拡充)
-- DB適用禁止（申請後に管理者が適用）

-- ============================================================
-- 401: 職場 — 社員証の再発行手続き (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n総務：お電話ありがとうございます。総務課です。\n社員：あの、社員証をなくしてしまって。再発行の手続きを教えていただけますか。\n総務：はい。まず「紛失届」の用紙に記入していただく必要があります。用紙は総務課の窓口またはイントラネットからダウンロードできます。\n社員：記入後はどうすればいいですか。\n総務：直接窓口に持参していただくか、スキャンしてメールで送っていただければ大丈夫です。処理は2営業日ほどかかります。新しい社員証ができたらご連絡します。\n社員：わかりました。費用はかかりますか。\n総務：初回の再発行は無料ですが、2回目以降は500円の手数料がかかります。\n質問：社員証の再発行にかかる日数はどのくらいですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('当日中', false, 1),
  ('1営業日', false, 2),
  ('2営業日', true, 3),
  ('1週間', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 402: 職場 — 健康診断の予約 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n社員：田口さん、今年の健康診断、もう予約しましたか。\n田口：いや、まだです。締め切りはいつでしたっけ。\n社員：今月末までに予約して、来月中に受診しなければならないんです。\n田口：えっ、来月中か。結構早いな。どこで受けるんですか。\n社員：会社の指定クリニックか、自分で選んだ病院でも受けられます。ただし自分で選ぶ場合は、事前に総務課への申請が必要です。\n田口：それは少し面倒だな。じゃあ指定クリニックにします。\n社員：そうですね。私も同じところにしました。予約はイントラのリンクから直接できますよ。\n質問：健康診断の予約の締め切りはいつですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('今月末', true, 1),
  ('来月末', false, 2),
  ('来週末', false, 3),
  ('来月の15日', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 403: 家庭 — 引越しの荷物整理 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n夫：引越しまであと2週間しかないのに、まだ荷物の半分も片付いていないね。\n妻：そうなんだけど、捨てられないものが多くて。\n夫：そういえば、古い家電はどうする？\n妻：粗大ごみに出そうと思っているんだけど、今からだと引越し前に回収が間に合わないって市役所に言われて。\n夫：じゃあ、リサイクルショップに持っていくのはどうかな。電話して引き取りに来てもらえるか聞いてみようか。\n妻：それがいいかも。査定によってはお金になるかもしれないし。\n夫：じゃあ明日、電話してみる。\n質問：夫は古い家電をどうすることにしましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('市役所に粗大ごみとして申し込む', false, 1),
  ('引越し業者に処分してもらう', false, 2),
  ('新しい家に持っていく', false, 3),
  ('リサイクルショップに電話して引き取りを依頼する', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 404: 飲食店 — アルバイトのシフト調整 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n店長：来週の土曜日なんだけど、人手が足りなくて。ランチの時間帯だけでも入れる？\n店員：来週の土曜日ですか。午後3時までならなんとかなりますが。\n店長：ランチは11時から3時なんだ。ちょうどいいじゃない。\n店員：そうですね。でも11時より少し前に来てほしいですか。\n店長：そうだね、準備があるから10時45分に来てもらえると助かる。\n店員：わかりました。10時45分に来ます。\n質問：店員は来週の土曜日、何時に出勤することになりましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('午前11時', false, 1),
  ('午前10時45分', true, 2),
  ('午後3時', false, 3),
  ('午前10時', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 405: 学校 — 文化祭の準備 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n生徒A：文化祭まであと3日だね。クラスの展示、準備できてる？\n生徒B：パネルの半分はできてるんだけど、材料が足りなくて。\n生徒A：何が足りないの？\n生徒B：色画用紙が全然なくて。昨日、購買部に行ったんだけど売り切れだったんだよ。\n生徒A：じゃあ、先生に予算から出してもらって文具屋さんで買えないかな。\n生徒B：それ、聞いてみる価値あるね。今日の放課後、先生に相談してみる。\n生徒A：うん、早めに動かないと間に合わないよ。\n質問：生徒Bは放課後、何をする予定ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('先生に材料費の予算について相談する', true, 1),
  ('文具屋に材料を買いに行く', false, 2),
  ('購買部に在庫を確認しに行く', false, 3),
  ('展示パネルの残りを一人で完成させる', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 406: 旅行 — ホテルのチェックイン (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nフロント：いらっしゃいませ。ご予約のお名前をお願いします。\n客：山本です。2泊の予約をしています。\nフロント：山本様、ご確認いたします。……シングルルームを2泊でご予約ですね。本日のお部屋は506号室でございます。\n客：あの、高い階のお部屋をお願いできますか。眺めを楽しみたいので。\nフロント：少々お待ちください。…8階の801号室が空いております。眺めもよろしいと思います。\n客：それでお願いします。チェックアウトは何時ですか。\nフロント：午前11時でございます。お荷物のお預かりはチェックアウト後も承ります。\n質問：客が泊まることになった部屋の番号はどれですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('506号室', false, 1),
  ('508号室', false, 2),
  ('801号室', true, 3),
  ('810号室', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 407: 職場 — 退職の挨拶 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n林：加藤さん、今月で退職されるんですね。\n加藤：ええ、今月末で。本当にお世話になりました。\n林：次は何をされるんですか。\n加藤：実は、以前からやりたかったカフェを開くことにしたんです。\n林：それは素敵ですね。場所はもう決まっているんですか。\n加藤：はい。来月から物件の改装工事が始まる予定で、年明けのオープンを目指しています。\n林：そうですか。ぜひ開店したら教えてください。\n加藤：もちろんです。その際はぜひお越しください。\n質問：加藤さんのカフェはいつオープンする予定ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('今月末', false, 1),
  ('年明け', true, 2),
  ('来月', false, 3),
  ('工事完了後すぐ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 408: 図書館 — 貸し出しの延長 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n利用者：すみません、先週借りた本なんですが、もう少し時間が必要で。延長できますか。\nカウンター：はい、延長は可能ですが、同じ本をほかの方が予約されている場合はできないんです。\n利用者：あ、そうですか。確認していただけますか。\nカウンター：少々お待ちください。……ご予約はないようですので、延長できます。2週間の延長になります。\n利用者：よかったです。電話でも延長の手続きができますか。\nカウンター：はい、電話でも可能ですし、ホームページからもできます。次回からはそちらをご利用ください。\n質問：利用者が今回借りた本の延長が認められた理由は何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('利用者が図書館会員だから', false, 1),
  ('本の状態が良好だったから', false, 2),
  ('館員が特別に許可したから', false, 3),
  ('ほかに予約している人がいなかったから', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 409: 職場 — 出張の手配 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n社員：課長、来週の大阪出張の件ですが、新幹線の手配はもう済んでいますか。\n課長：ああ、まだなんだよ。君のほうで手配してもらえるかな。\n社員：わかりました。往復でよろしいですか。\n課長：ええ。行きは月曜日の朝8時台の便で、帰りは火曜日の夕方遅い便にしてほしいな。\n社員：ホテルはどうしましょうか。\n課長：それも一緒に頼めるかな。会社の近くがいい。\n社員：了解しました。手配が完了したらすぐにご連絡します。\n質問：社員が今すぐしなければならないことは何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('新幹線とホテルの手配をする', true, 1),
  ('課長に出張の目的を確認する', false, 2),
  ('出張報告書を作成する', false, 3),
  ('大阪の取引先にアポイントを取る', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 410: 家庭 — 習い事の選択 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n親：来月からお稽古事を始めようと思ってるんだけど、ピアノとそろばんとスイミング、どれがいい？\n子：うーん、スイミングはちょっと苦手だから嫌だな。\n親：そう。じゃあピアノとそろばんどっちがいい？\n子：ピアノが弾けるようになりたいけど、友達がそろばんに通ってるって言ってたから、一緒がいいな。\n親：友達が通ってるからって理由じゃちょっとね。自分でよく考えてみて。\n子：……やっぱりピアノにする。前から弾きたかったし。\n親：よし、じゃあピアノ教室を探してみよう。\n質問：子どもは最終的に何を習うことにしましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スイミング', false, 1),
  ('ピアノ', true, 2),
  ('そろばん', false, 3),
  ('スイミングとそろばんの両方', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 411: 職場 — 名刺交換後のフォロー (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n先輩：昨日の交流会、どうだった？\n後輩：はい、いろいろな方とお話しできて。名刺もたくさんいただきました。\n先輩：よかったね。ちゃんとフォローアップはしてる？\n後輩：まだなんですが、どうすればいいですか。\n先輩：お会いしてから24時間以内にメールで御礼を伝えるのが基本だよ。次回につながる可能性がある方には、具体的に「またお話しできれば」という一言を添えてね。\n後輩：わかりました。今日中にメールします。\n質問：先輩は後輩にどんな行動をすすめましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('名刺をアルバムに整理する', false, 1),
  ('すぐに電話でお礼を伝える', false, 2),
  ('24時間以内にメールで御礼を送る', true, 3),
  ('会社のウェブサイトを調べてから連絡する', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 412: 大学 — 留学の相談 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n学生：先生、来年カナダに留学したいと思っているんですが、どんな準備が必要でしょうか。\n先生：まず英語の資格試験を受けて、必要なスコアを取ることが大切ですね。大学によって要求スコアが違うので、希望する大学を早めに絞ってください。\n学生：スコアはどのくらい必要ですか。\n先生：IELTSなら6.5以上が一般的です。あと奨学金の申請も、締め切りが来年3月と早いので今から調べておいた方がいいですよ。\n学生：わかりました。まずは英語の勉強を頑張ります。\n先生：そうですね。国際交流センターにも行ってみてください。個別に相談に乗ってくれますよ。\n質問：先生が最初にすすめたことは何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('奨学金の申請をする', false, 1),
  ('国際交流センターを訪ねる', false, 2),
  ('カナダのビザを申請する', false, 3),
  ('英語の資格試験を受けて必要なスコアを取る', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 413: 地域 — ゴミ収集ルールの確認 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n新住民：あの、このアパートのゴミの捨て方を教えてもらえますか。先週引っ越してきたばかりで。\n住民：ああ、燃えるゴミは月・木・土の週3回です。収集は朝8時までなので、それより前に出してください。\n新住民：缶とビンはどうですか。\n住民：資源ゴミの日が毎週水曜日です。ちゃんと洗って袋に入れてから出してください。\n新住民：段ボールはどこに出せばいいですか。\n住民：駐車場の隅に段ボール専用のボックスがあります。いつでも出せますが、いっぱいになりそうなときは管理会社に連絡することになっています。\n新住民：ありがとうございます。とても助かりました。\n質問：燃えるゴミを出す日はいつですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('月・木・土', true, 1),
  ('火・木・土', false, 2),
  ('月・水・金', false, 3),
  ('毎日', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 414: 職場 — 上司への相談（残業申請） (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n社員：課長、今週の金曜日、残業の許可をいただけますか。月末の集計が間に合いそうにないので。\n課長：どのくらいかかりそう？\n社員：2時間ほどあれば終わると思います。\n課長：わかった。でも残業は事前にシステムで申請してから行うルールだから、今日中に申請を入れておいてね。\n社員：はい、すぐに申請します。\n課長：あと、申請には「作業内容」と「終了予定時刻」を書く欄があるから、そこも忘れずに。\n社員：わかりました。ありがとうございます。\n質問：課長が社員に対して注意したことは何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('残業は原則禁止だということ', false, 1),
  ('残業前にシステムで事前申請をすること', true, 2),
  ('月末は残業できないこと', false, 3),
  ('上司の承認を口頭でもらえば十分だということ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 415: 友人同士 — イベントの計画 (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nA：来月のお花見、去年みたいに上野公園にする？\nB：上野は混みすぎるから、今年は別の公園にしない？\nA：そうだね。どこかいい場所知ってる？\nB：近所の川沿いの公園はどうかな。去年友達と行ったんだけど、木がたくさんあってきれいだったよ。\nA：いいね。人数はどれくらい集まりそう？\nB：声をかけてみないとわからないけど、多くても10人くらいかな。\nA：なら、場所の予約は必要ないね。じゃあ当日の準備係を決めておこうか。\nB：そうだね。次に話し合うときに決めよう。\n質問：ふたりは今年のお花見をどこでする予定ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('去年と同じ上野公園', false, 1),
  ('Aの家の近くの公園', false, 2),
  ('川沿いの公園', true, 3),
  ('まだ決まっていない', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 416: セミナー — 日本語教育の現状 (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n近年、海外で日本語を学ぶ人の数は増加傾向にあります。文化庁の調査によると、海外の日本語学習者数は約380万人にのぼると言われており、特にアジア地域での学習者数の増加が顕著です。日本語学習の動機としては、アニメや漫画などの日本のポップカルチャーへの関心が上位を占める一方、ビジネスや就職目的での学習者も増えています。また、日本国内でも外国人労働者の増加にともない、日本語支援の重要性が高まっています。地域の日本語教室やボランティア活動が果たす役割は大きく、行政との連携も進んでいます。こうした状況を背景に、日本語教師の資格制度も整備され、専門性の高い教育が求められています。\n質問：海外の日本語学習者数はおよそ何人と言われていますか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('約380万人', true, 1),
  ('約38万人', false, 2),
  ('約800万人', false, 3),
  ('約3800万人', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 417: 講演 — 食品ロス削減の取り組み (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n日本では毎年約600万トンの食品が廃棄されており、これは世界の食料援助量の約1.5倍に相当します。この問題に対し、政府は2019年に「食品ロス削減推進法」を制定し、企業や家庭に対して食品ロスの削減を呼びかけています。スーパーマーケットでは「てまえどり」、つまり賞味期限の近い商品を積極的に手前から取るよう促すキャンペーンが広がっています。また、規格外の野菜や見た目がよくない食品を販売するフードバンクや「もったいない市場」の普及も進んでいます。家庭においても、買いすぎない・作りすぎないという意識を持つことが食品ロス削減につながります。\n質問：「てまえどり」とはどういうことですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('商品を前の棚に整理すること', false, 1),
  ('手作り料理を持参すること', false, 2),
  ('食品の値引きを要求すること', false, 3),
  ('賞味期限の近い商品を手前から積極的に選ぶこと', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 418: ラジオ — 新製品の紹介 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nこちらは今月発売されたスマート加湿器「モイストエア2」のご紹介です。この製品の最大の特長は、スマートフォンのアプリと連携して、外出先からでも遠隔操作ができる点です。部屋の湿度を自動で最適な状態に保つ自動調節機能も搭載しており、乾燥が気になる季節に大変便利です。タンクの容量は4.5リットルで、連続稼働時間は最大12時間です。また、超音波式を採用しているため動作音が非常に静かで、寝室での使用にも向いています。価格はオープン価格ですが、店頭では1万4千円前後で販売されています。詳しくは公式ウェブサイトをご覧ください。\n質問：「モイストエア2」の最大の特長として紹介されているのは何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('タンクの容量が大きい点', false, 1),
  ('スマートフォンから遠隔操作ができる点', true, 2),
  ('動作音が静かな点', false, 3),
  ('価格が安い点', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 419: 公共放送 — 図書館の臨時休館案内 (announcement)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nみなさまにお知らせいたします。桜ヶ丘市立中央図書館は、館内設備の点検整備のため、来週月曜日から水曜日まで3日間、臨時休館いたします。この期間中は返却ポストのご利用は可能ですが、新規の貸し出しおよび資料の閲覧はできません。ご予約中の資料については、休館明けの木曜日以降にご来館の上お受け取りください。また、電話での問い合わせについては、休館期間中も午前9時から午後5時まで承ります。来週木曜日からは通常通り開館いたします。大変ご不便をおかけしますが、ご理解ご協力をお願いいたします。\n質問：臨時休館中にできることはどれですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('返却ポストへの本の返却', true, 1),
  ('新規の本の貸し出し', false, 2),
  ('予約している資料の受け取り', false, 3),
  ('館内の資料の閲覧', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 420: 会社 — 新しい経費精算システムの説明 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nお知らせです。来月から経費精算システムが新しくなります。これまでは紙の領収書を総務部に提出していましたが、新システムでは、スマートフォンで領収書を撮影してアプリからアップロードするだけで精算申請が完了します。申請後は上長がアプリ上で承認を行い、承認後3営業日以内に指定口座へ振り込まれます。なお、1万円以上の経費については引き続き原本の提出が必要です。新システムの操作説明会を今月25日の午後2時から第1会議室で行います。参加必須ではありませんが、不明な点がある方はぜひご参加ください。\n質問：新しい経費精算システムで、原本の提出が引き続き必要な場合はどれですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('すべての経費精算', false, 1),
  ('5千円以上の経費', false, 2),
  ('1万円以上の経費', true, 3),
  ('交通費のみ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 421: 地域 — 夏祭りの準備案内 (announcement)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nおしらせします。来月第3土曜日に開催予定の「なかよし夏祭り」の準備スタッフを募集しています。作業は当日の3日前、つまり水曜日の午前10時から正午まで、公民館駐車場でテントや機材の設置を行います。参加できる方は、今月20日までに自治会事務局へお電話かメールでご連絡ください。当日のボランティアスタッフも別途募集しておりますので、当日のみ参加ご希望の方もご連絡ください。なお、作業当日は動きやすい服装と、暑さ対策として水筒の持参をお願いします。ご協力よろしくお願いします。\n質問：準備スタッフの申し込み締め切りはいつですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('来月第3土曜日', false, 1),
  ('今月20日', true, 2),
  ('準備当日の水曜日', false, 3),
  ('今週末', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 422: 大学の授業 — フィールドワークの説明 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nえー、来週のフィールドワークについてお知らせします。集合は午前9時、大学の正門前です。電車で移動しますので、交通系ICカードを必ずお持ちください。当日の服装は動きやすいものでお願いします。現地では2班に分かれて行動し、各班のリーダーは前回の授業で選んだ通りです。午後12時から1時間、各自で昼食をとっていただきます。大学への帰着は午後5時の予定です。レポートは翌週の授業日に提出してください。参加できない場合は、事前に私か担当TAにメールでご連絡ください。無断欠席の場合は単位に影響しますのでご注意ください。\n質問：フィールドワーク当日に持参しなければならないものとして言及されているのは何ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('弁当と水筒', false, 1),
  ('レポート用紙と筆記用具', false, 2),
  ('学生証と現金', false, 3),
  ('交通系ICカード', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 423: テレビ — 地域の農業紹介 (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nここ、長野県の高原に広がる農場では、標高1200メートルの冷涼な気候を生かして、レタスやキャベツなどの高原野菜を栽培しています。この地域の野菜は、朝晩の気温差が大きいため、甘みが強くシャキシャキとした食感が特長です。この農場を経営する中村さん（51歳）は、20年前に都会から移住し、農業を始めました。「最初の3年間は失敗の連続でしたが、地元の農家の方々に支えてもらいながら少しずつ技術を身につけました」と語ります。現在では、都市部のスーパーへの出荷だけでなく、農場での農業体験プログラムも実施しており、年間約500人が訪れています。\n質問：この農場の野菜の特長として正しいのはどれですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('甘みが強くシャキシャキとした食感', true, 1),
  ('色が鮮やかで香りが強い', false, 2),
  ('水分が少なく長期保存ができる', false, 3),
  ('辛みがあって加熱するとおいしい', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 424: 市役所 — 子育て支援サービスの説明 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n当市では、お子さまをお持ちの保護者の方を対象に、「子育てサポートプラン」を実施しています。このプランでは、3歳未満のお子さまがいるご家庭に、月最大10時間の一時保育サービスを無料でご提供しています。また、育児に関する悩み相談を電話またはオンラインで受け付けており、小児科医や保育士への相談が平日の午前9時から午後6時まで可能です。さらに、月1回の「親子交流ひろば」を市民センターで開催しており、参加費は無料です。ご利用には事前登録が必要です。詳しくは市のウェブサイトか、子育て支援課の窓口（内線205）までお問い合わせください。\n質問：一時保育サービスが無料で利用できるのはどんな家庭ですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('小学生以下のお子さまがいる家庭', false, 1),
  ('収入が一定以下の家庭', false, 2),
  ('3歳未満のお子さまがいる家庭', true, 3),
  ('ひとり親の家庭', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 425: 職場 — 社内のSDGs活動の紹介 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n皆さん、おはようございます。本日はわが社のSDGs推進委員会の活動についてご報告します。昨年度から取り組んでいる「グリーンオフィスプロジェクト」では、まず社内の電力使用量を前年比で15パーセント削減することを目標に設定しました。具体的には、会議室の照明をすべてLEDに切り替え、また不使用時の電源オフ徹底をルール化しました。その結果、昨年度は前年比13パーセントの削減を達成することができました。目標にはあと2パーセント届かなかったものの、これは社員の皆さんの協力のおかげです。今年度は目標を20パーセント削減に引き上げ、さらにペーパーレス化も推進していく予定です。\n質問：昨年度の電力削減の目標は何パーセントで、実際の削減量は何パーセントでしたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('目標20パーセント、実績15パーセント', false, 1),
  ('目標15パーセント、実績13パーセント', true, 2),
  ('目標13パーセント、実績20パーセント', false, 3),
  ('目標20パーセント、実績20パーセント', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 426: 公共施設 — プール開放の案内 (announcement)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nみなさまにお知らせします。市民プール「なぎさ」では、7月20日から8月31日まで夏季一般開放を行います。開放時間は毎日午前9時から午後5時です。ただし、火曜日は定期清掃のため休館となりますのでご注意ください。入場料は中学生以上が500円、小学生以下は200円です。幼児（3歳未満）は保護者同伴であれば無料です。なお、水着着用が義務付けられており、一般の衣類での入水はお断りしています。水着のレンタルは1回300円でご利用いただけます。当日は混雑が予想されますので、公共交通機関でお越しください。駐車場の利用はご遠慮いただいております。\n質問：このプールが休館となるのはいつですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('月曜日', false, 1),
  ('水曜日', false, 2),
  ('土日祝日', false, 3),
  ('火曜日', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 427: ラジオ — 人口減少と地方移住の話題 (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n日本の地方では人口減少が深刻な課題となっています。こうした状況に対し、テレワークの普及をきっかけに都市部から地方へ移住する人が増えています。特に、コロナ禍以降、大都市圏の若い世代を中心に「地方移住」への関心が高まっており、多くの自治体が移住促進策を打ち出しています。たとえば、移住者向けの住宅補助や、子育て支援の充実、新規就農支援などが各地で行われています。専門家は「単なる移住支援にとどまらず、移住者が地域に定着し、地域の担い手として活躍できる環境づくりが重要だ」と指摘しています。移住は個人のライフスタイルの変化だけでなく、地域社会の活性化にもつながる可能性を秘めています。\n質問：地方移住への関心が特に高まったきっかけは何だとこの話題で述べられていますか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('テレワークの普及とコロナ禍', true, 1),
  ('地方の住宅価格が大幅に下落したこと', false, 2),
  ('政府による地方移住の義務化', false, 3),
  ('農業に従事したいという若者の増加', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 428: 病院 — 薬の服用方法の説明 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n今日処方したお薬についてご説明します。この抗生物質は1日3回、食後に服用してください。朝・昼・夕の食事のあとにお飲みください。薬の効き目を保つために、できるだけ規則正しい時間に飲むことが大切です。副作用として、まれに胃の不快感や下痢が出ることがありますが、症状がひどい場合はすぐにご連絡ください。薬を飲み忘れた場合は、気づいたときにすぐ飲んでください。ただし、次の服用時間が近い場合は1回分をとばして構いません。絶対に2回分をまとめて飲まないようにしてください。5日分処方していますので、症状がよくなっても最後まで飲み続けてください。\n質問：薬を飲み忘れた場合、どうすればいいですか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('すぐに病院に連絡する', false, 1),
  ('次の食後に2回分まとめて飲む', false, 2),
  ('気づいたときにすぐ飲み、次が近ければ1回分をとばす', true, 3),
  ('その日の分は飲まずに次の日から再開する', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 429: 社内研修 — プレゼンテーションの技法 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\nでは、効果的なプレゼンテーションの構成についてお話しします。プレゼンテーションは「はじめ・なか・おわり」の3部構成が基本です。まず「はじめ」では、聴衆の興味を引きつけるために問いかけや具体的な事例から入ると効果的です。「なか」の部分では、情報を3点に絞ることで聴衆が記憶しやすくなります。「おわり」では、内容を簡潔にまとめ、聴衆に何をしてほしいか（行動喚起）を明確に伝えましょう。また、スライドの1枚あたりの文字数は少なく、図やグラフを積極的に使うことが視覚的に伝わりやすくするコツです。声の速さは、普段よりやや遅めを意識してください。\n質問：プレゼンテーションの「なか」の部分で、情報を何点に絞るとよいと説明されていましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('5点', false, 1),
  ('3点', true, 2),
  ('10点', false, 3),
  ('2点', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 430: テレビニュース — 新しいIT技術の活用 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
  E'次の会話を聴いて、質問に答えてください。\n東京都内のあるスーパーマーケットでは、AIを活用した在庫管理システムを導入し、食品ロスの削減に成功しています。このシステムは、過去の販売データや天気予報、地域のイベント情報などをもとに、商品の需要を予測し、発注量を自動で調整します。導入前は週に約3万円分の食品廃棄が発生していましたが、導入後は廃棄量が約60パーセント減少しました。また、在庫の過不足が減ったことで、スタッフの発注作業の時間も半分以下になり、その時間を接客に充てられるようになったと店長は話しています。同社はこのシステムを来年度中に全国20店舗に導入する計画を発表しています。\n質問：AIシステム導入後、食品の廃棄量はどう変化しましたか。',
  'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('2倍に増加した', false, 1),
  ('変化しなかった', false, 2),
  ('30パーセント減少した', false, 3),
  ('約60パーセント減少した', true, 4)
) AS t(txt, ok, so);
