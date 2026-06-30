BEGIN;
-- N1 模擬試験 Set1 文字・語彙 問題2〜4 追加分 (8問)
-- 問題2 文脈規定×5 / 問題3 言い換え類義×2 / 問題4 用法×1


-- ===== 問題2 文脈規定 1/5 (正答:②忌憚) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$会議では、お互いに（　）のない意見を率直に交わすことが望まれた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$偏見$Q$,false,1),($Q$忌憚$Q$,true,2),($Q$固執$Q$,false,3),($Q$躊躇$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 2, '文脈規定' FROM q;

-- ===== 問題2 文脈規定 2/5 (正答:③頓挫) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$その計画は資金難から（　）し、実現されることなく立ち消えになった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$発展$Q$,false,1),($Q$継続$Q$,false,2),($Q$頓挫$Q$,true,3),($Q$修正$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 2, '文脈規定' FROM q;

-- ===== 問題2 文脈規定 3/5 (正答:①辛辣) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$彼女の批評はあまりに（　）で、新人作家を傷つけることもあった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$辛辣$Q$,true,1),($Q$温和$Q$,false,2),($Q$穏健$Q$,false,3),($Q$寛大$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 2, '文脈規定' FROM q;

-- ===== 問題2 文脈規定 4/5 (正答:④喚起) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$環境問題への市民の意識を（　）するため、自治体は啓発イベントを開催した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$鎮静$Q$,false,1),($Q$抑圧$Q$,false,2),($Q$否認$Q$,false,3),($Q$喚起$Q$,true,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 2, '文脈規定' FROM q;

-- ===== 問題2 文脈規定 5/5 (正答:②瑣末) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$彼は問題の（　）な点にこだわり、本質を見失っていた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$重大$Q$,false,1),($Q$瑣末$Q$,true,2),($Q$核心的$Q$,false,3),($Q$本質的$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 2, '文脈規定' FROM q;

-- ===== 問題3 言い換え類義 1/2 (正答:③ゆがめること / 歪曲) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$彼の主張は、明らかに事実を歪曲していると感じた。「歪曲」に意味が最も近いものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$誇張すること$Q$,false,1),($Q$捏造すること$Q$,false,2),($Q$ゆがめること$Q$,true,3),($Q$隠蔽すること$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 3, '言い換え類義' FROM q;

-- ===== 問題3 言い換え類義 2/2 (正答:①落ち着いた状態 / 平静) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$彼女は他人の些細な言葉に一喜一憂し、なかなか平静を保てなかった。「平静」に意味が最も近いものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$落ち着いた状態$Q$,true,1),($Q$集中した状態$Q$,false,2),($Q$積極的な状態$Q$,false,3),($Q$楽観的な状態$Q$,false,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 3, '言い換え類義' FROM q;

-- ===== 問題4 用法 1/1 (正答:④ / 払拭) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'a0000001-0000-4000-a000-00000000002b', 'multiple_choice', 'vocab', $Q$「払拭」の使い方として最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES ($Q$机の上のほこりを払拭して、部屋をきれいにした。$Q$,false,1),($Q$彼は財産をすべて払拭し、家族に大きな負債を残した。$Q$,false,2),($Q$試験の答えを払拭して、最初から書き直した。$Q$,false,3),($Q$長年の不信感を払拭するために、誠実な対応を続けた。$Q$,true,4)) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 4, '用法' FROM q;

-- JLPT N1 モック試験 セット1 問題6 文の組み立て (5問)
-- quiz_id: bb000001-0000-0000-0000-000000000001
-- set_id:  aa000001-0000-0000-0000-000000000011
-- ★ = is_correct=true の選択肢が入る位置

-- ============================================================
-- 問1: 〜をものともせずに
-- 正解文: 年齢をものともせずに世界最高峰に登頂した登山家は称賛を集めた。
-- 正解順: 年齢を(4) → ものともせずに(2)★ → 世界最高峰に登頂した(1) → 登山家は(3)
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'grammar',
    $Q$次の文の ★ に入る最もよいものはどれか。

