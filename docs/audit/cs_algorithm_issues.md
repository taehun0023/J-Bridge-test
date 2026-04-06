# CS algorithm カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 74
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 0건    | 0.0% |
| Medium  | 47건    | 63.5% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 47 / 74 (63.5%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000003... | 17 | 15 | 88.2% | 0 | 0.0% | **FAIL** |
| b50edf75... | 15 | 11 | 73.3% | 0 | 0.0% | **FAIL** |
| 40473700... | 10 | 9 | 90.0% | 0 | 0.0% | **FAIL** |
| 3ba24aae... | 4 | 3 | 75.0% | 0 | 0.0% | **FAIL** |
| 64f2db3f... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 5개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

_없음_

## Medium 우선순위 이슈

### Q-70bc61cb-71ef-4d18-99da-ee528a5ecbec
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ユークリッドの互除法の用途として正しいものはどれか。"
- options:
  1. [정답] "2つの整数の最大公約数を求める" (15자)
  2. "素数を列挙する" (7자)
  3. "最小公倍数を直接求める" (11자)
  4. "整数を素因数分解する" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.14x (max=15, min=7)
  - **B5-a** (Medium): correct is longest (15 vs others 7,11,10)
---
### Q-bd610c38-4a1d-4d9d-af4f-db05051433ed
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "二分探索を適用するための前提条件として正しいものはどれか。"
- options:
  1. [정답] "データがソート済みであること" (14자)
  2. "データが連結リストに格納されていること" (19자)
  3. "データの要素数が2の累乗であること" (17자)
  4. "データに重複がないこと" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.73x (max=19, min=11)
---
### Q-efb0f7ac-b2a2-4dc2-9ae3-1ee4229f4a0a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "選択ソートの動作として正しいものはどれか。"
- options:
  1. "隣接する要素を比較して交換を繰り返す" (18자)
  2. [정답] "未整列部分から最小値を選び先頭と交換する" (20자)
  3. "要素を適切な位置に挿入していく" (15자)
  4. "ピボットを基準に分割を繰り返す" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=20, min=15)
  - **B5-a** (Medium): correct is longest (20 vs others 18,15,15)
---
### Q-8104c9e1-91dc-4049-b18a-15a4c099c553
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "安定ソートの説明として正しいものはどれか。"
- options:
  1. "常にO(n log n)で動作するソート" (20자)
  2. "メモリ使用量がO(1)であるソート" (17자)
  3. [정답] "同じ値の要素の相対順序がソート後も保持されるソート" (25자)
  4. "入力データに関係なく常に同じ実行時間のソート" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=25, min=17)
  - **B5-a** (Medium): correct is longest (25 vs others 20,17,22)
---
### Q-e74bdf6f-92d1-4d4a-93cf-247f1cfdb680
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "マージソートの特徴として正しいものはどれか。"
- options:
  1. "追加メモリ不要のインプレースソートである" (20자)
  2. "最悪計算量がO(n²)になる場合がある" (19자)
  3. [정답] "安定ソートであり最悪でもO(n log n)を保証する" (27자)
  4. "不安定ソートだが平均計算量が最も速い" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=27, min=18)
  - **B5-a** (Medium): correct is longest (27 vs others 20,19,18)
---
### Q-b49a95bf-e21d-45ca-937d-60425bb0fafb
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "グリーディ法（貪欲法）の説明として正しいものはどれか。"
- options:
  1. "すべての組み合わせを試して最適解を求める" (20자)
  2. "問題を小さな部分問題に分割して結果を統合する" (22자)
  3. "過去の計算結果を記録して再利用する" (17자)
  4. [정답] "各段階で局所的に最適な選択を繰り返す" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=22, min=17)
---
### Q-8b137cb8-07d9-470b-a364-6ecb00da8e92
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "動的計画法（DP）に関する説明として最も適切なものはどれか。"
- options:
  1. "常に貪欲法より最適な解が得られるが、計算量は指数的になる" (28자)
  2. "部分問題の解を再利用せず、毎回再計算することで正確性を保つ手法である" (34자)
  3. [정답] "最適部分構造と部分問題の重複を持つ問題に適用し、部分問題の解を記録して再利用する" (40자)
  4. "分割統治法と同じ原理であり、部分問題が重複しない場合にのみ適用できる" (34자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=40, min=28)
  - **B5-a** (Medium): correct is longest (40 vs others 28,34,34)
