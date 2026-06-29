-- ============================================================
-- fix_set3_full_20260629.sql
-- N1 Set 3 言語知識(gengo_chishiki) + 読解(dokkai) 全面再構造化
-- 適用先: ローカルDB (jpjvzlmwzeiyukqqbdit)
-- Set 3 ID: aa000001-0000-0000-0000-000000000013
-- ============================================================

BEGIN;

-- ============================================================
-- PART 1: 言語知識 sort_order 再配置
-- (unique制約なし → 直接UPDATE可)
-- ============================================================

-- 問題1 漢字読み (sort 1-6)
UPDATE jlpt_mock_set_questions SET sort_order = 1
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-0000002003d3'; -- 覆る

UPDATE jlpt_mock_set_questions SET sort_order = 2
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200410'; -- 崇高

UPDATE jlpt_mock_set_questions SET sort_order = 3
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200418'; -- 理念

UPDATE jlpt_mock_set_questions SET sort_order = 4
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-00000020046d'; -- 遥かに

UPDATE jlpt_mock_set_questions SET sort_order = 5
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-0000002003ef'; -- 漂う

UPDATE jlpt_mock_set_questions SET sort_order = 6
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'da407a63-f34d-4dab-a859-ba0529b5cc1a'; -- 曖昧

-- 問題2 文脈規定 (sort 7-13)
UPDATE jlpt_mock_set_questions SET sort_order = 7
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000180004'; -- 顕著

UPDATE jlpt_mock_set_questions SET sort_order = 8
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200440'; -- 手法

UPDATE jlpt_mock_set_questions SET sort_order = 9
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-00000020041a'; -- 体制

UPDATE jlpt_mock_set_questions SET sort_order = 10
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200424'; -- 論点

UPDATE jlpt_mock_set_questions SET sort_order = 11
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200479'; -- 未だに

UPDATE jlpt_mock_set_questions SET sort_order = 12
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-0000002003f2'; -- 欺いて

UPDATE jlpt_mock_set_questions SET sort_order = 13
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'ac464b6c-e457-4c10-a133-71ed40a5a17c'; -- 弊害

-- 問題3 言い換え類義 (sort 14-19)
UPDATE jlpt_mock_set_questions SET sort_order = 14
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200463'; -- とりわけ

UPDATE jlpt_mock_set_questions SET sort_order = 15
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200471'; -- 何気なく

UPDATE jlpt_mock_set_questions SET sort_order = 16
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-00000020044c'; -- 台頭

UPDATE jlpt_mock_set_questions SET sort_order = 17
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'd56ef02f-e19c-4c54-a507-77148f1387ae'; -- 新規類義語①

UPDATE jlpt_mock_set_questions SET sort_order = 18
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = '64782ac3-a52c-456a-9928-573db989d838'; -- 新規類義語②

UPDATE jlpt_mock_set_questions SET sort_order = 19
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-0000002003fe'; -- 新規類義語③

-- 問題4 用法 (sort 20-25)
UPDATE jlpt_mock_set_questions SET sort_order = 20
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200437'; -- 一端

UPDATE jlpt_mock_set_questions SET sort_order = 21
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200470'; -- ろくに

UPDATE jlpt_mock_set_questions SET sort_order = 22
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-00000020040a'; -- 目まぐるしい

UPDATE jlpt_mock_set_questions SET sort_order = 23
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = '13fa5144-fa21-4997-93b4-66fa77ecdc8b'; -- 賜る

UPDATE jlpt_mock_set_questions SET sort_order = 24
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000200465'; -- ことごとく

UPDATE jlpt_mock_set_questions SET sort_order = 25
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id = 'b0000001-0000-4000-a000-000000170001'; -- 新規用法

-- 問題5～7 は sort 26-45 で変動なし (grammar section 以降)
-- ※ sort 26-35 は問題5としてそのまま維持
-- sort 36-45 は content を置き換え (下記 PART 3)

-- ============================================================
-- PART 2: question_category 修正 (jlpt_kanji → vocab)
-- ============================================================

-- sort 13 (弊害): 文脈規定なのに jlpt_kanji
UPDATE quiz_questions SET question_category = 'vocab'
WHERE id = 'ac464b6c-e457-4c10-a133-71ed40a5a17c';

-- sort 23 (賜る): 用法なのに jlpt_kanji
UPDATE quiz_questions SET question_category = 'vocab'
WHERE id = '13fa5144-fa21-4997-93b4-66fa77ecdc8b';

-- sort 6 (曖昧): 漢字読みなのに jlpt_kanji
UPDATE quiz_questions SET question_category = 'vocab'
WHERE id = 'da407a63-f34d-4dab-a859-ba0529b5cc1a';

-- ============================================================
-- PART 3: question_text 修正
-- ============================================================

-- 曖昧: 「どれですか？」→「どれか。」
UPDATE quiz_questions
SET question_text = '「曖昧」の読み方として正しいものはどれか。'
WHERE id = 'da407a63-f34d-4dab-a859-ba0529b5cc1a';

-- ============================================================
-- PART 4: 新規問題 コンテンツ置き換え (言語知識)
-- ============================================================

-- ---- 4-1: sort 17 (問題3 類義語①) --- 元: 漢字書き「じっせん」
UPDATE quiz_questions
SET question_text = '彼の提案は委員会によって一蹴された。「一蹴された」に最も意味が近いものはどれか。',
    question_category = 'vocab'
WHERE id = 'd56ef02f-e19c-4c54-a507-77148f1387ae';

DELETE FROM quiz_question_options WHERE question_id = 'd56ef02f-e19c-4c54-a507-77148f1387ae';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('d56ef02f-e19c-4c54-a507-77148f1387ae', '詳しく検討された',   false, 1),
  ('d56ef02f-e19c-4c54-a507-77148f1387ae', '即座に退けられた',   true,  2),
  ('d56ef02f-e19c-4c54-a507-77148f1387ae', '一部が採用された',   false, 3),
  ('d56ef02f-e19c-4c54-a507-77148f1387ae', '長期保留とされた',   false, 4);

-- ---- 4-2: sort 18 (問題3 類義語②) --- 元: 漢字書き「せんどう」
UPDATE quiz_questions
SET question_text = 'その病院は資金不足から存続が危殆に瀕している。「危殆に瀕している」に最も意味が近いものはどれか。',
    question_category = 'vocab'
WHERE id = '64782ac3-a52c-456a-9928-573db989d838';

DELETE FROM quiz_question_options WHERE question_id = '64782ac3-a52c-456a-9928-573db989d838';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('64782ac3-a52c-456a-9928-573db989d838', '深刻な問題を抱えている',    false, 1),
  ('64782ac3-a52c-456a-9928-573db989d838', '変革を迫られている',         false, 2),
  ('64782ac3-a52c-456a-9928-573db989d838', '存続が危うい状態にある',     true,  3),
  ('64782ac3-a52c-456a-9928-573db989d838', '回復の見通しが立っている',   false, 4);

-- ---- 4-3: sort 19 (問題3 類義語③) --- 元: 著しいの読み方
UPDATE quiz_questions
SET question_text = '試験期間中、睡眠も満足に取れず、彼女は憔悴しきっていた。「憔悴しきっていた」に最も意味が近いものはどれか。',
    question_category = 'vocab'
WHERE id = 'b0000001-0000-4000-a000-0000002003fe';

DELETE FROM quiz_question_options WHERE question_id = 'b0000001-0000-4000-a000-0000002003fe';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('b0000001-0000-4000-a000-0000002003fe', '興奮し切っていた',   false, 1),
  ('b0000001-0000-4000-a000-0000002003fe', '集中し切っていた',   false, 2),
  ('b0000001-0000-4000-a000-0000002003fe', '疲れ果てていた',     true,  3),
  ('b0000001-0000-4000-a000-0000002003fe', '深く悲しんでいた',   false, 4);

-- ---- 4-4: sort 25 (問題4 用法⑥) --- 元: 覆すの読み方
UPDATE quiz_questions
SET question_text = '「一概に」の使い方として最もよいものはどれか。',
    question_category = 'vocab'
WHERE id = 'b0000001-0000-4000-a000-000000170001';

DELETE FROM quiz_question_options WHERE question_id = 'b0000001-0000-4000-a000-000000170001';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('b0000001-0000-4000-a000-000000170001', '彼は一概に努力する人として知られている。',        false, 1),
  ('b0000001-0000-4000-a000-000000170001', '彼女は仕事を一概に素早くこなす。',                false, 2),
  ('b0000001-0000-4000-a000-000000170001', '人の行動を一概に悪いと決めつけるのは早計だ。',   true,  3),
  ('b0000001-0000-4000-a000-000000170001', '一概な状況でも慌てないことが大切だ。',            false, 4);

-- ---- 4-5: sort 36 (問題6 文の組み立て①) --- 元: ならでは穴埋め
UPDATE quiz_questions
SET question_text = E'次の文の ★ に入る最もよいものはどれか。\n\n新しい校長の　＿＿＿　＿＿＿　★　＿＿＿なった。',
    question_category = 'grammar'
