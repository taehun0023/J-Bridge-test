-- 00170_coding_learning.sql
-- コーディング学習プロトタイプ: コード解析クイズ(18問) + コード作成問題(18問)
-- 생성일: 2026-04-13

BEGIN;

-- ============================================================
-- 1. quiz_type CHECK に 'code_reading' 追加
-- ============================================================
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge', 'keigo', 'writing', 'code_reading'
  ));

ALTER TABLE quiz_questions DROP CONSTRAINT IF EXISTS quiz_questions_question_type_check;
ALTER TABLE quiz_questions ADD CONSTRAINT quiz_questions_question_type_check
  CHECK (question_type IN (
    'multiple_choice', 'fill_in_blank', 'audio_listening', 'ordering', 'writing', 'code_reading'
  ));

-- ============================================================
-- 2. コード解析プールクイズ (3言語)
-- ============================================================
-- Idempotency guard: 既に00170データが投入済みなら以降のINSERTを丸ごとスキップする。
-- marker = coding_problems の最初の行 (b0000001-0001-...)。
DO $mig$
BEGIN
  IF EXISTS (SELECT 1 FROM coding_problems WHERE id = 'b0000001-0001-0000-0000-000000000001') THEN
    RAISE NOTICE '00170 already applied — skipping data inserts';
    RETURN;
  END IF;

INSERT INTO quizzes (id, title, quiz_type, is_pool, is_assessment, passing_score, questions_per_attempt)
VALUES
  ('c0de0001-0000-0000-0000-000000000001', 'Java コード解析',       'code_reading', true, false, 70, 10),
  ('c0de0001-0000-0000-0000-000000000002', 'JavaScript コード解析', 'code_reading', true, false, 70, 10),
  ('c0de0001-0000-0000-0000-000000000003', 'SQL コード解析',        'code_reading', true, false, 70, 10)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- 3. Java コード解析 quiz_questions (6問)
-- ============================================================

-- Java Easy 1: 変数と演算
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードの出力結果はどれですか？\n\n```java\nint x = 5;\nint y = x * 2 + 3;\nSystem.out.println(y);\n```',
  'x=5, y=5*2+3=13。乗算が先に計算され、その後加算される。',
  'code_reading', 'easy', 'java', true, 1, 1
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '10', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '13', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '8', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '15', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=1;

-- Java Easy 2: 条件分岐
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードで、x = -3 の場合の出力はどれですか？\n\n```java\nif (x > 0) {\n    System.out.println("正の数");\n} else if (x == 0) {\n    System.out.println("ゼロ");\n} else {\n    System.out.println("負の数");\n}\n```',
  'x=-3は0より小さいので、else節が実行され「負の数」が出力される。',
  'code_reading', 'easy', 'java', true, 1, 2
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '正の数', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'ゼロ', false, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '負の数', true, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'コンパイルエラー', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=2;

-- Java Medium 1: 配列の合計
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードの出力結果はどれですか？\n\n```java\nint[] nums = {3, 7, 2, 8};\nint sum = 0;\nfor (int i = 0; i < nums.length; i++) {\n    sum += nums[i];\n}\nSystem.out.println(sum);\n```',
  '3+7+2+8=20。forループで配列の全要素を合計している。',
  'code_reading', 'medium', 'java', true, 1, 3
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '10', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '20', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '18', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '17', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=3;

-- Java Medium 2: String操作
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードの出力結果はどれですか？\n\n```java\nString s = "Hello World";\nSystem.out.println(s.substring(6, 11));\n```',
  'substring(6,11)はインデックス6から10までの文字列を返す。"Hello World"のインデックス6は"W"、10は"d"なので"World"。',
  'code_reading', 'medium', 'java', true, 1, 4
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"World"', true, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"Hello"', false, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"o Wor"', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"orld"', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=4;

-- Java Hard 1: 例外処理
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードの出力結果はどれですか？\n\n```java\ntry {\n    int[] arr = new int[3];\n    arr[5] = 10;\n    System.out.println("A");\n} catch (ArrayIndexOutOfBoundsException e) {\n    System.out.println("B");\n} finally {\n    System.out.println("C");\n}\n```',
  'arr[5]で例外発生→catch実行(B)→finally実行(C)。finallyは常に実行される。',
  'code_reading', 'hard', 'java', true, 1, 5
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A C', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'B C', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A B C', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'B', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=5;

