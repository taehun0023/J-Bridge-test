BEGIN;

-- JLPT N1 模擬試験 Set3 聴解 (choukai) 30問 差し替え
-- set_id  : aa000001-0000-0000-0000-000000000013
-- quiz_id : ad000001-0000-0000-0000-000000000133
-- 作成日  : 2026-06-29
-- 構成    : 問題1 課題理解 6問 / 問題2 ポイント理解 7問 / 問題3 概要理解 6問
--           問題4 即時応答 8問(3択) / 問題5 統合理解 3問(共通長文)

-- 既存 Set3 choukai 問題を削除（CASCADE で jlpt_mock_set_questions も削除される）
DELETE FROM quiz_questions
WHERE id IN (
  SELECT question_id FROM jlpt_mock_set_questions
  WHERE set_id='aa000001-0000-0000-0000-000000000013' AND section='choukai'
);

-- =====================================================================
-- 問題1 課題理解 (sort_order 1〜6)
-- =====================================================================

-- ===== 問題1 課題理解 1/6 : 会社 — 営業報告書の集計方式変更 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社で、男の人と女の先輩社員が話しています。

男：中村さん、さっき田中部長から例の営業報告書の件で、数値のまとめ方を変えてほしいと連絡が来たんですが。
女：どういう方向で変えるの？
男：地域別の集計を担当者別に変更してほしいとのことで、どうやって直せばいいか…
女：フォーマット自体は変えなくていいから、まずピボットテーブルの軸を入れ替えてみて。データは今のままで使えるわよ。
男：なるほど、やってみます。それと、来週の会議の日程調整メールも送らないといけないんですが。
女：それは修正が終わってからでいいわ。報告書の提出が今日の夕方までだから、そっちを先にやって。
男：わかりました。

