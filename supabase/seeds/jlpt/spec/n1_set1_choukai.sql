-- encoding: UTF-8
-- JLPT N1 模試(本番) 聴解 30問 — Set 1
-- quiz_id: ad000001-0000-0000-0000-000000000113

-- ============================================================
-- 課題理解 (LISTENING_TASK) — 5問 (sort_order 1-5)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000001',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：田中さん、明日の会議の資料、まだできていないんですか。\n女：すみません、あと少しで仕上がります。\n男：じゃ、今夜中に送ってもらえますか。\n女：はい、必ず今夜中にお送りします。\n\n質問：男の人は女の人に何をするよう求めましたか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  1,
  '남성은 「今夜中に送ってもらえますか」라고 요청하고 있다. 정답은 2번 「資料を今夜中に送ること」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000001', '明日の朝までに資料を完成させること', false, 1),
('adc30001-0000-0000-0000-000000000001', '資料を今夜中に送ること', true, 2),
('adc30001-0000-0000-0000-000000000001', '会議の日程を変更すること', false, 3),
('adc30001-0000-0000-0000-000000000001', '資料を印刷して持参すること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000002',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：部長、先方から契約書の修正箇所についてご連絡がありました。第3条の納期条件を2週間延長してほしいとのことです。\n男：そうか。それについては法務部にも確認が必要だな。まず法務部に相談してから、先方に回答しよう。\n女：かしこまりました。では、法務部への連絡は私がいたしましょうか。\n男：いや、この件は私が直接話す。君は先方に「確認の上、明日中にご連絡します」と伝えておいてくれ。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  2,
  '남성은 「この件は私が直接話す」라고 하며 법무부에 직접 연락하겠다고 말했다. 정답은 1번 「法務部に連絡する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000002', '法務部に連絡する', true, 1),
('adc30001-0000-0000-0000-000000000002', '先方に契約書を送り返す', false, 2),
('adc30001-0000-0000-0000-000000000002', '女性に先方への回答を任せる', false, 3),
('adc30001-0000-0000-0000-000000000002', '契約書の第3条を修正する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000003',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：山田さん、今月の売上報告書なんですが、グラフの数値と本文の数字が食い違っているところがあるんです。\n女：えっ、そうですか。どのページですか。\n男：12ページの第3四半期の部分です。グラフでは前年比15%増となっているのに、本文には12%増と書いてあって。\n女：あ、それは私のミスです。本文のほうが正しいので、グラフを修正します。それと、念のため他のページも再確認してみます。\n男：お願いします。提出は明後日なので、明日中に修正版を送ってもらえますか。\n\n質問：女の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  3,
  '여성은 「グラフを修正します。それと、念のため他のページも再確認してみます」라고 했다. 먼저 해야 할 일은 3번 「グラフの数値を修正する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000003', '報告書を再提出する', false, 1),
('adc30001-0000-0000-0000-000000000003', '本文の数字を書き直す', false, 2),
('adc30001-0000-0000-0000-000000000003', 'グラフの数値を修正する', true, 3),
('adc30001-0000-0000-0000-000000000003', '明後日までに全ページを確認する', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000004',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：鈴木さん、新しいシステムの導入について、ユーザー研修の日程はどうなっていますか。\n男：来月の第2週を予定していたんですが、システム会社側の都合で少し後ろ倒しになりそうです。\n女：そうですか。では、研修の前に操作マニュアルだけでも各部署に配布しておいてもらえますか。\n男：マニュアルはすでに印刷済みです。ただ、配布はシステムの最終確認が終わってからのほうがよいかと思いまして。\n女：わかりました。では確認が取れ次第、すぐに配布をお願いします。\n\n質問：男の人はマニュアルの配布についてどうしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  4,
  '남성은 시스템 최종 확인 후 배포하는 것이 좋겠다고 했고 여성도 이에 동의했다. 정답은 4번 「システムの確認後に配布する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000004', '研修の日程が決まってから印刷する', false, 1),
