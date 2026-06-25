-- encoding: UTF-8
-- JLPT N1 Reading Pool Questions — n1_pool_reading_1.sql
-- quiz_id: bb000001-0000-0000-0000-000000000002 (N1 読解テスト拡充)
-- 32 original questions, question_category='reading', points=1, is_published=true
-- Topics: 哲学×4, 社会批評×3, 科学論×2, 文化論×3, 経済論×2, 言語論×1, 環境論×2, 政治哲学×2, 芸術論×2, 教育論×2, テクノロジー批評×2, 人類学×2, 倫理学×2, 社会学×1, 認知科学×1, 情報論×1, 都市論×1, 文学論×1
-- Answer position distribution: pos1×8, pos2×8, pos3×8, pos4×8
-- All passages are original works — no reproduction of published exam materials

-- Q01: 哲学・認識論 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

我々が「知る」という行為を問い直すとき、認識の根拠そのものが揺らぐという逆説に直面する。デカルトは疑い得ない出発点を「我思う、ゆえに我あり」に求めたが、この命題が成立するためには、すでに「思う」という概念が前提とされており、完全な無前提には到達し得ない。カントはこの困難を乗り越えようとし、認識の条件そのものを問うという「コペルニクス的転回」を試みた。だが彼の枠組みでは、物自体は永遠に認識の外にとどまる。こうした哲学史の流れを俯瞰すると、認識論はつねに「知ること」と「知ることの限界」という二重の問いを内包しており、どちらか一方を捨象すれば思索は独断に陥るといえよう。真の認識論的誠実さとは、解答を提示することではなく、問いの深度を保ち続けることにあるのかもしれない。

質問：筆者が認識論における「誠実さ」として述べていることは何か。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('問いの深度を保ち続け、解答の提示よりも問い続けることを優先すること。', true, 1),
  ('デカルトの「我思う、ゆえに我あり」を出発点として採用すること。', false, 2),
  ('カントの枠組みに従い、物自体の認識を断念すること。', false, 3),
  ('認識の限界を捨象し、確実な知識体系を構築すること。', false, 4)
) AS t(txt, ok, so);

-- Q02: 社会批評・格差論 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

現代社会における格差の問題は、単なる所得の多寡に還元されるものではない。経済的資源の不均等な分配は、教育機会・医療へのアクセス・社会的ネットワークの格差を連鎖的に生み出し、やがて「機会の不平等」として固定化していく。特に注目すべきは、格差が世代をまたいで再生産されるという構造的側面である。富裕層の子息は質の高い教育を受け、人的資本を蓄積して上位の地位を継承する一方、貧困層の子どもは劣悪な環境下で選択肢を狭められる。こうした閉鎖的な社会移動の現実は、能力主義（メリトクラシー）の理念とは大きく乖離している。格差の縮小を目指すならば、結果の平等ではなく条件の平等を整える制度設計が不可欠であり、個人の努力だけで格差を克服できるという通念は再考を迫られている。

質問：本文で筆者が最も強調している点はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('能力主義の理念に基づき、個人の努力によって格差は克服可能である。', false, 1),
  ('格差は構造的に再生産されており、制度による条件の平等化が必要だ。', true, 2),
  ('所得の格差こそが最重要課題であり、再分配政策を優先すべきだ。', false, 3),
  ('格差問題の解決には富裕層の自発的な寄付行為が最も効果的である。', false, 4)
) AS t(txt, ok, so);

-- Q03: 科学哲学・パラダイム論 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

トーマス・クーンが提唱した「パラダイム」という概念は、科学の進歩が線形的・累積的ではなく、断絶と革命を経て展開されるという洞察を含んでいる。通常科学の時代においては、研究者は支配的なパラダイムの枠内で問題を解決することに専念し、パラダイムそのものを問い直すことはない。しかし、蓄積された「異常事例」がある臨界点を超えると、既存の枠組みでは説明できない現象が噴出し、科学革命が引き起こされる。このプロセスは、単なる知識の訂正ではなく、世界観そのものの転換を意味する。ニュートン力学から相対性理論への移行がその典型とされるが、新旧のパラダイム間には「通約不可能性」が存在し、両者を共通の基準で比較することには根本的な困難が伴う。科学の客観性を自明視する立場は、このパラダイム論を前にして再考を迫られるであろう。

質問：クーンのパラダイム論について、本文の内容に合うものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('通常科学の時代においても、研究者は積極的にパラダイムの転換を試みる。', false, 1),
  ('新旧のパラダイムは共通の基準で比較・評価することが容易である。', false, 2),
  ('科学の進歩は断絶と革命を含む非線形的なものであるとクーンは主張した。', true, 3),
  ('異常事例が蓄積されても、既存のパラダイムは原則として維持される。', false, 4)
) AS t(txt, ok, so);

-- Q04: 文化論・伝統と近代 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

「伝統」とは過去から受け継がれた不変の遺産であるという通念は、文化人類学的な視点から問い直される必要がある。エリック・ホブズボームが論じた「伝統の創造」という概念が示すように、多くの「古来の慣習」は近代において意図的に発明・制度化されたものであり、その起源は往々にして権力や国民国家形成のイデオロギーと結びついている。日本においても、明治期に整備された様々な「日本的」とされる文化様式は、西洋との差異化を図るために創出・強化された側面を持つ。こうした歴史的経緯を踏まえると、伝統の「純粋性」や「古さ」を根拠に特定の文化実践を正当化する言説は、その政治的文脈を看過する危険をはらんでいる。伝統とは静態的な実体ではなく、つねに現在の要請に応じて再解釈・再構成される動態的なプロセスである。

