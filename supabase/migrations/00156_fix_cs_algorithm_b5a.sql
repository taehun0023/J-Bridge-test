-- 00156_fix_cs_algorithm_b5a.sql
-- CS algorithm B5-a 길이편향 수정
-- CONFIRMED: 38건 / DISMISSED: 9건
-- 생성일: 2026-04-06
-- 검증일: 2026-04-06 (Validator による自然な日本語リライト)
-- 方針: UPDATE only. 正答テキスト不変. 誤答の長さを自然に調整して偏り解消.
--
-- DISMISSED 9건:
--   dc759bc0: trivial diff (2 chars)
--   bd610c38: correct is not longest/shortest (ratio 1.73, correct middle)
--   b49a95bf: correct is not longest/shortest (ratio 1.29, correct middle)
--   b7092e05: correct is not longest/shortest (ratio 1.36, correct middle)
--   546bda78: correct is not longest/shortest (ratio 2.08, correct middle)
--   19518630: correct is not longest/shortest (ratio 1.36, correct middle)
--   257ed618: correct is not longest/shortest (ratio 1.44, correct middle)
--   9e585d1f: correct is not longest/shortest (ratio 1.46, correct middle)
--   8dd383be: correct is not longest/shortest (ratio 1.36, correct middle)

BEGIN;

-- ============================================================
-- Q1: ユークリッドの互除法の用途として正しいものはどれか。
-- Correct: 2つの整数の最大公約数を求める (15)
-- Before: [7, 10, 11, 15*] ratio=2.14x
-- After:  [15, 15, 16, 15*] ratio=1.07x
-- ============================================================
-- 素数を列挙する (7) → 与えられた範囲の素数を列挙する (15)
UPDATE quiz_question_options SET option_text = '与えられた範囲の素数を列挙する' WHERE id = '0230b5a4-cb50-407f-9ce6-5a2cfdada6c0';
-- 整数を素因数分解する (10) → 与えられた整数を素因数に分解する (15)
UPDATE quiz_question_options SET option_text = '与えられた整数を素因数に分解する' WHERE id = '742fe012-a732-4b50-b07d-d193e6bffb08';
-- 最小公倍数を直接求める (11) → 2つの整数の最小公倍数を直接計算する (16)
UPDATE quiz_question_options SET option_text = '2つの整数の最小公倍数を直接計算する' WHERE id = 'b9cf1535-e25b-4b18-b0c2-4f771908b563';

-- ============================================================
-- Q2: 選択ソートの動作として正しいものはどれか。
-- Correct: 未整列部分から最小値を選び先頭と交換する (20)
-- Before: [15, 15, 18, 20*] ratio=1.33x
-- After:  [19, 19, 20, 20*] ratio=1.05x
-- ============================================================
-- 要素を適切な位置に挿入していく (15) → 各要素を適切な位置に順次挿入していく (19)
UPDATE quiz_question_options SET option_text = '各要素を適切な位置に順次挿入していく' WHERE id = 'd312863c-c5d6-4e71-8598-3dfac0422161';
-- ピボットを基準に分割を繰り返す (15) → ピボットを基準にしてデータの分割を繰り返す (19)
UPDATE quiz_question_options SET option_text = 'ピボットを基準にしてデータの分割を繰り返す' WHERE id = '2a5c4a9a-e2bc-4909-978b-36f59b182f27';

-- ============================================================
-- Q3: 安定ソートの説明として正しいものはどれか。
-- Correct: 同じ値の要素の相対順序がソート後も保持されるソート (25)
-- Before: [17, 20, 22, 25*] ratio=1.47x
-- After:  [23, 24, 24, 25*] ratio=1.09x
-- ============================================================
-- メモリ使用量がO(1)であるソート (17) → メモリ使用量が常にO(1)に収まるインプレースソート (23)
UPDATE quiz_question_options SET option_text = 'メモリ使用量が常にO(1)に収まるインプレースソート' WHERE id = 'e53dbd67-e373-4168-b286-e920fc92b0a0';
-- 常にO(n log n)で動作するソート (20) → 入力によらず常にO(n log n)で動作するソート (24)
UPDATE quiz_question_options SET option_text = '入力によらず常にO(n log n)で動作するソート' WHERE id = 'fb999bfe-5da9-4bf6-8797-72045856b5b7';
-- 入力データに関係なく常に同じ実行時間のソート (22) → 入力データの内容に関係なく常に同じ実行時間のソート (24)
UPDATE quiz_question_options SET option_text = '入力データの内容に関係なく常に同じ実行時間のソート' WHERE id = '4a363e69-1f8c-4a25-851f-6782ffe93b87';

-- ============================================================
-- Q4: マージソートの特徴として正しいものはどれか。(quiz a0000003)
-- Correct: 安定ソートであり最悪でもO(n log n)を保証する (27)
-- Before: [18, 19, 20, 27*] ratio=1.50x
-- After:  [24, 25, 26, 27*] ratio=1.13x
-- ============================================================
-- 不安定ソートだが平均計算量が最も速い (18) → 不安定ソートだが平均的な計算量では最も高速に動作する (24)
UPDATE quiz_question_options SET option_text = '不安定ソートだが平均的な計算量では最も高速に動作する' WHERE id = 'f13104c2-cae6-4b95-9aab-92250ec2fa80';
-- 最悪計算量がO(n²)になる場合がある (19) → 入力次第では最悪計算量がO(n²)になる場合がある (25)
UPDATE quiz_question_options SET option_text = '入力次第では最悪計算量がO(n²)になる場合がある' WHERE id = 'e200bfb3-9a88-4b40-b666-846fc39c362e';
-- 追加メモリ不要のインプレースソートである (20) → 追加のメモリ領域を必要としないインプレースソートである (26)
UPDATE quiz_question_options SET option_text = '追加のメモリ領域を必要としないインプレースソートである' WHERE id = '36818d89-ad1e-44b7-9ccb-c29f8635573a';

