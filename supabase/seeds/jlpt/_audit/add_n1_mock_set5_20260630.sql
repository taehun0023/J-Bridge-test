-- N1 模擬試験 Set 5: 100問 INSERT
DO $$
DECLARE
  set_id UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id FROM jlpt_mock_sets WHERE level='N1' AND set_no=5;

  -- gengo_chishiki sort=1 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「蹉跌」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'さてつ', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'させつ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'しゃてつ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'しゃせつ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 1, 1, '漢字読み');

  -- gengo_chishiki sort=2 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「憧憬」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'しょうけい', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'どうきょう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'しょうきょ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とうけい', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 2, 1, '漢字読み');

  -- gengo_chishiki sort=3 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「捏造」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ねつぞう', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'でつぞう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'きつぞう', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ねっそう', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 3, 1, '漢字読み');

  -- gengo_chishiki sort=4 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「齟齬」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そご', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'しょご', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'さご', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ごさ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 4, 1, '漢字読み');

  -- gengo_chishiki sort=5 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「懐柔」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'かいじゅう', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'えんじゅう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'かんじゅう', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'けいじゅう', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 5, 1, '漢字読み');

  -- gengo_chishiki sort=6 daimon=1 (漢字読み)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'「跋扈」の読み方として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ばっこ', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'はつこ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ばくこ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ばっか', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 6, 1, '漢字読み');

  -- gengo_chishiki sort=7 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼は自分のミスを他人に（　）する癖があった。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'転嫁', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'付託', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'傾倒', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'享受', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 7, 2, '文脈規定');

  -- gengo_chishiki sort=8 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'激しい批判を受けても、彼女は（　）として動じなかった。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'悠然', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'憔悴', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'狼狽', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'沈痛', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 8, 2, '文脈規定');

  -- gengo_chishiki sort=9 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'あの政治家は（　）な言動で、有権者の信頼を失った。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'独善的', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'内省的', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'開明的', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'献身的', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 9, 2, '文脈規定');

  -- gengo_chishiki sort=10 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'その計画は根拠が乏しく、上司から（　）だと批判された。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'荒唐無稽', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'画期的', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'独創的', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'革新的', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 10, 2, '文脈規定');

  -- gengo_chishiki sort=11 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'長引く不況で家計が（　）し、節約を余儀なくされた。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'逼迫', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'好転', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'繁栄', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'充実', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 11, 2, '文脈規定');

  -- gengo_chishiki sort=12 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼女は（　）に富んだ会話で、場の雰囲気を盛り上げた。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'機知', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'固執', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'拘泥', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'頑迷', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 12, 2, '文脈規定');

  -- gengo_chishiki sort=13 daimon=2 (文脈規定)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼は（　）な手口で相手を騙し、利益を得た。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'狡猾', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'率直', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'誠実', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'清廉', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 13, 2, '文脈規定');

  -- gengo_chishiki sort=14 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼の[杜撰]な管理が今回の問題を招いた。
下線部の「杜撰」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いい加減な', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'緻密な', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'慎重な', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'周到な', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 14, 3, '言い換え類義');

  -- gengo_chishiki sort=15 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼女は[寛容]な心で、部下のミスを受け入れた。
下線部の「寛容」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'鷹揚', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'厳格', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'苛烈', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'峻厳', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 15, 3, '言い換え類義');

  -- gengo_chishiki sort=16 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'あの登山家の行動は[無謀]だと批判された。
下線部の「無謀」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'向こう見ず', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'思慮深い', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'慎重な', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'堅実な', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 16, 3, '言い換え類義');

  -- gengo_chishiki sort=17 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼は上司の言葉を[曲解]し、誤った行動をとった。
下線部の「曲解」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'誤解', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'洞察', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'理解', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'把握', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 17, 3, '言い換え類義');

  -- gengo_chishiki sort=18 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'その発言は職場内に[波紋]を広げた。
下線部の「波紋」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'余波', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'秩序', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'和解', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'収束', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 18, 3, '言い換え類義');

  -- gengo_chishiki sort=19 daimon=3 (言い換え類義)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼は[怠惰]な生活を続け、仕事で成果が出なかった。
下線部の「怠惰」と最も意味が近いものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'無精', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'勤勉', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'几帳面', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'精力的', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 19, 3, '言い換え類義');

  -- gengo_chishiki sort=20 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

忌避', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'彼は危険な任務を忌避し、安全な職務を選んだ。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'その映画は忌避な内容で、大勢の観客が訪れた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'友人の誕生日を忌避して、プレゼントを準備した。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'忌避な気候が続き、過ごしやすい日が多かった。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 20, 4, '用法');

  -- gengo_chishiki sort=21 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

払拭', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'長年の努力で不信感を払拭することに成功した。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部屋の払拭をするため、掃除機をかけた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'払拭な天気が続き、洗濯物がよく乾いた。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'予算を払拭して、新しい機械を購入した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 21, 4, '用法');

  -- gengo_chishiki sort=22 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

失墜', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'不正行為が発覚し、彼の信頼が失墜した。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'山から石が失墜し、道路に落ちた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'失墜な体力で、マラソンを完走した。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'財布が失墜して、お金がなくなった。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 22, 4, '用法');

  -- gengo_chishiki sort=23 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

逸脱', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'彼の行為は規定のルールから逸脱していた。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'新幹線が逸脱したおかげで、早く目的地に着いた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'逸脱な才能を持つ彼は、多くの人に認められた。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'目標を逸脱して、計画を達成した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 23, 4, '用法');

  -- gengo_chishiki sort=24 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

凌駕', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'彼の実力はすでにベテラン選手を凌駕していた。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'先生の説明を凌駕して、内容を理解した。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'凌駕な景色が広がり、思わず息をのんだ。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'試験を凌駕して、第一志望に合格した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 24, 4, '用法');

  -- gengo_chishiki sort=25 daimon=4 (用法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

敷衍', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'彼は難解な理論を平易な言葉で敷衍して説明した。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'庭に花を敷衍して、美しく飾り付けた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'敷衍な計画を立て、旅行に出かけた。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'資料を敷衍して、棚に整理した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 25, 4, '用法');

  -- gengo_chishiki sort=26 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'式典（　　）、担当者が会場内の最終確認を行った。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に先立ち', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にあたって', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に際して', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をもって', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 26, 5, '文法形式');

  -- gengo_chishiki sort=27 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'本日（　　）、この研修プログラムをすべて終了いたします。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をもって', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に先立ち', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にして', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にわたって', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 27, 5, '文法形式');

  -- gengo_chishiki sort=28 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'この温泉地（　　）の豊かな自然と静けさに、多くの観光客が魅了される。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ならではの', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にふさわしい', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'のような', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'らしい', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 28, 5, '文法形式');

  -- gengo_chishiki sort=29 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'時代の変化（　　）、企業もその経営方針を見直す必要がある。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に即して', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に照らして', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をめぐって', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にあたって', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 29, 5, '文法形式');

  -- gengo_chishiki sort=30 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'過去の判例（　　）、今回の判決を評価すると、正当性が認められる。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に照らして', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に即して', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にあたって', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をもとに', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 30, 5, '文法形式');

  -- gengo_chishiki sort=31 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'彼は激しい頭痛（　　）、最後まで試合に出場し続けた。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をものともせず', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をよそに', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にもかかわらず', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'をきっかけに', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 31, 5, '文法形式');

  -- gengo_chishiki sort=32 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'他の部員でさえ練習が辛いのに、彼女（　　）毎日自主練習まで行っている。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に至っては', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'についても', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にとっても', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'においても', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 32, 5, '文法形式');

  -- gengo_chishiki sort=33 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'家族の安全のため（　　）、警察に知らせることも厭わない。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とあれば', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とすれば', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ならば', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'としても', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 33, 5, '文法形式');

  -- gengo_chishiki sort=34 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'部長は早く終わらせたい（　　）、急いで書類をまとめ始めた。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とばかりに', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とあって', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とあれば', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とみるや', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 34, 5, '文法形式');

  -- gengo_chishiki sort=35 daimon=5 (文法形式)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'他の人に多大な迷惑をかけた以上、お詫びせ（　　）だろう。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ずにはすまない', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ずにはいられない', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ずにはおかない', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ざるをえない', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 35, 5, '文法形式');

  -- gengo_chishiki sort=36 daimon=6 (文の組み立て)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の文の ★ に入る最もよいものはどれか。

彼は　＿＿　＿＿　★　＿＿　のだった。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ものともせず', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'舞台に', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'上がり続けた', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'体の不調を', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 36, 6, '文の組み立て');

  -- gengo_chishiki sort=37 daimon=6 (文の組み立て)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の文の ★ に入る最もよいものはどれか。

この技術は　＿＿　＿＿　★　＿＿　と言えるだろう。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ならではの', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'日本', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'職人精神から', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'生まれたもの', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 37, 6, '文の組み立て');

  -- gengo_chishiki sort=38 daimon=6 (文の組み立て)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の文の ★ に入る最もよいものはどれか。

来月から　＿＿　＿＿　★　＿＿　と発表された。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'業務の見直しを', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'新しい規則', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'行う', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'に即して', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 38, 6, '文の組み立て');

  -- gengo_chishiki sort=39 daimon=6 (文の組み立て)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の文の ★ に入る最もよいものはどれか。

＿＿　＿＿　★　＿＿　というのが彼の信念だった。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いとわない', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とあれば', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'家族のため', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'どんな苦労も', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 39, 6, '文の組み立て');

  -- gengo_chishiki sort=40 daimon=6 (文の組み立て)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'次の文の ★ に入る最もよいものはどれか。

