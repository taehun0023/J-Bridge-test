-- encoding: UTF-8
-- JLPT N2 Reading Pool Questions — n2_pool_reading_1.sql
-- quiz_id: bb000002-0000-0000-0000-000000000002 (N2 読解テスト拡充)
-- 35 original questions, question_category='reading', points=1, is_published=true
-- Topics: 説明文×10, 論説文×8, メール×5, 案内・通知×6, 随筆×6
-- Answer position distribution: 1→9, 2→9, 3→9, 4→8
-- All passages are original works — no reproduction of published exam materials

-- Q01: 電子書籍の普及 (説明文) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

近年、スマートフォンやタブレット端末の普及に伴い、電子書籍を利用する人が増えている。電子書籍の最大の利点は、何百冊もの本を一台の端末に収納できることだ。重い本を何冊も持ち歩く必要がなくなり、移動中でも手軽に読書が楽しめる。また、紙の本と比べて価格が安いケースも多く、絶版になった書籍が電子版として復刊されることもある。
一方、電子書籍には課題もある。長時間画面を見続けると目が疲れやすく、紙の本とは異なる読書体験となる。また、サービスが終了した場合、購入済みのコンテンツが読めなくなるリスクもある。さらに、書店で本を手に取り、表紙や帯を見ながら選ぶという体験は、電子書籍では味わいにくい。
こうした長所と短所を踏まえ、紙の本と電子書籍を目的に応じて使い分ける人も多い。どちらが優れているという問題ではなく、読者自身がライフスタイルに合わせて選択すればよいだろう。

質問：本文で電子書籍のデメリットとして挙げられているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('重い本を何冊も持ち歩かなければならない。', false, 1),
  ('サービスが終了すると購入済みコンテンツが読めなくなるリスクがある。', true, 2),
  ('紙の本より価格が高く、経済的な負担が大きい。', false, 3),
  ('電子書籍は絶版本を入手できないという問題がある。', false, 4)
) AS t(txt, ok, so);

-- Q02: 日本の少子化問題 (説明文) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本では出生率の低下が長年の課題となっており、2023年には合計特殊出生率が過去最低水準を更新した。少子化の背景には、晩婚化・非婚化の進行、子育てにかかる経済的負担の増大、女性の社会進出に伴うキャリアと育児の両立の難しさなどが挙げられる。
政府はこの問題に対処するため、保育所の拡充や育児休業の取得促進、児童手当の拡充などの施策を打ち出してきた。しかし、これらの施策が少子化の流れを逆転させるには至っていないとの見方が多い。
少子化が進むと、労働力不足・社会保障費の増大・地域経済の縮小といった問題が深刻化する。専門家の中には、子育て支援だけでなく、働き方改革や住宅支援など、社会全体の構造を変えることが必要だと指摘する声もある。少子化対策は、個人の選択を尊重しながらも、社会として取り組むべき重要な課題である。

質問：本文で少子化の背景として挙げられていないものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('晩婚化・非婚化の進行', false, 1),
  ('子育てにかかる経済的負担の増大', false, 2),
  ('高齢者の医療費増大による財政圧迫', true, 3),
  ('キャリアと育児の両立の難しさ', false, 4)
) AS t(txt, ok, so);

-- Q03: 職場のハラスメント対策 (説明文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

職場におけるハラスメントは、被害者の心身に深刻なダメージを与えるだけでなく、職場全体の生産性や士気にも悪影響を及ぼす。パワーハラスメント・セクシャルハラスメント・マタニティハラスメントなど、その種類は多岐にわたる。
2020年に施行された改正労働施策総合推進法（通称「パワハラ防止法」）により、大企業には職場のパワーハラスメント防止のための措置が義務化された。中小企業については2022年から義務化となり、これにより全ての事業主がハラスメント防止に取り組む法的義務を負うことになった。
企業がとるべき対策としては、就業規則への明記、相談窓口の設置、管理職への研修実施などが挙げられる。しかし制度を整えるだけでは不十分であり、経営層が率先してハラスメントを許さない姿勢を示し、組織文化として根づかせることが重要だとされている。

質問：パワハラ防止法について、本文の内容と合うものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('2022年から全ての事業主にパワーハラスメント防止措置が義務づけられた。', true, 1),
  ('パワハラ防止法は2018年に施行された。', false, 2),
  ('パワハラ防止法では相談窓口の設置のみが義務とされている。', false, 3),
  ('中小企業は現在もパワハラ防止の法的義務を負っていない。', false, 4)
) AS t(txt, ok, so);

-- Q04: 日本の観光業の変化 (論説文) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

インバウンド観光、すなわち外国人旅行者の訪日が増加するにつれ、日本の観光地では様々な変化が生じている。かつては一部の有名観光地に集中していた外国人観光客が、近年は地方の小さな町や農村にも足を延ばすようになった。これは「分散型観光」と呼ばれ、地域経済の活性化につながると期待されている。
しかし一方で、観光客の急増によって地域住民の生活環境が悪化する「オーバーツーリズム」が問題となっている。特定の観光地では、バスやレストランが混雑し、静かな暮らしを求める住民との摩擦が生じている。また、マナーを守らない観光客による撮影トラブルや、ゴミのポイ捨てなども課題として浮上している。
観光振興と地域生活の両立を図るには、観光客の分散・入場制限・マナー啓発など、自治体と観光事業者が連携した総合的な取り組みが必要である。観光業を持続可能なかたちで発展させることが、地域の長期的な利益につながると考えられる。

質問：オーバーツーリズムとはどのような問題か。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('外国人観光客が地方に来ず、一部の大都市にしか訪れないこと', false, 1),
  ('観光振興のための予算が不足していること', false, 2),
  ('農村部の観光資源が活用されず廃れていること', false, 3),
  ('観光客の急増により地域住民の生活環境が悪化すること', true, 4)
) AS t(txt, ok, so);

-- Q05: 職場体験学習のご案内 (案内) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

中学生の皆さんへ

今年度も職場体験学習を実施いたします。本プログラムは、地域の企業・施設に実際に訪問し、働くことの意味やマナーを体験的に学ぶことを目的としています。

