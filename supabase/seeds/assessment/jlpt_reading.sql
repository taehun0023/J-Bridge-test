-- ============================================
-- J-Bridge Assessment: JLPT Reading Comprehension
-- 60 additional questions for 生活日本語総合試験
-- Quiz ID: a0000001-0000-0000-0000-000000000001
-- sort_order: 91-150 (appended to existing 90 questions)
-- Theme: 日常生活 (daily life in Japan)
-- ============================================

-- ============================================
-- EASY (N3 level) - 20 questions (sort_order 91-110)
-- Short daily-life passages, straightforward comprehension
-- ============================================

-- Q91: スーパーのお知らせ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「毎週水曜日はポイント2倍デーです。1000円以上お買い上げの方にたまごを1パックプレゼントします。」\n\nこのお知らせの内容として正しいものはどれですか？', 'ポイント2倍は水曜日で、1000円以上の購入でたまごがもらえます。', 1, 91, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매일 포인트가 2배이다', FALSE, 1),
    (gen_random_uuid(), q_id, '수요일에 포인트 2배이고 1000엔 이상 구매 시 계란을 준다', TRUE, 2),
    (gen_random_uuid(), q_id, '계란은 무료로 누구나 받을 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '포인트 2배는 토요일이다', FALSE, 4);
END $$;

-- Q92: 電車の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「本日、強風のため、中央線は30分ほど遅れが出ています。お急ぎの方は、地下鉄をご利用ください。」\n\nこの案内で言っていることは何ですか？', '強風で中央線が遅延しており、急ぐ人は地下鉄を利用するよう案内しています。', 1, 92, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '중앙선이 운휴되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '강풍으로 중앙선이 30분 정도 지연되고 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '지하철도 지연되고 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '내일부터 중앙선이 운행을 재개한다', FALSE, 4);
END $$;

-- Q93: 病院の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「受付時間は午前9時から11時半、午後は2時から4時半です。日曜日と祝日はお休みです。初めての方は保険証をお持ちください。」\n\nこの病院について正しいものはどれですか？', '受付時間と休診日、初診時の持ち物について案内しています。', 1, 93, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '토요일도 휴진이다', FALSE, 1),
    (gen_random_uuid(), q_id, '오후 접수는 1시부터이다', FALSE, 2),
    (gen_random_uuid(), q_id, '처음 오는 사람은 보험증을 가져와야 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '접수는 24시간 가능하다', FALSE, 4);
END $$;

-- Q94: 図書館のお知らせ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「本の貸し出しは1人5冊まで、2週間です。返却が遅れた場合、新しい本を借りることはできません。」\n\nこの図書館のルールとして正しいものはどれですか？', '1人5冊まで2週間借りられ、延滞すると新しい本が借りられません。', 1, 94, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1인 10권까지 빌릴 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '반납이 늦으면 벌금을 내야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '대출 기간은 2주이고 연체 시 새 책을 빌릴 수 없다', TRUE, 3),
    (gen_random_uuid(), q_id, '대출 기간은 1개월이다', FALSE, 4);
END $$;

-- Q95: 天気予報
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「明日は午前中は晴れますが、午後から雨が降る見込みです。最高気温は25度の予想です。お出かけの際は折りたたみ傘をお持ちください。」\n\nこの天気予報から分かることは何ですか？', '午前は晴れ、午後から雨、最高気温25度、折りたたみ傘持参を推奨しています。', 1, 95, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하루 종일 비가 올 예정이다', FALSE, 1),
    (gen_random_uuid(), q_id, '오전은 맑지만 오후부터 비가 올 전망이다', TRUE, 2),
    (gen_random_uuid(), q_id, '최고기온이 30도이다', FALSE, 3),
    (gen_random_uuid(), q_id, '우산은 필요 없다', FALSE, 4);
END $$;

-- Q96: アパートの規則
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ゴミは決められた曜日に出してください。燃えるゴミは月曜日と木曜日、資源ゴミは水曜日です。朝8時までに出してください。」\n\nこの規則として正しいものはどれですか？', 'ゴミ出しの曜日と時間のルールです。燃えるゴミは月・木、資源ゴミは水曜日です。', 1, 96, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쓰레기는 아무 때나 내놓을 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '타는 쓰레기는 월요일과 목요일에 내놓는다', TRUE, 2),
    (gen_random_uuid(), q_id, '자원 쓰레기는 금요일에 내놓는다', FALSE, 3),
    (gen_random_uuid(), q_id, '저녁 8시까지 내놓으면 된다', FALSE, 4);
END $$;

-- Q97: 料理レシピ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「まず、たまねぎを薄く切ります。次に、フライパンに油を入れて温めます。たまねぎを入れて、きつね色になるまで炒めます。」\n\n最初にすることは何ですか？', 'レシピの手順で「まず」たまねぎを切ることが最初です。', 1, 97, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프라이팬에 기름을 넣는다', FALSE, 1),
    (gen_random_uuid(), q_id, '양파를 볶는다', FALSE, 2),
    (gen_random_uuid(), q_id, '양파를 얇게 썬다', TRUE, 3),
    (gen_random_uuid(), q_id, '프라이팬을 데운다', FALSE, 4);
END $$;

-- Q98: 薬の説明
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「この薬は1日3回、食後に飲んでください。眠くなることがありますので、車の運転はしないでください。」\n\nこの薬について正しいものはどれですか？', '食後に1日3回服用し、眠気があるため車の運転は禁止です。', 1, 98, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1일 1회 복용한다', FALSE, 1),
    (gen_random_uuid(), q_id, '식전에 먹는다', FALSE, 2),
    (gen_random_uuid(), q_id, '차 운전을 해도 된다', FALSE, 3),
    (gen_random_uuid(), q_id, '식후에 하루 3회 복용하고 운전은 하면 안 된다', TRUE, 4);
END $$;