質問：「伝統の創造」という概念について、筆者の見解として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('伝統は文化の純粋な継承であり、政治的意図とは無関係に形成される。', false, 1),
  ('日本の伝統文化はすべて明治期に発明されたものであり、真の伝統は存在しない。', false, 2),
  ('伝統の古さを根拠に文化実践を正当化することは、つねに有効な論拠となる。', false, 3),
  ('多くの「伝統」は近代的な権力や国民国家形成の文脈で意図的に構築されたものだ。', true, 4)
) AS t(txt, ok, so);

-- Q05: 言語論・翻訳の不可能性 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

言語は単なる情報伝達の道具ではなく、思考そのものを形成する媒体である。ウィルヘルム・フォン・フンボルトが指摘したように、各言語はそれ固有の「世界観」を内包しており、異なる言語間の翻訳は等価な意味の移送ではなく、つねに何らかの意味の変容を伴う。たとえば、日本語の「木漏れ日」「物の哀れ」「間」といった概念は、他の言語に完全に翻訳することが極めて困難とされる。これは単に語彙の欠如ではなく、その概念を可能にする感性的・文化的文脈ごと移植する不可能性を示している。さらに言えば、翻訳という行為は原文と訳文の間に新たな第三のテクストを生み出す創造的営為でもある。完全な翻訳という理想は追求されるべき地平であって、達成可能な目標ではない。この認識こそが、翻訳者に課された根本的な倫理的条件であるといえよう。

質問：筆者が翻訳に対して述べている根本的な立場はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('完全な翻訳は原理的に不可能であり、翻訳は常に意味の変容を伴う創造的行為だ。', true, 1),
  ('翻訳技術の向上により、言語間の完全な等価移送は近い将来実現可能となる。', false, 2),
  ('「木漏れ日」などの語彙は造語によって他言語に容易に導入できる。', false, 3),
  ('各言語の世界観は本質的に同一であり、翻訳上の困難は表面的なものにすぎない。', false, 4)
) AS t(txt, ok, so);

-- Q06: 経済論・資本主義批判 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

資本主義経済の内的論理は、際限なき成長の追求を至上命題としている。企業は利潤の最大化を目指し、消費者は欲求の充足を繰り返す。この循環は経済的豊かさをもたらした反面、自然資源の収奪・環境破壊・人間の労働疎外という深刻な帰結を招いてきた。カール・マルクスはこの問題を「商品フェティシズム」という概念で捉え、人間関係が物象化され、商品の交換関係が社会関係を覆い隠す様相を描き出した。現代においては、金融資本が実体経済を凌駕し、投機的な資本の運動が社会的不安定をもたらす事態が顕在化している。資本主義の矛盾を乗り越えるためには、「成長の呪縛」から脱却し、豊かさの概念そのものを問い直す必要があると論じる経済思想家も少なくない。

質問：マルクスの「商品フェティシズム」について、本文ではどのように説明されているか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('人間が商品に対して宗教的な崇拝感情を抱く心理的現象のことだ。', false, 1),
  ('人間関係が物象化され、商品の交換関係が社会関係を覆い隠す様相のことだ。', true, 2),
  ('消費者が必要以上に商品を収集・蓄積しようとする経済行動のことだ。', false, 3),
  ('企業が利潤最大化のために商品の品質を意図的に低下させることだ。', false, 4)
) AS t(txt, ok, so);

-- Q07: 環境論・持続可能性 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

「持続可能な発展」という概念は、1987年のブルントラント委員会報告書で定式化されて以来、環境政策の中心的言説となってきた。しかしこの概念には根本的な緊張関係が内在している。「発展」は本来、生産・消費・エネルギー消費の拡大を志向するものであり、有限な地球の生態系容量とは原理的に相容れない側面を持つからだ。この矛盾を「技術革新による効率化」で解消しようとする立場があるが、効率化によって節約された資源が新たな消費に充てられる「リバウンド効果」の存在が、その楽観論に疑問を投げかける。真の持続可能性を追求するならば、成長そのものを善とみなす価値観を捨象し、定常型社会という新たな社会像を構想する必要があるかもしれない。環境問題は技術的課題であると同時に、文明の価値観に関わる哲学的問いでもある。

質問：「リバウンド効果」についての本文の説明として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('環境規制が強化されると企業が生産拠点を海外に移転する現象のことだ。', false, 1),
  ('省エネ技術の導入が消費者の環境意識を高め、購買行動を変える効果のことだ。', false, 2),
  ('効率化で節約された資源が別の新たな消費に充てられ、節約効果が相殺される現象だ。', true, 3),
  ('経済成長が環境負荷を高めた後、成熟段階で環境が改善に転じる逆U字型の曲線だ。', false, 4)
) AS t(txt, ok, so);

-- Q08: 教育論・主体性 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

近代教育の根底には、知識を「伝達」するという一方向的なモデルが刷り込まれてきた。教師が知識の権威として学習者に情報を注入するこの構図は、パウロ・フレイレが「銀行型教育」と呼んで批判したものである。フレイレによれば、この教育観は学習者を受動的な容器として扱い、批判的思考力と主体性の発達を阻害する。これに対して彼が提唱したのは、教師と学習者が対話を通じて共に現実を問い直す「問題提起型教育」であった。現代の教育改革においても「主体的・対話的で深い学び」が強調されているが、評価制度や管理的な学校文化がその実現を妨げているという指摘は多い。真の主体性は外部から与えられるものではなく、学習者が自らの問いを持ち、それを追究する経験の蓄積の中で育まれるものであろう。

質問：フレイレの「銀行型教育」批判において最も核心的な問題点とされているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('教師が学習者よりも優れた知識を持つという権威主義的な前提があること。', false, 1),
  ('試験と評価への過度な依存が学習意欲を損なっていること。', false, 2),
  ('学校教育が実社会の問題と切り離された抽象的な内容に終始していること。', false, 3),
  ('学習者を受動的な存在として扱い、批判的思考力と主体性の発達を阻害すること。', true, 4)
) AS t(txt, ok, so);

