-- JLPT N2 模擬試験 言語知識（文字・語彙） Set 3
-- quiz_id: ad000002-0000-0000-0000-000000000231
-- 32問: KANJI_READING×5, NOTATION×5, WORD_FORMATION×5, CONTEXT_WORD×7, PARAPHRASE×5, WORD_USAGE×5
-- 正答位置分布: 1×8 / 2×8 / 3×8 / 4×8

-- ============================================================
-- quiz_questions (32問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q5, sort 1-5)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23001-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

新しい企画案は会議で正式に【承認】された。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「承認」は「しょうにん」と読む。「正式に認めること」を意味するN2重要語彙。「しょうじん」「じょうにん」「しょうよう」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23002-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は【慎重】に言葉を選びながら話した。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「慎重」は「しんちょう」と読む。「注意深く、軽々しく行動しないこと」を意味する。「しんじゅう」「しんじょう」「じんちょう」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23003-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼女の演技は観客を【圧倒】した。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「圧倒」は「あっとう」と読む。「他を大きく上回る力で相手を押さえつけること」を意味するN2語彙。「あつどう」「おうとう(応答)」「あっとん」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23004-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

このプロジェクトは来年度も【継続】される予定だ。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「継続」は「けいぞく」と読む。「物事が引き続き行われること」を意味する。「けいぞう」「けいそく」「きょうぞく」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23005-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

その説明はあまりに【抽象】的で理解しにくかった。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「抽象」は「ちゅうしょう」と読む。「具体的な形を持たず、一般的・概念的であること」を意味するN2語彙。「ちゅうぞう(鋳造)」「ちゅうしゅう(中秋)」「しゅうしょう」はいずれも別の単語で読みが異なる。');

-- 問題2: NOTATION (Q6-Q10, sort 6-10)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23006-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

住民は台風の接近に対し【けいかい】を強めた。',
 'vocabulary', 'NOTATION', true, 1, 6,
 '「けいかい」は「警戒」と書く。「危険に備えて注意すること」を意味する。「軽快(けいかい)」は発音が同じだが「身軽で快活な様子」を表す別語。「景戒」「警戎」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23007-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

血液は体内を【じゅんかん】している。',
 'vocabulary', 'NOTATION', true, 1, 7,
 '「じゅんかん」は「循環」と書く。「一定の道筋をまわって元に戻ることを繰り返すこと」を意味する。「巡環」「循還」「潤還」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23008-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

長年の疲労が【ちくせき】し、体調を崩した。',
 'vocabulary', 'NOTATION', true, 1, 8,
 '「ちくせき」は「蓄積」と書く。「物事が徐々にたまること」を意味する。「畜積」「蓄績」「築積」はいずれも存在しない表記(「畜」「築」も「ちく」と読むため紛らわしいが誤り)。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23009-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

需要と供給の【きんこう】が保たれている。',
 'vocabulary', 'NOTATION', true, 1, 9,
 '「きんこう」は「均衡」と書く。「二つ以上の物事の力や量がつり合っていること」を意味する。「近郊(きんこう)」「金鉱(きんこう)」は発音が同じ別語、「緊効」は存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23010-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

植物は根から水分を【きゅうしゅう】する。',
 'vocabulary', 'NOTATION', true, 1, 10,
 '「きゅうしゅう」は「吸収」と書く。「外部の物質やエネルギーなどを取り込むこと」を意味する。「九州(きゅうしゅう)」「急襲(きゅうしゅう)」は発音が同じ別語、「吸集」は存在しない表記。');

-- 問題3: WORD_FORMATION (Q11-Q15, sort 11-15)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23011-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は（　）経験の分野に思い切って挑戦した。',
 'vocabulary', 'WORD_FORMATION', true, 1, 11,
 '「未経験(みけいけん)」が正解。「未」は「まだ～していないこと」を表す接頭辞。「無経験」は一般的でない表現、「非経験」「不経験」は存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23012-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