-- Q99: 郵便局の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「海外への荷物は窓口でお出しください。重さは30キロまでです。届くまで約1週間かかります。」\n\nこの案内で分かることは何ですか？', '海外への荷物は窓口で、30キロまで、届くまで約1週間です。', 1, 99, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '해외 소포는 포스트에 넣으면 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '무게 제한이 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '해외 소포는 창구에서 접수하고 약 1주일 걸린다', TRUE, 3),
    (gen_random_uuid(), q_id, '다음 날 도착한다', FALSE, 4);
END $$;

-- Q100: 美容院の予約
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ご予約の変更・キャンセルは前日の午後6時までにお電話ください。当日キャンセルの場合、キャンセル料として1000円いただきます。」\n\nこの美容院のルールとして正しいものはどれですか？', '予約変更は前日18時まで、当日キャンセルは1000円のキャンセル料です。', 1, 100, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '예약 변경은 당일에도 무료이다', FALSE, 1),
    (gen_random_uuid(), q_id, '당일 취소 시 취소료 1000엔이 발생한다', TRUE, 2),
    (gen_random_uuid(), q_id, '취소료는 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '예약 변경은 이메일로만 가능하다', FALSE, 4);
END $$;

-- Q101: 銀行のATM案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ATMは平日は朝8時から夜9時まで、土日祝日は朝9時から夕方5時までご利用いただけます。時間外は手数料220円がかかります。」\n\nこの案内で分かることは何ですか？', 'ATMの利用時間と時間外手数料について案内しています。', 1, 101, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ATM은 24시간 이용 가능하다', FALSE, 1),
    (gen_random_uuid(), q_id, '토일 공휴일은 이용할 수 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '시간 외 이용 시 수수료 220엔이 든다', TRUE, 3),
    (gen_random_uuid(), q_id, '수수료는 무료이다', FALSE, 4);
END $$;

-- Q102: 引っ越しの挨拶
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「隣に引っ越してきた山田と申します。何かご迷惑をおかけすることがあるかもしれませんが、どうぞよろしくお願いいたします。」\n\nこの文は何のための文ですか？', '引っ越しの挨拶文で、新しい隣人に自己紹介をしています。', 1, 102, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이사 인사이다', TRUE, 1),
    (gen_random_uuid(), q_id, '불만을 전하고 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '이사를 가겠다는 인사이다', FALSE, 3),
    (gen_random_uuid(), q_id, '택배를 받아달라는 부탁이다', FALSE, 4);
END $$;

-- Q103: 回覧板
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今月の町内清掃は4月15日（日）午前9時からです。軍手とゴミ袋をお持ちください。雨の場合は翌週に延期します。」\n\nこの回覧板の内容として正しいものはどれですか？', '町内清掃の日時、持ち物、雨天時の対応について書かれています。', 1, 103, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청소는 오후에 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '비가 와도 예정대로 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '장갑과 쓰레기 봉투를 가져와야 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '청소 도구는 모두 지급된다', FALSE, 4);
END $$;

-- Q104: コンビニの張り紙
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「アルバイト募集中！時給1100円、週3日から。高校生OK。まずはお電話ください。担当：鈴木」\n\nこの張り紙の内容として正しいものはどれですか？', 'アルバイトの募集で、時給1100円、週3日から、高校生も応募可能です。', 1, 104, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시급 1000엔이다', FALSE, 1),
    (gen_random_uuid(), q_id, '주 5일 이상 일해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '고등학생도 지원 가능하고 시급 1100엔이다', TRUE, 3),
    (gen_random_uuid(), q_id, '메일로 연락해야 한다', FALSE, 4);
END $$;

-- Q105: 宅配便の不在票
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「お届けにあがりましたが、ご不在でした。再配達をご希望の方は、下記の番号にお電話いただくか、インターネットでお申し込みください。」\n\nこの紙は何を知らせていますか？', '不在票で、留守中に届けに来たことと再配達の方法を案内しています。', 1, 105, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '택배가 배달 완료되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '부재중이라 택배를 전달하지 못했으니 재배달을 신청하라', TRUE, 2),
    (gen_random_uuid(), q_id, '택배가 취소되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '직접 영업소에 가야 한다', FALSE, 4);
END $$;

-- Q106: 公園の注意書き
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「この公園ではボール遊びと花火は禁止です。犬の散歩をする方はリードをつけてください。ゴミはお持ち帰りください。」\n\nこの公園でしてはいけないことは何ですか？', '球技と花火が禁止されています。', 1, 106, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개 산책', FALSE, 1),
    (gen_random_uuid(), q_id, '공놀이와 불꽃놀이', TRUE, 2),
    (gen_random_uuid(), q_id, '벤치에 앉기', FALSE, 3),
    (gen_random_uuid(), q_id, '달리기', FALSE, 4);
END $$;

-- Q107: レストランのメニュー
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ランチセット（11時～14時）\nAセット：ハンバーグ＋サラダ＋ドリンク 980円\nBセット：パスタ＋スープ＋ドリンク 880円\n※ドリンクはコーヒーまたは紅茶からお選びください。」\n\nこのメニューについて正しいものはどれですか？', 'ランチセットは11～14時、ドリンクはコーヒーか紅茶から選べます。', 1, 107, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '런치 세트는 하루 종일 주문 가능하다', FALSE, 1),
    (gen_random_uuid(), q_id, '드링크는 주스도 선택 가능하다', FALSE, 2),
    (gen_random_uuid(), q_id, 'B세트가 A세트보다 비싸다', FALSE, 3),
    (gen_random_uuid(), q_id, '드링크는 커피 또는 홍차 중에서 고른다', TRUE, 4);
END $$;

-- Q108: 映画館の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「毎月1日は映画の日。全作品1200円でご覧いただけます。通常料金は大人1900円、学生1500円です。」\n\nこの映画館について正しいものはどれですか？', '毎月1日は全作品1200円、通常は大人1900円です。', 1, 108, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매월 1일은 모든 작품을 1200엔에 볼 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '학생 요금은 1900엔이다', FALSE, 2),
    (gen_random_uuid(), q_id, '매주 월요일이 할인일이다', FALSE, 3),
    (gen_random_uuid(), q_id, '할인일은 일부 작품만 대상이다', FALSE, 4);