-- ============================================================
-- Q5: 動的計画法（DP）に関する説明として最も適切なものはどれか。
-- Correct: 最適部分構造と部分問題の重複を持つ問題に適用し、部分問題の解を記録して再利用する (40)
-- Before: [28, 34, 34, 40*] ratio=1.43x
-- After:  [36, 38, 38, 40*] ratio=1.11x
-- ============================================================
-- 常に貪欲法より最適な解が得られるが、計算量は指数的になる (28) → (36)
UPDATE quiz_question_options SET option_text = '貪欲法よりも常に最適な解を導くことができるが、計算量は指数関数的に増大する' WHERE id = '9a5e1ad4-1910-4afb-ab74-1ee5f78b85a3';
-- 部分問題の解を再利用せず、毎回再計算することで正確性を保つ手法である (34) → (38)
UPDATE quiz_question_options SET option_text = '部分問題の解を再利用せず、正確性を保つためにそのつど最初から再計算する手法である' WHERE id = 'c2c9d839-1242-4717-8727-8621277626b2';
-- 分割統治法と同じ原理であり、部分問題が重複しない場合にのみ適用できる (34) → (38)
UPDATE quiz_question_options SET option_text = '分割統治法と原理的に同一であり、部分問題に重複が存在しない場合にのみ適用できる' WHERE id = 'fb57b305-0fc5-4379-b045-c9195c1ef317';

-- ============================================================
-- Q6: クイックソートの計算量に関する説明として正しいものはどれか。
-- Correct: 平均はO(n log n)だが、最悪はO(n²)となり、ピボット選択が性能に影響する (42)
-- Before: [27, 33, 36, 42*] ratio=1.56x
-- After:  [37, 39, 40, 42*] ratio=1.14x
-- ============================================================
-- 平均はO(n²)だが、最悪はO(n log n)である (27) → (37)
UPDATE quiz_question_options SET option_text = '平均計算量はO(n²)だが、最悪ケースではO(n log n)に改善される' WHERE id = 'a1aec43c-3ca6-4d64-998b-dd2db8b84f42';
-- 平均・最悪ともにO(n²)であるが、実用上は定数が小さく高速である (33) → (39)
UPDATE quiz_question_options SET option_text = '平均・最悪ともにO(n²)であるが、実用上は定数係数が小さいため十分に高速である' WHERE id = '227b468f-117c-4d7c-972f-688d9a261fcb';
-- 平均・最悪ともにO(n log n)であり、ピボット選択の影響を受けない (36) → (40)
UPDATE quiz_question_options SET option_text = '平均・最悪ともにO(n log n)であり、ピボットの選び方による性能への影響は受けない' WHERE id = '41f8ecb6-3594-417a-8519-2f7dd34ac417';

-- ============================================================
-- Q7: ハッシュ法における衝突（コリジョン）に関する説明として最も適切なものはどれか。
-- Correct: 衝突の解決にはチェイン法とオープンアドレス法があり、それぞれ異なる方式で対処する (40)
-- Before: [23, 28, 38, 40*] ratio=1.74x
-- After:  [32, 37, 40, 40*] ratio=1.25x
-- ============================================================
-- 良いハッシュ関数を使えば衝突は絶対に発生しない (23) → (32)
UPDATE quiz_question_options SET option_text = '十分に優れたハッシュ関数を選べば、衝突は理論上まったく発生しない' WHERE id = 'f151d431-1476-4ac9-befc-d4f81c2beac2';
-- 衝突が発生した場合、ハッシュテーブルを破棄して再構築するのが唯一の方法である (38) → (40)
UPDATE quiz_question_options SET option_text = '衝突が発生した場合には、ハッシュテーブルを破棄して再構築するのが唯一の方法である' WHERE id = '56778da9-277e-478d-93ce-2e65ad175b8f';
-- 衝突はキーのデータ型が異なる場合にのみ発生する現象である (28) → (37)
UPDATE quiz_question_options SET option_text = '衝突はキーのデータ型が互いに異なる場合にのみ発生し、同一の型では起こらない' WHERE id = '136df278-8e81-4689-9908-15bc9df57bb3';

-- ============================================================
-- Q8: 動的計画法（DP）の基本的な考え方として正しいものはどれか。
-- Correct: 部分問題の解を記録し再利用して重複計算を避ける (23)
-- Before: [14, 16, 18, 23*] ratio=1.64x
-- After:  [20, 21, 22, 23*] ratio=1.15x
-- ============================================================
-- 常に局所最適な選択を繰り返す (14) → (20)
UPDATE quiz_question_options SET option_text = '各段階において常に局所最適な選択を繰り返す' WHERE id = 'dfd0b063-54f5-46e7-a93d-35d8e3a81c53';
-- 乱数を使って近似解を高速に求める (16) → (21)
UPDATE quiz_question_options SET option_text = '乱数を使って問題の近似解を高速に導き出す' WHERE id = '402cdcce-e33d-437a-95c5-67973b9c7cb9';
-- 問題をランダムに分割して並列処理する (18) → (22)
UPDATE quiz_question_options SET option_text = '問題をランダムに複数の部分に分割して並列処理する' WHERE id = '312b60ac-026f-471a-b5c6-a94d28bb9113';

