-- encoding: UTF-8
-- JLPT N1 聴解スクリプト 35件 (sort_order 101-135)
-- 重複ガード: title 基準 WHERE NOT EXISTS

-- 1. ビジネス — 会議日程調整 (dialogue, sort_order 101)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '会議の日程調整',
  E'男：田中さん、来週の企画会議の件なんですが、木曜日の午後はいかがでしょうか。\n女：木曜の午後は社外の取引先との打ち合わせが入っているんです。\n男：そうですか。では金曜の午前中はどうでしょう。\n女：金曜の午前中でしたら問題ないです。ただ、11時には別の予定があるので、10時開始にしていただけると助かります。\n男：承知しました。では金曜10時で関係者に案内を送ります。資料は前日までにお願いできますか。\n女：はい、木曜日の夕方までにメールでお送りします。',
  'dialogue',
  'N1',
  '社内での会議日程調整',
  '[]'::jsonb,
  '{"question":"女の人は金曜日の会議について何と言いましたか。","options":["10時開始なら参加できる","終日都合がつかない","11時開始を希望している","資料は当日持参する"],"answer":0}'::jsonb,
  101
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '会議の日程調整');

-- 2. ビジネス — 新製品プレゼン (monologue, sort_order 102)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '新製品発表プレゼン',
  E'男（部長）：皆さん、本日は弊社の新製品「エコフロー3000」をご紹介いたします。この製品の最大の特長は、従来品と比べてエネルギー消費を40パーセント削減できる点です。加えて、AIによる自動最適化機能を搭載しており、ユーザーの使用パターンを学習して最適な運転モードに自動で切り替えます。価格は従来品より若干高めですが、電気代の削減効果により、2年以内に投資回収が可能と試算しております。発売は来月15日を予定しており、まず法人向けに展開した後、翌月から一般消費者向けにも販売を開始する計画です。',
  'monologue',
  'N1',
  '新製品発表プレゼンテーション',
  '[]'::jsonb,
  '{"question":"「エコフロー3000」の販売計画として正しいものはどれですか。","options":["来月から法人・一般同時発売","来月法人向け、その翌月一般向け","翌月から法人向けのみ","一般向けの発売は未定"],"answer":1}'::jsonb,
  102
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '新製品発表プレゼン');

-- 3. 日常 — アパート契約 (dialogue, sort_order 103)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  'アパート契約の相談',
  E'女（客）：この物件、ペットは飼えますか？\n男（不動産）：小型犬と猫は1匹まで可能です。ただし敷金が通常より1ヶ月分多くなります。\n女：そうですか。あと、駐車場はありますか？\n男：駐車場は別棟に月額8,000円でご利用いただけます。ただし現在空きが1台分しかございません。\n女：わかりました。では入居日はいつから可能ですか？\n男：来月1日からご入居いただけます。ただし今週末までに仮申し込みをしていただかないと、他の方に取られてしまう可能性があります。\n女：今週末ですね。では主人と相談して明日ご連絡します。',
  'dialogue',
  'N1',
  '不動産でのアパート契約相談',
  '[]'::jsonb,
  '{"question":"女の人がこれからすることはどれですか。","options":["今日中に仮申し込みをする","今週末に夫と一緒に来店する","明日夫と相談した上で連絡する","駐車場の空きが出るまで待つ"],"answer":2}'::jsonb,
  103
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = 'アパート契約の相談');

-- 4. 学術 — 環境問題講義 (monologue, sort_order 104)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '海洋プラスチック汚染講義',
  E'教授：本日は海洋プラスチック汚染問題について概説します。現在、毎年約800万トンのプラスチックが海洋に流入していると推定されています。特に問題なのがマイクロプラスチックです。5ミリメートル以下の微細なプラスチック粒子は、魚介類がプランクトンと誤認して摂取し、食物連鎖を通じて最終的に人体に蓄積される可能性があります。対策としては個人レベルでのプラスチック削減も重要ですが、それ以上に製造業者による設計段階での取り組み、すなわち生分解性素材への転換や製品の長寿命化が根本的解決につながります。また、国際的な条約による規制強化も議論されており、来年の国連会議が注目されています。',
  'monologue',
  'N1',
  '大学での環境問題講義',
  '[]'::jsonb,
  '{"question":"教授がマイクロプラスチックの最も深刻な問題として挙げたのはどれですか。","options":["海水の透明度が下がること","食物連鎖を通じて人体に蓄積される可能性","魚の繁殖率が低下すること","プランクトンが死滅すること"],"answer":1}'::jsonb,
  104
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '海洋プラスチック汚染講義');

-- 5. ビジネス — 電話でのクレーム対応 (phone_call, sort_order 105)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '顧客クレーム電話対応',
  E'女（顧客）：先週注文した商品がまだ届かないんですが、どうなっていますか。注文番号は8847です。\n男（担当者）：大変申し訳ございません。少々お待ちいただけますか。……確認しましたところ、物流センターでの仕分けエラーにより発送が3日遅れております。\n女：3日も？それは困ります。今週の土曜日に必要なんです。\n男：大変ご迷惑をおかけしております。本日中に優先便で再発送いたしまして、最短で明後日の木曜日にはお届けできます。\n女：木曜日なら間に合います。でも今回の対応には納得できません。\n男：おっしゃる通りでございます。送料を全額ご返金するとともに、500円分のクーポンをお送りします。\n女：わかりました。では木曜日の配達を確実にお願いします。',
  'phone_call',
  'N1',
  'カスタマーサービスへの電話クレーム',
  '[]'::jsonb,
  '{"question":"男の人が顧客に約束した補償はどれですか。","options":["商品代金の全額返金","送料全額返金と500円クーポン","1000円クーポンの提供","次回注文時の送料無料"],"answer":1}'::jsonb,
  105
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '顧客クレーム電話対応');