WHERE id = '963c70c6-12dc-4206-ba26-23f2a65496ad';

DELETE FROM quiz_question_options WHERE question_id = '963c70c6-12dc-4206-ba26-23f2a65496ad';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('963c70c6-12dc-4206-ba26-23f2a65496ad', '指導力の',     false, 1),
  ('963c70c6-12dc-4206-ba26-23f2a65496ad', 'おかげで',     false, 2),
  ('963c70c6-12dc-4206-ba26-23f2a65496ad', '学校全体が',   true,  3),
  ('963c70c6-12dc-4206-ba26-23f2a65496ad', '一丸と',       false, 4);

-- ---- 4-6: sort 37 (問題6 文の組み立て②) --- 元: 〜げ用法識別
UPDATE quiz_questions
SET question_text = E'次の文の ★ に入る最もよいものはどれか。\n\nどんな　＿＿＿　＿＿＿　★　＿＿＿あきらめない。',
    question_category = 'grammar'
WHERE id = '03b9a3a3-5895-4bab-b870-4826a44d29db';

DELETE FROM quiz_question_options WHERE question_id = '03b9a3a3-5895-4bab-b870-4826a44d29db';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('03b9a3a3-5895-4bab-b870-4826a44d29db', '困難が',               false, 1),
  ('03b9a3a3-5895-4bab-b870-4826a44d29db', '待ち受けていようとも', false, 2),
  ('03b9a3a3-5895-4bab-b870-4826a44d29db', '彼女は',               true,  3),
  ('03b9a3a3-5895-4bab-b870-4826a44d29db', '決して',               false, 4);

-- ---- 4-7: sort 38 (問題6 文の組み立て③) --- 元: てはじめて意味
UPDATE quiz_questions
SET question_text = E'次の文の ★ に入る最もよいものはどれか。\n\nその芸術家は　＿＿＿　＿＿＿　★　＿＿＿表現し続けた。',
    question_category = 'grammar'
WHERE id = '21eaae85-620f-43af-bc0d-ff8eced1f6e2';

DELETE FROM quiz_question_options WHERE question_id = '21eaae85-620f-43af-bc0d-ff8eced1f6e2';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('21eaae85-620f-43af-bc0d-ff8eced1f6e2', '時代の批判を',       false, 1),
  ('21eaae85-620f-43af-bc0d-ff8eced1f6e2', 'ものともせず',       false, 2),
  ('21eaae85-620f-43af-bc0d-ff8eced1f6e2', '自らの世界を',       true,  3),
  ('21eaae85-620f-43af-bc0d-ff8eced1f6e2', '独自の手法で',       false, 4);

-- ---- 4-8: sort 39 (問題6 文の組み立て④) --- 元: に至っては穴埋め
UPDATE quiz_questions
SET question_text = E'次の文の ★ に入る最もよいものはどれか。\n\nこの問題を解決できる人は、　＿＿＿　＿＿＿　★　＿＿＿。',
    question_category = 'grammar'
WHERE id = '76d2684a-8f1c-4246-8f55-1f834ad597d9';

DELETE FROM quiz_question_options WHERE question_id = '76d2684a-8f1c-4246-8f55-1f834ad597d9';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('76d2684a-8f1c-4246-8f55-1f834ad597d9', 'あなたを',   false, 1),
  ('76d2684a-8f1c-4246-8f55-1f834ad597d9', 'おいて',     false, 2),
  ('76d2684a-8f1c-4246-8f55-1f834ad597d9', 'ほかに',     true,  3),
  ('76d2684a-8f1c-4246-8f55-1f834ad597d9', 'いない',     false, 4);

-- ---- 4-9: sort 40 (問題6 文の組み立て⑤) --- 元: ずにはおかない
UPDATE quiz_questions
SET question_text = E'次の文の ★ に入る最もよいものはどれか。\n\n彼女の　＿＿＿　＿＿＿　★　＿＿＿となった。',
    question_category = 'grammar'
WHERE id = 'f98f3806-cd56-466a-bd9b-7311b34f25a4';

DELETE FROM quiz_question_options WHERE question_id = 'f98f3806-cd56-466a-bd9b-7311b34f25a4';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('f98f3806-cd56-466a-bd9b-7311b34f25a4', 'そのひと言が',   false, 1),
  ('f98f3806-cd56-466a-bd9b-7311b34f25a4', '長年の誤解を',   false, 2),
  ('f98f3806-cd56-466a-bd9b-7311b34f25a4', '解く',           true,  3),
  ('f98f3806-cd56-466a-bd9b-7311b34f25a4', '決め手',         false, 4);

-- ---- 問題7 文章の文法 共有文章 (sorts 41-45) ----
-- 共有パッセージ:
-- グローバル化が加速する現代において...
-- [41]に瀕している / [42]ず / [43]ただし / [44]ことを考えると / [45]こそ求められる

-- ---- 4-10: sort 41 ([41]の問い)
UPDATE quiz_questions
SET question_text = 'グローバル化が加速する現代において、言語の役割はかつてないほど複雑な様相を呈している。英語が国際共通語としての地位を強化する一方、多くの少数言語が話者の減少に伴い消滅の危機[41]。言語の喪失は、意思疎通の手段が失われることにとどまら[42]、その言語に埋め込まれた固有の世界観や文化的記憶の消滅をも意味する。

こうした状況に対し、各地で言語復興の取り組みが始まっている。行政が地域言語の教育を支援したり、デジタル技術を活用してアーカイブを構築したりする試みが広がっている。[43]、言語の復興は話者コミュニティ自身の積極的な参加なくしては成立しないことも忘れてはならない。

英語優位の国際環境に適応する力を身につける[44]、母語より英語習得を優先しようとする若者が増えているのも事実だ。これを単純に批判することは難しい。重要なのは、英語能力の獲得と母語・民族語のアイデンティティを二者択一ではなく、相互補完的なものとして捉える視点[45]。

[41]に入る最もよいものはどれか。',
    question_category = 'grammar'
WHERE id = '186ae649-6281-410e-98b8-f6cb06375345';

DELETE FROM quiz_question_options WHERE question_id = '186ae649-6281-410e-98b8-f6cb06375345';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('186ae649-6281-410e-98b8-f6cb06375345', 'に瀕している',         true,  1),
  ('186ae649-6281-410e-98b8-f6cb06375345', 'に収まっている',       false, 2),
  ('186ae649-6281-410e-98b8-f6cb06375345', 'に留まっている',       false, 3),
  ('186ae649-6281-410e-98b8-f6cb06375345', 'を余儀なくされている', false, 4);

-- ---- 4-11: sort 42 ([42]の問い)
UPDATE quiz_questions
SET question_text = 'グローバル化が加速する現代において、言語の役割はかつてないほど複雑な様相を呈している。英語が国際共通語としての地位を強化する一方、多くの少数言語が話者の減少に伴い消滅の危機[41]。言語の喪失は、意思疎通の手段が失われることにとどまら[42]、その言語に埋め込まれた固有の世界観や文化的記憶の消滅をも意味する。

こうした状況に対し、各地で言語復興の取り組みが始まっている。行政が地域言語の教育を支援したり、デジタル技術を活用してアーカイブを構築したりする試みが広がっている。[43]、言語の復興は話者コミュニティ自身の積極的な参加なくしては成立しないことも忘れてはならない。

英語優位の国際環境に適応する力を身につける[44]、母語より英語習得を優先しようとする若者が増えているのも事実だ。これを単純に批判することは難しい。重要なのは、英語能力の獲得と母語・民族語のアイデンティティを二者択一ではなく、相互補完的なものとして捉える視点[45]。

[42]に入る最もよいものはどれか。',
    question_category = 'grammar'
WHERE id = '542b95ae-15d5-4a78-8259-0ed4280d53c7';

DELETE FROM quiz_question_options WHERE question_id = '542b95ae-15d5-4a78-8259-0ed4280d53c7';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('542b95ae-15d5-4a78-8259-0ed4280d53c7', 'ず',         true,  1),
  ('542b95ae-15d5-4a78-8259-0ed4280d53c7', 'ない',       false, 2),
  ('542b95ae-15d5-4a78-8259-0ed4280d53c7', 'なかった',   false, 3),
  ('542b95ae-15d5-4a78-8259-0ed4280d53c7', 'ないまま',   false, 4);

-- ---- 4-12: sort 43 ([43]の問い)
UPDATE quiz_questions
SET question_text = 'グローバル化が加速する現代において、言語の役割はかつてないほど複雑な様相を呈している。英語が国際共通語としての地位を強化する一方、多くの少数言語が話者の減少に伴い消滅の危機[41]。言語の喪失は、意思疎通の手段が失われることにとどまら[42]、その言語に埋め込まれた固有の世界観や文化的記憶の消滅をも意味する。

こうした状況に対し、各地で言語復興の取り組みが始まっている。行政が地域言語の教育を支援したり、デジタル技術を活用してアーカイブを構築したりする試みが広がっている。[43]、言語の復興は話者コミュニティ自身の積極的な参加なくしては成立しないことも忘れてはならない。

