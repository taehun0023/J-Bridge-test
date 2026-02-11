-- ============================================
-- Quiz 5: ビジネスリテラシーランク試験 (Attitude/Culture) — 30 questions
-- Categories: business_manner, communication, cross_culture
-- Easy: 基本マナー・挨拶・敬語 (9)
-- Medium: 報連相・会議・メール (12)
-- Hard: 根回し・異文化コミュニケーション (9)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (9 questions): ビジネス挨拶、基本敬語、出退勤 =====

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で朝出勤したときの適切な挨拶はどれか。', '日本の職場では朝の出勤時に「おはようございます」が基本の挨拶です。', 1, 1, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おはようございます', TRUE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です（業務中・退勤時の挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, 'こんにちは（昼間の一般的な挨拶）', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております（外部取引先用の挨拶）', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で退勤する際、残っている同僚にかける挨拶はどれか。', '先に退勤する際は「お先に失礼します」と挨拶します。', 1, 2, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした（同僚の退勤時の応答）', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご苦労様です（上司が部下に使う表現）', FALSE, 2),
    (gen_random_uuid(), q_id, 'お先に失礼します', TRUE, 3),
    (gen_random_uuid(), q_id, 'また明日よろしくお願いします', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で名刺交換をする際の正しいマナーはどれか。', '名刺は両手で渡し受け取り、受け取った名刺はすぐにポケットに入れずテーブルの上に置きます。', 1, 3, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '片手で軽く渡し、受け取ったらすぐに名刺入れに整理する', FALSE, 1),
    (gen_random_uuid(), q_id, '両手で渡し受け取り、受け取った名刺はテーブルに置く', TRUE, 2),
    (gen_random_uuid(), q_id, '受け取った名刺に相手の特徴をメモしながら会話を続ける', FALSE, 3),
    (gen_random_uuid(), q_id, '名刺を受け取ったらすぐに内容を確認しカバンに大切に保管する', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本語の「敬語（けいご）」とは何か。', '敬語は日本語で相手に対する尊敬と礼儀を表現する言語体系で、尊敬語、謙譲語、丁寧語に分かれます。', 1, 4, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本各地域の伝統的な方言を総称する言語分類体系', FALSE, 1),
    (gen_random_uuid(), q_id, 'ビジネス文書でのみ使用する格式体の書き言葉表現', FALSE, 2),
    (gen_random_uuid(), q_id, '日本の古典文学に由来する伝統的な文学表現様式', FALSE, 3),
    (gen_random_uuid(), q_id, '相手に対する尊敬と礼儀を表現する言語体系', TRUE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で出勤時間に対する一般的な期待はどれか。', '日本では時間厳守が非常に重要で、定時より5〜10分早く到着するのが一般的です。', 1, 5, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フレックスタイム制で各自好きな時間に出勤するのが一般的', FALSE, 1),
    (gen_random_uuid(), q_id, '定時に間に合えば日本のビジネスマナーとして十分である', FALSE, 2),
    (gen_random_uuid(), q_id, '定時より5〜10分早く到着するのが望ましい', TRUE, 3),
    (gen_random_uuid(), q_id, '業務開始30分前に到着して準備するのが必須である', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で電話を受ける際、最初に言う言葉として適切なものはどれか。', '日本の会社で電話を受ける際は「お電話ありがとうございます、○○会社の△△です」と言います。', 1, 6, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もしもし、○○会社です', FALSE, 1),
    (gen_random_uuid(), q_id, 'お電話ありがとうございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'はい、○○会社でございます', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております、○○です', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のお辞儀（おじぎ）の種類でないものはどれか。', '日本のお辞儀には会釈（15度）、敬礼（30度）、最敬礼（45度）があります。', 1, 7, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会釈（えしゃく、15度 — 軽い会釈）', FALSE, 1),
    (gen_random_uuid(), q_id, '敬礼（けいれい、30度 — 一般的なビジネス挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, '最敬礼（さいけいれい、45度 — 深い感謝・謝罪）', FALSE, 3),
    (gen_random_uuid(), q_id, '直礼（ちょくれい）', TRUE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で同僚が退勤する際にかける挨拶はどれか。', '同僚が先に退勤する際は「お疲れ様でした」と挨拶します。', 1, 8, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした', TRUE, 1),
    (gen_random_uuid(), q_id, 'お先に失礼します（自分が退勤する際の挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様です（上司が部下に使う表現）', FALSE, 3),
    (gen_random_uuid(), q_id, 'また明日お願いします', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場での服装に関する一般的な基準はどれか。', '日本の会社では清潔感のあるビジネスカジュアルまたはスーツが基本で、会社の規定に従います。', 1, 9, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT業界では自由な服装が一般的なので楽な服を着る', FALSE, 1),
    (gen_random_uuid(), q_id, '毎日必ず黒のスーツにネクタイを着用しなければならない', FALSE, 2),
    (gen_random_uuid(), q_id, '部署ごとに指定されたユニフォームを着用するのが一般的', FALSE, 3),
    (gen_random_uuid(), q_id, '清潔感のあるビジネスカジュアル・スーツが基本', TRUE, 4);

  -- ===== MEDIUM (12 questions): 報連相、会議マナー、メール =====

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「ホウレンソウ」とは何か。', 'ホウレンソウは報告・連絡・相談の略で、日本の職場の核心的なコミュニケーション原則です。', 1, 10, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PDCA（Plan-Do-Check-Act）サイクルの日本式名称', FALSE, 1),
    (gen_random_uuid(), q_id, '日本特有のプロジェクト管理手法であるカイゼンの下位原則', FALSE, 2),
    (gen_random_uuid(), q_id, '報告・連絡・相談の略', TRUE, 3),
    (gen_random_uuid(), q_id, '日本の組織の階層構造を表す経営用語', FALSE, 4);

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で上司が発言中のとき、適切な行動はどれか。', '日本では上司の発言を最後まで傾聴してから意見を述べるのが礼儀です。', 1, 11, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '積極性を見せるため良いアイデアはすぐに発言する', FALSE, 1),
    (gen_random_uuid(), q_id, '最後まで傾聴してから意見を述べる', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモを取りながら同意する部分ですぐに相槌を打って割り込む', FALSE, 3),
    (gen_random_uuid(), q_id, '反対意見があれば論理的にすぐ反論して効率を高める', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールで最初に書く内容はどれか。', '日本のビジネスメールは「○○会社 △△様」または「お世話になっております」で始めるのが一般的です。', 1, 12, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メールの目的と用件を簡潔に要約して書く', FALSE, 1),
    (gen_random_uuid(), q_id, '送信日と送信者の所属・役職を記載する', FALSE, 2),
    (gen_random_uuid(), q_id, '自己紹介と前回のミーティングへの感謝を書く', FALSE, 3),
    (gen_random_uuid(), q_id, '相手の所属・名前と挨拶（お世話になっております）', TRUE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ホウレンソウの「報告」をする際に最も重要なことはどれか。', '報告は結論から先に述べ（結論ファースト）、事実に基づいて簡潔に伝えることが重要です。', 1, 13, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '背景と経過を詳しく説明してから結論を最後に伝える', FALSE, 1),
    (gen_random_uuid(), q_id, '良い結果を中心に報告し、ネガティブな内容は別途伝える', FALSE, 2),
    (gen_random_uuid(), q_id, '結論から先に、事実に基づいて簡潔に伝える', TRUE, 3),
    (gen_random_uuid(), q_id, '一定期間の進捗をまとめて一括で総合報告する', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で議事録を作成する理由はどれか。', '議事録は決定事項・担当者・期限を明確に記録し、後の確認と責任の所在を明らかにするために作成します。', 1, 14, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決定事項と担当者、期限を明確に記録するため', TRUE, 1),
    (gen_random_uuid(), q_id, '会議に出席できなかった上司に内容を共有するため', FALSE, 2),
    (gen_random_uuid(), q_id, '法的に義務化された企業文書保管規定を遵守するため', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクト終了時の成果評価の根拠資料として活用するため', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールの最後に書く挨拶はどれか。', '日本のビジネスメールの最後には「よろしくお願いいたします」と書くのが一般的です。', 1, 15, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '失礼いたします（格式体の締め表現）', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数おかけしますが（依頼時の表現）', FALSE, 2),
    (gen_random_uuid(), q_id, '以上、ご確認ください', FALSE, 3),
    (gen_random_uuid(), q_id, 'よろしくお願いいたします', TRUE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で会議開始5分前に到着することが重要な理由はどれか。', '日本では時間厳守は相手に対する尊重の表現であり、遅刻は信頼を失う大きな失礼です。', 1, 16, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議資料を事前に準備し座席配置を確認するため', FALSE, 1),
    (gen_random_uuid(), q_id, '時間厳守は相手に対する尊重であり信頼の基本である', TRUE, 2),
    (gen_random_uuid(), q_id, '日本の会社では遅刻すると人事評価に直接減点が反映される', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室の使用時間が限られており効率的な運営が必要なため', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ホウレンソウの「相談」をする際の適切な姿勢はどれか。', '相談の際は自分の意見や解決案を準備してから上司に確認・助言を求めるのが望ましいです。', 1, 17, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '問題状況を正確に伝え解決方法は上司の判断に任せる', FALSE, 1),
    (gen_random_uuid(), q_id, '自分で完全に解決できるまで相談のタイミングを遅らせる', FALSE, 2),
    (gen_random_uuid(), q_id, '自分の意見・解決案を準備してから助言を求める', TRUE, 3),
    (gen_random_uuid(), q_id, 'まず同僚と十分に議論してから結論を上司に報告する', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で業務中にミスをしたときの適切な対応はどれか。', 'ミスを発見したら直ちに上司に報告し、対応策を一緒に検討することが重要です。隠すとより大きな問題になります。', 1, 18, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ミスの原因を自分で分析し解決してから結果を報告する', FALSE, 1),
    (gen_random_uuid(), q_id, '影響範囲が小さいミスは静かに修正し報告を省略する', FALSE, 2),
    (gen_random_uuid(), q_id, '同僚にまず相談しチームレベルの対策を立ててから報告する', FALSE, 3),
    (gen_random_uuid(), q_id, '直ちに上司に報告し対応策を一緒に検討する', TRUE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '「お疲れ様です」と「ご苦労様です」の違いはどれか。', '「お疲れ様です」は誰にでも使えますが、「ご苦労様です」は上司が部下に使う表現です。', 1, 19, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「ご苦労様」がより丁寧な表現なので目上の人に使うのが適切', FALSE, 1),
    (gen_random_uuid(), q_id, '「お疲れ様」は誰にでも、「ご苦労様」は上司→部下の表現', TRUE, 2),
    (gen_random_uuid(), q_id, '両方とも意味と用法が同じで状況に応じて自由に使い分けられる', FALSE, 3),
    (gen_random_uuid(), q_id, '「お疲れ様」は社内のみ、「ご苦労様」は外部取引先に使う表現', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議における座席配置で「上座（かみざ）」とは何か。', '上座は出入口から最も遠い席で、上位の役職者やお客様が座る上席です。', 1, 20, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議を進行する司会者が座る会議室中央の指定席', FALSE, 1),
    (gen_random_uuid(), q_id, '会議室に先に到着した順に自由に選ぶ席', FALSE, 2),
    (gen_random_uuid(), q_id, '出入口に近い席で業務効率のため上司が座る席', FALSE, 3),
    (gen_random_uuid(), q_id, '出入口から最も遠い席で上位の役職者・お客様が座る上席', TRUE, 4);

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールでCCに上司を含める理由はどれか。', 'CCに上司を含めることは情報共有と報告を同時に行うホウレンソウの一環であり、日本のビジネスの一般的な慣行です。', 1, 21, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '情報共有と報告を同時に行うホウレンソウの一環', TRUE, 1),
    (gen_random_uuid(), q_id, '上司の事前承認がなければメール送信が有効にならないため', FALSE, 2),
    (gen_random_uuid(), q_id, '問題発生時に上司が直ちに介入して解決できるようにするため', FALSE, 3),
    (gen_random_uuid(), q_id, '日本企業の内部監査規定により義務的に含めなければならないため', FALSE, 4);

  -- ===== HARD (9 questions): 根回し、葛藤解決、異文化コミュニケーション =====

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「根回し（ねまわし）」とは何か。', '根回しは公式会議の前に関係者に事前に説明し同意を得る非公式の事前調整プロセスです。', 1, 22, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '稟議システムで文書を順次決裁する公式手続き', FALSE, 1),
    (gen_random_uuid(), q_id, 'カイゼン活動の一環で現場の問題を改善するプロセス', FALSE, 2),
    (gen_random_uuid(), q_id, '公式会議前に関係者と事前調整する非公式プロセス', TRUE, 3),
    (gen_random_uuid(), q_id, '組織内の部署間の業務分担を調整する人事管理制度', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で上司の意見に同意できないとき、適切な対応はどれか。', '直接的な反論より「なるほど、一方で…」など婉曲的に別の視点を提示します。', 1, 23, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議中は同意し、後で個別に書面で意見を伝える', FALSE, 1),
    (gen_random_uuid(), q_id, '婉曲的に別の視点を提示する（例：なるほど、一方で…）', TRUE, 2),
    (gen_random_uuid(), q_id, '論理的な根拠を持って明確かつ直接的に反対意見を述べる', FALSE, 3),
    (gen_random_uuid(), q_id, '上司の意見を受け入れ実行過程で自分のやり方を反映する', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「空気を読む（くうきをよむ）」のビジネス的な意味はどれか。', '空気を読むは言葉で表現されない雰囲気や状況を把握し、それに合わせて行動することを意味します。', 1, 24, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議前に参加者の立場を把握し根回しすること', FALSE, 1),
    (gen_random_uuid(), q_id, '上司の業務指示を正確に理解し迅速に実行すること', FALSE, 2),
    (gen_random_uuid(), q_id, '言葉で表現されない雰囲気・状況を把握し適切に行動する', TRUE, 3),
    (gen_random_uuid(), q_id, 'チームメンバーの業務負担を察し自発的に業務を分配すること', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国と日本の意思決定方式の主な違いはどれか。', '韓国はトップダウンの意思決定が速い一方、日本は稟議と根回しを通じた合意形成（ボトムアップ）を重視します。', 1, 25, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本は合意形成（ボトムアップ）を重視し意思決定が遅い場合がある', TRUE, 1),
    (gen_random_uuid(), q_id, '日本は韓国より経営陣のトップダウン決定が強く実行速度が速い', FALSE, 2),
    (gen_random_uuid(), q_id, '韓国も日本も現場担当者の自律的判断に意思決定を委ねる', FALSE, 3),
    (gen_random_uuid(), q_id, '日本はチームリーダーが単独決定し韓国はチーム合意を経る', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「建前（たてまえ）」と「本音（ほんね）」の意味はどれか。', '建前は公的・社会的立場（表面的な意見）で、本音は個人の本当の考え（本心）です。この区別を理解することが重要です。', 1, 26, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '建前は社内規則、本音は業務外の個人的目標を指す経営用語', FALSE, 1),
    (gen_random_uuid(), q_id, '建前は上司に報告する内容、本音は同僚と共有する非公式情報', FALSE, 2),
    (gen_random_uuid(), q_id, '建前は公的立場（表面）、本音は本当の本心', TRUE, 3),
    (gen_random_uuid(), q_id, '建前は会議での公式発言、本音は根回し過程での非公式意見', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のIT企業でチーム内の葛藤が発生した際、最も適切な解決方法はどれか。', '日本では直接的な対立を避け、第三者（上司やリーダー）を通じた仲裁や個別面談で解決することを好みます。', 1, 27, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'チーム全員が集まる場で各自の意見を透明に共有し議論する', FALSE, 1),
    (gen_random_uuid(), q_id, '第三者の仲裁または個別面談を通じた解決', TRUE, 2),
    (gen_random_uuid(), q_id, '葛藤当事者間の直接対話で問題原因を分析し合意を導く', FALSE, 3),
    (gen_random_uuid(), q_id, '社内公式の葛藤解決手続きに従いHR部門に調整を依頼する', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「稟議（りんぎ）」とは何か。', '稟議は提案書を関連部署と上位役職者に順次回覧して承認を得る日本特有の意思決定システムです。', 1, 28, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '提案書を順次回覧して承認を得る意思決定システム', TRUE, 1),
    (gen_random_uuid(), q_id, '根回しと同じ概念で非公式的な事前合意を得るプロセス', FALSE, 2),
    (gen_random_uuid(), q_id, '新入社員が部署配属前に受ける社内オリエンテーション制度', FALSE, 3),
    (gen_random_uuid(), q_id, '四半期ごとに実施する社員の業務成果評価およびフィードバック手続き', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国人ITエンジニアが日本派遣時に最も注意すべきコミュニケーションの違いはどれか。', '韓国は直接的な表現を好みますが、日本は間接的な表現と文脈（コンテクスト）を重視するハイコンテクスト文化です。', 1, 29, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術文書とコードレビューで使用する専門用語の違いに注意する', FALSE, 1),
    (gen_random_uuid(), q_id, '日本は間接的な表現と文脈を重視するハイコンテクスト文化', TRUE, 2),
    (gen_random_uuid(), q_id, '日本は韓国より直接的で明確な表現を好むローコンテクスト文化', FALSE, 3),
    (gen_random_uuid(), q_id, '日韓のコミュニケーション方式は類似しており敬語使用にのみ注意すればよい', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「和（わ）」を重視することがITプロジェクトに与える影響はどれか。', '和（調和）を重視するとチームの結束力は高いですが、反対意見の表現が難しく問題が隠れる可能性があります。適切なバランスが必要です。', 1, 30, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'チームの結束力は高いが反対意見の表現が難しい場合がある', TRUE, 1),
    (gen_random_uuid(), q_id, '個人よりチーム成果を優先し開発者の創造的な解決策が増える', FALSE, 2),
    (gen_random_uuid(), q_id, '意思決定速度が速くなりプロジェクトのスケジュール遵守に好影響を与える', FALSE, 3),
    (gen_random_uuid(), q_id, 'チーム内の競争が減りコード品質向上と技術革新が促進される', FALSE, 4);

END $$;