先生が説明を終え　＿＿　＿＿　★　＿＿　手を挙げた。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'真っ先に', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'学生が', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とばかりに', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'待ってましたと', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 40, 6, '文の組み立て');

  -- gengo_chishiki sort=41 daimon=7 (文章の文法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'日本の伝統工芸品は、長い歴史を(1)磨き上げられてきた職人技の結晶である。しかし近年、後継者不足や安価な輸入品との競争により、多くの伝統技術が消滅の危機にさらされているのが現状だ。

こうした状況(2)、政府や地方自治体もようやく支援策を打ち出すようになった。しかし職人たちは、公的支援を(3)受け身の姿勢でいるわけにはいかない。自ら積極的に弟子を育て、技術を丁寧に伝えていく(4)が今こそ求められているのだ。

「見て盗め」という言葉がある(5)、師匠の動作を観察しながら自ら学び取る姿勢が、職人の世界では伝統的に重視されてきた。

（1）に入れるのに最もよいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'通じて', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'かけて', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'こめて', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'めぐって', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 41, 7, '文章の文法');

  -- gengo_chishiki sort=42 daimon=7 (文章の文法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'日本の伝統工芸品は、長い歴史を(1)磨き上げられてきた職人技の結晶である。しかし近年、後継者不足や安価な輸入品との競争により、多くの伝統技術が消滅の危機にさらされているのが現状だ。

こうした状況(2)、政府や地方自治体もようやく支援策を打ち出すようになった。しかし職人たちは、公的支援を(3)受け身の姿勢でいるわけにはいかない。自ら積極的に弟子を育て、技術を丁寧に伝えていく(4)が今こそ求められているのだ。

「見て盗め」という言葉がある(5)、師匠の動作を観察しながら自ら学び取る姿勢が、職人の世界では伝統的に重視されてきた。

（2）に入れるのに最もよいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'を受けて', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'について', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'のわりに', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'にもかかわらず', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 42, 7, '文章の文法');

  -- gengo_chishiki sort=43 daimon=7 (文章の文法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'日本の伝統工芸品は、長い歴史を(1)磨き上げられてきた職人技の結晶である。しかし近年、後継者不足や安価な輸入品との競争により、多くの伝統技術が消滅の危機にさらされているのが現状だ。

こうした状況(2)、政府や地方自治体もようやく支援策を打ち出すようになった。しかし職人たちは、公的支援を(3)受け身の姿勢でいるわけにはいかない。自ら積極的に弟子を育て、技術を丁寧に伝えていく(4)が今こそ求められているのだ。

「見て盗め」という言葉がある(5)、師匠の動作を観察しながら自ら学び取る姿勢が、職人の世界では伝統的に重視されてきた。

（3）に入れるのに最もよいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'あてにして', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'もとにして', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'はじめとして', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とおりにして', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 43, 7, '文章の文法');

  -- gengo_chishiki sort=44 daimon=7 (文章の文法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'日本の伝統工芸品は、長い歴史を(1)磨き上げられてきた職人技の結晶である。しかし近年、後継者不足や安価な輸入品との競争により、多くの伝統技術が消滅の危機にさらされているのが現状だ。

こうした状況(2)、政府や地方自治体もようやく支援策を打ち出すようになった。しかし職人たちは、公的支援を(3)受け身の姿勢でいるわけにはいかない。自ら積極的に弟子を育て、技術を丁寧に伝えていく(4)が今こそ求められているのだ。

「見て盗め」という言葉がある(5)、師匠の動作を観察しながら自ら学び取る姿勢が、職人の世界では伝統的に重視されてきた。

（4）に入れるのに最もよいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'こと', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'もの', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'わけ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ところ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 44, 7, '文章の文法');

  -- gengo_chishiki sort=45 daimon=7 (文章の文法)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000151'::uuid, E'日本の伝統工芸品は、長い歴史を(1)磨き上げられてきた職人技の結晶である。しかし近年、後継者不足や安価な輸入品との競争により、多くの伝統技術が消滅の危機にさらされているのが現状だ。

こうした状況(2)、政府や地方自治体もようやく支援策を打ち出すようになった。しかし職人たちは、公的支援を(3)受け身の姿勢でいるわけにはいかない。自ら積極的に弟子を育て、技術を丁寧に伝えていく(4)が今こそ求められているのだ。

「見て盗め」という言葉がある(5)、師匠の動作を観察しながら自ら学び取る姿勢が、職人の世界では伝統的に重視されてきた。

（5）に入れるのに最もよいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ように', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ものの', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'だけあって', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'とはいえ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'gengo_chishiki', 45, 7, '文章の文法');

  -- dokkai sort=1 daimon=8 (内容理解短文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'プラスチック削減を目指す新条例が来年4月より施行される。市内の飲食店では使い捨てプラスチック製のスプーンやフォークの無償提供が原則禁止となり、有料提供または竹・木製代替品への切り替えが求められる。違反した場合は指導・勧告を経て、最終的には事業者名の公表が行われる可能性がある。市は周知期間として半年間の猶予を設け、代替品購入への補助金制度も設ける方針だ。環境団体はこの取り組みを歓迎しつつ、消費者への啓発不足を課題として挙げている。

この文章で述べられていることは何か。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'飲食店はプラスチック製カトラリーの無償提供を禁止され、対応しない場合は事業者名が公表される可能性がある。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市内全事業者がプラスチック製品の使用を来年4月から全面的に禁止される。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'補助金制度は環境団体の要求によって設けられることになった。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'消費者はプラスチック製品の代替品を自費で購入することが義務付けられる。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 1, 8, '内容理解短文');

  -- dokkai sort=2 daimon=8 (内容理解短文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'国内大手IT企業が開発した量子暗号通信システムの実証実験が成功したと発表された。同システムは光の量子的性質を利用し、盗聴が原理的に不可能とされる通信方式を採用している。今回の実験では東京―大阪間の光ファイバー網を通じて、従来比10倍以上の距離での安定した通信が確認された。同社は2028年の商用化を目指しており、金融機関や政府機関での導入が見込まれている。ただし、既存インフラとの互換性確保が今後の課題として残っている。

この実証実験について、正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'量子暗号通信は盗聴を困難にするが、完全に防ぐことはできないとされている。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'実験は複数の企業が共同で行い、政府機関も参加した。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'従来より長い距離での安定した通信が確認されたが、既存インフラとの互換性という課題が残っている。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'2028年には一般消費者向けサービスとして全国展開される予定だ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 2, 8, '内容理解短文');

  -- dokkai sort=3 daimon=8 (内容理解短文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'社内図書室の利用規則が改定されました。貸出期間はこれまでの2週間から3週間に延長されますが、一度に借りられる冊数は5冊から3冊に変更されます。また、雑誌の貸出は引き続き不可とし、閲覧室内での利用のみとします。返却が遅れた場合は、延滞日数×10円の罰金が発生しますので、期限管理を徹底してください。なお、改定は来月1日より適用されます。予約制度については現行どおりとし、変更はありません。

この案内が伝えていることとして正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'来月から一度に借りられる冊数が増え、貸出期間も延長される。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'雑誌は今後、条件付きで館外への貸し出しが可能になる。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'予約制度の利用方法が来月から新しく変更される。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'返却が遅れた場合は延滞日数に応じた罰金が発生する。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 3, 8, '内容理解短文');

  -- dokkai sort=4 daimon=8 (内容理解短文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'現代の都市生活において、「孤独」は個人の問題ではなく社会的課題として捉え直されつつある。かつては内向的な性格や対人スキルの欠如と結びつけられがちだった孤立感が、今日では住環境の分断や長時間労働、デジタルコミュニケーションへの過度な依存といった構造的要因から生じるものと見なされるようになってきた。英国が世界初の「孤独担当大臣」を設置したのは2018年のことだが、日本でも2021年に孤独・孤立対策担当大臣が任命され、官民を挙げた対策が模索されている。

筆者がこの文章で主に述べていることは何か。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'孤独は内向的な性格の人に限られた問題であり、個人が対処すべきである。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'英国の孤独対策は日本より優れており、日本は英国を手本にすべきだ。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'孤独が個人的な問題から社会的・構造的課題として認識されるようになっている。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'孤独担当大臣の設置そのものが孤独問題の根本的解決策となる。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 4, 8, '内容理解短文');

  -- dokkai sort=5 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の高齢化は世界でも類を見ない速度で進行しており、2025年には国民の約3割が65歳以上になると見込まれている。こうした状況の中で、従来の行政サービスや家族による支援だけでは対応しきれない「地域の空洞化」が深刻な問題として浮上している。

かつての日本の農村部では、隣近所が互いの生活を見守り、田植えや祭りを通じて共同体としての紐帯を保ってきた。しかし都市化と核家族化が進んだ現代では、そのような自然発生的なコミュニティは解体され、同じマンションに住む人同士でも名前を知らないという状況が珍しくない。

この課題に対し、近年注目されているのが「地域コミュニティのデザイン」という考え方だ。これは行政や専門家が上から設計するのではなく、住民自身が地域の課題を発見し、解決策を話し合い、実践していくボトムアップのアプローチである。福祉、教育、環境など複数の分野を横断しながら、地域に即した仕組みを作ることが求められている。

具体的な事例として、ある地方都市では空き家をコミュニティスペースに転用し、高齢者と若者が定期的に集まって料理や手工芸を共同で行う場を設けた。これによって独居老人の孤立防止と若者の地域愛着形成を同時に達成することが期待されている。ただし、こうした取り組みは継続のための資金確保やボランティアの確保が課題となることが多く、行政の側面的支援なしには持続が難しいという指摘もある。

高齢化という不可逆な流れの中で、地域コミュニティをいかに再設計するかは、単に福祉政策の問題にとどまらず、人々がいかに互いを支え合いながら生きるかという、社会の根本的なあり方を問う問題でもある。

問1：筆者によれば、かつての農村コミュニティが現代で維持されにくい理由は何か。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'農村部での農作業や祭りに参加する若者が極端に減少したから。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'都市化と核家族化が進み、自然発生的なコミュニティが解体されたから。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'行政が農村部への支援を縮小し、共同体の維持が困難になったから。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'マンション住まいが増え、近隣住民との交流が法律で制限されたから。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 5, 9, '内容理解中文');

  -- dokkai sort=6 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の高齢化は世界でも類を見ない速度で進行しており、2025年には国民の約3割が65歳以上になると見込まれている。こうした状況の中で、従来の行政サービスや家族による支援だけでは対応しきれない「地域の空洞化」が深刻な問題として浮上している。

かつての日本の農村部では、隣近所が互いの生活を見守り、田植えや祭りを通じて共同体としての紐帯を保ってきた。しかし都市化と核家族化が進んだ現代では、そのような自然発生的なコミュニティは解体され、同じマンションに住む人同士でも名前を知らないという状況が珍しくない。

この課題に対し、近年注目されているのが「地域コミュニティのデザイン」という考え方だ。これは行政や専門家が上から設計するのではなく、住民自身が地域の課題を発見し、解決策を話し合い、実践していくボトムアップのアプローチである。福祉、教育、環境など複数の分野を横断しながら、地域に即した仕組みを作ることが求められている。

具体的な事例として、ある地方都市では空き家をコミュニティスペースに転用し、高齢者と若者が定期的に集まって料理や手工芸を共同で行う場を設けた。これによって独居老人の孤立防止と若者の地域愛着形成を同時に達成することが期待されている。ただし、こうした取り組みは継続のための資金確保やボランティアの確保が課題となることが多く、行政の側面的支援なしには持続が難しいという指摘もある。

高齢化という不可逆な流れの中で、地域コミュニティをいかに再設計するかは、単に福祉政策の問題にとどまらず、人々がいかに互いを支え合いながら生きるかという、社会の根本的なあり方を問う問題でもある。

問2：「地域コミュニティのデザイン」の特徴として正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'住民自身が地域の課題を発見・解決策を話し合い実践するボトムアップのアプローチ。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'行政や専門家が地域の実情を分析し、住民に最適な解決策を提供するもの。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'福祉分野に特化した専門家が主導して行う地域支援プログラム。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'都市部での成功事例を農村地域に移植することで効率化を図るもの。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 6, 9, '内容理解中文');

  -- dokkai sort=7 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の高齢化は世界でも類を見ない速度で進行しており、2025年には国民の約3割が65歳以上になると見込まれている。こうした状況の中で、従来の行政サービスや家族による支援だけでは対応しきれない「地域の空洞化」が深刻な問題として浮上している。

かつての日本の農村部では、隣近所が互いの生活を見守り、田植えや祭りを通じて共同体としての紐帯を保ってきた。しかし都市化と核家族化が進んだ現代では、そのような自然発生的なコミュニティは解体され、同じマンションに住む人同士でも名前を知らないという状況が珍しくない。

この課題に対し、近年注目されているのが「地域コミュニティのデザイン」という考え方だ。これは行政や専門家が上から設計するのではなく、住民自身が地域の課題を発見し、解決策を話し合い、実践していくボトムアップのアプローチである。福祉、教育、環境など複数の分野を横断しながら、地域に即した仕組みを作ることが求められている。

具体的な事例として、ある地方都市では空き家をコミュニティスペースに転用し、高齢者と若者が定期的に集まって料理や手工芸を共同で行う場を設けた。これによって独居老人の孤立防止と若者の地域愛着形成を同時に達成することが期待されている。ただし、こうした取り組みは継続のための資金確保やボランティアの確保が課題となることが多く、行政の側面的支援なしには持続が難しいという指摘もある。

高齢化という不可逆な流れの中で、地域コミュニティをいかに再設計するかは、単に福祉政策の問題にとどまらず、人々がいかに互いを支え合いながら生きるかという、社会の根本的なあり方を問う問題でもある。

問3：事例として挙げられた取り組みが抱える課題は何か。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'高齢者と若者の世代間で参加への意欲に大きな差があること。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'行政が過度に関与することで住民の自主性が損なわれること。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'継続のための資金確保とボランティアの確保が難しいこと。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'空き家の転用には法的な手続きが複雑で長期間を要すること。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 7, 9, '内容理解中文');

  -- dokkai sort=8 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'医療の場において、患者が自らの治療方針に関する意思決定に参加する権利は、近年ますます重要視されるようになっている。かつての医療は「パターナリズム」と呼ばれる考え方に基づいており、医師が専門的知識をもとに最善と判断した治療法を患者に施すことが当然とされていた。患者は受動的な存在として位置づけられ、詳細な説明なしに治療が行われることも珍しくなかった。

