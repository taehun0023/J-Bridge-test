-- encoding: UTF-8
-- JLPT N1 模試(本番) 聴解 30問 — Set3
-- quiz_id: ad000001-0000-0000-0000-000000000133
-- IDs: dac30001-0000-0000-0000-000000000003 〜 dac30030-0000-0000-0000-000000000003
--
-- 유형별 구성:
--   LISTENING_TASK          5問 (sort_order 1-5)
--   LISTENING_POINT         6問 (sort_order 6-11)
--   LISTENING_SUMMARY       5問 (sort_order 12-16)
--   LISTENING_QUICK_RESPONSE 11問 (sort_order 17-27)
--   LISTENING_INTEGRATED    3問 (sort_order 28-30)

-- ============================================================
-- 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30001-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：木村さん、先方との打ち合わせの件ですが、来週火曜日でよろしいでしょうか。\n女：火曜日は別の会議が入っていて難しいんです。水曜日以降でしたらいつでも大丈夫です。\n男：では水曜日の午後2時はいかがでしょう。\n女：水曜日の午後2時ですね。では先方に確認を取って、決まり次第ご連絡します。\n\n質問：女の人はこれからまず何をしますか。',
  'listening', 'LISTENING_TASK', true, 1, 1,
  '여성은 「先方に確認を取って、決まり次第ご連絡します」라고 말했다. 가장 먼저 해야 할 일은 3번 「先方に日程の確認を取る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30001-0000-0000-0000-000000000003', '火曜日の会議をキャンセルする', false, 1),
('dac30001-0000-0000-0000-000000000003', '男の人に別の日程を提案する', false, 2),
('dac30001-0000-0000-0000-000000000003', '先方に日程の確認を取る', true, 3),
('dac30001-0000-0000-0000-000000000003', '水曜日の午後に会議室を予約する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30002-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：部長、新商品のパッケージデザインなんですが、三案のうちどれにするか決めていただけますか。\n男：うーん、Aはシンプルすぎるし、Cはちょっと派手すぎるな。\n女：では、Bはいかがでしょうか。\n男：Bのデザインは悪くないんだが、ロゴの位置が気になる。もう少し上に持ってきてもらえないか。その修正さえしてくれれば、Bで決定だ。\n\n質問：女の人はこれからまず何をしますか。',
  'listening', 'LISTENING_TASK', true, 1, 2,
  '남성은 「ロゴの位置を上に修正してくれれば、Bで決定だ」라고 했다. 여성이 해야 할 일은 1번 「ロゴの位置を修正する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30002-0000-0000-0000-000000000003', 'ロゴの位置を修正する', true, 1),
('dac30002-0000-0000-0000-000000000003', 'Aのデザインをシンプルにリニューアルする', false, 2),
('dac30002-0000-0000-0000-000000000003', 'Cのデザインの色味を変更する', false, 3),
('dac30002-0000-0000-0000-000000000003', '三案の中から別の新案を加える', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30003-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：橋本さん、今月の在庫管理レポートなんですけど、数量の集計部分に誤りが見つかりまして。\n女：えっ、本当ですか。どの部分ですか。\n男：第2週の入庫数が実際より50単位少なく記録されています。\n女：確認します。では、今すぐデータを修正して再送しますね。あと、他の週も念のため全部確認し直しておきます。\n男：お願いします。今日中に修正版を経理部に提出しないといけないので、急いでいただけますか。\n\n質問：女の人はこれからまず何をしますか。',
  'listening', 'LISTENING_TASK', true, 1, 3,
  '여성은 「今すぐデータを修正して再送します」라고 먼저 말했다. 가장 먼저 해야 할 일은 2번 「第2週の入庫数データを修正する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30003-0000-0000-0000-000000000003', '経理部に修正の延期を連絡する', false, 1),
('dac30003-0000-0000-0000-000000000003', '第2週の入庫数データを修正する', true, 2),
('dac30003-0000-0000-0000-000000000003', '全週分のデータを最初から全部確認する', false, 3),
('dac30003-0000-0000-0000-000000000003', 'レポートを削除して新しく作り直す', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30004-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：石田さん、今日の社内セミナーですが、参加者が予定より10名増えたと連絡が来まして。\n男：そうですか。会場の収容人数は大丈夫でしょうか。\n女：会場はギリギリですが何とかなりそうです。ただ、配布資料の印刷部数が足りないんです。\n男：では、追加分を今から印刷してください。資料データはサーバーにあるので。\n女：わかりました。印刷が終わったら、受付にも人手が必要なので、部署から1名応援をお願いしてもいいですか。\n男：いいですよ。私から総務の西村さんに連絡しておきます。\n\n質問：女の人はこれからまず何をしますか。',
  'listening', 'LISTENING_TASK', true, 1, 4,
  '여성은 「わかりました」라고 하며 추가분 인쇄부터 하겠다는 흐름. 남성이 「今から印刷してください」라고 지시했으므로 정답은 4번 「資料の追加分を印刷する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30004-0000-0000-0000-000000000003', '受付の人員を増やすよう総務に連絡する', false, 1),
