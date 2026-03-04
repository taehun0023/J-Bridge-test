-- 00084_fix_grammar_reading_quality.sql
-- Fix quality issues in grammar and reading quiz questions
--
-- Category A: 答えバレ — 穴埋め問題に変換 (12問)
-- Category A2: 選択肢からパターン名除去 (4問)
-- Category B: 二重正答 — 文脈変更 (4問)
-- Category C: 読解 — 選択肢を同義語に変更 (2問)
--
-- Uses UPDATE (not DELETE+INSERT) to preserve quiz_attempts/quiz_answers

-- ============================================================
-- Category A: 答えバレ修正 — 穴埋め問題に変換
-- ============================================================

-- A-1: b0000001 sort=3 「〜たい」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000001-0000-0000-0000-000000000001' AND sort_order = 3;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「日本に（　）です。」に入る正しいものは？',
      explanation = '「〜たい」は話者の願望を表す助動詞で、「~하고 싶다」という意味です。動詞の連用形に付きます。「行きたい」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = '行かない' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = '行ける' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = '行った' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = '行きたい' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-2: b0000001 sort=16 「〜すぎる」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000001-0000-0000-0000-000000000001' AND sort_order = 16;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「昨日、食べ（　）てお腹が痛くなりました。」に入る正しいものは？',
      explanation = '「〜すぎる」は程度が過度であることを表す文型で、「너무 ~하다」という意味です。「食べすぎて」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'やすく' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'すぎ' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'にくく' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'たく' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-3: b0000001 sort=21 「〜てから」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000001-0000-0000-0000-000000000001' AND sort_order = 21;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「手を洗って（　）、ごはんを食べます。」に入る正しいものは？',
      explanation = '「〜てから」は動作の順序を表す文型で、「~하고 나서」という意味です。「から」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'ながら' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'まで', is_correct = FALSE WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'から', is_correct = TRUE WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'のに' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-4: b0000002 sort=1 「〜たり〜たりする」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 1;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「休みの日は映画を見（　）買い物をし（　）します。」に入る正しいものは？',
      explanation = '「〜たり〜たりする」は複数の動作を例示する文型で、「~하거나 ~하거나 하다」という意味です。「たり…たり」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'ながら…ながら' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'たり…たり' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'ては…ては' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'つつ…つつ' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-5: b0000002 sort=5 「〜たことがある」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 5;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「日本に行っ（　）ことがあります。」に入る正しいものは？',
      explanation = '「〜たことがある」は過去の経験を表す文型で、「~한 적이 있다」という意味です。動詞のた形「た」が入ります。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'ている' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'ての' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'た', is_correct = TRUE WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'てみた', is_correct = FALSE WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-6: b0000002 sort=14 「〜かもしれない」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 14;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「明日は雨が降る（　）。」に入る正しいものは？',
      explanation = '「〜かもしれない」は不確実な推量を表す文型で、「~일지도 모른다」という意味です。確信度が低い推測に使います。「かもしれない」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'に違いない' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'かもしれない' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'はずだ' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'べきだ' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-7: b0000002 sort=17 「〜(さ)せる」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 17;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「母は子どもに野菜を食べ（　）。」に入る正しいものは？',
      explanation = '「〜(さ)せる」は使役を表す助動詞で、「~시키다 / ~하게 하다」という意味です。「食べさせた」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'られた' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'させた' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'たがった' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'すぎた' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-8: b0000003 sort=1 「〜てもいい」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000003-0000-0000-0000-000000000003' AND sort_order = 1;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「ここに座っ（　）いいですか？」に入る正しいものは？',
      explanation = '「〜てもいい」は許可を表す文型で、「~해도 된다」という意味です。「ても」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'ては', is_correct = FALSE WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'ても', is_correct = TRUE WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'たら' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'ので' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-9: b0000004 sort=1 「〜にもかかわらず」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000004-0000-0000-0000-000000000004' AND sort_order = 1;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「雨（　）、試合は予定通り行われた。」に入る正しいものは？',
      explanation = '「〜にもかかわらず」は逆接を強調する表現で、「~임에도 불구하고」という意味です。「にもかかわらず」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'によって' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'にもかかわらず' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'に関して' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'に対して' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-10: b0000005 sort=3 「〜んがために」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000005-0000-0000-0000-000000000005' AND sort_order = 3;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「夢を実現せ（　）、毎日努力を続けている。」に入る正しいものは？',
      explanation = '「〜んがために」は目的を表す文語的表現で、「~하기 위해서」という強い意志を伴います。「せんがために」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'ざるを得ず' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'んがために', is_correct = TRUE WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'ずにはいられず', is_correct = FALSE WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'んばかりに' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-11: b0000005 sort=9 「〜ゆえに」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000005-0000-0000-0000-000000000005' AND sort_order = 9;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「経験不足（　）、多くの失敗を重ねた。」に入る正しいものは？',
      explanation = '「〜ゆえに」は原因・理由を表す文語的表現で、「~이기 때문에 / ~인 고로」という意味です。「ゆえに」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'にもかかわらず' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'ゆえに' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'ならでは' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'をもって' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- A-12: b0000005 sort=17 「〜ならでは」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000005-0000-0000-0000-000000000005' AND sort_order = 17;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '「この味は京都（　）の味だ。」に入る正しいものは？',
      explanation = '「〜ならでは」は「〜だからこそできる / 〜でなければできない」を表す文型で、「~만의 / ~이 아니면 안 되는」という意味です。「ならでは」が正解です。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'だからこその' WHERE question_id = target_q_id AND sort_order = 1;
    UPDATE quiz_question_options SET option_text = 'ならでは' WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET option_text = 'にとっての' WHERE question_id = target_q_id AND sort_order = 3;
    UPDATE quiz_question_options SET option_text = 'にしての' WHERE question_id = target_q_id AND sort_order = 4;
  END IF;
