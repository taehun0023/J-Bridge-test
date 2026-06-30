-- N2 読解 問題プール (배치2) 35問
-- quiz_id: bb000002-0000-0000-0000-000000000002

-- 1. 図書館の電子書籍サービス (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
当市の図書館では、来月から電子書籍の貸出サービスを開始する。利用者は自宅にいながら、スマートフォンやタブレットで本を借りて読むことができる。これまで開館時間内に来館する必要があったが、今後は深夜でも利用が可能になる。ただし、一度に借りられるのは三冊までで、貸出期間は二週間と定められている。図書館側は、これにより仕事や育児で来館が難しかった人々にも読書の機会を広げたいと考えている。
質問：このサービスの主な目的は何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('来館が難しかった人にも読書の機会を提供すること', true, 1),
  ('紙の本の貸出を完全にやめること', false, 2),
  ('図書館の開館時間を延長すること', false, 3),
  ('一度に借りられる本の数を増やすこと', false, 4)
) AS t(txt, ok, so);

-- 2. 在宅勤務と光熱費 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
在宅勤務が広がるにつれ、家庭の光熱費の負担が増えたという声をよく耳にする。一日中自宅にいれば、冷暖房や照明を使う時間が長くなるのは当然である。これを受けて、社員に手当を支給する企業も現れ始めた。しかし、その金額や支給の条件は会社によって大きく異なり、十分とは言えない場合も少なくない。働き方が変わった今、こうした費用をどう分担するかは、今後も議論が続くだろう。
質問：筆者は光熱費の手当についてどう述べているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('すべての企業が十分な金額を支給している', false, 1),
  ('会社によって金額や条件に差があり、不十分な場合もある', true, 2),
  ('手当を支給する企業はまだ一つもない', false, 3),
  ('光熱費は在宅勤務でも変わらない', false, 4)
) AS t(txt, ok, so);

-- 3. 外国人観光客への対応 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
近年、海外からの観光客が増え、店や宿泊施設では対応に追われている。言葉が通じないことに不安を感じる従業員も多いが、実際には流暢な外国語が必要なわけではない。大切なのは、相手の表情をよく見て、身ぶりや簡単な単語で誠意を伝えようとする姿勢である。完璧な会話よりも、もてなそうとする気持ちのほうが旅行者の心に残るものだ。技術や知識は後からでも身につけられる。
質問：筆者が最も重要だと考えていることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('流暢な外国語を話せること', false, 1),
  ('観光客の数を制限すること', false, 2),
  ('相手をもてなそうとする誠意ある姿勢', true, 3),
  ('完璧な会話の技術を身につけること', false, 4)
) AS t(txt, ok, so);

-- 4. 大気汚染と健康 (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
都市部の大気汚染は、目に見えにくいために軽視されがちだが、私たちの健康に静かに影響を及ぼしている。特に微小な粒子は呼吸とともに体内に取り込まれ、長期間にわたって肺や血管に負担をかけるとされる。短時間ではほとんど症状が出ないため、危険性を実感しにくいのが厄介な点である。だからこそ、日頃から空気の状態に関心を持ち、汚染がひどい日は外出を控えるなどの工夫が求められる。
質問：大気汚染のどのような点が厄介だと述べられているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('すぐに激しい症状が出てしまう点', false, 1),
  ('体内に取り込まれない点', false, 2),
  ('短時間でも誰もが危険を感じる点', false, 3),
  ('短時間では症状が出ず危険を実感しにくい点', true, 4)
) AS t(txt, ok, so);

-- 5. 日本の時間厳守文化 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
日本では、約束の時間を守ることが当然とされている。電車が定刻通りに発着するのも、その意識の表れだと言える。一方で、こうした時間への厳しさが、人々に過度な緊張を強いているという見方もある。数分の遅れも許されない雰囲気の中では、心に余裕を持ちにくい。時間を守ることは大切だが、それが人を追い詰めるものになってはいけない。規律と寛容のあいだで、ちょうどよい加減を探ることが望まれる。
質問：筆者は時間厳守についてどのような立場をとっているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('大切だが、人を追い詰めない程度の加減が必要だ', true, 1),
  ('時間を守る必要は全くない', false, 2),
  ('どんなに人を緊張させても守るべきだ', false, 3),
  ('電車の遅れは問題にすべきではない', false, 4)
) AS t(txt, ok, so);

