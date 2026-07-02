-- JLPT N2 模擬試験 Set2 言語知識 文法（文法パート）
-- quiz_id: ad000002-0000-0000-0000-000000000221
-- 22問: GRAMMAR_CHOICE×12 (sort 33-44), SENTENCE_ORDER×5 (sort 45-49), TEXT_GRAMMAR×5 (sort 50-54)
-- 文字語彙エージェントが sort_order 1~32 を使用 → 本ファイルは 33~54 のみ
-- Set1(ade2bxxx)とはID・文法項目とも重複なし（ade2cxxx使用）

-- ============================================================
-- quiz_questions (22問)
-- ============================================================

-- 問題7: GRAMMAR_CHOICE (sort 33~44) — 文法形式の判断

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c033-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この工事は約３年（　　）行われる予定だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「約３年にわたって」= 약 3년에 걸쳐서. 「にわたって」는 시간·범위가 넓게 지속됨을 나타내는 N2 문법. 「にとって」는 입장·평가 기준(~에게 있어서), 「について」는 화제(~에 대해), 「によって」는 수단·원인을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c034-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

新しい法律の是非（　　）、国会で激しい議論が続いている。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「法律の是非をめぐって」= 법률의 시비를 둘러싸고. 「をめぐって」는 어떤 화제·문제를 중심으로 논쟁·대립이 벌어짐을 나타내는 N2 문법. 「によって」는 수단·원인, 「にとって」는 평가 기준, 「について」는 단순 화제 제시로 대립의 뉘앙스가 없다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c035-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

日本語を10年間勉強している（　　）、まだ敬語には自信がない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「勉強しているというものの」= 공부하고 있다고는 하지만. 「というものの」는 앞의 사실을 인정하면서도 실제는 그에 미치지 못함을 나타내는 역접 표현(N2、「ものの」의 확장형). 「からには」는 「~한 이상은」(순접 조건), 「というより」는 비교(~라기보다), 「とすれば」는 가정을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c036-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼が成功したのは、日々の努力の結果（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 36,
 '「努力の結果にほかならない」= 다름아닌 노력의 결과이다. 「にほかならない」는 「바로 ~이다, ~외에 다름없다」라는 강한 단정을 나타내는 N2 문법. 「に違いない」는 추측의 확신(~임에 틀림없다), 「というものだ」는 평가·판단, 「どころではない」는 「~할 상황이 아니다」를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c037-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は感謝の気持ち（　　）、手紙を書いた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 37,
 '「感謝の気持ちをこめて」= 감사의 마음을 담아. 「をこめて」는 마음·정성을 담아 어떤 행위를 함을 나타내는 N2 문법. 「について」는 화제, 「にとって」는 평가 기준, 「によって」는 수단·원인을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c038-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼はインターネット（　　）、世界中の人々と交流している。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 38,
 '「インターネットを通じて」= 인터넷을 통해서. 「を通じて」는 어떤 수단·매개를 거쳐 계속적으로 무언가를 함을 나타내는 N2 문법. 「にとって」는 평가 기준, 「に関して」는 화제, 「によって」는 단발적 수단·원인을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c039-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

あの曲を聞く（　　）、学生時代を思い出す。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 39,
 '「曲を聞くにつけ」= 그 곡을 들을 때마다. 「につけ」는 어떤 일이 있을 때마다 자연스럽게 다른 감정·생각이 떠오름을 나타내는 N2 문법. 「につれ」는 변화의 진행에 수반됨(점진적 비례), 「としても」는 가정 역접, 「とともに」는 동시진행·병행을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c040-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この店の料理は味（　　）、盛り付けの美しさでも評判だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 40,
 '「味はもとより」= 맛은 물론이고. 「はもとより」는 「~은 물론이고, 그에 더해」라는 의미로 당연한 것을 들고 더 나아간 것을 추가하는 N2 문법. 「にひきかえ」는 대조(~와는 달리), 「はさておき」는 화제 보류(~은 제쳐두고), 「にかまけて」는 「~에 매달려 다른 것을 소홀히 함」을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c041-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

