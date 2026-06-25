-- JLPT N1 模擬試験 言語知識（文字・語彙・文法） Set 1
-- quiz_id: ad000001-0000-0000-0000-000000000111
-- 45問: KANJI_READING×6, CONTEXT_WORD×7, PARAPHRASE×6, WORD_USAGE×6, GRAMMAR_CHOICE×10, SENTENCE_ORDER×5, TEXT_GRAMMAR×5

-- ============================================================
-- quiz_questions (45問)
-- ============================================================

-- 問題1: KANJI_READING (Q1-Q6)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10001-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼の論文は【斬新】な視点で書かれており、学会で高く評価された。',
 'vocabulary', 'KANJI_READING', true, 1, 1,
 '「斬新」は「ざんしん」と読む。「今までにない新しさ」を意味するN1レベルの重要語彙。「せんしん」「しんさ」「ざんき」はいずれも誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10002-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

この政策は国民の福祉を【蔑ろ】にしていると批判されている。',
 'vocabulary', 'KANJI_READING', true, 1, 2,
 '「蔑ろ」は「ないがしろ」と読む。「軽視すること・大切にしないこと」を意味する。「みくだり」「おとしめ」「なおざり」は意味が近いものもあるが読みとして誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10003-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼女は困難な状況でも【泰然自若】として振る舞った。',
 'vocabulary', 'KANJI_READING', true, 1, 3,
 '「泰然自若」は「たいぜんじじゃく」と読む。「落ち着き払って動じない様子」を意味する四字熟語。「じにゃく」「だいぜん」などは誤読。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10004-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

長年の研究が実を結び、その業績は後世に【顕彰】された。',
 'vocabulary', 'KANJI_READING', true, 1, 4,
 '「顕彰」は「けんしょう」と読む。「功績や善行などを広く世間に知らせ表彰すること」を意味する。「けいしょう」「きょうしょう」「けんちょう」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10005-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼の発言は問題の本質を【衝い】ており、参加者全員が沈黙した。',
 'vocabulary', 'KANJI_READING', true, 1, 5,
 '「衝い」は「つい」と読む（衝く→衝いて）。「核心をついた」という意味で使われる。「さい」「つき」「せい」はすべて誤り。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10006-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の漢字の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

その老人は【往年】の栄光を懐かしみ、目を細めた。',
 'vocabulary', 'KANJI_READING', true, 1, 6,
 '「往年」は「おうねん」と読む。「過ぎ去った年月・昔」を意味する。「きゅうねん」「こうねん」「じゅうねん」はすべて誤り。');

-- 問題2: CONTEXT_WORD (Q7-Q13)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10007-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼の演説は感情的で、聴衆の（　　）を引いた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 1,
 '感情的な演説が聴衆に「共感」を引き起こしたという文脈が自然。「怒り」「反発」は否定的すぎ、「混乱」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10008-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女の意見は（　　）であり、誰もが納得した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 2,
 '「誰もが納得した」という結果から、「的を射た（正確に要点をついた）」意見だったと分かる。「的外れ」「曖昧」「偏った」は納得を生む意見にはならない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10009-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新しいシステムの導入により、業務の（　　）が大幅に向上した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 3,
 'システム導入で「向上した」のは業務の「効率」が最も自然。「負担」「混乱」「停滞」はシステム導入のメリットとして矛盾する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10010-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は自分の過ちを認め、真摯に（　　）した。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 4,
 '「過ちを認め」「真摯に」という文脈には「謝罪」が最適。「弁解」は言い訳、「反論」は否定、「回避」は逃げることで文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10011-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

その報告書には多くの（　　）が含まれており、再確認が必要だ。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 5,
 '「再確認が必要」という文脈から問題点が含まれているはず。「誤謬（ごびゅう）」＝誤り・間違いが最適。「正確さ」「詳細」は再確認不要、「抜粋」は意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10012-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

交渉は（　　）に終わり、双方が合意に至った。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 6,
 '「双方が合意に至った」という肯定的な結果から「円満」が正解。「紛糾」「決裂」「難航」はいずれも交渉がうまくいかない状況を指す。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10013-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女の才能は幼少期から（　　）しており、将来を嘱望されていた。',
 'vocabulary', 'CONTEXT_WORD', true, 1, 7,
 '「将来を嘱望されていた」という文脈に合うのは「頭角を現（す）」＝才能や実力が際立って目立つこと。「影を潜め」「鳴りを潜め」は目立たなくなること、「陰を落とし」は暗い影響を与えること。');

