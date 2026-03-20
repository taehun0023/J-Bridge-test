-- Basic Theory staged quiz sets:
-- - Check 1: lessons 01-02
-- - Check 2: lessons 03-04
-- - Final: lessons 01-04

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('60000001-0000-0000-0000-000000000003', 'CS知識 基礎理論 Final', 'cs_knowledge', 70, 20, false, true, 12),
  ('60000001-0000-0000-0000-000000000008', 'CS知識 基礎理論 Check 1', 'cs_knowledge', 70, 12, false, true, 8),
  ('60000001-0000-0000-0000-000000000009', 'CS知識 基礎理論 Check 2', 'cs_knowledge', 70, 12, false, true, 8),
  ('61000001-0000-0000-0000-000000000003', 'CS知識 基礎理論 Check 1 Source', 'cs_knowledge', 70, 0, false, false, NULL),
  ('61000001-0000-0000-0000-000000000004', 'CS知識 基礎理論 Check 2 Source', 'cs_knowledge', 70, 0, false, false, NULL),
  ('61000001-0000-0000-0000-000000000005', 'CS知識 基礎理論 Final Source', 'cs_knowledge', 70, 0, false, false, NULL)
ON CONFLICT (id) DO UPDATE SET
  title = EXCLUDED.title,
  passing_score = EXCLUDED.passing_score,
  time_limit_minutes = EXCLUDED.time_limit_minutes,
  is_pool = EXCLUDED.is_pool,
  questions_per_attempt = EXCLUDED.questions_per_attempt;

DELETE FROM quiz_question_options
WHERE question_id IN (
  SELECT id FROM quiz_questions
  WHERE quiz_id IN (
    '61000001-0000-0000-0000-000000000003',
    '61000001-0000-0000-0000-000000000004',
    '61000001-0000-0000-0000-000000000005'
  )
);

DELETE FROM quiz_questions
WHERE quiz_id IN (
  '61000001-0000-0000-0000-000000000003',
  '61000001-0000-0000-0000-000000000004',
  '61000001-0000-0000-0000-000000000005'
);