-- Java Hard 2: 継承とポリモーフィズム
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000001',
  E'次のJavaコードの出力結果はどれですか？\n\n```java\nclass Animal {\n    String speak() { return "..."; }\n}\nclass Dog extends Animal {\n    String speak() { return "ワン"; }\n}\nclass Cat extends Animal {\n    String speak() { return "ニャー"; }\n}\n// main:\nAnimal a = new Dog();\nSystem.out.println(a.speak());\n```',
  '実行時の型はDogなのでDog.speak()が呼ばれる（ポリモーフィズム）。変数の宣言型ではなくインスタンスの実際の型のメソッドが実行される。',
  'code_reading', 'hard', 'java', true, 1, 6
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"..."', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"ワン"', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"ニャー"', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'コンパイルエラー', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000001' AND sort_order=6;

-- ============================================================
-- 4. JavaScript コード解析 quiz_questions (6問)
-- ============================================================

-- JS Easy 1: 型変換と文字列結合
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力結果はどれですか？\n\n```javascript\nlet x = "5";\nlet y = x + 3;\nconsole.log(y);\n```',
  'xは文字列"5"なので、+演算子は文字列結合として動作する。"5" + 3 = "53"。',
  'code_reading', 'easy', 'javascript', true, 1, 1
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '8', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '"53"', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '53', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'エラー', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=1;

-- JS Easy 2: ==と===の違い
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力結果はどれですか？\n\n```javascript\nconsole.log(1 == "1");\nconsole.log(1 === "1");\n```',
  '==は型変換を行うので1=="1"はtrue。===は型も比較するので1==="1"はfalse（number vs string）。',
  'code_reading', 'easy', 'javascript', true, 1, 2
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'true true', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'true false', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'false true', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'false false', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=2;

-- JS Medium 1: 配列メソッドチェーン
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力結果はどれですか？\n\n```javascript\nconst result = [1, 2, 3].map(x => x * 2).filter(x => x > 3);\nconsole.log(result);\n```',
  'map: [2,4,6]。filter(x>3): [4,6]。mapで各要素を2倍し、filterで3より大きい要素だけ残す。',
  'code_reading', 'medium', 'javascript', true, 1, 3
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '[2, 4, 6]', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '[4, 6]', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '[6]', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '[1, 2, 3]', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=3;

-- JS Medium 2: オブジェクトの分割代入
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力結果はどれですか？\n\n```javascript\nconst user = { name: "田中", age: 25, city: "東京" };\nconst { name, ...rest } = user;\nconsole.log(rest);\n```',
  '分割代入でnameを取り出し、残りの要素(...rest)は{ age: 25, city: "東京" }となる。',
  'code_reading', 'medium', 'javascript', true, 1, 4
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '{ name: "田中" }', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '{ age: 25, city: "東京" }', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '{ name: "田中", age: 25, city: "東京" }', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'undefined', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=4;

-- JS Hard 1: クロージャ
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力結果はどれですか？\n\n```javascript\nfunction makeCounter() {\n    let count = 0;\n    return function() {\n        count++;\n        return count;\n    };\n}\nconst counter = makeCounter();\nconsole.log(counter());\nconsole.log(counter());\nconsole.log(counter());\n```',
  'クロージャにより内部関数はcountを参照し続ける。呼び出すたびにcountが1ずつ増え、1, 2, 3と出力される。',
  'code_reading', 'hard', 'javascript', true, 1, 5
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '0 0 0', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '1 1 1', false, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '1 2 3', true, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'undefined undefined undefined', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=5;

-- JS Hard 2: Promise と setTimeout の実行順序
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000002',
  E'次のJavaScriptコードの出力順序はどれですか？\n\n```javascript\nconsole.log("A");\nsetTimeout(() => console.log("B"), 0);\nPromise.resolve().then(() => console.log("C"));\nconsole.log("D");\n```',
  '同期コード(A,D)→マイクロタスク(Promise: C)→マクロタスク(setTimeout: B)の順で実行される。',
  'code_reading', 'hard', 'javascript', true, 1, 6
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A B C D', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A D B C', false, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A D C B', true, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'A C D B', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000002' AND sort_order=6;

-- ============================================================
-- 5. SQL コード解析 quiz_questions (6問)
-- ============================================================