-- 6. スポーツによるストレス解消 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
仕事や人間関係で疲れがたまったとき、軽い運動が気分を晴らしてくれることがある。体を動かすと、頭の中で渦巻いていた悩みが一時的に遠のき、終わったあとには不思議とすっきりした気持ちになる。激しい運動である必要はなく、近所を散歩するだけでも効果は十分だ。重要なのは、勝ち負けにこだわらず、楽しみながら続けることである。義務のように感じてしまえば、かえって新たな負担になりかねない。
質問：ストレス解消のために大切なことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('できるだけ激しい運動をすること', false, 1),
  ('勝ち負けにこだわらず楽しみながら続けること', true, 2),
  ('勝つことを目標にして競うこと', false, 3),
  ('運動を義務として毎日行うこと', false, 4)
) AS t(txt, ok, so);

-- 7. 会議の効率化 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
だらだらと長引く会議に不満を抱く社員は少なくない。会議を効率よく進めるには、まず目的と終了時刻をはっきり決めておくことが欠かせない。何を話し合い、何を決めるのかが曖昧なままでは、議論は際限なく広がってしまう。また、参加者をむやみに増やさず、本当に必要な人だけに絞ることも大切だ。準備に少し手間をかけるだけで、その後の時間は大きく節約できるのである。
質問：効率のよい会議のために、まず必要なことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('参加者をできるだけ多く集めること', false, 1),
  ('会議の時間を長く取ること', false, 2),
  ('目的と終了時刻をはっきり決めておくこと', true, 3),
  ('準備をせずにすぐ始めること', false, 4)
) AS t(txt, ok, so);

-- 8. 古民家のリノベーション (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
古い民家を改修して住まいやカフェとして生まれ変わらせる試みが各地で広がっている。長い年月を経た柱や梁には、新しい建材にはない温かみが宿っている。これらを生かしつつ、断熱や水回りなど現代の暮らしに必要な部分だけを新しくするのである。すべてを壊して建て直すより費用がかさむこともあるが、その土地の歴史を未来へつなぐ意義は大きい。古いものを敬う心が、こうした取り組みを支えている。
質問：古民家のリノベーションの意義として述べられているのはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('必ず費用が安くなること', false, 1),
  ('古い柱や梁をすべて取り除くこと', false, 2),
  ('現代的な建材だけを使うこと', false, 3),
  ('その土地の歴史を未来へつないでいくこと', true, 4)
) AS t(txt, ok, so);

-- 9. 子育て支援制度 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
子育てを支援する制度は年々充実してきているが、その存在を知らないために利用していない家庭も多い。手当や保育サービスなど、申請すれば受けられる支援は意外と多い。しかし、制度が複雑でわかりにくく、どこに相談すればよいのか戸惑う人も少なくない。せっかくの制度も、必要な人に届かなければ意味がない。行政には、もっとわかりやすく情報を伝える努力が求められている。
質問：筆者が指摘している問題は何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('制度はあるのに情報が必要な人に届いていないこと', true, 1),
  ('支援制度が全く存在しないこと', false, 2),
  ('支援を受けられる家庭が一つもないこと', false, 3),
  ('行政が情報をすでに十分に伝えていること', false, 4)
) AS t(txt, ok, so);

-- 10. 夜間学習の効果 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
夜遅くに勉強するのが習慣になっている人は多い。静かで集中しやすいという利点はあるが、注意も必要だ。睡眠時間を削ってまで勉強を続けると、かえって記憶が定着しにくくなることが知られている。脳は眠っている間に、その日学んだことを整理して記憶に刻み込むからである。つまり、十分に眠ることもまた学習の一部なのだ。夜更かしして詰め込むより、適度に切り上げて休むほうが結果的に効率がよい。
質問：この文章で筆者が伝えたいことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('夜は集中できないので勉強すべきでない', false, 1),
  ('睡眠を削るより十分眠るほうが学習に効果的だ', true, 2),
  ('記憶は眠っている間には整理されない', false, 3),
  ('夜更かしして詰め込むのが最も効率がよい', false, 4)
) AS t(txt, ok, so);

