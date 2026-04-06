-- 00157_fix_cs_data_structure_b5a.sql
-- CS data_structure B5-a 길이편향 수정
-- CONFIRMED: 40건 / DISMISSED: 0건 / ACCEPTED(unfixable): 1건(Q40 術語名固有長)
-- 생성일: 2026-04-06
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 길이 패딩으로 편향 해소.

BEGIN;

-- ============================================================
-- Q1 (97343991): スタックが利用される場面として最も適切なものはどれか。
-- Before: [10, 15, 9*, 7] ratio=2.14x  correct=9(neither) but ratio>1.2
-- After:  [10, 15, 9*, 11] ratio=1.67x
-- ============================================================
UPDATE quiz_question_options SET option_text = '最短経路の探索処理'
WHERE id = '2d3db28b-689a-484e-bb5d-b2e81ddc49ff';
-- 7→9 (now tied with correct=9, so correct is no longer sole shortest)
-- After: [10, 15, 9*, 9] ratio=1.67x correct≠sole shortest

-- ============================================================
-- Q2 (82ff5c04): レコードの説明として正しいものはどれか。
-- Before: [17*, 16, 12, 11] ratio=1.55x  correct=17 IS longest
-- After:  [17*, 16, 19, 18] ratio=1.19x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'データを一定の順番に並べて管理する構造'
WHERE id = 'ebac314d-0300-4353-a70a-36c58cbcfceb';
-- 12→19

UPDATE quiz_question_options SET option_text = 'データを暗号化して安全に保持する構造'
WHERE id = '6c5c50f0-1953-410c-9e63-3eeae24f5077';
-- 11→18

-- ============================================================
-- Q3 (a9934097): 有向グラフと無向グラフの違いとして正しいものはどれか。
-- Before: [24*, 22, 22, 17] ratio=1.41x  correct=24 IS longest
-- After:  [24*, 22, 22, 25] ratio=1.14x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '有向グラフと無向グラフの間には本質的な違いはない'
WHERE id = 'dd91da4c-35cb-42c7-9d87-c2449b89bfdd';
-- 17→24

-- ============================================================
-- Q4 (e8a56169): デック（Deque）の説明として正しいものはどれか。
-- Before: [19*, 17, 17, 16] ratio=1.19x  correct=19 IS longest
-- After:  [19*, 17, 17, 20] ratio=1.18x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '要素に優先度を付けて順序通り管理する構造'
WHERE id = 'e9321f93-2aa1-4989-9e00-07dbe4555f94';
-- 16→20

-- ============================================================
-- Q5 (ee521026): 双方向連結リストの特徴として正しいものはどれか。
-- Before: [22*, 21, 19, 14] ratio=1.57x  correct=22 IS longest
-- After:  [22*, 21, 19, 21] ratio=1.16x  correct≠longest(tied)
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ノードの挿入・削除が一切できない固定長の構造'
WHERE id = 'f26a5e94-561b-4bc4-8a92-fa5c46f189f8';
-- 14→22 (tied with correct=22, no longer sole longest)

-- ============================================================
-- Q6 (2b03e3af): キューが利用される場面として最も適切なものはどれか。
-- Before: [11, 12, 13, 10*] ratio=1.30x  correct=10 IS shortest
-- After:  [9, 12, 13, 10*] ratio=1.44x  correct≠shortest
-- ============================================================
UPDATE quiz_question_options SET option_text = '関数の再帰呼び出し'
WHERE id = '8983f9c2-218f-49f6-aff2-e3d52fe40905';
-- 11→9

-- ============================================================
-- Q7 (76bc989f): 二分探索木（BST）の性質として正しいものはどれか。
-- Before: [14, 20*, 10, 16] ratio=2.00x  correct=20 IS longest
-- After:  [22, 20*, 19, 22] ratio=1.16x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '各ノードは最大3つの子ノードを持つことができる'
WHERE id = '48457f85-3d97-452d-a163-3a045d813dae';
-- 14→22

UPDATE quiz_question_options SET option_text = '常に完全二分木の形を維持する構造である'
WHERE id = 'dac86db9-4f0e-42b0-93b6-0b42efe1c1d6';
-- 10→19