実施期間：11月18日（月）〜 11月20日（水）の3日間
対象：中学2年生全員
受け入れ先：市内40か所（医療・飲食・小売・IT・福祉など）
申し込み：10月25日までに担任の先生へ第1希望から第3希望を提出すること

※ 受け入れ先によって集合時間・場所が異なります。詳細は決定後に個別に連絡します。
※ 体験中は制服着用。スマートフォンの使用は休憩時間のみとします。
※ 欠席する場合は、前日の午後5時までに担任へ連絡してください。

ご不明な点は、進路指導担当（山田先生）までお問い合わせください。

進路指導部

質問：この案内の内容と合うものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('職場体験学習への参加は希望者のみである。', false, 1),
  ('希望先は第1希望から第3希望まで提出する必要がある。', true, 2),
  ('体験中はスマートフォンを自由に使用してよい。', false, 3),
  ('集合時間・場所は全員同じである。', false, 4)
) AS t(txt, ok, so);

-- Q06: 日本語学習者の増加 (論説文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

世界中で日本語を学ぶ人の数が増え続けている。国際交流基金の調査によると、海外の日本語学習者数は近年大幅に増加しており、アジアを中心に若い世代の間で日本語への関心が高まっている。その背景には、アニメや漫画・ゲームなどの日本のポップカルチャーへの人気が大きく影響している。
また、日本企業への就職や日本への留学を目指して日本語を学ぶ人も多い。特にIT分野では日本の企業が海外人材を積極的に採用しており、日本語能力が就職の条件となるケースもある。こうした実用的な動機が学習者の増加を後押ししている。
一方で、日本語は習得が難しい言語のひとつとされており、学習を途中でやめてしまう人も少なくない。ひらがな・カタカナ・漢字の三種類の文字システムと、敬語を含む複雑な文法体系が習得の壁となっている。学習者が長続きするためには、自分なりの目的意識を持ち、楽しみながら学ぶ工夫が必要だろう。

質問：本文によると、海外で日本語学習者が増えている理由はどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('アニメや漫画などの日本のポップカルチャーへの人気や、就職・留学への実用的な動機があるため。', true, 1),
  ('日本語が世界で最も簡単な言語のひとつとされているため。', false, 2),
  ('日本政府が海外での日本語教育に多額の補助金を出しているため。', false, 3),
  ('漢字の習得が容易になったことで学習者の負担が減ったため。', false, 4)
) AS t(txt, ok, so);

-- Q07: 設備点検のお知らせ (案内) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

入居者の皆様へ

マンション管理組合より、設備点検実施のお知らせです。

点検日時：来月15日（土）午前9時〜午後5時
点検内容：エレベーター・消防設備・給排水設備・自家発電設備
対応が必要な方：各戸の給排水点検のため、午前中（9時〜12時）のいずれかの時間帯にお部屋で立ち会いをお願いします。
立ち会い時間の割り当ては、後日各戸のポストにご案内いたします。

※ 点検中はエレベーターが一時的に使用できなくなる時間帯があります。
※ やむを得ない事情で立ち会いができない場合は、来月10日（月）までに管理室（内線101）へご連絡ください。
※ 当日のエレベーター停止時間は、1階掲示板にてご確認ください。

ご不便をおかけしますが、皆様のご協力をよろしくお願いいたします。

△△マンション管理組合

質問：この案内で入居者が必ずすべきこととして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('点検当日は全員午前9時に1階ロビーへ集合する。', false, 1),
  ('点検日より前に管理室へ立ち会い時間を自分で申告する。', false, 2),
  ('午前中に割り当てられた時間帯に部屋で立ち会いをする。', true, 3),
  ('点検当日はエレベーターの使用を終日禁止される。', false, 4)
) AS t(txt, ok, so);

-- Q08: 日本の農業の現状 (説明文) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本の農業は、農業従事者の高齢化と後継者不足という深刻な問題に直面している。農林水産省の統計によると、農業従事者の平均年齢は年々上昇しており、耕作放棄地も増加の一途をたどっている。若い世代が農業を職業として選ばない背景には、収入の不安定さや重労働のイメージがある。
こうした状況を打開するため、近年ではスマート農業への注目が高まっている。ドローンによる農薬散布、センサーを使った土壌管理、AIによる収穫時期の予測など、テクノロジーを活用することで農作業の効率化と省力化が進んでいる。
また、農業法人の設立による大規模経営や、都市部からのIターン移住者を農業の担い手として育成するプログラムも広がっている。農業をビジネスとして捉え直し、魅力ある産業にしていくための取り組みが各地で始まっている。食料安全保障の観点からも、日本の農業をいかに維持・発展させるかは国家的な課題である。

質問：スマート農業について本文で述べられていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スマート農業の導入により農業従事者の平均年齢が下がっている。', false, 1),
  ('スマート農業とはSNSを活用して農産物を販売する手法のことである。', false, 2),
  ('スマート農業は現在のところ実証実験の段階にとどまっている。', false, 3),
  ('ドローンやAIなどの技術を活用し、農作業の効率化と省力化が進んでいる。', true, 4)
) AS t(txt, ok, so);

-- Q09: 出張のお礼メール (メール) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

件名：先日のご訪問のお礼

株式会社グリーンテック
営業部　田村様

お世話になっております。
山田商事の佐々木でございます。

先日は、弊社へご訪問いただき誠にありがとうございました。田村様より詳細なご説明をいただいたことで、貴社の新製品についての理解が大変深まりました。

ご提案いただきました製品につきましては、社内で検討を進めております。来週中には結果をご報告できる見込みでございますので、今しばらくお待ちいただけますと幸いです。

また、ご多忙の中、サンプルをご持参いただいたことにも重ねて感謝申し上げます。早速、担当者に確認させております。

引き続き、どうぞよろしくお願いいたします。

山田商事株式会社
第二営業部　佐々木　一郎
電話：03-XXXX-XXXX

