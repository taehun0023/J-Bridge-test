-- JLPT N2 模擬試験 言語知識（文字・語彙） Set 5
-- quiz_id: ad000002-0000-0000-0000-000000000251
-- 32問: KANJI_READING×5, NOTATION×5, WORD_FORMATION×5, CONTEXT_WORD×7, PARAPHRASE×5, WORD_USAGE×5
-- 正答位置分布: 1×8 / 2×8 / 3×8 / 4×8
-- 語彙レベル出典: jisho.org の JLPT タグ(#jlpt-n2 検索結果)で個別に確認。Set1使用語彙との重複なし。
-- WORD_FORMATION の接頭辞語(再・諸・高・総)は各語単体でなく接頭辞パターンとしてN2語形成知識を問う設問(Set1と同方式)。

-- ============================================================
-- quiz_questions (32問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q5, sort 1-5)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25001-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼の説明には明らかな【矛盾】があり、聞いていて納得できなかった。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「矛盾」は「むじゅん」と読む。「つじつまが合わないこと・二つの物事が食い違うこと」を意味するN2重要語彙。「むてい」「ぼうじゅん」「むしゅん」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25002-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

今回の事故は運転手の【過失】によるものだと判明した。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「過失」は「かしつ」と読む。「不注意によるミス・誤り」を意味するN2語彙。「かじつ(果実)」「かせつ(仮説)」は同音に近いが別の単語、「かしゅつ」は誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25003-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は反対する社員がいても、【強引】に計画を進めた。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「強引」は「ごういん」と読む。「反対や無理を押し切って物事を行う様子」を意味するN2語彙。「きょういん(教員)」は同じ漢字を含む別語、「つよびき」「きょうびき」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25004-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

上司は部下に【率直】な意見を求めた。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「率直」は「そっちょく」と読む。「隠さずありのままに述べる様子・素直で飾らないこと」を意味するN2語彙。「そつじき」「りつじき」「りっちょく」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25005-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

この地域は温暖な気候の【恩恵】を受けて農業が盛んだ。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「恩恵」は「おんけい」と読む。「自然や他者から受ける恵み・利益」を意味するN2語彙。「おんめぐみ」「いんけい」「おんえ」はいずれも誤り。');

-- 問題2: NOTATION (Q6-Q10, sort 6-10)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25006-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

会社はセキュリティ対策の【きょうか】に力を入れている。',
 'vocabulary', 'NOTATION', true, 1, 6,
 '「きょうか」は「強化」と書く。「力や機能を強めること」を意味する。「協化」「強科」「協科」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25007-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

会議では意見の【とういつ】を図ることができなかった。',
 'vocabulary', 'NOTATION', true, 1, 7,
 '「とういつ」は「統一」と書く。「ばらばらのものを一つにまとめること」を意味する。「統壱」「当一」「統市」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25008-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

このケーブルでパソコンとプリンターを【せつぞく】する。',
 'vocabulary', 'NOTATION', true, 1, 8,
 '「せつぞく」は「接続」と書く。「物と物、または機器同士をつなぐこと」を意味する。「節続」「接族」「折続」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25009-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この植物は熱帯地域に広く【ぶんぷ】している。',
 'vocabulary', 'NOTATION', true, 1, 9,
 '「ぶんぷ」は「分布」と書く。「ある範囲に散らばって存在すること」を意味する。「文布」「分府」「文府」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25010-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

血液は体内を【じゅんかん】し、酸素や栄養を運んでいる。',
 'vocabulary', 'NOTATION', true, 1, 10,
 '「じゅんかん」は「循環」と書く。「ひとまわりしてもとに戻ることを繰り返すこと」を意味する。「巡環」「循還」「巡還」はいずれも存在しない表記(「巡回(じゅんかい)」は別語で読みも異なる)。');

-- 問題3: WORD_FORMATION (Q11-Q15, sort 11-15)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25011-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

会議の資料は（　）自で用意してください。',
 'vocabulary', 'WORD_FORMATION', true, 1, 11,
 '「各自(かくじ)」が正解。「各」は「それぞれの・一人ひとりの」を表す接頭辞で、「各自」は「めいめい・それぞれ」の意味。「毎自」「諸自」「総自」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25012-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

