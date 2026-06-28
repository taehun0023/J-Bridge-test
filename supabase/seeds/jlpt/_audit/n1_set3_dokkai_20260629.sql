BEGIN;

-- JLPT N1 模擬試験 Set3 読解 (dokkai) 25問 差し替え
-- set_id  : aa000001-0000-0000-0000-000000000013
-- quiz_id : ad000001-0000-0000-0000-000000000132
-- 作成日  : 2026-06-29

-- 既存 Set3 dokkai 問題を削除（CASCADE で jlpt_mock_set_questions も削除される）
DELETE FROM quiz_questions
WHERE id IN (
  SELECT question_id FROM jlpt_mock_set_questions
  WHERE set_id='aa000001-0000-0000-0000-000000000013' AND section='dokkai'
);

-- =====================================================================
-- 問題8　内容理解（短文）  sort_order 1〜4
-- =====================================================================

-- 問8-1: 随筆（グローバル化と食文化）
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　グローバル化の波は、食文化にも大きな変容をもたらしている。世界各地でファストフードチェーンが普及し、各地域固有の料理が姿を消しつつあるという懸念は根強い。しかし、食の形態が均質化する一方で、各地の料理が世界中で親しまれ、新たな融合料理が生まれているという事実も見逃せない。食文化の変容を単なる「喪失」と捉えるのは、変化の一面しか見ていない偏った視点ではないだろうか。

