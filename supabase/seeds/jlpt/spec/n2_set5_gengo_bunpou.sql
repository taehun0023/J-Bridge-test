-- JLPT N2 模擬試験 Set5 言語知識 文法（文法パート）
-- quiz_id: ad000002-0000-0000-0000-000000000251 (語彙パートと共通)
-- 22問: GRAMMAR_CHOICE×12 (sort 33-44), SENTENCE_ORDER×5 (sort 45-49), TEXT_GRAMMAR×5 (sort 50-54)
-- 語彙エージェントが sort_order 1~32 を使用 → 本ファイルは 33~54 のみ
-- Set1(n2_set1_gengo_bunpou.sql)と文法項目・例文が重複しないよう新規作成

-- ============================================================
-- quiz_questions (22問)
-- ============================================================

-- 問題7: GRAMMAR_CHOICE (sort 33~44) — 文法形式の判断

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25033-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長時間悩んだ（　　）、彼は結局その仕事を辞退した。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 33,
 '「悩んだあげくに」= 고민한 끝에(결국). 「あげく(に)」는 오랜 시간·과정을 거친 끝에 대개 부정적이거나 의외의 결과에 이름을 나타내는 N2 문법. 「とたんに」는 ~하자마자(순간), 「からといって」는 ~라고 해서(반드시 그런 것은 아니다), 「くせに」는 ~인 주제에(비난)라는 의미로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25034-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この店の料理はおいしい（　　）、値段も手ごろだ。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 34,
 '「おいしいうえに」= 맛있는 데다가. 「うえに」는 어떤 사실에 또 다른 사실을 첨가할 때 사용하는 N2 문법(~인 데다가). 「つつ」는 ~하면서(동시동작), 「どころか」는 ~는커녕, 「ばかりに」는 ~탓에(부정적 원인)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25035-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女はまるで何も知らない（　　）、平然とした顔をしていた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 35,
 '「何も知らないかのように」= 마치 아무것도 모르는 것처럼. 「かのように」는 사실이 아니지만 마치 그런 것처럼 비유·추측할 때 사용하는 N2 문법。「ように」는 목적·양태(그렇게 되도록)를 나타내 여기서는 부자연스럽고, 「につけ」는 ~할 때마다, 「というより」는 ~라기보다는으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25036-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

給料が高い（　　）、必ずしも仕事にやりがいを感じるとは限らない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 36,
 '「給料が高いからといって」= 급여가 높다고 해서. 「からといって」는 뒤에 부분부정 표현(~とは限らない・~わけではない)과 호응하여 「그렇다고 반드시 ~인 것은 아니다」를 나타내는 N2 문법. 「からこそ」는 이유 강조, 「としたら」는 가정, 「にしては」는 ~치고는으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25037-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は自分では何もしない（　　）、人のやり方に文句ばかり言う。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 37,
 '「何もしないくせに」= 아무것도 하지 않는 주제에. 「くせに」는 신분·행동에 어울리지 않게 뒤에 비난·불만을 나타내는 N2 문법. 「ものだから」는 이유(변명), 「につれ」는 진행에 수반, 「いっぽう」는 한편으로는(대비)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25038-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

驚いた（　　）、彼は試験にたった一度の受験で合格してしまった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 38,
 '「驚いたことに」= 놀랍게도. 「ことに(は)」는 감정을 나타내는 말 뒤에 붙어 「~하게도」라며 화자의 감정을 먼저 제시한 후 그 근거가 되는 사실을 서술하는 N2 문법. 「というふうに」는 ~라는 식으로(방법 예시), 「とばかりに」는 마치 ~라는 듯이(기세), 「だけに」는 ~인 만큼(당연한 결과)으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25039-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

ドアを開けた（　　）、冷たい風が吹き込んできた。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 39,
 '「ドアを開けたとたんに」= 문을 연 순간. 「とたん(に)」는 어떤 동작 직후에 예상치 못한 일이 일어남을 나타내는 N2 문법. 「ながら」는 동시동작, 「あまり」는 정도가 지나쳐(~한 나머지), 「うちに」는 ~하는 동안에(시간적 범위)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25040-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