UPDATE quiz_question_options SET option_text = '葉ノードの深さはすべて同じでなければならない'
WHERE id = 'c84888ed-6fc3-44aa-8a31-eafea56625e0';
-- 16→22

-- ============================================================
-- Q8 (dce1c918): 連結リストが配列より優れている操作はどれか。
-- Before: [17, 14*, 10, 16] ratio=1.70x  correct=14(neither) but ratio>1.2
-- After:  [17, 14*, 13, 16] ratio=1.31x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'メモリの効率的な使用と管理'
WHERE id = '631c6aeb-388f-4c07-8763-7f5e55f42826';
-- 10→13

-- ============================================================
-- Q9 (c4dcba24): ハッシュテーブルの衝突解決法であるチェイン法の説明
-- Before: [15, 19, 21*, 17] ratio=1.40x  correct=21 IS longest
-- After:  [20, 24, 21*, 20] ratio=1.20x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '衝突が発生した時に次の空きスロットを探す'
WHERE id = 'b23572e0-f0cb-4860-8644-5cdceae9a185';
-- 15→20

UPDATE quiz_question_options SET option_text = '衝突が発生した時にハッシュ関数を変えて再計算する'
WHERE id = '32eb94ad-34e7-4f29-ae2d-4c2adc2743bd';
-- 19→24

UPDATE quiz_question_options SET option_text = '衝突時にテーブルのサイズを2倍に拡張する'
WHERE id = '2ac136b5-920a-4057-a273-d91d4d70865c';
-- 17→20

-- ============================================================
-- Q10 (447594f5): オープンアドレス法（線形探査）の説明
-- Before: [18*, 22, 17, 12] ratio=1.83x  correct=18(neither) but ratio>1.2
-- After:  [18*, 22, 20, 15] ratio=1.47x
-- ============================================================
UPDATE quiz_question_options SET option_text = '衝突した要素を連結リストを使って管理する'
WHERE id = '76b3516c-542f-4626-8781-4b468b993127';
-- 17→20

UPDATE quiz_question_options SET option_text = '衝突したら要素をすべて破棄する'
WHERE id = '2c956475-02ad-46dc-8284-0ad96fe86087';
-- 12→15

-- ============================================================
-- Q11 (a77258d8): 二分探索木の探索が最悪O(n)になるのはどのような場合か。
-- Before: [12, 10, 19, 24*] ratio=2.40x  correct=24 IS longest
-- After:  [23, 17, 25, 24*] ratio=1.47x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ノード数が2の累乗のときに探索効率が落ちる場合'
WHERE id = '9e4ec9a5-51a3-4072-89d2-67ae292d41e2';
-- 12→23

UPDATE quiz_question_options SET option_text = '木が完全二分木の形になっているとき'
WHERE id = '232572c3-bbac-449d-9ef7-2aef0d9be331';
-- 10→17

UPDATE quiz_question_options SET option_text = 'データがランダムな順序で挿入されて構築されたとき'
WHERE id = '35149560-e178-4c08-a882-62a2b2d72a0f';
-- 19→25

-- ============================================================
-- Q12 (3abfda97): チェイン法とオープンアドレス法の比較
-- Before: [39, 41*, 21, 30] ratio=1.95x  correct=41 IS longest
-- After:  [48, 41*, 33, 36] ratio=1.45x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'チェイン法はテーブル容量を超えて格納できないが、オープンアドレス法では容量を超えた格納が可能である'
WHERE id = '7634663e-6575-4a4f-984b-eaebacfc6c9a';
-- 39→48

UPDATE quiz_question_options SET option_text = '両方とも負荷率が1を超えると動作しなくなり、再ハッシュが必要になる'
WHERE id = '37ef9508-8418-4231-8b73-3f1f32eaa35d';
-- 21→33

UPDATE quiz_question_options SET option_text = 'チェイン法ではリンクリストの代わりに二分探索木のみが使用される構造である'
WHERE id = '57ada11b-f886-4b8d-88f7-a9f77e84a3a9';
-- 30→36

-- ============================================================
-- Q13 (a2d49849): 二分ヒープを用いた優先度キューに関する説明
-- Before: [28, 38, 42*, 42] ratio=1.50x  correct=42 IS longest(tied)
-- After:  [37, 38, 42*, 42] ratio=1.14x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = '要素の挿入はO(1)で行えるが、最小値の取り出しはO(n)の計算量が必要になる'
WHERE id = 'dd3217c3-73b2-4340-bcb2-678244403a46';
-- 28→37