-- SQL Easy 1: WHERE句
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のテーブルとクエリの結果、何行返されますか？\n\n```sql\n-- employeesテーブル:\n-- | id | name   | age | dept     |\n-- |----|--------|-----|----------|\n-- | 1  | 田中   | 28  | 営業     |\n-- | 2  | 鈴木   | 35  | 開発     |\n-- | 3  | 佐藤   | 22  | 営業     |\n-- | 4  | 山田   | 40  | 人事     |\n\nSELECT * FROM employees WHERE age >= 30;\n```',
  'age >= 30の行は鈴木(35)と山田(40)の2行。',
  'code_reading', 'easy', 'sql', true, 1, 1
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '1行', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '2行', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '3行', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=1;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '4行', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=1;

-- SQL Easy 2: ORDER BY
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のクエリの結果、最初に表示される名前はどれですか？\n\n```sql\n-- productsテーブル:\n-- | id | name     | price |\n-- |----|----------|-------|\n-- | 1  | りんご   | 150   |\n-- | 2  | バナナ   | 100   |\n-- | 3  | みかん   | 200   |\n-- | 4  | ぶどう   | 350   |\n\nSELECT name FROM products ORDER BY price DESC;\n```',
  'ORDER BY price DESCは価格の降順。最も高いぶどう(350)が最初に表示される。',
  'code_reading', 'easy', 'sql', true, 1, 2
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'りんご', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'バナナ', false, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'みかん', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=2;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, 'ぶどう', true, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=2;

-- SQL Medium 1: INNER JOIN
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のクエリの結果は何行ですか？\n\n```sql\n-- ordersテーブル:\n-- | id | customer_id | amount |\n-- |----|-------------|--------|\n-- | 1  | 10          | 5000   |\n-- | 2  | 20          | 3000   |\n-- | 3  | 30          | 7000   |\n\n-- customersテーブル:\n-- | id | name   |\n-- |----|--------|\n-- | 10 | 田中   |\n-- | 20 | 鈴木   |\n-- | 40 | 高橋   |\n\nSELECT c.name, o.amount\nFROM orders o\nINNER JOIN customers c ON o.customer_id = c.id;\n```',
  'INNER JOINは両テーブルに一致する行のみ返す。customer_id=10(田中),20(鈴木)は一致、30は顧客テーブルに無し、40は注文テーブルに無し。結果2行。',
  'code_reading', 'medium', 'sql', true, 1, 3
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '1行', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '2行', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '3行', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=3;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '4行', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=3;

-- SQL Medium 2: GROUP BYと集約関数
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のクエリの結果で、開発部の平均年齢はいくつですか？\n\n```sql\n-- employeesテーブル:\n-- | id | name   | age | dept |\n-- |----|--------|-----|------|\n-- | 1  | 田中   | 28  | 営業 |\n-- | 2  | 鈴木   | 32  | 開発 |\n-- | 3  | 佐藤   | 24  | 営業 |\n-- | 4  | 山田   | 38  | 開発 |\n-- | 5  | 高橋   | 30  | 開発 |\n\nSELECT dept, AVG(age) as avg_age\nFROM employees\nGROUP BY dept;\n```',
  '開発部: (32+38+30)/3 = 100/3 ≒ 33.33。',
  'code_reading', 'medium', 'sql', true, 1, 4
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '30', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '33.33', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '35', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=4;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '32', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=4;

-- SQL Hard 1: サブクエリ
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のクエリの結果は何行ですか？\n\n```sql\n-- salesテーブル:\n-- | id | product  | amount |\n-- |----|----------|--------|\n-- | 1  | ノートPC | 80000  |\n-- | 2  | マウス   | 3000   |\n-- | 3  | キーボード| 8000  |\n-- | 4  | モニター | 50000  |\n-- | 5  | USBメモリ | 1500  |\n\nSELECT product, amount\nFROM sales\nWHERE amount > (SELECT AVG(amount) FROM sales);\n```',
  'AVG(amount) = (80000+3000+8000+50000+1500)/5 = 28500。28500より大きいのはノートPC(80000)とモニター(50000)の2行。',
  'code_reading', 'hard', 'sql', true, 1, 5
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '1行', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '2行', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '3行', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=5;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '4行', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=5;

