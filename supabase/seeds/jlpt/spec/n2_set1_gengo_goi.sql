-- JLPT N2 模擬試験 言語知識（文字・語彙） Set 1
-- quiz_id: ad000002-0000-0000-0000-000000000211
-- 32問: KANJI_READING×5, NOTATION×5, WORD_FORMATION×5, CONTEXT_WORD×7, PARAPHRASE×5, WORD_USAGE×5
-- 正答位置分布: 1×8 / 2×8 / 3×8 / 4×8

-- ============================================================
-- quiz_questions (32問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q5, sort 1-5)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21001-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

先生に【忠告】されても、彼は自分の行動を改めなかった。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「忠告」は「ちゅうこく」と読む。「誠意を持って相手のためを思い注意すること」を意味するN2重要語彙。「じゅうこく」「ちょうこく(彫刻)」「ちゅうごく(中国)」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21002-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

夜桜祭りの会場は【華やか】な飾りで彩られていた。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「華やか」は「はなやか」と読む。「明るく美しく豪華な様子」を意味する。「さわやか(爽やか)」「あざやか(鮮やか)」「にぎやか(賑やか)」はいずれも別の単語で読みが異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21003-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

そのアーティストは国内外で【絶大】な支持を集めている。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「絶大」は「ぜつだい」と読む。「非常に大きくはかりしれないほどの」意を表すN2語彙。「ぜったい(絶対)」「きょだい(巨大)」「こうだい(広大)」はいずれも別の単語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21004-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

改正された法律は来月から【施行】される予定だ。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「施行」は法律・規則の文脈では「しこう」と読む。「法律を実際に実施・適用すること」を意味する。工事の文脈では「せこう」とも読むが、法律文脈では「しこう」が正しい。「しきょう」「しさく(試作)」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21005-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

緊急事態のため、問題を【迅速】に処理する必要があった。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「迅速」は「じんそく」と読む。「非常に速いこと・素早いこと」を意味するN2重要語彙。「しんそく」「きんそく(禁足)」「じんじゅん」はすべて誤り。');

-- 問題2: NOTATION (Q6-Q10, sort 6-10)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21006-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この地域では古くから【でんとう】的な祭りが行われている。',
 'vocabulary', 'NOTATION', true, 1, 6,
 '「でんとう」は「伝統」と書く。「昔から受け継がれてきた風習・様式・考え方」を意味する。「電統」「電道」は存在しない表記。「伝道」は「でんどう」と読み宗教的な布教を指す別語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21007-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

彼女は毎日【えいよう】のバランスを考えた食事をしている。',
 'vocabulary', 'NOTATION', true, 1, 7,
 '「えいよう」は「栄養」と書く。「生物が生命を維持するために外から取り入れる物質」を意味する。「営養」「栄用」「営用」はいずれも正しくない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21008-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

プロジェクトの【かんりょう】をチーム全員で祝った。',
 'vocabulary', 'NOTATION', true, 1, 8,
 '「かんりょう」は「完了」と書く。「物事がすっかり終わること」を意味する。「感了」「感僚」「完僚」はいずれも存在しない表記。なお「官僚(かんりょう)」は別語で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21009-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

彼は【しんせつ】な言葉で困っている人を助けた。',
 'vocabulary', 'NOTATION', true, 1, 9,
 '「しんせつ」は「親切」と書く。「思いやりを持って人の役に立とうとすること」を意味する。「親折」「新切」「新折」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21010-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この小説は世界中で【ほんやく】されている。',
 'vocabulary', 'NOTATION', true, 1, 10,
 '「ほんやく」は「翻訳」と書く。「ある言語で書かれた文章を別の言語に直すこと」を意味する。「翻沢」「翻釈」「翻択」はいずれも存在しない表記。');

