DO $$
DECLARE
  set_id UUID;
  qid UUID;
BEGIN
  -- Set 4 기존 ID 사용 (pre-seeded stub)
  SELECT id INTO set_id FROM jlpt_mock_sets WHERE level='N1' AND set_no=4;

  -- sort=1 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「輻輳」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふくとう', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふうそう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふくそう', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ぶくそう', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 1, 1, '漢字読み');

  -- sort=2 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「俯瞰」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふかん', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふうかん', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ぶかん', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ふかく', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 2, 1, '漢字読み');

  -- sort=3 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「乖離」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'がいり', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'こうり', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'かいれい', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'かいり', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 3, 1, '漢字読み');

  -- sort=4 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「逼迫」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひはく', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひっぱく', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひんぱく', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひっぱつ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 4, 1, '漢字読み');

  -- sort=5 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「錯綜」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'さっそう', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ざくそう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'さくそう', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'さくとう', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 5, 1, '漢字読み');

  -- sort=6 daimon=1 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「醸成」の読み方として正しいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'じょうせい', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'じょうそう', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'にょうせい', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'じょうさい', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 6, 1, '漢字読み');

  -- sort=7 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'決断を迫られた彼は、（　）しながらも最終的に辞表を提出した。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'傍観', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'断行', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'奔走', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'逡巡', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 7, 2, '文脈規定');

  -- sort=8 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'部下の小さなミスでも（　）せずに丁寧に指導することが、優れた管理職には求められる。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'容認', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'看過', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'排除', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'放任', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 8, 2, '文脈規定');

  -- sort=9 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'この発見が新薬開発の（　）となり、研究のさらなる進展が期待されている。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'端緒', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'弊害', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'帰結', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'指針', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 9, 2, '文脈規定');

  -- sort=10 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'少子高齢化の急速な進行を（　）した政府は、緊急の対策会議を開いた。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'排斥', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'軽視', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'憂慮', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'傍観', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 10, 2, '文脈規定');

  -- sort=11 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼が慈善活動を熱心に行うのは、純粋な善意ではなく（　）的な動機からだと批判する声もある。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'献身', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'利他', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'奉仕', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'打算', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 11, 2, '文脈規定');

  -- sort=12 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼の発言は会社の公式見解から大きく（　）しており、のちに撤回に追い込まれた。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'準拠', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'逸脱', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'追随', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'踏襲', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 12, 2, '文脈規定');

  -- sort=13 daimon=2 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'この新技術の処理速度は従来のシステムを（　）し、業界全体に衝撃を与えた。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'凌駕', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'模倣', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'先導', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'劣化', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 13, 2, '文脈規定');

  -- sort=14 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'資金難と人材不足が重なり、会社は今まさに[窮地]に立たされている。
「窮地」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'正念場', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'局面', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'苦境', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'転機', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 14, 3, '言い換え類義');

  -- sort=15 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼女の演奏技術は[卓越]しており、世界中の聴衆を魅了した。
「卓越」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'著名', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'精巧', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'斬新', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'抜群', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 15, 3, '言い換え類義');

  -- sort=16 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'条約の解釈をめぐって会議は[紛糾]し、夜遅くまで議論が続いた。
「紛糾」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'膠着', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'もつれ', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'停滞', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'決裂', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 16, 3, '言い換え類義');

  -- sort=17 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼は不正を行った同僚を[軽蔑]し、二度と口を利かなかった。
「軽蔑」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'侮る', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'恨む', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'無視する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'嫉妬する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 17, 3, '言い換え類義');

  -- sort=18 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼女は上司の命令に[渋々]従ったが、内心では強く反発していた。
「渋々」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'慎重に', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'素直に', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'いやいや', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'自発的に', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 18, 3, '言い換え類義');

  -- sort=19 daimon=3 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼は将来について[漠然]とした不安を抱えたまま、毎日を過ごしていた。
「漠然」に意味が最も近いものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'切実な', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'根深い', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'具体的な', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'はっきりしない', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 19, 3, '言い換え類義');

  -- sort=20 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「失墜」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'台風によって電柱が失墜し、広い範囲で停電が発生した。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'不祥事が相次ぎ、その政治家は国民の信頼を失墜させた。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼女は競技中に失墜して足を負傷し、棄権を余儀なくされた。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼は突然失墜して、周囲の人が慌てて助けに駆け寄った。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 20, 4, '用法');

  -- sort=21 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「醸す」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼の何気ない一言が、その場に独特の雰囲気を醸した。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'強い日差しが肌を醸し、心地よい温かさをもたらした。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼は資料を入念に醸して、完成度の高い報告書を作り上げた。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼女は競技場で勝利を醸し、観衆から惜しみない称賛を浴びた。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 21, 4, '用法');

  -- sort=22 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「懐疑」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'長年の友人への懐疑から、彼はそっと感謝の手紙を書いた。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'会議で新案に懐疑が集まり、参加者から盛大な拍手が送られた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'新薬の安全性に対する懐疑が広まり、臨床試験の中断が決まった。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼は懐疑を深め、翌朝には新しいプロジェクトを積極的に推進した。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 22, 4, '用法');

  -- sort=23 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「翻弄」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'部長は会議の議題を翻弄して、スムーズに意見をまとめた。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼女は演奏を翻弄し、観客の心を一瞬にして惹きつけた。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'新入社員は先輩を翻弄して、職場環境を改善しようとした。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'運命に翻弄された彼の人生は、まるで波乱万丈の物語のようだった。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 23, 4, '用法');

  -- sort=24 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「余儀なく」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼女は夢であった海外留学を余儀なく実現させ、大きな喜びを感じた。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'工場の老朽化により、会社は設備の全面更新を余儀なくされた。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'試合に勝利した選手は、次々と祝福の言葉を余儀なく受け取った。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'子供たちは余儀なく勉強に励み、充実した学校生活を送った。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 24, 4, '用法');

  -- sort=25 daimon=4 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'「杞憂」の使い方として最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'彼が心配していた問題はすでに解決されており、それは杞憂に終わった。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'台風による被害は深刻で、住民たちの杞憂は現実のものとなった。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'医師から余命を宣告された患者は、杞憂から解放され穏やかな日々を過ごした。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'試験前の杞憂が的中し、彼は落第という最悪の結果を迎えた。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 25, 4, '用法');

  -- sort=26 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼女の演技の素晴らしさ__________、ひたむきな姿勢にも多くのファンが心を動かされた。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'のみならず', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'もさることながら', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'はもとより', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'を顧みず', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 26, 5, '文法形式の判断');

  -- sort=27 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'あの先生の情熱的な授業は、今も多くの卒業生が感謝し__________ものだ。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'てやまない', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'てはいられない', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'てたまらない', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'てかなわない', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 27, 5, '文法形式の判断');

  -- sort=28 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'首都での大型コンサート__________、その歌手の全国ツアーがいよいよ開幕した。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'にあたって', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'を踏まえて', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'を皮切りに', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'をもとに', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 28, 5, '文法形式の判断');

  -- sort=29 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'この地域（　　）の風習や言葉は、観光資源としても高く評価されている。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'だけでなく', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'のみならず', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'というより', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ならではの', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 29, 5, '文法形式の判断');

  -- sort=30 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'長年にわたる地道な研究の積み重ねが__________、今回の画期的な発見が生まれたのだと言えよう。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'あったためか', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'あればこそ', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'あるとすれば', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'あるにもかかわらず', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 30, 5, '文法形式の判断');

  -- sort=31 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'現行の規定（　　）、この手続きが適切かどうかを改めて検討すべきだ。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に即して', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に沿って', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に従って', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'にかなって', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 31, 5, '文法形式の判断');

  -- sort=32 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'本日の取締役会の決議（　　）、新社長への権限移譲が正式に発効した。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'によって', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'をきっかけに', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'をもって', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'を経て', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 32, 5, '文法形式の判断');

  -- sort=33 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'彼女は大学で教鞭をとる__________、地域の子供たちへの教育支援活動にも精力的に取り組んでいる。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ついでに', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ながらも', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'がてら', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'かたわら', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 33, 5, '文法形式の判断');

  -- sort=34 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'世界的に著名なその批評家の分析は、後世に語り継ぐ（　　）価値があると、多くの研究者が認めている。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に足る', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に限る', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に当たる', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に至る', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 34, 5, '文法形式の判断');

  -- sort=35 daimon=5 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'独自の技術力（　　）、優れたデザイン性が注目を集め、その企業の製品は世界市場で高い評価を受けるようになった。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'とともに', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'に加えて', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'と相まって', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'と合わせて', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 35, 5, '文法形式の判断');

  -- sort=36 daimon=6 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'次の文の ★ に入る最もよいものはどれか。

古い慣習に＿＿＿ ★ ＿＿＿ ＿＿＿姿勢こそが、組織の成長を妨げる一因となっている。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'とらわれ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ながら', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'変化を', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'拒む', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 36, 6, '文の組み立て');

  -- sort=37 daimon=6 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'次の文の ★ に入る最もよいものはどれか。

社会問題の解決には＿＿＿ ★ ＿＿＿ ＿＿＿が欠かせない。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'取り組むこと', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'持って', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'一人一人が', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'当事者意識を', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 37, 6, '文の組み立て');

  -- sort=38 daimon=6 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'次の文の ★ に入る最もよいものはどれか。

彼女は＿＿＿ ★ ＿＿＿ ＿＿＿人物として知られている。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'持ちながらも', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'姿勢を失わない', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'豊富な経験を', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'常に謙虚な', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 38, 6, '文の組み立て');

  -- sort=39 daimon=6 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'次の文の ★ に入る最もよいものはどれか。

新しい制度の＿＿＿ ★ ＿＿＿ ＿＿＿が不可欠だ。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'反映させること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'導入に', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'あたっては', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'現場の声を十分に', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 39, 6, '文の組み立て');

  -- sort=40 daimon=6 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'次の文の ★ に入る最もよいものはどれか。

