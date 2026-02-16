-- ============================================
-- J-Bridge Seed Data: ビジネスリテラシー Assessment Expansion
-- Quiz: a0000005-0000-0000-0000-000000000005
-- 120 new questions (sort_order 31-150)
-- Categories: business_manner(29), communication(26), cross_culture(28), security(37)
-- ============================================

DO $$
DECLARE q_id UUID;
BEGIN

-- ===== BUSINESS_MANNER (29 questions, sort_order 31-59) =====
-- Topics: 挨拶, 名刺交換, 敬語使用, 電話応対, お辞儀, 席順, 身だしなみ, 贈答マナー, 来客対応

-- Q31 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '来客にお茶を出す際の正しいマナーはどれか。', 'お茶は上座の方（お客様）から順に出し、茶碗の柄が相手の正面に来るように置きます。', 1, 31, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分に近い人から順に出す', FALSE, 1),
  (gen_random_uuid(), q_id, '上座の方（お客様）から順に出す', TRUE, 2),
  (gen_random_uuid(), q_id, '全員分を一度にテーブルの中央に置く', FALSE, 3),
  (gen_random_uuid(), q_id, '役職の低い人から順に出す', FALSE, 4);

-- Q32 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'エレベーターで上司や来客と一緒の場合、正しい行動はどれか。', '後輩や部下がボタン操作を担当し、上司や来客が先に乗り降りできるよう配慮します。', 1, 32, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '先に入って奥に立つ', FALSE, 1),
  (gen_random_uuid(), q_id, '何もせず一緒に乗り降りする', FALSE, 2),
  (gen_random_uuid(), q_id, 'ボタン操作を担当し、上司・来客を先に乗降させる', TRUE, 3),
  (gen_random_uuid(), q_id, '来客に操作パネルの近くに立ってもらう', FALSE, 4);

-- Q33 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '受け取った名刺の正しい扱い方はどれか。', '受け取った名刺はすぐにポケットにしまわず、テーブルの上に丁寧に置きます。名刺にメモを書くのは失礼です。', 1, 33, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'すぐに名刺入れに収納して保管する', FALSE, 1),
  (gen_random_uuid(), q_id, '名刺の裏にメモを書いて整理する', FALSE, 2),
  (gen_random_uuid(), q_id, 'テーブルの上に丁寧に置く', TRUE, 3),
  (gen_random_uuid(), q_id, 'ポケットに入れて後で確認する', FALSE, 4);

-- Q34 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'タクシーでの上座はどこか。', 'タクシーでは運転席の後ろが上座です。助手席は最も下座にあたります。', 1, 34, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '助手席', FALSE, 1),
  (gen_random_uuid(), q_id, '運転席の後ろ', TRUE, 2),
  (gen_random_uuid(), q_id, '後部座席の真ん中', FALSE, 3),
  (gen_random_uuid(), q_id, '助手席の後ろ', FALSE, 4);

-- Q35 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で身だしなみとして禁止されているものはどれか。', '過度のアクセサリーや度の過ぎた茶髪・長髪は原則禁止です。', 1, 35, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '清潔感のあるスーツの着用', FALSE, 1),
  (gen_random_uuid(), q_id, '過度のアクセサリーや派手な茶髪', TRUE, 2),
  (gen_random_uuid(), q_id, '会社指定のユニフォーム着用', FALSE, 3),
  (gen_random_uuid(), q_id, 'ビジネスカジュアルの服装', FALSE, 4);

-- Q36 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会社の備品や設備を使用する際の正しいルールはどれか。', '許可なく職務以外の目的で施設・物品等を使用してはなりません。', 1, 36, 'easy', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '業務時間外なら私的に使用してもよい', FALSE, 1),
  (gen_random_uuid(), q_id, '短時間であれば私的使用も許される', FALSE, 2),
  (gen_random_uuid(), q_id, '許可なく職務以外の目的で使用してはならない', TRUE, 3),
  (gen_random_uuid(), q_id, '同僚に了解を得れば使用できる', FALSE, 4);

-- Q37 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '電話応対で相手の名前を聞き取れなかった場合の適切な対応はどれか。', '「恐れ入りますが、もう一度お名前を伺ってもよろしいでしょうか」と丁寧に聞き直します。', 1, 37, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '聞こえたふりをしてそのまま対応する', FALSE, 1),
  (gen_random_uuid(), q_id, '「もう一度言ってください」と直接聞く', FALSE, 2),
  (gen_random_uuid(), q_id, '「恐れ入りますが、もう一度お名前を伺ってもよろしいでしょうか」と聞く', TRUE, 3),
  (gen_random_uuid(), q_id, '担当者に取り次いで確認してもらう', FALSE, 4);

-- Q38 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '名刺交換で自分が相手より役職が低い場合の正しいマナーはどれか。', '目下の者が先に名刺を差し出し、相手の名刺より低い位置で渡すのがマナーです。', 1, 38, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '相手が先に名刺を出すのを待つ', FALSE, 1),
  (gen_random_uuid(), q_id, '同時に交換して地位の差を感じさせない', FALSE, 2),
  (gen_random_uuid(), q_id, '自分が先に名刺を差し出し、低い位置で渡す', TRUE, 3),
  (gen_random_uuid(), q_id, '上司に代わりに名刺を渡してもらう', FALSE, 4);

-- Q39 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '敬語で「見る」の尊敬語として正しいものはどれか。', '「ご覧になる」は「見る」の尊敬語です。「拝見する」は謙譲語になります。', 1, 39, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '拝見する（謙譲語）', FALSE, 1),
  (gen_random_uuid(), q_id, 'ご覧になる', TRUE, 2),
  (gen_random_uuid(), q_id, '見られる（受身形）', FALSE, 3),
  (gen_random_uuid(), q_id, 'お見えになる（「来る」の尊敬語）', FALSE, 4);

-- Q40 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '電話で担当者が不在の場合の適切な対応はどれか。', '担当者不在時は、折り返しの連絡を提案し、相手の連絡先と用件をメモして担当者に伝えます。', 1, 40, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '「また後でかけてください」と伝える', FALSE, 1),
  (gen_random_uuid(), q_id, '担当者の携帯番号を教える', FALSE, 2),
  (gen_random_uuid(), q_id, '折り返しの連絡を提案し、用件と連絡先をメモする', TRUE, 3),
  (gen_random_uuid(), q_id, '他の社員に無断で取り次ぐ', FALSE, 4);

-- Q41 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスで贈答品を渡す際のマナーとして正しいものはどれか。', '贈答品を渡す際は「つまらないものですが」と謙遜表現を添えるのが日本の伝統的なマナーです。', 1, 41, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '高価な品であることをアピールして渡す', FALSE, 1),
  (gen_random_uuid(), q_id, '「つまらないものですが」と謙遜表現を添えて渡す', TRUE, 2),
  (gen_random_uuid(), q_id, '相手の前で包装を開けて中身を見せる', FALSE, 3),
  (gen_random_uuid(), q_id, '贈答品の値段を伝えて感謝を示す', FALSE, 4);

-- Q42 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '来客対応で応接室に案内する際の正しい行動はどれか。', '来客を案内する際は、少し前を歩いて道案内をし、ドアを開けて先に入っていただきます。', 1, 42, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '来客の後ろを歩いて道順を口頭で案内する', FALSE, 1),
  (gen_random_uuid(), q_id, '来客の少し前を歩き、ドアを開けて先に入っていただく', TRUE, 2),
  (gen_random_uuid(), q_id, '地図を渡して自分で行ってもらう', FALSE, 3),
  (gen_random_uuid(), q_id, '来客と並んで歩きながら案内する', FALSE, 4);

-- Q43 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '敬語で「行く」の謙譲語として正しいものはどれか。', '「参る」「伺う」は「行く」の謙譲語です。「いらっしゃる」は尊敬語になります。', 1, 43, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'いらっしゃる（尊敬語）', FALSE, 1),
  (gen_random_uuid(), q_id, '行かれる（受身形）', FALSE, 2),
  (gen_random_uuid(), q_id, '参る・伺う', TRUE, 3),
  (gen_random_uuid(), q_id, 'お行きになる', FALSE, 4);

-- Q44 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会議室での上座の位置として正しいものはどれか。', '出入口から最も遠い席が上座です。上位の役職者や来客が座ります。', 1, 44, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '出入口に最も近い席', FALSE, 1),
  (gen_random_uuid(), q_id, 'ホワイトボードの正面の席', FALSE, 2),
  (gen_random_uuid(), q_id, '出入口から最も遠い席', TRUE, 3),
  (gen_random_uuid(), q_id, '窓側の席', FALSE, 4);

-- Q45 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '所持品検査がある場合の正しい対応はどれか。', '所持品の検査がある場合は、抜き打ち検査であっても当然これに従わなければなりません。', 1, 45, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '事前通知がなければ拒否できる', FALSE, 1),
  (gen_random_uuid(), q_id, '抜き打ち検査であっても従う', TRUE, 2),
  (gen_random_uuid(), q_id, '組合に確認してから対応する', FALSE, 3),
  (gen_random_uuid(), q_id, '個人の権利として検査を断れる', FALSE, 4);