質問：このメールで佐々木さんが伝えていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('製品の購入を正式に決定したこと', false, 1),
  ('来週中に社内検討の結果を報告する予定であること', true, 2),
  ('サンプルの内容に問題があったこと', false, 3),
  ('田村さんの訪問を断りたいこと', false, 4)
) AS t(txt, ok, so);

-- Q10: 読書の習慣について (随筆) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

本を読む習慣がいつの間にか遠のいてしまったことに気づいたのは、三十代も半ばを過ぎたころだった。学生時代はあれほど熱中していたのに、社会人になってからというもの、仕事の疲れを言い訳にして、手に取るのはスマートフォンばかりになっていた。
あるとき友人に勧められて一冊の小説を読み始めたところ、驚くほど引き込まれた。活字を追う感覚が戻ってくると同時に、物語の世界に没頭することで日常の悩みが薄れていくような感覚を覚えた。それ以来、通勤電車の中での読書を習慣にしようと決めた。
読書は単に知識を得るだけでなく、想像力を豊かにし、他者の視点から世界を見る力を養う。スマートフォンの短い文章に慣れてしまうと、長い文章を読む集中力が衰えると聞く。忙しい毎日の中でも、一日に少しずつでも本と向き合う時間を持つことが、自分自身を豊かにする近道ではないかと思っている。

質問：筆者が読書習慣を取り戻そうと思ったきっかけは何か。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('友人に勧められた小説を読んで、読書の楽しさを再発見したから。', true, 1),
  ('仕事上の必要からビジネス書を読まなければならなくなったから。', false, 2),
  ('スマートフォンが壊れてしまい、代わりに本を読むようになったから。', false, 3),
  ('学生時代に読み残していた本を見つけたから。', false, 4)
) AS t(txt, ok, so);

-- Q11: 防災訓練実施のお知らせ (案内) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

社員各位

総務部より、今年度の防災訓練についてご案内いたします。

日時：10月8日（火）午後2時〜午後3時
内容：避難経路の確認・消火器の使用訓練・応急手当の基礎（AED操作含む）
集合場所：各フロアの非常口前（訓練開始5分前までに集合）
対象：全社員（当日出勤している全員が参加必須）

※ 訓練中は社外への電話・メール対応を一時停止してください。
※ 取引先への連絡が必要な方は、前日までに対応を完了させてください。
※ 体調不良等でやむを得ず参加できない場合は、事前に総務部へご連絡ください。
※ 訓練終了後、参加確認票を総務部へ提出してください。

万が一の際に冷静に行動できるよう、訓練に真剣に取り組んでいただきますよう、お願いいたします。

総務部　防災担当

質問：この案内の内容と合うものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('防災訓練は希望者のみ参加すればよい。', false, 1),
  ('訓練当日は外部からの電話にも通常通り対応する。', false, 2),
  ('訓練終了後に参加確認票を総務部へ提出しなければならない。', true, 3),
  ('集合場所は全員が1階のロビーに集まるよう指定されている。', false, 4)
) AS t(txt, ok, so);

-- Q12: 環境問題と個人の行動 (論説文) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

地球温暖化・海洋プラスチック汚染・生物多様性の喪失など、環境問題は今や人類が直面する最大の課題のひとつとなっている。これらの問題は工業化・大量生産・大量消費という現代社会のシステムに根ざしており、国家や企業レベルの対策が不可欠である。
一方で、個人の行動変容も重要な役割を果たす。マイバッグの持参・食品ロスの削減・省エネ家電への切り替えなど、日常の小さな選択の積み重ねが、社会全体としての環境負荷を減らすことにつながる。
しかし、「個人が頑張れば環境問題は解決できる」という考え方には批判もある。根本的な原因は産業構造にあり、消費者に責任を転嫁することで本来規制されるべき企業や政府の取り組みが後回しになる、という指摘だ。個人の努力と制度的な変革の両方が同時に必要であり、どちらか一方だけでは不十分だという認識が広まりつつある。

質問：筆者が主張していることとして最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('環境問題の解決には個人の行動変容だけで十分である。', false, 1),
  ('企業や政府の対策は不要で、消費者意識の変革が最優先だ。', false, 2),
  ('環境問題は科学技術の進歩によってのみ解決できる。', false, 3),
  ('個人の努力と制度的な変革の両方が同時に必要である。', true, 4)
) AS t(txt, ok, so);

-- Q13: 転居のご挨拶メール (メール) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

件名：事務所移転のご案内

平素は格別のご高配を賜り、厚くお礼申し上げます。

このたび、弊社は業務拡大に伴い、下記の住所へ事務所を移転することとなりましたので、ご案内申し上げます。

移転日：来月1日（月）
新住所：東京都港区南青山3丁目XX番XX号 △△ビル5階
電話番号：変更なし
メールアドレス：変更なし

なお、現住所での業務は今月末日をもって終了いたします。来月1日以降のお問い合わせ・ご訪問は、新住所へお願いいたします。

移転に際しまして、皆様にはご不便をおかけすることもあろうかと存じますが、何卒ご理解のほどよろしくお願い申し上げます。今後とも変わらぬご支援を賜りますよう、よろしくお願いいたします。

株式会社サンライズ商事
代表取締役　高橋　誠

質問：このメールに書かれていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('電話番号とメールアドレスも移転に伴い変更になる。', false, 1),
  ('現住所での業務は今月末日で終了し、来月1日から新住所で業務を行う。', true, 2),
  ('移転先は東京都千代田区である。', false, 3),
  ('移転は事業縮小のためである。', false, 4)
) AS t(txt, ok, so);

-- Q14: 日本の祭りと地域文化 (随筆) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