-- ============================================================
-- Q9: クイックソートの最悪時間計算量がO(n²)になるのはどのような場合か。
-- Correct: ピボットが常に最小値または最大値に選ばれる場合 (23)
-- Before: [12, 15, 16, 23*] ratio=1.92x
-- After:  [20, 21, 22, 23*] ratio=1.15x
-- ============================================================
-- 配列の要素数が奇数の場合 (12) → (20)
UPDATE quiz_question_options SET option_text = '配列に格納された要素の総数が奇数である場合' WHERE id = 'c80c4545-6cb3-4fe8-8351-1818532e9762';
-- 配列の要素がすべて同じ値の場合 (15) → (21)
UPDATE quiz_question_options SET option_text = '配列の要素がすべて同一の値で構成されている場合' WHERE id = 'b399de5b-b367-4b5a-b74f-ffece349a1c8';
-- 配列にランダムな値が含まれる場合 (16) → (22)
UPDATE quiz_question_options SET option_text = '配列にランダムに分布した値が多数含まれている場合' WHERE id = '1b6f96d9-08e5-433c-b771-d40637904eed';

-- ============================================================
-- Q10: 線形探索（リニアサーチ）の説明として正しいものはどれか。
-- Correct: データを先頭から順に一つずつ調べる探索法 (20)
-- Before: [14, 15, 17, 20*] ratio=1.43x
-- After:  [18, 19, 19, 20*] ratio=1.11x
-- ============================================================
-- ハッシュ値を使って探す探索法 (14) → (18)
UPDATE quiz_question_options SET option_text = 'ハッシュ値を計算して目的データを探す探索法' WHERE id = 'f19e1944-9fb6-411b-8c8d-c3c8bc0adac9';
-- データを半分に分けて探す探索法 (15) → (19)
UPDATE quiz_question_options SET option_text = 'データを半分に繰り返し分けて目的値を探す探索法' WHERE id = '1ba2d37d-f4e6-4620-98c8-4c14de53541b';
-- ランダムにデータを選んで探す探索法 (17) → (19)
UPDATE quiz_question_options SET option_text = 'ランダムにデータを選んで目的値を探す探索法' WHERE id = '8fd3b2a2-5f68-4670-87c8-fcbeea74a5a8';

-- ============================================================
-- Q11: バブルソートの説明として正しいものはどれか。
-- Correct: 隣り合う要素を比較・交換して並べ替える手法 (21)
-- Before: [14, 14, 18, 21*] ratio=1.50x
-- After:  [19, 19, 20, 21*] ratio=1.11x
-- ============================================================
-- データを分割して統合する手法 (14) → (19)
UPDATE quiz_question_options SET option_text = 'データを複数に分割してから統合する手法' WHERE id = '1114032f-7902-4beb-aa05-f34a56e9629f';
-- ランダムに並べ替えを行う手法 (14) → (19)
UPDATE quiz_question_options SET option_text = 'ランダムな順序でデータの並べ替えを行う手法' WHERE id = '8f2278af-8066-4648-bc08-a271a59947d5';
-- 最小値を見つけて先頭に移動させる手法 (18) → (20)
UPDATE quiz_question_options SET option_text = '最小値を見つけて先頭の位置に移動させる手法' WHERE id = '90b826f0-2602-460a-bc1c-7f46f4445c0d';

-- ============================================================
-- Q12: 挿入ソートの説明として正しいものはどれか。
-- Correct: 整列済み部分の適切な位置に要素を挿入する手法 (22)
-- Before: [14, 17, 19, 22*] ratio=1.57x
-- After:  [20, 21, 21, 22*] ratio=1.10x
-- ============================================================
-- 最大値を末尾に移動させる手法 (14) → (20)
UPDATE quiz_question_options SET option_text = '配列の中から最大値を見つけて末尾に移動させる手法' WHERE id = 'f37883f1-8ecc-495e-83fd-2d05b288e1c7';
-- データを半分に分割して結合する手法 (17) → (21)
UPDATE quiz_question_options SET option_text = 'データを半分に分割して再帰的に結合していく手法' WHERE id = 'b34e7b3c-70a3-42fd-a833-1a2c441c97d8';
-- 先頭から順にすべての要素を比較する手法 (19) → (21)
UPDATE quiz_question_options SET option_text = '先頭から順にすべての隣接要素を比較していく手法' WHERE id = '5043a0cd-7def-4fc4-8d33-025c421bb9a6';