-- Q46 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスで「すみません」が使われる場面として正しくないものはどれか。', '「すみません」は謝罪だけでなく、感謝やお願いの前置きとしても使われる多機能な表現です。', 1, 46, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '謝罪の場面', FALSE, 1),
  (gen_random_uuid(), q_id, '感謝を伝える場面', FALSE, 2),
  (gen_random_uuid(), q_id, 'お願いの前置きとして', FALSE, 3),
  (gen_random_uuid(), q_id, '部下を叱責する場面', TRUE, 4);

-- Q47 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '複数の来客に名刺交換する場合の正しい順序はどれか。', '複数人での名刺交換は、役職の高い方から順に行います。相手の組織の序列を尊重することがマナーです。', 1, 47, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分に近い人から順に交換する', FALSE, 1),
  (gen_random_uuid(), q_id, '全員同時に交換して効率を上げる', FALSE, 2),
  (gen_random_uuid(), q_id, '相手側の役職の高い方から順に交換する', TRUE, 3),
  (gen_random_uuid(), q_id, '年齢の高い人から順に交換する', FALSE, 4);

-- Q48 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ビジネスメールで「お忙しいところ恐れ入りますが」という表現を使う理由はどれか。', 'この前置き表現は相手への配慮を示すクッション言葉であり、依頼や質問の前に使うことで丁寧さを表現します。', 1, 48, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '形式的な挨拶として文頭に必ず入れるもの', FALSE, 1),
  (gen_random_uuid(), q_id, '相手が本当に忙しい時のみ使う表現', FALSE, 2),
  (gen_random_uuid(), q_id, '相手への配慮を示すクッション言葉として依頼・質問の前に使う', TRUE, 3),
  (gen_random_uuid(), q_id, '返信を急がせるためのプレッシャー表現', FALSE, 4);

-- Q49 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で取引先との食事会の際、注文のマナーとして正しいものはどれか。', '接待の場では、主催者側がメニューを提案し、相手の好みを確認しつつ、相手より高価なものを注文しないのがマナーです。', 1, 49, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分の好きなものを自由に注文する', FALSE, 1),
  (gen_random_uuid(), q_id, '最も安いメニューを選んで謙虚さを示す', FALSE, 2),
  (gen_random_uuid(), q_id, '相手の好みを確認し、相手より高価なものを注文しない', TRUE, 3),
  (gen_random_uuid(), q_id, '全員同じメニューを注文して統一感を出す', FALSE, 4);

-- Q50 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '敬語で自社の社長を社外の人に紹介する際の正しい表現はどれか。', '社外の人に対しては自社の人間には謙譲語を使います。「弊社の○○でございます」が正しい表現です。', 1, 50, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '「弊社の社長の○○でございます」（謙譲表現）', TRUE, 1),
  (gen_random_uuid(), q_id, '「うちの○○社長です」（カジュアル表現）', FALSE, 2),
  (gen_random_uuid(), q_id, '「○○社長がいらっしゃいます」（尊敬語）', FALSE, 3),
  (gen_random_uuid(), q_id, '「社長の○○様です」（敬称付き）', FALSE, 4);

-- Q51 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'お辞儀の角度と場面の組み合わせとして正しいものはどれか。', '会釈15度は廊下でのすれ違い、敬礼30度は一般的な挨拶、最敬礼45度はお詫びや深い感謝です。', 1, 51, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '会釈30度（廊下）、敬礼45度（挨拶）、最敬礼90度（謝罪）', FALSE, 1),
  (gen_random_uuid(), q_id, '会釈15度（すれ違い）、敬礼30度（一般挨拶）、最敬礼45度（お詫び）', TRUE, 2),
  (gen_random_uuid(), q_id, '会釈15度（謝罪）、敬礼45度（すれ違い）、最敬礼30度（挨拶）', FALSE, 3),
  (gen_random_uuid(), q_id, '会釈10度（すれ違い）、敬礼20度（挨拶）、最敬礼30度（感謝）', FALSE, 4);

-- Q52 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '取引先からの贈答品を受け取った場合の適切な対応はどれか。', '職務に関して金品の贈与を受けることは禁止されているため、会社のルールに従い対応する必要があります。', 1, 52, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '個人的にお礼を言って受け取る', FALSE, 1),
  (gen_random_uuid(), q_id, '会社のルールに従い、上司に報告して指示を仰ぐ', TRUE, 2),
  (gen_random_uuid(), q_id, '同額程度のお返しをすれば受け取ってよい', FALSE, 3),
  (gen_random_uuid(), q_id, 'お菓子程度なら報告不要で受け取れる', FALSE, 4);

-- Q53 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '電話応対で保留にする際の適切な対応はどれか。', '保留は30秒以内を目安とし、長くなる場合は折り返しを提案するのがマナーです。', 1, 53, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '担当者が見つかるまで何分でも保留にする', FALSE, 1),
  (gen_random_uuid(), q_id, '保留にせず直接スピーカーフォンで確認する', FALSE, 2),
  (gen_random_uuid(), q_id, '30秒以内を目安とし、長くなる場合は折り返しを提案する', TRUE, 3),
  (gen_random_uuid(), q_id, '保留中に他の電話に対応してから戻る', FALSE, 4);

-- Q54 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「整理整頓」が重視される理由として最も適切なものはどれか。', '整理整頓は業務効率、情報セキュリティ強化、プロフェッショナルな印象の全てに関わります。', 1, 54, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '上司への印象を良くするため', FALSE, 1),
  (gen_random_uuid(), q_id, '清掃スタッフの手間を減らすため', FALSE, 2),
  (gen_random_uuid(), q_id, '業務効率向上、情報セキュリティ強化、プロフェッショナルな印象のため', TRUE, 3),
  (gen_random_uuid(), q_id, '日本の文化的な習慣として形式的に行う', FALSE, 4);

-- Q55 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '構内で名札を着用する理由として正しいものはどれか。', '構内では必ず所定の名札を着用し、身分証明書は常時携帯しなければなりません。セキュリティと本人確認のために必要です。', 1, 55, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '顔を覚えてもらうため', FALSE, 1),
  (gen_random_uuid(), q_id, 'セキュリティと本人確認のため', TRUE, 2),
  (gen_random_uuid(), q_id, '社内イベントの参加者管理のため', FALSE, 3),
  (gen_random_uuid(), q_id, '部署の人数把握のため', FALSE, 4);

-- Q56 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '「ご足労おかけしますが」という表現を使う場面として正しいものはどれか。', '「ご足労」は相手がわざわざ来てくださることに対する感謝・配慮を表すクッション言葉です。', 1, 56, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分が相手の会社を訪問する時', FALSE, 1),
  (gen_random_uuid(), q_id, '相手にこちらへ来ていただく時', TRUE, 2),
  (gen_random_uuid(), q_id, '電話で連絡を取る時', FALSE, 3),
  (gen_random_uuid(), q_id, 'メールで書類を送付する時', FALSE, 4);

-- Q57 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で共用スペースの使用後に求められる行動はどれか。', '会議室や共用スペースは使用後に必ず元の状態に戻します。次の利用者のことを考えた行動が基本マナーです。', 1, 57, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '清掃担当者に連絡する', FALSE, 1),
  (gen_random_uuid(), q_id, '次の利用者に片付けを引き継ぐ', FALSE, 2),
  (gen_random_uuid(), q_id, '必ず元の状態に戻してから退室する', TRUE, 3),
  (gen_random_uuid(), q_id, '使用記録だけ残せばよい', FALSE, 4);

-- Q58 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で酒気を帯びての就業が禁じられている理由はどれか。', '酒気を帯びての就業は厳禁であり、業務品質、安全性、職場の信用を損なう行為です。', 1, 58, 'medium', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '法律で一律に禁止されているため', FALSE, 1),
  (gen_random_uuid(), q_id, '業務品質・安全性・職場の信用を損なうため', TRUE, 2),
  (gen_random_uuid(), q_id, '社内のイメージアップのため', FALSE, 3),
  (gen_random_uuid(), q_id, '健康診断に影響するため', FALSE, 4);

-- Q59 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場外での行動に関する注意事項として正しいものはどれか。', '職場外での私的な行為であっても、会社や顧客の名誉・信用を害する場合は問題となります。', 1, 59, 'hard', 'business_manner');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '職場外の行動は完全に自由である', FALSE, 1),
  (gen_random_uuid(), q_id, '休日の行動は会社と無関係である', FALSE, 2),
  (gen_random_uuid(), q_id, '私的な行為でも会社の名誉・信用を害する場合は問題となる', TRUE, 3),
  (gen_random_uuid(), q_id, 'SNSでの個人的な発信は制限されない', FALSE, 4);

-- ===== COMMUNICATION (26 questions, sort_order 60-85) =====
-- Topics: 報連相, 会議マナー, ビジネスメール, 意思決定プロセス, 議事録, チームワーク, 上司への報告

-- Q60 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ホウレンソウの「連絡」の目的として正しいものはどれか。', '連絡は関係者に必要な情報を共有し、業務の円滑な進行を支援することが目的です。', 1, 60, 'easy', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '上司に自分の成果をアピールする', FALSE, 1),
  (gen_random_uuid(), q_id, '関係者に必要な情報を共有する', TRUE, 2),
  (gen_random_uuid(), q_id, '会議の代わりにメールで議論する', FALSE, 3),
  (gen_random_uuid(), q_id, '業務の責任を分散させる', FALSE, 4);

