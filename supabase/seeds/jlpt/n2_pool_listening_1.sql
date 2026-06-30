-- encoding: UTF-8
-- JLPT N2 聴解 問題プール 第1弾 — 30問 オリジナル作文
-- 作成日: 2026-06-26
-- quiz_id: bb000002-0000-0000-0000-000000000003 (N2 聴解テスト拡充)
-- 問題タイプ: 課題理解(12問) / ポイント理解(10問) / 発話表現(8問)
-- 正答位置分布: 1→8問, 2→8問, 3→7問, 4→7問

-- ============================================================
-- Q01: 職場 — 出張報告 (課題理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n男：田中さん、先週の大阪出張はどうでしたか。\n女：おかげさまでうまくいきました。先方の営業部長と直接お話しできて、来月から取引を始めることになりました。\n男：それはよかった。契約書の準備はもう始めましたか。\n女：はい、法務部に確認してもらっているところです。今週中には送れると思います。\n男：わかりました。送る前に私にも一度見せてください。\n女：もちろんです。確認でき次第、メールします。\n質問：女の人はこの後まず何をしますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('大阪へ出張する', false, 1),
  ('法務部の確認を待って契約書を男の人に送る', true, 2),
  ('営業部長に電話する', false, 3),
  ('来月の取引の準備をする', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q02: 飲食店 — 注文と変更 (課題理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n店員：ご注文はお決まりですか。\n客：えーと、ランチセットのBにします。スープは何がありますか。\n店員：本日はミネストローネとコーンポタージュがございます。\n客：じゃあコーンポタージュで。あ、すみません、パンをライスに変えることはできますか。\n店員：はい、ライスに変更できます。ドリンクは食後でよろしいでしょうか。\n客：はい、お願いします。あ、それとサラダのドレッシングは和風にしてください。\n店員：かしこまりました。ランチセットBにライス、コーンポタージュ、和風ドレッシングでよろしいですか。\n客：はい、そうです。\n質問：客が注文したセットの内容として正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ランチセットB、パン、ミネストローネ、フレンチドレッシング', false, 1),
  ('ランチセットA、ライス、コーンポタージュ、和風ドレッシング', false, 2),
  ('ランチセットB、ライス、コーンポタージュ、和風ドレッシング', true, 3),
  ('ランチセットB、ライス、ミネストローネ、和風ドレッシング', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q03: 大学 — ゼミ発表の準備 (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女：田村くん、来週のゼミ発表の準備、どこまで進んだ？\n男：スライドはほぼできたんですが、参考文献のリストをまだ整理していなくて。\n女：それは今週中に先生に提出しないといけないよね。\n男：そうなんです。あとデータの最終確認も残ってます。\n女：データは私も手伝えるよ。文献リストを先に出してから一緒にやろう。\n男：ありがとう。じゃあ今日中に文献リストをまとめます。\n質問：男の人は今日中に何をしますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スライドを完成させる', false, 1),
  ('データの最終確認をする', false, 2),
  ('先生に発表内容を報告する', false, 3),
  ('参考文献のリストをまとめる', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q04: 銀行 — 口座開設 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：口座を開設したいんですが、何が必要ですか。\n行員：本人確認書類と、お届けの印鑑、それから初回入金として千円以上をご用意ください。\n客：運転免許証でいいですか。\n行員：はい、免許証で大丈夫です。ただ、住所変更がある場合は住民票も必要になります。\n客：最近引っ越したので住民票が必要かもしれません。今日は持っていないのですが。\n行員：その場合は住民票を取得してから再度お越しください。免許証と印鑑と入金分はそのまま有効です。\n客：わかりました。では住民票を持ってまた来ます。\n質問：客はこの後まず何をしなければなりませんか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('住民票を取得する', true, 1),
  ('新しい印鑑を作る', false, 2),
  ('運転免許証を更新する', false, 3),
  ('口座に千円を入金する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q05: 職場 — プロジェクト進捗 (ポイント理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n部長：新システムの開発はどうなっていますか。\n担当：テスト工程まで完了して、現在は最終的なセキュリティ検査を行っているところです。\n部長：予定より早いですね。本番リリースは当初の来月末で変わりませんか。\n担当：はい。ただ、先週のテストで軽微なバグが二点見つかりまして、修正に三日ほどかかる見込みです。\n部長：スケジュールへの影響は？\n担当：バッファがあるので、リリース日は変更せずに済む予定です。\n質問：現在プロジェクトのどの段階ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('設計工程', false, 1),
  ('セキュリティ検査の段階', true, 2),
  ('バグ修正の完了後', false, 3),
  ('本番リリース済み', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q06: 家庭 — 家電の故障 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女：ねえ、洗濯機がまた変な音を立てているんだけど。\n男：どんな音？\n女：脱水のときだけ、ガタガタって大きい音がするの。先月も同じことがあって、そのときは洗濯物の量を減らしたら直ったけど、今日は量を減らしても同じなの。\n男：それは一度メーカーに修理を頼んだ方がいいかもしれないな。保証書はどこにある？\n女：押し入れの中だと思う。探しておく。あなたはメーカーに電話してくれる？\n男：わかった、今日の午後にかけてみるよ。\n質問：男の人がこの後することは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('メーカーに電話する', true, 1),
  ('保証書を探す', false, 2),
  ('洗濯物の量を減らす', false, 3),
  ('新しい洗濯機を買いに行く', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q07: 交通 — 電車の遅延案内 (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次のアナウンスを聴いて、質問に答えてください。\nご乗車の皆様にお知らせします。東西線は、渋谷駅付近での線路点検の影響により、現在ダイヤが乱れております。現在地の新宿駅から渋谷方面への運転を一時見合わせており、復旧の見込みは午後2時ごろを予定しております。お急ぎのお客様は、振替輸送として都営新宿線または山手線をご利用ください。なお、振替乗車票は改札付近でお配りしております。ご迷惑をおかけして誠に申し訳ございません。\n質問：現在、東西線の運転見合わせ区間はどこですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('渋谷駅から東側の全線', false, 1),
  ('新宿駅から東側の全線', false, 2),
  ('新宿駅から渋谷方面', true, 3),
  ('山手線全線', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q08: 職場 — 研修参加の確認 (発話表現)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n上司：来月の新人研修、君にも参加してもらいたいんだけど、スケジュール的にどう？\n部下：来月ですか……実は17日から19日に取引先への訪問が入っているんですが、研修はいつですか。\n上司：研修は15日と16日だから、重ならないね。\n部下：（　　　）\n質問：（　　　）に入る最も適切な部下の言葉はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('それでは、研修は欠席させていただきます。', false, 1),
  ('では、喜んで参加させていただきます。', true, 2),
  ('その日程では出席が難しい状況でして。', false, 3),
  ('訪問を17日から変更したほうがよさそうですね。', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q09: 買い物 — 返品対応 (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：先日こちらで買ったジャケットなんですが、袖の縫い目がほつれてしまって。\n店員：それは大変失礼いたしました。購入日はいつごろでしょうか。\n客：先週の土曜日です。レシートも持ってきています。\n店員：ありがとうございます。同じ商品との交換か、全額返金のどちらかをお選びいただけます。在庫を確認いたしますね。\n客：交換希望なんですが、もし在庫がなければ返金でお願いします。\n店員：かしこまりました。少々お待ちください。\n質問：客の希望はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('返金だけを希望している', false, 1),
  ('別の商品と交換したい', false, 2),
  ('修理して返してほしい', false, 3),
  ('まず同じ商品と交換し、なければ返金を希望する', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q10: 独白 — 旅行計画 (ポイント理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n女：今年の夏休みは北海道へ行こうと思っています。去年は沖縄に行ったんですが、今年は涼しいところへ行きたくて。友人に聞いたら、小樽と富良野がとても良かったと言っていました。特に富良野のラベンダー畑は7月が見ごろだと教えてもらったので、休みに合わせて7月後半を予定しています。宿はまだ予約していないので、週末中に調べてみます。\n質問：女の人が富良野へ行く理由は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ラベンダー畑が見たいから', true, 1),
  ('去年も富良野へ行ったから', false, 2),
  ('海と自然を楽しみたいから', false, 3),
  ('小樽と合わせて観光できるから', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q11: 職場 — 顧客クレーム対応 (発話表現)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n顧客：先月注文した商品がまだ届いていないんですが、どうなっているんですか。もう三週間もたっているのに。\n担当：（　　　）\n質問：（　　　）に入る最も適切な担当者の言葉はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('そうですか。では注文を取り消しましょうか。', false, 1),
  ('三週間かかるのは通常どおりです。', false, 2),
  ('大変申し訳ございません。ただいま配送状況を確認いたしますので、少々お待ちいただけますでしょうか。', true, 3),
  ('お客様のご都合が悪かったのかもしれません。', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q12: 独白 — 健康講座 (ポイント理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n講師：現代人の多くは睡眠不足に悩んでいますが、睡眠の質を上げるためにいくつかのポイントをお伝えします。まず、就寝の一時間前からスマートフォンやパソコンの使用を控えてください。画面のブルーライトが睡眠ホルモンの分泌を妨げます。次に、寝室の温度は18度から20度程度が最適です。また、カフェインは就寝6時間前から取らないようにしましょう。これらを実践するだけで、多くの方が睡眠の質の改善を実感されます。\n質問：講師が最初に挙げた睡眠改善のポイントは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('寝室の温度を20度以下にすること', false, 1),
  ('就寝一時間前にスマートフォンの使用をやめること', true, 2),
  ('カフェインを摂取しないこと', false, 3),
  ('毎日同じ時間に起きること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q13: 職場 — 会議の議題変更 (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女：明日の会議の議題なんですが、予算の件に加えて、人員配置の問題も話し合いたいと思うんですけど、時間的に大丈夫でしょうか。\n男：予算だけで1時間は見ていましたが、人員配置となると全体で2時間は必要ですね。\n女：参加者への通知はどうしましょう。\n男：変更があるので、今日中にメールで全員に知らせた方がいいと思います。私が送りましょうか。\n女：ありがとうございます。では議題リストは私が更新して添付します。\n男：それでお願いします。\n質問：男の人がこの後することは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('会議室の予約時間を2時間に変更する', false, 1),
  ('人員配置の資料を用意する', false, 2),
  ('議題リストを更新する', false, 3),
  ('参加者に変更をメールで知らせる', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q14: 病院 — 医師の説明 (ポイント理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n医師：検査結果が出ました。コレステロール値が基準値を少し超えていますが、今すぐ薬が必要なほどではありません。\n患者：それは安心しました。何か気をつけることはありますか。\n医師：まずは食事の改善が大切です。脂肪分の多い食事を減らして、野菜と魚を多く取るようにしてください。それから、週に3回以上、30分程度のウォーキングを習慣にするといいですよ。\n患者：わかりました。次の検査はいつですか。\n医師：3か月後にもう一度数値を確認しましょう。\n質問：医師が患者に最初に勧めたことは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('食事の改善', true, 1),
  ('週3回のウォーキング', false, 2),
  ('薬を飲み始めること', false, 3),
  ('3か月後に再検査を受けること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q15: アナウンス — 図書館の休館案内 (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次のアナウンスを聴いて、質問に答えてください。\n市立中央図書館からお知らせします。当館は館内システムの入れ替え工事のため、来週月曜日から水曜日の3日間、臨時休館いたします。木曜日からは通常通り開館いたします。なお、休館期間中は本の返却のみ、図書館入口の返却ポストをご利用ください。予約の本のお受け取りは木曜日以降となります。ご不便をおかけして大変申し訳ございません。\n質問：休館期間中、図書館で何ができますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('本を借りることができる', false, 1),
  ('予約した本を受け取ることができる', false, 2),
  ('返却ポストで本を返すことができる', true, 3),
  ('図書館内で本を読むことができる', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q16: 職場 — 後輩への指示 (発話表現)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先輩：この報告書、数字が一部古いデータのままになっているから、最新のものに差し替えてほしいんだけど。\n後輩：（　　　）\n質問：（　　　）に入る最も自然な後輩の返答はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('そのままでよいのではないでしょうか。', false, 1),
  ('はい、承知しました。いつまでにお直しすればよいでしょうか。', true, 2),
  ('私は関係ないと思いますが。', false, 3),
  ('最新のデータはどこにありますか、私には探せません。', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q17: 家庭 — 子どもの習い事 (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n母：健太、ピアノ教室に通いたいって言ってたけど、スイミングとどっちがいい？\n健太：どっちもやりたいけど、両方は無理なの？\n母：お父さんと相談したけど、今は一つだけにしようって。月謝のこともあるし。\n健太：う～ん……ピアノは幼稚園のときからやってみたかったから、やっぱりピアノにする。スイミングは学校のプールで練習できるし。\n母：わかった。じゃあ来月から近所のピアノ教室に入ってみましょうか。\n質問：健太がピアノを選んだ理由は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スイミングより月謝が安いから', false, 1),
  ('お父さんに勧められたから', false, 2),
  ('学校でピアノを習えないから', false, 3),
  ('幼稚園の頃からやりたかったから', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q18: 職場 — 資料の修正依頼 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n上司：山本さん、このプレゼン資料ですが、第3スライドのグラフの色が見づらいですね。カラーではなくモノクロで印刷されることが多いので、パターンで区別できるように変更してもらえますか。\n山本：わかりました。ほかに修正点はありますか。\n上司：スライドの内容はこれでいいですが、フォントが全体的に小さいかもしれません。最低でも16ポイントにしてください。\n山本：了解です。今日中に修正してお送りします。\n質問：山本さんが修正する内容はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('第3スライドのグラフをパターン表示に変更し、フォントを大きくする', true, 1),
  ('全スライドのグラフをカラー表示に変更する', false, 2),
  ('スライドの枚数を減らして内容を整理する', false, 3),
  ('フォントの色と種類を統一する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q19: 独白 — 引っ越しの感想 (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n男：先月、郊外に引っ越しました。都心のマンションに10年住んでいたんですが、家賃が高くて広さが物足りなかったので思い切って引っ越したんです。今の家は庭もあって、子どもが外で遊べるのが一番の魅力です。通勤は電車で40分と少し長くなりましたが、それ以外は大満足です。近所にスーパーもあって生活も便利ですし、空気もきれいでとても気に入っています。\n質問：男の人が引っ越した主な理由は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('通勤時間を短くしたかったから', false, 1),
  ('近所にスーパーが欲しかったから', false, 2),
  ('家賃が高く部屋が狭かったから', true, 3),
  ('子どもの学校に近い場所に住みたかったから', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q20: 職場 — 電話対応 (発話表現)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n取引先：鈴木部長はいらっしゃいますか。\n受付担当：（　　　）\n質問：（　　　）に入る最も適切な言葉はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('鈴木部長はただいま外出中です。', false, 1),
  ('鈴木はただいま外出しております。よろしければご伝言を承りますが。', true, 2),
  ('鈴木さんは出かけています。後でかけ直してください。', false, 3),
  ('鈴木部長は今、忙しいと思います。', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q21: イベント — 説明会の案内 (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次のアナウンスを聴いて、質問に答えてください。\n本日はITエンジニア向けキャリア説明会にお越しいただきありがとうございます。説明会は午後1時から5時まで行います。第一部では各企業の採用担当者による会社説明、第二部では個別相談ブースでの面談、そして最後に質疑応答セッションを設けています。個別面談を希望される方は受付で整理券をお受け取りください。なお、本日の説明会の内容は録画させていただき、後日オンラインで公開する予定です。\n質問：個別相談ブースを利用したい参加者はまず何をしなければなりませんか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('第一部の会社説明を聴く', false, 1),
  ('オンラインで事前登録する', false, 2),
  ('採用担当者にメールを送る', false, 3),
  ('受付で整理券を受け取る', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q22: 友人同士 — 旅行の計画 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女A：来月の旅行、宿を調べてみたんだけど、温泉旅館とビジネスホテル、どっちがいいかな。\n女B：予算はどのくらい違うの？\n女A：温泉旅館は一泊二食付きで1万5千円、ビジネスホテルは朝食だけで5千円くらい。\n女B：3人で行くから、旅館だと合計9万円か。少し高いけど、せっかくだから温泉がいいな。\n女A：じゃあ旅館で予約する？空きを確認してみるね。\n女B：うん。ただ、予約前に美咲ちゃんにも確認した方がいいよね。\n女A：そうだね。今日中に連絡してみる。\n質問：女Aはこの後まず何をしますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('美咲に旅行の予定を確認する', true, 1),
  ('温泉旅館の空き状況を調べる', false, 2),
  ('旅館を予約する', false, 3),
  ('ビジネスホテルの料金を比較する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q23: 職場 — 業務引き継ぎ (課題理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先輩：来週から私が産休に入るので、担当しているお客様の引き継ぎをお願いします。\n後輩：はい。どのようなお客様を担当されているんですか。\n先輩：主要顧客は5社です。それぞれの担当者名と最近のやり取りをまとめたファイルを共有しますので、まず目を通しておいてください。\n後輩：わかりました。何か特に注意が必要なお客様はいますか。\n先輩：中村商事さんは来月に大きな発注を予定しているので、必ず週に一度はご連絡を入れてください。今週中に一緒にご挨拶の電話をするつもりですが、その前に資料をしっかり確認しておいてください。\n質問：後輩はこの後まず何をしますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('中村商事に挨拶の電話をする', false, 1),
  ('新しい顧客を5社探す', false, 2),
  ('先輩から共有されたファイルを確認する', true, 3),
  ('産休の書類を提出する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q24: 独白 — 新製品の紹介 (ポイント理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n男：弊社では今月、新型コードレス掃除機「スイフトクリーン」を発売しました。この製品の最大の特徴は、業界最軽量の1.2キログラムという軽さです。また、一回の充電で最長60分使用できます。従来モデルは40分でしたので、1.5倍の使用時間を実現しました。フィルターは水洗い可能で、お手入れも簡単です。価格は税込み2万8千円で、今月末まで購入者全員に専用スタンドをプレゼントしています。\n質問：新型掃除機の最大の特徴として紹介されているのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('充電一回で60分使えること', false, 1),
  ('業界最軽量の1.2キログラムであること', true, 2),
  ('フィルターが水洗い可能なこと', false, 3),
  ('専用スタンドが付属していること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q25: 店 — 商品の相談 (発話表現)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n客：すみません、60代の父へのプレゼントを探しているんですが、何かおすすめはありますか。予算は5千円くらいで。\n店員：（　　　）\n質問：（　　　）に入る最も適切な店員の言葉はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('5千円では良い商品はありません。', false, 1),
  ('何でもいいのではないでしょうか。', false, 2),
  ('プレゼントは自分で選ぶものですよ。', false, 3),
  ('お父様のご趣味や好みはございますか？それに合わせてご提案できます。', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q26: 職場 — 採用面接の準備 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n人事A：来週の採用面接の準備を進めましょう。今回は応募者が8名です。\n人事B：面接官は誰が担当しますか。\n人事A：一次面接は私と山田さんで。二次は部長にお願いしています。面接室の予約はもう取れていますか。\n人事B：まだです。第3会議室を二日間予約しようと思っていたのですが、今週中でよかったですか。\n人事A：できれば今日中にお願いします。あと、応募書類を各面接官に事前に配布してください。\n人事B：わかりました。では書類をコピーして配布した後、会議室の予約をします。\n質問：人事Bがこの後最初にすることは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('応募書類をコピーして各面接官に配布する', true, 1),
  ('第3会議室を予約する', false, 2),
  ('面接官のスケジュールを確認する', false, 3),
  ('応募者に面接日程を連絡する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q27: 独白 — 環境問題についての意見 (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n女：最近、レジ袋の有料化やプラスチックストローの廃止など、プラスチック削減に向けた動きが広がっています。私はこうした取り組みを評価していますが、一方で消費者への負担だけを増やすのではなく、企業側が代替素材の開発にもっと投資すべきだと思います。個人の意識改革も大切ですが、社会全体の仕組みを変えなければ根本的な解決にはならないと考えています。\n質問：女の人の意見として正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('レジ袋の有料化は効果がないので廃止すべきだ', false, 1),
  ('個人の意識改革だけで環境問題は解決できる', false, 2),
  ('企業が代替素材の開発に投資し、社会の仕組みを変えることが必要だ', true, 3),
  ('プラスチック製品はすべて今すぐ禁止すべきだ', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q28: 職場 — 残業の依頼 (発話表現)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n上司：西村さん、今日、定時後に少し残ってもらえますか。明日の朝一番のプレゼン資料を仕上げたいんですが、手伝ってもらえると助かります。\n西村：（　　　）\n質問：（　　　）に入る最も自然な返答はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('プレゼン資料は私が全部作りましょうか。', false, 1),
  ('はい、もちろんです。何時まで必要ですか。', true, 2),
  ('残業は苦手なので、早く帰りたいのですが。', false, 3),
  ('明日の朝早く来ればよいのではないですか。', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q29: 学校 — 進路指導 (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先生：中田さん、就職希望先は絞れてきましたか。\n中田：はい、IT系と金融系で迷っているんですが、先生はどう思いますか。\n先生：あなたのプログラミングスキルを活かすなら、IT系が有利です。ただ、金融系の志望動機はしっかりありますか。\n中田：正直、金融は待遇が良さそうというだけで、具体的な理由がないんです。\n先生：では、まずIT系に絞って企業研究を深めましょう。それから、来週のOB訪問の申し込み、締め切りが明後日なので忘れずに。\n中田：わかりました。今日中に申し込みます。\n質問：中田さんは今日中に何をしますか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('金融系の企業研究を行う', false, 1),
  ('先生にIT系企業のリストをもらう', false, 2),
  ('IT系の志望動機を書く', false, 3),
  ('OB訪問の申し込みをする', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q30: 独白 — 読書の習慣について (ポイント理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n男：私は毎朝30分の読書を習慣にして、もう3年になります。最初は続けることが難しかったのですが、ある工夫をしてから習慣化できました。それは、読む本を前の晩に枕元に置いておくことです。朝目が覚めてすぐ手に取れるようにしたら、スマートフォンを見る前に自然に読書をするようになりました。この3年でビジネス書を中心に200冊以上読み、仕事の考え方にも変化が生まれました。皆さんにもぜひ試してほしい習慣です。\n質問：男の人が読書を習慣化するためにした工夫は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('前の晩に枕元に本を置いておく', true, 1),
  ('毎晩寝る前に30分読書する', false, 2),
  ('スマートフォンのアラームで読書の時間を知らせる', false, 3),
  ('読む本のリストを毎週作る', false, 4)
) AS t(txt,ok,so);