-- Q09: 政治哲学・民主主義 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

民主主義の正統性は「人民の意思」に依拠するとされるが、この「意思」の形成過程こそが問われるべき核心である。ユルゲン・ハーバーマスは「熟議民主主義」という構想において、合理的な議論と討議を通じて形成される公共的合意こそが民主的正統性の基盤になると論じた。しかし現実の民主政治においては、メディアによる世論操作・情報の非対称性・政治的無関心が、真の熟議を阻む構造的障壁となっている。さらに近年では、ソーシャルメディアが「エコーチェンバー」を生み出し、対立する意見に触れることなく自己の信念が強化される傾向が指摘されている。民主主義の危機は外部からの攻撃よりも、内部における熟議の質の劣化から生じているという見方は、政治哲学の重要な問題提起である。

質問：本文における民主主義の危機についての筆者の見解として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('民主主義の危機は外部的脅威よりも、内部での熟議の質の低下から生じている。', true, 1),
  ('ソーシャルメディアは多様な意見との接触を促し、民主主義を強化している。', false, 2),
  ('ハーバーマスの熟議民主主義は現代政治において完全に実現されている。', false, 3),
  ('政治的無関心は民主主義の安定に寄与するという逆説的な側面がある。', false, 4)
) AS t(txt, ok, so);

-- Q10: 芸術論・美の普遍性 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

美は普遍的なものか、それとも文化と時代に相対的なものか。この問いは美学の中心に位置し続けてきた。カントは『判断力批判』において、美的判断は個人の趣味に過ぎないにもかかわらず、万人の同意を要求する「普遍的妥当性への要求」という逆説的な構造を持つと論じた。一方、文化人類学の知見は、美の基準が文化によって大きく異なることを示している。西洋近代において「崇高」とされた自然の猛威は、別の文化では恐怖や穢れとして受け取られてきたという事例がその証左だ。この緊張関係を超えようとする立場として、美的経験の「形式的構造」に普遍性を見出しつつ、その内容は文化的に規定されるという折衷的な見解もある。美の問題は、認識論・文化論・倫理学が交差する複合的な問いであり、安易な一元化に抗する姿勢が求められる。

質問：カントの美的判断についての本文の説明として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('美的判断は完全に主観的なものであり、普遍的妥当性を主張することはできない。', false, 1),
  ('美的判断は個人の趣味でありながら、万人の同意を要求するという逆説的構造を持つ。', true, 2),
  ('美的判断は科学的・客観的な基準によって判定することが可能だと主張した。', false, 3),
  ('カントは文化人類学の視点から美の相対性を積極的に肯定した。', false, 4)
) AS t(txt, ok, so);

-- Q11: テクノロジー批評・AI論 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

人工知能の急速な発展は、知能・創造性・意識という概念の再定義を迫っている。大規模言語モデルは膨大な言語データから統計的パターンを学習し、人間が書いたものと区別しにくいテクストを生成する能力を獲得した。この現象は、人間の「知性」がパターン処理に過ぎないのか、それとも人工知能には本質的に欠けている何かが人間の知性には備わっているのかという問いを突きつける。哲学者ジョン・サールは「中国語の部屋」という思考実験で、構文論的処理は意味論的理解を伴わないと論じた。これに基づけば、AIがいかに流暢な言語を生成しようとも、それは意味を「理解」しているのではなく、形式的な操作を行っているにすぎない。人間とAIの境界線をどこに引くかは、技術的問題であると同時に、「人間であること」の本質に関わる哲学的問いでもある。

質問：サールの「中国語の部屋」が示している論点として、本文に沿ったものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('AIは人間よりも正確に言語を処理できるため、知能において人間を超えている。', false, 1),
  ('AIが生成する言語は人間のものと区別不能であるため、意識を持つとみなすべきだ。', false, 2),
  ('構文論的な形式処理は意味論的理解を保証しないという論点を示している。', true, 3),
  ('AIによる言語生成は、人間の創造性とは根本的に異なる芸術的表現だ。', false, 4)
) AS t(txt, ok, so);

-- Q12: 人類学・文化相対主義 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

文化相対主義は、各文化をその固有の文脈の中で理解すべきであり、外部の基準によって評価・批判することを戒める立場である。19世紀の人類学が西洋文明を進歩の頂点として他文化を「未開」と位置づけた自民族中心主義への批判として登場したこの概念は、文化の多様性を尊重する思想的根拠となってきた。しかしその徹底した適用は、深刻な問題をはらむ。女性への暴力・子どもの権利侵害・特定集団の差別といった人権侵害が「文化的慣習」として正当化されるとき、相対主義的立場はそれを批判する論拠を失ってしまうからだ。この困難は「相対主義のジレンマ」とも呼ばれ、普遍的人権という概念との緊張関係を生み出している。文化的多様性への敬意と、超文化的な倫理規範の必要性をいかに調和させるかは、現代の人類学と哲学が格闘し続ける問いである。

質問：文化相対主義の「ジレンマ」として本文が示している問題はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('各文化を対等に扱うと、西洋文化の優位性を正当化できなくなるという問題。', false, 1),
  ('文化相対主義を徹底すると、異文化間の対話や相互理解が不可能になるという問題。', false, 2),
  ('すべての文化を等価に扱うと、人類学者がフィールドワークを行えなくなるという問題。', false, 3),
  ('文化的慣習として行われる人権侵害を批判する倫理的根拠が失われるという問題。', true, 4)
) AS t(txt, ok, so);

-- Q13: 倫理学・功利主義 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

