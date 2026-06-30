BEGIN;

-- N1 模擬試験 Set3 言語知識（文字・語彙・文法）45問 全面差替え
-- set_id : aa000001-0000-0000-0000-000000000013
-- quiz_id: ad000001-0000-0000-0000-000000000131
-- 語彙テーマ: 逡巡/懐柔/齟齬/錯綜/漸進/矜持/杜撰/蔑ろ/拮抗/萎縮/剽窃/看過/葛藤
--            秀逸/黙殺/含蓄/軽率/助長/難航/嚆矢/峻別/精緻/斡旋/喫緊/喧伝
-- 文法テーマ: に即して/をよそに/ならではの/に先んじて/ともなると/をもって/
--            に照らして/に鑑みて/を契機に/んばかりに
-- 問題7 passage: 消費社会と物の価値観

-- ===== 既存 Set3 gengo_chishiki 問題を削除 (CASCADE で jlpt_mock_set_questions も削除) =====
DELETE FROM quiz_questions
WHERE id IN (
  SELECT question_id FROM jlpt_mock_set_questions
  WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
    AND section = 'gengo_chishiki'
);

-- ============================================================
-- 問題1 漢字読み (6問, sort_order 1〜6)
-- ============================================================

-- ===== 問題1 漢字読み 1/6 : 逡巡 → しゅんじゅん =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