しかし1970年代以降、患者の権利運動が世界各地で起こり、「インフォームド・コンセント」の概念が普及した。これは、医師が治療の内容・リスク・代替案を十分に説明した上で、患者が自らの意志で同意することを前提とする考え方である。日本でも1997年の医療法改正により、説明と同意が法的に義務付けられた。

一方で、インフォームド・コンセントの実践には依然として課題がある。専門用語の多用や情報量の過多によって患者が内容を十分に理解できないケースや、「医師に任せたい」という患者の文化的・心理的傾向が意思決定の障壁となる場合がある。また、高齢者や認知症患者においては判断能力の評価自体が難しく、代理決定者の選定も倫理的課題を伴う。

こうした状況を受けて、近年では「シェアード・ディシジョン・メイキング（SDM）」と呼ばれるアプローチが注目されている。これは医師と患者が対等なパートナーとして情報を共有し、患者の価値観や生活状況を踏まえて共同で意思決定を行う手法である。単なる「説明と同意」を超えた双方向的なコミュニケーションが求められており、医療者の教育やシステム整備が急務となっている。

問1：かつての「パターナリズム」的医療の特徴はどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'医師が専門知識に基づき最善と判断した治療を、患者への十分な説明なく行うもの。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'患者が治療法を選び、医師がその意向に従って最善の治療を施すもの。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'外部の倫理委員会が治療内容を審査し、承認された手順のみ実施されるもの。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'インフォームド・コンセントを徹底し、患者の同意を必ず得て治療を行うもの。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 8, 9, '内容理解中文');

  -- dokkai sort=9 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'医療の場において、患者が自らの治療方針に関する意思決定に参加する権利は、近年ますます重要視されるようになっている。かつての医療は「パターナリズム」と呼ばれる考え方に基づいており、医師が専門的知識をもとに最善と判断した治療法を患者に施すことが当然とされていた。患者は受動的な存在として位置づけられ、詳細な説明なしに治療が行われることも珍しくなかった。

しかし1970年代以降、患者の権利運動が世界各地で起こり、「インフォームド・コンセント」の概念が普及した。これは、医師が治療の内容・リスク・代替案を十分に説明した上で、患者が自らの意志で同意することを前提とする考え方である。日本でも1997年の医療法改正により、説明と同意が法的に義務付けられた。

一方で、インフォームド・コンセントの実践には依然として課題がある。専門用語の多用や情報量の過多によって患者が内容を十分に理解できないケースや、「医師に任せたい」という患者の文化的・心理的傾向が意思決定の障壁となる場合がある。また、高齢者や認知症患者においては判断能力の評価自体が難しく、代理決定者の選定も倫理的課題を伴う。

こうした状況を受けて、近年では「シェアード・ディシジョン・メイキング（SDM）」と呼ばれるアプローチが注目されている。これは医師と患者が対等なパートナーとして情報を共有し、患者の価値観や生活状況を踏まえて共同で意思決定を行う手法である。単なる「説明と同意」を超えた双方向的なコミュニケーションが求められており、医療者の教育やシステム整備が急務となっている。

問2：インフォームド・コンセントの実践における課題として、本文で挙げられていないものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門用語や情報量が多すぎて患者が内容を十分に理解できないこと。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'患者が医師に判断を任せたいという文化的・心理的傾向があること。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'高齢者や認知症患者では判断能力の評価が困難なこと。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'医師間での治療方針の意見対立が患者の意思決定を妨げること。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 9, 9, '内容理解中文');

  -- dokkai sort=10 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'医療の場において、患者が自らの治療方針に関する意思決定に参加する権利は、近年ますます重要視されるようになっている。かつての医療は「パターナリズム」と呼ばれる考え方に基づいており、医師が専門的知識をもとに最善と判断した治療法を患者に施すことが当然とされていた。患者は受動的な存在として位置づけられ、詳細な説明なしに治療が行われることも珍しくなかった。

しかし1970年代以降、患者の権利運動が世界各地で起こり、「インフォームド・コンセント」の概念が普及した。これは、医師が治療の内容・リスク・代替案を十分に説明した上で、患者が自らの意志で同意することを前提とする考え方である。日本でも1997年の医療法改正により、説明と同意が法的に義務付けられた。

一方で、インフォームド・コンセントの実践には依然として課題がある。専門用語の多用や情報量の過多によって患者が内容を十分に理解できないケースや、「医師に任せたい」という患者の文化的・心理的傾向が意思決定の障壁となる場合がある。また、高齢者や認知症患者においては判断能力の評価自体が難しく、代理決定者の選定も倫理的課題を伴う。

こうした状況を受けて、近年では「シェアード・ディシジョン・メイキング（SDM）」と呼ばれるアプローチが注目されている。これは医師と患者が対等なパートナーとして情報を共有し、患者の価値観や生活状況を踏まえて共同で意思決定を行う手法である。単なる「説明と同意」を超えた双方向的なコミュニケーションが求められており、医療者の教育やシステム整備が急務となっている。

問3：「シェアード・ディシジョン・メイキング」とはどのようなものか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'医師が患者に代わって最終的な治療方針を決定する手法。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'複数の専門家チームが患者に選択肢を提示し、多数決で治療法を決定する手法。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'インフォームド・コンセントの手続きを法的に強化し、患者の書面同意を義務化する手法。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'医師と患者が対等なパートナーとして情報を共有し、患者の価値観を踏まえて共同で意思決定する手法。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 10, 9, '内容理解中文');

  -- dokkai sort=11 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'江戸時代の東京（江戸）は、18世紀初頭には人口100万人を超える世界最大規模の都市の一つであった。驚くべきは、この巨大都市が廃棄物や資源をほとんど無駄にしない、高度なリサイクルシステムを持って機能していたという点だ。

江戸の都市インフラの中核をなしていたのは、様々な「再利用業者」の存在である。紙屑買いは古紙を集めて再生紙を作る業者に売り、古着屋は衣服を修繕・染め直して再販し、灰買いは調理に使った灰を農村に肥料として売り渡した。下水・糞尿ですら農家が買い取り、田畑の肥料として活用された。こうした循環型経済は経済的合理性に基づいており、廃棄物と見なされたものが別の価値を生む連鎖が都市全体に張り巡らされていた。

また、江戸の建築物は木造が主流であり、火災のたびに建て替えが必要だったが、その際の廃材も再利用された。建物の解体から素材の分別・売買まで、細分化された職人集団が専門的に担っており、これも一種のリサイクル産業と見なすことができる。

現代の環境問題を考える上で、江戸のシステムが示す示唆は大きい。大量生産・大量消費・大量廃棄を前提とした現代の経済モデルとは対照的に、江戸では「捨てるもの」そのものが存在しなかったと言っても過言ではない。もちろん、エネルギーインフラや都市規模の違いがあるため、単純な模倣は不可能だが、「廃棄物ゼロ」という思想的核心は現代のサーキュラーエコノミー論とも共鳴する。

問1：江戸のリサイクルシステムが機能した主な理由として筆者が挙げているのは何か。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'幕府が廃棄物の無駄遣いを禁じる法律を設けて市民を管理したから。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'環境保護への高い意識が市民全体に共有されていたから。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'都市人口が現代に比べて少なく、廃棄物の処理が比較的容易だったから。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'廃棄物の再利用が経済的合理性に基づいて行われていたから。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 11, 9, '内容理解中文');

  -- dokkai sort=12 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'江戸時代の東京（江戸）は、18世紀初頭には人口100万人を超える世界最大規模の都市の一つであった。驚くべきは、この巨大都市が廃棄物や資源をほとんど無駄にしない、高度なリサイクルシステムを持って機能していたという点だ。

