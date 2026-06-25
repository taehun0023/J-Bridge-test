-- encoding: UTF-8
-- JLPT N1 聴解 問題プール 第3弾 — 30問 オリジナル作文
-- 作成日: 2026-06-26
-- quiz_id: bb000001-0000-0000-0000-000000000003 (N1 聴解テスト拡充)
-- 問題タイプ: 課題理解(10問) / ポイント理解(10問) / 統合理解・独話・講義(10問)
-- 正答位置分布: 1→8問, 2→8問, 3→7問, 4→7問
-- 状況: 職場交渉・学術講義・ニュース・独白・討論 等 (배치1·2와 겹치지 않는 상황)

\set ON_ERROR_STOP on

-- ============================================================
-- Q01: 企業戦略会議 — 新規参入判断 (課題理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
部長：東南アジア市場への参入、検討結果を聞かせてください。
課長：はい。現地調査では需要は高いと見られますが、規制リスクと物流コストの問題が残っています。競合他社はすでに二社が撤退しています。
部長：その撤退理由は？
課長：主に為替変動と現地パートナーとの契約トラブルです。我々はそこを慎重にクリアする必要があります。
部長：では今期は見送り、来期に向けてパートナー選定を先行させましょう。法務部にも入ってもらってください。
課長：承知しました。来週中にパートナー候補リストを提出します。
質問：部長が課長に今後まず行うよう指示したことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('東南アジアへの市場参入を正式に決定する', false, 1),
  ('撤退した競合他社に調査を依頼する', false, 2),
  ('法務部と連携してパートナー候補を選定する', true, 3),
  ('為替リスクを回避するための契約書を作成する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q02: 大学院 — 研究倫理の講義 (講義・独話)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：研究倫理において最も基本的な原則は何か、改めて確認しましょう。まず「誠実性」です。データの改ざんや捏造は言うまでもなく論外ですが、問題になるのは「都合のいいデータだけを選ぶ」行為です。これを選択的報告といい、統計的に不正とみなされます。次に「透明性」。使用した手法・データ・資金源を明示する義務があります。そして「責任」、つまり研究結果の社会的影響を研究者自身が引き受けることです。今日はこの三原則を軸に、実際の不正事例を検討します。
質問：この講義で最初に強調された研究倫理の問題点は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('有利なデータだけを選んで報告する行為', true, 1),
  ('研究資金の出所を隠すこと', false, 2),
  ('研究結果の社会的影響を無視すること', false, 3),
  ('実験手法を公開しないこと', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q03: ラジオニュース — 地方創生政策 (ニュース)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次のニュースを聴いて、質問に答えてください。
アナウンサー：政府は本日、地方移住促進策の拡充を発表しました。東京圏から地方へ移住し、テレワークで就労する世帯に対し、子ども一人につき最大百万円を支給する制度を来年度から導入します。また、移住先自治体が独自に上乗せ支援できる仕組みも整備する方針です。一方、専門家からは「財政的支援だけでなく、教育・医療環境の整備が不可欠だ」との指摘も出ています。政府は今後、関係省庁と連携して詳細を詰める予定です。
質問：ニュースで紹介された新制度の支給条件として正しいものはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('地方出身者が東京に移住して就職すること', false, 1),
  ('東京圏から地方へ移住しテレワークで働く世帯', true, 2),
  ('地方自治体に勤務する公務員世帯', false, 3),
  ('農業や漁業に従事する移住者', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q04: 医療倫理の討論番組 (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の討論を聴いて、質問に答えてください。
司会：終末期医療における「延命治療の中止」をめぐる議論です。まず賛成側の意見を。
A：患者本人の意思を最大限尊重すべきです。苦痛を長引かせることは尊厳を損なう場合があります。
B：しかし医師には「害を与えない」義務がある。治療中止自体が患者を傷つける可能性も否定できません。
A：それは医師の判断ではなく、事前指示書など患者の意思表示によって決まるべきです。
B：意思表示能力を失った患者の場合、誰がその「意思」を代弁するかが最大の問題です。
質問：Bさんが最も重視している問題は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('延命治療を続けることで医療費が増大すること', false, 1),
  ('患者が事前指示書を作成していないこと', false, 2),
  ('医師が治療中止を独断で決めること', false, 3),
  ('意思表示できない患者の意思を誰が代弁するか', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q05: 人事考課面談 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
上司：今期の目標達成率は87%でしたね。惜しかったですが、特に第三四半期の顧客対応力は高く評価しています。
部下：ありがとうございます。ただ、新製品の提案件数が目標に届かなかったことが悔やまれます。
上司：そこは来期の重点課題にしましょう。それに向けて、まず提案スキルを磨くための研修を受けてみませんか。来月、営業力強化プログラムがあります。
部下：はい、ぜひ参加させてください。
上司：では申込手続きをしておいてください。費用は会社が負担します。
質問：部下はこの後まず何をしますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('研修への申込手続きをする', true, 1),
  ('新製品の提案書を作成する', false, 2),
  ('来期の目標を上司に提出する', false, 3),
  ('顧客対応マニュアルを見直す', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q06: 経済学者の独白 — 格差問題 (独話)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
経済学者：所得格差の問題を論じる際、多くの人は「格差の拡大」だけに注目しがちです。しかし重要なのは格差の「固定化」です。格差があっても社会的流動性、つまり努力や才能によって階層を超えられる可能性が保たれていれば、社会の活力は維持されます。問題は、その流動性が失われ、生まれた家庭の経済状況が子どもの将来をほぼ決定してしまう状況です。教育機会の不平等がその最大の要因であり、ここに政策的介入が必要だと私は考えます。
質問：この経済学者が最も問題視していることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('富裕層と貧困層の所得差が数十倍に達していること', false, 1),
  ('出身家庭の経済力が子の将来をほぼ左右する格差の固定化', true, 2),
  ('政府が格差問題への政策介入を避けていること', false, 3),
  ('才能ある若者が海外に流出していること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q07: IT企業 — プロジェクト遅延の協議 (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
PM：システム移行プロジェクト、今月末のリリースが難しくなってきました。テスト工程で予想外のバグが続出しています。
役員：影響範囲は？
PM：コア決済機能に問題が集中しています。修正には最短でも二週間必要です。
役員：それはリリース延期を意味しますね。クライアントへの説明はどうしますか。
PM：本日中に先方の担当者に状況を報告し、新しいスケジュール案を提示したいと思います。
役員：わかりました。報告前に私に内容を確認させてください。
質問：PMがこの後すぐに行うこととして正しいものはどれですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('クライアントに遅延を報告する', false, 1),
  ('決済機能のバグを修正する', false, 2),
  ('新しいリリース日を一方的に決定する', false, 3),
  ('役員に報告内容を確認してもらう', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q08: 科学番組 — 量子コンピュータ (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の解説を聴いて、質問に答えてください。
解説者：量子コンピュータが従来のコンピュータと根本的に異なる点は、情報の単位にあります。従来型は「ビット」、つまり0か1かで情報を処理します。一方、量子コンピュータは「量子ビット」を使い、0でも1でもある状態、つまり重ね合わせを利用します。これにより、膨大な計算を同時並行で処理できます。ただし現時点では誤り率が高く、特定の問題に限定されています。実用化には誤り訂正技術の確立が最大の課題です。
質問：量子コンピュータの現時点での最大の課題は何だと述べていますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('量子ビットの製造コストが非常に高いこと', false, 1),
  ('0と1の重ね合わせ状態を維持できないこと', false, 2),
  ('誤り率が高く誤り訂正技術が未確立であること', true, 3),
  ('従来のプログラムがそのまま動作しないこと', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q09: 法律事務所 — 契約トラブル相談 (課題理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
依頼人：取引先が契約に定めた納品期日を二度も破りました。損害賠償を求めたいのですが。
弁護士：契約書に遅延損害金の条項はありますか。
依頼人：はい、記載されています。一日あたり代金の0.1%です。
弁護士：では、まず相手方に内容証明郵便で請求書を送りましょう。それでも応じなければ民事調停、次に訴訟という手順になります。
依頼人：内容証明は自分で用意できますか。
弁護士：書式はご案内できますが、法的に有効な記載にするため、当事務所で作成することをお勧めします。
質問：弁護士が最初に提案した対応策は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('民事調停を申し立てる', false, 1),
  ('内容証明郵便で損害賠償を請求する', true, 2),
  ('直ちに訴訟を提起する', false, 3),
  ('取引先との契約を解除する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q10: 哲学講義 — 自由意志論 (講義)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：自由意志の問題は哲学史上最も論争的なテーマの一つです。決定論の立場では、すべての出来事は先行する原因によって必然的に決まると主張します。ならば人間の選択も、脳の物理的状態の帰結にすぎないことになる。一方、自由意志論者は、因果連鎖を超えた「主体的選択の能力」が人間には備わっていると主張します。両者を調停しようとする「両立論」は、決定論を認めつつも、強制されていない行為を「自由」と定義することで問題を再構成しようとします。
質問：決定論の立場から見た場合、人間の選択はどう説明されますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('脳の物理的状態に規定された必然的な結果', true, 1),
  ('主体的な意志によって自由に決定されるもの', false, 2),
  ('強制されていない限り自由とみなされるもの', false, 3),
  ('因果関係とは無関係に発生するもの', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q11: 環境シンポジウム — カーボンニュートラル (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の発言を聴いて、質問に答えてください。
パネリスト：カーボンニュートラルを達成するためのアプローチには大きく二種類あります。一つは排出量そのものを削減する「排出削減」。もう一つは排出した分を植林や技術によって吸収・相殺する「カーボンオフセット」です。現在多くの企業がオフセットを活用していますが、これは本質的な排出削減の代替にはなりません。排出削減を最優先とし、どうしても削減しきれない分にのみオフセットを用いるべきです。さもなければ、「グリーンウォッシング」と批判されかねません。
質問：このパネリストはカーボンオフセットについてどのような見解を示していますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('植林による吸収効果が最も信頼性が高い', false, 1),
  ('企業が積極的に活用すべき主要な手段である', false, 2),
  ('技術的にはまだ実用段階に達していない', false, 3),
  ('排出削減の補完手段であり主軸にすべきではない', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q12: 社内プレゼン後の質疑応答 (課題理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
発表者：以上が新サービスの概要です。ご質問はありますか。
役員A：価格設定の根拠を詳しく聞かせてください。競合他社と比べて若干高い印象があります。
発表者：はい。競合との差別化としてサポート品質に重点を投資しており、その分が価格に反映されています。詳細なコスト分析資料を後ほどお送りします。
役員B：市場規模の試算はどのデータを使いましたか。
発表者：業界団体が昨年発表したレポートを基にしています。補足データが必要でしたら合わせてお送りします。
役員A：それでお願いします。
質問：発表者がこの後送ることになったのは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('競合他社との価格比較表のみ', false, 1),
  ('新サービスの概要資料の改訂版', false, 2),
  ('コスト分析資料と市場規模の補足データ', true, 3),
  ('業界団体のレポートの全文', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q13: 文化人類学の講義 — タブーの機能 (講義・独話)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：タブーとは単なる禁忌ではありません。文化人類学的に見ると、タブーは社会秩序を維持するための機能を持っています。特定の行動・食物・言葉を禁じることで、集団のアイデンティティを強化し、境界を明確にする役割を果たします。また、タブーの破綻、つまりタブーが突然意味をなさなくなる現象は、社会変動の先触れとして観察されます。グローバル化がタブーを急速に侵食している現代において、この機能の消失が社会に与える影響は無視できません。
質問：この教授はタブーの主な社会的機能を何だと述べていますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('個人の道徳的感覚を育てること', false, 1),
  ('宗教的な権威を強化すること', false, 2),
  ('集団のアイデンティティを強化し社会秩序を維持すること', true, 3),
  ('グローバル化に対抗する文化的防衛線となること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q14: 国際会議の準備打ち合わせ (課題理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
担当者A：来月の国際会議まであと三週間です。会場の手配は完了していますが、同時通訳ブースの設置確認がまだです。
担当者B：それは業者に今日中に確認します。登壇者への最終プログラムの送付は？
担当者A：私が明後日までに送ります。あと、報道関係者向けのプレスキットを用意する必要があって、写真素材がまだ揃っていません。
担当者B：広報部に依頼しましょう。今日の夕方に私から連絡します。
担当者A：ありがとうございます。では私は登壇者への連絡を優先します。
質問：担当者Aがこの後最初に行うことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('同時通訳ブースの業者に確認の電話をする', false, 1),
  ('広報部に写真素材を依頼する', false, 2),
  ('報道関係者向けのプレスキットを完成させる', false, 3),
  ('登壇者に最終プログラムを送付する', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q15: 金融ニュース — 日銀政策決定会合 (ニュース)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次のニュースを聴いて、質問に答えてください。
アナウンサー：日本銀行は本日の金融政策決定会合で、政策金利を現行水準に据え置くことを決定しました。市場では一部に利上げ期待がありましたが、総裁は会見で「賃金と物価の好循環がより確実になるまで、慎重に見極める必要がある」と述べ、拙速な引き締めを戒めました。一方で、長期金利の上限については柔軟な運用を認める方針を維持するとしました。円相場はこの発表を受けてやや円安方向に動いています。
質問：今回の会合で日本銀行が決定したことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('政策金利を現状維持すること', true, 1),
  ('政策金利を引き上げること', false, 2),
  ('長期金利の上限を厳格化すること', false, 3),
  ('大規模な国債買い入れを縮小すること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q16: 建築設計事務所 — クライアントとの打合せ (ポイント理解)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
建築士：今回お持ちした第二案のポイントは、南側に大きな吹き抜けを設けて採光を確保した点です。前回ご指摘のあった「暗い印象」を解消できます。
クライアント：なるほど、明るくなりそうですね。ただ、吹き抜けがあると冬の暖房効率が心配です。
建築士：その点は高性能断熱材と床暖房の組み合わせで対応します。光熱費の試算もお出しできます。
クライアント：それなら安心です。予算的にはどうですか、前回案と比べて。
建築士：吹き抜け施工分で若干上がりますが、断熱性能が上がれば長期的なランニングコストは下がります。
質問：クライアントが第二案に対して最初に懸念したことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('吹き抜けによって建物の構造が弱くなること', false, 1),
  ('吹き抜けがあることで冬の暖房効率が下がること', true, 2),
  ('第二案の総工費が予算を大幅に超えること', false, 3),
  ('採光よりもプライバシーの確保が難しくなること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q17: 心理学の公開講座 — 認知バイアス (講義)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
講師：今日取り上げるのは「確証バイアス」です。これは自分がすでに持っている信念や仮説を支持する情報ばかりを集め、反証する情報を無意識に無視してしまう傾向です。例えば、ある銘柄を「値上がりする」と思い込んだ投資家は、その銘柄に好意的なニュースしか目に入らなくなります。このバイアスは意識的に対抗しない限り、意思決定の質を著しく低下させます。重要な判断をする際には「反対意見を持つ人の意見を意図的に聞く」ことが有効な対策の一つです。
質問：確証バイアスの具体的な弊害として、この講師が述べていることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('記憶力が低下して重要な情報を忘れやすくなる', false, 1),
  ('他者の意見を批判するようになり人間関係が悪化する', false, 2),
  ('意思決定の質が著しく低下する', true, 3),
  ('新しい分野の学習が困難になる', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q18: 出版社 — 企画会議 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
編集長：この企画、テーマは面白いんですが、ターゲット読者が不明確です。一般向けなのか専門家向けなのか。
編集者：一般向けを想定していましたが、内容が少し専門的になってしまって。
編集長：それなら二つ選択肢があります。内容を平易にして一般書として出すか、学術色を強めて専門書ルートにするか。どちらで行くか来週月曜までに方針を固めてください。著者にも確認を取ってから。
編集者：わかりました。著者と相談した上で月曜にご報告します。
質問：編集者が月曜日までにしなければならないことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('著者に確認した上で一般書か専門書かの方針を決める', true, 1),
  ('専門書として出版するための原稿を書き直す', false, 2),
  ('一般読者向けのアンケートを実施する', false, 3),
  ('編集長に別の企画案を二つ以上提案する', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q19: 社会学者の独白 — SNSと民主主義 (独話)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
社会学者：SNSは民主主義を促進するという楽観的見方がかつてありました。情報が広く共有され、市民が政治参加しやすくなるという期待です。しかし現実はより複雑です。アルゴリズムは利用者の好みに合った情報だけを優先的に表示するため、人々は自分と似た意見しか目にしない「エコーチェンバー」に閉じ込められます。これは社会の分断を深め、対話の基盤となる共通の事実認識すら失わせる可能性があります。技術的な利便性と民主的な健全性は、必ずしも一致しないのです。
質問：この社会学者がSNSの問題として最も強調していることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('SNSによってフェイクニュースが拡散されやすいこと', false, 1),
  ('アルゴリズムが同質な意見のみを見せ社会の分断を深めること', true, 2),
  ('SNSが若者の政治的無関心を助長していること', false, 3),
  ('個人情報の漏洩リスクが民主主義を脅かすこと', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q20: 医療機関 — 患者と医師の相談 (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
医師：検査の結果を説明します。血圧と血糖値はやや高めですが、投薬が必要なほどではありません。まずは生活習慣の改善から始めましょう。
患者：具体的にはどうすればいいですか。
医師：塩分を一日六グラム以下に抑えること、週に三回以上の有酸素運動、そして睡眠を七時間以上確保することです。三ヶ月後にもう一度検査しましょう。
患者：サプリメントは効きますか。
医師：エビデンスが不十分なものが多いので、今の段階では食事・運動・睡眠の基本を優先してください。
質問：医師が患者に対して最も優先するよう求めたことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('エビデンスのあるサプリメントを選んで摂取すること', false, 1),
  ('すぐに投薬治療を開始すること', false, 2),
  ('三ヶ月以内に体重を標準範囲まで落とすこと', false, 3),
  ('食事・運動・睡眠の生活習慣改善を優先すること', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q21: 都市計画シンポジウム (ポイント理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の発言を聴いて、質問に答えてください。
専門家：コンパクトシティ政策とは、人口が減少する中で都市機能を中心部に集約し、インフラの維持コストを下げつつ生活利便性を高めるという構想です。郊外の住宅地を縮小し、医療・商業・公共交通を核となるエリアに集中させます。しかしこれを実施するには、すでに郊外に住む高齢者を移動させることへの社会的抵抗が大きく、強制力のない誘導施策だけでは進捗が遅いのが現状です。政策的インセンティブと住民合意形成の両立が鍵を握っています。
質問：この専門家が指摘するコンパクトシティ政策の最大の課題は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('郊外居住者の移転に対する社会的抵抗が大きく合意形成が困難なこと', true, 1),
  ('中心部のインフラ整備に莫大な費用がかかること', false, 2),
  ('人口減少が想定以上のスピードで進んでいること', false, 3),
  ('公共交通の維持が技術的に難しいこと', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q22: 広告代理店 — クリエイティブ方針の議論 (ポイント理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
AE：クライアントから修正要望が来ました。メインコピーを「もっとわかりやすく」してほしいとのことです。
クリエイティブディレクター：「わかりやすく」というのは具体的にどういうことですか。言葉を単純にするのか、それとも伝えるメッセージの絞り込みが必要なのか。
AE：クライアントによると、テストでは20代より40代50代の反応が良かったそうで、若い層に刺さっていないと感じているようです。
クリエイティブディレクター：なるほど。それならコピーの問題ではなく、ビジュアルとチャネル選択の問題かもしれません。まずその点を整理してクライアントに確認しましょう。
質問：クリエイティブディレクターは問題の原因をどこにあると考えていますか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('メインコピーの文体が難解すぎること', false, 1),
  ('広告全体のコンセプトが間違っていること', false, 2),
  ('ビジュアル表現と媒体選択が若年層に合っていないこと', true, 3),
  ('クライアントの製品自体が若者向けでないこと', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q23: 歴史学の講義 — 明治維新と近代化 (講義)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：明治維新をどう評価するかは、いまも歴史学者の間で議論が続いています。近代化の成功例として称揚する立場がある一方、「上からの近代化」として批判する見方もあります。後者の視点では、西洋化は民衆の主体的選択ではなく、国家主導で急速に押し付けられたものであり、伝統文化の破壊と画一化をもたらしたと論じます。重要なのは、どちらの視点が「正しい」かではなく、どのような問いを立てるかによって異なる歴史像が浮かび上がるという史学的自覚です。
質問：この教授が最終的に強調していることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('明治維新は欧米列強から日本を守るために不可欠だった', false, 1),
  ('どんな問いを立てるかで歴史像が変わるという史学的自覚が重要である', true, 2),
  ('明治維新の評価は民衆の視点から行うべきだ', false, 3),
  ('伝統文化の保護が近代化において最優先されるべきだった', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q24: 不動産投資セミナー (ポイント理解)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の話を聴いて、質問に答えてください。
講師：不動産投資において「表面利回り」と「実質利回り」の違いを理解することは極めて重要です。表面利回りは年間賃料を物件価格で割ったもので、計算が簡単ですが、管理費・修繕費・税金・空室リスクを一切考慮しません。実質利回りはこれらのコストを差し引いた後の収益率です。初心者が表面利回りだけを見て物件を選ぶと、実際のキャッシュフローが予想を大幅に下回るケースが多く見られます。投資判断は必ず実質利回りで行ってください。
質問：この講師が特に注意するよう求めていることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('賃料設定は周辺相場より必ず低くすること', false, 1),
  ('物件価格の交渉を不動産会社に任せないこと', false, 2),
  ('修繕費の積立を物件購入前に確保しておくこと', false, 3),
  ('投資判断を表面利回りではなく実質利回りで行うこと', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q25: 航空会社 — 社内クレーム対応研修 (課題理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
トレーナー：今回のケーススタディを見てください。乗客が「席を間違えて案内された」と主張しています。現場スタッフはどう対応すべきでしょうか。山田さん、どう思いますか。
山田：まず搭乗券と座席を確認して、誰のミスか特定すべきだと思います。
トレーナー：その考え方は危険です。原因究明は後でいい。まず何より乗客に謝罪し、正しい席に案内することです。乗客は「誰のせいか」より「早く解決してほしい」と思っています。原因究明はその後、社内で行います。
山田：わかりました。まず謝って正しい席へ案内します。
質問：トレーナーが最優先すべきだと述べた対応は何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('謝罪して乗客を正しい席へ案内すること', true, 1),
  ('搭乗券を確認してミスの責任を明確にすること', false, 2),
  ('上司に報告して対応指示を仰ぐこと', false, 3),
  ('乗客に状況を詳しく説明して理解を求めること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q26: 言語学の講義 — 敬語の社会的機能 (講義・独話)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：日本語の敬語は単なる礼儀の形式にとどまりません。社会的距離と関係性を言語的に符号化するシステムです。敬語を適切に使うことは、話者が相手との関係を正確に認知していることを示し、それが社会的信頼の基盤となります。興味深いのは、敬語の誤用が「能力の欠如」よりも「誠意の欠如」として解釈される点です。つまり、文法的な誤りよりも社会的文脈の読み違いのほうが、より深刻な評価の低下を招く可能性があります。
質問：この教授によると、日本語の敬語誤用はどのように解釈されやすいですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('話者の知識量の少なさを示すものとして解釈される', false, 1),
  ('能力の欠如よりも誠意の欠如として解釈されやすい', true, 2),
  ('外国人に対しては文化的差異として許容される', false, 3),
  ('若年層には社会的に容認される傾向がある', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q27: 食品メーカー — 品質事故の対応協議 (課題理解)  正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の会話を聴いて、質問に答えてください。
品質管理部長：今朝、一部製品に異物混入の可能性が報告されました。当該ロットは全国に出荷済みです。
社長：被害報告は？
品質管理部長：今のところゼロですが、確認中です。
社長：消費者の安全が最優先です。自主回収の手続きを今日中に始めてください。それと同時に消費者庁への報告義務を確認し、広報部を通じてプレスリリースを準備させてください。
品質管理部長：わかりました。原因調査と並行して進めます。
社長：原因究明は大事ですが、回収と公表を先行させること。順序を間違えないでください。
質問：社長が品質管理部長に最初に着手するよう指示したことは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('異物混入の原因を詳細に調査すること', false, 1),
  ('消費者からの被害報告を収集すること', false, 2),
  ('自主回収の手続きを開始すること', true, 3),
  ('競合他社への影響を確認すること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q28: 生命科学の講義 — エピジェネティクス (講義)  正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講義を聴いて、質問に答えてください。
教授：エピジェネティクスとは、DNA塩基配列そのものを変えることなく、遺伝子の発現をオンオフする仕組みを研究する分野です。環境や生活習慣が遺伝子の「読み取り方」に影響を与え、その変化が次世代に引き継がれる場合もあると言われています。これは「遺伝子は変えられない」という従来の常識に修正を迫るものです。ただし、後天的な遺伝子制御がどこまで安定的に遺伝するかについては、まだ研究途上であり、過大な解釈には注意が必要です。
質問：エピジェネティクスが従来の常識に与えた影響として、この教授が述べていることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('すべての疾患が遺伝子ではなく環境で決まることが証明された', false, 1),
  ('DNAの塩基配列を後天的に変えることが可能になった', false, 2),
  ('食事療法によって遺伝子そのものを書き換えられることが判明した', false, 3),
  ('環境や習慣が遺伝子の発現に影響し変えられないという常識に修正を迫った', true, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q29: 映画監督のインタビュー (ポイント理解)  正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次のインタビューを聴いて、質問に答えてください。
インタビュアー：最新作は非常に実験的だと評されていますが、意識した点はありますか。
監督：私が一番嫌いなのは「分かりやすい映画」です。観客が途中で答えを見つけてしまうような。物語というのは、観た後もずっと解釈が続くものであってほしい。だから意図的に説明を排し、余白を作っています。
インタビュアー：それが「難解だ」という批判にも繋がっているようですが。
監督：受け入れます。でも「わかった」と思った瞬間に映画は死ぬんです。私は作品に息をさせたい。
質問：この監督が映画において最も重視していることは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('観客が多様な解釈を続けられる余白を残すこと', true, 1),
  ('批評家に高く評価される芸術的完成度を追求すること', false, 2),
  ('難解な映像技法で他の監督との差別化を図ること', false, 3),
  ('社会問題を直接的に描写することで観客に問いかけること', false, 4)
) AS t(txt,ok,so);

-- ============================================================
-- Q30: NPO代表の講演 — 社会起業家の使命 (独話・講演)  正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
$$次の講演を聴いて、質問に答えてください。
代表：社会起業家と一般の起業家は何が違うのか、よく聞かれます。利益を目指さないということですか、と。いいえ、違います。利益を出すこと自体は重要です。持続しなければ社会問題は解決できないから。違いは「何のために利益を追うか」です。社会起業家にとって利益は目的ではなく、社会課題を解決し続けるための手段です。そして失敗しても、その課題が存在する限りまた立ち上がる使命感があります。それが私たちを動かす根本的なエンジンです。
質問：この代表が述べる社会起業家と一般起業家の本質的な違いは何ですか。$$,
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('社会起業家は利益を一切追求しない点', false, 1),
  ('利益を目的ではなく社会課題解決のための手段と捉える点', true, 2),
  ('政府や行政と連携して活動する点', false, 3),
  ('失敗した場合に別の事業に転換せず廃業する点', false, 4)
) AS t(txt,ok,so);