-- 6. 公共 — 空港アナウンス (announcement, sort_order 106)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '空港の搭乗変更アナウンス',
  E'アナウンス：ご搭乗のお客様にご案内申し上げます。本日14時30分発、東京羽田空港行き、JA245便は、使用航空機の整備点検のため出発を遅延しております。新しい出発時刻は16時00分を予定しております。搭乗ゲートも変更となり、従来の12番ゲートから18番ゲートへ変更となります。ご搭乗のお客様はターミナル南端の18番ゲートにお集まりください。なお、接続便にお乗り継ぎのお客様は、カウンター付近の係員にお声がけいただければ、代替便のご案内をいたします。皆様のご理解とご協力をお願い申し上げます。',
  'announcement',
  'N1',
  '空港での搭乗変更アナウンス',
  '[]'::jsonb,
  '{"question":"このアナウンスで変更されたことはどれですか。","options":["目的地と出発時刻","出発時刻と搭乗ゲート","搭乗ゲートと航空会社","便名と出発時刻"],"answer":1}'::jsonb,
  106
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '空港の搭乗変更アナウンス');

-- 7. ビジネス — 人事評価面談 (dialogue, sort_order 107)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '人事評価面談',
  E'女（上司）：今年度の評価についてお話しします。業務遂行力と協調性については非常に高い評価です。特に第3四半期のプロジェクトでは、チームをよくまとめてくれました。\n男（部下）：ありがとうございます。\n女：一方で、課題として挙げるとすれば、報告・連絡・相談の頻度をもう少し上げてほしいと思います。特に問題が起きたときの早期報告が遅れる傾向があります。\n男：はい、自覚しています。改善するよう努めます。\n女：あとは来年度に向けてですが、マネジメント研修への参加を検討していただけませんか。将来的にはチームリーダーとして活躍していただきたいと考えています。\n男：ぜひ参加させてください。',
  'dialogue',
  'N1',
  '職場での人事評価面談',
  '[]'::jsonb,
  '{"question":"上司が男性の課題として指摘したのはどれですか。","options":["業務遂行力の不足","チームワークの問題","報告・連絡・相談の頻度が少ない","マネジメント能力の欠如"],"answer":2}'::jsonb,
  107
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '人事評価面談');

-- 8. 学術 — 人工知能倫理シンポジウム (meeting, sort_order 108)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  'AI倫理シンポジウム討論',
  E'司会：AIによる意思決定の透明性について、各パネリストのお考えを伺います。まず田中先生からどうぞ。\n田中教授：ブラックボックス問題は非常に深刻です。特に医療・司法・金融分野では、なぜそういう判断が下されたかを説明できなければ、社会的信頼を得られません。説明可能なAI、つまりXAIの研究をもっと重視すべきです。\n山本氏（企業）：同意しますが、完全な透明性を求めると性能が大幅に落ちるジレンマがあります。現実的には、段階的な開示と第三者監査の組み合わせが有効ではないでしょうか。\n司会：では規制の観点から鈴木先生はいかがですか。\n鈴木弁護士：EUのAI法が先行していますが、日本はまだ法整備が遅れています。ガイドラインだけでは限界があり、リスクに応じた法的規制が必要です。',
  'meeting',
  'N1',
  'AI倫理に関するシンポジウム討論',
  '[]'::jsonb,
  '{"question":"山本氏が提案した現実的なアプローチはどれですか。","options":["AIの全面的な透明性確保","完全なブラックボックスの維持","段階的な開示と第三者監査の組み合わせ","EUのAI法をそのまま採用する"],"answer":2}'::jsonb,
  108
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = 'AI倫理シンポジウム討論');

-- 9. 日常 — 医療相談 (dialogue, sort_order 109)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '医師への診察相談',
  E'男（患者）：先生、最近めまいがひどくて、特に朝起き上がるときに目がぐるぐるします。\n女（医師）：それはいつ頃から始まりましたか。\n男：2週間くらい前からです。耳鳴りもあります。\n女：なるほど。そのめまいは動いているときだけですか、それとも安静にしていてもありますか？\n男：動いたときだけです。横になると楽になります。\n女：症状からすると良性発作性頭位めまい症の可能性が高いです。耳の中の小さな石が原因で起こるめまいで、命に関わるものではありません。理学療法で改善できますが、まずMRIを撮って他の原因を排除してから判断しましょう。\n男：わかりました。MRIはいつ受けられますか。\n女：来週月曜日に予約を取れます。',
  'dialogue',
  'N1',
  '病院での診察',
  '[]'::jsonb,
  '{"question":"医師がまずMRIを撮ると言った理由はどれですか。","options":["めまいの治療には必ずMRIが必要だから","良性発作性頭位めまい症と確定診断するため","他の原因を排除してから判断するため","患者が希望したから"],"answer":2}'::jsonb,
  109
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '医師への診察相談');

