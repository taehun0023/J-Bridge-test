-- N1 모의고사 수정 권장 8건 적용
-- 이미 수정됨(건너뜀): SET3 34번(をきっかけに→を境に), SET3 39번(今の組織には), SET2 40번(称賛して)
-- psql -f UTF-8

BEGIN;

-- ─────────────────────────────────────────────
-- 1. SET2 언지 11번: 訴求 → 訴え
--    聴衆の感情に（　　）し → 訴求(マーケ語)보다 訴え가 자연스러움
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '訴え'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=2
      AND msq.section='gengo_chishiki' AND msq.sort_order=11
  );

-- ─────────────────────────────────────────────
-- 2. SET2 언지 15번: 玄人好み 정답 수정
--    "高い品質"보다 "専門家好み・一般受けしない" 뉘앙스로 교체
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '専門家には好まれるが、一般には受けにくい傾向があること'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=2
      AND msq.section='gengo_chishiki' AND msq.sort_order=15
  );

-- ─────────────────────────────────────────────
-- 3. SET2 언지 21번: 敷衍 정답 수정
--    "専門用語を敷衍して" → "専門用語の意味を敷衍して"
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '専門用語の意味を敷衍して一般の人にもわかるよう説明した。'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=2
      AND msq.section='gengo_chishiki' AND msq.sort_order=21
  );

-- ─────────────────────────────────────────────
-- 4. SET3 언지 24번: 喫緊 오답 교체
--    "喫緊に対処すべき案件" → 喫緊を形容詞的に使った오용으로 교체
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '今月は業務が喫緊で残業続きだったが、何とか締め切りに間に合わせた。'
WHERE o.option_text LIKE '%喫緊に対処すべき%'
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=3
      AND msq.section='gengo_chishiki' AND msq.sort_order=24
  );

-- ─────────────────────────────────────────────
-- 5a. SET3 언지 25번: 喧伝 오답 교체 ①
--     "姿勢を喧伝し" → 喧伝を騒音の意で오용 (喧の字から誤用しやすい典型)
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '夜中の喧伝に悩まされ、なかなか眠れなかった。'
WHERE o.option_text LIKE '%姿勢を喧伝%'
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=3
      AND msq.section='gengo_chishiki' AND msq.sort_order=25
  );

-- 5b. SET3 언지 25번: 喧伝 오답 교체 ②
--     "不満を喧伝した" → 喧伝を騒ぎ・混雑の意で오용
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = '彼女は会場の喧伝をできるだけ避け、静かな席を選んで座った。'
WHERE o.option_text LIKE '%不満を喧伝%'
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=3
      AND msq.section='gengo_chishiki' AND msq.sort_order=25
  );

-- ─────────────────────────────────────────────
-- 6. SET2 청해 16번: 의학적 단정 표현 완화 (question_text + 정답)
-- ─────────────────────────────────────────────
UPDATE quiz_questions q
SET question_text = REPLACE(
  question_text,
  '薬よりも生活の質と社会参加が、最善の予防策であると言えます。',
  '生活の質の向上と社会参加が、有効な予防策の一つとして注目されています。'
)
WHERE q.id IN (
  SELECT qq.id FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=2
    AND msq.section='choukai' AND msq.sort_order=16
);

UPDATE quiz_question_options o
SET option_text = '40〜50代からの社会的つながりの維持が、認知症予防に有効な手段の一つだ'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=2
      AND msq.section='choukai' AND msq.sort_order=16
  );

-- ─────────────────────────────────────────────
-- 7. SET3 청해 17번: 食品ロス 단정 완화 (question_text + 정답)
-- ─────────────────────────────────────────────
UPDATE quiz_questions q
SET question_text = REPLACE(
  REPLACE(
    question_text,
    '食品ロスの大部分が家庭から生まれているという事実です。',
    '食品ロスのうち家庭から生じる割合が大きいという点に着目したいと思います。'
  ),
  '外食産業や小売業の廃棄量よりも、家庭での「作りすぎ」「買いすぎ」「消費期限への過剰な反応」によるロスの方がずっと多い。つまり、この問題を解決するためには、消費者一人ひとりの日常的な意識と行動の変化こそが最も重要なのです。',
  '家庭での「作りすぎ」「買いすぎ」「消費期限への過剰な反応」によるロスも決して少なくありません。この問題の解決には、消費者一人ひとりの意識と行動の変化が重要な鍵を握っています。'
)
WHERE q.id IN (
  SELECT qq.id FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level='N1' AND ms.set_no=3
    AND msq.section='choukai' AND msq.sort_order=17
);

UPDATE quiz_question_options o
SET option_text = '家庭での食品廃棄も大きな割合を占めており、消費者の意識・行動変容が重要だ'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=3
      AND msq.section='choukai' AND msq.sort_order=17
  );

-- ─────────────────────────────────────────────
-- 8. SET3 청해 20번: 정답 교체
--    "いえ、こちらこそよろしくお願いいたします" →
--    "とんでもございません。本日はよろしくお願いいたします。"
--    (お越しいただきまして에 대한 더 자연스러운 응답)
-- ─────────────────────────────────────────────
UPDATE quiz_question_options o
SET option_text = 'とんでもございません。本日はよろしくお願いいたします。'
WHERE o.is_correct = true
  AND o.question_id IN (
    SELECT qq.id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
    JOIN quiz_questions qq ON msq.question_id = qq.id
    WHERE ms.level='N1' AND ms.set_no=3
      AND msq.section='choukai' AND msq.sort_order=20
  );

COMMIT;
