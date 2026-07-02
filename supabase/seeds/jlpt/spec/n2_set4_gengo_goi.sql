-- JLPT N2 模擬試験 言語知識（文字・語彙） Set 4
-- quiz_id: ad000002-0000-0000-0000-000000000241
-- 32問: KANJI_READING×5, NOTATION×5, WORD_FORMATION×5, CONTEXT_WORD×7, PARAPHRASE×5, WORD_USAGE×5
-- 正答位置分布: 1×8 / 2×8 / 3×8 / 4×8

-- ============================================================
-- quiz_questions (32問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q5, sort 1-5)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24001-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は上司の指示に強く【抵抗】した。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「抵抗」は「ていこう」と読む。「他からの力や命令に逆らうこと」を意味するN2重要語彙。「たいこう(対抗)」「ていこ」「こうてい」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24002-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は状況を正確に【把握】してから行動した。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「把握」は「はあく」と読む。「物事の内容や状況を正しく理解すること」を意味するN2重要語彙。「はんあく」「はいあく」「はわく」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24003-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

両者は長い交渉の末、ようやく【妥協】に達した。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「妥協」は「だきょう」と読む。「対立する意見の間で互いに譲り合い、折り合いをつけること」を意味する。「だっきょう」「たきょう」「だいきょう」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24004-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼女は大会で日頃の実力を存分に【発揮】した。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「発揮」は「はっき」と読む。「持っている能力や特性を実際に表すこと」を意味するN2重要語彙。「はつき」「はっぎ」「ほっき(発起)」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24005-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼はその提案を明確に【拒否】した。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「拒否」は「きょひ」と読む。「相手の要求や提案を断ること」を意味するN2重要語彙。「こひ」「きょふ」「きょうひ」はいずれも誤り。');

-- 問題2: NOTATION (Q6-Q10, sort 6-10)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24006-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

一人で全ての作業を抱え込むのは【ふたん】が大きい。',
 'vocabulary', 'NOTATION', true, 1, 6,
 '「ふたん」は「負担」と書く。「義務・仕事・費用などを引き受けること、また精神的・肉体的な重荷」を意味する。「富担」「附担」「負胆」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24007-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

彼の研究は医療の発展に大きく【こうけん】した。',
 'vocabulary', 'NOTATION', true, 1, 7,
 '「こうけん」は「貢献」と書く。「ある物事や社会のために役立つよう力を尽くすこと」を意味する。「功献」「貢験」「功験」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24008-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

新しいシステムの導入で作業の【こうりつ】が大幅に上がった。',
 'vocabulary', 'NOTATION', true, 1, 8,
 '「こうりつ」は「効率」と書く。「使った労力に対して得られる成果の割合」を意味する。「好率」「交率」「功率」はいずれも存在しない、または一般的でない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24009-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

この方法なら【かくじつ】に成果が出るだろう。',
 'vocabulary', 'NOTATION', true, 1, 9,
 '「かくじつ」は「確実」と書く。「間違いがなく、はっきりしていること」を意味する。「各実」「確突」「拡実」はいずれも存在しない表記。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24010-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部のことばを漢字で書くとき、最もよいものを１・２・３・４から一つ選びなさい。

引っ越してから毎日が【じゅうじつ】している。',
 'vocabulary', 'NOTATION', true, 1, 10,
 '「じゅうじつ」は「充実」と書く。「内容や気持ちが満ち足りていること」を意味する。「重実」「中実」「従実」はいずれも存在しない表記。');

-- 問題3: WORD_FORMATION (Q11-Q15, sort 11-15)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24011-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

台風接近のため、イベントは来月に（　）期されることになった。',
 'vocabulary', 'WORD_FORMATION', true, 1, 11,
 '「延期(えんき)」が正解。「延期」＝予定していた日時を先に延ばすこと。台風で予定変更という文脈に合う。「早期」「前期」「後期」はいずれも実在する語だが「予定を先に延ばす」の意味にはならない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24012-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼のプレゼンは説得（　）があり、聞く人を納得させた。',
 'vocabulary', 'WORD_FORMATION', true, 1, 12,
 '「説得力(せっとくりょく)」が正解。「説得力」＝相手を納得させる力。「説得性」「説得感」「説得化」はいずれも日本語として一般的でない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24013-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