子どものころ、毎年夏になると近所の神社でお祭りが開かれるのを心待ちにしていた。屋台の焼きそばのにおい、浴衣を着た人々の笑顔、夜空に広がる花火の光。あのにぎわいは、今も鮮明に記憶に残っている。
しかし大人になって故郷を離れると、そのお祭りも年々規模が縮小しているという知らせを耳にするようになった。少子高齢化と過疎化が進み、担い手となる若者が減って、伝統行事を続けることが難しくなっているというのだ。地域のまつりは単なる娯楽ではなく、地域の歴史や信仰、人と人のつながりを次世代へと受け継ぐ大切な場であることを、大人になった今になってようやく実感している。
伝統行事が消えていくことは、目に見えない文化の喪失でもある。移住者や観光客を巻き込んだ形でのまつりの再生や、映像によるアーカイブ化など、様々な保存の試みが各地で行われている。形が変わっても、地域を結ぶ祭りの精神は受け継がれていくことを願っている。

質問：筆者が子どものころのお祭りについて述べていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('毎年夏に近所の神社で開かれるお祭りをとても楽しみにしていた。', true, 1),
  ('お祭りには屋台がなく、花火だけが楽しみだった。', false, 2),
  ('子どものころから地域文化の大切さを強く意識していた。', false, 3),
  ('故郷のお祭りは現在も変わらず盛大に行われている。', false, 4)
) AS t(txt, ok, so);

-- Q15: フレックスタイム制度のご案内 (案内) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

社員各位

人事部より、来月より導入するフレックスタイム制度についてご案内いたします。

■制度概要
フレックスタイム制度とは、必ず勤務しなければならないコアタイムを除き、始業・終業時刻を各自が自由に決めることができる制度です。

■コアタイム：午前10時〜午後3時（この時間帯は必ず出勤してください）
■フレキシブルタイム：午前7時〜午前10時／午後3時〜午後8時
■清算期間：1か月単位（月の総労働時間が所定時間を下回らないようにしてください）

■注意事項
・コアタイム内の無断離席・外出は従来通り上長への報告が必要です。
・在宅勤務との併用は、別途定める規程に従ってください。
・制度利用を希望しない社員は、従来通りの勤務時間を継続できます。

制度の詳細については、社内ポータルの「フレックスタイム制度規程」をご参照ください。

人事部

質問：このフレックスタイム制度について正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('全ての社員がフレックスタイム制度を必ず利用しなければならない。', false, 1),
  ('コアタイムは午前8時から午後5時までである。', false, 2),
  ('コアタイムは午前10時から午後3時で、この時間帯は必ず出勤が必要である。', true, 3),
  ('清算期間は1週間単位で設定されている。', false, 4)
) AS t(txt, ok, so);

-- Q16: 日本の医療制度 (説明文) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本の医療制度の特徴のひとつは、国民全員が何らかの公的医療保険に加入する「国民皆保険制度」である。この制度のもとでは、会社員は健康保険、自営業者や無職の人は国民健康保険に加入し、医療費の一部を保険で賄うことができる。一般的に、医療費の自己負担割合は3割（70歳以上は所得に応じて1〜2割）となっている。
この制度により、日本では誰でも比較的低い費用で医療を受けられる環境が整っている。救急病院への緊急受診や、高度な専門医療も保険の対象となっており、医療の質と普及率は世界トップレベルとされている。
一方で、少子高齢化の進行により、医療費の総額は年々増大し、財政的な持続可能性が課題となっている。また、医師や看護師の不足・偏在も深刻で、特に地方の医療機関では人材確保が難しい状況が続いている。質の高い医療を全国民に届け続けるためには、制度改革と医療従事者の環境改善が急務となっている。

質問：国民皆保険制度について、本文の内容と合うものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('国民皆保険制度では、会社員も国民健康保険に加入する。', false, 1),
  ('自己負担割合は年齢に関係なく一律5割である。', false, 2),
  ('救急病院への受診は保険の対象外である。', false, 3),
  ('国民全員が何らかの公的医療保険に加入し、医療費の一部を保険で賄える。', true, 4)
) AS t(txt, ok, so);

-- Q17: 上司への依頼メール (メール) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

件名：来週の会議資料についてのご確認のお願い

田中部長

お疲れ様でございます。営業二課の鈴木です。

来週火曜日の全社会議にて、私が第三四半期の営業実績を報告する予定です。現在、資料を作成中ですが、数点についてご確認いただけますでしょうか。

1. 売上目標達成率の算出方法について、昨年度と同じ計算式を使用してよいでしょうか。
2. 競合他社との比較グラフを加えることを検討しておりますが、問題ございませんでしょうか。
3. 資料の最終確認をお願いしたい場合、今週金曜日の午後にお時間をいただくことは可能でしょうか。

ご多忙のところ恐縮ですが、木曜日の午前中までにご返答いただけますと、修正の時間が確保できて助かります。どうぞよろしくお願いいたします。

営業二課　鈴木　花子

質問：このメールで鈴木さんが求めていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('資料の作成方法や内容について田中部長に確認し、木曜午前中までに返答をもらうこと。', true, 1),
  ('全社会議のスケジュールを変更してほしいこと。', false, 2),
  ('第三四半期の営業実績の目標値を下げてほしいこと。', false, 3),
  ('競合他社との比較グラフを資料から削除するよう指示を受けること。', false, 4)
) AS t(txt, ok, so);

-- Q18: 生涯学習の重要性 (論説文) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

かつて「学ぶ」という行為は、主に学校教育の段階に集中していた。しかし技術革新が急速に進む現代社会では、社会人になってからも継続的に学び続ける「生涯学習」の重要性がかつてないほど高まっている。
AIや自動化技術の進歩により、これまで人間が担ってきた多くの職業が変容・消滅するリスクが指摘されている。こうした変化に対応するためには、新しい技術や知識を習得し、自分のスキルをアップデートし続けることが不可欠である。
生涯学習の手段としては、資格取得・大学院進学・オンライン学習プラットフォームの活用など多様な選択肢がある。特に近年は、スマートフォンひとつで世界中の講座が受講できる環境が整っており、時間や場所を選ばずに学ぶことができるようになった。
「何歳になっても学べる」という意識を社会全体で育てることが、変化の激しい時代を生き抜くための基盤となるだろう。

