-- JLPT N1 模擬試験 言語知識（文字・語彙・文法） Set 1 v2
-- quiz_id: ad000001-0000-0000-0000-000000000111
-- 45問: KANJI_READING×6, CONTEXT_WORD×7, PARAPHRASE×6, WORD_USAGE×6, GRAMMAR_CHOICE×10, SENTENCE_ORDER×5, TEXT_GRAMMAR×5
-- UUID: aee10001-0000-0000-0000-000000000001 ~ aee10045-0000-0000-0000-000000000001
-- 정답 sort_order 분산: 1,2,3,4,1,2,3,4... (균등)

-- ============================================================
-- quiz_questions (45問)
-- ============================================================

-- ========== 問題1: KANJI_READING (Q1-Q6) ==========
-- 안내문: 「＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。」
-- 본문: <u>한자</u> 마커 사용

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10001-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n社会活動で<u>人脈</u>を広げることは、キャリア形成において重要だ。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「人脈」は「じんみゃく」と読む。人と人とのつながり・コネクションを意味するN1重要語彙。「じんみゃく」が正解で、「ひとみゃく」「じんかく」「にんみゃく」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10002-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の<u>奔放</u>な生き方は、周囲の人々を驚かせることが多かった。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「奔放」は「ほんぽう」と読む。「常識や規則にとらわれず、自由気ままに振る舞うこと」を意味する。「ほうほう」「はんぽう」「ぼんぽう」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10003-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\nその政治家は長年にわたり<u>清廉</u>な姿勢を貫き、国民の信頼を得た。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「清廉」は「せいれん」と読む。「心が清く、欲がなく正直なこと」を意味する。「きよれん」「せいれい」「きょうれん」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10004-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の発言は論理的に矛盾しており、<u>詭弁</u>と批判された。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「詭弁」は「きべん」と読む。「一見もっともらしく見えるが実は誤りを含む議論・ごまかしの論法」を意味する。「ぎへん」「きへん」「ぎべん」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10005-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n古い書物を<u>紐解く</u>と、当時の人々の価値観が浮かび上がってくる。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「紐解く」は「ひもとく」と読む。「書物を開いて読む・詳しく調べる」という意味で用いられる。「ちゅうとく」「じょうとく」「ひもほどく」は誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10006-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の<u>矜持</u>ある態度は、どんな状況でも揺らぐことはなかった。',
 'vocabulary', 'KANJI_READING', true, 1, 6,
 '「矜持」は「きょうじ」と読む。「自分の能力に自信を持ち誇りとする気持ち・プライド」を意味する。「きょうじ」が正解で、「こうじ」「ごうじ」「きんじ」はすべて誤り。');

-- ========== 問題2: CONTEXT_WORD (Q7-Q13) ==========
-- 안내문: 「（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10007-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n長年の誤解が解け、両国の関係は（　　）を取り戻した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 7,
 '「誤解が解け」「関係が良くなった」という文脈から「友好（ゆうこう）」が正解。友好関係を「取り戻す」は自然な表現。「対立」「断交」「緊張」はいずれも関係悪化を示す語で文脈と逆。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10008-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は自分の非を認め、相手に対して深く（　　）した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 8,
 '「自分の非を認め」「相手に対して深く」という文脈には「謝罪（しゃざい）」が最適。「弁解（べんかい）」は言い訳、「批判（ひはん）」は相手を責めること、「抗議（こうぎ）」は異議申し立てで、すべて文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10009-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の功績は後世に（　　）され、記念碑が建てられた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 9,
 '「功績が後世に残され讃えられた」という文脈から「顕彰（けんしょう）」が正解。功績や善行を広く世間に知らせ表彰することを意味する。「批判」「否定」「忘却」はいずれも逆の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10010-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n会議では様々な意見が出たが、最終的に全員が（　　）に達した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 10,
 '「最終的に全員が一致した」という結果には「合意（ごうい）」が最も自然。「合意に達する」は慣用表現。「対立」「拮抗」「分裂」はいずれも意見が割れることを示し文脈と逆。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10011-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nその法案は（　　）な内容を含んでいるとして、野党から強い反発を受けた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 11,
 '「野党から強い反発を受けた」という文脈には「問題のある・受け入れがたい」意味の語が入る。「恣意的（しいてき）」＝自分勝手な・主観的な、が最も適切。「合理的」「透明」「客観的」は反発を受ける理由にならない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10012-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は多くの失敗を経験しながら、それらを（　　）として成長してきた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 12,
 '「失敗を糧（かて）として成長した」という文脈に合うのは「糧（かて）」＝生きていく力の源・養分となるもの。「失敗を糧にする」は慣用表現。「障害」「言い訳」「理由」では成長につながる前向きな文脈が作れない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10013-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女はどんな相手にも（　　）な態度で接し、信頼を集めた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 13,
 '「どんな相手にも」「信頼を集めた」という文脈から「真摯（しんし）」＝真剣で誠実な態度が最適。「傲慢（ごうまん）」「冷淡（れいたん）」「横柄（おうへい）」はいずれも信頼を失う態度であり不適切。');

