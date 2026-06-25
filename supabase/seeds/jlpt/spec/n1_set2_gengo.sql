-- encoding: UTF-8
-- JLPT N1 模試(本番) 言語知識 Set 2
-- quiz_id: ad000001-0000-0000-0000-000000000121
-- 45問: KANJI_READING×6, CONTEXT_WORD×7, PARAPHRASE×6, WORD_USAGE×6, GRAMMAR_CHOICE×10, SENTENCE_ORDER×5, TEXT_GRAMMAR×5
-- UUID: aee20001-0000-0000-0000-000000000002 ~ aee20045-0000-0000-0000-000000000002

-- ============================================================
-- quiz_questions (45問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q6)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20001-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の主張は<u>恣意的</u>な解釈に基づいており、根拠に乏しいと批判された。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「恣意的」は「しいてき」と読む。「自分勝手な・論理的根拠のない」を意味するN1レベルの重要語彙。「じいてき」「しにてき」「さいてき」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20002-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n長期的な視点から事業を<u>俯瞰</u>することが、経営者に求められる資質だ。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「俯瞰」は「ふかん」と読む。「高い所から広く見渡すこと・全体を大局的に見ること」を意味する。「ふがん」「はいかん」「ふきん」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20003-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の態度は<u>傲岸不遜</u>であり、周囲の反感を買った。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「傲岸不遜」は「ごうがんふそん」と読む。「おごり高ぶって謙虚さがない様子」を意味する四字熟語。「こうがんふそん」「ごうがんぶそん」「ごうかんふそん」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20004-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は反論に対して<u>滔々</u>と持論を展開した。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「滔々」は「とうとう」と読む。「水が勢いよく流れるさま・弁舌などが流れるように続くさま」を意味する。「とうとう」が副詞「とうとう（遂に）」と同音であることに注意。「たんたん」「とんとん」「どうどう」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20005-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n古い慣習を<u>踏襲</u>するだけでは、組織の発展は望めない。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「踏襲」は「とうしゅう」と読む。「前のやり方や方針などをそのまま引き継ぐこと」を意味する。「ほしゅう」「とうしょう」「ふしゅう」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20006-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\nその条約は<u>批准</u>されるまでに数年の歳月を要した。',
 'vocabulary', 'KANJI_READING', true, 1, 6,
 '「批准」は「ひじゅん」と読む。「国家が条約への同意を最終的に確認する国際法上の手続き」を意味する。「ひじゅん」以外の「ひいん」「ひそん」「はちじゅん」はすべて誤り。')
ON CONFLICT (id) DO NOTHING;

-- 問題2: CONTEXT_WORD (Q7-Q13)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20007-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の提案は会議で（　　）を呼び、採決は紛糾した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 7,
 '「採決が紛糾した」という結果から、「物議」（ものぎ＝世間の議論・批判）が正解。「共鳴」「賛同」は採決が紛糾しない文脈。「沈黙」は議論にならない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20008-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は部下の失敗を自分の責任として（　　）、上司に報告した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 8,
 '「自分の責任として引き受けた」という文脈に合うのは「引き受け」あるいは「かぶって」。選択肢の「甘受して」＝（不利益・困難を）やむを得ないものとして受け入れることが最も適切。「傍観して」「回避して」「転嫁して」は文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20009-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n長年の努力が（　　）を結び、彼の研究は国際的に認められた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 9,
 '「努力が実を結ぶ」は「努力が報われる」という意味の慣用句。「実（み）」が入る。「功」「花」「芽」はこの慣用句では使わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20010-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n経済政策をめぐる議論は複雑で、専門家の間でも見解が（　　）している。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 10,
 '「見解が分かれる」という意味に最も近いのは「錯綜（さくそう）」（入り乱れて複雑になること）。「統一」「確立」は一致することを意味し不適。「消滅」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20011-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n候補者は演説で聴衆の感情に（　　）し、大きな支持を集めた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 11,
 '「感情に訴えて支持を集めた」という文脈に合うのは「訴求（そきゅう）」または「訴え」。選択肢では「訴求」＝(感情・需要に)強く働きかけることが最適。「傾倒」「回避」「対立」は不適切。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20012-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n新制度の導入は業務の（　　）を招くとして、現場から強い抵抗があった。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 12,
 '「現場から抵抗があった」という文脈から、負の影響を示す語が入る。「煩雑化（はんざつか）」＝手続きや業務が複雑になること が最適。「効率化」「簡素化」「標準化」はいずれも肯定的な変化で抵抗の理由にならない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20013-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は交渉の席で相手の主張の（　　）をつき、有利な条件を引き出した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 13,
 '「相手の主張の矛盾・弱点を突いた」という文脈に合うのは「盲点（もうてん）」または「허점（虚点）」。選択肢では「盲点」＝見落とされている弱点・死角 が正解。「核心」「強み」「根拠」は交渉で「つく」対象として文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