質問：本文で生涯学習の重要性が高まっている理由として述べられているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('学校教育のカリキュラムが大幅に短縮されたため。', false, 1),
  ('AIや技術革新により職業が変容・消滅するリスクがあり、スキルのアップデートが必要なため。', true, 2),
  ('オンライン学習が法律で義務化されたため。', false, 3),
  ('海外留学が容易になり、語学学習の需要が増えたため。', false, 4)
) AS t(txt, ok, so);

-- Q19: 日本のコーヒー文化 (説明文) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本はお茶の国というイメージが強いが、実はコーヒーの消費大国でもある。日本には独自のコーヒー文化が根付いており、その代表が「喫茶店（きっさてん）」だ。1970〜80年代に全国各地に広まった喫茶店は、単に飲み物を提供するだけでなく、ゆっくり過ごせる空間として地域の人々に愛された。
近年、大手チェーンのカフェが普及したことで、昔ながらの個人経営の喫茶店の数は減少している。しかし一方で、「昭和レトロ」ブームの影響もあり、古い喫茶店が若い世代に再発見され、観光スポットとして注目されるケースも増えている。
また、コーヒーの品質にこだわる「スペシャルティコーヒー」専門店も増加しており、豆の産地や焙煎方法にこだわった一杯を提供する店が都市部を中心に人気を集めている。伝統的な喫茶文化と新しいコーヒーカルチャーが共存する日本のコーヒーシーンは、今なお進化を続けている。

質問：本文で昔ながらの喫茶店について述べていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('昔ながらの喫茶店の数は近年増加している。', false, 1),
  ('喫茶店はコーヒーのみを提供し、食事は一切扱わなかった。', false, 2),
  ('大手チェーンの普及で数は減ったが、若い世代に再発見されるケースも増えている。', true, 3),
  ('昔ながらの喫茶店はスペシャルティコーヒーに特化した店舗に転換している。', false, 4)
) AS t(txt, ok, so);

-- Q20: リモートワークと都市集中 (論説文) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本では長年にわたり、東京をはじめとする大都市への人口集中が続いてきた。若者は就職機会や文化的環境を求めて都市に流入し、地方の過疎化は進む一方であった。しかし、リモートワークの普及がこの流れに変化をもたらす可能性があるとして注目されている。
勤務先のある都市に住まなくても仕事ができるようになれば、地方での居住を選択する人が増えることが期待される。実際に、コロナ禍以降、地方への移住者数が増加傾向にあるという統計も報告されている。地方自治体の中には、移住者向けに補助金を支給したり、コワーキングスペースを整備したりして、移住促進を図っているところもある。
ただし、すべての職種でリモートワークが可能なわけではない。現場作業・医療・飲食業など、対面での業務が不可欠な職種も多い。また、都市の利便性や人間関係を重視して移住に踏み切れない人も少なくない。リモートワークは地方移住の追い風にはなるが、都市集中の解消には制度的な支援と地方の魅力向上も並行して必要だと言える。

質問：本文の主張として最も適切なものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('リモートワークの普及により、都市集中はすでに完全に解消されつつある。', false, 1),
  ('地方移住を希望する人は全員すぐに行動すべきだ。', false, 2),
  ('リモートワークが難しい職種は、都市に留まり続けるしかない。', false, 3),
  ('リモートワークは地方移住の追い風だが、制度的支援と地方の魅力向上も必要だ。', true, 4)
) AS t(txt, ok, so);

-- Q21: 日本の交番制度 (説明文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本の街角に設置されている「交番」は、地域の安全を守る小規模な警察の拠点である。交番は日本独自の制度として世界的に知られており、「KOBAN」という名称でそのまま海外に紹介されることもある。
交番には警察官が常駐し、地域住民からの相談対応・道案内・遺失物の受け付けなど、様々な業務を担っている。巡回連絡と呼ばれる定期的な戸別訪問も行われており、地域住民との密接なつながりの中で治安を維持するのが特徴だ。
こうした「地域密着型」の警察活動は、犯罪の予防と早期発見に効果があるとされており、日本の治安の良さを支える重要な要因のひとつに挙げられている。近年、外国からの視察団が交番の運営を参考にするために日本を訪れる例も増えており、その仕組みへの国際的な関心は高い。

質問：交番について本文で述べられていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('交番は日本独自の制度で、「KOBAN」という名称で海外にも知られている。', true, 1),
  ('交番では緊急の犯罪対応のみを行い、道案内は業務外とされている。', false, 2),
  ('交番に常駐する警察官は定期的に各家庭を訪問することを禁じられている。', false, 3),
  ('交番の制度に対する国際的な関心は近年低下している。', false, 4)
) AS t(txt, ok, so);

-- Q22: 苦情対応メール (メール) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

件名：ご注文品の不具合についてのお詫び

山本様

このたびは、弊社製品をご購入いただきまして、誠にありがとうございます。
また、商品到着後に不具合が発生してしまいましたこと、深くお詫び申し上げます。

ご連絡いただいた内容を確認いたしましたところ、製造過程における品質管理上の問題が原因である可能性が高いことが判明いたしました。

つきましては、以下の対応をさせていただきたく存じます。
1. 不良品の着払いでの返送（弊社負担）
2. 良品との交換または全額返金（山本様のご希望に応じてご対応いたします）

お手数ですが、今週中にご希望の対応方法をメールにてご連絡いただけますと幸いです。再度このような事態が生じないよう、品質管理の徹底に努めてまいります。

このたびは大変ご不便をおかけいたしました。今後ともよろしくお願い申し上げます。

顧客サービス部　中村　美咲

質問：このメールで会社が提案している対応として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('山本さんが不良品を持参して来店し、その場で交換を受ける。', false, 1),
  ('不良品を着払いで返送し、良品との交換または全額返金を選べる。', true, 2),
  ('返金のみ対応し、交換には応じられない。', false, 3),
  ('返送費用は山本さんが負担しなければならない。', false, 4)
) AS t(txt, ok, so);