初めての面接で強い緊張（　）を覚えた。',
 'vocabulary', 'WORD_FORMATION', true, 1, 13,
 '「緊張感(きんちょうかん)」が正解。「緊張感」＝張りつめた気持ちを感じること。「緊張性」「緊張力」「緊張化」はいずれも一般的な語ではない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24014-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

上司の指示を正確に部下に（　）達することが求められる。',
 'vocabulary', 'WORD_FORMATION', true, 1, 14,
 '「伝達(でんたつ)」が正解。「伝達」＝情報や意思を相手に伝え届けること。「報達」「知達」「届達」はいずれも存在しない語。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24015-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は大学を卒業後、大手メーカーに（　）職した。',
 'vocabulary', 'WORD_FORMATION', true, 1, 15,
 '「就職(しゅうしょく)」が正解。「就職」＝仕事に就くこと。「求職」は仕事を探すこと、「採職」「雇職」はいずれも存在しない語で、文脈の「大手メーカーに___した」には合わない。');

-- 問題4: CONTEXT_WORD (Q16-Q22, sort 16-22)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24016-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

大型台風の接近により、市は住民に避難の（　）を出した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 16,
 '「勧告(かんこく)」が正解。「避難勧告」＝行政が住民に避難を勧める公式な呼びかけ。「命令」は強制力を伴う指示、「報告」は結果を伝えること、「相談」は話し合うことで、いずれも「避難の___を出す」という定型表現に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24017-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は新しい職場の環境に徐々に（　）していった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 17,
 '「適応(てきおう)」が正解。「適応する」＝新しい環境や条件に合わせて自分を変化させること。「適用」は規則などを当てはめること、「対応」は物事に応じて処置すること、「反応」は刺激に対する反射的な動きで、いずれも文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24018-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼の説明は具体性に（　）しており、聞き手を混乱させた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 18,
 '「欠如(けつじょ)」が正解。「欠如する」＝あるべきものが欠けていること。「具体性に欠如する」で「具体的な内容が足りない」の意味になる。「欠陥」は不完全な部分、「欠席」は出席しないこと、「欠乏」は物資などが足りなくなることで、いずれも文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24019-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

相次ぐ台風は地元の観光業に深刻な（　）を与えた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 19,
 '「打撃(だげき)」が正解。「打撃を与える」＝大きな損害・ダメージを与えること。「貢献」「恩恵」「利益」はいずれも好ましい影響を表す語で、台風による被害という文脈と正反対の意味になる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24020-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

大きな契約の前には、（　）に条件を確認する必要がある。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 20,
 '「慎重(しんちょう)」が正解。「慎重に確認する」＝注意深く、軽々しくならないように確認すること。「気軽」「軽率」は不注意・軽々しい様子を表し、「大胆」は思い切った様子を表すため、いずれも大切な契約前の行動として不適切。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24021-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新入社員たちは仕事に対する（　）にあふれていた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 21,
 '「意欲(いよく)」が正解。「意欲にあふれる」＝物事に積極的に取り組もうとする気持ちが強いこと。「疑問」「不安」「遠慮」はいずれも消極的または否定的な感情で、新入社員の前向きな様子を表すには合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24022-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の（　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

トラブルが発生した際には、冷静に（　）することが大切だ。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 22,
 '「対処(たいしょ)」が正解。「対処する」＝問題や事態にうまく処置すること。「放置」は放っておくこと、「我慢」は耐え忍ぶこと、「傍観」は関わらず見ているだけの様子で、トラブル解決の行動として不適切。');

-- 問題5: PARAPHRASE (Q23-Q27, sort 23-27)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24023-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

故郷の風景が今でもはっきりと【目に浮かぶ】。',
 'vocabulary', 'PARAPHRASE', true, 1, 23,
 '「目に浮かぶ」は「実際に見ていなくても、その情景がありありと思い出される・想像される」という意味の慣用表現。「はっきりと」という副詞とも整合する。「忘れてしまう」「見えなくなる」「見飽きてしまう」はいずれも逆または無関係な意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24024-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