('adc30001-0000-0000-0000-000000000004', '来月の第2週に各部署へ届ける', false, 2),
('adc30001-0000-0000-0000-000000000004', '女性の指示を待ってから印刷する', false, 3),
('adc30001-0000-0000-0000-000000000004', 'システムの確認後に配布する', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000005',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：課長、先日ご相談した海外展示会への出展件なんですが、上層部からの承認はいただけましたか。\n女：ええ、昨日会議で承認されました。ただし、予算は申請額の8割に削減ということで。\n男：8割ですか。ブース費用と渡航費だけでほぼいっぱいになりますね。\n女：そうね。だから展示用サンプルの輸送費は現地の代理店に立て替えてもらう方向で交渉してみてください。\n男：わかりました。では早速、現地代理店に連絡を取ります。\n\n質問：男の人はこれからまず何をしますか。',
  'listening',
  'LISTENING_TASK',
  true,
  1,
  5,
  '남성은 마지막에 「現地代理店に連絡を取ります」라고 말했다. 정답은 2번 「現地の代理店に連絡する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000005', '上層部に予算の増額を申請する', false, 1),
('adc30001-0000-0000-0000-000000000005', '現地の代理店に連絡する', true, 2),
('adc30001-0000-0000-0000-000000000005', '展示会への出展をキャンセルする', false, 3),
('adc30001-0000-0000-0000-000000000005', 'ブース費用の見積もりを取り直す', false, 4);

-- ============================================================
-- ポイント理解 (LISTENING_POINT) — 6問 (sort_order 6-11)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000006',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'ラジオで、キャリアコンサルタントが話しています。\n\n女：就職活動においてエントリーシートで最も重視されるのは「自己PR」の部分です。多くの学生が「やる気があります」「頑張ります」という抽象的な表現を使いがちですが、採用担当者はそういった言葉には動かされません。重要なのは、具体的なエピソードと、そこから何を学び、どう成長したかという論理的な流れです。特に、困難を乗り越えた経験を数値や事実で裏付けることが効果的です。\n\n質問：このキャリアコンサルタントによると、エントリーシートで最も重要なことは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  6,
  '「具体的なエピソードと、そこから何を学び、どう成長したかという論理的な流れ」が重要と述べている。정답은 1번 「具体的な経験と成長を論理的に示すこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000006', '具体的な経験と成長を論理的に示すこと', true, 1),
('adc30001-0000-0000-0000-000000000006', '強いやる気と積極性をアピールすること', false, 2),
('adc30001-0000-0000-0000-000000000006', '資格や学歴を詳しく書くこと', false, 3),
('adc30001-0000-0000-0000-000000000006', '採用担当者の好みに合わせた表現を選ぶこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000007',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'会社で男女が話しています。\n\n男：佐藤さん、今度の新製品発表会なんですが、プレゼン資料の構成についてご意見を伺えますか。\n女：ええ、いいですよ。今どういう構成を考えているんですか。\n男：まず製品の特徴を説明して、次に競合との比較、最後に価格と購入方法という流れです。\n女：うーん、私はちょっと違う意見なんですが。お客様って、最初に「これは自分に何のメリットがあるか」を知りたいんですよね。だから、冒頭でまず顧客の課題を提示して、「この製品でその課題が解決できます」という流れにしたほうが心に響くと思います。\n男：なるほど、確かにそのほうが聴衆を引き込めそうですね。\n\n質問：女の人はプレゼンの冒頭で何をすべきだと言っていますか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  7,
  '여성은 「冒頭でまず顧客の課題を提示して」라고 했다. 정답은 4번 「顧客が抱えている課題を示す」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000007', '製品の価格と購入方法を説明する', false, 1),