彼は重要な決断を前に<u>逡巡</u>し、なかなか行動に移せなかった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$じゅんじゅん$Q$, false, 1),
    ($Q$しゅんじゅん$Q$, true,  2),
    ($Q$しゅんきん$Q$,  false, 3),
    ($Q$じゅんきん$Q$,  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 1 FROM q;

-- ===== 問題1 漢字読み 2/6 : 懐柔 → かいじゅう =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

新任の上司は対立する派閥を巧みに<u>懐柔</u>し、部署内の融和を実現した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$えんじゅう$Q$, false, 1),
    ($Q$かいにゅう$Q$, false, 2),
    ($Q$かいじゅう$Q$, true,  3),
    ($Q$かいしゅう$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 2 FROM q;

-- ===== 問題1 漢字読み 3/6 : 齟齬 → そご =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

双方の認識に<u>齟齬</u>があったため、プロジェクトの引き継ぎは難航した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$さくご$Q$, false, 1),
    ($Q$そご$Q$,   true,  2),
    ($Q$きょご$Q$, false, 3),
    ($Q$ちご$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 3 FROM q;

-- ===== 問題1 漢字読み 4/6 : 錯綜 → さくそう =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

事件発生直後は様々な情報が<u>錯綜</u>し、正確な状況の把握に時間を要した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$さっそう$Q$, false, 1),
    ($Q$さくせん$Q$, false, 2),
    ($Q$さっそく$Q$, false, 3),
    ($Q$さくそう$Q$, true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 4 FROM q;

-- ===== 問題1 漢字読み 5/6 : 漸進 → ぜんしん =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

急激な変化を避け、<u>漸進</u>的に制度を改革していく方針が採用された。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$だんしん$Q$, false, 1),
    ($Q$ぜんけい$Q$, false, 2),
    ($Q$ぜんしん$Q$, true,  3),
    ($Q$ぜんそく$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 5 FROM q;

-- ===== 問題1 漢字読み 6/6 : 矜持 → きょうじ =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

どんな困難な状況に置かれても、彼は武道家としての<u>矜持</u>を失わなかった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$こうじ$Q$,   false, 1),
    ($Q$きょうし$Q$, false, 2),
    ($Q$きんじ$Q$,   false, 3),
    ($Q$きょうじ$Q$, true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 6 FROM q;

-- ============================================================
-- 問題2 文脈規定 (7問, sort_order 7〜13)
-- ============================================================

-- ===== 問題2 文脈規定 1/7 : 杜撰 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

そのマンションの設計管理は（　　）で、施工後わずか数年で建物に亀裂が生じた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$緻密$Q$, false, 1),
    ($Q$丁寧$Q$, false, 2),
    ($Q$杜撰$Q$, true,  3),
    ($Q$厳格$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 7 FROM q;

-- ===== 問題2 文脈規定 2/7 : 蔑ろ =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼は会議での決定を（　　）にして、独断で部署の方針を変更してしまった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$蔑ろ$Q$,   true,  1),
    ($Q$控えめ$Q$, false, 2),
    ($Q$重要視$Q$, false, 3),
    ($Q$慎重$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 8 FROM q;

-- ===== 問題2 文脈規定 3/7 : 拮抗 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

二社の市場シェアは（　　）しており、業界首位の座は依然として流動的な状況だ。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$協調$Q$, false, 1),
    ($Q$拮抗$Q$, true,  2),
    ($Q$共存$Q$, false, 3),
    ($Q$連携$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 9 FROM q;

-- ===== 問題2 文脈規定 4/7 : 萎縮 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

上司の激しい叱責を繰り返し受けた部下は、次第に（　　）して自分の意見を述べられなくなった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$萎縮$Q$, true,  1),
    ($Q$奮起$Q$, false, 2),
    ($Q$反発$Q$, false, 3),
    ($Q$成長$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 10 FROM q;

-- ===== 問題2 文脈規定 5/7 : 剽窃 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

他者の研究成果をそのまま流用することは（　　）にあたり、学術倫理上の重大な違反とされる。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$模倣$Q$, false, 1),
    ($Q$誇張$Q$, false, 2),
    ($Q$剽窃$Q$, true,  3),
    ($Q$隠蔽$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 11 FROM q;

-- ===== 問題2 文脈規定 6/7 : 看過 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

今回の事案を（　　）することは許されず、関係部署は即時に調査に乗り出した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$看過$Q$, true,  1),
    ($Q$周知$Q$, false, 2),
    ($Q$告発$Q$, false, 3),
    ($Q$解決$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 12 FROM q;

-- ===== 問題2 文脈規定 7/7 : 葛藤 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

彼女は転職の決断を前に深い（　　）を抱え、何度も考え直した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$焦燥$Q$, false, 1),
    ($Q$後悔$Q$, false, 2),
    ($Q$葛藤$Q$, true,  3),
    ($Q$嫉妬$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 13 FROM q;

-- ============================================================
-- 問題3 言い換え類義 (6問, sort_order 14〜19)
-- ============================================================

-- ===== 問題3 言い換え類義 1/6 : 秀逸 → 群を抜いて優れた =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

彼のデザイン案は<u>秀逸</u>で、審査員から満場一致で最優秀賞に推薦された。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$精巧で丁寧な$Q$,     false, 1),
    ($Q$感情豊かな$Q$,       false, 2),
    ($Q$群を抜いて優れた$Q$, true,  3),
    ($Q$独創的な$Q$,         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 14 FROM q;

-- ===== 問題3 言い換え類義 2/6 : 黙殺 → 完全に無視した =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

委員会は住民からの再三の請願を<u>黙殺</u>し、開発計画を予定通り強行した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$厳しく批判した$Q$,       false, 1),
    ($Q$完全に無視した$Q$,       true,  2),
    ($Q$慎重に検討した$Q$,       false, 3),
    ($Q$積極的に受け入れた$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 15 FROM q;

-- ===== 問題3 言い換え類義 3/6 : 含蓄 → 深い意味や示唆 =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

師匠の短い言葉には深い<u>含蓄</u>があり、弟子たちは年月を経て初めてその真意に気づいた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$深い意味や示唆$Q$,   true,  1),
    ($Q$厳しい批判や警告$Q$, false, 2),
    ($Q$明確な指示や命令$Q$, false, 3),
    ($Q$温かい励まし$Q$,     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 16 FROM q;

-- ===== 問題3 言い換え類義 4/6 : 軽率 → 慎重さが足りない =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

十分な確認もせずに書類に署名したことは、あまりにも<u>軽率</u>だったと後悔した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$不誠実で悪意がある$Q$, false, 1),
    ($Q$慎重さが足りない$Q$,   true,  2),
    ($Q$法律に反している$Q$,   false, 3),
    ($Q$責任感がない$Q$,       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 17 FROM q;

-- ===== 問題3 言い換え類義 5/6 : 助長 → さらに強めている =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

偏ったメディア報道が人々の不安を<u>助長</u>しているという指摘は根強い。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$和らげている$Q$,       false, 1),
    ($Q$抑制している$Q$,       false, 2),
    ($Q$さらに強めている$Q$,   true,  3),
    ($Q$正確に伝えている$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 18 FROM q;

-- ===== 問題3 言い換え類義 6/6 : 難航 → 困難を極めた =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$_の言葉に意味が最も近いものを、１・２・３・４から一つ選びなさい。

事前の予想を裏切り、交渉は<u>難航</u>し、最終合意まで三か月以上を要した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$長期化した$Q$,   false, 1),
    ($Q$中断された$Q$,   false, 2),
    ($Q$困難を極めた$Q$, true,  3),
    ($Q$順調に進んだ$Q$, false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 19 FROM q;

-- ============================================================
-- 問題4 用法 (6問, sort_order 20〜25)
-- ============================================================

-- ===== 問題4 用法 1/6 : 嚆矢 (正答①) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「嚆矢」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$明治時代に設立されたその会社は、日本の近代産業の嚆矢となる存在だった。$Q$,                         true,  1),
    ($Q$その選手は三連覇の嚆矢として、翌年のシーズンも圧倒的な強さを見せた。$Q$,                           false, 2),
    ($Q$新作映画は嚆矢的な完成度を誇り、国内外の批評家から高い評価を得た。$Q$,                             false, 3),
    ($Q$最新技術の嚆矢を放ち、業界全体の革新が一気に加速した。$Q$,                                         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 20 FROM q;

-- ===== 問題4 用法 2/6 : 峻別 (正答③) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「峻別」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$委員会は異なる立場の意見を峻別し、全員の合意形成を目指した。$Q$,                   false, 1),
    ($Q$技術力の高い人材を峻別として新しいプロジェクトを立ち上げた。$Q$,                   false, 2),
    ($Q$事実と憶測を峻別することで、正確な情報のみを報告書に盛り込んだ。$Q$,              true,  3),
    ($Q$裁判所は証拠の峻別な調査を求め、双方の主張を詳細に検討した。$Q$,                  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 21 FROM q;

-- ===== 問題4 用法 3/6 : 精緻 (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「精緻」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$精緻な言動によって、彼女は組織内での信頼を得ることができた。$Q$,                   false, 1),
    ($Q$精緻な装飾が施された国宝級の茶碗が、特別展に展示された。$Q$,                       true,  2),
    ($Q$今回の会議では精緻な意見交換が行われ、解決策が浮かび上がった。$Q$,                  false, 3),
    ($Q$精緻なスケジュールで進められた工事は、期日通りに完工した。$Q$,                      false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 22 FROM q;

-- ===== 問題4 用法 4/6 : 斡旋 (正答④) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「斡旋」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$弁護士はクライアントの権利を斡旋し、裁判で全力を尽くした。$Q$,                     false, 1),
    ($Q$政府は市民の不満を斡旋するため、公開討論会を各地で開催した。$Q$,                   false, 2),
    ($Q$講師は受講生に適切な教材を斡旋し、資格取得を後押しした。$Q$,                       false, 3),
    ($Q$行政機関が貸主と借主の間に入って住宅を斡旋したことで、多くの住民が新居を確保できた。$Q$, true, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 23 FROM q;

-- ===== 問題4 用法 5/6 : 喫緊 (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「喫緊」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$その業務は喫緊に対処すべき案件として認識されていた。$Q$,                             false, 1),
    ($Q$外国人観光客の急増に対応する交通インフラの整備は、今や喫緊の課題だ。$Q$,             true,  2),
    ($Q$新事業の展開に向け、喫緊な資金調達が急務となっている。$Q$,                           false, 3),
    ($Q$プロジェクトの喫緊が迫り、チーム全員が残業を余儀なくされた。$Q$,                     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 24 FROM q;

-- ===== 問題4 用法 6/6 : 喧伝 (正答③) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'vocab',
    $Q$次の言葉の使い方として最もよいものを、１・２・３・４から一つ選びなさい。

「喧伝」$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$コーチは失敗を恐れない姿勢を喧伝し、選手たちの意識変革を促した。$Q$,               false, 1),
    ($Q$地域の過疎問題を喧伝するため、市はシンポジウムを開催した。$Q$,                     false, 2),
    ($Q$その大学の留学プログラムの充実ぶりは各方面で喧伝され、志願者が年々増加した。$Q$,   true,  3),
    ($Q$社員が職場の不満を喧伝したことで、経営陣と現場の溝がいっそう深まった。$Q$,         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 25 FROM q;

-- ============================================================
-- 問題5 文法形式の判断 (10問, sort_order 26〜35)
-- ============================================================

-- ===== 問題5 文法形式 1/10 : 〜に即して (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

法的規制（　　）対応することが、企業のコンプライアンス活動の根幹をなす。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$を基準に$Q$,  false, 1),
    ($Q$に即して$Q$,  true,  2),
    ($Q$を参考に$Q$,  false, 3),
    ($Q$に応じて$Q$,  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 26 FROM q;

-- ===== 問題5 文法形式 2/10 : 〜をよそに (正答③) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

祭りの喧騒（　　）、老人は縁側で静かに茶をすすっていた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$にもかかわらず$Q$,  false, 1),
    ($Q$をものともせず$Q$,  false, 2),
    ($Q$をよそに$Q$,        true,  3),
    ($Q$にはかまわず$Q$,    false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 27 FROM q;

-- ===== 問題5 文法形式 3/10 : 〜ならではの (正答①) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

この土地（　　）自然の恵みを活かした料理は、観光客から高い人気を誇っている。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$ならではの$Q$, true,  1),
    ($Q$だけが持つ$Q$, false, 2),
    ($Q$ゆえの$Q$,     false, 3),
    ($Q$としての$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 28 FROM q;

-- ===== 問題5 文法形式 4/10 : 〜に先んじて (正答③) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

他社（　　）新製品を市場に投入するため、開発チームは夜を徹して作業を続けた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$より先に$Q$,     false, 1),
    ($Q$に先立って$Q$,   false, 2),
    ($Q$に先んじて$Q$,   true,  3),
    ($Q$に先がけて$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 29 FROM q;

-- ===== 問題5 文法形式 5/10 : 〜ともなると (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

社長（　　）、個人の業績だけでなく、会社全体の方向性を見据えた決断が求められる。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$になれば$Q$,    false, 1),
    ($Q$ともなると$Q$,  true,  2),
    ($Q$でさえ$Q$,      false, 3),
    ($Q$であっても$Q$,  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 30 FROM q;

-- ===== 問題5 文法形式 6/10 : 〜をもって (正答①) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

本日の閉会式（　　）、今年度のすべての公式行事を終了いたします。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$をもって$Q$,   true,  1),
    ($Q$を境に$Q$,     false, 2),
    ($Q$にあたって$Q$, false, 3),
    ($Q$を契機に$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 31 FROM q;

-- ===== 問題5 文法形式 7/10 : 〜に照らして (正答③) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

法律の条文（　　）判断すると、この行為は明らかに違反にあたる。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$に基づいて$Q$,  false, 1),
    ($Q$に沿って$Q$,    false, 2),
    ($Q$に照らして$Q$,  true,  3),
    ($Q$に従って$Q$,    false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 32 FROM q;

-- ===== 問題5 文法形式 8/10 : 〜に鑑みて (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

昨今の急速な少子化の現状（　　）、教育予算の見直しが喫緊の課題として浮上している。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$を踏まえて$Q$,  false, 1),
    ($Q$に鑑みて$Q$,    true,  2),
    ($Q$を考慮して$Q$,  false, 3),
    ($Q$を見越して$Q$,  false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 33 FROM q;

-- ===== 問題5 文法形式 9/10 : 〜を契機に (正答①) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

その大規模なリコール事件（　　）、自動車メーカー各社は安全管理体制を全面的に見直した。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$を契機に$Q$,    true,  1),
    ($Q$を境に$Q$,      false, 2),
    ($Q$をきっかけに$Q$, false, 3),
    ($Q$によって$Q$,    false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 34 FROM q;

-- ===== 問題5 文法形式 10/10 : 〜んばかりに (正答②) =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

審判の笛が鳴った瞬間、チームメンバーは飛び上がら（　　）喜びを爆発させた。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$ずにはいられず$Q$, false, 1),
    ($Q$んばかりに$Q$,     true,  2),
    ($Q$ないほどに$Q$,     false, 3),
    ($Q$かのように$Q$,     false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 35 FROM q;

-- ============================================================
-- 問題6 文の組み立て (5問, sort_order 36〜40)
-- 完成文: 各問 下記コメントに記載。★ = 第3スロット
-- ============================================================

-- ===== 問題6 文の組み立て 1/5 =====
-- 完成文: 現代の科学技術をもってしても、この自然現象の仕組みを完全に解明することは難しい。
-- スロット順: ②科学技術 → ④をもってしても → ★③この自然現象の仕組みを → ①完全に解明することは
-- 正答: ③
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

現代の　_　_　★　_　難しい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$完全に解明することは$Q$,             false, 1),
    ($Q$科学技術$Q$,                         false, 2),
    ($Q$この自然現象の仕組みを$Q$,           true,  3),
    ($Q$をもってしても$Q$,                   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 36 FROM q;

-- ===== 問題6 文の組み立て 2/5 =====
-- 完成文: 企業の規模いかんにかかわらず、法令遵守はすべての事業主に求められる絶対的な義務だ。
-- スロット順: ②規模 → ①いかんにかかわらず → ★④法令遵守は → ③すべての事業主に求められる
-- 正答: ④
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

企業の　_　_　★　_　絶対的な義務だ。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$いかんにかかわらず$Q$,               false, 1),
    ($Q$規模$Q$,                             false, 2),
    ($Q$すべての事業主に求められる$Q$,       false, 3),
    ($Q$法令遵守は$Q$,                       true,  4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 37 FROM q;

-- ===== 問題6 文の組み立て 3/5 =====
-- 完成文: 市場拡大を見込んでいた経営陣の予測に反して、新商品の売り上げは発売直後から期待を大きく下回る水準にとどまった。
-- スロット順: ③経営陣の予測 → ②に反して → ★①新商品の売り上げは → ④発売直後から期待を大きく下回る
-- 正答: ①
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

市場拡大を見込んでいた　_　_　★　_　水準にとどまった。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$新商品の売り上げは$Q$,               true,  1),
    ($Q$に反して$Q$,                         false, 2),
    ($Q$経営陣の予測$Q$,                     false, 3),
    ($Q$発売直後から期待を大きく下回る$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 38 FROM q;

-- ===== 問題6 文の組み立て 4/5 =====
-- 完成文: この難局を打開できる人材は、今の組織に幅広い知識と交渉力を兼ね備えた彼をおいて他にいないだろう。
-- スロット順: ②幅広い知識と交渉力を兼ね備えた → ④彼を → ★③おいて → ①他に
-- 正答: ③
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

この難局を打開できる人材は、今の組織に　_　_　★　_　いないだろう。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$他に$Q$,                             false, 1),
    ($Q$幅広い知識と交渉力を兼ね備えた$Q$,  false, 2),
    ($Q$おいて$Q$,                           true,  3),
    ($Q$彼を$Q$,                             false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 39 FROM q;

-- ===== 問題6 文の組み立て 5/5 =====
-- 完成文: 複雑に絡み合った問題の全体像を把握することなしに、有効な解決策を打ち出すことはできない。
-- スロット順: ①問題の全体像を → ③把握する → ★②ことなしに → ④有効な解決策を打ち出すことは
-- 正答: ②
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

複雑に絡み合った　_　_　★　_　できない。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$問題の全体像を$Q$,                       false, 1),
    ($Q$ことなしに$Q$,                           true,  2),
    ($Q$把握する$Q$,                             false, 3),
    ($Q$有効な解決策を打ち出すことは$Q$,         false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 40 FROM q;

-- ============================================================
-- 問題7 文章の文法 (5問, sort_order 41〜45)
-- テーマ: 消費社会と物の価値観
-- passage の空欄: （ 41 ）余儀なくされる / （ 42 ）潜んでいる /
--                 （ 43 ）一方で / （ 44 ）定着しつつある / （ 45 ）帯びてきている
-- ============================================================

-- ===== 問題7 文章の文法 1/5 : （ 41 ） 正答② 余儀なくされる =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　現代の消費社会においては、物を所有することそのものに価値が置かれ、必要以上の購買行動が慢性化している。企業が次々と新製品を投入し、消費者は旧モデルをまだ使えるうちに買い替えを（ 41 ）状況が生まれている。

　こうした消費行動の背景には、「持つこと」で自己を定義しようとする意識が（ 42 ）。所有物の多寡が社会的地位の象徴とみなされる文化の中では、人々は際限のない購買サイクルに飲み込まれてしまう。

　（ 43 ）、近年では物ではなく「体験」に価値を見出す動きも広がってきた。旅行や学習、芸術鑑賞など、形に残らない体験こそが人生を豊かにするという考え方は、特に若い世代の間で（ 44 ）。

　持続可能な消費のあり方を考えるうえで、「足るを知る」という発想は今あらためて重要な意味を（ 45 ）。物の量ではなく質、そして人との繋がりを大切にする生き方こそが、真の豊かさへの道ではないだろうか。

（ 41 ）に入れるのに最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$やむを得なくなる$Q$,     false, 1),
    ($Q$余儀なくされる$Q$,       true,  2),
    ($Q$差し支えない$Q$,         false, 3),
    ($Q$免れることができる$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 41 FROM q;

-- ===== 問題7 文章の文法 2/5 : （ 42 ） 正答① 潜んでいる =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　現代の消費社会においては、物を所有することそのものに価値が置かれ、必要以上の購買行動が慢性化している。企業が次々と新製品を投入し、消費者は旧モデルをまだ使えるうちに買い替えを（ 41 ）状況が生まれている。

　こうした消費行動の背景には、「持つこと」で自己を定義しようとする意識が（ 42 ）。所有物の多寡が社会的地位の象徴とみなされる文化の中では、人々は際限のない購買サイクルに飲み込まれてしまう。

　（ 43 ）、近年では物ではなく「体験」に価値を見出す動きも広がってきた。旅行や学習、芸術鑑賞など、形に残らない体験こそが人生を豊かにするという考え方は、特に若い世代の間で（ 44 ）。

　持続可能な消費のあり方を考えるうえで、「足るを知る」という発想は今あらためて重要な意味を（ 45 ）。物の量ではなく質、そして人との繋がりを大切にする生き方こそが、真の豊かさへの道ではないだろうか。

（ 42 ）に入れるのに最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$潜んでいる$Q$,       true,  1),
    ($Q$覆われている$Q$,     false, 2),
    ($Q$拭われている$Q$,     false, 3),
    ($Q$反映されている$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 42 FROM q;

-- ===== 問題7 文章の文法 3/5 : （ 43 ） 正答② 一方で =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　現代の消費社会においては、物を所有することそのものに価値が置かれ、必要以上の購買行動が慢性化している。企業が次々と新製品を投入し、消費者は旧モデルをまだ使えるうちに買い替えを（ 41 ）状況が生まれている。

　こうした消費行動の背景には、「持つこと」で自己を定義しようとする意識が（ 42 ）。所有物の多寡が社会的地位の象徴とみなされる文化の中では、人々は際限のない購買サイクルに飲み込まれてしまう。

　（ 43 ）、近年では物ではなく「体験」に価値を見出す動きも広がってきた。旅行や学習、芸術鑑賞など、形に残らない体験こそが人生を豊かにするという考え方は、特に若い世代の間で（ 44 ）。

　持続可能な消費のあり方を考えるうえで、「足るを知る」という発想は今あらためて重要な意味を（ 45 ）。物の量ではなく質、そして人との繋がりを大切にする生き方こそが、真の豊かさへの道ではないだろうか。

（ 43 ）に入れるのに最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$したがって$Q$, false, 1),
    ($Q$一方で$Q$,     true,  2),
    ($Q$つまり$Q$,     false, 3),
    ($Q$それゆえ$Q$,   false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 43 FROM q;

-- ===== 問題7 文章の文法 4/5 : （ 44 ） 正答① 定着しつつある =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　現代の消費社会においては、物を所有することそのものに価値が置かれ、必要以上の購買行動が慢性化している。企業が次々と新製品を投入し、消費者は旧モデルをまだ使えるうちに買い替えを（ 41 ）状況が生まれている。

　こうした消費行動の背景には、「持つこと」で自己を定義しようとする意識が（ 42 ）。所有物の多寡が社会的地位の象徴とみなされる文化の中では、人々は際限のない購買サイクルに飲み込まれてしまう。

　（ 43 ）、近年では物ではなく「体験」に価値を見出す動きも広がってきた。旅行や学習、芸術鑑賞など、形に残らない体験こそが人生を豊かにするという考え方は、特に若い世代の間で（ 44 ）。

　持続可能な消費のあり方を考えるうえで、「足るを知る」という発想は今あらためて重要な意味を（ 45 ）。物の量ではなく質、そして人との繋がりを大切にする生き方こそが、真の豊かさへの道ではないだろうか。

（ 44 ）に入れるのに最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$定着しつつある$Q$,     true,  1),
    ($Q$縮小している$Q$,       false, 2),
    ($Q$疑問視されている$Q$,   false, 3),
    ($Q$覆されている$Q$,       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 44 FROM q;

-- ===== 問題7 文章の文法 5/5 : （ 45 ） 正答② 帯びてきている =====
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_category, question_text, points, is_published)
  VALUES (gen_random_uuid(), 'ad000001-0000-0000-0000-000000000131', 'multiple_choice', 'grammar',
    $Q$次の文章を読んで、文章全体の趣旨を踏まえて、（ 41 ）から（ 45 ）の中に入る最もよいものを、１・２・３・４から一つ選びなさい。

　現代の消費社会においては、物を所有することそのものに価値が置かれ、必要以上の購買行動が慢性化している。企業が次々と新製品を投入し、消費者は旧モデルをまだ使えるうちに買い替えを（ 41 ）状況が生まれている。

　こうした消費行動の背景には、「持つこと」で自己を定義しようとする意識が（ 42 ）。所有物の多寡が社会的地位の象徴とみなされる文化の中では、人々は際限のない購買サイクルに飲み込まれてしまう。

　（ 43 ）、近年では物ではなく「体験」に価値を見出す動きも広がってきた。旅行や学習、芸術鑑賞など、形に残らない体験こそが人生を豊かにするという考え方は、特に若い世代の間で（ 44 ）。

　持続可能な消費のあり方を考えるうえで、「足るを知る」という発想は今あらためて重要な意味を（ 45 ）。物の量ではなく質、そして人との繋がりを大切にする生き方こそが、真の豊かさへの道ではないだろうか。

（ 45 ）に入れるのに最もよいものを選びなさい。$Q$, 1, true)
  RETURNING id
), o AS (
  INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
  SELECT id, t, c, n FROM q, (VALUES
    ($Q$失いつつある$Q$,         false, 1),
    ($Q$帯びてきている$Q$,       true,  2),
    ($Q$覆そうとしている$Q$,     false, 3),
    ($Q$問い直している$Q$,       false, 4)
  ) AS v(t, c, n)
  RETURNING 1
)
INSERT INTO jlpt_mock_set_questions (set_id, question_id, section, sort_order)
SELECT 'aa000001-0000-0000-0000-000000000013', id, 'gengo_chishiki', 45 FROM q;

COMMIT;