地球温暖化の影響で、氷河は年々小さくなり（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 40,
 '「小さくなりつつある」= 작아지고 있는 중이다. 「つつある」는 어떤 상태·변화가 서서히 진행되고 있음을 나타내는 N2 문법(동사ます형+つつある)。「っぽい」는 ~한 경향이 있다(성질), 「がちだ」는 자칫 ~하기 쉽다, 「気味だ」는 ~한 기색이다로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25041-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は英語を話せる（　　）、簡単な挨拶もできない。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 41,
 '「話せるどころか」= 말할 수 있기는커녕. 「どころか」는 예상이나 기대와 정반대의 상황임을 강조하는 N2 문법(~는커녕 오히려)。「ばかりでなく」는 ~뿐만 아니라(첨가), 「うえは」는 ~한 이상은(결의), 「ながらも」는 ~이지만(역접)으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25042-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼が謝ったのは、心からではなく、単に周囲の目を気にした（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 42,
 '「気にしたにすぎない」= 신경 쓴 것에 지나지 않는다(불과하다). 「にすぎない」는 「단지 ~에 지나지 않는다, 별거 아니다」라며 정도를 낮춰 평가하는 N2 문법。「つもりだ」는 ~할 생각이다(의도), 「ところだった」는 ~할 뻔했다, 「はずだった」는 ~할 예정이었다(어긋난 예상)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25043-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼がここまで成長できたのは、まさに日々の努力の結果（　　）。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 43,
 '「まさに努力の結果にほかならない」= 바로 노력의 결과임에 다름없다(다름아닌 바로 그것이다). 「にほかならない」는 「다른 것이 아니라 바로 ~이다」라고 강하게 단정할 때 사용하는 N2 문법으로 「まさに」와 자연스럽게 호응한다。「というものだ」는 일반적 통념 서술, 「どころではない」는 ~할 상황이 아니다, 「にきまっている」는 화자의 주관적 추측으로 「まさに」와는 어울리지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25044-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

一言余計なことを言った（　　）、彼は友人を怒らせてしまった。',
 'grammar', 'GRAMMAR_CHOICE', true, 1, 44,
 '「余計なことを言ったばかりに」= 쓸데없는 말을 한 탓에. 「ばかりに」는 사소한 원인 때문에 좋지 않은 결과가 초래되었음을 나타내는 N2 문법。「かぎりに」는 ~을 마지막으로, 「とおもいきや」는 ~라고 생각했더니 의외로, 「につき」는 공지문 등에 쓰이는 격식체 이유 표현으로 문맥에 맞지 않는다.');

-- 問題8: SENTENCE_ORDER (sort 45~49) — 文の組み立て（並べ替え ★）

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25045-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

今回のプロジェクト　＿＿＿　＿＿＿　★　＿＿＿　成果を上げた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 45,
 '正しい語順は「において(②)→若手中心の(④)→チームは(①)→大きな(③)」。完成文:「今回のプロジェクトにおいて、若手中心のチームは大きな成果を上げた」。「において」는 ~에서, ~에 있어서(장소·상황·분야)를 나타내는 N2 문법. ★는 3番目の位置の「チームは(①)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25046-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

この資格試験は　＿＿＿　＿＿＿　★　＿＿＿　受験することができる。',
 'grammar', 'SENTENCE_ORDER', true, 1, 46,
 '正しい語順は「年齢や(④)→学歴(①)→をとわず(②)→誰でも(③)」。完成文:「この資格試験は年齢や学歴をとわず誰でも受験することができる」。「をとわず」는 ~을 불문하고, ~에 관계없이를 나타내는 N2 문법. ★는 3番目の位置の「をとわず(②)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25047-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

新しい工場の建設　＿＿＿　＿＿＿　★　＿＿＿　対立が生じた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 47,
 '正しい語順は「をめぐって(①)→地域の住民の間で(②)→激しい(④)→意見の(③)」。完成文:「新しい工場の建設をめぐって、地域の住民の間で激しい意見の対立が生じた」。「をめぐって」는 ~을 둘러싸고(어떤 사항을 중심으로 논쟁·대립이 벌어짐)를 나타내는 N2 문법. ★는 3番目の位置の「激しい(④)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25048-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

この店のランチは　＿＿＿　＿＿＿　★　＿＿＿　満足できる。',
 'grammar', 'SENTENCE_ORDER', true, 1, 48,
 '正しい語順は「値段が(②)→安い(④)→わりに(③)→量が多くて(①)」。完成文:「この店のランチは値段が安いわりに量が多くて満足できる」。「わりに」는 예상되는 정도에 비해 실제는 다르다는 의미의 N2 문법(~에 비해서는). ★는 3番目の位置の「わりに(③)」。');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25049-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。

近年　＿＿＿　＿＿＿　★　＿＿＿　変化してきた。',
 'grammar', 'SENTENCE_ORDER', true, 1, 49,
 '正しい語順は「技術が(③)→進歩する(④)→とともに(①)→私たちの生活は(②)」。完成文:「近年、技術が進歩するとともに、私たちの生活は大きく変化してきた」。「とともに」는 ~와 함께, ~함에 따라(상관 변화)를 나타내는 N2 문법. ★는 3番目の位置の「とともに(①)」。');