('adc30001-0000-0000-0000-000000000007', '競合他社の製品との比較を行う', false, 2),
('adc30001-0000-0000-0000-000000000007', '製品の主な特徴を詳しく紹介する', false, 3),
('adc30001-0000-0000-0000-000000000007', '顧客が抱えている課題を示す', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000008',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'テレビで専門家がリモートワークについて話しています。\n\n女：リモートワークの普及によって生産性が上がったという報告がある一方、孤独感やコミュニケーション不足から心理的な健康を損なうケースも増えています。調査によると、リモートワーク中の従業員が最も困っているのは「仕事とプライベートの境界が曖昧になること」で、労働時間が増加し、休息が取りにくくなっているという声が多く聞かれます。企業としては、就業時間のルールを明確にし、定期的なオンラインミーティングで孤立を防ぐ取り組みが求められています。\n\n質問：専門家によると、リモートワーク中の従業員が最も困っていることは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  8,
  '「仕事とプライベートの境界が曖昧になること」が最も困っていることとして挙げられている。정답은 2번 「仕事と私生活の区別がつきにくいこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000008', '孤独感でモチベーションが下がること', false, 1),
('adc30001-0000-0000-0000-000000000008', '仕事と私生活の区別がつきにくいこと', true, 2),
('adc30001-0000-0000-0000-000000000008', 'インターネット接続が不安定なこと', false, 3),
('adc30001-0000-0000-0000-000000000008', '同僚との情報共有が困難なこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000009',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'会議室で上司と部下が話しています。\n\n男：中村さん、例のクライアントへの提案書なんですが、私の感想を言ってもいいですか。\n女：はい、ぜひお聞かせください。\n男：内容自体は充実しているんですが、読んでいて少し疲れます。ページ数も多いし、文字が詰まりすぎている。\n女：そうですか。では文字を減らして図表を増やすということでしょうか。\n男：それもそうですが、一番変えてほしいのは構成です。結論を最初に持ってきて、その根拠や詳細は後にまとめてほしいんです。今は細かい説明が延々と続いてから結論が来るので、クライアントが途中で読む気をなくしてしまう可能性があります。\n\n質問：上司が最も変えてほしいと言っているのは何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  9,
  '「一番変えてほしいのは構成」「結論を最初に持ってきて」と述べている。정답은 3번 「提案書の構成（結論を先に）」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000009', '提案書のページ数を減らすこと', false, 1),
('adc30001-0000-0000-0000-000000000009', '図表を増やして文字を減らすこと', false, 2),
('adc30001-0000-0000-0000-000000000009', '結論を冒頭に置く構成にすること', true, 3),
('adc30001-0000-0000-0000-000000000009', '専門用語をわかりやすく言い換えること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000010',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'講演会で研究者が話しています。\n\n女：近年、AIによる画像認識技術は飛躍的な進歩を遂げており、医療分野での活用が期待されています。特にがんの早期発見においては、熟練した医師と同等以上の診断精度を示すシステムも登場しています。しかし、現時点での最大の課題は「説明可能性」の問題です。AIがなぜその診断を下したのかを医師や患者に説明できないため、責任の所在が曖昧になるという倫理的問題が解決されていません。技術の普及には、精度の高さだけでなく、判断過程の透明性が不可欠です。\n\n質問：研究者によると、医療AIの現在の最大の課題は何ですか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  10,
  '「現時点での最大の課題は「説明可能性」の問題」と明言している。정답은 1번 「診断の根拠を説明できないこと」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000010', '診断の根拠を説明できないこと', true, 1),
('adc30001-0000-0000-0000-000000000010', '医師よりも診断精度が低いこと', false, 2),
('adc30001-0000-0000-0000-000000000010', 'システムの導入コストが高すぎること', false, 3),
('adc30001-0000-0000-0000-000000000010', '患者データのプライバシー保護が難しいこと', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000011',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'電話で男女が話しています。\n\n女：もしもし、松本と申します。先日お申し込みいただいたオンライン研修の件でご連絡しております。\n男：はい、お待ちしておりました。\n女：ありがとうございます。実は、ご予約いただいていた来月15日のコースなんですが、講師の都合により開催日が変更になりまして。\n男：そうですか。いつになるんでしょうか。\n女：22日に変更させていただきたいのですが、いかがでしょうか。もしご都合が合わない場合は、全額ご返金することも可能です。\n男：22日ですね…その日は午前中だけなら大丈夫です。午後は別の予定があって。\n女：コースは午前10時から12時までですので、問題ございません。\n男：それなら出席できます。では22日でお願いします。\n\n質問：男の人はどうすることにしましたか。',
  'listening',
  'LISTENING_POINT',
  true,
  1,
  11,
  '남성은 「22日でお願いします」라고 하여 변경된 날짜의 연수에 참가하기로 했다. 정답은 4번 「日程変更後のコースに参加する」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000011', 'コースのキャンセルと返金を求める', false, 1),