実際に試してみ（　　）、この商品の良さは分からない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 41,
 '「試してみないことには」= 시험해 보지 않고서는. 「ないことには」는 「~하지 않고서는 (뒤의 일이 성립하지 않는다)」라는 의미로 뒤에 부정적 결과가 오는 N2 문법. 「ないうちに」는 「~하기 전에」(시간), 「なくては」는 의무(~하지 않으면 안 된다), 「ないかぎり」는 「~하지 않는 한」으로 뜻은 비슷하나 이 문맥에서는 ないことには가 가장 자연스럽다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c042-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は周囲の反対（　　）、自分の信じる道を進んだ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 42,
 '「周囲の反対をよそに」= 주위의 반대를 아랑곳하지 않고. 「をよそに」는 주위의 상황·기대를 무시하고 행동함을 나타내는 N2 문법. 「にこたえて」는 「~에 부응하여」(순응), 「をふまえて」는 「~을 근거로 하여」, 「にさきだち」는 「~에 앞서」(시간 순서)를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c043-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

参加費は年齢（　　）、一律1000円です。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 43,
 '「年齢にかかわらず」= 나이에 관계없이. 「にかかわらず」는 「~에 관계없이, ~와 상관없이」라는 의미로 조건에 좌우되지 않음을 나타내는 N2 문법. 「について」는 화제, 「にとって」는 평가 기준, 「によって」는 수단·원인을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c044-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

冗談（　　）、これは重要な問題だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 44,
 '「冗談ぬきにして」= 농담은 빼고(진지하게 말하면). 「ぬきにして」는 「~을 빼고, ~없이」라는 의미로 어떤 요소를 제외하고 이야기함을 나타내는 N2 문법. 「にかわって」는 「~을 대신하여」, 「につけても」는 「~할 때마다」, 「をもって」는 「~으로써」(수단·시점)를 나타낸다.');

-- 問題8: SENTENCE_ORDER (sort 45~49) — 文の組み立て（並べ替え ★）

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c045-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

この薬は風邪　＿＿＿　＿＿＿　★　＿＿＿　ある。',
 'grammar', 'SENTENCE_ORDER', true, 1, 45,
 '正しい語順は「のみならず(②)→花粉症にも(④)→大きな(③)→効果が(①)」。完成文:「この薬は風邪のみならず花粉症にも大きな効果がある」。「のみならず」는 「~뿐만 아니라」라는 의미로 앞의 내용에 뒤의 내용을 추가하는 N2 문법. ★는 3番目の位置の「大きな(③)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c046-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

長い　＿＿＿　＿＿＿　★　＿＿＿　出た。',
 'grammar', 'SENTENCE_ORDER', true, 1, 46,
 '正しい語順は「議論の(③)→末に(④)→ようやく(①)→結論が(②)」。完成文:「長い議論の末にようやく結論が出た」。「末に」는 「~한 끝에」라는 의미로 오랜 과정 후의 결과를 나타내는 N2 문법. ★는 3番目の位置の「ようやく(①)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c047-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

引き受けた　＿＿＿　＿＿＿　★　＿＿＿　ます。',
 'grammar', 'SENTENCE_ORDER', true, 1, 47,
 '正しい語順は「以上は(④)→最後まで(①)→責任を持って(②)→やり遂げ(③)」。完成文:「引き受けた以上は最後まで責任を持ってやり遂げます」。「以上は」는 「~한 이상은」이라는 의미로 앞의 상황을 전제로 뒤에 당연한 의무·결의가 옴을 나타내는 N2 문법. ★는 3番目の位置の「責任を持って(②)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c048-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

この店は　＿＿＿　＿＿＿　★　＿＿＿　いる。',
 'grammar', 'SENTENCE_ORDER', true, 1, 48,
 '正しい語順は「入り口からして(①)→他とは違う(②)→高級感が(④)→漂って(③)」。完成文:「この店は入り口からして他とは違う高級感が漂っている」。「からして」는 「~부터가, ~조차」라는 의미로 대표적인 예를 들어 전체를 판단하는 N2 문법. ★는 3番目の位置の「高級感が(④)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c049-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

新製品の　＿＿＿　＿＿＿　★　＿＿＿　開かれた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 49,
 '正しい語順は「発売に先立ち(②)→全国で(④)→大規模な(③)→記者会見が(①)」。完成文:「新製品の発売に先立ち全国で大規模な記者会見が開かれた」。「に先立ち」는 「~에 앞서」라는 의미로 어떤 일보다 먼저 무언가가 행해짐을 나타내는 N2 문법. ★는 3番目の位置の「大規模な(③)」。');