-- 11. 水資源の重要性 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
蛇口をひねればいつでも清潔な水が出てくる暮らしに、私たちはあまりに慣れすぎている。しかし、世界に目を向ければ、安全な水を得られない地域は今なお数多く存在する。豊かに見える日本でも、水が無限にあるわけではない。森林の保全や河川の管理を怠れば、いずれ水の質や量に影響が及ぶだろう。当たり前のように使えるこの資源を守ることは、未来の世代への責任でもある。
質問：筆者が最も訴えたいことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('日本の水は無限にあるので心配はいらない', false, 1),
  ('世界中どこでも安全な水が得られている', false, 2),
  ('当たり前に使える水を守るのは未来への責任だ', true, 3),
  ('森林や河川の管理は水とは関係がない', false, 4)
) AS t(txt, ok, so);

-- 12. 電子決済の普及 (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
スマートフォンをかざすだけで支払いが済む電子決済は、急速に広がっている。現金を持ち歩く必要がなく、会計もすばやく終わるため、便利だと感じる人は多い。一方で、お金を使っている実感が薄れ、つい使いすぎてしまうという声もある。手元の現金が減るのを見て支出を抑えていた人にとっては、これは見過ごせない問題だ。便利さの裏側にある落とし穴にも、目を向けておく必要があるだろう。
質問：電子決済の問題点として挙げられているのはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('支払いに時間がかかってしまうこと', false, 1),
  ('現金を必ず持ち歩く必要があること', false, 2),
  ('普及がまったく進んでいないこと', false, 3),
  ('お金を使う実感が薄れ使いすぎること', true, 4)
) AS t(txt, ok, so);

-- 13. 近隣トラブルの解決 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
ご近所同士のもめごとは、ささいなことから始まることが多い。ごみの出し方や物音など、一つ一つは小さな問題でも、感情がこじれると解決が難しくなる。こうしたとき、いきなり相手を責めるのは得策ではない。まずは冷静に自分の言い分を整理し、相手の事情にも耳を傾ける姿勢が大切だ。それでも収まらなければ、町内会など第三者に間に入ってもらうという方法もある。早めの対応が、関係の悪化を防ぐ鍵となる。
質問：近隣トラブルへの対応として勧められているのはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('冷静に自分の言い分を整理し相手の事情にも耳を傾ける', true, 1),
  ('すぐに相手を強く責める', false, 2),
  ('問題を放置していつまでも何もしない', false, 3),
  ('第三者は決して間に入れない', false, 4)
) AS t(txt, ok, so);

-- 14. 医薬品のネット販売 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
薬がインターネットで手軽に買えるようになり、店まで足を運ばなくても必要なものを入手できるようになった。忙しい人や遠方に住む人にとって、これは大きな助けである。とはいえ、薬は使い方を誤れば体に害を及ぼす。対面であれば薬剤師にその場で相談できるが、画面越しではどうしても確認が不十分になりがちだ。利便性を享受しつつも、自分の症状をよく把握し、慎重に選ぶ心構えが欠かせない。
質問：ネットで薬を買う際に筆者が注意を促していることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('薬は害がないので自由に選んでよい', false, 1),
  ('確認が不十分になりやすいので慎重に選ぶべきだ', true, 2),
  ('ネット販売は誰にとっても不便である', false, 3),
  ('薬剤師には決して相談すべきでない', false, 4)
) AS t(txt, ok, so);

-- 15. 空き家問題 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
人が住まなくなった家がそのまま放置される空き家が、全国で増え続けている。持ち主が遠方に住んでいたり、相続の手続きが進まなかったりして、管理が行き届かないことが背景にある。手入れのされない家は急速に傷み、倒壊の危険や景観の悪化を招く。地域の安全を脅かす存在にもなりかねない。こうした家を取り壊すか、再び活用するか。所有者と自治体が協力して対策を進めることが急務となっている。
質問：空き家が増える背景として述べられているのはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('空き家の数が年々減っているから', false, 1),
  ('所有者がいつも家を手入れしているから', false, 2),
  ('持ち主が遠方にいたり相続が進まなかったりするから', true, 3),
  ('自治体が家をすべて取り壊しているから', false, 4)
) AS t(txt, ok, so);