---
### Q-53cb6bec-379b-4356-af18-8553763d5622
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クイックソートの計算量に関する説明として正しいものはどれか。"
- options:
  1. "平均・最悪ともにO(n log n)であり、ピボット選択の影響を受けない" (36자)
  2. [정답] "平均はO(n log n)だが、最悪はO(n²)となり、ピボット選択が性能に影響する" (42자)
  3. "平均はO(n²)だが、最悪はO(n log n)である" (27자)
  4. "平均・最悪ともにO(n²)であるが、実用上は定数が小さく高速である" (33자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.56x (max=42, min=27)
  - **B5-a** (Medium): correct is longest (42 vs others 36,27,33)
---
### Q-503b2a5e-4d2d-4dc1-b7cc-f50821ee8e7e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュ法における衝突（コリジョン）に関する説明として最も適切なものはどれか。"
- options:
  1. "良いハッシュ関数を使えば衝突は絶対に発生しない" (23자)
  2. "衝突が発生した場合、ハッシュテーブルを破棄して再構築するのが唯一の方法である" (38자)
  3. [정답] "衝突の解決にはチェイン法とオープンアドレス法があり、それぞれ異なる方式で対処する" (40자)
  4. "衝突はキーのデータ型が異なる場合にのみ発生する現象である" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.74x (max=40, min=23)
  - **B5-a** (Medium): correct is longest (40 vs others 23,38,28)
---
### Q-8470ee09-24d0-4efd-b369-907df363be19
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "動的計画法（DP）の基本的な考え方として正しいものはどれか。"
- options:
  1. "乱数を使って近似解を高速に求める" (16자)
  2. [정답] "部分問題の解を記録し再利用して重複計算を避ける" (23자)
  3. "常に局所最適な選択を繰り返す" (14자)
  4. "問題をランダムに分割して並列処理する" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.64x (max=23, min=14)
  - **B5-a** (Medium): correct is longest (23 vs others 16,14,18)
---
### Q-dc759bc0-0a20-497b-840b-a8e397fa2475
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "2分探索木を中順走査（in-order traversal）した結果の特徴はどれか。"
- options:
  1. [정답] "ノードの値が昇順に出力される" (14자)
  2. "ノードの値が降順に出力される" (14자)
  3. "ルートが最初に出力される" (12자)
  4. "リーフが最初に出力される" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (14 vs others 12,12)
---
### Q-97019052-a058-4b7e-a1cb-3ec1c44b321a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "クイックソートの最悪時間計算量がO(n²)になるのはどのような場合か。"
- options:
  1. "配列の要素がすべて同じ値の場合" (15자)
  2. "配列の要素数が奇数の場合" (12자)
  3. [정답] "ピボットが常に最小値または最大値に選ばれる場合" (23자)
  4. "配列にランダムな値が含まれる場合" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.92x (max=23, min=12)
  - **B5-a** (Medium): correct is longest (23 vs others 15,12,16)
---
### Q-b7092e05-9625-4d31-b1a3-c7b5ae929343
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "2分探索の前提条件として正しいものはどれか。"
- options:
  1. [정답] "データがソート（整列）済みであること" (18자)
  2. "データが連結リストに格納されていること" (19자)
  3. "データの個数が偶数であること" (14자)
  4. "データがすべて異なる値であること" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.36x (max=19, min=14)
---
### Q-2f032201-b165-4f60-9126-c900995605f3
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "線形探索（リニアサーチ）の説明として正しいものはどれか。"
- options:
  1. [정답] "データを先頭から順に一つずつ調べる探索法" (20자)
  2. "データを半分に分けて探す探索法" (15자)
  3. "ランダムにデータを選んで探す探索法" (17자)
  4. "ハッシュ値を使って探す探索法" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=20, min=14)
  - **B5-a** (Medium): correct is longest (20 vs others 15,17,14)
---
### Q-a24d898b-3eac-4681-a2a8-1ec811c7709d
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "バブルソートの説明として正しいものはどれか。"
- options:
  1. [정답] "隣り合う要素を比較・交換して並べ替える手法" (21자)
  2. "最小値を見つけて先頭に移動させる手法" (18자)
  3. "データを分割して統合する手法" (14자)
  4. "ランダムに並べ替えを行う手法" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=21, min=14)
  - **B5-a** (Medium): correct is longest (21 vs others 18,14,14)