('dac30004-0000-0000-0000-000000000003', '会場の変更手配をする', false, 2),
('dac30004-0000-0000-0000-000000000003', '参加者に増員の連絡をする', false, 3),
('dac30004-0000-0000-0000-000000000003', '資料の追加分を印刷する', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30005-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：課長、先日ご相談した顧客データベースの更新作業なんですが、来週から着手しようと思っています。\n女：そうね。ただ、作業前にシステム部に連携してもらう必要があるわ。先にそこから動かしてもらえる？\n男：わかりました。システム部の担当者には私から連絡します。あと、作業マニュアルの確認も必要でしょうか。\n女：マニュアルは去年改訂したものがあるから、それを使ってください。確認はあなたの判断でいいわよ。\n男：承知しました。\n\n質問：男の人はこれからまず何をしますか。',
  'listening', 'LISTENING_TASK', true, 1, 5,
  '여성이 「先にシステム部から動かしてもらえる？」라고 지시했고 남성은 「システム部の担当者には私から連絡します」라고 했다. 가장 먼저 할 일은 2번 「システム部の担当者に連絡する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30005-0000-0000-0000-000000000003', 'データベースの更新作業を開始する', false, 1),
('dac30005-0000-0000-0000-000000000003', 'システム部の担当者に連絡する', true, 2),
('dac30005-0000-0000-0000-000000000003', '作業マニュアルを最初から作成する', false, 3),
('dac30005-0000-0000-0000-000000000003', '顧客データベースのバックアップを取る', false, 4);

-- ============================================================
-- ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30006-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'セミナーで講師が話しています。\n\n男：交渉において最も重要なスキルは、「聞く力」だと私は考えます。多くの人は交渉を「いかに相手を説得するか」だと思いがちですが、実は優秀な交渉者は話すより聞くことに時間を使います。相手が何を本当に求めているか、どんな制約があるか、どこに妥協できる余地があるか——これらを正確に把握することなしに、建設的な合意は生まれません。聞くことは受動的な行為ではなく、戦略的な情報収集です。\n\n質問：この講師によると、優秀な交渉者が最も重視していることは何ですか。',
  'listening', 'LISTENING_POINT', true, 1, 6,
  '강사는 「交渉で最も重要なのは聞く力」「優秀な交渉者は話すより聞くことに時間を使う」라고 말하고 있다. 정답은 3번 「相手の真の要求や制約を把握するために聞くこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30006-0000-0000-0000-000000000003', '論理的な説得力のある言葉を選ぶこと', false, 1),
('dac30006-0000-0000-0000-000000000003', '自分の要求を明確に最初に伝えること', false, 2),
('dac30006-0000-0000-0000-000000000003', '相手の真の要求や制約を把握するために聞くこと', true, 3),
('dac30006-0000-0000-0000-000000000003', '相手よりも多くの情報を事前に用意すること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30007-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'職場で女性と男性が話しています。\n\n女：山下さん、来月のチームビルディング研修なんですが、今年は屋外アクティビティを考えているんですよ。ハイキングかカヤックを予定しています。\n男：いいですね。でも、足を怪我しているメンバーもいますよね。\n女：あ、そうか。それは確認が必要でしたね。ハイキングは難しいかもしれません。\n男：カヤックも体力的に不安のある人がいるかもしれないので、もう少し参加しやすいものも候補に入れてみてはどうでしょう。例えば陶芸ワークショップとか料理教室とか。\n女：確かに、誰でも参加しやすいものがいいですね。参加者のコンディションを確認した上で決めましょう。\n\n質問：女の人は今後何をすることにしましたか。',
  'listening', 'LISTENING_POINT', true, 1, 7,
  '여성은 「参加者のコンディションを確認した上で決めましょう」라고 결론을 내렸다. 정답은 4번 「参加者の体調・コンディションを確認してから研修内容を決める」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30007-0000-0000-0000-000000000003', 'ハイキングを中心としたプログラムを立案する', false, 1),