-- Q61 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会議中にスマートフォンを使用することについて正しいものはどれか。', '会議中はスマートフォンの使用を控え、発言者に集中することがマナーです。', 1, 61, 'easy', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'メモ代わりに使用してもよい', FALSE, 1),
  (gen_random_uuid(), q_id, 'マナーモードにすれば問題ない', FALSE, 2),
  (gen_random_uuid(), q_id, '使用を控え、発言者に集中する', TRUE, 3),
  (gen_random_uuid(), q_id, '緊急連絡の確認は自由にできる', FALSE, 4);

-- Q62 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ビジネスメールの件名として適切なものはどれか。', 'ビジネスメールの件名は用件が一目で分かるように具体的かつ簡潔に書きます。', 1, 62, 'easy', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '「お疲れ様です」', FALSE, 1),
  (gen_random_uuid(), q_id, '「重要」', FALSE, 2),
  (gen_random_uuid(), q_id, '「【依頼】3/15 定例会議 議事録の確認」', TRUE, 3),
  (gen_random_uuid(), q_id, '件名なし', FALSE, 4);

-- Q63 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'チームメンバーが困っている時の適切な対応はどれか。', '同僚が忙しい時や困っている時は、自発的に助けを申し出ることが良いチームワークの表れです。', 1, 63, 'easy', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分の仕事に集中する', FALSE, 1),
  (gen_random_uuid(), q_id, '上司に報告して指示を待つ', FALSE, 2),
  (gen_random_uuid(), q_id, '自発的に助けを申し出る', TRUE, 3),
  (gen_random_uuid(), q_id, '相手から頼まれるまで待つ', FALSE, 4);

-- Q64 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '報告のタイミングとして最も適切なものはどれか。', '報告は業務の進捗や完了時だけでなく、問題発生時にも速やかに行うことが重要です。', 1, 64, 'easy', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '業務が全て完了してから', FALSE, 1),
  (gen_random_uuid(), q_id, '問題が発生した時、進捗の節目、完了時に速やかに行う', TRUE, 2),
  (gen_random_uuid(), q_id, '毎週の定例会議でまとめて報告する', FALSE, 3),
  (gen_random_uuid(), q_id, '上司に聞かれた時だけ報告する', FALSE, 4);

-- Q65 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '議事録に記載すべき最低限の項目として不適切なものはどれか。', '議事録には日時・参加者・議題・決定事項・担当者・期限を記録します。個人的な感想は不要です。', 1, 65, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '決定事項と担当者', FALSE, 1),
  (gen_random_uuid(), q_id, '次回期限とアクションアイテム', FALSE, 2),
  (gen_random_uuid(), q_id, '参加者の個人的な感想や評価', TRUE, 3),
  (gen_random_uuid(), q_id, '会議の日時と参加者', FALSE, 4);

-- Q66 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ビジネスメールでCC（カーボンコピー）とBCC（ブラインドカーボンコピー）の使い分けとして正しいものはどれか。', 'CCは関係者に情報共有する場合、BCCは他の受信者にアドレスを見せたくない場合に使います。', 1, 66, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'CCもBCCも同じ機能で好みで使い分ける', FALSE, 1),
  (gen_random_uuid(), q_id, 'CCは情報共有、BCCは他の受信者にアドレスを見せない場合に使う', TRUE, 2),
  (gen_random_uuid(), q_id, 'CCは社内向け、BCCは社外向けに使う', FALSE, 3),
  (gen_random_uuid(), q_id, 'CCは上司向け、BCCは部下向けに使う', FALSE, 4);

-- Q67 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '上司への報告で「結論ファースト」が重要な理由はどれか。', '忙しい上司に対して最初に結論を伝えることで、判断・指示が速くなり業務効率が向上します。', 1, 67, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '日本のビジネス慣習として形式的に求められるから', FALSE, 1),
  (gen_random_uuid(), q_id, '上司の判断・指示が速くなり業務効率が向上するから', TRUE, 2),
  (gen_random_uuid(), q_id, '詳細説明を省略して時間を短縮するため', FALSE, 3),
  (gen_random_uuid(), q_id, '報告の正確性を高めるため', FALSE, 4);

-- Q68 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会議で自分の意見を述べる際の適切な方法はどれか。', '日本では相手の意見を十分に聞いた上で、自分の意見を婉曲に表現することが望ましいです。', 1, 68, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '思いついたらすぐに発言して効率を上げる', FALSE, 1),
  (gen_random_uuid(), q_id, '他の人の意見を聞いてから婉曲に自分の意見を述べる', TRUE, 2),
  (gen_random_uuid(), q_id, 'データを示して論理的に反論する', FALSE, 3),
  (gen_random_uuid(), q_id, '会議後にメールで意見を送る', FALSE, 4);

-- Q69 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ミスを報告する際に含めるべき内容として最も適切なものはどれか。', 'ミス報告では事実（何が起きたか）、影響範囲、原因の推定、対応案を含めて報告します。', 1, 69, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '謝罪のみを丁寧に伝える', FALSE, 1),
  (gen_random_uuid(), q_id, '事実・影響範囲・原因の推定・対応案を含めて報告する', TRUE, 2),
  (gen_random_uuid(), q_id, 'ミスの原因となった人物名を明確にする', FALSE, 3),
  (gen_random_uuid(), q_id, '対応完了後に結果だけを報告する', FALSE, 4);

-- Q70 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で資料を配布するタイミングとして適切なものはどれか。', '会議では資料を事前に配布し、参加者が事前に読んで準備できるようにするのが望ましいです。', 1, 70, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '会議の場で初めて配布する', FALSE, 1),
  (gen_random_uuid(), q_id, '事前に配布し、参加者が準備できるようにする', TRUE, 2),
  (gen_random_uuid(), q_id, '会議後に議事録と一緒に送る', FALSE, 3),
  (gen_random_uuid(), q_id, '口頭説明のみで資料は不要', FALSE, 4);

-- Q71 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'メールの返信マナーとして正しいものはどれか。', 'ビジネスメールは24時間以内の返信が目安です。すぐに回答できない場合も受信確認だけは速やかに行います。', 1, 71, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '完全な回答ができるまで返信を待つ', FALSE, 1),
  (gen_random_uuid(), q_id, '24時間以内に返信し、すぐ回答できない場合も受信確認する', TRUE, 2),
  (gen_random_uuid(), q_id, '重要でないメールは返信不要', FALSE, 3),
  (gen_random_uuid(), q_id, '電話で回答すればメール返信は不要', FALSE, 4);

-- Q72 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'チームでの意思決定において日本企業で重視されるものはどれか。', '日本企業では全員の合意形成（コンセンサス）を重視し、時間がかかっても全員が納得する意思決定を好みます。', 1, 72, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'リーダーの迅速な判断', FALSE, 1),
  (gen_random_uuid(), q_id, '多数決による効率的な決定', FALSE, 2),
  (gen_random_uuid(), q_id, '全員の合意形成（コンセンサス）', TRUE, 3),
  (gen_random_uuid(), q_id, '専門家の意見による決定', FALSE, 4);

-- Q73 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '上司に相談する際に準備すべきものとして最も適切なものはどれか。', '相談では問題の整理と自分なりの解決案を準備してから助言を求めるのが望ましいです。', 1, 73, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '問題の状況だけを正確に伝える', FALSE, 1),
  (gen_random_uuid(), q_id, '問題の整理と自分なりの解決案', TRUE, 2),
  (gen_random_uuid(), q_id, '同僚からの意見や提案', FALSE, 3),
  (gen_random_uuid(), q_id, '過去の類似事例の調査結果', FALSE, 4);

-- Q74 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本企業で「稟議書（りんぎしょ）」を回す際に最も注意すべき点はどれか。', '稟議は関連部署と上位役職者に順次回覧するため、事前の根回しで各承認者の懸念を把握し反映させることが重要です。', 1, 74, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '文書の書式を正確に守ること', FALSE, 1),
  (gen_random_uuid(), q_id, '事前の根回しで承認者の懸念を把握し反映させること', TRUE, 2),
  (gen_random_uuid(), q_id, '最短ルートで最速の承認を得ること', FALSE, 3),
  (gen_random_uuid(), q_id, '全ての部署の承認印を集めること', FALSE, 4);

-- Q75 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のITプロジェクトで「報連相」が特に重要な場面はどれか。', 'ITプロジェクトでは仕様変更、バグ発生、スケジュール遅延など問題発生時の速やかな報連相が品質と納期を左右します。', 1, 75, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '定例ミーティングでの進捗報告', FALSE, 1),
  (gen_random_uuid(), q_id, 'コードレビューの結果共有', FALSE, 2),
  (gen_random_uuid(), q_id, '仕様変更・バグ発生・スケジュール遅延などの問題発生時', TRUE, 3),
  (gen_random_uuid(), q_id, 'リリース完了後の報告', FALSE, 4);

