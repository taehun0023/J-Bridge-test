# CS data_structure カテゴリ 감사 리포트

**감사일**: 2026-04-06
**대상 문제 수**: 65
**Rubric**: docs/exam_quality_rubric.md v2

## 요약

| 우선순위 | 이슈 수 | 비율 |
|---------|--------|------|
| High    | 0건    | 0.0% |
| Medium  | 42건    | 64.6% |
| Low     | 0건    | 0.0% |
| Governance (별도) | 0건 | — |

**총 이슈 문제 수**: 42 / 65 (64.6%)
**A2-exempt (필터링됨)**: 0건

## B5-b 퀴즈별 길이 편향 통계

| quiz_id | 문제 수 | 정답=최장 | 비율 | 정답=최단 | 비율 | 판정 |
|---------|--------|----------|------|----------|------|------|
| a0000003... | 16 | 12 | 75.0% | 1 | 6.3% | **FAIL** |
| ad4e3ca1... | 14 | 10 | 71.4% | 1 | 7.1% | **FAIL** |
| 3ba24aae... | 10 | 9 | 90.0% | 1 | 10.0% | **FAIL** |
| 64f2db3f... | 1 | 1 | 100.0% | 0 | 0.0% | **FAIL** |

**B5-b 위반 퀴즈**: 4개 — 정답 길이 분포 재조정 필요

## High 우선순위 이슈

_없음_

## Medium 우선순위 이슈

### Q-97343991-8275-462c-9d56-74ff4865c7c6
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "スタックが利用される場面として最も適切なものはどれか。"
- options:
  1. "プリンタのジョブ管理" (10자)
  2. "CPUのタスクスケジューリング" (15자)
  3. [정답] "括弧の対応チェック" (9자)
  4. "最短経路の探索" (7자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.14x (max=15, min=7)
---
### Q-db116672-47f9-4eec-a176-c236d4a2dd5b
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B6]
- question_text: "n個のノードを持つ完全2分木の高さ（深さ）はおよそどれか。"
- options:
  1. [정답] "log₂(n)" (7자)
  2. "n" (1자)
  3. "n/2" (3자)
  4. "n²" (2자)
- 자동감지 근거:
  - **B6** (Medium): slash in option: "n/2"
---
### Q-82ff5c04-ea86-4fd6-b597-ac13a8a8ac14
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "レコードの説明として正しいものはどれか。"
- options:
  1. [정답] "異なるデータ型の要素をまとめた構造" (17자)
  2. "同じデータ型のみで構成される構造" (16자)
  3. "データを順番に並べた構造" (12자)
  4. "データを暗号化した構造" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.55x (max=17, min=11)
  - **B5-a** (Medium): correct is longest (17 vs others 16,12,11)
---
### Q-a9934097-e42f-4efb-8602-ceda08fead77
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "有向グラフと無向グラフの違いとして正しいものはどれか。"
- options:
  1. [정답] "有向グラフの辺には方向があり、無向グラフにはない" (24자)
  2. "有向グラフは重みを持ち、無向グラフは持たない" (22자)
  3. "有向グラフは閉路を持ち、無向グラフは持たない" (22자)
  4. "有向グラフと無向グラフに違いはない" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.41x (max=24, min=17)
  - **B5-a** (Medium): correct is longest (24 vs others 22,22,17)
---
### Q-e8a56169-d325-4e5a-894e-754e8b9ee201
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "デック（Deque）の説明として正しいものはどれか。"
- options:
  1. [정답] "両端からデータの挿入と削除ができる構造" (19자)
  2. "先頭からのみデータを操作できる構造" (17자)
  3. "ランダムな位置にアクセスできる構造" (17자)
  4. "要素に優先度を付けて管理する構造" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): correct is longest (19 vs others 17,17,16)
---
### Q-ee521026-bd56-45e6-9b2f-b9cbc55fca27
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "双方向連結リストの特徴として正しいものはどれか。"
- options:
  1. [정답] "各ノードが前後両方のノードへのポインタを持つ" (22자)
  2. "各ノードが次のノードへのポインタのみを持つ" (21자)
  3. "先頭と末尾が接続されて環状になっている" (19자)
  4. "ノードの挿入・削除ができない" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=22, min=14)
  - **B5-a** (Medium): correct is longest (22 vs others 21,19,14)