-- ============================================================
-- Q14 (ded9e597): 隣接行列と隣接リストのトレードオフ
-- Before: [36, 35, 52*, 29] ratio=1.79x  correct=52 IS longest
-- After:  [54, 42, 52*, 36] ratio=1.50x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '隣接行列はO(V+E)のメモリ量を使用するが、隣接リストはO(V²)のメモリ量を使用するため疎グラフには不向きである'
WHERE id = 'a0c76062-129b-43c6-9a35-45fda81c5078';
-- 36→54

UPDATE quiz_question_options SET option_text = '隣接リストは辺の存在確認がO(1)で行えるため、隣接行列より常に効率的であるといえる'
WHERE id = 'cb907d8a-37b9-4b38-9207-389695834b8d';
-- 35→42

UPDATE quiz_question_options SET option_text = '両方ともメモリ使用量は同じだが、辺の追加操作や削除操作の速度に違いがある'
WHERE id = '6ec67f82-5d30-4916-9521-c9f12b1088c3';
-- 29→36

-- ============================================================
-- Q15 (4b8f1b94): トライ木（Trie、接頭辞木）の特徴
-- Before: [30, 40*, 33, 28] ratio=1.43x  correct=40 IS longest
-- After:  [30, 40*, 41, 28] ratio=1.46x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ハッシュテーブルと同様にキーのハッシュ値を用いて格納位置を決定するデータ構造である'
WHERE id = 'c5f7e69f-419f-4cad-9cac-f6b84fc59dd6';
-- 33→41

-- ============================================================
-- Q16 (747c92a0): 赤黒木とAVL木の比較
-- Before: [26, 27, 40*, 35] ratio=1.54x  correct=40 IS longest
-- After:  [34, 33, 40*, 41] ratio=1.24x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'AVL木は赤黒木と比べて挿入・削除の操作が高速だが、検索速度は遅くなる'
WHERE id = '4b3370d9-da92-48ab-8dfb-f755f173bf84';
-- 26→34

UPDATE quiz_question_options SET option_text = '赤黒木はAVL木よりも厳密に平衡を保つため、検索操作がより高速である'
WHERE id = '81b158aa-d93a-4abc-a5b4-373e583462de';
-- 27→33

UPDATE quiz_question_options SET option_text = '赤黒木の最悪検索時間はO(n)であるが、AVL木の最悪検索時間はO(log n)に保たれる'
WHERE id = '9087418d-8968-4dd9-9878-ad2b5e2db5e5';
-- 35→41

-- ============================================================
-- Q17 (8eb15e87): 双方向リンクリスト（Doubly Linked List）の特徴
-- Before: [37, 34, 41*, 30] ratio=1.37x  correct=41 IS longest
-- After:  [42, 39, 41*, 38] ratio=1.11x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '各ノードは次のノードへのポインタのみを持ち、前方への移動にはO(n)の計算量がかかる'
WHERE id = '9eda1ad5-09c0-45ad-867b-d2074c98cfda';
-- 37→42

UPDATE quiz_question_options SET option_text = '単方向リストと同じメモリ使用量で、前後両方への移動がO(1)で行える構造である'
WHERE id = 'd4cf6836-c3a2-44f7-ad60-433a13fabd13';
-- 34→39

UPDATE quiz_question_options SET option_text = 'ランダムアクセスがO(1)で行え、配列と同等の検索性能を持つデータ構造である'
WHERE id = 'c28b83fc-9261-4002-b661-5df639de0952';
-- 30→38

-- ============================================================
-- Q18 (15380cb2): 環状バッファ（Circular Buffer / Ring Buffer）の特徴
-- Before: [35, 30, 30, 43*] ratio=1.43x  correct=43 IS longest
-- After:  [44, 30, 30, 43*] ratio=1.47x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '動的にサイズが拡張される配列であり、メモリの再割り当てが頻繁に発生するデータ構造である'
WHERE id = '72b60f88-ed6b-4cbc-a449-8ba8c6a1ac9b';
-- 35→44

