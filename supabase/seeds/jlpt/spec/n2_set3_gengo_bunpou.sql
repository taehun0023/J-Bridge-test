-- JLPT N2 模擬試験 Set3 言語知識 文法（文法パート）
-- quiz_id: ad000002-0000-0000-0000-000000000231
-- 22問: GRAMMAR_CHOICE×12 (sort 33-44), SENTENCE_ORDER×5 (sort 45-49), TEXT_GRAMMAR×5 (sort 50-54)
-- 文字語彙エージェントが sort_order 1~32 を使用 → 本ファイルは 33~54 のみ
-- 正答位置分布: 1×6 / 2×6 / 3×5 / 4×5

-- ============================================================
-- quiz_questions (22問)
-- ============================================================

-- 問題7: GRAMMAR_CHOICE (sort 33~44) — 文法形式の判断

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23033-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

地球温暖化の影響で、氷河は年々縮小し（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「氷河が縮小しつつある」= 빙하가 점차 축소되고 있다. 「つつある」는 어떤 변화가 서서히 진행 중임을 나타내는 N2 문법. 「一方だ」는 한쪽 방향으로만 계속됨(더욱더 ~할 뿐이다), 「たところだ」는 막 ~한 참임, 「しかない」는 ~할 수밖에 없음을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23034-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この店はチェーン店の（　　）、味がとても本格的だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「チェーン店のわりに」= 체인점치고는(체인점인 것에 비해서는). 「わりに」는 어떤 기준에서 예상되는 것과 실제가 다름을 나타내는 N2 문법. 「せいで」는 부정적 원인, 「おかげで」는 긍정적 원인, 「ばかりに」는 ~한 탓에(부정적 결과의 원인 강조)를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23035-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼が成功したのは、努力を惜しまなかったから（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「努力を惜しまなかったからにほかならない」= 노력을 아끼지 않았기 때문임에 다름없다(바로 그 때문이다). 「にほかならない」는 「다름 아닌 바로 ~이다」라는 의미로 원인・이유를 강하게 단정하는 N2 문법. 「にとどまらない」는 ~에 그치지 않음, 「にかかわらず」는 ~에 관계없이, 「にもまして」는 ~보다 더욱을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23036-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼とは幼馴染で、もう家族（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 36,
 '「もう家族も同然だ」= 이미 가족이나 다름없다. 「も同然だ」는 「~와 마찬가지다, ~나 다름없다」라는 의미의 N2 문법. 「も当然だ」는 당연함, 「もかまわない」는 상관없음, 「もやむを得ない」는 어쩔 수 없음을 나타내며 모두 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23037-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

今回のプロジェクトが成功したのも、皆様のご協力があった（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 37,
 '「ご協力があった次第だ」= 협력이 있었기 때문입니다(그런 사정입니다). 「次第だ」는 사정・경위를 설명하며 결론짓는 N2 문법. 「ばかりだ」는 ~할 뿐임(악화 등의 진행), 「一方だ」는 한 방향으로 계속됨, 「せいだ」는 부정적 원인을 나타내며 정중하게 사정을 설명하는 문맥에는 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23038-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

経験（　　）、彼が一番の適任者だ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 38,
 '「経験からいうと」= 경험으로 말하자면(경험에 비추어 보면). 「からいうと」는 「~의 입장/관점에서 말하면」이라는 의미의 N2 문법. 「にとって」는 ~에게 있어서(평가 기준), 「にかけては」는 ~에 관한 한(자신 있는 분야), 「について」는 단순 화제 제시를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23039-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

