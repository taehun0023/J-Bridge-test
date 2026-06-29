-- fix_set2_gengo_format_20260629.sql
-- N1 Set2 言語知識 形式統一 (Set1 準拠)
-- 適用対象: ローカルDB (jpjvzlmwzeiyukqqbdit)
--
-- 修正項目:
--   1. question_category: vocabulary → vocab (sort 1-25)
--   2. 問題2 (sort 7-13):  指示文+空行削除, （　　）→（　）
--   3. 問題3 (sort 14-19): 指示文+空行削除, <u>→「」, 質問文追加
--   4. 問題4 (sort 20-25): 「word」の使い方として最もよいものはどれか。
--   5. 問題5 (sort 26-35): 指示文+空行削除, （　　）はそのまま
--   6. 問題6 (sort 36-40): （語群：...）行のみ削除
--   7. 問題7 (sort 41-45): 指示文削除, 空欄を ［N］ 形式へ
--   8. daimon/subtype (jlpt_mock_set_questions, sort 1-45)

SET client_encoding = 'UTF8';

BEGIN;

-- ================================================================
-- 1. question_category: vocabulary → vocab (sort 1-25)
-- ================================================================
UPDATE quiz_questions
SET question_category = 'vocab'
WHERE id IN (
  'ad200001-0000-0000-0000-000000000010',
  'ad200001-0000-0000-0000-000000000020',
  'ad200001-0000-0000-0000-000000000030',
  'ad200001-0000-0000-0000-000000000040',
  'ad200001-0000-0000-0000-000000000050',
  'ad200001-0000-0000-0000-000000000060',
  'ad200001-0000-0000-0000-000000000070',
  'ad200001-0000-0000-0000-000000000080',
  'ad200001-0000-0000-0000-000000000090',
  'ad200001-0000-0000-0000-000000000100',
  'ad200001-0000-0000-0000-000000000110',
  'ad200001-0000-0000-0000-000000000120',
  'ad200001-0000-0000-0000-000000000130',
  'ad200001-0000-0000-0000-000000000140',
  'ad200001-0000-0000-0000-000000000150',
  'ad200001-0000-0000-0000-000000000160',
  'ad200001-0000-0000-0000-000000000170',
  'ad200001-0000-0000-0000-000000000180',
  'ad200001-0000-0000-0000-000000000190',
  'ad200001-0000-0000-0000-000000000200',
  'ad200001-0000-0000-0000-000000000210',
  'ad200001-0000-0000-0000-000000000220',
  'ad200001-0000-0000-0000-000000000230',
  'ad200001-0000-0000-0000-000000000240',
  'ad200001-0000-0000-0000-000000000250'
)
AND question_category = 'vocabulary';

-- ================================================================
-- 2. 問題2 (sort 7-13): 指示文+空行削除, （　　）→（　）
-- ================================================================
UPDATE quiz_questions
SET question_text = '無断欠席は棄権と（　）される場合がある。'
WHERE id = 'ad200001-0000-0000-0000-000000000070';

UPDATE quiz_questions
SET question_text = '現在の財政状況を（　）、来年度の予算案を作成する必要がある。'
WHERE id = 'ad200001-0000-0000-0000-000000000080';

UPDATE quiz_questions
SET question_text = 'AIを活用した新興企業の（　）により、従来の産業構造が揺らいでいる。'
WHERE id = 'ad200001-0000-0000-0000-000000000090';

UPDATE quiz_questions
SET question_text = '少子高齢化の影響を受け、地方産業の（　）が深刻な問題となっている。'
WHERE id = 'ad200001-0000-0000-0000-000000000100';

UPDATE quiz_questions
SET question_text = '長時間労働の（　）として、心身の疲弊や家庭崩壊が指摘されている。'
WHERE id = 'ad200001-0000-0000-0000-000000000110';

UPDATE quiz_questions
SET question_text = '今回の実験結果は、新薬の有効性を（　）するものと受け取られた。'
WHERE id = 'ad200001-0000-0000-0000-000000000120';

UPDATE quiz_questions
SET question_text = '契約の（　）として、不動産を提供することが条件とされた。'
WHERE id = 'ad200001-0000-0000-0000-000000000130';