功利主義は「最大多数の最大幸福」を道徳的行為の基準として掲げる倫理理論であり、ジェレミー・ベンサムとジョン・スチュアート・ミルによって体系化された。この理論の強みは、行為の結果に着目することで道徳的判断に客観的・計算可能な基盤を与えようとする点にある。しかし功利主義は根本的な批判にも直面する。最も著名なのは「多数決の専制」という問題であり、多数派の幸福のために少数派の権利が犠牲にされることを原理的に容認しかねない。また、人間の尊厳や権利を「効用の計算」に還元することへの抵抗も根強い。カントの義務論的倫理学はこれに対置され、行為の結果ではなく意図と普遍化可能な義務を道徳判断の基軸とする。両理論の対立は現代の応用倫理学においても未解決であり、医療・法・政策の場面で繰り返し問い直されている。

質問：功利主義の弱点として、本文が述べていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('多数派の幸福のために少数派の権利が犠牲にされることを容認しかねない点。', true, 1),
  ('道徳判断において主観的な感情に過度に依存している点。', false, 2),
  ('行為の結果ではなく意図のみを評価基準とすることで実用性を欠く点。', false, 3),
  ('宗教的・形而上学的な前提に基礎を置くため普遍性を持ち得ない点。', false, 4)
) AS t(txt, ok, so);

-- Q14: 社会学・個と集団 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

近代的自我は、共同体から分離した自律的な個人という像として語られてきた。しかし社会学的な視点から見ると、自己は社会的相互作用の産物であり、個人の意識・欲望・価値観は社会構造によって深く規定されている。ジョージ・ハーバート・ミードは「自己は社会的過程の産物であって、先行する前提ではない」と論じ、他者との相互作用を通じて自我が形成されるメカニズムを解明しようとした。この観点は、社会問題の責任を個人に帰着させる議論への反証となる。貧困・犯罪・精神疾患といった問題を「個人の失敗」として処理することは、それらを生み出す社会構造の責任を不可視化することにつながる。自由で自律した個人という理念は否定されるべきではないが、その個人が社会関係の網の目に埋め込まれているという認識は、社会制度のあり方を問い直す上で不可欠の前提となる。

質問：ミードの自我論について、本文が示している内容として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('自我は生物学的に先天的に決定されており、社会経験によっては変容しない。', false, 1),
  ('自己は社会的相互作用を通じて形成されるものであり、先行する実体ではない。', true, 2),
  ('ミードは近代的個人の自律性を肯定し、社会の影響力を過小評価した。', false, 3),
  ('他者との相互作用は自我の形成を妨げ、真の個性の発現を阻害する。', false, 4)
) AS t(txt, ok, so);

-- Q15: 認知科学・記憶と自己 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

記憶は過去の出来事の忠実な記録ではない。認知科学の知見によれば、記憶は想起するたびに再構成され、現在の感情・信念・文脈によって書き換えられる動態的なプロセスである。エリザベス・ロフタスの実験は、誘導的な質問によって偽の記憶が容易に植え付けられることを実証した。これは目撃証言の信頼性という法的問題のみならず、自己同一性という哲学的問題にも深く関わっている。「私は誰であるか」という問いへの答えは、過去の記憶の連続性に基づくとされてきたが、その記憶自体が可塑的であるならば、自己とは固定した実体ではなく、絶えず再解釈される物語の集積に過ぎないことになる。これは自己の統一性を支える基盤そのものを揺るがす洞察であり、意識・同一性・責任をめぐる議論に新たな問いを投げかける。

質問：本文における「記憶の可塑性」が自己同一性の問題に対して持つ含意として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('記憶は不変のものであり、自己同一性は記憶の連続性によって安定的に維持される。', false, 1),
  ('記憶の再構成は自己成長の証拠であり、人格の発展を示すものだ。', false, 2),
  ('記憶が可塑的であるなら、自己とは固定した実体ではなく絶えず再解釈される物語だ。', true, 3),
  ('偽の記憶が植え付けられることは稀であり、通常の記憶は信頼できる。', false, 4)
) AS t(txt, ok, so);

-- Q16: 比較文明論 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

サミュエル・ハンチントンは冷戦後の国際秩序を論じるにあたり、対立の主軸がイデオロギーから文明へと移行したと主張した。彼の「文明の衝突」論は、世界をキリスト教・イスラム・儒教・ヒンドゥーなど複数の文明圏に分割し、それらの間の断層線が将来の紛争の主要な震源になると予測した。この図式は冷戦的二元論に代わる分析枠組みとして広く流布したが、同時に根強い批判も受けてきた。文明を均質な単位として扱うことは、各文明内部の多様性・矛盾・変容を捨象するという問題を持つ。またこの枠組みは、自己成就的予言として機能し、文明間の対立を現実化する危険もはらむ。文明の「境界」は侵犯不可能な壁ではなく、交流・混淆・翻訳が生じる接触地帯（コンタクト・ゾーン）でもある。文明論は有効な分析枠組みと政治的危険性の両側面を持つものとして批判的に扱う必要がある。

質問：本文がハンチントンの「文明の衝突」論に対して指摘している問題点はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('冷戦後の世界をイデオロギー対立として捉え続けた点で時代遅れだ。', false, 1),
  ('文明圏の数を少なく設定しすぎており、現実の多様性を反映していない。', false, 2),
  ('文明を地理的・民族的要素のみで規定し、経済的格差を無視している。', false, 3),
  ('文明内の多様性を捨象し、対立を現実化する自己成就的予言になる危険がある。', true, 4)
) AS t(txt, ok, so);

-- Q17: 生命倫理 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