江戸の都市インフラの中核をなしていたのは、様々な「再利用業者」の存在である。紙屑買いは古紙を集めて再生紙を作る業者に売り、古着屋は衣服を修繕・染め直して再販し、灰買いは調理に使った灰を農村に肥料として売り渡した。下水・糞尿ですら農家が買い取り、田畑の肥料として活用された。こうした循環型経済は経済的合理性に基づいており、廃棄物と見なされたものが別の価値を生む連鎖が都市全体に張り巡らされていた。

また、江戸の建築物は木造が主流であり、火災のたびに建て替えが必要だったが、その際の廃材も再利用された。建物の解体から素材の分別・売買まで、細分化された職人集団が専門的に担っており、これも一種のリサイクル産業と見なすことができる。

現代の環境問題を考える上で、江戸のシステムが示す示唆は大きい。大量生産・大量消費・大量廃棄を前提とした現代の経済モデルとは対照的に、江戸では「捨てるもの」そのものが存在しなかったと言っても過言ではない。もちろん、エネルギーインフラや都市規模の違いがあるため、単純な模倣は不可能だが、「廃棄物ゼロ」という思想的核心は現代のサーキュラーエコノミー論とも共鳴する。

問2：本文で挙げられている江戸の再利用の例として、正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'古着屋が衣服を修繕・染め直して再販し、下水・糞尿は農家が買い取り田畑の肥料にした。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'古紙は農村の肥料として売られ、灰は再生紙の製造業者に渡された。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'廃材は専門業者が海に廃棄し、江戸湾の埋め立てに活用された。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'紙屑買いが古紙を海外に輸出し、その収益で新たな資源を輸入した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 12, 9, '内容理解中文');

  -- dokkai sort=13 daimon=9 (内容理解中文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'江戸時代の東京（江戸）は、18世紀初頭には人口100万人を超える世界最大規模の都市の一つであった。驚くべきは、この巨大都市が廃棄物や資源をほとんど無駄にしない、高度なリサイクルシステムを持って機能していたという点だ。

江戸の都市インフラの中核をなしていたのは、様々な「再利用業者」の存在である。紙屑買いは古紙を集めて再生紙を作る業者に売り、古着屋は衣服を修繕・染め直して再販し、灰買いは調理に使った灰を農村に肥料として売り渡した。下水・糞尿ですら農家が買い取り、田畑の肥料として活用された。こうした循環型経済は経済的合理性に基づいており、廃棄物と見なされたものが別の価値を生む連鎖が都市全体に張り巡らされていた。

また、江戸の建築物は木造が主流であり、火災のたびに建て替えが必要だったが、その際の廃材も再利用された。建物の解体から素材の分別・売買まで、細分化された職人集団が専門的に担っており、これも一種のリサイクル産業と見なすことができる。

現代の環境問題を考える上で、江戸のシステムが示す示唆は大きい。大量生産・大量消費・大量廃棄を前提とした現代の経済モデルとは対照的に、江戸では「捨てるもの」そのものが存在しなかったと言っても過言ではない。もちろん、エネルギーインフラや都市規模の違いがあるため、単純な模倣は不可能だが、「廃棄物ゼロ」という思想的核心は現代のサーキュラーエコノミー論とも共鳴する。

問3：筆者は江戸のシステムと現代の関係についてどのように述べているか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'現代都市は江戸のシステムをそのまま取り入れることで環境問題を解決できる。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'江戸の「廃棄物ゼロ」という思想は、単純な模倣は難しくても現代のサーキュラーエコノミー論と共鳴する。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'江戸の規模では現代の環境問題に対応できないため、参考にすべきでない。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'江戸の職人技術を現代に復元することが、サーキュラーエコノミーの唯一の実現手段だ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 13, 9, '内容理解中文');

  -- dokkai sort=24 daimon=13 (情報検索)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'◆市立図書館　電子書籍サービス利用のご案内◆

市立図書館では、スマートフォン・タブレット・パソコンから電子書籍を借りられる「デジタルライブラリーサービス」を提供しています。令和7年4月より利用対象を拡大し、市内在住・在勤・在学のすべての方にご利用いただけるようになりました。

【利用登録について】
・図書館カードをお持ちの方：専用アプリ「ライブラリーポータル」をダウンロードし、図書館カード番号とパスワードでログインしてください。
・図書館カードをお持ちでない方：窓口または市公式ウェブサイトからカード申請の後、ご利用いただけます。

【貸出条件】
・1回の貸出点数：最大3点
・貸出期間：14日間（期限になると自動返却されます）
・延長：1回のみ可能（貸出中に他の利用者が予約している場合は延長不可）

【利用可能コンテンツ】
・電子書籍（小説・実用書・ビジネス書・絵本など）：約80,000点
・電子雑誌（週刊誌・月刊誌を含む約200誌）：閲覧のみ（貸出不可）
・電子新聞：過去3か月分の閲覧のみ

【注意事項】
・一部のベストセラーや人気タイトルは予約待ちが発生する場合があります。
・電子書籍の内容をスクリーンショットや印刷等により複製することは著作権法上禁止されています。
・サービスの利用は個人目的に限ります。

ご不明な点は市立図書館カウンター（TEL: 000-0000-0000）またはウェブサイトのお問い合わせフォームからご連絡ください。

問1：図書館カードを持っていない市内在住のAさんがこのサービスを利用するには、まず何をすればよいか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専用アプリをダウンロードし、仮のIDでログインして利用を開始する。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'窓口または市公式ウェブサイトから図書館カードの申請をする。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市立図書館のカウンターに電話して、電子書籍の利用許可を得る。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市内在住であることを証明する書類を図書館窓口に持参する。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 24, 13, '情報検索');

  -- dokkai sort=25 daimon=13 (情報検索)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'◆市立図書館　電子書籍サービス利用のご案内◆

市立図書館では、スマートフォン・タブレット・パソコンから電子書籍を借りられる「デジタルライブラリーサービス」を提供しています。令和7年4月より利用対象を拡大し、市内在住・在勤・在学のすべての方にご利用いただけるようになりました。

【利用登録について】
・図書館カードをお持ちの方：専用アプリ「ライブラリーポータル」をダウンロードし、図書館カード番号とパスワードでログインしてください。
・図書館カードをお持ちでない方：窓口または市公式ウェブサイトからカード申請の後、ご利用いただけます。

【貸出条件】
・1回の貸出点数：最大3点
・貸出期間：14日間（期限になると自動返却されます）
・延長：1回のみ可能（貸出中に他の利用者が予約している場合は延長不可）

【利用可能コンテンツ】
・電子書籍（小説・実用書・ビジネス書・絵本など）：約80,000点
・電子雑誌（週刊誌・月刊誌を含む約200誌）：閲覧のみ（貸出不可）
・電子新聞：過去3か月分の閲覧のみ

【注意事項】
・一部のベストセラーや人気タイトルは予約待ちが発生する場合があります。
・電子書籍の内容をスクリーンショットや印刷等により複製することは著作権法上禁止されています。
・サービスの利用は個人目的に限ります。

ご不明な点は市立図書館カウンター（TEL: 000-0000-0000）またはウェブサイトのお問い合わせフォームからご連絡ください。