-- SQL Hard 2: GROUP BY + HAVING
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
VALUES (
  'c0de0001-0000-0000-0000-000000000003',
  E'次のクエリの結果に含まれる部署はどれですか？\n\n```sql\n-- employeesテーブル:\n-- | id | name   | salary  | dept   |\n-- |----|--------|---------|--------|\n-- | 1  | 田中   | 300000  | 営業   |\n-- | 2  | 鈴木   | 450000  | 開発   |\n-- | 3  | 佐藤   | 280000  | 営業   |\n-- | 4  | 山田   | 500000  | 開発   |\n-- | 5  | 高橋   | 350000  | 人事   |\n-- | 6  | 伊藤   | 420000  | 開発   |\n\nSELECT dept, COUNT(*) as cnt, AVG(salary) as avg_sal\nFROM employees\nGROUP BY dept\nHAVING COUNT(*) >= 2 AND AVG(salary) > 350000;\n```',
  '営業: 2人, AVG=290000 (350000以下なのでNG)。開発: 3人, AVG=456666 (OK)。人事: 1人 (2人未満なのでNG)。開発のみが条件を満たす。',
  'code_reading', 'hard', 'sql', true, 1, 6
);
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '営業のみ', false, 1 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '開発のみ', true, 2 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '営業と開発', false, 3 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=6;
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, '全部署', false, 4 FROM quiz_questions WHERE quiz_id='c0de0001-0000-0000-0000-000000000003' AND sort_order=6;

-- ============================================================
-- 6. Java coding_problems (6問) + test_cases
-- ============================================================

-- Java Easy 1: 二つの整数の合計
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0001-0000-0000-000000000001',
  '二つの整数の合計',
  E'## 問題\n\n標準入力から2つの整数を読み取り、その合計を出力してください。\n\n### 入力\n```\nA B\n```\n- A, B は整数 (-1000 ≤ A, B ≤ 1000)\n\n### 出力\n```\nA + B の結果\n```\n\n### 例\n入力: `3 5`\n出力: `8`',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int a = sc.nextInt();\n        int b = sc.nextInt();\n        System.out.println(a + b);\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0001-0000-0000-000000000001', '3 5', '8', true, 1),
  ('b0000001-0001-0000-0000-000000000001', '-10 25', '15', false, 2),
  ('b0000001-0001-0000-0000-000000000001', '0 0', '0', false, 3);

-- Java Easy 2: 偶数・奇数判定
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0002-0000-0000-000000000001',
  '偶数・奇数判定',
  E'## 問題\n\n標準入力から1つの整数を読み取り、偶数なら「偶数」、奇数なら「奇数」と出力してください。\n\n### 入力\n```\nN\n```\n- N は整数 (-1000 ≤ N ≤ 1000)\n\n### 出力\n```\n偶数 または 奇数\n```\n\n### 例\n入力: `4`\n出力: `偶数`',
  'easy', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        System.out.println(n % 2 == 0 ? "偶数" : "奇数");\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0002-0000-0000-000000000001', '4', '偶数', true, 1),
  ('b0000001-0002-0000-0000-000000000001', '7', '奇数', false, 2),
  ('b0000001-0002-0000-0000-000000000001', '0', '偶数', false, 3);

-- Java Medium 1: 1からNまでの合計
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0003-0000-0000-000000000001',
  '1からNまでの合計',
  E'## 問題\n\n標準入力から正の整数Nを読み取り、1からNまでの合計を出力してください。\n\n### 入力\n```\nN\n```\n- N は正の整数 (1 ≤ N ≤ 10000)\n\n### 出力\n```\n1 + 2 + ... + N の結果\n```\n\n### 例\n入力: `5`\n出力: `15`\n\n（1+2+3+4+5=15）',
  'medium', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int sum = 0;\n        for (int i = 1; i <= n; i++) {\n            sum += i;\n        }\n        System.out.println(sum);\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0003-0000-0000-000000000001', '5', '15', true, 1),
  ('b0000001-0003-0000-0000-000000000001', '100', '5050', false, 2),
  ('b0000001-0003-0000-0000-000000000001', '1', '1', false, 3);

-- Java Medium 2: 配列の最大値
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0004-0000-0000-000000000001',
  '配列の最大値',
  E'## 問題\n\n最初の行に配列の要素数N、次の行にN個の整数が与えられます。最大値を出力してください。\n\n### 入力\n```\nN\na1 a2 ... aN\n```\n- 1 ≤ N ≤ 100\n- -10000 ≤ ai ≤ 10000\n\n### 出力\n```\n最大値\n```\n\n### 例\n入力:\n```\n4\n3 7 2 8\n```\n出力: `8`',
  'medium', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        int max = Integer.MIN_VALUE;\n        for (int i = 0; i < n; i++) {\n            int val = sc.nextInt();\n            if (val > max) max = val;\n        }\n        System.out.println(max);\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0004-0000-0000-000000000001', E'4\n3 7 2 8', '8', true, 1),
  ('b0000001-0004-0000-0000-000000000001', E'3\n-5 -2 -10', '-2', false, 2),
  ('b0000001-0004-0000-0000-000000000001', E'1\n42', '42', false, 3);