あの態度（　　）、彼はやる気がなさそうだ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 39,
 '「あの態度からして」= 저 태도부터가(그것 하나만 봐도). 「からして」는 「~부터가, ~만 봐도」라는 의미로 판단의 근거가 되는 예를 하나 들어 전체를 추측하는 N2 문법. 「にしては」는 ~치고는(기준과의 어긋남), 「にかけては」는 ~에 관한 한, 「によっては」는 경우에 따라서는을 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23040-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長い議論の（　　）、ようやく結論に達した。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 40,
 '「長い議論の末に」= 긴 논의 끝에. 「末に」는 오랜 과정을 거친 끝에 어떤 결과에 도달했음을 나타내는 N2 문법. 「あげく」도 비슷하게 「끝에」를 뜻하지만 부정적인 결과에 주로 쓰이는 뉘앙스가 강해 「ようやく結論に達した」라는 긍정적 결과에는 「末に」가 더 자연스럽다. 「うちに」는 ~하는 동안에, 「かぎりに」는 ~을 마지막으로를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23041-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は驚きの（　　）、言葉を失った。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 41,
 '「驚きのあまり」= 놀란 나머지. 「N+のあまり」는 감정이나 상태가 지나쳐서 어떤 결과가 생겼음을 나타내는 N2 문법. 「ことに」는 감탄(놀랍게도), 「ばかりに」는 ~한 탓에(원인 강조), 「せいで」는 부정적 원인을 나타내며 모두 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23042-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は謝る（　　）、逆にこちらを責めてきた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 42,
 '「謝るどころか」= 사과하기는커녕. 「どころか」는 「~은커녕, ~은 물론이고」라는 의미로 예상과 정반대의 상황을 강조하는 N2 문법. 「ばかりか」는 ~뿐 아니라(추가 열거), 「かわりに」는 ~대신에, 「はもとより」는 ~은 물론이고를 나타내며, 정반대 상황을 강조하는 문맥에는 「どころか」가 가장 자연스럽다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23043-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この薬はよく効く（　　）、副作用も強い。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 43,
 '「よく効く反面」= 잘 듣는 반면. 「反面」은 하나의 사물이 가진 상반된 두 측면을 대비하여 나타내는 N2 문법. 「うえに」는 ~인 데다가(같은 방향의 추가), 「ものの」는 역접(~이지만), 「かわりに」는 ~대신에를 나타내며, 약효와 부작용이라는 상반된 측면을 대비하는 문맥에는 「反面」이 가장 적절하다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23044-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この地域は大雨により、川が氾濫する（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 44,
 '「川が氾濫するおそれがある」= 강이 범람할 우려가 있다. 「おそれがある」는 좋지 않은 일이 일어날 가능성이 있음을 나타내는 N2 문법. 「にすぎない」는 ~에 불과하다, 「わけがない」는 ~일 리가 없다, 「一方だ」는 한 방향으로 계속됨을 나타내며 모두 위험성을 예고하는 문맥에 맞지 않는다.');

-- 問題8: SENTENCE_ORDER (sort 45~49) — 文の組み立て（並べ替え ★）

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23045-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼は仕事が忙しくなると　＿＿＿　＿＿＿　★　＿＿＿　になる。',
 'grammar', 'SENTENCE_ORDER', true, 1, 45,
 '正しい語順は「つい(③)→健康管理を(④)→怠り(①)→がち(②)」。完成文:「彼は仕事が忙しくなると、つい健康管理を怠りがちになる。」「がち」(動詞ます形+がち)는 자칫 ~하기 쉽다, ~하는 경향이 있다는 의미의 N2 문법。★는 3번째 위치의「怠り(①)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23046-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼女とは大学時代に　＿＿＿　＿＿＿　★　＿＿＿　連絡を取っていない。',
 'grammar', 'SENTENCE_ORDER', true, 1, 46,
 '正しい語順は「一度会った(①)→きり(④)→それ以来(②)→一度も(③)」。完成文:「彼女とは大学時代に一度会ったきり、それ以来一度も連絡を取っていない。」「きり」(動詞た形+きり)는 ~한 채로 그 이후 ~하지 않았다는 의미의 N2 문법. ★는 3번째 위치의「それ以来(②)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23047-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼は何も　＿＿＿　＿＿＿　★　＿＿＿　文句ばかり言う。',
 'grammar', 'SENTENCE_ORDER', true, 1, 47,
 '正しい語順は「知らない(①)→くせに(④)→いつも(③)→偉そうに(②)」。完成文:「彼は何も知らないくせに、いつも偉そうに文句ばかり言う。」「くせに」는 ~인 주제에(비난・불만의 뉘앙스를 담은 역접)라는 의미의 N2 문법。★는 3번째 위치의「いつも(③)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23048-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

彼が無事に帰ってきたとき、家族が　＿＿＿　＿＿＿　★　＿＿＿　。',
 'grammar', 'SENTENCE_ORDER', true, 1, 48,
 '正しい語順は「どれほど(①)→安心して(③)→喜んだ(④)→ことか(②)」。完成文:「彼が無事に帰ってきたとき、家族がどれほど安心して喜んだことか。」「ことか」는 얼마나 ~던가(감탄을 나타내는 N2 문법)라는 의미。★는 3번째 위치의「喜んだ(④)」.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23049-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