END $$;

-- Q109: 携帯ショップの案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「機種変更をご希望の方は、ご本人確認のため運転免許証またはマイナンバーカードをお持ちください。手続きには約1時間かかります。」\n\nこの案内で分かることは何ですか？', '機種変更には本人確認書類が必要で、手続きに約1時間かかります。', 1, 109, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신분증 없이도 기종 변경이 가능하다', FALSE, 1),
    (gen_random_uuid(), q_id, '수속에 약 30분 걸린다', FALSE, 2),
    (gen_random_uuid(), q_id, '운전면허증이나 마이넘버카드가 필요하고 약 1시간 걸린다', TRUE, 3),
    (gen_random_uuid(), q_id, '여권만 가능하다', FALSE, 4);
END $$;

-- Q110: バスの時刻表
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「このバス停からは、平日は15分おきに、土日は30分おきにバスが出ます。最終バスは平日22時、土日は21時です。」\n\n土曜日のバスについて正しいものはどれですか？', '土日は30分おきで最終バスは21時です。', 1, 110, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '15분 간격으로 운행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '최종 버스는 22시이다', FALSE, 2),
    (gen_random_uuid(), q_id, '30분 간격으로 운행하고 최종 버스는 21시이다', TRUE, 3),
    (gen_random_uuid(), q_id, '토요일은 운행하지 않는다', FALSE, 4);
END $$;

-- ============================================
-- MEDIUM (N2 level) - 20 questions (sort_order 111-130)
-- Daily-life passages with nuanced comprehension
-- ============================================

-- Q111: 区役所の手続き案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「引っ越しをした場合、14日以内に転入届を提出する必要があります。届出には、転出証明書、本人確認書類、マイナンバーカードまたは通知カードが必要です。届出が遅れた場合、過料が科されることがあります。」\n\nこの案内の内容として正しいものはどれですか？', '転入届は14日以内に提出が必要で、遅れると過料が科される可能性があります。', 1, 111, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전입신고는 이사 후 30일 이내에 하면 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '전입신고가 늦어도 벌금은 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '이사 후 14일 이내에 전입신고를 해야 하며 늦으면 과태료가 부과될 수 있다', TRUE, 3),
    (gen_random_uuid(), q_id, '본인 확인 서류는 필요 없다', FALSE, 4);
END $$;