質問：男の人はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$田中部長に電話で変更内容を確認する$Q$,               false, 1),
    ($Q$報告書の集計軸を担当者別に修正する$Q$,               true,  2),
    ($Q$来週の会議の日程調整メールを送る$Q$,                 false, 3),
    ($Q$ピボットテーブルの使い方を調べる$Q$,                 false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 1 FROM q;

-- ===== 問題1 課題理解 2/6 : 大学 — 卒業論文のテーマ絞り込み =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$大学のゼミ室で、指導教員の女性と男子学生が話しています。

教員：山田くん、先月提出した卒業論文の構成案なんだけど、問題設定が少し弱いと思うのよね。
学生：どういう点でしょうか？
教員：「現代の若者の消費行動」というテーマは広すぎるの。もっと対象を絞り込む必要があるわ。「スマートフォン購入行動」に限定するとか。
学生：なるほど、では先行研究をもう少し調べて問題を絞り込んでみます。
教員：それと、第三章の分析方法も変更が必要ね。アンケート調査だけじゃ深みが出ない。インタビュー調査も加えるように。
学生：両方やるんですね。まずどちらから始めたらいいでしょうか？
教員：まず問題設定を確定させてから、調査方法を決めなさい。順番を間違えないで。
学生：はい、わかりました。

質問：学生はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$アンケート調査の設問を作成する$Q$,                   false, 1),
    ($Q$先行研究を調べてテーマを絞り込む$Q$,                 true,  2),
    ($Q$インタビュー調査の対象者を探す$Q$,                   false, 3),
    ($Q$第三章の分析方法を書き直す$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 2 FROM q;

-- ===== 問題1 課題理解 3/6 : 市役所 — 地域防災訓練の広報担当 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$市役所で、女性の職員と男性の窓口担当者が話しています。

担当：高橋さん、来月の地域防災訓練なんですが、広報の担当が急遽変更になりまして。
女：では私が担当することになるんですか？
担当：はい。今週中に参加者への案内文を作成して、回覧板で配布してもらえますか。
女：案内文ですね。それより先に、会場の体育館の使用許可申請を出した方がいいでしょうか？
担当：体育館はすでに申請済みです。それから、地域の消防署への協力依頼も必要ですが、それは案内文を先に仕上げてからでいいです。
女：わかりました。では案内文から取りかかります。

質問：女性の職員はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$体育館の使用許可申請を提出する$Q$,                   false, 1),
    ($Q$消防署に協力依頼の連絡をする$Q$,                     false, 2),
    ($Q$参加者への案内文を作成する$Q$,                       true,  3),
    ($Q$回覧板の配布ルートを確認する$Q$,                     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 3 FROM q;

-- ===== 問題1 課題理解 4/6 : 旅行代理店 — ツアー日程変更の手順 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$旅行代理店で、男性スタッフと女性客が話しています。

客：先日予約した北海道のツアーなんですが、日程を変更できますか？
スタッフ：日程変更ですね。出発日の何日前かによってキャンセル料が変わりますので、まずそちらをご確認いただく必要があります。
客：出発は来月の15日です。
スタッフ：では変更手続きの前に、キャンセル料金の確認書類をお渡しします。ご確認後、変更希望日をお伝えください。
客：わかりました。その前に旅行保険についても相談したいんですが。
スタッフ：保険のご相談はいつでも承りますが、まずキャンセル料を確認していただいてから、変更手続きと合わせてお話しした方が効率的ですよ。
客：そうですね、では先に確認します。

質問：女性客はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$変更したい日程をスタッフに伝える$Q$,                 false, 1),
    ($Q$キャンセル料金の確認書類を確認する$Q$,               true,  2),
    ($Q$旅行保険について相談する$Q$,                         false, 3),
    ($Q$新しいツアーのパンフレットを受け取る$Q$,             false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 4 FROM q;

-- ===== 問題1 課題理解 5/6 : 会社 — 顧客管理システムへのデータ入力 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社で、女の上司と男の部下が話しています。

上司：鈴木くん、新しい取引先の鈴木商事のデータ、顧客管理システムにはもう入力した？
部下：まだなんです。名刺情報を整理しているところで。
上司：今週木曜日に先方の担当者が来社する予定があるから、その前までに絶対入力しておいてね。
部下：はい。それと、来週の提案資料の作成も進めないといけないんですが、そちらはいつまでですか？
上司：提案資料は木曜の来客後で大丈夫。まず顧客データの入力を終わらせて。
部下：わかりました。あと、社内向けの月次報告もありますよね。
上司：それは来週でいい。顧客データが先よ。
部下：承知しました。すぐに取りかかります。

質問：男の部下はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$名刺の整理を続ける$Q$,                               false, 1),
    ($Q$顧客管理システムに取引先データを入力する$Q$,         true,  2),
    ($Q$来週の提案資料の作成を始める$Q$,                     false, 3),
    ($Q$社内向けの月次報告をまとめる$Q$,                     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 5 FROM q;

-- ===== 問題1 課題理解 6/6 : 病院 — 検査順序の変更 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$病院で、看護師の女性と男性の医師が話しています。

看護師：田中先生、昨日入院された山本患者さんの本日の検査順番について確認させてください。
医師：ああ、山本さんね。まずCTを撮ってから血液検査をするように指示を出したはずだが。
看護師：そうお聞きしたんですが、放射線科から午後からしか空きがないと連絡がありまして。
医師：そうか。では血液検査を先に回して、CTは午後に変更しよう。あ、血液検査の前に患者さんが絶食中かどうかを確認してね。
看護師：わかりました。絶食の確認をしてから血液検査の手配をします。
医師：頼むね。それと、家族への説明は夕方にするから、その前に検査結果をまとめておいてくれるか。
看護師：はい、承知しました。

質問：看護師はこの後まず何をしなければなりませんか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$放射線科にCTの午後の予約を入れる$Q$,                 false, 1),
    ($Q$患者が絶食中かどうかを確認する$Q$,                   true,  2),
    ($Q$血液検査の手配を行う$Q$,                             false, 3),
    ($Q$患者の家族に検査内容を説明する$Q$,                   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 6 FROM q;

-- =====================================================================
-- 問題2 ポイント理解 (sort_order 7〜13)
-- =====================================================================

-- ===== 問題2 ポイント理解 1/7 : 会社 — 残業の理由 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社で男性社員と女性の上司が話しています。

女：木村くん、最近毎日残業しているよね。プロジェクトが忙しいの？
男：実は、担当している在庫管理システムの移行作業が思ったより複雑で、定時では終わらない状況が続いていて。
女：移行作業のどのあたりが問題なの？
男：既存データのフォーマットが新システムと互換性がなくて、手動で変換しないといけないデータが大量にあるんです。最初はもっと早く終わると思っていたんですが。
女：そういう事情か。前もって担当ベンダーに相談しておけばよかったかもしれないわね。

質問：男性が残業している主な理由は何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$チームの人手が足りず、一人で多くの仕事を抱えているから$Q$,               false, 1),
    ($Q$データの互換性問題で手動変換作業が大量に発生しているから$Q$,             true,  2),
    ($Q$新システムの操作方法を習得するのに時間がかかっているから$Q$,             false, 3),
    ($Q$ベンダーとの調整がうまくいかず、作業が止まっているから$Q$,               false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 7 FROM q;

-- ===== 問題2 ポイント理解 2/7 : カフェ — 転職の理由 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$カフェで友人同士の女性二人が話しています。

女A：佐藤さん、転職するって本当？今の会社、待遇も悪くないと思うけど。
女B：給料とか休暇は問題ないんだよね。ただ、今の仕事が毎日同じルーティンの繰り返しで、全然成長している実感が持てなくて。
女A：スキルアップの機会がないってこと？
女B：そう。上にも相談したんだけど、「今のポジションが大事だから」ってずっと言われ続けていてね。
女A：やりたいことが見えているなら、チャレンジしてみるのもありじゃない？
女B：うん。将来的にデータサイエンスの分野でやっていきたいんだけど、今の会社ではそのキャリアが積めないから。

質問：女性Bが転職を考えている理由は何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$給与や福利厚生に不満があるから$Q$,                                       false, 1),
    ($Q$現在の職場の人間関係が良くないから$Q$,                                   false, 2),
    ($Q$目指すキャリアに向けたスキルが現職では身につかないから$Q$,               true,  3),
    ($Q$残業が多く、プライベートの時間が確保できないから$Q$,                     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 8 FROM q;

-- ===== 問題2 ポイント理解 3/7 : 会社会議 — テレビCM見直しの理由 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社の会議室で、男性の部長と女性の課長が話しています。

部長：今季の新商品キャンペーン予算、大幅に削減になったけど、木村課長はどう対応する？
課長：正直なところ、当初計画の3分の1の予算では、テレビCMは難しいと思っています。
部長：じゃあ、どう進める？
課長：SNSと動画配信サービスの広告に集中して、ターゲット層に絞った施策に切り替えようと考えています。テレビより費用対効果が高い場合もありますし。
部長：なるほど、それはいいアイデアかもしれないな。ただ、高齢層へのリーチはどうする？
課長：そこは地域のイベント協賛という形でカバーしようと思っています。

質問：課長はなぜテレビCMを見直そうとしているのか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$テレビCMよりもSNS広告の方が常に効果的だから$Q$,                         false, 1),
    ($Q$削減された予算ではテレビCMの費用をまかなえないから$Q$,                   true,  2),
    ($Q$ターゲット層の若者はテレビをほとんど視聴しないから$Q$,                   false, 3),
    ($Q$テレビ局との契約がすでに終了しているから$Q$,                             false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 9 FROM q;

-- ===== 問題2 ポイント理解 4/7 : 住民説明会 — 住民の懸念 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$地域の住民説明会で、市の担当者が住民の男性と話しています。

担当者：今回、旧公民館の隣に新しい複合施設を建設する計画をご説明します。
住民：あの場所、今は駐車場ですよね。近所の住民が利用しているんですが、どうなりますか？
担当者：既存の駐車場は縮小されますが、新施設の地下に駐車スペースを設ける予定ですので、台数は変わりません。
住民：そうですか。それより、工事中の騒音と振動が心配なんです。朝7時から始めると聞きましたが。
担当者：ご迷惑をおかけして申し訳ありません。近隣住民の方からのご要望を踏まえて、工事開始時刻を8時半以降に変更することにしました。
住民：それは聞いていませんでした。それなら少し安心です。

質問：住民の男性が最も懸念していたことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$駐車場がなくなることで、周辺交通が混雑すること$Q$,                       false, 1),
    ($Q$新施設の建設により地域のコミュニティが失われること$Q$,                   false, 2),
    ($Q$工事による騒音や振動が日常生活に影響を与えること$Q$,                     true,  3),
    ($Q$工事中に子どもの通学路の安全が確保されないこと$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 10 FROM q;

-- ===== 問題2 ポイント理解 5/7 : 会社 — 研修を欠席した理由 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社で男性の新入社員と女性の先輩社員が話しています。

男：高橋さん、今週の研修に参加できなかったんですね。体調が悪かったんですか？
女：ううん、そうじゃないの。担当している重要なクライアントの対応と日程がまるかぶりで、上司に相談したら研修の方を欠席するように言われてしまって。
男：それは残念でしたね。内容は良かったですよ。
女：そうみたいね。テキストはもらったから自分で勉強するつもりだけど、グループワークの部分は難しいわね。
男：後でノートを見せましょうか？
女：ぜひお願い。

質問：女性先輩はなぜ研修を欠席したのか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$体調不良で会社を休んでいたから$Q$,                                       false, 1),
    ($Q$重要な顧客対応と日程が重なり、上司の指示で欠席したから$Q$,               true,  2),
    ($Q$研修の内容がすでに習得済みのレベルだったから$Q$,                         false, 3),
    ($Q$研修会場が遠く、移動が困難だったから$Q$,                                 false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 11 FROM q;

-- ===== 問題2 ポイント理解 6/7 : ラジオ — フードバンクの課題 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ラジオ番組で、女性キャスターと専門家の男性が話しています。

キャスター：最近、日本でもフードバンクが増えているそうですね。
専門家：ええ、食品ロスの削減と食糧支援を同時に実現できる仕組みとして注目されています。
キャスター：ただ、まだ課題もあるようですね。
専門家：最大の課題は、企業からの食品提供の不安定さです。「もし提供した食品で健康被害が出たら」という法的リスクを心配する企業が多く、提供を控えてしまうケースがあります。
キャスター：欧米ではそういった問題はないのでしょうか？
専門家：アメリカやフランスでは、善意で提供した食品については法的責任を問わないという法律があり、それが普及の大きな後押しになっています。日本でも同様の法整備が最も急がれる課題だと考えています。

質問：専門家が日本のフードバンクの最大の課題として挙げているのは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$食品ロスの量が少なく、集まる食品が十分でないこと$Q$,                     false, 1),
    ($Q$フードバンクを運営するボランティアが不足していること$Q$,                 false, 2),
    ($Q$食品提供に伴う法的リスクを恐れ、企業が参加しにくいこと$Q$,               true,  3),
    ($Q$利用者の間でフードバンクに対する偏見があること$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 12 FROM q;

-- ===== 問題2 ポイント理解 7/7 : 会社 — 展示会出展見送りの理由 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$会社で、女性の先輩社員と男性の後輩が話しています。

後輩：中村さん、今度の展示会への出展、見送りになったって本当ですか？
先輩：ええ、残念ながら。来月中旬の展示会だから、出展するなら今月末には準備を完了しないといけなかったんだけど。
後輩：間に合わなかったんですか？
先輩：新製品の完成が来月末まで延びることになってしまって。完成していないものを展示するわけにはいかないでしょ。
後輩：そうですよね。展示会の効果は大きかったのに残念ですね。
先輩：次回の展示会は来年の春だから、それに向けてしっかり準備しましょう。

質問：展示会への出展を見送った理由は何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$展示会への参加費用の予算が確保できなかったから$Q$,                       false, 1),
    ($Q$展示会の担当スタッフを確保できなかったから$Q$,                           false, 2),
    ($Q$新製品の完成が展示会の前に間に合わなくなったから$Q$,                     true,  3),
    ($Q$展示スペースの申し込み期限が過ぎていたから$Q$,                           false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 13 FROM q;

-- =====================================================================
-- 問題3 概要理解 (sort_order 14〜19)
-- =====================================================================

-- ===== 問題3 概要理解 1/6 : 睡眠と生産性 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ラジオで専門家が話しています。

現代社会では、睡眠を削ってでも働き、学ぶことが美徳とされる風潮があります。しかし、最新の神経科学の研究によれば、良質な睡眠はただの休息ではなく、記憶の定着や脳の老廃物除去に不可欠なプロセスです。睡眠不足が慢性化すると、集中力や判断力が大幅に低下し、長期的には認知症のリスクも高まります。「睡眠を犠牲にして生産性を上げる」という考え方は、科学的には完全に逆効果なのです。高パフォーマンスを維持したいなら、まず十分な睡眠を確保することが最も重要な投資と言えます。

質問：話し手が最も伝えたいことは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$睡眠薬を活用することで質の高い睡眠を得るべきだ$Q$,                       false, 1),
    ($Q$睡眠不足は認知症のリスクを高めるため、高齢者は特に注意が必要だ$Q$,       false, 2),
    ($Q$生産性を高めるためには、十分な睡眠を確保することが最重要の投資だ$Q$,     true,  3),
    ($Q$現代社会の長時間労働文化を法律で規制するべきだ$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 14 FROM q;

-- ===== 問題3 概要理解 2/6 : 地方医療の課題 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$医療シンポジウムで専門家が講演しています。

日本の地方では、医師不足が深刻な問題となっています。人口減少と高齢化が同時進行する地方において、医療需要は増加する一方で、医師は都市部に集中しています。これは単なる人材配置の問題ではなく、医学教育のあり方、都市と地方の生活環境の差、さらには医師の働き方そのものに関わる複合的な問題です。オンライン診療の活用は一定の補完策になりますが、それだけでは根本的な解決にはなりません。地方医療を維持するためには、行政・医療機関・地域コミュニティが一体となった持続可能な仕組みを構築する必要があります。

質問：この講演で話し手が最も主張していることは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$オンライン診療の普及を国が積極的に支援すべきだ$Q$,                       false, 1),
    ($Q$医師の都市集中を解消するために医学部の定員を増やすべきだ$Q$,             false, 2),
    ($Q$地方医療の維持には行政・医療・地域が連携した持続可能な仕組みが必要だ$Q$, true,  3),
    ($Q$地方に移住する医師に対して経済的インセンティブを与えるべきだ$Q$,         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 15 FROM q;

-- ===== 問題3 概要理解 3/6 : 少子化対策の限界 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$テレビのコメンテーターが話しています。

少子化対策として、政府はここ数年、児童手当の拡充や保育所の整備に積極的に取り組んでいます。しかし、出生率はほとんど改善していません。なぜでしょうか。問題の核心は、経済的支援や保育環境の整備だけでは、若者が子どもを産む決断をする「安心感」を生み出せていないことにあります。不安定な雇用形態、住宅費の高騰、将来の教育費への不安——こうした根本的な生活の不安が解消されない限り、いくら表面的な支援を積み上げても少子化の流れは止まらないでしょう。

質問：コメンテーターが最も言いたいことは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$児童手当の金額をさらに増額すれば少子化は解消できる$Q$,                   false, 1),
    ($Q$保育所の整備が不十分なため、子どもを持てない親が多い$Q$,                 false, 2),
    ($Q$少子化の根本原因は若者の生活不安にあり、表面的支援だけでは解決しない$Q$, true,  3),
    ($Q$少子化は自然な現象であり、政策での解決は困難だ$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 16 FROM q;

-- ===== 問題3 概要理解 4/6 : 食品ロス問題 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ラジオ番組で食品学の専門家が話しています。

日本では毎年、まだ食べられるにもかかわらず廃棄される食品が約600万トンにのぼると言われています。この食品ロスの問題は、環境負荷の観点からも、食糧安全保障の観点からも深刻です。しかし注目したいのは、食品ロスの大部分が家庭から生まれているという事実です。外食産業や小売業の廃棄量よりも、家庭での「作りすぎ」「買いすぎ」「消費期限への過剰な反応」によるロスの方がずっと多い。つまり、この問題を解決するためには、消費者一人ひとりの日常的な意識と行動の変化こそが最も重要なのです。

質問：話し手が最も主張していることは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$食品ロス問題の解決には食品業界の廃棄削減が最優先課題だ$Q$,               false, 1),
    ($Q$食品ロス削減のためには消費期限の表示方法を見直すべきだ$Q$,               false, 2),
    ($Q$食品ロスの主な原因は家庭にあり、消費者の意識・行動変容が最重要だ$Q$,     true,  3),
    ($Q$食品ロスを減らすためには輸入食品への依存を減らすべきだ$Q$,               false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 17 FROM q;

-- ===== 問題3 概要理解 5/6 : 多文化共生の本質 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$大学の授業で教授が話しています。

多文化共生という言葉が、今日では政策の場でも教育の場でも頻繁に使われるようになりました。しかし、掛け声だけが先行し、実態が伴っていない場合が多い。異なる文化的背景を持つ人々が「ただ同じ場所にいる」状態は、共生ではなく「共存」に過ぎません。真の共生とは、互いの違いを認め、時に対立しながらも対話を積み重ねていく継続的なプロセスです。違和感や摩擦を避けず、むしろそれを社会を豊かにする資源と捉える視点の転換が必要です。

質問：教授が最も言いたいことは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$多文化共生のためには、外国人住民向けの日本語教育を充実させるべきだ$Q$,   false, 1),
    ($Q$真の多文化共生は対話と摩擦を通じた継続的なプロセスを必要とする$Q$,       true,  2),
    ($Q$多文化共生政策は予算不足により実効性を欠いている$Q$,                     false, 3),
    ($Q$異文化間の対立を未然に防ぐことが共生社会の基盤となる$Q$,                 false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 18 FROM q;

-- ===== 問題3 概要理解 6/6 : 心理的安全性とチームパフォーマンス =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$企業研修で講師が話しています。

近年、「心理的安全性」という概念が企業組織の中で注目されています。心理的安全性とは、チームの中で発言したり、失敗を認めたりすることへの不安がない状態のことです。ある調査では、最も成果を上げたチームに共通していたのは、メンバーのスキルの高さでも経験の豊富さでもなく、この心理的安全性の高さでした。上司が部下の意見を否定せず、失敗を責めるよりも次に活かす文化を育てることで、チーム全体のパフォーマンスが飛躍的に向上します。管理職の皆さんには、まずご自身の言動を振り返っていただきたいと思います。

質問：講師が最も伝えたいことは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$チームの成果を高めるためにメンバーの専門スキルの向上が最も重要だ$Q$,     false, 1),
    ($Q$失敗を許容する文化は組織の規律を乱すリスクがある$Q$,                     false, 2),
    ($Q$心理的安全性を高める管理職の言動の見直しがチーム力向上の鍵だ$Q$,         true,  3),
    ($Q$組織の心理的安全性は外部の専門家による評価が不可欠だ$Q$,                 false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 19 FROM q;

-- =====================================================================
-- 問題4 即時応答 (sort_order 20〜27, 3択)
-- =====================================================================

-- ===== 問題4 即時応答 1/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$この度は遠いところをわざわざお越しいただきまして。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$いいえ、こちらこそご足労をおかけしました。$Q$,                           false, 1),
    ($Q$いえ、こちらこそよろしくお願いいたします。$Q$,                           true,  2),
    ($Q$ありがとうございます。では、また参ります。$Q$,                           false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 20 FROM q;

-- ===== 問題4 即時応答 2/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$あの件、もう少し様子を見た方がよくないですかね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$そうですね、焦って判断するより、もう少し情報を集めてからの方が確実ですね。$Q$, true,  1),
    ($Q$でも、様子を見ることにリスクはないと思いますよ。$Q$,                       false, 2),
    ($Q$様子を見るのは、今後の計画次第ではないでしょうか。$Q$,                     false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 21 FROM q;

-- ===== 問題4 即時応答 3/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$もうすぐ締め切りなのに、全然手がつけられていないんですよ。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$締め切りはいつまでなんですか。$Q$,                                         false, 1),
    ($Q$それは大変ですね。何かお手伝いできることはありますか。$Q$,                 true,  2),
    ($Q$それなら延長をお願いしてみてはどうですか。$Q$,                             false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 22 FROM q;

-- ===== 問題4 即時応答 4/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$先ほどの会議、少し言い過ぎてしまいましたかね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$いいえ、おっしゃっていた内容はごもっともだと思いますよ。$Q$,             true,  1),
    ($Q$会議の内容については、私は把握していません。$Q$,                         false, 2),
    ($Q$言い過ぎたなら、会議をもう一度開いた方がいいですね。$Q$,                 false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 23 FROM q;

-- ===== 問題4 即時応答 5/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$この企画、上司にどう切り出したらいいか悩んでいて…

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$企画の内容よりも、切り出し方の方が大事ですよね。$Q$,                     false, 1),
    ($Q$メリットと数字をまとめてから、タイミングを見て話してみてはどうですか。$Q$, true,  2),
    ($Q$上司には企画を見せない方がいいかもしれませんよ。$Q$,                     false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 24 FROM q;

-- ===== 問題4 即時応答 6/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$お先に失礼します。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$お疲れ様でした。$Q$,                                                     true,  1),
    ($Q$いいえ、こちらも失礼します。$Q$,                                         false, 2),
    ($Q$ゆっくりお帰りください。$Q$,                                             false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 25 FROM q;

-- ===== 問題4 即時応答 7/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ご無理を申し上げてしまい、大変恐縮です。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$いいえ、とんでもございません。お役に立てれば幸いです。$Q$,               true,  1),
    ($Q$ご無理はなさらないでください。$Q$,                                       false, 2),
    ($Q$恐縮なさる必要はまったくありません。$Q$,                                 false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 26 FROM q;

-- ===== 問題4 即時応答 8/8 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$あの新人、思ったより飲み込みが早いですね。

最も適切な応答を選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$ええ、教えがいがありますよね。これからが楽しみです。$Q$,                 true,  1),
    ($Q$そうですか、私はあまりよく見ていないので。$Q$,                           false, 2),
    ($Q$飲み込みが早い人は、すぐ辞めることが多いですよね。$Q$,                   false, 3)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 27 FROM q;