-- Q23: 高齢化社会と介護 (論説文) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本は世界でも有数の高齢化社会である。65歳以上の高齢者が総人口に占める割合（高齢化率）は約30パーセントに迫っており、2040年代にはさらなる上昇が見込まれている。これに伴い、介護を必要とする人の数も増加し、介護サービスの需要が急増している。
介護の担い手として、家族による在宅介護と施設介護の二つの形態がある。かつては家族が介護を担うことが当然とされていたが、核家族化や共働き世帯の増加により、家族だけで介護を担うことが難しくなっている。介護離職（介護のために仕事を辞めること）も社会問題となっており、政府は「介護離職ゼロ」を目標に掲げてきた。
専門の介護施設の整備や介護ロボットの導入など、社会全体で介護を支える体制づくりが進められているが、介護士の人材不足は深刻な問題のままである。外国人介護士の受け入れ拡大も一つの解決策として検討されているが、日本語能力や文化的な壁が課題となっている。

質問：本文で「介護離職」とはどのような問題か。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('介護士が過重労働によって次々と職を離れていくこと', false, 1),
  ('外国人介護士が日本語の壁により離職するケースが多いこと', false, 2),
  ('介護のために仕事を辞めなければならなくなること', true, 3),
  ('高齢者が介護施設への入居を拒否して自立を主張すること', false, 4)
) AS t(txt, ok, so);

-- Q24: 映画レビュー投稿のお礼 (メール) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

件名：映画レビューご投稿ありがとうございます

木村様

平素よりシネマクラブ会員サービスをご利用いただき、誠にありがとうございます。

このたびは、「春の記憶」の作品レビューをご投稿いただきまして、誠にありがとうございました。木村様のレビューは、多くの会員の方々に参考にされており、今月の「優良レビュー」に選定させていただきました。

つきましては、感謝の気持ちとして、次回ご鑑賞の際にご利用いただける500円分の割引クーポンをご登録のメールアドレス宛に送付いたします。有効期限は発行日から3か月以内となっておりますので、ぜひご活用ください。

今後も木村様のご意見・ご感想をお待ちしております。引き続き、シネマクラブをどうぞよろしくお願いいたします。

シネマクラブ事務局　田口　亜希子

質問：このメールでシネマクラブが木村さんに伝えていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('木村さんのレビューに内容の誤りがあったため修正を依頼する。', false, 1),
  ('木村さんに新しい映画のレビューを執筆するよう依頼する。', false, 2),
  ('木村さんのレビューが削除されたことを通知する。', false, 3),
  ('木村さんのレビューが「優良レビュー」に選定され、500円の割引クーポンを送る。', true, 4)
) AS t(txt, ok, so);

-- Q25: 日本の水道水 (説明文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本の水道水は、世界的に見ても非常に高い水質を誇っており、そのままで安全に飲むことができる国のひとつである。厚生労働省が定める水質基準は51項目にわたり、浄水処理から配水まで徹底した管理が行われている。
しかし近年、老朽化した水道管の更新が追いついていないことが問題となっている。高度成長期に整備されたインフラが一斉に耐用年数を迎えており、漏水事故や水質低下のリスクが高まっている。自治体によっては財政難から更新が遅れており、今後の対応が急務とされている。
また、ミネラルウォーターやウォーターサーバーを利用する人も増えており、水道水への信頼が揺らいでいるとの指摘もある。専門家の中には、安全な水道水をそのまま飲まずにペットボトル水を購入することで、無駄なプラスチックごみが増えているという環境面からの懸念を示す声もある。水道水の品質を維持・向上させることは、生活インフラとしてだけでなく環境保全の観点からも重要な課題である。

質問：本文で日本の水道水の課題として挙げられているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('老朽化した水道管の更新が追いついておらず、漏水事故等のリスクが高まっている。', true, 1),
  ('日本の水質基準が低すぎて、水道水が国際基準を満たしていないこと。', false, 2),
  ('水道水に含まれる鉱物質が多すぎて健康被害が出ていること。', false, 3),
  ('浄水処理のコストが下がりすぎて水質管理がおろそかになっていること。', false, 4)
) AS t(txt, ok, so);

-- Q26: 音楽と記憶 (随筆) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

何気なくラジオをつけていたら、学生時代によく聴いていた曲が流れてきた。その瞬間、懐かしい記憶が一気によみがえってくるような感覚があった。友人と過ごした放課後、初めて一人暮らしをしたアパートの部屋、あの頃の光景がまるで昨日のことのように浮かんだ。
音楽と記憶の結びつきは、科学的にも研究されている。ある特定の曲を聴くと、その曲を初めて聴いたときの感情や状況が呼び起こされやすい。これは「音楽誘発性自伝的記憶」と呼ばれる現象で、音楽が感情を司る脳の部位と深く関わっているためと考えられている。
特定の曲が「あの頃の自分」に戻るタイムマシンのような役割を果たすことは、誰もが経験したことのある感覚ではないだろうか。思い出の曲を聴くことで気持ちが落ち着いたり、意欲が湧いたりすることもある。音楽は単なる娯楽を超え、私たちの記憶と感情の深いところで生き続けているものだと、改めて感じた。

質問：本文で「音楽誘発性自伝的記憶」として説明されていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('音楽を聴くことで新しい記憶を意図的に作り出せること。', false, 1),
  ('特定の曲を聴くと、その曲を初めて聴いたときの感情や状況が呼び起こされる現象。', true, 2),
  ('音楽を聴くと将来の出来事を予測できるようになること。', false, 3),
  ('音楽療法によって記憶障害が完全に回復すること。', false, 4)
) AS t(txt, ok, so);

-- Q27: 新製品発表会のお知らせ (案内) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

お取引先各位

平素より格別のご愛顧を賜り、厚く御礼申し上げます。

このたび、弊社は新製品「スマートホームコントローラーSHC-X1」の発表会を下記の通り開催する運びとなりました。製品の機能説明・デモンストレーション・質疑応答を予定しております。

日時：9月24日（水）午後2時〜午後4時（受付開始：午後1時30分）
場所：東京都渋谷区 △△カンファレンスセンター 3階 大会議室A
定員：先着50名様
参加費：無料
申込締切：9月17日（水）