-- 問題3: PARAPHRASE (Q14-Q19)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20014-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼女は失敗を<u>糧</u>にして、さらに高みを目指した。',
 'vocabulary', 'PARAPHRASE', true, 1, 14,
 '「糧（かて）」は「力の源となるもの・栄養となるもの」を意味する。ここでは失敗を次の成長の「材料・力」にしたという意味で使われている。「乗り越えるためのエネルギー源」が正解。「言い訳」「障害」「教訓を無視すること」とは意味が異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20015-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\nその作品は<u>玄人好み</u>の仕上がりで、一般受けしなかった。',
 'vocabulary', 'PARAPHRASE', true, 1, 15,
 '「玄人好み（くろうとごのみ）」は「専門家や熟練者が好むような、高度で洗練されたもの」を意味する。「専門家や熟達者に評価されるような高い品質のもの」が正解。「誰でも楽しめる」「安価な」「大衆向けの」とは正反対の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20016-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼の説明は<u>冗長</u>で、聴衆は途中から集中力を失った。',
 'vocabulary', 'PARAPHRASE', true, 1, 16,
 '「冗長（じょうちょう）」は「言葉や文章などが長すぎて無駄が多いこと」を意味する。「必要以上に長くて無駄が多い」が正解。「簡潔な」「論理的な」「わかりやすい」とは逆の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20017-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\nその慣習は<u>形骸化</u>し、本来の意味を失っていた。',
 'vocabulary', 'PARAPHRASE', true, 1, 17,
 '「形骸化（けいがいか）」は「内容・実質が失われ、形だけが残った状態になること」を意味する。「実質的な意味や機能を失い、形式だけになること」が正解。「活性化する」「廃止される」「新しく作られる」とは異なる。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20018-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼は<u>要領を得ない</u>説明を繰り返し、会議が長引いた。',
 'vocabulary', 'PARAPHRASE', true, 1, 18,
 '「要領を得ない」は「話の要点をうまくつかめていない・的を射ていない」という意味の慣用句。「ポイントが不明確でわかりにくい」が正解。「非常に明快な」「具体的な」「感情的な」とは逆の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20019-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼女はその問題を<u>一刀両断</u>に処理した。',
 'vocabulary', 'PARAPHRASE', true, 1, 19,
 '「一刀両断（いっとうりょうだん）」は「物事をためらわずに思い切って処理すること」を意味する四字熟語。「迷いなく決断力をもって処理すること」が正解。「慎重に検討する」「他者に相談する」「先延ばしにする」とは正反対の意味。')
ON CONFLICT (id) DO NOTHING;

-- 問題4: WORD_USAGE (Q20-Q25)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20020-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「斟酌」',
 'vocabulary', 'WORD_USAGE', true, 1, 20,
 '「斟酌（しんしゃく）」は「相手の事情や気持ちをくみ取って手加減すること・考慮すること」を意味する。相手の立場を考慮して対応する文脈が正しい使い方。「斟酌なく批判する」という使い方も可だが、「事情を斟酌する」が典型的な正用法。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20021-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「敷衍」',
 'vocabulary', 'WORD_USAGE', true, 1, 21,
 '「敷衍（ふえん）」は「意味をさらにわかりやすく広げて説明すること」を意味する。専門用語を一般向けに詳しく説明し直す文脈が正しい使い方。「敷衍して短くする」「敷衍して批判する」「敷衍して否定する」は用法として不自然。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20022-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「逡巡」',
 'vocabulary', 'WORD_USAGE', true, 1, 22,
 '「逡巡（しゅんじゅん）」は「決断できずにためらい、躊躇すること」を意味する。重要な決断を前にしてためらう文脈が正しい使い方。「逡巡して勇敢に行動した」「逡巡して積極的に発言した」は意味が矛盾する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20023-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「瑕疵」',
 'vocabulary', 'WORD_USAGE', true, 1, 23,
 '「瑕疵（かし）」は「傷・欠点・法律上の欠陥」を意味する法律・ビジネス用語。契約書や製品の欠陥・不備を指す文脈が正しい使い方。「瑕疵のある優れた製品」「瑕疵を称賛する」は意味が矛盾する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20024-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「忖度」',
 'vocabulary', 'WORD_USAGE', true, 1, 24,
 '「忖度（そんたく）」は「他人の気持ちや意向をおしはかること」を意味し、近年は「上位者の意向を先読みして行動すること」の意味でも使われる。上司の意向を先読みして動く文脈が正しい使い方。「忖度して反論する」「忖度して独断で決める」は用法として不自然。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20025-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「蓋然性」',
 'vocabulary', 'WORD_USAGE', true, 1, 25,
 '「蓋然性（がいぜんせい）」は「ある事柄が起こる可能性・確率の高さ」を意味する論理・学術的な語。「〜が起こる蓋然性が高い」という形での使用が正しい。「蓋然性が確実だ」（蓋然性は100%ではない）「蓋然性を楽しむ」は不自然な用法。')
