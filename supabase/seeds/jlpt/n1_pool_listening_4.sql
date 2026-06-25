-- encoding: UTF-8
-- JLPT N1 聴解 問題プール 第4弾 — 30問 オリジナル作文
-- 作成日: 2026-06-26
-- quiz_id: bb000001-0000-0000-0000-000000000003 (N1 聴解テスト拡充)
-- 問題構成: 対話(15問) / 独白・モノローグ(15問)
-- 難易度: N1相当 (スクリプト 200~250字、推論・含意・批判的読解が必要)
-- 正答分布: 1→8問, 2→8問, 3→7問, 4→7問

-- ============================================================
-- Q01: 職場 — 組織再編への懸念 (対話)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女：来月から営業部と企画部が統合されるって聞いたんですが、実際にはどういう経緯だったんでしょうか。\n男：表向きは「シナジー創出」って言われてるけど、実態は人件費削減だよ。統合後に管理職ポストが半分になるから、残れない人は早期退職を勧奨されるらしい。\n女：それは聞いていませんでした。私たちの部署も対象に入るんですか。\n男：可能性はあるね。ただ、実績のある人は残される方向らしいから、今は業績を上げるしかない。黙って成果を出すのが一番の防衛策だよ。\n質問：男性が示唆している組織再編の実態はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('部署間の連携を強化するための組織改革', false, 1),
  ('コスト削減を目的とした管理職削減', true, 2),
  ('優秀な人材を集約するための精鋭化', false, 3),
  ('事業拡大に伴う組織規模の拡大', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q02: 大学院 — 研究倫理の議論 (対話)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n教授：君の論文だが、引用の処理に問題があるね。参考にした先行研究の文章を少し言い換えて自分の文章のように書いている箇所がある。\n院生：えっ、それは意図的ではなくて、ノートを書き写す際に混在してしまったんだと思います。\n教授：意図の有無に関係なく、出典を明示しない限りそれはアカデミックプラジャリズムになる。今すぐ修正して出典を全て明記しなさい。それと、今後はノートの段階から引用箇所を区別する習慣をつけること。\n院生：はい、深く反省しています。修正版は今週中に提出します。\n質問：教授が最も強調していることは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('論文の引用箇所を削除すること', false, 1),
  ('先行研究に関する調査を増やすこと', false, 2),
  ('論文の提出期限を守ること', false, 3),
  ('出典を明示することと今後の習慣改善', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q03: 企業経営 — 方針転換の説明 (対話)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n記者：社長、今期から主力事業を製造からサービスにシフトすると発表されましたが、製造現場の従業員への影響はどうなりますか。\n社長：製造ラインの一部を縮小しますが、希望者には新設するサービス部門への配置転換を実施します。スキルアップのための研修も用意しています。\n記者：配置転換を希望しない従業員はどうなりますか。\n社長：退職を強制することはありません。現行条件での雇用を最大限維持しつつ、段階的な移行を進めます。ただし、製造ラインの縮小は不可避であることはご理解いただきたい。\n質問：会社の方針として正しいのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('配置転換希望者に研修を提供し、強制退職はしない', true, 1),
  ('全従業員をサービス部門に移行させる', false, 2),
  ('製造ラインは維持しながらサービスを追加する', false, 3),
  ('希望者のみ早期退職を認める', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q04: 医療 — 患者と医師の対話 (対話)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n患者：先生、インターネットで調べたら、私の症状に合う薬が出てきたんですが、それを処方してもらえますか。\n医師：おっしゃっている薬は確かに同じ症状に使われることがありますが、あなたの現在の血圧の状態と相互作用が懸念されます。今は別のアプローチで様子を見たいと思っています。\n患者：でも、その薬を飲めばすぐ楽になると書いてありました。\n医師：ネットの情報は個別の状態を考慮していません。医療判断は総合的な状態を見て行うものです。今週は現在の治療を続けて、来週もう一度経過を確認しましょう。\n質問：医師が患者の要望を断った理由は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('その薬が現在入手できないから', false, 1),
  ('患者の症状にその薬は効果がないから', false, 2),
  ('患者の血圧の状態との相互作用が懸念されるから', true, 3),
  ('患者が自己診断するのは危険だから', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q05: 職場 — プロジェクト失敗の振り返り (対話)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n部長：今回のプロジェクトが予算超過になった根本原因を分析してもらえますか。\n担当：はい、大きく二点あります。まず、初期の要件定義が曖昧なまま開発を始めたため、途中で仕様変更が頻発しました。次に、リスク管理が不十分で、下請け会社の納期遅延に対する備えがなかったことが重なりました。\n部長：今後の対策は？\n担当：要件定義の段階で顧客と合意書を作成すること、それとリスク登録簿を作って月次で確認する体制にしたいと思います。\n質問：担当者が挙げた失敗の根本原因はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('曖昧な要件定義と不十分なリスク管理', true, 1),
  ('予算が当初から不足していたこと', false, 2),
  ('下請け会社の能力不足', false, 3),
  ('顧客の要求が過剰だったこと', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q06: 社会 — 移住政策についての議論 (対話)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n女：地方創生の補助金制度、随分と拡充されましたね。\n男：確かに財政的な支援は増えましたが、移住者が定着するかどうかはまた別の問題ですよ。私の調査では、移住して3年以内に都市部に戻る人が全体の40%を超えているんです。\n女：その要因はなんでしょうか。\n男：職の選択肢の狭さと、地域コミュニティへの適応の難しさが主な要因です。お金を出しても、受け入れ側の社会的な基盤が整っていなければ定着は難しい。\n質問：男性が指摘した地方移住定着の課題はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('補助金の金額が少ないこと', false, 1),
  ('職の選択肢の狭さとコミュニティ適応の困難さ', true, 2),
  ('地方の住宅インフラが整っていないこと', false, 3),
  ('都市と地方の賃金格差が大きいこと', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q07: テクノロジー — AI倫理をめぐる議論 (対話)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n研究者A：生成AIが人間の書いたコンテンツを無断で学習に使うことについて、どうお考えですか。\n研究者B：技術の発展という観点では理解できます。しかし、制作者の同意なしに商業的に利用されるなら、それはクリエイターの権利を侵害していると思います。\n研究者A：でも、人間だって他者の作品を参考にして学んでいますよね。\n研究者B：人間の学習と機械的な大量複製は本質的に異なります。重要なのは透明性と補償の仕組みを整えることだと思います。倫理なき技術革新は長続きしません。\n質問：研究者Bの主張として最も適切なものはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('生成AIの開発はただちに停止すべきだ', false, 1),
  ('AIの学習は人間の学習と本質的に同じだ', false, 2),
  ('透明性と補償の仕組みを整えることが必要だ', true, 3),
  ('著作権法を廃止してAI開発を自由化すべきだ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q08: 職場 — 後輩への批判的フィードバック (対話)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n先輩：この提案書、内容は悪くないんだけど、読み手の立場を考えた構成になっていないね。最初にデータを並べすぎて、結論がどこにあるか分かりにくい。\n後輩：どのように直せばよいでしょうか。\n先輩：ビジネス文書は「結論→根拠→詳細」の順が基本だよ。読む人は忙しいから、まず何を言いたいかを冒頭に出す。データはその根拠として後に続ける。\n後輩：なるほど、逆ピラミッド構造ですね。もう一度全体を組み替えてみます。\n先輩：そう。来週までに直したものを見せて。\n質問：先輩が指摘した問題点は何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('提案書のデータが不正確であること', false, 1),
  ('文章の長さが適切でないこと', false, 2),
  ('専門用語が多すぎること', false, 3),
  ('結論が冒頭に示されず読みにくい構成であること', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q09: 行政 — 住民説明会での質疑 (対話)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n住民：新しいごみ処理施設を住宅密集地に建設する計画について反対です。騒音や排気ガスの健康への影響が心配です。\n市の担当者：ご懸念はよく理解できます。今回の施設は最新の排気処理技術を導入しており、国の環境基準を大幅に上回る安全性を確保しています。騒音についても防音壁を設置し、測定値は現在の周辺環境と変わらない水準を維持します。\n住民：それは計画上の話で、実際に稼働してからどうなるかは別でしょう。稼働後も定期的なモニタリングを約束していただけますか。\n市の担当者：はい、稼働後は3か月に一度、測定結果を住民の皆様に公開します。\n質問：住民の最終的な要求はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('施設の建設計画を撤回すること', false, 1),
  ('稼働後の定期的なモニタリングと結果公開', true, 2),
  ('防音壁をより高くすること', false, 3),
  ('施設の建設場所を変更すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q10: 金融 — 資産運用の相談 (対話)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n顧客：老後のために資産運用を始めたいんですが、どんな方法がいいですか。まだ30代なので積極的にリターンを追いたいと思っています。\nFP：方向性は悪くありませんが、まず緊急予備資金として生活費の6か月分を現金で確保することが先決です。その上で、長期投資であれば株式や投資信託が有効です。ただし、単一商品に集中するのではなく、地域や資産クラスを分散させることが重要です。\n顧客：FXで大きく稼ぐのはどうですか。\nFP：FXは高レバレッジで短期間に大きな損失が出るリスクもあります。老後資金の運用には向いていません。\n質問：FPが顧客に最初にするよう勧めたことは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('生活費6か月分の緊急予備資金を現金で確保すること', true, 1),
  ('すぐに株式投資を始めること', false, 2),
  ('FXで積極的に運用すること', false, 3),
  ('投資信託に全額を投じること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q11: 法律 — 契約トラブルの相談 (対話)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n相談者：フリーランスとして納品した仕事の代金を3か月以上払ってもらえないんです。契約書はあるんですが。\n弁護士：契約書がある点は有利です。まず内容証明郵便で支払いを正式に請求することをお勧めします。これは法的に相手に通知した証拠になります。\n相談者：それでも払わなかったら？\n弁護士：60万円以下の請求なら少額訴訟という簡易な手続きが使えます。1回の審理で結論が出ることが多く、費用も抑えられます。\n相談者：まずは内容証明から試してみます。\n質問：弁護士が最初に勧めた方法はなぜ有効ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('裁判なしに強制的に回収できるから', false, 1),
  ('費用が最も安い方法だから', false, 2),
  ('法的に通知したことの証拠になるから', true, 3),
  ('相手が必ず支払うよう強制できるから', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q12: 教育 — 学校制度改革の議論 (対話)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n教育評論家A：小学校からプログラミングを必修化する政策、どう評価されますか。\n教育評論家B：デジタル社会への対応という点では意義があります。しかし、教員側のスキル不足という現実的な問題があり、形式的な授業になっているケースも報告されています。\n教育評論家A：それは教員研修で解決できませんか。\n教育評論家B：研修だけでは限界があります。カリキュラムの設計そのものを、暗記型から思考力・問題解決力を育てる方向に抜本的に変えないと、プログラミングを教えても真の情報活用能力は育ちません。\n質問：教育評論家Bが主張する最も根本的な問題はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('プログラミング機器が学校に不足していること', false, 1),
  ('保護者のデジタルリテラシーが低いこと', false, 2),
  ('教員のプログラミングスキルが不足していること', false, 3),
  ('カリキュラムが思考力育成より暗記中心であること', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q13: 経営 — 新市場参入の判断 (対話)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n取締役A：東南アジア市場への参入、具体的にどの国から始めるべきでしょうか。\n取締役B：市場規模だけで見ればインドネシアが最大ですが、規制環境と流通インフラの整備状況を考えるとベトナムの方が参入障壁が低いと思います。\n取締役A：ベトナムで軌道に乗ったら横展開できますか。\n取締役B：はい、法制度が比較的類似しているタイやマレーシアへの展開がスムーズにできる可能性があります。ただ、現地パートナーの選定が成功の鍵になりますから、その点のリサーチに時間をかけることをお勧めします。\n質問：取締役Bがベトナムをインドネシアよりも優先する理由はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('消費者の購買力がより高いから', false, 1),
  ('規制環境と流通インフラの面で参入しやすいから', true, 2),
  ('日本製品のブランド認知度が高いから', false, 3),
  ('市場規模がインドネシアより大きいから', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q14: 報道 — 記者と情報源の倫理 (対話)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n新人記者：先輩、情報提供者から内部告発の資料をもらったんですが、これをそのまま記事にしてもいいですか。\n先輩記者：待って。一次情報だからといって、すぐに公開してはだめだよ。まず、その資料が本物かどうかを別の情報源で裏を取らなければ。それと、情報提供者への危害が及ばないかも考慮しないといけない。\n新人記者：でも早くしないと他社に先を越されます。\n先輩記者：スクープより正確さと安全の確保が優先だ。誤報になれば信頼は失われるし、情報源が特定されて被害が出れば倫理的に問題になる。\n質問：先輩記者が最も重視していることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('情報の正確な裏付けと情報源の安全確保', true, 1),
  ('他社よりも早く記事を公開すること', false, 2),
  ('情報提供者の身元を読者に公開すること', false, 3),
  ('編集長の許可を得てから取材すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q15: 福祉 — 高齢者ケアの課題 (対話)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n介護士：最近、認知症の入居者の対応が以前より難しくなってきています。人手が少ない夜間に問題行動が増えていて。\n施設長：それは深刻だね。夜間の配置基準を満たしているとはいえ、現場の実態として余裕がないのは分かってる。\n介護士：ロボットや見守りシステムの導入を検討していただけませんか。技術で補えれば負担が減るかもしれません。\n施設長：予算の問題もあるが、前向きに検討する。ただ、機械で感情的なケアは代替できないから、あくまでも補助として位置付けることが大切だ。\n質問：施設長がテクノロジー導入について示した立場はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('予算がないので導入は不可能だ', false, 1),
  ('ロボットが人間のケアを完全に代替できる', false, 2),
  ('補助ツールとして前向きに検討するが感情的ケアは人間が担う', true, 3),
  ('夜間の人員配置を増やす方が優先事項だ', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q16: 社会評論 — 過労問題と企業文化 (独白)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n日本における長時間労働の問題は、単に法律を強化するだけでは解決しません。根底には「長く働くことへの同調圧力」と、成果よりも在席時間を評価する文化があります。2019年の働き方改革関連法施行以降、残業時間の上限規制は形式上は機能していますが、サービス残業や持ち帰り仕事という形で問題が地下に潜ったという指摘もあります。真の改革には、評価制度そのものを成果主義に切り替え、管理職が率先して定時に退社する「文化的なシグナル」を発信することが不可欠です。法律と文化、両輪での変革なくして過労問題の解消はないでしょう。\n質問：この話者が主張する過労問題の本質的解決策はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('残業時間の法的上限をさらに厳しくすること', false, 1),
  ('サービス残業を罰則付きで禁止すること', false, 2),
  ('在宅勤務を全企業に義務付けること', false, 3),
  ('成果主義への評価制度転換と企業文化の変革を同時に行うこと', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q17: 環境 — 脱炭素政策への見解 (独白)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n日本政府は2050年カーボンニュートラルを宣言していますが、その実現には産業界の根本的な構造転換が求められます。特に鉄鋼・化学・セメントなどのいわゆる「重工業」は脱炭素化が技術的に難しく、現時点では水素や電炉への転換コストが膨大です。こうした産業を支援なしに市場原理だけで移行させようとすれば、国際競争力を失い、雇用が海外に流出するリスクがあります。したがって、政府には移行期間中の財政支援とともに、国際的な炭素国境調整措置の活用が求められます。脱炭素は環境問題であると同時に、経済政策そのものと言えます。\n質問：話者が強調する脱炭素実現のために政府が取るべき行動はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('重工業への財政支援と炭素国境調整措置の活用', true, 1),
  ('重工業の海外移転を促進すること', false, 2),
  ('市場原理に任せて自然な移行を促すこと', false, 3),
  ('カーボンニュートラルの目標期限を延長すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q18: テクノロジー — デジタル格差の問題 (独白)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n行政サービスのデジタル化が進む一方で、高齢者や低所得層を中心にデジタルツールにアクセスできない「デジタル弱者」の問題が深刻化しています。マイナンバーカードの普及や行政手続きのオンライン化は利便性を高めますが、スマートフォンを持っていない人やインターネットの使い方が分からない人には、かえって行政サービスへのアクセスが困難になるという逆説が生まれています。真の意味でのデジタル包摂を実現するには、技術の普及と同時に、アナログの窓口を維持しつつ、デジタルリテラシー教育を地域レベルで推進することが不可欠です。\n質問：話者がデジタル化推進の問題として指摘していることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('マイナンバーカードのセキュリティが不十分なこと', false, 1),
  ('デジタルツールにアクセスできない人が行政サービスから疎外されること', true, 2),
  ('行政のデジタル化コストが過大であること', false, 3),
  ('個人情報の管理リスクが高まること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q19: 経済 — 円安の構造的要因 (独白)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n円安は輸出企業にとって追い風となる一方、エネルギーや食料品の輸入コストを押し上げ、消費者の生活を直撃します。近年の円安の背景には、日米金利差の拡大があります。米国が利上げ局面にある中で、日本銀行が長期間にわたり超低金利政策を維持してきたため、円を売ってドルを買う動きが加速しました。また、日本の経常収支が旅行収支やデジタルサービスへの支出増加でかつてほど黒字でなくなったことも、構造的な円安圧力として指摘されています。こうした要因が複合的に絡み合っており、短期的な為替介入だけでは根本的な解決にはなりません。\n質問：話者が挙げた円安の構造的要因に含まれるのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('日本の輸出企業の競争力低下', false, 1),
  ('日本の人口減少による内需縮小', false, 2),
  ('日米金利差の拡大と経常収支の変化', true, 3),
  ('政府の財政赤字の拡大', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q20: 文化 — 無形文化遺産の保護 (独白)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n伝統工芸や祭礼、民俗芸能といった無形文化遺産は、担い手の高齢化と後継者不足により急速に失われつつあります。記録映像を作成することは重要ですが、それだけでは「知識」として残るだけであり、技術や精神を生きた形で継承することにはなりません。真の保護には、若い世代が実際に学べる環境を整え、それを生業として成立させる経済的基盤も含めて設計することが必要です。観光資源としての商業化は資金調達の手段にはなりますが、本質的な文化的文脈が失われないよう、コミュニティ主導の保護活動と並行させることが求められます。\n質問：話者が真の無形文化遺産保護のために必要だと述べていることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('若世代が学び生業にできる環境と経済的基盤の整備', true, 1),
  ('記録映像を世界中に配信すること', false, 2),
  ('伝統工芸を観光業に完全に統合すること', false, 3),
  ('政府が後継者全員に補助金を支給すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q21: 哲学 — 自由意志と責任の講演 (独白)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n犯罪行為に対して「育ちや環境のせいだ」という弁明はしばしば聞かれますが、これを認め過ぎると道徳的責任の概念そのものが崩れてしまいます。一方で、環境の影響を完全に無視することも非科学的です。現代の倫理学では、人は完全に自由ではないが、一定の選択能力を持つ「条件付きの主体」として扱われることが多く、その範囲で責任を問われます。刑事司法においても、情状酌量は環境要因を考慮しつつも行為者の責任を否定しません。重要なのは、環境決定論と完全な自由意志論の二項対立を超え、人を複雑な因果の中で評価する視点を持つことです。\n質問：話者の主張として最も近いのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('犯罪の原因は環境にあり、本人に責任はない', false, 1),
  ('人は完全に自由であり、環境は関係ない', false, 2),
  ('刑事司法は環境要因を考慮すべきではない', false, 3),
  ('人は条件付きの主体として一定の責任を持つという立場が妥当だ', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q22: IT産業 — エンジニアのキャリア論 (独白)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\nソフトウェアエンジニアのキャリアにおいて、技術の深みを極めるスペシャリスト路線と、ビジネスや組織を横断するジェネラリスト路線は、しばしば対立する選択肢として語られます。しかし、私が多くのエンジニアのキャリアを見てきた経験から言えば、長期的に価値を発揮できるのは、深い技術基盤の上にコミュニケーション力・ビジネス理解・プロジェクト管理力を積み重ねた「Tシェイプ型」の人材です。AIが定型業務を自動化していく時代には、技術力だけでなく「技術で何を解決するか」を語れる人材が求められます。早い段階で技術以外の視野も広げることを強くお勧めします。\n質問：話者が価値があると述べている人材像はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('特定技術を極めた純粋なスペシャリスト', false, 1),
  ('深い技術基盤にビジネス・マネジメント力を兼ね備えたTシェイプ型人材', true, 2),
  ('技術より対人コミュニケーションに特化したジェネラリスト', false, 3),
  ('AIの開発そのものに特化した研究者型エンジニア', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q23: 国際関係 — 経済安全保障の重要性 (独白)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n半導体や希少金属、医薬品原料など特定の物資の供給を一国に依存することの脆弱性は、コロナ禍やウクライナ情勢を通じて世界が改めて認識しました。経済安全保障とは、単なる貿易政策を超え、国家の安全保障戦略として重要インフラや物資の供給網を管理することです。日本でも2022年に経済安全保障推進法が施行され、特定重要物資の安定供給確保が国家的課題と位置づけられました。ただし、過度なサプライチェーンの国内回帰は生産コストを押し上げ、国際競争力を損なう側面もあります。友好国とのアライアンス構築と国内生産の強化、この両立が今後の鍵となります。\n質問：話者が経済安全保障の課題として指摘していることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('半導体産業への政府補助金が少ないこと', false, 1),
  ('友好国との外交関係が悪化していること', false, 2),
  ('過度な国内回帰がコスト増大と競争力低下を招くこと', true, 3),
  ('経済安全保障推進法の施行が遅れていること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q24: 心理 — 確証バイアスの説明 (独白)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n人は自分の信念や仮説を支持する情報を優先的に集め、反論となる情報を無意識に無視したり軽視したりする傾向があります。これを確証バイアスと呼びます。SNSのアルゴリズムは利用者の好みに沿った情報を優先表示するため、このバイアスをさらに増幅させます。その結果、異なる意見を持つ人々の間で共通の事実認識が失われ、社会の分断が深まる「エコーチェンバー」現象が生じます。この問題を個人レベルで軽減するには、自分の意見と対立する情報源を意識的に読むこと、そして「なぜ自分はこう思うのか」を批判的に問い直す習慣が有効です。\n質問：エコーチェンバー現象の原因として挙げられているのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('確証バイアスとSNSアルゴリズムによる情報の偏り', true, 1),
  ('インターネット上の偽情報の増加', false, 2),
  ('メディアリテラシー教育の不足', false, 3),
  ('政府による情報統制', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q25: 労働 — ジョブ型雇用の展望 (独白)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n日本企業で広がりつつある「ジョブ型雇用」は、職務を明確に定義し、その職務に必要なスキルを持つ人材を採用・評価する仕組みです。従来のメンバーシップ型雇用が「人を採用して仕事を与える」のに対し、ジョブ型は「仕事に人を当てる」発想です。この移行は、スキルの見える化と専門性を高める効果がありますが、一方で職務定義に含まれない仕事への柔軟な対応が難しくなるという批判もあります。日本型雇用の強みであった「阿吽の呼吸」や組織への帰属意識が薄れる懸念も根強くあります。制度の移行にあたっては、日本の文化的文脈を無視した欧米モデルの単純な移植ではなく、段階的で自社に合った設計が求められます。\n質問：話者がジョブ型雇用導入時に必要だと述べていることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('欧米の成功事例をそのまま導入すること', false, 1),
  ('メンバーシップ型雇用を法律で禁止すること', false, 2),
  ('全ての社員を専門職として再定義すること', false, 3),
  ('日本の文化的文脈を踏まえた段階的かつ自社に合った設計', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q26: 政策 — 少子化対策の限界 (独白)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n日本の合計特殊出生率の低下に対し、政府はこれまで保育所の拡充、育児休業給付の引き上げ、子育て支援金の拡大など多くの対策を打ってきました。しかし効果は限定的です。その理由は、少子化の根本にある「子どもを産み育てることに対する経済的・時間的・社会的コストの大きさ」に十分に対処できていないからだと指摘されています。給付金は一時的な誘因にはなっても、長期的に子育てに関わる構造的負担を変えるものではありません。女性のキャリアと育児を本当に両立できる職場文化の変革と、男性の育児参加を当然とする意識改革こそが、長期的に出生率に影響を与えるとされています。\n質問：話者が少子化対策の核心に位置づけているのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('子育て支援金のさらなる増額', false, 1),
  ('職場文化の変革と男性育児参加への意識改革', true, 2),
  ('保育所の定員を2倍に増やすこと', false, 3),
  ('移民受け入れを拡大して労働力を確保すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q27: ビジネス — 失敗から学ぶ組織文化 (独白)
-- 正答: 3
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n革新的な企業の多くは、失敗を許容し、そこから学ぶことを組織文化として根付かせています。失敗を責め、隠蔽することが当たり前になっている組織では、問題が表面化するのが遅れ、小さなほころびが大きな危機に発展します。一方で、失敗を「学習の機会」として公式に共有する企業では、同じミスが繰り返されにくく、組織全体の知識が蓄積されます。重要なのは、個人を責めるのではなく「なぜそのような状況が生まれたか」というシステム思考で分析することです。この視点の転換なくして、真の意味での組織的学習は生まれません。失敗に正面から向き合う勇気が、長期的な競争優位の源泉となります。\n質問：話者が組織的学習のために最も重要だと述べていることはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('失敗した社員に対して責任を明確にすること', false, 1),
  ('外部のコンサルタントに問題分析を委託すること', false, 2),
  ('個人ではなくシステムの問題としてとらえ失敗を組織で共有すること', true, 3),
  ('失敗の少ない優秀な人材のみを採用すること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q28: 科学 — 量子コンピュータの可能性と限界 (独白)
-- 正答: 1
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n量子コンピュータは現在のコンピュータでは不可能な計算を実現できると期待されており、特に創薬シミュレーションや暗号解読、最適化問題への応用が注目されています。しかし、現在の量子コンピュータは「ノイズの多い中規模量子デバイス」と呼ばれる段階にあり、エラーが多く実用的な計算には制限があります。また、動作には極めて低い温度環境が必要で、インフラコストが高いため汎用コンピュータとして一般に普及するまでにはまだ相当な時間がかかると見込まれています。量子コンピュータが実用化される分野は、まずは特定の計算問題に限られ、既存のコンピュータを完全に置き換えるものではないというのが現在の専門家の共通認識です。\n質問：量子コンピュータの現在の課題として挙げられていないのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('創薬やゲノム解析の分野での応用可能性がないこと', true, 1),
  ('エラーが多く実用的な計算に制限があること', false, 2),
  ('動作に極低温環境が必要でインフラコストが高いこと', false, 3),
  ('汎用コンピュータとして普及するには時間がかかること', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q29: 社会 — 孤独問題と地域コミュニティ (独白)
-- 正答: 4
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\n英国が世界で初めて「孤独担当大臣」を設置したのは2018年のことです。孤独は単に感情的な問題ではなく、慢性的な孤独は喫煙と同程度の健康被害をもたらすことが研究で示されており、公衆衛生上の問題として捉えられています。日本でも高齢者や若年層を含む幅広い年齢層で孤独感が広がっており、2021年に孤独・孤立対策担当大臣が設置されました。しかし、孤独は政策だけで解決できるものではありません。地域の人と人のつながりを再生するためには、近所付き合いや地域活動への参加を促す「居場所づくり」が最も効果的と言われています。デジタルでのつながりは補完的役割を担いますが、対面でのコミュニケーションの代替にはなりません。\n質問：話者が孤独問題の解決に最も効果的だと述べているのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('政府による孤独対策予算の大幅な増加', false, 1),
  ('SNSを活用したオンラインコミュニティの拡大', false, 2),
  ('孤独担当大臣の権限を強化すること', false, 3),
  ('地域における対面でのつながりと居場所づくり', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q30: 医療倫理 — インフォームドコンセントの意義 (独白)
-- 正答: 2
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の話を聴いて、質問に答えてください。\nインフォームドコンセントとは、患者が医師から十分な説明を受け、理解した上で自らの治療方針に同意することを指します。かつての医療では「医師が最善を判断する」パターナリズムが主流でしたが、患者の自律性を尊重するという倫理的転換により現在の制度が確立されました。ただし、形式的な同意書への署名を取るだけでは本来の目的を果たしていません。患者が専門的な医療情報を正確に理解し、自分の価値観に基づいて選択できるよう、医師側にはわかりやすい説明と十分な対話の時間を確保する義務があります。また、判断能力が限られている患者に対しては、代理意思決定者の役割と患者本人の推定意思の双方を考慮することが求められます。\n質問：インフォームドコンセントの本来の目的として最も適切なのはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('医師の治療方針に対する法的保護を確保すること', false, 1),
  ('患者が十分な情報と理解に基づき自律的に治療を選択できること', true, 2),
  ('病院の医療記録を正確に管理すること', false, 3),
  ('医療訴訟のリスクを最小化すること', false, 4)
) AS t(txt, ok, so);