-- Q112: 健康診断の結果通知
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「健康診断の結果、コレステロール値がやや高めです。直ちに治療が必要な段階ではありませんが、食生活の改善をお勧めします。特に、揚げ物を控え、野菜を多く摂るよう心がけてください。3か月後に再検査を受けてください。」\n\nこの結果について正しいものはどれですか？', 'コレステロールがやや高いが、すぐの治療は不要で、食生活改善と3か月後の再検査を勧めています。', 1, 112, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '즉시 치료가 필요하다', FALSE, 1),
    (gen_random_uuid(), q_id, '콜레스테롤 수치가 다소 높아 식생활 개선이 권장된다', TRUE, 2),
    (gen_random_uuid(), q_id, '건강에 전혀 문제가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '1년 후에 재검사를 받으면 된다', FALSE, 4);
END $$;

-- Q113: 防災訓練のお知らせ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「9月1日の防災の日に合わせて、マンション全体で防災訓練を実施します。午前10時に非常ベルが鳴りますので、各自、非常階段を使って1階の駐車場に集合してください。エレベーターは使用しないでください。」\n\nこの防災訓練で正しい行動はどれですか？', '非常階段を使って1階駐車場に集合し、エレベーターは使わないのが正しいです。', 1, 113, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '엘리베이터로 1층에 내려간다', FALSE, 1),
    (gen_random_uuid(), q_id, '비상계단으로 1층 주차장에 집합한다', TRUE, 2),
    (gen_random_uuid(), q_id, '부재 시 참가하지 않아도 된다', FALSE, 3),
    (gen_random_uuid(), q_id, '각자 방에서 대기한다', FALSE, 4);
END $$;

-- Q114: ゴミ分別の変更通知
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「4月1日よりゴミの分別ルールが変更されます。これまでプラスチックは燃えるゴミとして出していましたが、今後は資源ゴミとして毎週金曜日に出してください。正しく分別されていないゴミは回収されませんのでご注意ください。」\n\n4月1日以降、プラスチックはどうすればいいですか？', 'プラスチックは燃えるゴミではなく資源ゴミとして金曜日に出す必要があります。', 1, 114, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이전과 같이 타는 쓰레기로 내놓는다', FALSE, 1),
    (gen_random_uuid(), q_id, '자원 쓰레기로 매주 금요일에 내놓는다', TRUE, 2),
    (gen_random_uuid(), q_id, '수거하지 않으므로 직접 버려야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '매일 내놓아도 된다', FALSE, 4);
END $$;

-- Q115: 地域イベントのお知らせ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「第15回さくら祭りを開催します。日時：4月6日（土）10時～16時。場所：中央公園。模擬店や子ども向けイベントもあります。入場無料。駐車場には限りがありますので、公共交通機関をご利用ください。」\n\nこのお知らせで呼びかけていることは何ですか？', '駐車場に限りがあるため公共交通機関の利用を呼びかけています。', 1, 115, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '입장료를 사전에 지불하라', FALSE, 1),
    (gen_random_uuid(), q_id, '차로 오라', FALSE, 2),
    (gen_random_uuid(), q_id, '주차장이 한정적이니 대중교통을 이용하라', TRUE, 3),
    (gen_random_uuid(), q_id, '사전 예약을 하라', FALSE, 4);
END $$;

-- Q116: 外国人相談窓口
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「外国人のための生活相談窓口を毎月第2・第4水曜日に開設しています。在留資格、医療、教育、住まいなどの相談ができます。通訳が必要な場合は事前にお電話ください。相談は無料です。」\n\nこの相談窓口について正しいものはどれですか？', '月2回（第2・第4水曜日）開設、通訳が必要なら事前連絡、相談は無料です。', 1, 116, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매일 상담을 받을 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '상담에는 수수료가 든다', FALSE, 2),
    (gen_random_uuid(), q_id, '통역이 필요하면 사전에 전화해야 하고 상담은 무료이다', TRUE, 3),
    (gen_random_uuid(), q_id, '재류 자격 상담은 할 수 없다', FALSE, 4);
END $$;

-- Q117: 賃貸契約の注意事項
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「退去する際は、1か月前までに書面で通知してください。原状回復費用として敷金から修繕費を差し引く場合があります。ペットの飼育や壁に穴を開ける行為は禁止されています。」\n\nこの契約で禁止されていることは何ですか？', 'ペット飼育と壁に穴を開けることが禁止されています。', 1, 117, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서면으로 퇴거 통지를 하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '반려동물 사육이나 벽에 구멍을 뚫는 행위', TRUE, 2),
    (gen_random_uuid(), q_id, '보증금에서 수선비를 공제하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '1개월 전에 통지하는 것', FALSE, 4);
END $$;

-- Q118: 保育園の入園案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「来年度の保育園の入園申し込みは10月1日から31日までです。申込書は区役所の窓口またはホームページからダウンロードできます。定員を超えた場合は、保護者の就労状況などに基づいて選考を行います。」\n\n定員を超えた場合はどうなりますか？', '定員超過の場合、保護者の就労状況などで選考が行われます。', 1, 118, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '선착순으로 결정된다', FALSE, 1),
    (gen_random_uuid(), q_id, '추첨으로 결정된다', FALSE, 2),
    (gen_random_uuid(), q_id, '보호자의 취업 상황 등을 기반으로 선발한다', TRUE, 3),
    (gen_random_uuid(), q_id, '모두 입원할 수 있다', FALSE, 4);
END $$;

-- Q119: 国民健康保険の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「会社を退職した場合、14日以内に国民健康保険に加入する手続きが必要です。届出が遅れても、退職日の翌日から保険料が発生します。届出には、退職証明書または離職票が必要です。」\n\nこの案内の内容として正しいものはどれですか？', '退職後14日以内に手続きが必要で、届出が遅れても退職日翌日から保険料が発生します。', 1, 119, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신고가 늦으면 보험료가 면제된다', FALSE, 1),
    (gen_random_uuid(), q_id, '퇴직 후 14일 이내에 수속이 필요하며 늦어도 보험료는 퇴직 다음 날부터 발생한다', TRUE, 2),
    (gen_random_uuid(), q_id, '퇴직증명서는 필요 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '가입 수속은 30일 이내에 하면 된다', FALSE, 4);
END $$;

-- Q120: マンションの総会案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「マンション管理組合の定期総会を下記の通り開催します。議題は大規模修繕工事の実施時期と管理費の値上げについてです。欠席の方は委任状を提出してください。委任状の提出がない場合、議決権の行使ができません。」\n\n欠席する場合にすべきことは何ですか？', '欠席する場合は委任状を提出しないと議決権が行使できません。', 1, 120, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '특별히 할 일이 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '위임장을 제출해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '관리비를 미리 납부해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '이웃에게 전화하면 된다', FALSE, 4);
END $$;

-- Q121: 自転車の防犯登録
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「自転車を購入したら防犯登録をしてください。登録は法律で義務付けられており、自転車販売店で手続きできます。登録料は500円で、有効期間は10年です。盗難にあった場合、防犯登録があると自転車が見つかりやすくなります。」\n\n防犯登録について正しいものはどれですか？', '防犯登録は法律上の義務で、500円、10年有効です。', 1, 121, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방범 등록은 임의이다', FALSE, 1),
    (gen_random_uuid(), q_id, '법률상 의무이며 등록료 500엔, 유효기간 10년이다', TRUE, 2),
    (gen_random_uuid(), q_id, '등록료는 무료이다', FALSE, 3),
    (gen_random_uuid(), q_id, '구청에서만 수속할 수 있다', FALSE, 4);
END $$;

-- Q122: 年金の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本に住む20歳以上60歳未満のすべての方は、国民年金に加入する義務があります。保険料の支払いが困難な場合は、免除制度や猶予制度を利用できます。届出なしに未納が続くと、将来の年金額が減ったり、受給できなくなることがあります。」\n\n保険料の支払いが難しい場合はどうすればいいですか？', '免除制度や猶予制度を利用できます。届出なしの未納は年金額に影響します。', 1, 122, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지불하지 않아도 문제없다', FALSE, 1),
    (gen_random_uuid(), q_id, '면제 제도나 유예 제도를 이용할 수 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '60세 미만은 가입 의무가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '신고 없이 미납해도 연금액에 영향이 없다', FALSE, 4);
END $$;

-- Q123: 図書館のイベント
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「中央図書館では、外国人のための日本語教室を毎週土曜日に開催しています。参加費は無料ですが、テキスト代として500円が必要です。日本語がまったくできない方でも参加できます。事前の申し込みは不要です。」\n\nこの日本語教室について正しいものはどれですか？', '毎週土曜日開催、参加費無料（テキスト代500円）、初心者OK、申込不要です。', 1, 123, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사전 신청이 필요하다', FALSE, 1),
    (gen_random_uuid(), q_id, '일본어를 전혀 모르는 사람은 참가할 수 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '참가비는 무료이지만 교재비 500엔이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '평일에만 개최된다', FALSE, 4);
END $$;

-- Q124: 災害時の避難案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「大きな地震が起きたときは、まずテーブルの下に入って頭を守ってください。揺れが収まったら、火の元を確認し、ドアを開けて出口を確保してください。避難する際は、エレベーターを使わず階段を利用してください。」\n\n地震のとき、揺れが収まった後にすべきことはどれですか？', '揺れが収まったら火の元確認→ドア開けて出口確保の順序です。', 1, 124, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '즉시 엘리베이터로 대피한다', FALSE, 1),
    (gen_random_uuid(), q_id, '화기를 확인하고 문을 열어 출구를 확보한다', TRUE, 2),
    (gen_random_uuid(), q_id, '그 자리에서 계속 대기한다', FALSE, 3),
    (gen_random_uuid(), q_id, '짐을 챙겨서 나간다', FALSE, 4);