-- 問題3: PARAPHRASE (Q14-Q19)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10014-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼の提案は【一石二鳥】の妙案だった。',
 'vocabulary', 'PARAPHRASE', true, 1, 1,
 '「一石二鳥」は英語の「kill two birds with one stone」に相当する慣用表現で、「一つの行動で二つの利益を得ること」を意味する。他の選択肢は意味が異なる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10015-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼女はこの件について【口をつぐんでいる】。',
 'vocabulary', 'PARAPHRASE', true, 1, 2,
 '「口をつぐむ」は「口を閉じて何も言わない」という意味の慣用句。「何も言おうとしない」が正解。積極的な発言や嘘・誇張とは無関係。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10016-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

計画が【頓挫】してしまった。',
 'vocabulary', 'PARAPHRASE', true, 1, 3,
 '「頓挫（とんざ）」は「物事が途中で行き詰まって進まなくなること」を意味する。「途中で挫折・中断すること」が正解。予定通り進んだり成功したりとは正反対の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10017-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼は【腹に一物ある】様子だ。',
 'vocabulary', 'PARAPHRASE', true, 1, 4,
 '「腹に一物ある（はらにいちもつある）」は「表面には出さないが、心の中に何か企みや考えを持っている」という意味の慣用句。体調や勇気・食欲とは無関係。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10018-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

その映画は【賛否両論】を呼んだ。',
 'vocabulary', 'PARAPHRASE', true, 1, 5,
 '「賛否両論（さんぴりょうろん）」は「賛成の意見と反対の意見が両方あること」を意味する四字熟語。全員賛成や全員反対、意見の一致とは正反対の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10019-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の下線部の意味として最もよいものを、１・２・３・４から一つ選びなさい。

彼は問題を【うやむや】にしようとした。',
 'vocabulary', 'PARAPHRASE', true, 1, 6,
 '「うやむや」は「物事がはっきりしないこと・曖昧なまま有耶無耶にすること」を意味する。深刻に考えることや完全解決・逃げることとは意味が異なる。');

-- 問題4: WORD_USAGE (Q20-Q25)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10020-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「憂慮」',
 'vocabulary', 'WORD_USAGE', true, 1, 1,
 '「憂慮（ゆうりょ）」は「心配・危惧すること」を意味する。地球温暖化という深刻な問題を心配する文脈が正しい使い方。成功や回復・遠足などポジティブな状況には使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10021-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「逸脱」',
 'vocabulary', 'WORD_USAGE', true, 1, 2,
 '「逸脱（いつだつ）」は「規範・基準などから外れること」を意味する。会社の規範から外れた行動という文脈が正しい。目的地への到着や目標達成、問題解消は逸脱の用法として不自然。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10022-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「折衷」',
 'vocabulary', 'WORD_USAGE', true, 1, 3,
 '「折衷（せっちゅう）」は「複数の異なる意見や方式を組み合わせて、中間的な案をとること」を意味する。二つの意見の中間案を見つける文脈が正しい。一人での決断や意見を貫く行動には使わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10023-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「払拭」',
 'vocabulary', 'WORD_USAGE', true, 1, 4,
 '「払拭（ふっしょく）」は「悪いものや不安・疑念などを完全に取り除くこと」を意味する。不信感を取り除く文脈が正しい。借金を増やす・記憶を思い出す・問題を深刻にするは正反対の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10024-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「凌駕」',
 'vocabulary', 'WORD_USAGE', true, 1, 5,
 '「凌駕（りょうが）」は「他のものより優れて、その上を行くこと」を意味する。他の選手を上回る技術という文脈が正しい。成績が下がる・試合に負ける・競合他社に追い越されるは逆の意味になる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10025-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の語の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「端緒」',
 'vocabulary', 'WORD_USAGE', true, 1, 6,
 '「端緒（たんしょ）」は「物事の始まり・きっかけ」を意味する。新しい治療法開発のきっかけになったという文脈が正しい。「端緒なく」「端緒に解決」「端緒として諦める」はいずれも不自然な用法。');

-- 問題5: GRAMMAR_CHOICE (Q26-Q35)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10026-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は試験に合格した（　　）、努力を惜しまなかった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 1,
 '「合格したにもかかわらず、努力を惜しまなかった」＝合格しても満足せずさらに努力し続けたという逆接の意味。「にもかかわらず」が正解。「だけあって」「からこそ」「おかげで」は順接になる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10027-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

