-- JLPT N2 模擬試験 Set1 言語知識 文法（文法パート）
-- quiz_id: ad000002-0000-0000-0000-000000000211
-- 22問: GRAMMAR_CHOICE×12 (sort 33-44), SENTENCE_ORDER×5 (sort 45-49), TEXT_GRAMMAR×5 (sort 50-54)
-- 文字語彙エージェントが sort_order 1~32 を使用 → 本ファイルは 33~54 のみ

-- ============================================================
-- quiz_questions (22問)
-- ============================================================

-- 問題7: GRAMMAR_CHOICE (sort 33~44) — 文法形式の判断

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b033-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

練習を重ねる（　　）、彼女の演奏は見違えるほど上達した。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「練習を重ねるにつれて」= 연습을 거듭할수록. 「につれて」는 어떤 변화의 진행에 수반하여 다른 변화가 일어남을 나타내는 N2 문법. 「に対して」는 대비·대상, 「によって」는 수단·원인, 「にとって」는 평가 기준을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b034-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

上司に頼まれた仕事なので、途中で断る（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「断るわけにはいかない」= 거절할 수 없다. 「わけにはいかない」는 사회적·도덕적 이유로 ~할 수 없다는 의미. 상사의 부탁을 중간에 거절하는 것은 허용되지 않는다는 문맥. 「ことはできない」는 능력의 부재, 「はずがない」는 가능성 부정, 「ことにはならない」는 결과 부정을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b035-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

天候が急変したため、イベントを中止せ（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「中止せざるを得なかった」= 중단하지 않을 수 없었다. 「ざるを得ない」는 본의 아니게 ~하지 않을 수 없다는 의미로, 외부 사정에 의한 부득이한 상황을 표현. 「ずにはいられない」는 감정적 충동을 억제할 수 없음을 나타내며, 「なければならない」는 의무, 「ないわけにはいかない」는 이중부정으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b036-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

薬を飲んだ（　　）、なかなか熱が下がらない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 36,
 '「薬を飲んだものの」= 약을 먹기는 했지만. 「ものの」는 앞의 사실을 인정하면서도 뒤에서 기대에 어긋나는 결과를 나타내는 역접 표현(N2). 「からこそ」는 이유 강조(순접), 「だけあって」는 당연한 결과(순접), 「ために」는 원인·목적을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b037-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は仕事が速い（　　）、クオリティも高い。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 37,
 '「仕事が速いばかりか」= 일이 빠를 뿐만 아니라. 「ばかりか」는 「~일 뿐 아니라, 게다가」라는 의미로 긍정적 특징을 추가 열거할 때 사용하는 N2 문법. 「だけあって」는 「~답게, 당연히」, 「ものの」는 역접, 「といっても」는 한정·부분 부정을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b038-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

上司の指示（　　）、プロジェクトを進めてください。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 38,
 '「上司の指示にしたがって」= 상사의 지시에 따라. 「にしたがって」는 지시·규칙에 따르거나 변화에 수반함을 나타내는 N2 문법. 「につれて」는 자연스러운 변화 진행, 「によっては」는 조건에 따라 달라짐, 「に対して」는 대상·대립을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b039-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この問題（　　）は、専門家の意見を聞く必要がある。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 39,
 '「この問題に関しては」= 이 문제에 관해서는. 「に関して」는 특정 화제·주제에 대해 언급할 때 사용하는 N2 문법. 「にしては」는 기준에 대한 평가(~치고는), 「によっては」는 경우에 따라, 「に対しては」는 대립·반응·방향을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b040-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

アンケートの結果（　　）、新しいサービスを開発した。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 40,
 '「アンケートの結果をもとに」= 앙케트 결과를 바탕으로. 「をもとに」는 데이터나 정보를 근거·소재로 삼아 무언가를 행할 때 사용하는 N2 문법. 「に関して」는 화제, 「によって」는 수단·원인, 「にしたがって」는 지시·규칙에 따르는 것을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b041-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は何度注意しても、自分の行動を改める（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 41,
 '「改めようとしない」= 고치려 하지 않는다. 「ようとしない」는 의지적으로 ~하려 하지 않음을 나타내는 N2 문법으로, 거부 의사를 표현. 「わけではない」는 부분 부정(반드시 ~인 것은 아니다), 「ことができない」는 능력의 부재, 「ものではない」는 도덕적으로 해서는 안 됨을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b042-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