('dac30007-0000-0000-0000-000000000003', 'カヤックと料理教室の二択で参加者に選んでもらう', false, 2),
('dac30007-0000-0000-0000-000000000003', '屋内アクティビティのみに変更する', false, 3),
('dac30007-0000-0000-0000-000000000003', '参加者の体調・コンディションを確認してから研修内容を決める', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30008-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'ラジオで専門家が話しています。\n\n女：今日は「プレゼン恐怖症」を克服する方法についてお話しします。多くの人が人前で話すことに強い不安を感じますが、その原因の多くは「完璧にやらなければいけない」という思い込みです。実は聴衆が一番感動するのは、完璧なスピーチではなく、話し手の誠実さや熱意です。また、緊張は完全になくすことはできません。むしろ適度な緊張は集中力を高め、パフォーマンスを向上させます。大切なのは緊張を「排除」するのではなく、緊張と「共存」する術を身につけることです。\n\n質問：専門家によると、プレゼン恐怖症克服のために最も重要なことは何ですか。',
  'listening', 'LISTENING_POINT', true, 1, 8,
  '전문가는 「緊張を排除するのではなく、緊張と共存する術を身につけることが大切」라고 말하고 있다. 정답은 1번 「緊張を完全になくそうとせず、共存する方法を学ぶこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30008-0000-0000-0000-000000000003', '緊張を完全になくそうとせず、緊張と共存する方法を学ぶこと', true, 1),
('dac30008-0000-0000-0000-000000000003', '完璧なスピーチを準備することで自信をつけること', false, 2),
('dac30008-0000-0000-0000-000000000003', '聴衆の反応を気にしないメンタルを鍛えること', false, 3),
('dac30008-0000-0000-0000-000000000003', '緊張を感じたら深呼吸で落ち着かせること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30009-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'会議で上司と部下が話しています。\n\n女：藤田さん、先月の顧客満足度調査の結果を見たんですが、対応スピードへの評価が特に低いですね。\n男：はい、確認しました。特に電話での問い合わせ対応に時間がかかっているようです。\n女：原因はなんだと思いますか。\n男：担当者が一人で複数の問い合わせを抱えてしまっている状況が続いています。チャット対応への移行を進めれば、一人が同時に複数件対応できるので改善できるかと思います。\n女：いい提案ね。ただ、顧客の年齢層を考えると電話を全廃するわけにはいかないわ。まず、電話とチャットを並行して運用する体制を作りましょう。その上で、チャット誘導を強化していく方向でいきましょう。\n\n質問：上司が提案した対策として正しいものはどれか。',
  'listening', 'LISTENING_POINT', true, 1, 9,
  '여성 상사는 「電話とチャットを並行して運用し、その上でチャット誘導を強化する」라는 방향을 제시했다. 정답은 3번 「電話とチャットを並行運用しつつ、チャットへの誘導を強化する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30009-0000-0000-0000-000000000003', '電話対応を完全にチャットに切り替える', false, 1),
('dac30009-0000-0000-0000-000000000003', '電話対応の担当者を増員する', false, 2),
('dac30009-0000-0000-0000-000000000003', '電話とチャットを並行運用しつつ、チャットへの誘導を強化する', true, 3),
('dac30009-0000-0000-0000-000000000003', '問い合わせ対応を外部に委託する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30010-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'講演会で研究者が話しています。\n\n男：バイオテクノロジーの急速な進歩は、医療に革命をもたらす一方で、従来の倫理基準では対応しきれない問題を生んでいます。特にゲノム編集技術の応用については、遺伝性疾患の根絶という希望と、「デザイナーベイビー」という懸念が同時に存在しています。私が最も強調したいのは、技術開発の速度と社会的・倫理的な議論の速度に大きなギャップがある点です。技術は指数関数的に進歩するのに対し、社会が倫理的合意に達するプロセスは非常に緩やかです。この非対称性こそが、現代のバイオテクノロジー倫理の最大の課題です。\n\n質問：研究者がバイオテクノロジー倫理の最大の課題だと述べていることは何ですか。',
  'listening', 'LISTENING_POINT', true, 1, 10,
  '연구자는 「技術開発の速度と社会的・倫理的な議論の速度に大きなギャップがある」点を最大課题로 꼽고 있다. 정답은 2번 「技術の進歩の速度と社会・倫理的合意形成の速度の格差」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30010-0000-0000-0000-000000000003', 'ゲノム編集技術の精度が未だ十分でないこと', false, 1),