-- 問題3: WORD_FORMATION (Q11-Q15, sort 11-15)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21011-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この薬は（　）作用が少なく、長期服用しても安全だと言われている。',
 'vocabulary', 'WORD_FORMATION', true, 1, 11,
 '「副作用(ふくさよう)」が正解。「副」は「主なものに付随する」意味の接頭辞で、「副作用」は「薬などの主目的以外に現れる好ましくない効果」を指す。「反作用」は物理用語、「逆作用」「対作用」は一般的な語でない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21012-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女の発言は（　）常識的で、周囲を困惑させることが多かった。',
 'vocabulary', 'WORD_FORMATION', true, 1, 12,
 '「非常識(的)(ひじょうしきてき)」が正解。「非」は「そうでないこと」を表す接頭辞。「非常識」＝常識がないこと。「不常識」は日本語として一般的でない。「超常識」「無常識」も標準的な語でない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21013-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この店は地元で有（　）で、週末は行列ができるほどだ。',
 'vocabulary', 'WORD_FORMATION', true, 1, 13,
 '「有名(ゆうめい)」が正解。「有名」＝広く世間に名前が知られていること。「有利(ゆうり)」「有効(ゆうこう)」「有益(ゆうえき)」もいずれも「有＋漢字」の複合語だが、「地元で有___で、行列ができる」という文脈では「有名」のみ自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21014-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新しいプロジェクトのリーダーに（　）命された。',
 'vocabulary', 'WORD_FORMATION', true, 1, 14,
 '「任命(にんめい)」が正解。「任命」＝特定の職務や役割に人を命じること。「採命」「就命」「指命」はいずれも日本語として一般的でない語。「採用」「就任」「指定」などとの混同に注意。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21015-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は今年春、念願の大学を（　）業した。',
 'vocabulary', 'WORD_FORMATION', true, 1, 15,
 '「卒業(そつぎょう)」が正解。「大学を___業した」という文脈では「卒業」のみ自然。「修業(しゅうぎょう)」は修行・技術習得の意、「廃業(はいぎょう)」は事業をやめること、「終業(しゅうぎょう)」はその日の業務・授業が終わることで文脈に合わない。');

-- 問題4: CONTEXT_WORD (Q16-Q22, sort 16-22)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21016-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

大雨の影響で電車が（　）となり、多くの乗客が立往生した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 16,
 '「運休(うんきゅう)」が正解。「運休」＝電車・バスなどが運行を休止すること。「立往生した」という結果から電車が止まったことが分かる。「通過」「徐行」は動いていることを示し、「回送」は乗客を乗せずに走ることで文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21017-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

発表の前に十分な（　）をしたおかげで、本番はうまくいった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 17,
 '「練習(れんしゅう)」が正解。「十分な___をしたおかげで本番がうまくいった」という文脈から、本番前に繰り返し行う「練習」が最適。「調査」は情報を集めること、「記録」は書き留めること、「確認」はチェックすることで意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21018-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

予算が（　）したため、計画を大幅に見直すことになった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 18,
 '「不足(ふそく)」が正解。「予算が不足した」＝予算が足りなくなったということで「計画を見直す」原因として自然。「増加」は増えること、「節約」は使う量を減らすこと、「余裕」は十分にあることで文脈と矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21019-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は交渉の（　）が高く、難しい場面でも冷静に対応できる。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 19,
 '「能力(のうりょく)」が正解。「交渉の能力が高い」＝交渉において優れた力を持つという意味で自然な表現。「負担」は苦労・重さ、「興味」「関心」はどちらも好奇心を指す語で、「___が高い」という形で交渉のうまさを表せない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21020-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

部長は部下の意見を（　）に聞き、いつも誠実に答えた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 20,
 '「真剣(しんけん)」が正解。「真剣に聞く」＝まじめに、本気で聞く様子。「いつも誠実に答えた」という後半とも自然につながる。「適当」「無関心」「否定的」はいずれも誠実なリーダーの行動として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21021-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

その映画は若者だけでなく、年配の方にも（　）を呼ぶ内容だった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 21,
 '「共感(きょうかん)」が正解。「共感を呼ぶ」は「多くの人が同じ気持ちになる」という意味の慣用表現。若者から年配まで幅広い層に訴える映画の描写として自然。「反発」「批判」「不満」はいずれも否定的な感情で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21022-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

問題が（　）段階で発見されたため、大きな損害を防ぐことができた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 22,
 '「早期(そうき)」が正解。「早期段階で発見」＝初期の段階で見つかったということで、大きな損害を防げた理由として自然。「困難」は状況の複雑さ、「後期」は時期が遅い、「複雑」は発見のタイミングを表す語として不適切。');

-- 問題5: PARAPHRASE (Q23-Q27, sort 23-27)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21023-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

