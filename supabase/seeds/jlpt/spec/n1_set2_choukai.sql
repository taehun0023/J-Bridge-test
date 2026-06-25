-- encoding: UTF-8
-- JLPT N1 模試(本番) 聴解 30問 — Set 2
-- quiz_id: ad000001-0000-0000-0000-000000000123

-- ============================================================
-- 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：田村さん、新しいオフィスの内装デザイン案、先方から3パターン届いているんですが、どれにするか決めてもらえますか。\n女：わかりました。でも、社員の意見も反映させたいので、まずアンケートを取ってから決めたいと思います。\n男：そうですね。ではアンケートはいつまでに集めますか。\n女：今週中に回収して、来週の月曜日に先方に回答する予定です。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '여성은 「まずアンケートを取ってから決めたい」라고 하였다. 정답은 1번 「社員にアンケートを実施する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000032', '社員にアンケートを実施する', true, 1),
('adc30001-0000-0000-0000-000000000032', '先方にデザイン案を一つ選んで送る', false, 2),
('adc30001-0000-0000-0000-000000000032', '来週月曜日に会議を開催する', false, 3),
('adc30001-0000-0000-0000-000000000032', '3パターンのデザイン案を自分で検討する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30002-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：部長、クライアントから新しいプロジェクトのご依頼が来ているのですが、現在のチームのキャパシティが心配で。\n男：そうだな。まず現在の各メンバーの稼働状況を確認してみよう。それから受けられるかどうかを判断する。\n女：わかりました。私が各メンバーに確認を取りましょうか。\n男：いや、それは私が直接チームリーダーの木村さんに聞く。君はその間にクライアントへの暫定回答を準備しておいてくれ。「来週中に可否をお知らせします」という内容で。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '남성은 「私が直接チームリーダーの木村さんに聞く」라고 했다. 정답은 4번 「チームリーダーに稼働状況を確認する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30002-0000-0000-0000-000000000032', 'クライアントに断りの連絡をする', false, 1),
('adc30002-0000-0000-0000-000000000032', '暫定回答の文面を作成する', false, 2),
('adc30002-0000-0000-0000-000000000032', '各メンバーに直接連絡する', false, 3),
('adc30002-0000-0000-0000-000000000032', 'チームリーダーに稼働状況を確認する', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30003-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：林さん、来月の取引先向け感謝イベントの件なんですが、会場の予約はもう済んでいますか。\n女：はい、会場は先週確保しました。ただ、ケータリング業者がまだ決まっていないんです。\n男：そうですか。それは早めに決めないといけませんね。\n女：そうなんです。それと、招待状の送付もまだなんですが、ケータリングの内容が決まってから、参加人数の最終確認と合わせて送ろうかと思っていて。\n男：そうですね。ではまずケータリングを先に決めてもらえますか。招待状はその後でいいですよ。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '남성의 지시에 따라 여성은 먼저 케이터링 업체를 결정해야 한다. 정답은 2번 「ケータリング業者を決める」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30003-0000-0000-0000-000000000032', '招待状を取引先に送る', false, 1),
('adc30003-0000-0000-0000-000000000032', 'ケータリング業者を決める', true, 2),
('adc30003-0000-0000-0000-000000000032', '参加人数の最終確認をする', false, 3),
('adc30003-0000-0000-0000-000000000032', '会場の追加予約をする', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30004-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：鈴木さん、先ほどお客様からお電話がありまして、先日納品した製品に一部不具合があるとのことで。\n男：えっ、どんな不具合ですか。\n女：電源ボタンが反応しないケースがあるということで、詳細は文書でお送りしますとおっしゃっていました。\n男：わかりました。まず文書が届いたら内容を確認して、品質管理部に原因調査を依頼しましょう。その後、お客様に対応方針をご連絡します。\n女：では、文書が届くまでは特に何もしなくてよいですか。\n男：いや、先にお客様にお電話して「文書を確認次第、速やかに対応します」とお詫びの連絡だけしておいてください。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '남성의 마지막 지시에 따라 여성은 먼저 고객에게 사과 전화를 해야 한다. 정답은 3번 「顧客にお詫びの電話をする」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30004-0000-0000-0000-000000000032', '品質管理部に連絡して原因調査を依頼する', false, 1),
('adc30004-0000-0000-0000-000000000032', 'お客様からの文書が届くまで待つ', false, 2),
('adc30004-0000-0000-0000-000000000032', '顧客にお詫びの電話をする', true, 3),
('adc30004-0000-0000-0000-000000000032', '製品の交換手続きを開始する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30005-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：課長、今月の部門予算なんですが、交通費が予算オーバーになりそうで。\n女：そうですか。どのくらいオーバーしそうですか。\n男：現時点で予算の1.2倍くらいです。月末に向けてさらに増える可能性があります。\n女：わかりました。まず今月中の出張予定をリストアップして私に見せてください。不要不急の出張は延期または取り消しにします。\n男：わかりました。今日中にリストを作成してお持ちします。\n女：よろしく。それと、来月以降の予算見直しも財務部と相談する必要があるので、今月の使途一覧も合わせて準備しておいてもらえますか。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  '여성은 먼저 출장 예정 목록을 작성해 달라고 했다. 남성도 「今日中にリストを作成してお持ちします」라고 답했다. 정답은 2번 「今月の出張予定のリストを作成する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30005-0000-0000-0000-000000000032', '財務部に予算見直しを申請する', false, 1),
('adc30005-0000-0000-0000-000000000032', '今月の出張予定のリストを作成する', true, 2),
('adc30005-0000-0000-0000-000000000032', '不要な出張をキャンセルする', false, 3),
('adc30005-0000-0000-0000-000000000032', '今月の交通費の使途一覧を準備する', false, 4);

-- ============================================================
-- ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30006-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ラジオで、マーケティングの専門家が話しています。\n\n女：最近よく「コンテンツマーケティング」という言葉を聞きますが、多くの企業が誤解しているのは、「情報を発信すれば売れる」という考え方です。大切なのは、発信する情報の量ではなく、ターゲット顧客が「これは自分のための情報だ」と感じる質の高いコンテンツを届けることです。また、一度公開して終わりではなく、顧客の反応を分析し、継続的に改善していく姿勢が長期的な成果につながります。短期的な売上を追うより、顧客との信頼関係を築くことを優先すべきです。\n\n質問：この専門家が最も重要だと言っていることは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '전문가는 「顧客との信頼関係を築くことを優先すべき」라고 결론 짓고 있다. 정답은 3번 「顧客との信頼関係を重視した継続的な改善」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30006-0000-0000-0000-000000000032', '情報発信の量を増やして露出を高めること', false, 1),
('adc30006-0000-0000-0000-000000000032', '短期的な売上目標を優先してコストを下げること', false, 2),
('adc30006-0000-0000-0000-000000000032', '顧客との信頼関係を重視した継続的な改善', true, 3),
('adc30006-0000-0000-0000-000000000032', '競合他社の成功事例を分析して模倣すること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30007-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'会社で上司と部下が話しています。\n\n女：部長、今期の営業チームの成果についてご意見をいただけますか。\n男：全体の受注件数は昨年比10%増と悪くないんですが、私が一番気になっているのは大型案件の成約率です。件数は増えているのに、単価の高い案件を取りこぼしているケースが目立つんですよ。\n女：確かに、大型案件は競合も多くて、価格だけで判断されてしまうことが多いですね。\n男：そうなんです。だから今後は、価格競争に入る前に、いかに自社の付加価値をクライアントに納得してもらえるかが鍵になる。そこの提案力を鍛えることが最優先課題だと思います。\n\n質問：部長が最も重要だと考えている課題は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '부장은 「付加価値をクライアントに納得してもらえるかが鍵」「提案力を鍛えることが最優先課題」라고 강조했다. 정답은 1번 「付加価値を訴求する提案力の向上」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30007-0000-0000-0000-000000000032', '付加価値を訴求する提案力の向上', true, 1),
('adc30007-0000-0000-0000-000000000032', '競合に勝つための価格設定の見直し', false, 2),
('adc30007-0000-0000-0000-000000000032', '小型案件の受注件数をさらに増やすこと', false, 3),
('adc30007-0000-0000-0000-000000000032', '営業人員を増員して案件対応力を高めること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30008-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ニュースで専門家が環境政策について話しています。\n\n男：カーボンニュートラルの達成に向けて、各国がさまざまな政策を打ち出しています。しかし日本の場合、再生可能エネルギーの普及コストを誰が負担するかという問題が未解決のままになっています。電気料金に転嫁すれば家庭・中小企業への負担が増し、税金で賄えば財政悪化を招く。技術開発への投資は長期的には有効ですが、短期的な排出削減目標の達成には間に合わない可能性があります。最も喫緊の課題は、この負担の公平な分配をどうデザインするかではないでしょうか。\n\n質問：専門家が指摘している日本の最大の課題は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '전문가는 「最も喫緊の課題は、この負担の公平な分配をどうデザインするか」라고 결론 지었다. 정답은 4번 「再生可能エネルギーのコスト負担の公平な設計」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30008-0000-0000-0000-000000000032', '再生可能エネルギーの技術開発が遅れていること', false, 1),
('adc30008-0000-0000-0000-000000000032', '排出削減目標の数値が低すぎること', false, 2),
('adc30008-0000-0000-0000-000000000032', '電気料金が他国と比べて高すぎること', false, 3),
('adc30008-0000-0000-0000-000000000032', '再生可能エネルギーのコスト負担の公平な設計', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30009-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'大学の講義で教授が話しています。\n\n女：データ分析の仕事では、正確な計算結果を出すことはもちろん大切ですが、それ以上に重要なのは、その結果を「誰に対して、どのように伝えるか」というコミュニケーション能力です。精緻な分析も、意思決定者に理解されなければ意味がありません。特に、技術的な背景のない経営層に対してデータのインサイトを伝える際には、専門用語を使わず、ビジネスインパクトに焦点を当てて話す力が求められます。皆さんには、分析スキルと同時に、「翻訳者」としての能力を磨いていただきたいと思います。\n\n質問：教授がデータ分析の仕事で特に重要だと言っているのは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '교수는 「誰に対して、どのように伝えるか」「翻訳者としての能力」를 강조했다. 정답은 2번 「非技術系の相手にわかりやすく伝えるコミュニケーション力」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30009-0000-0000-0000-000000000032', '高度な統計手法と数理モデルの習得', false, 1),
('adc30009-0000-0000-0000-000000000032', '非技術系の相手にわかりやすく伝えるコミュニケーション力', true, 2),
('adc30009-0000-0000-0000-000000000032', '経営層向けの専門用語を正確に使う能力', false, 3),
('adc30009-0000-0000-0000-000000000032', '最新のデータ分析ツールを素早く習得すること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30010-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ラジオで、心理士が職場のハラスメントについて話しています。\n\n男：職場のハラスメントというと、強い言葉での叱責や暴力的な行為がイメージされがちですが、近年問題になっているのは「マイクロアグレッション」と呼ばれる、一つひとつは些細に見えるが累積することで深刻なダメージを与える言動です。例えば、「この業務、あなたには難しいかもしれないけど」という一言が、受け手にとって能力を低く見られたと感じさせることがある。悪意がなくても、相手が傷つけばハラスメントになり得るという認識を、管理職を中心に持ってもらうことが、健全な職場環境づくりの第一歩です。\n\n質問：この心理士が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '심리사는 悪意のない言動でも累積してハラスメントになりうるという認識が重要だと강조했다. 정답은 1번 「悪意がなくても累積する小さな言動がハラスメントになり得る」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30010-0000-0000-0000-000000000032', '悪意がなくても累積する小さな言動がハラスメントになり得る', true, 1),
('adc30010-0000-0000-0000-000000000032', '職場のハラスメントは暴力的行為のみが問題である', false, 2),
('adc30010-0000-0000-0000-000000000032', 'ハラスメントの被害者は声を上げるべきだ', false, 3),
('adc30010-0000-0000-0000-000000000032', '管理職向けの研修を義務化すれば問題は解決する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30011-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'電話で男女が話しています。\n\n男：もしもし、先週ご依頼したウェブサイトのリニューアルの件なんですが。\n女：はい、株式会社クリエイトデザインの渡辺でございます。いつもお世話になっております。\n男：先日お送りしたデザイン修正の指示書をご確認いただけましたか。\n女：はい、拝見いたしました。ほとんどの点は対応可能なのですが、トップページのメインビジュアルのアニメーション部分は、現在の仕様では技術的に難しく、追加費用が発生してしまいます。\n男：そうですか。費用はどのくらいになりますか。\n女：概算で3万円ほどになります。ご了承いただければ進められますが、いかがでしょうか。\n男：少し社内で確認してから返答させてください。明日中にご連絡します。\n\n質問：男の人はどうすることにしましたか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '남성은 「社内で確認してから返答する」라고 했다. 정답은 3번 「社内で費用について確認してから返答する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30011-0000-0000-0000-000000000032', 'アニメーションなしでリニューアルを進める', false, 1),
('adc30011-0000-0000-0000-000000000032', '追加費用3万円を了承してすぐに進める', false, 2),
('adc30011-0000-0000-0000-000000000032', '社内で費用について確認してから返答する', true, 3),
('adc30011-0000-0000-0000-000000000032', '別のデザイン会社に見積もりを依頼する', false, 4);

-- ============================================================
-- 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30012-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ポッドキャストで大学教授が話しています。\n\n女：教育の世界でよく「褒めて育てる」と言われますが、私の研究では、無条件に褒めることは必ずしも子どもの成長につながらないことが示されています。特に「賢いね」「才能があるね」という能力への称賛は、子どもに失敗を恐れさせ、挑戦を避けるようになるリスクがあります。むしろ重要なのは、「どれだけ努力したか」「どんなプロセスで取り組んだか」というプロセスへの承認です。努力を認めることで、子どもは困難に直面したときに諦めず、試行錯誤を重ねる姿勢を身につけます。\n\n質問：この教授が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '교수는 능력에 대한 칭찬보다 노력과 프로세스를 인정하는 것이 중요하다고 주장한다. 정답은 4번 「能力ではなく努力のプロセスを認めることが子どもの成長につながる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30012-0000-0000-0000-000000000032', '子どもはたくさん褒めるほど自信がつく', false, 1),
('adc30012-0000-0000-0000-000000000032', '才能のある子どもを早期に発見して伸ばすべきだ', false, 2),
('adc30012-0000-0000-0000-000000000032', '失敗を恐れないよう厳しく指導することが重要だ', false, 3),
('adc30012-0000-0000-0000-000000000032', '能力ではなく努力のプロセスを認めることが子どもの成長につながる', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30013-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ニュースでレポーターが報告しています。\n\n男：過疎化が進む地方都市で、移住促進策の一環として「ワーケーション」を活用した取り組みが広がっています。ワーケーションとは、仕事をしながら旅行や観光を楽しむスタイルで、リモートワークの普及によって現実的な選択肢となりました。ある自治体では、古民家をリノベーションしたコワーキングスペースを整備し、都市部の会社員が数週間滞在しながら働ける環境を提供しています。短期的な観光消費だけでなく、移住・定住につながる関係人口の増加を目指しており、実際にこの取り組みを通じて移住を決めた人も出てきています。\n\n質問：このニュースが最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '뉴스의 핵심은 워케이션을 활용해 지방 과소화 문제를 해결하려는 사례와 그 성과이다. 정답은 1번 「ワーケーションを活用した地方への関係人口増加の取り組み」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30013-0000-0000-0000-000000000032', 'ワーケーションを活用した地方への関係人口増加の取り組み', true, 1),
('adc30013-0000-0000-0000-000000000032', '古民家のリノベーションビジネスが急成長している', false, 2),
('adc30013-0000-0000-0000-000000000032', 'リモートワークの普及で都市から人口が流出している', false, 3),
('adc30013-0000-0000-0000-000000000032', '観光業の振興が地方経済回復の唯一の手段だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30014-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'講演会で企業の人事部長が話しています。\n\n女：近年、多くの企業が「心理的安全性」の重要性を認識するようになりました。心理的安全性とは、チームの中で自分の意見や懸念を安心して表明できる状態のことです。Googleの研究でも、高いパフォーマンスを発揮するチームに共通する最大の要因として心理的安全性が挙げられています。しかし、単に「なんでも言っていい雰囲気」を作るだけでは不十分です。重要なのは、批判を恐れずに発言できる環境と、その発言が実際の意思決定に反映される仕組みの両方が整っていることです。発言しても何も変わらない組織では、やがて心理的安全性は形骸化してしまいます。\n\n質問：この人事部長が最も強調していることは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '인사부장은 발언할 수 있는 환경과 그것이 의사결정에 반영되는 구조 두 가지 모두가 필요하다고 강조했다. 정답은 2번 「発言できる環境と意思決定への反映の仕組みがともに必要」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30014-0000-0000-0000-000000000032', '心理的安全性は業績よりも従業員の幸福感のために重要だ', false, 1),
('adc30014-0000-0000-0000-000000000032', '発言できる環境と意思決定への反映の仕組みがともに必要', true, 2),
('adc30014-0000-0000-0000-000000000032', '心理的安全性はGoogleのような大企業にしか実現できない', false, 3),
('adc30014-0000-0000-0000-000000000032', 'リーダーが積極的に部下の意見を求めれば十分だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30015-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'インタビューで哲学者が話しています。\n\n男：現代人は「選択の自由」を最大の価値と信じていますが、皮肉なことに、選択肢が多すぎることで人々は幸福感を失っています。これは「選択のパラドックス」と呼ばれる現象で、選べる選択肢が増えるほど、「別の選択をすれば良かった」という後悔が生まれやすくなります。また、自分が下した選択の責任をすべて自分で負わなければならないというプレッシャーも増大します。本当の自由とは、無限の選択肢を持つことではなく、自分にとって何が大切かという価値基準を明確に持ち、それに沿った選択を迷わずできることではないでしょうか。\n\n質問：この哲学者の主な主張は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '철학자는 선택지가 많을수록 후회가 늘고, 진정한 자유는 자신의 가치 기준에 따른 선택임을 주장한다. 정답은 3번 「選択肢の多さは幸福をもたらさず、自分の価値基準に沿った選択こそが真の自由」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30015-0000-0000-0000-000000000032', '現代社会は選択の自由が制限されすぎている', false, 1),
('adc30015-0000-0000-0000-000000000032', '選択に失敗しても後悔しない精神力を鍛えるべきだ', false, 2),
('adc30015-0000-0000-0000-000000000032', '選択肢の多さは幸福をもたらさず、自分の価値基準に沿った選択こそが真の自由', true, 3),
('adc30015-0000-0000-0000-000000000032', '選択のパラドックスはデジタル社会特有の問題だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30016-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'シンポジウムで医療専門家が発表しています。\n\n女：高齢化社会において、認知症予防は急務の課題です。近年の研究では、60代・70代からの取り組みよりも、40代・50代という「認知症予備軍」の段階での生活習慣改善の方が、予防効果が格段に高いことが示されています。特に注目されているのが、社会的つながりの維持です。孤立した生活は認知機能の低下を加速させる一方、友人や家族との交流、地域コミュニティへの参加が認知症リスクを低減させるという研究結果が蓄積されています。薬よりも生活の質と社会参加が、最善の予防策であると言えます。\n\n質問：この専門家の主な主張は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '전문가는 40~50대부터 사회적 유대를 유지하는 생활습관 개선이 인지증 예방에 효과적이라고 주장한다. 정답은 2번 「40〜50代からの社会的つながりの維持が認知症の最善の予防策」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30016-0000-0000-0000-000000000032', '認知症予防には早期の薬物治療が最も効果的だ', false, 1),
('adc30016-0000-0000-0000-000000000032', '40〜50代からの社会的つながりの維持が認知症の最善の予防策', true, 2),
('adc30016-0000-0000-0000-000000000032', '高齢者は施設での集団生活が認知症予防に最適だ', false, 3),
('adc30016-0000-0000-0000-000000000032', '認知症は遺伝的要因が最も大きく生活習慣では防げない', false, 4);

-- ============================================================
-- 即時応答 (LISTENING_QUICK_RESPONSE) — 11問 (sort_order 17-27)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30017-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：この資料、明日の会議で使いたいのですが、今から修正をお願いできますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '업무 요청에 대한 자연스러운 수락 응답으로 「かしこまりました。今夜中に仕上げてお送りします」가 가장 적절하다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30017-0000-0000-0000-000000000032', '明日の会議ですか。難しいかもしれません。', false, 1),
('adc30017-0000-0000-0000-000000000032', 'かしこまりました。今夜中に仕上げてお送りします。', true, 2),
('adc30017-0000-0000-0000-000000000032', 'では、明日の朝に確認してみます。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30018-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：今日はお忙しい中、お時間をいただきありがとうございました。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '면담 후 감사 인사에 대한 겸양 표현으로 「いいえ、こちらこそ有益なお話ができて光栄でした」가 가장 자연스럽다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30018-0000-0000-0000-000000000032', 'いいえ、こちらこそ有益なお話ができて光栄でした。', true, 1),
('adc30018-0000-0000-0000-000000000032', 'ありがとうございます。お気になさらず。', false, 2),
('adc30018-0000-0000-0000-000000000032', 'はい、とても忙しかったです。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30019-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：先ほどの発言、少し言い過ぎたかもしれません。ご不快をおかけしたなら申し訳ありません。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '사과 표현에 대한 적절한 수용 응답으로 「いいえ、率直なご意見はありがたいです」가 가장 자연스럽다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30019-0000-0000-0000-000000000032', 'はい、確かに失礼でした。', false, 1),
('adc30019-0000-0000-0000-000000000032', 'そうですね、次回は気をつけてください。', false, 2),
('adc30019-0000-0000-0000-000000000032', 'いいえ、率直なご意見はありがたいです。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30020-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：この件、私が担当者に直接確認してもよろしいでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '확인 요청에 대한 승인 응답으로 「はい、ぜひお願いします。担当は佐藤と申します」가 가장 적절하다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30020-0000-0000-0000-000000000032', 'そうですね、私から伝えておきます。', false, 1),
('adc30020-0000-0000-0000-000000000032', 'はい、ぜひお願いします。担当は佐藤と申します。', true, 2),
('adc30020-0000-0000-0000-000000000032', '直接ですか。それは少し困ります。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30021-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：明日の午後2時からミーティングを入れたいのですが、ご都合はいかがですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  '일정 확인 요청에 대한 자연스러운 응답으로 「明日の午後2時ですね。問題ございません」가 가장 적절하다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30021-0000-0000-0000-000000000032', '明日の午後2時ですね。問題ございません。', true, 1),
('adc30021-0000-0000-0000-000000000032', 'ミーティングはいつでも構いません。', false, 2),
('adc30021-0000-0000-0000-000000000032', '2時からですか。少し遅れるかもしれません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30022-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：報告書の件、もう少し詳細に書いていただけませんか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '수정 지시에 대한 자연스러운 수락 응답으로 「承知しました。どの点をより詳しく書けばよいか教えていただけますか」가 적절하다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30022-0000-0000-0000-000000000032', 'これ以上詳しくは書けません。', false, 1),
('adc30022-0000-0000-0000-000000000032', 'わかりました。もっと短くまとめます。', false, 2),
('adc30022-0000-0000-0000-000000000032', '承知しました。どの点をより詳しく書けばよいか教えていただけますか。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30023-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：お荷物、よろしければお持ちしましょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '호의를 정중히 받는 응답으로 「ありがとうございます。では、こちらをお願いできますか」가 가장 자연스럽다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30023-0000-0000-0000-000000000032', 'いいえ、荷物は重くないので大丈夫です。', false, 1),
('adc30023-0000-0000-0000-000000000032', 'ありがとうございます。では、こちらをお願いできますか。', true, 2),
('adc30023-0000-0000-0000-000000000032', 'お構いなく、自分でやります。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30024-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：先週お伝えした件、もう一度確認させていただいてもよろしいですか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '재확인 요청에 대한 자연스러운 응답으로 「はい、どうぞ。何についてでしたでしょうか」가 적절하다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30024-0000-0000-0000-000000000032', 'はい、どうぞ。何についてでしたでしょうか。', true, 1),
('adc30024-0000-0000-0000-000000000032', 'もう確認済みですよ。', false, 2),
('adc30024-0000-0000-0000-000000000032', '先週のことはもう終わった話ではないですか。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30025-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：この企画、少し方向性を変えたほうがよいと思うのですが、いかがでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  '제안에 대한 건설적인 응답으로 「なるほど、具体的にどう変えればよいとお考えですか」가 가장 적절하다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30025-0000-0000-0000-000000000032', 'この企画はもう決定済みなので変えられません。', false, 1),
('adc30025-0000-0000-0000-000000000032', 'そうですね、では全部やり直しましょう。', false, 2),
('adc30025-0000-0000-0000-000000000032', 'なるほど、具体的にどう変えればよいとお考えですか。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30026-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'男：この度の昇進、おめでとうございます。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '승진 축하에 대한 겸양 있는 응답으로 「ありがとうございます。皆さんのおかげです」が가장 자연스럽다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30026-0000-0000-0000-000000000032', 'はい、当然の結果だと思います。', false, 1),
('adc30026-0000-0000-0000-000000000032', 'ありがとうございます。皆さんのおかげです。', true, 2),
('adc30026-0000-0000-0000-000000000032', 'おめでとうございます、あなたもですね。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30027-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'女：今後の方針についてご意見があれば、ぜひ聞かせていただけますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '의견 요청에 대한 자연스러운 응답으로 「ありがとうございます。一点だけよろしいでしょうか」가 가장 적절하다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30027-0000-0000-0000-000000000032', 'ありがとうございます。一点だけよろしいでしょうか。', true, 1),
('adc30027-0000-0000-0000-000000000032', '特にありません。現状のままでよいと思います。', false, 2),
('adc30027-0000-0000-0000-000000000032', '意見を言っても変わらないのではないですか。', false, 3);

-- ============================================================
-- 統合理解 (LISTENING_INTEGRATED) — 3問 (sort_order 28-30)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30028-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'テレビの討論番組で、働き方改革について二人の専門家が議論しています。\n\n司会：日本における働き方改革の現状と課題について、お二人のご意見をお聞かせください。\n男（A氏）：法律による残業規制は一定の成果を上げていますが、問題は「見えない残業」です。退勤後にスマートフォンで業務連絡をやり取りしたり、自宅で仕事の続きをしたりするケースが増えており、これでは形の上だけの改革に過ぎません。労働時間の削減よりも、仕事の生産性をどう高めるかを議論すべきです。\n女（B氏）：おっしゃる通りです。単に時間を切るだけでは、仕事の総量は変わらないので、圧縮されたしわ寄せが労働者に来るだけです。本質的な改革には、業務プロセスの見直しと、無駄な仕事を思い切って削除する組織的な意思決定が必要だと思います。\n男（A氏）：業務の棚卸しは非常に重要ですね。ただ、それには管理職の意識改革も欠かせません。「長時間働くことが美徳」という価値観が根強く残っている限り、制度だけ変えても文化は変わりません。\n女（B氏）：管理職の意識については私も同意します。評価基準を時間から成果へと転換しない限り、真の意味での働き方改革は実現しないでしょう。\n\n質問：二人の専門家が共通して指摘している問題は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  28,
  'A氏는 生産性向上と管理職의 의식 개혁을, B氏도 업무 프로세스 재검토와 평가 기준 전환(시간에서 성과로)를 공통으로 주장한다. 두 사람 모두 시간 삭감만으로는 불충분하며 업무의 본질적 개혁이 필요하다는 점에 동의한다. 정답은 4번 「時間削減だけでは不十分で、業務の本質的な見直しと評価基準の転換が必要」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30028-0000-0000-0000-000000000032', '残業規制の法律が厳しすぎて企業活動が阻害されている', false, 1),
('adc30028-0000-0000-0000-000000000032', 'スマートフォンの業務利用を禁止すべきだ', false, 2),
('adc30028-0000-0000-0000-000000000032', '働き方改革は中小企業には適用が難しい', false, 3),
('adc30028-0000-0000-0000-000000000032', '時間削減だけでは不十分で、業務の本質的な見直しと評価基準の転換が必要', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30029-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'ラジオで、栄養士と運動生理学者が健康維持について対談しています。\n\n司会：現代人が日常生活で取り入れやすい健康習慣について、それぞれのご専門からお話しいただけますか。\n女（栄養士）：食事面で言うと、特別な制限食よりも、食べる「タイミング」と「組み合わせ」を意識するだけで大きく変わります。特に朝食を抜かないこと、そして夜遅い時間の高カロリー摂取を避けることが基本です。バランスの良い食事と言いますが、毎食完璧を目指すより、1週間単位でのバランスを見るほうが継続しやすいです。\n男（運動生理学者）：運動については、「まとまった時間が取れないからできない」と思っている方が多いのですが、研究では1回10分程度の運動を1日に複数回行っても、30分連続して行うのと同等の健康効果が得られることが示されています。重要なのは継続することであり、完璧な形を求めて挫折するより、少しでも続けることです。\n女（栄養士）：継続という点は食事でも全く同じですね。完璧主義より柔軟性が長続きの秘訣です。\n男（運動生理学者）：おっしゃる通りです。健康習慣は「やるかやらないか」の二択ではなく、日々のライフスタイルに自然に溶け込ませることが大切だと思います。\n\n質問：栄養士と運動生理学者の両方が強調していることは何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '두 사람 모두 완벽을 추구하지 말고 유연하게 지속하는 것이 중요하다는 점에 동의한다. 정답은 2번 「完璧主義にとらわれず継続することが健康習慣の鍵」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30029-0000-0000-0000-000000000032', '専門家の指導のもとで食事制限と運動を組み合わせること', false, 1),
('adc30029-0000-0000-0000-000000000032', '完璧主義にとらわれず継続することが健康習慣の鍵', true, 2),
('adc30029-0000-0000-0000-000000000032', '朝食を必ず取り、1日30分以上連続して運動すること', false, 3),
('adc30029-0000-0000-0000-000000000032', '最新の科学的研究に基づいた食事と運動の方法を学ぶこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30030-0000-0000-0000-000000000032',
  'ad000001-0000-0000-0000-000000000123',
  'audio_listening',
  E'経済フォーラムで、二人のアナリストがスタートアップ支援政策について議論しています。\n\n司会：日本のスタートアップエコシステムの強化に向けて、どのような政策が必要だとお考えですか。\n男（E氏）：一番の課題は資金調達環境です。日本ではベンチャーキャピタルの規模が欧米と比べて著しく小さく、大きなリスクを取って成長を目指すスタートアップへの投資が少ない。政府として公的資金のリスクマネーを呼び水にして、民間資金を引き出す仕組みが必要です。\n女（F氏）：資金は重要ですが、私はむしろ人材の流動性の低さが根本的な問題だと思います。優秀な人材が大企業や官公庁に固定されて、スタートアップへの転職や起業に踏み出しにくい社会構造がある。失敗しても再挑戦できるセーフティーネットと、スタートアップで働くことへの社会的評価の向上が必要です。\n男（E氏）：人材面の問題は確かに深刻ですね。資金があっても動かす人材がいなければ成長できません。\n女（F氏）：そうです。結局、資金と人材の両方が揃って初めてエコシステムとして機能します。どちらか一方では不十分です。\n\n質問：二人のアナリストが最終的に合意した内容は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '두 사람은 마지막에 「資金と人材の両方が揃って初めてエコシステムとして機能する」라는 점에 합의했다. 정답은 3번 「資金調達環境と人材流動性の両方を改善する必要がある」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30030-0000-0000-0000-000000000032', '政府が直接スタートアップに出資すべきだ', false, 1),
('adc30030-0000-0000-0000-000000000032', '大企業からスタートアップへの出向制度を義務化すべきだ', false, 2),
('adc30030-0000-0000-0000-000000000032', '資金調達環境と人材流動性の両方を改善する必要がある', true, 3),
('adc30030-0000-0000-0000-000000000032', '日本は欧米のスタートアップ政策をそのまま導入すべきだ', false, 4);