参加をご希望の方は、弊社ウェブサイトの申し込みフォームよりお申し込みください。定員に達し次第、受付を終了いたします。なお、駐車場のご用意はございませんので、公共交通機関をご利用くださいますようお願いいたします。

ご多忙の折とは存じますが、ぜひご参加いただけますよう、よろしくお願い申し上げます。

株式会社テックビジョン　事業推進部

質問：この案内について正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('参加費は一人5000円である。', false, 1),
  ('申し込みは会場で直接行うことができる。', false, 2),
  ('定員は先着50名で、定員に達し次第受付終了となる。', true, 3),
  ('駐車場が用意されているので車で来場できる。', false, 4)
) AS t(txt, ok, so);

-- Q28: 日本の四季と自然 (随筆) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本に来て最初に驚いたことのひとつは、四季の変化がこれほどはっきりしているということだ。春には桜が咲き誇り、夏は蝉の声が耳に染み入り、秋には山が赤や黄金色に染まり、冬には静かな雪景色が広がる。これほど季節ごとに表情が変わる国は、世界でもそう多くはないだろう。
日本の文化には、この四季の変化が深く織り込まれている。俳句の「季語」もそうだし、食卓に並ぶ「旬の食材」も、季節の移ろいに合わせて変わる。正月には松飾り、春には花見、夏には盆踊り、秋には紅葉狩りと、年間を通じた行事の多くが自然の季節感と結びついている。
こうした自然との共生は、現代の忙しい生活の中でも日本人の感性の底流に流れているように思う。季節の花を一輪部屋に飾る、旬の野菜を使った料理を丁寧に作る——そういった小さな営みの中に、自然とともに生きようとする精神が宿っているのではないだろうか。

質問：筆者が日本に来て最初に驚いたこととして述べられているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('日本語の俳句の表現が非常に複雑だったこと。', false, 1),
  ('日本の食文化が多様で、四季を通じて食材が豊富なこと。', false, 2),
  ('日本人が年中行事を大切にしていること。', false, 3),
  ('四季の変化がとてもはっきりしていること。', true, 4)
) AS t(txt, ok, so);

-- Q29: 日本の交通網 (説明文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本の公共交通機関は、その正確さと利便性の高さで世界的に知られている。特に新幹線は、時速300キロを超えるスピードで主要都市を結び、遅延が極めて少ないことで有名だ。平均遅延時間が1分を下回るという統計もあり、海外からの訪問者を驚かせることが多い。
都市部では電車・地下鉄・バスが密に張り巡らされており、複数の路線が乗り継ぎやすいように設計されている。ICカード（交通系電子マネー）の普及により、現金なしで多くの鉄道・バス路線を利用できるようになっており、訪日外国人にとっても使いやすい環境が整っている。
一方、地方では公共交通機関の縮小が問題になっている。利用者の減少を受け、バス路線の廃止や電車の運行本数削減が相次いでおり、車を持たない高齢者が移動に困るケースも増えている。都市部の交通インフラの充実と地方の交通過疎という、二極化の状況が続いている。

質問：日本の新幹線について本文で述べられていることとして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('時速300キロを超えるスピードで走り、遅延が極めて少ないことで知られている。', true, 1),
  ('新幹線は現在も時速200キロ以下で運行されている。', false, 2),
  ('新幹線の遅延は年々増加し、国際的な批判を受けている。', false, 3),
  ('新幹線では交通系ICカードが使えないため、乗車券を購入する必要がある。', false, 4)
) AS t(txt, ok, so);

-- Q30: 職場での多様性推進 (論説文) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

近年、企業における「ダイバーシティ（多様性）」の推進が重要な経営テーマとなっている。ダイバーシティとは、性別・年齢・国籍・障害の有無・性的指向など、様々な属性を持つ人々が職場に共存し、それぞれの能力を発揮できる状態を指す。
多様な人材が集まることで、異なる視点からのアイデアが生まれ、組織のイノベーション力が高まるという研究結果が多数報告されている。また、多様な背景を持つ顧客ニーズを理解するうえでも、多様な社員構成が強みとなる。
しかし、ダイバーシティ推進には課題もある。組織として受け入れ態勢を整えるためには、採用方針の見直し・研修の実施・制度の整備といった継続的な取り組みが必要である。また、単に多様な人材を集めるだけでなく、それぞれの違いを尊重し、全員が活躍できる「インクルージョン（包括）」の視点も欠かせないとされている。形だけのダイバーシティに終わらせないことが、今後の企業に求められている。

質問：ダイバーシティ推進が企業にもたらすメリットとして本文で述べられているものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('社員の平均年齢が下がり、体力的な業務に強くなること。', false, 1),
  ('異なる視点からのアイデアが生まれ、イノベーション力が高まること。', true, 2),
  ('全社員が同じ価値観を持てるようになり、意思決定が速くなること。', false, 3),
  ('外国語ができる社員が増え、海外展開のコストが下がること。', false, 4)
) AS t(txt, ok, so);

-- Q31: 施設見学会のご案内 (案内) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

保護者の皆様へ

来月、本校では「施設見学・体験授業デー」を開催いたします。保護者の方にも、普段のお子さまの学習環境をご覧いただける機会です。

日時：11月22日（土）午前10時〜正午
対象：全学年の在校生の保護者（一家族につき2名まで）
内容：校内施設の案内ツアー（30分）、体験授業見学（算数・理科・英語から1クラス選択）、教員との質疑応答
申し込み：学校のウェブサイト上の申込フォームから11月15日（土）までにお申し込みください。
※事前申し込みなしでの当日参加はご遠慮ください。
※体験授業の見学クラスは先着順での受付となります。ご希望のクラスは早めにお申し込みください。
※当日は名札を受付でお受け取りください。

ご多忙のところ恐縮ですが、ぜひご参加ください。

教頭　佐藤　浩二

質問：この案内について正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('当日参加も受け付けているので、事前申し込みは不要である。', false, 1),
  ('体験授業は数学・化学・フランス語の3科目から選べる。', false, 2),
  ('参加は一家族につき2名までで、事前にウェブ申し込みが必要である。', true, 3),
  ('全保護者が参加必須のイベントである。', false, 4)
) AS t(txt, ok, so);