社長（　　）、この決定に反対できる者はいない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 2,
 '「社長ともなると」＝社長という地位・立場になると（そういう立場の人なら当然）という意味。高い地位の人の権威を表すのに適切。「にしては」「のわりに」「にしても」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10028-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は約束の時間を過ぎても来ない。もしかしたら忘れたの（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 3,
 '「ではなかろうか」は「〜ではないだろうか」の改まった形で、不確かな推量を表す。「もしかしたら」と呼応して自然な推量表現になる。他の選択肢は断定的すぎて「もしかしたら」と合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10029-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

その事件は単なる偶然（　　）、背後に何らかの意図があるに違いない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 4,
 '「とは言い切れず」＝偶然とは断言できないという意味。後半の「背後に意図がある」と自然につながる。「でしかなく」は断定、「であるために」「にほかならず」も文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10030-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新入社員（　　）、そんな難しい仕事を任されるとは思わなかった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 5,
 '「新入社員ながらも」＝新入社員であるにもかかわらず（という逆接）。新入社員という立場なのに難しい仕事を任されたという驚きを表す。「にしては」も可能に見えるが「ながらも」が逆接の意味をより強調する。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10031-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

あの映画は一度見た（　　）忘れられない名作だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 6,
 '「〜たきり」は「〜してからずっとその状態が続く」という意味。「一度見たきり忘れられない」＝見て以来ずっと忘れられないという意味で自然。「が最後」は否定的な文脈、「を限りに」「とたん」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10032-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼の実力（　　）、今回の失敗は本当に残念だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 7,
 '「実力からすれば」＝実力を基準に判断すれば、という意味。実力があるはずなのに失敗したという残念な気持ちを表す。「のわりに」「にしては」は実力に比べて結果が良い/悪いという比較に使い、「にもまして」は比較の意味。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10033-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女はどんな困難（　　）、笑顔を失わない強い人だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 8,
 '「どんな困難に直面しようとも」＝どんな困難があっても（という強い逆接）。「〜しようとも」はN1文法で「たとえ〜しても」という意味。「に際して」「を通じて」「に応じて」は逆接にならない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10034-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長年の研究の末、ようやく成果が出た。研究者たちの喜びは（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 9,
 '「いかばかりか」は「どれほどのものか（言葉では言い表せないほど大きい）」という意味の書き言葉的表現。N1レベルの重要文型。「いかなるものか」「どれほどのことか」「いかほどか」も近いが、文語的表現として「いかばかりか」が最も適切。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10035-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

問題が複雑である（　　）、すぐに解決策を見つけるのは難しい。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 10,
 '「複雑であるがゆえに」＝複雑であるからこそ（原因・理由を強調）。「〜がゆえに」はN1文法で書き言葉的な原因を表す。「のもとに」は条件、「からには」は決意、「にしたがい」は変化に伴いという意味で文脈に合わない。');

-- 問題6: SENTENCE_ORDER (Q36-Q40)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10036-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼女は　＿＿　＿＿　★　＿＿　驚いた。
①まさか　②とは　③思わなかった　④彼が来る

★に入るものを選びなさい。',
 'grammar', 'SENTENCE_ORDER', true, 1, 1,
 '正しい語順は「まさか→彼が来る→とは→思わなかった→驚いた」。「まさか～とは思わなかった」という慣用的な驚きの表現。★は3番目の位置なので「とは」が入る。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10037-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

環境問題は　＿＿　＿＿　★　＿＿　課題だ。
①一国　②解決できる　③だけで　④には

★に入るものを選びなさい。',
 'grammar', 'SENTENCE_ORDER', true, 1, 2,
 '正しい語順は「一国→だけで→には→解決できる→課題だ」。「一国だけでには解決できない課題だ」という構造。「一国だけで（は）解決できない」という否定を含む自然な文。★は3番目の位置なので「には」が入る。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10038-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

失敗を　＿＿　＿＿　★　＿＿　が大切だ。
①恐れず　②チャレンジ　③する　④こと

★に入るものを選びなさい。',
 'grammar', 'SENTENCE_ORDER', true, 1, 3,
 '正しい語順は「恐れず→チャレンジ→する→こと→が大切だ」。「失敗を恐れずチャレンジすることが大切だ」という自然な文。★は3番目の位置なので「する」が入る。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10039-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

