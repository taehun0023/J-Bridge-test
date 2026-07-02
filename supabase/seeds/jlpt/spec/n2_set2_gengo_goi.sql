-- JLPT N2 模擬試験 言語知識（文字・語彙） Set 2
-- quiz_id: ad000002-0000-0000-0000-000000000221
-- 32問: KANJI_READING×5, NOTATION×5, WORD_FORMATION×5, CONTEXT_WORD×7, PARAPHRASE×5, WORD_USAGE×5
-- 正答位置分布: 1×8 / 2×8 / 3×8 / 4×8
-- 語彙レベルは jisho.org の JLPT タグを個別に検証し、N2確認済みの語のみ採用（Set1との重複語なし）

-- ============================================================
-- quiz_questions (32問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q5, sort 1-5)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22001-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼の説明は前後で【矛盾】しており、聞いていて混乱した。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「矛盾」は「むじゅん」と読む。「話や物事のつじつまが合わないこと」を意味するN2重要語彙。「むてん」「ぼうじゅん」「じゅんむ」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22002-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼の返事は【曖昧】で、賛成なのか反対なのか分からなかった。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「曖昧」は「あいまい」と読む。「態度や物事がはっきりしないこと」を意味するN2重要語彙。「あいみ」「あんまい」「あいばい」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22003-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

この判断は状況を考えると【妥当】だと思われる。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「妥当」は「だとう」と読む。「判断や措置などが状況にかなっていて適切であること」を意味する。「たとう」「だとん」「わとう」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22004-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は成功しても【謙虚】な態度を崩さなかった。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「謙虚」は「けんきょ」と読む。「自分を控えめにし、素直に人の意見を聞く態度」を意味する。「けんこ」「げんきょ」「けんぎょ」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22005-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼女は上司に対しても【率直】に意見を述べる。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「率直」は「そっちょく」と読む。「隠しごとをせず、思ったことをありのままに述べる様子」を意味するN2重要語彙。「りつちょく」「そつじき」「りっちょく」はいずれも誤り。');

-- 問題2: NOTATION (Q6-Q10, sort 6-10)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22006-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

彼は自分の行動を【はんせい】し、二度と同じ失敗をしないと誓った。',
 'vocabulary', 'NOTATION', true, 1, 6,
 '「はんせい」は「反省」と書く。「自分の言動を振り返り、悪かった点を見つめ直すこと」を意味する。「反正」「反聖」「判省」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22007-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この取り組みは来年度も【けいぞく】される予定だ。',
 'vocabulary', 'NOTATION', true, 1, 7,
 '「けいぞく」は「継続」と書く。「物事を途切れさせずに続けること」を意味する。「経続」「継族」「計続」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22008-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

会社は表記の【とういつ】を図るため、新しいルールを作った。',
 'vocabulary', 'NOTATION', true, 1, 8,
 '「とういつ」は「統一」と書く。「ばらばらのものを一つにまとめること」を意味する。「統壱」「東一」「統市」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22009-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この村は昔から住民による【じち】が行われてきた。',
 'vocabulary', 'NOTATION', true, 1, 9,
 '「じち」は「自治」と書く。「自分たちのことを自分たちの手で治めること」を意味する。「自地」「字治」「治自」はいずれも存在しない、または語順が誤った表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22010-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

彼は【すなお】な性格で、周りから好かれている。',
 'vocabulary', 'NOTATION', true, 1, 10,
 '「すなお」は「素直」と書く。「性格や態度がひねくれておらず、ありのままなこと」を意味する。「素値」は存在しない表記。「素質(そしつ)」は「生まれつきの能力・性質」を意味する別語で読みが異なる。「主直」は存在しない表記。');

-- 問題3: WORD_FORMATION (Q11-Q15, sort 11-15)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22011-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼の（　）失によって会社に大きな損害が出た。',
 'vocabulary', 'WORD_FORMATION', true, 1, 11,
 '「過失(かしつ)」が正解。文脈「彼の___失によって会社に大きな損害が出た」から、不注意による失敗を表す「過失」が適切。「損失」は「損をすること」自体を指す名詞で、"彼の損失によって...損害が出た"は意味が重複し不自然。「欠失」は生物学・医学分野で使われる専門的な語で一般的な文脈に合わない。「誤失」という言葉は存在しない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22012-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