今後の課題解決に＿＿＿ ★ ＿＿＿ ＿＿＿ことが求められる。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'取り組む', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'関係各所が', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'一丸となって', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'向けて', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 40, 6, '文の組み立て');

  -- sort=41 daimon=7 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'都市への人口集中が続く現代において、地域コミュニティのあり方が改めて問われている。かつては隣近所との日常的な付き合いが当然のこととして存在し、互いに支え合う文化が地域に根付いていた。しかし今日では、隣に誰が住んでいるかも知らないという住民が増え、地域の一体感は急速に失われつつある。こうした変化の背後には、高度経済成長に[41]生じた急激な都市化があると指摘されている。大都市への人口流入が加速する中、地縁や血縁に基づくコミュニティは少しずつ解体[42]、個人の匿名性が高まっていった。この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。住民主体の清掃活動や地域祭りは、単なるイベントに[44]、人々が顔を合わせ、言葉を交わす貴重な場となっている。コミュニティの再生には行政の支援だけでなく、住民一人一人の主体的な関与が不可欠だと専門家は指摘する。人とのつながりを取り戻す試み[45]、持続可能な地域社会の実現への第一歩となるだろう。

[41]に入る最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'向けて', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'際して', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'において', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'伴って', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 41, 7, '文章の文法');

  -- sort=42 daimon=7 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'都市への人口集中が続く現代において、地域コミュニティのあり方が改めて問われている。かつては隣近所との日常的な付き合いが当然のこととして存在し、互いに支え合う文化が地域に根付いていた。しかし今日では、隣に誰が住んでいるかも知らないという住民が増え、地域の一体感は急速に失われつつある。こうした変化の背後には、高度経済成長に[41]生じた急激な都市化があると指摘されている。大都市への人口流入が加速する中、地縁や血縁に基づくコミュニティは少しずつ解体[42]、個人の匿名性が高まっていった。この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。住民主体の清掃活動や地域祭りは、単なるイベントに[44]、人々が顔を合わせ、言葉を交わす貴重な場となっている。コミュニティの再生には行政の支援だけでなく、住民一人一人の主体的な関与が不可欠だと専門家は指摘する。人とのつながりを取り戻す試み[45]、持続可能な地域社会の実現への第一歩となるだろう。

[42]に入る最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'されつつあり', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'されながらも', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'されてしまい', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'されるにつれ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 42, 7, '文章の文法');

  -- sort=43 daimon=7 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'都市への人口集中が続く現代において、地域コミュニティのあり方が改めて問われている。かつては隣近所との日常的な付き合いが当然のこととして存在し、互いに支え合う文化が地域に根付いていた。しかし今日では、隣に誰が住んでいるかも知らないという住民が増え、地域の一体感は急速に失われつつある。こうした変化の背後には、高度経済成長に[41]生じた急激な都市化があると指摘されている。大都市への人口流入が加速する中、地縁や血縁に基づくコミュニティは少しずつ解体[42]、個人の匿名性が高まっていった。この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。住民主体の清掃活動や地域祭りは、単なるイベントに[44]、人々が顔を合わせ、言葉を交わす貴重な場となっている。コミュニティの再生には行政の支援だけでなく、住民一人一人の主体的な関与が不可欠だと専門家は指摘する。人とのつながりを取り戻す試み[45]、持続可能な地域社会の実現への第一歩となるだろう。

[43]に入る最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'踏まえて', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'受けて', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'打開すべく', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'問題視して', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 43, 7, '文章の文法');

  -- sort=44 daimon=7 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'都市への人口集中が続く現代において、地域コミュニティのあり方が改めて問われている。かつては隣近所との日常的な付き合いが当然のこととして存在し、互いに支え合う文化が地域に根付いていた。しかし今日では、隣に誰が住んでいるかも知らないという住民が増え、地域の一体感は急速に失われつつある。こうした変化の背後には、高度経済成長に[41]生じた急激な都市化があると指摘されている。大都市への人口流入が加速する中、地縁や血縁に基づくコミュニティは少しずつ解体[42]、個人の匿名性が高まっていった。この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。住民主体の清掃活動や地域祭りは、単なるイベントに[44]、人々が顔を合わせ、言葉を交わす貴重な場となっている。コミュニティの再生には行政の支援だけでなく、住民一人一人の主体的な関与が不可欠だと専門家は指摘する。人とのつながりを取り戻す試み[45]、持続可能な地域社会の実現への第一歩となるだろう。

[44]に入る最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'とどまり', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'とどまらず', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'すぎないが', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ならず', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 44, 7, '文章の文法');

  -- sort=45 daimon=7 (gengo_chishiki)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000141'::uuid, E'都市への人口集中が続く現代において、地域コミュニティのあり方が改めて問われている。かつては隣近所との日常的な付き合いが当然のこととして存在し、互いに支え合う文化が地域に根付いていた。しかし今日では、隣に誰が住んでいるかも知らないという住民が増え、地域の一体感は急速に失われつつある。こうした変化の背後には、高度経済成長に[41]生じた急激な都市化があると指摘されている。大都市への人口流入が加速する中、地縁や血縁に基づくコミュニティは少しずつ解体[42]、個人の匿名性が高まっていった。この状況を[43]、地域の絆を再構築しようとする動きが各地で見られる。住民主体の清掃活動や地域祭りは、単なるイベントに[44]、人々が顔を合わせ、言葉を交わす貴重な場となっている。コミュニティの再生には行政の支援だけでなく、住民一人一人の主体的な関与が不可欠だと専門家は指摘する。人とのつながりを取り戻す試み[45]、持続可能な地域社会の実現への第一歩となるだろう。

[45]に入る最もよいものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'のみが', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'だけが', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'においても', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'こそが', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'gengo_chishiki', 45, 7, '文章の文法');

  -- sort=1 daimon=8 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'2019年に施行された「働き方改革関連法」により、時間外労働の上限規制や年次有給休暇の取得義務化が法制化された。しかし、法律の整備が進む一方で、実態としての長時間労働は依然として多くの職場で続いており、過労死認定件数も横ばいが続いている。制度の有名無実化を防ぐためには、企業の意識改革とともに、労働者自身が権利を行使できる職場文化の醸成が不可欠である。

この文章で筆者が述べていることと合っているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'働き方改革関連法の施行以降、過労死認定件数は著しく減少した。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'法律が整備されても、職場文化の変革なしには実効性が伴わない。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'過重労働の問題は主に労働者自身の意識不足によって引き起こされている。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'時間外労働の上限規制は2019年以前から法律で義務付けられていた。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 1, 8, '内容理解(短文)');

  -- sort=2 daimon=8 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'近年、学術界では「再現性の危機」と呼ばれる問題が注目されている。過去に発表された著名な心理学研究の結果を複数の研究チームが再試行したところ、半数以上で元の結果が再現されなかったとの報告がある。この問題の背景には、統計的に有意な結果のみを公表する「出版バイアス」や、サンプルサイズの不足などが指摘されている。科学的知見の信頼性を高めるには、研究プロセスの透明化と事前登録制度の普及が求められる。

「再現性の危機」について、この文章が述べていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'問題の原因は研究者の意図的な不正行為に限られる。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'再現性の危機は自然科学にのみ見られる現象である。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'研究プロセスの透明化や事前登録制度の普及により信頼性向上が期待できる。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'著名な研究のほとんどは第三者による再試行で同じ結果が確認されている。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 2, 8, '内容理解(短文)');

  -- sort=3 daimon=8 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'「フードマイル」とは食料が生産地から消費者の手に届くまでの輸送距離を指し、その短縮は輸送に伴う温室効果ガスの排出を削減する効果があるとされる。近年、都市部でのビル屋上農園や垂直農場の整備が進み、地産地消の取り組みが加速している。ただし、人工照明や空調設備を多用する屋内農業はエネルギー消費が大きく、必ずしも環境負荷が小さいとは言い切れないという批判もある。

この文章の内容と合っているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'屋内農業は環境負荷の観点から常に屋外農業より優れている。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'都市農業は現在も法的規制により普及が妨げられている。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'垂直農場はエネルギーをほとんど使わないため環境に優しい。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'フードマイルの短縮は輸送に由来する温室効果ガスの削減に貢献する。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 3, 8, '内容理解(短文)');

  -- sort=4 daimon=8 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'気象予報に人工知能を導入する取り組みが世界各地で進んでいる。従来の数値予報モデルは膨大な計算資源を必要とし、予報精度にも限界があったが、AIを活用した新手法では過去の観測データからパターンを学習することで、より短時間での高精度予報が可能になりつつある。特に台風の進路予測や集中豪雨の発生予測において成果が報告されており、防災分野への応用が期待されている。

AI気象予報について、この文章が述べていることと合っているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AIによる予報は台風進路や集中豪雨の予測において成果を上げつつある。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'従来の数値予報モデルはほとんどの場合AIより計算資源が少なくて済む。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AIを用いた気象予報はすでに世界中の気象機関に完全に普及している。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AI気象予報は計算資源を一切必要としないため低コストである。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 4, 8, '内容理解(短文)');

  -- sort=5 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'量子コンピュータは、量子力学の原理を応用した情報処理装置であり、従来の「ビット」に代わり「量子ビット（キュービット）」を用いる。古典的なビットが0か1のいずれかの状態しか取れないのに対し、キュービットは「重ね合わせ」と呼ばれる状態により、0と1の両方を同時に保持することができる。この性質により、量子コンピュータは特定の問題において古典コンピュータを飛躍的に上回る処理能力を発揮できると期待されている。

　さらに、「量子もつれ」と呼ばれる現象を利用することで、複数のキュービット間に相関関係を持たせ、並列的な情報処理を可能にする。これにより、素因数分解や暗号解読、新薬開発のための分子シミュレーションなど、古典コンピュータでは現実的な時間では解くことが不可能とされてきた問題の解決が期待される。

　しかし、量子コンピュータには大きな課題も存在する。キュービットは外部からの微細な擾乱によって容易に「デコヒーレンス」を起こし、量子状態が失われてしまう。このため、極低温環境の維持や精緻なエラー訂正技術が不可欠であり、現時点での実用化は一部の特殊用途に限られている。汎用的な量子コンピュータの実現には、まだ多くの技術的障壁を乗り越える必要がある。