-- Q76 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会議で全員が沈黙している場合、その意味として最も可能性が高いものはどれか。', '日本の会議での沈黙は必ずしも同意を意味せず、反対意見を直接言いにくい場合や熟考中の可能性があります。', 1, 76, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '全員が提案に同意している', FALSE, 1),
  (gen_random_uuid(), q_id, '議題に関心がない', FALSE, 2),
  (gen_random_uuid(), q_id, '反対意見を言いにくい、または熟考中の可能性がある', TRUE, 3),
  (gen_random_uuid(), q_id, '会議が終了したと認識している', FALSE, 4);

-- Q77 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ビジネスメールで依頼を断る際の適切な表現はどれか。', '日本では直接的な拒否を避け、クッション言葉と理由を添えて婉曲に断るのがマナーです。', 1, 77, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '「できません」と明確に断る', FALSE, 1),
  (gen_random_uuid(), q_id, '「大変申し訳ございませんが、〜の事情により対応が難しい状況です」', TRUE, 2),
  (gen_random_uuid(), q_id, '返信せずに断ったことを暗示する', FALSE, 3),
  (gen_random_uuid(), q_id, '「検討します」と言って後で断る', FALSE, 4);

-- Q78 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「ネガティブな報告」を遅らせた場合のリスクとして最も深刻なものはどれか。', '問題を隠すと状況がさらに悪化し、信頼の喪失と問題の拡大につながります。早期報告が被害を最小限にします。', 1, 78, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分の評価が下がる', FALSE, 1),
  (gen_random_uuid(), q_id, '信頼の喪失と問題の拡大・深刻化', TRUE, 2),
  (gen_random_uuid(), q_id, '上司に叱責される', FALSE, 3),
  (gen_random_uuid(), q_id, 'チームの雰囲気が悪くなる', FALSE, 4);

-- Q79 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '議事録を作成する際の「WHAT/WHO/WHEN」フレームワークとは何か。', '議事録の核心は「何を決めたか（WHAT）」「誰が担当するか（WHO）」「いつまでか（WHEN）」を明確にすることです。', 1, 79, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '何を議論したか・誰が発言したか・いつ議論したか', FALSE, 1),
  (gen_random_uuid(), q_id, '何を決めたか・誰が担当するか・いつまでに完了するか', TRUE, 2),
  (gen_random_uuid(), q_id, '何が問題か・誰の責任か・いつ発生したか', FALSE, 3),
  (gen_random_uuid(), q_id, '何を報告するか・誰に報告するか・いつ報告するか', FALSE, 4);

-- Q80 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のIT企業で「暗黙知」を「形式知」に変換するために最も有効な方法はどれか。', 'ドキュメント化やナレッジベースの作成により、個人の経験・ノウハウをチーム全体で共有可能にします。', 1, 80, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'ベテラン社員による口頭での引き継ぎ', FALSE, 1),
  (gen_random_uuid(), q_id, 'OJT（現場教育）の実施', FALSE, 2),
  (gen_random_uuid(), q_id, 'ドキュメント化・ナレッジベースの作成', TRUE, 3),
  (gen_random_uuid(), q_id, '定期的な飲み会での情報交換', FALSE, 4);

-- Q81 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で「検討させていただきます」という返答の真意として最も可能性が高いものはどれか。', '「検討します」は婉曲的な断りの場合が多く、前向きな検討とは限りません。文脈と表情を読むことが重要です。', 1, 81, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '前向きに実施を検討するという積極的な回答', FALSE, 1),
  (gen_random_uuid(), q_id, '婉曲的な断りの可能性があり、文脈の確認が必要', TRUE, 2),
  (gen_random_uuid(), q_id, '社内の承認プロセスを経てから回答するという意味', FALSE, 3),
  (gen_random_uuid(), q_id, '追加の資料や情報を求めているという意味', FALSE, 4);

-- Q82 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'チームの和を保ちつつ異なる意見を伝える最も効果的な方法はどれか。', '建設的な代替案を提示することで、直接的な反論を避けつつ、チームの議論を前進させることができます。', 1, 82, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '黙って多数派に従う', FALSE, 1),
  (gen_random_uuid(), q_id, '相手の意見を認めた上で建設的な代替案を提示する', TRUE, 2),
  (gen_random_uuid(), q_id, '匿名でフィードバックを提出する', FALSE, 3),
  (gen_random_uuid(), q_id, '会議後に個別に反対意見をメールで送る', FALSE, 4);

-- Q83 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ビジネスメールで添付ファイルを送る際の注意点として正しいものはどれか。', '大きなファイルをメールに添付して送ることは避け、容量制限を意識します。', 1, 83, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '圧縮せずにそのまま送る', FALSE, 1),
  (gen_random_uuid(), q_id, '容量の大きなファイルはメール添付を避ける', TRUE, 2),
  (gen_random_uuid(), q_id, '複数のメールに分割して送る', FALSE, 3),
  (gen_random_uuid(), q_id, '添付ファイルの内容は本文で説明不要', FALSE, 4);

-- Q84 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'リモートワーク環境での報連相の課題として最も重要なものはどれか。', 'リモートワークでは対面でのコミュニケーションが減るため、意図的・定期的な情報共有の仕組みが必要です。', 1, 84, 'hard', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'ツールの使い方が複雑', FALSE, 1),
  (gen_random_uuid(), q_id, '対面機会の減少により意図的な情報共有の仕組みが必要', TRUE, 2),
  (gen_random_uuid(), q_id, '業務時間の管理が難しい', FALSE, 3),
  (gen_random_uuid(), q_id, 'セキュリティの確保', FALSE, 4);

-- Q85 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本企業でメールの「全員返信」を使う際の注意点はどれか。', '全員返信は必要な場合のみ使い、不要な人に大量のメールが届かないよう配慮することが重要です。', 1, 85, 'medium', 'communication');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '常に全員返信を使って情報共有する', FALSE, 1),
  (gen_random_uuid(), q_id, '必要な場合のみ使い、不要な宛先への配信を避ける', TRUE, 2),
  (gen_random_uuid(), q_id, '全員返信は禁止されている', FALSE, 3),
  (gen_random_uuid(), q_id, '上司がCCに入っている場合のみ使う', FALSE, 4);

-- ===== CROSS_CULTURE (28 questions, sort_order 86-113) =====
-- Topics: 根回し, 建前/本音, 空気を読む, 稟議制度, 和を重んじる文化, 年功序列, 終身雇用, 韓日文化比較

-- Q86 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「年功序列（ねんこうじょれつ）」とは何か。', '年功序列は年齢や勤続年数に応じて昇進・昇給する日本の伝統的な人事制度です。', 1, 86, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '成果主義に基づく評価制度', FALSE, 1),
  (gen_random_uuid(), q_id, '年齢や勤続年数に応じて昇進・昇給する制度', TRUE, 2),
  (gen_random_uuid(), q_id, '年齢の高い社員が新人を教育する制度', FALSE, 3),
  (gen_random_uuid(), q_id, '定年退職後の再雇用制度', FALSE, 4);

-- Q87 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「和（わ）」を大切にするとはどういう意味か。', 'チーム全体の調和と協力を重視し、個人の意見よりもグループの一体感を優先する文化です。', 1, 87, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '全員が同じ意見を持つこと', FALSE, 1),
  (gen_random_uuid(), q_id, 'チームの調和と協力を重視すること', TRUE, 2),
  (gen_random_uuid(), q_id, '争いを完全に避けること', FALSE, 3),
  (gen_random_uuid(), q_id, '上司の指示に無条件に従うこと', FALSE, 4);

-- Q88 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「終身雇用（しゅうしんこよう）」制度の説明として正しいものはどれか。', '終身雇用は一つの会社に定年まで勤務する日本の伝統的な雇用慣行です。近年は変化しつつあります。', 1, 88, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '契約期間を定めない正社員雇用制度', FALSE, 1),
  (gen_random_uuid(), q_id, '一つの会社に定年まで勤務する伝統的な雇用慣行', TRUE, 2),
  (gen_random_uuid(), q_id, '全ての社員に生涯の給与を保障する制度', FALSE, 3),
  (gen_random_uuid(), q_id, '定年がなく一生働ける制度', FALSE, 4);

-- Q89 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の文化で「暗黙の了解」が多い理由として最も適切なものはどれか。', '日本はハイコンテクスト文化であり、共有された背景知識や暗黙の理解に依存するコミュニケーションスタイルを持ちます。', 1, 89, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '言葉で表現するのが苦手だから', FALSE, 1),
  (gen_random_uuid(), q_id, 'ハイコンテクスト文化で共有背景知識に依存するから', TRUE, 2),
  (gen_random_uuid(), q_id, '効率を重視して説明を省略するから', FALSE, 3),
  (gen_random_uuid(), q_id, '機密情報が多いため言葉にしないから', FALSE, 4);

-- Q90 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国と日本の上下関係の違いとして正しいものはどれか。', '韓国では年齢に基づく上下関係が強い一方、日本では年齢に加えて入社年次や役職が重要な要素です。', 1, 90, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '韓日とも年齢が唯一の基準', FALSE, 1),
  (gen_random_uuid(), q_id, '韓国は年齢中心、日本は年齢に加え入社年次・役職も重要', TRUE, 2),
  (gen_random_uuid(), q_id, '日本は韓国より上下関係が緩やか', FALSE, 3),
  (gen_random_uuid(), q_id, '両国とも実力主義で上下関係は希薄', FALSE, 4);