('adc30001-0000-0000-0000-000000000011', '15日のコースに予定通り参加する', false, 2),
('adc30001-0000-0000-0000-000000000011', '別の日程のコースに申し込む', false, 3),
('adc30001-0000-0000-0000-000000000011', '日程変更後のコースに参加する', true, 4);

-- ============================================================
-- 概要理解 (LISTENING_SUMMARY) — 5問 (sort_order 12-16)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000012',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'ポッドキャストで経営者が話しています。\n\n男：私が会社を立ち上げた頃、周りからは「リスクが高すぎる」「失敗したら取り返しがつかない」と散々言われました。でも私は逆に考えていました。行動しないことのリスク、つまり現状維持こそが最大のリスクだと。世の中は常に変化していますから、何もしないということは、気づかないうちに取り残されていくということなんです。もちろん、やみくもに突き進むのは無謀です。ただ、十分な準備と情報収集を経たうえでの行動なら、たとえ失敗したとしても、そこから得られる学びは次のチャンスへの資産になります。\n\n質問：この経営者が最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  12,
  '경영자는 현상유지가 최대의 리스크이며, 준비된 행동으로 얻는 실패의 경험도 자산이 된다고 말하고 있다. 정답은 3번 「準備した上での行動は失敗も学びになる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000012', '失敗を恐れずに無謀な挑戦をすべきだ', false, 1),
('adc30001-0000-0000-0000-000000000012', 'リスクが高い事業には手を出さないほうがよい', false, 2),
('adc30001-0000-0000-0000-000000000012', '準備を経た行動なら失敗も成長の糧になる', true, 3),
('adc30001-0000-0000-0000-000000000012', '現状維持は安全で賢明な選択肢だ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000013',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'ニュースで記者がレポートしています。\n\n女：今年の猛暑により、農作物への深刻な影響が出ています。特に米の生育状況を見ると、高温障害による品質低下が広範囲で確認されており、等級外品の割合が昨年と比べて大幅に増加しています。一方、政府は緊急の対策として農家への補助金支給を発表しましたが、農業関係者からは「補助金では根本的な解決にならない」「気候変動に対応した品種の研究開発に予算を回すべきだ」といった声が上がっています。専門家も、短期的な支援よりも長期的な農業インフラへの投資が急務だと指摘しています。\n\n質問：このニュースが最も伝えたいことは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  13,
  '뉴스의 핵심은 보조금 등 단기 지원보다 기후 변화에 대응한 장기적 농업 인프라 투자가 필요하다는 것이다. 정답은 2번 「農業への長期的投資の必要性」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000013', '今年の猛暑は過去最高を記録した', false, 1),
('adc30001-0000-0000-0000-000000000013', '短期支援より長期的な農業インフラ投資が必要だ', true, 2),
('adc30001-0000-0000-0000-000000000013', '政府の補助金は農家に十分な支援をしている', false, 3),
('adc30001-0000-0000-0000-000000000013', '米の輸入量を増やして不足に対応すべきだ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000014',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'大学の講義で教授が話しています。\n\n男：みなさんは「確証バイアス」という言葉を聞いたことがありますか。これは、自分が既に信じていることを裏付ける情報だけを選択的に集め、それに反する証拠を無視してしまう認知の偏りのことです。SNSのアルゴリズムはこのバイアスを増幅させる構造になっています。自分の好みに合った情報ばかりが表示されるため、異なる価値観や視点に触れる機会が減り、いわゆる「エコーチェンバー」が形成されやすくなります。批判的思考力を養うためには、意識的に自分の意見と異なる情報源に触れる習慣をつけることが重要です。\n\n質問：教授の講義の主なテーマは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  14,
  '강의 전체가 확증 편향과 SNS가 이를 강화하는 구조, 그리고 비판적 사고의 필요성에 관한 것이다. 정답은 4번 「確証バイアスとSNSが思考に与える影響」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000014', 'SNSを使った情報収集の効率的な方法', false, 1),