問1：量子コンピュータが従来のコンピュータと根本的に異なる点はどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'電気ではなく光を用いて計算を行う点', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ビットではなくキュービットを用い、重ね合わせ状態によって0と1を同時に保持できる点', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'インターネットに接続せずにすべての計算が可能な点', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'プログラムを必要とせず自律的に問題を発見し解く点', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 5, 9, '内容理解(中文)');

  -- sort=6 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'量子コンピュータは、量子力学の原理を応用した情報処理装置であり、従来の「ビット」に代わり「量子ビット（キュービット）」を用いる。古典的なビットが0か1のいずれかの状態しか取れないのに対し、キュービットは「重ね合わせ」と呼ばれる状態により、0と1の両方を同時に保持することができる。この性質により、量子コンピュータは特定の問題において古典コンピュータを飛躍的に上回る処理能力を発揮できると期待されている。

　さらに、「量子もつれ」と呼ばれる現象を利用することで、複数のキュービット間に相関関係を持たせ、並列的な情報処理を可能にする。これにより、素因数分解や暗号解読、新薬開発のための分子シミュレーションなど、古典コンピュータでは現実的な時間では解くことが不可能とされてきた問題の解決が期待される。

　しかし、量子コンピュータには大きな課題も存在する。キュービットは外部からの微細な擾乱によって容易に「デコヒーレンス」を起こし、量子状態が失われてしまう。このため、極低温環境の維持や精緻なエラー訂正技術が不可欠であり、現時点での実用化は一部の特殊用途に限られている。汎用的な量子コンピュータの実現には、まだ多くの技術的障壁を乗り越える必要がある。

問2：量子コンピュータが特に有用だと期待される用途として、この文章が挙げているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'動画配信や音楽再生といったマルチメディア処理の高速化', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'Webサイトの閲覧速度の大幅な向上', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'素因数分解・暗号解読・分子シミュレーションなどの複雑な計算', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'日常的な文書作成や表計算処理の効率化', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 6, 9, '内容理解(中文)');

  -- sort=7 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'量子コンピュータは、量子力学の原理を応用した情報処理装置であり、従来の「ビット」に代わり「量子ビット（キュービット）」を用いる。古典的なビットが0か1のいずれかの状態しか取れないのに対し、キュービットは「重ね合わせ」と呼ばれる状態により、0と1の両方を同時に保持することができる。この性質により、量子コンピュータは特定の問題において古典コンピュータを飛躍的に上回る処理能力を発揮できると期待されている。

　さらに、「量子もつれ」と呼ばれる現象を利用することで、複数のキュービット間に相関関係を持たせ、並列的な情報処理を可能にする。これにより、素因数分解や暗号解読、新薬開発のための分子シミュレーションなど、古典コンピュータでは現実的な時間では解くことが不可能とされてきた問題の解決が期待される。

　しかし、量子コンピュータには大きな課題も存在する。キュービットは外部からの微細な擾乱によって容易に「デコヒーレンス」を起こし、量子状態が失われてしまう。このため、極低温環境の維持や精緻なエラー訂正技術が不可欠であり、現時点での実用化は一部の特殊用途に限られている。汎用的な量子コンピュータの実現には、まだ多くの技術的障壁を乗り越える必要がある。

問3：「デコヒーレンス」とはどのような問題か。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'量子コンピュータが消費する電力が過大になる問題', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'量子もつれが生じることで計算速度が予期せず低下する問題', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'量子コンピュータの製造コストが際限なく高騰する問題', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'キュービットが外部の微細な擾乱によって量子状態を失ってしまう問題', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 7, 9, '内容理解(中文)');

  -- sort=8 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'日本の少子化は深刻さを増しており、2023年の合計特殊出生率は過去最低を更新した。政府はこれまで様々な少子化対策を打ち出してきたが、その効果は限定的にとどまっている。根本的な原因として挙げられるのは、子育て費用の高さ、育児と仕事の両立の困難さ、そして若い世代の将来への経済的不安である。

　保育施設の拡充や育児休業制度の整備は一定の前進をもたらしたものの、利用率には依然として男女差が大きい。父親の育児休業取得率は政府目標と現実の間に大きな乖離があり、職場における「育休を取得しにくい雰囲気」が障壁になっているとされる。

　また、晩婚化・未婚化の進行も少子化の要因として見逃せない。結婚を前提とした出産が一般的な日本では、未婚率の上昇がそのまま出生数の減少に直結する構造がある。婚外子の割合が欧米では40〜50%に達するのとは対照的に、日本では約2〜3%に過ぎず、婚姻と出産の結びつきが極めて強い。少子化を根本的に解決するためには、個々の施策の改善にとどまらず、育児に対する社会全体の意識改革が必要だという声も高まっている。

問1：この文章で述べられる少子化の根本的な原因として挙げられていないものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'外国人労働者・移民受け入れの制限', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'子育てにかかる費用の高さ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'仕事と育児の両立の困難さ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'若い世代の将来への経済的不安', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 8, 9, '内容理解(中文)');

  -- sort=9 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'日本の少子化は深刻さを増しており、2023年の合計特殊出生率は過去最低を更新した。政府はこれまで様々な少子化対策を打ち出してきたが、その効果は限定的にとどまっている。根本的な原因として挙げられるのは、子育て費用の高さ、育児と仕事の両立の困難さ、そして若い世代の将来への経済的不安である。

　保育施設の拡充や育児休業制度の整備は一定の前進をもたらしたものの、利用率には依然として男女差が大きい。父親の育児休業取得率は政府目標と現実の間に大きな乖離があり、職場における「育休を取得しにくい雰囲気」が障壁になっているとされる。

　また、晩婚化・未婚化の進行も少子化の要因として見逃せない。結婚を前提とした出産が一般的な日本では、未婚率の上昇がそのまま出生数の減少に直結する構造がある。婚外子の割合が欧米では40〜50%に達するのとは対照的に、日本では約2〜3%に過ぎず、婚姻と出産の結びつきが極めて強い。少子化を根本的に解決するためには、個々の施策の改善にとどまらず、育児に対する社会全体の意識改革が必要だという声も高まっている。

問2：父親の育児休業取得について、この文章はどのように述べているか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'父親の育休取得率は近年急速に政府目標に近づいている。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'職場の雰囲気が障壁となり、政府目標と現実の間に大きな乖離がある。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'父親が取得できる育児休業制度はまだ日本に存在しない。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'父親の育休取得率はすでに母親と同程度の水準に達している。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 9, 9, '内容理解(中文)');

  -- sort=10 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'日本の少子化は深刻さを増しており、2023年の合計特殊出生率は過去最低を更新した。政府はこれまで様々な少子化対策を打ち出してきたが、その効果は限定的にとどまっている。根本的な原因として挙げられるのは、子育て費用の高さ、育児と仕事の両立の困難さ、そして若い世代の将来への経済的不安である。

　保育施設の拡充や育児休業制度の整備は一定の前進をもたらしたものの、利用率には依然として男女差が大きい。父親の育児休業取得率は政府目標と現実の間に大きな乖離があり、職場における「育休を取得しにくい雰囲気」が障壁になっているとされる。

　また、晩婚化・未婚化の進行も少子化の要因として見逃せない。結婚を前提とした出産が一般的な日本では、未婚率の上昇がそのまま出生数の減少に直結する構造がある。婚外子の割合が欧米では40〜50%に達するのとは対照的に、日本では約2〜3%に過ぎず、婚姻と出産の結びつきが極めて強い。少子化を根本的に解決するためには、個々の施策の改善にとどまらず、育児に対する社会全体の意識改革が必要だという声も高まっている。

問3：日本における婚外子について、この文章が述べていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'日本の婚外子の割合は欧米と同様に40〜50%程度を占める。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'日本の婚外子割合は近年欧米水準に急速に近づいている。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'日本では婚外子の割合は非常に低く、婚姻と出産の結びつきが極めて強い。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'日本の婚外子に関する統計はまだ十分に整備されていない。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 10, 9, '内容理解(中文)');

  -- sort=11 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'バイオミミクリー（生体模倣）とは、自然界の生物が進化の過程で獲得した構造・機能・プロセスを工業技術や製品設計に応用する手法を指す。億年という時間をかけて最適化された自然の「設計」は、人間の工学的発想では到達しにくい解決策を提供してくれることがある。

　代表的な事例として挙げられるのが、新幹線の先頭車両の形状設計だ。高速走行時にトンネルへ突入する際に生じる衝撃波（トンネルドン）による騒音を解消するため、急降下時の空気抵抗が特に少ないカワセミのくちばしの形状が参考にされた。この設計変更により、消費電力の削減と騒音の抑制が同時に実現された。

　また、サメの皮膚に見られる微細な鱗状突起「リブレット」構造を模倣した素材は、流体抵抗を低減させる効果を持ち、競泳用水着や航空機の表面素材に応用されている。ゲッコー（ヤモリ）の足裏の超微細な毛状構造を模した接着材料は、繰り返し使用可能な「乾式接着剤」として研究が進んでいる。

　バイオミミクリーはエネルギー効率・耐久性・持続可能性の観点から従来技術の限界を打ち破る可能性を秘めているが、自然の仕組みを正確に理解し技術へと昇華させるには、生物学と工学の深い融合が求められる。

問1：新幹線の先頭車両の形状設計において参考にした自然の構造はどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'サメの皮膚に見られる微細な鱗状突起', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'トンボの翅の軽量で強靭な構造', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ヤモリの足裏にある超微細な毛状構造', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'カワセミのくちばしの空気抵抗が少ない形状', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 11, 9, '内容理解(中文)');

  -- sort=12 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'バイオミミクリー（生体模倣）とは、自然界の生物が進化の過程で獲得した構造・機能・プロセスを工業技術や製品設計に応用する手法を指す。億年という時間をかけて最適化された自然の「設計」は、人間の工学的発想では到達しにくい解決策を提供してくれることがある。

