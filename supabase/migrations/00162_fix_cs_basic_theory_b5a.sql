-- 00162_fix_cs_basic_theory_b5a.sql
-- CS basic_theory B5-a 길이편향 수정
-- 생성일: 2026-04-06
-- CONFIRMED: 39건 / DISMISSED: 5건 / UPDATE: 37건
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 패딩으로 정답=최장 패턴 해소.

BEGIN;

-- Q-bee1b5b9: コンパイラの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.65, min=17→27, max=28
UPDATE quiz_question_options SET option_text = 'ソースコードを1行ずつ逐次実行することが主な目的である'
WHERE id = '94abe11d-3d51-48d0-92f1-33be41825bf7';

-- Q-03c38d21: メモリ領域のスタックの特徴として正しいものはどれか。
-- correct=26, dist=[22,21,14] → pad longest dist 22→31
UPDATE quiz_question_options SET option_text = 'プログラマが明示的に確保・解放するメモリ領域であるとされている'
WHERE id = '4a71e1b6-a21c-4596-81be-cabed72b0e9a';

-- Q-c145cc09: ASCIIコードの説明として正しいものはどれか。
-- correct=23, dist=[22,21,17] → pad longest dist 22→36
UPDATE quiz_question_options SET option_text = '16ビットで世界中の文字を表現する文字コードとして知られている手法である'
WHERE id = '08fdee87-4a24-445b-8e17-f70f9927bfbd';

-- Q-a0d403c6: ポリモーフィズム（多態性）の説明として正しいものはどれか。
-- correct=24, dist=[24,19,17] → pad longest dist 24→37
UPDATE quiz_question_options SET option_text = '親クラスの属性やメソッドを子クラスが引き継ぐことが前提条件として必要である'
WHERE id = 'c159844f-fe33-4dda-a2cb-16109f5a6e4b';

-- Q-17e9f0e4: UTF-8の特徴として正しいものはどれか。
-- correct=23, dist=[18,18,14] → pad longest dist 18→28
UPDATE quiz_question_options SET option_text = 'すべての文字を2バイト固定で表現することが主な目的である'
WHERE id = '2c73ed93-8064-46b3-97e0-a8f727d79a0e';

-- Q-50354b4f: SOLID原則の「S」（単一責任の原則）の説明として正しいものはどれか。 [MANUAL: correct=shortest]
-- correct=20, dist=[31,24,20]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-28439954: 関数型プログラミングの特徴として正しいものはどれか。
-- correct=21, dist=[18,15,14] → pad longest dist 18→26
UPDATE quiz_question_options SET option_text = 'クラスとオブジェクトを中心に設計する処理のことである'
WHERE id = '9f5a3d86-7830-48df-bbee-8b8c50764d7d';

-- Q-461c52a9: ヒープ領域の特徴として正しいものはどれか。
-- correct=26, dist=[20,20,12] → pad longest dist 20→30
UPDATE quiz_question_options SET option_text = '関数呼び出し時に自動的に確保・解放されることが主な特徴である'
WHERE id = 'ee7807a2-546d-4319-be49-adf1f956f5ef';

-- Q-597a4594: Observerパターンの説明として正しいものはどれか。
-- correct=27, dist=[26,25,21] → pad longest dist 26→39
UPDATE quiz_question_options SET option_text = '複雑なサブシステムへの統一インターフェースを提供することを目的とした手法である'
WHERE id = '14aa1500-1f19-4030-bfcd-fa7fd7c6de7d';

-- Q-9b6b2816: IEEE 754浮動小数点数で0.1+0.2が0.3にならない原因として正しいも
-- correct=29, dist=[25,17,17] → pad longest dist 25→34
UPDATE quiz_question_options SET option_text = 'メモリアライメントのずれにより計算結果が変わるためであるとされている'
WHERE id = '465edd91-9395-4c08-92f7-0d1ed5b7c160';

-- Q-5d4b2862: リスコフの置換原則（LSP）に違反する例として最も適切なものはどれか。 [ratio fix]
-- ratio=1.41, min=29→38, max=41
UPDATE quiz_question_options SET option_text = 'Listインターフェースを実装したArrayListクラスであるとされている'
WHERE id = 'eb7ca865-3907-4421-971b-6e58a590a33d';

-- Q-83da4fb2: マーク・アンド・スイープ方式のガベージコレクションの説明として正しいものはどれか
-- correct=31, dist=[28,26,26] → pad longest dist 28→36
UPDATE quiz_question_options SET option_text = 'オブジェクトのスコープ終了時に自動的にデストラクタを呼ぶ手法のことである'
WHERE id = 'e35f3e30-39d9-461f-9792-6be2ac1b9aa0';