生命科学技術の発展は、かつては神や自然に委ねられていた領域に人間の意図的介入を可能にし、倫理的判断の新たな地平を切り開いた。ゲノム編集技術の発達は、遺伝性疾患の根治という画期的な可能性を示す一方、「デザイナーベビー」と呼ばれる遺伝形質の選択的改変への道を開くリスクをはらむ。これは優生学の歴史的文脈と不可分に結びついており、ナチスドイツによる優生政策の悲劇を想起させる。しかし、遺伝性疾患を持つ可能性を排除することと、特定の能力や外見を選択することの間に、原理的に明確な線引きは可能なのか。「治療」と「強化」の境界は技術的に自明ではなく、価値観と社会的文脈によって規定される。生命倫理は技術の暴走を防ぐ役割を担うとともに、その判断基準そのものを社会的な熟議の対象にし続ける責務を負っている。

質問：本文で「治療」と「強化」の区別について述べられていることとして最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('その境界は技術的に自明ではなく、価値観や社会的文脈によって規定されるものだ。', true, 1),
  ('遺伝性疾患の排除は治療であり、能力選択は強化であることが医学的に明確だ。', false, 2),
  ('ゲノム編集は治療にのみ使用が許可されており、強化目的の使用は禁止されている。', false, 3),
  ('治療と強化の区別は無意味であり、ゲノム技術の利用は全面的に推進すべきだ。', false, 4)
) AS t(txt, ok, so);

-- Q18: 情報論・デジタル化 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

デジタル化の進展は情報へのアクセスを民主化したという言説がある一方で、情報の過多がかえって判断力の麻痺を招くという逆説も生じている。インターネット上では玉石混淆の情報が等価に流通し、真偽の判別に高度なリテラシーが要求される。さらに、プラットフォームのアルゴリズムが「関心経済」に基づいて個人の閲覧履歴に最適化されたコンテンツを提示する結果、利用者は自分の信念を強化する情報だけを効率よく摂取するフィルターバブルの中に閉じ込められる。この状況は、多様な視点との対話を通じて形成される「公共圏」の成立を阻害する。デジタル化の恩恵を活かしながら、その構造的問題を批判的に問い直す能力——すなわちメディアリテラシーの涵養——は、今日の市民的素養として不可欠の位置を占めるに至っている。

質問：本文における「フィルターバブル」の問題として述べられていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('大量のフィルタリングによって必要な情報が届かなくなることで生産性が低下する問題。', false, 1),
  ('自分の信念を強化する情報のみを摂取し多様な視点との対話が阻害される問題。', true, 2),
  ('フィルタリングシステムの誤作動により重要なニュースが遮断される技術的問題。', false, 3),
  ('プラットフォームが個人情報を収集・販売することによるプライバシー侵害の問題。', false, 4)
) AS t(txt, ok, so);

-- Q19: 都市論・空間と人間 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

都市は単なる人口集積地ではなく、人間の欲望・権力・排除の論理が空間に刻み込まれた場所である。アンリ・ルフェーブルは「空間の生産」という概念において、空間は社会的に構築されるものであり、資本主義の論理がいかに都市空間を均質化・商品化するかを分析した。再開発によって歴史的な街並みが解体され、均質な商業空間に置き換えられるとき、そこに生きていた記憶と共同体の紐帯も失われる。また、都市空間はつねに「誰のための空間か」という問いを内包しており、排除の仕組みが空間設計に埋め込まれることがある。ホームレスが横になれないよう設計されたベンチや、監視カメラによる常時監視はその象徴的事例だ。「都市への権利」という概念は、住民が単に都市の中に居住するだけでなく、都市空間そのものを集合的に形成・変容させる権利を持つべきだという主張を含んでいる。

質問：「都市への権利」について、本文が示している内容として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('住民が都市の商業施設やサービスを自由に利用できる経済的権利のことだ。', false, 1),
  ('外国人労働者が都市に居住し就労する権利を法的に保障するべきという主張だ。', false, 2),
  ('住民が都市空間を集合的に形成・変容させる権利を持つべきだという主張だ。', true, 3),
  ('地方から都市への移住を自由化し、住居選択の権利を拡大すべきという政策論だ。', false, 4)
) AS t(txt, ok, so);

-- Q20: 文学論・虚構と現実 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

文学における「虚構」は、現実を模倣した二次的産物ではなく、現実を認識し直すための独自の認識装置である。アリストテレスは詩学において、詩は歴史よりも普遍的なものを語ると論じたが、これは虚構が特殊な出来事を通じて人間の普遍的真理に触れ得るという洞察を示している。現代の文学理論は、虚構と現実の境界の複雑さをさらに掘り下げる。いわゆる「メタフィクション」は物語内で自己の虚構性を暴露し、読者に表象と現実の関係を問い直させる。一方、フィクションが歴史的トラウマを語る手段として機能する場合、虚構は現実の出来事の記録や証言の不可能性を補完する倫理的責務をも担う。「作り話」に過ぎないはずの文学が人間の共感を喚起し、社会の変革に寄与してきたという事実は、虚構の力が現実に深く根を張っていることを示している。

質問：本文における文学の「虚構」についての筆者の見解として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('虚構は現実の正確な模写を目的とし、それに失敗した文学は価値を持たない。', false, 1),
  ('虚構は現実とは完全に切り離された美的自律の領域であり、倫理的責務を持たない。', false, 2),
  ('文学は科学的真実よりも価値が低い認識形式であり、補助的な役割にとどまる。', false, 3),
  ('虚構は現実認識の装置であり、普遍的真理への接近や倫理的責務をも担い得る。', true, 4)
) AS t(txt, ok, so);

-- Q21: 哲学・時間論 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