('adc30001-0000-0000-0000-000000000014', 'アルゴリズムの仕組みと技術的な問題点', false, 2),
('adc30001-0000-0000-0000-000000000014', '多様な価値観を尊重することの道徳的重要性', false, 3),
('adc30001-0000-0000-0000-000000000014', '確証バイアスとSNSが思考に与える影響', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000015',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'インタビューで作家が話しています。\n\n女：私は長い間、「才能がなければ良い作品は書けない」と思っていました。でも、書き続けるうちに気づいたんです。才能よりも大切なのは、書くことへの強迫的なまでの習慣と、失敗作を世に出す勇気だと。完璧を求めて原稿を抱え込む作家は成長しません。未完成でもいいから発表して、読者からの反応を糧にする。批判を恐れず、むしろ批判から学ぶ姿勢こそが、長期的な成長につながると確信しています。\n\n質問：この作家が最も強調していることは何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  15,
  '작가는 「書くことへの習慣と失敗作を世に出す勇気」「批判から学ぶ姿勢」를 강조하고 있다. 정답은 2번 「習慣と批判を恐れない姿勢が成長につながる」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000015', '生まれ持った才能が作品の質を決める', false, 1),
('adc30001-0000-0000-0000-000000000015', '習慣と批判を恐れない姿勢が成長につながる', true, 2),
('adc30001-0000-0000-0000-000000000015', '完璧な作品を書いてから発表すべきだ', false, 3),
('adc30001-0000-0000-0000-000000000015', '読者からの評価よりも自己満足を優先すべきだ', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000016',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'シンポジウムで研究者が発表しています。\n\n男：都市部への人口集中が続く一方、地方の過疎化が深刻化しています。しかし、この問題をただの人口減少として捉えるのは誤りです。むしろ、テクノロジーを活用すれば、少ない人口でも持続可能な地域社会を維持できる可能性があります。例えば、自動運転技術による交通インフラの維持、AIを活用したスマート農業、遠隔医療システムの整備などが挙げられます。地方創生の鍵は、人を増やすことではなく、テクノロジーで人口減少に対応できる仕組みを作ることにあると考えます。\n\n質問：研究者の主張の要点は何ですか。',
  'listening',
  'LISTENING_SUMMARY',
  true,
  1,
  16,
  '연구자는 인구를 늘리는 것이 아니라 기술로 인구 감소에 대응하는 구조를 만드는 것이 지방 창생의 열쇠라고 주장한다. 정답은 3번 「テクノロジーで人口減少に対応する仕組みが地方創生の鍵だ」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000016', '都市から地方への移住を促進する政策が必要だ', false, 1),
('adc30001-0000-0000-0000-000000000016', '地方の過疎化は解決不可能な問題だ', false, 2),
('adc30001-0000-0000-0000-000000000016', 'テクノロジーで人口減少に対応する仕組みが地方創生の鍵だ', true, 3),
('adc30001-0000-0000-0000-000000000016', '自動運転技術の普及が地方経済を救う', false, 4);

-- ============================================================
-- 即時応答 (LISTENING_QUICK_RESPONSE) — 11問 (sort_order 17-27)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000017',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：すみません、この書類、明日までにお願いできますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  17,
  '업무 의뢰에 대한 수락 응답으로 「承知しました。明日までに仕上げます」가 가장 적절하다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000017', '承知しました。明日までに仕上げます。', true, 1),
('adc30001-0000-0000-0000-000000000017', 'はい、明日よろしくお願いします。', false, 2),
('adc30001-0000-0000-0000-000000000017', 'すみません、それは私の担当ではありません。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000018',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：先日はご丁寧なお土産をいただきまして、ありがとうございました。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  18,
  '감사 인사에 대한 겸손한 응답으로 「いいえ、ほんの気持ちばかりですので」가 자연스럽다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000018', 'こちらこそ、たいへんお世話になりました。', false, 1),