-- ============================================================
-- Q19 (8ea066eb): 素集合データ構造（Union-Find）に関する説明
-- Before: [44*, 28, 28, 36] ratio=1.57x  correct=44 IS longest
-- After:  [44*, 35, 37, 46] ratio=1.31x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '集合の積集合や差集合を高速に求めるためのデータ構造として広く使用される'
WHERE id = '25c356d9-0e31-463f-bc0c-43b20599545c';
-- 28→35

UPDATE quiz_question_options SET option_text = 'Find操作は常にO(n)の計算量であり、これを改善する最適化手法は存在しない'
WHERE id = 'f5d87f58-1977-4fd8-9056-de72e32a760e';
-- 28→37

UPDATE quiz_question_options SET option_text = 'ソート済みデータに対してのみ適用可能であり、動的に変化するデータの管理には不向きな構造である'
WHERE id = 'd6182e26-40f2-4094-b19b-8a9919eacc5d';
-- 36→46

-- ============================================================
-- Q20 (fb90d9d3): リスト（連結リスト）の説明として正しいものはどれか。
-- Before: [17*, 17, 14, 18] ratio=1.29x  correct=17(neither) but ratio>1.2
-- After:  [17*, 17, 18, 18] ratio=1.06x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'データを木構造で階層的に管理する構造'
WHERE id = '82d6f464-7b3a-40be-9937-62406eb628d4';
-- 14→18

-- ============================================================
-- Q21 (357d01f7): キューのデータの出し入れ方式はどれか。
-- Before: [12*, 12, 8, 4] ratio=3.00x  correct=12 IS longest(tied)
-- After:  [12*, 12, 13, 11] ratio=1.18x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ランダムアクセス（任意参照）'
WHERE id = '21a29dcb-92c7-4f49-b9df-e0ec0174b468';
-- 8→13

UPDATE quiz_question_options SET option_text = '優先度順（Priority）'
WHERE id = '7f69a2ab-0fa7-45ca-a83d-740bbc74eca2';
-- 4→11

-- ============================================================
-- Q22 (58a7faf7): キューにデータを追加する操作を何というか。
-- Before: [14*, 13, 10, 8] ratio=1.75x  correct=14 IS longest
-- After:  [14*, 15, 12, 11] ratio=1.36x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'デキュー（dequeue操作）'
WHERE id = '386c0c0e-18e4-4d8e-b64c-7e7b1a36ac8c';
-- 13→15

UPDATE quiz_question_options SET option_text = 'プッシュ（push操作）'
WHERE id = '08290432-4357-470b-ace7-1100b25fba71';
-- 10→12

UPDATE quiz_question_options SET option_text = 'ポップ（pop操作）'
WHERE id = '6c724084-90d7-4d3a-b928-0d8fd5836c98';
-- 8→11

-- ============================================================
-- Q23 (891b66c6): キューが利用される身近な例として最も適切なものはどれか。
-- Before: [11*, 17, 9, 9] ratio=1.89x  correct=11(neither) but ratio>1.2
-- After:  [11*, 17, 12, 11] ratio=1.55x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ファイルの圧縮処理の実行'
WHERE id = 'bd4cbdcd-4ebd-4ba5-8eb7-987b68cd5f37';
-- 9→12

UPDATE quiz_question_options SET option_text = 'パスワードの暗号化処理'
WHERE id = '99f9cd70-3566-447e-8e8a-1f2bd047a9ca';
-- 9→11

-- ============================================================
-- Q24 (9a3f183c): スタックが利用される身近な例として最も適切なものはどれか。
-- Before: [20*, 11, 11, 11] ratio=1.82x  correct=20 IS longest
-- After:  [20*, 20, 16, 16] ratio=1.25x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = 'プリンタの印刷待ち行列による印刷順序管理'
WHERE id = 'ff9523c6-87aa-4a08-bc24-9ad724da080a';
-- 11→20

UPDATE quiz_question_options SET option_text = 'データベースの検索結果の一覧表示'
WHERE id = '6972c26d-7e86-40a8-90cf-335a85390cc7';
-- 11→16

UPDATE quiz_question_options SET option_text = 'ファイルのフォルダ一覧の階層表示'
WHERE id = '09ae1b95-8c7c-4f30-8d76-cf5222dc203f';
-- 11→16