アンケートの結果を受け、計画を（　）検討することにした。',
 'vocabulary', 'WORD_FORMATION', true, 1, 12,
 '「再検討(さいけんとう)」が正解。「再」は「もう一度」を表す接頭辞。「複検討」「多検討」「重検討」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23013-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この新型モデルは従来品より（　）性能だと評判だ。',
 'vocabulary', 'WORD_FORMATION', true, 1, 13,
 '「高性能(こうせいのう)」が正解。「高」は「程度が高いこと」を表す接頭辞。「強性能」「多性能」「重性能」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23014-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

このクーポン券は来月末まで有（　）だ。',
 'vocabulary', 'WORD_FORMATION', true, 1, 14,
 '「有効(ゆうこう)」が正解。「クーポン券が来月末まで有効だ」という期限を表す文脈に合う。「有利」「有益」「有償」もいずれも「有＋漢字」の複合語だが、期限を表す文脈には合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23015-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

手術後、病気が（　）発しないよう定期的に検査を受けている。',
 'vocabulary', 'WORD_FORMATION', true, 1, 15,
 '「再発(さいはつ)」が正解。「再」は「もう一度」を表す接頭辞で、「再発」は「一度治まった病気などが再び起こること」を意味する。「誤発」「連発」はいずれも文脈に合わない語、「頻発」は「たびたび起こること」で術後の再発予防という文脈には合わない。');

-- 問題4: CONTEXT_WORD (Q16-Q22, sort 16-22)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23016-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼の意見は多くの人に（　）だと認められた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 16,
 '「妥当(だとう)」が正解。「多くの人に妥当だと認められた」＝適切で無理がないと判断されたという意味。「身勝手」「曖昧」「大胆」はいずれも「認められる」内容として文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23017-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新しい制度の導入には、社員から強い（　）があった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 17,
 '「抵抗(ていこう)」が正解。「新しい制度の導入に社員から強い抵抗があった」＝反対する動きがあったという意味。「賛成」「協力」「期待」はいずれも肯定的な語で、「強い」という修飾と組み合わせても文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23018-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この地域には観光資源として（　）的な魅力がまだ多く残っている。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 18,
 '「潜在(せんざい)的」が正解。「潜在的な魅力」＝表面には表れていないが内に秘められた魅力という意味。「顕著」は「はっきりと目立つこと」で「潜在」と正反対、「一般」「特殊」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23019-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

業績不振で、会社は大きな（　）を受けた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 19,
 '「打撃(だげき)」が正解。「業績不振で大きな打撃を受けた」＝経営に大きな損害を受けたという意味。「利益」「成果」「評価」はいずれも肯定的な語で、「業績不振」という前提と矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23020-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

給与格差の（　）が急務とされている。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 20,
 '「是正(ぜせい)」が正解。「給与格差の是正が急務だ」＝不公平な状態を正すことが急がれているという意味。「拡大」「維持」「助長」はいずれも格差を悪化・継続させる方向の語で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23021-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

会議を（　）に進めるため、事前に資料を配布しておいた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 21,
 '「円滑(えんかつ)」が正解。「会議を円滑に進める」＝物事を滞りなくスムーズに進めるという意味。「複雑」「強引」「緩慢」はいずれも会議運営として望ましくない状態を表し文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23022-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

少しずつではあるが、これまでの規制が（　）されつつある。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 22,
 '「緩和(かんわ)」が正解。「規制が少しずつ緩和されつつある」＝厳しさが徐々にやわらげられているという意味。「強化」は正反対、「維持」は変化がないこと、「撤回」は完全に取り消すことで「少しずつ」という文脈に合わない。');

-- 問題5: PARAPHRASE (Q23-Q27, sort 23-27)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23023-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼はついに【腰を据えて】研究に取り組み始めた。',
 'vocabulary', 'PARAPHRASE', true, 1, 23,
 '「腰を据えて」は「落ち着いて一つの物事にじっくりと本格的に取り組む様子」を表す慣用表現。「研究に取り組み始めた」という文脈に自然に合う。「急いで慌てて」「嫌々ながら」「中途半端に」はいずれも逆の姿勢を表す。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23024-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼のマナーの悪さは【目に余る】ものがあった。',
 'vocabulary', 'PARAPHRASE', true, 1, 24,
 '「目に余る」は「程度がひどすぎて黙って見過ごすことができない」という意味の慣用表現。「マナーの悪さ」を形容する語として自然。「全く気にならない」「非常に素晴らしい」「よく見えない」はいずれも意味が合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23025-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼女には昔世話になったので、今でも【頭が上がらない】。',
 'vocabulary', 'PARAPHRASE', true, 1, 25,
 '「頭が上がらない」は「相手に恩や負い目があり、対等な態度を取れないこと」を表す慣用表現。「昔世話になった」という理由と自然に結びつく。「いつも命令できる」「全く関心がない」「頭痛がひどい」はいずれも意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23026-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