-- =====================================================================
-- 問題5 統合理解 (sort_order 28〜30)
-- 共通長文: 中堅製造業の海外展開戦略に関する役員会議
-- =====================================================================

-- ===== 問題5 統合理解 1/3 (sort_order 28) — 田中部長の主張 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ある中堅製造業の会社で、社長と営業部長の山本、技術部長の田中、経営企画部長の佐藤が次期の海外展開戦略について話し合っています。

社長：今日は来期以降の東南アジア展開について、各部門の意見を聞かせてほしい。田中部長、技術面からはどうだろうか。

田中（技術部長）：現状の製品は、東南アジアの気候条件に対応した改良が必要です。高温多湿の環境下での耐久テストをまだ実施していませんし、現地の電圧規格にも対応していません。最低でも1年半は開発期間が必要と見ています。

山本（営業部長）：技術面の課題は理解しますが、市場の機会という観点では今が絶好のタイミングです。競合他社がまだ東南アジアに本格参入していない今こそ、先行者利益を取りに行くべきです。多少の不完全さは現地でのフィードバックを受けながら改善していけばいい。

佐藤（経営企画部長）：資金面から申し上げますと、現在の財務状況では技術開発と市場開拓を同時に進める余力がありません。まず国内での収益基盤を固めてから、段階的に進出するのが現実的だと思います。