　代表的な事例として挙げられるのが、新幹線の先頭車両の形状設計だ。高速走行時にトンネルへ突入する際に生じる衝撃波（トンネルドン）による騒音を解消するため、急降下時の空気抵抗が特に少ないカワセミのくちばしの形状が参考にされた。この設計変更により、消費電力の削減と騒音の抑制が同時に実現された。

　また、サメの皮膚に見られる微細な鱗状突起「リブレット」構造を模倣した素材は、流体抵抗を低減させる効果を持ち、競泳用水着や航空機の表面素材に応用されている。ゲッコー（ヤモリ）の足裏の超微細な毛状構造を模した接着材料は、繰り返し使用可能な「乾式接着剤」として研究が進んでいる。

　バイオミミクリーはエネルギー効率・耐久性・持続可能性の観点から従来技術の限界を打ち破る可能性を秘めているが、自然の仕組みを正確に理解し技術へと昇華させるには、生物学と工学の深い融合が求められる。

問2：サメの皮膚の「リブレット」構造を模倣した素材の応用例として、この文章が挙げているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'競泳用水着や航空機の表面素材', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'繰り返し使用可能な乾式接着剤', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'新幹線の先頭車両の外装', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'建築物の断熱・防音素材', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 12, 9, '内容理解(中文)');

  -- sort=13 daimon=9 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'バイオミミクリー（生体模倣）とは、自然界の生物が進化の過程で獲得した構造・機能・プロセスを工業技術や製品設計に応用する手法を指す。億年という時間をかけて最適化された自然の「設計」は、人間の工学的発想では到達しにくい解決策を提供してくれることがある。

　代表的な事例として挙げられるのが、新幹線の先頭車両の形状設計だ。高速走行時にトンネルへ突入する際に生じる衝撃波（トンネルドン）による騒音を解消するため、急降下時の空気抵抗が特に少ないカワセミのくちばしの形状が参考にされた。この設計変更により、消費電力の削減と騒音の抑制が同時に実現された。

　また、サメの皮膚に見られる微細な鱗状突起「リブレット」構造を模倣した素材は、流体抵抗を低減させる効果を持ち、競泳用水着や航空機の表面素材に応用されている。ゲッコー（ヤモリ）の足裏の超微細な毛状構造を模した接着材料は、繰り返し使用可能な「乾式接着剤」として研究が進んでいる。

　バイオミミクリーはエネルギー効率・耐久性・持続可能性の観点から従来技術の限界を打ち破る可能性を秘めているが、自然の仕組みを正確に理解し技術へと昇華させるには、生物学と工学の深い融合が求められる。

問3：バイオミミクリーについてこの文章が述べていることとして最も適切なものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'自然の設計をそのまま工業製品に転用するだけで容易に実現できる。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'生物学と工学の深い融合により、従来技術の限界を超える可能性がある。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'工学の知識があれば生物学の専門的な理解は特に必要ない。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'バイオミミクリーはすでに現代工業技術の主流となっている。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 13, 9, '内容理解(中文)');

  -- sort=14 daimon=10 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　日本語は世界でも稀なほど複雑な文字体系を持つ言語の一つである。漢字・ひらがな・カタカナという三種類の表記体系を同一の文章の中で混用するのは日本語のみと言っても過言ではなく、この複層的な文字体系は日本語の表現力を豊かにするとともに、習得の難しさの一因ともなっている。

　漢字は6世紀頃に中国から伝来し、初めは中国語をそのまま読む形で用いられていたが、やがて日本語の音を漢字で表記する「万葉仮名」が生まれた。万葉仮名は文字の意味を無視し、音だけを借用するという方法であった。この万葉仮名が簡略化・草書化されることでひらがなが成立し、主に女性の文学（平安時代の日記文学・物語文学）において発達した。一方、カタカナは漢文を訓読する際に添えた訓点や送り仮名から発達したとされ、当初は男性の学問的文書において使われた。

　明治時代には文語体と口語体の乖離が問題となり、話し言葉に近い表記を目指す「言文一致運動」が起こった。この過程で、どの文字体系をどのように用いるかという規範が整理されていった。現代の一般的な用法では、漢字は主に語彙の中核的意味を担う要素（名詞・動詞・形容詞の語幹など）を表記するために用いられる。ひらがなは助詞・助動詞・接続詞など文法的機能を持つ要素のほか、漢字で書くと難解になりすぎる和語の表記にも用いられる。カタカナは外来語・外国の固有名詞・擬音語・擬態語、および専門的な生物名などに用いられることが多い。

　この三体系の共存は、単なる歴史的偶然ではなく、意味の層を視覚的に区別することを可能にする機能的な体系でもある。読者はテキストを目で追う際に、文字の種類そのものから意味の構造に関する手がかりを得ることができる。これは、表音文字のみを用いる言語では得られない情報処理上のアドバンテージとも言える。

　一方で、常用漢字表という規範が存在するにもかかわらず、漢字の読み方は一字に複数の音読み・訓読みがある場合がほとんどであり、その習得には多大な時間と労力を要する。外国人学習者が日本語を習得する際の最大の障壁の一つは、まさにこの文字体系の複雑さにある。しかし見方を変えれば、この複雑さこそが日本語の表記に独特の美と精密さをもたらしているとも言えるだろう。

問1：「万葉仮名」についての説明として最も適切なものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'漢字の意味を用いて日本語の概念を直接表した表記法', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'中国語の発音をそのまま保存した日本独自の読み方', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'漢字の音だけを借用して日本語の音を表した表記法', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'平安時代の女性が考案した、漢字を大幅に簡略化した文字', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 14, 10, '内容理解(長文)');

  -- sort=15 daimon=10 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　日本語は世界でも稀なほど複雑な文字体系を持つ言語の一つである。漢字・ひらがな・カタカナという三種類の表記体系を同一の文章の中で混用するのは日本語のみと言っても過言ではなく、この複層的な文字体系は日本語の表現力を豊かにするとともに、習得の難しさの一因ともなっている。

　漢字は6世紀頃に中国から伝来し、初めは中国語をそのまま読む形で用いられていたが、やがて日本語の音を漢字で表記する「万葉仮名」が生まれた。万葉仮名は文字の意味を無視し、音だけを借用するという方法であった。この万葉仮名が簡略化・草書化されることでひらがなが成立し、主に女性の文学（平安時代の日記文学・物語文学）において発達した。一方、カタカナは漢文を訓読する際に添えた訓点や送り仮名から発達したとされ、当初は男性の学問的文書において使われた。

　明治時代には文語体と口語体の乖離が問題となり、話し言葉に近い表記を目指す「言文一致運動」が起こった。この過程で、どの文字体系をどのように用いるかという規範が整理されていった。現代の一般的な用法では、漢字は主に語彙の中核的意味を担う要素（名詞・動詞・形容詞の語幹など）を表記するために用いられる。ひらがなは助詞・助動詞・接続詞など文法的機能を持つ要素のほか、漢字で書くと難解になりすぎる和語の表記にも用いられる。カタカナは外来語・外国の固有名詞・擬音語・擬態語、および専門的な生物名などに用いられることが多い。

　この三体系の共存は、単なる歴史的偶然ではなく、意味の層を視覚的に区別することを可能にする機能的な体系でもある。読者はテキストを目で追う際に、文字の種類そのものから意味の構造に関する手がかりを得ることができる。これは、表音文字のみを用いる言語では得られない情報処理上のアドバンテージとも言える。

　一方で、常用漢字表という規範が存在するにもかかわらず、漢字の読み方は一字に複数の音読み・訓読みがある場合がほとんどであり、その習得には多大な時間と労力を要する。外国人学習者が日本語を習得する際の最大の障壁の一つは、まさにこの文字体系の複雑さにある。しかし見方を変えれば、この複雑さこそが日本語の表記に独特の美と精密さをもたらしているとも言えるだろう。

問2：ひらがなとカタカナの発達について、この文章が述べていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひらがなとカタカナはともに男性の学問的文書の中で発達した。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひらがなとカタカナはともに万葉仮名から同時に派生した。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'カタカナは中国から直接輸入された独立した文字体系である。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ひらがなは女性の文学の中で、カタカナは漢文訓読の場で発達した。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 15, 10, '内容理解(長文)');

  -- sort=16 daimon=10 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　日本語は世界でも稀なほど複雑な文字体系を持つ言語の一つである。漢字・ひらがな・カタカナという三種類の表記体系を同一の文章の中で混用するのは日本語のみと言っても過言ではなく、この複層的な文字体系は日本語の表現力を豊かにするとともに、習得の難しさの一因ともなっている。

　漢字は6世紀頃に中国から伝来し、初めは中国語をそのまま読む形で用いられていたが、やがて日本語の音を漢字で表記する「万葉仮名」が生まれた。万葉仮名は文字の意味を無視し、音だけを借用するという方法であった。この万葉仮名が簡略化・草書化されることでひらがなが成立し、主に女性の文学（平安時代の日記文学・物語文学）において発達した。一方、カタカナは漢文を訓読する際に添えた訓点や送り仮名から発達したとされ、当初は男性の学問的文書において使われた。

　明治時代には文語体と口語体の乖離が問題となり、話し言葉に近い表記を目指す「言文一致運動」が起こった。この過程で、どの文字体系をどのように用いるかという規範が整理されていった。現代の一般的な用法では、漢字は主に語彙の中核的意味を担う要素（名詞・動詞・形容詞の語幹など）を表記するために用いられる。ひらがなは助詞・助動詞・接続詞など文法的機能を持つ要素のほか、漢字で書くと難解になりすぎる和語の表記にも用いられる。カタカナは外来語・外国の固有名詞・擬音語・擬態語、および専門的な生物名などに用いられることが多い。

　この三体系の共存は、単なる歴史的偶然ではなく、意味の層を視覚的に区別することを可能にする機能的な体系でもある。読者はテキストを目で追う際に、文字の種類そのものから意味の構造に関する手がかりを得ることができる。これは、表音文字のみを用いる言語では得られない情報処理上のアドバンテージとも言える。