END $$;

-- Q125: 町内会費の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今年度の町内会費は年間3600円（月300円）です。一括払いまたは半年ごとのお支払いが可能です。町内会費は、防犯灯の電気代、夏祭りの運営費、防災用品の購入などに使われます。」\n\n町内会費の使い道として述べられていないものはどれですか？', '防犯灯の電気代、夏祭り、防災用品は述べられていますが、道路工事は述べられていません。', 1, 125, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방범등 전기료', FALSE, 1),
    (gen_random_uuid(), q_id, '여름 축제 운영비', FALSE, 2),
    (gen_random_uuid(), q_id, '방재용품 구입', FALSE, 3),
    (gen_random_uuid(), q_id, '도로 공사비', TRUE, 4);
END $$;

-- Q126: 通販の返品ポリシー
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「商品到着後7日以内であれば返品・交換が可能です。ただし、お客様都合の返品の場合、送料はお客様のご負担となります。商品に不良があった場合は、送料無料で交換いたします。開封済みの食品は返品できません。」\n\n商品不良の場合の対応として正しいものはどれですか？', '商品不良の場合は送料無料で交換してもらえます。', 1, 126, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '반품할 수 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '배송비를 고객이 부담하고 교환한다', FALSE, 2),
    (gen_random_uuid(), q_id, '배송비 무료로 교환해 준다', TRUE, 3),
    (gen_random_uuid(), q_id, '환불만 가능하다', FALSE, 4);
END $$;

-- Q127: 水道工事のお知らせ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「水道管の工事のため、下記の日時に断水いたします。日時：3月15日（金）午前9時～午後3時。対象地域：桜町1丁目～3丁目。断水に備えて、事前に飲み水の確保をお願いいたします。工事は天候により延期する場合があります。」\n\nこのお知らせで住民に求めていることは何ですか？', '断水に備えて事前に飲み水を確保するよう求めています。', 1, 127, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공사 현장을 피해 달라', FALSE, 1),
    (gen_random_uuid(), q_id, '사전에 마실 물을 확보해 달라', TRUE, 2),
    (gen_random_uuid(), q_id, '공사비를 지불해 달라', FALSE, 3),
    (gen_random_uuid(), q_id, '공사 기간 중 외출하지 말라', FALSE, 4);
END $$;

-- Q128: 電気料金の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「電気料金のお支払い方法は、口座振替、クレジットカード、コンビニ払いの3種類です。口座振替をご利用の方は、毎月55円の割引があります。お支払いが30日以上遅れた場合、送電を停止することがあります。」\n\nこの案内で最もお得な支払い方法はどれですか？', '口座振替は毎月55円の割引があるため最もお得です。', 1, 128, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '편의점 결제', FALSE, 1),
    (gen_random_uuid(), q_id, '신용카드', FALSE, 2),
    (gen_random_uuid(), q_id, '계좌이체 (매월 55엔 할인)', TRUE, 3),
    (gen_random_uuid(), q_id, '모두 같다', FALSE, 4);
END $$;

-- Q129: 運転免許の更新
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「運転免許証の更新は、有効期限の前後1か月以内に行ってください。更新には、現在の免許証、更新手数料2500円、証明写真1枚が必要です。優良運転者の方は30分の講習、一般運転者の方は1時間の講習を受けていただきます。」\n\n優良運転者と一般運転者の違いは何ですか？', '優良運転者は30分、一般運転者は1時間の講習です。', 1, 129, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '갱신 수수료가 다르다', FALSE, 1),
    (gen_random_uuid(), q_id, '강습 시간이 다르다 (우량 30분, 일반 1시간)', TRUE, 2),
    (gen_random_uuid(), q_id, '갱신 기간이 다르다', FALSE, 3),
    (gen_random_uuid(), q_id, '필요 서류가 다르다', FALSE, 4);
END $$;

-- Q130: ふるさと納税の案内
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ふるさと納税とは、自分が応援したい自治体に寄付ができる制度です。寄付額のうち2000円を超える部分は、所得税・住民税から控除されます。さらに、寄付のお礼として地域の特産品がもらえます。ただし、控除には確定申告が必要です。」\n\nふるさと納税の仕組みとして正しいものはどれですか？', '2000円を超える部分が控除され、お礼の特産品がもらえます。確定申告が必要です。', 1, 130, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기부금 전액이 공제된다', FALSE, 1),
    (gen_random_uuid(), q_id, '기부금 중 2000엔 초과분이 세금에서 공제되고 답례품을 받을 수 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '확정신고 없이도 공제된다', FALSE, 3),
    (gen_random_uuid(), q_id, '자기 지역에만 기부할 수 있다', FALSE, 4);
END $$;

-- ============================================
-- HARD (N1 level) - 20 questions (sort_order 131-150)
-- Complex social topics, essays, and editorials
-- ============================================

-- Q131: 少子高齢化コラム
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本の出生率は1.20と過去最低を更新し、少子高齢化が一層深刻化している。労働力不足を補うため、外国人労働者の受け入れ拡大や定年の引き上げなどが議論されているが、根本的な解決には至っていない。出生率の回復には、育児支援の充実だけでなく、長時間労働の是正や男性の育児参加促進など、社会全体の意識改革が不可欠である。」\n\nこの文章の主張として最も適切なものはどれですか？', '出生率回復には育児支援だけでなく社会全体の意識改革が不可欠だと主張しています。', 1, 131, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외국인 노동자 수용만으로 문제가 해결된다', FALSE, 1),
    (gen_random_uuid(), q_id, '육아 지원 충실만 하면 출생률이 회복된다', FALSE, 2),
    (gen_random_uuid(), q_id, '출생률 회복에는 사회 전체의 의식 개혁이 필수적이다', TRUE, 3),
    (gen_random_uuid(), q_id, '정년 연장이 가장 효과적인 대책이다', FALSE, 4);
END $$;