-- ========== 問題3: PARAPHRASE (Q14-Q19) ==========
-- 안내문: 「＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。」
-- 본문: <u>표현</u> 마커 사용

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10014-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n上司の指示を受け、彼は<u>即座に</u>行動を開始した。',
 'vocabulary', 'PARAPHRASE', true, 1, 14,
 '「即座に（そくざに）」は「その場ですぐに・間を置かずに」という意味の副詞。「直ちに（ただちに）」が最も意味が近い。「ゆっくりと」「じっくりと」「慎重に」はいずれも時間をかける意味で逆。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10015-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\nその計画は実現する<u>見込みが薄い</u>と判断された。',
 'vocabulary', 'PARAPHRASE', true, 1, 15,
 '「見込みが薄い（みこみがうすい）」は「実現・成功の可能性が低い」という意味。「望みが少ない」が最も近い。「確実だ」「期待できる」「問題ない」はいずれも逆の意味になる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10016-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼の説明はとても<u>明瞭で</u>、誰にでも理解できた。',
 'vocabulary', 'PARAPHRASE', true, 1, 16,
 '「明瞭（めいりょう）」は「はっきりしていてよくわかること」を意味する。「明快（めいかい）」が最も意味が近い。「曖昧な（あいまいな）」「複雑な」「抽象的な」はいずれも反対の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10017-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼女は仕事と家庭を<u>巧みに</u>両立させている。',
 'vocabulary', 'PARAPHRASE', true, 1, 17,
 '「巧みに（たくみに）」は「上手に・技巧を凝らして・うまく」という意味の副詞。「上手に（じょうずに）」が最も意味が近い。「強引に（ごういんに）」「無理やり」「偶然」は意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10018-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n彼は困難な状況でも<u>冷静沈着に</u>対処した。',
 'vocabulary', 'PARAPHRASE', true, 1, 18,
 '「冷静沈着（れいせいちんちゃく）」は「感情に乱されず落ち着いた状態」を表す四字熟語。「落ち着いて（おちついて）」が最も意味が近い。「あわてて」「怒りながら」「悲しんで」はいずれも感情的な状態で逆。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10019-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'＿＿の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。\n\n当局は不正行為を<u>看過できない</u>と声明を出した。',
 'vocabulary', 'PARAPHRASE', true, 1, 19,
 '「看過できない（かんかできない）」は「見て見ぬふりができない・見逃せない」という意味。「見逃すことはできない」が最も意味が近い。「無視してもいい」「問題ではない」「放置してかまわない」はいずれも逆の意味。');

-- ========== 問題4: WORD_USAGE (Q20-Q25) ==========
-- 안내문: 「次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。」
-- 본문: 대상 단어 1개만. 보기: 그 단어가 쓰인 문장 4개

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10020-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「あいにく」',
 'vocabulary', 'WORD_USAGE', true, 1, 20,
 '「あいにく」は「折悪しく・運悪く・残念ながら」という意味の副詞で、期待や希望に反する状況に使う。「あいにく今日は定休日でした」が正しい用法。楽しいイベントや成功・良いことの文脈では使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10021-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「払拭」',
 'vocabulary', 'WORD_USAGE', true, 1, 21,
 '「払拭（ふっしょく）」は「悪い状態や不安・疑念・汚名などを完全に取り除くこと」を意味する。「不信感を払拭する」「懸念を払拭した」が正しい用法。記憶を思い出す・数を増やす・物事を始めるといった文脈では使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10022-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「懸念」',
 'vocabulary', 'WORD_USAGE', true, 1, 22,
 '「懸念（けねん）」は「心配・気がかり・危惧」を意味する。「安全性への懸念が高まっている」が正しい用法。喜び・期待・楽しみといったポジティブな感情には使わない。また「懸念する」は「〜を心配する」という意味なので、成功の場面では不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10023-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「逡巡」',
 'vocabulary', 'WORD_USAGE', true, 1, 23,
 '「逡巡（しゅんじゅん）」は「ためらうこと・なかなか決断できずにぐずぐずすること」を意味する。「決断を前に逡巡した」が正しい用法。積極的に行動する・すぐに決める・楽しんで取り組むといった文脈では使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10024-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「端緒」',
 'vocabulary', 'WORD_USAGE', true, 1, 24,
 '「端緒（たんしょ）」は「物事の始まり・きっかけ・手がかり」を意味する。「この事件が捜査の端緒となった」「改革の端緒を開く」が正しい用法。結末・終わり・成果・まとめといった文脈には使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10025-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。\n\n「一概に」',
 'vocabulary', 'WORD_USAGE', true, 1, 25,
 '「一概に（いちがいに）」は「すべてを同一に・一律に」という意味で、必ず否定表現（〜とは言えない・〜にはできない）と呼応して使う。「一概に悪いとは言えない」が正しい用法。肯定文や独立して用いることはできない。');