問2：このサービスについて正しいものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'電子雑誌は最大3点まで借りることができ、14日間の貸出が可能である。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'貸出期間の延長は他の利用者が予約していない場合に限り、何度でも可能だ。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'電子書籍は最大3点まで借りることができ、期限が来ると自動的に返却される。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ベストセラーや人気タイトルは予約ができないため、空いたときに借りるしかない。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 25, 13, '情報検索');

  -- dokkai sort=14 daimon=10 (内容理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'科学技術の急速な発展は、私たちの日常生活に深く浸透し、社会のあり方を根本から変えつつある。遺伝子編集技術、人工知能、気候変動への対応策など、現代の科学的課題は高度に専門化されており、一般市民がその内容を十分に理解することは容易ではない。しかしながら、これらの問題の多くは社会全体に影響を及ぼす意思決定を伴うものであり、専門家のみに判断を委ねることが果たして適切なのかという問いが生じる。

　科学コミュニケーションとは、科学者と市民社会との間に対話の橋を架ける営みである。かつては「欠如モデル」と呼ばれる考え方が主流であった。これは、市民が科学に関する知識を欠如しており、専門家が正確な情報を提供すれば理解が深まり、科学技術への支持が得られるという一方向的な発信モデルである。しかし、この考え方は批判を受けるようになった。なぜなら、人々の懸念は知識不足だけに起因するものではなく、価値観や信頼、社会的な文脈に根ざしているからである。

　現代の科学コミュニケーションは「対話モデル」へと移行しつつある。これは専門家と市民が双方向的に意見を交わし、科学的知見に基づきながらも、倫理的・社会的考慮を取り込んだ意思決定を目指すものだ。市民参加型の科学ガバナンスとも呼ばれ、デンマークのコンセンサス会議のような取り組みがその例として挙げられる。

　一方で課題も多い。科学的リテラシーの格差、メディアによる情報の歪曲、専門家自身のコミュニケーション能力の不足など、障壁は依然として高い。さらに、感情的・政治的に敏感なテーマでは、対話が深まるどころか対立が先鋭化するリスクもある。市民が真に科学的議論に参加するためには、単なる情報提供を超えた教育的・制度的支援が不可欠である。

　科学技術の民主的ガバナンスを実現するためには、専門性と市民性の共存という理想を掲げながら、現実的な仕組みを地道に整備していくほかない。完璧な解答はないが、対話を続けることそのものが、科学と社会の健全な関係を育む第一歩となるだろう。

問1：「欠如モデル」の説明として、本文の内容に合うものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市民が科学への関心を自発的に高めることで、自然と技術への支持が形成されるというモデル', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門家が正確な情報を一方向的に提供することで、市民の理解と支持を得ようとするモデル', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門家と市民が双方向的に対話することで、科学的知識の格差を縮めようとするアプローチ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'科学的リテラシーの差を制度的な支援によって乗り越えようとする政策的枠組み', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 14, 10, '内容理解長文');

  -- dokkai sort=15 daimon=10 (内容理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'科学技術の急速な発展は、私たちの日常生活に深く浸透し、社会のあり方を根本から変えつつある。遺伝子編集技術、人工知能、気候変動への対応策など、現代の科学的課題は高度に専門化されており、一般市民がその内容を十分に理解することは容易ではない。しかしながら、これらの問題の多くは社会全体に影響を及ぼす意思決定を伴うものであり、専門家のみに判断を委ねることが果たして適切なのかという問いが生じる。

　科学コミュニケーションとは、科学者と市民社会との間に対話の橋を架ける営みである。かつては「欠如モデル」と呼ばれる考え方が主流であった。これは、市民が科学に関する知識を欠如しており、専門家が正確な情報を提供すれば理解が深まり、科学技術への支持が得られるという一方向的な発信モデルである。しかし、この考え方は批判を受けるようになった。なぜなら、人々の懸念は知識不足だけに起因するものではなく、価値観や信頼、社会的な文脈に根ざしているからである。

　現代の科学コミュニケーションは「対話モデル」へと移行しつつある。これは専門家と市民が双方向的に意見を交わし、科学的知見に基づきながらも、倫理的・社会的考慮を取り込んだ意思決定を目指すものだ。市民参加型の科学ガバナンスとも呼ばれ、デンマークのコンセンサス会議のような取り組みがその例として挙げられる。

　一方で課題も多い。科学的リテラシーの格差、メディアによる情報の歪曲、専門家自身のコミュニケーション能力の不足など、障壁は依然として高い。さらに、感情的・政治的に敏感なテーマでは、対話が深まるどころか対立が先鋭化するリスクもある。市民が真に科学的議論に参加するためには、単なる情報提供を超えた教育的・制度的支援が不可欠である。

　科学技術の民主的ガバナンスを実現するためには、専門性と市民性の共存という理想を掲げながら、現実的な仕組みを地道に整備していくほかない。完璧な解答はないが、対話を続けることそのものが、科学と社会の健全な関係を育む第一歩となるだろう。

問2：筆者が「欠如モデル」を批判する根拠として挙げているものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門家が市民に情報を伝えるためのコミュニケーション技術が不足しているから', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'科学技術の進歩が速すぎて、情報提供が現実に追いつかないから', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市民の懸念は知識不足だけでなく、価値観や信頼、社会的な文脈にも根ざしているから', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'メディアが科学情報を正確に伝えず、市民の誤解を生みやすい状況が続いているから', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 15, 10, '内容理解長文');

  -- dokkai sort=16 daimon=10 (内容理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'科学技術の急速な発展は、私たちの日常生活に深く浸透し、社会のあり方を根本から変えつつある。遺伝子編集技術、人工知能、気候変動への対応策など、現代の科学的課題は高度に専門化されており、一般市民がその内容を十分に理解することは容易ではない。しかしながら、これらの問題の多くは社会全体に影響を及ぼす意思決定を伴うものであり、専門家のみに判断を委ねることが果たして適切なのかという問いが生じる。

　科学コミュニケーションとは、科学者と市民社会との間に対話の橋を架ける営みである。かつては「欠如モデル」と呼ばれる考え方が主流であった。これは、市民が科学に関する知識を欠如しており、専門家が正確な情報を提供すれば理解が深まり、科学技術への支持が得られるという一方向的な発信モデルである。しかし、この考え方は批判を受けるようになった。なぜなら、人々の懸念は知識不足だけに起因するものではなく、価値観や信頼、社会的な文脈に根ざしているからである。

　現代の科学コミュニケーションは「対話モデル」へと移行しつつある。これは専門家と市民が双方向的に意見を交わし、科学的知見に基づきながらも、倫理的・社会的考慮を取り込んだ意思決定を目指すものだ。市民参加型の科学ガバナンスとも呼ばれ、デンマークのコンセンサス会議のような取り組みがその例として挙げられる。

　一方で課題も多い。科学的リテラシーの格差、メディアによる情報の歪曲、専門家自身のコミュニケーション能力の不足など、障壁は依然として高い。さらに、感情的・政治的に敏感なテーマでは、対話が深まるどころか対立が先鋭化するリスクもある。市民が真に科学的議論に参加するためには、単なる情報提供を超えた教育的・制度的支援が不可欠である。

　科学技術の民主的ガバナンスを実現するためには、専門性と市民性の共存という理想を掲げながら、現実的な仕組みを地道に整備していくほかない。完璧な解答はないが、対話を続けることそのものが、科学と社会の健全な関係を育む第一歩となるだろう。

問3：本文で述べられている「対話モデル」の特徴として最も適切なものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'科学的事実のみを根拠とし、社会的・倫理的判断を意思決定の過程から排除する', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'市民が専門家の意見を一方的に受け入れる形式をとる、改良版の情報提供モデルである', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門家と市民が双方向的に意見を交わし、倫理的・社会的考慮も含めた意思決定を目指す', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'政府が主導して科学ガバナンスの枠組みを強制的に市民に適用する制度的モデルである', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 16, 10, '内容理解長文');

  -- dokkai sort=17 daimon=10 (内容理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'科学技術の急速な発展は、私たちの日常生活に深く浸透し、社会のあり方を根本から変えつつある。遺伝子編集技術、人工知能、気候変動への対応策など、現代の科学的課題は高度に専門化されており、一般市民がその内容を十分に理解することは容易ではない。しかしながら、これらの問題の多くは社会全体に影響を及ぼす意思決定を伴うものであり、専門家のみに判断を委ねることが果たして適切なのかという問いが生じる。

　科学コミュニケーションとは、科学者と市民社会との間に対話の橋を架ける営みである。かつては「欠如モデル」と呼ばれる考え方が主流であった。これは、市民が科学に関する知識を欠如しており、専門家が正確な情報を提供すれば理解が深まり、科学技術への支持が得られるという一方向的な発信モデルである。しかし、この考え方は批判を受けるようになった。なぜなら、人々の懸念は知識不足だけに起因するものではなく、価値観や信頼、社会的な文脈に根ざしているからである。

　現代の科学コミュニケーションは「対話モデル」へと移行しつつある。これは専門家と市民が双方向的に意見を交わし、科学的知見に基づきながらも、倫理的・社会的考慮を取り込んだ意思決定を目指すものだ。市民参加型の科学ガバナンスとも呼ばれ、デンマークのコンセンサス会議のような取り組みがその例として挙げられる。

　一方で課題も多い。科学的リテラシーの格差、メディアによる情報の歪曲、専門家自身のコミュニケーション能力の不足など、障壁は依然として高い。さらに、感情的・政治的に敏感なテーマでは、対話が深まるどころか対立が先鋭化するリスクもある。市民が真に科学的議論に参加するためには、単なる情報提供を超えた教育的・制度的支援が不可欠である。

　科学技術の民主的ガバナンスを実現するためには、専門性と市民性の共存という理想を掲げながら、現実的な仕組みを地道に整備していくほかない。完璧な解答はないが、対話を続けることそのものが、科学と社会の健全な関係を育む第一歩となるだろう。

問4：この文章で筆者が最も主張したいことはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'科学的リテラシーの向上こそが、科学ガバナンスにおける唯一の解決策である', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'完璧な解答はないが、対話を続けることが科学と社会の健全な関係を育む第一歩となる', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'専門家による科学的意思決定への市民参加は現実には困難であり、理想論に過ぎない', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'メディアの報道姿勢を改革することが、科学コミュニケーションの最優先課題である', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 17, 10, '内容理解長文');

  -- dokkai sort=18 daimon=11 (統合理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'A

グローバル化が進む現代社会において、異なる文化的背景を持つ人々が共に暮らすことは避けられない現実となっている。そのような状況において、多文化共生を実現するためには、共通のルールや価値観を形成することが不可欠である。移民や外国籍住民が社会に溶け込むためには、受け入れ社会の言語を習得し、基本的な社会規範を共有することが求められる。文化的な差異を尊重することは大切だが、社会の統一性と結束力を維持するためには、ある程度の文化的統合が必要だと言えよう。

B

多文化共生を語るとき、しばしば「統合」という言葉が用いられるが、これは文化的同質化を招く危険性をはらんでいる。少数文化を持つ人々が自らのアイデンティティを捨て、多数派文化に吸収されることを強いられるとすれば、それは共生ではなく同化である。真の多文化共生とは、それぞれの文化が独自の価値を保ちながら共存する状態を指す。共通のルールは社会秩序のために必要だとしても、文化的多様性そのものを社会の豊かさとして捉え、積極的に保護していく姿勢が求められる。

問1：AとBが共通して述べていることはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'社会の統一性を維持するためには文化的同質化がある程度必要だということ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'多文化共生の実現には、何らかの共通のルールや規範が必要だということ', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'少数文化を持つ人々は多数派の文化に積極的に合わせていくべきだということ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'文化的多様性を放置すれば、社会の分断を招くリスクがあるということ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 18, 11, '統合理解');

  -- dokkai sort=19 daimon=11 (統合理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'A

グローバル化が進む現代社会において、異なる文化的背景を持つ人々が共に暮らすことは避けられない現実となっている。そのような状況において、多文化共生を実現するためには、共通のルールや価値観を形成することが不可欠である。移民や外国籍住民が社会に溶け込むためには、受け入れ社会の言語を習得し、基本的な社会規範を共有することが求められる。文化的な差異を尊重することは大切だが、社会の統一性と結束力を維持するためには、ある程度の文化的統合が必要だと言えよう。

B

多文化共生を語るとき、しばしば「統合」という言葉が用いられるが、これは文化的同質化を招く危険性をはらんでいる。少数文化を持つ人々が自らのアイデンティティを捨て、多数派文化に吸収されることを強いられるとすれば、それは共生ではなく同化である。真の多文化共生とは、それぞれの文化が独自の価値を保ちながら共存する状態を指す。共通のルールは社会秩序のために必要だとしても、文化的多様性そのものを社会の豊かさとして捉え、積極的に保護していく姿勢が求められる。

問2：AとBの立場の違いを最もよく表しているものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'Aは移民の言語習得を重視しているが、Bは移民の法的権利保護を優先すべきだと述べている', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'Aは文化的統合を多文化共生の条件とし、Bは文化の独自性の保持こそが真の共生だと主張している', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'Aはグローバル化を肯定的に評価しているが、Bはグローバル化に批判的な立場をとっている', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'Aは制度整備を優先すべきと考え、Bは個人の意識変革こそが先決だと主張している', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 19, 11, '統合理解');

  -- dokkai sort=20 daimon=12 (主張理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の教育改革は、長年にわたって「詰め込み教育」と「ゆとり教育」という二項対立の枠組みの中で議論されてきた。前者は知識の量的習得を重視し、後者は子どもの主体的な学びや創造性を育むことを目指すものである。しかし、この二分法はあまりにも単純化されており、実際の教育現場が抱える複雑な課題を見えにくくしているのではないかと筆者は考える。

　知識の習得と探究的な学びは、本来対立するものではない。豊かな探究活動を行うためには、その基盤となる確かな知識が不可欠である。逆に、知識を単に暗記するだけでは、それを活用し、新たな問いを立てる力は育たない。真の学力とは、知識と思考力の有機的な統合によって初めて実現されるものである。

　問題はカリキュラムの設計だけではない。教員の指導力、評価方法、学習環境、さらには社会全体の教育に対する価値観など、多くの要素が絡み合っている。特に評価の問題は深刻である。入試が知識の再現を主に測るものであれば、どれほど「探究学習」を掲げた授業をしても、教室の現実は暗記中心にならざるを得ない。教育の質を高めるためには、評価体系そのものの変革が先決だという意見もある。

　一方で、過度な改革への期待も禁物である。教育は文化の継承という側面も持ち、急激な変化は教育現場の混乱を招く。教師たちが安心して授業に取り組めるような継続的な研修と支援体制の整備が、改革の成否を左右する。

　教育改革の本質は、対立する理念のどちらかを「正解」とすることではない。現場の実践から学び、多様な子どもたちのニーズに柔軟に応えながら、知識と探究の融合を粘り強く追求することこそが、これからの教育に求められる姿勢ではないだろうか。

問1：筆者は「詰め込み教育」と「ゆとり教育」の二項対立についてどのように述べているか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'どちらの立場も一定の合理性を持っており、状況に応じて使い分けるべきだ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'「ゆとり教育」の理念は正しく、「詰め込み教育」は完全に否定されるべきだ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'この二分法は単純化されすぎており、実際の教育現場の複雑な課題を見えにくくしている', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'知識習得を重視する教育こそが、長期的に見て子どもの学力向上に最も貢献する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 20, 12, '主張理解長文');

  -- dokkai sort=21 daimon=12 (主張理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の教育改革は、長年にわたって「詰め込み教育」と「ゆとり教育」という二項対立の枠組みの中で議論されてきた。前者は知識の量的習得を重視し、後者は子どもの主体的な学びや創造性を育むことを目指すものである。しかし、この二分法はあまりにも単純化されており、実際の教育現場が抱える複雑な課題を見えにくくしているのではないかと筆者は考える。

　知識の習得と探究的な学びは、本来対立するものではない。豊かな探究活動を行うためには、その基盤となる確かな知識が不可欠である。逆に、知識を単に暗記するだけでは、それを活用し、新たな問いを立てる力は育たない。真の学力とは、知識と思考力の有機的な統合によって初めて実現されるものである。

　問題はカリキュラムの設計だけではない。教員の指導力、評価方法、学習環境、さらには社会全体の教育に対する価値観など、多くの要素が絡み合っている。特に評価の問題は深刻である。入試が知識の再現を主に測るものであれば、どれほど「探究学習」を掲げた授業をしても、教室の現実は暗記中心にならざるを得ない。教育の質を高めるためには、評価体系そのものの変革が先決だという意見もある。

　一方で、過度な改革への期待も禁物である。教育は文化の継承という側面も持ち、急激な変化は教育現場の混乱を招く。教師たちが安心して授業に取り組めるような継続的な研修と支援体制の整備が、改革の成否を左右する。

　教育改革の本質は、対立する理念のどちらかを「正解」とすることではない。現場の実践から学び、多様な子どもたちのニーズに柔軟に応えながら、知識と探究の融合を粘り強く追求することこそが、これからの教育に求められる姿勢ではないだろうか。

問2：筆者が「真の学力」について述べていることとして最も適切なものはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'多くの知識を正確に記憶し、試験で高得点を安定して取ることができる能力のことである', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'探究的な姿勢を持ち、既存の枠にとらわれず自由に発想できる創造性のことである', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'知識と思考力が有機的に統合されることで初めて実現されるものである', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'社会に出て即戦力となる職業的スキルと実践的な専門知識のことである', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 21, 12, '主張理解長文');

  -- dokkai sort=22 daimon=12 (主張理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の教育改革は、長年にわたって「詰め込み教育」と「ゆとり教育」という二項対立の枠組みの中で議論されてきた。前者は知識の量的習得を重視し、後者は子どもの主体的な学びや創造性を育むことを目指すものである。しかし、この二分法はあまりにも単純化されており、実際の教育現場が抱える複雑な課題を見えにくくしているのではないかと筆者は考える。

　知識の習得と探究的な学びは、本来対立するものではない。豊かな探究活動を行うためには、その基盤となる確かな知識が不可欠である。逆に、知識を単に暗記するだけでは、それを活用し、新たな問いを立てる力は育たない。真の学力とは、知識と思考力の有機的な統合によって初めて実現されるものである。

　問題はカリキュラムの設計だけではない。教員の指導力、評価方法、学習環境、さらには社会全体の教育に対する価値観など、多くの要素が絡み合っている。特に評価の問題は深刻である。入試が知識の再現を主に測るものであれば、どれほど「探究学習」を掲げた授業をしても、教室の現実は暗記中心にならざるを得ない。教育の質を高めるためには、評価体系そのものの変革が先決だという意見もある。

　一方で、過度な改革への期待も禁物である。教育は文化の継承という側面も持ち、急激な変化は教育現場の混乱を招く。教師たちが安心して授業に取り組めるような継続的な研修と支援体制の整備が、改革の成否を左右する。

　教育改革の本質は、対立する理念のどちらかを「正解」とすることではない。現場の実践から学び、多様な子どもたちのニーズに柔軟に応えながら、知識と探究の融合を粘り強く追求することこそが、これからの教育に求められる姿勢ではないだろうか。

問3：本文において評価の問題が深刻とされる理由はどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'入試で知識の再現が重視される限り、探究学習を掲げた授業も実態は暗記中心にならざるをえないから', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'教師の評価能力が不足しており、子どもの本当の学力を正確に測ることができないから', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'評価方法の多様化により、子どもが基準に混乱して学習意欲を失いやすくなっているから', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'保護者の評価結果への関心が高すぎるため、教師が本来の授業に専念できないから', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 22, 12, '主張理解長文');

  -- dokkai sort=23 daimon=12 (主張理解長文)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000152'::uuid, E'日本の教育改革は、長年にわたって「詰め込み教育」と「ゆとり教育」という二項対立の枠組みの中で議論されてきた。前者は知識の量的習得を重視し、後者は子どもの主体的な学びや創造性を育むことを目指すものである。しかし、この二分法はあまりにも単純化されており、実際の教育現場が抱える複雑な課題を見えにくくしているのではないかと筆者は考える。

　知識の習得と探究的な学びは、本来対立するものではない。豊かな探究活動を行うためには、その基盤となる確かな知識が不可欠である。逆に、知識を単に暗記するだけでは、それを活用し、新たな問いを立てる力は育たない。真の学力とは、知識と思考力の有機的な統合によって初めて実現されるものである。

　問題はカリキュラムの設計だけではない。教員の指導力、評価方法、学習環境、さらには社会全体の教育に対する価値観など、多くの要素が絡み合っている。特に評価の問題は深刻である。入試が知識の再現を主に測るものであれば、どれほど「探究学習」を掲げた授業をしても、教室の現実は暗記中心にならざるを得ない。教育の質を高めるためには、評価体系そのものの変革が先決だという意見もある。

　一方で、過度な改革への期待も禁物である。教育は文化の継承という側面も持ち、急激な変化は教育現場の混乱を招く。教師たちが安心して授業に取り組めるような継続的な研修と支援体制の整備が、改革の成否を左右する。

　教育改革の本質は、対立する理念のどちらかを「正解」とすることではない。現場の実践から学び、多様な子どもたちのニーズに柔軟に応えながら、知識と探究の融合を粘り強く追求することこそが、これからの教育に求められる姿勢ではないだろうか。

問4：この文章で筆者が最も主張したいことはどれか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'教育改革の成功には、保護者や社会全体の意識改革が最も重要な前提条件となる', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'知識と探究の融合を粘り強く追求することこそ、これからの教育に求められる姿勢だ', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'急激な教育改革は現場を混乱させるため、現状の教育制度を基本的に維持すべきだ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'評価体系を変えることが教育改革において最優先に取り組むべき唯一の課題だ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'dokkai', 23, 12, '主張理解長文');

  -- choukai sort=1 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

男性：課長、来週の取引先へのプレゼン資料なんですが、まだ骨格しかできていなくて…
女性：そうか。まず競合他社の分析データを揃えてから全体の構成を固めて。数字がないと説得力に欠けるから。
男性：承知しました。データは経営企画部に問い合わせれば取れますよね？
女性：そう。ただ、向こうも忙しいから、依頼するときは必要な項目を具体的にリストアップして送ってね。

質問：男性はこの後まず何をしますか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'プレゼン資料の骨格を完成させる', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'取引先に連絡して日程を確認する', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'経営企画部に問い合わせる競合データの項目をリストアップする', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'経営企画部に直接出向いてデータを受け取る', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 1, 1, '課題理解');

  -- choukai sort=2 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：田中、来週引越しするんだって？手伝おうか？
男性：ありがとう。でも運搬は業者に頼んでるから大丈夫。ただ、新居の掃除と荷ほどきが大変で…
女性：じゃあ当日の午後から行くよ。何か持っていくものある？
男性：段ボールはたくさんあるから、できれば清掃用具を一式持ってきてもらえると助かる。

質問：女性はこの後何をしますか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'引越し業者に連絡して日程を変更する', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'新居に今すぐ荷ほどきを手伝いに行く', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'清掃用具を用意して当日の午後に新居へ向かう準備をする', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'段ボールを大量に購入して届ける', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 2, 1, '課題理解');

  -- choukai sort=3 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：鈴木さん、明日の部門会議の議事録担当って決まってましたっけ？
