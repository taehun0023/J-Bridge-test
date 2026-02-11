-- ============================================
-- Quiz 4 追加: Javaコード出力問題 (30 questions)
-- Category: java_code
-- sort_order: 91-120
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== java_code - EASY (10) =====

  -- Q91: 基本的な算術演算
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    int x = 10;\n    System.out.println(x + 5);\n  }\n}', '変数xに10が代入され、x + 5 = 15が計算されてprintlnで出力される。int同士の加算なので数値の加算となる。', 1, 91, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10', FALSE, 1),
    (gen_random_uuid(), q_id, '15', TRUE, 2),
    (gen_random_uuid(), q_id, '105', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q92: 文字列結合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    String s = "Hello";\n    System.out.println(s + " World");\n  }\n}', 'String同士の+演算子は文字列結合を行う。"Hello"と" World"が結合され"Hello World"が出力される。', 1, 92, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello World', TRUE, 1),
    (gen_random_uuid(), q_id, 'HelloWorld', FALSE, 2),
    (gen_random_uuid(), q_id, 'Hello + World', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q93: int型のキャスト（小数の切り捨て）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    double d = 9.7;\n    int n = (int) d;\n    System.out.println(n);\n  }\n}', 'double型からint型へのキャストは小数部分を切り捨てる（四捨五入ではない）。9.7の小数部分が切り捨てられ9が出力される。', 1, 93, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10', FALSE, 1),
    (gen_random_uuid(), q_id, '9.7', FALSE, 2),
    (gen_random_uuid(), q_id, '9', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q94: if-else文
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    int a = 3;\n    if (a > 5) {\n      System.out.println("big");\n    } else {\n      System.out.println("small");\n    }\n  }\n}', 'a = 3であり、3 > 5はfalseなのでelseブロックが実行され"small"が出力される。', 1, 94, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'big', FALSE, 1),
    (gen_random_uuid(), q_id, 'small', TRUE, 2),
    (gen_random_uuid(), q_id, 'bigsmall', FALSE, 3),
    (gen_random_uuid(), q_id, '何も出力されない', FALSE, 4);

  -- Q95: forループの出力
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    String result = "";\n    for (int i = 0; i < 3; i++) {\n      result += i;\n    }\n    System.out.println(result);\n  }\n}', 'ループでiは0, 1, 2と変化する。Stringに+=でintを結合すると文字列結合になるため、"" + 0 + 1 + 2 = "012"が出力される。', 1, 95, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3', FALSE, 1),
    (gen_random_uuid(), q_id, '012', TRUE, 2),
    (gen_random_uuid(), q_id, '123', FALSE, 3),
    (gen_random_uuid(), q_id, '0 1 2', FALSE, 4);

  -- Q96: 配列アクセス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    int[] arr = {10, 20, 30, 40};\n    System.out.println(arr[2]);\n  }\n}', '配列のインデックスは0から始まる。arr[0]=10, arr[1]=20, arr[2]=30なので、arr[2]は30が出力される。', 1, 96, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '20', FALSE, 1),
    (gen_random_uuid(), q_id, '40', FALSE, 2),
    (gen_random_uuid(), q_id, '30', TRUE, 3),
    (gen_random_uuid(), q_id, 'ArrayIndexOutOfBoundsException', FALSE, 4);

  -- Q97: メソッド呼び出し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  static int add(int a, int b) {\n    return a + b;\n  }\n  public static void main(String[] args) {\n    System.out.println(add(3, 7));\n  }\n}', 'addメソッドに3と7を渡すと、3 + 7 = 10が返される。その値がprintlnで出力される。', 1, 97, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10', TRUE, 1),
    (gen_random_uuid(), q_id, '37', FALSE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q98: Stringのlength()メソッド
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    String s = "Java";\n    System.out.println(s.length());\n  }\n}', 'String.length()は文字列の文字数を返す。"Java"は4文字なので4が出力される。', 1, 98, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3', FALSE, 1),
    (gen_random_uuid(), q_id, '5', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, '4', TRUE, 4);

  -- Q99: 三項演算子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    int x = 8;\n    String result = (x % 2 == 0) ? "even" : "odd";\n    System.out.println(result);\n  }\n}', 'x = 8、8 % 2 = 0なので条件は true。三項演算子により"even"がresultに代入され出力される。', 1, 99, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'odd', FALSE, 1),
    (gen_random_uuid(), q_id, 'even', TRUE, 2),
    (gen_random_uuid(), q_id, '0', FALSE, 3),
    (gen_random_uuid(), q_id, 'true', FALSE, 4);

  -- Q100: 前置・後置インクリメント
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    int a = 5;\n    int b = a++;\n    int c = ++a;\n    System.out.println(b + " " + c);\n  }\n}', 'a++ は後置インクリメント。b に現在の a の値5が代入された後、a が6になる。++a は前置インクリメント。a が7になった後、c に7が代入される。結果は"5 7"。', 1, 100, 'easy', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5 6', FALSE, 1),
    (gen_random_uuid(), q_id, '6 7', FALSE, 2),
    (gen_random_uuid(), q_id, '5 7', TRUE, 3),
    (gen_random_uuid(), q_id, '6 8', FALSE, 4);

  -- ===== java_code - MEDIUM (10) =====

  -- Q101: ArrayListの操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.ArrayList;\npublic class Main {\n  public static void main(String[] args) {\n    ArrayList<String> list = new ArrayList<>();\n    list.add("A");\n    list.add("B");\n    list.add("C");\n    list.remove(1);\n    System.out.println(list);\n  }\n}', 'list.remove(1)はインデックス1の要素"B"を削除する。残りは["A", "C"]となり、ArrayListのtoString()で[A, C]が出力される。', 2, 101, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[A, B]', FALSE, 1),
    (gen_random_uuid(), q_id, '[A, C]', TRUE, 2),
    (gen_random_uuid(), q_id, '[B, C]', FALSE, 3),
    (gen_random_uuid(), q_id, '[A, B, C]', FALSE, 4);

  -- Q102: 継承とポリモーフィズム
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nclass Animal {\n  String speak() { return "..."; }\n}\nclass Dog extends Animal {\n  String speak() { return "Woof"; }\n}\npublic class Main {\n  public static void main(String[] args) {\n    Animal a = new Dog();\n    System.out.println(a.speak());\n  }\n}', '変数の型はAnimalだが、実際のオブジェクトはDogである。メソッド呼び出しは実行時の型（Dog）で解決されるため、Dogのspeak()が呼ばれ"Woof"が出力される。これがポリモーフィズムである。', 2, 102, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '...', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 2),
    (gen_random_uuid(), q_id, 'Woof', TRUE, 3),
    (gen_random_uuid(), q_id, 'null', FALSE, 4);

  -- Q103: インターフェースの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\ninterface Greeter {\n  default String greet() { return "Hello"; }\n}\nclass JapaneseGreeter implements Greeter {\n  public String greet() { return "こんにちは"; }\n}\npublic class Main {\n  public static void main(String[] args) {\n    Greeter g = new JapaneseGreeter();\n    System.out.println(g.greet());\n  }\n}', 'JapaneseGreeterはGreeterインターフェースのdefaultメソッドgreet()をオーバーライドしている。実行時の型はJapaneseGreeterなので"こんにちは"が出力される。', 2, 103, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello', FALSE, 1),
    (gen_random_uuid(), q_id, 'こんにちは', TRUE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'null', FALSE, 4);

  -- Q104: StringBuilderの操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    StringBuilder sb = new StringBuilder("Hello");\n    sb.append(" World");\n    sb.insert(5, ",");\n    System.out.println(sb);\n  }\n}', 'sb.append(" World")で"Hello World"になる。sb.insert(5, ",")はインデックス5の位置に","を挿入するので"Hello, World"が出力される。', 2, 104, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello World', FALSE, 1),
    (gen_random_uuid(), q_id, 'Hello, World', TRUE, 2),
    (gen_random_uuid(), q_id, ',Hello World', FALSE, 3),
    (gen_random_uuid(), q_id, 'Hello ,World', FALSE, 4);

  -- Q105: try-catch例外処理
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    try {\n      int[] arr = {1, 2, 3};\n      System.out.println(arr[5]);\n      System.out.println("OK");\n    } catch (ArrayIndexOutOfBoundsException e) {\n      System.out.println("Error");\n    } finally {\n      System.out.println("Done");\n    }\n  }\n}', 'arr[5]は配列の範囲外アクセスでArrayIndexOutOfBoundsExceptionが発生する。"OK"は実行されず、catchブロックで"Error"が出力される。finallyブロックは常に実行されるため"Done"も出力される。', 2, 105, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'OK\nDone', FALSE, 1),
    (gen_random_uuid(), q_id, 'Error', FALSE, 2),
    (gen_random_uuid(), q_id, 'Error\nDone', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q106: HashMapの操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.HashMap;\npublic class Main {\n  public static void main(String[] args) {\n    HashMap<String, Integer> map = new HashMap<>();\n    map.put("a", 1);\n    map.put("b", 2);\n    map.put("a", 3);\n    System.out.println(map.get("a"));\n  }\n}', 'HashMapでは同じキーに対してputすると値が上書きされる。キー"a"は最初1が設定され、その後3で上書きされるため、get("a")は3を返す。', 2, 106, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '2', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, '3', TRUE, 4);

  -- Q107: オートボクシング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    Integer a = 127;\n    Integer b = 127;\n    Integer c = 128;\n    Integer d = 128;\n    System.out.println((a == b) + " " + (c == d));\n  }\n}', 'Javaでは-128から127までのIntegerオブジェクトはキャッシュされるため、a == bはtrue（同一オブジェクト）。128はキャッシュ範囲外なので新しいオブジェクトが生成され、c == dはfalse。', 2, 107, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true true', FALSE, 1),
    (gen_random_uuid(), q_id, 'false false', FALSE, 2),
    (gen_random_uuid(), q_id, 'true false', TRUE, 3),
    (gen_random_uuid(), q_id, 'false true', FALSE, 4);

  -- Q108: Stringの==比較とequals比較
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  public static void main(String[] args) {\n    String s1 = "Hello";\n    String s2 = new String("Hello");\n    System.out.println(s1 == s2);\n    System.out.println(s1.equals(s2));\n  }\n}', 's1はStringプール内のオブジェクトを参照し、s2はnewで生成された別のオブジェクト。==は参照比較なのでfalse。equals()は内容比較なのでtrue。', 2, 108, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true\ntrue', FALSE, 1),
    (gen_random_uuid(), q_id, 'false\nfalse', FALSE, 2),
    (gen_random_uuid(), q_id, 'false\ntrue', TRUE, 3),
    (gen_random_uuid(), q_id, 'true\nfalse', FALSE, 4);

  -- Q109: static変数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nclass Counter {\n  static int count = 0;\n  Counter() { count++; }\n}\npublic class Main {\n  public static void main(String[] args) {\n    new Counter();\n    new Counter();\n    new Counter();\n    System.out.println(Counter.count);\n  }\n}', 'static変数countはクラスに属し、すべてのインスタンスで共有される。コンストラクタが3回呼ばれるため、countは0→1→2→3となり、3が出力される。', 2, 109, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '0', FALSE, 2),
    (gen_random_uuid(), q_id, '3', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q110: メソッドオーバーロード
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  static String greet(String name) {\n    return "Hello, " + name;\n  }\n  static String greet(String name, int times) {\n    return name + " x" + times;\n  }\n  public static void main(String[] args) {\n    System.out.println(greet("Java"));\n    System.out.println(greet("Java", 3));\n  }\n}', 'メソッドオーバーロードにより引数の数で呼び出すメソッドが決まる。greet("Java")は1引数版で"Hello, Java"、greet("Java", 3)は2引数版で"Java x3"が出力される。', 2, 110, 'medium', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello, Java\nJava x3', TRUE, 1),
    (gen_random_uuid(), q_id, 'Hello, Java\nHello, Java', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'Hello, Java\nJava x 3', FALSE, 4);

  -- ===== java_code - HARD (10) =====

  -- Q111: ジェネリクス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nclass Box<T> {\n  private T value;\n  Box(T value) { this.value = value; }\n  T get() { return value; }\n}\npublic class Main {\n  public static void main(String[] args) {\n    Box<Integer> box = new Box<>(42);\n    System.out.println(box.get() + 8);\n  }\n}', 'Box<Integer>のget()はInteger型の42を返す。42 + 8はアンボクシングされて50が計算され出力される。', 3, 111, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '42', FALSE, 1),
    (gen_random_uuid(), q_id, '50', TRUE, 2),
    (gen_random_uuid(), q_id, '428', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q112: ラムダ式
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.function.Function;\npublic class Main {\n  public static void main(String[] args) {\n    Function<Integer, Integer> square = x -> x * x;\n    Function<Integer, Integer> doubleIt = x -> x * 2;\n    System.out.println(square.andThen(doubleIt).apply(3));\n  }\n}', 'andThenは最初の関数の結果を次の関数に渡す。square.apply(3) = 9、次にdoubleIt.apply(9) = 18。結果は18が出力される。', 3, 112, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '12', FALSE, 1),
    (gen_random_uuid(), q_id, '36', FALSE, 2),
    (gen_random_uuid(), q_id, '18', TRUE, 3),
    (gen_random_uuid(), q_id, '9', FALSE, 4);

  -- Q113: Stream APIの出力
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.Arrays;\nimport java.util.List;\nimport java.util.stream.Collectors;\npublic class Main {\n  public static void main(String[] args) {\n    List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5);\n    List<Integer> result = nums.stream()\n      .filter(n -> n % 2 == 0)\n      .map(n -> n * 10)\n      .collect(Collectors.toList());\n    System.out.println(result);\n  }\n}', 'filter(n -> n % 2 == 0)で偶数2, 4が残る。map(n -> n * 10)で20, 40に変換される。結果は[20, 40]が出力される。', 3, 113, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[10, 20, 30, 40, 50]', FALSE, 1),
    (gen_random_uuid(), q_id, '[2, 4]', FALSE, 2),
    (gen_random_uuid(), q_id, '[20, 40]', TRUE, 3),
    (gen_random_uuid(), q_id, '[10, 30, 50]', FALSE, 4);

  -- Q114: スレッドの基本動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードについて正しい説明はどれか。\n\npublic class Main {\n  public static void main(String[] args) {\n    Runnable task = () -> System.out.println("Task");\n    Thread t = new Thread(task);\n    t.start();\n    System.out.println("Main");\n  }\n}', 't.start()は新しいスレッドを開始するが、mainスレッドは並行して実行を続ける。"Task"と"Main"の出力順序はスレッドスケジューリングに依存するため不定である。', 3, 114, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '必ず"Task"が先に出力される', FALSE, 1),
    (gen_random_uuid(), q_id, '必ず"Main"が先に出力される', FALSE, 2),
    (gen_random_uuid(), q_id, '"Task"と"Main"の出力順序は不定', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', FALSE, 4);

  -- Q115: 内部クラス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\npublic class Main {\n  private String msg = "Outer";\n  class Inner {\n    private String msg = "Inner";\n    void print() {\n      System.out.println(this.msg);\n      System.out.println(Main.this.msg);\n    }\n  }\n  public static void main(String[] args) {\n    Main outer = new Main();\n    Main.Inner inner = outer.new Inner();\n    inner.print();\n  }\n}', 'this.msgは内部クラスのフィールド"Inner"を参照する。Main.this.msgは外部クラスのフィールド"Outer"を参照する。結果は"Inner"と"Outer"が順に出力される。', 3, 115, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Outer\nOuter', FALSE, 1),
    (gen_random_uuid(), q_id, 'Inner\nInner', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'Inner\nOuter', TRUE, 4);

  -- Q116: enumの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nenum Color {\n  RED(1), GREEN(2), BLUE(3);\n  private final int code;\n  Color(int code) { this.code = code; }\n  int getCode() { return code; }\n}\npublic class Main {\n  public static void main(String[] args) {\n    System.out.println(Color.GREEN.getCode());\n    System.out.println(Color.BLUE.name());\n  }\n}', 'Color.GREEN.getCode()はGREENに関連付けられたcode値2を返す。Color.BLUE.name()はenum定数の名前を文字列で返すので"BLUE"が出力される。', 3, 116, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2\nBLUE', TRUE, 1),
    (gen_random_uuid(), q_id, '1\nGREEN', FALSE, 2),
    (gen_random_uuid(), q_id, 'GREEN\n2', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q117: Collections.sortとComparator
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.*;\npublic class Main {\n  public static void main(String[] args) {\n    List<String> list = new ArrayList<>(Arrays.asList("Banana", "Apple", "Cherry"));\n    Collections.sort(list, (a, b) -> b.compareTo(a));\n    System.out.println(list);\n  }\n}', 'Comparatorで(a, b) -> b.compareTo(a)は逆順（降順）ソートを意味する。文字列の自然順序はApple < Banana < Cherryなので、降順にするとCherry, Banana, Appleとなる。', 3, 117, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[Apple, Banana, Cherry]', FALSE, 1),
    (gen_random_uuid(), q_id, '[Cherry, Banana, Apple]', TRUE, 2),
    (gen_random_uuid(), q_id, '[Banana, Apple, Cherry]', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q118: 関数型インターフェース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.function.Predicate;\npublic class Main {\n  public static void main(String[] args) {\n    Predicate<String> isEmpty = String::isEmpty;\n    Predicate<String> notEmpty = isEmpty.negate();\n    System.out.println(isEmpty.test(""));\n    System.out.println(notEmpty.test("Hello"));\n  }\n}', 'isEmpty.test("")は空文字列なのでtrue。notEmptyはisEmptyの否定なので、notEmpty.test("Hello")は「"Hello"が空でない」を意味しtrue。', 3, 118, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true\nfalse', FALSE, 1),
    (gen_random_uuid(), q_id, 'false\ntrue', FALSE, 2),
    (gen_random_uuid(), q_id, 'true\ntrue', TRUE, 3),
    (gen_random_uuid(), q_id, 'false\nfalse', FALSE, 4);

  -- Q119: Stream reduceの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.Arrays;\nimport java.util.List;\npublic class Main {\n  public static void main(String[] args) {\n    List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5);\n    int sum = nums.stream()\n      .reduce(0, (a, b) -> a + b);\n    System.out.println(sum);\n  }\n}', 'reduceは初期値0から始め、各要素を累積的に加算する。0+1=1, 1+2=3, 3+3=6, 6+4=10, 10+5=15。結果は15が出力される。', 3, 119, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10', FALSE, 1),
    (gen_random_uuid(), q_id, '15', TRUE, 2),
    (gen_random_uuid(), q_id, '120', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  -- Q120: 型消去のエッジケース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJavaコードの出力は何か。\n\nimport java.util.*;\npublic class Main {\n  public static void main(String[] args) {\n    List<String> strList = new ArrayList<>();\n    List<Integer> intList = new ArrayList<>();\n    System.out.println(strList.getClass() == intList.getClass());\n    System.out.println(strList.getClass().getName());\n  }\n}', 'Javaのジェネリクスは型消去（type erasure）によりコンパイル時にのみ有効で、実行時にはArrayListとなる。そのため両方のgetClass()はjava.util.ArrayListを返し、==比較はtrue。getName()は"java.util.ArrayList"を返す。', 3, 120, 'hard', 'java_code');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'false\njava.util.ArrayList', FALSE, 1),
    (gen_random_uuid(), q_id, 'true\njava.util.List', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'true\njava.util.ArrayList', TRUE, 4);

END $$;