-- ========== 問題5: GRAMMAR_CHOICE (Q26-Q35) ==========
-- 안내문: 「次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10026-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n今さら謝った（　　）、失った信頼は簡単には戻らないだろう。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 26,
 '「謝ったところで」＝謝っても（そうしても状況は変わらない）という逆接・無意味を表すN1文型。「〜たところで」は「たとえ〜しても、結果は変わらない」という意味。「だけに」は理由・強調、「とあれば」は条件、「にしても」は逆接だが文脈のニュアンスが異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10027-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n専門家（　　）、この程度の問題が解けないはずがない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 27,
 '「専門家ともあろう者が」＝専門家という立場・身分であるにもかかわらず（その人に似合わない行動を批判する）という意味のN1文型。「ともあろう」は地位・立場への期待を裏切ることへの非難を含む。「にしては」は程度の対比、「だけあって」は順接、「にもかかわらず」は単純逆接。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10028-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女は夢を実現する（　　）、長年努力を続けてきた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 28,
 '「夢を実現すべく」＝夢を実現しようとして・夢実現のために（目的を表す書き言葉的表現）。「〜すべく」はN1文法で「〜するために/〜しようとして」という目的を表す。「べく」は書き言葉・改まった場面で用いる。「ために」でも意味は通じるが、「すべく」がより文語的で正式。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10029-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\nその事故は、設備の老朽化（　　）起きたものと考えられる。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 29,
 '「設備の老朽化に起因して」＝老朽化が原因で・老朽化から生じて、という意味のN1表現。「〜に起因する」は「〜が原因である」という書き言葉的な因果表現。「によって」でも可だが「に起因して」がより書き言葉的で正式。「をもとに」は根拠・材料、「に即して」は基準、「をめぐって」は話題の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10030-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼の言葉は私の心に深く刺さり、今も忘れることができない。あのとき言われたことが、今の私（　　）なっている。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 30,
 '「今の私の礎（いしずえ）になっている」＝今の自分の基盤・土台になっているという意味。「礎」は「建物の土台・物事の基盤」を意味し、「〜の礎になる」は慣用的表現。「核心」「焦点」「指針」も近いが「礎」が「今の私の基盤」という文脈に最も適切。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10031-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n試験まで残り一週間しかない。（　　）、今から全力で取り組むしかない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 31,
 '「今となっては」＝今の時点ではもはや（という状況の確認・受け入れ）。残り一週間という現状を認めた上で前向きに行動するという文脈に合う。「それはともかく」は話題転換、「そのうえ」は追加、「むしろ」は対比・転換で文脈と合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10032-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n子供のころから培ってきた語学力が、海外勤務という機会（　　）生きることになった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 32,
 '「機会をとおして生きることになった」＝その機会を介して能力が発揮された、という意味。「〜をとおして」は「〜を通じて・〜を経由して」という意味のN1表現。「を踏まえて」は考慮、「をよそに」は無視、「を皮切りに」は最初のきっかけで、文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10033-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は約束を守ることを（　　）としており、遅刻したことが一度もない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「約束を守ることを信条（しんじょう）としており」＝信条・モットーとして守っており、という意味。「〜を信条とする」は「〜を自分の行動原則・主義とする」という慣用的表現。「目安」「目標」「課題」も近い意味だが「信条とする」という慣用的なつながりは「信条」だけ。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10034-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n不況が長引く（　　）、失業者の数は増え続けている。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「不況が長引くにつれて」＝不況が続くのと同時進行で失業者が増えるという変化の並行を表す。「〜につれて/〜にしたがって」はN2〜N1文法で、一方の変化に伴いもう一方も変化することを示す。「のみならず」は追加、「にもかかわらず」は逆接、「を契機として」は特定の出来事のきっかけ。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10035-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼がそんな無責任なことを言う（　　）、みんな呆れてしまった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「言うに及んで」＝言ったことで（その発言がきっかけとなり）という意味。「〜に及んで/〜に至って」はある局面に達したことを表す。しかしここで最適なのは「言うとは」＝言うなんて（驚き・非難）。「言うとは」はN1レベルの「〜とは」(驚き・感嘆・非難)で、「みんな呆れてしまった」と自然につながる。');