-- 10. 公共 — 市民向け防災説明会 (monologue, sort_order 110)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '防災説明会での講話',
  E'担当者：本日は地域の防災体制についてご説明します。当市では今年度から「マイタイムライン」の作成を全世帯に推奨しています。マイタイムラインとは、台風や洪水などの災害が発生した際に、自分がいつ何をするかをあらかじめ決めておく行動計画です。特に重要なのは「逃げ遅れゼロ」を実現するための早期避難です。ハザードマップで自宅の危険度を確認し、避難開始のタイミングを決めておくことが大切です。また、避難所だけでなく、親戚の家や安全な知人宅への分散避難も有効な選択肢です。備蓄については、最低3日分、できれば1週間分の食料と水を用意してください。',
  'monologue',
  'N1',
  '地域での防災説明会',
  '[]'::jsonb,
  '{"question":"担当者が特に重要と述べたのはどれですか。","options":["備蓄を1週間分用意すること","マイタイムライン作成と早期避難","避難所の場所を事前に確認すること","ハザードマップの配布"],"answer":1}'::jsonb,
  110
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '防災説明会での講話');

-- 11. ビジネス — 社内研修説明 (instruction, sort_order 111)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '新入社員研修オリエンテーション',
  E'人事部長：新入社員の皆さん、入社おめでとうございます。今月の研修スケジュールについてご説明します。第1週はビジネスマナーと社内規定の習得です。第2週から第3週は各部署でのOJTとなります。OJTの配属先については明日個別にお知らせします。第4週は成果発表会があり、OJTで学んだことをグループごとに発表していただきます。発表は10分間で、資料作成が必要です。資料のテンプレートは社内ポータルからダウンロードしてください。研修中の服装はスーツを基本としますが、OJT期間中は配属部署の規定に従ってください。質問のある方は研修終了後に残ってください。',
  'instruction',
  'N1',
  '会社での新入社員研修説明',
  '[]'::jsonb,
  '{"question":"第4週の成果発表会について正しいものはどれですか。","options":["個人で15分間発表する","グループで10分間発表し資料が必要","部署ごとに発表時間が異なる","発表資料は人事部が作成する"],"answer":1}'::jsonb,
  111
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '新入社員研修オリエンテーション');

-- 12. 学術 — 歴史講義（明治維新） (monologue, sort_order 112)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '明治維新の光と影',
  E'教授：明治維新を単なる近代化の成功物語として捉えることは、歴史の一面しか見ていません。確かに、廃藩置県による中央集権化、殖産興業、富国強兵といった政策により、日本は短期間で近代国家の形を整えました。しかしその過程で、多くの人々が旧来の生業を失いました。士族は禄を廃止され、農民は地租改正により土地を失う者も少なくありませんでした。また、文明開化の名の下に進められた西洋化は、伝統文化の否定という側面も持っていました。歴史を評価する際には、誰にとっての「近代化」であったかという視点を持つことが重要です。',
  'monologue',
  'N1',
  '大学での日本史講義',
  '[]'::jsonb,
  '{"question":"教授が強調した歴史を見る際の視点はどれですか。","options":["明治維新は完全な成功だった","近代化の速さが日本の強みだった","誰にとっての近代化であったかという視点","西洋化が最優先課題だった"],"answer":2}'::jsonb,
  112
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '明治維新の光と影');

-- 13. 日常 — 友人間の進路相談 (dialogue, sort_order 113)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '大学院進学か就職かの相談',
  E'女：佐藤くん、卒業後どうするか決めた？\n男：実は迷ってるんだ。指導教員には大学院進学を勧められてるんだけど、親は早く就職しろって言うし。\n女：研究続けたいって気持ちはあるの？\n男：正直、研究は好きなんだよね。でも大学院に行ったら2年間お金がかかるし、奨学金も返さないといけないから。\n女：でも今の時代、修士卒のほうが就職の選択肢が広がることもあるよ。特に理系なら。\n男：それはそうなんだけど、学費と生活費を考えると踏み切れなくて。\n女：TA（ティーチングアシスタント）とかリサーチアシスタントで収入を得ながら大学院に行く方法もあるんじゃない？\n男：そういう選択肢もあるか。もう少し調べてみる。',
  'dialogue',
  'N1',
  '友人同士の進路相談',
  '[]'::jsonb,
  '{"question":"男性が大学院進学をためらっている主な理由はどれですか。","options":["研究に興味がないから","指導教員との関係が悪いから","学費と生活費の経済的負担","親が反対しているから"],"answer":2}'::jsonb,
  113
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '大学院進学か就職かの相談');

-- 14. ビジネス — 取引先との価格交渉 (dialogue, sort_order 114)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '仕入れ価格交渉',
  E'男（バイヤー）：御社の新製品について、今回は500個での発注を考えています。単価についてご相談できますか。\n女（メーカー担当）：500個でしたら、現在の定価1万2千円から5パーセント引きの1万1千400円でご提供できます。\n男：もう少し何とかなりませんか。競合他社では同等品が1万円を切る価格で出ているんです。\n女：それは難しい状況ですね。ただ、来期から数量を増やしていただけるなら、追加で3パーセント引きにすることは可能です。今期は現行の価格でご検討いただけないでしょうか。\n男：わかりました。今期は御社の価格でお願いして、来期は1000個規模で発注する方向で検討します。ただしその際には合計8パーセント引きを確約してほしいんですが。\n女：8パーセントは厳しいですが、7パーセントなら確約できます。\n男：では7パーセントで合意しましょう。',
  'dialogue',
  'N1',
  'ビジネスでの価格交渉',
  '[]'::jsonb,
  '{"question":"来期の合意内容として正しいものはどれですか。","options":["1000個注文で8パーセント引き","500個注文で7パーセント引き","1000個注文で7パーセント引き","数量に関わらず5パーセント引き"],"answer":2}'::jsonb,
  114
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '仕入れ価格交渉');