-- Q132: 多文化共生エッセイ
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「多文化共生とは、異なる文化的背景を持つ人々が、互いの違いを認め合い、対等な関係を築きながら共に暮らすことである。しかし、言語の壁や文化的な誤解から、摩擦が生じることも少なくない。真の多文化共生を実現するためには、制度的な支援に加え、日常的な交流の場を増やし、相互理解を深めることが重要である。」\n\nこの文章が多文化共生の課題として挙げているものはどれですか？', '言語の壁や文化的な誤解による摩擦を課題として挙げています。', 1, 132, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외국인 수의 증가', FALSE, 1),
    (gen_random_uuid(), q_id, '언어의 장벽이나 문화적 오해로 인한 마찰', TRUE, 2),
    (gen_random_uuid(), q_id, '경제적 격차', FALSE, 3),
    (gen_random_uuid(), q_id, '법률의 미비', FALSE, 4);
END $$;

-- Q133: 消費者保護
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「クーリングオフ制度とは、訪問販売や電話勧誘などで契約した場合、一定期間内であれば無条件で契約を解除できる制度である。期間は原則8日以内だが、マルチ商法の場合は20日以内となる。ただし、自ら店舗に出向いて購入した場合や、通信販売にはクーリングオフが適用されないため注意が必要である。」\n\nクーリングオフが適用されないケースはどれですか？', '自ら店舗で購入した場合と通信販売には適用されません。', 1, 133, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방문 판매로 구입한 경우', FALSE, 1),
    (gen_random_uuid(), q_id, '전화 권유로 계약한 경우', FALSE, 2),
    (gen_random_uuid(), q_id, '직접 매장에 가서 구입한 경우', TRUE, 3),
    (gen_random_uuid(), q_id, '다단계 판매로 계약한 경우', FALSE, 4);
END $$;

-- Q134: 教育問題
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「近年、不登校の児童生徒数が増加の一途をたどっている。従来は怠学や非行と結びつけられがちであったが、現在では学校環境への不適応や、いじめ、家庭の問題など、その原因は多岐にわたることが認識されるようになった。フリースクールやオンライン教育など、学校以外の学びの場の整備も進みつつあるが、社会的な偏見をなくすことも同様に重要である。」\n\nこの文章の趣旨として最も適切なものはどれですか？', '不登校の原因は多様であり、代替教育の整備とともに社会的偏見の解消も重要だと述べています。', 1, 134, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부등교의 원인은 태만이나 비행에 한정된다', FALSE, 1),
    (gen_random_uuid(), q_id, '프리스쿨이 학교를 대체해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '대체 교육의 정비와 사회적 편견 해소가 모두 중요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '부등교 학생 수는 감소하고 있다', FALSE, 4);
END $$;

-- Q135: 環境保全
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「プラスチックごみによる海洋汚染は、地球規模の環境問題となっている。マイクロプラスチックが海洋生物の体内に蓄積され、食物連鎖を通じて人間の健康にも影響を及ぼす可能性が指摘されている。レジ袋の有料化やストローの紙製化など、使い捨てプラスチックの削減に向けた取り組みが各国で進められているが、根本的な解決には消費行動そのものの変革が求められる。」\n\nこの文章が根本的な解決として挙げているものはどれですか？', '使い捨てプラスチックの削減だけでなく、消費行動そのものの変革が必要だと述べています。', 1, 135, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비닐봉지 유료화', FALSE, 1),
    (gen_random_uuid(), q_id, '빨대의 종이 전환', FALSE, 2),
    (gen_random_uuid(), q_id, '소비 행동 자체의 변혁', TRUE, 3),
    (gen_random_uuid(), q_id, '해양 생물의 보호', FALSE, 4);
END $$;

-- Q136: 地方創生
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「地方の人口減少と東京一極集中は、日本社会が直面する大きな課題である。地方創生の取り組みとして、テレワークの推進やサテライトオフィスの誘致、移住支援金の交付などが行われている。しかし、雇用機会の創出や教育・医療インフラの整備なくしては、持続的な人口の定着は困難であるとの指摘もある。」\n\n持続的な地方定着のために必要だと指摘されていることは何ですか？', '雇用機会の創出と教育・医療インフラの整備が必要だと指摘されています。', 1, 136, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '텔레워크의 추진만으로 충분하다', FALSE, 1),
    (gen_random_uuid(), q_id, '이주 지원금의 증액', FALSE, 2),
    (gen_random_uuid(), q_id, '고용 기회 창출과 교육·의료 인프라 정비', TRUE, 3),
    (gen_random_uuid(), q_id, '위성 사무실 유치', FALSE, 4);
END $$;

-- Q137: 高齢者福祉
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「独居高齢者の増加に伴い、孤独死が社会問題化している。行政による見守りサービスや地域のボランティア活動が展開されているが、プライバシーの観点から支援を拒否するケースも多い。高齢者が尊厳を保ちながらも孤立しない社会を構築するためには、緩やかなつながりを維持できる仕組みづくりが求められている。」\n\nこの文章が提唱している解決策はどれですか？', '尊厳を保ちつつ孤立しないための「緩やかなつながりの仕組みづくり」を提唱しています。', 1, 137, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '독거 고령자의 시설 입소 의무화', FALSE, 1),
    (gen_random_uuid(), q_id, '느슨한 유대를 유지할 수 있는 구조 만들기', TRUE, 2),
    (gen_random_uuid(), q_id, '프라이버시를 무시한 방문 점검', FALSE, 3),
    (gen_random_uuid(), q_id, '고령자의 자립 생활 중단', FALSE, 4);
END $$;