-- 16. 職場の多様性 (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
さまざまな背景を持つ人が同じ職場で働くことは、組織に新しい力をもたらす。年齢も国籍も経験も異なる人が集まれば、一つの問題に対して多様な見方が生まれる。同じような人ばかりでは気づきにくかった発想が、思わぬところから出てくるのだ。もちろん、考え方の違いから摩擦が生じることもある。しかし、その違いを互いに尊重し合えるなら、それは弱点ではなく、組織を強くする貴重な財産となる。
質問：筆者は職場の多様性をどうとらえているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('摩擦を生むだけの組織の弱点である', false, 1),
  ('同じような人を集めるほうがよい', false, 2),
  ('新しい発想とは無関係である', false, 3),
  ('違いを尊重すれば組織を強くする財産になる', true, 4)
) AS t(txt, ok, so);

-- 17. 宇宙開発への関心 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
宇宙開発というと、遠い世界の話のように感じる人もいるだろう。しかし、私たちの日常は、宇宙技術の恩恵を意外なほど受けている。天気予報や位置情報の仕組みは、人工衛星なしには成り立たない。さらに、宇宙で開発された技術が、医療や防災の分野に応用される例も増えている。宇宙への挑戦は、決して一部の専門家だけのものではなく、巡り巡って私たちの暮らしを支えているのである。
質問：筆者が伝えようとしていることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('宇宙技術は私たちの日常生活を支えている', true, 1),
  ('宇宙開発は専門家だけに関係がある', false, 2),
  ('天気予報は人工衛星と無関係である', false, 3),
  ('宇宙技術は医療には応用できない', false, 4)
) AS t(txt, ok, so);

-- 18. 食品ロス削減 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
まだ食べられるのに捨てられてしまう食品が、家庭や店から大量に出ている。食品ロスを減らすには、特別な努力よりも日々の小さな心がけが効く。買い物の前に冷蔵庫の中を確認する、必要な分だけ買う、賞味期限の近いものから使う。どれも当たり前のことのようだが、続けるだけで無駄は確実に減っていく。一人ひとりの行動はわずかでも、それが積み重なれば社会全体で大きな成果につながるのである。
質問：食品ロスを減らすために筆者が勧めていることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('特別で大がかりな努力をすること', false, 1),
  ('買う前に冷蔵庫を確認するなど日々の小さな心がけ', true, 2),
  ('食品をまとめて大量に買うこと', false, 3),
  ('賞味期限が遠いものから先に使うこと', false, 4)
) AS t(txt, ok, so);

-- 19. 自転車通勤のメリット (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
満員電車を避けて自転車で通勤する人が増えている。適度な運動になり、健康によいうえ、交通費もかからない。さらに、自分のペースで季節の移ろいを感じながら走れるのも魅力だ。ただし、よいことばかりではない。雨の日や猛暑の日には体への負担が大きく、事故の危険も忘れてはならない。安全な道を選び、無理のない範囲で取り入れることが、長く続けるためのこつだと言える。
質問：自転車通勤について筆者はどう述べているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('よいことばかりで欠点は何もない', false, 1),
  ('交通費が電車より高くつく', false, 2),
  ('利点が多いが天候や事故には注意が必要だ', true, 3),
  ('健康にはまったく役立たない', false, 4)
) AS t(txt, ok, so);

-- 20. 記念日マーケティング (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
記念日に合わせて商品を売り出す手法は、今やすっかり定着した。誕生日や結婚記念日はもちろん、企業が独自に作り出した記念日も次々と登場している。特別な日だからと、人はふだんより財布のひもが緩みがちだ。売り手はそこをうまくとらえている。ただ、こうした仕掛けに乗せられるばかりでなく、自分にとって本当に価値あるものかを冷静に見極める目を、消費者の側も持ちたいものである。
質問：筆者が消費者に求めていることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('記念日には必ず商品を買うこと', false, 1),
  ('企業の仕掛けにすべて従うこと', false, 2),
  ('記念日をもっと増やすこと', false, 3),
  ('本当に価値があるか冷静に見極めること', true, 4)
) AS t(txt, ok, so);