('adc30001-0000-0000-0000-000000000018', 'ありがとうございます。喜んでいただけて光栄です。', false, 2),
('adc30001-0000-0000-0000-000000000018', 'いいえ、ほんの気持ちばかりですので。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000019',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：今日の会議、私が遅刻してしまってご迷惑をおかけしました。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  19,
  '사과를 받는 상황에서의 적절한 응답은 「いいえ、大事な点は共有できましたので、ご心配なく」이다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000019', 'そうですね、次回はお気をつけください。', false, 1),
('adc30001-0000-0000-0000-000000000019', 'いいえ、大事な点は共有できましたので、ご心配なく。', true, 2),
('adc30001-0000-0000-0000-000000000019', 'はい、次回からはお断りします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000020',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：この企画書、部長に見ていただく前に一度目を通していただけませんか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  20,
  '검토 요청에 대한 자연스러운 응답은 「もちろんです。後ほど拝見します」이다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000020', 'もちろんです。後ほど拝見します。', true, 1),
('adc30001-0000-0000-0000-000000000020', 'ええ、部長にも直接お伝えします。', false, 2),
('adc30001-0000-0000-0000-000000000020', 'はい、私が作成いたします。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000021',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：来週の懇親会、ご参加いただけますか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  21,
  '참석 불가를 정중하게 거절하는 응답으로 「あいにく先約がございまして、今回は失礼させていただきます」가 적절하다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000021', 'ええ、ぜひ参加します。楽しみにしています。', false, 1),
('adc30001-0000-0000-0000-000000000021', 'すみません、懇親会は得意ではないので。', false, 2),
('adc30001-0000-0000-0000-000000000021', 'あいにく先約がございまして、今回は失礼させていただきます。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000022',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：このプロジェクト、想定より時間がかかってしまいそうなんですが、どうしましょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  22,
  '납기 지연 가능성을 상담하는 상황에서의 적절한 응답은 「まず現状を整理して、納期の再調整が必要か判断しましょう」이다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000022', 'それは困りましたね。私には何もできません。', false, 1),
('adc30001-0000-0000-0000-000000000022', 'まず現状を整理して、納期の再調整が必要か判断しましょう。', true, 2),
('adc30001-0000-0000-0000-000000000022', 'では、プロジェクトを中止しましょう。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000023',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：この度は弊社の製品をご採用いただき、誠にありがとうございます。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  23,
  '거래처의 감사 인사에 대한 자연스러운 비즈니스 응답은 「こちらこそ、引き続きよろしくお願いいたします」이다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000023', 'こちらこそ、引き続きよろしくお願いいたします。', true, 1),
('adc30001-0000-0000-0000-000000000023', 'ありがとうございます。製品は来週届きます。', false, 2),
('adc30001-0000-0000-0000-000000000023', 'はい、今後ともご検討ください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000024',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：部長、少々お時間をいただけますか。ご相談したいことがあるのですが。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  24,
  '상사가 상담 요청을 받는 상황으로 「いいですよ。今から話を聞きましょう」또는 적절한 시간 제시가 자연스럽다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000024', 'ご相談ですか。メールでお送りください。', false, 1),
('adc30001-0000-0000-0000-000000000024', 'そうですか。何かあったんですか。', false, 2),
('adc30001-0000-0000-0000-000000000024', 'ええ、今ちょうど手が空いています。どうぞ。', true, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000025',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：田中さん、先ほどの発表、とても説得力がありましたよ。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  25,
  '칭찬에 대한 겸손한 일본어 표현으로 「ありがとうございます。そう言っていただけると励みになります」가 가장 적절하다. 정답은 2번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000025', 'はい、私もそう思います。', false, 1),