---
### Q-e29f7e55-d041-4534-b8a5-fefbccf06487
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "挿入ソートの説明として正しいものはどれか。"
- options:
  1. [정답] "整列済み部分の適切な位置に要素を挿入する手法" (22자)
  2. "先頭から順にすべての要素を比較する手法" (19자)
  3. "データを半分に分割して結合する手法" (17자)
  4. "最大値を末尾に移動させる手法" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=22, min=14)
  - **B5-a** (Medium): correct is longest (22 vs others 19,17,14)
---
### Q-e82442a2-ae1f-4d8d-8240-03a4663d7ab4
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ソートアルゴリズムの目的として正しいものはどれか。"
- options:
  1. [정답] "データを一定の規則に従って並べ替える" (18자)
  2. "データを検索する" (8자)
  3. "データを圧縮する" (8자)
  4. "データを暗号化する" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.25x (max=18, min=8)
  - **B5-a** (Medium): correct is longest (18 vs others 8,8,9)
---
### Q-a0b4a296-717c-461c-9417-16fc71af42d2
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ヒープソートの平均時間計算量と、その特徴として正しいものはどれか。"
- options:
  1. "平均計算量はO(n²)であり、安定ソートである" (23자)
  2. "平均計算量はO(n log n)であり、安定ソートである" (28자)
  3. [정답] "平均計算量はO(n log n)であり、安定ソートではない" (29자)
  4. "平均計算量はO(n)であり、追加メモリO(n)が必要である" (29자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.26x (max=29, min=23)
  - **B5-a** (Medium): correct is longest (29 vs others 23,28)
---
### Q-983700b8-b2a0-4ada-8e77-c7eef1102a51
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "基数ソート（Radix Sort）の特徴として最も適切なものはどれか。"
- options:
  1. "比較ベースのソートであり、最悪計算量はO(n log n)である" (32자)
  2. [정답] "非比較ソートであり、桁数dと基数kに対してO(d(n+k))の計算量を持つ" (37자)
  3. "任意のデータ型に適用でき、常にO(n)で動作する" (24자)
  4. "不安定ソートであり、追加メモリを必要としない" (22자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.68x (max=37, min=22)
  - **B5-a** (Medium): correct is longest (37 vs others 32,24,22)
---
### Q-250bb667-fd2e-4d54-b24c-a572f4eb9b7d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "マージソートに関する説明として正しいものはどれか。"
- options:
  1. "不安定ソートであるが、追加メモリを必要としないインプレースソートである" (35자)
  2. "安定ソートであり、最悪計算量はO(n²)である" (23자)
  3. "不安定ソートであり、最悪計算量はO(n log n)である" (29자)
  4. [정답] "安定ソートであり、最悪計算量はO(n log n)だが、O(n)の追加メモリが必要である" (44자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=44, min=23)
  - **B5-a** (Medium): correct is longest (44 vs others 35,23,29)
---
### Q-09f6329d-ebd5-4041-b7d5-fc30652dc5e1
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "グラフ探索における幅優先探索（BFS）と深さ優先探索（DFS）の比較として正しいものはどれか。"
- options:
  1. "BFSはスタックを使用し、DFSはキューを使用する" (25자)
  2. [정답] "BFSは重みなしグラフの最短経路に適し、DFSはトポロジカルソートに適している" (39자)
  3. "DFSは常にBFSよりメモリ使用量が多い" (20자)
  4. "BFSもDFSも重み付きグラフの最短経路を正しく求めることができる" (33자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.95x (max=39, min=20)
  - **B5-a** (Medium): correct is longest (39 vs others 25,20,33)
---
### Q-2cc4ffc2-3a06-4e95-b63f-8b9501349466
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トポロジカルソートに関する説明として正しいものはどれか。"
- options:
  1. "任意の有向グラフに適用でき、閉路がある場合でも正しく動作する" (30자)
  2. "無向グラフの頂点を次数の昇順に並べるアルゴリズムである" (27자)
  3. [정답] "DAGの頂点を依存関係に矛盾しない順序に並べ、タスク依存解決等に用いられる" (37자)
  4. "重み付きグラフの最短経路を求めるために使用されるアルゴリズムである" (33자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.37x (max=37, min=27)
  - **B5-a** (Medium): correct is longest (37 vs others 30,27,33)
---
### Q-49a2dcd9-c7cc-4451-88af-bb894fdc1436
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "償却解析（Amortized Analysis）の基本概念として正しいものはどれか。"
- options:
  1. "各操作の最悪計算量を合計し、全体の最悪ケースを求める手法である" (31자)
  2. "確率的な分析手法であり、期待値を計算するものである" (25자)
  3. [정답] "一連の操作全体のコストを操作回数で割り、1回あたりの平均的コストを評価する手法である" (42자)
  4. "最良ケースのみを考慮し、アルゴリズムの下限を評価する手法である" (31자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.68x (max=42, min=25)
  - **B5-a** (Medium): correct is longest (42 vs others 31,25,31)
---
### Q-4e94611d-cc3c-4cee-b97b-ff208accc3c0
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "再帰（リカーション）の説明として正しいものはどれか。"
- options:
  1. [정답] "関数が自分自身を呼び出すこと" (14자)
  2. "同じ処理を並列に実行すること" (14자)
  3. "条件分岐を繰り返すこと" (11자)
  4. "データを逆順に並べ替えること" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=14, min=11)
  - **B5-a** (Medium): correct is longest (14 vs others 11)
---
### Q-546bda78-840e-40b5-8d2c-917e69f8e097
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "深さ優先探索（DFS）の説明として正しいものはどれか。"
- options:
  1. [정답] "一つの枝を深く進んでからバックトラックする手法" (23자)
  2. "同じ深さのノードをすべて探索してから次の深さに進む手法" (27자)
  3. "ランダムにノードを選んで探索する手法" (18자)
  4. "最短経路を保証する探索手法" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.08x (max=27, min=13)
---
### Q-a52b3363-2185-41b4-9ad1-0bb100b8a12c
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "幅優先探索（BFS）の説明として正しいものはどれか。"
- options:
  1. [정답] "始点から近い順にすべてのノードを探索する手法" (22자)
  2. "一つの枝を最後まで探索する手法" (15자)
  3. "コスト最小の経路を選ぶ手法" (13자)
  4. "ヒューリスティック関数を使う手法" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.69x (max=22, min=13)
  - **B5-a** (Medium): correct is longest (22 vs others 15,13,16)
---
### Q-06a490a9-73a4-4ec9-b9e8-c35ef66ee630
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "O記法（ビッグオー記法）が表すものとして最も適切なのはどれか。"
- options:
  1. "プログラムの実行にかかる正確な秒数" (17자)
  2. [정답] "アルゴリズムの最悪時における計算量の増加オーダー" (24자)
  3. "メモリ使用量の最小値" (10자)
  4. "CPUのクロック周波数に対する性能比" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.40x (max=24, min=10)
  - **B5-a** (Medium): correct is longest (24 vs others 17,10,18)
---
### Q-7e5062bc-c784-4f1d-8fed-ed37312a0da4
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "安定ソートの説明として正しいものはどれか。"
- options:
  1. [정답] "同じ値の要素の元の順序がソート後も保たれる" (21자)
  2. "常にO(n log n)で動作する" (17자)
  3. "追加メモリを使用しない" (11자)
  4. "最悪計算量がO(n)である" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.91x (max=21, min=11)
  - **B5-a** (Medium): correct is longest (21 vs others 17,11,13)
---
### Q-3c729280-7160-4ca5-9df2-570b4f6b44fa
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "マージソートの特徴として正しいものはどれか。"
- options:
  1. [정답] "安定ソートであり最悪計算量がO(n log n)である" (27자)
  2. "インプレースソートで追加メモリが不要である" (21자)
  3. "最悪計算量がO(n²)である" (14자)
  4. "データがソート済みのとき最も遅くなる" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.93x (max=27, min=14)
  - **B5-a** (Medium): correct is longest (27 vs others 21,14,18)
---
### Q-eab8af73-f1f8-457b-98b4-87ac9a18b538
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "貪欲法（グリーディ法）の説明として正しいものはどれか。"
- options:
  1. [정답] "各ステップで局所的に最適な選択を行う手法" (20자)
  2. "すべての可能性を網羅的に調べる手法" (17자)
  3. "問題を再帰的に小さく分割する手法" (16자)
  4. "ランダムな選択を繰り返す手法" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=20, min=14)
  - **B5-a** (Medium): correct is longest (20 vs others 17,16,14)
---
### Q-3b4784f1-9b83-4de9-8c4b-bca33b38143b
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "擬似コードの目的として最も適切なものはどれか。"
- options:
  1. [정답] "プログラミング言語に依存せずアルゴリズムを記述する" (25자)
  2. "プログラムを自動的に生成する" (14자)
  3. "ソースコードのエラーを検出する" (15자)
  4. "プログラムの実行速度を測定する" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.79x (max=25, min=14)
  - **B5-a** (Medium): correct is longest (25 vs others 14,15,15)
---
### Q-0ab0963c-2991-4689-9110-ade27562b21a
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "選択ソートの説明として正しいものはどれか。"
- options:
  1. [정답] "未整列部分から最小値を選び先頭に配置する手法" (22자)
  2. "隣り合う要素を比較して交換する手法" (17자)
  3. "データを再帰的に分割して整列する手法" (18자)
  4. "挿入位置を探して要素を挿入する手法" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=22, min=17)
  - **B5-a** (Medium): correct is longest (22 vs others 17,18,17)
---
### Q-f29962c4-332a-456c-ae94-9f4e58a74452
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "探索アルゴリズムの目的として最も適切なものはどれか。"
- options:
  1. [정답] "データの集まりから目的のデータを見つける" (20자)
  2. "データを効率よく保存する" (12자)
  3. "データを暗号化する" (9자)
  4. "データの整合性を検証する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.22x (max=20, min=9)
  - **B5-a** (Medium): correct is longest (20 vs others 12,9,12)
---
### Q-a15a7101-74c6-4e38-aa34-2bef6392bfbb
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "分割統治法の説明として正しいものはどれか。"
- options:
  1. [정답] "問題を小さく分割し、解を統合する手法" (18자)
  2. "問題を並列に処理する手法" (12자)
  3. "データを順次処理する手法" (12자)
  4. "ランダムに問題を分割する手法" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=18, min=12)
  - **B5-a** (Medium): correct is longest (18 vs others 12,12,14)
---
### Q-19518630-a555-4fab-80c9-9b8eba042e41
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "アルゴリズムの説明として最も適切なものはどれか。"
- options:
  1. [정답] "問題を解くための明確な手順" (13자)
  2. "プログラミング言語の文法" (12자)
  3. "コンピュータのハードウェア構成" (15자)
  4. "データベースの設計手法" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.36x (max=15, min=11)
---
### Q-43be2ff9-0767-4185-a0d8-a03b63611f61
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "繰り返し処理の例として最も適切なものはどれか。"
- options:
  1. [정답] "配列の全要素に対して同じ計算を行う" (17자)
  2. "条件に応じて異なる処理を行う" (14자)
  3. "処理を一度だけ実行する" (11자)
  4. "プログラムを終了する" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.70x (max=17, min=10)
  - **B5-a** (Medium): correct is longest (17 vs others 14,11,10)
---
### Q-abf27c25-5626-4262-8701-adbad5cdbb66
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "変数の説明として最も適切なものはどれか。"
- options:
  1. [정답] "データを一時的に記憶する名前付きの領域" (19자)
  2. "固定された値のこと" (9자)
  3. "プログラムの実行命令のこと" (13자)
  4. "ファイルの保存場所のこと" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.11x (max=19, min=9)
  - **B5-a** (Medium): correct is longest (19 vs others 9,13,12)
---
### Q-239e9278-3aaa-4fb5-bc58-1c946e9c2642
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "動的計画法（DP）の説明として正しいものはどれか。"
- options:
  1. [정답] "部分問題の結果を保存して再利用する手法" (19자)
  2. "問題をランダムに分割して解く手法" (16자)
  3. "常にその時点の最善の選択をする手法" (17자)
  4. "全ての組み合わせを試す手法" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
  - **B5-a** (Medium): correct is longest (19 vs others 16,17,13)
---
### Q-257ed618-8fe6-487e-9d0f-797e4deb2bdb
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "アルゴリズムの良さを評価する基準として適切なものはどれか。"
- options:
  1. [정답] "処理時間と使用メモリ量" (11자)
  2. "ソースコードの行数" (9자)
  3. "使用するプログラミング言語" (13자)
  4. "プログラマの経験年数" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.44x (max=13, min=9)
---
### Q-34292346-d8b6-48a1-b0f9-2eb339dbeaf8
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トレースの説明として正しいものはどれか。"
- options:
  1. [정답] "プログラムを1ステップずつ追跡して動作を確認する手法" (26자)
  2. "プログラムの実行時間を計測する手法" (17자)
  3. "プログラムを自動テストする手法" (15자)
  4. "プログラムを圧縮する手法" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.17x (max=26, min=12)
  - **B5-a** (Medium): correct is longest (26 vs others 17,15,12)
---
### Q-9e585d1f-e66d-446e-829f-d0c25f0d07ce
- quiz_id: b50edf75-8fe6-4d66-aaa5-637673e4dca9
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "順次・選択・繰り返しの3つの基本構造のうち、「選択」にあたるものはどれか。"
- options:
  1. [정답] "条件に基づいて処理を分岐させる構造" (17자)
  2. "処理を上から順に実行する構造" (14자)
  3. "処理を条件が満たされるまで繰り返す構造" (19자)
  4. "関数を定義して呼び出す構造" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
---
### Q-cdd983b9-664c-4a7e-9204-dce0ebf6ad36
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ダイクストラ法の目的として正しいものはどれか。"
- options:
  1. [정답] "重み付きグラフの最短経路を求める" (16자)
  2. "グラフの連結成分を求める" (12자)
  3. "グラフの最大フローを求める" (13자)
  4. "グラフの全域木を求める" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.45x (max=16, min=11)
  - **B5-a** (Medium): correct is longest (16 vs others 12,13,11)
---
### Q-0e11e446-d114-4510-80fb-64693c391701
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "2分探索木において、左部分木と右部分木の関係として正しいものはどれか。"
- options:
  1. [정답] "左部分木の値は親より小さく、右部分木の値は親より大きい" (27자)
  2. "左部分木の値は親より大きく、右部分木の値は親より小さい" (27자)
  3. "左右の部分木の値に順序の制約はない" (17자)
  4. "左右の部分木は常に同じ数のノードを持つ" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.59x (max=27, min=17)
  - **B5-a** (Medium): correct is longest (27 vs others 17,19)
---
### Q-6fb0cbb9-b3cb-41ef-b0fe-34bc66a6e78d
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "赤黒木の特徴として正しいものはどれか。"
- options:
  1. [정답] "ノードに色を付けて平衡を保つ2分探索木" (19자)
  2. "すべてのリーフが同じ深さの完全2分木" (18자)
  3. "ソート済みデータ専用の木構造" (14자)
  4. "3つ以上の子を持てる多分木" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=19, min=13)
  - **B5-a** (Medium): correct is longest (19 vs others 18,14,13)