ON CONFLICT (id) DO NOTHING;

-- 問題5: GRAMMAR_CHOICE (Q26-Q35)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20026-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は病気（　　）、毎日ピアノの練習を欠かさなかった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 26,
 '「病気をおして」＝病気の状態を無理に押しのけて・病気であるにもかかわらず、という意味の慣用表現。「をおして」は障害・困難を乗り越えて何かをする時に使う。「にかかわらず」も逆接だが「病気をおして」がより自然な慣用表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20027-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は自分の非を認め（　　）、なかなか謝罪しなかった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 27,
 '「認めながらも」＝認めてはいるが、という逆接を表す。「ながらも」はN1文型で「〜であるにもかかわらず」の意味。「からこそ」「だけあって」は順接、「にあたり」は機会・場面を表し文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20028-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nこれ（　　）、彼女の努力の賜物に他ならない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 28,
 '「これもひとえに」＝これはまったくもって・これはひたすら、という意味の書き言葉的表現。「〜の賜物に他ならない」と組み合わさって「これはまさに〜のおかげにほかならない」という意味になる。「これをもって」「これにより」「これをふまえ」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20029-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n実力が伯仲している（　　）、どちらが勝つか予断を許さない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 29,
 '「伯仲しているだけに」＝実力が拮抗しているからこそ・だからこそという理由を強調する表現。「だけに」はN1文型で「〜という理由・状況なので当然」という意味。「くせに」「にしては」「ものの」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20030-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n経費削減（　　）、品質を犠牲にするわけにはいかない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 30,
 '「経費削減とはいえ」＝経費削減ではあるが・だからといって、という逆接。「とはいえ」はN1文型で「〜という状況・事実はあるが、それでも」という意味。「にともない」「に伴って」は変化に伴う文脈、「によって」は手段・原因を表し不適。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20031-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は結果（　　）、全力を尽くすことに意義を見出している。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 31,
 '「結果はどうあれ」＝結果がどうであっても・結果を問わず という意味。「はどうあれ」は「〜がどのような状態であっても」を表すN1文型。「にかかわらず」も同様の逆接だが「はどうあれ」が文体的に自然。「によって」「をもとに」は原因・根拠を表し不適。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20032-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は教師（　　）、授業の準備には妥協しない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 32,
 '「教師たる者」＝教師という立場・役割にある者として という意味のN1文型。「〜たる（者）」は職業・立場の責任感を表す文語的表現。「にして」「であっても」「のわりに」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20033-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nその法案は、賛成派と反対派の意見を（　　）最終的に可決された。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「意見を踏まえた上で」＝意見を十分に考慮してから という意味の複合表現。「を踏まえた上で」はN1表現で「〜を考慮・参考にした上で」の意味。「無視した結果」「度外視して」「参考にせずに」は文脈に反する。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20034-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の作品は美しい（　　）、その裏に深い哲学的思索が込められている。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「美しいのみならず」＝美しいだけでなく という「のみならず」の文型。N1文法で「〜だけでなく、さらに〜」という添加を表す。「ものの」は逆接、「に反して」は対照、「ため」は理由を表し文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20035-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n締め切りが明日に迫っている（　　）、まだ半分も終わっていない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「迫っているというのに」＝差し迫っているにもかかわらず という逆接・不満の強調。「というのに」はN1文型で「〜であるにもかかわらず（話者の不満・驚きを含む）」の意味。「からには」は決意、「ためには」は目的、「ことから」は根拠を表し不適。')
ON CONFLICT (id) DO NOTHING;