-- ================================================================
-- 3. 問題3 (sort 14-19): 指示文+空行削除, <u>→「」, 質問文追加
-- ================================================================
UPDATE quiz_questions
SET question_text =
  '近年、即戦力を重視する「風潮」が企業の採用活動に影響している。' || E'\n' ||
  '「風潮」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000140';

UPDATE quiz_questions
SET question_text =
  '今回の視察は、研修プログラムの「一環」として実施される。' || E'\n' ||
  '「一環」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000150';

UPDATE quiz_questions
SET question_text =
  '経済の回復「兆候」が見え始め、市場関係者の間に期待感が高まっている。' || E'\n' ||
  '「兆候」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000160';

UPDATE quiz_questions
SET question_text =
  '膠着した交渉を「打開」するため、第三者機関の介入が求められた。' || E'\n' ||
  '「打開」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000170';

UPDATE quiz_questions
SET question_text =
  '労働環境の「是正」に向けて、会社は新たな施策を打ち出した。' || E'\n' ||
  '「是正」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000180';

UPDATE quiz_questions
SET question_text =
  '感染症の「収束」には、社会全体の協力が不可欠だ。' || E'\n' ||
  '「収束」に意味が最も近いものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000190';

-- ================================================================
-- 4. 問題4 (sort 20-25): 「word」の使い方として最もよいものはどれか。
-- ================================================================
UPDATE quiz_questions
SET question_text = '「枠組み」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000200';

UPDATE quiz_questions
SET question_text = '「尺度」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000210';

UPDATE quiz_questions
SET question_text = '「指標」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000220';

UPDATE quiz_questions
SET question_text = '「財源」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000230';

UPDATE quiz_questions
SET question_text = '「典型」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000240';

UPDATE quiz_questions
SET question_text = '「真偽」の使い方として最もよいものはどれか。'
WHERE id = 'ad200001-0000-0000-0000-000000000250';

-- ================================================================
-- 5. 問題5 (sort 26-35): 指示文+空行削除, （　　）はそのまま
--    パターン: ^[^\n]+\n\n → '' (先頭1行+空行を除去)
-- ================================================================
UPDATE quiz_questions
SET question_text = regexp_replace(question_text, E'^[^\n]+\n\n', '')
WHERE id IN (
  'ad200001-0000-0000-0000-000000000260',
  'ad200001-0000-0000-0000-000000000270',
  'ad200001-0000-0000-0000-000000000280',
  'ad200001-0000-0000-0000-000000000290',
  'ad200001-0000-0000-0000-000000000300',
  'ad200001-0000-0000-0000-000000000310',
  'ad200001-0000-0000-0000-000000000320',
  'ad200001-0000-0000-0000-000000000330',
  'ad200001-0000-0000-0000-000000000340',
  'ad200001-0000-0000-0000-000000000350'
);

-- ================================================================
-- 6. 問題6 (sort 36-40): （語群：...）行のみ削除
-- ================================================================
UPDATE quiz_questions
SET question_text = regexp_replace(question_text, E'\n（語群：[^\n]+）', '')
WHERE id IN (
  'ad200001-0000-0000-0000-000000000360',
  'ad200001-0000-0000-0000-000000000370',
  'ad200001-0000-0000-0000-000000000380',
  'ad200001-0000-0000-0000-000000000390',
  'ad200001-0000-0000-0000-000000000400'
);

-- ================================================================
-- 7. 問題7 (sort 41-45): 指示文削除, 空欄を ［N］ 形式へ
--    手順:
--      (1) 先頭の指示文+空行を除去
--      (2) （N） → ［N］ (数字のみ。（DX）は非マッチ)
--      (3) （　　） → ［N］ (各問の active blank)
-- ================================================================
-- Sort 41: active blank → ［41］
UPDATE quiz_questions
SET question_text =
  replace(
    regexp_replace(
      regexp_replace(question_text,
        E'^次の文章を読んで、後の問いに答えなさい。\n\n', ''),
      E'（([0-9]+)）', E'［\\1］', 'g'
    ),
    '（　　）', '［41］'
  )