('dac30010-0000-0000-0000-000000000003', '技術の進歩の速度と社会・倫理的合意形成の速度の格差', true, 2),
('dac30010-0000-0000-0000-000000000003', 'デザイナーベイビーの実現が技術的に不可能なこと', false, 3),
('dac30010-0000-0000-0000-000000000003', '遺伝性疾患の完全根絶に膨大な費用がかかること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30011-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'電話でカスタマーサポートと客が話しています。\n\n男：もしもし、先週注文した製品がまだ届いていないんですが。\n女：ご注文番号をお知らせいただけますか。\n男：A2-5839です。\n女：少々お待ちください。……確認いたしました。配送センターの記録では、先週木曜日に発送済みとなっています。\n男：でも届いていないんです。どうすればいいですか。\n女：大変申し訳ございません。配送会社に追跡調査を依頼いたします。結果は本日中にメールでご連絡いたします。もしお急ぎでしたら、代替品を至急手配することも可能でございます。\n男：追跡結果をまず見てから判断します。メールを待ちます。\n\n質問：男の人はどうすることにしましたか。',
  'listening', 'LISTENING_POINT', true, 1, 11,
  '남성은 「追跡結果をまず見てから判断します。メールを待ちます」라고 말했다. 정답은 4번 「配送追跡の結果をメールで待つ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30011-0000-0000-0000-000000000003', '代替品の手配を今すぐ依頼する', false, 1),
('dac30011-0000-0000-0000-000000000003', '配送会社に自分で直接連絡する', false, 2),
('dac30011-0000-0000-0000-000000000003', '注文をキャンセルして返金を求める', false, 3),
('dac30011-0000-0000-0000-000000000003', '配送追跡の結果をメールで待つ', true, 4);

-- ============================================================
-- 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30012-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'インタビューで起業家が話しています。\n\n女：私がゼロから会社を立ち上げた時、最初の2年間は売上がほぼなく、周りから「もう辞めたら」と何度も言われました。でも私が辞めなかった理由は、「自分がやっていることが本当に正しいのかどうかわからない状態」が怖かったからです。失敗したくないのではなく、試さずに終わることが耐えられなかった。試して失敗すれば、少なくとも「答え」は得られる。その答えが次の正しい一歩を教えてくれる、そう信じていました。\n\n質問：この起業家が最も伝えたいことは何ですか。',
  'listening', 'LISTENING_SUMMARY', true, 1, 12,
  '기업가는 「試さずに終わることが耐えられなかった」「失敗しても答えが得られ次の一歩につながる」라고 말하고 있다. 정답은 3번 「試みて失敗することで答えが得られ次の一歩につながる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30012-0000-0000-0000-000000000003', '売上がなくても諦めずに続ければ必ず成功できる', false, 1),
('dac30012-0000-0000-0000-000000000003', '周囲の意見を無視して自分の信念を貫くべきだ', false, 2),
('dac30012-0000-0000-0000-000000000003', '試みて失敗することで答えが得られ次の一歩につながる', true, 3),
('dac30012-0000-0000-0000-000000000003', '起業は2年以内に成果が出なければ諦めるべきだ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30013-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'ニュースでアナウンサーが伝えています。\n\n男：本日、国内の主要電力会社が共同で新しい電力需給調整システムの導入を発表しました。このシステムは、AIを活用してリアルタイムで需要と供給のバランスを最適化するもので、再生可能エネルギーの不安定な出力変動にも柔軟に対応できます。電力会社側は「このシステムにより、再生可能エネルギーの全体的な比率を2030年までに現在の2倍に引き上げることが可能になる」と説明しています。一方、専門家からは「システムの安定性とサイバーセキュリティ対策が十分に確保されることが前提条件だ」という指摘もあります。\n\n質問：このニュースで最も伝えたいことは何ですか。',
  'listening', 'LISTENING_SUMMARY', true, 1, 13,
  '뉴스의 핵심은 AI를 활용한 전력 수급 조정 시스템 도입과 그것이 재생에너지 확대에 기여할 수 있다는 것이다. 정답은 2번 「AI活用の電力需給調整システム導入で再生可能エネルギー比率拡大が可能になること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30013-0000-0000-0000-000000000003', '電力会社がサイバー攻撃によって深刻な被害を受けた', false, 1),