-- 15. 学術 — 心理学講義（認知バイアス） (monologue, sort_order 115)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '認知バイアス心理学講義',
  E'教授：今日は認知バイアスの中でも特に日常生活に影響を与える確証バイアスについて話します。確証バイアスとは、自分がすでに信じていることを裏付ける情報ばかりを集め、それに反する情報を無視したり過小評価したりする傾向のことです。SNS上で自分と同じ意見の人たちとだけつながるエコーチェンバー現象も、このバイアスが技術によって増幅された例です。このバイアスを克服するためには、意識的に反証を探す習慣を持つことが重要です。また、重要な意思決定の前には、あえて反対意見を持つ人物に意見を求めるというデビルズアドボケイト法も有効な手段の一つです。',
  'monologue',
  'N1',
  '大学での心理学講義',
  '[]'::jsonb,
  '{"question":"確証バイアスを克服するために教授が挙げた方法はどれですか。","options":["SNSのつながりを増やす","意識的に反証を探す習慣とデビルズアドボケイト法","同じ意見の人と積極的に議論する","意思決定を急がず時間をかける"],"answer":1}'::jsonb,
  115
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '認知バイアス心理学講義');

-- 16. 公共 — 市議会の予算説明 (monologue, sort_order 116)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '市議会での予算説明',
  E'市長：令和7年度予算案についてご説明します。総額は前年度比3.2パーセント増の1,450億円となっています。主な増加要因は少子化対策費の大幅な積み増しで、子育て支援センターの新設3か所と、第2子以降の保育料完全無償化を実施します。また、インフラ老朽化対策として橋梁・下水道の改修費を15パーセント増額しています。一方、行財政改革として、市職員の働き方改革によるデジタル化推進で、3年間で約20億円の経費削減を見込んでいます。財源については市債を適度に活用しつつ、健全財政を維持する方針です。',
  'monologue',
  'N1',
  '市議会での予算説明',
  '[]'::jsonb,
  '{"question":"予算の主な増加要因として述べられたのはどれですか。","options":["インフラ老朽化対策費の増加","市職員給与の引き上げ","少子化対策費の大幅な積み増し","デジタル化推進のための設備投資"],"answer":2}'::jsonb,
  116
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '市議会での予算説明');

-- 17. インタビュー — 芸術家インタビュー (monologue, sort_order 117)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '陶芸家インタビュー',
  E'インタビュアー：先生が陶芸の道に進まれたきっかけを教えてください。\n陶芸家（女性）：大学では美術を専攻していたんですが、就職してデザイン会社で働いていたんです。でも30歳のとき、ふと「手で触れられるものを作りたい」という衝動に駆られまして。休日に陶芸教室に通い始めたのが最初です。最初は趣味のつもりだったんですが、土と向き合ううちに、これが本当にやりたいことだと確信して、3年後に会社を辞めました。\nインタビュアー：プロとして最も大切にされていることは？\n陶芸家：失敗を恐れないことです。窯から出すまでどうなるか分からない、その不確かさと向き合うことで、意図しない美しさが生まれることがあります。',
  'monologue',
  'N1',
  '陶芸家へのインタビュー',
  '[]'::jsonb,
  '{"question":"陶芸家がプロとして最も大切にしていることはどれですか。","options":["伝統技法を忠実に守ること","失敗を恐れないこと","デザインの完成度を高めること","販売市場を意識して作ること"],"answer":1}'::jsonb,
  117
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '陶芸家インタビュー');

-- 18. ビジネス — プロジェクト進捗会議 (meeting, sort_order 118)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  'プロジェクト進捗会議',
  E'リーダー（女性）：では現在の進捗を確認します。田中さん、フェーズ1の状況は？\n田中：テスト工程が予定より1週間遅れています。原因は要件定義の仕様変更が入ったためです。\nリーダー：影響範囲は？\n田中：フェーズ2の開始が1週間後ろ倒しになります。全体の納期には現状、影響なしと見ています。\nリーダー：わかりました。山本さん、インフラ側は？\n山本：本番環境のサーバー調達が2日遅延しています。クラウド移行で対応できるので、スケジュールへの影響はありません。\nリーダー：よし。では今週中に遅延リスクを洗い出してリスク一覧を更新しておいてください。来週月曜に改めて確認します。',
  'meeting',
  'N1',
  '社内プロジェクトの進捗確認会議',
  '[]'::jsonb,
  '{"question":"田中さんが報告した遅延の原因はどれですか。","options":["テストエンジニアの不足","サーバー調達の遅延","要件定義の仕様変更","クラウド移行の問題"],"answer":2}'::jsonb,
  118
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = 'プロジェクト進捗会議');