計画に問題が見つかったため、（　）検討することになった。',
 'vocabulary', 'WORD_FORMATION', true, 1, 12,
 '「再検討(さいけんとう)」が正解。「再」は「もう一度・改めて」を表す接頭辞。「問題が見つかったため、もう一度検討する」という文脈に合う。「高検討」「総検討」「諸検討」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25013-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は（　）事情により、会社を退職することになった。',
 'vocabulary', 'WORD_FORMATION', true, 1, 13,
 '「諸事情(しょじじょう)」が正解。「諸」は「さまざまな・いろいろな」を表す接頭辞で、「諸事情」は「いろいろな事情」を意味する慣用的な表現。「各事情」「再事情」「総事情」はいずれも一般的でない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25014-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

その仕事は（　）収入だが、勤務時間が非常に長い。',
 'vocabulary', 'WORD_FORMATION', true, 1, 14,
 '「高収入(こうしゅうにゅう)」が正解。「高」は「程度が高い・多い」ことを表す接頭辞。「重収入」「深収入」「厚収入」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25015-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この国の（　）人口は年々減少している。',
 'vocabulary', 'WORD_FORMATION', true, 1, 15,
 '「総人口(そうじんこう)」が正解。「総」は「全体をまとめた・すべての」を表す接頭辞。「諸人口」「各人口」「再人口」はいずれも存在しない語。');

-- 問題4: CONTEXT_WORD (Q16-Q22, sort 16-22)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25016-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

商品の欠陥について、多くの客から（　）が寄せられた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 16,
 '「苦情(くじょう)」が正解。「不満や不平を訴えること」を意味する。「商品の欠陥について訴える」という文脈に合う。「賛成」「協力」「感謝」はいずれも肯定的な内容で欠陥への反応として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25017-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

物語は予想外の（　）を見せ、最後まで目が離せなかった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 17,
 '「展開(てんかい)」が正解。「物事の場面や状況が変化して進んでいくこと」を意味する。「予想外の___を見せ、目が離せなかった」という文脈に合う。「結論」「省略」「反省」はいずれも物語の変化を表す語として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25018-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

会議の日程について、関係者と（　）を行った。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 18,
 '「調整(ちょうせい)」が正解。「意見や物事の食い違いを整えてうまく合わせること」を意味する。「日程について関係者と行う」ものとして自然。「制限」「比較」「区別」はいずれも文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25019-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この学校は（　）が厳しいことで知られている。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 19,
 '「規律(きりつ)」が正解。「集団生活を守るための決まり・秩序」を意味する。「___が厳しい学校」という文脈に自然に合う。「自由」「平等」「協調」はいずれも「厳しい」と結びつきにくい。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25020-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

今年度は語学教育に（　）を置いて指導する方針だ。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 20,
 '「重点(じゅうてん)」が正解。「重点を置く」は「特に力を入れる部分を定める」という意味の慣用的な表現。「基準」「制度」「規則」はいずれも「___を置く」の形で使う語として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25021-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

朝の運動は一日を過ごすための（　）を与えてくれる。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 21,
 '「活力(かつりょく)」が正解。「生き生きと活動する力・エネルギー」を意味する。「一日を過ごすための___を与える」という文脈に合う。「義務」「責任」「知識」はいずれも運動が与えるものとして不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25022-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は（　）な気持ちでボランティア活動に取り組んでいる。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 22,
 '「純粋(じゅんすい)」が正解。「混じりけがなく、ありのままである様子」を意味する。ボランティアに取り組む気持ちを表す語として自然。「複雑」「曖昧」「強引」はいずれも文脈に合わない。');

-- 問題5: PARAPHRASE (Q23-Q27, sort 23-27)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25023-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

明日の会議のことを考えると【気が重い】。',
 'vocabulary', 'PARAPHRASE', true, 1, 23,
 '「気が重い」は「心が晴れず、気分が沈んで憂うつになること」を意味する慣用表現。会議を前にした不安な気持ちを表す。「とても楽しみだ」は正反対、「全く興味がない」「早く終わらせたい」は意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25024-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