-- Q138: 働き方改革
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本の労働生産性はOECD加盟国の中で低い水準にとどまっている。長時間労働が美徳とされてきた企業文化を見直し、限られた時間内で成果を出す働き方への転換が求められている。しかし、制度だけを整えても、管理職の意識が変わらなければ実質的な改革は進まない。形式的な残業削減ではなく、業務の本質的な効率化と意識改革の両輪で取り組む必要がある。」\n\nこの文章が指摘する働き方改革の課題は何ですか？', '制度だけでなく管理職の意識改革が必要で、形式的でなく本質的な効率化が課題です。', 1, 138, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잔업 시간만 줄이면 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '제도만 정비하면 충분하다', FALSE, 2),
    (gen_random_uuid(), q_id, '업무의 본질적 효율화와 관리직의 의식 개혁이 모두 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '장시간 노동을 유지해야 한다', FALSE, 4);
END $$;

-- Q139: 食品ロス問題
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本では年間約523万トンの食品ロスが発生しており、これは国民一人当たり毎日おにぎり約1個分を捨てている計算になる。食品ロスの削減には、賞味期限と消費期限の違いを正しく理解することが重要である。賞味期限は「おいしく食べられる期限」であり、過ぎても直ちに安全性に問題が生じるわけではない。一方、消費期限は「安全に食べられる期限」であり、過ぎたものは食べるべきではない。」\n\n賞味期限について正しい説明はどれですか？', '賞味期限は「おいしく食べられる期限」で、過ぎても直ちに危険ではありません。', 1, 139, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지나면 반드시 버려야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '안전하게 먹을 수 있는 기한이다', FALSE, 2),
    (gen_random_uuid(), q_id, '맛있게 먹을 수 있는 기한이며 지나도 즉시 안전상 문제가 되는 것은 아니다', TRUE, 3),
    (gen_random_uuid(), q_id, '소비기한과 같은 의미이다', FALSE, 4);
END $$;

-- Q140: デジタルデバイド
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「行政手続きのデジタル化が進む中、高齢者や障害者がデジタル機器を十分に活用できないデジタルデバイドの問題が顕在化している。マイナンバーカードを利用したオンライン手続きは便利である一方、操作が困難な市民を排除してしまう懸念がある。デジタル化の推進と並行して、窓口での対面サービスを維持し、デジタル活用支援員の配置など、誰一人取り残さない社会の実現が求められている。」\n\nこの文章が主張している「誰一人取り残さない社会」のために必要なことは何ですか？', 'デジタル化推進と並行して対面サービス維持やデジタル支援員配置が必要です。', 1, 140, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '디지털화를 중단해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '온라인 수속만 제공하면 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '창구 대면 서비스 유지와 디지털 활용 지원원 배치 등이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '고령자에게 스마트폰 사용을 의무화해야 한다', FALSE, 4);
END $$;

-- Q141: 災害と防災意識
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本は地震や台風などの自然災害が多い国であるにもかかわらず、防災意識には地域差がある。大きな災害を経験した地域では防災訓練への参加率が高い一方、災害経験の少ない地域では「自分には関係ない」という意識が根強い。正常性バイアスと呼ばれるこの心理傾向を克服するためには、具体的な被害想定を示し、「もしも」の状況を自分事として捉える教育が不可欠である。」\n\n正常性バイアスとはどのようなものですか？', '「自分には関係ない」と考える心理傾向のことです。', 1, 141, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재해에 대해 과도하게 불안해하는 심리', FALSE, 1),
    (gen_random_uuid(), q_id, '자신에게는 관계없다고 생각하는 심리 경향', TRUE, 2),
    (gen_random_uuid(), q_id, '방재 훈련에 적극적으로 참가하는 심리', FALSE, 3),
    (gen_random_uuid(), q_id, '재해 후에 과도하게 반응하는 심리', FALSE, 4);
END $$;

-- Q142: 子どもの貧困
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本の子どもの相対的貧困率は約11%であり、およそ9人に1人が貧困状態にあるとされる。しかし、日本の貧困は「見えにくい貧困」と言われており、表面上は普通の生活をしているように見えても、進学や習い事を諦めざるを得ないケースが多い。子ども食堂や学習支援ボランティアなどの草の根の活動が広がっているが、行政による包括的な支援体制の構築が急務である。」\n\n日本の子どもの貧困が「見えにくい」と言われる理由は何ですか？', '表面上は普通に見えても実際には進学等を諦めているケースが多いからです。', 1, 142, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빈곤율이 매우 낮기 때문이다', FALSE, 1),
    (gen_random_uuid(), q_id, '겉보기에는 보통 생활을 하고 있는 것처럼 보이기 때문이다', TRUE, 2),
    (gen_random_uuid(), q_id, '정부가 데이터를 숨기고 있기 때문이다', FALSE, 3),
    (gen_random_uuid(), q_id, '빈곤 가정이 도시에만 있기 때문이다', FALSE, 4);
END $$;

-- Q143: SNSと人間関係
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「SNSの普及により、人々のコミュニケーション手段は大きく変化した。手軽に多くの人とつながれるようになった反面、表面的な関係が増え、深い人間関係を築きにくくなったという指摘もある。また、SNS上での自己呈示と現実の自分とのギャップに苦しむ若者も少なくない。重要なのは、SNSを否定することではなく、デジタルとリアルのバランスを保ちながら、健全な人間関係を構築する力を育てることである。」\n\nこの文章が提唱していることは何ですか？', 'SNSの否定ではなく、デジタルとリアルのバランスを保つことの重要性を提唱しています。', 1, 143, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SNS 사용을 중단해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '디지털과 현실의 균형을 유지하며 건전한 인간관계를 구축하는 능력을 키워야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'SNS에서의 인간관계만으로 충분하다', FALSE, 3),
    (gen_random_uuid(), q_id, '젊은 세대의 SNS 이용을 금지해야 한다', FALSE, 4);
END $$;

-- Q144: 医療制度の課題
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本の国民皆保険制度は世界に誇るべき制度であるが、高齢化に伴う医療費の増大が財政を圧迫している。また、地方における医師不足は深刻であり、特に産婦人科や小児科の不足が問題視されている。オンライン診療の導入やAIを活用した診断支援など、テクノロジーによる課題解決が期待されているが、対面診療の価値を損なわないよう慎重な制度設計が必要である。」\n\nこの文章で述べられていない課題はどれですか？', '保険料の滞納問題はこの文章では述べられていません。', 1, 144, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의료비 증가로 인한 재정 압박', FALSE, 1),
    (gen_random_uuid(), q_id, '지방의 의사 부족', FALSE, 2),
    (gen_random_uuid(), q_id, '보험료 체납 문제', TRUE, 3),
    (gen_random_uuid(), q_id, '산부인과·소아과 부족', FALSE, 4);