このままでは大きな事故になり（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 42,
 '「大きな事故になりかねない」= 큰 사고가 될 수도 있다. 「かねない」는 好ましくない 결과가 일어날 가능성이 있음을 나타내는 N2 문법(부정적 위험성). 「ようがない」는 방법이 없음(~할 방법이 없다), 「わけではない」는 부분 부정, 「はずがない」는 가능성 부정을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b043-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

専門家（　　）、すべてを知っているわけではない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 43,
 '「専門家とはいえ」= 전문가라고 해도. 「とはいえ」는 「그렇다고는 하나, 그래도」라는 의미의 역접 표현(N2)으로, 앞의 사실을 인정하면서도 그 기대에 반하는 내용을 제시. 「だけあって」는 당연한 결과(순접), 「としたら」는 가정, 「にとっては」는 평가 기준을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b044-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

経験（　　）、この仕事には専門知識も必要だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 44,
 '「経験に加えて」= 경험에 더하여. 「に加えて」는 「~에 추가하여, ~뿐 아니라」라는 의미로 기존 요소에 새로운 요소를 덧붙이는 N2 표현. 「に関して」는 화제(~에 관하여), 「に対して」는 대상·대립, 「によって」는 수단·원인을 나타낸다.');

-- 問題8: SENTENCE_ORDER (sort 45~49) — 文の組み立て（並べ替え ★）

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b045-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

あきらめる　＿＿＿　＿＿＿　★　＿＿＿　合格できた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 45,
 '正しい語順は「ことなく(②)→努力を(④)→続けた(③)→おかげで(①)」。完成文:「あきらめることなく努力を続けたおかげで合格できた」。「ことなく」는 「~하지 않고, ~함이 없이」라는 의미의 N2 문법. ★는 3번째 위치의 「続けた(③)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b046-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

悪天候　＿＿＿　＿＿＿　★　＿＿＿　試合は予定通り行われた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 46,
 '正しい語順は「にもかかわらず(④)→200人以上の(③)→観客が(②)→集まり(①)」。完成文:「悪天候にもかかわらず200人以上の観客が集まり試合は予定通り行われた」。「にもかかわらず」는 「~임에도 불구하고」라는 역접 표현(N2). ★는 3번째 위치의 「観客が(②)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b047-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

日本の映画を見た　＿＿＿　＿＿＿　★　＿＿＿　始めた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 47,
 '正しい語順は「をきっかけに(③)→日本語を(①)→本格的に(④)→勉強し(②)」。完成文:「日本の映画を見たをきっかけに日本語を本格的に勉強し始めた」。「をきっかけに」는 「~을 계기로」라는 의미의 N2 표현. ★는 3번째 위치의 「本格的に(④)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b048-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

十分に考えた　＿＿＿　＿＿＿　★　＿＿＿　ください。',
 'grammar', 'SENTENCE_ORDER', true, 1, 48,
 '正しい語順は「うえで(②)→意見を(④)→まとめて(①)→お知らせ(③)」。完成文:「十分に考えたうえで意見をまとめてお知らせください」。「うえで」는 「~한 뒤에, ~를 전제로」라는 의미의 N2 문법으로, 순서·전제를 나타낸다. ★는 3번째 위치의 「まとめて(①)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b049-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼女は歌が上手な　＿＿＿　＿＿＿　★　＿＿＿　得意だ。',
 'grammar', 'SENTENCE_ORDER', true, 1, 49,
 '正しい語順は「ばかりか(①)→楽器の(④)→演奏も(③)→ダンスも(②)」。完成文:「彼女は歌が上手なばかりか楽器の演奏もダンスも得意だ」。「ばかりか」는 「~뿐 아니라, 게다가」라는 의미로 추가 정보를 열거하는 N2 문법. ★는 3번째 위치의 「演奏も(③)」.');

-- 問題9: TEXT_GRAMMAR (sort 50~54) — 文章の文法
-- 共通地文:
-- 「現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。
--  SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が
--  低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。
--  こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。
--  SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b050-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。