試験に落ちた彼は【肩を落として】帰っていった。',
 'vocabulary', 'PARAPHRASE', true, 1, 26,
 '「肩を落とす」は「がっかりして元気を失った様子」を表す慣用表現。「試験に落ちた」という状況にふさわしい。「喜んで」「怒って」「急いで」はいずれも異なる感情・状態を表す。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23027-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼らは学生時代からの【気が置けない】仲間だ。',
 'vocabulary', 'PARAPHRASE', true, 1, 27,
 '「気が置けない」は「遠慮したり気を使ったりする必要がないほど親しい間柄」を表す慣用表現(誤用に注意が必要な語)。「学生時代からの仲間」という文脈に合う。「気を使わなければならない」は正反対の意味、「あまり信頼できない」「会う機会が少ない」はいずれも文脈に合わない。');

-- 問題6: WORD_USAGE (Q28-Q32, sort 28-32)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23028-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「改善」',
 'vocabulary', 'WORD_USAGE', true, 1, 28,
 '「改善(かいぜん)」は「悪い状態や不十分な点を改めてよくすること」を意味する。新システムの導入により業務効率が向上した(選択肢4)が正しい用法。「天候が改善して雨になった」「成績が改善して点数を落とした」「演技が改善して下手になった」はいずれも「良くなる」という意味と矛盾する内容。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23029-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「発揮」',
 'vocabulary', 'WORD_USAGE', true, 1, 29,
 '「発揮(はっき)」は「持っている力や才能を実際に表すこと」を意味する。本番で実力を発揮し優勝した(選択肢1)が正しい用法。「症状を発揮」「赤字を発揮」「不満を発揮」はいずれも「発揮」を使うべきでない対象で不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23030-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「携わる」',
 'vocabulary', 'WORD_USAGE', true, 1, 30,
 '「携わる(たずさわる)」は「ある仕事や事業に関係し、従事すること」を意味する。長年環境保護活動に携わってきた(選択肢2)が正しい用法。「家事に携わる時間がない」「荷物を携わることができなかった」「試験に携わって時間内に終わらなかった」はいずれも不自然な用法。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23031-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「見落とす」',
 'vocabulary', 'WORD_USAGE', true, 1, 31,
 '「見落とす(みおとす)」は「注意が足りず、見るべきものに気づかないこと」を意味する。忙しさのあまり書類の誤りを見落とした(選択肢3)が正しい用法。「ジョギングを見落として体力をつけている」は意味不明、「被害状況を見落としたが迅速に対応した」「人の欠点を見落とし厳しく指摘する」はいずれも内容が矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23032-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「見なす」',
 'vocabulary', 'WORD_USAGE', true, 1, 32,
 '「見なす(みなす)」は「ある基準に基づいて、そのようなものとして扱う・判断すること」を意味する。無断欠席は辞退したものと見なす(選択肢4)が、契約や規則でよく使われる正しい用法。「新聞を見なす習慣」「家族の顔を見なす」「症状を見なして診断」はいずれも「見なす」の使い方として不自然。');

-- ============================================================
-- quiz_question_options (128選択肢: 32問×4択)
-- 正答位置: 1(Q1,Q5,Q9,Q13,Q17,Q21,Q25,Q29) / 2(Q2,Q6,Q10,Q14,Q18,Q22,Q26,Q30)
--           3(Q3,Q7,Q11,Q15,Q19,Q23,Q27,Q31) / 4(Q4,Q8,Q12,Q16,Q20,Q24,Q28,Q32)
-- ============================================================