この資料を全て手作業でまとめるのは【骨が折れる】作業だった。',
 'vocabulary', 'PARAPHRASE', true, 1, 24,
 '「骨が折れる」は「多くの労力や努力を要すること・大変苦労すること」を意味する慣用表現。「非常に苦労する」が正解。「あっという間に終わる」「誰でもできる簡単な」は正反対、「費用がかからない」は無関係。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25025-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

反抗期の息子の態度に【手を焼いて】いる。',
 'vocabulary', 'PARAPHRASE', true, 1, 25,
 '「手を焼く」は「うまく対処できず、扱いに困って苦労すること」を意味する慣用表現。反抗期の息子への対応の難しさを表す。「安心して見守っている」「積極的に応援している」「全く気にしていない」はいずれも意味が合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25026-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

予想以上の赤字に、経営者は【頭を抱えて】いた。',
 'vocabulary', 'PARAPHRASE', true, 1, 26,
 '「頭を抱える」は「どう対処すればよいか分からず、非常に困り悩む様子」を意味する慣用表現。赤字に直面した経営者の困惑を表す。「喜びを隠せないでいた」は正反対、「冷静に対策を練っていた」「全く動揺していなかった」は落ち着いた様子で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25027-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼女はいつも周囲に【気を配って】行動している。',
 'vocabulary', 'PARAPHRASE', true, 1, 27,
 '「気を配る」は「あちこちに注意を向け、細やかに配慮すること」を意味する慣用表現。周囲への思いやりある行動を表す。「無関心でいて」は正反対、「命令を出して」「競争心を持って」は意味が異なる。');

-- 問題6: WORD_USAGE (Q28-Q32, sort 28-32)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25028-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「通用」',
 'vocabulary', 'WORD_USAGE', true, 1, 28,
 '「通用(つうよう)」は「広く一般に認められ、そのまま使える・受け入れられること」を意味する。国内外で認められる資格を説明する文(選択肢2)が正しい用法。「母国語を忘れる」「ルールを隠す」「性能が通用している」はいずれも「通用」の意味と矛盾する内容。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25029-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「発揮」',
 'vocabulary', 'WORD_USAGE', true, 1, 29,
 '「発揮(はっき)」は「持っている能力や力を実際に表し示すこと」を意味する。大会で練習の成果を示す文(選択肢3)が正しい用法。「交通機関が発揮する」「失敗を発揮しない」「内容を発揮しない」はいずれも「発揮」の意味に合わない不自然な使い方。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25030-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「工夫」',
 'vocabulary', 'WORD_USAGE', true, 1, 30,
 '「工夫(くふう)」は「よい方法を考え出そうと知恵を働かせること」を意味する。限られた予算で知恵を絞る文(選択肢1)が正しい用法。「計画の工夫が多すぎる」「仕事の工夫がたまる」「会議が工夫の末延期される」はいずれも「工夫」の意味と結びつかない不自然な使い方。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25031-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「増減」',
 'vocabulary', 'WORD_USAGE', true, 1, 31,
 '「増減(ぞうげん)」は「増えることと減ること」を意味する。季節によって売り上げが変動する文(選択肢2)が正しい用法。「生産量が増減し続け順調に伸びている」は意味が矛盾し、「同じ食事だけで増減する」「病気の症状を増減させる」もいずれも不自然な使い方。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25032-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「普及」',
 'vocabulary', 'WORD_USAGE', true, 1, 32,
 '「普及(ふきゅう)」は「広く行きわたること・世間一般に広まること」を意味する。スマートフォンが世界中に広まった文(選択肢4)が正しい用法。「会議を普及する」「情報を普及しないよう管理」「アイデアを普及する」はいずれも「普及」の意味に合わない不自然な使い方。');

-- ============================================================
-- quiz_question_options (128選択肢: 32問×4択)
-- 正答位置: 1(Q3,Q6,Q11,Q14,Q17,Q22,Q25,Q30) / 2(Q1,Q5,Q10,Q16,Q19,Q24,Q28,Q31)
--           3(Q4,Q8,Q12,Q13,Q20,Q23,Q26,Q29) / 4(Q2,Q7,Q9,Q15,Q18,Q21,Q27,Q32)
-- ============================================================

