BEGIN;
DELETE FROM jlpt_mock_set_questions WHERE set_id='aa000001-0000-0000-0000-000000000011' AND section='choukai';
-- JLPT N1 モック セット1 聴解 問題1 課題理解（5問）
-- quiz_id : bb000001-0000-0000-0000-000000000003
-- set_id  : aa000001-0000-0000-0000-000000000011

-- ── 問1 ──────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
$Q$会社で、男の人が女の人と話しています。

男：来週の取締役会なんですが、プレゼン資料の最終確認がまだ終わっていなくて。
女：えっ、明日の午前中には提出しないといけないんじゃなかったっけ？
男：そうなんですよ。その前に会議室の予約も取らなければならないと思って。
女：会議室は田中さんがもう手配してくれていますよ。それより、山田部長から資料の修正依頼が来ているって聞きましたけど、確認しましたか？
男：えっ、そうなんですか？それは知らなかった。じゃあ、まずそれを確認してから資料を修正しないといけませんね。
女：ええ。修正が終わったら、私にも内容を共有してもらえますか？
男：わかりました。

質問：男の人はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$会議室の予約を取る$Q$,                    false, 1),
    ($Q$田中さんに会議室の確認をする$Q$,           false, 2),
    ($Q$山田部長からの修正依頼を確認する$Q$,       true,  3),
    ($Q$女の人にプレゼン資料を共有する$Q$,         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 1, '課題理解' FROM q;

-- ── 問2 ──────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
$Q$会社で、女の人が上司の男の人と話しています。

男：来月の新商品発表会、準備はどこまで進んでいる？
女：会場の手配と招待状の発送は完了しました。あとはプレス向けの資料を作るだけかと思っていたんですが。
男：プレス向けの資料は広報部が担当するから、君はやらなくていい。それより、デモ用のサンプルはもう発注した？
女：あっ、それはまだで…。すぐに手配します。
男：発注したら、在庫管理システムへの登録も忘れないでね。
女：はい。それと、会場のレイアウト図も必要でしたよね？
男：それは来週でいいよ。まずサンプルの発注を優先して。
女：わかりました。

質問：女の人はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$プレス向けの資料を作成する$Q$,             false, 1),
    ($Q$デモ用のサンプルを発注する$Q$,             true,  2),
    ($Q$在庫管理システムに登録する$Q$,             false, 3),
    ($Q$会場のレイアウト図を作成する$Q$,           false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 1, '課題理解' FROM q;

-- ── 問3 ──────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
$Q$大学で、学生が指導教授と話しています。

教授：来月の学会発表、準備はどう？
学生：データの分析はほぼ終わりました。ただ、考察の部分がまだ書けていなくて。
教授：分析が終わったなら、まず先行研究との比較表を作りなさい。考察を書く前にそれが必要だから。
学生：はい。あと、発表用のスライドはいつまでに仕上げればいいでしょうか？
教授：スライドは比較表ができてから。ところで、要旨の提出期限が明後日だよ。確認した？
学生：えっ、明後日ですか？存じませんでした。
教授：事務局からメールが来ているはずだ。まず要旨を仕上げてから比較表に取りかかりなさい。
学生：わかりました、すぐに確認します。

質問：学生はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$データの分析を完成させる$Q$,               false, 1),
    ($Q$先行研究との比較表を作成する$Q$,           false, 2),
    ($Q$学会発表の要旨を仕上げる$Q$,               true,  3),
    ($Q$発表用のスライドを作成する$Q$,             false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 1, '課題理解' FROM q;

-- ── 問4 ──────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
$Q$会社で、男の人が女の先輩社員と話しています。

女：明日の田中商事への訪問、準備はできてる？
男：提案書は完成しました。あとはサンプル品を持参するだけかと思っていたんですが。
女：あ、田中商事って事前に持ち込み物品のリストを提出しないといけない会社なのよ。知ってた？
男：えっ、初めて聞きました。
女：セキュリティポリシーで、前日までにメールで送っておかないといけないの。締め切りは今日の終業時間までよ。
男：それは大変だ。部長に提案書を確認してもらう約束があるんですが、そちらは後でいいですかね？
女：うん、リストを先に送って。提案書の確認はその後で大丈夫よ。
男：わかりました。すぐに作成します。

質問：男の人はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$提案書の内容を完成させる$Q$,               false, 1),
    ($Q$サンプル品を準備する$Q$,                   false, 2),
    ($Q$部長に提案書の確認をしてもらう$Q$,         false, 3),
    ($Q$持ち込み物品のリストをメールで送付する$Q$, true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 1, '課題理解' FROM q;

-- ── 問5 ──────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
$Q$会社で、女の人が上司の男の人と話しています。

男：社内研修の企画書、今週中に人事部に提出しないといけないんだが、進んでる？
女：はい、大まかな内容はまとめました。ただ、外部講師の候補リストがまだ揃っていなくて。
男：外部講師については、人事部からすでに推薦リストが届いているよ。それを参照すればいい。
女：そうなんですね。費用の見積もりも先に取った方がいいでしょうか？
男：見積もりは企画書が承認されてからでいい。まず企画書の内容を固めて、今日中に私のところへ持ってきてくれ。明日提出する。
女：承知しました。会場の候補もいくつか盛り込んだ方がいいですか？
男：それも入れておいて。でもまず企画書全体を仕上げることを優先してくれ。
女：わかりました。

質問：女の人はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$外部講師の候補リストを作成する$Q$,         false, 1),
    ($Q$研修費用の見積もりを取得する$Q$,           false, 2),
    ($Q$研修会場の候補をリストアップする$Q$,       false, 3),
    ($Q$企画書を完成させて上司に提出する$Q$,       true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 1, '課題理解' FROM q;
-- JLPT N1 모의고사 세트1 청해 問題2 ポイント理解 (6문항)
-- quiz_id : bb000001-0000-0000-0000-000000000003
-- set_id  : aa000001-0000-0000-0000-000000000011
-- section : choukai / daimon : 2 / subtype : ポイント理解

-- ─────────────────────────────────────────────
-- 1番　会社のプレゼン資料　(正解 2)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$会社で男性社員と女性の同僚が話しています。

男：田中さん、例のプレゼン資料なんだけど、もう少し時間をもらえないかな。
女：え、明日の朝までじゃないですか？
男：実は昨日クライアントから急に新しいデータが送られてきて、それを反映させないといけなくなったんだ。
女：それは大変でしたね。でも鈴木部長はかなり厳しいですよ。
男：わかってる。でも古いデータで出して後から指摘されるより、正確な数字で出したほうがいいと思って。

質問：男性はなぜ資料の提出期限を延ばしてほしいと言っているのか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$鈴木部長から内容の変更指示が入ったから$Q$,                                    'false', 1),
    ($Q$クライアントから新しいデータが届き、資料に反映する必要があるから$Q$,          'true',  2),
    ($Q$プレゼンの準備に想定以上の時間がかかっているから$Q$,                          'false', 3),
    ($Q$資料の内容に誤りを見つけたから$Q$,                                            'false', 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;

-- ─────────────────────────────────────────────
-- 2番　学術論文の投稿　(正解 3)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$大学の研究室で、指導教員と大学院生が話しています。

教授：佐々木さん、先日の学会発表の件なんですが、今回は査読付きジャーナルへの投稿は見合わせることにしました。
学生：えっ、なぜですか？発表は好評だったと思っていたんですが。
教授：発表自体はよかったよ。ただ、審査委員から「サンプル数が不十分だ」という指摘があってね。統計的有意性を出すためには、今の30人では足りないんだ。
学生：確かに、被験者を増やすのが難しくて……。
教授：50人以上のデータが揃ってから改めて投稿しましょう。それだけの価値は十分ある研究だから。

質問：教授はなぜ今回のジャーナルへの投稿を見合わせることにしたのか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$学会での発表評価が期待以下だったから$Q$,                                      'false', 1),
    ($Q$投稿の締め切りに間に合わなかったから$Q$,                                      'false', 2),
    ($Q$サンプル数が不足しており、統計的有意性が確保できないから$Q$,                  'true',  3),
    ($Q$研究の手法に根本的な問題が見つかったから$Q$,                                  'false', 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;

-- ─────────────────────────────────────────────
-- 3番　大阪支社への異動　(正解 1)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$会社の人事部長と女性社員が話しています。

部長：山本さん、来月から大阪支社に異動していただく件なんですが、いかがでしょうか。
女：あの、実は今の時期は難しい状況で……。昨年から母が入院しておりまして、週に2、3回は病院に付き添う必要があるんです。東京を離れるのは、今すぐは難しくて。
部長：そういう事情があったんですね。それは把握できていませんでした。
女：ご迷惑をおかけして申し訳ありません。
部長：いいえ、そういうことなら時期を半年ほどずらして再検討しましょう。

質問：女性社員はなぜ今すぐの異動が難しいと言っているのか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$入院中の母親の病院に定期的に付き添う必要があるから$Q$,                        'true',  1),
    ($Q$現在担当しているプロジェクトが重要な局面を迎えているから$Q$,                  'false', 2),
    ($Q$大阪支社での業務内容に不安を感じているから$Q$,                                'false', 3),
    ($Q$家族全員が東京に在住しており、引っ越しが困難だから$Q$,                        'false', 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;

-- ─────────────────────────────────────────────
-- 4番　テレワーク制度の変更　(正解 2)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$会社でマネージャーの女性と男性社員が話しています。

男：課長、来月からテレワークのルールが変わると聞いたんですが。
女：ええ、週3日以上の出社が必須になります。
男：生産性は落ちていないと思うんですが、なぜ変更になるんですか？
女：そこなんですけど、特に若手社員の育成が問題になっているんです。先輩が何気なく教えたり、隣で仕事ぶりを見せたりする機会が激減していて、若手の成長が遅れているという報告が上がってきていて。
男：なるほど。確かに画面越しだと伝わりにくいことってありますよね。

質問：テレワーク制度が変更されることになった主な理由は何か。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$社員全体の業務生産性が低下しているから$Q$,                                    'false', 1),
    ($Q$若手社員が成長するための育成機会が減っているから$Q$,                          'true',  2),
    ($Q$オフィスの維持費削減のために出社率を上げる必要があるから$Q$,                  'false', 3),
    ($Q$情報漏洩などセキュリティ上のリスクが増大しているから$Q$,                      'false', 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;

-- ─────────────────────────────────────────────
-- 5番　処方薬の変更　(正解 3)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$病院で医師と患者が話しています。

医師：鈴木さん、今回の血液検査の結果が出ました。症状のほうはいかがですか？
患者：おかげさまで、だいぶ楽になりました。
医師：そうですか。ただ、今のお薬を続けるのは少し難しい状況になっています。肝臓の数値が基準値を大幅に超えていて、この薬の副作用として肝機能に影響が出ているんです。このまま続けると肝臓へのダメージが蓄積するリスクがあります。
患者：えっ、でも症状は改善しているのに……。
医師：ええ、効き目はあるんですが、リスクのほうが上回ってしまっています。別の薬に切り替えて経過を見ましょう。

質問：医師はなぜ今の薬を変更しようとしているのか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$患者の症状が十分に改善されていないから$Q$,                                    'false', 1),
    ($Q$より効果が高い新薬が開発されたから$Q$,                                        'false', 2),
    ($Q$現在の薬が肝機能に悪影響を及ぼしているから$Q$,                                'true',  3),
    ($Q$患者が薬の副作用を強く訴えているから$Q$,                                      'false', 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;

-- ─────────────────────────────────────────────
-- 6番　就職面接の不合格　(正解 4)
-- ─────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$友人同士の女性と男性が話しています。女性は就職活動をしています。

女：また一次面接で不合格だった。もう何社目よ。
男：どんな感じだったの？
女：志望動機とか、自己PRとか。自分では上手く答えられたと思ったんだけど。
男：フィードバックはあった？
女：うん。「回答に具体性が欠けていた」って言われた。確かに振り返ってみると、数字とか具体的な成果をほとんど出さずに、ふわっとした説明ばかりしていたかも。
男：それが原因じゃないかな。自己PRって、実績を数字で示してこそ説得力が出るから。

質問：女性が面接で落ちた原因として考えられているのは何か。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c::boolean, n FROM q,
  (VALUES
    ($Q$志望動機の内容が企業の求める人物像と合っていなかったから$Q$,                  'false', 1),
    ($Q$面接中に緊張して言葉に詰まることが多かったから$Q$,                            'false', 2),
    ($Q$業界や企業に関する知識が不足していたから$Q$,                                  'false', 3),
    ($Q$具体的なエピソードや実績の数値を示せなかったから$Q$,                          'true',  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 2, 'ポイント理解' FROM q;
-- JLPT N1 モック セット1 聴解 問題3 概要理解 5問

-- Q3-1 AIと人間の創造性
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
    $Q$近年、人工知能の発展により、絵画や音楽といった創造的な分野でもAIが人間の作品に匹敵するとまで言われるようになりました。しかし、私は創造性の本質は経験や感情から生まれるものだと考えています。AIがデータを学習して生成する作品は、あくまで模倣にすぎず、人間の内面から湧き出る表現とは根本的に異なると思います。技術の進歩を否定するつもりはありませんが、人間にしかできない創造の価値を見失わないようにすべきです。

質問：話し手が最も言いたいことは何か。$Q$,
    1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$AIは人間のあらゆる創造的な仕事を近い将来代替する$Q$, false, 1),
      ($Q$人間の創造性はAIには模倣できない固有の価値を持つ$Q$, true, 2),
      ($Q$AIを活用することで芸術の質をさらに高めることができる$Q$, false, 3),
      ($Q$人工知能の急速な発展には法的規制が不可欠だ$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 3, '概要理解' FROM q;

-- Q3-2 長時間労働と生産性
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
    $Q$日本では長時間労働が美徳とされる文化が根強く残っていますが、これは本当に生産性向上につながっているのでしょうか。研究によれば、過度な残業は創造性の低下や健康被害を引き起こし、長期的には企業にとってもマイナスになるとされています。社員が心身ともに充実した状態で働けてこそ、真の意味での生産性が生まれます。働き方改革は掛け声だけでなく、企業文化そのものを変える覚悟が求められます。

質問：話し手が最も言いたいことは何か。$Q$,
    1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$残業代の削減が企業のコスト改善につながる$Q$, false, 1),
      ($Q$社員の健康管理は個人の自己責任だ$Q$, false, 2),
      ($Q$長時間労働の文化を変えることが真の生産性向上につながる$Q$, true, 3),
      ($Q$働き方改革の推進には政府による法規制の強化が先決だ$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 3, '概要理解' FROM q;

-- Q3-3 環境問題の責任の所在
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
    $Q$環境問題というと、個人のゴミ分別やエコバッグの利用など消費者の行動変容が強調されがちです。しかし実際には、企業や産業が排出する温室効果ガスが全体の大半を占めています。個人の取り組みも大切ですが、根本的な変化をもたらすには、企業の生産方式や政府の規制政策の転換こそが不可欠です。環境問題の責任を個人に押し付けることで、本来変わるべき構造が見えにくくなるという問題があります。

質問：このラジオ番組で話し手が最も主張していることは何か。$Q$,
    1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$個人のエコ活動こそが環境問題解決の核心だ$Q$, false, 1),
      ($Q$環境問題の根本解決には企業・政府レベルの構造的変革が必要だ$Q$, true, 2),
      ($Q$温室効果ガス削減には国際条約による拘束力が必要だ$Q$, false, 3),
      ($Q$ゴミの分別だけでは地球温暖化を止めることはできない$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 3, '概要理解' FROM q;

-- Q3-4 教育改革と思考力
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
    $Q$現代の学校教育では、正解のある問題を効率よく解く能力が重視されすぎています。しかし、予測不可能な未来を生き抜くためには、自ら問いを立て、多角的に思考する力こそが不可欠です。知識を詰め込むことよりも、学び方を学ぶことの方が、長期的にははるかに重要な教育の目標となるはずです。入試制度も含めた教育システム全体の抜本的な見直しが急務だと考えます。

質問：話し手が最も言いたいことは何か。$Q$,
    1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$入試の難易度を下げて子どもたちの負担を軽減すべきだ$Q$, false, 1),
      ($Q$知識の習得よりも自ら考える力を育てる教育への転換が必要だ$Q$, true, 2),
      ($Q$プログラミング教育を小学校から必修化すべきだ$Q$, false, 3),
      ($Q$学校での暗記学習を全廃し体験型教育に切り替えるべきだ$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 3, '概要理解' FROM q;

-- Q3-5 地方移住の意味
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice', 'listening',
    $Q$近年、都市から地方へ移住する若者が増えています。テレワークの普及により都市に住む必要性が薄れたことが一因ですが、それだけではありません。都会の利便性よりも、自然との共生や地域コミュニティとのつながりを求める価値観の変化も背景にあります。地方移住は単なる住む場所の変化ではなく、働き方・生き方そのものを問い直すライフスタイルの選択と言えるでしょう。

質問：話し手が最も言いたいことは何か。$Q$,
    1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$テレワークの普及が地方移住ブームの唯一の原因だ$Q$, false, 1),
      ($Q$地方の過疎化解消のために移住促進政策を強化すべきだ$Q$, false, 2),
      ($Q$地方移住は価値観の転換を伴うライフスタイルの選択だ$Q$, true, 3),
      ($Q$都市部の住居費高騰が若者を地方に向かわせている$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 3, '概要理解' FROM q;
-- JLPT N1 モック セット1  聴解 問題4 即時応答 (11問)
-- quiz_id : bb000001-0000-0000-0000-000000000003
-- set_id  : aa000001-0000-0000-0000-000000000011
-- 正答位置 : 2,1,3,4,3,1,4,2,1,2,3

-- 問1 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$この件、担当者に一言断りを入れておいたほうがよくないですか。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$断りを入れる必要はないでしょう。$Q$,             false, 1),
      ($Q$そうですね、後々問題になっても困りますから。$Q$, true,  2),
      ($Q$担当者はどなたでしょうか。$Q$,                   false, 3),
      ($Q$断るのは失礼ではないでしょうか。$Q$,             false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問2 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$先方の要求、正直かなり無茶苦茶ですよね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$ええ、ただ関係を壊さないよう、うまく折り合いをつけるしかないですね。$Q$, true,  1),
      ($Q$いいえ、至って普通の要求だと思いますが。$Q$,                           false, 2),
      ($Q$では、すべてお断りしましょう。$Q$,                                     false, 3),
      ($Q$そうですね、全部受け入れましょう。$Q$,                                 false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問3 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$田中部長、最近めっきり口数が減りましたね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$口数が多い方ではありませんでしたよね。$Q$,               false, 1),
      ($Q$きっとお忙しくて話す時間がないんでしょう。$Q$,           false, 2),
      ($Q$何かお悩みがあるのかもしれませんね、少し気になります。$Q$, true,  3),
      ($Q$もともとそういうお方なんですよ。$Q$,                     false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問4 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$この度はご足労いただきまして、誠にありがとうございます。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$こちらこそ、来ていただいて助かりました。$Q$,                 false, 1),
      ($Q$いいえ、足はそれほど疲れておりません。$Q$,                   false, 2),
      ($Q$遠方からいらっしゃる必要はありませんでした。$Q$,             false, 3),
      ($Q$いえ、とんでもございません。喜んでお伺いいたしました。$Q$,   true,  4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問5 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$例の案件、上からのプレッシャーがかなり強くて…

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$プレッシャーなんて気にしなくていいですよ。$Q$,             false, 1),
      ($Q$では、上の方に直談判されてはどうですか。$Q$,               false, 2),
      ($Q$それは大変ですね。無理のない範囲で進めていきましょう。$Q$, true,  3),
      ($Q$上からのプレッシャーがあるのは当然ですよ。$Q$,             false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問6 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$あの件、根回しはもう済んでいますか。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$ええ、関係者には一通りお話を通しておきました。$Q$, true,  1),
      ($Q$根回しは必要ないと思いますが。$Q$,               false, 2),
      ($Q$根回しについては、まだ理解が浅くて…$Q$,         false, 3),
      ($Q$いいえ、まだ時間はたっぷりありますので。$Q$,     false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問7 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$この件、内々に処理していただけると助かるんですが。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$内々に処理するのは規則に反しませんか。$Q$,             false, 1),
      ($Q$では、社内全体に周知しておきますね。$Q$,               false, 2),
      ($Q$処理方法をご教示いただけますか。$Q$,                   false, 3),
      ($Q$承知しました。表沙汰にならないよう配慮いたします。$Q$, true,  4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問8 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$あのお客様、かなりご立腹のご様子でしたが…

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$そうでしたか、私はまったく気づきませんでした。$Q$,         false, 1),
      ($Q$ええ、早急にお詫びの連絡を入れたほうがよさそうですね。$Q$, true,  2),
      ($Q$お客様はいつもそうなんですよ。$Q$,                         false, 3),
      ($Q$まあ、そのうちお気持ちも落ち着かれるでしょう。$Q$,         false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問9 ─────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$今回の件、少々手を焼いておりまして…

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$何かお力になれることがあれば、遠慮なくおっしゃってください。$Q$, true,  1),
      ($Q$手が痛いなら、お医者さんに診ていただいては？$Q$,             false, 2),
      ($Q$そんなに大変なことではないと思いますが。$Q$,                 false, 3),
      ($Q$焼いてしまったのはいけませんでしたね。$Q$,                   false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問10 ────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$ご意見をいただければ幸いです。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$ありがとうございます、よろしくお願いいたします。$Q$,   false, 1),
      ($Q$それでは、率直に申し上げてもよろしいでしょうか。$Q$,   true,  2),
      ($Q$意見を申し上げる立場にはございません。$Q$,             false, 3),
      ($Q$では、ご意見をまとめて後ほどご報告します。$Q$,         false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;

-- 問11 ────────────────────────────────────────────────────────────────────
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003',
    'multiple_choice', 'listening',
    $Q$あの人、口では何とでも言いますよね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$そうですね、いつも的確なご発言をされますよね。$Q$,                 false, 1),
      ($Q$本当に。あれだけはっきりおっしゃるから信頼できますね。$Q$,         false, 2),
      ($Q$ええ、言葉と行動が伴わないので、なかなか信用しにくいですよね。$Q$, true,  3),
      ($Q$そうですか、あの方はあまりお話にならない印象でしたが。$Q$,         false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 4, '即時応答' FROM q;
-- JLPT N1 モック セット1 — 聴解 問題5 統合理解 (3問)

-- 問題5-1: 新製品の発売時期を巡る社内会議
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$ある会社で、部長と二人の課長が新製品の発売時期について話し合っています。

部長：新製品の発売時期について決めたい。今期第四四半期か、来期第一四半期か。田中課長、現状を説明してほしい。

田中課長：開発はほぼ完了していますが、品質テストにあと2か月かかります。今期内の発売は品質リスクが高い。また、競合他社が来年2月に類似製品を出すという情報があります。

山田課長：マーケティングの観点からは、年末商戦に合わせた今期発売が売上に有利です。ただし、品質問題が発覚した場合のブランドへのダメージは計り知れません。競合より先行しても、品質で劣っては意味がない。

部長：顧客満足と長期的なブランド価値を最優先すべきだ。今期の売上目標は達成できそうか。

田中課長：既存製品の好調で、今期目標は達成見込みです。新製品については来期、品質を確保した上で投入できます。

部長：では、品質テストを徹底した上で、来期第一四半期の発売に決定する。それまでに競合との差別化ポイントを明確にすること。

質問：この会議で最終的に決定したことは何ですか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$競合他社に先行するため、今期第四四半期に発売する$Q$, false, 1),
    ($Q$品質テストを短縮し、年末商戦に間に合わせる$Q$, false, 2),
    ($Q$品質テストを十分に行った上で、来期第一四半期に発売する$Q$, true,  3),
    ($Q$競合他社の製品を確認してから、発売時期を改めて検討する$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 5, '統合理解' FROM q;


-- 問題5-2: 研究費申請をめぐる教授・院生の相談
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$大学の研究室で、教授と二人の院生が科研費の申請戦略について話し合っています。

教授：今年度の科研費申請について決めたい。「基盤研究B」と「挑戦的研究」、どちらにするか。

鈴木（院生）：基盤研究Bは業績数が重視されます。うちのラボは設立3年目で論文数がまだ少ないので、不利かもしれません。一方、挑戦的研究はテーマの独創性が評価軸です。我々のアプローチは他にない切り口なので、挑戦的研究のほうが勝算があると思います。

山本（院生）：挑戦的研究の申請書は審査が厳しく、準備に相当な時間がかかります。来月末に学会発表もあるので、スケジュール的にかなり厳しい。

教授：締め切りを確認しよう。挑戦的研究は来月15日、学会は来月末だから、申請が先になる。スケジュールは全員で分担すれば対応できる。

鈴木：テーマの独創性という強みを活かすなら、挑戦的研究一択だと思います。業績不足を業績重視の審査でカバーするのは難しい。

教授：そうだな。うちの強みを最大限に活かすべきだ。基盤研究Bへの応募は来年度に回す。今年は挑戦的研究に全力を注ごう。

質問：教授たちは最終的にどうすることにしましたか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$採択率の高い基盤研究Bに申請する$Q$, false, 1),
    ($Q$学会発表が終わってから申請内容を検討する$Q$, false, 2),
    ($Q$テーマの独創性を活かし、挑戦的研究に申請する$Q$, true,  3),
    ($Q$今年度は申請を見送り、来年度に業績を積んでから応募する$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 5, '統合理解' FROM q;


-- 問題5-3: 公園の駐車場化計画をめぐる住民集会
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000003',
    'multiple_choice',
    'listening',
    $Q$地域の住民集会で、司会者と二人の住民、そして市の担当者が公園の駐車場化計画について話し合っています。

司会：本日は、市から提案されている公園の駐車場転用計画についてご意見を伺います。

田中さん（住民A）：公園は子どもの遊び場であり、お年寄りの憩いの場でもあります。なくしてしまえば、地域コミュニティの絆まで失われる。私は断固反対です。

佐藤さん（住民B）：公園の大切さは私も十分わかっています。ただ、この地区の慢性的な駐車場不足は深刻で、近くのスーパーにも車を止められず、高齢の方が買い物に困っています。せめて公園の半分だけ駐車場にする妥協案はどうでしょうか。

市担当者：実は、公園の隣にある空き地を活用する別案もあります。費用は若干高くなりますが、公園を全て残した上で駐車場問題も解決できます。

田中さん：それなら大賛成です。費用については市と住民が協力して解決策を考えればいい。

佐藤さん：空き地案のほうがずっと理想的ですね。半分案は妥協に過ぎませんでしたが、空き地を使えば両方の問題が完全に解決します。

司会：では、隣の空き地を活用した駐車場建設案を市への正式提案とすることで、住民の総意とさせていただきます。

質問：住民集会の話し合いの結果、どのような結論になりましたか。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$公園を全て駐車場に転用する市の計画に賛成した$Q$, false, 1),
    ($Q$公園の半分を駐車場にする妥協案を採用することにした$Q$, false, 2),
    ($Q$隣の空き地を活用した駐車場建設案を市に正式提案することにした$Q$, true,  3),
    ($Q$費用負担の問題が解決するまで、結論を先送りにした$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'choukai', 5, '統合理解' FROM q;
UPDATE jlpt_mock_set_questions m SET sort_order = 70 + s.rn FROM (SELECT id, row_number() OVER (ORDER BY daimon, id) AS rn FROM jlpt_mock_set_questions WHERE set_id='aa000001-0000-0000-0000-000000000011' AND section='choukai') s WHERE m.id=s.id;
COMMIT;