-- 21. 子どもの読書離れ (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
本を読まない子どもが増えていると言われて久しい。動画やゲームなど、手軽に楽しめるものが身近にあふれているのだから、無理もないのかもしれない。しかし、本を無理やり読ませようとしても、かえって嫌いになってしまう恐れがある。大切なのは、まず大人自身が本を楽しむ姿を見せることだ。親が夢中で読んでいれば、子どもは自然と興味を持つ。読書の習慣は、強制ではなく、身近な手本から育つものである。
質問：子どもに読書を好きにさせるために大切なことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('大人自身が本を楽しむ姿を見せること', true, 1),
  ('子どもに無理やり読ませること', false, 2),
  ('動画やゲームを完全に禁止すること', false, 3),
  ('読書を強制的に義務づけること', false, 4)
) AS t(txt, ok, so);

-- 22. 騒音問題と都市生活 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
都市で暮らしていると、車の音や工事の音、人々のざわめきに絶えず囲まれている。多くの人はそれに慣れ、ほとんど意識しなくなる。しかし、こうした騒音は知らないうちに心身を疲れさせていることがある。たまには静かな場所に身を置き、耳を休ませることが必要だ。公園や郊外で静寂に浸ると、張り詰めていた神経がほぐれていくのを感じるだろう。静けさは、都市生活者にとって意外と貴重なものなのである。
質問：筆者は騒音についてどう考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('慣れているので体に影響はない', false, 1),
  ('知らないうちに心身を疲れさせている', true, 2),
  ('騒音は心身を元気にしてくれる', false, 3),
  ('静かな場所に行く必要はない', false, 4)
) AS t(txt, ok, so);

-- 23. フードバンクの活動 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
フードバンクとは、まだ食べられるのに余ってしまった食品を企業や家庭から集め、必要としている人々に届ける活動である。一方には捨てられる食品があり、もう一方には食べ物に困る人がいる。その両者を結びつけるのがこの仕組みだ。食品ロスを減らすと同時に、生活に苦しむ人を支えられるため、近年注目を集めている。ささやかな善意が集まって、社会の隙間を埋めていく取り組みだと言えるだろう。
質問：フードバンクの特徴として最も適切なものはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('食品を捨てることを推進する活動である', false, 1),
  ('食べ物に困る人を増やす仕組みである', false, 2),
  ('余った食品を必要な人に届ける仕組みである', true, 3),
  ('企業からしか食品を集めない活動である', false, 4)
) AS t(txt, ok, so);

-- 24. 日本語の方言 (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
テレビやインターネットの普及により、全国どこでも標準語が通じるようになった。その一方で、地域に根ざした方言は、使う人が減りつつある。便利さを思えば標準語が広がるのは自然なことだ。しかし、方言にはその土地で育まれた歴史や人々の暮らしの感覚が刻まれている。それが失われてしまうのは惜しい。標準語と方言、どちらか一方ではなく、両方を大切に使い分けていけたらと思う。
質問：方言について筆者はどう考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('標準語だけを使えば十分だ', false, 1),
  ('方言が消えても惜しくはない', false, 2),
  ('方言には何の価値もない', false, 3),
  ('標準語と方言を両方とも大切にしたい', true, 4)
) AS t(txt, ok, so);

-- 25. 映画館の利用者減少 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
自宅で映画を楽しめる配信サービスが広がり、映画館に足を運ぶ人は減りつつある。家でくつろぎながら、好きな時間に見られる手軽さには、確かにかなわない部分がある。だが、映画館には家庭では味わえないものがある。大きな画面と迫力ある音響、暗闇の中で物語に没入する一体感は、その場でしか得られない体験だ。便利さとは別の価値を映画館がどう示せるかが、これからの生き残りを左右するだろう。
質問：筆者は映画館の強みをどこにあると考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('大画面や音響、没入する一体感という体験', true, 1),
  ('好きな時間に見られる手軽さ', false, 2),
  ('家でくつろぎながら見られること', false, 3),
  ('配信サービスより料金が安いこと', false, 4)
) AS t(txt, ok, so);