-- Java Hard 1: 文字列の反転
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0005-0000-0000-000000000001',
  '文字列の反転',
  E'## 問題\n\n標準入力から文字列を読み取り、逆順にして出力してください。\n**StringBuilderのreverse()メソッドは使用禁止です。**\n\n### 入力\n```\nS\n```\n- S は英数字のみの文字列 (1 ≤ |S| ≤ 1000)\n\n### 出力\n```\nSを逆順にした文字列\n```\n\n### 例\n入力: `hello`\n出力: `olleh`',
  'hard', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n        // ※ StringBuilderのreverse()は使用禁止\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        String s = sc.nextLine();\n        char[] chars = s.toCharArray();\n        for (int i = 0; i < chars.length / 2; i++) {\n            char tmp = chars[i];\n            chars[i] = chars[chars.length - 1 - i];\n            chars[chars.length - 1 - i] = tmp;\n        }\n        System.out.println(new String(chars));\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0005-0000-0000-000000000001', 'hello', 'olleh', true, 1),
  ('b0000001-0005-0000-0000-000000000001', 'abcdef', 'fedcba', false, 2),
  ('b0000001-0005-0000-0000-000000000001', 'a', 'a', false, 3);

-- Java Hard 2: FizzBuzz
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000001-0006-0000-0000-000000000001',
  'FizzBuzz',
  E'## 問題\n\n標準入力から正の整数Nを読み取り、1からNまで以下のルールで出力してください。\n\n- 3の倍数かつ5の倍数 → `FizzBuzz`\n- 3の倍数 → `Fizz`\n- 5の倍数 → `Buzz`\n- それ以外 → その数字\n\n各出力は改行で区切ってください。\n\n### 入力\n```\nN\n```\n- 1 ≤ N ≤ 100\n\n### 出力\n```\n1からNまでのFizzBuzz結果（各行1つ）\n```\n\n### 例\n入力: `5`\n出力:\n```\n1\n2\nFizz\n4\nBuzz\n```',
  'hard', 'java',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        // ここにコードを書いてください\n\n    }\n}',
  E'import java.util.Scanner;\n\npublic class Main {\n    public static void main(String[] args) {\n        Scanner sc = new Scanner(System.in);\n        int n = sc.nextInt();\n        for (int i = 1; i <= n; i++) {\n            if (i % 15 == 0) System.out.println("FizzBuzz");\n            else if (i % 3 == 0) System.out.println("Fizz");\n            else if (i % 5 == 0) System.out.println("Buzz");\n            else System.out.println(i);\n        }\n    }\n}',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000001-0006-0000-0000-000000000001', '5', E'1\n2\nFizz\n4\nBuzz', true, 1),
  ('b0000001-0006-0000-0000-000000000001', '15', E'1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz', false, 2),
  ('b0000001-0006-0000-0000-000000000001', '1', '1', false, 3);

-- ============================================================
-- 7. JavaScript coding_problems (6問) + test_cases
-- ============================================================

-- JS Easy 1: 二つの整数の合計
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0001-0000-0000-000000000001',
  '二つの整数の合計',
  E'## 問題\n\n標準入力から2つの整数を読み取り、その合計を出力してください。\n\n### 入力\n```\nA B\n```\n- A, B は整数 (-1000 ≤ A, B ≤ 1000)\n\n### 出力\n```\nA + B の結果\n```\n\n### 例\n入力: `3 5`\n出力: `8`',
  'easy', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    // ここにコードを書いてください\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    const [a, b] = line.split(" ").map(Number);\n    console.log(a + b);\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0001-0000-0000-000000000001', '3 5', '8', true, 1),
  ('b0000002-0001-0000-0000-000000000001', '-10 25', '15', false, 2),
  ('b0000002-0001-0000-0000-000000000001', '0 0', '0', false, 3);

-- JS Easy 2: 偶数・奇数判定
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0002-0000-0000-000000000001',
  '偶数・奇数判定',
  E'## 問題\n\n標準入力から1つの整数を読み取り、偶数なら「偶数」、奇数なら「奇数」と出力してください。\n\n### 入力\n```\nN\n```\n- N は整数 (-1000 ≤ N ≤ 1000)\n\n### 出力\n```\n偶数 または 奇数\n```\n\n### 例\n入力: `4`\n出力: `偶数`',
  'easy', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    // ここにコードを書いてください\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    const n = parseInt(line);\n    console.log(n % 2 === 0 ? "偶数" : "奇数");\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0002-0000-0000-000000000001', '4', '偶数', true, 1),
  ('b0000002-0002-0000-0000-000000000001', '7', '奇数', false, 2),
  ('b0000002-0002-0000-0000-000000000001', '0', '偶数', false, 3);