-- ========== 問題6: SENTENCE_ORDER (Q36-Q40) ==========
-- 안내문: 「次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。」
-- 보기: 어구 4개. 정답 = ★ 자리에 들어가는 어구.

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10036-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女の努力は　＿＿　＿＿　★　＿＿　ものだ。\n（語群：①に値する　②称賛　③並々ならぬ　④される）',
 'grammar', 'SENTENCE_ORDER', true, 1, 36,
 E'正しい語順は「並々ならぬ→努力は→称賛→される→に値する→ものだ」。\n完成文:「彼女の努力は 並々ならぬ 称賛 ★される に値する ものだ」\n→「彼女の努力は並々ならぬ、称賛されるに値するものだ」\n★は3番目の位置（「される」）。「称賛されるに値する」は「称賛に値する」の受身展開形。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10037-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\nこの問題は　＿＿　＿＿　★　＿＿　ではない。\n（語群：①簡単に　②解決できる　③かと言って　④放置していい）',
 'grammar', 'SENTENCE_ORDER', true, 1, 37,
 E'正しい語順は「簡単に→解決できる→かと言って→放置していい→ではない」。\n完成文:「この問題は 簡単に 解決できる ★かと言って 放置していい ではない」\n→「この問題は簡単に解決できるかと言って、放置していいではない」\n★は3番目の位置（「かと言って」）。「〜かと言って」は「〜だからといって」という逆接の意味のN1文型。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10038-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n社長は　＿＿　＿＿　★　＿＿　決断した。\n（語群：①いかなる　②ためらわず　③困難にも　④断行を）',
 'grammar', 'SENTENCE_ORDER', true, 1, 38,
 E'正しい語順は「いかなる→困難にも→ためらわず→断行を→決断した」。\n完成文:「社長は いかなる 困難にも ★ためらわず 断行を 決断した」\n→「社長はいかなる困難にもためらわず、断行を決断した」\n★は3番目の位置（「ためらわず」）。「いかなる〜にも」は「どんな〜にも」という強調のN1表現。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10039-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼は　＿＿　＿＿　★　＿＿　にした。\n（語群：①ことを　②責任を取る　③自らの意思で　④辞職する）',
 'grammar', 'SENTENCE_ORDER', true, 1, 39,
 E'正しい語順は「自らの意思で→責任を取る→ことを→辞職する→にした」。\n完成文:「彼は 自らの意思で 責任を取る ★ことを 辞職する にした」\n→「彼は自らの意思で責任を取ることを、辞職するにした」\n★は3番目の位置（「ことを」）。「〜することにした」は意思決定を表す表現。正確には「辞職することにした」のシャッフル形。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10040-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。\n\n予算が　＿＿　＿＿　★　＿＿　計画だ。\n（語群：①限られている　②実行可能な　③にもかかわらず　④十分に）',
 'grammar', 'SENTENCE_ORDER', true, 1, 40,
 E'正しい語順は「限られている→にもかかわらず→十分に→実行可能な→計画だ」。\n完成文:「予算が 限られている にもかかわらず ★十分に 実行可能な 計画だ」\n→「予算が限られているにもかかわらず、十分に実行可能な計画だ」\n★は3番目の位置（「十分に」）。「〜にもかかわらず」は逆接のN1文型。');

-- ========== 問題7: TEXT_GRAMMAR (Q41-Q45) ==========
-- 안내문: 「次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。」
-- 각 문항: 자기완결형 지문(2~3문장), 빈칸（　　）1개, 번호 표기 없음

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10041-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n近年、高齢化社会の進展（　　）、介護を必要とする人の数が急速に増加している。政府はこの問題に取り組むため、様々な政策を打ち出している。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 41,
 '「高齢化社会の進展にともない」＝高齢化が進むのと同時に介護需要も増えるという変化の並行を表す。「〜にともない」は「〜と同時に別の変化が起きる」というN1文型。「をきっかけに」は特定の出来事、「にもかかわらず」は逆接、「をめぐって」は話題の中心で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10042-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n彼女はプロジェクトのリーダーとして、チーム全員の意見を（　　）最終的な方針を決定した。部下からは、公平な判断ができるリーダーだと高く評価されている。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 42,
 '「チーム全員の意見を踏まえて（ふまえて）最終的な方針を決定した」＝意見を考慮した上で決めたという意味。「〜を踏まえて」は「〜を十分に考慮して・〜に基づいて」というN1表現。「よそに」は無視、「もとに」は根拠（やや近いが「踏まえて」が公平な判断の文脈に最も合う）、「さかのぼって」は時間遡及で不適。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10043-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n伝統工芸品の需要が減少している現在、職人の技術を次世代に継承することは（　　）課題となっている。地域社会や行政が連携して支援する体制づくりが急がれる。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 43,
 '「次世代への技術継承は急を要する課題となっている」という文脈から、「看過できない（かんかできない）」＝見逃せない・無視できないが最適。「〜が急がれる」という後文とも呼応する。「些細な（ささいな）」は軽微、「解決済みの」は完了、「論じるまでもない」は当然すぎて議論不要、で文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10044-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n科学技術の急速な発展により、私たちの生活は便利になった（　　）、新たな倫理的問題も生じている。テクノロジーの恩恵と課題を同時に考える姿勢が求められる。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 44,
 '「便利になった反面（はんめん）、新たな問題も生じている」＝良い面がある一方で問題もあるという対比。「〜反面」は「一方では〜だが、その反対の側面もある」というN1文型。「おかげで」は順接(恩恵のみ)、「ために」は原因・目的、「以上」は条件・当然で、いずれも対比を表せない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('aee10045-0000-0000-0000-000000000001', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