男性：前回は私がやったから、今回は田中さんの番のはずです。でも田中さん、明日休みらしくて…
女性：じゃあ私が代わりに取れますよ。ただ、会議の目的と議題をあらかじめ教えてもらえますか？準備しておきたいので。
男性：分かりました。今から議題リストをメールで送ります。

質問：男性はこの後すぐ何をしますか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'田中さんに連絡して出席をお願いする', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'議題リストを女性にメールで送る', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部門会議の日程を変更する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'自分が議事録を取る準備をする', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 3, 1, '課題理解');

  -- choukai sort=4 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：健診の結果が来たんだけど、血圧の数値が少し高くて。
男性：それは心配だね。先生には診てもらったの？
女性：まだなの。かかりつけ医に電話しようと思ってるんだけど、予約が取りにくくて。
男性：じゃあ、まず結果の紙を持って総合病院の内科に直接行ってみたら？紹介状なしでも診てもらえるよ。

質問：女性はこの後どうすることになりましたか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'かかりつけ医に電話して予約を取る', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'自宅で安静にして様子を見る', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'健診の結果票を持って総合病院の内科に行く', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'男性に付き添いを頼んで一緒に病院へ行く', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 4, 1, '課題理解');

  -- choukai sort=5 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

男性：山田さん、提出してもらった報告書だけど、第3節の数字の根拠が薄いな。
女性：おっしゃる通りです。昨年度との比較データが不足していました。
男性：比較表を追加して、できれば今日中に再提出してほしい。あと、表紙の日付も修正してね。
女性：承知しました。比較データはすでに手元にあるので、すぐに取り掛かります。