その仕事は私の【手に負えない】ほど複雑だった。',
 'vocabulary', 'PARAPHRASE', true, 1, 23,
 '「手に負えない」は「自分の力や能力では対処・制御できない」という意味の慣用表現。「複雑だった」という後半とも整合する。「簡単にこなせる」は正反対、「時間がかかりすぎる」は難しさの質が異なる、「誰かに頼む必要がない」は自力でできることを示す。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21024-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

祖父は目を【細めて】孫の成長を見守った。',
 'vocabulary', 'PARAPHRASE', true, 1, 24,
 '「目を細める」は「目を細くして嬉しそうに微笑む様子」を表す慣用表現。かわいい孫を見る祖父の表情として自然。「心配そうに」「驚いた様子で」「悲しそうに」はいずれも「目を細める」の意味に合わない感情表現。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21025-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

新しい事業がようやく【軌道に乗った】。',
 'vocabulary', 'PARAPHRASE', true, 1, 25,
 '「軌道に乗る」は「物事が安定して順調に進むようになること」を意味する慣用表現。「ようやく」という副詞が「苦労してやっと安定した」ニュアンスを添えている。「問題が生じた」「大幅に見直された」「中断された」はすべて逆の意味または無関係な内容。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21026-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼は【念のために】もう一度書類を確認した。',
 'vocabulary', 'PARAPHRASE', true, 1, 26,
 '「念のために」は「確かめるため・用心のため・万が一のために」という意味の表現。「もう一度確認した」という行動の理由として自然。「急いでいたので」「習慣として」「時間を節約するために」はいずれも「念のために」の意味に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21027-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

その提案は【的外れ】だと批判された。',
 'vocabulary', 'PARAPHRASE', true, 1, 27,
 '「的外れ」は「目的・要点・本題からずれていること・見当違いであること」を意味する。「批判された」という結果とも整合する。「非常に優れた内容だ」は正反対、「細かすぎる」は詳細さの問題、「理解しにくい」は難易度の問題で意味が異なる。');

-- 問題6: WORD_USAGE (Q28-Q32, sort 28-32)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21028-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「節約」',
 'vocabulary', 'WORD_USAGE', true, 1, 28,
 '「節約(せつやく)」は「無駄を省いて費用・時間・労力などを少なくすること」を意味する。電気代を節約するために照明を消すという文脈(選択肢4)が正しい用法。「時間節約のため残業」「健康を節約」「友情を節約」はいずれも不自然な用法。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21029-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「遠慮」',
 'vocabulary', 'WORD_USAGE', true, 1, 29,
 '「遠慮(えんりょ)」は「他人に対して心を遣い、言動を控えること」を意味する。初めて訪問した家でのふるまいを控える(選択肢1)が典型的な用法。「遠慮して→積極的に主張」「遠慮して→大声で自慢話」「遠慮するよう言われ→積極的に手を挙げた」はすべて意味が矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21030-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「促進」',
 'vocabulary', 'WORD_USAGE', true, 1, 30,
 '「促進(そくしん)」は「物事が早く進むように働きかけること」を意味する。政府が経済成長を促進するために投資を奨励する(選択肢2)が正しい用法。「運動をやめて健康を促進」「節電のため家電使用を促進」「環境保護のため工場生産を促進」はいずれも内容が矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21031-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「維持」',
 'vocabulary', 'WORD_USAGE', true, 1, 31,
 '「維持(いじ)」は「ある状態をそのまま保ち続けること」を意味する。健康を維持するために運動を続ける(選択肢3)が正しい用法。「体重維持のため好きなだけ食べる」「友人関係維持のため連絡を断つ」「機械の性能維持のため修理しない」はいずれも矛盾した内容。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade21032-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「提案」',
 'vocabulary', 'WORD_USAGE', true, 1, 32,
 '「提案(ていあん)」は「会議や相談の場で自分の考えや計画を出すこと」を意味する。会議で新しいマーケティング戦略を提案し採用された(選択肢4)が正しい用法。「法律の問題点が提案された(→指摘)」「失敗原因を提案した(→報告/分析)」「試験問題が提案された(→出題)」はいずれも不適切。');