　一方で、常用漢字表という規範が存在するにもかかわらず、漢字の読み方は一字に複数の音読み・訓読みがある場合がほとんどであり、その習得には多大な時間と労力を要する。外国人学習者が日本語を習得する際の最大の障壁の一つは、まさにこの文字体系の複雑さにある。しかし見方を変えれば、この複雑さこそが日本語の表記に独特の美と精密さをもたらしているとも言えるだろう。

問3：現代日本語においてカタカナが主に用いられる場合として、この文章が述べているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'外来語・外国の固有名詞・擬音語・擬態語・専門的な生物名など', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'助詞・助動詞・接続詞などの文法的機能を持つ要素の表記', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'名詞・動詞・形容詞の語幹など語彙の中核的意味を担う要素', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'漢字で書くと難解になりすぎる日本固有の言葉の表記', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 16, 10, '内容理解(長文)');

  -- sort=17 daimon=10 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　日本語は世界でも稀なほど複雑な文字体系を持つ言語の一つである。漢字・ひらがな・カタカナという三種類の表記体系を同一の文章の中で混用するのは日本語のみと言っても過言ではなく、この複層的な文字体系は日本語の表現力を豊かにするとともに、習得の難しさの一因ともなっている。

　漢字は6世紀頃に中国から伝来し、初めは中国語をそのまま読む形で用いられていたが、やがて日本語の音を漢字で表記する「万葉仮名」が生まれた。万葉仮名は文字の意味を無視し、音だけを借用するという方法であった。この万葉仮名が簡略化・草書化されることでひらがなが成立し、主に女性の文学（平安時代の日記文学・物語文学）において発達した。一方、カタカナは漢文を訓読する際に添えた訓点や送り仮名から発達したとされ、当初は男性の学問的文書において使われた。

　明治時代には文語体と口語体の乖離が問題となり、話し言葉に近い表記を目指す「言文一致運動」が起こった。この過程で、どの文字体系をどのように用いるかという規範が整理されていった。現代の一般的な用法では、漢字は主に語彙の中核的意味を担う要素（名詞・動詞・形容詞の語幹など）を表記するために用いられる。ひらがなは助詞・助動詞・接続詞など文法的機能を持つ要素のほか、漢字で書くと難解になりすぎる和語の表記にも用いられる。カタカナは外来語・外国の固有名詞・擬音語・擬態語、および専門的な生物名などに用いられることが多い。

　この三体系の共存は、単なる歴史的偶然ではなく、意味の層を視覚的に区別することを可能にする機能的な体系でもある。読者はテキストを目で追う際に、文字の種類そのものから意味の構造に関する手がかりを得ることができる。これは、表音文字のみを用いる言語では得られない情報処理上のアドバンテージとも言える。

　一方で、常用漢字表という規範が存在するにもかかわらず、漢字の読み方は一字に複数の音読み・訓読みがある場合がほとんどであり、その習得には多大な時間と労力を要する。外国人学習者が日本語を習得する際の最大の障壁の一つは、まさにこの文字体系の複雑さにある。しかし見方を変えれば、この複雑さこそが日本語の表記に独特の美と精密さをもたらしているとも言えるだろう。

問4：日本語の三体系の共存について、筆者が肯定的に評価している点はどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'外国人学習者が日本語を短期間で習得しやすくなっている点', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'文字の種類によって意味の構造を視覚的に区別できる機能的な体系である点', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'一つの漢字の読み方を一通りに統一できるようになった点', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'表音文字を完全に排除し漢字のみで表記できるようになった点', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 17, 10, '内容理解(長文)');

  -- sort=18 daimon=11 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'【文章A】

　再生可能エネルギーの普及促進こそが、持続可能な社会を実現するための王道である。太陽光・風力・地熱など自然の力を活用するこれらのエネルギー源は、温室効果ガスを排出せず、燃料コストもかからない。技術の進歩により発電コストは急速に低下しており、既存の電力源と十分に競合できる水準になりつつある。

　かつては供給安定性の問題が再生可能エネルギーの普及を阻む最大の障壁とされたが、蓄電池技術や広域送電網の整備によって、この課題も着実に克服されつつある。化石燃料への依存を断ち切り、再生可能エネルギーを基幹電源として位置づけることが、気候変動対策と国内産業育成の両面から急務だと考える。

【文章B】

　脱炭素社会の実現を急ぐあまり、原子力発電の可能性を排除することは、エネルギー安全保障の観点から見て危険な賭けである。原子力発電は天候に左右されず安定した電力を供給でき、発電時のCO₂排出量は再生可能エネルギーと同等に低い。人口あたりのエネルギー消費量が多い先進国が今すぐ再生可能エネルギーだけでニーズを賄えると考えるのは非現実的だ。

　むしろ、革新的な安全技術を備えた次世代原子炉の開発・活用を進めながら、再生可能エネルギーとの共存を図ることが現実的な選択肢である。過去の事故への感情的な反応を超えて、データと論理に基づくエネルギー政策の議論が必要だ。

問1：文章AとBの立場の違いを最も正確に表しているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AはCO₂削減を重視し、Bは経済成長を最優先している。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AもBも現在のエネルギー政策に完全に賛成している。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'Aは再エネを基幹電源とすべきと主張し、Bは原子力との共存が現実的だと主張している。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AもBも原子力発電の完全廃止を目指している。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 18, 11, '統合理解');

  -- sort=19 daimon=11 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'【文章A】

　再生可能エネルギーの普及促進こそが、持続可能な社会を実現するための王道である。太陽光・風力・地熱など自然の力を活用するこれらのエネルギー源は、温室効果ガスを排出せず、燃料コストもかからない。技術の進歩により発電コストは急速に低下しており、既存の電力源と十分に競合できる水準になりつつある。

　かつては供給安定性の問題が再生可能エネルギーの普及を阻む最大の障壁とされたが、蓄電池技術や広域送電網の整備によって、この課題も着実に克服されつつある。化石燃料への依存を断ち切り、再生可能エネルギーを基幹電源として位置づけることが、気候変動対策と国内産業育成の両面から急務だと考える。

【文章B】

　脱炭素社会の実現を急ぐあまり、原子力発電の可能性を排除することは、エネルギー安全保障の観点から見て危険な賭けである。原子力発電は天候に左右されず安定した電力を供給でき、発電時のCO₂排出量は再生可能エネルギーと同等に低い。人口あたりのエネルギー消費量が多い先進国が今すぐ再生可能エネルギーだけでニーズを賄えると考えるのは非現実的だ。

　むしろ、革新的な安全技術を備えた次世代原子炉の開発・活用を進めながら、再生可能エネルギーとの共存を図ることが現実的な選択肢である。過去の事故への感情的な反応を超えて、データと論理に基づくエネルギー政策の議論が必要だ。

問2：供給安定性の問題についてAとBはそれぞれどのように述べているか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AもBも供給安定性の問題はすでに完全に解決されたと述べている。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'Aはこの問題に全く触れておらず、Bのみが深刻な問題として挙げている。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'AもBも再生可能エネルギーの供給不安定性は解決不可能だと述べている。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'Aは蓄電池等の整備により克服されつつあると述べ、Bは原子力の安定供給をその利点として挙げている。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 19, 11, '統合理解');

  -- sort=20 daimon=12 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　二十世紀後半に「歴史の終わり」と評されるほど安定していると思われた自由民主主義体制は、今日、かつてない挑戦に直面している。経済的不平等の拡大、エリートへの不信感、移民・難民問題をめぐる社会的亀裂——これらの複合的な要因を背景として、既成政党や主流メディアへの反発を糧に台頭するポピュリズム勢力が、多くの先進民主主義国において影響力を増している。

　ポピュリズムという言葉は、しばしば否定的な含意で使われるが、その本質は「純粋な人民」と「腐敗したエリート」の対立という二項対立的な政治的想像力にある。この構図はあらゆる政治的立場に寄生しうる——左派ポピュリズムは経済的支配層を批判し、右派ポピュリズムは移民や文化的少数者を「外なる敵」として標的化する。いずれの場合も、「人民の意志」こそが唯一正当な統治の根拠であるとされ、それに反すると見なされる制度的制約（司法の独立・少数者の権利保護・メディアの自由など）は批判の対象となりやすい。

　問題の核心は、民主主義が「多数決」と「立憲主義」という二つの原理の緊張関係の上に成立しているという点にある。多数決は民意の直接的な表出を可能にするが、それ単独では多数派による少数派の抑圧（いわゆる「多数派の専制」）に陥りかねない。憲法や人権規範はこの危険を防ぐための制度的安全装置として機能してきた。ポピュリズムが立憲的制約を「民意を阻害するエリートの道具」として攻撃するとき、民主主義の実質的な基盤が侵食される危険がある。

　しかし、ポピュリズムの台頭を単純に「民主主義の敵」として退けることもまた問題をはらむ。ポピュリストへの支持が広がる背景には、既成の民主主義制度が実際に多くの市民の声を取りこぼしてきたという現実がある。不平等の是正、制度的な応答性の向上、そして市民と政治の間の信頼の再構築なくして、ポピュリズムを巡る問題の根本的な解決は見込めないだろう。

　真に問われているのは、民主主義を内側から腐食する誘惑に抵抗しながら、同時にその制度的形式を生き生きとした実質で満たしていく能力を、私たち自身が持ち続けられるかどうかだ。

問1：この文章においてポピュリズムの本質として述べられていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'「純粋な人民」と「腐敗したエリート」の対立という二項対立的な政治的想像力', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'経済格差の是正と富の再分配を第一の目標とする政治運動', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'憲法や人権規範の強化によって少数者の権利を守ろうとする社会運動', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'移民や難民の排斥のみを目的とする特定の政治的立場', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 20, 12, '主張理解(長文)');

  -- sort=21 daimon=12 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　二十世紀後半に「歴史の終わり」と評されるほど安定していると思われた自由民主主義体制は、今日、かつてない挑戦に直面している。経済的不平等の拡大、エリートへの不信感、移民・難民問題をめぐる社会的亀裂——これらの複合的な要因を背景として、既成政党や主流メディアへの反発を糧に台頭するポピュリズム勢力が、多くの先進民主主義国において影響力を増している。