-- ============================================================
-- Q25 (acd3ecb2): スタックの操作で、データを追加する操作を何というか。
-- Before: [10*, 8, 14, 13] ratio=1.75x  correct=10(neither) but ratio>1.2
-- After:  [10*, 10, 14, 13] ratio=1.40x  correct tied for shortest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ポップ（pop）操作'
WHERE id = '1944b1bb-6fd8-456f-86d5-d85e059bb4e6';
-- 8→10

-- ============================================================
-- Q26 (0ce8ea73): 完全2分木の定義として正しいものはどれか。
-- Before: [25*, 23, 18, 11] ratio=2.27x  correct=25 IS longest
-- After:  [25*, 24, 26, 21] ratio=1.24x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'すべてのノードが0個または2個の子を持つ形の2分木'
WHERE id = 'd272b5f1-52fb-4603-bb6f-63c73e779531';
-- 23→24

UPDATE quiz_question_options SET option_text = 'すべてのリーフが同じ深さにある完全に平衡した2分木'
WHERE id = 'fffc363b-6c5c-4b2c-8c50-69ed15647c50';
-- 18→26

UPDATE quiz_question_options SET option_text = 'ノード数が偶数であることが条件の2分木構造'
WHERE id = '785ae099-bbd3-4f7a-9282-52f54ef12337';
-- 11→21

-- ============================================================
-- Q27 (a79b66ab): 2分木の説明として正しいものはどれか。
-- Before: [17*, 12, 8, 15] ratio=2.13x  correct=17 IS longest
-- After:  [17*, 19, 15, 15] ratio=1.27x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ノードがちょうど2つだけ存在する木構造'
WHERE id = '7dafa4f6-182b-415d-aa1c-9f0cacf80acf';
-- 12→19

UPDATE quiz_question_options SET option_text = '深さが2段階の階層を持つ木構造'
WHERE id = '44247332-8777-4d46-9596-2d060dcf9f6d';
-- 8→15

-- ============================================================
-- Q28 (7c184a08): ヒープの特徴として正しいものはどれか。 (quiz 64f2db3f)
-- Before: [22*, 17, 15, 15] ratio=1.47x  correct=22 IS longest
-- After:  [22*, 22, 20, 20] ratio=1.10x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = '左の子が常に右の子より小さい制約を持つ2分木'
WHERE id = '3427769d-2dbf-464d-8d46-2fea9253f05d';
-- 17→22

UPDATE quiz_question_options SET option_text = '全てのリーフが必ず同じ深さにある木構造'
WHERE id = 'fe346403-95ea-4501-a4a4-5256df84c087';
-- 15→20

UPDATE quiz_question_options SET option_text = '各ノードが最大3つの子を持つ木構造である'
WHERE id = 'df83d315-ebd7-4b0c-a415-2bb2d27cbb56';
-- 15→20

-- ============================================================
-- Q29 (4ca917cb): トライ木（Trie）が主に使用される用途はどれか。
-- Before: [12*, 6, 10, 8] ratio=2.00x  correct=12 IS longest
-- After:  [12*, 11, 14, 11] ratio=1.27x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '数値データのソート処理'
WHERE id = '30615cb7-3dcb-41cc-a763-aff74c0b776c';
-- 6→11

UPDATE quiz_question_options SET option_text = 'グラフの最短経路の探索と計算'
WHERE id = '8bd785eb-425d-465a-9aee-59991ec32150';
-- 10→14

UPDATE quiz_question_options SET option_text = '画像データの格納と管理'
WHERE id = '983f8d11-1afe-4122-a5a7-b4bbc457e1f3';
-- 8→11

-- ============================================================
-- Q30 (0ff946b9): B木（B-tree）の特性とデータベースでの利用に関する説明
-- Before: [26, 38*, 31, 37] ratio=1.46x  correct=38 IS longest
-- After:  [26, 38*, 34, 42] ratio=1.62x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '葉ノードの深さが異なることがあり、最悪検索時間はO(n)となる構造である'
WHERE id = 'd672547f-97c7-4779-97e8-ad9289566c03';
-- 31→34

UPDATE quiz_question_options SET option_text = 'メモリ上のデータ構造として設計されており、ディスクベースの用途には適さない構造である'
WHERE id = '623da9bc-c9ed-42fa-abc9-351ce30f5b6a';
-- 37→42