-- Q91 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「飲みニケーション」とは何か。', '飲みニケーションは仕事後の飲み会を通じて親睦を深め、業務では話しにくいことを共有する日本独特の文化です。', 1, 91, 'easy', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '会社主催の公式パーティー', FALSE, 1),
  (gen_random_uuid(), q_id, '仕事後の飲み会を通じた親睦とコミュニケーション', TRUE, 2),
  (gen_random_uuid(), q_id, '昼食時のチームミーティング', FALSE, 3),
  (gen_random_uuid(), q_id, 'オンラインでの社交イベント', FALSE, 4);

-- Q92 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のIT企業で「カイゼン（改善）」文化が意味するものはどれか。', 'カイゼンは現場レベルで継続的に小さな改善を積み重ねる日本の品質管理哲学です。', 1, 92, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '大規模なシステム刷新プロジェクト', FALSE, 1),
  (gen_random_uuid(), q_id, '現場レベルで継続的に小さな改善を積み重ねること', TRUE, 2),
  (gen_random_uuid(), q_id, '外部コンサルタントによる業務改革', FALSE, 3),
  (gen_random_uuid(), q_id, '不良品を出さないための品質検査制度', FALSE, 4);

-- Q93 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「以心伝心（いしんでんしん）」とは何を意味するか。', '以心伝心は言葉を使わずに心と心で通じ合うことを意味し、日本の間接的コミュニケーション文化の核心概念です。', 1, 93, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '心理学に基づくカウンセリング技法', FALSE, 1),
  (gen_random_uuid(), q_id, '言葉を使わずに心と心で通じ合うこと', TRUE, 2),
  (gen_random_uuid(), q_id, 'テレパシーのような超自然的な能力', FALSE, 3),
  (gen_random_uuid(), q_id, 'チームビルディングのための研修プログラム', FALSE, 4);

-- Q94 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本企業で「残業」に対する伝統的な認識はどれか。', '日本では長時間労働が「頑張り」の証とされてきましたが、近年は働き方改革で変化しています。', 1, 94, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '非効率の証として否定的に見られる', FALSE, 1),
  (gen_random_uuid(), q_id, '伝統的には「頑張り」の証だが、近年は改革が進んでいる', TRUE, 2),
  (gen_random_uuid(), q_id, '法律で厳しく制限されており滅多にない', FALSE, 3),
  (gen_random_uuid(), q_id, '管理職のみに求められるもの', FALSE, 4);

-- Q95 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国人が日本の職場で「根回し」に違和感を感じる理由として最も適切なものはどれか。', '韓国はトップダウンの迅速な意思決定に慣れているため、事前調整に時間をかける根回しが非効率に感じられることがあります。', 1, 95, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '韓国に同様の文化がないから', FALSE, 1),
  (gen_random_uuid(), q_id, 'トップダウンの迅速な意思決定に慣れており、非効率に感じるから', TRUE, 2),
  (gen_random_uuid(), q_id, '非公式な活動は倫理的に問題があると考えるから', FALSE, 3),
  (gen_random_uuid(), q_id, '個人の意見を隠す行為だと考えるから', FALSE, 4);

-- Q96 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「お中元・お歳暮」文化がビジネスに与える影響はどれか。', 'お中元・お歳暮は取引先との関係維持に重要で、感謝を表現する日本のビジネス慣行の一つです。', 1, 96, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '賄賂に当たるため禁止されている', FALSE, 1),
  (gen_random_uuid(), q_id, '取引先との関係維持・感謝表現として重要な慣行', TRUE, 2),
  (gen_random_uuid(), q_id, '個人間のみの習慣でビジネスには無関係', FALSE, 3),
  (gen_random_uuid(), q_id, '若い世代ではほぼ廃止されている', FALSE, 4);

-- Q97 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「空気を読む」ことが特に求められる場面はどれか。', '会議での発言タイミング、上司の意図の理解、チーム内の雰囲気の把握など、多くの場面で空気を読む力が求められます。', 1, 97, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '技術的な議論をする場面', FALSE, 1),
  (gen_random_uuid(), q_id, '会議での発言タイミングや上司の意図を理解する場面', TRUE, 2),
  (gen_random_uuid(), q_id, '書類を作成する場面', FALSE, 3),
  (gen_random_uuid(), q_id, 'プログラミングをする場面', FALSE, 4);

-- Q98 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本企業の「新入社員研修」の主な目的はどれか。', '新入社員研修は業務スキルだけでなく、企業文化・マナー・チームワークの基盤を作る重要な機会です。', 1, 98, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '専門技術の即戦力化', FALSE, 1),
  (gen_random_uuid(), q_id, '企業文化・マナー・チームワークの基盤を作ること', TRUE, 2),
  (gen_random_uuid(), q_id, '適性を見て配属先を決めるため', FALSE, 3),
  (gen_random_uuid(), q_id, '法律で義務付けられているため', FALSE, 4);

-- Q99 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国と日本のフィードバックの違いとして正しいものはどれか。', '韓国は比較的直接的なフィードバックを好みますが、日本では間接的で婉曲的なフィードバックが一般的です。', 1, 99, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '両国ともに直接的なフィードバックを好む', FALSE, 1),
  (gen_random_uuid(), q_id, '韓国は直接的、日本は間接的で婉曲的なフィードバックが一般的', TRUE, 2),
  (gen_random_uuid(), q_id, '日本の方が韓国より厳しいフィードバックをする', FALSE, 3),
  (gen_random_uuid(), q_id, '両国ともフィードバックは書面でのみ行う', FALSE, 4);

-- Q100 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「先輩・後輩」関係が職場に与える影響はどれか。', '先輩が後輩を指導・サポートする文化があり、OJTの基盤となっています。', 1, 100, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '厳格な上下関係で自由な議論を妨げる', FALSE, 1),
  (gen_random_uuid(), q_id, '先輩が後輩を指導・サポートし、OJTの基盤となる', TRUE, 2),
  (gen_random_uuid(), q_id, '形式的な関係で実質的な影響はない', FALSE, 3),
  (gen_random_uuid(), q_id, '競争を促進して成長を加速させる', FALSE, 4);

-- Q101 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「察する文化」がITプロジェクトの要件定義に与える影響はどれか。', '察する文化では要件が明示されないことがあり、確認不足で認識のズレが生じるリスクがあります。明確な確認が重要です。', 1, 101, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '要件が曖昧になりやすく確認を怠ると認識のズレが生じる', TRUE, 1),
  (gen_random_uuid(), q_id, '要件定義が不要になり開発が効率化される', FALSE, 2),
  (gen_random_uuid(), q_id, '顧客のニーズを正確に察知でき品質が向上する', FALSE, 3),
  (gen_random_uuid(), q_id, '要件定義書が不要で口頭確認だけで済む', FALSE, 4);

-- Q102 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「建前」文化の中で、取引先の本当の意図を把握する方法として最も効果的なものはどれか。', '直接的な言葉だけでなく、行動パターン、返答のスピード、表情などの非言語的手がかりを総合的に読み取ることが重要です。', 1, 102, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '直接的に「本音を教えてください」と聞く', FALSE, 1),
  (gen_random_uuid(), q_id, '契約書の文言を精査する', FALSE, 2),
  (gen_random_uuid(), q_id, '非言語的手がかり（行動・返答速度・表情）を総合的に読み取る', TRUE, 3),
  (gen_random_uuid(), q_id, '第三者を介して情報を収集する', FALSE, 4);

-- Q103 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国人エンジニアが日本のチームで「遠慮」の文化に適応するために最も重要なことはどれか。', '「遠慮」は他人への配慮であり、自分の主張を控えめにすることです。直接的すぎる表現は避けつつ、適切に意見を伝えるバランスが必要です。', 1, 103, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '全く自分の意見を言わない', FALSE, 1),
  (gen_random_uuid(), q_id, '直接的表現を避けつつ適切に意見を伝えるバランスを取る', TRUE, 2),
  (gen_random_uuid(), q_id, '韓国式の直接的なコミュニケーションを貫く', FALSE, 3),
  (gen_random_uuid(), q_id, '上司にのみ意見を伝える', FALSE, 4);

-- Q104 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本企業の「ボトムアップ型」意思決定の利点と課題の組み合わせとして正しいものはどれか。', '現場の意見が反映され実行力が高い一方、合意形成に時間がかかるのが課題です。', 1, 104, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '利点：意思決定が速い ／ 課題：現場の声が届かない', FALSE, 1),
  (gen_random_uuid(), q_id, '利点：現場の意見が反映され実行力が高い ／ 課題：合意形成に時間がかかる', TRUE, 2),
  (gen_random_uuid(), q_id, '利点：責任の所在が明確 ／ 課題：個人の負担が大きい', FALSE, 3),
  (gen_random_uuid(), q_id, '利点：革新的なアイデアが出やすい ／ 課題：コストが高い', FALSE, 4);