END $$;

-- Q145: エネルギー政策
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「脱炭素社会の実現に向けて、再生可能エネルギーの導入が加速している。しかし、太陽光発電は天候に左右され、風力発電は騒音や景観への影響が課題となっている。原子力発電は温室効果ガスを排出しないが、安全性への懸念が根強い。いずれのエネルギー源にも一長一短があるため、エネルギーミックスの最適化と省エネルギーの推進を同時に進める必要がある。」\n\nこの文章の結論として最も適切なものはどれですか？', '一つのエネルギー源に頼るのではなく、エネルギーミックスの最適化と省エネが必要です。', 1, 145, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '태양광 발전만 추진하면 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '원자력 발전을 전면 재개해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '에너지 믹스 최적화와 에너지 절약을 동시에 추진해야 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '재생 가능 에너지는 실용적이지 않다', FALSE, 4);
END $$;

-- Q146: 空き家問題
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「全国の空き家は約849万戸に達し、総住宅数の13.6%を占めている。空き家は景観の悪化だけでなく、不法投棄や犯罪の温床になるなど、地域の安全にも影響を及ぼす。空き家バンクの活用や解体費用の補助など、行政の取り組みが進んでいるが、相続や固定資産税の特例制度が空き家の放置を助長しているとの指摘もあり、制度の見直しも含めた総合的な対策が求められている。」\n\n空き家の放置を助長していると指摘されているものは何ですか？', '相続や固定資産税の特例制度が空き家放置を助長していると指摘されています。', 1, 146, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빈집 뱅크의 활용', FALSE, 1),
    (gen_random_uuid(), q_id, '해체 비용 보조', FALSE, 2),
    (gen_random_uuid(), q_id, '상속이나 고정자산세 특례 제도', TRUE, 3),
    (gen_random_uuid(), q_id, '지역 자원봉사 활동', FALSE, 4);
END $$;

-- Q147: ジェンダー平等
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「日本のジェンダーギャップ指数は世界的に見ても低い水準にある。特に、政治参加と経済分野でのスコアが低く、女性管理職の比率は約15%にとどまっている。制度上の障壁は徐々に取り除かれているものの、「無意識の偏見（アンコンシャス・バイアス）」が組織文化として根強く残っており、制度と意識の両面からのアプローチが不可欠である。」\n\n日本のジェンダーギャップにおいて特にスコアが低い分野はどれですか？', '政治参加と経済分野のスコアが特に低いと述べられています。', 1, 147, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교육과 건강', FALSE, 1),
    (gen_random_uuid(), q_id, '정치 참가와 경제 분야', TRUE, 2),
    (gen_random_uuid(), q_id, '문화와 예술', FALSE, 3),
    (gen_random_uuid(), q_id, '스포츠와 과학', FALSE, 4);
END $$;

-- Q148: 認知症と社会
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「2025年には認知症の人が約700万人に達すると推計されており、高齢者の約5人に1人が認知症になる計算である。認知症は本人だけでなく、介護する家族にも大きな負担がかかる。認知症の人が尊厳を持って暮らせる社会を実現するためには、早期発見・早期対応の体制整備に加え、認知症に対する社会の理解を深め、当事者の声を政策に反映させることが重要である。」\n\nこの文章が重視していることはどれですか？', '認知症の人の尊厳ある暮らしのため、社会の理解と当事者の声の政策反映を重視しています。', 1, 148, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인지증 환자의 시설 격리', FALSE, 1),
    (gen_random_uuid(), q_id, '사회의 이해를 높이고 당사자의 목소리를 정책에 반영하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '개호 부담을 가족에게만 맡기는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '인지증 연구비의 삭감', FALSE, 4);
END $$;

-- Q149: 多言語対応と外国人住民
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「在留外国人の増加に伴い、多言語での情報提供が急務となっている。災害時の避難情報や医療機関の受診方法など、生命に関わる情報が日本語でしか提供されないことは、外国人住民にとって深刻な問題である。やさしい日本語の活用や多言語アプリの開発が進んでいるが、文化的背景の違いにより、単なる翻訳では十分に伝わらないケースもある。言語だけでなく、文化的文脈を考慮したコミュニケーション設計が求められている。」\n\n単なる翻訳では不十分な理由は何ですか？', '文化的背景の違いにより、翻訳だけでは十分に伝わらないケースがあるからです。', 1, 149, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '번역 기술이 미숙하기 때문이다', FALSE, 1),
    (gen_random_uuid(), q_id, '문화적 배경의 차이로 번역만으로는 충분히 전달되지 않는 경우가 있기 때문이다', TRUE, 2),
    (gen_random_uuid(), q_id, '외국인이 번역을 읽지 않기 때문이다', FALSE, 3),
    (gen_random_uuid(), q_id, '다언어 앱이 존재하지 않기 때문이다', FALSE, 4);
END $$;

-- Q150: 持続可能な社会と個人の役割
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「SDGs（持続可能な開発目標）は国際的な枠組みであるが、その実現には一人ひとりの日常的な行動が欠かせない。フードロスの削減、エコバッグの使用、フェアトレード商品の購入など、消費者としての選択が企業の行動を変え、社会を変える力を持っている。しかし、個人の努力だけでは限界があり、企業の責任ある経営と政府の適切な規制が三位一体で機能することが、持続可能な社会の実現には不可欠である。」\n\nこの文章が述べている持続可能な社会の実現に必要なことは何ですか？', '個人・企業・政府の三位一体での取り組みが不可欠だと述べています。', 1, 150, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개인의 노력만으로 충분하다', FALSE, 1),
    (gen_random_uuid(), q_id, '기업의 자율에 맡기면 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '개인·기업·정부의 삼위일체 노력이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '정부의 규제만으로 해결된다', FALSE, 4);
END $$;