上の文章の（50）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 50,
 '「スマートフォンの普及にともない」= 스마트폰의 보급에 따라. 「にともない/にともなって」는 어떤 변화에 수반하여 다른 변화가 일어남을 나타내는 N2 문법. 「をきっかけに」는 계기·출발점, 「に対して」는 대상·대립, 「によっては」는 조건에 따라 달라짐을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b051-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。

上の文章の（51）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 51,
 '「便利なコミュニケーション手段であるものの」= 편리한 수단이기는 하지만. 「ものの」는 앞의 사실을 인정하면서도 기대와 다른 결과를 나타내는 역접 표현(N2). 「だけあって」는 당연한 결과(순접), 「ために」는 원인·목적, 「のに」는 아쉬움·불만의 역접이지만 여기서는 문맥상 ものの가 가장 자연스럽다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b052-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。

上の文章の（52）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 52,
 '「一方で」= 한편으로는. 앞에서 언급한 문제점과 대비되는 장점을 제시하는 접속 표현. 「そのため」「したがって」는 원인→결과의 순접 인과관계, 「なぜなら」는 이유 제시로 모두 문맥에 맞지 않는다. 앞 문장의 단점에 대해 반대 관점의 이점을 소개하는 상황에 「一方で」가 가장 적절하다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b053-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。

上の文章の（53）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 53,
 '「安全に活用するためには」= 안전하게 활용하기 위해서는. 「ためには」는 목적·조건을 나타내며, ~하기 위해서는이라는 전제를 표현하는 N2 문법. 「ためでは」는 문법적으로 부자연스럽고, 「ことでは」는 단순 사실 지적, 「ときには」는 시간 조건으로 각각 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2b054-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000211', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

現代社会では、スマートフォンの普及（50）、SNSを利用する人が急増している。SNSは便利なコミュニケーション手段である（51）、使いすぎることで対面でのコミュニケーション能力が低下するという問題点もある。（52）、SNSは遠く離れた人との絆を保つことができるという利点もある。こうしたSNSを安全に活用する（53）は、個人情報の管理に十分注意することが必要だ。SNSとの関わり方について、私たち一人ひとりが（54）考えることが求められている。

上の文章の（54）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 54,
 '「主体的に考える」= 주체적으로 생각하다. SNS와의 관계를 스스로 능동적으로 생각하고 판단하는 것이 필요하다는 문맥. 「消極的に」는 소극적으로, 「依存的に」는 의존적으로, 「無意識に」는 무의식적으로로 모두 자립적 판단을 강조하는 문맥과 맞지 않는다.');

-- ============================================================
-- quiz_question_options (22問 × 4選択肢 = 88件)
-- ============================================================