人口の（　）布には地域差が見られる。',
 'vocabulary', 'WORD_FORMATION', true, 1, 12,
 '「分布(ぶんぷ)」が正解。「人口の___布には地域差が見られる」＝人口が地域ごとにどのように広がっているかを表す「分布」が適切。「散布」は種や薬剤などをまき散らすことを意味し人口の描写に合わない。「流布」は噂や情報が広まることを意味し人口には使わない。「配布」は書類などを配ることを意味し文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22013-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この施設は（　）共の福祉のために建てられた。',
 'vocabulary', 'WORD_FORMATION', true, 1, 13,
 '「公共(こうきょう)」が正解。「公共」は社会全体に共通してかかわることを意味する。「大共」「全共」「総共」はいずれも一般的な日本語として存在しない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22014-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この地域は古くから（　）業が盛んで、多くの店が並んでいる。',
 'vocabulary', 'WORD_FORMATION', true, 1, 14,
 '「商業(しょうぎょう)」が正解。「多くの店が並んでいる」という文脈から、店が集まる経済活動を表す「商業」が適切。「工業」は工場での生産活動、「農業」は農作物の栽培、「漁業」は漁を行う産業を指し、いずれも店が並ぶ描写に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22015-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

参加者は午前9時に駅前に（　）合することになっている。',
 'vocabulary', 'WORD_FORMATION', true, 1, 15,
 '「集合(しゅうごう)」が正解。「駅前に___合することになっている」から、決まった場所に人が集まる意味の「集合」が適切。「会合」は普通「会合を開く」のように名詞として使われ、「会合する」という動詞形は一般的でない。「結合」は物と物が結びつくことを表す語で人が待ち合わせる意味では使わない。「連合」は複数の団体・組織が手を組むことを意味し、個人が場所に集まる意味では使わない。');

-- 問題4: CONTEXT_WORD (Q16-Q22, sort 16-22)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22016-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は本番で緊張しながらも実力を十分に（　）した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 16,
 '「発揮(はっき)」が正解。「実力を発揮する」は「持っている力を十分に表すこと」を意味する定番の言い方。「発展」「発達」「発生」はいずれも「実力を___する」という形では使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22017-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

経営陣は環境問題に積極的に取り組む（　）を示した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 17,
 '「姿勢(しせい)」が正解。「取り組む姿勢を示す」は「物事に対する構え・心構えを見せる」という意味の定番表現。「態度」も近い意味を持つが主に対人的なふるまい方を指し、「取り組む姿勢」の方が自然。「様子」「風潮」は「示した」という動詞と結びつきにくい。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22018-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

地震による被害を減らすため、事前に十分な（　）を立てておく必要がある。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 18,
 '「対策(たいさく)」が正解。「対策を立てる」は「問題に備えて具体的な方法を考えること」を意味する定番表現。「対応」は「対応を取る」のように使い「対応を立てる」とは言わない。「対象」「対等」は「立てる」と結びつかない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22019-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長時間の会議がようやく終わり、彼はストレスから（　）された。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 19,
 '「解放(かいほう)」が正解。「ストレスから解放される」は「ストレスという束縛から自由になる」という意味の自然な表現。「解散」は組織や集会がばらばらになること、「解決」は問題そのものを解くことで"ストレスから解決される"とは言わない。「解消」は「ストレスを解消する」のように能動的な形で使われ、「ストレスから解消される」という受身の言い方は不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22020-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は学生時代から（　）に興味を持ち、大学でも劇団に所属していた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 20,
 '「演劇(えんげき)」が正解。「劇団に所属していた」という文脈から、舞台芸術を指す「演劇」が適切。「映画」「音楽」「文学」はいずれも劇団という語と結びつかない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22021-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は片道1時間半かけて会社まで（　）している。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 21,
 '「通勤(つうきん)」が正解。「片道1時間半かけて会社まで」という移動時間を強調する文脈に、勤務先まで通うことを表す「通勤」が最も自然に合う。「通学」は学校に通うことで「会社」と矛盾する。「出勤」は職場に出ること自体を指し、長い移動時間を強調する表現とは結びつきにくい。「退勤」は仕事を終えて帰ることで文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22022-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この会社は残業をしても（　）が上がらないので、社員の不満が高まっている。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 22,
 '「給与(きゅうよ)」が正解。「残業をしても___が上がらない」という文脈は、労働の対価である「給与」が上がらないことへの社員の不満を表す。「経費」は業務上の支出、「利益」は会社の儲け、「税金」は納める金銭であり、いずれも個人の待遇に関する不満の文脈に合わない。');