('dac30013-0000-0000-0000-000000000003', 'AI活用の電力需給調整システム導入で再生可能エネルギー比率拡大が可能になること', true, 2),
('dac30013-0000-0000-0000-000000000003', '再生可能エネルギーの出力が不安定なため電力不足が深刻化している', false, 3),
('dac30013-0000-0000-0000-000000000003', '2030年までに全電力を再生可能エネルギーに切り替える計画が発表された', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30014-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'大学の授業で教授が話しています。\n\n女：「批判的思考」というと、「批判する」「否定する」ことだと誤解されることが多いですが、本来の意味はまったく異なります。批判的思考とは、与えられた情報や主張を鵜呑みにせず、その根拠・前提・論理の整合性を吟味し、自分の頭で判断する能力です。これは批判するための能力ではなく、「より深く理解するための能力」です。また批判的思考は、物事を否定するためではなく、より確かな判断を下すためのものです。現代のような情報過多の時代において、この能力の育成は教育の最優先課題の一つと言えます。\n\n質問：教授の話の主なテーマは何ですか。',
  'listening', 'LISTENING_SUMMARY', true, 1, 14,
  '교수는 비판적 사고의 올바른 의미(부정이 아닌 정보를 검증하고 자신의 머리로 판단하는 능력)를 설명하고 있다. 정답은 4번 「批判的思考の真の意味と情報過多時代における重要性」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30014-0000-0000-0000-000000000003', '批判的に物事を否定することが現代人に必要なスキルだ', false, 1),
('dac30014-0000-0000-0000-000000000003', '大学教育では情報の量より質を重視すべきだ', false, 2),
('dac30014-0000-0000-0000-000000000003', '情報を鵜呑みにせず何でも疑うことが批判的思考だ', false, 3),
('dac30014-0000-0000-0000-000000000003', '批判的思考の真の意味と情報過多時代における重要性', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30015-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'ポッドキャストで研究者が話しています。\n\n男：「幸福」とは何か——この問いに対し、心理学の研究は興味深い答えを提示しています。所得や物質的豊かさと幸福感の相関は、一定の水準を超えると著しく低下します。一方で、良好な人間関係・目的意識・日常生活における小さな満足感——これらが幸福感に与える影響は、所得と比べてはるかに大きいことが示されています。幸福を追いかけることよりも、意味のある活動に没入することが、結果として深い満足感をもたらすという逆説も確認されています。\n\n質問：この研究者が最も強調していることは何ですか。',
  'listening', 'LISTENING_SUMMARY', true, 1, 15,
  '연구자는 소득보다 인간관계・목적의식・일상의 작은 만족이 행복에 더 큰 영향을 미치며, 의미있는 활동에 몰입하는 것이 깊은 만족감을 준다고 강조하고 있다. 정답은 2번 「人間関係や目的意識・日常の満足が物質的豊かさより幸福感に寄与する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30015-0000-0000-0000-000000000003', '所得が一定水準を超えると幸福感は急激に上昇する', false, 1),
('dac30015-0000-0000-0000-000000000003', '人間関係や目的意識・日常の満足が物質的豊かさより幸福感に寄与する', true, 2),
('dac30015-0000-0000-0000-000000000003', '幸福を意識的に追い求めることが幸福への最短ルートだ', false, 3),
('dac30015-0000-0000-0000-000000000003', '幸福感は文化によって大きく異なるため一般化はできない', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30016-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'シンポジウムで専門家が発表しています。\n\n女：フードロス（食品廃棄）問題は、単なる環境問題にとどまらず、経済的損失・倫理的問題・食料安全保障とも密接に絡んでいます。日本では年間約600万トンの食品が廃棄されていますが、その約半分は家庭から出ています。外食産業や食品製造業の廃棄も深刻ですが、家庭レベルでの意識改革なしに問題の根本的解決はありません。消費者が「見た目が悪い野菜」「賞味期限が迫った商品」を積極的に購入し、計画的な食材管理を実践することが、最も即効性のある対策です。\n\n質問：専門家が最も効果的な対策として挙げているのは何ですか。',
  'listening', 'LISTENING_SUMMARY', true, 1, 16,
  '전문가는 「家庭レベルでの意識改革なしに根本的解決はない」「消費者が積極的に購入し計画的な食材管理を実践することが最も即効性のある対策」라고 말하고 있다. 정답은 3번 「消費者が食品廃棄を減らすための意識改革と実践」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30016-0000-0000-0000-000000000003', '外食産業に厳しい廃棄基準を法律で義務づける', false, 1),