-- 19. 日常 — 図書館での調査相談 (dialogue, sort_order 119)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '図書館での資料調査相談',
  E'男（利用者）：すみません、江戸時代の農業技術について調べているんですが、どの資料を使えばいいか教えてもらえますか。\n女（司書）：江戸時代の農業技術ですね。まず当館の郷土史コーナーにある「農書大系」シリーズをお勧めします。江戸時代に書かれた農書を現代語に訳したもので、全15巻あります。\n男：それは全部読まないといけませんか？\n女：いいえ、テーマ別に索引があります。それと、デジタルアーカイブで国立国会図書館のデジタルコレクションも無料で使えますので、原本の画像も確認できますよ。\n男：ありがとうございます。ちなみに複写はできますか？\n女：館内複写機で1枚10円でコピーできます。ただし、著作権の関係で全ページのコピーはご遠慮いただいています。',
  'dialogue',
  'N1',
  '図書館でのレファレンスサービス',
  '[]'::jsonb,
  '{"question":"司書が最初に勧めた資料はどれですか。","options":["国立国会図書館のデジタルコレクション","農書大系シリーズ","郷土史の雑誌データベース","農業技術の現代の専門書"],"answer":1}'::jsonb,
  119
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '図書館での資料調査相談');

-- 20. 学術 — 経済学講義（格差問題） (monologue, sort_order 120)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '所得格差経済学講義',
  E'教授：日本の所得格差はジニ係数で見ると、1980年代後半から一貫して拡大傾向にあります。特に2000年代以降、非正規雇用の増加が格差拡大の主要因となっています。非正規労働者は現在、雇用者全体の約37パーセントを占めており、同一労働同一賃金の原則が徹底されていない現状では、正規・非正規間の賃金格差が固定化する恐れがあります。また、親の所得が子どもの教育水準に直結する「教育の階層化」も深刻な問題です。これは格差が世代を超えて再生産されることを意味します。解決策としては、教育機会の均等化と、正規・非正規の処遇格差是正が急務といえます。',
  'monologue',
  'N1',
  '大学での経済学講義',
  '[]'::jsonb,
  '{"question":"教授が所得格差拡大の主要因として挙げたのはどれですか。","options":["グローバル化による製造業の空洞化","2000年代以降の非正規雇用の増加","財政緊縮政策による社会保障の削減","高齢化による社会保障費の増大"],"answer":1}'::jsonb,
  120
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '所得格差経済学講義');

-- 21. 公共 — 美術館の展示ガイド (announcement, sort_order 121)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '美術館の展示ガイド案内',
  E'案内員（女性）：本日は「近代日本洋画の系譜」展にお越しいただきありがとうございます。本展は全3章で構成されており、明治期から昭和初期にかけての洋画の発展を時系列でご覧いただけます。第1章では黒田清輝ら明治期に西洋で学んだ画家たちの作品を、第2章では大正デモクラシーの時代精神を反映した社会派作品を展示しています。第3章は戦前の昭和期に焦点を当て、時代の変遷とともに洋画がどう変化したかをご確認いただけます。写真撮影は第1章のみ許可しております。フラッシュ使用と三脚の使用はご遠慮ください。音声ガイドは入口でご貸し出しております。',
  'announcement',
  'N1',
  '美術館での展示説明',
  '[]'::jsonb,
  '{"question":"写真撮影について正しいものはどれですか。","options":["全展示エリアで撮影可能","第1章のみ許可、フラッシュ・三脚禁止","全エリアで撮影禁止","フラッシュなしなら全章で撮影可能"],"answer":1}'::jsonb,
  121
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '美術館の展示ガイド案内');

-- 22. ビジネス — 在宅勤務制度説明 (instruction, sort_order 122)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '在宅勤務制度の説明',
  E'人事担当（女性）：来月から本格導入する在宅勤務制度についてご説明します。週3日まで在宅勤務が可能です。ただし月曜日は全員出社を原則とします。在宅勤務をする場合は、前日の17時までに上長に申請してください。当日の急な申請は認められません。勤務時間は通常と同じで、コアタイムの10時から15時は必ず業務に従事していただきます。通信費については、月3,000円の在宅勤務手当として支給します。セキュリティ上の理由から、自宅以外の場所でのリモート勤務は禁止です。また、在宅勤務中の業務内容は日報システムで報告する必要があります。',
  'instruction',
  'N1',
  '社内での在宅勤務制度説明会',
  '[]'::jsonb,
  '{"question":"在宅勤務申請のルールとして正しいものはどれですか。","options":["当日朝9時までに申請すればよい","前日の17時までに上長に申請する","月曜日のみ在宅勤務申請が必要","2日前までに人事部に申請する"],"answer":1}'::jsonb,
  122
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '在宅勤務制度の説明');

-- 23. 学術 — 言語学講義（敬語の変遷） (monologue, sort_order 123)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '日本語敬語の変遷講義',
  E'教授：日本語の敬語体系は、時代とともに大きく変化しています。古典語では尊敬語・謙譲語・丁寧語という3分類が基本でしたが、2007年の文化審議会答申では、謙譲語をさらに「謙譲語I」と「謙譲語II（丁重語）」に分け、また丁寧語から「美化語」を独立させ、合計5分類に整理されました。この変化の背景には、実際の言語運用において区別が必要とされる場面が増えたことがあります。また現代では、若者を中心に「〜させていただく」の過剰使用や、「おビール」「おタバコ」のように本来美化語が付かない語への付加といった現象が見られ、敬語使用の混乱が生じています。',
  'monologue',
  'N1',
  '大学での日本語学講義',
  '[]'::jsonb,
  '{"question":"2007年の文化審議会答申で敬語体系はどのように変わりましたか。","options":["3分類から4分類に","3分類から5分類に","5分類から3分類に簡略化","分類に変化はなく内容のみ改定"],"answer":1}'::jsonb,
  123
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '日本語敬語の変遷講義');