-- ============================================================
-- quiz_question_options (128選択肢: 32問×4択)
-- 正答位置: 1(Q1,Q5,Q9,Q13,Q17,Q21,Q25,Q29) / 2(Q2,Q6,Q10,Q14,Q18,Q22,Q26,Q30)
--           3(Q3,Q7,Q11,Q15,Q19,Q23,Q27,Q31) / 4(Q4,Q8,Q12,Q16,Q20,Q24,Q28,Q32)
-- ============================================================

-- Q1: KANJI_READING 忠告→ちゅうこく (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21001-0000-0000-0000-000000000000', 'ちゅうこく', true,  1),
('ade21001-0000-0000-0000-000000000000', 'じゅうこく', false, 2),
('ade21001-0000-0000-0000-000000000000', 'ちょうこく', false, 3),
('ade21001-0000-0000-0000-000000000000', 'ちゅうごく', false, 4);

-- Q2: KANJI_READING 華やか→はなやか (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21002-0000-0000-0000-000000000000', 'さわやか', false, 1),
('ade21002-0000-0000-0000-000000000000', 'はなやか', true,  2),
('ade21002-0000-0000-0000-000000000000', 'あざやか', false, 3),
('ade21002-0000-0000-0000-000000000000', 'にぎやか', false, 4);

-- Q3: KANJI_READING 絶大→ぜつだい (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21003-0000-0000-0000-000000000000', 'ぜったい', false, 1),
('ade21003-0000-0000-0000-000000000000', 'きょだい', false, 2),
('ade21003-0000-0000-0000-000000000000', 'ぜつだい', true,  3),
('ade21003-0000-0000-0000-000000000000', 'こうだい', false, 4);

-- Q4: KANJI_READING 施行→しこう (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21004-0000-0000-0000-000000000000', 'せこう',   false, 1),
('ade21004-0000-0000-0000-000000000000', 'しきょう', false, 2),
('ade21004-0000-0000-0000-000000000000', 'しさく',   false, 3),
('ade21004-0000-0000-0000-000000000000', 'しこう',   true,  4);

-- Q5: KANJI_READING 迅速→じんそく (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21005-0000-0000-0000-000000000000', 'じんそく', true,  1),
('ade21005-0000-0000-0000-000000000000', 'しんそく', false, 2),
('ade21005-0000-0000-0000-000000000000', 'きんそく', false, 3),
('ade21005-0000-0000-0000-000000000000', 'じんじゅん', false, 4);

-- Q6: NOTATION でんとう→伝統 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21006-0000-0000-0000-000000000000', '電統', false, 1),
('ade21006-0000-0000-0000-000000000000', '伝統', true,  2),
('ade21006-0000-0000-0000-000000000000', '電道', false, 3),
('ade21006-0000-0000-0000-000000000000', '伝道', false, 4);

-- Q7: NOTATION えいよう→栄養 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21007-0000-0000-0000-000000000000', '営養', false, 1),
('ade21007-0000-0000-0000-000000000000', '営用', false, 2),
('ade21007-0000-0000-0000-000000000000', '栄養', true,  3),
('ade21007-0000-0000-0000-000000000000', '栄用', false, 4);

-- Q8: NOTATION かんりょう→完了 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21008-0000-0000-0000-000000000000', '感了', false, 1),
('ade21008-0000-0000-0000-000000000000', '感僚', false, 2),
('ade21008-0000-0000-0000-000000000000', '完僚', false, 3),
('ade21008-0000-0000-0000-000000000000', '完了', true,  4);

-- Q9: NOTATION しんせつ→親切 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21009-0000-0000-0000-000000000000', '親切', true,  1),
('ade21009-0000-0000-0000-000000000000', '新切', false, 2),
('ade21009-0000-0000-0000-000000000000', '親折', false, 3),
('ade21009-0000-0000-0000-000000000000', '新折', false, 4);

-- Q10: NOTATION ほんやく→翻訳 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21010-0000-0000-0000-000000000000', '翻沢', false, 1),
('ade21010-0000-0000-0000-000000000000', '翻訳', true,  2),
('ade21010-0000-0000-0000-000000000000', '翻釈', false, 3),
('ade21010-0000-0000-0000-000000000000', '翻択', false, 4);

-- Q11: WORD_FORMATION 副(作用) (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21011-0000-0000-0000-000000000000', '反', false, 1),
('ade21011-0000-0000-0000-000000000000', '逆', false, 2),
('ade21011-0000-0000-0000-000000000000', '副', true,  3),
('ade21011-0000-0000-0000-000000000000', '対', false, 4);

-- Q12: WORD_FORMATION (非)常識 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21012-0000-0000-0000-000000000000', '超', false, 1),
('ade21012-0000-0000-0000-000000000000', '不', false, 2),
('ade21012-0000-0000-0000-000000000000', '無', false, 3),
('ade21012-0000-0000-0000-000000000000', '非', true,  4);

-- Q13: WORD_FORMATION 有(名) (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21013-0000-0000-0000-000000000000', '名', true,  1),
('ade21013-0000-0000-0000-000000000000', '利', false, 2),
('ade21013-0000-0000-0000-000000000000', '効', false, 3),
('ade21013-0000-0000-0000-000000000000', '益', false, 4);

-- Q14: WORD_FORMATION (任)命 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21014-0000-0000-0000-000000000000', '採', false, 1),
('ade21014-0000-0000-0000-000000000000', '任', true,  2),
('ade21014-0000-0000-0000-000000000000', '就', false, 3),
('ade21014-0000-0000-0000-000000000000', '指', false, 4);

-- Q15: WORD_FORMATION (卒)業 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21015-0000-0000-0000-000000000000', '修', false, 1),
('ade21015-0000-0000-0000-000000000000', '廃', false, 2),
('ade21015-0000-0000-0000-000000000000', '卒', true,  3),
('ade21015-0000-0000-0000-000000000000', '終', false, 4);

-- Q16: CONTEXT_WORD 運休 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21016-0000-0000-0000-000000000000', '通過', false, 1),
('ade21016-0000-0000-0000-000000000000', '徐行', false, 2),
('ade21016-0000-0000-0000-000000000000', '回送', false, 3),
('ade21016-0000-0000-0000-000000000000', '運休', true,  4);

-- Q17: CONTEXT_WORD 練習 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21017-0000-0000-0000-000000000000', '練習', true,  1),
('ade21017-0000-0000-0000-000000000000', '調査', false, 2),
('ade21017-0000-0000-0000-000000000000', '記録', false, 3),
('ade21017-0000-0000-0000-000000000000', '確認', false, 4);

-- Q18: CONTEXT_WORD 不足 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21018-0000-0000-0000-000000000000', '増加', false, 1),
('ade21018-0000-0000-0000-000000000000', '不足', true,  2),
('ade21018-0000-0000-0000-000000000000', '節約', false, 3),
('ade21018-0000-0000-0000-000000000000', '余裕', false, 4);

-- Q19: CONTEXT_WORD 能力 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21019-0000-0000-0000-000000000000', '負担', false, 1),
('ade21019-0000-0000-0000-000000000000', '興味', false, 2),
('ade21019-0000-0000-0000-000000000000', '能力', true,  3),
('ade21019-0000-0000-0000-000000000000', '関心', false, 4);

-- Q20: CONTEXT_WORD 真剣 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21020-0000-0000-0000-000000000000', '適当',   false, 1),
('ade21020-0000-0000-0000-000000000000', '無関心', false, 2),
('ade21020-0000-0000-0000-000000000000', '否定的', false, 3),
('ade21020-0000-0000-0000-000000000000', '真剣',   true,  4);

-- Q21: CONTEXT_WORD 共感 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21021-0000-0000-0000-000000000000', '共感', true,  1),
('ade21021-0000-0000-0000-000000000000', '反発', false, 2),
('ade21021-0000-0000-0000-000000000000', '批判', false, 3),
('ade21021-0000-0000-0000-000000000000', '不満', false, 4);

-- Q22: CONTEXT_WORD 早期 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21022-0000-0000-0000-000000000000', '困難', false, 1),
('ade21022-0000-0000-0000-000000000000', '早期', true,  2),
('ade21022-0000-0000-0000-000000000000', '後期', false, 3),
('ade21022-0000-0000-0000-000000000000', '複雑', false, 4);

-- Q23: PARAPHRASE 手に負えない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21023-0000-0000-0000-000000000000', '簡単にこなせる',       false, 1),
('ade21023-0000-0000-0000-000000000000', '時間がかかりすぎる',   false, 2),
('ade21023-0000-0000-0000-000000000000', '自分の力では対処できない', true, 3),
('ade21023-0000-0000-0000-000000000000', '誰かに頼む必要がない', false, 4);

-- Q24: PARAPHRASE 目を細める (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21024-0000-0000-0000-000000000000', '心配そうに',     false, 1),
('ade21024-0000-0000-0000-000000000000', '驚いた様子で',   false, 2),
('ade21024-0000-0000-0000-000000000000', '悲しそうに',     false, 3),
('ade21024-0000-0000-0000-000000000000', '嬉しそうに',     true,  4);

-- Q25: PARAPHRASE 軌道に乗る (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21025-0000-0000-0000-000000000000', '順調に進むようになった', true,  1),
('ade21025-0000-0000-0000-000000000000', '問題が生じた',           false, 2),
('ade21025-0000-0000-0000-000000000000', '大幅に見直された',       false, 3),
('ade21025-0000-0000-0000-000000000000', '中断された',             false, 4);

-- Q26: PARAPHRASE 念のために (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21026-0000-0000-0000-000000000000', '急いでいたので',         false, 1),
('ade21026-0000-0000-0000-000000000000', '確かめるために',         true,  2),
('ade21026-0000-0000-0000-000000000000', '習慣として',             false, 3),
('ade21026-0000-0000-0000-000000000000', '時間を節約するために',   false, 4);

-- Q27: PARAPHRASE 的外れ (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21027-0000-0000-0000-000000000000', '非常に優れた内容だ',     false, 1),
('ade21027-0000-0000-0000-000000000000', '細かすぎる',             false, 2),
('ade21027-0000-0000-0000-000000000000', '要点や目的とずれている', true,  3),
('ade21027-0000-0000-0000-000000000000', '理解しにくい',           false, 4);

-- Q28: WORD_USAGE 節約 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21028-0000-0000-0000-000000000000', '彼は時間を節約するために、毎日長時間残業した。', false, 1),
('ade21028-0000-0000-0000-000000000000', '健康を節約するため、早寝早起きをしている。', false, 2),
('ade21028-0000-0000-0000-000000000000', '彼女は友情を節約しようと、人付き合いを積極的にした。', false, 3),
('ade21028-0000-0000-0000-000000000000', '電気代を節約するために、使わない照明は必ず消している。', true, 4);

-- Q29: WORD_USAGE 遠慮 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21029-0000-0000-0000-000000000000', '初めて訪問した家では、遠慮してあまり食べなかった。', true, 1),
('ade21029-0000-0000-0000-000000000000', '彼女は遠慮して、自分の意見をどんどん主張した。', false, 2),
('ade21029-0000-0000-0000-000000000000', '彼は遠慮して、人前で大声で自慢話をした。', false, 3),
('ade21029-0000-0000-0000-000000000000', '先生から遠慮するよう言われたので、積極的に手を挙げた。', false, 4);

-- Q30: WORD_USAGE 促進 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21030-0000-0000-0000-000000000000', '彼は運動をやめることで健康を促進した。', false, 1),
('ade21030-0000-0000-0000-000000000000', '政府は経済成長を促進するため、企業への投資を奨励した。', true, 2),
('ade21030-0000-0000-0000-000000000000', '節電のため、家電の使用を促進することにした。', false, 3),
('ade21030-0000-0000-0000-000000000000', '環境保護のために、工場の生産を促進するよう求めた。', false, 4);

-- Q31: WORD_USAGE 維持 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21031-0000-0000-0000-000000000000', '体重を維持するため、毎日好きなだけ食べることにした。', false, 1),
('ade21031-0000-0000-0000-000000000000', '友人関係を維持するために、連絡を全て断った。', false, 2),
('ade21031-0000-0000-0000-000000000000', '健康を維持するために、毎日適度な運動を続けている。', true, 3),
('ade21031-0000-0000-0000-000000000000', '機械の性能を維持するため、修理を一切しないことにした。', false, 4);

-- Q32: WORD_USAGE 提案 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade21032-0000-0000-0000-000000000000', 'その法律の問題点が会議で提案された。', false, 1),
('ade21032-0000-0000-0000-000000000000', '彼は失敗した原因を詳しく提案した。', false, 2),
('ade21032-0000-0000-0000-000000000000', '試験に出た問題が先生に提案されたので、生徒は喜んだ。', false, 3),
('ade21032-0000-0000-0000-000000000000', '彼は新しいマーケティング戦略を会議で提案し、採用された。', true, 4);