大人数の意見をまとめるのは【骨が折れる】作業だった。',
 'vocabulary', 'PARAPHRASE', true, 1, 24,
 '「骨が折れる」は「非常に苦労する・大変な労力がかかる」という意味の慣用表現。「大人数の意見をまとめる」という難しい作業の描写として自然。「あっという間に終わる」「誰でも簡単にできる」は正反対、「楽しくてたまらない」は感情の方向が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24025-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼のスピーチは多くの聴衆の【胸を打った】。',
 'vocabulary', 'PARAPHRASE', true, 1, 25,
 '「胸を打つ」は「深く心を動かす・感動させる」という意味の慣用表現。「多くの聴衆の___」という文脈から、スピーチが人々を感動させたことが分かる。「怒らせた」「退屈させた」「疑わせた」はいずれも異なる感情を表し、意味に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24026-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼女は【気が利く】人で、いつも周囲の状況をよく見て動く。',
 'vocabulary', 'PARAPHRASE', true, 1, 26,
 '「気が利く」は「細部にまで注意が行き届き、状況に応じた適切な配慮ができる」という意味の慣用表現。「周囲の状況をよく見て動く」という後半と整合する。「頑固な」「のんびりしている」「決断が早い」はいずれも「気が利く」の意味に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24027-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

円安が輸出企業の業績拡大に【拍車をかけた】。',
 'vocabulary', 'PARAPHRASE', true, 1, 27,
 '「拍車をかける」は「物事の進行や勢いをさらに加速させること」を意味する慣用表現。「業績拡大に___」という文脈から、円安が業績拡大の勢いを強めたことが分かる。「悪影響を及ぼした」「ブレーキをかけた」は逆の意味、「全く関係しなかった」は無関係の内容。');

-- 問題6: WORD_USAGE (Q28-Q32, sort 28-32)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24028-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「見込み」',
 'vocabulary', 'WORD_USAGE', true, 1, 28,
 '「見込み(みこみ)」は「物事がこの先どうなるかという予測・期待」を意味する。今年の新商品の売り上げについて予測を述べる文脈(選択肢4)が正しい用法。「見込みを立てて掃除」「会議の見込みに遅刻」「見込みよく仕事をこなす」はいずれも不自然な用法。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24029-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「発足」',
 'vocabulary', 'WORD_USAGE', true, 1, 29,
 '「発足(ほっそく)」は「組織・団体・活動などが新しく設立され、動き始めること」を意味する。新しい支援団体が活動を始めるという文脈(選択肢1)が正しい用法。「ジョギングを発足」「資料を発足」「電車が発足」はいずれも意味の通らない用法。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24030-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「徹底」',
 'vocabulary', 'WORD_USAGE', true, 1, 30,
 '「徹底(てってい)」は「一つの方針・態度などを最後まで貫き通すこと、隅々まで行き渡らせること」を意味する。工場の安全管理を隅々まで行き渡らせるという文脈(選択肢2)が正しい用法。「徹底に散歩」「徹底に食事」「徹底に否決」はいずれも不自然な用法。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24031-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「検討」',
 'vocabulary', 'WORD_USAGE', true, 1, 31,
 '「検討(けんとう)」は「物事をよく調べ、考えを深めること」を意味する。新しい提案について部内で慎重に考えを深めるという文脈(選択肢3)が正しい用法。「検討してすぐに結論」は矛盾、「検討をしてから出勤」「会議室の検討が終わった」はいずれも意味が通らない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade24032-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000241', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「応募」',
 'vocabulary', 'WORD_USAGE', true, 1, 32,
 '「応募(おうぼ)」は「募集に対して申し込むこと」を意味する。求人に申し込むという文脈(選択肢4)が正しい用法。「誕生日会に応募」「規則が応募される」「日程を応募した」はいずれも意味が通らない、または別の語を使うべき不自然な用法。');

-- ============================================================
-- quiz_question_options (128選択肢: 32問×4択)
-- 正答位置: 1(Q1,Q5,Q9,Q13,Q17,Q21,Q25,Q29) / 2(Q2,Q6,Q10,Q14,Q18,Q22,Q26,Q30)
--           3(Q3,Q7,Q11,Q15,Q19,Q23,Q27,Q31) / 4(Q4,Q8,Q12,Q16,Q20,Q24,Q28,Q32)
-- ============================================================