-- 問題5: PARAPHRASE (Q23-Q27, sort 23-27)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22023-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

明日の発表のことを考えると【気が重い】。',
 'vocabulary', 'PARAPHRASE', true, 1, 23,
 '「気が重い」は「気分が沈んで、あまり気が進まないこと」を意味する慣用表現。「明日の発表のことを考えると」という不安な状況を表す文脈に合う。「とても楽しみだ」は正反対、「何も考えていない」「自信にあふれている」はいずれも「気が重い」の意味に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22024-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼は業界で【顔が広い】ので、いろいろな情報が集まってくる。',
 'vocabulary', 'PARAPHRASE', true, 1, 24,
 '「顔が広い」は「多方面に知り合いが多いこと」を意味する慣用表現。「いろいろな情報が集まってくる」という結果とも整合する。「顔立ちが整っている」は見た目の話で無関係。「自信家である」は性格の話で無関係。「有名で目立つ」は知名度の高さを表し、人脈の広さを表す「顔が広い」とは意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22025-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

道に迷って一人きりになり、【途方に暮れて】しまった。',
 'vocabulary', 'PARAPHRASE', true, 1, 25,
 '「途方に暮れる」は「どうしたらよいか分からず、すっかり困り果てること」を意味する慣用表現。「道に迷って一人きりになり」という状況とも整合する。「冷静に対処法を考える」「すぐに解決策を見つける」は逆の意味、「怒りを抑えられなくなる」は異なる感情を表す。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22026-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

楽しみにしていた旅行が中止になり、彼は【肩を落とした】。',
 'vocabulary', 'PARAPHRASE', true, 1, 26,
 '「肩を落とす」は「がっかりして元気をなくす様子」を意味する慣用表現。「旅行が中止になり」という残念な出来事とも整合する。「大声で怒り出した」は怒りの感情で異なる。「喜びのあまり跳びはねた」は正反対。「全く関心を示さなかった」は無関心を表し、落胆を表す「肩を落とす」とは異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22027-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼の的確な判断力に、同僚たちは【一目置いて】いる。',
 'vocabulary', 'PARAPHRASE', true, 1, 27,
 '「一目置く」は「相手の優れた能力を認めて、敬意を払うこと」を意味する慣用表現。「的確な判断力」という長所を評価する文脈と整合する。「強い不満を持っている」「嫉妬して避けている」はいずれも否定的な感情で逆の意味。「全く関心がない」は「一目置く」の"注目・評価する"という意味と矛盾する。');

-- 問題6: WORD_USAGE (Q28-Q32, sort 28-32)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22028-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「強化」',
 'vocabulary', 'WORD_USAGE', true, 1, 28,
 '「強化(きょうか)」は「力や仕組みをより強く確かなものにすること」を意味する。会社がセキュリティを強化するために新システムを導入する(選択肢4)が正しい用法。「睡眠を強化する」「日程を強化する」「演技力を強化するために休暇を取る」はいずれも「強化」の対象・行為として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22029-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「編集」',
 'vocabulary', 'WORD_USAGE', true, 1, 29,
 '「編集(へんしゅう)」は「文章・映像などの資料を整理し、まとめること」を意味する。雑誌の記事を編集する仕事(選択肢1)が正しい用法。「運動を編集して体力をつける」「規則を編集する」「友人との関係を編集しようと努力した」はいずれも「編集」の対象として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22030-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「測定」',
 'vocabulary', 'WORD_USAGE', true, 1, 30,
 '「測定(そくてい)」は「機器などを用いて数値・量をはかること」を意味する。医師が患者の体温と血圧を測定する(選択肢2)が正しい用法。「気分を測定する」「意見を測定する」「性格を測定する」はいずれも数値ではかれない抽象的な対象で不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22031-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「接続」',
 'vocabulary', 'WORD_USAGE', true, 1, 31,
 '「接続(せつぞく)」は「物と物、機器と機器などをつなげること」を意味する。パソコンをインターネットに接続してから作業を始める(選択肢3)が正しい用法。「社長と接続する」「日記を接続する」「販売を接続する」はいずれも「接続」の対象として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade22032-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「司会」',
 'vocabulary', 'WORD_USAGE', true, 1, 32,
 '「司会(しかい)」は「会や式典を進行し、取り仕切ること」を意味する。結婚式の司会を務め、会場を盛り上げる(選択肢4)が正しい用法。「朝食を司会する」「テストを司会する」「プロジェクトを司会する」はいずれも「司会」の対象として不自然。');