時間とは何か。この問いはアウグスティヌスが「誰も私に問わなければ知っている、しかし説明しようとすると分からなくなる」と嘆いたように、最も身近でありながら最も難解な哲学的問いの一つである。物理学的時間は、ニュートン的な絶対時間から相対性理論における時空の曲率へと概念が刷新されたが、意識における時間体験はそれとは別の問題を提示する。フッサールの現象学は、時間意識を過去把持・現在・未来予持という三重の構造として分析し、意識が「流れる時間」をいかに統一的に捉えるかを記述しようとした。しかしこの分析は、意識の外に客観的時間が存在するかどうかという問いを残す。現在という「今」は把捉しようとした瞬間に過ぎ去り、過去となる。時間の流れを「経験する」主体とは何か——この問いは意識の本性にまで立ち返らざるを得ない。

質問：フッサールの時間意識分析について、本文が述べていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('時間意識を過去把持・現在・未来予持という三重構造として分析した。', true, 1),
  ('相対性理論の時空概念を現象学的に再解釈し、物理学と哲学を統合した。', false, 2),
  ('客観的時間の存在を確証し、意識における時間体験との一致を証明した。', false, 3),
  ('時間とは幻想であり、意識が作り出した主観的な秩序に過ぎないと論じた。', false, 4)
) AS t(txt, ok, so);

-- Q22: 社会批評・メディア論 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

マーシャル・マクルーハンが「メディアはメッセージである」と宣言したのは1960年代のことだが、この命題の含意は今日においていっそう深い現実性を帯びている。彼の主張の核心は、メディアが伝達する「内容」よりも、メディアそのものの形式が人間の知覚様式・社会構造・思考の様相を根本的に変容させるという洞察にある。印刷術の発明が線形的・分析的な思考様式を普及させ、電子メディアの登場が「地球村」的な同時性と感覚の再統合をもたらしたというのが彼の図式である。SNSの時代においてこの洞察を敷衍すれば、短文と視覚的コンテンツを優先するプラットフォームの設計は、深く持続的な思考よりも即時の感情的反応を促す認知様式を社会に定着させているといえよう。メディアを批判的に問い直すことは、自らの思考の形式そのものを問い直すことでもある。

質問：マクルーハンの「メディアはメッセージである」という命題の核心として、本文が示しているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('メディアが伝達する内容の正確性こそが、社会的影響力の源泉だということ。', false, 1),
  ('メディアの形式そのものが、人間の知覚様式や思考の様相を根本的に変容させること。', true, 2),
  ('電子メディアは印刷術よりも優れた情報伝達手段であり、民主主義を強化すること。', false, 3),
  ('メッセージの内容はメディアの種類に関係なく一定の形式で受容されるということ。', false, 4)
) AS t(txt, ok, so);

-- Q23: 経済思想・ポスト成長 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

GDP（国内総生産）の増大を豊かさの指標とする近代経済学のパラダイムに対し、「脱成長」（デクロワサンス）を掲げる経済思想が注目を集めている。この立場は、無限の経済成長という前提が有限な地球の生態系と根本的に矛盾するという認識に立ち、成長の量的拡大ではなく生活の質的充実と社会的公正を優先すべきだと主張する。セルジュ・ラトゥーシュらはこの立場から、労働時間の短縮・地域経済の再生・消費主義からの解放を具体的な施策として提唱している。批判者は、脱成長論が雇用の喪失や福祉水準の低下をもたらすと危惧するが、支持者はGDPに依拠しない豊かさの指標を導入することで、成長なき繁栄の可能性を論証しようとしている。脱成長論の台頭は、経済学の前提そのものを問い直す思想的転換の兆候として捉えることができる。

質問：「脱成長」論の基本的な主張として、本文の内容に沿ったものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('GDP成長を維持しながら環境負荷を削減する「グリーン成長」を推進すべきだ。', false, 1),
  ('発展途上国の経済成長を優先し、先進国は消費を縮小すべきだ。', false, 2),
  ('量的な経済拡大よりも生活の質的充実と社会的公正を優先すべきだと主張する。', true, 3),
  ('貨幣経済を廃止し、物々交換に基づく地域コミュニティを再建すべきだ。', false, 4)
) AS t(txt, ok, so);

-- Q24: 文化人類学・儀礼 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

儀礼はあらゆる文化において見出されるが、その意味と機能は単純ではない。アーノルド・ファン・ヘネップの「通過儀礼」論は、人生の主要な転換点（誕生・成人・結婚・死）に際して行われる儀礼が、「分離→移行→統合」という三段階の構造を持つことを明らかにした。この枠組みは後にヴィクター・ターナーによって発展させられ、移行段階の「リミナリティ（閾性）」という概念が提唱された。リミナリティとは、旧来の地位や役割から切り離されながらも新たな地位に未だ組み込まれていない「あいだ」の状態であり、この状態には日常的な社会秩序が一時的に解体されるとともに、集合的な連帯感（コムニタス）が生じるという特質がある。儀礼は社会秩序を再生産するだけでなく、そのリミナルな次元において既存の秩序を相対化し、変革の萌芽をも内包するものとして理解できる。

質問：「リミナリティ」について、本文が説明している内容として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('通過儀礼の最終段階であり、個人が新たな社会的地位に完全に統合された状態だ。', false, 1),
  ('儀礼の準備段階で行われる神聖な行為のことであり、地域差が大きい。', false, 2),
  ('社会秩序の崩壊を防ぐために儀礼が機能する調整的メカニズムのことだ。', false, 3),
  ('旧来の地位から切り離され新たな地位に未だ組み込まれていない移行の「あいだ」の状態だ。', true, 4)
) AS t(txt, ok, so);

-- Q25: 認識論・客観性 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