一人暮らしを　＿＿＿　＿＿＿　★　＿＿＿　わかった。',
 'grammar', 'SENTENCE_ORDER', true, 1, 49,
 '正しい語順は「始めて(②)→はじめて(④)→親の(①)→ありがたみが(③)」。完成文:「一人暮らしを始めてはじめて、親のありがたみがわかった。」「てはじめて」는 ~하고 나서야 비로소(~해보고서야 처음으로 알게 됨)라는 의미의 N2 문법. ★는 3번째 위치의「親の(①)」.');

-- 問題9: TEXT_GRAMMAR (sort 50~54) — 文章の文法
-- 共通地文:
-- 「近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、
--  自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、
--  テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の
--  工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを
--  導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを
--  整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23050-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。

上の文章の（50）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 50,
 '「働き方改革を通じて」= 일하는 방식 개혁을 통해. 「を通じて」는 어떤 수단・경로를 통하여 무언가가 이루어짐을 나타내는 N2 문법. 「をきっかけに」는 ~을 계기로(시작점), 「にわたって」는 ~에 걸쳐(범위・기간), 「について」는 단순 화제 제시를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23051-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。

上の文章の（51）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 51,
 '「オフィス勤務に限らず」= 사무실 근무에 한정되지 않고. 「に限らず」는 「~에 한정되지 않고, ~뿐만 아니라」라는 의미의 N2 문법. 「にとどまらず」도 비슷한 의미이나 주로 범위의 확장을 강조, 「はもとより」는 ~은 물론이고, 「にかかわらず」는 ~에 관계없이를 나타내며, 근무 장소의 다양화를 설명하는 문맥에는 「に限らず」가 가장 자연스럽다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23052-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。

上の文章の（52）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 52,
 '「個人の工夫不足にすぎない」= 개인의 노력 부족에 불과하다. 「にすぎない」는 「단지 ~에 지나지 않는다, ~에 불과하다」라는 의미로 정도를 낮게 평가하는 N2 문법. 「にほかならない」는 바로 ~임에 다름없다(강한 단정), 「どころではない」는 ~할 상황이 아니다, 「というものではない」는 반드시 ~인 것은 아니다를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23053-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。

上の文章の（53）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 53,
 '「生産性が必ず向上するわけがない」= 생산성이 반드시 향상될 리가 없다. 「わけがない」는 「~일 리가 없다」라는 의미로 강한 부정적 추측을 나타내는 N2 문법. 「わけではない」는 부분 부정(반드시 ~인 것은 아니다), 「にちがいない」는 ~임에 틀림없다(강한 긍정적 추측), 「とはかぎらない」는 반드시 ~라고는 할 수 없다를 나타낸다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade23054-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000231', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、働き方改革（50）、テレワークを導入する企業が増えている。オフィス勤務（51）、自宅やカフェなど、場所を選ばずに仕事ができるようになったことは大きな変化だ。しかし、テレワークで生じる孤独感や仕事とプライベートの区別のつきにくさといった問題は、単に個人の工夫不足（52）という指摘もあるが、多くの専門家は制度面の課題だと見ている。テレワークを導入しただけで社員の生産性が必ず向上する（53）ため、企業には成果だけでなく働く環境そのものを整える努力が求められている。テレワークの制度だけを整えて社員の意識改革を怠るのは、本末転倒という（54）。

上の文章の（54）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 54,
 '「本末転倒というものだ」= 그야말로 본말전도라는 것이다. 「というものだ」는 「그야말로 ~라는 것이다」라는 의미로 화자의 판단・평가를 강조하는 N2 문법. 「というところだ」는 기껏해야 ~정도이다(정도의 한정), 「どころではない」는 ~할 상황이 아니다, 「にほかならない」는 바로 ~임에 다름없다를 나타낸다.');

-- ============================================================
-- quiz_question_options (22問 × 4選択肢 = 88件)
-- ============================================================

