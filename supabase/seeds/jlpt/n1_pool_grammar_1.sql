-- encoding: UTF-8
-- N1 文法モデル問題プール (オリジナル出題) 37問
-- 対象テーブル: quiz_questions / quiz_question_options
-- quiz_id: bb000001-0000-0000-0000-000000000001 (N1 文法テスト拡充)
-- 作成日: 2026-06-26
-- 問題形式: ①空欄補充 ②文法パターンの意味 ③文脈上の文法選択
-- 正答位置分布: 1番=10問, 2番=10問, 3番=9問, 4番=8問 (計37問)
-- 使用パターン: ともなると, にあって, きらいがある, を余儀なくされる,
--   べくもない, ないではすまない, が早いか, たりとも〜ない, といえども,
--   をもってしても, ずにはおかない, に足る, ならではの, に即して,
--   をよそに, とあれば, いかんによっては, ないまでも, てやまない,
--   ことなしに, に至っては, のみならず, を皮切りに, かたわら,
--   てはじめて, はさておき, もさることながら, をおいて〜ない,
--   すら〜ない, とは裏腹に, いかんにかかわらず, に先んじて,
--   とばかりに, をものともせず, だに〜ない, げ(様態識別), というまでもなく

-- ============================================================
-- Q1 【空欄補充】ともなると — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '部長（　　）、部下の失敗に対して責任を取らなければならない。',
    'grammar', 'N1', 1, true,
    '「ともなると」は「〜のような立場・段階になると、当然〜だ」という意味で、ある役職や状態になれば自然とそうなるという必然性を表す。「部長ともなると＝部長という立場になれば当然」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ともなると',    true,  1),
  ('といえば',      false, 2),
  ('とはいえ',      false, 3),
  ('にかわって',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q2 【意味問題】にあって — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「激動の時代にあって、彼は冷静さを保ち続けた」の「にあって」の意味として最も適切なものはどれか。',
    'grammar', 'N1', 1, true,
    '「にあって」は「〜という状況・環境・立場において」という意味の書き言葉表現。「時代にあって」＝「その時代という状況の中で」。「において」と置き換え可能だが、より格調ある文語的なニュアンスを持つ。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜から離れて',            false, 1),
  ('〜という状況の中で',      true,  2),
  ('〜になろうとして',        false, 3),
  ('〜にもかかわらず',        false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q3 【空欄補充】きらいがある — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '彼は議論になると感情的になる（　　）。周囲も気をつけて話しかけるようにしている。',
    'grammar', 'N1', 1, true,
    '「きらいがある」は「好ましくない傾向・癖がある」という意味の慣用的な文語表現。「感情的になるきらいがある」＝「感情的になりがちな傾向がある」。マイナス評価の傾向を婉曲的に述べる場合に用いる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('おそれがある',    false, 1),
  ('ことがある',      false, 2),
  ('きらいがある',    true,  3),
  ('ばかりがある',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q4 【文脈選択】を余儀なくされる — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '突然の台風接近により、主催者はイベントの中止（　　）。',
    'grammar', 'N1', 1, true,
    '「を余儀なくされる」は「やむを得ず〜させられる」「外部の事情によって〜せざるを得ない状況にさせられる」という意味。受け身的なニュアンスが強く、自ら望んでではなく状況に強いられたことを表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('を求められた',          false, 1),
  ('を禁止された',          false, 2),
  ('を推奨された',          false, 3),
  ('を余儀なくされた',      true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q5 【意味問題】べくもない — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「失われた信頼を取り戻すべくもなかった」の「べくもない」の意味として正しいものはどれか。',
    'grammar', 'N1', 1, true,
    '「べくもない」は「〜することは到底できない」「〜する余地がない」という強い否定・不可能を表す文語表現。「取り戻すべくもない」＝「取り戻すことなどとてもできない」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜することは到底できない',      true,  1),
  ('〜するつもりはない',            false, 2),
  ('〜しなくてもよい',              false, 3),
  ('〜するかどうかわからない',      false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q6 【空欄補充】ないではすまない — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '公的資金を不正に使用したとなれば、当然説明責任を果たさ（　　）。',
    'grammar', 'N1', 1, true,
    '「ないではすまない」は「〜しないと社会的・道義的に許されない、〜せざるを得ない」という意味。外部からの圧力や道義的義務によって、そうしないと済まないというニュアンスを持つ。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ずにはおかない',              false, 1),
  ('ないではすまない',            true,  2),
  ('ないわけにはいかない',        false, 3),
  ('なければならない',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q7 【意味問題】が早いか — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「チャイムが鳴るが早いか、生徒たちは教室を飛び出した」の「が早いか」が表すニュアンスはどれか。',
    'grammar', 'N1', 1, true,
    '「が早いか」は「〜するとほぼ同時に、即座に〜した」という意味。後件の行動が非常に素早く起きたことを強調する。「やいなや」とほぼ同義だが、「が早いか」はより瞬時・反射的なニュアンスが強い。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜するよりも前に',                false, 1),
  ('〜するかどうかわからないうちに',  false, 2),
  ('〜するとほぼ同時に即座に',        true,  3),
  ('〜しながら同時に',                false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q8 【空欄補充】たりとも〜ない — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '試験中は一秒（　　）無駄にできないと感じ、全問に集中した。',
    'grammar', 'N1', 1, true,
    '「たりとも〜ない」は「たとえ〜であっても〜できない／してはならない」という意味で、最小の単位を例に挙げて全否定を強調する表現。「一秒たりとも」＝「わずか一秒でさえも」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('にして',        false, 1),
  ('のみ',          false, 2),
  ('だけでも',      false, 3),
  ('たりとも',      true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q9 【文脈選択】といえども — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '専門家（　　）、この分野のすべての問いに答えられるわけではない。',
    'grammar', 'N1', 1, true,
    '「といえども」は「〜であっても、〜だからといって」という意味の逆接表現。格式ある文語表現で、「たとえ〜であっても例外なく」という含意がある。「専門家といえども」＝「専門家であってさえも」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('といえども',      true,  1),
  ('とはいえ',        false, 2),
  ('とはいうものの',  false, 3),
  ('だからこそ',      false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q10 【意味問題】をもってしても — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「最新の医療技術をもってしても、その病気は治せなかった」の「をもってしても」が表す内容はどれか。',
    'grammar', 'N1', 1, true,
    '「をもってしても」は「〜という高い能力・手段を使ってさえも〜できない」という意味。最善の手段でも不可能だという驚きや残念さを強調する。「最新技術をもってしても」＝「最新技術を使ったとしても」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜を使う前には',                      false, 1),
  ('〜という手段を用いてさえも',          true,  2),
  ('〜を使い終わった後でも',              false, 3),
  ('〜のおかげで初めて',                  false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q11 【空欄補充】ずにはおかない — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'あの映画の結末は観る者を感動させ（　　）。多くの人が涙を流したという。',
    'grammar', 'N1', 1, true,
    '「ずにはおかない」は「必ず〜させる、〜しないではいられない状況を引き起こす」という意味。主語が物・事の場合は「〜せずにはおかない力がある」という強い影響力を表す。「感動させずにはおかない」＝「必ず感動させてしまう」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ないではおさまらない',      false, 1),
  ('ないではすまない',          false, 2),
  ('ずにはおかない',            true,  3),
  ('ないことはない',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q12 【意味問題】に足る — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「信頼するに足る証拠が提示された」の「に足る」の意味として正しいものはどれか。',
    'grammar', 'N1', 1, true,
    '「に足る」は「〜するのに十分な価値・資格・根拠がある」という意味の文語表現。「信頼するに足る」＝「信頼するのに十分な」。「〜に足りない」とすると「十分でない」の意味になる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜する必要がある',              false, 1),
  ('〜するのが難しい',              false, 2),
  ('〜することを避けられない',      false, 3),
  ('〜するのに十分な価値がある',    true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q13 【空欄補充】ならではの — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'この料理は地元（　　）食材をふんだんに使った一品だ。他では味わえない。',
    'grammar', 'N1', 1, true,
    '「ならではの」は「〜にしかできない、〜に特有の」という意味で、その対象だけが持つ独自性・特別さを強調する表現。「地元ならではの食材」＝「地元にしかない、地元特有の食材」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ならではの',    true,  1),
  ('ならぬ',        false, 2),
  ('ゆえの',        false, 3),
  ('だけに',        false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q14 【文脈選択】に即して — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '新しい規定（　　）、業務の手順を見直すことになった。',
    'grammar', 'N1', 1, true,
    '「に即して」は「〜に合わせて、〜に基づいて、〜に沿って」という意味。基準・規則・実態などに合わせて行動することを表す。「規定に即して」＝「規定に沿って、規定を基準にして」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に反して',      false, 1),
  ('に即して',      true,  2),
  ('にあわせて',    false, 3),
  ('にわたって',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q15 【意味問題】をよそに — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「周囲の心配をよそに、彼女は単身海外へ渡った」の「をよそに」の意味はどれか。',
    'grammar', 'N1', 1, true,
    '「をよそに」は「〜を無視して、〜を気にかけずに」という意味。周囲の状況や感情を無関係なこととして扱い、自分の行動をとるニュアンスを持つ。やや批判的・意外なニュアンスが含まれることが多い。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜のおかげで',            false, 1),
  ('〜に応えようとして',      false, 2),
  ('〜を気にせずに',          true,  3),
  ('〜を原因として',          false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q16 【空欄補充】とあれば — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '子どもの夢を叶えるため（　　）、どんな苦労も惜しまないと親は語った。',
    'grammar', 'N1', 1, true,
    '「とあれば」は「〜という条件・目的があるならば、そのためなら」という意味。その目的・条件を強く受け入れ、それに応じた行動をとる強い意志を表す。「子どもの夢のためとあれば」＝「子どもの夢のためという状況であれば」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('とすれば',      false, 1),
  ('となれば',      false, 2),
  ('ならいざ知らず', false, 3),
  ('とあれば',      true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q17 【意味問題】いかんによっては — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「交渉の結果いかんによっては、計画全体を見直す必要がある」の「いかんによっては」の意味はどれか。',
    'grammar', 'N1', 1, true,
    '「いかんによっては」は「〜の内容・結果・状態次第では」という意味。結果が確定していない段階で、その内容によって対応が変わる可能性を示す。「結果いかんによっては」＝「結果がどうであるかによっては」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜の結果・内容次第では',          true,  1),
  ('〜にもかかわらず',                false, 2),
  ('〜の結果どおりに',                false, 3),
  ('〜が終わり次第すぐに',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q18 【空欄補充】ないまでも — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '完璧（　　）、せめて及第点には届くようなレポートを提出してほしい。',
    'grammar', 'N1', 1, true,
    '「ないまでも」は「〜とまではいかなくても、せめて」という意味。理想の水準には達しなくてもよいが、最低限のラインは守ってほしいという妥協的な要求を表す。「完璧でないまでも」＝「完璧でなくてもよいが」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ではないが',        false, 1),
  ('でないまでも',      true,  2),
  ('でなければ',        false, 3),
  ('ではあるまいし',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q19 【文脈選択】てやまない — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '次の文の（　　）に入る最も適切な表現を選びなさい。「彼の今後の活躍を期待し（　　）」',
    'grammar', 'N1', 1, true,
    '「てやまない」は「ずっと〜し続けている、強く〜している」という意味で、感情の継続・強さを表す。「期待してやまない」＝「ずっと強く期待し続けている」。「願ってやまない」「愛してやまない」なども同様。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('てばかりいる',      false, 1),
  ('てたまらない',      false, 2),
  ('てやまない',        true,  3),
  ('てしょうがない',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q20 【意味問題】ことなしに — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「努力することなしに、成功はあり得ない」の「ことなしに」の意味として正しいものはどれか。',
    'grammar', 'N1', 1, true,
    '「ことなしに」は「〜しないで、〜せずに」という意味で、あることをしないまま別のことが起きるという条件を表す。「努力することなしに」＝「努力をしないで、努力を経ずに」。書き言葉的な表現。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜することで',          false, 1),
  ('〜することによって',    false, 2),
  ('〜することがあれば',    false, 3),
  ('〜しないで・せずに',    true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q21 【空欄補充】に至っては — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'チームの多くが疲弊していたが、リーダー（　　）倒れてしまった。これ以上続けるのは無理だ。',
    'grammar', 'N1', 1, true,
    '「に至っては」は「〜という極端な例を取り上げると、特にひどい状況だ」という意味。話の流れの中で、最も程度が著しい例を強調して取り上げる表現。驚きや批判のニュアンスを伴うことが多い。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に至っては',        true,  1),
  ('にかけては',        false, 2),
  ('に対しては',        false, 3),
  ('をはじめ',          false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q22 【文脈選択】のみならず — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'この製品は国内市場（　　）、海外でも高い評価を受けている。',
    'grammar', 'N1', 1, true,
    '「のみならず」は「〜だけでなく、〜に加えて」という意味の書き言葉的な付加表現。「はもちろん」「だけでなく」より格式が高く、公式の文章でよく使われる。「国内のみならず」＝「国内だけでなく」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('においても',        false, 1),
  ('のみならず',        true,  2),
  ('をはじめとする',    false, 3),
  ('に限って',          false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q23 【意味問題】を皮切りに — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「東京公演を皮切りに、全国ツアーが始まった」の「を皮切りに」の意味として最も適切なものはどれか。',
    'grammar', 'N1', 1, true,
    '「を皮切りに」は「〜を最初の機会として、その後次々と〜が始まった」という意味。一連の活動・イベントの最初のきっかけとなった出来事を示す表現。「東京公演を皮切りに」＝「東京公演を最初のスタートとして」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜をきっかけに終わりにして',          false, 1),
  ('〜と同時並行で',                      false, 2),
  ('〜を最初のスタートとして次々に',      true,  3),
  ('〜の記念として単発で',                false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q24 【空欄補充】かたわら — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '彼女は会社員として働く（　　）、週末は地域の子どもたちに絵を教えているそうだ。',
    'grammar', 'N1', 1, true,
    '「かたわら」は「〜する一方で、〜しながらも別のことをする」という意味。本業・主な活動と並行して別の活動も継続していることを表す。「働くかたわら」＝「働きながらも並行して」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('ついでに',      false, 1),
  ('うえで',        false, 2),
  ('とともに',      false, 3),
  ('かたわら',      true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q25 【意味問題】てはじめて — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「親になってはじめて、親のありがたさがわかる」の「てはじめて」が表す意味はどれか。',
    'grammar', 'N1', 1, true,
    '「てはじめて」は「〜という経験・状況を経て、初めてそのことがわかる・可能になる」という意味。その経験なしには気づけなかった、経験して初めて実感できるという因果関係を表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜という経験を通じて初めてわかる',        true,  1),
  ('〜するたびに改めて気づく',                false, 2),
  ('〜する前の段階からすでに理解していた',    false, 3),
  ('〜しながら同時に気づいていく',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q26 【空欄補充】はさておき — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '費用の問題（　　）、まずはプロジェクトの実現可能性を検討しましょう。',
    'grammar', 'N1', 1, true,
    '「はさておき」は「〜は一旦後回しにして、〜は置いておいて」という意味。重要ではあるが今は触れず、別の話題・問題に移ることを示す。「費用はさておき」＝「費用の件は今は脇に置いて」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('はともかくとして',      false, 1),
  ('はさておき',            true,  2),
  ('はおくとして',          false, 3),
  ('はともかく',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q27 【文脈選択】もさることながら — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'この旅館は料理（　　）、部屋からの眺めが格別だと評判だ。',
    'grammar', 'N1', 1, true,
    '「もさることながら」は「〜はもちろんのこと、それ以上に〜も」という意味。前に来る要素も優れているが、後ろの要素の方がより注目に値するというニュアンスを表す。「料理もさることながら」＝「料理も素晴らしいが、それ以上に」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('はともかく',            false, 1),
  ('はいうまでもなく',      false, 2),
  ('もさることながら',      true,  3),
  ('だけでなく',            false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q28 【意味問題】をおいて〜ない — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「この仕事を任せられる人は、彼をおいてほかにいない」の「をおいて」の意味はどれか。',
    'grammar', 'N1', 1, true,
    '「をおいて〜ない」は「〜以外には〜ない、〜しか〜ない」という意味で、ある対象が唯一無二であることを強調する表現。「彼をおいてほかにいない」＝「彼以外にこの仕事に適した人はいない」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜を除いて考えれば',            false, 1),
  ('〜を参考にしながら',            false, 2),
  ('〜と比べると最も劣っている',    false, 3),
  ('〜以外にはない、唯一だ',        true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q29 【空欄補充】すら〜ない — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '締め切りに追われ、昼食を取る時間（　　）なかった。',
    'grammar', 'N1', 1, true,
    '「すら」は「〜でさえ」という意味の副助詞で、最低限の例を挙げて全否定・強調を表す。「〜すら〜ない」＝「〜でさえもない」。「昼食の時間すらなかった」＝「昼食の時間でさえも確保できなかった」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('すら',      true,  1),
  ('こそ',      false, 2),
  ('だって',    false, 3),
  ('しか',      false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q30 【意味問題】とは裏腹に — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「外見の強面とは裏腹に、彼は非常に優しい性格だ」の「とは裏腹に」の意味として正しいものはどれか。',
    'grammar', 'N1', 1, true,
    '「とは裏腹に」は「〜と正反対に、〜に反して」という意味。外見や印象と実際の内容・状況が逆であることを表す。「外見とは裏腹に」＝「外見からは想像できないほど逆に」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('〜に加えて',          false, 1),
  ('〜と正反対に',        true,  2),
  ('〜と同様に',          false, 3),
  ('〜を意識しながら',    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q31 【空欄補充】いかんにかかわらず — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '参加者の国籍（　　）、このイベントはすべての人に平等に開かれている。',
    'grammar', 'N1', 1, true,
    '「いかんにかかわらず」は「〜がどのようなものであっても関係なく」という意味で、条件や状況に左右されないことを表す。「国籍いかんにかかわらず」＝「国籍がどの国であっても関係なく」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('によっては',              false, 1),
  ('をとわず',                false, 2),
  ('いかんにかかわらず',      true,  3),
  ('にもよらず',              false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q32 【文脈選択】に先んじて — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '他社（　　）、わが社はAI技術の実用化に取り組んできた。その結果、業界内で優位な立場を築いている。',
    'grammar', 'N1', 1, true,
    '「に先んじて」は「〜より先に、〜に先立って」という意味の書き言葉表現。競争や優先順位の文脈で、他者より先に行動したことを表す。「他社に先んじて」＝「他の会社より先に、他社を出し抜いて」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('に応じて',        false, 1),
  ('を経て',          false, 2),
  ('とともに',        false, 3),
  ('に先んじて',      true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q33 【意味問題】とばかりに — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「待ってましたとばかりに、彼は手を挙げて発言した」の「とばかりに」の意味はどれか。',
    'grammar', 'N1', 1, true,
    '「とばかりに」は「いかにも〜であると言わんばかりに、そういった態度・様子で」という意味。言葉には出さないが、その行動や表情からその気持ちが如実に伝わるニュアンスを表す。「待ってましたとばかりに」＝「待ち構えていたと言わんばかりの勢いで」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('いかにもそうだと言わんばかりの様子で',    true,  1),
  ('〜だと言葉でしっかり伝えながら',          false, 2),
  ('〜だと信じて疑わずに',                    false, 3),
  ('〜だという噂に従って',                    false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q34 【空欄補充】をものともせず — 正答: 2番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '彼女は厳しい批判（　　）、自分の信念を貫き通した。その姿勢に多くの人が感銘を受けた。',
    'grammar', 'N1', 1, true,
    '「をものともせず」は「〜を問題にせず、〜に屈せず」という意味。困難・障害・批判などを意に介さず立ち向かう強い意志・勇気を表す。「批判をものともせず」＝「批判を全く気にせず、物ともしないで」。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('を乗り越えて',        false, 1),
  ('をものともせず',      true,  2),
  ('に負けることなく',    false, 3),
  ('にもめげず',          false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q35 【意味問題】だに〜ない — 正答: 3番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「10年後にこれほどの発展を遂げるとは、当時は想像だにしなかった」の「だにしなかった」の意味はどれか。',
    'grammar', 'N1', 1, true,
    '「だに〜ない」は「〜さえも〜しない」という意味の文語的強調表現。「想像だにしなかった」＝「想像すらしなかった、少しも想像しなかった」。「だに」は「さえ」の文語形で、強い否定・驚きを表す。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('十分に想像していた',                    false, 1),
  ('想像しようとしていた',                  false, 2),
  ('少しも想像しなかった・想像すらしなかった', true,  3),
  ('想像することができた',                  false, 4)
) AS t(txt, ok, so);

-- ============================================================
-- Q36 【文脈選択】〜げ（様態接尾辞の意味識別） — 正答: 4番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '次の文の「〜げ」の用法として、他と異なるものはどれか。①「彼女は悲しげな表情を浮かべた」②「子どもが嬉しげに走り回っている」③「何か言いたげな様子で黙っている」④「病気がちな体質で、よく休む」',
    'grammar', 'N1', 1, true,
    '①②③の「〜げ」は「いかにも〜そうな様子・気配」という様態を表す接尾辞（悲しそうな、嬉しそうに、言いたそうな）。④の「がち」は「〜しやすい・〜になりやすい傾向がある」という意味の別の接尾辞。「〜げ」と「〜がち」は形が似ているが意味が異なる。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('①悲しげな',    false, 1),
  ('②嬉しげに',    false, 2),
  ('③言いたげな',  false, 3),
  ('④病気がちな',  true,  4)
) AS t(txt, ok, so);

-- ============================================================
-- Q37 【意味問題】というまでもなく — 正答: 1番
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, difficulty, points, is_published, explanation)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    '「健康が大切なのはいうまでもなく、日々の生活習慣が重要だ」の「いうまでもなく」の意味として正しいものはどれか。',
    'grammar', 'N1', 1, true,
    '「いうまでもなく／というまでもなく」は「わざわざ言葉にするまでもないほど当然のことだが」という意味。前提として誰もが知っていることを確認しながら、後に続く内容を強調するために使う。'
  )
  RETURNING id
)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q
CROSS JOIN (VALUES
  ('わざわざ言わなくてもわかりきっているが',    true,  1),
  ('言葉では表現できないほどだが',              false, 2),
  ('これから初めて話す内容として',              false, 3),
  ('あえて言えばということだが',                false, 4)
) AS t(txt, ok, so);