-- JS Medium 1: 1からNまでの合計
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0003-0000-0000-000000000001',
  '1からNまでの合計',
  E'## 問題\n\n標準入力から正の整数Nを読み取り、1からNまでの合計を出力してください。\n\n### 入力\n```\nN\n```\n- N は正の整数 (1 ≤ N ≤ 10000)\n\n### 出力\n```\n1 + 2 + ... + N の結果\n```\n\n### 例\n入力: `5`\n出力: `15`',
  'medium', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    // ここにコードを書いてください\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    const n = parseInt(line);\n    let sum = 0;\n    for (let i = 1; i <= n; i++) {\n        sum += i;\n    }\n    console.log(sum);\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0003-0000-0000-000000000001', '5', '15', true, 1),
  ('b0000002-0003-0000-0000-000000000001', '100', '5050', false, 2),
  ('b0000002-0003-0000-0000-000000000001', '1', '1', false, 3);

-- JS Medium 2: 配列の最大値
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0004-0000-0000-000000000001',
  '配列の最大値',
  E'## 問題\n\n最初の行に配列の要素数N、次の行にN個の整数が与えられます。最大値を出力してください。\n\n### 入力\n```\nN\na1 a2 ... aN\n```\n- 1 ≤ N ≤ 100\n- -10000 ≤ ai ≤ 10000\n\n### 出力\n```\n最大値\n```\n\n### 例\n入力:\n```\n4\n3 7 2 8\n```\n出力: `8`',
  'medium', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\nconst lines = [];\n\nrl.on("line", (line) => {\n    lines.push(line);\n});\n\nrl.on("close", () => {\n    // ここにコードを書いてください\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\nconst lines = [];\n\nrl.on("line", (line) => {\n    lines.push(line);\n});\n\nrl.on("close", () => {\n    const nums = lines[1].split(" ").map(Number);\n    console.log(Math.max(...nums));\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0004-0000-0000-000000000001', E'4\n3 7 2 8', '8', true, 1),
  ('b0000002-0004-0000-0000-000000000001', E'3\n-5 -2 -10', '-2', false, 2),
  ('b0000002-0004-0000-0000-000000000001', E'1\n42', '42', false, 3);

-- JS Hard 1: 文字列の反転
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0005-0000-0000-000000000001',
  '文字列の反転',
  E'## 問題\n\n標準入力から文字列を読み取り、逆順にして出力してください。\n**Array.reverse()メソッドは使用禁止です。**\n\n### 入力\n```\nS\n```\n- S は英数字のみの文字列 (1 ≤ |S| ≤ 1000)\n\n### 出力\n```\nSを逆順にした文字列\n```\n\n### 例\n入力: `hello`\n出力: `olleh`',
  'hard', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    // ここにコードを書いてください\n    // ※ Array.reverse()は使用禁止\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    let result = "";\n    for (let i = line.length - 1; i >= 0; i--) {\n        result += line[i];\n    }\n    console.log(result);\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0005-0000-0000-000000000001', 'hello', 'olleh', true, 1),
  ('b0000002-0005-0000-0000-000000000001', 'abcdef', 'fedcba', false, 2),
  ('b0000002-0005-0000-0000-000000000001', 'a', 'a', false, 3);

-- JS Hard 2: FizzBuzz
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000002-0006-0000-0000-000000000001',
  'FizzBuzz',
  E'## 問題\n\n標準入力から正の整数Nを読み取り、1からNまで以下のルールで出力してください。\n\n- 3の倍数かつ5の倍数 → `FizzBuzz`\n- 3の倍数 → `Fizz`\n- 5の倍数 → `Buzz`\n- それ以外 → その数字\n\n各出力は改行で区切ってください。\n\n### 入力\n```\nN\n```\n- 1 ≤ N ≤ 100\n\n### 出力\n```\n1からNまでのFizzBuzz結果（各行1つ）\n```\n\n### 例\n入力: `5`\n出力:\n```\n1\n2\nFizz\n4\nBuzz\n```',
  'hard', 'javascript',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    // ここにコードを書いてください\n\n});',
  E'const readline = require("readline");\nconst rl = readline.createInterface({ input: process.stdin });\n\nrl.on("line", (line) => {\n    const n = parseInt(line);\n    for (let i = 1; i <= n; i++) {\n        if (i % 15 === 0) console.log("FizzBuzz");\n        else if (i % 3 === 0) console.log("Fizz");\n        else if (i % 5 === 0) console.log("Buzz");\n        else console.log(i);\n    }\n});',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000002-0006-0000-0000-000000000001', '5', E'1\n2\nFizz\n4\nBuzz', true, 1),
  ('b0000002-0006-0000-0000-000000000001', '15', E'1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz', false, 2),
  ('b0000002-0006-0000-0000-000000000001', '1', '1', false, 3);

-- ============================================================
-- 8. SQL coding_problems (6問) + test_cases
-- ============================================================

-- SQL Easy 1: 基本SELECT
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0001-0000-0000-000000000001',
  '社員の検索',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE employees (\n    id INT PRIMARY KEY,\n    name VARCHAR(50),\n    age INT,\n    department VARCHAR(50)\n);\n\nINSERT INTO employees VALUES\n(1, ''田中'', 28, ''営業''),\n(2, ''鈴木'', 35, ''開発''),\n(3, ''佐藤'', 22, ''営業''),\n(4, ''山田'', 40, ''人事''),\n(5, ''高橋'', 30, ''開発'');\n```\n\n**営業部の社員の名前と年齢を、年齢の昇順で取得してください。**\n\n### 期待される出力\n```\n佐藤|22\n田中|28\n```',
  'easy', 'sql',
  '-- ここにSQLクエリを書いてください\nSELECT ',
  E'SELECT name, age FROM employees WHERE department = ''営業'' ORDER BY age ASC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0001-0000-0000-000000000001', '', E'佐藤|22\n田中|28', true, 1);

-- SQL Easy 2: COUNT
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0002-0000-0000-000000000001',
  '部署別人数',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE employees (\n    id INT PRIMARY KEY,\n    name VARCHAR(50),\n    department VARCHAR(50)\n);\n\nINSERT INTO employees VALUES\n(1, ''田中'', ''営業''),\n(2, ''鈴木'', ''開発''),\n(3, ''佐藤'', ''営業''),\n(4, ''山田'', ''人事''),\n(5, ''高橋'', ''開発''),\n(6, ''伊藤'', ''開発'');\n```\n\n**各部署の人数を、人数の多い順に取得してください。**\n\n### 期待される出力\n```\n開発|3\n営業|2\n人事|1\n```',
  'easy', 'sql',
  '-- ここにSQLクエリを書いてください\nSELECT ',
  E'SELECT department, COUNT(*) as cnt FROM employees GROUP BY department ORDER BY cnt DESC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0002-0000-0000-000000000001', '', E'開発|3\n営業|2\n人事|1', true, 1);

-- SQL Medium 1: JOIN
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0003-0000-0000-000000000001',
  '注文と顧客の結合',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE customers (\n    id INT PRIMARY KEY,\n    name VARCHAR(50)\n);\n\nCREATE TABLE orders (\n    id INT PRIMARY KEY,\n    customer_id INT,\n    product VARCHAR(50),\n    amount INT\n);\n\nINSERT INTO customers VALUES\n(1, ''田中''), (2, ''鈴木''), (3, ''佐藤'');\n\nINSERT INTO orders VALUES\n(1, 1, ''ノートPC'', 80000),\n(2, 1, ''マウス'', 3000),\n(3, 2, ''キーボード'', 8000),\n(4, 3, ''モニター'', 50000);\n```\n\n**顧客名と注文合計金額を、合計金額の降順で取得してください。**\n\n### 期待される出力\n```\n田中|83000\n佐藤|50000\n鈴木|8000\n```',
  'medium', 'sql',
  '-- ここにSQLクエリを書いてください\nSELECT ',
  E'SELECT c.name, SUM(o.amount) as total\nFROM customers c\nINNER JOIN orders o ON c.id = o.customer_id\nGROUP BY c.name\nORDER BY total DESC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0003-0000-0000-000000000001', '', E'田中|83000\n佐藤|50000\n鈴木|8000', true, 1);

-- SQL Medium 2: UPDATE + SELECT
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0004-0000-0000-000000000001',
  '給与の更新',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE employees (\n    id INT PRIMARY KEY,\n    name VARCHAR(50),\n    department VARCHAR(50),\n    salary INT\n);\n\nINSERT INTO employees VALUES\n(1, ''田中'', ''営業'', 300000),\n(2, ''鈴木'', ''開発'', 400000),\n(3, ''佐藤'', ''営業'', 280000),\n(4, ''山田'', ''開発'', 450000);\n```\n\n**開発部の全社員の給与を10%増加させた後、全社員の名前・部署・給与を給与の降順で取得してください。**\n\n### 期待される出力\n```\n山田|開発|495000\n鈴木|開発|440000\n田中|営業|300000\n佐藤|営業|280000\n```',
  'medium', 'sql',
  E'-- ここにSQLクエリを書いてください\n-- ヒント: UPDATEとSELECTの2つのステートメントが必要です\n',
  E'UPDATE employees SET salary = salary * 1.1 WHERE department = ''開発'';\nSELECT name, department, salary FROM employees ORDER BY salary DESC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0004-0000-0000-000000000001', '', E'山田|開発|495000\n鈴木|開発|440000\n田中|営業|300000\n佐藤|営業|280000', true, 1);