('dac30016-0000-0000-0000-000000000003', '賞味期限制度を廃止して食品廃棄を減らす', false, 2),
('dac30016-0000-0000-0000-000000000003', '消費者が食品廃棄を減らすための意識改革と実践', true, 3),
('dac30016-0000-0000-0000-000000000003', '食品廃棄を燃料化するリサイクル技術の開発', false, 4);

-- ============================================================
-- 即時応答 (LISTENING_QUICK_RESPONSE) — 11問 (sort_order 17-27)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30017-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：来週の出張のホテル、もう予約しましたか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 17,
  '출장 호텔 예약 여부를 묻는 질문에 대해 아직 미예약 상태를 알리며 바로 처리하겠다는 応답이 가장 자연스럽다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30017-0000-0000-0000-000000000003', 'いいえ、まだです。すぐに手配いたします。', true, 1),
('dac30017-0000-0000-0000-000000000003', 'はい、出張は楽しみにしています。', false, 2),
('dac30017-0000-0000-0000-000000000003', 'ホテルは苦手なので、別の場所でお願いします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30018-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：この度は弊社の展示会にお越しいただき、誠にありがとうございます。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 18,
  '전시회 내방에 대한 환영 인사에 대한 적절한 비즈니스 응답. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30018-0000-0000-0000-000000000003', 'こちらこそ、よろしくお願いします。', false, 1),
('dac30018-0000-0000-0000-000000000003', 'はい、展示品をいただきます。', false, 2),
('dac30018-0000-0000-0000-000000000003', 'こちらこそ、貴重な機会をいただきありがとうございます。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30019-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：鈴木さん、今日の会議の議事録、作成をお願いできますか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 19,
  '의사록 작성 의뢰에 대한 수락 응답. 「かしこまりました。終了後すぐに作成いたします」가 가장 자연스럽다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30019-0000-0000-0000-000000000003', 'はい、会議に参加します。', false, 1),
('dac30019-0000-0000-0000-000000000003', 'かしこまりました。終了後すぐに作成いたします。', true, 2),
('dac30019-0000-0000-0000-000000000003', 'すみません、それは私の仕事ではないと思います。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30020-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：山田部長、先ほどのご指摘、ありがとうございました。参考になりました。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 20,
  '지적・조언에 대한 감사 표현에 상사가 응답하는 상황. 「いいえ、お役に立てれば何よりです」가 가장 자연스럽다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30020-0000-0000-0000-000000000003', 'いいえ、お役に立てれば何よりです。', true, 1),
('dac30020-0000-0000-0000-000000000003', 'ありがとうございます。私も勉強になりました。', false, 2),
('dac30020-0000-0000-0000-000000000003', 'では、次回からは指摘しないようにします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30021-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：来月の新製品説明会、ぜひご参加いただけますか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 21,
  '참석 의사를 묻는 말에 확인 후 응답하겠다는 정중한 거절/유보 표현이 자연스럽다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30021-0000-0000-0000-000000000003', 'ええ、新製品には全く興味がありません。', false, 1),
('dac30021-0000-0000-0000-000000000003', 'ありがとうございます。詳しい内容を教えてください。', false, 2),
('dac30021-0000-0000-0000-000000000003', 'ぜひ参加したいと思います。日程をご連絡いただけますか。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30022-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：すみません、このデータ、上司に確認が取れてから使ってほしいんですが、急ぎますか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 22,
  '상사 확인을 조건으로 데이터 사용을 요청하는 상황. 확인 後 사용 가능하다는 응답이 자연스럽다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30022-0000-0000-0000-000000000003', 'では確認なしで今すぐ使ってください。', false, 1),
('dac30022-0000-0000-0000-000000000003', 'わかりました。確認が取れ次第、共有してください。', true, 2),
('dac30022-0000-0000-0000-000000000003', '上司には私から直接話します。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30023-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：先日のプロジェクト、うまくいったそうですね。おめでとうございます。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 23,
  '성공 축하에 대한 겸손한 일본어 응답. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30023-0000-0000-0000-000000000003', 'ありがとうございます。チーム全員のおかげです。', true, 1),
('dac30023-0000-0000-0000-000000000003', 'ええ、私一人の力でやり遂げました。', false, 2),
('dac30023-0000-0000-0000-000000000003', 'うまくいったのは偶然です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30024-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：田中さん、この書類の件で少しお時間をいただけますか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 24,
  '시간을 요청하는 말에 대한 자연스러운 응답으로 「はい、今大丈夫ですよ」또는 다른 시간을 제안하는 것이 적절하다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30024-0000-0000-0000-000000000003', 'いいえ、書類は受け取りました。', false, 1),