-- ============================================================
-- Q13: ソートアルゴリズムの目的として正しいものはどれか。
-- Correct: データを一定の規則に従って並べ替える (18)
-- Before: [8, 8, 9, 18*] ratio=2.25x
-- After:  [16, 16, 16, 18*] ratio=1.13x
-- ============================================================
-- データを検索する (8) → (16)
UPDATE quiz_question_options SET option_text = 'データの中から特定の値を検索する' WHERE id = '50509c78-7366-4a37-b746-16cc9581c401';
-- データを圧縮する (8) → (16)
UPDATE quiz_question_options SET option_text = 'データの容量を小さく圧縮して保存する' WHERE id = '858c1c6c-69aa-4497-a1e7-1743b756c9d4';
-- データを暗号化する (9) → (16)
UPDATE quiz_question_options SET option_text = 'データを安全に暗号化して保護する' WHERE id = 'e8d02867-30fb-4a71-a562-65f1cce12fcc';

-- ============================================================
-- Q14: ヒープソートの平均時間計算量と、その特徴として正しいものはどれか。
-- Correct: 平均計算量はO(n log n)であり、安定ソートではない (29)
-- Before: [23, 28, 29*, 29] ratio=1.26x
-- After:  [27, 28, 29*, 29] ratio=1.07x
-- ============================================================
-- 平均計算量はO(n²)であり、安定ソートである (23) → (27)
UPDATE quiz_question_options SET option_text = '平均計算量はO(n²)であり、安定ソートに分類される' WHERE id = '788014bf-e170-4fdf-8370-7f70cec73c77';

-- ============================================================
-- Q15: 基数ソート（Radix Sort）の特徴として最も適切なものはどれか。
-- Correct: 非比較ソートであり、桁数dと基数kに対してO(d(n+k))の計算量を持つ (37)
-- Before: [22, 24, 32, 37*] ratio=1.68x
-- After:  [32, 34, 35, 37*] ratio=1.09x
-- ============================================================
-- 不安定ソートであり、追加メモリを必要としない (22) → (32)
UPDATE quiz_question_options SET option_text = '不安定なソートであり、追加のメモリ領域を一切必要としない' WHERE id = 'ebcdf699-1c1c-46f7-8e2a-de1f1321b657';
-- 任意のデータ型に適用でき、常にO(n)で動作する (24) → (34)
UPDATE quiz_question_options SET option_text = '任意のデータ型に対して汎用的に適用でき、入力によらず常にO(n)で動作する' WHERE id = '2cff2512-4c5c-486f-8f97-52b848b97041';
-- 比較ベースのソートであり、最悪計算量はO(n log n)である (32) → (35)
UPDATE quiz_question_options SET option_text = '比較ベースのソートであり、最悪計算量はO(n log n)が上界となる' WHERE id = '7af9bcbc-7f28-47b7-a4f4-111e491a0607';

-- ============================================================
-- Q16: マージソートに関する説明として正しいものはどれか。(quiz a0000003, hard)
-- Correct: 安定ソートであり、最悪計算量はO(n log n)だが、O(n)の追加メモリが必要である (44)
-- Before: [23, 29, 35, 44*] ratio=1.91x
-- After:  [36, 44, 46, 44*] ratio=1.28x
-- ============================================================
-- 安定ソートであり、最悪計算量はO(n²)である (23) → (39)
UPDATE quiz_question_options SET option_text = '安定ソートであり、入力パターンによっては最悪計算量がO(n²)に悪化する' WHERE id = '1929f73d-e2e8-417b-bd24-6fb8f910aaf2';
-- 不安定ソートであり、最悪計算量はO(n log n)である (29) → (41)
UPDATE quiz_question_options SET option_text = '不安定なソートであるが、最悪の場合でもO(n log n)の計算量で確実に処理が完了する' WHERE id = '7c0944ba-8e88-40df-a41c-d8bed73af8f9';
-- 不安定ソートであるが、追加メモリを必要としないインプレースソートである (35) → (43)
UPDATE quiz_question_options SET option_text = '不安定なソートであるが、追加のメモリ領域を必要としないインプレース方式で動作するソートである' WHERE id = 'b2017dfd-bfaf-474e-b0f0-f503bd43b24a';

-- ============================================================
-- Q17: BFSとDFSの比較として正しいものはどれか。
-- Correct: BFSは重みなしグラフの最短経路に適し、DFSはトポロジカルソートに適している (39)
-- Before: [20, 25, 33, 39*] ratio=1.95x
-- After:  [36, 36, 40, 39*] ratio=1.11x
-- ============================================================
-- DFSは常にBFSよりメモリ使用量が多い (20) → (35)
UPDATE quiz_question_options SET option_text = 'DFSは探索するグラフの構造に関係なく、常にBFSよりメモリ使用量が多い' WHERE id = '3cfc0ea1-ff48-4dc8-b7d7-3fb8aa073872';
-- BFSはスタックを使用し、DFSはキューを使用する (25) → (37)
UPDATE quiz_question_options SET option_text = 'BFSの実装ではスタックをデータ構造として使い、DFSではキューを使って探索する' WHERE id = 'b75a9107-0a5f-4371-9d50-4421c431c3ef';
-- BFSもDFSも重み付きグラフの最短経路を正しく求めることができる (33) → (37)
UPDATE quiz_question_options SET option_text = 'BFSもDFSも重み付きグラフにおける最短経路を正しく求めることができる' WHERE id = 'c29464f6-a6d1-4229-9b82-d06ad4d4ab74';