('adc30001-0000-0000-0000-000000000025', 'ありがとうございます。そう言っていただけると励みになります。', true, 2),
('adc30001-0000-0000-0000-000000000025', 'いいえ、あの発表は失敗でした。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000026',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'女：あの、コピー機の使い方を教えていただけませんか。初めてなもので。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  26,
  '사용법 안내 요청에 대한 자연스러운 응답으로 「もちろんです。こちらへどうぞ」가 적절하다. 정답은 1번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000026', 'もちろんです。こちらへどうぞ。', true, 1),
('adc30001-0000-0000-0000-000000000026', 'コピー機ですか。私も苦手なんですよね。', false, 2),
('adc30001-0000-0000-0000-000000000026', 'マニュアルを読んでください。', false, 3);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000027',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'男：この仕様変更、お客様に確認を取らずに進めてもいいでしょうか。\n\n最も適切な応答を選びなさい。',
  'listening',
  'LISTENING_QUICK_RESPONSE',
  true,
  1,
  27,
  '사양 변경 시 고객 확인 없이 진행 여부를 묻는 상황이므로 「いいえ、必ずお客様に確認してから進めてください」가 정답이다. 정답은 3번.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000027', 'ええ、細かいことは後で説明すればいいですよ。', false, 1),
('adc30001-0000-0000-0000-000000000027', 'では、私から連絡しておきます。', false, 2),
('adc30001-0000-0000-0000-000000000027', 'いいえ、必ずお客様に確認してから進めてください。', true, 3);

-- ============================================================
-- 統合理解 (LISTENING_INTEGRATED) — 3問 (sort_order 28-30)
-- ============================================================

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000028',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'テレビの討論番組で、企業のDX推進について二人の専門家が話しています。\n\n司会：デジタルトランスフォーメーション、いわゆるDXについて、日本企業の現状はいかがでしょうか。\n男（A氏）：日本企業のDXは欧米と比べて大幅に遅れています。最大の問題は、経営層がDXをコスト削減のためのツールとしか捉えていないことです。本来DXはビジネスモデルそのものを変革するものですが、多くの企業ではまだ業務効率化のためのシステム導入にとどまっています。\n女（B氏）：おっしゃる通り、認識のギャップは深刻です。ただ、私が注目しているのは人材面の課題です。DXを推進できるデジタル人材が圧倒的に不足しており、外部から採用しようとしても、優秀な人材は大手テック企業に集中してしまう。中小企業にとっては特に深刻な状況です。\n男（A氏）：人材不足は確かに重要な課題ですね。ただ、人材を採用できたとしても、組織の文化や意思決定のスピードが変わらなければ、せっかくの人材も力を発揮できません。\n女（B氏）：その点は私も同意します。結局、経営トップ自身がDXの必要性を深く理解し、組織変革を主導しなければ、どれだけ優秀な人材がいても変革は起きないと思います。\n\n質問：二人の専門家が共通して指摘しているDXの課題は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  28,
  'A氏도 B氏도 모두 경영진의 이해와 리더십이 없으면 DX는 실현되지 않는다는 점에 동의하고 있다. A氏는 경영층의 인식 문제를, B氏도 마지막에 「経営トップ自身がDXの必要性を深く理解し、組織変革を主導しなければ」라고 말한다. 정답은 2번 「経営トップの理解とリーダーシップの欠如」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000028', 'DXの予算が不十分であること', false, 1),
