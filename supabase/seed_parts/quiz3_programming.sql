-- ============================================
-- Quiz 3: CS知識ランク試験 (90 questions)
-- Categories: algorithm, data_structure, os, network
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== algorithm - EASY (9) =====

  -- Q1: O記法の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '要素数nの配列を先頭から順に探索する線形探索の時間計算量はどれか。', '線形探索は最悪の場合すべての要素を調べるため、時間計算量はO(n)です。', 1, 1, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q2: 二分探索の前提
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索を適用するための前提条件として正しいものはどれか。', '二分探索は中央の要素と比較して探索範囲を半分に絞るため、データがソート済みである必要があります。', 1, 2, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データがソート済みであること', TRUE, 1),
    (gen_random_uuid(), q_id, 'データが連結リストに格納されていること', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの要素数が2の累乗であること', FALSE, 3),
    (gen_random_uuid(), q_id, 'データに重複がないこと', FALSE, 4);

  -- Q3: 二分探索の計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ソート済み配列に対する二分探索の平均時間計算量はどれか。', '二分探索は毎回探索範囲を半分にするため、時間計算量はO(log n)です。', 1, 3, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 4);

  -- Q4: バブルソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'バブルソートの最悪時間計算量はどれか。', 'バブルソートは隣接要素の比較・交換を繰り返すため、最悪時間計算量はO(n²)です。', 1, 4, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n²)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 4);

  -- Q5: 選択ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '選択ソートの動作として正しいものはどれか。', '選択ソートは未整列部分から最小値（または最大値）を見つけ、先頭の要素と交換する操作を繰り返します。', 1, 5, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '隣接する要素を比較して交換を繰り返す', FALSE, 1),
    (gen_random_uuid(), q_id, '未整列部分から最小値を選び先頭と交換する', TRUE, 2),
    (gen_random_uuid(), q_id, '要素を適切な位置に挿入していく', FALSE, 3),
    (gen_random_uuid(), q_id, 'ピボットを基準に分割を繰り返す', FALSE, 4);

  -- Q6: 挿入ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '挿入ソートの最良時間計算量はどれか。', '挿入ソートは配列がすでにソート済みの場合、各要素を1回ずつ確認するだけで済むため、最良時間計算量はO(n)です。', 1, 6, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 4);

  -- Q7: 再帰の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '再帰関数に必ず必要なものはどれか。', '再帰関数にはベースケース（終了条件）がないと無限に自身を呼び出し続け、スタックオーバーフローを起こします。', 1, 7, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'グローバル変数', FALSE, 1),
    (gen_random_uuid(), q_id, '複数の引数', FALSE, 2),
    (gen_random_uuid(), q_id, '戻り値の型宣言', FALSE, 3),
    (gen_random_uuid(), q_id, 'ベースケース（終了条件）', TRUE, 4);

  -- Q8: O記法の意味
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'O記法（ビッグオー記法）が表すものとして最も適切なのはどれか。', 'O記法はアルゴリズムの最悪時における計算量の上界（増加のオーダー）を表す記法です。', 1, 8, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの実行にかかる正確な秒数', FALSE, 1),
    (gen_random_uuid(), q_id, 'アルゴリズムの最悪時における計算量の増加オーダー', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモリ使用量の最小値', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUのクロック周波数に対する性能比', FALSE, 4);

  -- Q9: 安定ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '安定ソートの説明として正しいものはどれか。', '安定ソートとは、同じキー値を持つ要素の相対的な順序がソート後も保持されるソートアルゴリズムのことです。', 1, 9, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '常にO(n log n)で動作するソート', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ使用量がO(1)であるソート', FALSE, 2),
    (gen_random_uuid(), q_id, '同じ値の要素の相対順序がソート後も保持されるソート', TRUE, 3),
    (gen_random_uuid(), q_id, '入力データに関係なく常に同じ実行時間のソート', FALSE, 4);

  -- ===== algorithm - MEDIUM (9) =====

  -- Q10: クイックソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クイックソートの平均時間計算量はどれか。', 'クイックソートはピボットを基準に分割統治を行い、平均時間計算量はO(n log n)です。ただし最悪はO(n²)になります。', 1, 10, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 4);

  -- Q11: マージソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'マージソートの特徴として正しいものはどれか。', 'マージソートは安定ソートであり、最悪でもO(n log n)を保証しますが、追加のメモリ領域O(n)が必要です。', 1, 11, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '追加メモリ不要のインプレースソートである', FALSE, 1),
    (gen_random_uuid(), q_id, '最悪計算量がO(n²)になる場合がある', FALSE, 2),
    (gen_random_uuid(), q_id, '安定ソートであり最悪でもO(n log n)を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, '不安定ソートだが平均計算量が最も速い', FALSE, 4);

  -- Q12: ハッシュ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュ法における探索の平均時間計算量はどれか。', 'ハッシュ法ではハッシュ関数で直接アクセスするため、衝突がなければ平均O(1)で探索できます。', 1, 12, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q13: グリーディ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'グリーディ法（貪欲法）の説明として正しいものはどれか。', 'グリーディ法は各段階で局所的に最適な選択を行う手法で、常にグローバル最適解が得られるとは限りません。', 1, 13, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべての組み合わせを試して最適解を求める', FALSE, 1),
    (gen_random_uuid(), q_id, '問題を小さな部分問題に分割して結果を統合する', FALSE, 2),
    (gen_random_uuid(), q_id, '過去の計算結果を記録して再利用する', FALSE, 3),
    (gen_random_uuid(), q_id, '各段階で局所的に最適な選択を繰り返す', TRUE, 4);

  -- Q14: 分割統治法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '分割統治法を用いているアルゴリズムとして最も適切なのはどれか。', 'マージソートは配列を半分に分割し、再帰的にソートしてからマージする典型的な分割統治法のアルゴリズムです。', 1, 14, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '線形探索', FALSE, 1),
    (gen_random_uuid(), q_id, 'マージソート', TRUE, 2),
    (gen_random_uuid(), q_id, 'バブルソート', FALSE, 3),
    (gen_random_uuid(), q_id, 'ダイクストラ法', FALSE, 4);

  -- Q15: DFS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '深さ優先探索（DFS）の実装に一般的に使用されるデータ構造はどれか。', 'DFSは最後に訪れた頂点から探索を進めるため、スタック（または再帰呼び出しスタック）を使用します。', 1, 15, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キュー', FALSE, 1),
    (gen_random_uuid(), q_id, 'ヒープ', FALSE, 2),
    (gen_random_uuid(), q_id, 'スタック', TRUE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q16: BFS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '幅優先探索（BFS）の実装に一般的に使用されるデータ構造はどれか。', 'BFSは発見した頂点を順に処理するため、先入先出のキューを使用します。', 1, 16, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スタック', FALSE, 1),
    (gen_random_uuid(), q_id, 'キュー', TRUE, 2),
    (gen_random_uuid(), q_id, '二分探索木', FALSE, 3),
    (gen_random_uuid(), q_id, '配列', FALSE, 4);

  -- Q17: 動的計画法の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '動的計画法（DP）の基本的な考え方として正しいものはどれか。', '動的計画法は部分問題の解をメモ化（記録）して再利用することで、重複計算を避け効率的に解を求めます。', 1, 17, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '乱数を使って近似解を高速に求める', FALSE, 1),
    (gen_random_uuid(), q_id, '部分問題の解を記録し再利用して重複計算を避ける', TRUE, 2),
    (gen_random_uuid(), q_id, '常に局所最適な選択を繰り返す', FALSE, 3),
    (gen_random_uuid(), q_id, '問題をランダムに分割して並列処理する', FALSE, 4);

  -- Q18: クイックソートの最悪ケース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クイックソートの最悪時間計算量がO(n²)になるのはどのような場合か。', 'ピボットが常に最小値または最大値に選ばれると、分割が偏り最悪O(n²)になります。すでにソート済みの配列で先頭をピボットにすると発生しやすいです。', 1, 18, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '配列の要素がすべて同じ値の場合', FALSE, 1),
    (gen_random_uuid(), q_id, '配列の要素数が奇数の場合', FALSE, 2),
    (gen_random_uuid(), q_id, 'ピボットが常に最小値または最大値に選ばれる場合', TRUE, 3),
    (gen_random_uuid(), q_id, '配列にランダムな値が含まれる場合', FALSE, 4);

  -- ===== algorithm - HARD (9) =====

  -- Q19: ダイクストラ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ダイクストラ法の制約として正しいものはどれか。', 'ダイクストラ法は負の重みを持つ辺があると正しく動作しません。負の辺がある場合はベルマンフォード法を使います。', 1, 19, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'グラフが無向グラフでなければならない', FALSE, 1),
    (gen_random_uuid(), q_id, '辺の重みが負でないことが必要である', TRUE, 2),
    (gen_random_uuid(), q_id, 'グラフが完全グラフでなければならない', FALSE, 3),
    (gen_random_uuid(), q_id, '頂点数が辺数より多くなければならない', FALSE, 4);

  -- Q20: ベルマンフォード法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ベルマンフォード法の時間計算量はどれか（頂点数V、辺数E）。', 'ベルマンフォード法はすべての辺を(V-1)回緩和するため、時間計算量はO(VE)です。', 1, 20, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V + E)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V log V)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(E log V)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(VE)', TRUE, 4);

  -- Q21: 高度なDP（ナップサック問題）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '0-1ナップサック問題をDPで解く場合の時間計算量はどれか（品物数n、容量W）。', '0-1ナップサック問題は品物ごとに各容量の最適値を更新するため、時間計算量はO(nW)です。', 1, 21, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n log W)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(nW)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(2^n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q22: 最小全域木（クラスカル法）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クラスカル法で最小全域木を求める際に使用される代表的なデータ構造はどれか。', 'クラスカル法では辺を重みの昇順に処理し、閉路の検出にUnion-Find（素集合データ構造）を使用します。', 1, 22, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '優先度キュー', FALSE, 1),
    (gen_random_uuid(), q_id, 'Union-Find（素集合データ構造）', TRUE, 2),
    (gen_random_uuid(), q_id, 'AVL木', FALSE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q23: NP完全問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'NP完全問題の説明として正しいものはどれか。', 'NP完全問題はNPに属し、かつすべてのNP問題が多項式時間で帰着可能な問題です。多項式時間の解法は見つかっていません。', 1, 23, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '多項式時間で必ず解ける問題', FALSE, 1),
    (gen_random_uuid(), q_id, '解が存在しないことが証明された問題', FALSE, 2),
    (gen_random_uuid(), q_id, 'NPに属し全てのNP問題から多項式時間で帰着可能な問題', TRUE, 3),
    (gen_random_uuid(), q_id, '指数時間でしか検証できない問題', FALSE, 4);

  -- Q24: 計算量クラス P vs NP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '計算量クラスPの説明として正しいものはどれか。', 'クラスPは決定性チューリングマシンで多項式時間で解ける決定問題の集合です。', 1, 24, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決定性チューリングマシンで多項式時間で解ける問題の集合', TRUE, 1),
    (gen_random_uuid(), q_id, '非決定性チューリングマシンでのみ解ける問題の集合', FALSE, 2),
    (gen_random_uuid(), q_id, '解の検証に指数時間かかる問題の集合', FALSE, 3),
    (gen_random_uuid(), q_id, '近似アルゴリズムでしか解けない問題の集合', FALSE, 4);

  -- Q25: ダイクストラ法の計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '優先度キュー（二分ヒープ）を使ったダイクストラ法の時間計算量はどれか（頂点数V、辺数E）。', '二分ヒープを使うと頂点の取り出しにO(log V)、各辺の緩和にO(log V)かかるため、全体でO((V + E) log V)です。', 1, 25, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(VE)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O((V + E) log V)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(V log E)', FALSE, 4);

  -- Q26: プリム法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プリム法とクラスカル法の共通点として正しいものはどれか。', 'プリム法もクラスカル法もグラフの最小全域木を求める貪欲アルゴリズムです。', 1, 26, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'どちらも最短経路を求めるアルゴリズムである', FALSE, 1),
    (gen_random_uuid(), q_id, 'どちらも動的計画法に基づくアルゴリズムである', FALSE, 2),
    (gen_random_uuid(), q_id, 'どちらも負の辺がある場合のみ使用される', FALSE, 3),
    (gen_random_uuid(), q_id, 'どちらも最小全域木を求める貪欲アルゴリズムである', TRUE, 4);

  -- Q27: メモ化再帰とDP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'メモ化再帰（トップダウンDP）とボトムアップDPの違いとして正しいものはどれか。', 'メモ化再帰は必要な部分問題のみを解くのに対し、ボトムアップDPは小さい部分問題からすべて順に解いていきます。', 1, 27, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモ化再帰は再帰を使わずループで実装する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ボトムアップDPは必要な部分問題だけを計算する', FALSE, 2),
    (gen_random_uuid(), q_id, 'メモ化再帰は必要な部分問題のみを解きボトムアップは全部分問題を順に解く', TRUE, 3),
    (gen_random_uuid(), q_id, '両者の計算量は常に異なる', FALSE, 4);

  -- ===== data_structure - EASY (9) =====

  -- Q28: 配列の特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '配列のインデックスによるアクセスの時間計算量はどれか。', '配列は連続したメモリ領域に格納されるため、インデックスで直接アクセスでき、時間計算量はO(1)です。', 1, 28, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q29: 連結リスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '単方向連結リストの先頭への挿入の時間計算量はどれか。', '連結リストの先頭への挿入は新しいノードを作成しポインタを付け替えるだけなので、O(1)です。', 1, 29, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q30: スタック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スタックのデータ操作方式として正しいものはどれか。', 'スタックはLIFO（Last In, First Out）方式で、最後に追加された要素が最初に取り出されます。', 1, 30, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'FIFO（先入先出）', FALSE, 1),
    (gen_random_uuid(), q_id, 'LIFO（後入先出）', TRUE, 2),
    (gen_random_uuid(), q_id, 'ランダムアクセス', FALSE, 3),
    (gen_random_uuid(), q_id, '優先度順', FALSE, 4);

  -- Q31: キュー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'キューのデータ操作方式として正しいものはどれか。', 'キューはFIFO（First In, First Out）方式で、最初に追加された要素が最初に取り出されます。', 1, 31, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LIFO（後入先出）', FALSE, 1),
    (gen_random_uuid(), q_id, '優先度順', FALSE, 2),
    (gen_random_uuid(), q_id, 'FIFO（先入先出）', TRUE, 3),
    (gen_random_uuid(), q_id, 'ランダムアクセス', FALSE, 4);

  -- Q32: ハッシュテーブル基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルでキーから値を取得する平均時間計算量はどれか。', 'ハッシュテーブルはハッシュ関数でインデックスを計算して直接アクセスするため、衝突が少なければ平均O(1)です。', 1, 32, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 4);

  -- Q33: 配列 vs 連結リスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '連結リストが配列より優れている操作はどれか。', '連結リストは中間要素の挿入・削除時にポインタの付け替えだけで済むため、O(1)で実行できます（位置が既知の場合）。配列では要素のシフトが必要です。', 1, 33, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックスによるランダムアクセス', FALSE, 1),
    (gen_random_uuid(), q_id, '中間位置への要素の挿入・削除', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモリの効率的な使用', FALSE, 3),
    (gen_random_uuid(), q_id, 'キャッシュ効率の高い順次アクセス', FALSE, 4);

  -- Q34: スタックの応用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スタックが利用される場面として最も適切なものはどれか。', '括弧の対応チェックでは開き括弧をスタックにpushし、閉じ括弧が来たらpopして対応を確認します。', 1, 34, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プリンタのジョブ管理', FALSE, 1),
    (gen_random_uuid(), q_id, 'CPUのタスクスケジューリング', FALSE, 2),
    (gen_random_uuid(), q_id, '括弧の対応チェック', TRUE, 3),
    (gen_random_uuid(), q_id, '最短経路の探索', FALSE, 4);

  -- Q35: キューの応用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'キューが利用される場面として最も適切なものはどれか。', 'プリンタのジョブ管理は先に依頼された印刷から順に処理するFIFO方式で、キューが適しています。', 1, 35, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数の再帰呼び出し管理', FALSE, 1),
    (gen_random_uuid(), q_id, 'ブラウザの戻るボタン履歴', FALSE, 2),
    (gen_random_uuid(), q_id, '式の逆ポーランド記法の評価', FALSE, 3),
    (gen_random_uuid(), q_id, 'プリンタのジョブ管理', TRUE, 4);

  -- Q36: 連結リストの探索
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '単方向連結リストで特定の要素を探索する時間計算量はどれか。', '連結リストではインデックスによる直接アクセスができないため、先頭から順にたどる必要があり、最悪O(n)です。', 1, 36, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- ===== data_structure - MEDIUM (9) =====

  -- Q37: 二分探索木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索木（BST）の性質として正しいものはどれか。', '二分探索木では、任意のノードの左部分木のすべての値はそのノードより小さく、右部分木のすべての値はそのノードより大きくなります。', 1, 37, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各ノードは最大3つの子を持つ', FALSE, 1),
    (gen_random_uuid(), q_id, '左の子は親より小さく右の子は親より大きい', TRUE, 2),
    (gen_random_uuid(), q_id, '常に完全二分木である', FALSE, 3),
    (gen_random_uuid(), q_id, '葉ノードの深さはすべて同じである', FALSE, 4);

  -- Q38: ヒープ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '最小ヒープにおいて最小値を取得する時間計算量はどれか。', '最小ヒープでは最小値が常にルートにあるため、O(1)で取得できます。削除後の再構成にはO(log n)かかります。', 1, 38, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q39: グラフ表現（隣接行列）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '頂点数Vのグラフを隣接行列で表現した場合の空間計算量はどれか。', '隣接行列はV×Vの2次元配列を使用するため、空間計算量はO(V²)です。', 1, 39, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V + E)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(V²)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(E²)', FALSE, 4);

  -- Q40: グラフ表現（隣接リスト）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '隣接リストでグラフを表現した場合の空間計算量はどれか（頂点数V、辺数E）。', '隣接リストは各頂点のリストと各辺の情報を保持するため、空間計算量はO(V + E)です。', 1, 40, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V + E)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(E)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(V × E)', FALSE, 4);

  -- Q41: ハッシュ衝突解決（チェイン法）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルの衝突解決法であるチェイン法の説明として正しいものはどれか。', 'チェイン法は同じハッシュ値を持つ要素を連結リストで管理する方式です。', 1, 41, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '衝突時に次の空きスロットを探す', FALSE, 1),
    (gen_random_uuid(), q_id, '衝突時にハッシュ関数を変えて再計算する', FALSE, 2),
    (gen_random_uuid(), q_id, '同じハッシュ値の要素を連結リストで管理する', TRUE, 3),
    (gen_random_uuid(), q_id, '衝突時にテーブルサイズを2倍にする', FALSE, 4);

  -- Q42: オープンアドレス法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルの衝突解決法であるオープンアドレス法（線形探査）の説明として正しいものはどれか。', 'オープンアドレス法の線形探査は、衝突が発生したら次のスロットを順に調べて空きを見つけます。', 1, 42, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '衝突したら次の空きスロットを順に探す', TRUE, 1),
    (gen_random_uuid(), q_id, '衝突した要素を別のハッシュテーブルに格納する', FALSE, 2),
    (gen_random_uuid(), q_id, '衝突した要素を連結リストで管理する', FALSE, 3),
    (gen_random_uuid(), q_id, '衝突したら要素を破棄する', FALSE, 4);

  -- Q43: 優先度キュー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '優先度キューの実装に最もよく使われるデータ構造はどれか。', '優先度キューはヒープで実装するのが一般的で、挿入・削除がO(log n)で効率的に行えます。', 1, 43, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソート済み配列', FALSE, 1),
    (gen_random_uuid(), q_id, '連結リスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ヒープ', TRUE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q44: 二分探索木の最悪ケース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索木の探索が最悪O(n)になるのはどのような場合か。', '昇順または降順にデータを挿入すると木が一方向に偏り（退化して連結リストのようになり）、探索がO(n)になります。', 1, 44, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ノード数が2の累乗のとき', FALSE, 1),
    (gen_random_uuid(), q_id, '木が完全二分木のとき', FALSE, 2),
    (gen_random_uuid(), q_id, 'データがランダムな順序で挿入されたとき', FALSE, 3),
    (gen_random_uuid(), q_id, 'データが昇順または降順に挿入されて木が偏ったとき', TRUE, 4);

  -- Q45: ヒープの挿入計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分ヒープへの要素挿入の時間計算量はどれか。', '二分ヒープへの挿入は末尾に追加してから親と比較して上に移動（ヒープアップ）するため、木の高さに比例しO(log n)です。', 1, 45, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- ===== data_structure - HARD (9) =====

  -- Q46: AVL木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'AVL木の特徴として正しいものはどれか。', 'AVL木は各ノードの左右部分木の高さの差が最大1以内に保たれる自己平衡二分探索木です。', 1, 46, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各ノードの左右部分木の高さの差が最大1以内である', TRUE, 1),
    (gen_random_uuid(), q_id, '各ノードが赤または黒の色を持つ', FALSE, 2),
    (gen_random_uuid(), q_id, '各ノードが最大4つの子を持てる', FALSE, 3),
    (gen_random_uuid(), q_id, '葉ノードにのみデータを格納する', FALSE, 4);

  -- Q47: B木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'B木が主に使用される場面として最も適切なのはどれか。', 'B木はノードに複数のキーを持ちディスクI/Oを減らすため、データベースやファイルシステムのインデックスに広く使われています。', 1, 47, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリ内のソート処理', FALSE, 1),
    (gen_random_uuid(), q_id, 'データベースやファイルシステムのインデックス', TRUE, 2),
    (gen_random_uuid(), q_id, 'グラフの最短経路探索', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワークパケットのルーティング', FALSE, 4);

  -- Q48: トライ木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トライ木（Trie）の説明として正しいものはどれか。', 'トライ木は文字列の各文字をノードとして格納する木構造で、文字列の探索が文字列長mに対してO(m)で行えます。', 1, 48, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '数値データの高速ソートに使われる', FALSE, 1),
    (gen_random_uuid(), q_id, 'グラフの閉路検出に使われる', FALSE, 2),
    (gen_random_uuid(), q_id, '文字列の各文字をノードとして格納し高速な文字列探索を実現する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ヒープ条件を満たす完全二分木である', FALSE, 4);

  -- Q49: Union-Find
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Union-Find（素集合データ構造）で経路圧縮とランクによる統合を両方適用した場合の1操作あたりの償却計算量はどれか。', '経路圧縮とランクによる統合を組み合わせると、1操作あたりの償却計算量はほぼO(1)であるO(α(n))になります。α(n)は逆アッカーマン関数です。', 1, 49, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(α(n))（ほぼ定数時間）', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(√n)', FALSE, 4);

  -- Q50: 赤黒木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '赤黒木の性質として正しいものはどれか。', '赤黒木ではルートから任意の葉までの黒ノードの数（黒高さ）が同じであるという性質により、木の高さがO(log n)に保たれます。', 1, 50, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてのノードが同じ深さにある', FALSE, 1),
    (gen_random_uuid(), q_id, '左右の部分木の高さの差が常に0である', FALSE, 2),
    (gen_random_uuid(), q_id, 'ルートから任意の葉までの黒ノード数が等しい', TRUE, 3),
    (gen_random_uuid(), q_id, '赤ノードは必ず2つの子を持つ', FALSE, 4);

  -- Q51: AVL木の回転
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'AVL木で挿入後にバランスが崩れた場合に行う操作はどれか。', 'AVL木ではバランス因子が-1から1の範囲を超えた場合、単回転または二重回転を行って平衡を回復します。', 1, 51, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ノードの色を変更する', FALSE, 1),
    (gen_random_uuid(), q_id, '木を再構築する', FALSE, 2),
    (gen_random_uuid(), q_id, '回転操作（単回転または二重回転）を行う', TRUE, 3),
    (gen_random_uuid(), q_id, 'ノードを分割して新しい親を作る', FALSE, 4);

  -- Q52: B木のノード特性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '次数mのB木において、ルート以外の各ノードが持つキーの最小数はいくつか。', '次数mのB木では、ルート以外の各ノードは最低⌈m/2⌉-1個のキーを持つ必要があります。', 1, 52, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, 'm-1', FALSE, 2),
    (gen_random_uuid(), q_id, '⌈m/2⌉-1', TRUE, 3),
    (gen_random_uuid(), q_id, 'm/2', FALSE, 4);

  -- Q53: 赤黒木 vs AVL木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '赤黒木とAVL木の比較として正しいものはどれか。', 'AVL木はより厳密に平衡が保たれるため探索が速い反面、挿入・削除時の回転が多くなります。赤黒木は緩い平衡条件で挿入・削除が効率的です。', 1, 53, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '赤黒木の方が探索が常に速い', FALSE, 1),
    (gen_random_uuid(), q_id, 'AVL木の方が挿入・削除が常に速い', FALSE, 2),
    (gen_random_uuid(), q_id, '赤黒木は挿入・削除が効率的でAVL木は探索が効率的', TRUE, 3),
    (gen_random_uuid(), q_id, '両者の性能は完全に同一である', FALSE, 4);

  -- Q54: トライ木の空間計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トライ木の欠点として最も適切なものはどれか。', 'トライ木は各ノードが文字集合サイズ分のポインタを持つため、メモリ使用量が大きくなりがちです。', 1, 54, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '文字列の探索がO(n²)になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'ソート済みデータしか格納できない', FALSE, 2),
    (gen_random_uuid(), q_id, '各ノードが文字集合サイズ分のポインタを持ちメモリ使用量が大きい', TRUE, 3),
    (gen_random_uuid(), q_id, '同じ前方一致の文字列を格納できない', FALSE, 4);

  -- ===== os - EASY (6) =====

  -- Q55: プロセスとスレッド
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プロセスとスレッドの違いとして正しいものはどれか。', 'スレッドは同一プロセス内でメモリ空間を共有して動作しますが、プロセスはそれぞれ独立したメモリ空間を持ちます。', 1, 55, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スレッドはプロセスより多くのメモリを消費する', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロセスは同一メモリ空間を共有する', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッドは同一プロセス内でメモリ空間を共有する', TRUE, 3),
    (gen_random_uuid(), q_id, 'プロセスとスレッドに違いはない', FALSE, 4);

  -- Q56: メモリ管理の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プログラム実行時にローカル変数が格納される領域はどれか。', 'ローカル変数は関数呼び出し時にスタック領域に確保され、関数の終了とともに自動的に解放されます。', 1, 56, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ヒープ領域', FALSE, 1),
    (gen_random_uuid(), q_id, 'スタック領域', TRUE, 2),
    (gen_random_uuid(), q_id, 'データ領域（静的領域）', FALSE, 3),
    (gen_random_uuid(), q_id, 'コード領域', FALSE, 4);

  -- Q57: ファイルシステム
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ファイルシステムの主な役割として正しいものはどれか。', 'ファイルシステムはディスク上のデータを階層的に整理し、ファイルの作成・読み書き・削除を管理します。', 1, 57, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUのタスクスケジューリング', FALSE, 1),
    (gen_random_uuid(), q_id, 'ネットワーク接続の管理', FALSE, 2),
    (gen_random_uuid(), q_id, 'ディスク上のデータを階層的に整理し管理する', TRUE, 3),
    (gen_random_uuid(), q_id, 'メモリの仮想アドレス変換', FALSE, 4);

  -- Q58: プロセスの状態
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プロセスの基本的な状態遷移に含まれないものはどれか。', 'プロセスの基本状態は「実行」「準備（実行可能）」「待ち（ブロック）」です。「コンパイル中」はプロセスの状態ではありません。', 1, 58, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行状態', FALSE, 1),
    (gen_random_uuid(), q_id, '準備状態（実行可能）', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイル中', TRUE, 3),
    (gen_random_uuid(), q_id, '待ち状態（ブロック）', FALSE, 4);

  -- Q59: ヒープ領域
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ヒープ領域の説明として正しいものはどれか。', 'ヒープ領域はプログラムが実行時に動的にメモリを確保・解放するための領域です。', 1, 59, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数のローカル変数が格納される領域', FALSE, 1),
    (gen_random_uuid(), q_id, 'プログラムの実行コードが配置される領域', FALSE, 2),
    (gen_random_uuid(), q_id, 'グローバル変数と静的変数が格納される領域', FALSE, 3),
    (gen_random_uuid(), q_id, '動的にメモリを確保・解放するための領域', TRUE, 4);

  -- Q60: カーネルの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSのカーネルの役割として最も適切なものはどれか。', 'カーネルはOSの中核部分で、ハードウェア管理、プロセス管理、メモリ管理などシステム全体を制御します。', 1, 60, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ハードウェアやプロセス、メモリなどシステム全体を制御する', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーのGUIを描画する', FALSE, 2),
    (gen_random_uuid(), q_id, 'アプリケーションのインストールを行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルの圧縮と暗号化を行う', FALSE, 4);

  -- ===== os - MEDIUM (6) =====

  -- Q61: デッドロック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'デッドロックが発生するために必要な4つの条件に含まれないものはどれか。', 'デッドロックの4条件は「相互排除」「保持と待機」「横取り不可」「循環待ち」です。「優先度逆転」はデッドロックの必要条件ではありません。', 1, 61, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '相互排除', FALSE, 1),
    (gen_random_uuid(), q_id, '保持と待機', FALSE, 2),
    (gen_random_uuid(), q_id, '優先度逆転', TRUE, 3),
    (gen_random_uuid(), q_id, '循環待ち', FALSE, 4);

  -- Q62: ページング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ページングの説明として正しいものはどれか。', 'ページングはメモリを固定サイズのページに分割し、仮想アドレスから物理アドレスへページテーブルを使って変換する手法です。', 1, 62, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリを可変サイズのセグメントに分割する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリを固定サイズのページに分割し仮想アドレスを物理アドレスに変換する', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスク全体をメモリとして使用する', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUキャッシュの管理方式の一つ', FALSE, 4);

  -- Q63: 仮想メモリ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '仮想メモリの利点として正しいものはどれか。', '仮想メモリにより物理メモリより大きなアドレス空間を使用でき、各プロセスが独立したアドレス空間を持てます。', 1, 63, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの実行速度が必ず向上する', FALSE, 1),
    (gen_random_uuid(), q_id, '物理メモリより大きなアドレス空間を利用できる', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクI/Oが不要になる', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリリークが完全に防止される', FALSE, 4);

  -- Q64: ラウンドロビン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ラウンドロビンスケジューリングの説明として正しいものはどれか。', 'ラウンドロビンは各プロセスに等しいタイムスライス（量子）を割り当て、時間切れで次のプロセスに切り替える公平な方式です。', 1, 64, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '最も短い実行時間のプロセスを優先する', FALSE, 1),
    (gen_random_uuid(), q_id, '各プロセスに等しいタイムスライスを順番に割り当てる', TRUE, 2),
    (gen_random_uuid(), q_id, '優先度の高いプロセスが常に先に実行される', FALSE, 3),
    (gen_random_uuid(), q_id, '先に到着したプロセスが完了するまで実行される', FALSE, 4);

  -- Q65: コンテキストスイッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'コンテキストスイッチの説明として正しいものはどれか。', 'コンテキストスイッチは実行中のプロセスの状態を保存し、別のプロセスの状態を復元してCPUの実行を切り替える操作です。', 1, 65, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリの内容をディスクに書き出すこと', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロセスの状態を保存し別のプロセスの状態を復元してCPUを切り替えること', TRUE, 2),
    (gen_random_uuid(), q_id, 'ユーザーモードからカーネルモードへの遷移のみを指す', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロセスを終了して新しいプロセスを起動すること', FALSE, 4);

  -- Q66: ページフォルト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ページフォルトが発生する状況として正しいものはどれか。', 'ページフォルトはアクセスしようとしたページが物理メモリ上に存在せずディスクから読み込む必要がある場合に発生します。', 1, 66, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUキャッシュにデータが見つからなかった場合', FALSE, 1),
    (gen_random_uuid(), q_id, 'アクセスしたページが物理メモリ上に存在しない場合', TRUE, 2),
    (gen_random_uuid(), q_id, 'ファイルシステムのエラーが発生した場合', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロセスの優先度が変更された場合', FALSE, 4);

  -- ===== os - HARD (6) =====

  -- Q67: セマフォとミューテックス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'セマフォとミューテックスの違いとして正しいものはどれか。', 'ミューテックスはロックした本人のみが解放でき排他制御に特化しています。セマフォはカウンタ値を持ち複数のリソースへの同時アクセスを制御できます。', 1, 67, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セマフォはバイナリ値しか取れない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ミューテックスはカウンタ値を持つ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ミューテックスはロック取得者のみ解放でき、セマフォはカウンタで複数アクセスを制御する', TRUE, 3),
    (gen_random_uuid(), q_id, '両者に機能上の違いはない', FALSE, 4);

  -- Q68: メモリ断片化
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '外部断片化の説明として正しいものはどれか。', '外部断片化は空きメモリが小さなブロックに分散し、合計では十分な空きがあるのに連続した大きな領域が確保できない状態です。', 1, 68, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '確保されたメモリブロック内部に未使用部分が生じること', FALSE, 1),
    (gen_random_uuid(), q_id, '空きメモリが分散して大きな連続領域を確保できないこと', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクの空き容量が不足していること', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUキャッシュのヒット率が低下すること', FALSE, 4);

  -- Q69: LRUページ置換
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'LRU（Least Recently Used）ページ置換アルゴリズムの説明として正しいものはどれか。', 'LRUは最も長い間アクセスされていないページを置換対象に選ぶアルゴリズムで、時間的局所性の原理に基づいています。', 1, 69, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '最も最近にアクセスされたページを置換する', FALSE, 1),
    (gen_random_uuid(), q_id, '最もアクセス回数が少ないページを置換する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ランダムにページを選んで置換する', FALSE, 3),
    (gen_random_uuid(), q_id, '最も長い間アクセスされていないページを置換する', TRUE, 4);

  -- Q70: スラッシング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スラッシングの説明として正しいものはどれか。', 'スラッシングはページフォルトが頻発しOSがページの入れ替えに多くの時間を費やし、実質的な処理がほとんど進まなくなる状態です。', 1, 70, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUの温度が上がりすぎて性能が低下する現象', FALSE, 1),
    (gen_random_uuid(), q_id, 'ページフォルトが頻発しページ入れ替えにCPU時間が費やされ処理が進まない状態', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクのシーク時間が増大する現象', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワークの帯域幅が飽和する状態', FALSE, 4);

  -- Q71: 内部断片化
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '内部断片化が発生する原因として正しいものはどれか。', '内部断片化は固定サイズのメモリブロックを割り当てた際に、実際に必要な量よりブロックが大きいために生じる未使用部分です。', 1, 71, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '可変サイズのメモリ割り当てを行うこと', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリの空き領域が分散すること', FALSE, 2),
    (gen_random_uuid(), q_id, '固定サイズのブロック割り当てで使用量よりブロックが大きいこと', TRUE, 3),
    (gen_random_uuid(), q_id, 'ディスクのセクタサイズが不均一であること', FALSE, 4);

  -- Q72: ベラディの異常
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ベラディの異常（Belady''s Anomaly）の説明として正しいものはどれか。', 'ベラディの異常はFIFOページ置換で、ページフレーム数を増やしたにもかかわらずページフォルト率が増加する現象です。LRUでは発生しません。', 1, 72, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LRUでページフレームを増やすとページフォルトが増える現象', FALSE, 1),
    (gen_random_uuid(), q_id, 'FIFOでページフレームを増やしてもページフォルトが増えることがある現象', TRUE, 2),
    (gen_random_uuid(), q_id, 'すべてのページ置換アルゴリズムで発生する現象', FALSE, 3),
    (gen_random_uuid(), q_id, 'ページサイズを大きくするとフォルト率が上がる現象', FALSE, 4);

  -- ===== network - EASY (6) =====

  -- Q73: OSI参照モデル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSI参照モデルの第3層（ネットワーク層）で動作するプロトコルはどれか。', 'IPはネットワーク層（第3層）で動作し、パケットのルーティングとアドレッシングを担当します。', 1, 73, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'TCP', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP', FALSE, 2),
    (gen_random_uuid(), q_id, 'IP', TRUE, 3),
    (gen_random_uuid(), q_id, 'Ethernet', FALSE, 4);

  -- Q74: TCP vs UDP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'TCPとUDPの違いとして正しいものはどれか。', 'TCPはコネクション型で信頼性のあるデータ転送を保証しますが、UDPはコネクションレスで信頼性を保証しない代わりに高速です。', 1, 74, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UDPはコネクション型でTCPはコネクションレスである', FALSE, 1),
    (gen_random_uuid(), q_id, 'TCPはコネクション型で信頼性を保証しUDPはコネクションレスで高速である', TRUE, 2),
    (gen_random_uuid(), q_id, 'TCPもUDPも信頼性を保証する', FALSE, 3),
    (gen_random_uuid(), q_id, 'UDPはTCPより常に遅い', FALSE, 4);

  -- Q75: IPアドレス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'IPv4アドレスのビット数はどれか。', 'IPv4アドレスは32ビットで構成され、約43億個のアドレスを表現できます。', 1, 75, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '16ビット', FALSE, 1),
    (gen_random_uuid(), q_id, '32ビット', TRUE, 2),
    (gen_random_uuid(), q_id, '64ビット', FALSE, 3),
    (gen_random_uuid(), q_id, '128ビット', FALSE, 4);

  -- Q76: HTTP基礎
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPプロトコルの特徴として正しいものはどれか。', 'HTTPはステートレスなプロトコルで、各リクエストは独立しており前回のリクエストの情報を保持しません。', 1, 76, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ステートフルで接続状態を常に保持する', FALSE, 1),
    (gen_random_uuid(), q_id, 'バイナリプロトコルでテキストデータを扱えない', FALSE, 2),
    (gen_random_uuid(), q_id, 'UDPの上で動作する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ステートレスで各リクエストが独立している', TRUE, 4);

  -- Q77: ポート番号
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPSが標準で使用するポート番号はどれか。', 'HTTPSはポート443を標準で使用します。HTTPは80、SSHは22、FTPは21です。', 1, 77, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '80', FALSE, 1),
    (gen_random_uuid(), q_id, '443', TRUE, 2),
    (gen_random_uuid(), q_id, '22', FALSE, 3),
    (gen_random_uuid(), q_id, '8080', FALSE, 4);

  -- Q78: OSI参照モデルの層数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSI参照モデルは全部で何層あるか。', 'OSI参照モデルは物理層・データリンク層・ネットワーク層・トランスポート層・セッション層・プレゼンテーション層・アプリケーション層の7層です。', 1, 78, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4層', FALSE, 1),
    (gen_random_uuid(), q_id, '5層', FALSE, 2),
    (gen_random_uuid(), q_id, '7層', TRUE, 3),
    (gen_random_uuid(), q_id, '8層', FALSE, 4);

  -- ===== network - MEDIUM (6) =====

  -- Q79: DNS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'DNSの主な役割として正しいものはどれか。', 'DNS（Domain Name System）はドメイン名をIPアドレスに変換する名前解決の仕組みです。', 1, 79, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名をIPアドレスに変換する', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを暗号化して転送する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パケットの経路を制御する', FALSE, 3),
    (gen_random_uuid(), q_id, 'メールの送受信を管理する', FALSE, 4);

  -- Q80: サブネットマスク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'サブネットマスク255.255.255.0（/24）のネットワークで使用可能なホストアドレスの数はどれか。', '/24のサブネットでは8ビットがホスト部で、2^8-2=254のホストアドレスが使用可能です（ネットワークアドレスとブロードキャストアドレスを除く）。', 1, 80, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '256', FALSE, 1),
    (gen_random_uuid(), q_id, '255', FALSE, 2),
    (gen_random_uuid(), q_id, '254', TRUE, 3),
    (gen_random_uuid(), q_id, '252', FALSE, 4);

  -- Q81: TCP3ウェイハンドシェイク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'TCP3ウェイハンドシェイクの正しい順序はどれか。', 'TCP接続はクライアントがSYNを送り、サーバーがSYN+ACKを返し、クライアントがACKを送る3ステップで確立されます。', 1, 81, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ACK → SYN → SYN+ACK', FALSE, 1),
    (gen_random_uuid(), q_id, 'SYN → ACK → SYN+ACK', FALSE, 2),
    (gen_random_uuid(), q_id, 'SYN+ACK → SYN → ACK', FALSE, 3),
    (gen_random_uuid(), q_id, 'SYN → SYN+ACK → ACK', TRUE, 4);

  -- Q82: HTTPS/TLS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPSにおけるTLSの役割として正しいものはどれか。', 'TLSは通信の暗号化、サーバー認証、データの完全性保証を提供し、HTTP通信を安全にします。', 1, 82, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名をIPアドレスに変換する', FALSE, 1),
    (gen_random_uuid(), q_id, '通信の暗号化とサーバー認証を行う', TRUE, 2),
    (gen_random_uuid(), q_id, 'パケットのルーティングを最適化する', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTTPヘッダーを圧縮して転送速度を向上させる', FALSE, 4);

  -- Q83: ルーティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ルーティングテーブルの役割として正しいものはどれか。', 'ルーティングテーブルはパケットの宛先IPアドレスに基づいて、次にどのルーター（ネクストホップ）に転送すべきかを決定するための情報を保持します。', 1, 83, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DNSの名前解決結果をキャッシュする', FALSE, 1),
    (gen_random_uuid(), q_id, 'ファイアウォールのルールを管理する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パケットの宛先に基づき転送先を決定する情報を保持する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ネットワークの帯域幅を監視する', FALSE, 4);

  -- Q84: ARPプロトコル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ARP（Address Resolution Protocol）の役割として正しいものはどれか。', 'ARPはIPアドレスから対応するMACアドレスを解決するプロトコルで、同一ネットワーク内の通信に使われます。', 1, 84, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名からIPアドレスを解決する', FALSE, 1),
    (gen_random_uuid(), q_id, 'IPアドレスからMACアドレスを解決する', TRUE, 2),
    (gen_random_uuid(), q_id, 'MACアドレスからポート番号を解決する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ポート番号からプロセスIDを解決する', FALSE, 4);

  -- ===== network - HARD (6) =====

  -- Q85: ロードバランシング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'L7ロードバランサーがL4ロードバランサーと異なる点として正しいものはどれか。', 'L7ロードバランサーはアプリケーション層で動作し、HTTPヘッダーやURLパスなどの内容に基づいてルーティングできます。L4はトランスポート層でIPとポートに基づきます。', 1, 85, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IPアドレスとポート番号のみに基づいて振り分ける', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTPヘッダーやURLパスなどアプリケーション層の情報で振り分けられる', TRUE, 2),
    (gen_random_uuid(), q_id, 'MACアドレスに基づいて振り分ける', FALSE, 3),
    (gen_random_uuid(), q_id, 'L4より処理速度が常に速い', FALSE, 4);

  -- Q86: NAT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'NAT（Network Address Translation）の主な目的として正しいものはどれか。', 'NATはプライベートIPアドレスをグローバルIPアドレスに変換することで、限られたIPv4アドレスを共有し、内部ネットワークを外部から隠蔽します。', 1, 86, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの暗号化を行う', FALSE, 1),
    (gen_random_uuid(), q_id, 'ドメイン名を解決する', FALSE, 2),
    (gen_random_uuid(), q_id, 'プライベートIPをグローバルIPに変換しアドレスを共有する', TRUE, 3),
    (gen_random_uuid(), q_id, 'パケットの順序制御を行う', FALSE, 4);

  -- Q87: WebSocket
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'WebSocketの特徴として正しいものはどれか。', 'WebSocketはHTTPのアップグレード機構で接続を確立した後、全二重通信（双方向同時通信）を低オーバーヘッドで行えます。', 1, 87, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト・レスポンス型の半二重通信のみ行える', FALSE, 1),
    (gen_random_uuid(), q_id, 'UDPの上で動作する軽量プロトコルである', FALSE, 2),
    (gen_random_uuid(), q_id, '全二重通信が可能でサーバーからクライアントへもリアルタイムに送信できる', TRUE, 3),
    (gen_random_uuid(), q_id, '毎回のメッセージにHTTPヘッダーが付与される', FALSE, 4);

  -- Q88: CDN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'CDN（Content Delivery Network）の主な利点として正しいものはどれか。', 'CDNは世界各地に分散したエッジサーバーにコンテンツをキャッシュし、ユーザーに最も近いサーバーから配信することで遅延を低減します。', 1, 88, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データベースのクエリを最適化する', FALSE, 1),
    (gen_random_uuid(), q_id, 'サーバーサイドのコード実行を高速化する', FALSE, 2),
    (gen_random_uuid(), q_id, 'SSL証明書の発行を自動化する', FALSE, 3),
    (gen_random_uuid(), q_id, '地理的に分散したサーバーからコンテンツを配信し遅延を低減する', TRUE, 4);

  -- Q89: REST vs GraphQL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'GraphQLがRESTと比較して優れている点として正しいものはどれか。', 'GraphQLではクライアントが必要なデータのみを指定して取得でき、REST APIで起こりがちなオーバーフェッチ（不要データの取得）を防げます。', 1, 89, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャッシュが容易でパフォーマンスが常に良い', FALSE, 1),
    (gen_random_uuid(), q_id, 'クライアントが必要なデータのみを指定して取得できオーバーフェッチを防げる', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTPメソッドの使い分けが明確で直感的である', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー側の実装が常にシンプルになる', FALSE, 4);

  -- Q90: ファイアウォール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ステートフルインスペクション型ファイアウォールの特徴として正しいものはどれか。', 'ステートフルインスペクションは通信の状態（コネクションの確立状況など）を追跡し、その文脈に基づいてパケットの許可・拒否を判断します。', 1, 90, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パケットのヘッダー情報のみで判断する', FALSE, 1),
    (gen_random_uuid(), q_id, 'アプリケーション層のデータ内容を解析する', FALSE, 2),
    (gen_random_uuid(), q_id, '通信の状態を追跡しコネクションの文脈に基づいて判断する', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべてのパケットを暗号化して転送する', FALSE, 4);

END $$;