-- ============================================================
-- Q18: トポロジカルソートに関する説明として正しいものはどれか。
-- Correct: DAGの頂点を依存関係に矛盾しない順序に並べ、タスク依存解決等に用いられる (37)
-- Before: [27, 30, 33, 37*] ratio=1.37x
-- After:  [33, 34, 35, 37*] ratio=1.12x
-- ============================================================
-- 無向グラフの頂点を次数の昇順に並べるアルゴリズムである (27) → (33)
UPDATE quiz_question_options SET option_text = '無向グラフにおいて各頂点を次数の昇順に並べ替えるアルゴリズムである' WHERE id = '27d33c8d-91b5-4c22-9cbd-88e1378217e9';
-- 任意の有向グラフに適用でき、閉路がある場合でも正しく動作する (30) → (34)
UPDATE quiz_question_options SET option_text = '任意の有向グラフに対して適用することができ、閉路がある場合でも正しく動作する' WHERE id = 'effbec5e-53cb-4a8a-a6c7-2ca2d8f6aecf';
-- 重み付きグラフの最短経路を求めるために使用されるアルゴリズムである (33) → (35)
UPDATE quiz_question_options SET option_text = '重み付きグラフにおける始点から各頂点への最短経路を求めるアルゴリズムである' WHERE id = '495cca30-2b6a-44b1-872d-cb4bf6ec44ae';

-- ============================================================
-- Q19: 償却解析（Amortized Analysis）の基本概念として正しいものはどれか。
-- Correct: 一連の操作全体のコストを操作回数で割り、1回あたりの平均的コストを評価する手法である (42)
-- Before: [25, 31, 31, 42*] ratio=1.68x
-- After:  [37, 37, 39, 42*] ratio=1.14x
-- ============================================================
-- 確率的な分析手法であり、期待値を計算するものである (25) → (37)
UPDATE quiz_question_options SET option_text = '確率分布に基づいた分析手法であり、各操作の期待値を個別に計算するものである' WHERE id = 'd2a5dc9e-4e9a-454f-b953-aeabf4a887bb';
-- 各操作の最悪計算量を合計し、全体の最悪ケースを求める手法である (31) → (37)
UPDATE quiz_question_options SET option_text = '各操作の個別の最悪計算量をすべて合計し、全体の最悪ケースを導く手法である' WHERE id = 'cc785c0b-c055-4feb-be1b-ceacb5969248';
-- 最良ケースのみを考慮し、アルゴリズムの下限を評価する手法である (31) → (39)
UPDATE quiz_question_options SET option_text = '入力の最良ケースのみを考慮することで、アルゴリズムの計算量の下限を評価する手法である' WHERE id = '836e8f40-0ec9-4ac1-b5fa-190d8091e3d5';

-- ============================================================
-- Q20: 再帰（リカーション）の説明として正しいものはどれか。
-- Correct: 関数が自分自身を呼び出すこと (14)
-- Before: [11, 14, 14, 14*] ratio=1.27x
-- After:  [14, 14, 14, 14*] ratio=1.00x
-- ============================================================
-- 条件分岐を繰り返すこと (11) → (14)
UPDATE quiz_question_options SET option_text = '条件分岐の処理を繰り返すこと' WHERE id = '0d9eb33c-9b18-4f8d-bc18-5aa5ea5d0e68';

-- ============================================================
-- Q21: 幅優先探索（BFS）の説明として正しいものはどれか。
-- Correct: 始点から近い順にすべてのノードを探索する手法 (22)
-- Before: [13, 15, 16, 22*] ratio=1.69x
-- After:  [19, 20, 20, 22*] ratio=1.16x
-- ============================================================
-- コスト最小の経路を選ぶ手法 (13) → (19)
UPDATE quiz_question_options SET option_text = 'コスト最小となる経路を優先的に選ぶ手法' WHERE id = '1552d8bb-1863-4eef-90e6-9c04516f94d1';
-- 一つの枝を最後まで探索する手法 (15) → (20)
UPDATE quiz_question_options SET option_text = '一つの枝を最後の深さまで探索していく手法' WHERE id = '8a539ff6-57d2-4dad-b570-62ebb5529efc';
-- ヒューリスティック関数を使う手法 (16) → (20)
UPDATE quiz_question_options SET option_text = 'ヒューリスティック関数を用いてノードを選ぶ手法' WHERE id = 'e4c2fd6c-31fb-4b27-a0b2-b3f21d77538f';

-- ============================================================
-- Q22: O記法（ビッグオー記法）が表すものとして最も適切なのはどれか。
-- Correct: アルゴリズムの最悪時における計算量の増加オーダー (24)
-- Before: [10, 17, 18, 24*] ratio=2.40x
-- After:  [21, 22, 22, 24*] ratio=1.14x
-- ============================================================
-- メモリ使用量の最小値 (10) → (21)
UPDATE quiz_question_options SET option_text = 'プログラム実行時のメモリ使用量の最小値' WHERE id = '968fd1e1-297e-437a-b190-5f0aa4bbd714';
-- プログラムの実行にかかる正確な秒数 (17) → (22)
UPDATE quiz_question_options SET option_text = 'プログラムの実行にかかる正確な秒数の計測値' WHERE id = '9b173a3d-2af0-4c01-b250-50241f91b13f';
-- CPUのクロック周波数に対する性能比 (18) → (22)
UPDATE quiz_question_options SET option_text = 'CPUのクロック周波数に対するプログラムの性能比' WHERE id = '45cad74c-b89a-4801-a449-347824882be5';