　ポピュリズムという言葉は、しばしば否定的な含意で使われるが、その本質は「純粋な人民」と「腐敗したエリート」の対立という二項対立的な政治的想像力にある。この構図はあらゆる政治的立場に寄生しうる——左派ポピュリズムは経済的支配層を批判し、右派ポピュリズムは移民や文化的少数者を「外なる敵」として標的化する。いずれの場合も、「人民の意志」こそが唯一正当な統治の根拠であるとされ、それに反すると見なされる制度的制約（司法の独立・少数者の権利保護・メディアの自由など）は批判の対象となりやすい。

　問題の核心は、民主主義が「多数決」と「立憲主義」という二つの原理の緊張関係の上に成立しているという点にある。多数決は民意の直接的な表出を可能にするが、それ単独では多数派による少数派の抑圧（いわゆる「多数派の専制」）に陥りかねない。憲法や人権規範はこの危険を防ぐための制度的安全装置として機能してきた。ポピュリズムが立憲的制約を「民意を阻害するエリートの道具」として攻撃するとき、民主主義の実質的な基盤が侵食される危険がある。

　しかし、ポピュリズムの台頭を単純に「民主主義の敵」として退けることもまた問題をはらむ。ポピュリストへの支持が広がる背景には、既成の民主主義制度が実際に多くの市民の声を取りこぼしてきたという現実がある。不平等の是正、制度的な応答性の向上、そして市民と政治の間の信頼の再構築なくして、ポピュリズムを巡る問題の根本的な解決は見込めないだろう。

　真に問われているのは、民主主義を内側から腐食する誘惑に抵抗しながら、同時にその制度的形式を生き生きとした実質で満たしていく能力を、私たち自身が持ち続けられるかどうかだ。

問2：「多数派の専制」という言葉でこの文章が示している問題はどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'少数の政治指導者が多くの国民を一方的に支配する権威主義体制', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'多数決の原理のみに依拠した統治が少数派を抑圧する危険', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'メディアが特定の世論を形成して選挙結果を操作する問題', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'経済的多数派の利益のみを反映した政策が立案される構造', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 21, 12, '主張理解(長文)');

  -- sort=22 daimon=12 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　二十世紀後半に「歴史の終わり」と評されるほど安定していると思われた自由民主主義体制は、今日、かつてない挑戦に直面している。経済的不平等の拡大、エリートへの不信感、移民・難民問題をめぐる社会的亀裂——これらの複合的な要因を背景として、既成政党や主流メディアへの反発を糧に台頭するポピュリズム勢力が、多くの先進民主主義国において影響力を増している。

　ポピュリズムという言葉は、しばしば否定的な含意で使われるが、その本質は「純粋な人民」と「腐敗したエリート」の対立という二項対立的な政治的想像力にある。この構図はあらゆる政治的立場に寄生しうる——左派ポピュリズムは経済的支配層を批判し、右派ポピュリズムは移民や文化的少数者を「外なる敵」として標的化する。いずれの場合も、「人民の意志」こそが唯一正当な統治の根拠であるとされ、それに反すると見なされる制度的制約（司法の独立・少数者の権利保護・メディアの自由など）は批判の対象となりやすい。

　問題の核心は、民主主義が「多数決」と「立憲主義」という二つの原理の緊張関係の上に成立しているという点にある。多数決は民意の直接的な表出を可能にするが、それ単独では多数派による少数派の抑圧（いわゆる「多数派の専制」）に陥りかねない。憲法や人権規範はこの危険を防ぐための制度的安全装置として機能してきた。ポピュリズムが立憲的制約を「民意を阻害するエリートの道具」として攻撃するとき、民主主義の実質的な基盤が侵食される危険がある。

　しかし、ポピュリズムの台頭を単純に「民主主義の敵」として退けることもまた問題をはらむ。ポピュリストへの支持が広がる背景には、既成の民主主義制度が実際に多くの市民の声を取りこぼしてきたという現実がある。不平等の是正、制度的な応答性の向上、そして市民と政治の間の信頼の再構築なくして、ポピュリズムを巡る問題の根本的な解決は見込めないだろう。

　真に問われているのは、民主主義を内側から腐食する誘惑に抵抗しながら、同時にその制度的形式を生き生きとした実質で満たしていく能力を、私たち自身が持ち続けられるかどうかだ。

問3：ポピュリズムの台頭を単純に「民主主義の敵」として退けることの問題点として、筆者が述べていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ポピュリスト政党には優秀な政治家が多く、その政策立案能力を無駄にするから。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ポピュリズム勢力は大きな実力を持っており、対立すると社会秩序が崩壊するから。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'既成の民主主義制度が多くの市民の声を実際に取りこぼしてきたという現実があるから。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ポピュリズムには独自の立憲主義的価値観と民主的な基盤があるから。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 22, 12, '主張理解(長文)');

  -- sort=23 daimon=12 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'　二十世紀後半に「歴史の終わり」と評されるほど安定していると思われた自由民主主義体制は、今日、かつてない挑戦に直面している。経済的不平等の拡大、エリートへの不信感、移民・難民問題をめぐる社会的亀裂——これらの複合的な要因を背景として、既成政党や主流メディアへの反発を糧に台頭するポピュリズム勢力が、多くの先進民主主義国において影響力を増している。

　ポピュリズムという言葉は、しばしば否定的な含意で使われるが、その本質は「純粋な人民」と「腐敗したエリート」の対立という二項対立的な政治的想像力にある。この構図はあらゆる政治的立場に寄生しうる——左派ポピュリズムは経済的支配層を批判し、右派ポピュリズムは移民や文化的少数者を「外なる敵」として標的化する。いずれの場合も、「人民の意志」こそが唯一正当な統治の根拠であるとされ、それに反すると見なされる制度的制約（司法の独立・少数者の権利保護・メディアの自由など）は批判の対象となりやすい。

　問題の核心は、民主主義が「多数決」と「立憲主義」という二つの原理の緊張関係の上に成立しているという点にある。多数決は民意の直接的な表出を可能にするが、それ単独では多数派による少数派の抑圧（いわゆる「多数派の専制」）に陥りかねない。憲法や人権規範はこの危険を防ぐための制度的安全装置として機能してきた。ポピュリズムが立憲的制約を「民意を阻害するエリートの道具」として攻撃するとき、民主主義の実質的な基盤が侵食される危険がある。

　しかし、ポピュリズムの台頭を単純に「民主主義の敵」として退けることもまた問題をはらむ。ポピュリストへの支持が広がる背景には、既成の民主主義制度が実際に多くの市民の声を取りこぼしてきたという現実がある。不平等の是正、制度的な応答性の向上、そして市民と政治の間の信頼の再構築なくして、ポピュリズムを巡る問題の根本的な解決は見込めないだろう。

　真に問われているのは、民主主義を内側から腐食する誘惑に抵抗しながら、同時にその制度的形式を生き生きとした実質で満たしていく能力を、私たち自身が持ち続けられるかどうかだ。

問4：この文章で筆者が最終的に問いかけていることはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ポピュリズム勢力に対して国際的な法的規制を設けるべきかどうか。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'自由民主主義体制をすべての国が採用すべきかどうか。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'多数決制度を廃止して専門家による政治体制に移行すべきかどうか。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'民主主義を腐食する誘惑に抵抗しながらその制度的実質を保ち続けられるかどうか。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 23, 12, '主張理解(長文)');

  -- sort=24 daimon=13 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'【ビジネス日本語スキルアップ研修センター　受講案内】

本センターは、在職中の外国籍社員の日本語ビジネスコミュニケーション能力向上を目的とした研修を実施しています。

■開講コース一覧
・基礎コース　：毎週火・木　19:00〜21:00　全12回　受講料：18,000円
・実践コース　：毎週月・水・金　18:30〜20:30　全16回　受講料：32,000円　※基礎コース修了者または同等の能力を有する方
・集中コース　：土・日　9:00〜17:00　全6日間　受講料：45,000円　※実践コース修了者または日本語能力試験N2以上取得者

■受講申込について
・申込締切：各コース開講2週間前
・定員：各クラス最大10名（先着順）
・受講に際して、職場の上長による推薦書の提出が必要です
・基礎コースは特に受講前提条件なし

■その他
・すべてのコースで修了証を発行します
・集中コースの昼食代は受講料に含まれません
・オンライン受講オプションは実践コースのみ対応

お問い合わせ：biz-nihongo@center.example.jp

問1：日本語能力試験N2の資格を持ち、平日は仕事のため週末のみ参加できる会社員が申し込める最も条件に合ったコースはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'集中コース', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'基礎コース', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'実践コース', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'基礎コースと実践コースの両方', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 24, 13, '情報検索');

  -- sort=25 daimon=13 (dokkai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000142'::uuid, E'【ビジネス日本語スキルアップ研修センター　受講案内】

本センターは、在職中の外国籍社員の日本語ビジネスコミュニケーション能力向上を目的とした研修を実施しています。

■開講コース一覧
・基礎コース　：毎週火・木　19:00〜21:00　全12回　受講料：18,000円
・実践コース　：毎週月・水・金　18:30〜20:30　全16回　受講料：32,000円　※基礎コース修了者または同等の能力を有する方
・集中コース　：土・日　9:00〜17:00　全6日間　受講料：45,000円　※実践コース修了者または日本語能力試験N2以上取得者

■受講申込について
・申込締切：各コース開講2週間前
・定員：各クラス最大10名（先着順）
・受講に際して、職場の上長による推薦書の提出が必要です
・基礎コースは特に受講前提条件なし

■その他
・すべてのコースで修了証を発行します
・集中コースの昼食代は受講料に含まれません
・オンライン受講オプションは実践コースのみ対応

お問い合わせ：biz-nihongo@center.example.jp

問2：この案内の内容と合っているものはどれか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'すべてのコースでオンライン受講が可能である。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'集中コースの受講には上長の推薦書と実践コース修了またはN2以上取得が必要である。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'定員は各クラス20名で、申し込みは抽選によって決まる。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'集中コースの受講料には昼食代も含まれている。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'dokkai', 25, 13, '情報検索');

  -- sort=1 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、男の人が上司の女の人と話しています。