質問：女性はこの後まず何をしますか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部長に昨年度のデータを問い合わせる', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'報告書の全体を最初から書き直す', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'第3節に比較表を追加して報告書を修正し、今日中に再提出する', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'来週までに修正版を用意する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 5, 1, '課題理解');

  -- choukai sort=6 daimon=1 (課題理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：先日購入したジャケットなんですが、着てみたらサイズが少し大きくて。
男性：ご不便をおかけして申し訳ございません。レシートはお持ちですか？
女性：はい、こちらです。同じデザインのSサイズに換えていただけますか？
男性：確認いたします…Sサイズの在庫がございました。ただ、タグをお切りになっておりましたら交換対応ができかねますので、ご確認いただけますか？
女性：あ、切っていないです。

質問：女性はこの後何をしますか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'後日改めて店に来て交換手続きをする', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'タグが付いていることを確認させ、Sサイズに交換してもらう', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'返金を求めてオンラインで同じ商品を注文する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'タグを確認してから一度帰宅し、後で電話する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 6, 1, '課題理解');

  -- choukai sort=7 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性A：今日はQ3の新製品ローンチについて話し合いたいと思います。田中さん、現状の課題を整理してもらえますか？
男性：はい。大きく三点あります。ターゲット層への認知度不足、SNS活用の遅れ、販売チャネルが既存店舗のみに偏っている点です。
女性B：SNSについては先月から試験運用を始めているので、効果が出るのはもう少し先かと。
女性A：そうですね。今最優先でやるべきは認知度の底上げでしょう。チャネル拡大はその後の話です。まずテレビCMと大手ポータルサイトへの広告出稿を進めてください。

質問：この会議でまず取り組む最優先事項は何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'SNSの本格運用を前倒しで開始する', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'販売チャネルをオンラインに拡大する', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'テレビCMと広告出稿で製品の認知度を高める', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'競合他社のマーケティング手法を詳細に分析する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 7, 2, 'ポイント理解');

  -- choukai sort=8 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

男性：本日はどのようなご相談でしょうか。
女性：住宅ローンを検討しているんですが、固定金利と変動金利のどちらがいいか迷っていまして。
男性：ご返済期間と、金利変動のリスク許容度によりますね。変動金利は現在低いですが今後の上昇リスクがあります。固定金利は少し高めですが返済額が安定します。
女性：私は収入が安定していないフリーランスなので、毎月の返済額が一定の方が安心なんです。
男性：でしたら固定金利がお勧めです。特に現在はフラット35が有利な条件になっています。

質問：担当者が女性に勧めたローンはどれですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'変動金利型ローン', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'固定金利型のフラット35', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'短期固定から変動への切り替え型ローン', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'無利子の公的融資制度', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 8, 2, 'ポイント理解');

  -- choukai sort=9 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の話を聴いて、質問に答えてください。

先生：今日は認知バイアスの中でも特に重要な「確証バイアス」について説明します。これは、人が自分の既存の信念や仮説を支持する情報を優先的に集め、反証する情報を無視または軽視する傾向のことです。例えば、あるダイエット法が効果的だと信じている人は、それを支持する成功例だけを集め、失敗例には目を向けない傾向があります。このバイアスが厄介なのは、無意識に行われることです。意識的に反証を探す習慣を持つことが、より合理的な判断につながります。

質問：確証バイアスとはどのような傾向ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'新しい情報よりも古い情報を信頼する傾向', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'感情的になると判断力が著しく低下する傾向', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'自分の信念を支持する情報だけを集め、反証を無視する傾向', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'他者の意見に流されて自分の判断を変えやすい傾向', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 9, 2, 'ポイント理解');

  -- choukai sort=10 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の話を聴いて、質問に答えてください。

アナウンサー：今日は政府が発表した少子化対策パッケージについて解説します。今回の対策は三本柱から成っています。一つ目は児童手当の拡充で、高校生まで支給対象が広がります。二つ目は保育所の待機児童ゼロ化に向けた施設整備支援です。三つ目は育児休業取得率の向上を目指した企業への助成制度です。政府は特に、経済的負担の軽減が最も即効性があると判断し、児童手当の拡充に最大の予算を配分しました。

質問：政府が最も予算を重点配分した対策はどれですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'企業への育児休業取得促進助成', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'保育所の待機児童解消に向けた施設整備支援', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'高校生まで対象を広げた児童手当の拡充', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'大学までの教育費完全無償化', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 10, 2, 'ポイント理解');

  -- choukai sort=11 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：来月の外部研修、松本さんも参加するって聞きました。
男性：ええ。マーケティングの最新トレンドを学ぶのが目的なんですが、実は一番期待しているのは他社の参加者とのネットワーキングなんです。業界内のつながりが増えると、情報収集や将来的なコラボレーションの面でも大きいですから。
女性：なるほど。勉強だけじゃなくて人脈づくりも大事ですよね。
男性：そうなんです。セミナーの内容自体はオンラインでも取れる情報が多いですから。

質問：松本さんが研修に参加する最も大きな目的は何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'マーケティングの最新知識を体系的に習得すること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'社内での昇進評価につなげること', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'他社参加者とのネットワークを築くこと', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'研修の講師陣から直接指導を受けること', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 11, 2, 'ポイント理解');

  -- choukai sort=12 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

女性：週末、お父さんの誕生日会、実家でやるって決めてたよね。
男性：そうなんだけど、お父さんから連絡があって、知り合いの法事が急遽入ったらしくて。
女性：えっ、じゃあ場所を変えるの？
男性：うん。外のレストランに予約入れようと思ってるんだけど、この間行った和食のところ、あそこなら個室があったよな。
女性：あそこ人気だから、早めに電話しないとね。
男性：じゃあ今から電話してみる。

質問：誕生日会の計画が変更になった理由は何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'父親が誕生日会への出席を断ったから', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'父親に急遽法事の予定が入ったから', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'希望していたレストランの予約がすでに埋まっていたから', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'実家の改装工事が週末に始まるから', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 12, 2, 'ポイント理解');

  -- choukai sort=13 daimon=2 (ポイント理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の会話を聴いて、質問に答えてください。

男性A：新しい在庫管理システムの導入から一か月経ちますが、現場からの声はどうですか？
女性：操作性については概ね好評なんですが、既存の販売管理システムとのデータ連携でエラーが頻発していまして。手作業で修正している状態が続いています。
男性B：ベンダーには報告済みですが、修正パッチの提供が来月になると言われていて。
男性A：それが一番の問題ですね。パッチが来るまでの間、エラーログを全件記録して、ベンダーへのエスカレーションを強化してください。

質問：新システムの導入で最も問題になっていることは何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'操作が複雑で社員が使いこなせていないこと', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'システムの導入コストが予算を超えたこと', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'既存の販売管理システムとのデータ連携エラーが頻発していること', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ベンダーのサポート対応が契約内容と異なること', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 13, 2, 'ポイント理解');

  -- choukai sort=14 daimon=3 (概要理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の話を聴いて、質問に答えてください。

先生：今日は「無縁社会」という現象について考えてみたいと思います。高度経済成長期、日本では多くの人が地方から都市へ移住し、企業という共同体に属することで人間関係を築いてきました。しかし、非正規雇用の増加と核家族化の進展により、企業や家族というつながりが弱体化しました。さらにインターネットの普及は表面的な接触を増やす一方で、深い対面的人間関係を希薄化させたという側面があります。孤独死や無縁仏の増加は、この社会構造の変化が生み出した深刻な結果です。つまりこの問題の本質は、経済構造と家族構造の変化による人間的つながりの喪失にあると言えます。

質問：この講義で最も伝えたいことは何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'インターネットの普及が現代人の人間関係を直接破壊しているということ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'孤独死問題を解決するためにNPO活動の支援が急務だということ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'経済・家族構造の変化による人的つながりの喪失が無縁社会の本質だということ', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'核家族化を防ぐために地域コミュニティの再建を国が主導すべきだということ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 14, 3, '概要理解');

  -- choukai sort=15 daimon=3 (概要理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の話を聴いて、質問に答えてください。

アナウンサー：今日は「睡眠の科学」についてお伝えします。近年の研究で、睡眠中に脳内のグリア細胞が老廃物を除去するグリンファティック系という仕組みが注目されています。この仕組みが機能不全になると、アルツハイマー病の原因とされるアミロイドβが蓄積しやすくなるとされています。特に注目すべきは、仮眠でも夜間睡眠でも一定の効果はありますが、深い徐波睡眠の段階で最も効率よく老廃物が排出されるという点です。つまり、長さだけでなく睡眠の「質」こそが脳の健康を左右するということです。

質問：この解説が最も伝えたいことは何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'アルツハイマー病を防ぐためには毎日8時間以上の睡眠が必要だということ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'仮眠は夜間睡眠の代替として十分な効果があるということ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'脳の健康に最も重要なのは睡眠の長さではなく質であること', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'グリア細胞の働きはまだ十分に解明されていないということ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 15, 3, '概要理解');

  -- choukai sort=16 daimon=3 (概要理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の話を聴いて、質問に答えてください。

講師：今日は「失敗から学ぶリーダーシップ」についてお話しします。私は30年のビジネス経験の中で何度も大きな失敗をしてきました。最初は失敗を隠したくなるものです。しかし私が学んだ最も重要な教訓は、失敗を素早く認め、チームと情報を共有することの力です。隠すほど問題は大きくなり、信頼を失います。一方、失敗を素直に開示したとき、チームは一致団結して解決策を探し、かえって組織が強くなるという経験を何度もしました。つまり、強いリーダーとは失敗しない人ではなく、失敗をオープンに扱い、そこから組織全体で学べる人なのです。

質問：講演者が最も伝えたいことは何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'リーダーは常に成功体験を積み上げることが重要だということ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'失敗を隠さずチームと共有することが組織の強さにつながるということ', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'30年の経験を積めば大きな失敗は回避できるということ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'リーダーは個人の能力よりも社内外の人脈を重視すべきだということ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 16, 3, '概要理解');

  -- choukai sort=17 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「この件、先方から難色を示されているようですが…」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そんなことは気にせず、押し切ってしまいましょう。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですか。条件をもう一度整理した上で、再度ご提案してみましょうか。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'難色を示すとは、賛成してくださったということですね。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'では、この話はなかったことにしましょう。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 17, 4, '即時応答');

  -- choukai sort=18 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「今度の会議、少し段取りが悪かったですかね。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですね、事前の準備をもう少し丁寧にしておけばよかったかもしれませんね。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'会議は段取り通りに進みましたよ。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'段取りが悪いとは、具体的にどのような点でしょうか。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そんなことはありません、完璧でしたよ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 18, 4, '即時応答');

  -- choukai sort=19 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「ご迷惑をおかけしてしまい、お詫びの申し上げようもございません。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'こちらこそ、先ほどは失礼いたしました。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いいえ、大変なご迷惑をおかけされましたね。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いいえ、とんでもございません。どうぞお気になさらずに。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'おっしゃる通り、大変ご迷惑をおかけしました。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 19, 4, '即時応答');

  -- choukai sort=20 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「例の企画、上に通してもらえるかどうか、綱渡りですね。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'綱渡りとはどういう意味でしょうか。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そんなに難しくはないと思いますよ。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですね。説明資料をもう少し充実させておいた方がいいかもしれませんね。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'上に通す必要はないでしょう。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 20, 4, '即時応答');

  -- choukai sort=21 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「今回の件、少し出過ぎたまねをしてしまいましたかね。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いいえ、ご判断はまったく適切だったと思いますよ。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですね、少し行き過ぎだったと思います。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'出過ぎたとはどういうことでしょうか。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'今後はもう少し積極的に関わっていただけますか。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 21, 4, '即時応答');

  -- choukai sort=22 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「先月の売上、思ったより伸び悩みましたね。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですね、原因をしっかり分析して来月の施策に活かしましょう。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'売上は予定通りだと思いますが。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'では今月も同じ方針でやってみましょう。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'伸び悩むのは仕方がないことですよ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 22, 4, '即時応答');

  -- choukai sort=23 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「本日はご多忙のところ、お時間を割いていただきまして。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'はい、お時間はしっかり確保しておきました。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いいえ、ご多忙ではございませんので。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'こちらこそ、貴重なお時間をいただきありがとうございました。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'いえ、こちらこそご足労いただき恐縮です。またいつでもお声がけください。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 23, 4, '即時応答');

  -- choukai sort=24 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「部長の説明、少し煙に巻かれた感じがするんですが…」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部長がそんなことをするはずありませんよ。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'私もそう感じました。後でもう一度内容を確認してみましょうか。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部長はいつも分かりやすく説明してくださいますよね。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'煙に巻かれたとはどういう状況でしょうか。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 24, 4, '即時応答');

  -- choukai sort=25 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「あのプロジェクト、二転三転していてどうなるか分からない状況ですよ。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'では、今すぐ撤退した方がいいですね。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'そうですね。定期的に状況を共有しながら、柔軟に対応していくしかないですね。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'二転三転することはよくあることですよ。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'何が問題なのかまったく見当がつきませんね。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 25, 4, '即時応答');

  -- choukai sort=26 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「ようやく先方のご担当が腰を上げてくれましたよ。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'腰がお悪いのでしょうか。お大事にとお伝えください。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'それは良かったですね。では、こちらも準備を急ぎましょう。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'もう少し様子を見た方がよくないですか。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'腰を上げるのが遅すぎましたね。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 26, 4, '即時応答');

  -- choukai sort=27 daimon=4 (即時応答)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'次の発話に対する最もよい応答を選んでください。