---
### Q-7b3aefe5-a0f8-43f1-9fa7-30c3b8211df0
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "AVL木の特徴として正しいものはどれか。"
- options:
  1. [정답] "左右部分木の高さの差が常に1以下の平衡木" (20자)
  2. "すべてのリーフが同じ深さにある木" (16자)
  3. "各ノードが最大3つの子を持つ木" (15자)
  4. "データがランダムに配置される木" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.33x (max=20, min=15)
  - **B5-a** (Medium): correct is longest (20 vs others 16,15,15)
---
### Q-8dd383be-c9bb-4d9c-8921-c669e0843213
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "2分探索木に対する中順走査（in-order traversal）の結果はどれか。"
- options:
  1. [정답] "ノードの値が昇順に得られる" (13자)
  2. "ノードの値が降順に得られる" (13자)
  3. "ルートから順に層ごとに得られる" (15자)
  4. "結果の順序は不定である" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.36x (max=15, min=11)
---
### Q-e4346c46-5772-4a06-a668-36cdf019c128
- quiz_id: 40473700-00e1-4b2e-86bb-d079cfcc5e43
- question_category: algorithm, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "バックトラッキングの説明として正しいものはどれか。"
- options:
  1. [정답] "行き詰まったら直前に戻り別の候補を試す手法" (21자)
  2. "すべての候補を同時に並列で探索する手法" (19자)
  3. "解の候補をランダムに選択する手法" (16자)
  4. "最初に見つかった解を最適解とする手法" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.31x (max=21, min=16)
  - **B5-a** (Medium): correct is longest (21 vs others 19,16,18)
---

## Low 우선순위 이슈

_없음_

## 거버넌스 이슈 (별도 마이그레이션 대상)

_없음_

## 자동감지 불가 항목 (수동 판단 필요)

- **A1 학습범위 준수**: CS 카테고리 내 다른 카테고리 지식 요구하는지 수동 확인
- **A3 단일정답 보장**: 오답이 맥락상 정답이 될 가능성 수동 검토
- **B4 오답지 범위**: 오답 선택지가 해당 카테고리 학습 범위 내인지 확인
- **B6 상호배타 (동의어/포함관계)**: 슬래시 외 동의어·포함관계는 자동감지 불가