英語優位の国際環境に適応する力を身につける[44]、母語より英語習得を優先しようとする若者が増えているのも事実だ。これを単純に批判することは難しい。重要なのは、英語能力の獲得と母語・民族語のアイデンティティを二者択一ではなく、相互補完的なものとして捉える視点[45]。

[43]に入る最もよいものはどれか。',
    question_category = 'grammar'
WHERE id = 'bbc6de90-10b5-41fc-b235-3d1dbc7263cf';

DELETE FROM quiz_question_options WHERE question_id = 'bbc6de90-10b5-41fc-b235-3d1dbc7263cf';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('bbc6de90-10b5-41fc-b235-3d1dbc7263cf', 'ただし',     true,  1),
  ('bbc6de90-10b5-41fc-b235-3d1dbc7263cf', 'そのうえ',   false, 2),
  ('bbc6de90-10b5-41fc-b235-3d1dbc7263cf', 'つまり',     false, 3),
  ('bbc6de90-10b5-41fc-b235-3d1dbc7263cf', 'さらに',     false, 4);

-- ---- 4-13: sort 44 ([44]の問い)
UPDATE quiz_questions
SET question_text = 'グローバル化が加速する現代において、言語の役割はかつてないほど複雑な様相を呈している。英語が国際共通語としての地位を強化する一方、多くの少数言語が話者の減少に伴い消滅の危機[41]。言語の喪失は、意思疎通の手段が失われることにとどまら[42]、その言語に埋め込まれた固有の世界観や文化的記憶の消滅をも意味する。

こうした状況に対し、各地で言語復興の取り組みが始まっている。行政が地域言語の教育を支援したり、デジタル技術を活用してアーカイブを構築したりする試みが広がっている。[43]、言語の復興は話者コミュニティ自身の積極的な参加なくしては成立しないことも忘れてはならない。

英語優位の国際環境に適応する力を身につける[44]、母語より英語習得を優先しようとする若者が増えているのも事実だ。これを単純に批判することは難しい。重要なのは、英語能力の獲得と母語・民族語のアイデンティティを二者択一ではなく、相互補完的なものとして捉える視点[45]。

[44]に入る最もよいものはどれか。',
    question_category = 'grammar'
WHERE id = '283b1314-1804-4577-95d1-cd6d9a9295ea';

DELETE FROM quiz_question_options WHERE question_id = '283b1314-1804-4577-95d1-cd6d9a9295ea';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('283b1314-1804-4577-95d1-cd6d9a9295ea', 'ことを考えると',   true,  1),
  ('283b1314-1804-4577-95d1-cd6d9a9295ea', 'ことがあれば',     false, 2),
  ('283b1314-1804-4577-95d1-cd6d9a9295ea', 'ことに反して',     false, 3),
  ('283b1314-1804-4577-95d1-cd6d9a9295ea', 'ことなしに',       false, 4);

-- ---- 4-14: sort 45 ([45]の問い)
UPDATE quiz_questions
SET question_text = 'グローバル化が加速する現代において、言語の役割はかつてないほど複雑な様相を呈している。英語が国際共通語としての地位を強化する一方、多くの少数言語が話者の減少に伴い消滅の危機[41]。言語の喪失は、意思疎通の手段が失われることにとどまら[42]、その言語に埋め込まれた固有の世界観や文化的記憶の消滅をも意味する。

こうした状況に対し、各地で言語復興の取り組みが始まっている。行政が地域言語の教育を支援したり、デジタル技術を活用してアーカイブを構築したりする試みが広がっている。[43]、言語の復興は話者コミュニティ自身の積極的な参加なくしては成立しないことも忘れてはならない。

英語優位の国際環境に適応する力を身につける[44]、母語より英語習得を優先しようとする若者が増えているのも事実だ。これを単純に批判することは難しい。重要なのは、英語能力の獲得と母語・民族語のアイデンティティを二者択一ではなく、相互補完的なものとして捉える視点[45]。

[45]に入る最もよいものはどれか。',
    question_category = 'grammar'
WHERE id = '0465df38-4ff8-415a-b34b-4dc1fc79a141';

DELETE FROM quiz_question_options WHERE question_id = '0465df38-4ff8-415a-b34b-4dc1fc79a141';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('0465df38-4ff8-415a-b34b-4dc1fc79a141', 'こそ求められる',           true,  1),
  ('0465df38-4ff8-415a-b34b-4dc1fc79a141', 'だけが答えだ',             false, 2),
  ('0465df38-4ff8-415a-b34b-4dc1fc79a141', 'が問われている',           false, 3),
  ('0465df38-4ff8-415a-b34b-4dc1fc79a141', 'を見失ってはならない',     false, 4);

-- ============================================================
-- PART 5: 言語知識 daimon / subtype 設定
-- ============================================================

UPDATE jlpt_mock_set_questions
SET daimon = 1, subtype = '漢字読み'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    'b0000001-0000-4000-a000-0000002003d3',
    'b0000001-0000-4000-a000-000000200410',
    'b0000001-0000-4000-a000-000000200418',
    'b0000001-0000-4000-a000-00000020046d',
    'b0000001-0000-4000-a000-0000002003ef',
    'da407a63-f34d-4dab-a859-ba0529b5cc1a'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 2, subtype = '文脈規定'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    'b0000001-0000-4000-a000-000000180004',
    'b0000001-0000-4000-a000-000000200440',
    'b0000001-0000-4000-a000-00000020041a',
    'b0000001-0000-4000-a000-000000200424',
    'b0000001-0000-4000-a000-000000200479',
    'b0000001-0000-4000-a000-0000002003f2',
    'ac464b6c-e457-4c10-a133-71ed40a5a17c'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 3, subtype = '言い換え類義'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    'b0000001-0000-4000-a000-000000200463',
    'b0000001-0000-4000-a000-000000200471',
    'b0000001-0000-4000-a000-00000020044c',
    'd56ef02f-e19c-4c54-a507-77148f1387ae',
    '64782ac3-a52c-456a-9928-573db989d838',
    'b0000001-0000-4000-a000-0000002003fe'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 4, subtype = '用法'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    'b0000001-0000-4000-a000-000000200437',
    'b0000001-0000-4000-a000-000000200470',
    'b0000001-0000-4000-a000-00000020040a',
    '13fa5144-fa21-4997-93b4-66fa77ecdc8b',
    'b0000001-0000-4000-a000-000000200465',
    'b0000001-0000-4000-a000-000000170001'
  );

-- sort 26-35 は問題5 文法形式の判断 (sort変更なしなのでsort_order範囲で更新)
UPDATE jlpt_mock_set_questions
SET daimon = 5, subtype = '文法形式の判断'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND sort_order BETWEEN 26 AND 35;

UPDATE jlpt_mock_set_questions
SET daimon = 6, subtype = '文の組み立て'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    '963c70c6-12dc-4206-ba26-23f2a65496ad',
    '03b9a3a3-5895-4bab-b870-4826a44d29db',
    '21eaae85-620f-43af-bc0d-ff8eced1f6e2',
    '76d2684a-8f1c-4246-8f55-1f834ad597d9',
    'f98f3806-cd56-466a-bd9b-7311b34f25a4'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 7, subtype = '文章の文法'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'gengo_chishiki'
  AND question_id IN (
    '186ae649-6281-410e-98b8-f6cb06375345',
    '542b95ae-15d5-4a78-8259-0ed4280d53c7',
    'bbc6de90-10b5-41fc-b235-3d1dbc7263cf',
    '283b1314-1804-4577-95d1-cd6d9a9295ea',
    '0465df38-4ff8-415a-b34b-4dc1fc79a141'
  );

-- ============================================================
-- PART 6: 読解 (dokkai) sort_order 再配置
-- ============================================================

-- 問題8 内容理解(短文) sort 1-4
UPDATE jlpt_mock_set_questions SET sort_order = 1
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'd28d881d-676f-417b-98f9-f031a8ee69d4'; -- 孤独/2021年

UPDATE jlpt_mock_set_questions SET sort_order = 2
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'ab2912b3-485d-413b-9c47-c88102a8759d'; -- 敬語/五分類

UPDATE jlpt_mock_set_questions SET sort_order = 3
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'db4e43a6-157d-492a-9a7b-46af757eedbd'; -- ダブルリミテッド

UPDATE jlpt_mock_set_questions SET sort_order = 4
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '25f824ab-226c-489e-a251-8fee5d190618'; -- 介護/低賃金

-- 問題9 内容理解(中文) sort 5-13
-- Passage A: 能楽「間」
UPDATE jlpt_mock_set_questions SET sort_order = 5
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '74c905b8-9bfc-4206-bb8a-8bcfa2daf22d'; -- 能楽 Q1(keep)