-- 問題6: SENTENCE_ORDER (Q36-Q40)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20036-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は　＿＿　＿＿　★　＿＿　ついた。\n（語群：①嘘を　②つも　③りでは　④なかった）',
 'grammar', 'SENTENCE_ORDER', true, 1, 36,
 '正しい語順は「嘘を→つも→りでは→なかった→ついた」。全体は「彼は嘘をつもりではなかったが、ついた」。★は3番目の「りでは」。「〜つもりではなかった」という意図の否定表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20037-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\nその判断は　＿＿　＿＿　★　＿＿　言える。\n（語群：①とは　②適切だと　③状況から　④すれば）',
 'grammar', 'SENTENCE_ORDER', true, 1, 37,
 '正しい語順は「状況から→すれば→とは→適切だと→言える」。全体は「その判断は状況からすればとは適切だと言える」＝「状況から見れば適切だと言える」。★は3番目の「とは」。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20038-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n成功するか　＿＿　＿＿　★　＿＿　大切だ。\n（語群：①やり抜く　②はともかく　③こと　④どうかは）',
 'grammar', 'SENTENCE_ORDER', true, 1, 38,
 '正しい語順は「どうかは→はともかく→やり抜く→こと→大切だ」。「成功するかどうかはともかく、やり抜くことが大切だ」。★は3番目の「やり抜く」。「〜はともかく」は「〜は別として」の意味のN1表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20039-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n上司に　＿＿　＿＿　★　＿＿　ならなかった。\n（語群：①言われる→ ①言われる　②まで　③もなく　④気づか）',
 'grammar', 'SENTENCE_ORDER', true, 1, 39,
 '正しい語順は「言われる→まで→もなく→気づか→ならなかった」。「上司に言われるまでもなく気づかなければならなかった」＝言われなくても自分で気づくべきだった。★は4番目の「気づか」。「〜までもなく」はN1文型で「〜する必要もなく」の意味。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20040-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の　＿＿　＿＿　★　＿＿　余りある。\n（語群：①功績は　②して　③讃え　④余りある）',
 'grammar', 'SENTENCE_ORDER', true, 1, 40,
 '正しい語順は「功績は→讃え→して→余りある」。「彼女の功績は讃えてして余りある」＝「彼女の功績はどれほど讃えても讃え足りないほど大きい」。★は1番目の「功績は」。「〜してして余りある」はN1文語表現。')
ON CONFLICT (id) DO NOTHING;

-- 問題7: TEXT_GRAMMAR (Q41-Q45)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20041-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n人工知能の急速な発展（41）、私たちの労働観は大きな転換を迫られている。これまで「専門家にしかできない」と思われていた業務（42）、AIが代替しつつある現在、人間に固有の価値とは何かを問い直すことが急務だ。単純な知識の蓄積や処理速度では機械に（43）ない以上、創造性や感情知性を磨くことが今後の競争優位につながるだろう。\n\n（41）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 41,
 '「人工知能の急速な発展を受けて」＝発展という出来事を受けて・きっかけとして という意味。「を受けて」はN1文型で「〜という出来事・状況を受けて、その結果・対応として」を表す。「にもかかわらず」「にもとづいて」「にともなって」も近いが「を受けて」が最も文意に合う。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20042-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n人工知能の急速な発展（41）、私たちの労働観は大きな転換を迫られている。これまで「専門家にしかできない」と思われていた業務（42）、AIが代替しつつある現在、人間に固有の価値とは何かを問い直すことが急務だ。単純な知識の蓄積や処理速度では機械に（43）ない以上、創造性や感情知性を磨くことが今後の競争優位につながるだろう。\n\n（42）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 42,
 '「専門家にしかできないと思われていた業務でさえ」＝そのような業務でさえも という強調の逆接。「でさえ」は「〜ですら・〜においてさえも」の意味で、予想外のことを強調するN1表現。「だからこそ」「のみならず」「にしては」は文脈に合わない。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20043-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n人工知能の急速な発展（41）、私たちの労働観は大きな転換を迫られている。これまで「専門家にしかできない」と思われていた業務（42）、AIが代替しつつある現在、人間に固有の価値とは何かを問い直すことが急務だ。単純な知識の蓄積や処理速度では機械に（43）ない以上、創造性や感情知性を磨くことが今後の競争優位につながるだろう。\n\n（43）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 43,
 '「機械に太刀打ちでき（ない以上）」＝機械に対抗できない以上 という意味。文脈は「速度・知識では機械に勝てない以上、別の強みを磨くべき」という論旨。「凌駕でき」「抵抗でき」「匹敵でき」も近いが「太刀打ちでき」が最もこの文脈に合う自然な表現。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20044-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n芸術は時代を（44）存在である。権力や流行に媚びることなく、不条理に抗い、時に社会の矛盾を鋭く（45）。それこそが芸術の本質的使命だと私は考える。\n\n（44）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 44,
 '「芸術は時代を超えた存在である」＝時代に縛られない・時代を越えて普遍的な存在 という意味。「超えた」が正解。「反映した」「代表した」「象徴した」も関連しそうだが「時代を超えた」が文脈全体の論旨（権力に媚びず使命を果たす）に最も合う。')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee20045-0000-0000-0000-000000000002', 'ad000001-0000-0000-0000-000000000121', 'multiple_choice',
 E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n芸術は時代を（44）存在である。権力や流行に媚びることなく、不条理に抗い、時に社会の矛盾を鋭く（45）。それこそが芸術の本質的使命だと私は考える。\n\n（45）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 45,
 '「社会の矛盾を鋭く抉り出す（えぐりだす）」＝問題を深く掘り起こし明らかにする という意味が最も文意に合う。「批評する」「受け入れる」「称賛する」は「不条理に抗う」という文脈の流れに合わない。')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- quiz_question_options (180選択肢)