WHERE id = 'ad200001-0000-0000-0000-000000000410';

-- Sort 42: active blank → ［42］
UPDATE quiz_questions
SET question_text =
  replace(
    regexp_replace(
      regexp_replace(question_text,
        E'^次の文章を読んで、後の問いに答えなさい。\n\n', ''),
      E'（([0-9]+)）', E'［\\1］', 'g'
    ),
    '（　　）', '［42］'
  )
WHERE id = 'ad200001-0000-0000-0000-000000000420';

-- Sort 43: active blank → ［43］
UPDATE quiz_questions
SET question_text =
  replace(
    regexp_replace(
      regexp_replace(question_text,
        E'^次の文章を読んで、後の問いに答えなさい。\n\n', ''),
      E'（([0-9]+)）', E'［\\1］', 'g'
    ),
    '（　　）', '［43］'
  )
WHERE id = 'ad200001-0000-0000-0000-000000000430';

-- Sort 44: active blank → ［44］
UPDATE quiz_questions
SET question_text =
  replace(
    regexp_replace(
      regexp_replace(question_text,
        E'^次の文章を読んで、後の問いに答えなさい。\n\n', ''),
      E'（([0-9]+)）', E'［\\1］', 'g'
    ),
    '（　　）', '［44］'
  )
WHERE id = 'ad200001-0000-0000-0000-000000000440';

-- Sort 45: active blank → ［45］
UPDATE quiz_questions
SET question_text =
  replace(
    regexp_replace(
      regexp_replace(question_text,
        E'^次の文章を読んで、後の問いに答えなさい。\n\n', ''),
      E'（([0-9]+)）', E'［\\1］', 'g'
    ),
    '（　　）', '［45］'
  )
WHERE id = 'ad200001-0000-0000-0000-000000000450';

-- ================================================================
-- 8. daimon/subtype (jlpt_mock_set_questions)
-- ================================================================
DO $$
DECLARE
  v_set_id UUID;
BEGIN
  SELECT id INTO v_set_id
  FROM jlpt_mock_sets
  WHERE level = 'N1' AND set_no = 2;

  IF v_set_id IS NULL THEN
    RAISE EXCEPTION 'N1 Set2 が見つかりません';
  END IF;

  -- 問題1 (sort 1-6): 漢字読み
  UPDATE jlpt_mock_set_questions
  SET daimon = 1, subtype = '漢字読み'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 1 AND 6;

  -- 問題2 (sort 7-13): 文脈規定
  UPDATE jlpt_mock_set_questions
  SET daimon = 2, subtype = '文脈規定'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 7 AND 13;

  -- 問題3 (sort 14-19): 言い換え類義
  UPDATE jlpt_mock_set_questions
  SET daimon = 3, subtype = '言い換え類義'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 14 AND 19;

  -- 問題4 (sort 20-25): 用法
  UPDATE jlpt_mock_set_questions
  SET daimon = 4, subtype = '用法'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 20 AND 25;

  -- 問題5 (sort 26-35): 文法形式の判断
  UPDATE jlpt_mock_set_questions
  SET daimon = 5, subtype = '文法形式の判断'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 26 AND 35;

  -- 問題6 (sort 36-40): 文の組み立て
  UPDATE jlpt_mock_set_questions
  SET daimon = 6, subtype = '文の組み立て'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 36 AND 40;

  -- 問題7 (sort 41-45): 文章の文法
  UPDATE jlpt_mock_set_questions
  SET daimon = 7, subtype = '文章の文法'
  WHERE set_id = v_set_id AND section = 'gengo_chishiki'
    AND sort_order BETWEEN 41 AND 45;

END $$;

COMMIT;

-- ================================================================
-- 確認クエリ
-- ================================================================
SELECT
  msq.sort_order,
  msq.daimon,
  msq.subtype,
  qq.question_category,
  left(replace(replace(qq.question_text, E'\n', '↵'), chr(10), '↵'), 90) AS qt_preview
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 2
  AND msq.section = 'gengo_chishiki'
ORDER BY msq.sort_order;