E'次の文章を読んで、（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。\n\n言語を学ぶ際、文法の正確さも大切だが、それ（　　）実際にコミュニケーションを取る経験を重ねることが上達への近道だ。コミュニケーション能力は教室の外でこそ磨かれる。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 45,
 '「文法の正確さも大切だが、それにもまして実際のコミュニケーション経験が大切だ」＝それ以上に、という意味。「〜にもまして」は「〜よりもさらに・〜以上に」というN1文型で比較強調を表す。「に加えて」は追加（両方を等価に扱う）、「に反して」は逆接・期待に反する、「をもとに」は根拠で文脈に合わない。');

-- ============================================================
-- quiz_question_options (180選択肢)
-- 正答 sort_order 分散: Q1→1, Q2→2, Q3→3, Q4→4, Q5→1, Q6→2,
--   Q7→3, Q8→4, Q9→1, Q10→2, Q11→3, Q12→4, Q13→1,
--   Q14→2, Q15→3, Q16→4, Q17→1, Q18→2, Q19→3,
--   Q20→4, Q21→1, Q22→2, Q23→3, Q24→4, Q25→1,
--   Q26→2, Q27→3, Q28→4, Q29→1, Q30→2, Q31→3, Q32→4, Q33→1, Q34→2, Q35→3,
--   Q36→4, Q37→1, Q38→2, Q39→3, Q40→4,
--   Q41→1, Q42→2, Q43→3, Q44→4, Q45→1
-- ============================================================