「客観性」は近代科学の根幹をなす規範概念であるが、その実質は単純ではない。ダナ・ハラウェイは「状況的知識」という概念を提唱し、いわゆる客観的な「神の眼差し」——どこからでもない視点——の不可能性を指摘した。あらゆる知識は特定の身体・位置・社会的文脈から産出されており、それを覆い隠すことで普遍的客観性を偽装する言説は、特定の権力の視点を「中立」として押し付けるイデオロギー的機能を果たすというのである。これはニーチェが述べた「事実はなく、解釈だけがある」という認識論的相対主義に通じる側面を持つが、ハラウェイ自身はラディカルな相対主義に陥ることを拒み、「部分的視点」の自覚と開示に基づく責任ある知識生産の可能性を擁護する。客観性を廃棄するのではなく、その概念を再構築することが現代認識論の課題である。

質問：ハラウェイの「状況的知識」の核心的主張として、本文に沿ったものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('あらゆる知識は特定の位置と文脈から産出されており、「神の眼差し」的客観性は不可能だ。', true, 1),
  ('科学的知識は観察者の主観を完全に排除することで真の客観性に到達できる。', false, 2),
  ('すべての知識は相対的であり、どの視点も等しく有効または無効だ。', false, 3),
  ('知識の客観性は社会的合意によって決定されるものであり、個人の視点は無意味だ。', false, 4)
) AS t(txt, ok, so);

-- Q26: 環境哲学・自然観 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

近代西洋の自然観は、デカルト的二元論に基づき、人間（精神）を自然（物質）から分離し、後者を前者が支配・利用すべき対象として位置づけてきた。この世界観は産業革命以降の自然資源の収奪と環境破壊を正当化するイデオロギー的基盤となったと批判される。これに対し、深層生態学（ディープ・エコロジー）は人間中心主義を根本から問い直し、生態系そのものが内在的価値を持ち、人間の利用価値とは独立して尊重されるべきだと主張する。日本の伝統的な「もののあわれ」や「山川草木悉皆成仏」という思想も、自然との融合・共生という別種の自然観を内包していると指摘されることがある。現代の環境倫理学は、どのような自然観に基づいて人間と自然の関係を再定義するかという問いを、哲学と政治学と生態学の交差点において問い続けている。

質問：「深層生態学」の立場として、本文が述べていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('人間中心主義を徹底させ、自然を効率的に管理・活用する技術開発を優先すべきだ。', false, 1),
  ('生態系は人間の利用価値とは独立した内在的価値を持ち、尊重されるべきだと主張する。', true, 2),
  ('日本の伝統的自然観を西洋哲学に統合し、新たな環境倫理学を構築すべきだ。', false, 3),
  ('環境問題の解決はもっぱら技術革新によって達成可能であり、哲学的議論は不要だ。', false, 4)
) AS t(txt, ok, so);

-- Q27: 政治論・公共性 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

ハンナ・アーレントは「公共圏」という概念において、人々が言葉と行為を通じて互いに顔を見せ合い、共に世界を形成するという政治的生の本質を描き出した。彼女にとって「公的なもの」とは、単に国家や行政機構に関わるものではなく、複数の人間が共に現れ、互いに見られ、聞かれるという現象空間を意味する。この公共圏は、労働と仕事という私的・経済的活動とは原理的に区別される。近代においては経済的合理性が政治の領域に浸透し、「政治の経済化」が進んだことで、本来の政治的行為——目的のない自発的な始まりの行為——が失われつつあるとアーレントは懸念した。この洞察は、市民参加を「効率的な行政への協力」として位置づける現代的言説への批判的視座を提供している。

質問：アーレントの「公共圏」について、本文の説明として最も正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('公共圏とは国家や行政機構が管理する制度的な空間のことだ。', false, 1),
  ('公共圏は経済的活動と政治的活動を統合した総合的な社会システムだ。', false, 2),
  ('公共圏とは人々が言葉と行為を通じて互いに現れ、共に世界を形成する現象空間だ。', true, 3),
  ('近代において公共圏は拡大し、市民の政治参加が活発化したとアーレントは評価した。', false, 4)
) AS t(txt, ok, so);

-- Q28: 芸術哲学・創造性 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

創造性とは「無から有を生み出す」能力と一般に理解されるが、この直観的なイメージは精査に耐えない。芸術的・科学的な創造は常に既存の素材・概念・様式との対話を前提とし、完全な無前提からは何も生まれない。T・S・エリオットは「未熟な詩人は模倣し、成熟した詩人は盗む」と逆説的に述べたが、これは創造の本質が独自の変容と統合にあることを示唆している。認知科学の観点からは、創造性は「遠く隔たった概念の意外な結合」として定義されることもある。また、芸術における「独創性」の強調は近代のロマン主義的芸術観に由来するものであり、前近代の多くの文化では匿名的・集合的な制作が創造の主要な形態であった。創造性の概念を脱神話化し、その社会的・文化的・認知的な条件を問うことは、芸術実践の理解を深めると同時に、教育や産業における創造性の「育成」のあり方にも示唆を与える。

質問：筆者の「創造性」に関する立場として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('真の創造性は完全に個人の内側から生まれるものであり、外的影響を排すべきだ。', false, 1),
  ('創造性はロマン主義的芸術観の中核概念であり、前近代には存在しなかった。', false, 2),
  ('創造性は模倣に過ぎず、真の意味での独創的な作品は存在しないと断言できる。', false, 3),
  ('創造性は既存の素材との対話と変容を前提とし、社会的・認知的条件を伴うものだ。', true, 4)
) AS t(txt, ok, so);

-- Q29: 教育哲学・知識の本質 answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