-- 問題9: TEXT_GRAMMAR (sort 50~54) — 文章の文法
-- 共通地文（テーマ: 健康的な生活習慣・運動）:
-- 「近年、健康志向の高まり（50）、日常的に運動をする人が増えている。
--  忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。
--  しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。
--  専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが
--  健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、
--  無理なく続けられる運動方法を見つけていくことが求められている。」

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25050-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、健康志向の高まり（50）、日常的に運動をする人が増えている。忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、無理なく続けられる運動方法を見つけていくことが求められている。

上の文章の（50）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 50,
 '「健康志向の高まりことから」= 건강 지향이 높아지고 있다는 사실로부터(그 때문에). 「ことから」는 어떤 사실·근거로부터 판단·결과를 이끌어낼 때 사용하는 N2 문법. 「にしては」는 ~치고는(평가 기준과의 괴리), 「というより」는 ~라기보다는(비교), 「につけ」는 ~할 때마다(반복 계기)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25051-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、健康志向の高まり（50）、日常的に運動をする人が増えている。忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、無理なく続けられる運動方法を見つけていくことが求められている。

上の文章の（51）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 51,
 '「休日が来るたびに」= 휴일이 올 때마다. 「たびに」는 어떤 동작·상황이 반복될 때마다 매번 같은 일이 일어남을 나타내는 N2 문법. 「つつ」는 ~하면서(동시동작), 「かとおもうと」는 ~라고 생각했더니(의외의 결과), 「いらい」는 ~한 이래로(계속되는 상태의 기점)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25052-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、健康志向の高まり（50）、日常的に運動をする人が増えている。忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、無理なく続けられる運動方法を見つけていくことが求められている。

上の文章の（52）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 52,
 '「仕事が忙しいものだから」= 일이 바쁘기 때문에(변명적 뉘앙스). 「ものだから」는 주관적인 이유·변명을 나타내는 N2 문법. 「というより」는 ~라기보다는(비교), 「あまり」는 정도가 지나쳐(~한 나머지), 「すえに」는 ~한 끝에(장기간의 과정 후 결과)로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25053-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、健康志向の高まり（50）、日常的に運動をする人が増えている。忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、無理なく続けられる運動方法を見つけていくことが求められている。

上の文章の（53）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 53,
 '「激しい運動はもちろん」= 격렬한 운동은 물론이고. 「はもちろん」은 「~은 물론이고, 게다가」라며 당연한 것을 먼저 제시하고 더 나아간 예를 덧붙이는 N2 문법. 「にしても」는 ~라고 해도(양보), 「というと」는 ~라고 하면(화제 전환), 「くらいなら」는 ~할 바에는(비교 선택)으로 문맥에 맞지 않는다.');

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation) VALUES
('ade25054-0000-0000-0000-000000000000', 'ad000002-0000-0000-0000-000000000251', 'multiple_choice',
 '次の文章を読んで、（50）から（54）に入れるのに最もよいものを、それぞれ１・２・３・４から一つ選びなさい。

近年、健康志向の高まり（50）、日常的に運動をする人が増えている。忙しい会社員の中にも、休日が来る（51）、近くの公園を走ったりジムに通ったりする人が少なくない。しかし、仕事が忙しい（52）、途中で運動をやめてしまう人も多い。専門家によれば、激しい運動（53）、通勤時に階段を使うといった小さな習慣を積み重ねることが健康維持には効果的だという。今後は、一人ひとりが自分の生活スタイル（54）、無理なく続けられる運動方法を見つけていくことが求められている。

上の文章の（54）に入れるのに最もよいものを選びなさい。',
 'grammar', 'TEXT_GRAMMAR', true, 1, 54,
 '「生活スタイルに応じて」= 생활 스타일에 맞게(따라). 「に応じて」는 상황·조건에 맞추어 대응함을 나타내는 N2 문법. 「にかわって」는 ~을 대신하여, 「はもとより」는 ~은 물론이고(はもちろん과 유사하나 여기서는 대응·조건의 의미가 아니므로 부적절), 「につけて」는 ~할 때마다·~와 관련하여로 문맥에 맞지 않는다.');

-- ============================================================
-- quiz_question_options (22問 × 4選択肢 = 88件)
-- ============================================================