-- Q32: デジタルデトックスの試み (随筆) answer=pos4
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

一週間、スマートフォンをできるだけ使わずに過ごすという試みをしてみた。仕事上どうしても必要な連絡以外は、SNSもニュースアプリも意識的に開かないようにした。
最初の二日間は、手持ち無沙汰な時間にスマートフォンを手にしようとする自分に気づいた。それほど自分がスマートフォンに依存していたかと、改めて驚いた。しかし三日目からは、代わりに本を読んだり、散歩に出かけたりと、以前ならスマートフォンで埋めていた時間を別のことに使えるようになってきた。
一週間を終えてみると、以前より頭がすっきりしているような感覚があった。情報過多の状態に慣れてしまうと、自分の思考が常に何かに引っ張られている気がするが、デジタルデトックスをすることで、静かに自分と向き合う時間が生まれた。この体験を通じて、スマートフォンとの付き合い方を見直すきっかけになったと思っている。

質問：筆者がデジタルデトックスを終えて感じたこととして正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('スマートフォンを全く使わないと仕事に支障をきたすとわかった。', false, 1),
  ('一週間後もスマートフォンへの依存は変わらなかった。', false, 2),
  ('SNSをやめると友人関係が壊れてしまうと実感した。', false, 3),
  ('頭がすっきりし、スマートフォンとの付き合い方を見直すきっかけになった。', true, 4)
) AS t(txt, ok, so);

-- Q33: 日本の睡眠事情 (説明文) answer=pos1
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本人は世界的に見て睡眠時間が短いとされており、OECD加盟国の中でも最下位クラスであるという調査結果もある。特に働き盛りの30〜50代において、慢性的な睡眠不足を抱える人が多い。
睡眠不足は健康に深刻な影響を与える。注意力・判断力・記憶力の低下、免疫機能の低下、生活習慣病リスクの増大など、身体的・精神的な悪影響は多岐にわたる。また、仕事中の居眠りや集中力不足は生産性の低下にもつながり、企業にとっても損失となる。
こうした状況を改善しようと、昼休みに短時間の仮眠（パワーナップ）を推奨する企業も増えている。10〜20分程度の仮眠が午後の集中力を高める効果があるという研究もある。また、睡眠環境を整える寝具や、睡眠の質を計測するウェアラブル端末なども人気を集めている。睡眠を「削るもの」ではなく「整えるべきもの」として捉え直す意識が、少しずつ広まりつつある。

質問：本文で述べられている睡眠不足の影響として正しいものはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('注意力・判断力・記憶力の低下や生活習慣病リスクの増大などの悪影響がある。', true, 1),
  ('睡眠不足は体重増加にのみ影響し、精神面への影響はない。', false, 2),
  ('睡眠不足は若い世代にはほとんど影響しないとされている。', false, 3),
  ('睡眠不足でも仮眠を取れば健康への影響はないことが証明されている。', false, 4)
) AS t(txt, ok, so);

-- Q34: 持続可能な消費 (論説文) answer=pos2
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

SDGs（持続可能な開発目標）の目標12に「つくる責任 つかう責任」という項目がある。大量生産・大量消費・大量廃棄という従来の経済モデルから脱却し、より持続可能な消費と生産のパターンを実現することが求められている。
消費者としてできることのひとつが、「エシカル消費」と呼ばれる取り組みだ。環境に配慮した製品を選ぶ、フェアトレード商品を購入する、地産地消を意識するなど、社会や環境への影響を考慮した消費行動のことを指す。近年、若い世代を中心にこうした消費スタイルへの関心が高まっている。
一方で、エシカル消費の課題もある。一般的に環境配慮型の製品は価格が高めであり、経済的に余裕のない消費者には選択が難しいという現実がある。また、「グリーンウォッシュ」と呼ばれる、実態以上に環境に良いと見せかける企業行為も問題となっている。消費者が正確な情報を得て選択できるよう、適切な表示義務や規制の整備が必要だと言える。

質問：「グリーンウォッシュ」とはどのような問題か。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('消費者が環境配慮型製品を買いすぎて財政難に陥ること。', false, 1),
  ('企業が実態以上に環境に良いと見せかける行為。', true, 2),
  ('政府が企業の環境対策に過度な規制を課すこと。', false, 3),
  ('フェアトレード商品が品質基準を満たしていないこと。', false, 4)
) AS t(txt, ok, so);

-- Q35: 日本語の敬語 (説明文) answer=pos3
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice',
'次の文章を読んで、質問に答えてください。

日本語の敬語は、相手や状況に応じて言葉の形を変える複雑なシステムを持っている。大きく分けると、相手を高めて表現する「尊敬語」、自分を低めて表現する「謙譲語」、丁寧な表現の「丁寧語」の三種類があり、さらに細かい分類もある。
敬語を正確に使いこなすことは、日本人にとっても簡単ではなく、ビジネスの場では「敬語の使い方が悪い」という理由で相手に悪印象を与えてしまうケースもある。外国語として日本語を学ぶ人にとっては、語彙と文法に加えて、誰に対してどの敬語を使うかという社会的文脈の理解も求められるため、習得の難易度は高い。
近年は「バイト敬語」と呼ばれる、若者が使う非標準的な敬語表現が問題視されることもある。「〜になります」「よろしかったでしょうか」などの表現がその例として挙げられるが、一方でこうした表現が社会に広まることで、敬語の規範自体が変化しているという見方もある。言葉は生き物であり、時代とともに変わっていくものなのだ。

質問：本文で「バイト敬語」として説明されていることはどれか。',
  'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ビジネスの場で正式に認められた丁寧な敬語表現のこと。', false, 1),
  ('日本語学習者向けに簡略化された敬語の体系のこと。', false, 2),
  ('若者が使う「〜になります」などの非標準的な敬語表現のこと。', true, 3),
  ('外国語に由来する新しい敬語表現のこと。', false, 4)
) AS t(txt, ok, so);