-- Q1: KANJI_READING 人脈 (正答=じんみゃく, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10001-0000-0000-0000-000000000001', 'じんみゃく', true, 1),
('aee10001-0000-0000-0000-000000000001', 'ひとみゃく', false, 2),
('aee10001-0000-0000-0000-000000000001', 'じんかく', false, 3),
('aee10001-0000-0000-0000-000000000001', 'にんみゃく', false, 4);

-- Q2: KANJI_READING 奔放 (正答=ほんぽう, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10002-0000-0000-0000-000000000001', 'ほうほう', false, 1),
('aee10002-0000-0000-0000-000000000001', 'ほんぽう', true, 2),
('aee10002-0000-0000-0000-000000000001', 'はんぽう', false, 3),
('aee10002-0000-0000-0000-000000000001', 'ぼんぽう', false, 4);

-- Q3: KANJI_READING 清廉 (正答=せいれん, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10003-0000-0000-0000-000000000001', 'きよれん', false, 1),
('aee10003-0000-0000-0000-000000000001', 'せいれい', false, 2),
('aee10003-0000-0000-0000-000000000001', 'せいれん', true, 3),
('aee10003-0000-0000-0000-000000000001', 'きょうれん', false, 4);

-- Q4: KANJI_READING 詭弁 (正答=きべん, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10004-0000-0000-0000-000000000001', 'ぎへん', false, 1),
('aee10004-0000-0000-0000-000000000001', 'きへん', false, 2),
('aee10004-0000-0000-0000-000000000001', 'ぎべん', false, 3),
('aee10004-0000-0000-0000-000000000001', 'きべん', true, 4);

-- Q5: KANJI_READING 紐解く (正答=ひもとく, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10005-0000-0000-0000-000000000001', 'ひもとく', true, 1),
('aee10005-0000-0000-0000-000000000001', 'ちゅうとく', false, 2),
('aee10005-0000-0000-0000-000000000001', 'じょうとく', false, 3),
('aee10005-0000-0000-0000-000000000001', 'ひもほどく', false, 4);

-- Q6: KANJI_READING 矜持 (正答=きょうじ, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10006-0000-0000-0000-000000000001', 'こうじ', false, 1),
('aee10006-0000-0000-0000-000000000001', 'きょうじ', true, 2),
('aee10006-0000-0000-0000-000000000001', 'ごうじ', false, 3),
('aee10006-0000-0000-0000-000000000001', 'きんじ', false, 4);

-- Q7: CONTEXT_WORD 友好 (正答=友好, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10007-0000-0000-0000-000000000001', '対立', false, 1),
('aee10007-0000-0000-0000-000000000001', '断交', false, 2),
('aee10007-0000-0000-0000-000000000001', '友好', true, 3),
('aee10007-0000-0000-0000-000000000001', '緊張', false, 4);

-- Q8: CONTEXT_WORD 謝罪 (正答=謝罪, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10008-0000-0000-0000-000000000001', '弁解', false, 1),
('aee10008-0000-0000-0000-000000000001', '批判', false, 2),
('aee10008-0000-0000-0000-000000000001', '抗議', false, 3),
('aee10008-0000-0000-0000-000000000001', '謝罪', true, 4);

-- Q9: CONTEXT_WORD 顕彰 (正答=顕彰, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10009-0000-0000-0000-000000000001', '顕彰', true, 1),
('aee10009-0000-0000-0000-000000000001', '批判', false, 2),
('aee10009-0000-0000-0000-000000000001', '否定', false, 3),
('aee10009-0000-0000-0000-000000000001', '忘却', false, 4);

-- Q10: CONTEXT_WORD 合意 (正答=合意, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10010-0000-0000-0000-000000000001', '対立', false, 1),
('aee10010-0000-0000-0000-000000000001', '合意', true, 2),
('aee10010-0000-0000-0000-000000000001', '拮抗', false, 3),
('aee10010-0000-0000-0000-000000000001', '分裂', false, 4);

-- Q11: CONTEXT_WORD 恣意的 (正答=恣意的, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10011-0000-0000-0000-000000000001', '合理的', false, 1),
('aee10011-0000-0000-0000-000000000001', '透明', false, 2),
('aee10011-0000-0000-0000-000000000001', '恣意的', true, 3),
('aee10011-0000-0000-0000-000000000001', '客観的', false, 4);

-- Q12: CONTEXT_WORD 糧 (正答=糧, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10012-0000-0000-0000-000000000001', '障害', false, 1),
('aee10012-0000-0000-0000-000000000001', '言い訳', false, 2),
('aee10012-0000-0000-0000-000000000001', '理由', false, 3),
('aee10012-0000-0000-0000-000000000001', '糧', true, 4);

-- Q13: CONTEXT_WORD 真摯 (正答=真摯, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10013-0000-0000-0000-000000000001', '真摯', true, 1),
('aee10013-0000-0000-0000-000000000001', '傲慢', false, 2),
('aee10013-0000-0000-0000-000000000001', '冷淡', false, 3),
('aee10013-0000-0000-0000-000000000001', '横柄', false, 4);

-- Q14: PARAPHRASE 即座に (正答=直ちに, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10014-0000-0000-0000-000000000001', 'ゆっくりと', false, 1),
('aee10014-0000-0000-0000-000000000001', '直ちに', true, 2),
('aee10014-0000-0000-0000-000000000001', 'じっくりと', false, 3),
('aee10014-0000-0000-0000-000000000001', '慎重に', false, 4);

-- Q15: PARAPHRASE 見込みが薄い (正答=望みが少ない, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10015-0000-0000-0000-000000000001', '確実だ', false, 1),
('aee10015-0000-0000-0000-000000000001', '期待できる', false, 2),
('aee10015-0000-0000-0000-000000000001', '望みが少ない', true, 3),
('aee10015-0000-0000-0000-000000000001', '問題ない', false, 4);

-- Q16: PARAPHRASE 明瞭で (正答=明快で, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10016-0000-0000-0000-000000000001', '曖昧で', false, 1),
('aee10016-0000-0000-0000-000000000001', '複雑で', false, 2),
('aee10016-0000-0000-0000-000000000001', '抽象的で', false, 3),
('aee10016-0000-0000-0000-000000000001', '明快で', true, 4);

-- Q17: PARAPHRASE 巧みに (正答=上手に, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10017-0000-0000-0000-000000000001', '上手に', true, 1),
('aee10017-0000-0000-0000-000000000001', '強引に', false, 2),
('aee10017-0000-0000-0000-000000000001', '無理やり', false, 3),
('aee10017-0000-0000-0000-000000000001', '偶然', false, 4);

-- Q18: PARAPHRASE 冷静沈着に (正答=落ち着いて, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10018-0000-0000-0000-000000000001', 'あわてて', false, 1),
('aee10018-0000-0000-0000-000000000001', '落ち着いて', true, 2),
('aee10018-0000-0000-0000-000000000001', '怒りながら', false, 3),
('aee10018-0000-0000-0000-000000000001', '悲しんで', false, 4);

-- Q19: PARAPHRASE 看過できない (正答=見逃すことはできない, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10019-0000-0000-0000-000000000001', '無視してもいい', false, 1),
('aee10019-0000-0000-0000-000000000001', '問題ではない', false, 2),
('aee10019-0000-0000-0000-000000000001', '見逃すことはできない', true, 3),
('aee10019-0000-0000-0000-000000000001', '放置してかまわない', false, 4);

-- Q20: WORD_USAGE あいにく (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10020-0000-0000-0000-000000000001', '彼女はあいにく試験に合格し、家族全員が喜んだ。', false, 1),
('aee10020-0000-0000-0000-000000000001', 'あいにく、今日は天気がよくてお出かけ日和だ。', false, 2),
('aee10020-0000-0000-0000-000000000001', '彼はあいにく料理が得意で、毎日手作りの食事を楽しんでいる。', false, 3),
('aee10020-0000-0000-0000-000000000001', 'あいにく担当者が外出中でして、折り返しご連絡いたします。', true, 4);

-- Q21: WORD_USAGE 払拭 (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10021-0000-0000-0000-000000000001', '新しい取り組みによって、製品への不信感を払拭することができた。', true, 1),
('aee10021-0000-0000-0000-000000000001', '彼女は幼い頃の記憶を払拭して、昔のことを詳しく思い出した。', false, 2),
('aee10021-0000-0000-0000-000000000001', 'その会社は利益を払拭して、さらに収益を増やした。', false, 3),
('aee10021-0000-0000-0000-000000000001', '彼は新しいプロジェクトを払拭して、積極的に参加することにした。', false, 4);

-- Q22: WORD_USAGE 懸念 (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10022-0000-0000-0000-000000000001', '彼女は旅行が決まり、出発を懸念して毎日準備に追われた。', false, 1),
('aee10022-0000-0000-0000-000000000001', '専門家たちは新技術の安全性について深刻な懸念を示した。', true, 2),
('aee10022-0000-0000-0000-000000000001', '子どもたちは遠足を懸念して、前の夜から眠れなかった。', false, 3),
('aee10022-0000-0000-0000-000000000001', 'プロジェクトが成功し、チーム全員が懸念に包まれた。', false, 4);

-- Q23: WORD_USAGE 逡巡 (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10023-0000-0000-0000-000000000001', '彼は逡巡することなく、すぐに意見を述べた。', false, 1),
('aee10023-0000-0000-0000-000000000001', '彼女は逡巡して、楽しい旅行の計画を立てた。', false, 2),
('aee10023-0000-0000-0000-000000000001', '大切な決断を前に、彼はしばらく逡巡した後、ようやく答えを出した。', true, 3),
('aee10023-0000-0000-0000-000000000001', 'チームのリーダーとして、彼は逡巡してプロジェクトを率いた。', false, 4);

-- Q24: WORD_USAGE 端緒 (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10024-0000-0000-0000-000000000001', '長年の研究が端緒を迎え、ついに成果が発表された。', false, 1),
('aee10024-0000-0000-0000-000000000001', '彼は端緒なく成功を収め、周囲を驚かせた。', false, 2),
('aee10024-0000-0000-0000-000000000001', '問題が解決されて端緒となり、みんながほっとした。', false, 3),
('aee10024-0000-0000-0000-000000000001', 'この偶然の出会いが、二人の長い友情の端緒となった。', true, 4);

-- Q25: WORD_USAGE 一概に (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10025-0000-0000-0000-000000000001', '新しい制度が一概に良いとは言えないため、慎重な検討が必要だ。', true, 1),
('aee10025-0000-0000-0000-000000000001', '彼女は一概に料理が得意で、どんな料理も上手に作れる。', false, 2),
('aee10025-0000-0000-0000-000000000001', '一概に、そのプロジェクトは大成功だった。', false, 3),
('aee10025-0000-0000-0000-000000000001', '彼は一概に物事を判断し、すぐに答えを出した。', false, 4);

-- Q26: GRAMMAR_CHOICE ところで (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10026-0000-0000-0000-000000000001', 'だけに', false, 1),
('aee10026-0000-0000-0000-000000000001', 'ところで', true, 2),
('aee10026-0000-0000-0000-000000000001', 'とあれば', false, 3),
('aee10026-0000-0000-0000-000000000001', 'にしても', false, 4);

-- Q27: GRAMMAR_CHOICE ともあろう (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10027-0000-0000-0000-000000000001', 'にしては', false, 1),
('aee10027-0000-0000-0000-000000000001', 'だけあって', false, 2),
('aee10027-0000-0000-0000-000000000001', 'ともあろう者が', true, 3),
('aee10027-0000-0000-0000-000000000001', 'にもかかわらず', false, 4);

-- Q28: GRAMMAR_CHOICE すべく (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10028-0000-0000-0000-000000000001', 'からこそ', false, 1),
('aee10028-0000-0000-0000-000000000001', 'とはいえ', false, 2),
('aee10028-0000-0000-0000-000000000001', 'ゆえに', false, 3),
('aee10028-0000-0000-0000-000000000001', 'すべく', true, 4);

-- Q29: GRAMMAR_CHOICE に起因して (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10029-0000-0000-0000-000000000001', 'に起因して', true, 1),
('aee10029-0000-0000-0000-000000000001', 'をもとに', false, 2),
('aee10029-0000-0000-0000-000000000001', 'に即して', false, 3),
('aee10029-0000-0000-0000-000000000001', 'をめぐって', false, 4);

-- Q30: GRAMMAR_CHOICE の礎に (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10030-0000-0000-0000-000000000001', 'の核心に', false, 1),
('aee10030-0000-0000-0000-000000000001', 'の礎に', true, 2),
('aee10030-0000-0000-0000-000000000001', 'の焦点に', false, 3),
('aee10030-0000-0000-0000-000000000001', 'の指針に', false, 4);

-- Q31: GRAMMAR_CHOICE 今となっては (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10031-0000-0000-0000-000000000001', 'それはともかく', false, 1),
('aee10031-0000-0000-0000-000000000001', 'そのうえ', false, 2),
('aee10031-0000-0000-0000-000000000001', '今となっては', true, 3),
('aee10031-0000-0000-0000-000000000001', 'むしろ', false, 4);

-- Q32: GRAMMAR_CHOICE をとおして (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10032-0000-0000-0000-000000000001', 'を踏まえて', false, 1),
('aee10032-0000-0000-0000-000000000001', 'をよそに', false, 2),
('aee10032-0000-0000-0000-000000000001', 'を皮切りに', false, 3),
('aee10032-0000-0000-0000-000000000001', 'をとおして', true, 4);

-- Q33: GRAMMAR_CHOICE 信条 (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10033-0000-0000-0000-000000000001', '信条', true, 1),
('aee10033-0000-0000-0000-000000000001', '目安', false, 2),
('aee10033-0000-0000-0000-000000000001', '目標', false, 3),
('aee10033-0000-0000-0000-000000000001', '課題', false, 4);

-- Q34: GRAMMAR_CHOICE につれて (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10034-0000-0000-0000-000000000001', 'のみならず', false, 1),
('aee10034-0000-0000-0000-000000000001', 'につれて', true, 2),
('aee10034-0000-0000-0000-000000000001', 'にもかかわらず', false, 3),
('aee10034-0000-0000-0000-000000000001', 'を契機として', false, 4);

-- Q35: GRAMMAR_CHOICE とは (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10035-0000-0000-0000-000000000001', 'に及んで', false, 1),
('aee10035-0000-0000-0000-000000000001', 'だからこそ', false, 2),
('aee10035-0000-0000-0000-000000000001', 'とは', true, 3),
('aee10035-0000-0000-0000-000000000001', 'ものの', false, 4);

-- Q36: SENTENCE_ORDER ★=される (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10036-0000-0000-0000-000000000001', 'に値する', false, 1),
('aee10036-0000-0000-0000-000000000001', '称賛', false, 2),
('aee10036-0000-0000-0000-000000000001', '並々ならぬ', false, 3),
('aee10036-0000-0000-0000-000000000001', 'される', true, 4);

-- Q37: SENTENCE_ORDER ★=かと言って (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10037-0000-0000-0000-000000000001', 'かと言って', true, 1),
('aee10037-0000-0000-0000-000000000001', '簡単に', false, 2),
('aee10037-0000-0000-0000-000000000001', '解決できる', false, 3),
('aee10037-0000-0000-0000-000000000001', '放置していい', false, 4);

-- Q38: SENTENCE_ORDER ★=ためらわず (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10038-0000-0000-0000-000000000001', 'いかなる', false, 1),
('aee10038-0000-0000-0000-000000000001', 'ためらわず', true, 2),
('aee10038-0000-0000-0000-000000000001', '困難にも', false, 3),
('aee10038-0000-0000-0000-000000000001', '断行を', false, 4);

-- Q39: SENTENCE_ORDER ★=ことを (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10039-0000-0000-0000-000000000001', '責任を取る', false, 1),
('aee10039-0000-0000-0000-000000000001', '自らの意思で', false, 2),
('aee10039-0000-0000-0000-000000000001', 'ことを', true, 3),
('aee10039-0000-0000-0000-000000000001', '辞職する', false, 4);

-- Q40: SENTENCE_ORDER ★=十分に (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10040-0000-0000-0000-000000000001', '限られている', false, 1),
('aee10040-0000-0000-0000-000000000001', '実行可能な', false, 2),
('aee10040-0000-0000-0000-000000000001', 'にもかかわらず', false, 3),
('aee10040-0000-0000-0000-000000000001', '十分に', true, 4);

-- Q41: TEXT_GRAMMAR にともない (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10041-0000-0000-0000-000000000001', 'にともない', true, 1),
('aee10041-0000-0000-0000-000000000001', 'をきっかけに', false, 2),
('aee10041-0000-0000-0000-000000000001', 'にもかかわらず', false, 3),
('aee10041-0000-0000-0000-000000000001', 'をめぐって', false, 4);

-- Q42: TEXT_GRAMMAR を踏まえて (正答=sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10042-0000-0000-0000-000000000001', 'よそに', false, 1),
('aee10042-0000-0000-0000-000000000001', '踏まえて', true, 2),
('aee10042-0000-0000-0000-000000000001', 'さかのぼって', false, 3),
('aee10042-0000-0000-0000-000000000001', 'もとに', false, 4);

-- Q43: TEXT_GRAMMAR 看過できない (正答=sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10043-0000-0000-0000-000000000001', '些細な', false, 1),
('aee10043-0000-0000-0000-000000000001', '解決済みの', false, 2),
('aee10043-0000-0000-0000-000000000001', '看過できない', true, 3),
('aee10043-0000-0000-0000-000000000001', '論じるまでもない', false, 4);

-- Q44: TEXT_GRAMMAR 反面 (正答=sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10044-0000-0000-0000-000000000001', 'おかげで', false, 1),
('aee10044-0000-0000-0000-000000000001', 'ために', false, 2),
('aee10044-0000-0000-0000-000000000001', '以上', false, 3),
('aee10044-0000-0000-0000-000000000001', '反面', true, 4);

-- Q45: TEXT_GRAMMAR にもまして (正答=sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('aee10045-0000-0000-0000-000000000001', 'にもまして', true, 1),
('aee10045-0000-0000-0000-000000000001', 'に加えて', false, 2),
('aee10045-0000-0000-0000-000000000001', 'に反して', false, 3),
('aee10045-0000-0000-0000-000000000001', 'をもとに', false, 4);