-- Q33: GRAMMAR_CHOICE あげくに (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25033-0000-0000-0000-000000000000', 'あげくに', true, 1),
('ade25033-0000-0000-0000-000000000000', 'とたんに', false, 2),
('ade25033-0000-0000-0000-000000000000', 'からといって', false, 3),
('ade25033-0000-0000-0000-000000000000', 'くせに', false, 4);

-- Q34: GRAMMAR_CHOICE うえに (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25034-0000-0000-0000-000000000000', 'うえに', true, 1),
('ade25034-0000-0000-0000-000000000000', 'つつ', false, 2),
('ade25034-0000-0000-0000-000000000000', 'どころか', false, 3),
('ade25034-0000-0000-0000-000000000000', 'ばかりに', false, 4);

-- Q35: GRAMMAR_CHOICE かのように (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25035-0000-0000-0000-000000000000', 'からには', false, 1),
('ade25035-0000-0000-0000-000000000000', 'につけ', false, 2),
('ade25035-0000-0000-0000-000000000000', 'かのように', true, 3),
('ade25035-0000-0000-0000-000000000000', 'というより', false, 4);

-- Q36: GRAMMAR_CHOICE からといって (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25036-0000-0000-0000-000000000000', 'からこそ', false, 1),
('ade25036-0000-0000-0000-000000000000', 'としたら', false, 2),
('ade25036-0000-0000-0000-000000000000', 'にしては', false, 3),
('ade25036-0000-0000-0000-000000000000', 'からといって', true, 4);

-- Q37: GRAMMAR_CHOICE くせに (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25037-0000-0000-0000-000000000000', 'くせに', true, 1),
('ade25037-0000-0000-0000-000000000000', 'ものだから', false, 2),
('ade25037-0000-0000-0000-000000000000', 'につれ', false, 3),
('ade25037-0000-0000-0000-000000000000', 'いっぽう', false, 4);

-- Q38: GRAMMAR_CHOICE ことに (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25038-0000-0000-0000-000000000000', 'というふうに', false, 1),
('ade25038-0000-0000-0000-000000000000', 'ことに', true, 2),
('ade25038-0000-0000-0000-000000000000', 'とばかりに', false, 3),
('ade25038-0000-0000-0000-000000000000', 'だけに', false, 4);

-- Q39: GRAMMAR_CHOICE たとたんに (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25039-0000-0000-0000-000000000000', 'ながら', false, 1),
('ade25039-0000-0000-0000-000000000000', 'あまり', false, 2),
('ade25039-0000-0000-0000-000000000000', 'たとたんに', true, 3),
('ade25039-0000-0000-0000-000000000000', 'うちに', false, 4);

-- Q40: GRAMMAR_CHOICE つつある (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25040-0000-0000-0000-000000000000', 'っぽい', false, 1),
('ade25040-0000-0000-0000-000000000000', 'がちだ', false, 2),
('ade25040-0000-0000-0000-000000000000', '気味だ', false, 3),
('ade25040-0000-0000-0000-000000000000', 'つつある', true, 4);

-- Q41: GRAMMAR_CHOICE どころか (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25041-0000-0000-0000-000000000000', 'どころか', true, 1),
('ade25041-0000-0000-0000-000000000000', 'ばかりでなく', false, 2),
('ade25041-0000-0000-0000-000000000000', 'うえは', false, 3),
('ade25041-0000-0000-0000-000000000000', 'ながらも', false, 4);

-- Q42: GRAMMAR_CHOICE にすぎない (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25042-0000-0000-0000-000000000000', 'つもりだ', false, 1),
('ade25042-0000-0000-0000-000000000000', 'ところだった', false, 2),
('ade25042-0000-0000-0000-000000000000', 'はずだった', false, 3),
('ade25042-0000-0000-0000-000000000000', 'にすぎない', true, 4);

-- Q43: GRAMMAR_CHOICE にほかならない (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25043-0000-0000-0000-000000000000', 'というものだ', false, 1),
('ade25043-0000-0000-0000-000000000000', 'どころではない', false, 2),
('ade25043-0000-0000-0000-000000000000', 'にほかならない', true, 3),
('ade25043-0000-0000-0000-000000000000', 'にきまっている', false, 4);

-- Q44: GRAMMAR_CHOICE ばかりに (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25044-0000-0000-0000-000000000000', 'かぎりに', false, 1),
('ade25044-0000-0000-0000-000000000000', 'ばかりに', true, 2),
('ade25044-0000-0000-0000-000000000000', 'とおもいきや', false, 3),
('ade25044-0000-0000-0000-000000000000', 'につき', false, 4);

-- Q45: SENTENCE_ORDER ★=チームは(①) (correct=1)
-- 順序: ②において → ④若手中心の → ①チームは(★) → ③大きな
-- 完成文: 今回のプロジェクトにおいて、若手中心のチームは大きな成果を上げた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25045-0000-0000-0000-000000000000', 'チームは', true, 1),
('ade25045-0000-0000-0000-000000000000', 'において', false, 2),
('ade25045-0000-0000-0000-000000000000', '大きな', false, 3),
('ade25045-0000-0000-0000-000000000000', '若手中心の', false, 4);

-- Q46: SENTENCE_ORDER ★=をとわず(②) (correct=2)
-- 順序: ④年齢や → ①学歴 → ②をとわず(★) → ③誰でも
-- 完成文: この資格試験は年齢や学歴をとわず誰でも受験することができる。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25046-0000-0000-0000-000000000000', '学歴', false, 1),
('ade25046-0000-0000-0000-000000000000', 'を問わず', true, 2),
('ade25046-0000-0000-0000-000000000000', '誰でも', false, 3),
('ade25046-0000-0000-0000-000000000000', '年齢や', false, 4);

-- Q47: SENTENCE_ORDER ★=激しい(④) (correct=4)
-- 順序: ①をめぐって → ②地域の住民の間で → ④激しい(★) → ③意見の
-- 完成文: 新しい工場の建設をめぐって、地域の住民の間で激しい意見の対立が生じた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25047-0000-0000-0000-000000000000', 'をめぐって', false, 1),
('ade25047-0000-0000-0000-000000000000', '地域の住民の間で', false, 2),
('ade25047-0000-0000-0000-000000000000', '意見の', false, 3),
('ade25047-0000-0000-0000-000000000000', '激しい', true, 4);

-- Q48: SENTENCE_ORDER ★=わりに(③) (correct=3)
-- 順序: ②値段が → ④安い → ③わりに(★) → ①量が多くて
-- 完成文: この店のランチは値段が安いわりに量が多くて満足できる。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25048-0000-0000-0000-000000000000', '量が多くて', false, 1),
('ade25048-0000-0000-0000-000000000000', '値段が', false, 2),
('ade25048-0000-0000-0000-000000000000', 'わりに', true, 3),
('ade25048-0000-0000-0000-000000000000', '安い', false, 4);

-- Q49: SENTENCE_ORDER ★=とともに(①) (correct=1)
-- 順序: ③技術が → ④進歩する → ①とともに(★) → ②私たちの生活は
-- 完成文: 近年、技術が進歩するとともに、私たちの生活は大きく変化してきた。
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25049-0000-0000-0000-000000000000', 'とともに', true, 1),
('ade25049-0000-0000-0000-000000000000', '私たちの生活は', false, 2),
('ade25049-0000-0000-0000-000000000000', '技術が', false, 3),
('ade25049-0000-0000-0000-000000000000', '進歩する', false, 4);

-- Q50: TEXT_GRAMMAR blank(50) = ことから (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25050-0000-0000-0000-000000000000', 'にしては', false, 1),
('ade25050-0000-0000-0000-000000000000', 'というより', false, 2),
('ade25050-0000-0000-0000-000000000000', 'につけ', false, 3),
('ade25050-0000-0000-0000-000000000000', 'ことから', true, 4);

-- Q51: TEXT_GRAMMAR blank(51) = たびに (correct=1)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25051-0000-0000-0000-000000000000', 'たびに', true, 1),
('ade25051-0000-0000-0000-000000000000', 'つつ', false, 2),
('ade25051-0000-0000-0000-000000000000', 'かとおもうと', false, 3),
('ade25051-0000-0000-0000-000000000000', 'いらい', false, 4);

-- Q52: TEXT_GRAMMAR blank(52) = ものだから (correct=2)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25052-0000-0000-0000-000000000000', 'というより', false, 1),
('ade25052-0000-0000-0000-000000000000', 'ものだから', true, 2),
('ade25052-0000-0000-0000-000000000000', 'あまり', false, 3),
('ade25052-0000-0000-0000-000000000000', 'すえに', false, 4);

-- Q53: TEXT_GRAMMAR blank(53) = はもちろん (correct=3)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25053-0000-0000-0000-000000000000', 'にしても', false, 1),
('ade25053-0000-0000-0000-000000000000', 'というと', false, 2),
('ade25053-0000-0000-0000-000000000000', 'はもちろん', true, 3),
('ade25053-0000-0000-0000-000000000000', 'くらいなら', false, 4);

-- Q54: TEXT_GRAMMAR blank(54) = に応じて (correct=4)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('ade25054-0000-0000-0000-000000000000', 'にかわって', false, 1),
('ade25054-0000-0000-0000-000000000000', 'はもとより', false, 2),
('ade25054-0000-0000-0000-000000000000', 'につけて', false, 3),
('ade25054-0000-0000-0000-000000000000', 'に応じて', true, 4);