-- ============================================================
-- Q23: 安定ソートの説明として正しいものはどれか。(quiz 40473700)
-- Correct: 同じ値の要素の元の順序がソート後も保たれる (21)
-- Before: [11, 13, 17, 21*] ratio=1.91x
-- After:  [19, 19, 19, 21*] ratio=1.11x
-- ============================================================
-- 追加メモリを使用しない (11) → (19)
UPDATE quiz_question_options SET option_text = '追加メモリを一切使用しないソート方式' WHERE id = 'f6d6f967-24f1-4ef5-995f-9463dba6e8db';
-- 最悪計算量がO(n)である (13) → (19)
UPDATE quiz_question_options SET option_text = '最悪の場合でも計算量がO(n)であるソート' WHERE id = '3ba56fcb-b5be-4e35-8a9c-c635e742053d';
-- 常にO(n log n)で動作する (17) → (19)
UPDATE quiz_question_options SET option_text = '入力に関係なく常にO(n log n)で動作する' WHERE id = '26e81cb9-0388-4dd1-9929-3d431654cdec';

-- ============================================================
-- Q24: マージソートの特徴として正しいものはどれか。(quiz 40473700)
-- Correct: 安定ソートであり最悪計算量がO(n log n)である (27)
-- Before: [14, 18, 21, 27*] ratio=1.93x
-- After:  [24, 24, 25, 27*] ratio=1.13x
-- ============================================================
-- 最悪計算量がO(n²)である (14) → (24)
UPDATE quiz_question_options SET option_text = '入力パターンによっては最悪計算量がO(n²)になる' WHERE id = '84919e92-0c16-4c89-9c38-a66d92522709';
-- データがソート済みのとき最も遅くなる (18) → (24)
UPDATE quiz_question_options SET option_text = 'すでにソート済みのデータに対して処理が最も遅くなる' WHERE id = '168a3b1e-b148-4b9e-b87c-f424ffcb3b54';
-- インプレースソートで追加メモリが不要である (21) → (25)
UPDATE quiz_question_options SET option_text = 'インプレースソートであるため追加メモリは一切不要である' WHERE id = '053d0360-2529-4271-978b-4ec8f1c59410';

-- ============================================================
-- Q25: 貪欲法（グリーディ法）の説明として正しいものはどれか。
-- Correct: 各ステップで局所的に最適な選択を行う手法 (20)
-- Before: [14, 16, 17, 20*] ratio=1.43x
-- After:  [18, 19, 19, 20*] ratio=1.11x
-- ============================================================
-- ランダムな選択を繰り返す手法 (14) → (18)
UPDATE quiz_question_options SET option_text = 'ランダムな選択を毎回繰り返していく手法' WHERE id = '920f56e9-8190-484b-8900-ca2ac650fa5f';
-- 問題を再帰的に小さく分割する手法 (16) → (19)
UPDATE quiz_question_options SET option_text = '問題を再帰的に小さな部分に分割していく手法' WHERE id = '0a879f6d-e52b-4542-bf55-244f74371fd8';
-- すべての可能性を網羅的に調べる手法 (17) → (19)
UPDATE quiz_question_options SET option_text = 'すべての可能性を網羅的に調べて判断する手法' WHERE id = 'f78ad679-12c2-4200-842c-61e6fed5e0e9';

-- ============================================================
-- Q26: 擬似コードの目的として最も適切なものはどれか。
-- Correct: プログラミング言語に依存せずアルゴリズムを記述する (25)
-- Before: [14, 15, 15, 25*] ratio=1.79x
-- After:  [22, 22, 23, 25*] ratio=1.14x
-- ============================================================
-- プログラムを自動的に生成する (14) → (22)
UPDATE quiz_question_options SET option_text = 'プログラムのソースコードを自動的に生成する' WHERE id = '536a4e14-b22c-4bc1-97b4-5b299e381466';
-- ソースコードのエラーを検出する (15) → (22)
UPDATE quiz_question_options SET option_text = 'ソースコードに含まれるエラーを自動検出する' WHERE id = '1885eadf-4587-4f2b-807d-e4496edf22fb';
-- プログラムの実行速度を測定する (15) → (23)
UPDATE quiz_question_options SET option_text = 'プログラムの実行速度をベンチマークで正確に測定する' WHERE id = '576cf2b7-5236-4c7a-a57d-bfbdeea2360e';

-- ============================================================
-- Q27: 選択ソートの説明として正しいものはどれか。(quiz b50edf75)
-- Correct: 未整列部分から最小値を選び先頭に配置する手法 (22)
-- Before: [17, 17, 18, 22*] ratio=1.29x
-- After:  [20, 20, 20, 22*] ratio=1.10x
-- ============================================================
-- 隣り合う要素を比較して交換する手法 (17) → (20)
UPDATE quiz_question_options SET option_text = '隣り合う要素を一つずつ比較して交換していく手法' WHERE id = '81b09410-e039-4574-a925-316b4709896e';
-- 挿入位置を探して要素を挿入する手法 (17) → (20)
UPDATE quiz_question_options SET option_text = '適切な挿入位置を探して要素を挿入する手法' WHERE id = '3ff4aece-3261-49d1-a95a-136bc7069a0f';
-- データを再帰的に分割して整列する手法 (18) → (20)
UPDATE quiz_question_options SET option_text = 'データを再帰的に分割して整列していく手法' WHERE id = 'f76ff99e-2448-4014-a2d4-d37abe023af9';