-- ============================================================
-- quiz_question_options (128選択肢: 32問×4択)
-- 正答位置: 1(Q1,Q5,Q9,Q13,Q17,Q21,Q25,Q29) / 2(Q2,Q6,Q10,Q14,Q18,Q22,Q26,Q30)
--           3(Q3,Q7,Q11,Q15,Q19,Q23,Q27,Q31) / 4(Q4,Q8,Q12,Q16,Q20,Q24,Q28,Q32)
-- ============================================================

-- Q1: KANJI_READING 矛盾→むじゅん (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22001-0000-0000-0000-000000000000', 'むじゅん', true,  1),
('ade22001-0000-0000-0000-000000000000', 'むてん',   false, 2),
('ade22001-0000-0000-0000-000000000000', 'ぼうじゅん', false, 3),
('ade22001-0000-0000-0000-000000000000', 'じゅんむ', false, 4);

-- Q2: KANJI_READING 曖昧→あいまい (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22002-0000-0000-0000-000000000000', 'あいみ',   false, 1),
('ade22002-0000-0000-0000-000000000000', 'あいまい', true,  2),
('ade22002-0000-0000-0000-000000000000', 'あんまい', false, 3),
('ade22002-0000-0000-0000-000000000000', 'あいばい', false, 4);

-- Q3: KANJI_READING 妥当→だとう (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22003-0000-0000-0000-000000000000', 'たとう', false, 1),
('ade22003-0000-0000-0000-000000000000', 'だとん', false, 2),
('ade22003-0000-0000-0000-000000000000', 'だとう', true,  3),
('ade22003-0000-0000-0000-000000000000', 'わとう', false, 4);

-- Q4: KANJI_READING 謙虚→けんきょ (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22004-0000-0000-0000-000000000000', 'けんこ',   false, 1),
('ade22004-0000-0000-0000-000000000000', 'げんきょ', false, 2),
('ade22004-0000-0000-0000-000000000000', 'けんぎょ', false, 3),
('ade22004-0000-0000-0000-000000000000', 'けんきょ', true,  4);

-- Q5: KANJI_READING 率直→そっちょく (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22005-0000-0000-0000-000000000000', 'そっちょく', true,  1),
('ade22005-0000-0000-0000-000000000000', 'りつちょく', false, 2),
('ade22005-0000-0000-0000-000000000000', 'そつじき',   false, 3),
('ade22005-0000-0000-0000-000000000000', 'りっちょく', false, 4);

-- Q6: NOTATION はんせい→反省 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22006-0000-0000-0000-000000000000', '反正', false, 1),
('ade22006-0000-0000-0000-000000000000', '反省', true,  2),
('ade22006-0000-0000-0000-000000000000', '反聖', false, 3),
('ade22006-0000-0000-0000-000000000000', '判省', false, 4);

-- Q7: NOTATION けいぞく→継続 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22007-0000-0000-0000-000000000000', '経続', false, 1),
('ade22007-0000-0000-0000-000000000000', '継族', false, 2),
('ade22007-0000-0000-0000-000000000000', '継続', true,  3),
('ade22007-0000-0000-0000-000000000000', '計続', false, 4);

-- Q8: NOTATION とういつ→統一 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22008-0000-0000-0000-000000000000', '統壱', false, 1),
('ade22008-0000-0000-0000-000000000000', '東一', false, 2),
('ade22008-0000-0000-0000-000000000000', '統市', false, 3),
('ade22008-0000-0000-0000-000000000000', '統一', true,  4);

-- Q9: NOTATION じち→自治 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22009-0000-0000-0000-000000000000', '自治', true,  1),
('ade22009-0000-0000-0000-000000000000', '自地', false, 2),
('ade22009-0000-0000-0000-000000000000', '字治', false, 3),
('ade22009-0000-0000-0000-000000000000', '治自', false, 4);

-- Q10: NOTATION すなお→素直 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22010-0000-0000-0000-000000000000', '素値', false, 1),
('ade22010-0000-0000-0000-000000000000', '素直', true,  2),
('ade22010-0000-0000-0000-000000000000', '素質', false, 3),
('ade22010-0000-0000-0000-000000000000', '主直', false, 4);

-- Q11: WORD_FORMATION (過)失 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22011-0000-0000-0000-000000000000', '損', false, 1),
('ade22011-0000-0000-0000-000000000000', '欠', false, 2),
('ade22011-0000-0000-0000-000000000000', '過', true,  3),
('ade22011-0000-0000-0000-000000000000', '誤', false, 4);

-- Q12: WORD_FORMATION (分)布 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22012-0000-0000-0000-000000000000', '散', false, 1),
('ade22012-0000-0000-0000-000000000000', '流', false, 2),
('ade22012-0000-0000-0000-000000000000', '配', false, 3),
('ade22012-0000-0000-0000-000000000000', '分', true,  4);

-- Q13: WORD_FORMATION (公)共 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22013-0000-0000-0000-000000000000', '公', true,  1),
('ade22013-0000-0000-0000-000000000000', '大', false, 2),
('ade22013-0000-0000-0000-000000000000', '全', false, 3),
('ade22013-0000-0000-0000-000000000000', '総', false, 4);

-- Q14: WORD_FORMATION (商)業 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22014-0000-0000-0000-000000000000', '工', false, 1),
('ade22014-0000-0000-0000-000000000000', '商', true,  2),
('ade22014-0000-0000-0000-000000000000', '農', false, 3),
('ade22014-0000-0000-0000-000000000000', '漁', false, 4);

-- Q15: WORD_FORMATION (集)合 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22015-0000-0000-0000-000000000000', '会', false, 1),
('ade22015-0000-0000-0000-000000000000', '結', false, 2),
('ade22015-0000-0000-0000-000000000000', '集', true,  3),
('ade22015-0000-0000-0000-000000000000', '連', false, 4);

-- Q16: CONTEXT_WORD 発揮 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22016-0000-0000-0000-000000000000', '発展', false, 1),
('ade22016-0000-0000-0000-000000000000', '発達', false, 2),
('ade22016-0000-0000-0000-000000000000', '発生', false, 3),
('ade22016-0000-0000-0000-000000000000', '発揮', true,  4);

-- Q17: CONTEXT_WORD 姿勢 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22017-0000-0000-0000-000000000000', '姿勢', true,  1),
('ade22017-0000-0000-0000-000000000000', '態度', false, 2),
('ade22017-0000-0000-0000-000000000000', '様子', false, 3),
('ade22017-0000-0000-0000-000000000000', '風潮', false, 4);

-- Q18: CONTEXT_WORD 対策 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22018-0000-0000-0000-000000000000', '対応', false, 1),
('ade22018-0000-0000-0000-000000000000', '対策', true,  2),
('ade22018-0000-0000-0000-000000000000', '対象', false, 3),
('ade22018-0000-0000-0000-000000000000', '対等', false, 4);

-- Q19: CONTEXT_WORD 解放 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22019-0000-0000-0000-000000000000', '解散', false, 1),
('ade22019-0000-0000-0000-000000000000', '解決', false, 2),
('ade22019-0000-0000-0000-000000000000', '解放', true,  3),
('ade22019-0000-0000-0000-000000000000', '解消', false, 4);

-- Q20: CONTEXT_WORD 演劇 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22020-0000-0000-0000-000000000000', '映画', false, 1),
('ade22020-0000-0000-0000-000000000000', '音楽', false, 2),
('ade22020-0000-0000-0000-000000000000', '文学', false, 3),
('ade22020-0000-0000-0000-000000000000', '演劇', true,  4);

-- Q21: CONTEXT_WORD 通勤 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22021-0000-0000-0000-000000000000', '通勤', true,  1),
('ade22021-0000-0000-0000-000000000000', '通学', false, 2),
('ade22021-0000-0000-0000-000000000000', '出勤', false, 3),
('ade22021-0000-0000-0000-000000000000', '退勤', false, 4);

-- Q22: CONTEXT_WORD 給与 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22022-0000-0000-0000-000000000000', '経費', false, 1),
('ade22022-0000-0000-0000-000000000000', '給与', true,  2),
('ade22022-0000-0000-0000-000000000000', '利益', false, 3),
('ade22022-0000-0000-0000-000000000000', '税金', false, 4);

-- Q23: PARAPHRASE 気が重い (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22023-0000-0000-0000-000000000000', 'とても楽しみだ',             false, 1),
('ade22023-0000-0000-0000-000000000000', '何も考えていない',           false, 2),
('ade22023-0000-0000-0000-000000000000', '気分が沈んで、あまり気が進まない', true, 3),
('ade22023-0000-0000-0000-000000000000', '自信にあふれている',         false, 4);

-- Q24: PARAPHRASE 顔が広い (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22024-0000-0000-0000-000000000000', '顔立ちが整っている', false, 1),
('ade22024-0000-0000-0000-000000000000', '自信家である',       false, 2),
('ade22024-0000-0000-0000-000000000000', '有名で目立つ',       false, 3),
('ade22024-0000-0000-0000-000000000000', '知り合いが多い',     true,  4);

-- Q25: PARAPHRASE 途方に暮れる (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22025-0000-0000-0000-000000000000', 'どうしたらよいか分からず困り果てる', true,  1),
('ade22025-0000-0000-0000-000000000000', '冷静に対処法を考える',             false, 2),
('ade22025-0000-0000-0000-000000000000', '怒りを抑えられなくなる',           false, 3),
('ade22025-0000-0000-0000-000000000000', 'すぐに解決策を見つける',           false, 4);

-- Q26: PARAPHRASE 肩を落とす (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22026-0000-0000-0000-000000000000', '大声で怒り出した',           false, 1),
('ade22026-0000-0000-0000-000000000000', 'がっかりして元気を失った',   true,  2),
('ade22026-0000-0000-0000-000000000000', '喜びのあまり跳びはねた',     false, 3),
('ade22026-0000-0000-0000-000000000000', '全く関心を示さなかった',     false, 4);

-- Q27: PARAPHRASE 一目置く (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22027-0000-0000-0000-000000000000', '強い不満を持っている',             false, 1),
('ade22027-0000-0000-0000-000000000000', '全く関心がない',                   false, 2),
('ade22027-0000-0000-0000-000000000000', '優れた能力を認めて敬意を払っている', true,  3),
('ade22027-0000-0000-0000-000000000000', '嫉妬して避けている',               false, 4);

-- Q28: WORD_USAGE 強化 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22028-0000-0000-0000-000000000000', '彼は毎晩、睡眠を強化するために早く寝ている。', false, 1),
('ade22028-0000-0000-0000-000000000000', '会議の日程を強化することが決まった。', false, 2),
('ade22028-0000-0000-0000-000000000000', 'その俳優は演技力を強化するために、休暇を取ることにした。', false, 3),
('ade22028-0000-0000-0000-000000000000', '会社はセキュリティを強化するため、新しいシステムを導入した。', true, 4);

-- Q29: WORD_USAGE 編集 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22029-0000-0000-0000-000000000000', '彼女は雑誌の記事を編集する仕事をしている。', true, 1),
('ade22029-0000-0000-0000-000000000000', '彼は毎日、運動を編集して体力をつけている。', false, 2),
('ade22029-0000-0000-0000-000000000000', '会社は新しい規則を編集することにした。', false, 3),
('ade22029-0000-0000-0000-000000000000', '彼は友人との関係を編集しようと努力した。', false, 4);

-- Q30: WORD_USAGE 測定 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22030-0000-0000-0000-000000000000', '彼は毎朝、気分を測定してから仕事を始める。', false, 1),
('ade22030-0000-0000-0000-000000000000', '医師は患者の体温と血圧を測定した。', true, 2),
('ade22030-0000-0000-0000-000000000000', 'その会社は社員の意見を測定して、方針を決めた。', false, 3),
('ade22030-0000-0000-0000-000000000000', '彼女は友人の性格を測定するのが得意だ。', false, 4);

-- Q31: WORD_USAGE 接続 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22031-0000-0000-0000-000000000000', '彼は新しい会社の社長と接続することができた。', false, 1),
('ade22031-0000-0000-0000-000000000000', '彼女は毎日、日記を接続している。', false, 2),
('ade22031-0000-0000-0000-000000000000', 'パソコンをインターネットに接続してから作業を始めた。', true, 3),
('ade22031-0000-0000-0000-000000000000', 'その会社は新商品の販売を接続することにした。', false, 4);

-- Q32: WORD_USAGE 司会 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade22032-0000-0000-0000-000000000000', '彼女は毎朝、家族の朝食を司会している。', false, 1),
('ade22032-0000-0000-0000-000000000000', 'その先生は生徒のテストを司会することになった。', false, 2),
('ade22032-0000-0000-0000-000000000000', '会社は新しいプロジェクトを司会することに決めた。', false, 3),
('ade22032-0000-0000-0000-000000000000', '彼は結婚式の司会を務め、会場を盛り上げた。', true, 4);