この問題は　＿＿　＿＿　★　＿＿　でもない。
①解決できる　②かと言って　③簡単に　④放置できる

★に入るものを選びなさい。',
 'grammar', 'SENTENCE_ORDER', true, 1, 4,
 '正しい語順は「簡単に→解決できる→かと言って→放置できる→でもない」。「簡単に解決できるかと言って放置できるでもない」という複雑な否定文。★は3番目の位置なので「かと言って」が入る。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10040-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼は　＿＿　＿＿　★　＿＿　ことにした。
①責任を　②とって　③自ら　④辞職する

★に入るものを選びなさい。',
 'grammar', 'SENTENCE_ORDER', true, 1, 5,
 '正しい語順は「自ら→責任を→とって→辞職する→ことにした」。「自ら責任をとって辞職することにした」という自然な文。★は3番目の位置なので「とって」が入る。');

-- 問題7: TEXT_GRAMMAR (Q41-Q45)
INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10041-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文章を読んで、（41）から（43）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会において、情報リテラシーは非常に重要なスキルとなっている。インターネットの普及（41）、誰もが大量の情報に（42）ようになった。しかし、その情報が正確かどうかを見極める能力（43）身につけなければ、誤った情報に惑わされることになりかねない。

上の文章の（41）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 1,
 '「インターネットの普及にともない」＝普及と同時に変化が起きたことを表す。「〜にともない/にともなって」は変化・進行に伴って別の変化が起きることを表すN1文法。「をもとに」「にかかわらず」「をはじめ」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10042-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文章を読んで、（41）から（43）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会において、情報リテラシーは非常に重要なスキルとなっている。インターネットの普及（41）、誰もが大量の情報に（42）ようになった。しかし、その情報が正確かどうかを見極める能力（43）身につけなければ、誤った情報に惑わされることになりかねない。

上の文章の（42）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 2,
 '「情報にアクセスできるようになった」が最も自然。インターネット普及により誰でも情報にアクセスできるようになったという文脈。「距離を置ける」「縁遠くなる」「遮断される」はすべて逆の意味になる。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10043-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文章を読んで、（41）から（43）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会において、情報リテラシーは非常に重要なスキルとなっている。インターネットの普及（41）、誰もが大量の情報に（42）ようになった。しかし、その情報が正確かどうかを見極める能力（43）身につけなければ、誤った情報に惑わされることになりかねない。

上の文章の（43）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 3,
 '「能力こそ身につけなければ」＝その能力を特に強調して「まさにその能力を身につけることが必要」という意味。「こそ」は強調の助詞でここでは「〜こそ〜なければ」という形で条件を強調する。「さえ」「ばかり」「でも」は文脈に合わない。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10044-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文章を読んで、（44）と（45）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

昨今、若者の活字離れが（44）。本を読む習慣を持つ若者が減少しているという現実は、教育関係者にとって（45）問題と言えるだろう。

上の文章の（44）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 4,
 '「活字離れが指摘されている」＝活字離れという問題が専門家や関係者によって問題として取り上げられているという意味。「解消されている」「推進されている」「評価されている」は文脈と逆の意味または無関係。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade10045-0000-0000-0000-000000000000', 'ad000001-0000-0000-0000-000000000111', 'multiple_choice',
 '次の文章を読んで、（44）と（45）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

昨今、若者の活字離れが（44）。本を読む習慣を持つ若者が減少しているという現実は、教育関係者にとって（45）問題と言えるだろう。

上の文章の（45）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 5,
 '「看過できない（かんかできない）」＝見て見ぬふりができない・見逃せない重大な問題という意味。教育関係者が深刻に受け止めるべき問題という文脈に合う。「解決済みの」「些細な」「無関係な」は文脈に合わない。');

-- ============================================================
-- quiz_question_options (180選択肢)
-- ============================================================

-- Q1: KANJI_READING 斬新 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10001-0000-0000-0000-000000000000', 'ざんしん', true, 1),
('ade10001-0000-0000-0000-000000000000', 'せんしん', false, 2),
('ade10001-0000-0000-0000-000000000000', 'しんさ', false, 3),
('ade10001-0000-0000-0000-000000000000', 'ざんき', false, 4);