-- Q-3e509652: SOLID原則の「D」（依存性逆転の原則）の説明として正しいものはどれか。
-- correct=32, dist=[26,20,16] → pad longest dist 26→35
UPDATE quiz_question_options SET option_text = 'ソフトウェアは拡張に対して開き修正に対して閉じるべきであるとされている'
WHERE id = '1c8f7e80-94c0-4240-9a48-dd983380d51a';

-- Q-1c054534: Strategyパターンを適用すべき状況として最も適切なものはどれか。 [ratio fix]
-- ratio=1.32, min=22→28, max=29
UPDATE quiz_question_options SET option_text = 'オブジェクトの状態に応じて振る舞いを変えたいとされている'
WHERE id = '2d25e6ed-f4c2-4772-ad28-9be3160955e5';

-- Q-311e4b47: Javaのジェネリクスにおける型消去（Type Erasure）の説明として正し
-- correct=33, dist=[30,28,21] → pad longest dist 30→38
UPDATE quiz_question_options SET option_text = '実行時に型パラメータの情報が保持され動的型チェックが行われる手法のことである'
WHERE id = '730abc6d-4cc4-4ce1-8b19-60d9970b7506';

-- Q-18754247: GC対応言語（Java等）でメモリリークが発生するケースとして正しいものはどれか
-- correct=34, dist=[17,16,16] → pad longest dist 17→30
UPDATE quiz_question_options SET option_text = 'プリミティブ型の配列を確保した場合として一般的に知られている'
WHERE id = '1cb29758-7c60-46bd-a10e-28d0bf6d0167';

-- Q-b36238e3: クロージャ（closure）の説明として正しいものはどれか。
-- correct=26, dist=[24,23,17] → pad longest dist 24→29
UPDATE quiz_question_options SET option_text = '関数をコンパイル時にインライン展開する最適化手法に該当する'
WHERE id = '8b3787d2-eed9-4c80-bd7a-6deb931917b0';

-- Q-e2d9532f: 末尾再帰最適化（Tail Call Optimization）の説明として正しい
-- correct=32, dist=[29,25,21] → pad longest dist 29→43
UPDATE quiz_question_options SET option_text = '再帰の深さに上限を設けてスタックオーバーフローを防ぐ仕組みとして知られている手法である'
WHERE id = '1e8dd963-0f99-445f-83a5-eef66447407f';

-- Q-1f781b40: Abstract Factoryパターンの目的として正しいものはどれか。
-- correct=26, dist=[23,20,18] → pad longest dist 23→31
UPDATE quiz_question_options SET option_text = '1つのオブジェクトの生成手順を段階的に定義する処理のことである'
WHERE id = '7619841f-bb88-481b-9776-48310e3d4394';

-- Q-deb455ec: 不変オブジェクト（Immutable Object）の利点として正しくないものは [ratio fix]
-- ratio=1.31, min=16→29, max=21
UPDATE quiz_question_options SET option_text = '副作用がなく予測可能な動作をすることを目的とした手法である'
WHERE id = 'f94b7724-fad0-453b-ac62-4a7d5c45d1b8';

-- Q-6c4bac5c: 文字コードの説明として正しいものはどれか。
-- correct=25, dist=[15,13,11] → pad longest dist 15→28
UPDATE quiz_question_options SET option_text = 'プログラムのソースコードのことが前提条件として必要である'
WHERE id = '0b8dd958-29db-42ec-ae24-9703eb231e60';

-- Q-3a3bbd78: ビット（bit）の説明として正しいものはどれか。
-- correct=16, dist=[11,9,9] → pad longest dist 11→20
UPDATE quiz_question_options SET option_text = 'データの転送速度の単位であるとされている'
WHERE id = '663a5928-498b-4869-8e91-9bed89675715';

-- Q-55999ca6: けた落ちの説明として正しいものはどれか。
-- correct=23, dist=[19,17,11] → pad longest dist 19→28
UPDATE quiz_question_options SET option_text = '計算結果が表現可能な最大値を超える現象であるとされている'
WHERE id = '8497f555-adf6-4169-9b04-b0d5daab147b';

-- Q-bf37936c: 丸め誤差の説明として正しいものはどれか。
-- correct=25, dist=[20,17,14] → pad longest dist 20→29
UPDATE quiz_question_options SET option_text = 'ネットワーク通信中のデータ化けによる誤差であるとされている'
WHERE id = 'e35b7fbd-5aba-4c70-91c5-7340e4f6eea3';

-- Q-1b2e3149: 誤り検出符号であるパリティビットの説明として正しいものはどれか。
-- correct=28, dist=[19,17,16] → pad longest dist 19→31
UPDATE quiz_question_options SET option_text = 'データを暗号化して改ざんを検出する方式の一種として知られている'
WHERE id = '1802e541-4cda-4f81-8db9-48d632318fe4';