女：坂本さん、明後日の取引先への訪問なんですが、先方から急遽日程の変更依頼が来ました。
男：では改めてアポイントを取り直さないといけませんね。
女：先方は来週月曜か火曜を希望しています。まず部長のスケジュールを確認してから、先方に連絡してもらえますか。
男：わかりました。あと、提案書の最終版もまだ上司の確認が取れていなくて。
女：提案書は私が確認しておくので、坂本さんはまず部長の日程を押さえることに集中してください。

男の人はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'部長の空いている日程を確認する', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'取引先にキャンセルの連絡をする', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'提案書の最終版を仕上げる', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'会議室の予約を取る', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 1, 1, '課題理解');

  -- sort=2 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、女の人と男の先輩社員が話しています。

男：松田さん、来月の展示会出展なんだけど、ブースのレイアウト図はできてる？
女：はい、先週完成して担当者に送りました。
男：パンフレットは広報部がまとめて発注するから、松田さんはやらなくていいよ。それより、デモ機材の動作確認は終わった？
女：あ、それはまだです。明日やろうと思っていたんですが。
男：展示会は再来週だから、今日中に確認して、問題があれば技術部に報告してね。

女の人はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ブースのレイアウト図を完成させる', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'デモ機材の動作確認をする', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'パンフレットの印刷を発注する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'技術部に連絡する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 2, 1, '課題理解');

  -- sort=3 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社のIT部門で、部長と担当者が話しています。

部長：中村さん、来週の社内システム移行作業の準備はどう？
中村：移行手順書はできました。社員への通知メールの下書きも完成しています。
部長：通知メールは私が最終確認してから送信するので、その前に全データのバックアップが完了しているか確認してもらえますか。バックアップなしに移行作業は始められないので。
中村：わかりました。サーバー室の鍵の手配もしたほうがいいでしょうか。
部長：鍵は総務部がもう手配済みだから大丈夫です。

担当者はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'社員への通知メールを送る', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'サーバー室の鍵を手配する', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'全データのバックアップ完了を確認する', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'移行手順書を見直す', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 3, 1, '課題理解');

  -- sort=4 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、人事担当の女の人と男の人が話しています。

女：田村さん、明日の中途採用の面接、準備はできていますか。
男：履歴書の確認は終わりました。あとは面接室の予約をと思っていたんですが。
女：面接室は私がもう予約してあります。それより、応募者への当日の案内メールは送りましたか。受付での手続きも書いておかないといけないんですよ。
男：あっ、それはまだです。
女：面接は午前10時からなので、前日の今日中に送ってください。あと、面接評価シートのコピーもお忘れなく。
男：評価シートはコピーしておきます。まず案内メールを送ります。

男の人はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'面接室を予約する', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'履歴書の確認をする', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'面接評価シートをコピーする', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'応募者に案内メールを送る', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 4, 1, '課題理解');

  -- sort=5 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、経理部の女の人が上司の男の人と話しています。

男：小川さん、今月の予算執行報告書、CFOへの提出は明日ですよ。
女：数字はほぼまとまりました。ただ、第3部門の経費データがまだ届いていなくて。
男：第3部門の経費は私が直接確認して取り寄せるから、小川さんは先に他の部門のデータで報告書を作成しておいてください。
女：わかりました。あと、前月との比較グラフも作ったほうがいいでしょうか。
男：グラフは報告書が完成してからでいい。まずは本文を仕上げることを優先してください。

女の人はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'他の部門のデータで報告書を作成する', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'第3部門に経費データを請求する', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'CFOにメールで状況を連絡する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'前月との比較グラフを作成する', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 5, 1, '課題理解');

  -- sort=6 daimon=1 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、男の人がイベント担当の女の人と話しています。

女：西川さん、来月の創立記念パーティーの会場が急に使えなくなったって聞きましたが。
男：そうなんです。先ほど会場から設備の不具合で使用不可になったと連絡が来て。
女：参加予定者はもう200名を超えていますよね。代替会場の確保も大事ですが、まず参加者への連絡が先ですよ。
男：代替会場は私の方で今すぐ当たります。参加者への連絡は少し後でも大丈夫ですよね。
女：いいえ、スケジュールの都合があるから先に通知してください。会場が決まり次第また連絡すると伝えればいいから。

男の人はこれからまず何をしなければなりませんか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'代替会場を探す', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'参加者に変更の通知を送る', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'上司に報告する', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'会場に不具合の原因を問い合わせる', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 6, 1, '課題理解');

  -- sort=7 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社で、エンジニア二人が話しています。

A：最近、量子コンピュータの商用化が話題になっていますよね。
B：技術的なポテンシャルはすごいと思いますが、私はまだ懐疑的です。現状では零下270度近い極低温環境が必要で、そのコスト自体が実用化の大きな壁になっています。計算速度は従来のコンピュータを遥かに超えますが、特定の計算問題にしか強みを発揮できないという制約もあります。
A：汎用的に使えるようになるまではまだ相当時間がかかりそうですね。

Bエンジニアが量子コンピュータの実用化についてどう考えていますか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'セキュリティ面での課題が最も深刻だ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'計算速度の向上がまだ不十分だ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'動作環境のコストと用途の限定性が壁になっている', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'従来のコンピュータとの互換性がない', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 7, 2, 'ポイント理解');

  -- sort=8 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社の健康管理部門で、担当者と部長が話しています。

部長：最近、従業員のメンタルヘルスに関する相談件数が増えているようですが。
担当者：はい、特に中間管理職からの相談が目立ちます。上からの業績プレッシャーと部下のマネジメントの板挟みになって疲弊している方が多いんです。
部長：研修を強化すればいいんじゃないか。
担当者：研修も大切ですが、根本的には業務量の見直しと、SOSを出しやすい職場風土の整備が先決だと思います。相談窓口を設けても、使うことへの心理的抵抗がある限り活用されません。

担当者が最も問題だと考えていることは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'部長のプレッシャーが強すぎること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'相談窓口のスタッフが足りないこと', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'メンタルヘルス研修の内容が不十分なこと', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'業務量が多く、相談しやすい環境が整っていないこと', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 8, 2, 'ポイント理解');

  -- sort=9 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'ビジネスセミナーで、講師が話しています。

海外子会社のマネジメントにおいて、本社が全てをコントロールしようとするアプローチは、現地の市場変化への対応が遅れるリスクがあります。一方で、現地法人に自律性を与えすぎると、グループ全体の方向性との乖離が起きる。最適解は、財務・ブランド・コンプライアンスの領域は本社が一元管理し、商品ラインナップや営業戦略など現地に密着した判断は現地に委ねる、ハイブリッドなガバナンスです。

講師が最も強調しているのは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'領域ごとに管理の主体を使い分けるべきだ', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'現地の自律性を最大限に尊重すべきだ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'海外子会社への投資をさらに増やすべきだ', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'グループ全体は本社が一元管理すべきだ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 9, 2, 'ポイント理解');

  -- sort=10 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'法律事務所で、弁護士とクライアントが話しています。

弁護士：今回の個人情報漏えい事案ですが、対応を誤ると損害賠償リスクだけでなく、規制当局からの制裁もあり得ます。
クライアント：まず社内でこっそり対処したいのですが。
弁護士：それは絶対に避けてください。個人情報保護法では、一定規模以上の漏えいは監督機関への報告義務があります。それを怠れば法的ペナルティが大幅に重くなります。また、被害者への早期通知も信頼回復のために不可欠です。隠蔽して後から発覚した場合の社会的ダメージは計り知れません。

弁護士が最も重視していることは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'訴訟費用を最小限に抑えること', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'法令に従い適切に開示・報告すること', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'報道機関への対応を優先すること', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'社内調査を先に完了させること', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 10, 2, 'ポイント理解');

  -- sort=11 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'食品業界の展示会で、業界関係者二人が話しています。

A：代替タンパク質の市場、ここ数年で急速に拡大していますね。
B：数字上は伸びていますが、私は慎重に見ています。消費者調査では「健康的で環境に良い」という点は評価されている一方、「味や食感が本物に劣る」という不満がまだかなり残っています。コストも従来品より高いままで、大衆化するには技術革新と価格低下の両方が必要です。

B氏が代替タンパク質市場についてどう考えていますか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'市場の成長は長期的に見ても難しい', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'規制対応が最大の障壁になっている', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'味・価格の課題が解決されないと本格普及は困難だ', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'環境への貢献が消費者にまだ認められていないのが問題だ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 11, 2, 'ポイント理解');

  -- sort=12 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'高校の進路相談室で、生徒と先生が話しています。

先生：田中さん、理学部を目指したいということだったけど、最近迷っているって聞いたよ。
生徒：親から「文系の方が就職に有利だ」と言われて、経済学部もいいかなと思い始めて。
先生：就職率の数字だけを見ると文系が高く見える場合もあるけれど、理学系が不利というわけではないよ。大切なのは、自分が入学後に何を学びたいかで選ぶことじゃないかな。数学や物理が好きなら、理系の学びを活かせるキャリアは今後ますます必要とされるよ。

先生が最も伝えたいことは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'数学の成績を上げることが最優先だ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'文系よりも理系の方が就職に有利だ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'親の意見は参考にしなくてよい', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'学部は自分の学びたいことを基準に選ぶべきだ', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 12, 2, 'ポイント理解');

  -- sort=13 daimon=2 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'中小企業の経営者と経営コンサルタントが話しています。

コンサルタント：DX推進について、中小企業の場合ツールを導入するだけでは効果が出ないことが多いんですよ。
経営者：そうなんですか。新しいシステムを入れればいいと思っていたんですが。
コンサルタント：最も大きな壁はツールよりも人材です。デジタル化を推進できる人材が社内にいないと、どんな優れたシステムも使いこなせません。外部から採用するか既存社員を育成するかという問題はありますが、まずそこに取り組まないことには、ツール投資が無駄になります。