-- 24. 日常 — 引越し業者への問い合わせ (phone_call, sort_order 124)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '引越し業者への問い合わせ電話',
  E'女（客）：来月15日に2LDKから3LDKへの引越しを考えているんですが、見積もりをお願いできますか。引越し先は同じ市内です。\n男（業者）：ありがとうございます。市内の引越しですと基本料金は5万円からになります。荷物の量や階数によって変わりますが、2LDKから3LDKですと7〜9万円程度が目安です。\n女：ピアノがあるんですが、それは別料金になりますか？\n男：はい、グランドピアノかアップライトピアノかによって異なりますが、アップライトでしたら追加で1万5千円、グランドですと3万円になります。\n女：アップライトです。では当日の作業時間はどのくらいかかりますか？\n男：3〜4時間の見込みです。正確な金額は実際に見積もりに伺ってからになりますが、いかがでしょうか。\n女：では来週の土曜日にお願いできますか。',
  'phone_call',
  'N1',
  '引越し業者への電話問い合わせ',
  '[]'::jsonb,
  '{"question":"アップライトピアノ込みの引越し料金の目安として正しいものはどれですか。","options":["5万〜7万円","7万〜9万円","8万5千円〜10万5千円","10万円以上"],"answer":2}'::jsonb,
  124
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '引越し業者への問い合わせ電話');

-- 25. 学術 — テクノロジー倫理討論（自動運転） (meeting, sort_order 125)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '自動運転技術倫理討論',
  E'司会：自動運転技術の社会実装における倫理課題について議論します。木村教授から始めていただけますか。\n木村（工学）：技術的には現在レベル3〜4の自動運転が実用段階に入っています。しかし事故が起きたとき、誰が責任を取るかという法的枠組みが整備されていないのが最大の障壁です。\n鈴木（法学）：まさに。現行の道路交通法は人間のドライバーを前提に設計されています。AIが判断を下した場合の責任の所在を明確にする立法が急務です。\n木村：また、緊急回避の場面でAIがどの命を優先するかというトロッコ問題的なジレンマも解決されていません。\n鈴木：そのジレンマを立法化するのは社会的合意の問題でもあり、技術だけでは解決できません。市民参加型の議論が不可欠です。',
  'meeting',
  'N1',
  '自動運転技術の倫理と法律に関する討論',
  '[]'::jsonb,
  '{"question":"木村教授が自動運転社会実装の最大の障壁として挙げたのはどれですか。","options":["自動運転技術の精度不足","事故時の責任の法的枠組みが未整備","バッテリー技術の限界","市民の技術への不信感"],"answer":1}'::jsonb,
  125
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '自動運転技術倫理討論');

-- 26. ビジネス — 広告代理店でのブリーフィング (meeting, sort_order 126)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '広告キャンペーンブリーフィング',
  E'クライアント（男性）：今回の新商品、健康食品「グリーンバランス」のキャンペーンについてブリーフィングさせてください。ターゲットは30〜45歳の健康意識の高い働く女性です。\n代理店（女性）：了解しました。主なKPIと予算をお聞かせください。\nクライアント：認知度を3ヶ月で現在の5パーセントから20パーセントに引き上げることが第一目標です。予算は3000万円で、デジタルに7割、オフラインに3割の配分を考えています。\n代理店：インフルエンサーマーケティングはご検討ですか？\nクライアント：ぜひ。ただし、エビデンスのない効果訴求は薬機法の観点から厳禁です。その点は徹底してください。\n代理店：承知しました。来週木曜日までにクリエイティブの初稿をお持ちします。',
  'meeting',
  'N1',
  '広告代理店でのキャンペーンブリーフィング',
  '[]'::jsonb,
  '{"question":"クライアントが代理店に特に注意するよう指示したことはどれですか。","options":["予算の超過を防ぐこと","インフルエンサーを使わないこと","薬機法上エビデンスのない効果訴求の禁止","デジタル広告の比率を上げること"],"answer":2}'::jsonb,
  126
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '広告キャンペーンブリーフィング');

-- 27. 日常 — 料理教室での説明 (instruction, sort_order 127)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '料理教室での出汁の取り方',
  E'先生（女性）：今日は日本料理の基本である一番出汁の取り方を学びます。まず昆布を水に入れて30分ほど浸けておきます。この工程を省いてはいけません。昆布からうま味成分のグルタミン酸がゆっくりと水に溶け出すために必要な時間です。次に弱火でゆっくり加熱します。60度前後が最もグルタミン酸が溶出しやすい温度です。決して沸騰させてはいけません。沸騰させると昆布から雑味が出てしまいます。昆布を取り出したら今度は鰹節を入れます。沸騰したお湯に鰹節を入れ、2分待ってから漉します。この際、鰹節を絞ってはいけません。絞ると雑味が出ます。',
  'instruction',
  'N1',
  '料理教室での出汁の取り方説明',
  '[]'::jsonb,
  '{"question":"昆布を水に浸ける工程について先生が説明した理由はどれですか。","options":["昆布の塩分を抜くため","グルタミン酸を水に溶け出させるための時間が必要だから","昆布を柔らかくして食べやすくするため","雑味を取り除くため"],"answer":1}'::jsonb,
  127
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '料理教室での出汁の取り方');