-- 26. 健康食品の効果 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
健康によいとうたう食品が次々と売り出され、人気を集めている。手軽に健康になれるならと、つい手を伸ばしたくなる気持ちもわかる。だが、こうした食品をとりさえすれば健康になれるわけではない。土台となるのは、バランスのよい食事と適度な運動、十分な睡眠といった基本的な生活習慣である。健康食品はあくまで補助にすぎない。それに頼りきって日々の暮らしをおろそかにしては、本末転倒である。
質問：筆者が伝えたいことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('健康食品をとれば誰でも健康になれる', false, 1),
  ('基本的な生活習慣が土台で、健康食品は補助にすぎない', true, 2),
  ('食事や運動より健康食品のほうが大切だ', false, 3),
  ('健康食品には全く効果がない', false, 4)
) AS t(txt, ok, so);

-- 27. 防災グッズの備え (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
災害はいつ起こるかわからない。だからこそ、ふだんからの備えが命を守る。水や食料、懐中電灯などを用意しておくのは基本だが、ただそろえただけで安心してはいけない。いざというとき、どこに置いてあるかすぐにわからなければ意味がない。また、食料には期限があり、放っておけば使えなくなる。年に一度は中身を点検し、古いものを入れ替えることが欠かせない。備えとは、用意することと保つことの両方なのである。
質問：防災の備えについて筆者が強調していることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('一度そろえれば点検は必要ない', false, 1),
  ('置き場所は気にしなくてよい', false, 2),
  ('用意するだけでなく定期的に点検し保つこと', true, 3),
  ('食料には期限がないので入れ替え不要だ', false, 4)
) AS t(txt, ok, so);

-- 28. インターンシップの意義 (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
学生が実際の職場で働く体験をするインターンシップは、就職活動の場として注目されがちだ。しかし、その本来の価値は、内定を得ることだけにあるのではない。仕事の現場に身を置くことで、教科書では学べない働くことの実感を得られる。自分が思い描いていた職業の姿と、現実とのずれに気づくこともあるだろう。そうした経験こそが、将来の進路を考えるうえで何より貴重な財産となるのである。
質問：筆者はインターンシップの本来の価値をどこにあると考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('内定を得ることだけにある', false, 1),
  ('教科書の知識を覚えることにある', false, 2),
  ('現場を経験せずに進路を決めることにある', false, 3),
  ('働く実感を得て進路を考える財産になること', true, 4)
) AS t(txt, ok, so);

-- 29. 森林浴の効果 (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
森の中を歩くと、不思議と心が落ち着く。緑の香りや木漏れ日、鳥の声に包まれていると、日頃の疲れが少しずつ薄れていくようだ。こうした森林浴には、心身を休める効果があると言われている。特別な技術はいらない。ただゆっくりと歩き、自然の音に耳を澄ませるだけでいい。忙しい毎日の中で、時には立ち止まり、森に身を委ねる時間を持つことが、健やかな暮らしの支えになるのである。
質問：森林浴についての説明として正しいものはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('特別な技術はいらず、心身を休める効果がある', true, 1),
  ('高度な訓練がなければできない', false, 2),
  ('かえって疲れを増やしてしまう', false, 3),
  ('自然の音は聞かないほうがよい', false, 4)
) AS t(txt, ok, so);

-- 30. デジタル遺品 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
人が亡くなったあと、その人が使っていたインターネット上のサービスやデータが、デジタル遺品として残される。写真やメール、各種の会員登録など、その量は思いのほか多い。ところが、本人にしかわからないパスワードのために、遺族が手をつけられずに困ることが少なくない。元気なうちに、何を残し、何を消したいのかを書き留めておくことが、残された家族の負担を減らすことにつながる。
質問：デジタル遺品をめぐる問題は何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('デジタル遺品はほとんど残らないこと', false, 1),
  ('パスワードがわからず遺族が手をつけられないこと', true, 2),
  ('遺族が簡単にすべて管理できること', false, 3),
  ('生前に何も準備する必要がないこと', false, 4)
) AS t(txt, ok, so);