END $$;

-- ============================================================
-- Category A2: 選択肢からパターン名除去
-- ============================================================

-- A2-1: b0000001 sort=13 「〜ましょう」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000001-0000-0000-0000-000000000001' AND sort_order = 13;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '勧誘（一緒にしようと誘う）'
    WHERE question_id = target_q_id AND sort_order = 3;
  END IF;
END $$;

-- A2-2: b0000002 sort=3 「のに」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 3;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '予想と違う結果への不満・驚き'
    WHERE question_id = target_q_id AND sort_order = 3;
  END IF;
END $$;

-- A2-3: b0000002 sort=9 「みたいだ」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 9;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '見た目や状況からの推測'
    WHERE question_id = target_q_id AND sort_order = 2;
  END IF;
END $$;

-- A2-4: b0000002 sort=16 「〜られる」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 16;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '受身（他者の動作を受ける）'
    WHERE question_id = target_q_id AND sort_order = 2;
  END IF;
END $$;

-- ============================================================
-- Category B: 二重正答修正 — 文脈変更
-- ============================================================

-- B-1: b0000002 sort=8 推量表現 (みたい/らしい/ようだ/そうだ)
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 8;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '新聞によると、明日は雨（　）。',
      explanation = '「〜らしい」は間接的な情報や伝聞に基づく推量を表し、「~인 것 같다 / ~라고 한다」という意味です。「によると」と合わせて使うのが自然です。'
    WHERE id = target_q_id;
    -- Options stay the same text, no is_correct change needed
  END IF;
END $$;

-- B-2: b0000002 sort=13 推量表現 (そうだ/ようだ/らしい/だろう)
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000002-0000-0000-0000-000000000002' AND sort_order = 13;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '天気予報によると、明日は暑い（　）。',
      explanation = '「〜らしい」は伝聞や間接的な情報に基づく推量を表す表現です。「天気予報によると」という情報源と合わせて使います。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET is_correct = FALSE WHERE question_id = target_q_id AND sort_order = 2;
    UPDATE quiz_question_options SET is_correct = TRUE WHERE question_id = target_q_id AND sort_order = 3;
  END IF;
END $$;

-- B-3: b0000003 sort=12 はず/わけ
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000003-0000-0000-0000-000000000003' AND sort_order = 12;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '彼は10年日本に住んでいる。日本語が上手な（　）だ。',
      explanation = '「〜わけだ」は論理的な帰結・納得を表す文型で、「~인 셈이다 / 그러니까 ~인 것이다」という意味です。事実から当然の結論を導く時に使います。'
    WHERE id = target_q_id;
    UPDATE quiz_question_options SET option_text = 'もの' WHERE question_id = target_q_id AND sort_order = 1;
  END IF;
END $$;

-- B-4: b0000004 sort=25 添加表現 (ばかりか/どころか/だけでなく/のみならず)
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'b0000004-0000-0000-0000-000000000004' AND sort_order = 25;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_questions SET
      question_text = '忙しくて旅行（　）、買い物にも行けない。',
      explanation = '「〜どころか」は「~는커녕 / ~은 물론이고」의 의미로, 예상한 것보다 더 못하거나 부정적인 상황을 강조합니다。旅行はもちろん買い物さえできないという意味です。'
    WHERE id = target_q_id;
  END IF;
END $$;

-- ============================================================
-- Category C: 読解 — 選択肢を同義語に変更
-- ============================================================

-- C-1: c0000002 sort=19 「色づく」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'c0000002-0000-0000-0000-000000000002' AND sort_order = 19;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '色が変わる'
    WHERE question_id = target_q_id AND sort_order = 2;
  END IF;
END $$;

-- C-2: c0000003 sort=9 「心のこもった」
DO $$
DECLARE target_q_id UUID;
BEGIN
  SELECT id INTO target_q_id FROM quiz_questions
  WHERE quiz_id = 'c0000003-0000-0000-0000-000000000003' AND sort_order = 9;
  IF target_q_id IS NOT NULL THEN
    UPDATE quiz_question_options
    SET option_text = '気持ちを込めて書いた'
    WHERE question_id = target_q_id AND sort_order = 2;
  END IF;
END $$;