-- 問題9: TEXT_GRAMMAR (sort 50~54) — 文章の文法
-- 共通地文:
-- 「近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。
--  食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。
--  （52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。
--  こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。
--  私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c050-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。（52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。

上の文章の（50）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 50,
 '「食料自給率の低下を背景に」= 식량자급률 저하를 배경으로. 「を背景に」는 어떤 상황·요인이 배경으로 작용하여 다른 일이 일어남을 나타내는 N2 문법. 「によって」는 수단·원인, 「について」는 화제, 「にとって」는 평가 기준을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c051-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。（52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。

上の文章の（51）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 51,
 '「廃棄されているというのに」= 폐기되고 있는데도(불구하고). 「というのに」는 앞의 사실에 대해 기대나 상식과 어긋나는 상황이 이어짐을 나타내는 역접 표현(N2, 아쉬움·불만 뉘앙스). 「ものだから」는 이유(순접), 「とすれば」는 가정, 「ばかりに」는 부정적 원인 강조(~탓에)를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c052-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。（52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。

上の文章の（52）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 52,
 '「それに対して」= 그에 반해서. 앞 문장의 소극적인 상황과 대비되는 기업들의 적극적인 움직임을 제시하는 대조 표현. 「そのため」「したがって」는 원인→결과의 순접 인과관계, 「なぜなら」는 이유 제시로 모두 대비 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c053-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。（52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。

上の文章の（53）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 53,
 '「解決にあたっては」= 해결에 있어서는. 「にあたっては」는 「~함에 있어서는, ~할 때는」이라는 의미로 어떤 일을 하는 시점·상황에서 필요한 조건을 제시하는 N2 문법. 「にとっては」는 평가 기준, 「によっては」는 경우에 따라, 「にかけては」는 「~에 관한 한(자신 있음)」을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade2c054-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000221', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、食料自給率の低下（50）、日本国内では食品ロスの問題が深刻化している。食べられる食品が大量に廃棄されている（51）、それを減らそうとする取り組みはまだ十分に広がっていない。（52）、一部の企業ではフードバンクへの寄付や賞味期限表示の見直しなど、積極的な取り組みも始まっている。こうした食品ロスの解決（53）、消費者一人ひとりの意識改革が欠かせない。私たちも日々の生活の中で、食品ロスの問題について（54）関心を持ち続けることが求められている。

上の文章の（54）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 54,
 '「継続的に関心を持ち続ける」= 지속적으로 관심을 갖다. 식품 로스 문제에 대해 일시적이 아니라 계속해서 관심을 가져야 한다는 문맥. 「一時的に」는 일시적으로, 「表面的に」는 표면적으로, 「形式的に」는 형식적으로로 모두 지속적 관심과 반대되거나 부적절한 문맥이다.');

-- ============================================================
-- quiz_question_options (22問 × 4選択肢 = 88件)
-- ============================================================