-- Q105 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「お客様は神様です」という考え方がIT業界に与える影響はどれか。', '顧客志向が非常に強く、品質やサービスへの高い要求水準につながりますが、過度な要求対応のリスクもあります。', 1, 105, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '顧客の要求を全て無条件で受け入れる文化', FALSE, 1),
  (gen_random_uuid(), q_id, '品質・サービスへの高い要求水準があるが過度な対応のリスクもある', TRUE, 2),
  (gen_random_uuid(), q_id, '顧客との対等な関係を築けない', FALSE, 3),
  (gen_random_uuid(), q_id, '宗教的な概念でビジネスとは無関係', FALSE, 4);

-- Q106 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓日の「謝罪」に対する認識の違いとして正しいものはどれか。', '日本では謝罪が問題解決の出発点として積極的に行われますが、韓国では謝罪が責任認定につながりやすい傾向があります。', 1, 106, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '両国とも謝罪に対する認識は同じ', FALSE, 1),
  (gen_random_uuid(), q_id, '日本は謝罪が問題解決の出発点、韓国は責任認定につながりやすい', TRUE, 2),
  (gen_random_uuid(), q_id, '韓国の方が日本より謝罪を重視する', FALSE, 3),
  (gen_random_uuid(), q_id, '日本では謝罪は弱さの表現として避けられる', FALSE, 4);

-- Q107 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「稟議制度」と「根回し」の関係として正しいものはどれか。', '根回しは稟議の前段階で行う非公式な合意形成であり、稟議がスムーズに通るよう事前に関係者の理解を得る活動です。', 1, 107, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '同じ意味で互換的に使われる', FALSE, 1),
  (gen_random_uuid(), q_id, '根回しは稟議の前段階の非公式な合意形成活動', TRUE, 2),
  (gen_random_uuid(), q_id, '稟議が根回しの前段階に位置する', FALSE, 3),
  (gen_random_uuid(), q_id, '根回しは稟議制度の代替手段', FALSE, 4);

-- Q108 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のIT企業でアジャイル開発を導入する際の文化的課題はどれか。', '合意形成を重視する文化と頻繁な変更・迅速な意思決定を求めるアジャイルの間にギャップが生じることがあります。', 1, 108, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '技術的なスキル不足', FALSE, 1),
  (gen_random_uuid(), q_id, '合意形成重視の文化と迅速な意思決定のギャップ', TRUE, 2),
  (gen_random_uuid(), q_id, '英語のドキュメントが多い', FALSE, 3),
  (gen_random_uuid(), q_id, 'ツールの導入コスト', FALSE, 4);

-- Q109 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「報連相」と韓国の「報告文化」の違いはどれか。', '韓国は結果中心の報告が多い一方、日本はプロセスを含めた頻繁な中間報告を重視します。', 1, 109, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '韓国は日本より報連相を重視する', FALSE, 1),
  (gen_random_uuid(), q_id, '韓国は結果中心、日本はプロセスを含む頻繁な中間報告を重視', TRUE, 2),
  (gen_random_uuid(), q_id, '両国の報告文化に大きな差はない', FALSE, 3),
  (gen_random_uuid(), q_id, '日本は口頭報告、韓国は書面報告を好む', FALSE, 4);

-- Q110 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「プロセス重視」の文化がソフトウェア品質に与える影響はどれか。', '手順書、チェックリスト、コードレビューなどプロセスを丁寧に実行することで高い品質を実現する一方、柔軟性が低下する場合があります。', 1, 110, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '開発スピードが速くなる', FALSE, 1),
  (gen_random_uuid(), q_id, '高品質を実現するが柔軟性が低下する場合がある', TRUE, 2),
  (gen_random_uuid(), q_id, 'コストが下がる', FALSE, 3),
  (gen_random_uuid(), q_id, '品質には影響しない', FALSE, 4);

-- Q111 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国人エンジニアが日本の「マニュアル文化」に適応するために必要な姿勢はどれか。', '日本ではマニュアルや手順書に忠実に従うことが品質の基盤であり、自己判断での省略は避けるべきです。', 1, 111, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '効率のためにマニュアルを自分なりに簡略化する', FALSE, 1),
  (gen_random_uuid(), q_id, 'マニュアルに忠実に従い、改善点があれば提案する', TRUE, 2),
  (gen_random_uuid(), q_id, '韓国式のやり方で進めて結果で示す', FALSE, 3),
  (gen_random_uuid(), q_id, 'マニュアルは参考程度にして経験で判断する', FALSE, 4);

-- Q112 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「お互い様」の精神が意味するものはどれか。', '困った時はお互いに助け合うという相互扶助の精神で、チームワークの基盤となっています。', 1, 112, 'medium', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '責任を分散させること', FALSE, 1),
  (gen_random_uuid(), q_id, '困った時はお互いに助け合う相互扶助の精神', TRUE, 2),
  (gen_random_uuid(), q_id, '全員が同じ仕事をすること', FALSE, 3),
  (gen_random_uuid(), q_id, '公平な評価制度', FALSE, 4);

-- Q113 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の「義理（ぎり）」の概念がビジネス関係に与える影響はどれか。', '義理は受けた恩に対して返す義務感であり、長期的なビジネス関係の構築と維持に重要な役割を果たします。', 1, 113, 'hard', 'cross_culture');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '合理的な判断を妨げる障害', FALSE, 1),
  (gen_random_uuid(), q_id, '恩に報いる義務感で長期的ビジネス関係の構築に重要', TRUE, 2),
  (gen_random_uuid(), q_id, '形式的な付き合いに限定される', FALSE, 3),
  (gen_random_uuid(), q_id, '現代のビジネスでは意味をなさない', FALSE, 4);

-- ===== SECURITY (37 questions, sort_order 114-150) =====
-- Topics: 情報セキュリティ(秘密区分,保管,持出/持込,廃棄/返却), IT利用ルール(メール,テレワーク,AI,インフラ)

-- Q114 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報を識別するために最初に行うべきことは何か。', '重要な情報には秘密区分（極秘、関係者外秘等）を明示し、識別できるようにします。', 1, 114, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'パスワードを設定する', FALSE, 1),
  (gen_random_uuid(), q_id, '秘密区分（極秘、関係者外秘等）を明示する', TRUE, 2),
  (gen_random_uuid(), q_id, '暗号化して保管する', FALSE, 3),
  (gen_random_uuid(), q_id, '担当者名をファイルに記録する', FALSE, 4);

-- Q115 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '離席時のセキュリティ対策として正しいものはどれか。', '離席する際は10分以内にパスワードで保護されたスクリーンセーバーを起動します。', 1, 115, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '画面の電源だけを切る', FALSE, 1),
  (gen_random_uuid(), q_id, '10分以内にパスワード付きスクリーンセーバーを起動する', TRUE, 2),
  (gen_random_uuid(), q_id, '「離席中」の札を立てる', FALSE, 3),
  (gen_random_uuid(), q_id, '短時間なら何もしなくてよい', FALSE, 4);

-- Q116 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '私用PC等の電子機器を作業場所に持ち込むことについて正しいものはどれか。', '許可されていない私用PC等の電子機器やUSBメモリ等を作業場所に持ち込むことは禁止されています。', 1, 116, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '上司に口頭で伝えれば持ち込める', FALSE, 1),
  (gen_random_uuid(), q_id, '許可されていない私用電子機器の持ち込みは禁止', TRUE, 2),
  (gen_random_uuid(), q_id, 'ウイルスチェック済みなら持ち込める', FALSE, 3),
  (gen_random_uuid(), q_id, '業務に使わなければ持ち込んでよい', FALSE, 4);

-- Q117 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '公衆Wi-Fiの利用に関するルールとして正しいものはどれか。', 'テレワーク時に公衆Wi-Fi（駅、飲食店、コンビニ等）の利用は禁止されています。', 1, 117, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'VPNを使えば利用可能', FALSE, 1),
  (gen_random_uuid(), q_id, '公衆Wi-Fiの利用は禁止', TRUE, 2),
  (gen_random_uuid(), q_id, '暗号化された公衆Wi-Fiなら利用可能', FALSE, 3),
  (gen_random_uuid(), q_id, '緊急時のみ利用可能', FALSE, 4);

-- Q118 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'AIシステムのプロンプトに入力してはいけない情報はどれか。', 'AIのプロンプトに当社の秘密情報、取引先の秘密情報、個人情報等を入力してはなりません。', 1, 118, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '一般的なプログラミングの質問', FALSE, 1),
  (gen_random_uuid(), q_id, '公開されている技術ドキュメント', FALSE, 2),
  (gen_random_uuid(), q_id, '当社の秘密情報や個人情報', TRUE, 3),
  (gen_random_uuid(), q_id, '公開情報の翻訳依頼', FALSE, 4);

-- Q119 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な書類を保管するキャビネットに必要な管理はどれか。', '重要な書類を保管するキャビネットは施錠管理を行います。', 1, 119, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '担当者名の表示', FALSE, 1),
  (gen_random_uuid(), q_id, '施錠管理', TRUE, 2),
  (gen_random_uuid(), q_id, '定期的な棚卸し', FALSE, 3),
  (gen_random_uuid(), q_id, '部署名の表示', FALSE, 4);