('adc30001-0000-0000-0000-000000000028', '経営トップの理解とリーダーシップの欠如', true, 2),
('adc30001-0000-0000-0000-000000000028', 'デジタル人材の採用コストが高いこと', false, 3),
('adc30001-0000-0000-0000-000000000028', 'ITインフラの整備が遅れていること', false, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000029',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'ラジオで、心理学者と医師がストレスマネジメントについて対談しています。\n\n司会：現代人のストレスについて、それぞれのご専門の立場からお話しいただけますか。\n女（心理学者）：心理学的な観点から言うと、ストレスそのものが悪いわけではないんです。適度なストレスは集中力を高め、パフォーマンスを向上させる効果があります。問題は、ストレスに対する「とらえ方」です。「このストレスは自分を成長させる」と考えられる人と、「このストレスは自分を壊す」と考える人では、身体への影響がまったく異なるという研究結果があります。\n男（医師）：医学的にも、慢性的なストレスは免疫機能を低下させ、高血圧や心疾患のリスクを高めることがわかっています。ただ、私のクリニックで患者さんを診ていると、ストレスの原因を取り除くことより、いかに良質な睡眠を確保するかのほうが回復に直結しています。\n女（心理学者）：睡眠は確かに重要ですね。睡眠中に感情の処理が行われることも心理学的に証明されていますから。ストレスへの対処法として、運動も非常に有効です。週3回、30分程度の有酸素運動でストレスホルモンの分泌が抑制されます。\n男（医師）：運動は私もぜひお勧めしたい。睡眠と運動、この二つが揃えば、ストレスマネジメントの基盤ができると言っても過言ではないでしょう。\n\n質問：心理学者と医師の両方が効果的と認めているストレス対策は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  29,
  '심리학자는 운동을 언급하고, 의사도 「運動は私もぜひお勧めしたい」「睡眠と運動、この二つが揃えば」라고 말해 두 사람 모두 수면과 운동을 지지하고 있다. 정답은 4번 「良質な睡眠と適度な運動」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000029', 'ストレスの原因を根本から取り除くこと', false, 1),
('adc30001-0000-0000-0000-000000000029', 'ストレスを成長の機会としてポジティブにとらえること', false, 2),
('adc30001-0000-0000-0000-000000000029', '薬による免疫機能のサポート', false, 3),
('adc30001-0000-0000-0000-000000000029', '良質な睡眠と適度な運動', true, 4);

INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, question_subtype, is_published, points, sort_order, explanation)
VALUES (
  'adc30001-0000-0000-0000-000000000030',
  'ad000001-0000-0000-0000-000000000113',
  'audio_listening',
  E'経済フォーラムで、二人のエコノミストが少子化対策について議論しています。\n\n司会：日本の少子化は深刻な社会問題となっていますが、有効な対策についてお考えをお聞かせください。\n女（C氏）：各国の事例を見ると、少子化対策として最も効果が高かったのは、育児と仕事を両立しやすい環境の整備です。フランスや北欧諸国では、充実した保育施設と育児休業制度により、女性の就労率と出生率の両方が高い水準を維持しています。日本も金銭的な支援だけでなく、インフラの整備が急務です。\n男（D氏）：環境整備は重要ですが、私はもっと根本的な問題に目を向ける必要があると思います。若い世代の経済的不安定さです。非正規雇用が増え、将来の収入見通しが立ちにくい状況では、子育てに踏み出せない若者が多い。雇用の安定と賃金の引き上げなしに少子化は止まりません。\n女（C氏）：おっしゃる経済的安定は確かに前提条件ですね。ただ、経済が改善しても保育所が足りなければ、子どもを産んでも育てられないという問題は残ります。両方を同時並行で進めることが大切だと思います。\n男（D氏）：そこは同意します。どちらか一方では不十分で、経済的基盤の強化と生活環境の整備、この両輪が必要だということですね。\n\n質問：二人のエコノミストが最終的に合意した内容は何ですか。',
  'listening',
  'LISTENING_INTEGRATED',
  true,
  1,
  30,
  '두 사람은 마지막에 「経済的基盤の強化と生活環境の整備、この両輪が必要」라는 점에 합의하고 있다. 정답은 3번 「経済基盤の強化と育児環境の整備を同時に進める必要がある」.'
) ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
('adc30001-0000-0000-0000-000000000030', '金銭的な支援を最優先に拡充すべきだ', false, 1),
('adc30001-0000-0000-0000-000000000030', '非正規雇用を禁止して雇用を安定させるべきだ', false, 2),
('adc30001-0000-0000-0000-000000000030', '経済基盤の強化と育児環境の整備を同時に進める必要がある', true, 3),
('adc30001-0000-0000-0000-000000000030', 'フランスや北欧の制度をそのまま導入すべきだ', false, 4);