---
### Q-2b03e3af-f142-4048-a978-dcd38712340f
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キューが利用される場面として最も適切なものはどれか。"
- options:
  1. "関数の再帰呼び出し管理" (11자)
  2. "ブラウザの戻るボタン履歴" (12자)
  3. "式の逆ポーランド記法の評価" (13자)
  4. [정답] "プリンタのジョブ管理" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.30x (max=13, min=10)
  - **B5-a** (Medium): correct is shortest (10 vs others 11,12,13)
---
### Q-76bc989f-a3a5-44f3-b3ab-a01b4940d95a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "二分探索木（BST）の性質として正しいものはどれか。"
- options:
  1. "各ノードは最大3つの子を持つ" (14자)
  2. [정답] "左の子は親より小さく右の子は親より大きい" (20자)
  3. "常に完全二分木である" (10자)
  4. "葉ノードの深さはすべて同じである" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=20, min=10)
  - **B5-a** (Medium): correct is longest (20 vs others 14,10,16)
---
### Q-dce1c918-3737-4f2c-8125-5bdbf55946da
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "連結リストが配列より優れている操作はどれか。"
- options:
  1. "インデックスによるランダムアクセス" (17자)
  2. [정답] "中間位置への要素の挿入・削除" (14자)
  3. "メモリの効率的な使用" (10자)
  4. "キャッシュ効率の高い順次アクセス" (16자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.70x (max=17, min=10)
---
### Q-c4dcba24-ac4a-4140-97d7-5ee97e31822d
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュテーブルの衝突解決法であるチェイン法の説明として正しいものはどれか。"
- options:
  1. "衝突時に次の空きスロットを探す" (15자)
  2. "衝突時にハッシュ関数を変えて再計算する" (19자)
  3. [정답] "同じハッシュ値の要素を連結リストで管理する" (21자)
  4. "衝突時にテーブルサイズを2倍にする" (17자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.40x (max=21, min=15)
  - **B5-a** (Medium): correct is longest (21 vs others 15,19,17)
---
### Q-447594f5-6bc3-44f9-a220-db74db1dce8b
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "ハッシュテーブルの衝突解決法であるオープンアドレス法（線形探査）の説明として正しいものはどれか。"
- options:
  1. [정답] "衝突したら次の空きスロットを順に探す" (18자)
  2. "衝突した要素を別のハッシュテーブルに格納する" (22자)
  3. "衝突した要素を連結リストで管理する" (17자)
  4. "衝突したら要素を破棄する" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.83x (max=22, min=12)
---
### Q-a77258d8-a02d-40cc-b202-1d25bd62bf27
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "二分探索木の探索が最悪O(n)になるのはどのような場合か。"
- options:
  1. "ノード数が2の累乗のとき" (12자)
  2. "木が完全二分木のとき" (10자)
  3. "データがランダムな順序で挿入されたとき" (19자)
  4. [정답] "データが昇順または降順に挿入されて木が偏ったとき" (24자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.40x (max=24, min=10)
  - **B5-a** (Medium): correct is longest (24 vs others 12,10,19)
---
### Q-3abfda97-9139-436a-80d4-451e7cd4eb7a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ハッシュテーブルの衝突解決手法であるチェイン法とオープンアドレス法の比較として正しいものはどれか。"
- options:
  1. "チェイン法はテーブル容量を超えて格納できないが、オープンアドレス法は可能である" (39자)
  2. [정답] "オープンアドレス法はキャッシュ効率が良いが、チェイン法に比べて削除操作が複雑である" (41자)
  3. "両方とも負荷率が1を超えると動作しなくなる" (21자)
  4. "チェイン法ではリンクリストの代わりに二分探索木のみ使用される" (30자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.95x (max=41, min=21)
  - **B5-a** (Medium): correct is longest (41 vs others 39,21,30)
---
### Q-a2d49849-e804-44a4-b3e2-57d192ff1b22
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "二分ヒープを用いた優先度キューに関する説明として正しいものはどれか。"
- options:
  1. "要素の挿入はO(1)、最小値の取り出しはO(n)で行える" (28자)
  2. "二分ヒープは平衡二分探索木であり、任意の要素の検索がO(log n)で行える" (38자)
  3. [정답] "要素の挿入と最小値の取り出しがともにO(log n)で行え、配列で効率的に表現できる" (42자)
  4. "ヒープの構築にはO(n log n)が必要であり、ソート済み配列からでも短縮できない" (42자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=42, min=28)
  - **B5-a** (Medium): correct is longest (42 vs others 28,38)
---
### Q-ded9e597-9015-4009-af73-21e4da6dbe2a
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "グラフの表現方法である隣接行列と隣接リストのトレードオフとして正しいものはどれか。"
- options:
  1. "隣接行列はO(V+E)のメモリ、隣接リストはO(V²)のメモリを使用する" (36자)
  2. "隣接リストは辺の存在確認がO(1)で行え、隣接行列より常に効率的である" (35자)
  3. [정답] "隣接行列は辺の存在確認がO(1)だがO(V²)のメモリを使い、隣接リストはO(V+E)で疎グラフに適する" (52자)
  4. "両方ともメモリ使用量は同じだが、辺の追加操作の速度が異なる" (29자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.79x (max=52, min=29)
  - **B5-a** (Medium): correct is longest (52 vs others 36,35,29)
---
### Q-4b8f1b94-62f9-4e4c-ba18-706fefcb9bf6
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トライ木（Trie、接頭辞木）の特徴として最も適切なものはどれか。"
- options:
  1. "二分探索木の一種であり、文字列の比較にO(log n)かかる" (30자)
  2. [정답] "文字列の検索が文字列長mに対してO(m)で行え、共通接頭辞を共有する木構造である" (40자)
  3. "ハッシュテーブルと同様にキーのハッシュ値を用いて格納位置を決定する" (33자)
  4. "数値データの格納に特化しており、文字列の格納には適さない" (28자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=40, min=28)
  - **B5-a** (Medium): correct is longest (40 vs others 30,33,28)
---
### Q-747c92a0-f3f0-4072-be81-42850d0f3850
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "赤黒木とAVL木の比較として最も適切なものはどれか。"
- options:
  1. "AVL木は赤黒木より挿入・削除が高速だが、検索は遅い" (26자)
  2. "赤黒木はAVL木より厳密に平衡を保ち、検索が高速である" (27자)
  3. [정답] "両方ともO(log n)だが、AVL木は検索が速く、赤黒木は更新時の回転が少ない" (40자)
  4. "赤黒木の最悪検索時間はO(n)であり、AVL木はO(log n)である" (35자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.54x (max=40, min=26)
  - **B5-a** (Medium): correct is longest (40 vs others 26,27,35)
---
### Q-8eb15e87-3a85-4402-8a67-c06936e46484
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "双方向リンクリスト（Doubly Linked List）の特徴として正しいものはどれか。"
- options:
  1. "各ノードは次のノードへのポインタのみを持ち、前方への移動にはO(n)かかる" (37자)
  2. "単方向リストと同じメモリ使用量で、前後両方への移動がO(1)で行える" (34자)
  3. [정답] "前後2つのポインタを持ち、任意ノードの削除が容易だが、メモリ使用量が単方向より多い" (41자)
  4. "ランダムアクセスがO(1)で行え、配列と同等の検索性能を持つ" (30자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.37x (max=41, min=30)
  - **B5-a** (Medium): correct is longest (41 vs others 37,34,30)
---
### Q-15380cb2-0b8c-4e6c-ae82-64b97b9efb9e
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "環状バッファ（Circular Buffer / Ring Buffer）の特徴として正しいものはどれか。"
- options:
  1. "動的にサイズが拡張される配列であり、メモリの再割り当てが頻繁に発生する" (35자)
  2. "リンクリストで実装され、各ノードの接続を循環させる構造である" (30자)
  3. "スタックの実装に特化しており、LIFO操作のみをサポートする" (30자)
  4. [정답] "固定サイズの配列をリング状に使い、追加・取り出しがO(1)で行えるキュー向き構造である" (43자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.43x (max=43, min=30)
  - **B5-a** (Medium): correct is longest (43 vs others 35,30,30)
---
### Q-8ea066eb-68ea-499e-b985-32696232d1f6
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "素集合データ構造（Union-Find）に関する説明として正しいものはどれか。"
- options:
  1. [정답] "Union操作とFind操作を提供し、経路圧縮により操作がほぼO(1)の償却計算量となる" (44자)
  2. "集合の積集合や差集合を高速に求めるためのデータ構造である" (28자)
  3. "Find操作は常にO(n)であり、最適化手法は存在しない" (28자)
  4. "ソート済みデータに対してのみ適用可能であり、動的なデータには不向きである" (36자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.57x (max=44, min=28)
  - **B5-a** (Medium): correct is longest (44 vs others 28,28,36)
---
### Q-fb90d9d3-e1c9-4d5b-908b-3658ca1f95ad
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "リスト（連結リスト）の説明として正しいものはどれか。"
- options:
  1. [정답] "各要素が次の要素への参照を持つ構造" (17자)
  2. "データを連続した領域に格納する構造" (17자)
  3. "データを木構造で管理する構造" (14자)
  4. "データをキーと値のペアで管理する構造" (18자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.29x (max=18, min=14)
---
### Q-357d01f7-be9b-4321-990e-8f3e083da33d
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キューのデータの出し入れ方式はどれか。"
- options:
  1. [정답] "先入れ先出し（FIFO）" (12자)
  2. "後入れ先出し（LIFO）" (12자)
  3. "ランダムアクセス" (8자)
  4. "優先度順" (4자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.00x (max=12, min=4)
  - **B5-a** (Medium): correct is longest (12 vs others 8,4)
---
### Q-58a7faf7-a8ee-4732-8181-22a4f7b20bd8
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "キューにデータを追加する操作を何というか。"
- options:
  1. [정답] "エンキュー（enqueue）" (14자)
  2. "デキュー（dequeue）" (13자)
  3. "プッシュ（push）" (10자)
  4. "ポップ（pop）" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.75x (max=14, min=8)
  - **B5-a** (Medium): correct is longest (14 vs others 13,10,8)
---
### Q-891b66c6-b576-4e09-b82d-cd2eaf437123
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "キューが利用される身近な例として最も適切なものはどれか。"
- options:
  1. [정답] "プリンタの印刷待ち行列" (11자)
  2. "テキストエディタの「元に戻す」機能" (17자)
  3. "ファイルの圧縮処理" (9자)
  4. "パスワードの暗号化" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.89x (max=17, min=9)
---
### Q-9a3f183c-c426-47a2-9c8d-e061033c31fd
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スタックが利用される身近な例として最も適切なものはどれか。"
- options:
  1. [정답] "Webブラウザの「戻る」ボタンの履歴管理" (20자)
  2. "プリンタの印刷待ち行列" (11자)
  3. "データベースの検索結果" (11자)
  4. "ファイルのフォルダ一覧" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.82x (max=20, min=11)
  - **B5-a** (Medium): correct is longest (20 vs others 11,11,11)
---
### Q-acd3ecb2-daca-45e1-9766-e3f9a1d7f6df
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a]
- question_text: "スタックの操作で、データを追加する操作を何というか。"
- options:
  1. [정답] "プッシュ（push）" (10자)
  2. "ポップ（pop）" (8자)
  3. "エンキュー（enqueue）" (14자)
  4. "デキュー（dequeue）" (13자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.75x (max=14, min=8)
---
### Q-0ce8ea73-5f95-4195-8a0b-6f1b61dd5307
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "完全2分木の定義として正しいものはどれか。"
- options:
  1. [정답] "最下層を除き全層が満たされ、最下層は左詰めの2分木" (25자)
  2. "すべてのノードが0個または2個の子を持つ2分木" (23자)
  3. "すべてのリーフが同じ深さにある2分木" (18자)
  4. "ノード数が偶数の2分木" (11자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.27x (max=25, min=11)
  - **B5-a** (Medium): correct is longest (25 vs others 23,18,11)
---
### Q-a79b66ab-7887-462c-8a78-0a88c1b65397
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "2分木の説明として正しいものはどれか。"
- options:
  1. [정답] "各ノードが最大2つの子を持つ木構造" (17자)
  2. "ノードが2つだけの木構造" (12자)
  3. "深さが2の木構造" (8자)
  4. "全ノードが2つの子を持つ木構造" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.13x (max=17, min=8)
  - **B5-a** (Medium): correct is longest (17 vs others 12,8,15)
---
### Q-7c184a08-cca9-4f22-9c8b-e5f4883ead38
- quiz_id: 64f2db3f-c67f-4d9c-8827-147d133838db
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ヒープの特徴として正しいものはどれか。"
- options:
  1. [정답] "親の値が子の値以上（または以下）の完全2分木" (22자)
  2. "左の子が常に右の子より小さい2分木" (17자)
  3. "全てのリーフが同じ深さにある木" (15자)
  4. "各ノードが最大3つの子を持つ木" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=22, min=15)
  - **B5-a** (Medium): correct is longest (22 vs others 17,15,15)
---
### Q-4ca917cb-a7ba-4136-988d-fd1f72afa12e
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "トライ木（Trie）が主に使用される用途はどれか。"
- options:
  1. [정답] "文字列の検索や辞書の実装" (12자)
  2. "数値のソート" (6자)
  3. "グラフの最短経路探索" (10자)
  4. "画像データの格納" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=12, min=6)
  - **B5-a** (Medium): correct is longest (12 vs others 6,10,8)
---
### Q-0ff946b9-a5f9-4433-bdd6-fddb505d74f5
- quiz_id: a0000003-0000-0000-0000-000000000003 (CS知識総合試験)
- question_category: data_structure, difficulty: hard
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "B木（B-tree）の特性とデータベースでの利用に関する説明として正しいものはどれか。"
- options:
  1. "二分探索木の一種であり、各ノードは最大2つの子を持つ" (26자)
  2. [정답] "多分岐の平衡木で、ディスクアクセスを最小化するようノードに複数キーを格納する" (38자)
  3. "葉ノードの深さが異なることがあり、最悪検索時間はO(n)となる" (31자)
  4. "メモリ上のデータ構造として設計されており、ディスクベースの用途には適さない" (37자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.46x (max=38, min=26)
  - **B5-a** (Medium): correct is longest (38 vs others 26,31,37)
---
### Q-95545151-c1dd-4b14-b2fd-1719b93303f5
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "データ構造を選ぶ際に考慮すべき点として最も適切なものはどれか。"
- options:
  1. [정답] "頻繁に行う操作の種類と効率" (13자)
  2. "プログラミング言語の種類" (12자)
  3. "コンピュータのメーカー" (11자)
  4. "プログラマの好み" (8자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5-a** (Medium): correct is longest (13 vs others 12,11,8)
---
### Q-1424846f-27dd-4183-ad88-e8004332934a
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "循環リスト（環状リスト）の特徴として正しいものはどれか。"
- options:
  1. [정답] "最後のノードが先頭のノードを指して環状になる" (22자)
  2. "各ノードが2つの次ノードを持つ" (15자)
  3. "先頭からしかアクセスできない" (14자)
  4. "要素の挿入ができない" (10자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.20x (max=22, min=10)
  - **B5-a** (Medium): correct is longest (22 vs others 15,14,10)
---
### Q-248deab1-9e65-4829-8adc-f2af2965bd2c
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スタックのオーバーフローが発生するのはどのような場合か。"
- options:
  1. [정답] "スタックの容量を超えてプッシュした場合" (19자)
  2. "空のスタックからポップした場合" (15자)
  3. "スタックを初期化した場合" (12자)
  4. "スタックの要素を参照した場合" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.58x (max=19, min=12)
  - **B5-a** (Medium): correct is longest (19 vs others 15,12,14)
---
### Q-05f4ef1b-4af0-464c-9f4f-79424d0d9374
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "隣接リストでグラフを表現する場合の利点として正しいものはどれか。"
- options:
  1. [정답] "疎グラフでメモリ効率が良い" (13자)
  2. "任意の2頂点間の辺の有無を定数時間で判定できる" (23자)
  3. "実装が隣接行列より単純である" (14자)
  4. "全グラフで隣接行列よりメモリ効率が良い" (19자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.77x (max=23, min=13)
  - **B5-a** (Medium): correct is shortest (13 vs others 23,14,19)
---
### Q-0437cdd6-66c4-4d19-98e1-272334585dea
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "優先度付きキューの説明として正しいものはどれか。"
- options:
  1. [정답] "優先度の高い要素から取り出されるキュー" (19자)
  2. "先入れ先出しで要素を管理するキュー" (17자)
  3. "後入れ先出しで要素を管理するキュー" (17자)
  4. "ランダムに要素を取り出すキュー" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.27x (max=19, min=15)
  - **B5-a** (Medium): correct is longest (19 vs others 17,17,15)
---
### Q-3451d42b-ca79-4117-8534-5270b4b9f2e2
- quiz_id: 3ba24aae-54a2-40a7-a3c1-0df0d4993208
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "ヒープの説明として正しいものはどれか。"
- options:
  1. [정답] "親の値が子の値以上（または以下）の完全2分木" (22자)
  2. "左の子が右の子より小さい2分木" (15자)
  3. "すべてのノードが同じ値を持つ木" (15자)
  4. "データを配列で管理する線形構造" (15자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.47x (max=22, min=15)
  - **B5-a** (Medium): correct is longest (22 vs others 15,15,15)
---
### Q-01c5885c-31aa-416f-b801-09d73c63f347
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スタックのデータの出し入れ方式はどれか。"
- options:
  1. [정답] "後入れ先出し（LIFO）" (12자)
  2. "先入れ先出し（FIFO）" (12자)
  3. "ランダムアクセス" (8자)
  4. "優先度順" (4자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.00x (max=12, min=4)
  - **B5-a** (Medium): correct is longest (12 vs others 8,4)
---
### Q-e310699c-ce1e-40f4-84cc-d544d7b73eff
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "配列とリストの違いとして正しいものはどれか。"
- options:
  1. [정답] "配列はメモリ上で連続、リストはポインタでつながる" (24자)
  2. "配列は要素の追加が容易、リストは困難" (18자)
  3. "配列はデータ型が自由、リストは固定" (17자)
  4. "配列とリストに違いはない" (12자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 2.00x (max=24, min=12)
  - **B5-a** (Medium): correct is longest (24 vs others 18,17,12)
---
### Q-bbc11f05-a446-44a3-8275-9f81e313f3c1
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "配列の説明として正しいものはどれか。"
- options:
  1. [정답] "同じ型のデータを連続した領域に格納する構造" (21자)
  2. "異なる型のデータを混在させる構造" (16자)
  3. "データを先入れ先出しで管理する構造" (17자)
  4. "データを階層的に管理する構造" (14자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.50x (max=21, min=14)
  - **B5-a** (Medium): correct is longest (21 vs others 16,17,14)
---
### Q-ab8c6de8-f18a-4354-acdc-b75fbe96a6fa
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: easy
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "スタックからデータを取り出す操作を何というか。"
- options:
  1. [정답] "ポップ（pop）" (8자)
  2. "プッシュ（push）" (10자)
  3. "デキュー（dequeue）" (13자)
  4. "ピーク（peek）" (9자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 1.63x (max=13, min=8)
  - **B5-a** (Medium): correct is shortest (8 vs others 10,13,9)
---
### Q-f3f2125f-fcc0-4be6-b55a-be1a594b0d40
- quiz_id: ad4e3ca1-1700-47e6-bad4-3bb14f5f6717
- question_category: data_structure, difficulty: medium
- 클레임: 없음
- 위반 항목: [B5-a, B5-a]
- question_text: "木構造の深さ（高さ）の説明として正しいものはどれか。"
- options:
  1. [정답] "ルートからリーフまでの最長パスの辺の数" (19자)
  2. "ノードの総数" (6자)
  3. "リーフの数" (5자)
  4. "エッジの総数" (6자)
- 자동감지 근거:
  - **B5-a** (Medium): length ratio 3.80x (max=19, min=5)
  - **B5-a** (Medium): correct is longest (19 vs others 6,5,6)
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