社長：なるほど。田中部長、改良開発を短縮できる可能性はあるか？

田中：外部の開発パートナーを活用すれば、1年程度に短縮できるかもしれません。ただ、コストは増加します。

山本：それならコストを考慮した上で、早期参入と段階的参入のシミュレーションを比較してみてはどうでしょう。

佐藤：それは賛成です。財務的なリスク分析を含めた比較資料を作れば、経営判断の材料になります。

社長：よし、では来月の役員会議までに、二つのシナリオの比較資料を佐藤部長が中心になって作成してもらおう。その上で方向性を決定する。

質問：田中部長が最も重要だと考えていることは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$競合他社に先行して東南アジア市場に参入すること$Q$,                       false, 1),
    ($Q$現地の環境・規格に対応した製品改良を十分に行うこと$Q$,                   true,  2),
    ($Q$国内の収益基盤を強化してから海外展開すること$Q$,                         false, 3),
    ($Q$外部パートナーを活用して開発コストを削減すること$Q$,                     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 28 FROM q;

-- ===== 問題5 統合理解 2/3 (sort_order 29) — 佐藤部長の懸念 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ある中堅製造業の会社で、社長と営業部長の山本、技術部長の田中、経営企画部長の佐藤が次期の海外展開戦略について話し合っています。

社長：今日は来期以降の東南アジア展開について、各部門の意見を聞かせてほしい。田中部長、技術面からはどうだろうか。

田中（技術部長）：現状の製品は、東南アジアの気候条件に対応した改良が必要です。高温多湿の環境下での耐久テストをまだ実施していませんし、現地の電圧規格にも対応していません。最低でも1年半は開発期間が必要と見ています。

山本（営業部長）：技術面の課題は理解しますが、市場の機会という観点では今が絶好のタイミングです。競合他社がまだ東南アジアに本格参入していない今こそ、先行者利益を取りに行くべきです。多少の不完全さは現地でのフィードバックを受けながら改善していけばいい。

佐藤（経営企画部長）：資金面から申し上げますと、現在の財務状況では技術開発と市場開拓を同時に進める余力がありません。まず国内での収益基盤を固めてから、段階的に進出するのが現実的だと思います。

社長：なるほど。田中部長、改良開発を短縮できる可能性はあるか？

田中：外部の開発パートナーを活用すれば、1年程度に短縮できるかもしれません。ただ、コストは増加します。

山本：それならコストを考慮した上で、早期参入と段階的参入のシミュレーションを比較してみてはどうでしょう。

佐藤：それは賛成です。財務的なリスク分析を含めた比較資料を作れば、経営判断の材料になります。

社長：よし、では来月の役員会議までに、二つのシナリオの比較資料を佐藤部長が中心になって作成してもらおう。その上で方向性を決定する。

質問：佐藤部長が懸念していることは何ですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$競合他社がすでに東南アジアに参入しており、市場が飽和していること$Q$,     false, 1),
    ($Q$技術開発と市場開拓を同時に進める財務的な余力がないこと$Q$,               true,  2),
    ($Q$外部の開発パートナーの技術力が不足していること$Q$,                       false, 3),
    ($Q$東南アジアの現地スタッフの採用が困難であること$Q$,                       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 29 FROM q;

-- ===== 問題5 統合理解 3/3 (sort_order 30) — 会議の結論 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000133', 'multiple_choice', 'listening',
    $Q$ある中堅製造業の会社で、社長と営業部長の山本、技術部長の田中、経営企画部長の佐藤が次期の海外展開戦略について話し合っています。

社長：今日は来期以降の東南アジア展開について、各部門の意見を聞かせてほしい。田中部長、技術面からはどうだろうか。

田中（技術部長）：現状の製品は、東南アジアの気候条件に対応した改良が必要です。高温多湿の環境下での耐久テストをまだ実施していませんし、現地の電圧規格にも対応していません。最低でも1年半は開発期間が必要と見ています。

山本（営業部長）：技術面の課題は理解しますが、市場の機会という観点では今が絶好のタイミングです。競合他社がまだ東南アジアに本格参入していない今こそ、先行者利益を取りに行くべきです。多少の不完全さは現地でのフィードバックを受けながら改善していけばいい。

佐藤（経営企画部長）：資金面から申し上げますと、現在の財務状況では技術開発と市場開拓を同時に進める余力がありません。まず国内での収益基盤を固めてから、段階的に進出するのが現実的だと思います。

社長：なるほど。田中部長、改良開発を短縮できる可能性はあるか？

田中：外部の開発パートナーを活用すれば、1年程度に短縮できるかもしれません。ただ、コストは増加します。

山本：それならコストを考慮した上で、早期参入と段階的参入のシミュレーションを比較してみてはどうでしょう。

佐藤：それは賛成です。財務的なリスク分析を含めた比較資料を作れば、経営判断の材料になります。

社長：よし、では来月の役員会議までに、二つのシナリオの比較資料を佐藤部長が中心になって作成してもらおう。その上で方向性を決定する。

質問：この会議の結論として最も適切なものはどれですか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$技術開発を急いで、来期中に東南アジアへ参入することを決定した$Q$,         false, 1),
    ($Q$財務状況が改善するまで海外展開を凍結することを決定した$Q$,               false, 2),
    ($Q$早期参入と段階的参入の二シナリオ比較資料を作成し、来月の役員会議で最終判断することにした$Q$, true, 3),
    ($Q$外部の開発パートナーと契約して1年での製品改良を目指すことを決定した$Q$,  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'choukai', 30 FROM q;

COMMIT;