DO $$
DECLARE q_id UUID;
BEGIN
  -- Check 1: 8 questions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '3ビットで表せる状態数として正しいものはどれか。', '1ビットごとに 2 通りなので、3ビットなら 2×2×2 = 8 通りになる。', 1, 1, 'easy', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3 通り', false, 1),
    (gen_random_uuid(), q_id, '6 通り', false, 2),
    (gen_random_uuid(), q_id, '8 通り', true, 3),
    (gen_random_uuid(), q_id, '16 通り', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', 'ファイル容量を説明するとき、より自然に使う単位はどれか。', '容量や保存量はビットよりバイトで説明することが多い。', 1, 2, 'easy', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ビット', false, 1),
    (gen_random_uuid(), q_id, 'バイト', true, 2),
    (gen_random_uuid(), q_id, '文字コード', false, 3),
    (gen_random_uuid(), q_id, 'プロセス', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '2進数 1001 を 10進数で読むとき、足す値の組み合わせとして正しいものはどれか。', '1001 は 8 の位と 1 の位が 1 である。', 1, 3, 'medium', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8 と 1', true, 1),
    (gen_random_uuid(), q_id, '8 と 2', false, 2),
    (gen_random_uuid(), q_id, '4 と 1', false, 3),
    (gen_random_uuid(), q_id, '4 と 2', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '同じバイト列でも表示が崩れる主な理由として適切なのはどれか。', '文字化けは文字コード解釈のずれで起こりやすい。', 1, 4, 'medium', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPU が文字を理解できないから', false, 1),
    (gen_random_uuid(), q_id, '送信側と受信側の文字コード解釈がずれるから', true, 2),
    (gen_random_uuid(), q_id, '文字列は常に 1 バイト 1 文字だから', false, 3),
    (gen_random_uuid(), q_id, '整数型が足りないから', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '在庫個数のような値を扱うとき、まず優先して検討しやすい表現はどれか。', '個数は離散値なので整数が自然である。', 1, 5, 'medium', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '浮動小数点', false, 1),
    (gen_random_uuid(), q_id, '整数', true, 2),
    (gen_random_uuid(), q_id, '文字コード', false, 3),
    (gen_random_uuid(), q_id, 'UTF-8', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '「画面では文字が崩れるが、数値計算は正しい」という症状でまず疑う対象として適切なのはどれか。', '文字表示の異常は文字コード側を優先して疑う。', 1, 6, 'medium', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '文字コードやエンコーディング', true, 1),
    (gen_random_uuid(), q_id, '浮動小数点の丸めだけ', false, 2),
    (gen_random_uuid(), q_id, 'スタックとキューの違い', false, 3),
    (gen_random_uuid(), q_id, 'キャッシュミス', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '文字列長とバイト数が一致しない場面の説明として適切なのはどれか。', '多バイト文字を含むと、見える文字数とバイト数は一致しないことがある。', 1, 7, 'hard', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Unicode や UTF-8 では 1 文字が複数バイトになりうるから', true, 1),
    (gen_random_uuid(), q_id, '文字列は常に 1 バイト 1 文字だから一致しないことはない', false, 2),
    (gen_random_uuid(), q_id, '整数型が signed だから', false, 3),
    (gen_random_uuid(), q_id, '小数点の位置がずれるから', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000003', 'multiple_choice', '0.1 のような小数を扱うときの注意として最も適切なのはどれか。', '一部の小数は近似値として保持される。', 1, 8, 'hard', 'basic_theory_check_1', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '見た目が同じでも内部では完全一致しないことがある', true, 1),
    (gen_random_uuid(), q_id, '小数は常に整数より安全である', false, 2),
    (gen_random_uuid(), q_id, 'Unicode なら誤差は出ない', false, 3),
    (gen_random_uuid(), q_id, '通信速度は必ずバイト/秒で表す', false, 4);

  -- Check 2: 8 questions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '8ビット整数について正しく言えることはどれか。', '固定ビット幅の整数は表現範囲が有限である。', 1, 1, 'easy', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '表現可能範囲には上限がある', true, 1),
    (gen_random_uuid(), q_id, 'どんな大きな整数も正確に入る', false, 2),
    (gen_random_uuid(), q_id, '必ず小数も完全に表せる', false, 3),
    (gen_random_uuid(), q_id, 'signed と unsigned は同じ範囲を持つ', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '負数を絶対に持たないカウンタで 먼저 검토하기 쉬운型はどれか。', '負数不要なら unsigned を検討しやすい。', 1, 2, 'easy', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'unsigned', true, 1),
    (gen_random_uuid(), q_id, 'signed', false, 2),
    (gen_random_uuid(), q_id, '文字コード', false, 3),
    (gen_random_uuid(), q_id, 'UTF-16', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', 'オーバーフローを最も適切に説明したものはどれか。', '表現範囲を超えた結果を格納しようとした状態である。', 1, 3, 'medium', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '計算結果が表現可能範囲を超えた状態', true, 1),
    (gen_random_uuid(), q_id, 'CPU が必ず故障した状態', false, 2),
    (gen_random_uuid(), q_id, '文字コードがずれた状態', false, 3),
    (gen_random_uuid(), q_id, 'キューが空になった状態', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '浮動小数点の特徴として適切なのはどれか。', '広い範囲の実数を扱いやすいが、一部は近似になる。', 1, 4, 'medium', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '広い範囲の実数を近似で扱える', true, 1),
    (gen_random_uuid(), q_id, 'すべての小数を完全一致で保存する', false, 2),
    (gen_random_uuid(), q_id, '整数より常に厳密である', false, 3),
    (gen_random_uuid(), q_id, '負数を表せない', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '0.1 を何度も足した結果を比較するとき、まず自然に考えるべきことはどれか。', '厳密一致より許容誤差つき比較を検討する。', 1, 5, 'medium', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '許容誤差つきで十分近いかを確認する', true, 1),
    (gen_random_uuid(), q_id, '常に完全一致だけを見る', false, 2),
    (gen_random_uuid(), q_id, '文字数で比較する', false, 3),
    (gen_random_uuid(), q_id, '必ず unsigned へ変換する', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '本来負にならない在庫数が突然マイナスに見えた。まず疑う観点として自然なのはどれか。', 'signed 型や範囲超過を 먼저 점검する。', 1, 6, 'medium', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'signed 型で範囲を超えていないか', true, 1),
    (gen_random_uuid(), q_id, 'UTF-8 の多バイト化', false, 2),
    (gen_random_uuid(), q_id, 'HTTP メソッドの違い', false, 3),
    (gen_random_uuid(), q_id, 'プロセス数の増減', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', 'signed と unsigned の違いを読むとき、最も重要な判断軸はどれか。', '負数を扱う必要があるかが最初の判断軸である。', 1, 7, 'hard', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '負数を扱う必要があるか', true, 1),
    (gen_random_uuid(), q_id, '画面に何色で表示するか', false, 2),
    (gen_random_uuid(), q_id, '文字列長が一致するか', false, 3),
    (gen_random_uuid(), q_id, '配列か連結リストか', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000004', 'multiple_choice', '金額や件数のように 1 単位のずれも困る値에서 먼저 검토하기 쉬운表現はどれか。', '近似誤差を避けるため整数系を先に考える。', 1, 8, 'hard', 'basic_theory_check_2', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '整数系の表現', true, 1),
    (gen_random_uuid(), q_id, '浮動小数点だけ', false, 2),
    (gen_random_uuid(), q_id, '文字コード', false, 3),
    (gen_random_uuid(), q_id, 'キュー', false, 4);

  -- Final: 12 questions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '2進数の各桁が持つ意味として正しいものはどれか。', '各桁は 1, 2, 4, 8 ... の重みを持つ。', 1, 1, 'easy', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '右から 1, 2, 4, 8 ... の重みを持つ', true, 1),
    (gen_random_uuid(), q_id, 'すべて同じ 1 の重みを持つ', false, 2),
    (gen_random_uuid(), q_id, '左へ行くほど 10 倍になる', false, 3),
    (gen_random_uuid(), q_id, '文字コードにだけ使う', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '文字コードの説明として最も適切なのはどれか。', '文字コードは文字と番号の対応表である。', 1, 2, 'easy', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '文字と番号の対応表', true, 1),
    (gen_random_uuid(), q_id, 'CPU クロックの単位', false, 2),
    (gen_random_uuid(), q_id, '配列の並び順', false, 3),
    (gen_random_uuid(), q_id, '負数の表し方', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '2進数 110 を 10進数で読むと正しいものはどれか。', '110 は 4 + 2 で 6 である。', 1, 3, 'medium', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '6', true, 1),
    (gen_random_uuid(), q_id, '5', false, 2),
    (gen_random_uuid(), q_id, '3', false, 3),
    (gen_random_uuid(), q_id, '8', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '日本語テキストの一部だけ文字化けしたとき、まず確認しやすい観点はどれか。', '文字コード解釈の不一致を 먼저 확인する。', 1, 4, 'medium', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '送受信側で文字コード解釈が一致しているか', true, 1),
    (gen_random_uuid(), q_id, 'signed と unsigned の差', false, 2),
    (gen_random_uuid(), q_id, 'キュー長の設定', false, 3),
    (gen_random_uuid(), q_id, 'ソートの安定性', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', 'アクセス回数のように増え続ける整数を設計するとき、まず確認すべきことはどれか。', 'ビット幅と最大値を確認する。', 1, 5, 'medium', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '型のビット幅と最大値', true, 1),
    (gen_random_uuid(), q_id, 'Unicode の版数', false, 2),
    (gen_random_uuid(), q_id, 'CSS 変数名', false, 3),
    (gen_random_uuid(), q_id, 'ページ遷移速度', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '浮動小数点で 0.1 を扱うときに違和感が出る理由として適切なのはどれか。', '2進数で完全に表せず近似になることがある。', 1, 6, 'medium', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0.1 が内部で近い値に丸められることがあるから', true, 1),
    (gen_random_uuid(), q_id, '0.1 は実は文字だから', false, 2),
    (gen_random_uuid(), q_id, 'CPU は整数しか足せないから', false, 3),
    (gen_random_uuid(), q_id, 'ネットワーク経路が長いから', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '負数を使わない ID 番号に signed より unsigned を検討しやすい理由として適切なのはどれか。', '非負数に範囲を集中できるためである。', 1, 7, 'medium', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '負数用の範囲を使わずに済むから', true, 1),
    (gen_random_uuid(), q_id, '文字コードと互換性が高いから', false, 2),
    (gen_random_uuid(), q_id, '小数も完全に表せるから', false, 3),
    (gen_random_uuid(), q_id, '必ず高速になるから', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '「表示は 1.0 に見えるが比較では一致しない」状況でまず疑う観点はどれか。', '表示丸めと内部値の差を考え、浮動小数点誤差を疑う。', 1, 8, 'hard', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '浮動小数点の丸め誤差', true, 1),
    (gen_random_uuid(), q_id, '文字コードの範囲不足', false, 2),
    (gen_random_uuid(), q_id, 'スタックオーバーフロー', false, 3),
    (gen_random_uuid(), q_id, 'SQL インデックス不足', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '本来負にならない在庫数が急にマイナス表示になったとき、最も自然な読み方はどれか。', 'signed 範囲超過を 먼저 의심する。', 1, 9, 'hard', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'signed 整数の範囲超過を疑う', true, 1),
    (gen_random_uuid(), q_id, 'UTF-8 では必ず負数になる', false, 2),
    (gen_random_uuid(), q_id, 'バイトは常に負数を持つ', false, 3),
    (gen_random_uuid(), q_id, '配列の添字は文字列だから', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '金額と数量のような値を扱うシステムで、どちらも浮動小数点に統一する方針の弱点として適切なのはどれか。', '厳密さが必要な値に近似誤差を持ち込む。', 1, 10, 'hard', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '厳密であるべき値まで近似誤差の影響を受けうる', true, 1),
    (gen_random_uuid(), q_id, '文字コードが使えなくなる', false, 2),
    (gen_random_uuid(), q_id, '2進数が禁止される', false, 3),
    (gen_random_uuid(), q_id, 'ビット数が無限になる', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '同じ「値が変に見える」問題でも、文字化けとオーバーフローの違いとして最も適切なのはどれか。', '文字化けは解釈方式、オーバーフローは表現範囲の問題である。', 1, 11, 'hard', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '文字化けは文字コード解釈、オーバーフローは整数範囲の問題', true, 1),
    (gen_random_uuid(), q_id, 'どちらも必ず CPU 故障である', false, 2),
    (gen_random_uuid(), q_id, 'どちらも通信速度の問題である', false, 3),
    (gen_random_uuid(), q_id, 'どちらも 2進数と無関係である', false, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)
  VALUES (q_id, '61000001-0000-0000-0000-000000000005', 'multiple_choice', '次のうち、内部表現の制約を最もよく意識した判断はどれか。', '値の性質ごとに整数・浮動小数点・文字コードの制約を分けて考える。', 1, 12, 'hard', 'basic_theory_final', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '値の意味に応じて整数・浮動小数点・文字コードを使い分ける', true, 1),
    (gen_random_uuid(), q_id, '見た目が同じなら内部表現も同じとみなす', false, 2),
    (gen_random_uuid(), q_id, '有名な型を一つ選んで全部に使う', false, 3),
    (gen_random_uuid(), q_id, '表示だけ正しければ内部は確認しない', false, 4);
END $$;
