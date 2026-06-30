-- fix_set2_mondai7_20260629.sql
-- Set2 問題7「文章の文法」5問を正しい構造（1文章・5空欄）に差し替える
-- 旧: AI労働(3問)+芸術(2問) の2文章構造 → 新: 高齢化社会と世代間のつながり(1文章)
-- 対象 set_id: aa000001-0000-0000-0000-000000000012
-- 対象 quiz_id: ad000001-0000-0000-0000-000000000121
-- sort_order 41〜45

BEGIN;

-- ===== 既存 Set2 問題7 5問を削除 (quiz_question_options / jlpt_mock_set_questions は CASCADE) =====
DELETE FROM quiz_questions WHERE id IN (
  'aee20041-0000-0000-0000-000000000002',
  'aee20042-0000-0000-0000-000000000002',
  'aee20043-0000-0000-0000-000000000002',
  'aee20044-0000-0000-0000-000000000002',
  'aee20045-0000-0000-0000-000000000002'
);

-- ===== 問題7 文章の文法 1/5 (sort_order=41) =====
-- 正答: 今や (副詞 — 現在の状況を強調)
-- 誤答: いまだに(否定的持続)／ようやく(ポジティブな到達)／かつて(過去を指し現在時制と矛盾)
WITH q AS (
  INSERT INTO quiz_questions (
    id, quiz_id, question_type, question_category, question_text, points, is_published
  )
  VALUES (
    gen_random_uuid(),
    'ad000001-0000-0000-0000-000000000121',
    'multiple_choice',
    'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　高齢化が急速に進む現代日本において、世代間のつながりは（ 41 ）大きな社会的課題となっている。少子化と並行して進む高齢化は、社会保障制度の持続可能性に疑問符を投げかけるだけでなく、地域コミュニティの活力をも蝕んでいる。
　かつて三世代同居が当たり前（ 42 ）、祖父母から孫へと知恵や文化が自然と受け継がれていた。しかし今やその連鎖は断ち切られ、高齢者は孤立し、若い世代は育児の不安を一人で抱え込む構図が定着しつつある。世代間に、目に見えない壁が生まれているのだ。
　（ 43 ）、各地でこの壁を取り除こうとする動きが広がっている。空き家を活用した多世代型シェアハウスや、高齢者が育児に関わるコミュニティカフェなど、制度の枠を超えた「緩やかなつながり」が模索されている。こうした取り組みは、行政や法制度が手の届かない部分を、人と人との関係性によって補おうとするものに（ 44 ）。
　重要なのは、どちらか一方が支えるのではなく、互いの強みを（ 45 ）関係を築いていくことではないだろうか。高齢者の豊かな経験と若者の柔軟な感性が交わるとき、社会全体に新たな活力が生まれるはずだ。

（ 41 ）に入れるのに最もよいものを選びなさい。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$いまだに$Q$, false, 1),
      ($Q$今や$Q$,     true,  2),
      ($Q$ようやく$Q$, false, 3),
      ($Q$かつて$Q$,   false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', id, 'gengo_chishiki', 41 FROM q;

-- ===== 問題7 文章の文法 2/5 (sort_order=42) =====
-- 正答: だった頃は (時の節 — 「かつて〜だった頃は、〜受け継がれていた」)
-- 誤答: であれば(仮定)／だとしても(逆接仮定)／にしては(対比・程度)
WITH q AS (
  INSERT INTO quiz_questions (
    id, quiz_id, question_type, question_category, question_text, points, is_published
  )
  VALUES (
    gen_random_uuid(),
    'ad000001-0000-0000-0000-000000000121',
    'multiple_choice',
    'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　高齢化が急速に進む現代日本において、世代間のつながりは（ 41 ）大きな社会的課題となっている。少子化と並行して進む高齢化は、社会保障制度の持続可能性に疑問符を投げかけるだけでなく、地域コミュニティの活力をも蝕んでいる。
　かつて三世代同居が当たり前（ 42 ）、祖父母から孫へと知恵や文化が自然と受け継がれていた。しかし今やその連鎖は断ち切られ、高齢者は孤立し、若い世代は育児の不安を一人で抱え込む構図が定着しつつある。世代間に、目に見えない壁が生まれているのだ。
　（ 43 ）、各地でこの壁を取り除こうとする動きが広がっている。空き家を活用した多世代型シェアハウスや、高齢者が育児に関わるコミュニティカフェなど、制度の枠を超えた「緩やかなつながり」が模索されている。こうした取り組みは、行政や法制度が手の届かない部分を、人と人との関係性によって補おうとするものに（ 44 ）。
　重要なのは、どちらか一方が支えるのではなく、互いの強みを（ 45 ）関係を築いていくことではないだろうか。高齢者の豊かな経験と若者の柔軟な感性が交わるとき、社会全体に新たな活力が生まれるはずだ。

（ 42 ）に入れるのに最もよいものを選びなさい。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$だった頃は$Q$, true,  1),
      ($Q$であれば$Q$,   false, 2),
      ($Q$だとしても$Q$, false, 3),
      ($Q$にしては$Q$,   false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', id, 'gengo_chishiki', 42 FROM q;

-- ===== 問題7 文章の文法 3/5 (sort_order=43) =====
-- 正答: こうした中 (文脈承継+新展開導入 — 壁が生まれているという状況を受けて)
-- 誤答: とはいえ(譲歩後の転換)／なおかつ(追加・累加)／それどころか(強い反転・escalation)
WITH q AS (
  INSERT INTO quiz_questions (
    id, quiz_id, question_type, question_category, question_text, points, is_published
  )
  VALUES (
    gen_random_uuid(),
    'ad000001-0000-0000-0000-000000000121',
    'multiple_choice',
    'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　高齢化が急速に進む現代日本において、世代間のつながりは（ 41 ）大きな社会的課題となっている。少子化と並行して進む高齢化は、社会保障制度の持続可能性に疑問符を投げかけるだけでなく、地域コミュニティの活力をも蝕んでいる。
　かつて三世代同居が当たり前（ 42 ）、祖父母から孫へと知恵や文化が自然と受け継がれていた。しかし今やその連鎖は断ち切られ、高齢者は孤立し、若い世代は育児の不安を一人で抱え込む構図が定着しつつある。世代間に、目に見えない壁が生まれているのだ。
　（ 43 ）、各地でこの壁を取り除こうとする動きが広がっている。空き家を活用した多世代型シェアハウスや、高齢者が育児に関わるコミュニティカフェなど、制度の枠を超えた「緩やかなつながり」が模索されている。こうした取り組みは、行政や法制度が手の届かない部分を、人と人との関係性によって補おうとするものに（ 44 ）。
　重要なのは、どちらか一方が支えるのではなく、互いの強みを（ 45 ）関係を築いていくことではないだろうか。高齢者の豊かな経験と若者の柔軟な感性が交わるとき、社会全体に新たな活力が生まれるはずだ。

（ 43 ）に入れるのに最もよいものを選びなさい。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$とはいえ$Q$,     false, 1),
      ($Q$こうした中$Q$,   true,  2),
      ($Q$なおかつ$Q$,     false, 3),
      ($Q$それどころか$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', id, 'gengo_chishiki', 43 FROM q;

-- ===== 問題7 文章の文法 4/5 (sort_order=44) =====
-- 正答: ほかならない (「〜するものにほかならない」— 本質・同一性の断言)
-- 誤答: にすぎない(矮小化・価値低下)／になりかねない(否定的潜在性)／に相違ない(確信の表明のみ、同一性主張なし)
WITH q AS (
  INSERT INTO quiz_questions (
    id, quiz_id, question_type, question_category, question_text, points, is_published
  )
  VALUES (
    gen_random_uuid(),
    'ad000001-0000-0000-0000-000000000121',
    'multiple_choice',
    'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　高齢化が急速に進む現代日本において、世代間のつながりは（ 41 ）大きな社会的課題となっている。少子化と並行して進む高齢化は、社会保障制度の持続可能性に疑問符を投げかけるだけでなく、地域コミュニティの活力をも蝕んでいる。
　かつて三世代同居が当たり前（ 42 ）、祖父母から孫へと知恵や文化が自然と受け継がれていた。しかし今やその連鎖は断ち切られ、高齢者は孤立し、若い世代は育児の不安を一人で抱え込む構図が定着しつつある。世代間に、目に見えない壁が生まれているのだ。
　（ 43 ）、各地でこの壁を取り除こうとする動きが広がっている。空き家を活用した多世代型シェアハウスや、高齢者が育児に関わるコミュニティカフェなど、制度の枠を超えた「緩やかなつながり」が模索されている。こうした取り組みは、行政や法制度が手の届かない部分を、人と人との関係性によって補おうとするものに（ 44 ）。
　重要なのは、どちらか一方が支えるのではなく、互いの強みを（ 45 ）関係を築いていくことではないだろうか。高齢者の豊かな経験と若者の柔軟な感性が交わるとき、社会全体に新たな活力が生まれるはずだ。

（ 44 ）に入れるのに最もよいものを選びなさい。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$にすぎない$Q$,   false, 1),
      ($Q$ほかならない$Q$, true,  2),
      ($Q$になりかねない$Q$, false, 3),
      ($Q$に相違ない$Q$,   false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', id, 'gengo_chishiki', 44 FROM q;

-- ===== 問題7 文章の文法 5/5 (sort_order=45) =====
-- 正答: 活かし合う (互いの「強み」を発揮し合う — テーマ「双方向的な共生」に合致)
-- 誤答: 補い合う(弱点の補完に焦点、強みではない)／競い合う(対立ニュアンス)／依存し合う(一方向的支援の否定に反する)
WITH q AS (
  INSERT INTO quiz_questions (
    id, quiz_id, question_type, question_category, question_text, points, is_published
  )
  VALUES (
    gen_random_uuid(),
    'ad000001-0000-0000-0000-000000000121',
    'multiple_choice',
    'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　高齢化が急速に進む現代日本において、世代間のつながりは（ 41 ）大きな社会的課題となっている。少子化と並行して進む高齢化は、社会保障制度の持続可能性に疑問符を投げかけるだけでなく、地域コミュニティの活力をも蝕んでいる。
　かつて三世代同居が当たり前（ 42 ）、祖父母から孫へと知恵や文化が自然と受け継がれていた。しかし今やその連鎖は断ち切られ、高齢者は孤立し、若い世代は育児の不安を一人で抱え込む構図が定着しつつある。世代間に、目に見えない壁が生まれているのだ。
　（ 43 ）、各地でこの壁を取り除こうとする動きが広がっている。空き家を活用した多世代型シェアハウスや、高齢者が育児に関わるコミュニティカフェなど、制度の枠を超えた「緩やかなつながり」が模索されている。こうした取り組みは、行政や法制度が手の届かない部分を、人と人との関係性によって補おうとするものに（ 44 ）。
　重要なのは、どちらか一方が支えるのではなく、互いの強みを（ 45 ）関係を築いていくことではないだろうか。高齢者の豊かな経験と若者の柔軟な感性が交わるとき、社会全体に新たな活力が生まれるはずだ。

（ 45 ）に入れるのに最もよいものを選びなさい。$Q$,
    1,
    true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$補い合う$Q$,   false, 1),
      ($Q$競い合う$Q$,   false, 2),
      ($Q$活かし合う$Q$, true,  3),
      ($Q$依存し合う$Q$, false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000012', id, 'gengo_chishiki', 45 FROM q;

COMMIT;