-- Q1: KANJI_READING 矛盾→むじゅん (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25001-0000-0000-0000-000000000000', 'むてい',   false, 1),
('ade25001-0000-0000-0000-000000000000', 'むじゅん', true,  2),
('ade25001-0000-0000-0000-000000000000', 'ぼうじゅん', false, 3),
('ade25001-0000-0000-0000-000000000000', 'むしゅん', false, 4);

-- Q2: KANJI_READING 過失→かしつ (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25002-0000-0000-0000-000000000000', 'かじつ',   false, 1),
('ade25002-0000-0000-0000-000000000000', 'かせつ',   false, 2),
('ade25002-0000-0000-0000-000000000000', 'かしゅつ', false, 3),
('ade25002-0000-0000-0000-000000000000', 'かしつ',   true,  4);

-- Q3: KANJI_READING 強引→ごういん (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25003-0000-0000-0000-000000000000', 'ごういん', true,  1),
('ade25003-0000-0000-0000-000000000000', 'きょういん', false, 2),
('ade25003-0000-0000-0000-000000000000', 'つよびき', false, 3),
('ade25003-0000-0000-0000-000000000000', 'きょうびき', false, 4);

-- Q4: KANJI_READING 率直→そっちょく (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25004-0000-0000-0000-000000000000', 'そつじき', false, 1),
('ade25004-0000-0000-0000-000000000000', 'りつじき', false, 2),
('ade25004-0000-0000-0000-000000000000', 'そっちょく', true,  3),
('ade25004-0000-0000-0000-000000000000', 'りっちょく', false, 4);

-- Q5: KANJI_READING 恩恵→おんけい (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25005-0000-0000-0000-000000000000', 'おんめぐみ', false, 1),
('ade25005-0000-0000-0000-000000000000', 'おんけい', true,  2),
('ade25005-0000-0000-0000-000000000000', 'いんけい', false, 3),
('ade25005-0000-0000-0000-000000000000', 'おんえ',   false, 4);

-- Q6: NOTATION きょうか→強化 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25006-0000-0000-0000-000000000000', '強化', true,  1),
('ade25006-0000-0000-0000-000000000000', '協化', false, 2),
('ade25006-0000-0000-0000-000000000000', '強科', false, 3),
('ade25006-0000-0000-0000-000000000000', '協科', false, 4);

-- Q7: NOTATION とういつ→統一 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25007-0000-0000-0000-000000000000', '統壱', false, 1),
('ade25007-0000-0000-0000-000000000000', '当一', false, 2),
('ade25007-0000-0000-0000-000000000000', '統市', false, 3),
('ade25007-0000-0000-0000-000000000000', '統一', true,  4);

-- Q8: NOTATION せつぞく→接続 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25008-0000-0000-0000-000000000000', '節続', false, 1),
('ade25008-0000-0000-0000-000000000000', '接族', false, 2),
('ade25008-0000-0000-0000-000000000000', '接続', true,  3),
('ade25008-0000-0000-0000-000000000000', '折続', false, 4);

-- Q9: NOTATION ぶんぷ→分布 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25009-0000-0000-0000-000000000000', '文布', false, 1),
('ade25009-0000-0000-0000-000000000000', '分府', false, 2),
('ade25009-0000-0000-0000-000000000000', '文府', false, 3),
('ade25009-0000-0000-0000-000000000000', '分布', true,  4);

-- Q10: NOTATION じゅんかん→循環 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25010-0000-0000-0000-000000000000', '巡環', false, 1),
('ade25010-0000-0000-0000-000000000000', '循環', true,  2),
('ade25010-0000-0000-0000-000000000000', '循還', false, 3),
('ade25010-0000-0000-0000-000000000000', '巡還', false, 4);

-- Q11: WORD_FORMATION (各)自 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25011-0000-0000-0000-000000000000', '各', true,  1),
('ade25011-0000-0000-0000-000000000000', '毎', false, 2),
('ade25011-0000-0000-0000-000000000000', '諸', false, 3),
('ade25011-0000-0000-0000-000000000000', '総', false, 4);

-- Q12: WORD_FORMATION (再)検討 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25012-0000-0000-0000-000000000000', '高', false, 1),
('ade25012-0000-0000-0000-000000000000', '総', false, 2),
('ade25012-0000-0000-0000-000000000000', '再', true,  3),
('ade25012-0000-0000-0000-000000000000', '諸', false, 4);

-- Q13: WORD_FORMATION (諸)事情 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25013-0000-0000-0000-000000000000', '各', false, 1),
('ade25013-0000-0000-0000-000000000000', '再', false, 2),
('ade25013-0000-0000-0000-000000000000', '諸', true,  3),
('ade25013-0000-0000-0000-000000000000', '総', false, 4);

-- Q14: WORD_FORMATION (高)収入 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25014-0000-0000-0000-000000000000', '高', true,  1),
('ade25014-0000-0000-0000-000000000000', '重', false, 2),
('ade25014-0000-0000-0000-000000000000', '深', false, 3),
('ade25014-0000-0000-0000-000000000000', '厚', false, 4);

-- Q15: WORD_FORMATION (総)人口 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25015-0000-0000-0000-000000000000', '諸', false, 1),
('ade25015-0000-0000-0000-000000000000', '各', false, 2),
('ade25015-0000-0000-0000-000000000000', '再', false, 3),
('ade25015-0000-0000-0000-000000000000', '総', true,  4);

-- Q16: CONTEXT_WORD 苦情 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25016-0000-0000-0000-000000000000', '賛成', false, 1),
('ade25016-0000-0000-0000-000000000000', '苦情', true,  2),
('ade25016-0000-0000-0000-000000000000', '協力', false, 3),
('ade25016-0000-0000-0000-000000000000', '感謝', false, 4);

-- Q17: CONTEXT_WORD 展開 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25017-0000-0000-0000-000000000000', '展開', true,  1),
('ade25017-0000-0000-0000-000000000000', '結論', false, 2),
('ade25017-0000-0000-0000-000000000000', '省略', false, 3),
('ade25017-0000-0000-0000-000000000000', '反省', false, 4);

-- Q18: CONTEXT_WORD 調整 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25018-0000-0000-0000-000000000000', '制限', false, 1),
('ade25018-0000-0000-0000-000000000000', '比較', false, 2),
('ade25018-0000-0000-0000-000000000000', '区別', false, 3),
('ade25018-0000-0000-0000-000000000000', '調整', true,  4);

-- Q19: CONTEXT_WORD 規律 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25019-0000-0000-0000-000000000000', '自由', false, 1),
('ade25019-0000-0000-0000-000000000000', '規律', true,  2),
('ade25019-0000-0000-0000-000000000000', '平等', false, 3),
('ade25019-0000-0000-0000-000000000000', '協調', false, 4);

-- Q20: CONTEXT_WORD 重点 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25020-0000-0000-0000-000000000000', '基準', false, 1),
('ade25020-0000-0000-0000-000000000000', '制度', false, 2),
('ade25020-0000-0000-0000-000000000000', '重点', true,  3),
('ade25020-0000-0000-0000-000000000000', '規則', false, 4);

-- Q21: CONTEXT_WORD 活力 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25021-0000-0000-0000-000000000000', '義務', false, 1),
('ade25021-0000-0000-0000-000000000000', '責任', false, 2),
('ade25021-0000-0000-0000-000000000000', '知識', false, 3),
('ade25021-0000-0000-0000-000000000000', '活力', true,  4);

-- Q22: CONTEXT_WORD 純粋 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25022-0000-0000-0000-000000000000', '純粋', true,  1),
('ade25022-0000-0000-0000-000000000000', '複雑', false, 2),
('ade25022-0000-0000-0000-000000000000', '曖昧', false, 3),
('ade25022-0000-0000-0000-000000000000', '強引', false, 4);

-- Q23: PARAPHRASE 気が重い (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25023-0000-0000-0000-000000000000', 'とても楽しみだ',       false, 1),
('ade25023-0000-0000-0000-000000000000', '全く興味がない',       false, 2),
('ade25023-0000-0000-0000-000000000000', '気持ちが晴れず憂うつだ', true, 3),
('ade25023-0000-0000-0000-000000000000', '早く終わらせたい',     false, 4);

-- Q24: PARAPHRASE 骨が折れる (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25024-0000-0000-0000-000000000000', 'あっという間に終わる', false, 1),
('ade25024-0000-0000-0000-000000000000', '非常に苦労する',       true,  2),
('ade25024-0000-0000-0000-000000000000', '誰でもできる簡単な',   false, 3),
('ade25024-0000-0000-0000-000000000000', '費用がかからない',     false, 4);

-- Q25: PARAPHRASE 手を焼く (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25025-0000-0000-0000-000000000000', '対応に困り苦労している', true,  1),
('ade25025-0000-0000-0000-000000000000', '安心して見守っている',   false, 2),
('ade25025-0000-0000-0000-000000000000', '積極的に応援している',   false, 3),
('ade25025-0000-0000-0000-000000000000', '全く気にしていない',     false, 4);

-- Q26: PARAPHRASE 頭を抱える (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25026-0000-0000-0000-000000000000', '喜びを隠せないでいた',           false, 1),
('ade25026-0000-0000-0000-000000000000', '冷静に対策を練っていた',         false, 2),
('ade25026-0000-0000-0000-000000000000', 'どうしたらよいか分からず困り果てていた', true, 3),
('ade25026-0000-0000-0000-000000000000', '全く動揺していなかった',         false, 4);

-- Q27: PARAPHRASE 気を配る (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25027-0000-0000-0000-000000000000', '無関心でいて',       false, 1),
('ade25027-0000-0000-0000-000000000000', '命令を出して',       false, 2),
('ade25027-0000-0000-0000-000000000000', '競争心を持って',     false, 3),
('ade25027-0000-0000-0000-000000000000', '細やかに注意を払って', true, 4);

-- Q28: WORD_USAGE 通用 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25028-0000-0000-0000-000000000000', '彼は海外でも通用するために、母国語を忘れることにした。', false, 1),
('ade25028-0000-0000-0000-000000000000', 'その資格は国内だけでなく海外でも通用する高い水準のものだ。', true, 2),
('ade25028-0000-0000-0000-000000000000', '彼女は新しいルールが通用しないよう、周囲に隠し続けた。', false, 3),
('ade25028-0000-0000-0000-000000000000', '古い機械は性能が通用しているため、廃棄されることになった。', false, 4);

-- Q29: WORD_USAGE 発揮 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25029-0000-0000-0000-000000000000', '台風の影響で交通機関が発揮し、多くの便が欠航した。', false, 1),
('ade25029-0000-0000-0000-000000000000', '彼は失敗を発揮しないよう、慎重に準備を進めた。', false, 2),
('ade25029-0000-0000-0000-000000000000', '彼女は大会で日頃の練習の成果を存分に発揮した。', true, 3),
('ade25029-0000-0000-0000-000000000000', '会議の内容は関係者以外に発揮しないことになっている。', false, 4);

-- Q30: WORD_USAGE 工夫 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25030-0000-0000-0000-000000000000', '彼女は限られた予算で最大の効果を出すため、様々な工夫を凝らした。', true, 1),
('ade25030-0000-0000-0000-000000000000', 'その計画は工夫が多すぎて、実行に移すのが難しくなった。', false, 2),
('ade25030-0000-0000-0000-000000000000', '彼は仕事の工夫がたまり、休暇を取ることにした。', false, 3),
('ade25030-0000-0000-0000-000000000000', '会議は工夫の末、来週に延期されることになった。', false, 4);

-- Q31: WORD_USAGE 増減 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25031-0000-0000-0000-000000000000', '工場の生産量は先月から増減し続け、順調に伸びている。', false, 1),
('ade25031-0000-0000-0000-000000000000', '毎月の売り上げは季節によって増減するため、予測が難しい。', true, 2),
('ade25031-0000-0000-0000-000000000000', '彼は体重の増減のため、毎日全く同じ食事だけをとっている。', false, 3),
('ade25031-0000-0000-0000-000000000000', 'その薬は病気の症状を増減させるために開発された。', false, 4);

-- Q32: WORD_USAGE 普及 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25032-0000-0000-0000-000000000000', '彼は体調不良のため、会議を普及することになった。', false, 1),
('ade25032-0000-0000-0000-000000000000', 'その情報は関係者以外に普及しないよう厳重に管理されている。', false, 2),
('ade25032-0000-0000-0000-000000000000', '彼女は新製品のアイデアを普及し、社内で高く評価された。', false, 3),
('ade25032-0000-0000-0000-000000000000', 'スマートフォンは十年ほどの間に世界中の家庭に急速に普及した。', true, 4);