-- Q33: GRAMMAR_CHOICE つつある (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23033-0000-0000-0000-000000000000', 'つつある', true, 1),
('ade23033-0000-0000-0000-000000000000', '一方だ', false, 2),
('ade23033-0000-0000-0000-000000000000', 'たところだ', false, 3),
('ade23033-0000-0000-0000-000000000000', 'しかない', false, 4);

-- Q34: GRAMMAR_CHOICE わりに (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23034-0000-0000-0000-000000000000', 'せいで', false, 1),
('ade23034-0000-0000-0000-000000000000', 'わりに', true, 2),
('ade23034-0000-0000-0000-000000000000', 'おかげで', false, 3),
('ade23034-0000-0000-0000-000000000000', 'ばかりに', false, 4);

-- Q35: GRAMMAR_CHOICE にほかならない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23035-0000-0000-0000-000000000000', 'にとどまらない', false, 1),
('ade23035-0000-0000-0000-000000000000', 'にかかわらず', false, 2),
('ade23035-0000-0000-0000-000000000000', 'にほかならない', true, 3),
('ade23035-0000-0000-0000-000000000000', 'にもまして', false, 4);

-- Q36: GRAMMAR_CHOICE も同然だ (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23036-0000-0000-0000-000000000000', 'も当然だ', false, 1),
('ade23036-0000-0000-0000-000000000000', 'もかまわない', false, 2),
('ade23036-0000-0000-0000-000000000000', 'もやむを得ない', false, 3),
('ade23036-0000-0000-0000-000000000000', 'も同然だ', true, 4);

-- Q37: GRAMMAR_CHOICE 次第だ (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23037-0000-0000-0000-000000000000', '次第だ', true, 1),
('ade23037-0000-0000-0000-000000000000', 'ばかりだ', false, 2),
('ade23037-0000-0000-0000-000000000000', '一方だ', false, 3),
('ade23037-0000-0000-0000-000000000000', 'せいだ', false, 4);

-- Q38: GRAMMAR_CHOICE からいうと (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23038-0000-0000-0000-000000000000', 'にとって', false, 1),
('ade23038-0000-0000-0000-000000000000', 'からいうと', true, 2),
('ade23038-0000-0000-0000-000000000000', 'に反して', false, 3),
('ade23038-0000-0000-0000-000000000000', 'について', false, 4);

-- Q39: GRAMMAR_CHOICE からして (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23039-0000-0000-0000-000000000000', 'にしては', false, 1),
('ade23039-0000-0000-0000-000000000000', 'にかけては', false, 2),
('ade23039-0000-0000-0000-000000000000', 'からして', true, 3),
('ade23039-0000-0000-0000-000000000000', 'によっては', false, 4);

-- Q40: GRAMMAR_CHOICE 末に (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23040-0000-0000-0000-000000000000', 'あげく', false, 1),
('ade23040-0000-0000-0000-000000000000', 'うちに', false, 2),
('ade23040-0000-0000-0000-000000000000', 'かぎりに', false, 3),
('ade23040-0000-0000-0000-000000000000', '末に', true, 4);

-- Q41: GRAMMAR_CHOICE あまり (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23041-0000-0000-0000-000000000000', 'あまり', true, 1),
('ade23041-0000-0000-0000-000000000000', 'ことに', false, 2),
('ade23041-0000-0000-0000-000000000000', 'ばかりに', false, 3),
('ade23041-0000-0000-0000-000000000000', 'せいで', false, 4);

-- Q42: GRAMMAR_CHOICE どころか (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23042-0000-0000-0000-000000000000', 'ばかりか', false, 1),
('ade23042-0000-0000-0000-000000000000', 'どころか', true, 2),
('ade23042-0000-0000-0000-000000000000', 'かわりに', false, 3),
('ade23042-0000-0000-0000-000000000000', 'はもとより', false, 4);

-- Q43: GRAMMAR_CHOICE 反面 (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23043-0000-0000-0000-000000000000', 'うえに', false, 1),
('ade23043-0000-0000-0000-000000000000', 'ものの', false, 2),
('ade23043-0000-0000-0000-000000000000', '反面', true, 3),
('ade23043-0000-0000-0000-000000000000', 'かわりに', false, 4);

-- Q44: GRAMMAR_CHOICE おそれがある (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23044-0000-0000-0000-000000000000', 'にすぎない', false, 1),
('ade23044-0000-0000-0000-000000000000', 'わけがない', false, 2),
('ade23044-0000-0000-0000-000000000000', '一方だ', false, 3),
('ade23044-0000-0000-0000-000000000000', 'おそれがある', true, 4);

-- Q45: SENTENCE_ORDER ★=怠り(①) (correct=1)
-- 順序: ③つい → ④健康管理を → ①怠り(★) → ②がち
-- 完成文: 彼は仕事が忙しくなると、つい健康管理を怠りがちになる。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23045-0000-0000-0000-000000000000', '怠り', true, 1),
('ade23045-0000-0000-0000-000000000000', 'がち', false, 2),
('ade23045-0000-0000-0000-000000000000', 'つい', false, 3),
('ade23045-0000-0000-0000-000000000000', '健康管理を', false, 4);

-- Q46: SENTENCE_ORDER ★=それ以来(②) (correct=2)
-- 順序: ①一度会った → ④きり → ②それ以来(★) → ③一度も
-- 完成文: 彼女とは大学時代に一度会ったきり、それ以来一度も連絡を取っていない。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23046-0000-0000-0000-000000000000', '一度会った', false, 1),
('ade23046-0000-0000-0000-000000000000', 'それ以来', true, 2),
('ade23046-0000-0000-0000-000000000000', '一度も', false, 3),
('ade23046-0000-0000-0000-000000000000', 'きり', false, 4);

-- Q47: SENTENCE_ORDER ★=いつも(③) (correct=3)
-- 順序: ①知らない → ④くせに → ③いつも(★) → ②偉そうに
-- 完成文: 彼は何も知らないくせに、いつも偉そうに文句ばかり言う。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23047-0000-0000-0000-000000000000', '知らない', false, 1),
('ade23047-0000-0000-0000-000000000000', '偉そうに', false, 2),
('ade23047-0000-0000-0000-000000000000', 'いつも', true, 3),
('ade23047-0000-0000-0000-000000000000', 'くせに', false, 4);

-- Q48: SENTENCE_ORDER ★=喜んだ(④) (correct=4)
-- 順序: ①どれほど → ③安心して → ④喜んだ(★) → ②ことか
-- 完成文: 彼が無事に帰ってきたとき、家族がどれほど安心して喜んだことか。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23048-0000-0000-0000-000000000000', 'どれほど', false, 1),
('ade23048-0000-0000-0000-000000000000', 'ことか', false, 2),
('ade23048-0000-0000-0000-000000000000', '安心して', false, 3),
('ade23048-0000-0000-0000-000000000000', '喜んだ', true, 4);

-- Q49: SENTENCE_ORDER ★=親の(①) (correct=1)
-- 順序: ②始めて → ④はじめて → ①親の(★) → ③ありがたみが
-- 完成文: 一人暮らしを始めてはじめて、親のありがたみがわかった。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23049-0000-0000-0000-000000000000', '親の', true, 1),
('ade23049-0000-0000-0000-000000000000', '始めて', false, 2),
('ade23049-0000-0000-0000-000000000000', 'ありがたみが', false, 3),
('ade23049-0000-0000-0000-000000000000', 'はじめて', false, 4);

-- Q50: TEXT_GRAMMAR blank(50) = を通じて (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23050-0000-0000-0000-000000000000', 'をきっかけに', false, 1),
('ade23050-0000-0000-0000-000000000000', 'を通じて', true, 2),
('ade23050-0000-0000-0000-000000000000', 'にわたって', false, 3),
('ade23050-0000-0000-0000-000000000000', 'について', false, 4);

-- Q51: TEXT_GRAMMAR blank(51) = に限らず (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23051-0000-0000-0000-000000000000', 'にとどまらず', false, 1),
('ade23051-0000-0000-0000-000000000000', 'はもとより', false, 2),
('ade23051-0000-0000-0000-000000000000', 'に限らず', true, 3),
('ade23051-0000-0000-0000-000000000000', 'にかかわらず', false, 4);

-- Q52: TEXT_GRAMMAR blank(52) = にすぎない (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23052-0000-0000-0000-000000000000', 'にほかならない', false, 1),
('ade23052-0000-0000-0000-000000000000', 'どころではない', false, 2),
('ade23052-0000-0000-0000-000000000000', 'というものではない', false, 3),
('ade23052-0000-0000-0000-000000000000', 'にすぎない', true, 4);

-- Q53: TEXT_GRAMMAR blank(53) = わけがない (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23053-0000-0000-0000-000000000000', 'わけがない', true, 1),
('ade23053-0000-0000-0000-000000000000', 'わけではない', false, 2),
('ade23053-0000-0000-0000-000000000000', 'にちがいない', false, 3),
('ade23053-0000-0000-0000-000000000000', 'とはかぎらない', false, 4);

-- Q54: TEXT_GRAMMAR blank(54) = というものだ (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade23054-0000-0000-0000-000000000000', 'というところだ', false, 1),
('ade23054-0000-0000-0000-000000000000', 'というものだ', true, 2),
('ade23054-0000-0000-0000-000000000000', 'どころではない', false, 3),
('ade23054-0000-0000-0000-000000000000', 'にほかならない', false, 4);