【問】この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$ファストフードの普及により、各地域の食文化は完全に消滅しつつある。$Q$,false,1),
    ($Q$食文化の変容をもたらすグローバル化は、早急に規制されるべきだ。$Q$,false,2),
    ($Q$食文化の変容を喪失としてのみ捉えることは、一面的な見方だ。$Q$,true,3),
    ($Q$グローバル化によって生まれた融合料理は、伝統料理より価値が高い。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 1 FROM q;

-- 問8-2: 随筆（テレワークと偶発的対話）
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　テレワークが広く定着した今日、オフィスでの偶発的な会話や廊下でのすれ違いが失われたことを嘆く声は多い。確かに、そうした非公式な交流がイノベーションの源泉になり得ることは否定できない。しかし、テレワークは通勤の負担から社員を解放し、育児や介護との両立を容易にするという大きな利点もある。問題はテレワーク自体にあるのではなく、偶発的な対話をいかに意図的に設計し直すかにあるのではないだろうか。

【問】筆者はリモートワークについてどのように述べているか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$テレワークによって生産性が下がるため、オフィス勤務に戻すべきだ。$Q$,false,1),
    ($Q$テレワークの最大の問題はイノベーションの機会が失われることだ。$Q$,false,2),
    ($Q$テレワーク自体より、偶発的な対話の仕組みを意図的に設計し直すことが課題だ。$Q$,true,3),
    ($Q$テレワークは育児・介護との両立に有効だが、社員間の信頼関係を損なう。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 2 FROM q;

-- 問8-3: 随筆（公共空間とスマートフォンのマナー）
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　電車の中でスマートフォンを操作する人が増え、乗客同士の「公共空間の共有」という意識が薄れているという指摘がある。しかし、個人が静かにスクリーンを見ているだけで、実際に他者を妨害しているわけではない。問われるべきは「何をしているか」ではなく、「他者の快適さを損なっているか否か」であるはずだ。マナーを論じる際には、見た目の印象ではなく、実害の有無を基準にすべきではないだろうか。

【問】筆者が主張していることは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$公共空間でスマートフォンを使用することは、いかなる状況でも許容されるべきだ。$Q$,false,1),
    ($Q$公共マナーの判断基準は見た目の印象ではなく、実際の他者への影響であるべきだ。$Q$,true,2),
    ($Q$スマートフォンの使用は公共空間での他者との交流を著しく妨げている。$Q$,false,3),
    ($Q$電車内でのスマートフォン使用を禁止する規制が早急に必要だ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 3 FROM q;

-- 問8-4: 随筆（「普通」という概念の社会的圧力）
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　私たちの社会では「普通」であることへの暗黙の圧力が根強い。多数派の行動様式から逸脱した途端に、周囲の目を気にして自己を抑制してしまう人は少なくない。しかし、「普通」とは統計的な平均値にすぎず、その時代の多数意見を反映したにすぎない。時代や社会によって変わる「普通」の基準を疑いなく受け入れることは、社会の多様性を損ない、変化への適応力を弱めることにつながると言えよう。

【問】筆者は「普通」についてどのように主張しているか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$「普通」に従うことは、社会の秩序を維持するために必要不可欠だ。$Q$,false,1),
    ($Q$「普通」の基準に従わない個人こそが、社会の変化を生み出す原動力となる。$Q$,false,2),
    ($Q$「普通」を無批判に受け入れることは、社会の多様性や適応力を損なう。$Q$,true,3),
    ($Q$多数派の行動様式は常に合理的であるため、積極的に従うべきだ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 4 FROM q;

-- =====================================================================
-- 問題9　内容理解（中文）  sort_order 5〜13
-- =====================================================================

-- ═══════════════════════════════════════════════════════════════════
-- 地文A（社会・心理）：アンコンシャス・バイアス
-- ═══════════════════════════════════════════════════════════════════

-- 問9-A-1 (sort_order 5)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人は誰しも、意識しないままに特定の集団に対して偏った認識を持っていることがある。これを「アンコンシャス・バイアス（無意識の偏見）」と呼ぶ。長年の社会的経験や文化的刷り込みによって形成されるこのバイアスは、採用面接や人事評価の場で無意識に作用し、本人が公平なつもりでいても特定の属性を持つ人々が不利な評価を受ける原因になり得る。

　重要なのは、このバイアスが「悪意ある差別」とは本質的に異なるという点だ。無意識であるがゆえに、自覚することが非常に難しい。だからこそ、組織レベルでの構造的な対策が求められる。個人の意識改革に頼るだけでなく、評価基準を明文化し、バイアスが介入しにくい仕組みを設計することが根本的な解決につながると考えられている。

　一方、アンコンシャス・バイアスへの対応として広まった「バイアス訓練」の実効性に疑問を呈する研究者も増えてきた。短期間の研修で個人の認知パターンを変えることは難しく、ラベリングが逆効果になる場合もあるという。こうした限界を認識したうえで、継続的な制度整備と文化変容を組み合わせるアプローチが不可欠だとする専門家も多い。

「アンコンシャス・バイアス」が問題とされる主な理由はどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$悪意ある差別と区別がつかないため、法的な対処が難しいから。$Q$,false,1),
    ($Q$本人が公平なつもりでいても、特定の人々を不利に評価してしまう恐れがあるから。$Q$,true,2),
    ($Q$高学歴者や専門家ほど強いバイアスを持つ傾向があるから。$Q$,false,3),
    ($Q$組織のリーダー層にのみ発生し、一般社員は影響を受けないから。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 5 FROM q;

-- 問9-A-2 (sort_order 6)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人は誰しも、意識しないままに特定の集団に対して偏った認識を持っていることがある。これを「アンコンシャス・バイアス（無意識の偏見）」と呼ぶ。長年の社会的経験や文化的刷り込みによって形成されるこのバイアスは、採用面接や人事評価の場で無意識に作用し、本人が公平なつもりでいても特定の属性を持つ人々が不利な評価を受ける原因になり得る。

　重要なのは、このバイアスが「悪意ある差別」とは本質的に異なるという点だ。無意識であるがゆえに、自覚することが非常に難しい。だからこそ、組織レベルでの構造的な対策が求められる。個人の意識改革に頼るだけでなく、評価基準を明文化し、バイアスが介入しにくい仕組みを設計することが根本的な解決につながると考えられている。

　一方、アンコンシャス・バイアスへの対応として広まった「バイアス訓練」の実効性に疑問を呈する研究者も増えてきた。短期間の研修で個人の認知パターンを変えることは難しく、ラベリングが逆効果になる場合もあるという。こうした限界を認識したうえで、継続的な制度整備と文化変容を組み合わせるアプローチが不可欠だとする専門家も多い。

「バイアス訓練」への見方として、本文の内容と合うものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$短期研修であっても、個人の認知パターンを確実に変えることができる。$Q$,false,1),
    ($Q$バイアス訓練は全く無意味であるため、即刻廃止すべきだとされている。$Q$,false,2),
    ($Q$バイアス訓練の限界を認識し、制度整備と文化変容と組み合わせることが重要とされている。$Q$,true,3),
    ($Q$バイアス訓練は組織改革なしでも十分な成果を上げることが証明されている。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 6 FROM q;

-- 問9-A-3 (sort_order 7)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人は誰しも、意識しないままに特定の集団に対して偏った認識を持っていることがある。これを「アンコンシャス・バイアス（無意識の偏見）」と呼ぶ。長年の社会的経験や文化的刷り込みによって形成されるこのバイアスは、採用面接や人事評価の場で無意識に作用し、本人が公平なつもりでいても特定の属性を持つ人々が不利な評価を受ける原因になり得る。

　重要なのは、このバイアスが「悪意ある差別」とは本質的に異なるという点だ。無意識であるがゆえに、自覚することが非常に難しい。だからこそ、組織レベルでの構造的な対策が求められる。個人の意識改革に頼るだけでなく、評価基準を明文化し、バイアスが介入しにくい仕組みを設計することが根本的な解決につながると考えられている。

　一方、アンコンシャス・バイアスへの対応として広まった「バイアス訓練」の実効性に疑問を呈する研究者も増えてきた。短期間の研修で個人の認知パターンを変えることは難しく、ラベリングが逆効果になる場合もあるという。こうした限界を認識したうえで、継続的な制度整備と文化変容を組み合わせるアプローチが不可欠だとする専門家も多い。

この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$アンコンシャス・バイアスは悪意ある差別と同じであり、厳格な法規制が必要だ。$Q$,false,1),
    ($Q$無意識の偏見への対処は、個人の努力に頼らず、構造的・継続的な取り組みが不可欠だ。$Q$,true,2),
    ($Q$バイアス訓練を全社員に義務付ければ、職場の公平性は十分に確保される。$Q$,false,3),
    ($Q$アンコンシャス・バイアスは特定の文化圏でのみ発生する現象だ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 7 FROM q;

-- ═══════════════════════════════════════════════════════════════════
-- 地文B（社会・環境）：都市農業の可能性
-- ═══════════════════════════════════════════════════════════════════

-- 問9-B-1 (sort_order 8)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　高層ビルが建ち並ぶ都市の中心部に、野菜を育てる「都市農業」の取り組みが世界各地で広がっている。屋上農園、垂直農場、コミュニティガーデンなど、その形態は多様だ。食料自給率の向上や地産地消の促進という経済的メリットに加え、都市住民の精神的健康や地域コミュニティの再生にも寄与するとして注目を集めている。

　しかし、都市農業が食料供給の主力になるかといえば、現実はそう単純ではない。土地の制約やコスト、栽培できる品目の偏りなど、課題は多い。特に垂直農場は莫大な電力を消費するため、再生可能エネルギーとの組み合わせなしには環境負荷の面で課題が残る。食料安全保障の観点からは、都市農業は補完的な役割にとどまらざるを得ないという見方が主流だ。

　それでも都市農業が持つ最大の価値は、農業と都市住民の距離を縮めることにあると指摘する研究者もいる。食べ物がどのように作られるかを身近に体験できる機会は、食への関心を高め、農村農業への理解や支援を促すとされる。こうした「食農教育」としての機能こそが、都市農業の本質的な意義である可能性がある。

都市農業の課題として本文で挙げられているものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$農業従事者の確保が困難なこと。$Q$,false,1),
    ($Q$垂直農場の大きな電力消費による環境負荷の問題。$Q$,true,2),
    ($Q$都市住民の農業への関心がきわめて低いこと。$Q$,false,3),
    ($Q$政府の規制が厳しく、都市農業の普及を妨げていること。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 8 FROM q;

-- 問9-B-2 (sort_order 9)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　高層ビルが建ち並ぶ都市の中心部に、野菜を育てる「都市農業」の取り組みが世界各地で広がっている。屋上農園、垂直農場、コミュニティガーデンなど、その形態は多様だ。食料自給率の向上や地産地消の促進という経済的メリットに加え、都市住民の精神的健康や地域コミュニティの再生にも寄与するとして注目を集めている。

　しかし、都市農業が食料供給の主力になるかといえば、現実はそう単純ではない。土地の制約やコスト、栽培できる品目の偏りなど、課題は多い。特に垂直農場は莫大な電力を消費するため、再生可能エネルギーとの組み合わせなしには環境負荷の面で課題が残る。食料安全保障の観点からは、都市農業は補完的な役割にとどまらざるを得ないという見方が主流だ。

　それでも都市農業が持つ最大の価値は、農業と都市住民の距離を縮めることにあると指摘する研究者もいる。食べ物がどのように作られるかを身近に体験できる機会は、食への関心を高め、農村農業への理解や支援を促すとされる。こうした「食農教育」としての機能こそが、都市農業の本質的な意義である可能性がある。

「食農教育としての機能」とはどういうことか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$都市農業で収穫した農産物を直接学校で調理・販売する活動のこと。$Q$,false,1),
    ($Q$食料生産を体験させることで、食や農業への関心と理解を育む役割のこと。$Q$,true,2),
    ($Q$農村部の農家に都市のマーケティング手法を教えるプログラムのこと。$Q$,false,3),
    ($Q$食料安全保障確保のために都市部での農業を義務化する教育政策のこと。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 9 FROM q;

-- 問9-B-3 (sort_order 10)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　高層ビルが建ち並ぶ都市の中心部に、野菜を育てる「都市農業」の取り組みが世界各地で広がっている。屋上農園、垂直農場、コミュニティガーデンなど、その形態は多様だ。食料自給率の向上や地産地消の促進という経済的メリットに加え、都市住民の精神的健康や地域コミュニティの再生にも寄与するとして注目を集めている。

　しかし、都市農業が食料供給の主力になるかといえば、現実はそう単純ではない。土地の制約やコスト、栽培できる品目の偏りなど、課題は多い。特に垂直農場は莫大な電力を消費するため、再生可能エネルギーとの組み合わせなしには環境負荷の面で課題が残る。食料安全保障の観点からは、都市農業は補完的な役割にとどまらざるを得ないという見方が主流だ。

　それでも都市農業が持つ最大の価値は、農業と都市住民の距離を縮めることにあると指摘する研究者もいる。食べ物がどのように作られるかを身近に体験できる機会は、食への関心を高め、農村農業への理解や支援を促すとされる。こうした「食農教育」としての機能こそが、都市農業の本質的な意義である可能性がある。

この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$都市農業は食料安全保障の観点から農村農業に代わる存在になるべきだ。$Q$,false,1),
    ($Q$垂直農場の環境負荷の問題が解決されない限り、都市農業の普及は認めるべきでない。$Q$,false,2),
    ($Q$都市農業の最大の価値は経済的効率性よりも、食と農業への関心を育む点にある。$Q$,true,3),
    ($Q$都市農業は補完的な役割にとどまるのみで、将来性に乏しい取り組みだ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 10 FROM q;

-- ═══════════════════════════════════════════════════════════════════
-- 地文C（言語・認知）：言語と思考の関係
-- ═══════════════════════════════════════════════════════════════════

-- 問9-C-1 (sort_order 11)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人間は言語を用いて思考するが、果たして言語が思考を規定するのか、それとも思考が言語に先行するのか。言語学と認知科学の交差点にあるこの問いは、長年議論の的となってきた。「サピア・ウォーフ仮説」として知られる言語相対性理論は、使用する言語によって人の認知の枠組みが異なるという立場をとる。

　この仮説を支持する実験例として、色彩語の数と色の識別能力の関係がある。色を表す語彙が豊富な言語を話す集団は、語彙の少ない集団と比べて色の微妙な差異をより素早く識別できるという結果が報告されている。この知見は、言語が単なる意思疎通の道具に留まらず、知覚そのものを形成する可能性を示唆している。

　しかし近年の研究では、言語の影響はかつて考えられていたほど絶対的ではないという見解が有力になっている。非言語的な思考や感情は言語の枠を超えて存在しており、言語は思考の「型」に影響を与えるが、すべてを決定するわけではない。言語と思考の関係は一方的な支配ではなく、互いに影響し合う双方向的なものと捉えるのが現在の主流である。

「サピア・ウォーフ仮説」の内容として正しいものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$思考は言語に先行するため、言語は人の認知を規定しない。$Q$,false,1),
    ($Q$使用する言語によって、人の認知の枠組みが異なる。$Q$,true,2),
    ($Q$すべての言語は基本的に同じ認知構造を持っている。$Q$,false,3),
    ($Q$言語は意思疎通の道具にすぎず、思考とは独立している。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 11 FROM q;

-- 問9-C-2 (sort_order 12)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人間は言語を用いて思考するが、果たして言語が思考を規定するのか、それとも思考が言語に先行するのか。言語学と認知科学の交差点にあるこの問いは、長年議論の的となってきた。「サピア・ウォーフ仮説」として知られる言語相対性理論は、使用する言語によって人の認知の枠組みが異なるという立場をとる。

　この仮説を支持する実験例として、色彩語の数と色の識別能力の関係がある。色を表す語彙が豊富な言語を話す集団は、語彙の少ない集団と比べて色の微妙な差異をより素早く識別できるという結果が報告されている。この知見は、言語が単なる意思疎通の道具に留まらず、知覚そのものを形成する可能性を示唆している。

　しかし近年の研究では、言語の影響はかつて考えられていたほど絶対的ではないという見解が有力になっている。非言語的な思考や感情は言語の枠を超えて存在しており、言語は思考の「型」に影響を与えるが、すべてを決定するわけではない。言語と思考の関係は一方的な支配ではなく、互いに影響し合う双方向的なものと捉えるのが現在の主流である。

色彩語の実験が示唆していることは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$色彩語が豊富な言語を話す人は、視力が生物学的に優れていること。$Q$,false,1),
    ($Q$言語は意思疎通を超えて、知覚そのものを形成する可能性があること。$Q$,true,2),
    ($Q$色彩語の数が少ない言語は、文化的に発展していないこと。$Q$,false,3),
    ($Q$色の識別能力は言語よりも環境的・生物的要因で決まること。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 12 FROM q;

-- 問9-C-3 (sort_order 13)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　人間は言語を用いて思考するが、果たして言語が思考を規定するのか、それとも思考が言語に先行するのか。言語学と認知科学の交差点にあるこの問いは、長年議論の的となってきた。「サピア・ウォーフ仮説」として知られる言語相対性理論は、使用する言語によって人の認知の枠組みが異なるという立場をとる。

　この仮説を支持する実験例として、色彩語の数と色の識別能力の関係がある。色を表す語彙が豊富な言語を話す集団は、語彙の少ない集団と比べて色の微妙な差異をより素早く識別できるという結果が報告されている。この知見は、言語が単なる意思疎通の道具に留まらず、知覚そのものを形成する可能性を示唆している。

　しかし近年の研究では、言語の影響はかつて考えられていたほど絶対的ではないという見解が有力になっている。非言語的な思考や感情は言語の枠を超えて存在しており、言語は思考の「型」に影響を与えるが、すべてを決定するわけではない。言語と思考の関係は一方的な支配ではなく、互いに影響し合う双方向的なものと捉えるのが現在の主流である。

この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$言語は思考を一方的に支配するものであり、使用言語が思考の限界を決める。$Q$,false,1),
    ($Q$思考は言語の影響を受けず、常に言語に先行する。$Q$,false,2),
    ($Q$言語と思考は互いに影響し合う双方向的な関係にある。$Q$,true,3),
    ($Q$言語相対性理論は完全に否定されており、研究する価値はない。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 13 FROM q;

-- =====================================================================
-- 問題10　内容理解（長文）  sort_order 14〜17
-- 地文：少子化と社会変革
-- =====================================================================

-- 問10-1 (sort_order 14)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本の少子化は深刻な社会問題として語られて久しい。出生率の低下は労働力不足や社会保障制度の持続可能性への懸念を生み出し、政府はさまざまな対策を打ち出してきた。しかし、数十年にわたる施策にもかかわらず、出生率の回復は思うように進んでいない。この現状をどう解釈し、どう向き合うべきなのか。

　一般的に少子化の原因として挙げられるのは、晩婚化・非婚化の進展、子育てコストの上昇、女性の社会進出に伴う仕事と育児の両立の難しさなどだ。これらは確かに出生率に影響を与えるが、より根本的な要因として、個人が「子どもを持つことの意味」を問い直していることを見落とすべきではない。高度消費社会において、自己実現の形は多様化した。子どもを持つことは人生の「必須条件」ではなくなり、数ある選択肢の一つになったのだ。

　こうした変化を「社会的問題」として捉えるだけでなく、価値観の成熟として受け止める視点も必要だ。少子化に伴う人口減少は経済的な課題をもたらす一方、環境への負荷を軽減するという側面もある。「人口が増えることが豊かさ」という価値観そのものを見直す時期に来ているのかもしれない。

　少子化対策の議論において見落とされがちなのが、「どんな社会で子育てをするか」という質的な問いだ。子どもを産みやすい環境を整えることと並行して、子どもが育つ社会そのものの豊かさを問い直すことが重要である。数的指標だけを追い求める政策から、教育・医療・住環境の質を高め、次世代が希望を持てる社会づくりへと、発想の転換が求められているのではないだろうか。

少子化の根本的な要因として、筆者が特に強調していることは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$子育てコストが高く、経済的に子どもを育てることが困難だから。$Q$,false,1),
    ($Q$女性の社会進出により、育児と仕事の両立が難しくなったから。$Q$,false,2),
    ($Q$個人が「子どもを持つことの意味」を問い直していること。$Q$,true,3),
    ($Q$政府の少子化対策が不十分で、実効性のある施策が講じられていないから。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 14 FROM q;

-- 問10-2 (sort_order 15)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本の少子化は深刻な社会問題として語られて久しい。出生率の低下は労働力不足や社会保障制度の持続可能性への懸念を生み出し、政府はさまざまな対策を打ち出してきた。しかし、数十年にわたる施策にもかかわらず、出生率の回復は思うように進んでいない。この現状をどう解釈し、どう向き合うべきなのか。

　一般的に少子化の原因として挙げられるのは、晩婚化・非婚化の進展、子育てコストの上昇、女性の社会進出に伴う仕事と育児の両立の難しさなどだ。これらは確かに出生率に影響を与えるが、より根本的な要因として、個人が「子どもを持つことの意味」を問い直していることを見落とすべきではない。高度消費社会において、自己実現の形は多様化した。子どもを持つことは人生の「必須条件」ではなくなり、数ある選択肢の一つになったのだ。

　こうした変化を「社会的問題」として捉えるだけでなく、価値観の成熟として受け止める視点も必要だ。少子化に伴う人口減少は経済的な課題をもたらす一方、環境への負荷を軽減するという側面もある。「人口が増えることが豊かさ」という価値観そのものを見直す時期に来ているのかもしれない。

　少子化対策の議論において見落とされがちなのが、「どんな社会で子育てをするか」という質的な問いだ。子どもを産みやすい環境を整えることと並行して、子どもが育つ社会そのものの豊かさを問い直すことが重要である。数的指標だけを追い求める政策から、教育・医療・住環境の質を高め、次世代が希望を持てる社会づくりへと、発想の転換が求められているのではないだろうか。

「価値観の成熟」（第3段落）とはどういうことか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$社会全体が少子化問題の深刻さを認識し、積極的に対策を講じるようになったこと。$Q$,false,1),
    ($Q$子どもを持つことが人生の絶対条件ではなく、個人の選択として尊重されるようになったこと。$Q$,true,2),
    ($Q$人口増加こそ豊かさという価値観が社会全体に広まったこと。$Q$,false,3),
    ($Q$少子化問題の解決に環境への配慮が加味されるようになったこと。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 15 FROM q;

-- 問10-3 (sort_order 16)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本の少子化は深刻な社会問題として語られて久しい。出生率の低下は労働力不足や社会保障制度の持続可能性への懸念を生み出し、政府はさまざまな対策を打ち出してきた。しかし、数十年にわたる施策にもかかわらず、出生率の回復は思うように進んでいない。この現状をどう解釈し、どう向き合うべきなのか。

　一般的に少子化の原因として挙げられるのは、晩婚化・非婚化の進展、子育てコストの上昇、女性の社会進出に伴う仕事と育児の両立の難しさなどだ。これらは確かに出生率に影響を与えるが、より根本的な要因として、個人が「子どもを持つことの意味」を問い直していることを見落とすべきではない。高度消費社会において、自己実現の形は多様化した。子どもを持つことは人生の「必須条件」ではなくなり、数ある選択肢の一つになったのだ。

　こうした変化を「社会的問題」として捉えるだけでなく、価値観の成熟として受け止める視点も必要だ。少子化に伴う人口減少は経済的な課題をもたらす一方、環境への負荷を軽減するという側面もある。「人口が増えることが豊かさ」という価値観そのものを見直す時期に来ているのかもしれない。

　少子化対策の議論において見落とされがちなのが、「どんな社会で子育てをするか」という質的な問いだ。子どもを産みやすい環境を整えることと並行して、子どもが育つ社会そのものの豊かさを問い直すことが重要である。数的指標だけを追い求める政策から、教育・医療・住環境の質を高め、次世代が希望を持てる社会づくりへと、発想の転換が求められているのではないだろうか。

少子化対策において、筆者が見落とされがちだと指摘していることは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$出生率の数値目標を設定し、その達成に向けた具体的施策を強化すること。$Q$,false,1),
    ($Q$子育て支援のための経済的補助を大幅に拡充すること。$Q$,false,2),
    ($Q$子どもが育つ社会そのものの豊かさや質を問い直すこと。$Q$,true,3),
    ($Q$移民受け入れによって人口減少を補うこと。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 16 FROM q;

-- 問10-4 (sort_order 17)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本の少子化は深刻な社会問題として語られて久しい。出生率の低下は労働力不足や社会保障制度の持続可能性への懸念を生み出し、政府はさまざまな対策を打ち出してきた。しかし、数十年にわたる施策にもかかわらず、出生率の回復は思うように進んでいない。この現状をどう解釈し、どう向き合うべきなのか。

　一般的に少子化の原因として挙げられるのは、晩婚化・非婚化の進展、子育てコストの上昇、女性の社会進出に伴う仕事と育児の両立の難しさなどだ。これらは確かに出生率に影響を与えるが、より根本的な要因として、個人が「子どもを持つことの意味」を問い直していることを見落とすべきではない。高度消費社会において、自己実現の形は多様化した。子どもを持つことは人生の「必須条件」ではなくなり、数ある選択肢の一つになったのだ。

　こうした変化を「社会的問題」として捉えるだけでなく、価値観の成熟として受け止める視点も必要だ。少子化に伴う人口減少は経済的な課題をもたらす一方、環境への負荷を軽減するという側面もある。「人口が増えることが豊かさ」という価値観そのものを見直す時期に来ているのかもしれない。

　少子化対策の議論において見落とされがちなのが、「どんな社会で子育てをするか」という質的な問いだ。子どもを産みやすい環境を整えることと並行して、子どもが育つ社会そのものの豊かさを問い直すことが重要である。数的指標だけを追い求める政策から、教育・医療・住環境の質を高め、次世代が希望を持てる社会づくりへと、発想の転換が求められているのではないだろうか。

この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$少子化は深刻な問題であるため、政府は出生率回復のためにより強力な施策を取るべきだ。$Q$,false,1),
    ($Q$少子化を問題のみとして捉えず、社会の質的向上へと発想を転換することが重要だ。$Q$,true,2),
    ($Q$少子化の原因は晩婚化と非婚化であるため、結婚を促す政策を最優先すべきだ。$Q$,false,3),
    ($Q$人口が減少しても経済成長を維持できれば、少子化は本質的な問題ではない。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 17 FROM q;

-- =====================================================================
-- 問題11　統合理解（比較）  sort_order 18〜19
-- 文書A・B：AIと創造的表現
-- =====================================================================

-- 問11-1 (sort_order 18)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$A
　近年、人工知能が作曲、絵画、詩作などの創造的分野で目覚ましい成果を上げている。AIが生み出す作品の中には、専門家でさえ人間の手によるものと見抜けないものもある。創造性とは「新しいものを生み出す能力」であるとするならば、AIはすでにその定義を満たしていると言えよう。芸術の価値は制作者の属性ではなく、作品が鑑賞者にもたらす感動や発見にあるのだから、AI作品を芸術として認めることに躊躇する必要はない。

B
　AIが精巧な絵画や音楽を生成できることは認めよう。しかしそれは、膨大なデータから統計的なパターンを学習し、そのパターンを組み合わせているにすぎない。真の創造性とは、個人の実存的な体験や苦悩から生まれるものであり、感情や意志なしには成立しない。AIによる「創作」は高度な模倣であり、人間の自己表現としての芸術とは根本的に異なる。AI作品を芸術と呼ぶことは、芸術の概念を空洞化することにつながりかねない。

AとBが共通して述べていることは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$AIによる創作物は芸術として認められるべきだということ。$Q$,false,1),
    ($Q$AIが創造的な分野で高い能力を発揮しているということ。$Q$,true,2),
    ($Q$創造性の本質は人間の自己表現にあるということ。$Q$,false,3),
    ($Q$芸術の価値は制作者の属性ではなく作品そのものにあるということ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 18 FROM q;

-- 問11-2 (sort_order 19)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$A
　近年、人工知能が作曲、絵画、詩作などの創造的分野で目覚ましい成果を上げている。AIが生み出す作品の中には、専門家でさえ人間の手によるものと見抜けないものもある。創造性とは「新しいものを生み出す能力」であるとするならば、AIはすでにその定義を満たしていると言えよう。芸術の価値は制作者の属性ではなく、作品が鑑賞者にもたらす感動や発見にあるのだから、AI作品を芸術として認めることに躊躇する必要はない。

B
　AIが精巧な絵画や音楽を生成できることは認めよう。しかしそれは、膨大なデータから統計的なパターンを学習し、そのパターンを組み合わせているにすぎない。真の創造性とは、個人の実存的な体験や苦悩から生まれるものであり、感情や意志なしには成立しない。AIによる「創作」は高度な模倣であり、人間の自己表現としての芸術とは根本的に異なる。AI作品を芸術と呼ぶことは、芸術の概念を空洞化することにつながりかねない。

AとBの意見の相違として最も適切なものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$AはAIの能力を認めているが、BはAIの能力そのものを否定している。$Q$,false,1),
    ($Q$AはAI創作物を芸術と認め、Bは真の創造性には体験や意志が必要だと主張している。$Q$,true,2),
    ($Q$AはAIが人間を凌駕したと主張し、BはAIと人間の能力は同等だと述べている。$Q$,false,3),
    ($Q$Aは芸術の商業的価値を重視し、Bは芸術の社会的影響を重視している。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 19 FROM q;

-- =====================================================================
-- 問題12　内容理解（長文）  sort_order 20〜23
-- 地文：高齢化社会と多世代交流
-- =====================================================================

-- 問12-1 (sort_order 20)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本は世界に類を見ない速度で少子高齢化が進み、総人口に占める65歳以上の割合は既に3割に達しようとしている。かつて「老い」とは家族や地域コミュニティの中で自然に受け容れられるものだったが、核家族化と都市化の進展により、高齢者が孤立しやすい社会構造が生まれてしまった。

　高齢者の孤立は、身体的な健康だけでなく、精神的な健康にも深刻な影響を及ぼす。研究によれば、社会的なつながりの希薄さは認知機能の低下リスクと強く相関しており、孤独な生活を送る高齢者は早期に認知症を発症しやすいとされる。これは個人の問題に留まらず、医療・介護費用の増大を通じて社会全体のコストに直結する問題だ。

　この課題への対応として、近年注目されているのが「多世代交流」の場づくりだ。異なる年齢層が日常的に交わる機会を意図的に設計することで、高齢者の孤立を防ぎながら、若い世代への生活知恵や価値観の継承も可能になる。保育所と高齢者施設を同一建物内に設けた「複合型施設」は、その具体例の一つだ。子どもたちの声や笑顔が高齢者の活力を引き出し、高齢者の存在が子どもたちに人生の幅と深さを伝えるという相互作用が生まれる。

　しかし、多世代交流の「場」を作るだけでは不十分だという指摘もある。世代間の価値観や生活習慣の違いは時に摩擦を生じさせ、形式的な交流に終わってしまう危険性がある。重要なのは、「共に何かをする」という共同作業を通じた自然な関係構築だ。地域の農作業、伝統行事の準備、子育て支援など、共通の目的を持った活動の中でこそ、世代を超えた真のつながりが育まれると専門家は指摘する。

高齢者の孤立が問題とされる理由として、本文で述べられていないものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$社会的つながりの希薄さが認知症の早期発症リスクを高めるから。$Q$,false,1),
    ($Q$医療・介護費用の増大を通じて社会全体のコストが増えるから。$Q$,false,2),
    ($Q$高齢者の孤立が若い世代の雇用機会の縮小につながるから。$Q$,true,3),
    ($Q$精神的な健康に深刻な影響を及ぼすから。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 20 FROM q;

-- 問12-2 (sort_order 21)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本は世界に類を見ない速度で少子高齢化が進み、総人口に占める65歳以上の割合は既に3割に達しようとしている。かつて「老い」とは家族や地域コミュニティの中で自然に受け容れられるものだったが、核家族化と都市化の進展により、高齢者が孤立しやすい社会構造が生まれてしまった。

　高齢者の孤立は、身体的な健康だけでなく、精神的な健康にも深刻な影響を及ぼす。研究によれば、社会的なつながりの希薄さは認知機能の低下リスクと強く相関しており、孤独な生活を送る高齢者は早期に認知症を発症しやすいとされる。これは個人の問題に留まらず、医療・介護費用の増大を通じて社会全体のコストに直結する問題だ。

　この課題への対応として、近年注目されているのが「多世代交流」の場づくりだ。異なる年齢層が日常的に交わる機会を意図的に設計することで、高齢者の孤立を防ぎながら、若い世代への生活知恵や価値観の継承も可能になる。保育所と高齢者施設を同一建物内に設けた「複合型施設」は、その具体例の一つだ。子どもたちの声や笑顔が高齢者の活力を引き出し、高齢者の存在が子どもたちに人生の幅と深さを伝えるという相互作用が生まれる。

　しかし、多世代交流の「場」を作るだけでは不十分だという指摘もある。世代間の価値観や生活習慣の違いは時に摩擦を生じさせ、形式的な交流に終わってしまう危険性がある。重要なのは、「共に何かをする」という共同作業を通じた自然な関係構築だ。地域の農作業、伝統行事の準備、子育て支援など、共通の目的を持った活動の中でこそ、世代を超えた真のつながりが育まれると専門家は指摘する。

「複合型施設」の効果として本文で述べられているものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$保育所と高齢者施設を統合することで、施設の維持費を削減できる。$Q$,false,1),
    ($Q$子どもの存在が高齢者の活力を引き出し、高齢者の存在が子どもたちの成長に貢献する。$Q$,true,2),
    ($Q$専門スタッフが共有されるため、高齢者と子どもの両方に質の高いケアが提供できる。$Q$,false,3),
    ($Q$核家族化した社会において、失われた大家族の機能を代替できる。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 21 FROM q;

-- 問12-3 (sort_order 22)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本は世界に類を見ない速度で少子高齢化が進み、総人口に占める65歳以上の割合は既に3割に達しようとしている。かつて「老い」とは家族や地域コミュニティの中で自然に受け容れられるものだったが、核家族化と都市化の進展により、高齢者が孤立しやすい社会構造が生まれてしまった。

　高齢者の孤立は、身体的な健康だけでなく、精神的な健康にも深刻な影響を及ぼす。研究によれば、社会的なつながりの希薄さは認知機能の低下リスクと強く相関しており、孤独な生活を送る高齢者は早期に認知症を発症しやすいとされる。これは個人の問題に留まらず、医療・介護費用の増大を通じて社会全体のコストに直結する問題だ。

　この課題への対応として、近年注目されているのが「多世代交流」の場づくりだ。異なる年齢層が日常的に交わる機会を意図的に設計することで、高齢者の孤立を防ぎながら、若い世代への生活知恵や価値観の継承も可能になる。保育所と高齢者施設を同一建物内に設けた「複合型施設」は、その具体例の一つだ。子どもたちの声や笑顔が高齢者の活力を引き出し、高齢者の存在が子どもたちに人生の幅と深さを伝えるという相互作用が生まれる。

　しかし、多世代交流の「場」を作るだけでは不十分だという指摘もある。世代間の価値観や生活習慣の違いは時に摩擦を生じさせ、形式的な交流に終わってしまう危険性がある。重要なのは、「共に何かをする」という共同作業を通じた自然な関係構築だ。地域の農作業、伝統行事の準備、子育て支援など、共通の目的を持った活動の中でこそ、世代を超えた真のつながりが育まれると専門家は指摘する。

多世代交流の「場」を作るだけでは不十分だとされる理由はどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$多世代交流施設は建設コストが高く、地域財政を圧迫するから。$Q$,false,1),
    ($Q$世代間の価値観や習慣の違いが摩擦を生み、形式的な交流に終わる危険があるから。$Q$,true,2),
    ($Q$高齢者が若い世代の活動についていけず、参加をためらいがちになるから。$Q$,false,3),
    ($Q$多世代交流は地域ボランティアに依存しており、継続性が保てないから。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 22 FROM q;

-- 問12-4 (sort_order 23)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$　日本は世界に類を見ない速度で少子高齢化が進み、総人口に占める65歳以上の割合は既に3割に達しようとしている。かつて「老い」とは家族や地域コミュニティの中で自然に受け容れられるものだったが、核家族化と都市化の進展により、高齢者が孤立しやすい社会構造が生まれてしまった。

　高齢者の孤立は、身体的な健康だけでなく、精神的な健康にも深刻な影響を及ぼす。研究によれば、社会的なつながりの希薄さは認知機能の低下リスクと強く相関しており、孤独な生活を送る高齢者は早期に認知症を発症しやすいとされる。これは個人の問題に留まらず、医療・介護費用の増大を通じて社会全体のコストに直結する問題だ。

　この課題への対応として、近年注目されているのが「多世代交流」の場づくりだ。異なる年齢層が日常的に交わる機会を意図的に設計することで、高齢者の孤立を防ぎながら、若い世代への生活知恵や価値観の継承も可能になる。保育所と高齢者施設を同一建物内に設けた「複合型施設」は、その具体例の一つだ。子どもたちの声や笑顔が高齢者の活力を引き出し、高齢者の存在が子どもたちに人生の幅と深さを伝えるという相互作用が生まれる。

　しかし、多世代交流の「場」を作るだけでは不十分だという指摘もある。世代間の価値観や生活習慣の違いは時に摩擦を生じさせ、形式的な交流に終わってしまう危険性がある。重要なのは、「共に何かをする」という共同作業を通じた自然な関係構築だ。地域の農作業、伝統行事の準備、子育て支援など、共通の目的を持った活動の中でこそ、世代を超えた真のつながりが育まれると専門家は指摘する。

この文章で筆者が最も言いたいことは何か。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$政府が主導して全国に多世代複合施設を整備することが、少子高齢化対策の最善策だ。$Q$,false,1),
    ($Q$高齢者の孤立を防ぐためには、核家族化を解消し大家族制度に戻ることが理想だ。$Q$,false,2),
    ($Q$世代を超えた真のつながりは、共通の目的を持った共同作業を通じてこそ育まれる。$Q$,true,3),
    ($Q$高齢化社会の問題は経済的コストの問題であり、医療・介護の効率化が最優先だ。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 23 FROM q;

-- =====================================================================
-- 問題13　情報検索  sort_order 24〜25
-- 実用文書：さくら市 伝統文化体験プログラム参加者募集
-- =====================================================================

-- 問13-1 (sort_order 24)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$さくら市　伝統文化体験プログラム　参加者募集

さくら市では、市内在住・在勤の方を対象に、伝統文化を体験できるプログラムを開催いたします。各コースとも定員に限りがございますので、お早めにお申し込みください。

【コース一覧】

◆茶道体験コース
　対象：市内在住の18歳以上の方
　日程：毎月第1・第3土曜日（全6回）
　費用：無料（材料費として1回500円別途）
　定員：各回8名（先着順）
　申込期限：開催日の2週間前まで

◆陶芸体験コース
　対象：市内在住または在勤の方（年齢不問）
　日程：毎月第2日曜日（全4回）
　費用：1,500円（全4回分・材料費込み）
　定員：各回10名（抽選）
　申込期限：開催月の前月末日まで

◆書道体験コース
　対象：市内在住の小中学生（保護者同伴可）
　日程：毎週水曜日（全8回）
　費用：無料
　定員：各回15名（先着順）
　申込期限：開催日の1週間前まで

【申込方法】
①来館：市民センター窓口（平日9:00〜17:00）
②電話：0120-XXX-XXXX（平日9:00〜17:00）
③オンライン：市公式ホームページの申し込みフォームより

【注意事項】
・キャンセルは開催3日前までにお電話またはオンラインにてご連絡ください。
・当日のキャンセルは原則として受け付けておりません。
・抽選コースの結果は、申込締め切り後5営業日以内にメールにてお知らせします。
・全コース修了者には修了証を発行いたします。

鈴木さんは、市外在住で市内の会社に勤める30歳の会社員です。週末のみ参加できますが、日曜日しか都合がつきません。参加できるコースはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$茶道体験コース$Q$,false,1),
    ($Q$陶芸体験コース$Q$,true,2),
    ($Q$書道体験コース$Q$,false,3),
    ($Q$いずれのコースにも参加できない$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 24 FROM q;

-- 問13-2 (sort_order 25)
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000132', 'multiple_choice', 'reading', $Q$さくら市　伝統文化体験プログラム　参加者募集

さくら市では、市内在住・在勤の方を対象に、伝統文化を体験できるプログラムを開催いたします。各コースとも定員に限りがございますので、お早めにお申し込みください。

【コース一覧】

◆茶道体験コース
　対象：市内在住の18歳以上の方
　日程：毎月第1・第3土曜日（全6回）
　費用：無料（材料費として1回500円別途）
　定員：各回8名（先着順）
　申込期限：開催日の2週間前まで

◆陶芸体験コース
　対象：市内在住または在勤の方（年齢不問）
　日程：毎月第2日曜日（全4回）
　費用：1,500円（全4回分・材料費込み）
　定員：各回10名（抽選）
　申込期限：開催月の前月末日まで

◆書道体験コース
　対象：市内在住の小中学生（保護者同伴可）
　日程：毎週水曜日（全8回）
　費用：無料
　定員：各回15名（先着順）
　申込期限：開催日の1週間前まで

【申込方法】
①来館：市民センター窓口（平日9:00〜17:00）
②電話：0120-XXX-XXXX（平日9:00〜17:00）
③オンライン：市公式ホームページの申し込みフォームより

【注意事項】
・キャンセルは開催3日前までにお電話またはオンラインにてご連絡ください。
・当日のキャンセルは原則として受け付けておりません。
・抽選コースの結果は、申込締め切り後5営業日以内にメールにてお知らせします。
・全コース修了者には修了証を発行いたします。

陶芸体験コースに申し込んだ後、急用ができて参加できなくなった場合の対応として正しいものはどれか。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$キャンセルは開催3日前までに連絡すれば受け付けてもらえる。$Q$,true,1),
    ($Q$電話でのキャンセルのみ受け付けており、オンラインでの手続きはできない。$Q$,false,2),
    ($Q$抽選で選ばれているため、いかなる理由でもキャンセルはできない。$Q$,false,3),
    ($Q$当日連絡すればキャンセルを受け付けてもらえる。$Q$,false,4)
  ) AS v(t,c,n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'dokkai', 25 FROM q;

COMMIT;