-- SQL Hard 1: サブクエリ
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0005-0000-0000-000000000001',
  '平均以上の売上',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE sales (\n    id INT PRIMARY KEY,\n    salesperson VARCHAR(50),\n    region VARCHAR(50),\n    amount INT\n);\n\nINSERT INTO sales VALUES\n(1, ''田中'', ''東京'', 150000),\n(2, ''鈴木'', ''大阪'', 80000),\n(3, ''佐藤'', ''東京'', 200000),\n(4, ''山田'', ''大阪'', 120000),\n(5, ''高橋'', ''福岡'', 90000),\n(6, ''伊藤'', ''東京'', 180000);\n```\n\n**全体の平均売上額以上の売上がある営業担当者の名前と売上額を、売上額の降順で取得してください。**\n\n### 期待される出力\n```\n佐藤|200000\n伊藤|180000\n田中|150000\n```\n\n（全体平均: (150000+80000+200000+120000+90000+180000)/6 = 136666.67）',
  'hard', 'sql',
  '-- ここにSQLクエリを書いてください\nSELECT ',
  E'SELECT salesperson, amount\nFROM sales\nWHERE amount >= (SELECT AVG(amount) FROM sales)\nORDER BY amount DESC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0005-0000-0000-000000000001', '', E'佐藤|200000\n伊藤|180000\n田中|150000', true, 1);

-- SQL Hard 2: 複合クエリ（CASE + GROUP BY）
INSERT INTO coding_problems (id, title, description, difficulty, language, starter_code, solution_code, time_limit_ms, memory_limit_mb)
VALUES (
  'b0000003-0006-0000-0000-000000000001',
  '成績ランク集計',
  E'## 問題\n\n以下のテーブルが定義されています。\n\n```sql\nCREATE TABLE scores (\n    id INT PRIMARY KEY,\n    student_name VARCHAR(50),\n    subject VARCHAR(50),\n    score INT\n);\n\nINSERT INTO scores VALUES\n(1, ''田中'', ''数学'', 95),\n(2, ''田中'', ''英語'', 78),\n(3, ''鈴木'', ''数学'', 62),\n(4, ''鈴木'', ''英語'', 85),\n(5, ''佐藤'', ''数学'', 45),\n(6, ''佐藤'', ''英語'', 90),\n(7, ''山田'', ''数学'', 88),\n(8, ''山田'', ''英語'', 72);\n```\n\n**各生徒の平均点を計算し、以下のランクを付けて出力してください。**\n- 80点以上: A\n- 60点以上80点未満: B\n- 60点未満: C\n\n**生徒名・平均点・ランクを、平均点の降順で取得してください。**\n\n### 期待される出力\n```\n田中|86|A\n佐藤|67|B\n山田|80|A\n鈴木|73|B\n```\n\n※ 平均点は整数に切り捨てること（小数点以下切り捨て）',
  'hard', 'sql',
  '-- ここにSQLクエリを書いてください\nSELECT ',
  E'SELECT student_name,\n       CAST(AVG(score) AS INT) as avg_score,\n       CASE\n           WHEN AVG(score) >= 80 THEN ''A''\n           WHEN AVG(score) >= 60 THEN ''B''\n           ELSE ''C''\n       END as rank\nFROM scores\nGROUP BY student_name\nORDER BY avg_score DESC;',
  5000, 256
);
INSERT INTO coding_test_cases (problem_id, input, expected_output, is_sample, sort_order) VALUES
  ('b0000003-0006-0000-0000-000000000001', '', E'田中|86|A\n山田|80|A\n鈴木|73|B\n佐藤|67|B', true, 1);

END
$mig$;

COMMIT;