-- ============================================================
-- Q28: 探索アルゴリズムの目的として最も適切なものはどれか。
-- Correct: データの集まりから目的のデータを見つける (20)
-- Before: [9, 12, 12, 20*] ratio=2.22x
-- After:  [18, 18, 18, 20*] ratio=1.11x
-- ============================================================
-- データを暗号化する (9) → (18)
UPDATE quiz_question_options SET option_text = 'データを暗号化して安全に保護する' WHERE id = '6833edb8-2eec-4a7e-96d0-e39e00a86cb1';
-- データを効率よく保存する (12) → (18)
UPDATE quiz_question_options SET option_text = 'データを効率よく整理して保存・管理する手法' WHERE id = 'a654eb16-f9fa-4b1e-9158-42194af1e0fd';
-- データの整合性を検証する (12) → (18)
UPDATE quiz_question_options SET option_text = 'データの整合性を検証して一貫性を保つ' WHERE id = '102fc5e9-3290-4b2e-886b-0520f281a87b';

-- ============================================================
-- Q29: 分割統治法の説明として正しいものはどれか。
-- Correct: 問題を小さく分割し、解を統合する手法 (18)
-- Before: [12, 12, 14, 18*] ratio=1.50x
-- After:  [16, 16, 16, 18*] ratio=1.13x
-- ============================================================
-- 問題を並列に処理する手法 (12) → (16)
UPDATE quiz_question_options SET option_text = '問題をすべて並列に処理していく手法' WHERE id = '1513f26c-0ea0-42aa-85af-d7bfcf349f95';
-- データを順次処理する手法 (12) → (16)
UPDATE quiz_question_options SET option_text = 'データを先頭から順次処理していく手法' WHERE id = '71f06aa7-85cb-4040-93d4-6829968762e2';
-- ランダムに問題を分割する手法 (14) → (16)
UPDATE quiz_question_options SET option_text = 'ランダムに問題を分割して処理する手法' WHERE id = '5c43eb08-0815-4920-bb5f-939b946cf09d';

-- ============================================================
-- Q30: 繰り返し処理の例として最も適切なものはどれか。
-- Correct: 配列の全要素に対して同じ計算を行う (17)
-- Before: [10, 11, 14, 17*] ratio=1.70x
-- After:  [15, 15, 16, 17*] ratio=1.13x
-- ============================================================
-- プログラムを終了する (10) → (15)
UPDATE quiz_question_options SET option_text = '処理が完了したプログラムを終了する' WHERE id = '02819cad-cdda-4410-820b-cb574ec818d2';
-- 処理を一度だけ実行する (11) → (15)
UPDATE quiz_question_options SET option_text = '指定された処理を一度だけ実行する' WHERE id = '3f8ff94c-8dcc-4c54-816a-6b97cc9732bc';
-- 条件に応じて異なる処理を行う (14) → (16)
UPDATE quiz_question_options SET option_text = '与えられた条件に応じて異なる処理を行う' WHERE id = '4a62a826-0a95-4d27-a1e5-254f4a85d967';

-- ============================================================
-- Q31: 変数の説明として最も適切なものはどれか。
-- Correct: データを一時的に記憶する名前付きの領域 (19)
-- Before: [9, 12, 13, 19*] ratio=2.11x
-- After:  [17, 17, 17, 19*] ratio=1.12x
-- ============================================================
-- 固定された値のこと (9) → (17)
UPDATE quiz_question_options SET option_text = 'プログラムで使う固定された値のこと' WHERE id = '9fe4918c-7186-4f46-9ac1-fd7de9d81b57';
-- ファイルの保存場所のこと (12) → (17)
UPDATE quiz_question_options SET option_text = 'ディスク上にあるファイルの保存場所のこと' WHERE id = '28eb697f-ce02-40ee-9637-7a03ee554885';
-- プログラムの実行命令のこと (13) → (17)
UPDATE quiz_question_options SET option_text = 'プログラムに記述する実行命令のこと' WHERE id = 'd1ff441c-0bb7-4d27-ad97-937ce2ca5dd1';

-- ============================================================
-- Q32: 動的計画法（DP）の説明として正しいものはどれか。(quiz 40473700)
-- Correct: 部分問題の結果を保存して再利用する手法 (19)
-- Before: [13, 16, 17, 19*] ratio=1.46x
-- After:  [17, 18, 19, 19*] ratio=1.12x
-- ============================================================
-- 全ての組み合わせを試す手法 (13) → (17)
UPDATE quiz_question_options SET option_text = '全ての組み合わせを一つずつ試していく手法' WHERE id = '9066ef84-2efa-4a5b-aa54-c40b82bd6b2b';
-- 問題をランダムに分割して解く手法 (16) → (18)
UPDATE quiz_question_options SET option_text = '問題をランダムに分割してそれぞれ解く手法' WHERE id = '9ad538a3-d22f-49bb-92a3-b7cc99204b69';

