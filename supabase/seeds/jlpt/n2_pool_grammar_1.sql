-- encoding: UTF-8
-- N2 文法モデル問題プール (オリジナル出題) 37問
-- 対象テーブル: quiz_questions / quiz_question_options
-- quiz_id: bb000002-0000-0000-0000-000000000001 (N2 文法テスト拡充)
-- 作成日: 2026-06-26
-- 問題形式: ①空欄補充 ②文法パターンの意味 ③文脈上の文法選択
-- 正答位置分布: 1番=10問, 2番=9問, 3番=9問, 4番=9問 (計37問)
-- 使用パターン: に伴い, につれて, を契機に, をもとに, かねる, かねない,
--   得る, に至る, に先立ち, を問わず, はともかく, というわけではない,
--   ものがある, でなくてなんだろう, というものでもない, にもかかわらず,
--   ようとしない, ようとする, に応じて, からすれば, からすると, からには,
--   ことにする, ことになる, ていく, てくる, てしまう (感情), にとって,
--   にとどまらず, によって, によると, として, ことで, ものか, だけあって,
--   まま, ずにはいられない, (문맥비교 계열)

-- ============================================================
-- Q1 【空欄補充】に伴い — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '利用者数の増加（　　）、サーバーの増強が必要になった。',
    'grammar', 'N2', 1, true,
    '「に伴い」は「〜とともに、〜に合わせて」の意味で、ある変化に比例して別の変化が生じる場合に使う。「に伴い」＝「に伴って」の書き言葉形。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に伴い',    true,  1),
  ('をめぐり',  false, 2),
  ('に反して',  false, 3),
  ('にかけて',  false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q2 【意味問題】につれて — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「経験を積むにつれて、判断力が高まった」の「につれて」に最も近い意味はどれか。',
    'grammar', 'N2', 1, true,
    '「につれて」は変化が比例して進む様子を表す。「年齢が上がるにつれて体力が落ちる」のように、一方の変化が他方の変化を引き起こす関係を示す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜にもかかわらず',       false, 1),
  ('〜と同時に変化して',     true,  2),
  ('〜という理由だけで',     false, 3),
  ('〜が終わった後で',       false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q3 【空欄補充】を契機に — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '転職（　　）、生活スタイルを大きく見直すことにした。',
    'grammar', 'N2', 1, true,
    '「を契機に」は「それがきっかけとなって次の行動が起きた」という意味。「をきっかけに」と同義だが、やや改まった表現。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('を通して',   false, 1),
  ('にしたがい', false, 2),
  ('を契機に',   true,  3),
  ('をめぐって', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q4 【空欄補充】をもとに — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'ユーザーのフィードバック（　　）、新機能の設計を進めた。',
    'grammar', 'N2', 1, true,
    '「をもとに（して）」は「〜を基礎・材料として」の意味。データや情報を根拠に何かを行う場合に用いる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に対して',     false, 1),
  ('に伴って',     false, 2),
  ('をめぐって',   false, 3),
  ('をもとに',     true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q5 【意味問題】かねる — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「その要求にはお応えしかねます」の「しかねます」の意味として正しいものはどれか。',
    'grammar', 'N2', 1, true,
    '「〜かねる」は「〜することが難しい・できない」という意味で、直接的な拒否を柔らかく表す表現。ビジネス場面でよく使われる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('いたしかねません＝対応が難しい',    true,  1),
  ('いつでも対応できます',              false, 2),
  ('対応する義務があります',            false, 3),
  ('ぜひ対応したいと思っています',      false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q6 【空欄補充】かねない — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '無理なスケジュールを続けると、健康を損ない（　　）。',
    'grammar', 'N2', 1, true,
    '「〜かねない」は「そうなる可能性がある（好ましくないことについて）」という意味。話者が悪い事態を懸念する場合に使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('だろうか',     false, 1),
  ('かねない',     true,  2),
  ('ものだ',       false, 3),
  ('ことがある',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q7 【意味問題】得る（えない） — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「一人の力だけでは成し得ない目標だ」の「成し得ない」の意味はどれか。',
    'grammar', 'N2', 1, true,
    '「〜得る（える）」は「〜することができる」、「〜得ない（えない）」は「〜することができない」という能力・可能性の表現。書き言葉的。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('成し遂げなければならない', false, 1),
  ('成し遂げたことがある',     false, 2),
  ('成し遂げることができない', true,  3),
  ('成し遂げるつもりがない',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q8 【空欄補充】に至る — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '長い交渉の末、ついに合意（　　）ことができた。',
    'grammar', 'N2', 1, true,
    '「に至る」は「ある状態・結果・段階に達する」という意味。プロセスを経てある到達点に達することを表し、格式ある文章によく使われる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に関する',   false, 1),
  ('をもとに',   false, 2),
  ('にそった',   false, 3),
  ('に至る',     true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q9 【空欄補充】に先立ち — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'システムのリリース（　　）、最終テストを実施する。',
    'grammar', 'N2', 1, true,
    '「に先立ち（て）」は「〜の前に、〜に先んじて」という意味で、重要な行事や行動の直前の準備・手続きを述べる格式的な表現。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に先立ち',     true,  1),
  ('に基づき',     false, 2),
  ('をめぐって',   false, 3),
  ('に際して',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q10 【意味問題】を問わず — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「経験の有無を問わず応募できます」の「を問わず」と同じ意味で使えるものはどれか。',
    'grammar', 'N2', 1, true,
    '「を問わず」は「〜に関係なく、〜に左右されず」の意味。「経験の有無を問わず」＝「経験があってもなくても」という無条件・無制限を表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('経験があるかぎり',         false, 1),
  ('経験があってもなくても',   true,  2),
  ('経験がある場合のみ',       false, 3),
  ('経験がないにもかかわらず', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q11 【文脈選択】はともかく — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'デザイン（　　）、まず機能が正常に動くかどうかを確認しましょう。',
    'grammar', 'N2', 1, true,
    '「はともかく（として）」は「〜は別として、〜はひとまず置いておいて」という意味。最初の話題を一時脇に置き、より優先すべきことに話を向ける。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にもかかわらず', false, 1),
  ('によって',       false, 2),
  ('はともかく',     true,  3),
  ('をきっかけに',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q12 【意味問題】というわけではない — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「毎日練習しているからといって、必ず上手になるというわけではない」が表す内容として正しいものはどれか。',
    'grammar', 'N2', 1, true,
    '「というわけではない」は「必ずしも〜ではない」という部分否定を表す。「〜だから〜とは限らない」という論理的な限定・打ち消しに使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('毎日練習しても意味がない',         false, 1),
  ('必ず上手になれる',                 false, 2),
  ('練習することは大切ではない',       false, 3),
  ('練習しても必ずしも上手になるとは限らない', true, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q13 【空欄補充】ものがある — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'あの選手のプレーには、見る者を引きつける（　　）。',
    'grammar', 'N2', 1, true,
    '「〜ものがある」は「特別なそうした性質を強く持っている」という意味の強調表現。感動・印象・力強さなどを主観的に述べる際に用いる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ものがある',   true,  1),
  ('ものだった',   false, 2),
  ('ものではない', false, 3),
  ('ものか',       false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q14 【文脈選択】にもかかわらず — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '雨が降っている（　　）、彼は傘もささずに歩いていた。',
    'grammar', 'N2', 1, true,
    '「にもかかわらず」は「〜であるのに、〜なのに（逆接）」という意味で、予想に反する事態を述べる。「にもかかわらず」は書き言葉的で改まった表現。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に伴って',         false, 1),
  ('にもかかわらず',   true,  2),
  ('を通じて',         false, 3),
  ('に反して',         false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q15 【意味問題】ようとしない — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「彼は何度頼んでも謝ろうとしない」の「ようとしない」が表すニュアンスはどれか。',
    'grammar', 'N2', 1, true,
    '「〜ようとしない」は「〜しようという意志・意欲を持っていない、〜することを拒んでいる」という意味。主語の意志的な拒絶を表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('謝る必要がないという意味',         false, 1),
  ('謝ることができないという意味',     false, 2),
  ('謝る気持ちがないという意味',       true,  3),
  ('謝った後どうするかという意味',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q16 【空欄補充】に応じて — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '料金はご利用時間（　　）異なりますので、ご確認ください。',
    'grammar', 'N2', 1, true,
    '「に応じて」は「〜に合わせて、〜に基づいて変化する」という意味。条件・状況・要求に対応した変化や対処を表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にとって',   false, 1),
  ('に対して',   false, 2),
  ('について',   false, 3),
  ('に応じて',   true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q17 【意味問題】からすれば — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「経験者からすれば、この作業は簡単に見えるだろう」の「からすれば」はどういう意味か。',
    'grammar', 'N2', 1, true,
    '「からすれば（からすると）」は「〜の立場・観点・判断基準から見ると」という意味。ある人や状況の視点に立って推測・評価するときに使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('経験者の立場から見ると',   true,  1),
  ('経験者のおかげで',         false, 2),
  ('経験者に対して',           false, 3),
  ('経験者によって異なるが',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q18 【空欄補充】からには — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'チームのリーダーを引き受けた（　　）、全力で取り組むつもりだ。',
    'grammar', 'N2', 1, true,
    '「からには」は「〜した以上は、〜した事実があるのだから当然〜する」という意味。ある事実を前提に、話者の決意や義務・当然の結論を述べる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ことで',     false, 1),
  ('からには',   true,  2),
  ('ことから',   false, 3),
  ('ものの',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q19 【文脈選択】ことにする vs ことになる — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '会議の結果、プロジェクトを来月から開始する（　　）。（自分の意志ではなく、外部の決定による）',
    'grammar', 'N2', 1, true,
    '「ことになる」は外部の事情・決定・規則によって結果がそうなることを表す。一方「ことにする」は自分の意志で決めることを表す。設問の括弧内の指示に従い「ことになった」が正解。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ことにした',   false, 1),
  ('ようにした',   false, 2),
  ('ことになった', true,  3),
  ('ようになった', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q20 【意味問題】にとって — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「子供にとって、遊びは学びの場である」の「にとって」の働きはどれか。',
    'grammar', 'N2', 1, true,
    '「にとって」は「〜の立場・観点からすると」という意味で、評価や判断の主体を示す。「にとって」の前には評価・判断をする人・集団・立場が来る。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('子供に関係なく',               false, 1),
  ('子供のおかげで',               false, 2),
  ('子供を対象として',             false, 3),
  ('子供の立場・視点から見ると',   true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q21 【空欄補充】にとどまらず — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'その問題は国内（　　）、国際社会全体に影響を与えている。',
    'grammar', 'N2', 1, true,
    '「にとどまらず」は「〜だけでなく、〜の範囲を超えて」という意味。「にとどまる（留まる）」の否定で、あるカテゴリを超えた広がりを表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にとどまらず', true,  1),
  ('において',     false, 2),
  ('にかけて',     false, 3),
  ('に際して',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q22 【文脈選択】によって（手段・原因） — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'この橋は100年前に地域の人々（　　）建設されたものだ。',
    'grammar', 'N2', 1, true,
    '受け身文で動作の行為者を示す場合は「によって」を使う。「に」は直接の相手を示すが、「によって」は間接的・制度的・集団的な行為者を示す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('を通して',   false, 1),
  ('によって',   true,  2),
  ('に対して',   false, 3),
  ('をもとに',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q23 【空欄補充】によると — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '天気予報（　　）、明日は全国的に晴れるらしい。',
    'grammar', 'N2', 1, true,
    '「によると（によれば）」は「〜という情報源から得た情報では」という意味の伝聞表現。情報の出所を明示する際に使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にとって',   false, 1),
  ('に対して',   false, 2),
  ('によると',   true,  3),
  ('によって',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q24 【文脈選択】として — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '彼女はエンジニア（　　）、その会社に入社した。',
    'grammar', 'N2', 1, true,
    '「として」は「〜の資格・立場・役割で」という意味。身分や役職として何かを行う場合に使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にとって',   false, 1),
  ('において',   false, 2),
  ('に対して',   false, 3),
  ('として',     true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q25 【空欄補充】ことで — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    'チームで情報を共有する（　　）、ミスを大幅に減らすことができた。',
    'grammar', 'N2', 1, true,
    '「ことで」は「〜という行為・手段によって」という意味で、動詞辞書形に接続する。原因・手段として機能し、結果を導く。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ことで',       true,  1),
  ('ことから',     false, 2),
  ('ことなく',     false, 3),
  ('ことには',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q26 【意味問題】ものか — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「あんな失礼な人に、また頼むものか」の「ものか」が表すニュアンスはどれか。',
    'grammar', 'N2', 1, true,
    '「〜ものか（ものですか）」は話者の強い否定・拒絶の意志を表す。「絶対に〜しない」という感情的な断定。口語では「もんか」とも言う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('頼む可能性がある',         false, 1),
  ('絶対に頼まないという決意', true,  2),
  ('頼んだほうがよいという提案', false, 3),
  ('頼むかどうかわからない',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q27 【空欄補充】だけあって — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '10年以上海外で働いていた（　　）、英語がとても流暢だ。',
    'grammar', 'N2', 1, true,
    '「だけあって」は「〜にふさわしく、〜であるからこそ当然」という意味。前件が理由・根拠となり、後件の結果が自然に納得できることを表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('せいか',       false, 1),
  ('ものの',       false, 2),
  ('だけあって',   true,  3),
  ('くせに',       false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q28 【文脈選択】まま — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '靴を履いた（　　）、部屋に上がらないでください。',
    'grammar', 'N2', 1, true,
    '「〜たまま」は「〜した状態が変化せずに続いている」という意味。ある動作・状態が維持されたままで次の行動をする、または望ましくない状態が放置されることを表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('なので',   false, 1),
  ('ために',   false, 2),
  ('ところを', false, 3),
  ('まま',     true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q29 【意味問題】ずにはいられない — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「その映像を見て、涙せずにはいられなかった」の「ずにはいられなかった」が表すことはどれか。',
    'grammar', 'N2', 1, true,
    '「〜ずにはいられない」は「〜しないではいられない、どうしても〜してしまう」という意味。感情や衝動を抑えられない状況を表す。「ないではいられない」とほぼ同義。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('どうしても涙が出てしまった',   true,  1),
  ('泣かないようにした',           false, 2),
  ('泣くことができなかった',       false, 3),
  ('泣いてはいけないと思った',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q30 【空欄補充】ていく vs てくる — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '少子化の問題は今後さらに深刻化し（　　）だろう。',
    'grammar', 'N2', 1, true,
    '「ていく」は現在から未来にかけて変化・移行が進む様子を表す。「てくる」は過去から現在へ向かう変化を表す。未来の変化予測には「ていく」を使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('てきた',   false, 1),
  ('ていく',   true,  2),
  ('ている',   false, 3),
  ('ていた',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q31 【文脈選択】てしまう（後悔・完了） — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '大切なデータをうっかり削除（　　）、バックアップも取っていなかった。',
    'grammar', 'N2', 1, true,
    '「てしまう」は①動作の完了②話者の後悔・残念な気持ちを表す。この文では「うっかり〜してしまった」という後悔のニュアンスを強調している。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('するものの',   false, 1),
  ('するところを', false, 2),
  ('してしまい',   true,  3),
  ('したばかりに', false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q32 【空欄補充】ものの — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '資格は取った（　　）、実務ではなかなか活かせていない。',
    'grammar', 'N2', 1, true,
    '「ものの」は「〜だが、しかし」という逆接の接続助詞。前件の事実を認めつつ、後件で期待外れの結果を述べる。「〜けれども」より書き言葉的。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ことで',   false, 1),
  ('ことから', false, 2),
  ('ために',   false, 3),
  ('ものの',   true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q33 【意味問題】てくる（過去から現在への変化） — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「この10年でスマートフォンの普及率は急速に上がってきた」の「てきた」が示す意味はどれか。',
    'grammar', 'N2', 1, true,
    '「てくる」（変化用法）は過去のある時点から現在に至るまでの変化の経緯を表す。この文では10年間にわたる変化の継続・累積を示している。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('過去から現在にかけて変化が続いてきた', true,  1),
  ('これから先も上がり続けるだろう',       false, 2),
  ('急に上がり始めた',                     false, 3),
  ('いつか上がると予想される',             false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q34 【空欄補充】ことから — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '葉の形が手のひらに似ている（　　）、この植物は「テガタ草」と呼ばれる。',
    'grammar', 'N2', 1, true,
    '「ことから」は「〜という事実・理由から（判断・命名・結論が導かれる）」という意味。根拠を述べ、そこから導かれる判断や名称の由来を説明する。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に基づいて', false, 1),
  ('ことから',   true,  2),
  ('ために',     false, 3),
  ('ことで',     false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q35 【文脈選択】に反して vs に基づいて — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '周囲の予想（　　）、その新製品は発売直後から大ヒットした。',
    'grammar', 'N2', 1, true,
    '「に反して」は「〜に逆らって、〜とは反対に」という意味で、予想・期待・規則などに反する実態を述べる。「予想に反して」は典型的な使い方。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に沿って',   false, 1),
  ('に基づいて', false, 2),
  ('に反して',   true,  3),
  ('に応じて',   false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q36 【意味問題】において（場所・分野） — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '「現代社会において、情報リテラシーは必須スキルだ」の「において」を別の言葉に言い換えるとしたら、最も近いものはどれか。',
    'grammar', 'N2', 1, true,
    '「において」は「〜で、〜の分野・場面では」という意味の格式的な表現。口語の「で」や「では」に相当し、場所・時代・分野・状況を表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にとって',   false, 1),
  ('に対して',   false, 2),
  ('によって',   false, 3),
  ('では',       true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q37 【空欄補充】に沿って — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000002-0000-0000-0000-000000000001',
    'multiple_choice',
    '計画（　　）作業を進めれば、期日までに完成できるはずだ。',
    'grammar', 'N2', 1, true,
    '「に沿って（に沿う）」は「〜に従って、〜に合わせて」という意味で、計画・方針・ガイドラインなどに従った行動を示す。「に基づいて」が根拠・土台を強調するのに対し、「に沿って」は方向性・路線に合わせる意味が強い。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に沿って',   true,  1),
  ('にとって',   false, 2),
  ('をめぐって', false, 3),
  ('に際して',   false, 4)
) AS t(txt, ok, so);