-- Q33: GRAMMAR_CHOICE につれて (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b033-0000-0000-0000-000000000000', 'に対して', false, 1),
('ade2b033-0000-0000-0000-000000000000', 'によって', false, 2),
('ade2b033-0000-0000-0000-000000000000', 'につれて', true, 3),
('ade2b033-0000-0000-0000-000000000000', 'にとって', false, 4);

-- Q34: GRAMMAR_CHOICE わけにはいかない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b034-0000-0000-0000-000000000000', 'わけにはいかない', true, 1),
('ade2b034-0000-0000-0000-000000000000', 'どころではない', false, 2),
('ade2b034-0000-0000-0000-000000000000', 'はずがない', false, 3),
('ade2b034-0000-0000-0000-000000000000', 'ことにはならない', false, 4);

-- Q35: GRAMMAR_CHOICE ざるを得なかった (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b035-0000-0000-0000-000000000000', 'ずにはいられなかった', false, 1),
('ade2b035-0000-0000-0000-000000000000', 'ざるを得なかった', true, 2),
('ade2b035-0000-0000-0000-000000000000', 'なければならなかった', false, 3),
('ade2b035-0000-0000-0000-000000000000', 'ないわけにはいかなかった', false, 4);

-- Q36: GRAMMAR_CHOICE ものの (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b036-0000-0000-0000-000000000000', 'からこそ', false, 1),
('ade2b036-0000-0000-0000-000000000000', 'ために', false, 2),
('ade2b036-0000-0000-0000-000000000000', 'だけあって', false, 3),
('ade2b036-0000-0000-0000-000000000000', 'ものの', true, 4);

-- Q37: GRAMMAR_CHOICE ばかりか (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b037-0000-0000-0000-000000000000', 'だけあって', false, 1),
('ade2b037-0000-0000-0000-000000000000', 'ものの', false, 2),
('ade2b037-0000-0000-0000-000000000000', 'ばかりか', true, 3),
('ade2b037-0000-0000-0000-000000000000', 'といっても', false, 4);

-- Q38: GRAMMAR_CHOICE にしたがって (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b038-0000-0000-0000-000000000000', 'にしたがって', true, 1),
('ade2b038-0000-0000-0000-000000000000', 'につれて', false, 2),
('ade2b038-0000-0000-0000-000000000000', 'によっては', false, 3),
('ade2b038-0000-0000-0000-000000000000', 'に対して', false, 4);

-- Q39: GRAMMAR_CHOICE に関しては (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b039-0000-0000-0000-000000000000', 'にしては', false, 1),
('ade2b039-0000-0000-0000-000000000000', 'によっては', false, 2),
('ade2b039-0000-0000-0000-000000000000', 'に対しては', false, 3),
('ade2b039-0000-0000-0000-000000000000', 'に関しては', true, 4);

-- Q40: GRAMMAR_CHOICE をもとに (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b040-0000-0000-0000-000000000000', 'に関して', false, 1),
('ade2b040-0000-0000-0000-000000000000', 'をもとに', true, 2),
('ade2b040-0000-0000-0000-000000000000', 'によって', false, 3),
('ade2b040-0000-0000-0000-000000000000', 'にしたがって', false, 4);

-- Q41: GRAMMAR_CHOICE ようとしない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b041-0000-0000-0000-000000000000', 'ようとしない', true, 1),
('ade2b041-0000-0000-0000-000000000000', 'わけではない', false, 2),
('ade2b041-0000-0000-0000-000000000000', 'ことができない', false, 3),
('ade2b041-0000-0000-0000-000000000000', 'ものではない', false, 4);

-- Q42: GRAMMAR_CHOICE かねない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b042-0000-0000-0000-000000000000', 'ようがない', false, 1),
('ade2b042-0000-0000-0000-000000000000', 'わけではない', false, 2),
('ade2b042-0000-0000-0000-000000000000', 'かねない', true, 3),
('ade2b042-0000-0000-0000-000000000000', 'はずがない', false, 4);

-- Q43: GRAMMAR_CHOICE とはいえ (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b043-0000-0000-0000-000000000000', 'だけあって', false, 1),
('ade2b043-0000-0000-0000-000000000000', 'とはいえ', true, 2),
('ade2b043-0000-0000-0000-000000000000', 'としたら', false, 3),
('ade2b043-0000-0000-0000-000000000000', 'にとっては', false, 4);

-- Q44: GRAMMAR_CHOICE に加えて (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b044-0000-0000-0000-000000000000', 'に関して', false, 1),
('ade2b044-0000-0000-0000-000000000000', 'に対して', false, 2),
('ade2b044-0000-0000-0000-000000000000', 'によって', false, 3),
('ade2b044-0000-0000-0000-000000000000', 'に加えて', true, 4);

-- Q45: SENTENCE_ORDER ★=続けた(③) (correct=3)
-- 順序: ②ことなく → ④努力を → ③続けた(★) → ①おかげで
-- 完成文: あきらめることなく努力を続けたおかげで合格できた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b045-0000-0000-0000-000000000000', 'おかげで', false, 1),
('ade2b045-0000-0000-0000-000000000000', 'ことなく', false, 2),
('ade2b045-0000-0000-0000-000000000000', '続けた', true, 3),
('ade2b045-0000-0000-0000-000000000000', '努力を', false, 4);

-- Q46: SENTENCE_ORDER ★=観客が(②) (correct=2)
-- 順序: ④にもかかわらず → ③200人以上の → ②観客が(★) → ①集まり
-- 完成文: 悪天候にもかかわらず200人以上の観客が集まり試合は予定通り行われた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b046-0000-0000-0000-000000000000', '集まり', false, 1),
('ade2b046-0000-0000-0000-000000000000', '観客が', true, 2),
('ade2b046-0000-0000-0000-000000000000', '200人以上の', false, 3),
('ade2b046-0000-0000-0000-000000000000', 'にもかかわらず', false, 4);

-- Q47: SENTENCE_ORDER ★=本格的に(④) (correct=4)
-- 順序: ③をきっかけに → ①日本語を → ④本格的に(★) → ②勉強し
-- 完成文: 日本の映画を見たをきっかけに日本語を本格的に勉強し始めた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b047-0000-0000-0000-000000000000', '日本語を', false, 1),
('ade2b047-0000-0000-0000-000000000000', '勉強し', false, 2),
('ade2b047-0000-0000-0000-000000000000', 'ことをきっかけに', false, 3),
('ade2b047-0000-0000-0000-000000000000', '本格的に', true, 4);

-- Q48: SENTENCE_ORDER ★=まとめて(①) (correct=1)
-- 順序: ②うえで → ④意見を → ①まとめて(★) → ③お知らせ
-- 完成文: 十分に考えたうえで意見をまとめてお知らせください。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b048-0000-0000-0000-000000000000', 'まとめて', true, 1),
('ade2b048-0000-0000-0000-000000000000', 'うえで', false, 2),
('ade2b048-0000-0000-0000-000000000000', 'お知らせ', false, 3),
('ade2b048-0000-0000-0000-000000000000', '意見を', false, 4);

-- Q49: SENTENCE_ORDER ★=演奏も(③) (correct=3)
-- 順序: ①ばかりか → ④楽器の → ③演奏も(★) → ②ダンスも
-- 完成文: 彼女は歌が上手なばかりか楽器の演奏もダンスも得意だ。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b049-0000-0000-0000-000000000000', 'ばかりか', false, 1),
('ade2b049-0000-0000-0000-000000000000', 'ダンスも', false, 2),
('ade2b049-0000-0000-0000-000000000000', '演奏も', false, 3),
('ade2b049-0000-0000-0000-000000000000', '楽器の', true, 4);

-- Q50: TEXT_GRAMMAR blank(50) = にともない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b050-0000-0000-0000-000000000000', 'にともない', true, 1),
('ade2b050-0000-0000-0000-000000000000', 'をきっかけに', false, 2),
('ade2b050-0000-0000-0000-000000000000', 'に対して', false, 3),
('ade2b050-0000-0000-0000-000000000000', 'によっては', false, 4);

-- Q51: TEXT_GRAMMAR blank(51) = ものの (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b051-0000-0000-0000-000000000000', 'のに', false, 1),
('ade2b051-0000-0000-0000-000000000000', 'だけあって', false, 2),
('ade2b051-0000-0000-0000-000000000000', 'ものの', true, 3),
('ade2b051-0000-0000-0000-000000000000', 'ために', false, 4);

-- Q52: TEXT_GRAMMAR blank(52) = 一方で (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b052-0000-0000-0000-000000000000', 'そのため', false, 1),
('ade2b052-0000-0000-0000-000000000000', 'なぜなら', false, 2),
('ade2b052-0000-0000-0000-000000000000', 'したがって', false, 3),
('ade2b052-0000-0000-0000-000000000000', '一方で', true, 4);

-- Q53: TEXT_GRAMMAR blank(53) = ためには (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b053-0000-0000-0000-000000000000', 'ためでは', false, 1),
('ade2b053-0000-0000-0000-000000000000', 'ためには', true, 2),
('ade2b053-0000-0000-0000-000000000000', 'ことでは', false, 3),
('ade2b053-0000-0000-0000-000000000000', 'ときには', false, 4);

-- Q54: TEXT_GRAMMAR blank(54) = 主体的に (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2b054-0000-0000-0000-000000000000', '主体的に', true, 1),
('ade2b054-0000-0000-0000-000000000000', '消極的に', false, 2),
('ade2b054-0000-0000-0000-000000000000', '依存的に', false, 3),
('ade2b054-0000-0000-0000-000000000000', '無意識に', false, 4);