「知識とは何か」という問いは、教育の目的を根本から規定する。マイケル・ポランニーが提唱した「暗黙知」の概念は、明示的に言語化・体系化できる知識（形式知）の背後に、言葉では完全に伝達し得ない実践的・技能的な知の領域が広がることを示した。「自転車の乗り方を知っている」ことと「自転車の乗り方を言語で説明できる」ことは別であり、後者が前者を網羅しないのと同様に、学校教育が伝達し得る知識には構造的な限界がある。ジョン・デューイは「なすことによって学ぶ（learning by doing）」という理念を掲げ、経験と反省的思考の統合こそが真の学びを生むと論じた。知識をデータや命題の集合として捉える還元主義的な教育観は、こうした実践的知の次元を見落とすことで、「知っているが使えない」という逆説的状況を生み出しかねない。

質問：ポランニーの「暗黙知」概念についての本文の説明として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('言語化・体系化できる形式知の背後に、言葉では完全に伝達し得ない実践的知がある。', true, 1),
  ('暗黙知とは無意識の記憶のことであり、意識的な努力によって形式知に変換できる。', false, 2),
  ('教育における暗黙知の育成は、標準化されたカリキュラムによって実現可能だ。', false, 3),
  ('デューイの「なすことによって学ぶ」とは本質的に同一の概念である。', false, 4)
) AS t(txt, ok, so);

-- Q30: テクノロジー論・人間拡張 answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

トランスヒューマニズムは、テクノロジーによって人間の身体的・認知的・道徳的能力を飛躍的に向上させ、老化・疾患・死すら克服しようとする思想的・技術的潮流である。ニック・ボストロムらの論者は、人間を「進化の未完成品」として捉え、意図的な自己改良こそが人類の使命であると主張する。しかしこの立場には根深い批判がある。まず、「改良」の基準は誰が定めるのかという問いは、優生学の亡霊を想起させる。次に、エンハンスメント技術が高価である場合、その恩恵は富裕層のみに帰し、生物学的格差という新たな不平等の次元を生み出しかねない。さらに根本的な問いとして、有限性・脆弱性・老いといった条件こそが人間的経験に深みと意味を与えているとすれば、それらの克服は「より良い人間」を生み出すのか、それとも「別の何か」を生み出すのかという哲学的問いが残る。

質問：トランスヒューマニズムに対する批判として、本文が述べているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('テクノロジーによる人間拡張は現在の科学水準では実現不可能な空想に過ぎない。', false, 1),
  ('エンハンスメント技術の恩恵が富裕層に偏り、生物学的格差という新不平等を生む可能性。', true, 2),
  ('老化や死を克服することは宗教的・倫理的観点から絶対に許容できない行為だ。', false, 3),
  ('人間の脳はAIと異なり、外部技術との統合には生物学的な制約がある。', false, 4)
) AS t(txt, ok, so);

-- Q31: 社会哲学・自由と責任 answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

自由と責任は近代倫理の双生概念であり、互いに前提し合いながら緊張関係を保つ。自由意志に基づく選択があって初めて責任が帰属できるという構図は、法学・倫理学・日常的な道徳感覚にまで深く浸透している。しかし、決定論的な自然科学の世界観——すべての出来事は先行する原因の結果であるという見方——は、自由意志の存在そのものを問い直す。人間の思考・感情・選択が脳神経過程の産物であり、その過程が物理法則に従うとすれば、「自分でそうしようと思ってした行為」も、厳密には別様でありえなかったことになる。この問題に対し、「両立論」は自由意志と決定論が矛盾しないと論じる。強制や外的抑圧がない状態での行為を「自由」と定義すれば、その行為が因果連鎖の産物であっても責任の帰属は可能だというわけだ。自由と責任をめぐる問いは、AIによる意思決定の責任帰属という現代的問題にも直結している。

質問：「両立論」について、本文が示している内容として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('決定論が正しいなら自由意志は存在せず、道徳的責任の概念は廃棄されるべきだ。', false, 1),
  ('自由意志は脳科学によって完全に否定されており、責任は社会的フィクションである。', false, 2),
  ('強制や外的抑圧がない状態での行為を自由と定義すれば、決定論と責任は両立できる。', true, 3),
  ('自由意志は形而上学的問題に過ぎず、倫理学・法学への実践的影響はない。', false, 4)
) AS t(txt, ok, so);

-- Q32: 文明論・グローバル化と多様性 answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

グローバル化は文化の均質化をもたらすという警戒論と、新たな混淆・創造を促すという楽観論の間で評価が分かれてきた。前者の立場は、英語の覇権・多国籍企業による文化産業の世界的展開・大衆消費文化の拡散によって、固有の地域文化や言語が侵食・消滅の危機にさらされていると訴える。一方後者は、「グローカリゼーション」という概念が示すように、グローバルな文化要素が地域的な文脈の中で独自に再解釈・変容される過程に注目する。ジャズがアメリカ南部から世界に広まり、各地域で独自の表現形態を生み出した過程はその典型例とされる。重要なのは、文化の多様性を単に「守るべき遺産」として静態的に把握するのではなく、異なる文化が接触し、互いに変容しながら新たな表現を生み出す動態的なプロセスとして理解することである。多様性の価値は固定した純粋性の保存にあるのではなく、創造的な接触と変容の持続にこそあるといえよう。

質問：「グローカリゼーション」について、本文の内容に沿った説明はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('グローバルな多国籍企業が地域市場に参入し、地域経済を活性化させる現象のことだ。', false, 1),
  ('先進国の文化が発展途上国に一方向的に輸出・普及していく均質化プロセスのことだ。', false, 2),
  ('地域の文化団体がグローバルなネットワークを通じて伝統文化を保護する活動のことだ。', false, 3),
  ('グローバルな文化要素が地域的文脈の中で独自に再解釈・変容されるプロセスのことだ。', true, 4)
) AS t(txt, ok, so);