＿＿＿ ★ ＿＿＿ ＿＿＿称賛を集めた。$Q$,
    1, true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$世界最高峰に登頂した$Q$, false, 1),
      ($Q$ものともせずに$Q$,       true,  2),
      ($Q$登山家は$Q$,             false, 3),
      ($Q$年齢を$Q$,               false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 6, '文の組み立て' FROM q;

-- ============================================================
-- 問2: 〜にほかならない
-- 正解文: 彼が成功を収めた理由は日々の地道な努力にほかならない。
-- 正解順: 理由は(4) → 日々の(1) → 地道な努力(2) → にほかならない(3)★
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'grammar',
    $Q$次の文の ★ に入る最もよいものはどれか。

彼が成功を収めた＿＿＿ ＿＿＿ ＿＿＿ ★。$Q$,
    1, true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$日々の$Q$,         false, 1),
      ($Q$地道な努力$Q$,     false, 2),
      ($Q$にほかならない$Q$, true,  3),
      ($Q$理由は$Q$,         false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 6, '文の組み立て' FROM q;

-- ============================================================
-- 問3: 〜といえども
-- 正解文: 権力者といえども法の下では平等であることを忘れてはならない。
-- 正解順: 権力者と(1) → いえども(2)★ → 法の下では平等である(3) → ことを(4)
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'grammar',
    $Q$次の文の ★ に入る最もよいものはどれか。

＿＿＿ ★ ＿＿＿ ＿＿＿忘れてはならない。$Q$,
    1, true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$権力者と$Q$,             false, 1),
      ($Q$いえども$Q$,             true,  2),
      ($Q$法の下では平等である$Q$, false, 3),
      ($Q$ことを$Q$,               false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 6, '文の組み立て' FROM q;

-- ============================================================
-- 問4: 〜ずにはいられない
-- 正解文: 彼の誠実な態度には、誰もが信頼を寄せずにはいられないだろう。
-- 正解順: 誰もが(3) → 信頼を寄せ(4) → ずにはいられ(1)★ → ない(2)
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'grammar',
    $Q$次の文の ★ に入る最もよいものはどれか。

彼の誠実な態度には、＿＿＿ ＿＿＿ ★ ＿＿＿だろう。$Q$,
    1, true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$ずにはいられ$Q$, true,  1),
      ($Q$ない$Q$,         false, 2),
      ($Q$誰もが$Q$,       false, 3),
      ($Q$信頼を寄せ$Q$,   false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 6, '文の組み立て' FROM q;

-- ============================================================
-- 問5: 〜に先立って
-- 正解文: 式典の開催に先立って会場の準備が念入りに行われた。
-- 正解順: 開催に(4) → 先立って(1) → 会場の準備が(3)★ → 念入りに(2)
-- ============================================================
WITH q AS (
  INSERT INTO quiz_questions
    (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (
    gen_random_uuid(),
    'bb000001-0000-0000-0000-000000000001',
    'multiple_choice',
    'grammar',
    $Q$次の文の ★ に入る最もよいものはどれか。

式典の＿＿＿ ＿＿＿ ★ ＿＿＿行われた。$Q$,
    1, true
  )
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
    (VALUES
      ($Q$先立って$Q$,     false, 1),
      ($Q$念入りに$Q$,     false, 2),
      ($Q$会場の準備が$Q$, true,  3),
      ($Q$開催に$Q$,       false, 4)
    ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 6, '文の組み立て' FROM q;
-- ============================================================
-- N1 モック セット1 — 問題7 文章の文法 (5問)
-- テーマ: 日本の職場における残業文化の変容
-- 正解: ①厭わない(pos1) ②迫られている(pos3) ③しかしながら(pos2)
--        ④がたい(pos4)   ⑤事足りない(pos2)
-- ============================================================


-- 問41 ── 正解 1「厭わない」
-- 「残業を厭わない社員」= 残業を苦にしない・いとわない態度を表す慣用表現(N1語彙)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'grammar',
$Q$　現代の職場において、長時間労働に対する意識は大きく変わりつつある。かつては、残業を［41］社員こそが評価されるという風潮が広く見られ、遅くまで職場に残ることが勤勉さの証とみなされてきた。こうした働き方は、日本の高度経済成長を支えた企業文化の一端として、長年にわたり受け継がれてきたものである。

　しかし近年、「働き方改革」が国を挙げて推進されるようになってから、こうした価値観は見直しを［42］。業務効率の向上や有給休暇の取得促進が制度として整備され、残業時間の削減が企業の重要課題として位置づけられるようになった。

　［43］、制度が整っても職場の慣行がなかなか変わらないという現実もある。上司がまだ残っているのに先に帰り［44］という暗黙の空気は根強く、若手社員が帰宅をためらう場面は今も決して少なくない。

　こうした問題を真に解決するには、制度面の改革のみに依拠するのでは［45］。一人ひとりが時間の使い方や成果に対する意識を変え、互いを尊重し合える文化を職場全体で育てることこそが、真の変革への第一歩ではないだろうか。

【1】［41］に入る最もよいものを、1・2・3・4から一つ選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$厭わない$Q$,   true,  1),
    ($Q$欠かさない$Q$, false, 2),
    ($Q$惜しまない$Q$, false, 3),
    ($Q$顧みない$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 7, '文章の文法' FROM q;


-- 問42 ── 正解 3「迫られている」
-- 「見直しを迫られている」= 外圧(改革推進)によって否応なく見直しを強いられている状態
-- 求めてやまない(主体的に望む/方向逆), 妨げられている(阻害される/逆), 避けられている(回避/逆)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'grammar',
$Q$(問題7の文章) ※残業を厭わない社員が評価された旧来の風潮を述べた文章の続き。

　しかし近年、「働き方改革」が国を挙げて推進されるようになってから、こうした価値観は見直しを［42］。業務効率の向上や有給休暇の取得促進が制度として整備され、残業時間の削減が企業の重要課題として位置づけられるようになった。

【2】［42］に入る最もよいものを、1・2・3・4から一つ選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$求めてやまない$Q$, false, 1),
    ($Q$妨げられている$Q$, false, 2),
    ($Q$迫られている$Q$,   true,  3),
    ($Q$避けられている$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 7, '文章の文法' FROM q;


-- 問43 ── 正解 2「しかしながら」
-- 前段(改革の前進)と後段(慣行が変わらぬ現実)を逆接でつなぐ文頭接続詞
-- それゆえ(順接/結果), さらには(追加), すなわち(言い換え) はいずれも不適
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'grammar',
$Q$(問題7の文章) ※働き方改革が推進され、残業削減が企業の重要課題として位置づけられたことを述べた文章の続き。

　［43］、制度が整っても職場の慣行がなかなか変わらないという現実もある。上司がまだ残っているのに先に帰り［44］という暗黙の空気は根強く、若手社員が帰宅をためらう場面は今も決して少なくない。

【3】［43］に入る最もよいものを、1・2・3・4から一つ選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$それゆえ$Q$,     false, 1),
    ($Q$しかしながら$Q$, true,  2),
    ($Q$さらには$Q$,     false, 3),
    ($Q$すなわち$Q$,     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 7, '文章の文法' FROM q;


-- 問44 ── 正解 4「がたい」
-- 「帰りがたい」= 帰ることへの心理的抵抗・困難を表す(N1文法 〜がたい)
-- かねない(リスク/危険性), えない(物理的不可能・強すぎ), やまない(やめられない/意味不一致)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'grammar',
$Q$(問題7の文章)

　制度が整っても職場の慣行がなかなか変わらないという現実もある。上司がまだ残っているのに先に帰り［44］という暗黙の空気は根強く、若手社員が帰宅をためらう場面は今も決して少なくない。

【4】［44］に入る最もよいものを、1・2・3・4から一つ選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$かねない$Q$, false, 1),
    ($Q$えない$Q$,   false, 2),
    ($Q$やまない$Q$, false, 3),
    ($Q$がたい$Q$,   true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 7, '文章の文法' FROM q;


-- 問45 ── 正解 2「事足りない」
-- 「のでは事足りない」= それだけでは十分でない(N1表現)
-- 差し支えない(支障なし/逆), 他ならない(〜にほかならない の「に」が欠け文法不成立),
-- いられない(〜ていられない の形でないため不自然)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000001', 'multiple_choice', 'grammar',
$Q$(問題7の文章)

　こうした問題を真に解決するには、制度面の改革のみに依拠するのでは［45］。一人ひとりが時間の使い方や成果に対する意識を変え、互いを尊重し合える文化を職場全体で育てることこそが、真の変革への第一歩ではないだろうか。

【5】［45］に入る最もよいものを、1・2・3・4から一つ選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q,
  (VALUES
    ($Q$差し支えない$Q$, false, 1),
    ($Q$事足りない$Q$,   true,  2),
    ($Q$他ならない$Q$,   false, 3),
    ($Q$いられない$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, daimon, subtype)
SELECT 'aa000001-0000-0000-0000-000000000011', id, 'gengo_chishiki', 7, '文章の文法' FROM q;
COMMIT;
