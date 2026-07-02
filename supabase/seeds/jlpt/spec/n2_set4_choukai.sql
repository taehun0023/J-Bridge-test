-- encoding: UTF-8
-- JLPT N2 模試(公式) 聴解 32問 — Set 4
-- quiz_id: ad000002-0000-0000-0000-000000000243
-- 問題1 課題理解(LISTENING_TASK) 5問/問題2 ポイント理解(LISTENING_POINT) 6問
-- 問題3 概要理解(LISTENING_SUMMARY) 5問/問題4 即時応答(LISTENING_QUICK_RESPONSE) 12問
-- 問題5 統合理解(LISTENING_INTEGRATED) 4問

-- ============================================================
-- 問題1 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000001',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'病院で患者と受付が話しています。\n\n患者：すみません、初めてこちらの病院に来たんですが、まず何をすればいいですか。\n受付：初診の方ですね。まず、こちらの問診票にご記入いただけますか。\n患者：わかりました。保険証も出したほうがいいですか。\n受付：はい、記入が終わりましたら、保険証と一緒にこちらの窓口にお出しください。\n患者：わかりました。\n受付：それから、お薬手帳をお持ちでしたら、それも一緒にお願いします。\n患者：手帳は家に忘れてきてしまいました。\n受付：それでしたら、今日は問診票と保険証だけで結構です。\n患者：はい、では書いてきます。\n\n質問：患者はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '受付は「まず、こちらの問診票にご記入いただけますか」と言い、患者も「はい、では書いてきます」と答えている。정답은 2번 「問診票に記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000001', 'お薬手帳を取りに家に帰る', false, 1),
('adc20004-0000-0000-0000-000000000001', '問診票に記入する', true, 2),
('adc20004-0000-0000-0000-000000000001', '窓口で保険証だけを提出する', false, 3),
('adc20004-0000-0000-0000-000000000001', '診察室で医者と話す', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000002',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'不動産屋で女の人と店員が話しています。\n\n女：先日内覧したアパートなんですが、契約したいと思っています。\n店員：ありがとうございます。契約には、身分証明書のコピーと、保証人の同意書が必要になります。\n女：保証人は父にお願いしようと思っているんですが、同意書はどこでもらえますか。\n店員：こちらでご用意していますので、今すぐお渡しできます。ただ、先に審査がありますので、まずは申込書にご記入いただけますか。\n女：わかりました。\n店員：申込書をご提出いただいてから、審査結果が出るまで3日ほどお待ちいただきます。\n女：はい、では書きます。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '店員が「まずは申込書にご記入いただけますか」と言い、女性も「はい、では書きます」と答えている。정답은 3번 「申込書に記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000002', '父に保証人を頼む電話をする', false, 1),
('adc20004-0000-0000-0000-000000000002', '身分証明書をコピーする', false, 2),
('adc20004-0000-0000-0000-000000000002', '申込書に記入する', true, 3),
('adc20004-0000-0000-0000-000000000002', '審査結果が出るのを待つ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000003',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'会社でヘルプデスクの担当者と社員が電話で話しています。\n\n社員：すみません、パソコンのパスワードを忘れてしまって、ログインできないんです。\n担当者：かしこまりました。まず、社員番号を教えていただけますか。\n社員：はい、1234番です。\n担当者：確認いたしました。こちらで仮パスワードを発行しますので、少々お待ちください。……発行できました。仮パスワードをメールでお送りしましたので、ご確認のうえ、ログイン後すぐに新しいパスワードに変更してください。\n社員：わかりました。今メールを確認します。\n担当者：変更方法が分からない場合は、また連絡してください。\n社員：ありがとうございます。\n\n質問：社員はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '担当者が仮パスワードをメールで送ったと伝え、社員は「今メールを確認します」と答えている。정답은 3번 「メールを確認する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000003', '新しいパスワードをすぐに考える', false, 1),
('adc20004-0000-0000-0000-000000000003', '担当者にもう一度電話する', false, 2),
('adc20004-0000-0000-0000-000000000003', 'メールを確認する', true, 3),
('adc20004-0000-0000-0000-000000000003', '社員番号を上司に報告する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000004',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'スポーツジムで男の人とトレーナーが話しています。\n\n男：入会を考えているんですが、まず何をすればいいですか。\nトレーナー：ありがとうございます。まずは体験レッスンを受けていただくことをお勧めしています。\n男：体験レッスンって、今日でも受けられますか。\nトレーナー：本日ですと、あいにく予約でいっぱいでして。明日の午後でしたら空きがございます。\n男：じゃあ、明日お願いします。\nトレーナー：かしこまりました。それから、体験の前に、こちらの健康チェックシートにご記入いただく必要がありますので、今日中にご記入いただけますか。オンラインでも入力できます。\n男：わかりました。今晩やっておきます。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  'トレーナーが「今日中にご記入いただけますか」と頼み、男性も「今晩やっておきます」と答えている。정답은 2번 「健康チェックシートに記入する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000004', '明日体験レッスンを受ける', false, 1),
('adc20004-0000-0000-0000-000000000004', '健康チェックシートに記入する', true, 2),
('adc20004-0000-0000-0000-000000000004', '入会申込書を提出する', false, 3),
('adc20004-0000-0000-0000-000000000004', 'トレーナーと日程を再調整する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000005',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'宅配業者と男の人が電話で話しています。\n\n男：すみません、今日荷物が届く予定だったんですが、まだ届いていなくて。\n担当者：申し訳ございません。確認いたします……本日午後2時にお伺いしましたが、ご不在だったようで、不在票をお入れしております。\n男：あ、本当ですね、今見たら不在票がありました。すみません。\n担当者：いいえ。再配達をご希望でしたら、こちらから時間帯を指定していただけます。\n男：今日の夜、7時以降なら家にいます。\n担当者：かしこまりました。それでは、本日の19時から21時の間でご用意いたします。\n男：お願いします。\n\n質問：男の人はこれからどうしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  '男性は「今日の夜、7時以降なら家にいます」と伝え、担当者も19時〜21時で再配達を手配した。정답은 2번 「夜7時以降に家で荷物を待つ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000005', '営業所まで荷物を取りに行く', false, 1),
('adc20004-0000-0000-0000-000000000005', '夜7時以降に家で荷物を待つ', true, 2),
('adc20004-0000-0000-0000-000000000005', '配達日を来週に変更する', false, 3),
('adc20004-0000-0000-0000-000000000005', '不在票に記入して返送する', false, 4);

-- ============================================================
-- 問題2 ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000006',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'ラジオで園芸専門家が話しています。\n\n男：観葉植物を枯らしてしまう方によく話を聞くと、実は水のやりすぎが原因であることが多いんです。土が乾いていないのに毎日水をあげてしまうと、根が呼吸できなくなって腐ってしまいます。植物を元気に育てるコツは、土の表面が乾いてから、たっぷり水をあげること。逆に、水やりの回数を減らすことを恐れないでほしいんです。日光や肥料も大切ですが、まずは水やりのタイミングを見直すことが一番の近道です。\n\n質問：この専門家によると、観葉植物を元気に育てるために最も重要なことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「土の表面が乾いてから、たっぷり水をあげること」「水やりのタイミングを見直すことが一番の近道」と述べている。정답은 2번 「土が乾いてから水をやること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000006', '十分な日光に当てること', false, 1),
('adc20004-0000-0000-0000-000000000006', '土が乾いてから水をやること', true, 2),
('adc20004-0000-0000-0000-000000000006', '肥料を定期的に与えること', false, 3),
('adc20004-0000-0000-0000-000000000006', '毎日欠かさず水をやること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000007',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'会社で男女が話しています。\n\n女：田中さん、先週の資料提出、締め切りに間に合いませんでしたね。\n男：すみません、本当に反省しています。実は途中まで順調だったんですが、途中でデータの確認に時間がかかってしまって。\n女：それは仕方ない部分もありますが、もっと早く相談してくれたら、手伝えたかもしれません。\n男：おっしゃる通りです。一人で抱え込んでしまって、遅れそうだと気づいた時にはもう締め切り前日で。今度からは、早い段階で進捗を共有するようにします。\n女：そうしてください。困ったときは早めに声をかけてくださいね。\n\n質問：男の人は何を反省していますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '남성은「一人で抱え込んでしまって」「早い段階で進捗を共有するようにします」라고 반성하고 있다. 정답은 2번 「一人で抱え込み早めに相談しなかったこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000007', 'データの確認に時間をかけすぎたこと', false, 1),
('adc20004-0000-0000-0000-000000000007', '一人で抱え込み早めに相談しなかったこと', true, 2),
('adc20004-0000-0000-0000-000000000007', '資料の内容に誤りが多かったこと', false, 3),
('adc20004-0000-0000-0000-000000000007', '締め切りそのものが厳しすぎたこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000008',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'美術館の館内アナウンスを聞いています。\n\n女：本日ご来館の皆様にお知らせいたします。ただいま2階で開催中の企画展「近代日本の絵画」ですが、来場者多数のため、急遽3階の特別展示室に会場を移動して開催いたします。2階の入り口には案内係を配置しておりますので、そちらの案内に従って3階へお進みください。ご不便をおかけいたしますが、よろしくお願いいたします。\n\n質問：このアナウンスによると、企画展を見に来た人はどうすればいいですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '「2階の入り口には案内係を配置しておりますので、そちらの案内に従って3階へお進みください」라고 안내하고 있다. 정답은 2번 「案内係の指示に従って3階へ移動する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000008', '2階でそのまま展示を見る', false, 1),
('adc20004-0000-0000-0000-000000000008', '案内係の指示に従って3階へ移動する', true, 2),
('adc20004-0000-0000-0000-000000000008', 'チケットを払い戻してもらう', false, 3),
('adc20004-0000-0000-0000-000000000008', '入り口で並んで開場を待つ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000009',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'レストランで女の人と店員が電話で話しています。\n\n女：予約の件でお電話したんですが、来週土曜日の19時に4名で予約している者です。\n店員：確認いたします……はい、ご予約承っております。\n女：実は人数が2名増えて、6名になりそうなんです。あと、そのうち1人がアレルギーがあって、えびが食べられないんですが。\n店員：かしこまりました。人数の変更は問題ございません。アレルギーにつきましては、コース料理にえびを使用しておりますので、そちらは別の食材に変更させていただきます。\n女：ありがとうございます。あ、あと少し遅れて19時半頃になるかもしれません。\n店員：かしこまりました。ただ、当日変更がある場合は、念のためお電話でご一報いただけますと助かります。\n\n質問：店員が最も念を押して伝えたことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '店員は最後に「当日変更がある場合は、念のためお電話でご一報いただけますと助かります」と念を押している。정답은 3번 「当日変更があれば必ず電話で連絡してほしいこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000009', '19時半までに必ず来店してほしいこと', false, 1),
('adc20004-0000-0000-0000-000000000009', 'えびアレルギーの詳細を再度伝えてほしいこと', false, 2),
('adc20004-0000-0000-0000-000000000009', '当日変更があれば必ず電話で連絡してほしいこと', true, 3),
('adc20004-0000-0000-0000-000000000009', '6名分の追加料金を先に支払ってほしいこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000010',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'テレビでインタビューを聞いています。\n\n司会：中村さんは20年間、キャリアカウンセラーとして多くの方の転職相談に乗ってこられましたね。この仕事を続けている理由を教えてください。\n中村：正直、大変なことも多いですよ。相談に来る方の中には、なかなか一歩を踏み出せずに悩んでいる方も多くて。でも、何度も面談を重ねるうちに、その人が自分の強みに気づいて、表情が明るくなっていく瞬間があるんです。それを見るたびに、この仕事をやっていてよかったと感じます。人の人生の転機に関われることが、私にとって一番のやりがいなんです。\n\n質問：中村さんがこの仕事を長年続けている主な理由は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '「その人が自分の強みに気づいて表情が明るくなっていく瞬間」「人の人生の転機に関われることが一番のやりがい」라고 말하고 있다. 정답은 2번 「相談者の変化に立ち会えることにやりがいを感じるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000010', '給料や待遇が非常に良いから', false, 1),
('adc20004-0000-0000-0000-000000000010', '相談者の変化に立ち会えることにやりがいを感じるから', true, 2),
('adc20004-0000-0000-0000-000000000010', '転職の専門知識を増やせるから', false, 3),
('adc20004-0000-0000-0000-000000000010', '有名な会社とのつながりができるから', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000011',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'電話で男女が話しています。\n\n男：はい、さくら電気サービスです。\n女：あ、もしもし。先日エアコンの修理をお願いした木村と申しますが。\n男：木村様、ありがとうございます。本日確認いたしましたところ、フィルターの清掃に加えて、室外機のファンモーターに劣化が見つかりました。\n女：えっ、ファンモーターですか。\n男：はい、このままですと異音や効きの悪化につながる可能性がありますので、交換をお勧めします。費用はフィルター清掃と合わせて1万5千円ほどになります。\n女：わかりました。お願いします。\n男：ありがとうございます。では明後日の午後にお伺いして交換作業をいたします。\n\n質問：当初の修理に追加されることになったのは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '「フィルターの清掃に加えて、室外機のファンモーターに劣化が見つかりました」라고 했으므로, 추가된 수리는 3번 「室外機のファンモーター交換」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000011', 'エアコン本体の買い替え', false, 1),
('adc20004-0000-0000-0000-000000000011', 'フィルターの再清掃', false, 2),
('adc20004-0000-0000-0000-000000000011', '室外機のファンモーター交換', true, 3),
('adc20004-0000-0000-0000-000000000011', '室内機の配管交換', false, 4);

-- ============================================================
-- 問題3 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000012',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'ラジオで男の人が話しています。\n\n男：在宅勤務が広まって、通勤時間がなくなったり、自分のペースで働けたりするようになったのは、大きなメリットです。ただ、最近気になっているのは、仕事とプライベートの境界がはっきりしなくなっている人が増えていることです。家にいるから、つい夜遅くまでメールを返してしまったり、休日でも仕事のことが頭から離れなかったり。オフィスに通っていた頃は、通勤という時間が気持ちの切り替えになっていたんですが、それがなくなった今、意識して「仕事を終わらせる」区切りを作らないと、いつまでも働き続けてしまう。これが在宅勤務の落とし穴だと思います。\n\n質問：この男の人が最も心配していることは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '「仕事とプライベートの境界がはっきりしなくなっている人が増えている」「これが在宅勤務の落とし穴だ」と述べている。정답은 2번 「在宅勤務によって仕事と私生活の境界が曖昧になっていること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000012', '在宅勤務で通勤時間が長くなっていること', false, 1),
('adc20004-0000-0000-0000-000000000012', '在宅勤務によって仕事と私生活の境界が曖昧になっていること', true, 2),
('adc20004-0000-0000-0000-000000000012', '在宅勤務のための光熱費が増えていること', false, 3),
('adc20004-0000-0000-0000-000000000012', '在宅勤務でコミュニケーションが減っていること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000013',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'講演会で女の人が話しています。\n\n女：スマートフォンで手軽に情報が手に入る時代になり、本を読む時間が減っているという調査結果があります。しかし、私は読書には、ネットの情報収集にはない価値があると考えています。本、特に長い文章を読むという行為は、著者の論理を最後まで追いながら、自分の頭で考える訓練になります。断片的な情報を次々に消費するのとは違って、じっくりと物事を多角的に捉える力が養われるんです。忙しい毎日の中で、一日十分でもいいので、本を読む時間を作ってみてください。それが、物事を深く考える力につながっていくはずです。\n\n質問：この女の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '「長い文章を読むという行為は、自分の頭で考える訓練になる」「物事を深く考える力につながっていく」라고 강조하고 있다. 정답은 2번 「読書は深く考える力を養うために大切だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000013', '本よりインターネットの方が情報収集に効率的だ', false, 1),
('adc20004-0000-0000-0000-000000000013', '読書は深く考える力を養うために大切だ', true, 2),
('adc20004-0000-0000-0000-000000000013', '長い文章を読むのは時間の無駄だ', false, 3),
('adc20004-0000-0000-0000-000000000013', '毎日十分の読書で本の内容を暗記できる', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000014',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'ニュースで男の人がレポートしています。\n\n男：ここ数年でキャッシュレス決済の利用が急速に広がり、スマートフォン一つで買い物ができる店が増えました。若い世代を中心に、財布を持たずに外出する人も珍しくなくなっています。一方で、高齢者を中心に、操作方法が分からなかったり、通信トラブルへの不安から現金を使い続けたいという声も根強く、世代によって利用状況に大きな差が出ています。専門店や自治体では、高齢者向けの使い方講座を開くなど、誰もが使いやすい仕組みづくりが求められています。\n\n質問：このニュースが伝えている主な内容は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  'キャッシュレス決済の普及状況と、若い世代・高齢者の間で利用に差があることをバランスよく伝えている。정답은 3번 「キャッシュレス決済の普及と世代間の利用格差」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000014', 'キャッシュレス決済が全面的に廃止されること', false, 1),
('adc20004-0000-0000-0000-000000000014', '高齢者が現金の使用を禁止されたこと', false, 2),
('adc20004-0000-0000-0000-000000000014', 'キャッシュレス決済の普及と世代間の利用格差', true, 3),
('adc20004-0000-0000-0000-000000000014', '若者の間で現金志向が強まっていること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000015',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'インタビューで男の人が話しています。\n\n男：私が住んでいるこの町は、10年前まで若者がどんどん出て行って、商店街もシャッター通りになっていました。そこで、地元の食材を使った飲食店や、空き家を改装したゲストハウスを少しずつ作っていったんです。最初は反対する人もいましたが、口コミやSNSで観光客が増えていき、今では町に活気が戻ってきました。大切なのは、外から人を呼ぶだけでなく、地元の人がこの町を誇りに思えるようにすることだと思います。観光客の数だけを追い求めるのではなく、住んでいる人自身が満足できる町づくりを目指してきました。\n\n質問：この男の人が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '「地元の人がこの町を誇りに思えるようにすること」「住んでいる人自身が満足できる町づくり」라고 강조하고 있다. 정답은 2번 「地域おこしは住民の誇りにつながる町づくりが大切だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000015', '観光客の数を増やすことだけが町おこしの目的だ', false, 1),
('adc20004-0000-0000-0000-000000000015', '地域おこしは住民の誇りにつながる町づくりが大切だ', true, 2),
('adc20004-0000-0000-0000-000000000015', '空き家をすべて取り壊すべきだ', false, 3),
('adc20004-0000-0000-0000-000000000015', '若者の流出は止められない問題だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000016',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'ラジオで女の人が話しています。\n\n女：最近、都市部でも「コミュニティガーデン」と呼ばれる、住民同士で野菜や花を育てる活動が広がっています。私も参加しているんですが、土を触ったり、収穫したりする時間は、日常のストレスを忘れさせてくれます。それだけでなく、隣の区画の人と挨拶を交わしたり、育て方の情報を交換したりするうちに、自然と地域のつながりが生まれるんです。一人暮らしで近所付き合いが少なかった私にとって、この活動は思いがけない出会いの場になりました。忙しい都会の生活の中でも、こうした小さなつながりを持てる場所は貴重だと思います。\n\n質問：この女の人が話しているテーマは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '女性はコミュニティガーデンの体験を通じ、隣人との挨拶や情報交換から自然と地域のつながりが生まれると話している。정답은 2번 「コミュニティガーデンを通じて生まれる地域のつながり」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000016', '野菜を育てる際の効率的な栽培方法', false, 1),
('adc20004-0000-0000-0000-000000000016', 'コミュニティガーデンを通じて生まれる地域のつながり', true, 2),
('adc20004-0000-0000-0000-000000000016', '都市部の緑地不足という深刻な問題', false, 3),
('adc20004-0000-0000-0000-000000000016', '一人暮らしの生活費を抑える方法', false, 4);

-- ============================================================
-- 問題4 即時応答 (LISTENING_QUICK_RESPONSE) — 12問 (sort_order 17-28)
-- 3択のみ
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000017',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：この資料、コピーしましょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '親切な申し出に対して、感謝しながら受け入れる表現が最も自然。정답은 1번 「ありがとうございます、お願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000017', 'ありがとうございます、お願いします。', true, 1),
('adc20004-0000-0000-0000-000000000017', 'いいえ、資料はまだ届いていません。', false, 2),
('adc20004-0000-0000-0000-000000000017', 'はい、コピーはとても厚いです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000018',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：今週末、天気が悪そうですね。予定は大丈夫ですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '天候を心配する質問に対して、予定に影響がない理由を伝える返答が最も自然。정답은 2번 「ええ、屋内のイベントなので大丈夫です」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000018', 'はい、雨はまったく降っていません。', false, 1),
('adc20004-0000-0000-0000-000000000018', 'ええ、屋内のイベントなので大丈夫です。', true, 2),
('adc20004-0000-0000-0000-000000000018', 'いいえ、天気予報を見ていません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000019',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：明日までにこの書類、仕上げられそうですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '納期を確認する質問に対して、見通しを具体的に答える返答が最も自然。정답은 3번 「はい、今日中に終わらせるつもりです」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000019', 'いいえ、書類はもう出しました。', false, 1),
('adc20004-0000-0000-0000-000000000019', 'ええ、明日は休みを取ります。', false, 2),
('adc20004-0000-0000-0000-000000000019', 'はい、今日中に終わらせるつもりです。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000020',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：新しいプロジェクト、大変そうだけど頑張ってね。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '励ましの言葉に対して、感謝しながら意気込みを伝える返答が最も自然。정답은 1번 「ありがとう、精一杯やってみるよ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000020', 'ありがとう、精一杯やってみるよ。', true, 1),
('adc20004-0000-0000-0000-000000000020', 'そうだね、プロジェクトは楽しそうだね。', false, 2),
('adc20004-0000-0000-0000-000000000020', 'いや、もう終わったプロジェクトだよ。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000021',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：この間貸してくれた本、とても面白かったです。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  '感想を伝えられた側として、喜びを表す返答が最も自然。정답은 2번 「それはよかったです、気に入ってもらえて嬉しいです」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000021', 'いいえ、その本は貸していません。', false, 1),
('adc20004-0000-0000-0000-000000000021', 'それはよかったです、気に入ってもらえて嬉しいです。', true, 2),
('adc20004-0000-0000-0000-000000000021', 'はい、私もまだ読んでいません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000022',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：すみません、この席、空いていますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '席が空いているかを尋ねる質問に対して、着席を促す返答が最も自然。정답은 3번 「はい、どうぞお座りください」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000022', 'いいえ、席は立ってください。', false, 1),
('adc20004-0000-0000-0000-000000000022', 'はい、荷物を置いてもいいですか。', false, 2),
('adc20004-0000-0000-0000-000000000022', 'はい、どうぞお座りください。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000023',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：明日の会議、オンラインに変更してもいいでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '許可を求める質問に対して、承諾しながら対応まで伝える返答が最も自然。정답은 1번 「ええ、構いませんよ。参加者にも連絡しておきます」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000023', 'ええ、構いませんよ。参加者にも連絡しておきます。', true, 1),
('adc20004-0000-0000-0000-000000000023', 'いいえ、会議はもう終わりました。', false, 2),
('adc20004-0000-0000-0000-000000000023', 'はい、明日は会議に出られません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000024',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：この機械の使い方がよく分からないんですが、教えていただけますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '説明を求める依頼に対して、具体的に案内を始める返答が最も自然。정답은 2번 「はい、こちらのボタンから順にご説明しますね」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000024', 'いいえ、機械は使わないでください。', false, 1),
('adc20004-0000-0000-0000-000000000024', 'はい、こちらのボタンから順にご説明しますね。', true, 2),
('adc20004-0000-0000-0000-000000000024', 'はい、機械はもう壊れています。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000025',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：昨日頼んでおいた発注、もう終わりましたか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  '進捗を確認する質問に対して、完了したことを伝える返答が最も自然。정답은 3번 「はい、先ほど完了しました」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000025', 'いいえ、発注はキャンセルしてください。', false, 1),
('adc20004-0000-0000-0000-000000000025', 'ええ、明日発注する予定です。', false, 2),
('adc20004-0000-0000-0000-000000000025', 'はい、先ほど完了しました。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000026',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：今度の休みに、久しぶりに山登りに行きませんか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '誘いの言葉に対して、快く応じる返答が最も自然。정답은 1번 「いいですね、ぜひ行きましょう」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000026', 'いいですね、ぜひ行きましょう。', true, 1),
('adc20004-0000-0000-0000-000000000026', 'はい、山登りはもう終わりました。', false, 2),
('adc20004-0000-0000-0000-000000000026', 'いいえ、休みは仕事です。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000027',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'男：さっきの説明、ちょっと分かりにくかったかもしれません。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '説明への配慮を示された側として、理解できたことを伝えて安心させる返答が最も自然。정답은 2번 「いえ、大丈夫です。よく理解できましたよ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000027', 'はい、もう一度説明していただけますか。', false, 1),
('adc20004-0000-0000-0000-000000000027', 'いえ、大丈夫です。よく理解できましたよ。', true, 2),
('adc20004-0000-0000-0000-000000000027', 'いいえ、説明を聞いていませんでした。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000028',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'女：コーヒーと紅茶、どちらになさいますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  28,
  '選択を尋ねる質問に対して、希望をはっきり伝える返答が最も自然。정답은 3번 「コーヒーをお願いします」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000028', 'はい、飲み物は結構です。', false, 1),
('adc20004-0000-0000-0000-000000000028', 'いいえ、まだ注文していません。', false, 2),
('adc20004-0000-0000-0000-000000000028', 'コーヒーをお願いします。', true, 3);

-- ============================================================
-- 問題5 統合理解 (LISTENING_INTEGRATED) — 4問 (sort_order 29-32)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000029',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'大学のロビーで男女の学生が話しています。\n\n男：来週の期末テストに向けて、勉強会をしようと思うんだけど、参加する？\n女：いいね、参加したい。場所はどこにするの？\n男：図書館のグループ学習室を考えてるんだけど、来週は予約がいっぱいで取れなくて。\n女：そうなんだ。じゃあカフェは？\n男：カフェもいいけど、私語ができないくらい静かな場所がいいんだよね、集中したいから。\n女：うーん、じゃあ大学の自習室はどう？予約はいらないし、静かだし。\n男：あ、それいいね。でも席数が少ないから、早めに行かないと座れないかも。\n女：じゃあ、授業が終わってすぐの3時に集合しようよ。\n男：うん、それで行こう。あと、飲み物とお菓子は持ち込みOKだよね？\n女：たぶん大丈夫だと思うけど、念のため確認しておくね。\n\n質問：二人が勉強会の場所を決めた理由として、会話の内容に合っているものはどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '自習室は予約が不要で静かなため集中できると判断された。図書館は予約が取れず、カフェは静かさの点で不十分だった。정답은 3번 「静かで予約が不要な自習室なら集中して勉強できるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000029', '図書館のグループ学習室が予約できたから', false, 1),
('adc20004-0000-0000-0000-000000000029', 'カフェの方が飲食しながら勉強できるから', false, 2),
('adc20004-0000-0000-0000-000000000029', '静かで予約が不要な自習室なら集中して勉強できるから', true, 3),
('adc20004-0000-0000-0000-000000000029', '自習室は席数が多く誰でも座れるから', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000030',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'夫婦が新しい住まいについて話しています。\n\n妻：そろそろ引っ越し先を決めないとね。条件、もう一度確認しておこうか。\n夫：うん。まず駅から徒歩10分以内がいいよね、通勤に便利だから。\n妻：それと、うちはネコを飼ってるから、ペット可の物件じゃないと。\n夫：そうだね。あと家賃は月13万円以内に抑えたいな。\n妻：13万円か…。駅近でペット可だと、ちょっと厳しいかもしれないね。\n夫：じゃあ、駅からの距離を少し妥協して、徒歩15分くらいまで広げてみようか。\n妻：うん、それなら選択肢が増えそうね。あ、あと2階以上の部屋がいいな、防犯的に。\n夫：それも大事だね。不動産屋にその条件で探してもらおう。\n\n質問：夫婦が最終的に決めた住まいの条件はどれですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '当初の徒歩10分以内という条件は、家賃13万円以内・ペット可と両立させるため徒歩15分以内に広げられ、さらに防犯のため2階以上という条件が加わった。정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000030', '駅から徒歩10分以内・ペット可・家賃13万円以内・1階', false, 1),
('adc20004-0000-0000-0000-000000000030', '駅から徒歩15分以内・ペット可・家賃13万円以内・2階以上', true, 2),
('adc20004-0000-0000-0000-000000000030', '駅から徒歩15分以内・ペット不可・家賃10万円以内・2階以上', false, 3),
('adc20004-0000-0000-0000-000000000030', '駅から徒歩10分以内・ペット可・家賃15万円以内・2階以上', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000031',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'テレビ番組でコメンテーターのAさんとBさんが話しています。\n\n司会：今日は「働き方改革」についてお二人に伺います。まずAさん、長時間労働についてはどうお考えですか。\nAさん（男）：長時間労働そのものを減らすことも大事ですが、それだけでは根本的な解決にならないと思うんです。大事なのは、成果をどう評価するか。時間ではなく成果で評価する仕組みに変えないと、結局みんな長く会社にいることが評価されてしまう。\nBさん（女）：私も同感です。それに加えて、上司が率先して定時に帰る姿を見せることも重要だと思います。上司が遅くまで残っていると、部下も帰りにくいですから。\nAさん：おっしゃる通りです。制度を変えるだけでなく、職場の雰囲気や評価の仕組み自体を見直す必要がありますね。\nBさん：ええ。個人の意識だけに頼るのではなく、組織全体で取り組むべき課題だと思います。\n司会：お二人に共通しているのは、制度や仕組みそのものを変える必要があるということですね。\n\n質問：AさんとBさんが共通して述べていることは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  31,
  'Aさんは「成果で評価する仕組みに変える必要がある」、Bさんは「上司が率先して定時に帰る姿を見せることが重要」「組織全体で取り組むべき課題だ」と述べ、両者とも個人の意識だけでなく評価制度や職場の仕組み自体を変える必要があるという点で一致している。정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000031', '長時間労働している社員を高く評価するべきだ', false, 1),
('adc20004-0000-0000-0000-000000000031', '上司はできるだけ長く会社に残るべきだ', false, 2),
('adc20004-0000-0000-0000-000000000031', '個人の意識だけでなく評価制度や職場の仕組み自体を変える必要がある', true, 3),
('adc20004-0000-0000-0000-000000000031', '働き方改革は個人の努力だけで実現できる', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc20004-0000-0000-0000-000000000032',
  'ad000002-0000-0000-0000-000000000243',
  'audio_listening',
  E'会社で忘年会の会場について社員が話しています。\n\n田中：来月の忘年会なんですが、会場の候補、2つに絞りました。駅前の居酒屋「花月」と、少し離れた個室のあるレストラン「風月」です。\n山田：花月は近くていいですよね、でも去年もそこでしたよね。\n田中：そうなんです。ただ、風月は個室で、周りを気にせずゆっくり話せるのが魅力で。\n佐藤：でも風月って駅から少し歩きますよね。雨の日とか大変じゃないですか。\n木村：花月は席が半個室で、隣の席の声が結構聞こえるって聞いたことがあります。\n田中：たしかに、去年参加した人からも「ちょっと落ち着かなかった」という声がありました。\n佐藤：それなら、多少歩いても、静かに話せる風月の方がいいかもしれませんね。\n木村：ええ、忘年会って、みんなでゆっくり一年を振り返る場でもありますし。\n田中：なるほど。それなら、風月に決めましょうか。\n\n質問：風月が選ばれた最も大きな理由は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  32,
  '風月が選ばれた決め手は「個室で周りを気にせずゆっくり話せる」という点。花月は隣の席の声が聞こえて落ち着かないという問題があった。정답은 2번 「個室で周りを気にせず落ち着いて話せるから」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc20004-0000-0000-0000-000000000032', '駅から近くて雨の日でも行きやすいから', false, 1),
('adc20004-0000-0000-0000-000000000032', '個室で周りを気にせず落ち着いて話せるから', true, 2),
('adc20004-0000-0000-0000-000000000032', '去年利用していない新しい店だから', false, 3),
('adc20004-0000-0000-0000-000000000032', '花月より料金が安いから', false, 4);