-- 28. 学術 — 気候変動政策討論 (meeting, sort_order 128)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '気候変動対策政策討論',
  E'司会：2050年カーボンニュートラルの実現に向けた政策について議論します。まず原子力発電の位置づけについて各パネリストの見解を伺います。\n中村（産業界）：再生可能エネルギーだけでは安定供給に限界があります。既存原発の再稼働と新型原子炉の開発は不可欠です。コスト面でも長期的には核が有利です。\n斉藤（環境団体）：2011年以降の教訓を無視した議論です。廃炉・廃棄物処理コストを含めれば原子力は決して安くない。再エネ・蓄電池・水素の組み合わせで十分対応できます。\n岡田（エコノミスト）：どちらの主張にも一理あります。現実的には移行期間として既存原発を活用しながら再エネへの投資を加速させる二本立て戦略が現実解ではないでしょうか。',
  'meeting',
  'N1',
  '気候変動対策に関する政策討論',
  '[]'::jsonb,
  '{"question":"岡田氏が提案した現実的な戦略はどれですか。","options":["原子力を全廃し再エネに完全移行","原子力のみで2050年カーボンニュートラルを実現","既存原発活用と再エネ投資加速の二本立て","海外の原子力技術を輸入して活用"],"answer":2}'::jsonb,
  128
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '気候変動対策政策討論');

-- 29. インタビュー — 起業家インタビュー (monologue, sort_order 129)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '若手起業家インタビュー',
  E'インタビュアー：起業して3年が経ちますが、最大の困難は何でしたか。\n起業家（男性）：最初の1年は資金繰りが本当に厳しくて、何度も諦めそうになりました。でも最大の困難は、信頼できるチームを作ることだったと思います。技術力や事業計画よりも、一緒に修羅場を乗り越えられる人間関係が会社の生命線だと実感しました。\nインタビュアー：これから起業を考えている人へのアドバイスは？\n起業家：「完璧な準備ができたら起業する」は罠だと思います。完璧な準備は永遠に来ません。小さく始めて市場の反応を見ながら修正していく、リーンスタートアップのマインドセットが大切です。あと、失敗を隠さず発信していくと、同じ悩みを持つ人とつながれます。',
  'monologue',
  'N1',
  '起業家へのインタビュー',
  '[]'::jsonb,
  '{"question":"起業家が最大の困難として挙げたのはどれですか。","options":["初年度の資金繰りの問題","信頼できるチームを作ること","事業計画の策定","競合他社との競争"],"answer":1}'::jsonb,
  129
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '若手起業家インタビュー');

-- 30. 公共 — 大学のオープンキャンパス説明 (monologue, sort_order 130)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '大学オープンキャンパス説明',
  E'担当者（女性）：本日は東和大学オープンキャンパスにお越しいただきありがとうございます。本学の情報工学部についてご説明します。本学部は4つのコースから構成されており、1年次は全員が基礎共通科目を履修します。2年次から専門コースに分かれ、情報セキュリティ・AIデータサイエンス・ネットワーク・ソフトウェア工学の4コースがあります。コース選択は1年後期の成績と希望を考慮して決定します。就職実績については、昨年度の学部卒業生の就職率は98.2パーセントで、大手IT企業への就職が全体の45パーセントを占めています。大学院進学率は22パーセントです。個別相談は13時から受け付けておりますので、お気軽にお声がけください。',
  'monologue',
  'N1',
  '大学オープンキャンパスでの学部説明',
  '[]'::jsonb,
  '{"question":"コース選択の決定方法として述べられたものはどれですか。","options":["入学時の試験結果のみ","入学前に全員が選択する","1年後期の成績と希望を考慮","2年次の前期試験の成績"],"answer":2}'::jsonb,
  130
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '大学オープンキャンパス説明');

-- 31. 日常 — マンション管理組合の説明 (announcement, sort_order 131)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  'マンション管理組合の説明会',
  E'管理組合理事長（男性）：本日はお集まりいただきありがとうございます。来年度の大規模修繕工事について報告します。外壁タイルの補修と屋上防水工事を来年4月から8月にかけて実施します。工事期間中はベランダへの大型家具の設置はご遠慮いただき、窓の外側の清掃も業者が行います。費用については、修繕積立金から2,200万円を充当しますが、不足分600万円については一時金として1戸当たり6万円のご負担をお願いします。お支払いは来年3月末までにお願いします。工事の詳細については、来月の説明会で専門業者から直接ご説明いただきます。',
  'announcement',
  'N1',
  'マンション管理組合の大規模修繕説明会',
  '[]'::jsonb,
  '{"question":"各戸に求められる一時金の金額と期限はどれですか。","options":["4万円、来年4月末まで","6万円、来年3月末まで","8万円、今年12月末まで","6万円、工事完了後"],"answer":1}'::jsonb,
  131
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = 'マンション管理組合の説明会');

