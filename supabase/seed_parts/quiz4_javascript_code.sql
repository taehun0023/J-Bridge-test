-- ============================================
-- Quiz 4 追加: JavaScriptコード出力問題 (30 questions)
-- Category: javascript_code
-- sort_order: 121-150
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== javascript_code - EASY (10) =====

  -- Q121: typeof null
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(typeof null);', 'typeof nullは歴史的なバグにより"object"を返す。これはJavaScript初期の実装上の誤りだが、互換性のため仕様として残されている。', 1, 121, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"null"', FALSE, 1),
    (gen_random_uuid(), q_id, '"undefined"', FALSE, 2),
    (gen_random_uuid(), q_id, '"string"', FALSE, 3),
    (gen_random_uuid(), q_id, '"object"', TRUE, 4);

  -- Q122: 文字列と数値の+演算子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log("5" + 3);', '+演算子の片方が文字列の場合、もう片方も文字列に変換されて結合される。"5" + 3は"5" + "3"となり"53"が出力される。', 1, 122, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"53"', TRUE, 1),
    (gen_random_uuid(), q_id, '8', FALSE, 2),
    (gen_random_uuid(), q_id, 'NaN', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q123: テンプレートリテラルの式評価
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst a = 3;\nconst b = 4;\nconsole.log(`${a + b} = ${a} + ${b}`);', 'テンプレートリテラル内の${...}は式として評価される。${a + b}は7に、${a}は3に、${b}は4に評価され、"7 = 3 + 4"が出力される。', 1, 123, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"3 + 4 = 3 + 4"', FALSE, 1),
    (gen_random_uuid(), q_id, '"7 = 7"', FALSE, 2),
    (gen_random_uuid(), q_id, '"7 = 3 + 4"', TRUE, 3),
    (gen_random_uuid(), q_id, 'SyntaxError', FALSE, 4);

  -- Q124: 配列のlengthと疎な配列
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst arr = [1, , 3];\nconsole.log(arr.length);', '配列[1, , 3]はインデックス1が空（hole）の疎な配列である。しかしlengthは最大インデックス+1で計算されるため、3が返される。', 1, 124, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2', FALSE, 1),
    (gen_random_uuid(), q_id, '4', FALSE, 2),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 3),
    (gen_random_uuid(), q_id, '3', TRUE, 4);

  -- Q125: if/elseと型変換
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nif ("") {\n  console.log("A");\n} else if (0) {\n  console.log("B");\n} else if ("0") {\n  console.log("C");\n} else {\n  console.log("D");\n}', '空文字列""と数値0はfalsyな値である。文字列"0"は空でない文字列なのでtruthyである。最初にtruthyと判定される"0"の条件でCが出力される。', 1, 125, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A', FALSE, 1),
    (gen_random_uuid(), q_id, 'B', FALSE, 2),
    (gen_random_uuid(), q_id, 'D', FALSE, 3),
    (gen_random_uuid(), q_id, 'C', TRUE, 4);

  -- Q126: forループの合計
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nlet sum = 0;\nfor (let i = 1; i <= 4; i++) {\n  sum += i;\n}\nconsole.log(sum);', 'ループはi=1,2,3,4で実行される。sum = 0 + 1 + 2 + 3 + 4 = 10が出力される。', 1, 126, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4', FALSE, 1),
    (gen_random_uuid(), q_id, '10', TRUE, 2),
    (gen_random_uuid(), q_id, '15', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- Q127: parseIntの先頭パース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(parseInt("42abc"));', 'parseInt()は文字列の先頭から数値として解釈できる部分までを変換する。"42abc"の先頭"42"が数値に変換され42が返される。', 1, 127, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NaN', FALSE, 1),
    (gen_random_uuid(), q_id, '42', TRUE, 2),
    (gen_random_uuid(), q_id, '42abc', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q128: Math.floorの負の数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(Math.floor(-2.3));', 'Math.floor()は引数以下の最大の整数を返す（負の無限大方向への切り捨て）。-2.3以下の最大整数は-3である。-2ではない点に注意。', 1, 128, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '-3', TRUE, 1),
    (gen_random_uuid(), q_id, '-2', FALSE, 2),
    (gen_random_uuid(), q_id, '-2.0', FALSE, 3),
    (gen_random_uuid(), q_id, 'NaN', FALSE, 4);

  -- Q129: ==と===の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(null == undefined, null === undefined);', 'null == undefinedはtrue（仕様でnullとundefinedは緩い等価で等しいと定義されている）。null === undefinedはfalse（型が異なるため）。', 1, 129, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true true', FALSE, 1),
    (gen_random_uuid(), q_id, 'false false', FALSE, 2),
    (gen_random_uuid(), q_id, 'true false', TRUE, 3),
    (gen_random_uuid(), q_id, 'false true', FALSE, 4);

  -- Q130: Boolean変換とfalsyな値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst str = "hello";\nstr.toUpperCase();\nconsole.log(str);', '文字列はJavaScriptでイミュータブル（不変）である。toUpperCase()は新しい文字列を返すが、戻り値を変数に代入していないため、元のstrは変更されずそのまま出力される。', 1, 130, 'easy', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"hello"', TRUE, 1),
    (gen_random_uuid(), q_id, '"HELLO"', FALSE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, '"Hello"', FALSE, 4);

  -- ===== javascript_code - MEDIUM (10) =====

  -- Q131: クロージャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nfunction outer() {\n  let count = 0;\n  return function() {\n    count++;\n    return count;\n  };\n}\nconst fn = outer();\nconsole.log(fn(), fn(), fn());', 'クロージャにより内部関数はouter()のcount変数への参照を保持する。fn()を呼ぶたびにcountがインクリメントされ、1, 2, 3が順に返される。', 1, 131, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0 1 2', FALSE, 1),
    (gen_random_uuid(), q_id, '1 1 1', FALSE, 2),
    (gen_random_uuid(), q_id, 'NaN NaN NaN', FALSE, 3),
    (gen_random_uuid(), q_id, '1 2 3', TRUE, 4);

  -- Q132: Array.mapとparseIntの罠
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst result = ["1", "2", "3"].map(parseInt);\nconsole.log(result);', 'map()はコールバックに(value, index, array)を渡す。parseInt("1", 0)=1（基数0は10として扱われる）、parseInt("2", 1)=NaN（基数1は無効）、parseInt("3", 2)=NaN（2進数に3は存在しない）。', 1, 132, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, NaN, NaN]', TRUE, 1),
    (gen_random_uuid(), q_id, '[1, 2, 3]', FALSE, 2),
    (gen_random_uuid(), q_id, '[NaN, NaN, NaN]', FALSE, 3),
    (gen_random_uuid(), q_id, '["1", "2", "3"]', FALSE, 4);

  -- Q133: Array.reduceの合計
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst nums = [1, 2, 3, 4];\nconst sum = nums.reduce((acc, cur) => acc + cur, 0);\nconsole.log(sum);', 'reduce()は初期値0から始めて各要素を順に加算する。0+1=1、1+2=3、3+3=6、6+4=10。最終結果は10。', 1, 133, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10', TRUE, 1),
    (gen_random_uuid(), q_id, '24', FALSE, 2),
    (gen_random_uuid(), q_id, '[1, 3, 6, 10]', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- Q134: オブジェクトの分割代入とデフォルト値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst { a = 10, b = 20 } = { a: 3, b: undefined };\nconsole.log(a, b);', '分割代入のデフォルト値はプロパティがundefinedの場合にのみ適用される。aは3が設定済みなのでそのまま。bはundefinedなのでデフォルト値20が使われる。', 1, 134, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10 20', FALSE, 1),
    (gen_random_uuid(), q_id, '3 20', TRUE, 2),
    (gen_random_uuid(), q_id, '3 undefined', FALSE, 3),
    (gen_random_uuid(), q_id, '10 undefined', FALSE, 4);

  -- Q135: スプレッド演算子の独立性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst a = [1, 2];\nconst b = [...a, 3];\na.push(4);\nconsole.log(b);', 'スプレッド演算子は配列のシャローコピーを作成する。bは[1, 2, 3]として作成された時点でaとは独立した配列になるため、その後のa.push(4)はbに影響しない。', 1, 135, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, 2, 3]', TRUE, 1),
    (gen_random_uuid(), q_id, '[1, 2, 3, 4]', FALSE, 2),
    (gen_random_uuid(), q_id, '[1, 2, 4, 3]', FALSE, 3),
    (gen_random_uuid(), q_id, '[1, 2]', FALSE, 4);

  -- Q136: Promiseマイクロタスクの順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力順序は何か。\n\nconsole.log("A");\nPromise.resolve().then(() => console.log("B"));\nconsole.log("C");', 'Promise.then()のコールバックはマイクロタスクキューに入れられ、現在の同期コードの実行が完了した後に実行される。よってA → C → Bの順に出力される。', 1, 136, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A B C', FALSE, 1),
    (gen_random_uuid(), q_id, 'A C B', TRUE, 2),
    (gen_random_uuid(), q_id, 'B A C', FALSE, 3),
    (gen_random_uuid(), q_id, 'C A B', FALSE, 4);

  -- Q137: Setの重複除去
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst s = new Set([1, 2, 2, 3, 3, 3]);\nconsole.log([...s]);', 'Setは重複を許さないコレクションである。配列[1, 2, 2, 3, 3, 3]からSetを作成すると重複が除去され{1, 2, 3}となる。スプレッド演算子で配列に変換すると[1, 2, 3]。', 1, 137, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, 2, 2, 3, 3, 3]', FALSE, 1),
    (gen_random_uuid(), q_id, '[1, 2, 3]', TRUE, 2),
    (gen_random_uuid(), q_id, '[3, 2, 1]', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', FALSE, 4);

  -- Q138: Null合体演算子(??)と||の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst a = 0;\nconsole.log(a || "default", a ?? "default");', '||は左辺がfalsyなら右辺を返す。0はfalsyなので"default"が返される。??は左辺がnullまたはundefinedの場合のみ右辺を返す。0はnullでもundefinedでもないので0がそのまま返される。', 1, 138, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0 0', FALSE, 1),
    (gen_random_uuid(), q_id, '"default" "default"', FALSE, 2),
    (gen_random_uuid(), q_id, '"default" 0', TRUE, 3),
    (gen_random_uuid(), q_id, '0 "default"', FALSE, 4);

  -- Q139: オプショナルチェイニングとNull合体の組み合わせ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst user = { name: "Alice", address: null };\nconsole.log(user.address?.city ?? "不明");', 'オプショナルチェイニング(?.)はaddressがnullなのでundefinedを返す。Null合体演算子(??)は左辺がundefinedなので右辺の"不明"を返す。', 1, 139, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'null', FALSE, 1),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 2),
    (gen_random_uuid(), q_id, 'TypeError', FALSE, 3),
    (gen_random_uuid(), q_id, '"不明"', TRUE, 4);

  -- Q140: Array.sortの辞書順ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log([10, 9, 80, 1].sort());', 'Array.sort()は比較関数を指定しない場合、要素を文字列に変換してUTF-16コード順で並べ替える。文字列比較で"1" < "10" < "80" < "9"となるため[1, 10, 80, 9]が出力される。', 1, 140, 'medium', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, 9, 10, 80]', FALSE, 1),
    (gen_random_uuid(), q_id, '[1, 10, 80, 9]', TRUE, 2),
    (gen_random_uuid(), q_id, '[80, 10, 9, 1]', FALSE, 3),
    (gen_random_uuid(), q_id, '[1, 10, 9, 80]', FALSE, 4);

  -- ===== javascript_code - HARD (10) =====

  -- Q141: イベントループ - setTimeout vs Promise
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力順序は何か。\n\nconsole.log("1");\nsetTimeout(() => console.log("2"), 0);\nPromise.resolve().then(() => console.log("3"));\nconsole.log("4");', 'まず同期コード"1"と"4"が実行される。次にマイクロタスクキューのPromise.then("3")が実行され、最後にマクロタスクのsetTimeout("2")が実行される。出力順は1 4 3 2。', 1, 141, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1 2 3 4', FALSE, 1),
    (gen_random_uuid(), q_id, '1 4 2 3', FALSE, 2),
    (gen_random_uuid(), q_id, '1 4 3 2', TRUE, 3),
    (gen_random_uuid(), q_id, '1 3 4 2', FALSE, 4);

  -- Q142: プロトタイプチェーンとhasOwnProperty
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nfunction Animal(name) {\n  this.name = name;\n}\nAnimal.prototype.speak = function() {\n  return this.name;\n};\nconst dog = new Animal("犬");\nconsole.log(dog.hasOwnProperty("name"), dog.hasOwnProperty("speak"));', 'nameはコンストラクタでthisに直接設定されるため、dogオブジェクト自身のプロパティである（true）。speakはAnimal.prototypeに定義されているため、dog自身のプロパティではない（false）。', 1, 142, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true true', FALSE, 1),
    (gen_random_uuid(), q_id, 'true false', TRUE, 2),
    (gen_random_uuid(), q_id, 'false true', FALSE, 3),
    (gen_random_uuid(), q_id, 'false false', FALSE, 4);

  -- Q143: ジェネレータ関数とreturn
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nfunction* gen() {\n  yield 1;\n  yield 2;\n  return 3;\n}\nconst g = gen();\nconsole.log(g.next().value);\nconsole.log(g.next().value);\nconsole.log(g.next().done);\nconsole.log(g.next().value);', 'ジェネレータはnext()でyieldまで実行する。1回目: {value:1, done:false}、2回目: {value:2, done:false}、3回目: return 3で{value:3, done:true}、4回目: 完了済みなので{value:undefined, done:true}。', 1, 143, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1 2 false undefined', FALSE, 1),
    (gen_random_uuid(), q_id, '1 2 true 3', FALSE, 2),
    (gen_random_uuid(), q_id, '1 2 true undefined', TRUE, 3),
    (gen_random_uuid(), q_id, '1 2 false 3', FALSE, 4);

  -- Q144: Symbol
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst s1 = Symbol("id");\nconst s2 = Symbol("id");\nconsole.log(s1 === s2);\nconsole.log(typeof s1);', 'Symbolは呼び出すたびに一意の値を生成する。同じ説明文字列"id"を持っていても、s1とs2は異なるSymbolである。typeofは"symbol"を返す。', 1, 144, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true "symbol"', FALSE, 1),
    (gen_random_uuid(), q_id, 'false "object"', FALSE, 2),
    (gen_random_uuid(), q_id, 'true "string"', FALSE, 3),
    (gen_random_uuid(), q_id, 'false "symbol"', TRUE, 4);

  -- Q145: varのホイスティングとTDZ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(a);\nconsole.log(b);\nvar a = 1;\nlet b = 2;', 'var宣言はホイスティングされ初期値undefinedが設定されるため、最初のconsole.logはundefinedを出力する。let宣言もホイスティングされるが、TDZ（Temporal Dead Zone）により初期化前のアクセスはReferenceErrorになる。', 1, 145, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'undefinedの後にReferenceError', TRUE, 1),
    (gen_random_uuid(), q_id, 'undefined undefined', FALSE, 2),
    (gen_random_uuid(), q_id, 'ReferenceError（1行目で発生）', FALSE, 3),
    (gen_random_uuid(), q_id, '1 2', FALSE, 4);

  -- Q146: IIFE（即時実行関数式）によるループ変数キャプチャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst funcs = [];\nfor (var i = 0; i < 3; i++) {\n  funcs.push((function(j) {\n    return function() { return j; };\n  })(i));\n}\nconsole.log(funcs[0](), funcs[1](), funcs[2]());', 'IIFEを使いループ変数iの値を引数jとして各反復でキャプチャしている。varを使ってもIIFEで値を閉じ込めるため、各関数はそれぞれ0, 1, 2を保持する。', 1, 146, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3 3 3', FALSE, 1),
    (gen_random_uuid(), q_id, '0 0 0', FALSE, 2),
    (gen_random_uuid(), q_id, '0 1 2', TRUE, 3),
    (gen_random_uuid(), q_id, 'undefined undefined undefined', FALSE, 4);

  -- Q147: thisバインディング（アロー関数 vs 通常関数）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst obj = {\n  value: 100,\n  getValue: () => this.value\n};\nconsole.log(obj.getValue());', 'アロー関数は定義時のスコープのthisをキャプチャする。オブジェクトリテラルはスコープを作成しないため、thisはグローバルスコープのthisを指す。グローバルスコープにvalueは存在しないのでundefined。', 1, 147, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '100', FALSE, 1),
    (gen_random_uuid(), q_id, 'null', FALSE, 2),
    (gen_random_uuid(), q_id, 'TypeError', FALSE, 3),
    (gen_random_uuid(), q_id, 'undefined', TRUE, 4);

  -- Q148: マイクロタスク vs マクロタスクキューの処理順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力順序は何か。\n\nsetTimeout(() => console.log("A"), 0);\nPromise.resolve()\n  .then(() => console.log("B"))\n  .then(() => console.log("C"));\nsetTimeout(() => console.log("D"), 0);', 'マイクロタスク（Promise.then）はマクロタスク（setTimeout）より優先される。全マイクロタスク完了後にマクロタスクが処理される。B→C（マイクロタスク）→A→D（マクロタスク、登録順）。', 1, 148, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A B C D', FALSE, 1),
    (gen_random_uuid(), q_id, 'B A C D', FALSE, 2),
    (gen_random_uuid(), q_id, 'B C A D', TRUE, 3),
    (gen_random_uuid(), q_id, 'A D B C', FALSE, 4);

  -- Q149: NaNの特性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconsole.log(NaN === NaN);\nconsole.log(Number.isNaN(NaN));\nconsole.log(isNaN("hello"));', 'NaN === NaNはfalse（NaNは自身と等しくない唯一の値）。Number.isNaN(NaN)はtrue（厳密にNaNか判定）。isNaN("hello")はtrue（引数を数値変換しNumber("hello")がNaNになるため）。', 1, 149, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true true true', FALSE, 1),
    (gen_random_uuid(), q_id, 'false true true', TRUE, 2),
    (gen_random_uuid(), q_id, 'false true false', FALSE, 3),
    (gen_random_uuid(), q_id, 'false false true', FALSE, 4);

  -- Q150: Proxyのgetトラップ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaScriptコードの出力は何か。\n\nconst handler = {\n  get(target, prop) {\n    return prop in target ? target[prop] : -1;\n  }\n};\nconst obj = new Proxy({ x: 1, y: 2 }, handler);\nconsole.log(obj.x + obj.z);', 'Proxyのgetトラップはプロパティアクセス時に呼ばれる。obj.xはtargetに存在するので1が返る。obj.zは存在しないので-1が返る。1 + (-1) = 0が出力される。', 1, 150, 'hard', 'javascript_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NaN', FALSE, 1),
    (gen_random_uuid(), q_id, '1', FALSE, 2),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 3),
    (gen_random_uuid(), q_id, '0', TRUE, 4);

END $$;