-- Q1: KANJI_READING 承認→しょうにん (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23001-0000-0000-0000-000000000000', 'しょうにん', true,  1),
('ade23001-0000-0000-0000-000000000000', 'しょうじん', false, 2),
('ade23001-0000-0000-0000-000000000000', 'じょうにん', false, 3),
('ade23001-0000-0000-0000-000000000000', 'しょうよう', false, 4);

-- Q2: KANJI_READING 慎重→しんちょう (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23002-0000-0000-0000-000000000000', 'しんじゅう', false, 1),
('ade23002-0000-0000-0000-000000000000', 'しんちょう', true,  2),
('ade23002-0000-0000-0000-000000000000', 'しんじょう', false, 3),
('ade23002-0000-0000-0000-000000000000', 'じんちょう', false, 4);

-- Q3: KANJI_READING 圧倒→あっとう (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23003-0000-0000-0000-000000000000', 'あつどう', false, 1),
('ade23003-0000-0000-0000-000000000000', 'おうとう', false, 2),
('ade23003-0000-0000-0000-000000000000', 'あっとう', true,  3),
('ade23003-0000-0000-0000-000000000000', 'あっとん', false, 4);

-- Q4: KANJI_READING 継続→けいぞく (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23004-0000-0000-0000-000000000000', 'けいぞう', false, 1),
('ade23004-0000-0000-0000-000000000000', 'けいそく', false, 2),
('ade23004-0000-0000-0000-000000000000', 'きょうぞく', false, 3),
('ade23004-0000-0000-0000-000000000000', 'けいぞく', true,  4);

-- Q5: KANJI_READING 抽象→ちゅうしょう (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23005-0000-0000-0000-000000000000', 'ちゅうしょう', true,  1),
('ade23005-0000-0000-0000-000000000000', 'ちゅうぞう', false, 2),
('ade23005-0000-0000-0000-000000000000', 'ちゅうしゅう', false, 3),
('ade23005-0000-0000-0000-000000000000', 'しゅうしょう', false, 4);

-- Q6: NOTATION けいかい→警戒 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23006-0000-0000-0000-000000000000', '軽快', false, 1),
('ade23006-0000-0000-0000-000000000000', '警戒', true,  2),
('ade23006-0000-0000-0000-000000000000', '景戒', false, 3),
('ade23006-0000-0000-0000-000000000000', '警戎', false, 4);

-- Q7: NOTATION じゅんかん→循環 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23007-0000-0000-0000-000000000000', '巡環', false, 1),
('ade23007-0000-0000-0000-000000000000', '循還', false, 2),
('ade23007-0000-0000-0000-000000000000', '循環', true,  3),
('ade23007-0000-0000-0000-000000000000', '潤還', false, 4);

-- Q8: NOTATION ちくせき→蓄積 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23008-0000-0000-0000-000000000000', '畜積', false, 1),
('ade23008-0000-0000-0000-000000000000', '蓄績', false, 2),
('ade23008-0000-0000-0000-000000000000', '築積', false, 3),
('ade23008-0000-0000-0000-000000000000', '蓄積', true,  4);

-- Q9: NOTATION きんこう→均衡 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23009-0000-0000-0000-000000000000', '均衡', true,  1),
('ade23009-0000-0000-0000-000000000000', '近郊', false, 2),
('ade23009-0000-0000-0000-000000000000', '金鉱', false, 3),
('ade23009-0000-0000-0000-000000000000', '緊効', false, 4);

-- Q10: NOTATION きゅうしゅう→吸収 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23010-0000-0000-0000-000000000000', '九州', false, 1),
('ade23010-0000-0000-0000-000000000000', '吸収', true,  2),
('ade23010-0000-0000-0000-000000000000', '急襲', false, 3),
('ade23010-0000-0000-0000-000000000000', '吸集', false, 4);

-- Q11: WORD_FORMATION (未)経験 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23011-0000-0000-0000-000000000000', '無', false, 1),
('ade23011-0000-0000-0000-000000000000', '非', false, 2),
('ade23011-0000-0000-0000-000000000000', '未', true,  3),
('ade23011-0000-0000-0000-000000000000', '不', false, 4);

-- Q12: WORD_FORMATION (再)検討 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23012-0000-0000-0000-000000000000', '複', false, 1),
('ade23012-0000-0000-0000-000000000000', '多', false, 2),
('ade23012-0000-0000-0000-000000000000', '重', false, 3),
('ade23012-0000-0000-0000-000000000000', '再', true,  4);

-- Q13: WORD_FORMATION (高)性能 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23013-0000-0000-0000-000000000000', '高', true,  1),
('ade23013-0000-0000-0000-000000000000', '強', false, 2),
('ade23013-0000-0000-0000-000000000000', '多', false, 3),
('ade23013-0000-0000-0000-000000000000', '重', false, 4);

-- Q14: WORD_FORMATION 有(効) (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23014-0000-0000-0000-000000000000', '利', false, 1),
('ade23014-0000-0000-0000-000000000000', '効', true,  2),
('ade23014-0000-0000-0000-000000000000', '益', false, 3),
('ade23014-0000-0000-0000-000000000000', '償', false, 4);

-- Q15: WORD_FORMATION (再)発 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23015-0000-0000-0000-000000000000', '誤', false, 1),
('ade23015-0000-0000-0000-000000000000', '頻', false, 2),
('ade23015-0000-0000-0000-000000000000', '再', true,  3),
('ade23015-0000-0000-0000-000000000000', '連', false, 4);

-- Q16: CONTEXT_WORD 妥当 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23016-0000-0000-0000-000000000000', '身勝手', false, 1),
('ade23016-0000-0000-0000-000000000000', '曖昧', false, 2),
('ade23016-0000-0000-0000-000000000000', '大胆', false, 3),
('ade23016-0000-0000-0000-000000000000', '妥当', true,  4);

-- Q17: CONTEXT_WORD 抵抗 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23017-0000-0000-0000-000000000000', '抵抗', true,  1),
('ade23017-0000-0000-0000-000000000000', '賛成', false, 2),
('ade23017-0000-0000-0000-000000000000', '協力', false, 3),
('ade23017-0000-0000-0000-000000000000', '期待', false, 4);

-- Q18: CONTEXT_WORD 潜在 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23018-0000-0000-0000-000000000000', '顕著', false, 1),
('ade23018-0000-0000-0000-000000000000', '潜在', true,  2),
('ade23018-0000-0000-0000-000000000000', '一般', false, 3),
('ade23018-0000-0000-0000-000000000000', '特殊', false, 4);

-- Q19: CONTEXT_WORD 打撃 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23019-0000-0000-0000-000000000000', '利益', false, 1),
('ade23019-0000-0000-0000-000000000000', '成果', false, 2),
('ade23019-0000-0000-0000-000000000000', '打撃', true,  3),
('ade23019-0000-0000-0000-000000000000', '評価', false, 4);

-- Q20: CONTEXT_WORD 是正 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23020-0000-0000-0000-000000000000', '拡大', false, 1),
('ade23020-0000-0000-0000-000000000000', '維持', false, 2),
('ade23020-0000-0000-0000-000000000000', '助長', false, 3),
('ade23020-0000-0000-0000-000000000000', '是正', true,  4);

-- Q21: CONTEXT_WORD 円滑 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23021-0000-0000-0000-000000000000', '円滑', true,  1),
('ade23021-0000-0000-0000-000000000000', '複雑', false, 2),
('ade23021-0000-0000-0000-000000000000', '強引', false, 3),
('ade23021-0000-0000-0000-000000000000', '緩慢', false, 4);

-- Q22: CONTEXT_WORD 緩和 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23022-0000-0000-0000-000000000000', '強化', false, 1),
('ade23022-0000-0000-0000-000000000000', '緩和', true,  2),
('ade23022-0000-0000-0000-000000000000', '維持', false, 3),
('ade23022-0000-0000-0000-000000000000', '撤回', false, 4);

-- Q23: PARAPHRASE 腰を据えて (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23023-0000-0000-0000-000000000000', '急いで慌てて',           false, 1),
('ade23023-0000-0000-0000-000000000000', '嫌々ながら',             false, 2),
('ade23023-0000-0000-0000-000000000000', '落ち着いてじっくりと',   true,  3),
('ade23023-0000-0000-0000-000000000000', '中途半端に',             false, 4);

-- Q24: PARAPHRASE 目に余る (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23024-0000-0000-0000-000000000000', '全く気にならない',       false, 1),
('ade23024-0000-0000-0000-000000000000', '非常に素晴らしい',       false, 2),
('ade23024-0000-0000-0000-000000000000', 'よく見えない',           false, 3),
('ade23024-0000-0000-0000-000000000000', '見過ごせないほどひどい', true,  4);

-- Q25: PARAPHRASE 頭が上がらない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23025-0000-0000-0000-000000000000', '恩があって対等に振る舞えない', true,  1),
('ade23025-0000-0000-0000-000000000000', 'いつも命令できる',             false, 2),
('ade23025-0000-0000-0000-000000000000', '全く関心がない',               false, 3),
('ade23025-0000-0000-0000-000000000000', '頭痛がひどい',                 false, 4);

-- Q26: PARAPHRASE 肩を落とす (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23026-0000-0000-0000-000000000000', '喜んで',   false, 1),
('ade23026-0000-0000-0000-000000000000', 'がっかりして', true,  2),
('ade23026-0000-0000-0000-000000000000', '怒って',   false, 3),
('ade23026-0000-0000-0000-000000000000', '急いで',   false, 4);

-- Q27: PARAPHRASE 気が置けない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23027-0000-0000-0000-000000000000', '気を使わなければならない', false, 1),
('ade23027-0000-0000-0000-000000000000', 'あまり信頼できない',       false, 2),
('ade23027-0000-0000-0000-000000000000', '遠慮しなくていい親しい',   true,  3),
('ade23027-0000-0000-0000-000000000000', '会う機会が少ない',         false, 4);

-- Q28: WORD_USAGE 改善 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23028-0000-0000-0000-000000000000', '天候が改善して、朝から本格的な雨になった。', false, 1),
('ade23028-0000-0000-0000-000000000000', '彼は成績が改善したため、テストで大きく点数を落とした。', false, 2),
('ade23028-0000-0000-0000-000000000000', 'その俳優は演技が改善して、下手になったと言われた。', false, 3),
('ade23028-0000-0000-0000-000000000000', '新システムの導入により、業務の効率が大きく改善した。', true, 4);

-- Q29: WORD_USAGE 発揮 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23029-0000-0000-0000-000000000000', '彼は本番で実力を十分に発揮し、優勝を果たした。', true, 1),
('ade23029-0000-0000-0000-000000000000', '彼女は風邪の症状を発揮して、学校を休んだ。', false, 2),
('ade23029-0000-0000-0000-000000000000', 'その会社は赤字を発揮して、倒産した。', false, 3),
('ade23029-0000-0000-0000-000000000000', '彼は不満を発揮して、会議室を出て行った。', false, 4);

-- Q30: WORD_USAGE 携わる (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23030-0000-0000-0000-000000000000', '荷物が重すぎて、一人では携わることができなかった。', false, 1),
('ade23030-0000-0000-0000-000000000000', '彼は長年、環境保護活動に携わってきた。', true, 2),
('ade23030-0000-0000-0000-000000000000', '彼女は忙しくて、家事に携わる時間がない。', false, 3),
('ade23030-0000-0000-0000-000000000000', '昨日の試験は思ったより携わって、時間内に終わらなかった。', false, 4);

-- Q31: WORD_USAGE 見落とす (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23031-0000-0000-0000-000000000000', '彼は毎日ジョギングを見落として、体力をつけている。', false, 1),
('ade23031-0000-0000-0000-000000000000', '彼女はいつも人の欠点を見落とし、厳しく指摘する。', false, 2),
('ade23031-0000-0000-0000-000000000000', '忙しさのあまり、重要な書類の誤りを見落としてしまった。', true, 3),
('ade23031-0000-0000-0000-000000000000', '台風の被害状況を見落としたが、迅速に対応チームを派遣した。', false, 4);

-- Q32: WORD_USAGE 見なす (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23032-0000-0000-0000-000000000000', '彼は毎朝、新聞を見なす習慣がある。', false, 1),
('ade23032-0000-0000-0000-000000000000', '彼女は忙しい時、家族の顔を見なすことが少ない。', false, 2),
('ade23032-0000-0000-0000-000000000000', 'その医者は患者の症状を見なして、正確な診断を下した。', false, 3),
('ade23032-0000-0000-0000-000000000000', '会議に無断で欠席した場合、辞退したものと見なします。', true, 4);