('dac30024-0000-0000-0000-000000000003', 'その書類は難しすぎます。', false, 2),
('dac30024-0000-0000-0000-000000000003', 'はい、今ちょうど手が空いています。どうぞ。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30025-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：お客様、お会計は現金でよろしいでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 25,
  '결제 방법을 묻는 질문에 카드로 결제하겠다는 응답이 자연스럽다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30025-0000-0000-0000-000000000003', 'いいえ、お会計は結構です。', false, 1),
('dac30025-0000-0000-0000-000000000003', 'カードでお願いできますか。', true, 2),
('dac30025-0000-0000-0000-000000000003', 'お会計はまた今度にします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30026-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'男：この企画書、もう少し具体的な数値を盛り込んでもらえませんか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 26,
  '수정 요청에 대한 적절한 수락 응답. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30026-0000-0000-0000-000000000003', 'かしこまりました。明日までに修正してお持ちします。', true, 1),
('dac30026-0000-0000-0000-000000000003', '数値はあまり重要ではないと思います。', false, 2),
('dac30026-0000-0000-0000-000000000003', 'では、企画書を最初から作り直してください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30027-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'女：田中さん、新しいシステムの操作方法についてご存知でしょうか。\n\n最も適切な応答を選びなさい。',
  'listening', 'LISTENING_QUICK_RESPONSE', true, 1, 27,
  '시스템 조작 방법을 아는지 묻는 말에 모른다고 하며 확인 방법을 제안하는 응답이 자연스럽다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30027-0000-0000-0000-000000000003', 'はい、私が開発しました。', false, 1),
('dac30027-0000-0000-0000-000000000003', 'いいえ、新しいシステムは必要ありません。', false, 2),
('dac30027-0000-0000-0000-000000000003', '詳しくはわかりませんが、マニュアルを確認すればわかると思います。', true, 3);

-- ============================================================
-- 統合理解 (LISTENING_INTEGRATED) — 3問 (sort_order 28-30)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30028-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'テレビの対談番組で、教育研究者と現役の学校教師が話しています。\n\n司会：「個別最適化教育」について、それぞれのお立場からご意見をお聞かせください。\n男（研究者）：個別最適化教育は、一人ひとりの学習進度・得意不得意・学び方の違いに対応した教育を提供するものです。AIの活用によって、教師一人では対応しきれなかった個別化が技術的に可能になりつつあります。均一な授業から離れ、各生徒が自分のペースで深く学べる環境は、学習効果の向上だけでなく、自律的な学習者の育成にもつながります。\n女（教師）：理念としては素晴らしいと思います。ただ、現場の教師として感じることは、個別化が進みすぎると、生徒同士が協力して問題を解いたり、意見の違いを議論したりする機会が失われるかもしれないということです。学びは個人の中だけで完結するものではなく、他者との相互作用から得るものが非常に大きいですから。\n男（研究者）：おっしゃる通りです。個別化と協働学習は対立するものではなく、両方が必要です。個別最適化で基礎を定着させながら、協働的な課題解決でより高次の思考力を育てる、というハイブリッドなアプローチが理想的だと考えます。\n\n質問：二人が最終的に共通して支持していることは何ですか。',
  'listening', 'LISTENING_INTEGRATED', true, 1, 28,
  '연구자도 교사도 개별 학습과 협동 학습 양쪽이 모두 필요하다는 점에 동의하고 있다. 연구자가 마지막에 「個別化と協働学習は対立するものではなく、両方が必要」라고 정리하고 있다. 정답은 2번 「個別最適化学習と協働的な学習の両方を組み合わせることが必要」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30028-0000-0000-0000-000000000003', 'AI技術を導入してすべての授業を完全に個別化すべきだ', false, 1),