発話：「お忙しいところ恐れ入りますが、少々お時間をいただいてもよろしいでしょうか。」', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'恐れることは何もありませんよ。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'少々では足りませんか。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'ええ、何かご用でしょうか。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'お時間のある時にまたどうぞ。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 27, 4, '即時応答');

  -- choukai sort=28 daimon=5 (統合理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'ある会社の会議室で、事業部長と、営業推進部の井上課長、システム管理部の木村課長、カスタマーサービス部の中野課長が、新しいプロジェクト管理ツールの全社統一導入について話し合っています。

事業部長：今日は、プロジェクト管理ツールの全社統一導入について、各部門のご意見を伺いたいと思います。まず、井上課長から現状の課題を説明してください。

井上（営業推進部課長）：はい。現在、部門ごとに異なるツールを使っているため、進捗確認だけで毎週何度も会議が必要で、管理工数が非常に多くなっています。統一ツールを導入すれば情報共有がリアルタイムになり、管理工数を大幅に削減できます。初期コストはかかりますが、年間換算では十分回収できる試算です。

木村（システム管理部課長）：効率化の必要性は理解しています。ただ、現行の社内システムとのデータ連携に技術的な問題があります。API連携の検討だけで最低3か月かかりますし、移行期間中のシステムトラブルが現業務に影響するリスクも小さくありません。また、データセキュリティの観点から、ツールのセキュリティ仕様の精査も欠かせません。

中野（カスタマーサービス部課長）：現場の立場からは、新ツールへの習熟期間が心配です。繁忙期には研修に時間が取れないため、導入時期には十分な配慮が必要です。ツールの操作性も重要で、現場スタッフが日常的に無理なく使えるものでないと定着しません。

事業部長：では、まずシステム部が技術検討を進める間に、営業推進部でツールの候補を絞り込み、閑散期にパイロット導入を試みる進め方はどうでしょうか。

井上：現実的だと思います。候補の選定は来月中に完了できます。

木村：技術面の検討を並行して進められますね。セキュリティ仕様の確認も合わせて行えます。

中野：閑散期なら研修時間も確保でき、現場への影響を最小限にできます。

事業部長：では、来月末までにツール候補の選定とAPI連携・セキュリティの技術検討を並行して進め、閑散期にパイロット導入を実施する方向で合意したいと思います。

問1：木村課長が最も強調した懸念は何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'新ツールの導入コストが高く、費用回収が困難であること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'現場スタッフがツールに慣れるまで時間がかかること', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'既存システムとの連携に技術的な課題があり、セキュリティ仕様の精査も必要なこと', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'繁忙期に研修を実施するのが難しいこと', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 28, 5, '統合理解');

  -- choukai sort=29 daimon=5 (統合理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'ある会社の会議室で、事業部長と、営業推進部の井上課長、システム管理部の木村課長、カスタマーサービス部の中野課長が、新しいプロジェクト管理ツールの全社統一導入について話し合っています。

事業部長：今日は、プロジェクト管理ツールの全社統一導入について、各部門のご意見を伺いたいと思います。まず、井上課長から現状の課題を説明してください。

井上（営業推進部課長）：はい。現在、部門ごとに異なるツールを使っているため、進捗確認だけで毎週何度も会議が必要で、管理工数が非常に多くなっています。統一ツールを導入すれば情報共有がリアルタイムになり、管理工数を大幅に削減できます。初期コストはかかりますが、年間換算では十分回収できる試算です。

木村（システム管理部課長）：効率化の必要性は理解しています。ただ、現行の社内システムとのデータ連携に技術的な問題があります。API連携の検討だけで最低3か月かかりますし、移行期間中のシステムトラブルが現業務に影響するリスクも小さくありません。また、データセキュリティの観点から、ツールのセキュリティ仕様の精査も欠かせません。

中野（カスタマーサービス部課長）：現場の立場からは、新ツールへの習熟期間が心配です。繁忙期には研修に時間が取れないため、導入時期には十分な配慮が必要です。ツールの操作性も重要で、現場スタッフが日常的に無理なく使えるものでないと定着しません。

事業部長：では、まずシステム部が技術検討を進める間に、営業推進部でツールの候補を絞り込み、閑散期にパイロット導入を試みる進め方はどうでしょうか。

井上：現実的だと思います。候補の選定は来月中に完了できます。

木村：技術面の検討を並行して進められますね。セキュリティ仕様の確認も合わせて行えます。

中野：閑散期なら研修時間も確保でき、現場への影響を最小限にできます。

事業部長：では、来月末までにツール候補の選定とAPI連携・セキュリティの技術検討を並行して進め、閑散期にパイロット導入を実施する方向で合意したいと思います。

問2：井上課長がツール導入のメリットとして最も強調したことは何ですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'外部のクライアントとのプロジェクト情報共有がリアルタイムになること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'部門間の情報共有が一元化され、管理工数が大幅に削減されること', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'初期導入コストを来月中に全額回収できること', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'毎週の定例会議をすべてなくすことができること', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 29, 5, '統合理解');

  -- choukai sort=30 daimon=5 (統合理解)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type)
    VALUES ('ad000001-0000-0000-0000-000000000153'::uuid, E'ある会社の会議室で、事業部長と、営業推進部の井上課長、システム管理部の木村課長、カスタマーサービス部の中野課長が、新しいプロジェクト管理ツールの全社統一導入について話し合っています。

事業部長：今日は、プロジェクト管理ツールの全社統一導入について、各部門のご意見を伺いたいと思います。まず、井上課長から現状の課題を説明してください。

井上（営業推進部課長）：はい。現在、部門ごとに異なるツールを使っているため、進捗確認だけで毎週何度も会議が必要で、管理工数が非常に多くなっています。統一ツールを導入すれば情報共有がリアルタイムになり、管理工数を大幅に削減できます。初期コストはかかりますが、年間換算では十分回収できる試算です。

木村（システム管理部課長）：効率化の必要性は理解しています。ただ、現行の社内システムとのデータ連携に技術的な問題があります。API連携の検討だけで最低3か月かかりますし、移行期間中のシステムトラブルが現業務に影響するリスクも小さくありません。また、データセキュリティの観点から、ツールのセキュリティ仕様の精査も欠かせません。

中野（カスタマーサービス部課長）：現場の立場からは、新ツールへの習熟期間が心配です。繁忙期には研修に時間が取れないため、導入時期には十分な配慮が必要です。ツールの操作性も重要で、現場スタッフが日常的に無理なく使えるものでないと定着しません。

事業部長：では、まずシステム部が技術検討を進める間に、営業推進部でツールの候補を絞り込み、閑散期にパイロット導入を試みる進め方はどうでしょうか。

井上：現実的だと思います。候補の選定は来月中に完了できます。

木村：技術面の検討を並行して進められますね。セキュリティ仕様の確認も合わせて行えます。

中野：閑散期なら研修時間も確保でき、現場への影響を最小限にできます。

事業部長：では、来月末までにツール候補の選定とAPI連携・セキュリティの技術検討を並行して進め、閑散期にパイロット導入を実施する方向で合意したいと思います。

問3：この会議で合意された内容として最も適切なものはどれですか。', 'multiple_choice')
    RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'システム連携の問題が解決するまで、ツール導入を全面的に見送ることにした', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'来月末までにツール候補の選定と技術検討を並行して進め、閑散期にパイロット導入を実施することにした', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'セキュリティ仕様の確認が完了するまで、候補の選定を開始しないことにした', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
    VALUES (qid, E'システム管理部が主導してツールの選定から導入まで一括して実施することにした', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype)
    VALUES (set_id, qid, 'choukai', 30, 5, '統合理解');

END$$;