-- ============================================================
-- Q33: トレースの説明として正しいものはどれか。
-- Correct: プログラムを1ステップずつ追跡して動作を確認する手法 (26)
-- Before: [12, 15, 17, 26*] ratio=2.17x
-- After:  [22, 23, 24, 26*] ratio=1.18x
-- ============================================================
-- プログラムを圧縮する手法 (12) → (22)
UPDATE quiz_question_options SET option_text = 'プログラムのデータサイズを圧縮して最適化する手法' WHERE id = 'b646eec2-73c9-4ae6-b483-3c4cd7d5080e';
-- プログラムを自動テストする手法 (15) → (23)
UPDATE quiz_question_options SET option_text = 'プログラムの各機能を自動的にテストして検証する手法' WHERE id = 'dd89a757-4976-4f9e-abb2-13aba9f1e142';
-- プログラムの実行時間を計測する手法 (17) → (24)
UPDATE quiz_question_options SET option_text = 'プログラムの実行時間を正確に計測して性能を評価する手法' WHERE id = 'f6f19815-5cc6-4726-8b85-1b73cd47034e';

-- ============================================================
-- Q34: ダイクストラ法の目的として正しいものはどれか。
-- Correct: 重み付きグラフの最短経路を求める (16)
-- Before: [11, 12, 13, 16*] ratio=1.45x
-- After:  [15, 15, 15, 16*] ratio=1.07x
-- ============================================================
-- グラフの全域木を求める (11) → (15)
UPDATE quiz_question_options SET option_text = 'グラフの全域木を効率的に求める' WHERE id = '1e2b5fa1-0f26-4f17-a68a-f05211cd1500';
-- グラフの連結成分を求める (12) → (15)
UPDATE quiz_question_options SET option_text = 'グラフの連結成分を探索して求める' WHERE id = '058523a5-8e89-44fb-ab4d-58994fc040b0';
-- グラフの最大フローを求める (13) → (15)
UPDATE quiz_question_options SET option_text = 'グラフの最大フローの値を求める' WHERE id = 'd7c1b72b-aa24-456b-b442-949e14bb3100';

-- ============================================================
-- Q35: 2分探索木において、左部分木と右部分木の関係として正しいものはどれか。
-- Correct: 左部分木の値は親より小さく、右部分木の値は親より大きい (27)
-- Before: [17, 19, 27, 27*] ratio=1.59x
-- After:  [23, 25, 27, 27*] ratio=1.17x
-- ============================================================
-- 左右の部分木の値に順序の制約はない (17) → (23)
UPDATE quiz_question_options SET option_text = '左右の部分木に格納される値に対して順序の制約はない' WHERE id = '3ae87b80-558a-4b0e-8e1a-1a09771b6989';
-- 左右の部分木は常に同じ数のノードを持つ (19) → (25)
UPDATE quiz_question_options SET option_text = '左右の部分木は常に同じ数のノードを持つように構成される' WHERE id = '08b0a42b-4144-4306-9be5-c910c7f42ba2';

-- ============================================================
-- Q36: 赤黒木の特徴として正しいものはどれか。
-- Correct: ノードに色を付けて平衡を保つ2分探索木 (19)
-- Before: [13, 14, 18, 19*] ratio=1.46x
-- After:  [17, 18, 18, 19*] ratio=1.12x
-- ============================================================
-- 3つ以上の子を持てる多分木 (13) → (17)
UPDATE quiz_question_options SET option_text = '各ノードが3つ以上の子を持てる多分木' WHERE id = '218c98ba-1481-44e0-b020-1180b7241af8';
-- ソート済みデータ専用の木構造 (14) → (18)
UPDATE quiz_question_options SET option_text = 'ソート済みデータを格納するための専用の木構造' WHERE id = '1ee290ae-b999-4704-8ce7-1f831af67586';

-- ============================================================
-- Q37: AVL木の特徴として正しいものはどれか。
-- Correct: 左右部分木の高さの差が常に1以下の平衡木 (20)
-- Before: [15, 15, 16, 20*] ratio=1.33x
-- After:  [18, 18, 18, 20*] ratio=1.11x
-- ============================================================
-- 各ノードが最大3つの子を持つ木 (15) → (18)
UPDATE quiz_question_options SET option_text = '各ノードが最大3つの子を持つことができる木' WHERE id = 'ef665f11-ee32-4f06-8944-90608d80675f';
-- データがランダムに配置される木 (15) → (18)
UPDATE quiz_question_options SET option_text = 'データがランダムな順序で配置されていく木' WHERE id = 'd9bf187f-5ef3-41ec-9e69-9896a829c19f';
-- すべてのリーフが同じ深さにある木 (16) → (18)
UPDATE quiz_question_options SET option_text = 'すべてのリーフが必ず同じ深さにある木' WHERE id = 'b316a094-b666-4581-a1ee-d3612449b94f';

-- ============================================================
-- Q38: バックトラッキングの説明として正しいものはどれか。
-- Correct: 行き詰まったら直前に戻り別の候補を試す手法 (21)
-- Before: [16, 18, 19, 21*] ratio=1.31x
-- After:  [19, 20, 21, 21*] ratio=1.11x
-- ============================================================
-- 解の候補をランダムに選択する手法 (16) → (19)
UPDATE quiz_question_options SET option_text = '解の候補をランダムに選択して評価していく手法' WHERE id = 'e84581aa-1814-406a-8c2e-c9628966e8f5';
-- 最初に見つかった解を最適解とする手法 (18) → (20)
UPDATE quiz_question_options SET option_text = '最初に見つかった解をそのまま最適解とみなす手法' WHERE id = '843ea210-dd52-4c50-9810-d86d4667abc5';

COMMIT;
