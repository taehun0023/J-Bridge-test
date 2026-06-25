-- encoding: UTF-8
-- JLPT N2 Listening Questions — Batch 3 (pool, quiz_id bb000002-0000-0000-0000-000000000003)
-- 作成日: 2026-06-26
-- 問題数: 30問 (sort_order 401–430)
-- 正答分布: 1→8問, 2→8問, 3→7問, 4→7問 (sort_order内でも均等分散)
-- 品質基準: exam_quality_rubric.md A1/A2/L1/L3(≤80字/発話)/B5/B6/B8
-- ============================================================
-- 401: コンビニ — 釣り銭のトラブル (dialogue) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
店員：ありがとうございます。1,350円のお買い上げです。
客：2,000円でお願いします。
店員：650円のお返しです。…あ、申し訳ありません、100円少なくお渡ししました。
客：え、確認してみます。…やはり550円しかないですね。
店員：大変失礼いたしました。こちらが不足分の100円です。
質問：客が最初に受け取ったお釣りはいくらでしたか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('550円', true, 1),
  ('650円', false, 2),
  ('750円', false, 3),
  ('500円', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 402: ホテル — チェックイン時の部屋変更 (dialogue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
フロント：お待ちしておりました。山本様でいらっしゃいますか。
客：はい。予約していた山本です。
フロント：本日は禁煙ツインルームのご予約ですが、誠に恐れ入りますが満室となっております。
客：え、予約があるのに？
フロント：はい、システムの不具合で重複してしまいまして。代わりに禁煙ダブルルームをご用意し、差額はいただきません。
客：わかりました。それでお願いします。
質問：客はどの部屋に泊まることになりましたか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('喫煙ツインルーム', false, 1),
  ('禁煙ダブルルーム', true, 2),
  ('禁煙ツインルーム', false, 3),
  ('喫煙ダブルルーム', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 403: 料理教室 — レシピの説明 (monologue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
講師：今日は肉じゃがの作り方をご説明します。まず玉ねぎとじゃがいもを一口大に切ります。次に牛肉を炒め、野菜を加えて全体に油をなじませます。だし汁を入れて沸騰したら、砂糖・しょうゆ・みりんを加えて中火で20分ほど煮込みます。最後に火を止めて5分ほど蒸らすと、味がよくなじみます。
質問：調味料を加えるのはどのタイミングですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('野菜を切る前', false, 1),
  ('牛肉を炒める前', false, 2),
  ('野菜を炒めた後、油がなじんでから', false, 3),
  ('だし汁を入れて沸騰した後', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 404: スポーツクラブ — 入会案内 (dialogue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
スタッフ：本日は見学にいらっしゃいましたか。
客：はい。月会費はどのくらいですか？
スタッフ：平日のみのプランが月6,000円、フルタイムプランが月9,000円です。
客：プールも使えますか？
スタッフ：フルタイムプランのみプールがご利用いただけます。入会金は初回のみ5,000円かかります。
客：フルタイムにしようと思います。今日入会した場合、入会金は必要ですか？
スタッフ：はい、初回ですので5,000円いただきます。
質問：客が今日入会した場合、初月に支払う総額はいくらですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('6,000円', false, 1),
  ('9,000円', false, 2),
  ('14,000円', true, 3),
  ('11,000円', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 405: 銀行 — 口座開設手続き (dialogue) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
行員：本日はどのようなご用件でしょうか。
客：普通預金の口座を開きたいのですが。
行員：かしこまりました。本人確認書類はお持ちですか。
客：運転免許証があります。
行員：ありがとうございます。こちらの申込書にご記入いただき、印鑑もご用意ください。
客：印鑑は持ってきませんでした。
行員：サインでも対応できますが、後日通帳を受け取りに来ていただく必要があります。
質問：客が印鑑なしで手続きした場合、どうなりますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('後日通帳を受け取りに来る必要がある', true, 1),
  ('その場で口座を開くことができない', false, 2),
  ('口座は開けるが引き出しができない', false, 3),
  ('別の銀行に行くよう案内される', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 406: 郵便局 — 荷物の発送 (dialogue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
局員：こちらの荷物はどのようにお送りになりますか。
客：大阪まで送りたいのですが、一番早い方法は何ですか？
局員：速達でしたら翌日届きます。ただし、サイズが大きいので宅急便の方がお得かもしれません。
客：宅急便だと何日かかりますか？
局員：明後日の到着になります。
客：急ぎではないので宅急便でお願いします。
質問：客が選んだ発送方法で荷物が届くのはいつですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('翌日', false, 1),
  ('明後日', true, 2),
  ('3日後', false, 3),
  ('1週間後', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 407: 車の修理 — 点検と修理の見積もり (dialogue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
整備士：お車を拝見しました。ブレーキパッドの交換が必要です。このままですと危険な状態です。
客：費用はどのくらいかかりますか？
整備士：部品代と工賃合わせて約2万円です。タイヤも少し減っていますが、こちらはまだ大丈夫です。
客：ブレーキは今日やってもらえますか？
整備士：部品の在庫がありますので、2時間ほどでできます。
客：ではお願いします。タイヤは次回でいいです。
質問：今日修理するのは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('タイヤとブレーキパッド', false, 1),
  ('タイヤのみ', false, 2),
  ('ブレーキパッドのみ', true, 3),
  ('エンジンオイルとブレーキパッド', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 408: 薬局 — 薬の選び方 (dialogue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
薬剤師：どうぞ、どのようなお悩みですか。
客：昨日から花粉症がひどくて、目がかゆいのと鼻水が止まらないんです。
薬剤師：今、他に飲んでいるお薬はありますか？
客：血圧の薬を飲んでいます。
薬剤師：そうですか。一部の花粉症薬は血圧に影響する成分が入っています。この薬は比較的安全ですが、念のため量を少なめから試してください。
質問：薬剤師が少量から試すよう勧めた理由は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('この薬が高価だから', false, 1),
  ('花粉症の症状が軽いから', false, 2),
  ('薬の効き目が強すぎるから', false, 3),
  ('血圧の薬と影響し合う可能性があるから', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 409: 学校 — 保護者面談 (dialogue) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
担任：本日はお時間をいただきありがとうございます。健太くんですが、算数は大変よくできています。ただ、最近クラスでの発言が少なくなっているのが少し気になっています。
保護者：家でも少し元気がないみたいで、心配していたんです。
担任：お友達との関係は問題なさそうですが、もし何か気になることがあればすぐにご連絡ください。
保護者：はい、わかりました。家でも話してみます。
質問：担任の先生が心配しているのは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('クラスでの発言が少なくなっていること', true, 1),
  ('算数の成績が下がっていること', false, 2),
  ('友達との関係がうまくいっていないこと', false, 3),
  ('遅刻や欠席が増えていること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 410: 職場 — 歓迎会の準備 (dialogue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
田中：来週の歓迎会、お店はもう予約しましたか？
山田：はい、駅前の居酒屋を20人で予約しました。でもメニューはまだ決めていなくて。
田中：新しく来る中村さん、魚介類アレルギーがあるって聞きましたよ。
山田：えっ、それは大事なことですね。すぐにお店に伝えます。コースの変更もできるか確認します。
田中：あと、開始時間は7時でいいですか？
山田：課長は7時半以降でないと難しいとのことなので、7時半にしました。
質問：山田さんがすぐにしなければならないことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('参加人数を20人から変更する', false, 1),
  ('アレルギーについてお店に連絡してコースを確認する', true, 2),
  ('開始時間を7時に変更するよう依頼する', false, 3),
  ('別のお店を予約し直す', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 411: 旅行 — 旅程の相談 (dialogue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
女：京都旅行のスケジュールなんだけど、1日目は金閣寺と嵐山、2日目は伏見稲荷と清水寺でどうかな。
男：いいね。でも伏見稲荷は朝早くに行った方が人が少ないって聞いたよ。
女：じゃあ2日目の最初に伏見稲荷に行って、それから清水寺はどう？
男：それがいいと思う。2日目は電車で移動するの？
女：うん、観光地が離れてるから電車の方が楽だと思って。
質問：2日目の観光の順番はどうなりましたか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('清水寺→伏見稲荷の順', false, 1),
  ('金閣寺→清水寺→伏見稲荷の順', false, 2),
  ('伏見稲荷→清水寺の順', true, 3),
  ('嵐山→伏見稲荷→清水寺の順', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 412: 博物館 — ガイドツアーの説明 (monologue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
ガイド：本日のガイドツアーにお越しいただきありがとうございます。所要時間は約90分です。館内では写真撮影は自由ですが、フラッシュはご遠慮ください。また、展示品には手を触れないようお願いします。ツアーは3つのゾーンに分かれており、まず1階の古代ゾーン、次に2階の近世ゾーン、最後に3階の現代ゾーンをご案内します。
質問：ガイドが禁止したことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('館内での写真撮影全般', false, 1),
  ('ガイドへの質問', false, 2),
  ('3階への立ち入り', false, 3),
  ('フラッシュ撮影と展示品への接触', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 413: 市民センター — イベント案内放送 (announcement) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次のアナウンスを聴いて、質問に答えてください。
アナウンス：市民センターからのお知らせです。今月28日土曜日の午後2時から、3階ホールにて「ふるさと音楽祭」を開催します。入場は無料ですが、事前に1階窓口または市のホームページからお申し込みください。定員は200名となっております。お早めにお申し込みください。
質問：このイベントに参加するために必要なことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('事前に窓口またはホームページから申し込む', true, 1),
  ('当日3階ホールで入場料を支払う', false, 2),
  ('市民センターの会員証を提示する', false, 3),
  ('電話で予約して確認メールを受け取る', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 414: レンタカー — 予約の確認 (telephone) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の電話を聴いて、質問に答えてください。
スタッフ：はい、さくらレンタカーでございます。
客：来週の土曜日に軽自動車を一日借りたいのですが。
スタッフ：土曜日ですね。確認いたします。…8時から18時でしたら1台ご用意できます。
客：18時より少し遅くなりそうです。19時でも大丈夫ですか？
スタッフ：19時の返却は対応しておりますが、延長料金として2,000円追加となります。
客：わかりました。それでお願いします。
質問：客が選んだ返却時間と追加費用はどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('18時返却、追加料金なし', false, 1),
  ('19時返却、2,000円追加', true, 2),
  ('18時返却、1,000円追加', false, 3),
  ('19時返却、追加料金なし', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 415: ボランティア英語教室 — 活動説明 (monologue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
担当者：当ボランティア英語教室は、地域に住む外国の方々に日常英語を教える活動です。毎月第2・第4土曜日の午前10時から12時まで、地域センターの会議室で行います。特別な資格は必要ありませんが、英語を楽しく教えたいという気持ちが大切です。興味のある方は来月の説明会にご参加ください。
質問：このボランティアに参加する条件として正しいのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('英語教師の資格を持っていること', false, 1),
  ('毎週土曜日に参加できること', false, 2),
  ('英語を楽しく教えたいという気持ちがあること', true, 3),
  ('地域センターの会員であること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 416: カフェ — アルバイト面接 (dialogue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
店長：週に何日くらい働けますか？
応募者：週3日から4日を希望しています。土日は必ず入れます。
店長：ありがとうございます。コーヒーに関する知識はありますか？
応募者：家で毎日コーヒーを飲みますが、専門的な知識はまだありません。
店長：大丈夫です。うちでは研修がありますので、基本から教えます。以前にカフェでのアルバイト経験はありますか？
応募者：カフェではないですが、コンビニで2年間働いていました。
質問：応募者についてわかることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('カフェで2年間のアルバイト経験がある', false, 1),
  ('コーヒーの専門的な知識がある', false, 2),
  ('週5日以上働きたいと希望している', false, 3),
  ('コンビニでのアルバイト経験があり、土日は出勤できる', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 417: 美術展 — 開会のあいさつ (monologue) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
館長：みなさま、本日は「現代アジア美術展」の開幕式にお越しいただき誠にありがとうございます。この展覧会には、日本・韓国・中国・インドの4か国から45名の作家が参加しています。作品数は120点にのぼります。来月15日までの開催ですので、ぜひ何度もお越しいただき、様々な視点からアジアの現代美術をお楽しみください。
質問：この展覧会に参加している作家の数はいくらですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('45名', true, 1),
  ('120名', false, 2),
  ('4名', false, 3),
  ('15名', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 418: フィットネスジム — 体験入会説明 (monologue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
スタッフ：体験入会では、マシンエリアとプールをご利用いただけます。ヨガやエアロビクスのスタジオクラスは正式会員のみとなっております。本日は当スタッフがマシンの使い方をご説明し、その後30分間ご自由にお試しいただけます。もし入会をご希望の場合は、本日であれば入会金が半額になるキャンペーンを実施しております。
質問：体験入会で利用できないのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('マシンエリア', false, 1),
  ('スタジオクラス', true, 2),
  ('プール', false, 3),
  ('スタッフによる説明', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 419: 保険 — 商品説明 (monologue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
担当者：今回ご紹介する医療保険は、入院1日目から保障が始まります。従来の保険は入院5日目以降が対象でしたが、この商品は短期入院にも対応しています。また、手術給付金も含まれており、保険料は月々2,800円からとなっています。持病がある方でも審査によっては加入できるプランもございます。
質問：この保険の特徴として正しいのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('入院5日目から保障が開始される', false, 1),
  ('持病がある方は加入できない', false, 2),
  ('入院1日目から保障され、手術給付金も含まれる', true, 3),
  ('保険料は月々5,000円以上かかる', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 420: ガーデニングクラブ — 活動案内放送 (announcement) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次のアナウンスを聴いて、質問に答えてください。
アナウンス：みどりヶ丘ガーデニングクラブからお知らせです。来月の第1日曜日に春の植え替え作業を行います。参加ご希望の方は、軍手と汚れてもよい服装でお集まりください。道具はクラブで用意します。雨天の場合は翌週に延期となります。事前申し込みは不要です。詳しくは掲示板をご覧ください。
質問：参加者が自分で持参しなければならないものは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スコップや移植ゴテなどの道具', false, 1),
  ('苗や種などの植物', false, 2),
  ('参加申込書', false, 3),
  ('軍手と汚れてもよい服装', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 421: ネット通販 — 返品手続き (telephone) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の電話を聴いて、質問に答えてください。
オペレーター：はい、サポートセンターでございます。
客：先週注文したジャケットが届いたのですが、色が説明と違うので返品したいんです。
オペレーター：大変申し訳ございません。商品到着後14日以内でしたら返品を承ります。
客：まだ5日しか経っていません。
オペレーター：かしこまりました。お客様番号をお知らせください。確認後、返送用ラベルをメールでお送りします。
客：それで着払いで送ればいいですか？
オペレーター：はい、弊社の不備ですので送料はいただきません。
質問：返品する際の送料はどうなりますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('会社が負担するため客は支払わなくてよい', true, 1),
  ('客が全額負担する必要がある', false, 2),
  ('送料は半額ずつ折半する', false, 3),
  ('返品できないため送料の議論は関係ない', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 422: ITサポート — ヘルプデスクへの問い合わせ (telephone) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の電話を聴いて、質問に答えてください。
担当者：ITサポートデスクです。
利用者：社内システムにログインできないんですが、エラーメッセージが出て。
担当者：どのようなメッセージが表示されていますか？
利用者：「パスワードが正しくありません」と出ています。
担当者：では、パスワードのリセット手続きをいたします。登録のメールアドレスにリンクをお送りしますので、そちらから新しいパスワードを設定してください。
利用者：わかりました。ありがとうございます。
質問：担当者が行う対応は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('利用者のパソコンを直接操作して修正する', false, 1),
  ('登録メールアドレスにパスワードリセットのリンクを送る', true, 2),
  ('新しいパスワードを電話で口頭で伝える', false, 3),
  ('システム全体を再起動して問題を解決する', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 423: アパート — 設備の修理依頼 (dialogue) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
入居者：管理室ですか。301号室の佐藤ですが、キッチンの蛇口から水が漏れているんです。
管理人：それは大変ですね。水は止まっていますか？
入居者：いいえ、ポタポタ落ちている状態です。
管理人：わかりました。本日中に業者に連絡して、なるべく早く修理に伺わせます。ご在宅の時間を教えていただけますか。
入居者：今日は夕方6時以降なら家にいます。
管理人：では、6時以降に業者が伺えるよう手配します。
質問：管理人はこの後どうすることにしましたか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('自分で修理道具を持って301号室に行く', false, 1),
  ('翌日の朝に修理業者を手配する', false, 2),
  ('本日6時以降に修理業者が伺えるよう手配する', true, 3),
  ('入居者に修理業者に直接連絡するよう伝える', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 424: 町内会 — 定例会議 (dialogue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
会長：今月の議題ですが、まず公園の清掃日についてです。前回は参加者が少なかったので、今回は日程を変えてみましょう。
副会長：平日より日曜日の方が参加しやすいと思います。
会長：そうですね。では、来月の第3日曜日にしましょう。次に、街灯が1か所壊れているという報告がありました。
副会長：市役所に連絡して修理を依頼しましょうか。
会長：お願いします。では連絡先を確認して、明日中に連絡してください。
質問：副会長が明日中にしなければならないことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('公園清掃の参加者を集める', false, 1),
  ('壊れた街灯を自分たちで修理する', false, 2),
  ('来月の清掃日程を全住民に連絡する', false, 3),
  ('市役所に連絡して街灯の修理を依頼する', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 425: 料理コンテスト — MCのアナウンス (announcement) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次のアナウンスを聴いて、質問に答えてください。
MC：皆さん、お待たせしました。第5回ふるさと料理コンテストを始めます。今年は全国から84チームがご参加くださいました。審査は、味・見た目・独創性の3項目で行われます。調理時間は40分です。それでは、スタートの合図とともに始めてください。準備はよろしいですか？
質問：今年のコンテストの参加チーム数はいくらですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('84チーム', true, 1),
  ('40チーム', false, 2),
  ('3チーム', false, 3),
  ('5チーム', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 426: 就職フェア — オリエンテーション (monologue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
担当者：本日の就職フェアでは、100社以上の企業ブースが出展しています。入場の際にお渡しした名札を常に着用してください。各社のブースでお話を聞く場合は、名刺を持参した方は差し上げてください。午後2時からは第1会議室でエントリーシートの書き方セミナーを開催します。参加は自由です。
質問：参加者が名刺を持っている場合、どうするよう案内されましたか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('受付に提出して名簿に登録する', false, 1),
  ('各企業のブースで担当者に渡す', true, 2),
  ('セミナー参加時に持参する', false, 3),
  ('フェア終了後にまとめて回収ボックスに入れる', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 427: 田舎町 — 観光促進ラジオ番組 (radio) 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次のラジオ番組を聴いて、質問に答えてください。
パーソナリティ：今日は長野県の小さな温泉町、奥塩沢をご紹介します。この町の特徴は、江戸時代から続く温泉と、地元産のそばです。毎年秋には「新そば祭り」が開かれ、全国から多くの訪問者が集まります。また、宿泊施設は少ないですが、地元の農家民宿が人気です。冬でも温泉があるので、年中楽しめます。
質問：奥塩沢の特徴として述べられていないのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('江戸時代から続く温泉があること', false, 1),
  ('毎年秋にそば祭りが開かれること', false, 2),
  ('大型ホテルや旅館が充実していること', true, 3),
  ('農家民宿が人気であること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 428: 大学サークル — 新入生勧誘 (dialogue) 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
先輩：うちの写真サークルに興味ありますか？週1回、日曜日に活動しています。
新入生：カメラは持っていないんですが、大丈夫ですか？
先輩：問題ないですよ。サークルのカメラを貸し出しています。入会費は3,000円で、年間の部費は無料です。
新入生：活動内容はどんなことをするんですか？
先輩：写真を撮りに出かけることと、月に1回講評会をやっています。
新入生：面白そうですね。体験参加はできますか？
先輩：もちろんです。次の日曜日に来てください。
質問：このサークルについて正しいのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('毎週土曜日に活動している', false, 1),
  ('カメラの貸し出しは有料である', false, 2),
  ('年間の部費が3,000円かかる', false, 3),
  ('カメラを持っていなくても参加できる', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 429: 病院 — 退院説明 (monologue) 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
医師：退院おめでとうございます。回復は順調ですが、まだ油断は禁物です。退院後1週間は激しい運動を避けてください。食事はバランスよく取っていただき、アルコールは2週間禁止です。処方した薬は毎食後に飲んでください。2週間後に外来で診察しますので、必ず来院してください。何か異常を感じたら、すぐにご連絡ください。
質問：退院後の注意として正しいのはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('アルコールは2週間飲んではいけない', true, 1),
  ('1か月間は運動を完全に禁止する', false, 2),
  ('薬は朝食後のみ1回飲む', false, 3),
  ('次の外来は1か月後の予定だ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 430: 保育園 — 入園説明会 (monologue) 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
園長：本日は入園説明会にお越しいただきありがとうございます。保育時間は朝7時半から夕方6時までです。延長保育は夜8時まで対応しておりますが、別途料金がかかります。持ち物はすべてお名前を書いてください。毎週月曜日は連絡帳をご提出ください。給食は火曜日から金曜日のみで、月曜日はお弁当をお持ちください。ご不明な点はいつでもご相談ください。
質問：月曜日に保護者がしなければならないことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('給食費を現金で持参する', false, 1),
  ('連絡帳を提出し、弁当を持たせる', true, 2),
  ('延長保育の申請書を提出する', false, 3),
  ('子どもを朝8時までに登園させる', false, 4)
) AS t(txt, ok, so);