-- Q2: KANJI_READING 蔑ろ (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10002-0000-0000-0000-000000000000', 'みくだり', false, 1),
('ade10002-0000-0000-0000-000000000000', 'ないがしろ', true, 2),
('ade10002-0000-0000-0000-000000000000', 'おとしめ', false, 3),
('ade10002-0000-0000-0000-000000000000', 'なおざり', false, 4);

-- Q3: KANJI_READING 泰然自若 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10003-0000-0000-0000-000000000000', 'たいぜんじじゃく', true, 1),
('ade10003-0000-0000-0000-000000000000', 'たいねんじにゃく', false, 2),
('ade10003-0000-0000-0000-000000000000', 'たいぜんじにゃく', false, 3),
('ade10003-0000-0000-0000-000000000000', 'だいぜんじじゃく', false, 4);

-- Q4: KANJI_READING 顕彰 (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10004-0000-0000-0000-000000000000', 'けいしょう', false, 1),
('ade10004-0000-0000-0000-000000000000', 'けんしょう', true, 2),
('ade10004-0000-0000-0000-000000000000', 'きょうしょう', false, 3),
('ade10004-0000-0000-0000-000000000000', 'けんちょう', false, 4);

-- Q5: KANJI_READING 衝い (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10005-0000-0000-0000-000000000000', 'さい', false, 1),
('ade10005-0000-0000-0000-000000000000', 'つい', true, 2),
('ade10005-0000-0000-0000-000000000000', 'つき', false, 3),
('ade10005-0000-0000-0000-000000000000', 'せい', false, 4);

-- Q6: KANJI_READING 往年 (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10006-0000-0000-0000-000000000000', 'きゅうねん', false, 1),
('ade10006-0000-0000-0000-000000000000', 'おうねん', true, 2),
('ade10006-0000-0000-0000-000000000000', 'こうねん', false, 3),
('ade10006-0000-0000-0000-000000000000', 'じゅうねん', false, 4);

-- Q7: CONTEXT_WORD 共感 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10007-0000-0000-0000-000000000000', '怒り', false, 1),
('ade10007-0000-0000-0000-000000000000', '反発', false, 2),
('ade10007-0000-0000-0000-000000000000', '共感', true, 3),
('ade10007-0000-0000-0000-000000000000', '混乱', false, 4);

-- Q8: CONTEXT_WORD 的を射た (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10008-0000-0000-0000-000000000000', '的外れ', false, 1),
('ade10008-0000-0000-0000-000000000000', '曖昧', false, 2),
('ade10008-0000-0000-0000-000000000000', '偏った', false, 3),
('ade10008-0000-0000-0000-000000000000', '的を射た', true, 4);

-- Q9: CONTEXT_WORD 効率 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10009-0000-0000-0000-000000000000', '効率', true, 1),
('ade10009-0000-0000-0000-000000000000', '負担', false, 2),
('ade10009-0000-0000-0000-000000000000', '混乱', false, 3),
('ade10009-0000-0000-0000-000000000000', '停滞', false, 4);

-- Q10: CONTEXT_WORD 謝罪 (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10010-0000-0000-0000-000000000000', '弁解', false, 1),
('ade10010-0000-0000-0000-000000000000', '謝罪', true, 2),
('ade10010-0000-0000-0000-000000000000', '反論', false, 3),
('ade10010-0000-0000-0000-000000000000', '回避', false, 4);

-- Q11: CONTEXT_WORD 誤謬 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10011-0000-0000-0000-000000000000', '正確さ', false, 1),
('ade10011-0000-0000-0000-000000000000', '詳細', false, 2),
('ade10011-0000-0000-0000-000000000000', '誤謬', true, 3),
('ade10011-0000-0000-0000-000000000000', '抜粋', false, 4);

-- Q12: CONTEXT_WORD 円満 (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10012-0000-0000-0000-000000000000', '紛糾', false, 1),
('ade10012-0000-0000-0000-000000000000', '決裂', false, 2),
('ade10012-0000-0000-0000-000000000000', '難航', false, 3),
('ade10012-0000-0000-0000-000000000000', '円満', true, 4);

-- Q13: CONTEXT_WORD 頭角を現 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10013-0000-0000-0000-000000000000', '頭角を現', true, 1),
('ade10013-0000-0000-0000-000000000000', '影を潜め', false, 2),
('ade10013-0000-0000-0000-000000000000', '鳴りを潜め', false, 3),
('ade10013-0000-0000-0000-000000000000', '陰を落とし', false, 4);

-- Q14: PARAPHRASE 一石二鳥 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10014-0000-0000-0000-000000000000', '一つの行動で二つの利益を得ること', true, 1),
('ade10014-0000-0000-0000-000000000000', '二つの問題を同時に解決できないこと', false, 2),
('ade10014-0000-0000-0000-000000000000', '一つの問題が次々と広がること', false, 3),
('ade10014-0000-0000-0000-000000000000', '努力が無駄に終わること', false, 4);

-- Q15: PARAPHRASE 口をつぐんでいる (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10015-0000-0000-0000-000000000000', '積極的に発言している', false, 1),
('ade10015-0000-0000-0000-000000000000', '何も言おうとしない', true, 2),
('ade10015-0000-0000-0000-000000000000', '嘘をついている', false, 3),
('ade10015-0000-0000-0000-000000000000', '話を誇張している', false, 4);

-- Q16: PARAPHRASE 頓挫 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10016-0000-0000-0000-000000000000', '予定通り進んだ', false, 1),
('ade10016-0000-0000-0000-000000000000', '大成功を収めた', false, 2),
('ade10016-0000-0000-0000-000000000000', '途中で挫折・中断すること', true, 3),
('ade10016-0000-0000-0000-000000000000', '計画が変更された', false, 4);

-- Q17: PARAPHRASE 腹に一物ある (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10017-0000-0000-0000-000000000000', '体調が悪い', false, 1),
('ade10017-0000-0000-0000-000000000000', '心の中に何か隠している', true, 2),
('ade10017-0000-0000-0000-000000000000', '勇気がある', false, 3),
('ade10017-0000-0000-0000-000000000000', '食欲がある', false, 4);

-- Q18: PARAPHRASE 賛否両論 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10018-0000-0000-0000-000000000000', '全員が賛成した', false, 1),
('ade10018-0000-0000-0000-000000000000', '全員が反対した', false, 2),
('ade10018-0000-0000-0000-000000000000', '賛成と反対の意見が入り混じっていること', true, 3),
('ade10018-0000-0000-0000-000000000000', '意見が一致した', false, 4);

-- Q19: PARAPHRASE うやむや (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10019-0000-0000-0000-000000000000', 'はっきりしないまま、曖昧にすること', true, 1),
('ade10019-0000-0000-0000-000000000000', '問題を深刻に考えること', false, 2),
('ade10019-0000-0000-0000-000000000000', '問題を完全に解決すること', false, 3),
('ade10019-0000-0000-0000-000000000000', '問題から逃げること', false, 4);

-- Q20: WORD_USAGE 憂慮 (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10020-0000-0000-0000-000000000000', '彼は成功を収めて憂慮した。', false, 1),
('ade10020-0000-0000-0000-000000000000', '専門家たちは地球温暖化の進行を憂慮している。', true, 2),
('ade10020-0000-0000-0000-000000000000', '子どもたちは遠足を憂慮していた。', false, 3),
('ade10020-0000-0000-0000-000000000000', '彼女は友人の回復を憂慮して喜んだ。', false, 4);

-- Q21: WORD_USAGE 逸脱 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10021-0000-0000-0000-000000000000', '列車が逸脱して目的地に着いた。', false, 1),
('ade10021-0000-0000-0000-000000000000', '彼女は目標を逸脱して達成した。', false, 2),
('ade10021-0000-0000-0000-000000000000', '彼の行動は会社の規範から逸脱していた。', true, 3),
('ade10021-0000-0000-0000-000000000000', '計画通りに進んで逸脱が解消された。', false, 4);

-- Q22: WORD_USAGE 折衷 (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10022-0000-0000-0000-000000000000', '彼は折衷して一人で決断した。', false, 1),
('ade10022-0000-0000-0000-000000000000', 'この問題は折衷の余地がない。', false, 2),
('ade10022-0000-0000-0000-000000000000', '彼女は折衷を嫌い、自分の意見を貫いた。', false, 3),
('ade10022-0000-0000-0000-000000000000', '二つの意見の折衷案として、妥協点を見つけた。', true, 4);

-- Q23: WORD_USAGE 払拭 (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10023-0000-0000-0000-000000000000', '新しいリーダーは組織への不信感を払拭することに成功した。', true, 1),
('ade10023-0000-0000-0000-000000000000', '彼は借金を払拭して増やした。', false, 2),
('ade10023-0000-0000-0000-000000000000', '彼女は記憶を払拭して思い出した。', false, 3),
('ade10023-0000-0000-0000-000000000000', '困難を払拭して問題が深刻になった。', false, 4);

-- Q24: WORD_USAGE 凌駕 (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10024-0000-0000-0000-000000000000', '彼女の成績が下がり、ライバルを凌駕された。', false, 1),
('ade10024-0000-0000-0000-000000000000', '彼の技術は他の選手を凌駕するほど優れていた。', true, 2),
('ade10024-0000-0000-0000-000000000000', '彼は凌駕して試合に負けた。', false, 3),
('ade10024-0000-0000-0000-000000000000', 'その企業は競合他社に凌駕されて成長した。', false, 4);

-- Q25: WORD_USAGE 端緒 (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10025-0000-0000-0000-000000000000', '彼は端緒なく成功を収めた。', false, 1),
('ade10025-0000-0000-0000-000000000000', '問題が端緒に解決された。', false, 2),
('ade10025-0000-0000-0000-000000000000', 'この発見が新しい治療法開発の端緒となった。', true, 3),
('ade10025-0000-0000-0000-000000000000', '端緒として彼は計画を諦めた。', false, 4);

-- Q26: GRAMMAR_CHOICE にもかかわらず (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10026-0000-0000-0000-000000000000', 'だけあって', false, 1),
('ade10026-0000-0000-0000-000000000000', 'にもかかわらず', true, 2),
('ade10026-0000-0000-0000-000000000000', 'からこそ', false, 3),
('ade10026-0000-0000-0000-000000000000', 'おかげで', false, 4);

-- Q27: GRAMMAR_CHOICE ともなると (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10027-0000-0000-0000-000000000000', 'にしては', false, 1),
('ade10027-0000-0000-0000-000000000000', 'のわりに', false, 2),
('ade10027-0000-0000-0000-000000000000', 'ともなると', true, 3),
('ade10027-0000-0000-0000-000000000000', 'にしても', false, 4);

-- Q28: GRAMMAR_CHOICE ではなかろうか (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10028-0000-0000-0000-000000000000', 'にほかならない', false, 1),
('ade10028-0000-0000-0000-000000000000', 'というものだ', false, 2),
('ade10028-0000-0000-0000-000000000000', 'にすぎない', false, 3),
('ade10028-0000-0000-0000-000000000000', 'ではなかろうか', true, 4);

-- Q29: GRAMMAR_CHOICE とは言い切れず (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10029-0000-0000-0000-000000000000', 'とは言い切れず', true, 1),
('ade10029-0000-0000-0000-000000000000', 'でしかなく', false, 2),
('ade10029-0000-0000-0000-000000000000', 'であるために', false, 3),
('ade10029-0000-0000-0000-000000000000', 'にほかならず', false, 4);

-- Q30: GRAMMAR_CHOICE ながらも (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10030-0000-0000-0000-000000000000', 'にしては', false, 1),
('ade10030-0000-0000-0000-000000000000', 'ながらも', true, 2),
('ade10030-0000-0000-0000-000000000000', 'だからこそ', false, 3),
('ade10030-0000-0000-0000-000000000000', 'であるうえに', false, 4);

-- Q31: GRAMMAR_CHOICE きり (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10031-0000-0000-0000-000000000000', 'を限りに', false, 1),
('ade10031-0000-0000-0000-000000000000', 'が最後', false, 2),
('ade10031-0000-0000-0000-000000000000', 'きり', true, 3),
('ade10031-0000-0000-0000-000000000000', 'とたん', false, 4);

-- Q32: GRAMMAR_CHOICE からすれば (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10032-0000-0000-0000-000000000000', 'のわりに', false, 1),
('ade10032-0000-0000-0000-000000000000', 'にしては', false, 2),
('ade10032-0000-0000-0000-000000000000', 'にもまして', false, 3),
('ade10032-0000-0000-0000-000000000000', 'からすれば', true, 4);

-- Q33: GRAMMAR_CHOICE に直面しようとも (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10033-0000-0000-0000-000000000000', 'に直面しようとも', true, 1),
('ade10033-0000-0000-0000-000000000000', 'に際して', false, 2),
('ade10033-0000-0000-0000-000000000000', 'を通じて', false, 3),
('ade10033-0000-0000-0000-000000000000', 'に応じて', false, 4);

-- Q34: GRAMMAR_CHOICE いかばかりか (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10034-0000-0000-0000-000000000000', 'いかなるものか', false, 1),
('ade10034-0000-0000-0000-000000000000', 'いかばかりか', true, 2),
('ade10034-0000-0000-0000-000000000000', 'どれほどのことか', false, 3),
('ade10034-0000-0000-0000-000000000000', 'いかほどか', false, 4);

-- Q35: GRAMMAR_CHOICE がゆえに (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10035-0000-0000-0000-000000000000', 'のもとに', false, 1),
('ade10035-0000-0000-0000-000000000000', 'からには', false, 2),
('ade10035-0000-0000-0000-000000000000', 'がゆえに', true, 3),
('ade10035-0000-0000-0000-000000000000', 'にしたがい', false, 4);

-- Q36: SENTENCE_ORDER ★=とは (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10036-0000-0000-0000-000000000000', 'まさか', false, 1),
('ade10036-0000-0000-0000-000000000000', 'とは', true, 2),
('ade10036-0000-0000-0000-000000000000', '思わなかった', false, 3),
('ade10036-0000-0000-0000-000000000000', '彼が来る', false, 4);

-- Q37: SENTENCE_ORDER ★=には (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10037-0000-0000-0000-000000000000', '一国', false, 1),
('ade10037-0000-0000-0000-000000000000', '解決できる', false, 2),
('ade10037-0000-0000-0000-000000000000', 'だけで', false, 3),
('ade10037-0000-0000-0000-000000000000', 'には', true, 4);

-- Q38: SENTENCE_ORDER ★=する (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10038-0000-0000-0000-000000000000', '恐れず', false, 1),
('ade10038-0000-0000-0000-000000000000', 'チャレンジ', false, 2),
('ade10038-0000-0000-0000-000000000000', 'する', true, 3),
('ade10038-0000-0000-0000-000000000000', 'こと', false, 4);

-- Q39: SENTENCE_ORDER ★=かと言って (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10039-0000-0000-0000-000000000000', '解決できる', false, 1),
('ade10039-0000-0000-0000-000000000000', 'かと言って', true, 2),
('ade10039-0000-0000-0000-000000000000', '簡単に', false, 3),
('ade10039-0000-0000-0000-000000000000', '放置できる', false, 4);

-- Q40: SENTENCE_ORDER ★=とって (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10040-0000-0000-0000-000000000000', '責任を', false, 1),
('ade10040-0000-0000-0000-000000000000', 'とって', true, 2),
('ade10040-0000-0000-0000-000000000000', '自ら', false, 3),
('ade10040-0000-0000-0000-000000000000', '辞職する', false, 4);

-- Q41: TEXT_GRAMMAR blank 41 にともない (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10041-0000-0000-0000-000000000000', 'にともない', true, 1),
('ade10041-0000-0000-0000-000000000000', 'をもとに', false, 2),
('ade10041-0000-0000-0000-000000000000', 'にかかわらず', false, 3),
('ade10041-0000-0000-0000-000000000000', 'をはじめ', false, 4);

-- Q42: TEXT_GRAMMAR blank 42 アクセスできる (correct=3, sort_order 3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10042-0000-0000-0000-000000000000', '距離を置ける', false, 1),
('ade10042-0000-0000-0000-000000000000', '縁遠くなる', false, 2),
('ade10042-0000-0000-0000-000000000000', 'アクセスできる', true, 3),
('ade10042-0000-0000-0000-000000000000', '遮断される', false, 4);

-- Q43: TEXT_GRAMMAR blank 43 こそ (correct=4, sort_order 4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10043-0000-0000-0000-000000000000', 'さえ', false, 1),
('ade10043-0000-0000-0000-000000000000', 'ばかり', false, 2),
('ade10043-0000-0000-0000-000000000000', 'でも', false, 3),
('ade10043-0000-0000-0000-000000000000', 'こそ', true, 4);

-- Q44: TEXT_GRAMMAR blank 44 指摘されている (correct=2, sort_order 2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10044-0000-0000-0000-000000000000', '解消されている', false, 1),
('ade10044-0000-0000-0000-000000000000', '指摘されている', true, 2),
('ade10044-0000-0000-0000-000000000000', '推進されている', false, 3),
('ade10044-0000-0000-0000-000000000000', '評価されている', false, 4);

-- Q45: TEXT_GRAMMAR blank 45 看過できない (correct=1, sort_order 1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade10045-0000-0000-0000-000000000000', '看過できない', true, 1),
('ade10045-0000-0000-0000-000000000000', '解決済みの', false, 2),
('ade10045-0000-0000-0000-000000000000', '些細な', false, 3),
('ade10045-0000-0000-0000-000000000000', '無関係な', false, 4);