-- 32. 学術 — 哲学講義（功利主義と義務論） (monologue, sort_order 132)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '功利主義と義務論の倫理学講義',
  E'教授：今日は功利主義と義務論という二大倫理理論を比較します。ベンサムとミルに代表される功利主義は「最大多数の最大幸福」を道徳の基準とします。行為の善悪はその結果によって決まるという結果主義です。一方カントの義務論は、行為の結果ではなく、その行為が義務から行われたかどうかが道徳的価値を決めると主張します。有名なトロッコ問題でいえば、功利主義は1人を犠牲にして5人を救うことを正当化しますが、義務論では人を手段として使ってはならないという原則から、切り替えを禁じる立場を取ります。どちらが正しいかではなく、なぜそう考えるかの根拠を意識することが倫理学の第一歩です。',
  'monologue',
  'N1',
  '大学での倫理学・哲学講義',
  '[]'::jsonb,
  '{"question":"カントの義務論がトロッコ問題で切り替えを禁じる理由はどれですか。","options":["5人より1人の命の方が重いから","行為の結果より動機が重要だから","人を手段として使ってはならないという原則があるから","最大多数の幸福を計算できないから"],"answer":2}'::jsonb,
  132
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '功利主義と義務論の倫理学講義');

-- 33. ビジネス — 海外赴任前のオリエンテーション (instruction, sort_order 133)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '海外赴任前オリエンテーション',
  E'人事部担当（女性）：シンガポール赴任に向けた事前オリエンテーションを始めます。まず手続き面ですが、就労ビザの申請は赴任の3ヶ月前に着手する必要があります。書類の不備があると審査が長引くので、書類チェックリストを確認してから提出してください。現地の銀行口座開設は到着後2週間以内に完了させてください。健康保険については、社内の海外赴任者用保険に自動加入となりますが、家族帯同の場合は別途申請が必要です。税務面では、183日以上現地に滞在した場合、シンガポール国内での所得税申告義務が生じます。現地の生活費は日本の1.3〜1.5倍程度を見込んでください。',
  'instruction',
  'N1',
  '海外赴任前の社内オリエンテーション',
  '[]'::jsonb,
  '{"question":"就労ビザの申請はいつ始めるべきと述べられましたか。","options":["赴任の1ヶ月前","赴任の2ヶ月前","赴任の3ヶ月前","現地到着後すぐ"],"answer":2}'::jsonb,
  133
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '海外赴任前オリエンテーション');

-- 34. 日常 — 職場の先輩後輩の相談 (dialogue, sort_order 134)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '職場の人間関係相談',
  E'男（後輩）：山田先輩、ちょっと相談があるんですが。\n女（先輩）：どうしたの？\n男：チームリーダーの鈴木さんとうまくやっていけなくて。指示が毎回変わるし、私のやり方をすぐ否定するんです。\n女：それは辛いね。具体的にどんな場面で？\n男：昨日も、企画書の方向性についてまず確認したら「自分で考えろ」と言われて、提出したら「なぜ相談しなかったんだ」と怒られました。\n女：それはどちらに従えばいいか分からないよね。まず、鈴木さんが大事にしていることを観察してみて。あとは自分の判断を記録に残しておくのも大事よ。「この指示を受けてこう判断しました」というメールを送っておくとか。\n男：なるほど、証拠を残しておくわけですね。やってみます。',
  'dialogue',
  'N1',
  '職場での人間関係の悩み相談',
  '[]'::jsonb,
  '{"question":"先輩が後輩に具体的にアドバイスした対処法はどれですか。","options":["人事部に相談する","鈴木さんと直接話し合う","鈴木さんの判断基準を観察し、自分の判断をメールで記録に残す","別の部署への異動を申請する"],"answer":2}'::jsonb,
  134
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '職場の人間関係相談');

-- 35. 学術 — 宇宙開発の現状と展望 (monologue, sort_order 135)
INSERT INTO jlpt_listening_scripts (title, script, script_type, jlpt_level, situation, vocabulary_notes, comprehension, sort_order)
SELECT
  '宇宙開発の現状と民間参入',
  E'研究者（男性）：近年の宇宙開発で最も注目すべき変化は、スペースXに代表される民間企業の参入です。従来、宇宙開発は国家主導でしたが、再利用可能なロケット技術の確立により、打ち上げコストが2000年代比で約90パーセント削減されています。これにより、企業や研究機関が独自に衛星を打ち上げることが現実的になり、小型衛星コンステレーションによる低遅延通信ネットワークも急速に整備されています。一方、宇宙ゴミ、いわゆるデブリの問題が深刻化しており、低軌道の衛星密度が増加することでデブリとの衝突リスクが高まっています。国際的なデブリ除去の枠組み整備が急務ですが、各国の利害が絡み合い、合意形成は難航しています。',
  'monologue',
  'N1',
  '宇宙開発の最新動向に関する講演',
  '[]'::jsonb,
  '{"question":"民間企業参入により実現した最も重要な変化として述べられたのはどれですか。","options":["月面探査の実現","再利用ロケットによる打ち上げコストの大幅削減","宇宙デブリの除去成功","国際宇宙ステーションの民営化"],"answer":1}'::jsonb,
  135
WHERE NOT EXISTS (SELECT 1 FROM jlpt_listening_scripts WHERE title = '宇宙開発の現状と民間参入');