-- Q1: KANJI_READING 抵抗→ていこう (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24001-0000-0000-0000-000000000000', 'ていこう', true,  1),
('ade24001-0000-0000-0000-000000000000', 'たいこう', false, 2),
('ade24001-0000-0000-0000-000000000000', 'ていこ',   false, 3),
('ade24001-0000-0000-0000-000000000000', 'こうてい', false, 4);

-- Q2: KANJI_READING 把握→はあく (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24002-0000-0000-0000-000000000000', 'はんあく', false, 1),
('ade24002-0000-0000-0000-000000000000', 'はあく',   true,  2),
('ade24002-0000-0000-0000-000000000000', 'はいあく', false, 3),
('ade24002-0000-0000-0000-000000000000', 'はわく',   false, 4);

-- Q3: KANJI_READING 妥協→だきょう (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24003-0000-0000-0000-000000000000', 'だっきょう', false, 1),
('ade24003-0000-0000-0000-000000000000', 'たきょう',   false, 2),
('ade24003-0000-0000-0000-000000000000', 'だきょう',   true,  3),
('ade24003-0000-0000-0000-000000000000', 'だいきょう', false, 4);

-- Q4: KANJI_READING 発揮→はっき (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24004-0000-0000-0000-000000000000', 'はつき', false, 1),
('ade24004-0000-0000-0000-000000000000', 'はっぎ', false, 2),
('ade24004-0000-0000-0000-000000000000', 'ほっき', false, 3),
('ade24004-0000-0000-0000-000000000000', 'はっき', true,  4);

-- Q5: KANJI_READING 拒否→きょひ (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24005-0000-0000-0000-000000000000', 'きょひ',   true,  1),
('ade24005-0000-0000-0000-000000000000', 'こひ',     false, 2),
('ade24005-0000-0000-0000-000000000000', 'きょふ',   false, 3),
('ade24005-0000-0000-0000-000000000000', 'きょうひ', false, 4);

-- Q6: NOTATION ふたん→負担 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24006-0000-0000-0000-000000000000', '富担', false, 1),
('ade24006-0000-0000-0000-000000000000', '負担', true,  2),
('ade24006-0000-0000-0000-000000000000', '附担', false, 3),
('ade24006-0000-0000-0000-000000000000', '負胆', false, 4);

-- Q7: NOTATION こうけん→貢献 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24007-0000-0000-0000-000000000000', '功献', false, 1),
('ade24007-0000-0000-0000-000000000000', '貢験', false, 2),
('ade24007-0000-0000-0000-000000000000', '貢献', true,  3),
('ade24007-0000-0000-0000-000000000000', '功験', false, 4);

-- Q8: NOTATION こうりつ→効率 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24008-0000-0000-0000-000000000000', '好率', false, 1),
('ade24008-0000-0000-0000-000000000000', '交率', false, 2),
('ade24008-0000-0000-0000-000000000000', '功率', false, 3),
('ade24008-0000-0000-0000-000000000000', '効率', true,  4);

-- Q9: NOTATION かくじつ→確実 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24009-0000-0000-0000-000000000000', '確実', true,  1),
('ade24009-0000-0000-0000-000000000000', '各実', false, 2),
('ade24009-0000-0000-0000-000000000000', '確突', false, 3),
('ade24009-0000-0000-0000-000000000000', '拡実', false, 4);

-- Q10: NOTATION じゅうじつ→充実 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24010-0000-0000-0000-000000000000', '重実', false, 1),
('ade24010-0000-0000-0000-000000000000', '充実', true,  2),
('ade24010-0000-0000-0000-000000000000', '中実', false, 3),
('ade24010-0000-0000-0000-000000000000', '従実', false, 4);

-- Q11: WORD_FORMATION (延)期 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24011-0000-0000-0000-000000000000', '早', false, 1),
('ade24011-0000-0000-0000-000000000000', '前', false, 2),
('ade24011-0000-0000-0000-000000000000', '延', true,  3),
('ade24011-0000-0000-0000-000000000000', '後', false, 4);

-- Q12: WORD_FORMATION 説得(力) (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24012-0000-0000-0000-000000000000', '性', false, 1),
('ade24012-0000-0000-0000-000000000000', '感', false, 2),
('ade24012-0000-0000-0000-000000000000', '化', false, 3),
('ade24012-0000-0000-0000-000000000000', '力', true,  4);

-- Q13: WORD_FORMATION 緊張(感) (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24013-0000-0000-0000-000000000000', '感', true,  1),
('ade24013-0000-0000-0000-000000000000', '性', false, 2),
('ade24013-0000-0000-0000-000000000000', '力', false, 3),
('ade24013-0000-0000-0000-000000000000', '化', false, 4);

-- Q14: WORD_FORMATION (伝)達 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24014-0000-0000-0000-000000000000', '報', false, 1),
('ade24014-0000-0000-0000-000000000000', '伝', true,  2),
('ade24014-0000-0000-0000-000000000000', '知', false, 3),
('ade24014-0000-0000-0000-000000000000', '届', false, 4);

-- Q15: WORD_FORMATION (就)職 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24015-0000-0000-0000-000000000000', '求', false, 1),
('ade24015-0000-0000-0000-000000000000', '採', false, 2),
('ade24015-0000-0000-0000-000000000000', '就', true,  3),
('ade24015-0000-0000-0000-000000000000', '雇', false, 4);

-- Q16: CONTEXT_WORD 勧告 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24016-0000-0000-0000-000000000000', '命令', false, 1),
('ade24016-0000-0000-0000-000000000000', '報告', false, 2),
('ade24016-0000-0000-0000-000000000000', '相談', false, 3),
('ade24016-0000-0000-0000-000000000000', '勧告', true,  4);

-- Q17: CONTEXT_WORD 適応 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24017-0000-0000-0000-000000000000', '適応', true,  1),
('ade24017-0000-0000-0000-000000000000', '適用', false, 2),
('ade24017-0000-0000-0000-000000000000', '対応', false, 3),
('ade24017-0000-0000-0000-000000000000', '反応', false, 4);

-- Q18: CONTEXT_WORD 欠如 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24018-0000-0000-0000-000000000000', '欠陥', false, 1),
('ade24018-0000-0000-0000-000000000000', '欠如', true,  2),
('ade24018-0000-0000-0000-000000000000', '欠席', false, 3),
('ade24018-0000-0000-0000-000000000000', '欠乏', false, 4);

-- Q19: CONTEXT_WORD 打撃 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24019-0000-0000-0000-000000000000', '貢献', false, 1),
('ade24019-0000-0000-0000-000000000000', '恩恵', false, 2),
('ade24019-0000-0000-0000-000000000000', '打撃', true,  3),
('ade24019-0000-0000-0000-000000000000', '利益', false, 4);

-- Q20: CONTEXT_WORD 慎重 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24020-0000-0000-0000-000000000000', '気軽', false, 1),
('ade24020-0000-0000-0000-000000000000', '大胆', false, 2),
('ade24020-0000-0000-0000-000000000000', '軽率', false, 3),
('ade24020-0000-0000-0000-000000000000', '慎重', true,  4);

-- Q21: CONTEXT_WORD 意欲 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24021-0000-0000-0000-000000000000', '意欲', true,  1),
('ade24021-0000-0000-0000-000000000000', '疑問', false, 2),
('ade24021-0000-0000-0000-000000000000', '不安', false, 3),
('ade24021-0000-0000-0000-000000000000', '遠慮', false, 4);

-- Q22: CONTEXT_WORD 対処 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24022-0000-0000-0000-000000000000', '放置', false, 1),
('ade24022-0000-0000-0000-000000000000', '対処', true,  2),
('ade24022-0000-0000-0000-000000000000', '我慢', false, 3),
('ade24022-0000-0000-0000-000000000000', '傍観', false, 4);

-- Q23: PARAPHRASE 目に浮かぶ (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24023-0000-0000-0000-000000000000', '忘れてしまう',       false, 1),
('ade24023-0000-0000-0000-000000000000', '見えなくなる',       false, 2),
('ade24023-0000-0000-0000-000000000000', 'まざまざと思い出される', true, 3),
('ade24023-0000-0000-0000-000000000000', '見飽きてしまう',     false, 4);

-- Q24: PARAPHRASE 骨が折れる (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24024-0000-0000-0000-000000000000', 'あっという間に終わる', false, 1),
('ade24024-0000-0000-0000-000000000000', '楽しくてたまらない',   false, 2),
('ade24024-0000-0000-0000-000000000000', '誰でも簡単にできる',   false, 3),
('ade24024-0000-0000-0000-000000000000', '多くの労力を要する',   true,  4);

-- Q25: PARAPHRASE 胸を打つ (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24025-0000-0000-0000-000000000000', '深く感動させた', true,  1),
('ade24025-0000-0000-0000-000000000000', '大いに怒らせた', false, 2),
('ade24025-0000-0000-0000-000000000000', 'ひどく退屈させた', false, 3),
('ade24025-0000-0000-0000-000000000000', '強く疑わせた',   false, 4);

-- Q26: PARAPHRASE 気が利く (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24026-0000-0000-0000-000000000000', '頑固な',             false, 1),
('ade24026-0000-0000-0000-000000000000', '細やかな心配りができる', true, 2),
('ade24026-0000-0000-0000-000000000000', 'のんびりしている',   false, 3),
('ade24026-0000-0000-0000-000000000000', '決断が早い',         false, 4);

-- Q27: PARAPHRASE 拍車をかける (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24027-0000-0000-0000-000000000000', '悪影響を及ぼした',   false, 1),
('ade24027-0000-0000-0000-000000000000', '全く関係しなかった', false, 2),
('ade24027-0000-0000-0000-000000000000', '一段と勢いを加えた', true,  3),
('ade24027-0000-0000-0000-000000000000', 'ブレーキをかけた',   false, 4);

-- Q28: WORD_USAGE 見込み (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24028-0000-0000-0000-000000000000', '彼は毎日見込みを立てて掃除をしている。', false, 1),
('ade24028-0000-0000-0000-000000000000', '会議の見込みに遅刻してしまった。', false, 2),
('ade24028-0000-0000-0000-000000000000', '彼女はいつも見込みよく仕事をこなす。', false, 3),
('ade24028-0000-0000-0000-000000000000', '今年の新商品は売り上げが伸びる見込みだ。', true, 4);

-- Q29: WORD_USAGE 発足 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24029-0000-0000-0000-000000000000', '新しい支援団体が来月、正式に発足する予定だ。', true, 1),
('ade24029-0000-0000-0000-000000000000', '彼は毎朝ジョギングを発足している。', false, 2),
('ade24029-0000-0000-0000-000000000000', '会議の資料を発足してから配布した。', false, 3),
('ade24029-0000-0000-0000-000000000000', '台風の影響で今日は電車が発足した。', false, 4);

-- Q30: WORD_USAGE 徹底 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24030-0000-0000-0000-000000000000', '彼は毎日、徹底に散歩を楽しんでいる。', false, 1),
('ade24030-0000-0000-0000-000000000000', '工場では安全管理を徹底することが求められている。', true, 2),
('ade24030-0000-0000-0000-000000000000', '彼女は昨日、友人と徹底に食事をした。', false, 3),
('ade24030-0000-0000-0000-000000000000', '新しい提案は会議で徹底に否決された。', false, 4);

-- Q31: WORD_USAGE 検討 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24031-0000-0000-0000-000000000000', '彼は検討して、すぐに結論を出した。', false, 1),
('ade24031-0000-0000-0000-000000000000', '彼女は毎朝、検討をしてから出勤する。', false, 2),
('ade24031-0000-0000-0000-000000000000', '新しい提案について、部内で慎重に検討することになった。', true, 3),
('ade24031-0000-0000-0000-000000000000', '会議室の検討が終わったので、掃除を始めた。', false, 4);

-- Q32: WORD_USAGE 応募 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade24032-0000-0000-0000-000000000000', '彼女は友人の誕生日会に応募した。', false, 1),
('ade24032-0000-0000-0000-000000000000', '新しい規則が来月から応募される。', false, 2),
('ade24032-0000-0000-0000-000000000000', '会議の日程を来週に応募した。', false, 3),
('ade24032-0000-0000-0000-000000000000', '彼は憧れの企業の求人に応募し、面接を受けた。', true, 4);