-- Q120 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報をメールで送信する際の正しい方法はどれか。', 'メールで重要な情報を送信する場合は、本文に記載せず、暗号化またはパスワードで保護したファイルを添付します。', 1, 120, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'メール本文に直接記載する', FALSE, 1),
  (gen_random_uuid(), q_id, '暗号化またはパスワード保護したファイルを添付する', TRUE, 2),
  (gen_random_uuid(), q_id, 'HTML形式で装飾して送信する', FALSE, 3),
  (gen_random_uuid(), q_id, 'CCに上司を入れれば本文に書いてよい', FALSE, 4);

-- Q121 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'テレワーク時に自宅の無線LANで推奨される暗号化方式はどれか。', '自宅で無線LANを使用する場合はWPA2またはWPA3で通信を暗号化する必要があります。', 1, 121, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'WEP', FALSE, 1),
  (gen_random_uuid(), q_id, 'WPA2またはWPA3', TRUE, 2),
  (gen_random_uuid(), q_id, '暗号化なし（パスワードのみ）', FALSE, 3),
  (gen_random_uuid(), q_id, 'WPA1', FALSE, 4);

-- Q122 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報を持ち出す場合に必要な手続きはどれか。', '重要な情報を持ち出す場合は上長の許可を得て、持ち出し・持ち帰りを台帳等で管理します。', 1, 122, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '同僚に伝えれば持ち出せる', FALSE, 1),
  (gen_random_uuid(), q_id, '上長の許可を得て台帳等で管理する', TRUE, 2),
  (gen_random_uuid(), q_id, '翌日に返却すれば自由に持ち出せる', FALSE, 3),
  (gen_random_uuid(), q_id, 'メールで報告すれば持ち出せる', FALSE, 4);

-- Q123 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'PC等の電子機器に重要な情報を格納する場合に必要な措置はどれか。', 'PC等の電子機器、記憶媒体に重要な情報を格納する場合は暗号化またはパスワードを付加します。', 1, 123, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'ファイル名を分かりにくくする', FALSE, 1),
  (gen_random_uuid(), q_id, '暗号化またはパスワードを付加する', TRUE, 2),
  (gen_random_uuid(), q_id, '隠しフォルダに保存する', FALSE, 3),
  (gen_random_uuid(), q_id, 'アクセス権限を自分のみにする', FALSE, 4);

-- Q124 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '業務で使用するデバイスのローカルディスクに関するルールはどれか。', 'テレワーク時、業務で使用するデバイスのローカルディスクにはデータを保管しないことが求められます。', 1, 124, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '暗号化すればローカルに保管してよい', FALSE, 1),
  (gen_random_uuid(), q_id, 'ローカルディスクにデータを保管しない', TRUE, 2),
  (gen_random_uuid(), q_id, '一時的な保管は問題ない', FALSE, 3),
  (gen_random_uuid(), q_id, 'バックアップがあればローカルに保管可能', FALSE, 4);

-- Q125 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'メールのプレビューウィンドウ機能について正しいものはどれか。', 'メールのプレビューウィンドウ機能は利用しないことがルールです。ウイルス感染リスクを低減します。', 1, 125, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '効率化のため積極的に利用する', FALSE, 1),
  (gen_random_uuid(), q_id, 'プレビューウィンドウ機能は利用しない', TRUE, 2),
  (gen_random_uuid(), q_id, '信頼できる送信者のメールのみ利用する', FALSE, 3),
  (gen_random_uuid(), q_id, 'テキスト形式のメールのみ利用可能', FALSE, 4);

-- Q126 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'メールの形式として推奨されるものはどれか。', 'HTML形式のメールは利用せず、テキスト形式を利用します。セキュリティリスクの低減が目的です。', 1, 126, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'HTML形式（装飾可能）', FALSE, 1),
  (gen_random_uuid(), q_id, 'テキスト形式', TRUE, 2),
  (gen_random_uuid(), q_id, 'リッチテキスト形式', FALSE, 3),
  (gen_random_uuid(), q_id, '送信先に合わせて自由に選択', FALSE, 4);

-- Q127 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'テレワーク時に禁止されている行為として正しくないものはどれか。', 'テレワーク時は印刷出力、画面キャプチャ、公衆Wi-Fi利用が禁止です。WPA3暗号化のWi-Fi使用は推奨されています。', 1, 127, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '在宅での印刷出力', FALSE, 1),
  (gen_random_uuid(), q_id, '画面キャプチャの取得', FALSE, 2),
  (gen_random_uuid(), q_id, 'WPA3暗号化の自宅Wi-Fi使用', TRUE, 3),
  (gen_random_uuid(), q_id, '公衆Wi-Fiの利用', FALSE, 4);

-- Q128 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '受信したメールの添付ファイルに対する正しい対応はどれか。', 'メールの添付ファイルはむやみに実行せず、ウイルスチェックをかけます。怪しいファイルは実行しません。', 1, 128, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '知り合いからのメールなら安全なのですぐに開く', FALSE, 1),
  (gen_random_uuid(), q_id, 'ウイルスチェックをかけてから開く', TRUE, 2),
  (gen_random_uuid(), q_id, 'ファイル名が正しければそのまま実行する', FALSE, 3),
  (gen_random_uuid(), q_id, 'プレビューで内容を確認してから開く', FALSE, 4);

-- Q129 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'モバイルPCの盗難防止対策として正しいものはどれか。', 'モバイルPC、記憶媒体についてはセキュリティワイヤー、施錠管理等の盗難防止対策を行います。', 1, 129, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '常に自分のデスクに置いておく', FALSE, 1),
  (gen_random_uuid(), q_id, 'セキュリティワイヤーや施錠管理で盗難防止対策を行う', TRUE, 2),
  (gen_random_uuid(), q_id, 'パスワードを設定すれば盗難対策は不要', FALSE, 3),
  (gen_random_uuid(), q_id, '保険に加入する', FALSE, 4);

-- Q130 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報が入ったPCを廃棄する際の正しい手順はどれか。', '許可を得た上でデータ消去ツールによる消去または物理的破壊を行い、廃棄業者に依頼する場合は廃棄証明書を取得します。', 1, 130, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'ファイルを削除してからゴミに出す', FALSE, 1),
  (gen_random_uuid(), q_id, '初期化してから中古として売却する', FALSE, 2),
  (gen_random_uuid(), q_id, '許可を得てデータ消去ツールまたは物理的破壊で廃棄し、廃棄証明書を取得する', TRUE, 3),
  (gen_random_uuid(), q_id, 'ハードディスクを取り出してから本体を廃棄する', FALSE, 4);

-- Q131 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報を発送する際に守るべきルールとして正しいものはどれか。', '配達記録が残る手段を用い、封入前に宛名と物品の一致を複数人で確認します。', 1, 131, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '普通郵便で速やかに発送する', FALSE, 1),
  (gen_random_uuid(), q_id, '配達記録が残る手段を使い、宛名と物品を複数人で確認する', TRUE, 2),
  (gen_random_uuid(), q_id, '受取人に発送を事前連絡すれば普通郵便でよい', FALSE, 3),
  (gen_random_uuid(), q_id, '電子データはメール添付で発送する', FALSE, 4);

-- Q132 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '電車内で重要な情報の入ったバッグの取り扱いとして正しいものはどれか。', '電車内では重要な情報の入ったバッグ等から手を離さず、網棚に置かないことが求められます。', 1, 132, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '網棚に置いて席に座る', FALSE, 1),
  (gen_random_uuid(), q_id, 'チャックを閉めて足元に置く', FALSE, 2),
  (gen_random_uuid(), q_id, 'バッグから手を離さない（網棚に置かない）', TRUE, 3),
  (gen_random_uuid(), q_id, '隣の席に置いて見張る', FALSE, 4);

-- Q133 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '会社が指定していないAIシステムの業務利用について正しいものはどれか。', '会社が利用可能と指定したAIシステム以外は業務で使用してはなりません。', 1, 133, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '個人情報を入力しなければ使ってよい', FALSE, 1),
  (gen_random_uuid(), q_id, '無料のAIサービスなら業務利用可能', FALSE, 2),
  (gen_random_uuid(), q_id, '会社が指定したAI以外は業務で使用してはならない', TRUE, 3),
  (gen_random_uuid(), q_id, '上司の許可があれば使用可能', FALSE, 4);

-- Q134 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'AIシステムの出力結果を利用する際に確認すべき事項はどれか。', 'AI出力結果について著作権や商標権等の第三者の権利を侵害していないか、内容に誤りがないかを確認します。', 1, 134, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '出力されたコードの実行速度', FALSE, 1),
  (gen_random_uuid(), q_id, '著作権・商標権等の権利侵害の有無と内容の正確性', TRUE, 2),
  (gen_random_uuid(), q_id, 'AIモデルのバージョン情報', FALSE, 3),
  (gen_random_uuid(), q_id, '出力の文字数と品質スコア', FALSE, 4);

-- Q135 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '情報インフラの「不正使用」に該当する行為はどれか。', '機密情報を第三者に漏洩する行為、公序良俗に反する行為、プライバシーを侵害する行為は不正使用です。', 1, 135, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '業務メールの送受信', FALSE, 1),
  (gen_random_uuid(), q_id, '機密情報を第三者に漏洩する行為', TRUE, 2),
  (gen_random_uuid(), q_id, '業務用ソフトウェアのインストール', FALSE, 3),
  (gen_random_uuid(), q_id, '社内ポータルの閲覧', FALSE, 4);