-- ============================================================

-- Q1: KANJI_READING 恣意的 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20001-0000-0000-0000-000000000002', 'じいてき', false, 1),
('aee20001-0000-0000-0000-000000000002', 'しいてき', true, 2),
('aee20001-0000-0000-0000-000000000002', 'しにてき', false, 3),
('aee20001-0000-0000-0000-000000000002', 'さいてき', false, 4);

-- Q2: KANJI_READING 俯瞰 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20002-0000-0000-0000-000000000002', 'ふがん', false, 1),
('aee20002-0000-0000-0000-000000000002', 'はいかん', false, 2),
('aee20002-0000-0000-0000-000000000002', 'ふかん', true, 3),
('aee20002-0000-0000-0000-000000000002', 'ふきん', false, 4);

-- Q3: KANJI_READING 傲岸不遜 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20003-0000-0000-0000-000000000002', 'こうがんふそん', false, 1),
('aee20003-0000-0000-0000-000000000002', 'ごうがんぶそん', false, 2),
('aee20003-0000-0000-0000-000000000002', 'ごうかんふそん', false, 3),
('aee20003-0000-0000-0000-000000000002', 'ごうがんふそん', true, 4);

-- Q4: KANJI_READING 滔々 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20004-0000-0000-0000-000000000002', 'とうとう', true, 1),
('aee20004-0000-0000-0000-000000000002', 'たんたん', false, 2),
('aee20004-0000-0000-0000-000000000002', 'とんとん', false, 3),
('aee20004-0000-0000-0000-000000000002', 'どうどう', false, 4);

-- Q5: KANJI_READING 踏襲 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20005-0000-0000-0000-000000000002', 'ほしゅう', false, 1),
('aee20005-0000-0000-0000-000000000002', 'とうしゅう', true, 2),
('aee20005-0000-0000-0000-000000000002', 'とうしょう', false, 3),
('aee20005-0000-0000-0000-000000000002', 'ふしゅう', false, 4);

-- Q6: KANJI_READING 批准 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20006-0000-0000-0000-000000000002', 'ひいん', false, 1),
('aee20006-0000-0000-0000-000000000002', 'ひそん', false, 2),
('aee20006-0000-0000-0000-000000000002', 'ひじゅん', true, 3),
('aee20006-0000-0000-0000-000000000002', 'はちじゅん', false, 4);

-- Q7: CONTEXT_WORD 物議 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20007-0000-0000-0000-000000000002', '共鳴', false, 1),
('aee20007-0000-0000-0000-000000000002', '賛同', false, 2),
('aee20007-0000-0000-0000-000000000002', '沈黙', false, 3),
('aee20007-0000-0000-0000-000000000002', '物議', true, 4);