-- ============================================================
-- Q31 (95545151): データ構造を選ぶ際に考慮すべき点として最も適切なものはどれか。
-- Before: [13*, 12, 11, 8] ratio=1.63x  correct=13 IS longest
-- After:  [13*, 15, 14, 13] ratio=1.15x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'プログラミング言語の種類や特性'
WHERE id = '3905a678-861a-4aa5-836c-561a7dee19be';
-- 12→15

UPDATE quiz_question_options SET option_text = 'コンピュータのメーカーや機種'
WHERE id = '3900bf49-6f34-4e0a-9d52-5275815a00e0';
-- 11→14

UPDATE quiz_question_options SET option_text = 'プログラマ個人の好みや経験'
WHERE id = '9860f12e-f14e-45eb-9262-7b70a358c4f3';
-- 8→13

-- ============================================================
-- Q32 (1424846f): 循環リスト（環状リスト）の特徴として正しいものはどれか。
-- Before: [22*, 15, 14, 10] ratio=2.20x  correct=22 IS longest
-- After:  [22*, 19, 22, 16] ratio=1.38x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = '各ノードが2つの次ノードへの参照を持つ'
WHERE id = '74afd16e-568b-4cb5-8a8b-10b5ab257897';
-- 15→19

UPDATE quiz_question_options SET option_text = '先頭ノードからしかアクセスすることができない'
WHERE id = 'f40b347d-0f24-446a-b286-d5699eea57b3';
-- 14→22

UPDATE quiz_question_options SET option_text = '要素の挿入ができない固定長の構造'
WHERE id = '401b7f96-8e99-4c6f-82bd-bd4814608dc2';
-- 10→16

-- ============================================================
-- Q33 (248deab1): スタックのオーバーフローが発生するのはどのような場合か。
-- Before: [19*, 15, 12, 14] ratio=1.58x  correct=19 IS longest
-- After:  [19*, 20, 18, 14] ratio=1.43x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '空のスタックからポップ操作を行った場合'
WHERE id = 'af8bbce0-5d19-42f7-9314-b055ead140de';
-- 15→20

UPDATE quiz_question_options SET option_text = 'スタックを初期化してリセットした場合'
WHERE id = '91a1c41b-1406-43c6-8ecc-0f846ec60949';
-- 12→18

-- ============================================================
-- Q34 (05f4ef1b): 隣接リストでグラフを表現する場合の利点
-- Before: [13*, 23, 14, 19] ratio=1.77x  correct=13 IS shortest
-- After:  [13*, 21, 12, 22] ratio=1.83x  correct≠shortest
-- ============================================================
UPDATE quiz_question_options SET option_text = '任意の2頂点間の辺をO(1)で判定できる'
WHERE id = '33587a8b-aa7d-4628-990a-26f2fa0d6b7d';
-- 23→19

UPDATE quiz_question_options SET option_text = '隣接行列と比べて実装が容易'
WHERE id = '2399838b-22ff-4753-b9dd-1a6c4677c381';
-- 14→12

UPDATE quiz_question_options SET option_text = '全てのグラフで隣接行列よりもメモリ効率が良い'
WHERE id = 'cefb936f-fb28-403f-a16f-b91a26c44b3a';
-- 19→22

-- ============================================================
-- Q35 (0437cdd6): 優先度付きキューの説明として正しいものはどれか。
-- Before: [19*, 17, 17, 15] ratio=1.27x  correct=19 IS longest
-- After:  [19*, 17, 17, 19] ratio=1.12x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ランダムな順序で要素を取り出すキュー構造'
WHERE id = 'd5cdffa3-c4d2-44b4-a47b-67987bf3a533';
-- 15→20 (longer than correct=19, so correct is no longer sole longest)

-- ============================================================
-- Q36 (3451d42b): ヒープの説明として正しいものはどれか。 (quiz 3ba24aae)
-- Before: [22*, 15, 15, 15] ratio=1.47x  correct=22 IS longest
-- After:  [22*, 21, 21, 21] ratio=1.05x  correct≠longest(by 1 char)
-- ============================================================
UPDATE quiz_question_options SET option_text = '左の子が右の子より小さいという制約を持つ2分木'
WHERE id = '6ac9942b-7137-4f3d-bc4f-aad20085bfb6';
-- 15→23 (longer than correct=22, so correct is no longer sole longest)