コンサルタントが最も重要な課題として挙げているのは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'DX推進を担える人材が社内に不足していること', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'自社に合った最新のデジタルツールを選定すること', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'外部のシステム会社と早急に提携すること', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'競合他社との差別化戦略を立てること', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 13, 2, 'ポイント理解');

  -- sort=14 daimon=3 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'会社の会議室で、上司と部下が話しています。

上司：今年から多様性推進活動を本格化するという方針が出ましたが、現場ではどう受け止められていますか。
部下：正直、「またスローガンだけで終わるのでは」という声が上がっています。以前も同じような取り組みがありましたが、管理職の意識が変わらないまま制度だけ整えても形骸化してしまいました。
上司：今回は管理職への研修を義務化する予定です。
部下：それは良いと思います。制度と意識改革を同時に進めるのが重要だと思います。

この会話で二人が主に話し合っているのは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'採用方針の見直しについて', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'多様性推進を実効性のあるものにする方法', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'過去の取り組みが失敗した責任の所在', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'管理職の人事評価制度の改善', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 14, 3, '概要理解');

  -- sort=15 daimon=3 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'テレビのインタビューで、伝統工芸職人と進行役が話しています。

進行役：今日は染物職人の山口さんにお越しいただきました。後継者問題が深刻だと聞いていますが。
職人：私の工房では弟子が20年間一人も入ってきていません。若い人が手仕事に興味を持たないというより、生活が成り立つだけの収入を得られるまでに10年以上かかるという現実が障壁なんです。
進行役：行政の支援は？
職人：補助金はありますが、作品の販路が限られていて、売れなければ続けられない。デジタル活用やブランディングで販路を広げないと、技術は消えていきます。

この会話で二人が主に話し合っているのは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'伝統工芸の歴史的・文化的な価値', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'行政補助金の使い道と課題', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'伝統工芸職人が抱える収入・販路の問題と後継者不足', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'若者のものづくり離れの心理的な原因', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 15, 3, '概要理解');

  -- sort=16 daimon=3 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'大学の講義で、教授が話しています。

SNSの普及により、誰もが情報発信者になれる時代になりました。しかしその一方で、民主主義の土台となるべき「共有された事実」が失われつつあります。アルゴリズムによってユーザーは自分が信じたい情報のみを見続けるエコーチェンバーに閉じ込められ、社会の分断が深まっています。また、意図的な偽情報がウイルスのように拡散することで、選挙や政策判断にまで影響を与えています。メディアリテラシー教育と、プラットフォームへの規制の両面が急務です。

話し手が最も言いたいことは何ですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'SNSは今すぐ全面的に禁止すべきだ', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'伝統的なメディアの方が信頼性が高い', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'アルゴリズムの透明性を高める必要がある', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'SNSの情報操作問題は民主主義を脅かしており対策が急務だ', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 16, 3, '概要理解');

  -- sort=17 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'先ほどの会議の議事録、今日中にまとめてメーリングリストに送っておいてもらえますか。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'かしこまりました。本日中に共有いたします。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'会議はいつ終わりましたか。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'議事録は必要ありませんでした。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'私はその会議に参加していませんでした。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 17, 4, '即時応答');

  -- sort=18 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'今夜、少し残業をお願いできますか。急ぎの案件が入ってしまって。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'残業代は出ますか。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'承知しました。どのくらいかかりそうでしょうか。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'今夜は先約がございまして、対応が難しい状況です。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'残業はできません。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 18, 4, '即時応答');

  -- sort=19 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'先方との交渉、なんとかまとまりました。条件も当初より有利な内容で合意できましたよ。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'有利な条件とは具体的にどういうことですか。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'次の交渉はいつですか。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'それは朗報ですね。お疲れ様でした。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'交渉はうまくいかないと思っていました。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 19, 4, '即時応答');

  -- sort=20 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'申し訳ありません。工程の遅れで、来週の納品が難しくなってしまいました。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'来週はちょうど休みなので大丈夫です。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'納品が遅れてもかまいません。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'すぐに取引先に謝ってください。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'遅延の理由を詳しく報告してください。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 20, 4, '即時応答');

  -- sort=21 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'この資料、表現が少し堅すぎると思いませんか。もう少し読みやすくしたほうがいいかと。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ご指摘ありがとうございます。修正してみます。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'表現を変えると意味が変わってしまいます。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'読む人によります。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'私にはそうは思いません。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 21, 4, '即時応答');

  -- sort=22 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'この型番の商品、在庫はまだ残っていますか。急ぎで必要なんですが。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'人気商品なのでないかもしれません。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'在庫を関係部署に確認します。少々お待ちください。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'急ぎでも対応できません。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'在庫管理は担当外です。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 22, 4, '即時応答');

  -- sort=23 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'山本さん、今月の業績評価の結果、課長への昇進が決まりました。おめでとうございます。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'給与はどのくらい上がりますか。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'もう少し考えさせてください。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ありがとうございます。身に余る光栄です。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'課長の仕事は大変そうですね。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 23, 4, '即時応答');

  -- sort=24 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'先日の講演、大変参考になりましたというお礼のメールが届いていますよ。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'それは失礼しました。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'講演の内容はどうでしたか。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'お礼を言いに来てくださいと伝えてください。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ありがとうございます。後ほど返信します。', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 24, 4, '即時応答');

  -- sort=25 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'来週の提出期限なんですが、もう一週間だけ延ばしていただくことはできますか。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'理由を教えていただけますか。状況によって検討します。', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'期限の延長は一切認められません。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'もっと早く相談してください。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'来週はちょうど休みなので大丈夫です。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 25, 4, '即時応答');

  -- sort=26 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'田中さん、来月で退職されるって本当ですか。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'田中さんは仕事ができないから仕方ないですよ。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'そうなんですか。寂しくなりますね。', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'早く言ってくれればよかったのに。', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'それは知りませんでした。誰から聞きましたか。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 26, 4, '即時応答');

  -- sort=27 daimon=4 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'今後は、書類の提出前に必ず上長の承認を得るようにしてください。今回のようなミスを防ぐためにも。

最も適切な応答を選びなさい。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'承認を得ると時間がかかってしまいます。', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'ミスは誰にでもあることです。', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'今後はそのようにいたします。ご指導ありがとうございます。', true, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'上長はいつも忙しくて相談しにくいです。', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 27, 4, '即時応答');

  -- sort=28 daimon=5 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'ある会社で、総務部長と二人の部長がオフィス移転計画について話し合っています。

田中（総務部長）：現在の本社ビルの賃料が来年度から30%値上がりすることになりました。移転候補地は二つあります。一つは郊外のビルで賃料を大幅に削減できますが、現在の駅直結の立地と比べてアクセスが悪くなります。もう一つは現在のビルの近くで、賃料は15%削減に留まります。
山本（営業部長）：顧客が来社することも多いので、アクセスの悪化は困ります。郊外移転は反対です。近隣移転だけでも十分コスト削減効果はあると思います。
鈴木（人事部長）：社員の通勤しやすさや採用競争力を考えると、郊外移転には慎重です。一方で賃料問題は深刻ですから、近隣ビル移転を選びつつ、テレワーク推進で実質的なオフィス使用面積を減らすという組み合わせで対応できないかと思います。
田中：鈴木さんの提案は興味深いですね。次回の会議で具体的な数字を持ち寄りましょう。

三人の合意に最も近いのはどれですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'コスト削減を最優先に郊外ビルへ移転する', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'賃料の値上げを受け入れて現在のビルに留まる', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'しばらく判断を保留にして様子を見る', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'近隣ビルへ移転しつつテレワーク推進で費用を抑える', true, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 28, 5, '統合理解');

  -- sort=29 daimon=5 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'大学の学部改革委員会で、学部長と二人の教員が話し合っています。

学部長：来年度のカリキュラム改革について意見を聞かせてください。企業からは「実践的なスキルを持つ学生を育ててほしい」という声が増えています。
佐藤教員：インターンシップの必修化とプロジェクト型学習の拡充を提案します。知識を実際の問題解決に応用する経験こそが社会に出てから役立つと思います。実学に力を入れるべきです。
中村教員：実学重視は重要ですが、急ぎすぎるのは危険です。大学の本質は深い学問的思考の養成にあります。基礎的な学術教育を削ると応用力の土台が失われる。インターンは選択科目にとどめ、コア科目は基礎学術科目を守るべきです。
学部長：両方の意見に一理あります。次回は具体的なカリキュラム案を持ち寄って、バランスを検討しましょう。

学部長の立場として最も近いのはどれですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'両方の観点を取り入れたバランスを検討したい', true, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'実践教育を大幅に拡充すべきだ', false, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'企業側の要望には応じなくてよい', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'基礎学術教育を最優先すべきだ', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 29, 5, '統合理解');

  -- sort=30 daimon=5 (choukai)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type) VALUES ('ad000001-0000-0000-0000-000000000143'::uuid, E'地方の町役場で、町長と二人の担当者が空き家活用計画について話し合っています。

町長：当町の空き家率が20%を超えました。この問題への対策について意見を聞かせてください。
木村（地域振興担当）：空き家を改修して移住者向けの安価な住宅として提供する制度を作ることを提案します。都市から移住希望の若い世帯が増えており、うまくマッチングできれば過疎化対策にもなります。
原田（観光振興担当）：歴史的な古民家をゲストハウスや体験施設にリノベーションすることを提案します。地域の魅力を高め、観光客の増加と地域経済の活性化につながります。収益性が見込めるので民間事業者の参入も期待できます。
町長：どちらも有望ですね。空き家の立地や状態によって使い分けることもできそうです。まずは全件調査を進めながら、並行して両方のモデルケースを作っていきましょう。

町長が示した方針として最も適切なのはどれですか。', 'multiple_choice') RETURNING id INTO qid;
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'移住者向け住宅整備のみを優先して進める', false, 1);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'空き家の調査を進めつつ、両方の活用モデルを並行して検討する', true, 2);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'空き家は取り壊して更地にする', false, 3);
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES (qid, E'観光施設化のみを進める', false, 4);
  INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order, daimon, subtype) VALUES (set_id, qid, 'choukai', 30, 5, '統合理解');

  RAISE NOTICE 'Set 4 挿入完了';
END$$;