-- Q8: CONTEXT_WORD 甘受して (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20008-0000-0000-0000-000000000002', '甘受して', true, 1),
('aee20008-0000-0000-0000-000000000002', '傍観して', false, 2),
('aee20008-0000-0000-0000-000000000002', '回避して', false, 3),
('aee20008-0000-0000-0000-000000000002', '転嫁して', false, 4);

-- Q9: CONTEXT_WORD 実 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20009-0000-0000-0000-000000000002', '功', false, 1),
('aee20009-0000-0000-0000-000000000002', '実', true, 2),
('aee20009-0000-0000-0000-000000000002', '花', false, 3),
('aee20009-0000-0000-0000-000000000002', '芽', false, 4);

-- Q10: CONTEXT_WORD 錯綜 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20010-0000-0000-0000-000000000002', '統一', false, 1),
('aee20010-0000-0000-0000-000000000002', '確立', false, 2),
('aee20010-0000-0000-0000-000000000002', '錯綜', true, 3),
('aee20010-0000-0000-0000-000000000002', '消滅', false, 4);

-- Q11: CONTEXT_WORD 訴求 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20011-0000-0000-0000-000000000002', '傾倒', false, 1),
('aee20011-0000-0000-0000-000000000002', '回避', false, 2),
('aee20011-0000-0000-0000-000000000002', '対立', false, 3),
('aee20011-0000-0000-0000-000000000002', '訴求', true, 4);

-- Q12: CONTEXT_WORD 煩雑化 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20012-0000-0000-0000-000000000002', '煩雑化', true, 1),
('aee20012-0000-0000-0000-000000000002', '効率化', false, 2),
('aee20012-0000-0000-0000-000000000002', '簡素化', false, 3),
('aee20012-0000-0000-0000-000000000002', '標準化', false, 4);

-- Q13: CONTEXT_WORD 盲点 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20013-0000-0000-0000-000000000002', '核心', false, 1),
('aee20013-0000-0000-0000-000000000002', '盲点', true, 2),
('aee20013-0000-0000-0000-000000000002', '強み', false, 3),
('aee20013-0000-0000-0000-000000000002', '根拠', false, 4);

-- Q14: PARAPHRASE 糧 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20014-0000-0000-0000-000000000002', '言い訳にして', false, 1),
('aee20014-0000-0000-0000-000000000002', '乗り越えるべき障害として', false, 2),
('aee20014-0000-0000-0000-000000000002', '成長のための力の源として', true, 3),
('aee20014-0000-0000-0000-000000000002', '教訓を無視して', false, 4);

-- Q15: PARAPHRASE 玄人好み (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20015-0000-0000-0000-000000000002', '誰でも楽しめる大衆向けの内容', false, 1),
('aee20015-0000-0000-0000-000000000002', '安価で手軽に楽しめる仕上がり', false, 2),
('aee20015-0000-0000-0000-000000000002', '初心者向けにわかりやすくまとめた作品', false, 3),
('aee20015-0000-0000-0000-000000000002', '専門家や熟達者に評価されるような高い品質', true, 4);

-- Q16: PARAPHRASE 冗長 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20016-0000-0000-0000-000000000002', '必要以上に長くて無駄が多い', true, 1),
('aee20016-0000-0000-0000-000000000002', '非常に簡潔でわかりやすい', false, 2),
('aee20016-0000-0000-0000-000000000002', '論理的で説得力がある', false, 3),
('aee20016-0000-0000-0000-000000000002', '感情に訴えかける表現が多い', false, 4);

-- Q17: PARAPHRASE 形骸化 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20017-0000-0000-0000-000000000002', '活発に活動するようになった', false, 1),
('aee20017-0000-0000-0000-000000000002', '実質を失い形式だけが残った状態になった', true, 2),
('aee20017-0000-0000-0000-000000000002', '完全に廃止されてしまった', false, 3),
('aee20017-0000-0000-0000-000000000002', '新しい意味を持つようになった', false, 4);

-- Q18: PARAPHRASE 要領を得ない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20018-0000-0000-0000-000000000002', '非常に明快でわかりやすい', false, 1),
('aee20018-0000-0000-0000-000000000002', '具体的な事例が豊富な', false, 2),
('aee20018-0000-0000-0000-000000000002', 'ポイントが不明確でわかりにくい', true, 3),
('aee20018-0000-0000-0000-000000000002', '感情的で論理に欠ける', false, 4);

-- Q19: PARAPHRASE 一刀両断 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20019-0000-0000-0000-000000000002', '慎重に時間をかけて検討して', false, 1),
('aee20019-0000-0000-0000-000000000002', '他者の意見を幅広く聞いて', false, 2),
('aee20019-0000-0000-0000-000000000002', '問題を先延ばしにせず保留して', false, 3),
('aee20019-0000-0000-0000-000000000002', '迷いなく決断力をもって処理した', true, 4);

-- Q20: WORD_USAGE 斟酌 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20020-0000-0000-0000-000000000002', '先方の事情を斟酌し、締め切りを延長することにした。', true, 1),
('aee20020-0000-0000-0000-000000000002', '彼は斟酌して会議の場で強く反論した。', false, 2),
('aee20020-0000-0000-0000-000000000002', '成功を斟酌して報告書をまとめた。', false, 3),
('aee20020-0000-0000-0000-000000000002', '彼女は結果を斟酌することなく独断で進めた。', false, 4);

-- Q21: WORD_USAGE 敷衍 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20021-0000-0000-0000-000000000002', '教授は論文を敷衍して短くまとめた。', false, 1),
('aee20021-0000-0000-0000-000000000002', '専門用語を敷衍して一般の人にもわかるよう説明した。', true, 2),
('aee20021-0000-0000-0000-000000000002', '彼は相手の意見を敷衍して批判した。', false, 3),
('aee20021-0000-0000-0000-000000000002', '研究結果を敷衍して否定する論文が出た。', false, 4);

-- Q22: WORD_USAGE 逡巡 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20022-0000-0000-0000-000000000002', '彼は逡巡して積極的に新事業へ踏み出した。', false, 1),
('aee20022-0000-0000-0000-000000000002', '逡巡することなく会議で堂々と発言した。', false, 2),
('aee20022-0000-0000-0000-000000000002', '重大な決断を前に彼は長い間逡巡し続けた。', true, 3),
('aee20022-0000-0000-0000-000000000002', '逡巡して勇敢に困難に立ち向かった。', false, 4);

-- Q23: WORD_USAGE 瑕疵 (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20023-0000-0000-0000-000000000002', '彼の作品には多くの瑕疵があり、高く評価された。', false, 1),
('aee20023-0000-0000-0000-000000000002', '瑕疵のある製品だが、顧客からの満足度は高い。', false, 2),
('aee20023-0000-0000-0000-000000000002', 'その提案の瑕疵を称賛し、採用が決まった。', false, 3),
('aee20023-0000-0000-0000-000000000002', '契約書に瑕疵が見つかり、締結前に修正が求められた。', true, 4);

-- Q24: WORD_USAGE 忖度 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20024-0000-0000-0000-000000000002', '部下は上司の意向を忖度し、先回りして資料を準備した。', true, 1),
('aee20024-0000-0000-0000-000000000002', '彼は忖度して上司に強く反論した。', false, 2),
('aee20024-0000-0000-0000-000000000002', '忖度することなく独断でプロジェクトを進めた。', false, 3),
('aee20024-0000-0000-0000-000000000002', '彼女は忖度して自分の意見を積極的に主張した。', false, 4);

-- Q25: WORD_USAGE 蓋然性 (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20025-0000-0000-0000-000000000002', 'この計画の成功は蓋然性が確実だと証明された。', false, 1),
('aee20025-0000-0000-0000-000000000002', '専門家たちはその仮説が正しい蓋然性が高いと判断した。', true, 2),
('aee20025-0000-0000-0000-000000000002', '彼女は蓋然性を楽しみながら結果を待った。', false, 3),
('aee20025-0000-0000-0000-000000000002', '蓋然性とは物事が確実に起きることを意味する。', false, 4);

-- Q26: GRAMMAR_CHOICE をおして (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20026-0000-0000-0000-000000000002', 'のおかげで', false, 1),
('aee20026-0000-0000-0000-000000000002', 'だからこそ', false, 2),
('aee20026-0000-0000-0000-000000000002', 'をおして', true, 3),
('aee20026-0000-0000-0000-000000000002', 'のあまり', false, 4);

-- Q27: GRAMMAR_CHOICE ながらも (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20027-0000-0000-0000-000000000002', 'からこそ', false, 1),
('aee20027-0000-0000-0000-000000000002', 'だけあって', false, 2),
('aee20027-0000-0000-0000-000000000002', 'にあたり', false, 3),
('aee20027-0000-0000-0000-000000000002', 'ながらも', true, 4);

-- Q28: GRAMMAR_CHOICE もひとえに (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20028-0000-0000-0000-000000000002', 'もひとえに', true, 1),
('aee20028-0000-0000-0000-000000000002', 'をもって', false, 2),
('aee20028-0000-0000-0000-000000000002', 'により', false, 3),
('aee20028-0000-0000-0000-000000000002', 'をふまえ', false, 4);

-- Q29: GRAMMAR_CHOICE だけに (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20029-0000-0000-0000-000000000002', 'くせに', false, 1),
('aee20029-0000-0000-0000-000000000002', 'だけに', true, 2),
('aee20029-0000-0000-0000-000000000002', 'にしては', false, 3),
('aee20029-0000-0000-0000-000000000002', 'ものの', false, 4);

-- Q30: GRAMMAR_CHOICE とはいえ (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20030-0000-0000-0000-000000000002', 'にともない', false, 1),
('aee20030-0000-0000-0000-000000000002', 'によって', false, 2),
('aee20030-0000-0000-0000-000000000002', 'とはいえ', true, 3),
('aee20030-0000-0000-0000-000000000002', 'に伴って', false, 4);

-- Q31: GRAMMAR_CHOICE はどうあれ (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20031-0000-0000-0000-000000000002', 'によって', false, 1),
('aee20031-0000-0000-0000-000000000002', 'をもとに', false, 2),
('aee20031-0000-0000-0000-000000000002', 'にかかわらず', false, 3),
('aee20031-0000-0000-0000-000000000002', 'はどうあれ', true, 4);

-- Q32: GRAMMAR_CHOICE たる者 (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20032-0000-0000-0000-000000000002', 'たる者', true, 1),
('aee20032-0000-0000-0000-000000000002', 'にして', false, 2),
('aee20032-0000-0000-0000-000000000002', 'であっても', false, 3),
('aee20032-0000-0000-0000-000000000002', 'のわりに', false, 4);

-- Q33: GRAMMAR_CHOICE を踏まえた上で (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20033-0000-0000-0000-000000000002', '無視した結果', false, 1),
('aee20033-0000-0000-0000-000000000002', '踏まえた上で', true, 2),
('aee20033-0000-0000-0000-000000000002', '度外視して', false, 3),
('aee20033-0000-0000-0000-000000000002', '参考にせずに', false, 4);

-- Q34: GRAMMAR_CHOICE のみならず (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20034-0000-0000-0000-000000000002', 'ものの', false, 1),
('aee20034-0000-0000-0000-000000000002', 'に反して', false, 2),
('aee20034-0000-0000-0000-000000000002', 'のみならず', true, 3),
('aee20034-0000-0000-0000-000000000002', 'ため', false, 4);

-- Q35: GRAMMAR_CHOICE というのに (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20035-0000-0000-0000-000000000002', 'からには', false, 1),
('aee20035-0000-0000-0000-000000000002', 'ためには', false, 2),
('aee20035-0000-0000-0000-000000000002', 'ことから', false, 3),
('aee20035-0000-0000-0000-000000000002', 'というのに', true, 4);

-- Q36: SENTENCE_ORDER ★=りでは (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20036-0000-0000-0000-000000000002', 'りでは', true, 1),
('aee20036-0000-0000-0000-000000000002', '嘘を', false, 2),
('aee20036-0000-0000-0000-000000000002', 'つも', false, 3),
('aee20036-0000-0000-0000-000000000002', 'なかった', false, 4);

-- Q37: SENTENCE_ORDER ★=とは (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20037-0000-0000-0000-000000000002', '状況から', false, 1),
('aee20037-0000-0000-0000-000000000002', 'とは', true, 2),
('aee20037-0000-0000-0000-000000000002', 'すれば', false, 3),
('aee20037-0000-0000-0000-000000000002', '適切だと', false, 4);

-- Q38: SENTENCE_ORDER ★=やり抜く (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20038-0000-0000-0000-000000000002', 'どうかは', false, 1),
('aee20038-0000-0000-0000-000000000002', 'はともかく', false, 2),
('aee20038-0000-0000-0000-000000000002', 'やり抜く', true, 3),
('aee20038-0000-0000-0000-000000000002', 'こと', false, 4);

-- Q39: SENTENCE_ORDER ★=気づか (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20039-0000-0000-0000-000000000002', '言われる', false, 1),
('aee20039-0000-0000-0000-000000000002', 'まで', false, 2),
('aee20039-0000-0000-0000-000000000002', 'もなく', false, 3),
('aee20039-0000-0000-0000-000000000002', '気づか', true, 4);

-- Q40: SENTENCE_ORDER ★=功績は (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20040-0000-0000-0000-000000000002', '功績は', true, 1),
('aee20040-0000-0000-0000-000000000002', '讃え', false, 2),
('aee20040-0000-0000-0000-000000000002', 'して', false, 3),
('aee20040-0000-0000-0000-000000000002', '余りある', false, 4);

-- Q41: TEXT_GRAMMAR blank 41 を受けて (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20041-0000-0000-0000-000000000002', 'にもかかわらず', false, 1),
('aee20041-0000-0000-0000-000000000002', 'を受けて', true, 2),
('aee20041-0000-0000-0000-000000000002', 'にもとづいて', false, 3),
('aee20041-0000-0000-0000-000000000002', 'をよそに', false, 4);

-- Q42: TEXT_GRAMMAR blank 42 でさえ (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20042-0000-0000-0000-000000000002', 'だからこそ', false, 1),
('aee20042-0000-0000-0000-000000000002', 'のみならず', false, 2),
('aee20042-0000-0000-0000-000000000002', 'でさえ', true, 3),
('aee20042-0000-0000-0000-000000000002', 'にしては', false, 4);

-- Q43: TEXT_GRAMMAR blank 43 太刀打ちでき (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20043-0000-0000-0000-000000000002', '凌駕でき', false, 1),
('aee20043-0000-0000-0000-000000000002', '抵抗でき', false, 2),
('aee20043-0000-0000-0000-000000000002', '匹敵でき', false, 3),
('aee20043-0000-0000-0000-000000000002', '太刀打ちでき', true, 4);

-- Q44: TEXT_GRAMMAR blank 44 超えた (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20044-0000-0000-0000-000000000002', '超えた', true, 1),
('aee20044-0000-0000-0000-000000000002', '反映した', false, 2),
('aee20044-0000-0000-0000-000000000002', '代表した', false, 3),
('aee20044-0000-0000-0000-000000000002', '象徴した', false, 4);

-- Q45: TEXT_GRAMMAR blank 45 抉り出す (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee20045-0000-0000-0000-000000000002', '批評する', false, 1),
('aee20045-0000-0000-0000-000000000002', '抉り出す', true, 2),
('aee20045-0000-0000-0000-000000000002', '受け入れる', false, 3),
('aee20045-0000-0000-0000-000000000002', '称賛する', false, 4);