UPDATE jlpt_mock_set_questions SET sort_order = 6
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '373859b2-7755-4ee2-8807-c13eaf04fa85'; -- 能楽 Q2(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 7
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '988c63b2-f27b-4389-ad50-5193d136e11e'; -- 能楽 Q3(新規)

-- Passage B: 格差
UPDATE jlpt_mock_set_questions SET sort_order = 8
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'bb847480-7afe-4d0d-b6d7-7ef0ecc9c050'; -- 格差 Q1(keep)

UPDATE jlpt_mock_set_questions SET sort_order = 9
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '15e48a11-c5f0-4197-a2c0-f5cd8552fc55'; -- 格差 Q2(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 10
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '4d2f5990-da6f-486b-af4a-5bb32c280d25'; -- 格差 Q3(新規)

-- Passage C: 参勤交代
UPDATE jlpt_mock_set_questions SET sort_order = 11
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'dab1c265-e076-4d99-a8da-fd85e92ebe88'; -- 参勤交代 Q1(keep)

UPDATE jlpt_mock_set_questions SET sort_order = 12
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '4558e380-e392-4a25-b8b7-063b15be2078'; -- 参勤交代 Q2(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 13
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be'; -- 参勤交代 Q3(新規)

-- 問題10 内容理解(長文) sort 14-17: 翻訳/フンボルト
UPDATE jlpt_mock_set_questions SET sort_order = 14
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'a8cd2060-867a-4c92-b889-e079351a4d58'; -- 翻訳 Q1(keep)

UPDATE jlpt_mock_set_questions SET sort_order = 15
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '56320793-eef5-410a-aeb2-5367fc148556'; -- 翻訳 Q2(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 16
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'd574581e-38fa-438e-b147-9a56a15dfa4f'; -- 翻訳 Q3(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 17
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'dc8bd037-3729-40f6-9d2f-a32217e94d68'; -- 翻訳 Q4(新規)

-- 問題11 統合理解 sort 18-19: 生成AIと著作権 A/B
UPDATE jlpt_mock_set_questions SET sort_order = 18
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '0142c7f4-b61a-479a-91e8-c4788dc3a7bd'; -- A/B Q1

UPDATE jlpt_mock_set_questions SET sort_order = 19
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a'; -- A/B Q2

-- 問題12 主張理解(長文) sort 20-23: 刑罰の正当化
UPDATE jlpt_mock_set_questions SET sort_order = 20
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '3bec46c1-4933-4e28-8714-3d7be3f6ac38'; -- 刑罰 Q1(keep)

UPDATE jlpt_mock_set_questions SET sort_order = 21
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '8352dc4a-84e6-48f2-82d8-a9468420eabb'; -- 刑罰 Q2(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 22
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '4221e8d4-2275-4d6c-8aee-363e492da942'; -- 刑罰 Q3(新規)

UPDATE jlpt_mock_set_questions SET sort_order = 23
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '03014357-6d9e-4584-bdb1-138dc225bddc'; -- 刑罰 Q4(新規)

-- 問題13 情報検索 sort 24-25
UPDATE jlpt_mock_set_questions SET sort_order = 24
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = '28855752-aeec-46d4-98aa-ff522ffb6b14'; -- 情報検索 Q1

UPDATE jlpt_mock_set_questions SET sort_order = 25
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id = 'c95840d3-df64-473d-8de3-d0a758046d56'; -- 情報検索 Q2

-- ============================================================
-- PART 7: 読解 既存問題 question_text 修正
-- (「次の文章を読んで…」プレフィックス削除 + 「質問：」ラベル削除)
-- ============================================================

-- sort 1 (孤独/担当大臣)
UPDATE quiz_questions
SET question_text = '現代社会における「孤独」は、個人的な問題にとどまらず、社会的課題として認識されるようになった。英国では2018年に「孤独担当大臣」が設置され、日本でも2021年に同様のポストが新設された。孤独は精神的健康に悪影響を及ぼすだけでなく、心臓病や認知症のリスクを高めるという研究結果もある。

日本で孤独担当大臣が設置されたのはいつか。'
WHERE id = 'd28d881d-676f-417b-98f9-f031a8ee69d4';

-- sort 2 (敬語/五分類)
UPDATE quiz_questions
SET question_text = '伝統的に、日本語の敬語は「尊敬語」「謙譲語」「丁寧語」の三分類で整理されてきた。ところが、2007年に文化審議会が発表した「敬語の指針」では、これが五分類に再編された。具体的には、従来の謙譲語が「謙譲語I」と「謙譲語II（丁重語）」に分けられ、また「丁寧語」から「美化語」が独立した。

2007年の「敬語の指針」で、敬語はどのように変わったか。'
WHERE id = 'ab2912b3-485d-413b-9c47-c88102a8759d';

-- sort 3 (ダブルリミテッド)
UPDATE quiz_questions
SET question_text = '日本語能力が不十分なまま通常の授業に参加せざるを得ない子どもたちは、学力の遅れだけでなく、アイデンティティの揺らぎという問題にも直面する。母語も日本語も中途半端になる「ダブルリミテッド」の状態に陥るケースも報告されている。

「ダブルリミテッド」とはどのような状態か。'
WHERE id = 'db4e43a6-157d-492a-9a7b-46af757eedbd';

-- sort 4 (介護/低賃金)
UPDATE quiz_questions
SET question_text = '最も深刻なのは、介護人材の不足である。介護職の離職率は高く、その背景には低賃金と過酷な労働環境がある。全産業平均と比較して月額約6万円低い給与水準は、若い世代がこの業界を敬遠する一因となっている。

介護人材が不足している主な背景は何か。'
WHERE id = '25f824ab-226c-489e-a251-8fee5d190618';

-- sort 5 (能楽「間」Q1 keep)
UPDATE quiz_questions
SET question_text = '日本の伝統的な能楽において、「間」の概念は単なる沈黙や休止ではなく、演技そのものの一部として積極的に意味を持つ。西洋演劇が継続的な行為の流れによって観客を引きつけるのに対し、能楽は静止と動作の緊張関係の中に美を見出す。演者が舞台上で静止するとき、その静けさは余白としての「空」ではなく、観客の内なる想像力を呼び起こす触媒として機能する。こうした審美観は、書道における余白の使い方や、枯山水の庭園設計にも通じており、日本文化に通底する美的原理と言えよう。現代の舞台芸術においても、この「間」の感覚は意識的に援用され、表現の深度を増す手法として再評価されている。

本文における「間」の説明として最も適切なものはどれか。'
WHERE id = '74c905b8-9bfc-4206-bb8a-8bcfa2daf22d';

-- sort 8 (格差 Q1 keep)
UPDATE quiz_questions
SET question_text = '現代社会における格差の問題は、単なる所得の多寡に還元されるものではない。経済的資源の不均等な分配は、教育機会・医療へのアクセス・社会的ネットワークの格差を連鎖的に生み出し、やがて「機会の不平等」として固定化していく。特に注目すべきは、格差が世代をまたいで再生産されるという構造的側面である。富裕層の子息は質の高い教育を受け、人的資本を蓄積して上位の地位を継承する一方、貧困層の子どもは劣悪な環境下で選択肢を狭められる。こうした閉鎖的な社会移動の現実は、能力主義（メリトクラシー）の理念とは大きく乖離している。格差の縮小を目指すならば、結果の平等ではなく条件の平等を整える制度設計が不可欠であり、個人の努力だけで格差を克服できるという通念は再考を迫られている。

本文で筆者が最も強調している点はどれか。'
WHERE id = 'bb847480-7afe-4d0d-b6d7-7ef0ecc9c050';

-- sort 11 (参勤交代 Q1 keep)
UPDATE quiz_questions
SET question_text = '江戸時代の参勤交代制度は、単なる大名統制の手段として語られることが多いが、その社会的・文化的影響は多岐にわたる。大名行列が全国各地を定期的に往来したことにより、街道沿いの宿場町は経済的恩恵を受け、各藩の文化・物産が交流する場ともなった。また、藩士たちが江戸と国元を行き来する中で、中央の学問や芸術が地方へと伝播し、文化の均質化が緩やかに進んだ。一方で、莫大な参勤費用は各藩の財政を圧迫し、藩政改革を余儀なくされる要因となった。この制度が廃止された明治以降、日本社会の流動性は急速に変化し、参勤交代が担っていた人的・文化的交流の機能は別の形で継承されていく。

参勤交代の社会的影響として、本文が最も強調していることは何か。'
WHERE id = 'dab1c265-e076-4d99-a8da-fd85e92ebe88';

-- sort 14 (翻訳 Q1 keep)
UPDATE quiz_questions
SET question_text = '言語は単なる情報伝達の道具ではなく、思考そのものを形成する媒体である。ウィルヘルム・フォン・フンボルトが指摘したように、各言語はそれ固有の「世界観」を内包しており、異なる言語間の翻訳は等価な意味の移送ではなく、つねに何らかの意味の変容を伴う。たとえば、日本語の「木漏れ日」「物の哀れ」「間」といった概念は、他の言語に完全に翻訳することが極めて困難とされる。これは単に語彙の欠如ではなく、その概念を可能にする感性的・文化的文脈ごと移植する不可能性を示している。さらに言えば、翻訳という行為は原文と訳文の間に新たな第三のテクストを生み出す創造的営為でもある。完全な翻訳という理想は追求されるべき地平であって、達成可能な目標ではない。この認識こそが、翻訳者に課された根本的な倫理的条件であるといえよう。

筆者が翻訳に対して述べている根本的な立場はどれか。'
WHERE id = 'a8cd2060-867a-4c92-b889-e079351a4d58';

-- sort 20 (刑罰 Q1 keep)
UPDATE quiz_questions
SET question_text = '刑罰はなぜ正当化されるのか。この問いに対する答えは、応報主義と帰結主義という二つの大きな立場に収束する。応報主義は、犯罪者は害を与えたことに対して罰せられるべきだという直感——応分の報いを受けるべきだという正義感——に根ざす。刑罰は将来の効果への手段ではなく、過去の行為に対する道義的反応として正当化される。
帰結主義は、刑罰を将来の犯罪を防止するための手段として位置づける。抑止・隔離・更生の三つが主な機能として挙げられる。この立場では、刑罰の種類・重さは再犯防止の効果によって評価され、効果のない刑罰には正当性がないことになる。
近年、修復的司法という第三のアプローチが注目を集めている。犯罪を加害者と被害者・共同体の関係の破壊として捉え、刑罰よりも対話と修復を通じた関係の再建を目指すものである。応報でも抑止でもなく、傷ついた関係の回復を中心に据えるこのアプローチは、従来の刑事司法の枠組みを超えた問いを提起している。

応報主義が刑罰を正当化する根拠として本文から読み取れるものはどれか。'
WHERE id = '3bec46c1-4933-4e28-8714-3d7be3f6ac38';

-- ============================================================
-- PART 8: 読解 新規問題 コンテンツ置き換え
-- ============================================================

-- ---- 8-1: sort 6 能楽 Q2 (元: 生物多様性カスケード)
UPDATE quiz_questions
SET question_text = '日本の伝統的な能楽において、「間」の概念は単なる沈黙や休止ではなく、演技そのものの一部として積極的に意味を持つ。西洋演劇が継続的な行為の流れによって観客を引きつけるのに対し、能楽は静止と動作の緊張関係の中に美を見出す。演者が舞台上で静止するとき、その静けさは余白としての「空」ではなく、観客の内なる想像力を呼び起こす触媒として機能する。こうした審美観は、書道における余白の使い方や、枯山水の庭園設計にも通じており、日本文化に通底する美的原理と言えよう。現代の舞台芸術においても、この「間」の感覚は意識的に援用され、表現の深度を増す手法として再評価されている。

本文が挙げる「間」の審美観と共通する日本文化の事例として、本文が言及しているものはどれか。'
WHERE id = '373859b2-7755-4ee2-8807-c13eaf04fa85';

DELETE FROM quiz_question_options WHERE question_id = '373859b2-7755-4ee2-8807-c13eaf04fa85';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('373859b2-7755-4ee2-8807-c13eaf04fa85', '西洋演劇における継続的な行為の流れ',     false, 1),
  ('373859b2-7755-4ee2-8807-c13eaf04fa85', '書道における余白の使い方',               true,  2),
  ('373859b2-7755-4ee2-8807-c13eaf04fa85', '現代演劇における沈黙の演出技法',         false, 3),
  ('373859b2-7755-4ee2-8807-c13eaf04fa85', '映像表現におけるカットの間隔',           false, 4);

-- ---- 8-2: sort 7 能楽 Q3 (元: コンセプチュアリズム)
UPDATE quiz_questions
SET question_text = '日本の伝統的な能楽において、「間」の概念は単なる沈黙や休止ではなく、演技そのものの一部として積極的に意味を持つ。西洋演劇が継続的な行為の流れによって観客を引きつけるのに対し、能楽は静止と動作の緊張関係の中に美を見出す。演者が舞台上で静止するとき、その静けさは余白としての「空」ではなく、観客の内なる想像力を呼び起こす触媒として機能する。こうした審美観は、書道における余白の使い方や、枯山水の庭園設計にも通じており、日本文化に通底する美的原理と言えよう。現代の舞台芸術においても、この「間」の感覚は意識的に援用され、表現の深度を増す手法として再評価されている。

演者が舞台上で静止するとき、その静けさが「触媒として機能する」とはどういうことか。'
WHERE id = '988c63b2-f27b-4389-ad50-5193d136e11e';

DELETE FROM quiz_question_options WHERE question_id = '988c63b2-f27b-4389-ad50-5193d136e11e';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('988c63b2-f27b-4389-ad50-5193d136e11e', '観客に次の動作の準備を知らせる役割を果たす',         false, 1),
  ('988c63b2-f27b-4389-ad50-5193d136e11e', '演者が次の動作のためにエネルギーを蓄える時間である', false, 2),
  ('988c63b2-f27b-4389-ad50-5193d136e11e', '観客の内なる想像力を呼び起こす働きをする',           true,  3),
  ('988c63b2-f27b-4389-ad50-5193d136e11e', '舞台全体の緊張感を和らげる効果がある',               false, 4);

-- ---- 8-3: sort 9 格差 Q2 (元: 多文化共生)
UPDATE quiz_questions
SET question_text = '現代社会における格差の問題は、単なる所得の多寡に還元されるものではない。経済的資源の不均等な分配は、教育機会・医療へのアクセス・社会的ネットワークの格差を連鎖的に生み出し、やがて「機会の不平等」として固定化していく。特に注目すべきは、格差が世代をまたいで再生産されるという構造的側面である。富裕層の子息は質の高い教育を受け、人的資本を蓄積して上位の地位を継承する一方、貧困層の子どもは劣悪な環境下で選択肢を狭められる。こうした閉鎖的な社会移動の現実は、能力主義（メリトクラシー）の理念とは大きく乖離している。格差の縮小を目指すならば、結果の平等ではなく条件の平等を整える制度設計が不可欠であり、個人の努力だけで格差を克服できるという通念は再考を迫られている。

「機会の不平等」について、本文で述べられている内容として正しいものはどれか。'
WHERE id = '15e48a11-c5f0-4197-a2c0-f5cd8552fc55';

DELETE FROM quiz_question_options WHERE question_id = '15e48a11-c5f0-4197-a2c0-f5cd8552fc55';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('15e48a11-c5f0-4197-a2c0-f5cd8552fc55', '機会の不平等は主に所得格差のみによって引き起こされる',                               false, 1),
  ('15e48a11-c5f0-4197-a2c0-f5cd8552fc55', '医療へのアクセスの不平等が最大の原因だ',                                             false, 2),
  ('15e48a11-c5f0-4197-a2c0-f5cd8552fc55', '経済的格差が教育・医療・社会的ネットワークの格差を連鎖的に生み出すことで固定化する', true,  3),
  ('15e48a11-c5f0-4197-a2c0-f5cd8552fc55', '機会の不平等は個人の努力によって乗り越えられる',                                     false, 4);

-- ---- 8-4: sort 10 格差 Q3 (元: 憲法解釈)
UPDATE quiz_questions
SET question_text = '現代社会における格差の問題は、単なる所得の多寡に還元されるものではない。経済的資源の不均等な分配は、教育機会・医療へのアクセス・社会的ネットワークの格差を連鎖的に生み出し、やがて「機会の不平等」として固定化していく。特に注目すべきは、格差が世代をまたいで再生産されるという構造的側面である。富裕層の子息は質の高い教育を受け、人的資本を蓄積して上位の地位を継承する一方、貧困層の子どもは劣悪な環境下で選択肢を狭められる。こうした閉鎖的な社会移動の現実は、能力主義（メリトクラシー）の理念とは大きく乖離している。格差の縮小を目指すならば、結果の平等ではなく条件の平等を整える制度設計が不可欠であり、個人の努力だけで格差を克服できるという通念は再考を迫られている。

「閉鎖的な社会移動」とは本文においてどのような状態を指しているか。'
WHERE id = '4d2f5990-da6f-486b-af4a-5bb32c280d25';

DELETE FROM quiz_question_options WHERE question_id = '4d2f5990-da6f-486b-af4a-5bb32c280d25';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('4d2f5990-da6f-486b-af4a-5bb32c280d25', '富裕層が自国から外国へ移住することが制限されている状態',             false, 1),
  ('4d2f5990-da6f-486b-af4a-5bb32c280d25', '努力や才能に関わらず、出身の社会経済的階層から抜け出すことが困難な状態', true,  2),
  ('4d2f5990-da6f-486b-af4a-5bb32c280d25', '貧困層の人々が地方から都市部への移動を阻まれている状態',             false, 3),
  ('4d2f5990-da6f-486b-af4a-5bb32c280d25', '社会的な階層移動が世代ごとに激しく入れ替わる状態',                   false, 4);

-- ---- 8-5: sort 12 参勤交代 Q2 (元: 言語変化)
UPDATE quiz_questions
SET question_text = '江戸時代の参勤交代制度は、単なる大名統制の手段として語られることが多いが、その社会的・文化的影響は多岐にわたる。大名行列が全国各地を定期的に往来したことにより、街道沿いの宿場町は経済的恩恵を受け、各藩の文化・物産が交流する場ともなった。また、藩士たちが江戸と国元を行き来する中で、中央の学問や芸術が地方へと伝播し、文化の均質化が緩やかに進んだ。一方で、莫大な参勤費用は各藩の財政を圧迫し、藩政改革を余儀なくされる要因となった。この制度が廃止された明治以降、日本社会の流動性は急速に変化し、参勤交代が担っていた人的・文化的交流の機能は別の形で継承されていく。

参勤交代について、本文の内容と一致するものはどれか。'
WHERE id = '4558e380-e392-4a25-b8b7-063b15be2078';

DELETE FROM quiz_question_options WHERE question_id = '4558e380-e392-4a25-b8b7-063b15be2078';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('4558e380-e392-4a25-b8b7-063b15be2078', 'この制度は各藩の財政に余裕をもたらした',                       false, 1),
  ('4558e380-e392-4a25-b8b7-063b15be2078', '各藩の文化や物産が街道沿いの宿場町を通じて交流する場となった', true,  2),
  ('4558e380-e392-4a25-b8b7-063b15be2078', '明治以降も参勤交代制度は別の形で存続した',                     false, 3),
  ('4558e380-e392-4a25-b8b7-063b15be2078', '藩士の移動は国元から江戸への一方向のみに限られていた',         false, 4);

-- ---- 8-6: sort 13 参勤交代 Q3 (元: 語用論)
UPDATE quiz_questions
SET question_text = '江戸時代の参勤交代制度は、単なる大名統制の手段として語られることが多いが、その社会的・文化的影響は多岐にわたる。大名行列が全国各地を定期的に往来したことにより、街道沿いの宿場町は経済的恩恵を受け、各藩の文化・物産が交流する場ともなった。また、藩士たちが江戸と国元を行き来する中で、中央の学問や芸術が地方へと伝播し、文化の均質化が緩やかに進んだ。一方で、莫大な参勤費用は各藩の財政を圧迫し、藩政改革を余儀なくされる要因となった。この制度が廃止された明治以降、日本社会の流動性は急速に変化し、参勤交代が担っていた人的・文化的交流の機能は別の形で継承されていく。

本文から読み取れる参勤交代の問題点はどれか。'
WHERE id = 'a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be';

DELETE FROM quiz_question_options WHERE question_id = 'a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be', '大名行列が農村を通過する際、農民への負担が大きかった',   false, 1),
  ('a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be', '外国との文化交流が阻害された',                           false, 2),
  ('a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be', '江戸と地方の文化的均質化が地域の独自性を失わせた',       false, 3),
  ('a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be', '莫大な参勤費用が各藩の財政を圧迫した',                   true,  4);

-- ---- 8-7: sort 15 翻訳 Q2 (元: 映像暴力)
UPDATE quiz_questions
SET question_text = '言語は単なる情報伝達の道具ではなく、思考そのものを形成する媒体である。ウィルヘルム・フォン・フンボルトが指摘したように、各言語はそれ固有の「世界観」を内包しており、異なる言語間の翻訳は等価な意味の移送ではなく、つねに何らかの意味の変容を伴う。たとえば、日本語の「木漏れ日」「物の哀れ」「間」といった概念は、他の言語に完全に翻訳することが極めて困難とされる。これは単に語彙の欠如ではなく、その概念を可能にする感性的・文化的文脈ごと移植する不可能性を示している。さらに言えば、翻訳という行為は原文と訳文の間に新たな第三のテクストを生み出す創造的営為でもある。完全な翻訳という理想は追求されるべき地平であって、達成可能な目標ではない。この認識こそが、翻訳者に課された根本的な倫理的条件であるといえよう。

「木漏れ日」「物の哀れ」「間」を例として挙げた理由として最も適切なものはどれか。'
WHERE id = '56320793-eef5-410a-aeb2-5367fc148556';

DELETE FROM quiz_question_options WHERE question_id = '56320793-eef5-410a-aeb2-5367fc148556';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('56320793-eef5-410a-aeb2-5367fc148556', '日本語が他の言語より豊かな表現力を持つことを証明するため',           false, 1),
  ('56320793-eef5-410a-aeb2-5367fc148556', '翻訳技術の向上により等価な表現が近い将来見つかることを示すため',     false, 2),
  ('56320793-eef5-410a-aeb2-5367fc148556', '言語固有の感性的・文化的文脈ごと翻訳することの困難さを示すため',     true,  3),
  ('56320793-eef5-410a-aeb2-5367fc148556', '日本語の語彙が世界で最も精緻に発達していることを論証するため',       false, 4);

-- ---- 8-8: sort 16 翻訳 Q3 (元: スマートシティ)
UPDATE quiz_questions
SET question_text = '言語は単なる情報伝達の道具ではなく、思考そのものを形成する媒体である。ウィルヘルム・フォン・フンボルトが指摘したように、各言語はそれ固有の「世界観」を内包しており、異なる言語間の翻訳は等価な意味の移送ではなく、つねに何らかの意味の変容を伴う。たとえば、日本語の「木漏れ日」「物の哀れ」「間」といった概念は、他の言語に完全に翻訳することが極めて困難とされる。これは単に語彙の欠如ではなく、その概念を可能にする感性的・文化的文脈ごと移植する不可能性を示している。さらに言えば、翻訳という行為は原文と訳文の間に新たな第三のテクストを生み出す創造的営為でもある。完全な翻訳という理想は追求されるべき地平であって、達成可能な目標ではない。この認識こそが、翻訳者に課された根本的な倫理的条件であるといえよう。

フンボルトの主張として、本文が述べていることはどれか。'
WHERE id = 'd574581e-38fa-438e-b147-9a56a15dfa4f';

DELETE FROM quiz_question_options WHERE question_id = 'd574581e-38fa-438e-b147-9a56a15dfa4f';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('d574581e-38fa-438e-b147-9a56a15dfa4f', '翻訳の技術が高まれば、言語間の完全な意味の等価移送が実現できる',         false, 1),
  ('d574581e-38fa-438e-b147-9a56a15dfa4f', 'ある言語の構造はその話者の思考様式を規定し、変えることはできない',         false, 2),
  ('d574581e-38fa-438e-b147-9a56a15dfa4f', '各言語は固有の「世界観」を内包しており、言語間の翻訳は意味の変容を伴う', true,  3),
  ('d574581e-38fa-438e-b147-9a56a15dfa4f', '日本語のような孤立した言語は翻訳そのものが不可能だ',                       false, 4);

-- ---- 8-9: sort 17 翻訳 Q4 (元: ジャーナリズム)
UPDATE quiz_questions
SET question_text = '言語は単なる情報伝達の道具ではなく、思考そのものを形成する媒体である。ウィルヘルム・フォン・フンボルトが指摘したように、各言語はそれ固有の「世界観」を内包しており、異なる言語間の翻訳は等価な意味の移送ではなく、つねに何らかの意味の変容を伴う。たとえば、日本語の「木漏れ日」「物の哀れ」「間」といった概念は、他の言語に完全に翻訳することが極めて困難とされる。これは単に語彙の欠如ではなく、その概念を可能にする感性的・文化的文脈ごと移植する不可能性を示している。さらに言えば、翻訳という行為は原文と訳文の間に新たな第三のテクストを生み出す創造的営為でもある。完全な翻訳という理想は追求されるべき地平であって、達成可能な目標ではない。この認識こそが、翻訳者に課された根本的な倫理的条件であるといえよう。

筆者が翻訳を「創造的営為」と表現している理由として最も適切なものはどれか。'
WHERE id = 'dc8bd037-3729-40f6-9d2f-a32217e94d68';

DELETE FROM quiz_question_options WHERE question_id = 'dc8bd037-3729-40f6-9d2f-a32217e94d68';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('dc8bd037-3729-40f6-9d2f-a32217e94d68', '翻訳者は原文の内容を自由に改変する権限があるから',                     false, 1),
  ('dc8bd037-3729-40f6-9d2f-a32217e94d68', '翻訳は原文と訳文の間に新たな第三のテクストを生み出すから',             true,  2),
  ('dc8bd037-3729-40f6-9d2f-a32217e94d68', '機械翻訳には創造性がなく、人間だけが真の翻訳ができるから',             false, 3),
  ('dc8bd037-3729-40f6-9d2f-a32217e94d68', '翻訳は完全な忠実性を達成できないことそのものが創造性を生むから',       false, 4);

-- ---- 8-10: sort 18 A/B Q1 (元: ゲノム編集サンデル)
UPDATE quiz_questions
SET question_text = 'A
　生成AIが詩・小説・絵画などの創作物を生み出せるようになった今日、著作権法の枠組みは根本から問い直されなければならない。現行法は人間の創作活動を前提としており、AIが生成したコンテンツの帰属については解釈が分かれる。AIの学習データに他者の著作物が含まれる場合、それが著作権侵害に当たるかという問題は特に深刻だ。クリエイターの権利を守るためには、AIによる著作物の無断利用に対して明確な規制が必要であり、制度の早急な整備が求められる。

B
　生成AIの発展は、誰もが容易に創作活動に参加できる社会を実現する可能性を秘めている。著作権の保護を強化しすぎることは、技術革新の妨げになるだけでなく、表現の自由という観点からも問題をはらむ。人間の創作物もまた先人の作品からの影響を受けており、AI学習における参照と人間の学習の本質的な差異は必ずしも明確ではない。重要なのは規制の強化ではなく、AI技術の恩恵を広く社会で共有できる新たな権利モデルの構築だ。

AとBが共通して述べていることはどれか。'
WHERE id = '0142c7f4-b61a-479a-91e8-c4788dc3a7bd';

DELETE FROM quiz_question_options WHERE question_id = '0142c7f4-b61a-479a-91e8-c4788dc3a7bd';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('0142c7f4-b61a-479a-91e8-c4788dc3a7bd', 'AIによる創作物は全て著作権で保護されるべきだ',             false, 1),
  ('0142c7f4-b61a-479a-91e8-c4788dc3a7bd', '生成AIの登場により、著作権に関わる新たな問題が生じている', true,  2),
  ('0142c7f4-b61a-479a-91e8-c4788dc3a7bd', 'AI学習での著作物利用は全面的に禁止すべきだ',               false, 3),
  ('0142c7f4-b61a-479a-91e8-c4788dc3a7bd', 'AIと人間の創作活動に本質的な差はない',                     false, 4);

-- ---- 8-11: sort 19 A/B Q2 (元: 教育評価アンダーマイニング)
UPDATE quiz_questions
SET question_text = 'A
　生成AIが詩・小説・絵画などの創作物を生み出せるようになった今日、著作権法の枠組みは根本から問い直されなければならない。現行法は人間の創作活動を前提としており、AIが生成したコンテンツの帰属については解釈が分かれる。AIの学習データに他者の著作物が含まれる場合、それが著作権侵害に当たるかという問題は特に深刻だ。クリエイターの権利を守るためには、AIによる著作物の無断利用に対して明確な規制が必要であり、制度の早急な整備が求められる。

B
　生成AIの発展は、誰もが容易に創作活動に参加できる社会を実現する可能性を秘めている。著作権の保護を強化しすぎることは、技術革新の妨げになるだけでなく、表現の自由という観点からも問題をはらむ。人間の創作物もまた先人の作品からの影響を受けており、AI学習における参照と人間の学習の本質的な差異は必ずしも明確ではない。重要なのは規制の強化ではなく、AI技術の恩恵を広く社会で共有できる新たな権利モデルの構築だ。

AとBの立場の違いを最もよく表しているものはどれか。'
WHERE id = '5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a';

DELETE FROM quiz_question_options WHERE question_id = '5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a', 'Aは著作権の廃止を、Bはその強化を主張している',                                                           false, 1),
  ('5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a', 'Aは技術革新を優先し、Bはクリエイターの権利を優先している',                                               false, 2),
  ('5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a', 'Aはクリエイターの権利保護のため規制強化を求め、Bは技術と創作の共有のための新モデル構築を主張している', true,  3),
  ('5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a', 'AもBも現行の著作権制度をそのまま維持すべきだと考えている',                                               false, 4);

-- ---- 8-12: sort 21 刑罰 Q2 (元: 資本主義商品フェティシズム)
UPDATE quiz_questions
SET question_text = '刑罰はなぜ正当化されるのか。この問いに対する答えは、応報主義と帰結主義という二つの大きな立場に収束する。応報主義は、犯罪者は害を与えたことに対して罰せられるべきだという直感——応分の報いを受けるべきだという正義感——に根ざす。刑罰は将来の効果への手段ではなく、過去の行為に対する道義的反応として正当化される。
帰結主義は、刑罰を将来の犯罪を防止するための手段として位置づける。抑止・隔離・更生の三つが主な機能として挙げられる。この立場では、刑罰の種類・重さは再犯防止の効果によって評価され、効果のない刑罰には正当性がないことになる。
近年、修復的司法という第三のアプローチが注目を集めている。犯罪を加害者と被害者・共同体の関係の破壊として捉え、刑罰よりも対話と修復を通じた関係の再建を目指すものである。応報でも抑止でもなく、傷ついた関係の回復を中心に据えるこのアプローチは、従来の刑事司法の枠組みを超えた問いを提起している。

帰結主義が刑罰の正当性を評価する基準として、本文に述べられているものはどれか。'
WHERE id = '8352dc4a-84e6-48f2-82d8-a9468420eabb';

DELETE FROM quiz_question_options WHERE question_id = '8352dc4a-84e6-48f2-82d8-a9468420eabb';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('8352dc4a-84e6-48f2-82d8-a9468420eabb', '被害者が刑罰の内容に満足しているかどうか',         false, 1),
  ('8352dc4a-84e6-48f2-82d8-a9468420eabb', '社会全体の幸福が最大化されるかどうか',             false, 2),
  ('8352dc4a-84e6-48f2-82d8-a9468420eabb', '再犯防止という将来的な効果があるかどうか',         true,  3),
  ('8352dc4a-84e6-48f2-82d8-a9468420eabb', '加害者が真摯に反省し更生の意志があるかどうか',     false, 4);

-- ---- 8-13: sort 22 刑罰 Q3 (元: 自律型AIシステム)
UPDATE quiz_questions
SET question_text = '刑罰はなぜ正当化されるのか。この問いに対する答えは、応報主義と帰結主義という二つの大きな立場に収束する。応報主義は、犯罪者は害を与えたことに対して罰せられるべきだという直感——応分の報いを受けるべきだという正義感——に根ざす。刑罰は将来の効果への手段ではなく、過去の行為に対する道義的反応として正当化される。
帰結主義は、刑罰を将来の犯罪を防止するための手段として位置づける。抑止・隔離・更生の三つが主な機能として挙げられる。この立場では、刑罰の種類・重さは再犯防止の効果によって評価され、効果のない刑罰には正当性がないことになる。
近年、修復的司法という第三のアプローチが注目を集めている。犯罪を加害者と被害者・共同体の関係の破壊として捉え、刑罰よりも対話と修復を通じた関係の再建を目指すものである。応報でも抑止でもなく、傷ついた関係の回復を中心に据えるこのアプローチは、従来の刑事司法の枠組みを超えた問いを提起している。

修復的司法について、本文で述べられていることとして正しいものはどれか。'
WHERE id = '4221e8d4-2275-4d6c-8aee-363e492da942';

DELETE FROM quiz_question_options WHERE question_id = '4221e8d4-2275-4d6c-8aee-363e492da942';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('4221e8d4-2275-4d6c-8aee-363e492da942', '犯罪を関係の破壊として捉え、対話と修復による関係再建を目指すアプローチだ',   true,  1),
  ('4221e8d4-2275-4d6c-8aee-363e492da942', '犯罪者に対して従来より厳しい刑罰を課すことを目的としたアプローチだ',         false, 2),
  ('4221e8d4-2275-4d6c-8aee-363e492da942', '応報主義と帰結主義を組み合わせた折衷的なアプローチだ',                         false, 3),
  ('4221e8d4-2275-4d6c-8aee-363e492da942', '被害者の感情を無視し、加害者の更生のみに焦点を当てたアプローチだ',             false, 4);

-- ---- 8-14: sort 23 刑罰 Q4 (元: 印象派)
UPDATE quiz_questions
SET question_text = '刑罰はなぜ正当化されるのか。この問いに対する答えは、応報主義と帰結主義という二つの大きな立場に収束する。応報主義は、犯罪者は害を与えたことに対して罰せられるべきだという直感——応分の報いを受けるべきだという正義感——に根ざす。刑罰は将来の効果への手段ではなく、過去の行為に対する道義的反応として正当化される。
帰結主義は、刑罰を将来の犯罪を防止するための手段として位置づける。抑止・隔離・更生の三つが主な機能として挙げられる。この立場では、刑罰の種類・重さは再犯防止の効果によって評価され、効果のない刑罰には正当性がないことになる。
近年、修復的司法という第三のアプローチが注目を集めている。犯罪を加害者と被害者・共同体の関係の破壊として捉え、刑罰よりも対話と修復を通じた関係の再建を目指すものである。応報でも抑止でもなく、傷ついた関係の回復を中心に据えるこのアプローチは、従来の刑事司法の枠組みを超えた問いを提起している。

この文章の内容として最も適切なものはどれか。'
WHERE id = '03014357-6d9e-4584-bdb1-138dc225bddc';

DELETE FROM quiz_question_options WHERE question_id = '03014357-6d9e-4584-bdb1-138dc225bddc';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('03014357-6d9e-4584-bdb1-138dc225bddc', '応報主義が刑罰論として唯一正当であることを論証している',                       false, 1),
  ('03014357-6d9e-4584-bdb1-138dc225bddc', '刑罰制度の廃止と修復的司法への全面移行を主張している',                         false, 2),
  ('03014357-6d9e-4584-bdb1-138dc225bddc', '刑罰を正当化する応報主義・帰結主義・修復的司法の三つの立場を概説している',     true,  3),
  ('03014357-6d9e-4584-bdb1-138dc225bddc', '帰結主義的アプローチが最も科学的として他の立場を批判している',                 false, 4);

-- ---- 8-15: sort 24 情報検索 Q1 (元: アーレント公共圏)
UPDATE quiz_questions
SET question_text = '【テクノロジー研修センター　特別講座　受講案内】

本センターでは、IT業界への転職・スキルアップを目指す方を対象に、以下の特別講座を開講します。

■開講講座一覧
・Aコース（プログラミング基礎）：月・水・金　18:00〜20:00　全12回　受講料：24,000円
・Bコース（クラウド技術）：火・木　19:00〜21:00　全10回　受講料：30,000円　※Aコース修了者または同等の知識を持つ方のみ対象
・Cコース（AIエンジニアリング）：土　10:00〜17:00　全8回　受講料：45,000円　※Bコース修了者のみ対象・事前課題提出（審査あり）
・Dコース（集中ブートキャンプ）：平日連続5日間　9:00〜18:00　受講料：60,000円　※実務経験2年以上の方のみ

■受講資格
・18歳以上
・同一期間中に複数コースの同時受講不可

■申し込み方法
・各コース開講日の10日前までにWebフォームで申し込んでください
・定員（各コース15名）超過の場合は抽選となります
・ただし、Aコースのみ先着順（抽選なし）
・抽選結果は開講日の5日前までにメールでお知らせします

■受講料のお支払い
・受講決定通知受領後3日以内に振り込んでください

■キャンセルポリシー
・開講日5日前以降のキャンセルは返金不可
・それ以前は全額返金いたします

■修了認定
・全回数の5分の4以上出席した受講者に修了証を発行します

チェさんはAコースを修了しており、今期Cコースへの参加を希望している。チェさんがCコースを受講するために満たすべき条件として正しいものはどれか。'
WHERE id = '28855752-aeec-46d4-98aa-ff522ffb6b14';

DELETE FROM quiz_question_options WHERE question_id = '28855752-aeec-46d4-98aa-ff522ffb6b14';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('28855752-aeec-46d4-98aa-ff522ffb6b14', 'Aコースを修了しており、実務経験が2年以上あること',                     false, 1),
  ('28855752-aeec-46d4-98aa-ff522ffb6b14', 'Bコースを修了しており、事前課題を提出して審査に通ること',               true,  2),
  ('28855752-aeec-46d4-98aa-ff522ffb6b14', 'Aコースを修了しており、事前課題を提出して審査に通ること',               false, 3),
  ('28855752-aeec-46d4-98aa-ff522ffb6b14', 'Bコースを修了していることだけで申し込み可能なこと',                     false, 4);

-- ---- 8-16: sort 25 情報検索 Q2 (元: 公共空間疑似公共)
UPDATE quiz_questions
SET question_text = '【テクノロジー研修センター　特別講座　受講案内】

本センターでは、IT業界への転職・スキルアップを目指す方を対象に、以下の特別講座を開講します。

■開講講座一覧
・Aコース（プログラミング基礎）：月・水・金　18:00〜20:00　全12回　受講料：24,000円
・Bコース（クラウド技術）：火・木　19:00〜21:00　全10回　受講料：30,000円　※Aコース修了者または同等の知識を持つ方のみ対象
・Cコース（AIエンジニアリング）：土　10:00〜17:00　全8回　受講料：45,000円　※Bコース修了者のみ対象・事前課題提出（審査あり）
・Dコース（集中ブートキャンプ）：平日連続5日間　9:00〜18:00　受講料：60,000円　※実務経験2年以上の方のみ

■受講資格
・18歳以上
・同一期間中に複数コースの同時受講不可

■申し込み方法
・各コース開講日の10日前までにWebフォームで申し込んでください
・定員（各コース15名）超過の場合は抽選となります
・ただし、Aコースのみ先着順（抽選なし）
・抽選結果は開講日の5日前までにメールでお知らせします

■受講料のお支払い
・受講決定通知受領後3日以内に振り込んでください

■キャンセルポリシー
・開講日5日前以降のキャンセルは返金不可
・それ以前は全額返金いたします

■修了認定
・全回数の5分の4以上出席した受講者に修了証を発行します

この案内の内容と合っているものはどれか。'
WHERE id = 'c95840d3-df64-473d-8de3-d0a758046d56';

DELETE FROM quiz_question_options WHERE question_id = 'c95840d3-df64-473d-8de3-d0a758046d56';
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order) VALUES
  ('c95840d3-df64-473d-8de3-d0a758046d56', 'Aコースも定員超過の場合は抽選で受講者を決定する',                 false, 1),
  ('c95840d3-df64-473d-8de3-d0a758046d56', 'Cコースには事前課題の提出と審査が必要だ',                         true,  2),
  ('c95840d3-df64-473d-8de3-d0a758046d56', 'キャンセルは開講日の何日前でも受講料は返金されない',               false, 3),
  ('c95840d3-df64-473d-8de3-d0a758046d56', '修了証は全回数の4分の3以上出席した受講者に発行される',             false, 4);

-- ============================================================
-- PART 9: 読解 daimon / subtype 設定
-- ============================================================

UPDATE jlpt_mock_set_questions
SET daimon = 8, subtype = '内容理解(短文)'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    'd28d881d-676f-417b-98f9-f031a8ee69d4',
    'ab2912b3-485d-413b-9c47-c88102a8759d',
    'db4e43a6-157d-492a-9a7b-46af757eedbd',
    '25f824ab-226c-489e-a251-8fee5d190618'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 9, subtype = '内容理解(中文)'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    '74c905b8-9bfc-4206-bb8a-8bcfa2daf22d',
    '373859b2-7755-4ee2-8807-c13eaf04fa85',
    '988c63b2-f27b-4389-ad50-5193d136e11e',
    'bb847480-7afe-4d0d-b6d7-7ef0ecc9c050',
    '15e48a11-c5f0-4197-a2c0-f5cd8552fc55',
    '4d2f5990-da6f-486b-af4a-5bb32c280d25',
    'dab1c265-e076-4d99-a8da-fd85e92ebe88',
    '4558e380-e392-4a25-b8b7-063b15be2078',
    'a8f5bc11-6466-4dbe-b3cb-74eb33c0c5be'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 10, subtype = '内容理解(長文)'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    'a8cd2060-867a-4c92-b889-e079351a4d58',
    '56320793-eef5-410a-aeb2-5367fc148556',
    'd574581e-38fa-438e-b147-9a56a15dfa4f',
    'dc8bd037-3729-40f6-9d2f-a32217e94d68'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 11, subtype = '統合理解'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    '0142c7f4-b61a-479a-91e8-c4788dc3a7bd',
    '5f5b0e7f-74a0-4945-8e2e-9f1c31afdf4a'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 12, subtype = '主張理解(長文)'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    '3bec46c1-4933-4e28-8714-3d7be3f6ac38',
    '8352dc4a-84e6-48f2-82d8-a9468420eabb',
    '4221e8d4-2275-4d6c-8aee-363e492da942',
    '03014357-6d9e-4584-bdb1-138dc225bddc'
  );

UPDATE jlpt_mock_set_questions
SET daimon = 13, subtype = '情報検索'
WHERE set_id = 'aa000001-0000-0000-0000-000000000013'
  AND section = 'dokkai'
  AND question_id IN (
    '28855752-aeec-46d4-98aa-ff522ffb6b14',
    'c95840d3-df64-473d-8de3-d0a758046d56'
  );

-- ============================================================
-- PART 10: 検証クエリ
-- ============================================================

-- 言語知識 最終確認
SELECT msq.sort_order, msq.daimon, msq.subtype, qq.question_category,
  LEFT(qq.question_text, 40) AS qt_head
FROM jlpt_mock_set_questions msq
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE msq.set_id = 'aa000001-0000-0000-0000-000000000013'
  AND msq.section = 'gengo_chishiki'
ORDER BY msq.sort_order;

-- 読解 最終確認
SELECT msq.sort_order, msq.daimon, msq.subtype,
  LEFT(qq.question_text, 40) AS qt_head
FROM jlpt_mock_set_questions msq
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE msq.set_id = 'aa000001-0000-0000-0000-000000000013'
  AND msq.section = 'dokkai'
ORDER BY msq.sort_order;

-- is_correct 問題確認 (各問1個ずつ正解か)
SELECT qq.id, COUNT(*) FILTER (WHERE qo.is_correct) AS correct_count
FROM jlpt_mock_set_questions msq
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE msq.set_id = 'aa000001-0000-0000-0000-000000000013'
  AND msq.section IN ('gengo_chishiki', 'dokkai')
GROUP BY qq.id
HAVING COUNT(*) FILTER (WHERE qo.is_correct) != 1
ORDER BY qq.id;

COMMIT;