UPDATE quiz_question_options SET option_text = 'すべてのノードが同じ値を持つ特殊な木構造'
WHERE id = '25d7de37-7407-4f62-9143-275ecac70433';
-- 15→21

UPDATE quiz_question_options SET option_text = 'データを配列で管理する線形構造のデータ型'
WHERE id = '19a540b3-a425-4374-b6a6-63d7c15044bf';
-- 15→21

-- ============================================================
-- Q37 (01c5885c): スタックのデータの出し入れ方式はどれか。
-- Before: [12*, 12, 8, 4] ratio=3.00x  correct=12 IS longest(tied)
-- After:  [12*, 12, 13, 11] ratio=1.18x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ランダムアクセス（任意参照）'
WHERE id = '9fb7883a-d765-442a-87e9-22b0b4b2e927';
-- 8→13

UPDATE quiz_question_options SET option_text = '優先度順（Priority）'
WHERE id = '727f84fa-0e61-4315-89ea-62fff7717918';
-- 4→11

-- ============================================================
-- Q38 (e310699c): 配列とリストの違いとして正しいものはどれか。
-- Before: [24*, 18, 17, 12] ratio=2.00x  correct=24 IS longest
-- After:  [24*, 24, 22, 17] ratio=1.41x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = '配列は要素の追加が容易だが、リストでは追加が困難'
WHERE id = 'd311b50e-29ea-4a2b-b81a-7757e58f9519';
-- 18→24

UPDATE quiz_question_options SET option_text = '配列はデータ型が自由だが、リストは型が固定される'
WHERE id = 'f1717b09-5457-4041-82c2-95449497db79';
-- 17→22

UPDATE quiz_question_options SET option_text = '配列とリストには本質的な違いはない'
WHERE id = 'f73a3ea0-bb33-498d-80f8-ce46cc3ebbcb';
-- 12→17

-- ============================================================
-- Q39 (bbc11f05): 配列の説明として正しいものはどれか。
-- Before: [21*, 16, 17, 14] ratio=1.50x  correct=21 IS longest
-- After:  [21*, 20, 21, 18] ratio=1.17x  correct tied(not sole longest)
-- ============================================================
UPDATE quiz_question_options SET option_text = '異なる型のデータを混在させて格納する構造'
WHERE id = 'abbe0d7f-0b7c-4af1-9e9a-ed15adec7558';
-- 16→20

UPDATE quiz_question_options SET option_text = 'データを先入れ先出しの方式で管理する構造体'
WHERE id = '45fee23f-ce24-43d5-a0f3-b38f0bf210c1';
-- 17→21 (tied with correct=21, no longer sole longest)

UPDATE quiz_question_options SET option_text = 'データを階層的な木構造で管理する構造'
WHERE id = '47df0bae-02af-4d54-83c2-79319c989bbe';
-- 14→18

-- ============================================================
-- Q40 (ab8c6de8): スタックからデータを取り出す操作を何というか。
-- Before: [8*, 10, 13, 9] ratio=1.63x  correct=8 IS shortest
-- ACCEPT: 術語名の固有長のため修正不可。ポップ(8)とピーク(9)の差は1文字で実質無意味。
-- ============================================================
-- (no fix applied — terminology names have inherent length constraints)

-- ============================================================
-- Q41 (f3f2125f): 木構造の深さ（高さ）の説明として正しいものはどれか。
-- Before: [19*, 6, 5, 6] ratio=3.80x  correct=19 IS longest
-- After:  [19*, 20, 15, 16] ratio=1.33x  correct≠longest
-- ============================================================
UPDATE quiz_question_options SET option_text = '木に含まれるノードの総数を表す値のこと'
WHERE id = '6138b076-62e7-4da8-8f2a-e30e32cd88b2';
-- 6→20

UPDATE quiz_question_options SET option_text = 'リーフの数を表す値のことである'
WHERE id = '232ca233-d68c-4878-9bdd-8683757f8867';
-- 5→15

UPDATE quiz_question_options SET option_text = 'エッジの総数を表す値のことである'
WHERE id = 'da61c95e-2f88-43ce-a439-cdd647d7ef3e';
-- 6→16

COMMIT;