-- Q136 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'お客様より貸与されていた資産（身分証、PC等）の取り扱いとして正しいものはどれか。', '貸与されていた資産は確実に返却しなければなりません。', 1, 136, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '契約終了後に郵送で返却する', FALSE, 1),
  (gen_random_uuid(), q_id, '確実に返却する', TRUE, 2),
  (gen_random_uuid(), q_id, 'データを消去すれば返却不要', FALSE, 3),
  (gen_random_uuid(), q_id, '次のプロジェクトでも使用してよい', FALSE, 4);

-- Q137 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '業務遂行上、情報を持ち帰る必要がある場合の正しい手順はどれか。', '必ず事前に責任者に届出、了解のもとで実行します。自己判断での持ち出しは禁止です。', 1, 137, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '翌朝までに返却すれば持ち帰ってよい', FALSE, 1),
  (gen_random_uuid(), q_id, '事前に責任者に届出、了解を得てから実行する', TRUE, 2),
  (gen_random_uuid(), q_id, '暗号化すれば自由に持ち帰れる', FALSE, 3),
  (gen_random_uuid(), q_id, '業務上必要なら自己判断で持ち帰れる', FALSE, 4);

-- Q138 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '指定されたメール・ブラウザ以外のソフトウェアの使用について正しいものはどれか。', '指定されたメール・ブラウザ等のソフトウェア以外でのインフラ使用は禁止されています。', 1, 138, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '業務効率が上がるなら使用してよい', FALSE, 1),
  (gen_random_uuid(), q_id, '指定ソフトウェア以外のインフラ使用は禁止', TRUE, 2),
  (gen_random_uuid(), q_id, 'オープンソースなら問題ない', FALSE, 3),
  (gen_random_uuid(), q_id, 'ウイルスチェック済みなら使用可能', FALSE, 4);

-- Q139 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '電子データを記憶媒体に保管して発送する場合に必要な措置はどれか。', '電子データを記憶媒体に保管して発送する場合は暗号化またはパスワードを付加します。', 1, 139, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '速達で送れば暗号化は不要', FALSE, 1),
  (gen_random_uuid(), q_id, '暗号化またはパスワードを付加する', TRUE, 2),
  (gen_random_uuid(), q_id, '配達記録だけ残せばよい', FALSE, 3),
  (gen_random_uuid(), q_id, '受取人にパスワードを口頭で伝えれば暗号化不要', FALSE, 4);

-- Q140 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報の入ったPC等を飛行機で運ぶ場合の正しい取り扱いはどれか。', '重要な情報の入ったPC等の電子機器、書類等は手荷物として機内持込みします。預け荷物にしてはいけません。', 1, 140, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '預け荷物として厳重に梱包する', FALSE, 1),
  (gen_random_uuid(), q_id, '手荷物として機内に持ち込む', TRUE, 2),
  (gen_random_uuid(), q_id, '事前に宅配便で送っておく', FALSE, 3),
  (gen_random_uuid(), q_id, '航空会社の貴重品サービスを利用する', FALSE, 4);

-- Q141 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '業務上不要となった情報の書類・電子データの正しい処理はどれか。', '不要となった情報は速やかに全てを会社に返却するか、事前の了解を得て適切な方法で破棄します。', 1, 141, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分の判断でゴミ箱に捨てる', FALSE, 1),
  (gen_random_uuid(), q_id, '速やかに会社に返却するか、了解を得て適切に破棄する', TRUE, 2),
  (gen_random_uuid(), q_id, 'デスクの引き出しに保管しておく', FALSE, 3),
  (gen_random_uuid(), q_id, 'シュレッダーにかければ報告不要', FALSE, 4);

-- Q142 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '「チェーンメール」を受信した場合の正しい対応はどれか。', '受信したチェーンメール等の害のあるメールを他人に送ってはいけません。', 1, 142, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '内容が正しそうなら転送する', FALSE, 1),
  (gen_random_uuid(), q_id, '上司に転送して判断を仰ぐ', FALSE, 2),
  (gen_random_uuid(), q_id, '他人に送らず削除する', TRUE, 3),
  (gen_random_uuid(), q_id, '全員に注意喚起として転送する', FALSE, 4);

-- Q143 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '貸与されたメールアドレスの取り扱いとして正しいものはどれか。', '貸与されたメールアドレスの社外のメーリングリストへの登録や公開は禁止されています。', 1, 143, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '技術コミュニティに登録してよい', FALSE, 1),
  (gen_random_uuid(), q_id, '社外のメーリングリストへの登録・公開は禁止', TRUE, 2),
  (gen_random_uuid(), q_id, '業務関連のサービスなら登録可能', FALSE, 3),
  (gen_random_uuid(), q_id, '個人のSNSプロフィールに記載してよい', FALSE, 4);

-- Q144 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報を業務遂行に必要な範囲を超えて複製することについて正しいものはどれか。', '重要な情報は業務遂行に必要な範囲を超えて複製してはいけません。', 1, 144, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, 'バックアップ目的なら自由に複製してよい', FALSE, 1),
  (gen_random_uuid(), q_id, '業務遂行に必要な範囲を超えて複製してはならない', TRUE, 2),
  (gen_random_uuid(), q_id, '暗号化すれば複製の制限はない', FALSE, 3),
  (gen_random_uuid(), q_id, '社内での複製は自由にできる', FALSE, 4);

-- Q145 (medium)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '駅やホテルのロビーでバッグを扱う際の正しい行動はどれか。', '駅、空港、ホテルのロビー、飲食店等ではバッグ等は常に手元に置きます。', 1, 145, 'medium', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '椅子の横に置いて座る', FALSE, 1),
  (gen_random_uuid(), q_id, 'バッグは常に手元に置く', TRUE, 2),
  (gen_random_uuid(), q_id, 'フロントに預ける', FALSE, 3),
  (gen_random_uuid(), q_id, 'チャックを閉めておけば足元でよい', FALSE, 4);

-- Q146 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '情報の取扱いに関する「あらかじめ認められた情報以外にはアクセスしない」ルールの意味はどれか。', '業務上必要で許可された情報にのみアクセスし、好奇心や利便性で権限外の情報にアクセスしてはいけません。', 1, 146, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '自分の部署の情報には自由にアクセスできる', FALSE, 1),
  (gen_random_uuid(), q_id, '業務上許可された情報にのみアクセスし、権限外にはアクセスしない', TRUE, 2),
  (gen_random_uuid(), q_id, 'アクセス権があれば全ての情報を閲覧できる', FALSE, 3),
  (gen_random_uuid(), q_id, '管理者に依頼すれば何でもアクセスできる', FALSE, 4);

-- Q147 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '業務で発生したデータや書類の無断廃棄について正しいものはどれか。', '業務で発生したデータ、書類等は承認なく無断廃棄することは禁止されています。', 1, 147, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '不要になったら自分の判断で廃棄してよい', FALSE, 1),
  (gen_random_uuid(), q_id, '承認なく無断廃棄することは禁止', TRUE, 2),
  (gen_random_uuid(), q_id, '電子データはごみ箱に入れれば廃棄できる', FALSE, 3),
  (gen_random_uuid(), q_id, '1年以上経過した書類は自由に廃棄可能', FALSE, 4);

-- Q148 (easy)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '情報インフラの「私的使用」に該当するものはどれか。', '電子メールによる業務外の通信、業務上必要としないWebサイトの閲覧は私的使用に該当します。', 1, 148, 'easy', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '業務に必要な技術資料のダウンロード', FALSE, 1),
  (gen_random_uuid(), q_id, '業務上必要としないWebサイトの閲覧', TRUE, 2),
  (gen_random_uuid(), q_id, '社内メールでの業務連絡', FALSE, 3),
  (gen_random_uuid(), q_id, '業務用ツールのアップデート', FALSE, 4);

-- Q149 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'お客様の情報を取り扱う際の基本ルールとして正しいものはどれか。', 'お客様の情報は契約書、覚書等で取り決めた目的及びルールに基づき使用し、適切に管理します。', 1, 149, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '社内の全員がアクセスできるようにする', FALSE, 1),
  (gen_random_uuid(), q_id, '契約で取り決めた目的・ルールに基づき使用し適切に管理する', TRUE, 2),
  (gen_random_uuid(), q_id, '自社の判断で自由に活用できる', FALSE, 3),
  (gen_random_uuid(), q_id, '匿名化すれば目的外利用も可能', FALSE, 4);

-- Q150 (hard)
q_id := gen_random_uuid();
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '重要な情報に関する「バックアップ」の保管場所として正しいものはどれか。', '重要な情報はアクセスコントロールが施され、消失に備えてバックアップの施された安全なサーバに保存します。', 1, 150, 'hard', 'security');
INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
  (gen_random_uuid(), q_id, '個人のUSBメモリ', FALSE, 1),
  (gen_random_uuid(), q_id, 'アクセスコントロールが施された安全なサーバ', TRUE, 2),
  (gen_random_uuid(), q_id, '個人のクラウドストレージ', FALSE, 3),
  (gen_random_uuid(), q_id, 'デスクトップPCのローカルディスク', FALSE, 4);

END $$;