-- 31. 屋上農園 (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
ビルの屋上を利用して野菜を育てる屋上農園が、都市部で広がりつつある。使われていなかった空間が、緑あふれる場所へと生まれ変わるのだ。土と緑が増えれば、夏場の建物の温度上昇をやわらげる効果も期待できる。さらに、近隣の住民が集まって作業をすることで、希薄になりがちな地域のつながりが育まれることもある。野菜の収穫だけにとどまらない、さまざまな恵みをもたらす取り組みなのである。
質問：屋上農園の利点として述べられていないものはどれか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('使われていない空間を有効に活用できる', false, 1),
  ('建物の温度上昇をやわらげる', false, 2),
  ('地域のつながりを希薄にしてしまう', true, 3),
  ('住民が集まって交流が生まれる', false, 4)
) AS t(txt, ok, so);

-- 32. 語学学習アプリ (correct: position 4)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
スマートフォンの語学アプリは、いつでもどこでも手軽に学べる便利な道具だ。通勤の電車内や休憩のすきま時間にも、無理なく続けられる。ゲームのような感覚で取り組める工夫もあり、学習を長続きさせる助けになる。ただし、アプリだけに頼っていては、実際に人と話す力はなかなか身につかない。学んだ言葉を生きた会話で使ってこそ、本物の力となる。アプリは入り口として活用し、そこから先へ進む意識が大切だ。
質問：語学アプリについて筆者が述べていることは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('アプリだけで会話力が完全に身につく', false, 1),
  ('続けるのが難しく役に立たない', false, 2),
  ('すきま時間には使えない', false, 3),
  ('便利だが、人と話す実践へ進むことが大切だ', true, 4)
) AS t(txt, ok, so);

-- 33. 公共交通機関のバリアフリー (correct: position 1)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
駅にエレベーターが設けられ、車両との段差が小さくなるなど、公共交通機関のバリアフリー化が進んできた。これは車いすの利用者だけでなく、高齢者やベビーカーを押す人にとっても大きな助けとなる。誰もが移動しやすい環境は、特定の人だけのものではない。設備を整えるだけでなく、困っている人にそっと手を差し伸べる心づかいがあってこそ、本当に優しい社会と言える。設備と心の両方が求められているのだ。
質問：筆者がバリアフリーについて最も伝えたいことは何か。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('設備の整備と人の心づかいの両方が必要だ', true, 1),
  ('設備さえ整えれば十分である', false, 2),
  ('車いすの利用者だけのための設備だ', false, 3),
  ('心づかいだけあれば設備はいらない', false, 4)
) AS t(txt, ok, so);

-- 34. 退職後の生活設計 (correct: position 2)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
長年働いてきた人にとって、退職は大きな節目となる。退職後の生活というと、お金の心配ばかりに目が向きがちだ。もちろん備えは欠かせないが、それだけでは十分とは言えない。仕事を離れると、それまで多くの時間を占めていた役割が突然なくなる。何をして日々を過ごすのか、誰とつながっていくのか。心の支えとなる生きがいをあらかじめ考えておくことが、充実した第二の人生を送る鍵となる。
質問：退職後の生活設計について筆者はどう考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('お金の備えだけ考えれば十分だ', false, 1),
  ('お金だけでなく生きがいも考えておくべきだ', true, 2),
  ('退職後のことは考えなくてよい', false, 3),
  ('人とのつながりは必要ない', false, 4)
) AS t(txt, ok, so);

-- 35. 紙の手紙と電子メール (correct: position 3)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文章を読んで、質問に答えてください。
連絡といえば電子メールが当たり前になった今、紙の手紙を書く機会はめっきり減った。送れば一瞬で届くメールに比べ、手紙は書くのにも届くのにも時間がかかる。しかし、その手間こそが手紙の魅力でもある。相手を思い浮かべながら一字一字つづり、便箋を選ぶ。受け取った側も、その人らしい文字から温かさを感じ取る。便利さでは劣っても、手紙にしか伝えられない心がある。両者をうまく使い分けたい。
質問：筆者は紙の手紙の魅力をどこにあると考えているか。', 'reading', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('一瞬で相手に届く速さ', false, 1),
  ('メールよりも手間がかからないこと', false, 2),
  ('手間をかけることで伝わる温かさや心', true, 3),
  ('紙の手紙のほうがあらゆる面で便利なこと', false, 4)
) AS t(txt, ok, so);