-- Q33: GRAMMAR_CHOICE にわたって (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c033-0000-0000-0000-000000000000', 'にとって', false, 1),
('ade2c033-0000-0000-0000-000000000000', 'について', false, 2),
('ade2c033-0000-0000-0000-000000000000', 'によって', false, 3),
('ade2c033-0000-0000-0000-000000000000', 'にわたって', true, 4);

-- Q34: GRAMMAR_CHOICE をめぐって (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c034-0000-0000-0000-000000000000', 'によって', false, 1),
('ade2c034-0000-0000-0000-000000000000', 'をめぐって', true, 2),
('ade2c034-0000-0000-0000-000000000000', 'にとって', false, 3),
('ade2c034-0000-0000-0000-000000000000', 'に反して', false, 4);

-- Q35: GRAMMAR_CHOICE というものの (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c035-0000-0000-0000-000000000000', 'からには', false, 1),
('ade2c035-0000-0000-0000-000000000000', 'というより', false, 2),
('ade2c035-0000-0000-0000-000000000000', 'というものの', true, 3),
('ade2c035-0000-0000-0000-000000000000', 'とすれば', false, 4);

-- Q36: GRAMMAR_CHOICE にほかならない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c036-0000-0000-0000-000000000000', 'にほかならない', true, 1),
('ade2c036-0000-0000-0000-000000000000', 'に違いない', false, 2),
('ade2c036-0000-0000-0000-000000000000', 'というものだ', false, 3),
('ade2c036-0000-0000-0000-000000000000', 'どころではない', false, 4);

-- Q37: GRAMMAR_CHOICE をこめて (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c037-0000-0000-0000-000000000000', 'をこめて', true, 1),
('ade2c037-0000-0000-0000-000000000000', 'について', false, 2),
('ade2c037-0000-0000-0000-000000000000', 'にとって', false, 3),
('ade2c037-0000-0000-0000-000000000000', 'によって', false, 4);

-- Q38: GRAMMAR_CHOICE を通じて (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c038-0000-0000-0000-000000000000', 'にとって', false, 1),
('ade2c038-0000-0000-0000-000000000000', 'に関して', false, 2),
('ade2c038-0000-0000-0000-000000000000', 'を通じて', true, 3),
('ade2c038-0000-0000-0000-000000000000', 'によって', false, 4);

-- Q39: GRAMMAR_CHOICE につけ (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c039-0000-0000-0000-000000000000', 'につけ', true, 1),
('ade2c039-0000-0000-0000-000000000000', 'につれ', false, 2),
('ade2c039-0000-0000-0000-000000000000', 'としても', false, 3),
('ade2c039-0000-0000-0000-000000000000', 'とともに', false, 4);

-- Q40: GRAMMAR_CHOICE はもとより (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c040-0000-0000-0000-000000000000', 'にひきかえ', false, 1),
('ade2c040-0000-0000-0000-000000000000', 'はもとより', true, 2),
('ade2c040-0000-0000-0000-000000000000', 'はさておき', false, 3),
('ade2c040-0000-0000-0000-000000000000', 'にかまけて', false, 4);

-- Q41: GRAMMAR_CHOICE ないことには (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c041-0000-0000-0000-000000000000', 'ないうちに', false, 1),
('ade2c041-0000-0000-0000-000000000000', 'ないことには', true, 2),
('ade2c041-0000-0000-0000-000000000000', 'なくては', false, 3),
('ade2c041-0000-0000-0000-000000000000', 'ないかぎり', false, 4);

-- Q42: GRAMMAR_CHOICE をよそに (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c042-0000-0000-0000-000000000000', 'にこたえて', false, 1),
('ade2c042-0000-0000-0000-000000000000', 'をふまえて', false, 2),
('ade2c042-0000-0000-0000-000000000000', 'をよそに', true, 3),
('ade2c042-0000-0000-0000-000000000000', 'にさきだち', false, 4);

-- Q43: GRAMMAR_CHOICE にかかわらず (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c043-0000-0000-0000-000000000000', 'について', false, 1),
('ade2c043-0000-0000-0000-000000000000', 'にとって', false, 2),
('ade2c043-0000-0000-0000-000000000000', 'によって', false, 3),
('ade2c043-0000-0000-0000-000000000000', 'にかかわらず', true, 4);

-- Q44: GRAMMAR_CHOICE ぬきにして (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c044-0000-0000-0000-000000000000', 'にかわって', false, 1),
('ade2c044-0000-0000-0000-000000000000', 'につけても', false, 2),
('ade2c044-0000-0000-0000-000000000000', 'をもって', false, 3),
('ade2c044-0000-0000-0000-000000000000', 'ぬきにして', true, 4);

-- Q45: SENTENCE_ORDER ★=大きな(③) (correct=3)
-- 順序: ②のみならず → ④花粉症にも → ③大きな(★) → ①効果が
-- 完成文: この薬は風邪のみならず花粉症にも大きな効果がある。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c045-0000-0000-0000-000000000000', '効果が', false, 1),
('ade2c045-0000-0000-0000-000000000000', 'のみならず', false, 2),
('ade2c045-0000-0000-0000-000000000000', '大きな', true, 3),
('ade2c045-0000-0000-0000-000000000000', '花粉症にも', false, 4);

-- Q46: SENTENCE_ORDER ★=ようやく(①) (correct=1)
-- 順序: ③議論の → ④末に → ①ようやく(★) → ②結論が
-- 完成文: 長い議論の末にようやく結論が出た。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c046-0000-0000-0000-000000000000', 'ようやく', true, 1),
('ade2c046-0000-0000-0000-000000000000', '結論が', false, 2),
('ade2c046-0000-0000-0000-000000000000', '議論の', false, 3),
('ade2c046-0000-0000-0000-000000000000', '末に', false, 4);

-- Q47: SENTENCE_ORDER ★=責任を持って(②) (correct=2)
-- 順序: ④以上は → ①最後まで → ②責任を持って(★) → ③やり遂げ
-- 完成文: 引き受けた以上は最後まで責任を持ってやり遂げます。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c047-0000-0000-0000-000000000000', '最後まで', false, 1),
('ade2c047-0000-0000-0000-000000000000', '責任を持って', true, 2),
('ade2c047-0000-0000-0000-000000000000', 'やり遂げ', false, 3),
('ade2c047-0000-0000-0000-000000000000', '以上は', false, 4);

-- Q48: SENTENCE_ORDER ★=高級感が(④) (correct=4)
-- 順序: ①入り口からして → ②他とは違う → ④高級感が(★) → ③漂って
-- 完成文: この店は入り口からして他とは違う高級感が漂っている。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c048-0000-0000-0000-000000000000', '入り口からして', false, 1),
('ade2c048-0000-0000-0000-000000000000', '他とは違う', false, 2),
('ade2c048-0000-0000-0000-000000000000', '漂って', false, 3),
('ade2c048-0000-0000-0000-000000000000', '高級感が', true, 4);

-- Q49: SENTENCE_ORDER ★=大規模な(③) (correct=3)
-- 順序: ②発売に先立ち → ④全国で → ③大規模な(★) → ①記者会見が
-- 完成文: 新製品の発売に先立ち全国で大規模な記者会見が開かれた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c049-0000-0000-0000-000000000000', '記者会見が', false, 1),
('ade2c049-0000-0000-0000-000000000000', '発売に先立ち', false, 2),
('ade2c049-0000-0000-0000-000000000000', '大規模な', true, 3),
('ade2c049-0000-0000-0000-000000000000', '全国で', false, 4);

-- Q50: TEXT_GRAMMAR blank(50) = を背景に (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c050-0000-0000-0000-000000000000', 'によって', false, 1),
('ade2c050-0000-0000-0000-000000000000', 'について', false, 2),
('ade2c050-0000-0000-0000-000000000000', 'にとって', false, 3),
('ade2c050-0000-0000-0000-000000000000', 'を背景に', true, 4);

-- Q51: TEXT_GRAMMAR blank(51) = というのに (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c051-0000-0000-0000-000000000000', 'ものだから', false, 1),
('ade2c051-0000-0000-0000-000000000000', 'とすれば', false, 2),
('ade2c051-0000-0000-0000-000000000000', 'というのに', true, 3),
('ade2c051-0000-0000-0000-000000000000', 'ばかりに', false, 4);

-- Q52: TEXT_GRAMMAR blank(52) = それに対して (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c052-0000-0000-0000-000000000000', 'そのため', false, 1),
('ade2c052-0000-0000-0000-000000000000', 'それに対して', true, 2),
('ade2c052-0000-0000-0000-000000000000', 'なぜなら', false, 3),
('ade2c052-0000-0000-0000-000000000000', 'したがって', false, 4);

-- Q53: TEXT_GRAMMAR blank(53) = にあたっては (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c053-0000-0000-0000-000000000000', 'にあたっては', true, 1),
('ade2c053-0000-0000-0000-000000000000', 'にとっては', false, 2),
('ade2c053-0000-0000-0000-000000000000', 'によっては', false, 3),
('ade2c053-0000-0000-0000-000000000000', 'にかけては', false, 4);

-- Q54: TEXT_GRAMMAR blank(54) = 継続的に (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade2c054-0000-0000-0000-000000000000', '一時的に', false, 1),
('ade2c054-0000-0000-0000-000000000000', '継続的に', true, 2),
('ade2c054-0000-0000-0000-000000000000', '表面的に', false, 3),
('ade2c054-0000-0000-0000-000000000000', '形式的に', false, 4);
