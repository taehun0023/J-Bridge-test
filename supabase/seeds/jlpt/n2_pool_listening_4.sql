-- encoding: UTF-8
-- JLPT N2 Listening Scripts — Pool Batch 4 (30 scripts, sort_order 401–430)
-- quiz_id: bb000002-0000-0000-0000-000000000003
-- 作成日: 2026-06-26
-- dialogue: 15本 (401–415), monologue/announcement: 15本 (416–430)
-- 正答分布: 0→8件, 1→8件, 2→7件, 3→7件
-- 品質基準: exam_quality_rubric.md A1/A2/B5/L3(≤80字/発話)
-- 既出状況（배치1·2）との重複なし

-- ============================================================
-- 401: 職場 — 出張の準備確認 (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n男：来週の大阪出張ですが、ホテルの予約は取れましたか。\n女：はい、駅前のビジネスホテルを2泊分予約しました。\n男：ありがとうございます。交通費の精算書類はいつまでに提出すればいいですか。\n女：帰社後3営業日以内です。領収書を必ずお持ち帰りください。\n男：わかりました。あと、先方への手土産は用意しますか。\n女：部長がすでに手配済みです。当日持参してください。\n質問：出張後、男性が3営業日以内にしなければならないことは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ホテルの予約を変更する', false, 1),
  ('手土産を部長に渡す', false, 2),
  ('交通費の精算書類を提出する', true, 3),
  ('先方にお礼のメールを送る', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 402: 大学 — 留学の手続き相談 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n学生：先生、交換留学の申請について教えていただきたいのですが。\n担当者：はい、どうぞ。締め切りは来月の15日です。必要書類は志望動機書、成績証明書、語学能力証明書の3点です。\n学生：語学能力証明書というのは、TOEICのスコアシートでいいですか。\n担当者：はい。ただしスコアが600点以上のものに限ります。それ以外の試験のスコアでも受け付けます。\n学生：わかりました。まず書類を揃えてから来週また伺います。\n担当者：書類が揃ったら、学生センターの窓口に提出してください。\n質問：学生は書類を揃えた後、どこに提出しますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('学生センターの窓口', true, 1),
  ('担当の先生の研究室', false, 2),
  ('語学センター', false, 3),
  ('オンラインで提出', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 403: 家庭 — 家電の修理依頼 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：もしもし、先日購入した洗濯機なんですが、電源が入らなくて。\nサポート：ご不便をおかけして申し訳ございません。まずコンセントが正しく差し込まれているかご確認いただけますか。\n客：確認しました。それでも動かないんです。\nサポート：承知しました。本日中にお伺いして確認できますが、いかがでしょうか。\n客：午後2時以降なら在宅しています。\nサポート：では午後2時から4時の間にお伺いします。修理が必要な場合は後日改めて部品を手配する形になります。\n客：わかりました。よろしくお願いします。\n質問：修理が必要だった場合、次にどうなりますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('その日すぐに修理してもらえる', false, 1),
  ('新しい洗濯機と交換してもらえる', false, 2),
  ('自分で修理センターに持ち込む', false, 3),
  ('後日改めて部品を手配することになる', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 404: 職場 — イベント準備の役割分担 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n佐々木：来週の創立記念パーティーの準備、手分けしましょう。私は会場の装飾を担当します。\n林：じゃあ、私は招待状の発送と出欠確認をします。ケータリングはどうしますか。\n佐々木：それは山本さんにお願いしてあります。あとは当日の司会が必要ですね。\n林：司会は私がやってもいいですが、招待状の業務が一段落してからでないと難しいです。\n佐々木：わかりました。では司会は私が引き受けます。林さんは招待状に専念してください。\n林：ありがとうございます。よろしくお願いします。\n質問：佐々木さんが担当することになったのは何ですか。（すべて選ぶ必要はありません。最も正確なものを選んでください。）',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ケータリングの手配と司会', false, 1),
  ('会場の装飾と司会', true, 2),
  ('招待状の発送と司会', false, 3),
  ('会場の装飾と招待状の発送', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 405: 友人 — 旅行プランの相談 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女A：夏休みの旅行どこにする？私は北海道がいいな。\n女B：北海道は去年行ったから、今年は沖縄はどう？\n女A：沖縄か。でも飛行機代が高くない？\n女B：早割で取れば2人で5万円以内に収まると思う。\n女A：それなら大丈夫かな。ホテルはどうする？\n女B：民泊のほうが安くて現地の生活も感じられていいよ。\n女A：じゃあ沖縄に決めよう。移動手段はどうする？\n女B：現地ではレンタカーを借りたほうが便利だと思う。\n女A：同意。じゃあ今週中に日程を決めて航空券を買おう。\n質問：2人が今週中にすることは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('日程を決めて航空券を購入する', true, 1),
  ('ホテルの予約をする', false, 2),
  ('レンタカーを手配する', false, 3),
  ('民泊施設を探す', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 406: 職場 — 後輩への業務引き継ぎ (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先輩：来月から私が別部署に異動するので、今の業務を引き継いでもらえますか。\n後輩：はい、よろしくお願いします。どんな業務ですか。\n先輩：主に月次報告書の作成と、取引先への定期連絡です。手順書はすでに準備してあります。\n後輩：引き継ぎ期間はどのくらいありますか。\n先輩：2週間で一緒に作業しながら覚えてもらいます。不明な点はその間に何でも聞いてください。\n後輩：わかりました。手順書はいつ共有してもらえますか。\n先輩：今日の午後メールで送ります。\n質問：引き継ぎについて正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('引き継ぎは1か月かけて行う', false, 1),
  ('手順書はまだ作成されていない', false, 2),
  ('後輩は取引先への連絡だけを担当する', false, 3),
  ('引き継ぎ期間は2週間で手順書は今日共有される', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 407: 飲食店 — アルバイト面接 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n店長：履歴書を拝見しました。カフェの経験はありますか。\n応募者：はい、学生時代に1年間、別のカフェでホール担当をしていました。\n店長：当店ではホールとキッチンを両方担当していただきます。キッチンのご経験は？\n応募者：キッチンは未経験ですが、料理は好きで学ぶ意欲はあります。\n店長：週に何日入れますか。\n応募者：週3日から4日、土日は必ず入れます。\n店長：では採用とさせていただきます。来週の月曜日から研修を始めましょう。\n応募者：ありがとうございます。よろしくお願いします。\n質問：この応募者について正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('キッチンの経験が1年ある', false, 1),
  ('ホール経験はあるがキッチンは未経験', true, 2),
  ('週2日しか働けない', false, 3),
  ('採用が見送られた', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 408: 地域 — 図書館の本探し (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n利用者：すみません、日本の伝統建築についての本を探しているんですが。\n司書：かしこまりました。カタログで検索しますね。…「日本建築史入門」と「和の空間デザイン」の2冊があります。\n利用者：どちらも借りられますか。\n司書：「日本建築史入門」は現在貸し出し中で、返却予定は来週水曜日です。「和の空間デザイン」はご利用いただけます。\n利用者：では「和の空間デザイン」を借ります。貸し出し中の本は予約できますか。\n司書：はい、この端末から予約できます。返却されたらメールでご連絡します。\n利用者：ありがとうございます。予約もします。\n質問：利用者がすることになったのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('「日本建築史入門」だけを借りる', false, 1),
  ('来週水曜日に図書館に来る', false, 2),
  ('「和の空間デザイン」を借り、「日本建築史入門」を予約する', true, 3),
  ('2冊とも予約して後日取りに来る', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 409: 職場 — 製品クレーム対応 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：先週購入したノートパソコンですが、バッテリーがすぐに切れてしまいます。2時間も持ちません。\n店員：それは大変失礼いたしました。まず初期不良かどうか診断させていただいてよろしいでしょうか。\n客：はい、お願いします。どのくらい時間がかかりますか。\n店員：30分ほどいただければと思います。もし初期不良と確認されれば、同じ機種と交換させていただきます。\n客：もし在庫がない場合は？\n店員：その場合は全額返金か、別モデルへの変更をご選択いただけます。\n客：わかりました。では診断をお願いします。\n質問：初期不良と確認された場合、店員はまず何をすると言いましたか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('同じ機種と交換する', true, 1),
  ('全額返金する', false, 2),
  ('修理して後日返却する', false, 3),
  ('別のモデルに変更する', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 410: 家庭 — 引っ越し業者への依頼 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：来月の20日に引っ越しをしたいのですが、見積もりをお願いできますか。\n業者：はい、現在お住まいの住所と引っ越し先を教えていただけますか。\n客：今は練馬区で、引っ越し先は横浜市です。荷物は1LDKの量です。\n業者：平日と土日どちらがご希望ですか。20日は金曜日ですね。\n客：できれば午前中に来てもらいたいです。\n業者：金曜日の午前中ですと、3万8千円になります。翌日の土曜日でしたら料金が上がりまして4万5千円となります。\n客：金曜日の午前中でお願いします。\n質問：客が選んだ日程と料金はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('土曜日午前・4万5千円', false, 1),
  ('金曜日午後・3万8千円', false, 2),
  ('土曜日午後・4万5千円', false, 3),
  ('金曜日午前・3万8千円', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 411: 職場 — 社内システムの操作説明 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先輩：新しい経費申請システムの使い方を説明しますね。まずイントラネットにログインして、「経費申請」メニューを選びます。\n新人：はい。\n先輩：次に申請種別を選んで、金額と用途を入力します。領収書は画像で添付してください。\n新人：紙の領収書はどうすればいいですか。\n先輩：スキャンするかスマートフォンで撮影して添付してください。申請後は上長に承認依頼の通知が自動で飛びます。\n新人：上長が承認したら精算されますか。\n先輩：はい、承認から3営業日以内に指定口座へ振り込まれます。\n質問：申請が承認された後、何営業日以内に振り込まれますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('1営業日以内', false, 1),
  ('3営業日以内', true, 2),
  ('5営業日以内', false, 3),
  ('翌月末まで', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 412: 友人 — 健康診断の結果相談 (dialogue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n男：健康診断の結果が届いたんだけど、血圧が少し高いって書いてあって。\n女：それは心配だね。何か言われた？\n男：生活習慣の改善が必要で、特に塩分を控えるように言われた。それと運動不足も指摘されて。\n女：運動、最近してないもんね。ジムでも行く？\n男：ジムは続きそうにないから、毎朝20分歩くことにした。食事も気をつけないといけないし。\n女：減塩の料理レシピ、いくつか知ってるから送るよ。\n男：助かる、ありがとう。\n質問：男性が健康のために決めたことは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ジムに週3回通う', false, 1),
  ('病院で精密検査を受ける', false, 2),
  ('毎朝20分歩いて塩分を控える', true, 3),
  ('女性に食事を作ってもらう', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 413: 職場 — 新オフィスへの移転案内 (dialogue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n総務：来月1日にオフィスが新宿から渋谷に移転します。移転先は渋谷駅から徒歩3分のビルの8階です。\n社員：引っ越し作業はいつですか。\n総務：移転前日の31日の午後から夜にかけて行います。翌日1日は午前中にシステム設定があるため、午後1時から業務開始となります。\n社員：住所変更の手続きは自分でやりますか。\n総務：名刺や取引先への通知は総務部が一括で行います。社員個人での手続きは不要です。\n社員：わかりました。当日は1時に出社でいいですか。\n総務：はい、1階ロビーで受付をしてからエレベーターで8階へお越しください。\n質問：移転日の業務は何時から始まりますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('午後1時から', true, 1),
  ('午前9時から通常どおり', false, 2),
  ('午前10時から', false, 3),
  ('翌日からは休業', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 414: 学校 — 保護者と担任の面談 (dialogue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n担任：お子さまは最近、算数が少し苦手になってきているようです。\n保護者：そうなんですか。家でも宿題を嫌がることが増えていて。\n担任：授業では図形の単元が続いていまして、具体的なものを使って理解させると効果的です。\n保護者：家でどんな練習をすればいいですか。\n担任：紙に図を描いたり、積み木を使ったりして、楽しみながら学ぶといいと思います。強制するより自然に取り組める環境を作ってあげてください。\n保護者：わかりました。試してみます。\n担任：来月また様子を見てご連絡しますね。\n質問：担任の先生が保護者にアドバイスしたことはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('毎日1時間以上算数を勉強させること', false, 1),
  ('塾に通わせること', false, 2),
  ('算数のドリルを毎日させること', false, 3),
  ('図や積み木を使って楽しく学べる環境を作ること', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 415: 友人 — イベントの準備 (dialogue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女A：来週の同窓会、準備できてる？\n女B：会場の予約は取れたけど、料理はまだ決めてない。\n女A：私が料理担当やるよ。あと、プロジェクターは借りられる？\n女B：体育館のを借りられるか先生に確認してみる。写真スライドは誰が作る？\n女A：田中くんが写真を持ってるから、スライド作成もお願いできないかな。\n女B：連絡してみるね。費用の徴収は当日でいい？\n女A：そうしよう。一人3千円で足りるかな。\n女B：料理の内容によるけど、集まりそう。確定したら連絡します。\n質問：女Aが担当することになったのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('会場の予約とプロジェクターの手配', false, 1),
  ('料理の担当', true, 2),
  ('写真スライドの作成', false, 3),
  ('費用の徴収と会計管理', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 416: ラジオ — 食品の安全に関するニュース (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n消費者庁は今月、食品表示の新しいルールを発表しました。このルールによると、来年4月から、加工食品に含まれるアレルギー物質の表示方法が変わります。従来は「特定原材料に準ずるもの」として任意表示だったアーモンドとカシューナッツが、義務表示の対象に追加されます。また、アレルギーに関する注意書きは、原材料名の近くに記載することが求められます。食品メーカーはラベルの印刷が変わるため、在庫管理と切り替えのタイミングに注意が必要です。消費者団体は、この改正がアレルギーのある人々の安全につながると評価しています。\n質問：今回のルール変更で義務表示に追加されるのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('アーモンドとカシューナッツ', true, 1),
  ('ピーナッツと大豆', false, 2),
  ('乳と卵', false, 3),
  ('小麦とそば', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 417: 職場 — 新入社員研修の講義 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nビジネスメールを書くときに大切なことをいくつかお伝えします。まず件名は用件が一目でわかるように具体的に書きましょう。「ご連絡」だけでは不十分です。次に本文の冒頭には必ず挨拶と自分の所属・氏名を書きます。本文は用件→詳細→依頼事項の順にまとめると読みやすくなります。メールを送る前に、宛先・CC・添付ファイルを必ず確認してください。特に添付ファイルの付け忘れは非常に多いミスです。また、上司や取引先への敬語表現も正確に使うことが重要です。「了解しました」ではなく「承知しました」または「かしこまりました」を使うようにしてください。\n質問：ビジネスメールで特に多いミスとして挙げられているのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('件名を書き忘れること', false, 1),
  ('宛先を間違えること', false, 2),
  ('添付ファイルの付け忘れ', true, 3),
  ('敬語の使い方の誤り', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 418: 地域 — 公民館のサークル活動案内 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nみどり公民館からお知らせです。10月より新しい文化サークルの参加者を募集しています。今回の新設サークルは「水彩画入門」と「スマートフォン活用講座」の2つです。水彩画入門は毎月第2・第4土曜日の午前10時から12時に行います。スマートフォン活用講座は毎週火曜日の午後2時から4時です。参加費はどちらも月額1500円で、材料費は別途必要な場合があります。申し込みは公民館の窓口または電話で受け付けています。定員は各20名で、定員になり次第締め切ります。10月1日から受付を開始しますので、お早めにお申し込みください。\n質問：スマートフォン活用講座について正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('月2回、土曜日に開催される', false, 1),
  ('参加費は無料', false, 2),
  ('定員は30名', false, 3),
  ('毎週火曜日の午後に開催される', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 419: 講演 — 日本のスタートアップ事情 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n近年、日本のスタートアップ業界は大きく変わっています。政府は2022年を「スタートアップ創出元年」と位置づけ、5年間で10兆円規模の投資を目指す方針を打ち出しました。以前は大企業への就職が当たり前だった若者の間でも、起業への関心が高まっています。特にIT分野では、AIやフィンテック、ヘルスケアを中心に多くの新興企業が生まれています。一方で、日本のスタートアップが海外と比べて課題とされているのは、グローバル市場への展開の遅さです。日本語市場だけでは成長に限界があり、早期から英語での発信とグローバル人材の採用が求められています。\n質問：日本のスタートアップの課題として挙げられているのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('政府からの資金援助が少ないこと', false, 1),
  ('グローバル市場への展開が遅いこと', true, 2),
  ('IT分野の人材が不足していること', false, 3),
  ('大企業との競争が激しいこと', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 420: 店内放送 — フードコートの閉店案内 (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nお客様にお知らせいたします。本日4階フードコートは設備点検のため、午後7時をもって閉店いたします。通常より2時間早い閉店となります。レストラン街の各店舗は通常どおり午後9時まで営業しております。なお、フードコートは明日より通常営業に戻ります。また、本日ポイントカード会員の方はフードコートでのお会計が10パーセント割引となっております。ポイントカードをお持ちでない方は、1階サービスカウンターで本日より入会できます。ご不便をおかけして申し訳ございません。どうぞよろしくお願いいたします。\n質問：本日のフードコートの閉店時間はいつですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('午後7時', true, 1),
  ('午後8時', false, 2),
  ('午後9時', false, 3),
  ('通常どおり午後10時', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 421: セミナー — SNSマーケティング講座 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n今日はSNSマーケティングの基本についてお話しします。まず大切なのは、誰に情報を届けたいかを明確にすること、つまりターゲット設定です。ターゲットによって使うSNSのプラットフォームも変わります。10代から20代にはInstagramやTikTokが効果的ですし、ビジネス層にはLinkedInやX（旧Twitter）が有効です。次に重要なのは投稿の頻度と一貫性です。毎日投稿しなくても、週3回など決まったペースを守ることが信頼につながります。また、数字やデータを使った投稿は保存率が高く、拡散されやすい傾向があります。最後に、コメントやメッセージには必ず返信し、フォロワーとの関係を大切にしてください。これがファン獲得の近道です。\n質問：ビジネス層へのアプローチに効果的と紹介されたSNSはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('InstagramとTikTok', false, 1),
  ('YouTubeとFacebook', false, 2),
  ('TikTokとLinkedIn', false, 3),
  ('LinkedInとX（旧Twitter）', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 422: 職場 — ハラスメント防止研修 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n本日のハラスメント防止研修では、パワーハラスメントの定義についてお話しします。パワーハラスメントとは、職場において優越的な関係を背景に、業務の適正な範囲を超えて、精神的・身体的苦痛を与えたり、就業環境を害したりする行為のことです。具体的には、暴言を浴びせること、無視や仲間外れにすること、過大または過少な業務の割り当てなどが該当します。注意すべき点は、本人が傷ついたと感じなくてもハラスメントに該当する場合があることです。また、善意であっても相手が嫌と感じれば問題になりえます。もしハラスメントを受けたり目撃したりした場合は、一人で抱え込まず、社内の相談窓口または人事部へ報告してください。\n質問：ハラスメントの説明として正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('上司が部下を叱ることはすべてパワハラになる', false, 1),
  ('被害者が傷ついたと感じた場合だけがハラスメントになる', false, 2),
  ('善意であっても相手が嫌と感じれば問題になりえる', true, 3),
  ('ハラスメントを受けたら自分一人で解決すべきだ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 423: ニュース — 地方自治体の移住支援策 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n少子高齢化と人口減少に悩む地方自治体が、移住者の受け入れに積極的な姿勢を見せています。長野県のある村では、移住者に対して最大100万円の移住補助金を支給するほか、空き家の無料提供や農地のあっせんも行っています。また、子育て世帯向けには保育料の無料化と、小学校入学から高校卒業まで医療費を全額補助する制度があります。この自治体では移住者が5年間で200人を超え、廃校が再開されるなど活性化の兆しが見え始めています。移住を希望する都市部の人々にとって、こうした手厚い支援は大きな魅力となっています。地方移住は単なる生活の変化ではなく、地域社会の再生につながるとも評価されています。\n質問：この村の移住支援策に含まれないのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('最大100万円の移住補助金', false, 1),
  ('移住者全員への就職斡旋サービス', true, 2),
  ('空き家の無料提供', false, 3),
  ('子育て世帯への医療費補助', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 424: 店内放送 — 書店のイベント告知 (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n本日は青山書店にお越しいただきありがとうございます。来週土曜日、7月5日に作家の中島由紀子さんをお招きしてサイン会を開催いたします。対象は中島さんの新刊「夏の終わりに」をご購入いただいたお客様です。参加ご希望の方は本日から3階レジにて整理券を配布しております。整理券は1冊のご購入につき1枚とさせていただきます。当日は午後2時から4時の間、2階イベントスペースで行います。なお、整理券は先着50名様分のみとなっております。サイン会の様子はSNSでも発信予定ですので、青山書店の公式アカウントをご確認ください。ご参加をお待ちしております。\n質問：サイン会に参加するために必要なことはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('新刊を購入して3階レジで整理券をもらう', true, 1),
  ('事前にオンラインで申し込む', false, 2),
  ('書店の会員カードを提示する', false, 3),
  ('2階で直接並んで待つ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 425: 講義 — AIと著作権の問題 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n今日は生成AIと著作権の問題について説明します。生成AIが文章や画像を作るとき、大量のデータを学習に使います。このデータの多くはインターネット上のコンテンツですが、著作権者の許可なく学習に使うことが問題になっています。日本では2019年の著作権法改正により、著作権者の許可がなくてもAI学習目的であればデータを利用できると定められています。ただし、生成されたコンテンツが元の著作物と酷似している場合は著作権侵害になる可能性があります。現在、各国でAIに関する法整備が進んでいますが、国によって考え方が異なります。AIを使う私たちも、生成されたコンテンツの権利関係には注意が必要です。\n質問：日本の著作権法でAI学習目的のデータ利用について何と定められていますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('著作権者の許可が必ず必要', false, 1),
  ('商業目的に限り許可不要', false, 2),
  ('一切データ利用は禁止', false, 3),
  ('著作権者の許可なくてもAI学習目的なら利用可能', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 426: 公共施設 — 市民プールの利用案内 (monologue)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nさくら市民プールの利用案内をお伝えします。当プールの営業時間は平日が午前9時から午後9時まで、土日祝日は午前8時から午後8時までです。入場料は大人600円、中学生以下は300円で、3歳未満は無料です。月曜日は定期清掃のため休館となります。水泳帽の着用は全レーンで必須です。水着に関しては、競泳水着またはラッシュガードを着用してください。海水浴用の水着はご利用いただけません。また、貸しロッカーは100円で利用可能ですが、退場時に返却されます。飲み物はウォーターサーバーをご利用ください。プールサイドへの飲食物の持ち込みはできません。\n質問：プールのルールとして正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('3歳未満は半額で入場できる', false, 1),
  ('水泳帽の着用はすべてのレーンで必須', true, 2),
  ('海水浴用の水着でも利用できる', false, 3),
  ('飲み物はプールサイドで自由に飲める', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 427: 企業説明会 — IT企業の仕事紹介 (monologue)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n本日は弊社のエンジニア職についてご説明します。弊社では大きく分けて、フロントエンドエンジニア、バックエンドエンジニア、インフラエンジニアの3種類の職種があります。フロントエンドはユーザーが直接触れる画面を作る仕事で、HTML・CSS・JavaScriptが主なスキルです。バックエンドはサーバー側の処理やデータベースを担当し、PythonやJavaなどが使われます。インフラはシステムが安定して動くための基盤を整える仕事で、クラウドやネットワークの知識が必要です。弊社では入社後に半年間の研修があり、その後本人の希望と適性を見て配属先を決めます。文系出身の社員も多く、入社前の専門知識よりも論理的思考力とコミュニケーション能力を重視しています。\n質問：この企業が採用で重視しているのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('プログラミング言語の資格', false, 1),
  ('IT専門学校または大学の卒業', false, 2),
  ('論理的思考力とコミュニケーション能力', true, 3),
  ('英語のビジネスレベルの能力', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 428: 公共放送 — 節電の呼びかけ (monologue)
-- 正答: 0
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n皆さまにお願いがあります。今夏は猛暑の影響で電力の需給が非常に逼迫しています。特に午後4時から午後8時の間が電力消費のピーク帯となっております。この時間帯に可能であれば以下の節電にご協力ください。エアコンの設定温度を28度に上げること、使用していない部屋の照明を消すこと、テレビやパソコンを使わないときは電源を切ることなどが効果的です。また、洗濯機や食洗機などの大型家電は、できるだけピーク帯を避けた時間にご使用ください。節電は皆さまの協力で大きな効果が生まれます。地域全体での取り組みへのご理解とご協力をお願いいたします。\n質問：電力消費のピーク帯として正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('午後4時から午後8時', true, 1),
  ('午前9時から正午', false, 2),
  ('午後1時から午後4時', false, 3),
  ('午後8時から深夜0時', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 429: 健康情報 — 睡眠と生産性の関係 (monologue)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n今日は睡眠と仕事の生産性の関係についてお話しします。研究によると、成人は7時間から8時間の睡眠を取ることが最も生産性が高くなるとされています。6時間以下の睡眠が続くと、集中力・判断力・創造性が低下し、同じ作業をするのに通常の1.5倍の時間がかかるという報告もあります。また、慢性的な睡眠不足は免疫力の低下にもつながり、病欠が増える原因となります。良質な睡眠のためには、就寝1時間前にスマートフォンの使用を控えること、毎日同じ時間に起きること、カフェインを午後3時以降に摂取しないことが効果的です。睡眠の質を上げることが、実は仕事のパフォーマンスを最大化する最短の近道です。\n質問：良質な睡眠のためのアドバイスとして挙げられていないのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('就寝1時間前にスマートフォンを控える', false, 1),
  ('毎日同じ時間に起きる', false, 2),
  ('午後3時以降はカフェインを摂取しない', false, 3),
  ('就寝前に軽い運動をする', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- 430: 交通 — バスの運行変更アナウンス (announcement)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nご乗車中のお客さまにお知らせいたします。本日、市役所前の道路工事のため、15番系統の「みどり駅」から「市役所前」の区間において、一部ルートを変更して運行しております。「市役所前」バス停は本日運休となります。「市役所前」をご利用のお客さまは、手前の「中央公園前」または一つ先の「商工会議所前」でご乗降ください。なお、この運行変更は今週の金曜日まで続く予定です。土曜日からは通常ルートに戻ります。ご不便をおかけして大変申し訳ございません。お急ぎのところ恐れ入りますが、ご理解とご協力をお願いいたします。\n質問：「市役所前」バス停を利用したい場合どうすればよいですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('バスの運行が完全に中止されたので別の交通機関を使う', false, 1),
  ('土曜日まで待って通常ルートのバスに乗る', false, 2),
  ('手前の「中央公園前」か次の「商工会議所前」を利用する', true, 3),
  ('臨時シャトルバスに乗り換える', false, 4)
) AS t(txt, ok, so);