-- Q-60a3b184: オーバーフローの説明として正しいものはどれか。 [ratio fix]
-- ratio=1.82, min=11→20, max=20
UPDATE quiz_question_options SET option_text = '有効桁数が減少する現象であるとされている'
WHERE id = '5305ab61-59b0-48a4-a2dd-00261c5651f9';

-- Q-07c97caf: Unicodeの説明として正しいものはどれか。
-- correct=20, dist=[14,13,12] → pad longest dist 14→23
UPDATE quiz_question_options SET option_text = 'ASCII文字のみを扱う規格であるとされている'
WHERE id = '15ee1788-8c12-4774-8fa4-36f85454fb6e';

-- Q-1e0725d7: 情報エントロピーの説明として正しいものはどれか。
-- correct=18, dist=[12,11,9] → pad longest dist 12→21
UPDATE quiz_question_options SET option_text = 'データの圧縮率を表す指標であるとされている'
WHERE id = '833580e0-2ba0-4d7c-9816-0b2f885d7913';

-- Q-0e0fb076: 補数の説明として正しいものはどれか。
-- correct=17, dist=[12,10,9] → pad longest dist 12→21
UPDATE quiz_question_options SET option_text = '小数点以下を切り捨てた数であるとされている'
WHERE id = '48c47f46-db1a-4a73-8fd1-c03fca185f14';

-- Q-e58af6ac: 浮動小数点数の表現において、仮数部と指数部の説明として正しいものはどれか。
-- correct=23, dist=[23,18,15] → pad longest dist 23→36
UPDATE quiz_question_options SET option_text = '仮数部は小数点の位置を、指数部は有効数字を表すことを目的とした手法である'
WHERE id = '4c568441-81b4-49e2-9b1a-9acfe7734920';

-- Q-2c1e4c0d: バッファオーバーフロー攻撃の説明として正しいものはどれか。
-- correct=30, dist=[18,17,14] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'ネットワークのバッファを消費する攻撃として知られている手法である'
WHERE id = '5579397c-2555-4a64-a45d-446d199fab2e';

-- Q-36d95ad4: 集合A={1,2,3}と集合B={2,3,4}の積集合（A∩B）はどれか。 [MANUAL: correct=shortest]
-- correct=6, dist=[12,9,6]
-- NOTE: Cannot auto-fix correct=shortest without changing correct text or trimming distractors

-- Q-c67b80a7: 集合A={1,2,3}と集合B={2,3,4}の和集合（A∪B）はどれか。
-- correct=12, dist=[9,6,6] → pad longest dist 9→23
UPDATE quiz_question_options SET option_text = '{1, 2, 3}として知られている手法である'
WHERE id = '1b3feeb5-bf57-49ce-b45b-ab11f5b1ea44';

-- Q-d72790df: 真理値表とは何か。
-- correct=18, dist=[17,16,15] → pad longest dist 17→31
UPDATE quiz_question_options SET option_text = 'データベースのテーブル構造を示す図として知られている手法である'
WHERE id = '6c9e416f-ebf0-423b-b9a7-19d76e66a29b';

-- Q-fe46d70d: BCD（2進化10進数）の説明として正しいものはどれか。
-- correct=21, dist=[19,16,13] → pad longest dist 19→24
UPDATE quiz_question_options SET option_text = '2進数を10進数に変換するアルゴリズムに該当する'
WHERE id = 'e16a62f5-f28b-44ac-b56e-d8111ad6ed6e';

-- Q-204f8eb2: カルノー図の用途として正しいものはどれか。 [ratio fix]
-- ratio=1.33, min=12→25, max=16
UPDATE quiz_question_options SET option_text = 'データの流れを可視化することを目的とした手法である'
WHERE id = '2b336cf5-98c1-4bb6-99de-b628d935ab77';

-- Q-8d11029c: 加算器において、全加算器（Full Adder）が半加算器（Half Adder
-- correct=20, dist=[16,10,9] → pad longest dist 16→25
UPDATE quiz_question_options SET option_text = '3つ以上の数の加算を同時に行えることが一般的である'
WHERE id = '74f37467-dae8-4c0b-b1e5-bc6d5560f690';

-- Q-8e45c7af: オートマトンの説明として正しいものはどれか。
-- correct=22, dist=[19,17,17] → pad longest dist 19→33
UPDATE quiz_question_options SET option_text = 'ネットワークを自動監視するソフトウェアとして知られている手法である'
WHERE id = 'd147ee2e-592f-4e7f-bdd2-9effe7993b0d';

-- Q-c1a7574e: 状態遷移図の説明として正しいものはどれか。
-- correct=18, dist=[18,13,11] → pad longest dist 18→32
UPDATE quiz_question_options SET option_text = 'プロセスのスケジューリングを表した図として知られている手法である'
WHERE id = '3a7f136e-9d19-459b-a5d5-24e92af2ac4a';

COMMIT;