('dac30028-0000-0000-0000-000000000003', '個別最適化学習と協働的な学習の両方を組み合わせることが必要だ', true, 2),
('dac30028-0000-0000-0000-000000000003', '均一な授業は今後も学校教育の中心であり続けるべきだ', false, 3),
('dac30028-0000-0000-0000-000000000003', '教師の役割はAIに完全に置き換えられるべきでない', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30029-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'ラジオで、栄養士と医師が食事と健康についてインタビューに答えています。\n\n司会：健康的な食事について、専門家のお立場から教えてください。\n女（栄養士）：現代人の食事で最も問題なのは「超加工食品」の過剰摂取です。手軽で安価な超加工食品には、添加物・精製糖・質の悪い脂質が大量に含まれており、肥満・糖尿病・心疾患のリスクを高めることが世界中の研究で示されています。食事の質を上げるためには、できる限り加工度の低い食材——野菜・魚・豆類・全粒穀物——を中心にした食事を選ぶことが基本です。\n男（医師）：私のクリニックでは、患者さんの生活習慣病の多くが食事の改善によって劇的に改善されるケースを多数見ています。大切なのは「完璧な食事」を目指すことより、「毎日の小さな改善」を積み重ねることです。一気に食生活を変えようとすると、長続きしません。週に1食だけ意識して変えるなど、無理のない範囲から始めることをお勧めします。\n女（栄養士）：同感です。継続できない完璧な食事より、継続できる「80%の食事」の方がはるかに健康に寄与します。\n\n質問：栄養士と医師の両方が強調していることは何ですか。',
  'listening', 'LISTENING_INTEGRATED', true, 1, 29,
  '영양사는 초가공식품을 피하고 가공도가 낮은 식품을 선택하는 것을 강조하고, 의사는 완벽한 식사보다 작은 개선을 지속하는 것을 강조한다. 두 사람이 공통으로 강조하는 것은 영양사의 마지막 발언 「継続できない完璧な食事より、継続できる80%の食事」에 대한 동의에서 드러나듯 "지속 가능한 식생활 개선"이다. 정답은 4번 「完璧を目指すより継続できる改善を積み重ねることが大切」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30029-0000-0000-0000-000000000003', '超加工食品をすべて排除した厳格な食事管理が最重要だ', false, 1),
('dac30029-0000-0000-0000-000000000003', '魚・豆類・全粒穀物を毎食必ず摂取すべきだ', false, 2),
('dac30029-0000-0000-0000-000000000003', '医師の指導なく食生活を変えることは危険だ', false, 3),
('dac30029-0000-0000-0000-000000000003', '完璧を目指すより継続できる改善を積み重ねることが大切だ', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'dac30030-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000133',
  'audio_listening',
  E'経済フォーラムで、二人の経済学者がデジタル通貨について議論しています。\n\n司会：中央銀行デジタル通貨（CBDC）の導入について、お二人のお考えをお聞かせください。\n男（E氏）：CBDCは金融インフラの近代化と金融包摂——銀行口座を持てない人々への金融サービス提供——という観点から非常に有望な技術です。また、決済の透明性向上や資金洗浄防止にも効果が期待されます。実験的な導入はすでに複数の国で進んでいます。\n女（F氏）：メリットは理解しますが、プライバシーの問題は深刻です。CBDCは政府が個人の全取引を把握できる仕組みになりかねない。これは監視国家への危険な一歩です。また、中央集権的なデジタル通貨システムは、大規模なサイバー攻撃に対して脆弱であるというリスクも無視できません。\n男（E氏）：プライバシーとセキュリティの懸念はもっともです。しかし、これらは技術的・制度的な設計で対処可能な問題です。適切なプライバシー保護設計と強固なセキュリティフレームワークを前提とすれば、CBDCは金融システムの革新に大きく貢献できます。\n女（F氏）：その「前提」がしっかり確保されれば、私も反対するものではありません。問題はその保証をどう担保するかです。\n\n質問：二人が最終的に合意していることは何ですか。',
  'listening', 'LISTENING_INTEGRATED', true, 1, 30,
  '남성은 CBDC의 이점을 주장하고, 여성은 프라이버시와 보안 우려를 제기했다. 그러나 마지막에 여성은 「プライバシーとセキュリティが確保されれば反対しない」라고 했고 남성도 「適切な保護設計を前提とすれば貢献できる」라고 했다. 두 사람 모두 "프라이버시와 보안 보호가 전제가 되어야 한다"는 점에 합의하고 있다. 정답은 3번 「プライバシー保護とセキュリティが確保されることがCBDC導入の前提条件」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('dac30030-0000-0000-0000-000000000003', 'CBDCはすべての国で直ちに導入されるべきだ', false, 1),
('dac30030-0000-0000-0000-000000000003', 'CBDCは政府による監視を強化するため廃止されるべきだ', false, 2),
('dac30030-0000-0000-0000-000000000003', 'プライバシー保護とセキュリティが確保されることがCBDC導入の前提条件だ', true, 3),
('dac30030-0000-0000-0000-000000000003', 'デジタル通貨より従来の現金制度を維持することが最善だ', false, 4);
