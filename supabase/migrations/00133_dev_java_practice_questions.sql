-- ============================================================
-- Dev Practice Quiz: Java 理解度テスト問題 (20 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000001
-- 4 topic areas × 5 questions each
-- Difficulty: easy 6, medium 10, hard 4 (30/50/20 ratio)
-- ============================================================

-- 1) Source quiz record (non-pool, non-assessment)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000001', 'Java 理解度テスト問題', 'core_programming', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2) 20 questions
DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: 基本文法 (BRONZE) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): mainメソッドのシグネチャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Javaプログラムのエントリーポイントとして正しいmainメソッドのシグネチャはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'JVMはエントリーポイントとして public static void main(String[] args) を探します。publicとstaticの両方が必須であり、戻り値はvoidでなければなりません。String... argsも有効です。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'public static void main(String[] args)', true, 1),
    (gen_random_uuid(), q_id, 'public void main(String[] args)', false, 2),
    (gen_random_uuid(), q_id, 'static void main(String args)', false, 3),
    (gen_random_uuid(), q_id, 'public static int main(String[] args)', false, 4);

  -- T1-Q2 (easy): プリミティブ型と参照型
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Javaのプリミティブ型に該当しないものはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'Javaのプリミティブ型は8種類（byte, short, int, long, float, double, boolean, char）です。Stringはクラス（参照型）であり、プリミティブ型ではありません。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int', false, 1),
    (gen_random_uuid(), q_id, 'boolean', false, 2),
    (gen_random_uuid(), q_id, 'String', true, 3),
    (gen_random_uuid(), q_id, 'char', false, 4);

  -- T1-Q3 (medium): == と equals の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードの実行結果として正しいものはどれですか？\n\nString a = new String("hello");\nString b = new String("hello");\nSystem.out.println(a == b);\nSystem.out.println(a.equals(b));',
  'multiple_choice', 'medium', 'java', 'concept',
  '== は参照の比較（同一オブジェクトか）を行い、equals() は内容の比較を行います。new String() で生成した場合、異なるオブジェクトが作成されるため == は false ですが、内容は同じなので equals() は true になります。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true と true', false, 1),
    (gen_random_uuid(), q_id, 'false と false', false, 2),
    (gen_random_uuid(), q_id, 'false と true', true, 3),
    (gen_random_uuid(), q_id, 'true と false', false, 4);

  -- T1-Q4 (medium): アクセス修飾子
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Javaのアクセス修飾子において、同じパッケージ内のクラスとサブクラスからアクセス可能だが、パッケージ外の非サブクラスからはアクセスできないものはどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  'protectedは同一パッケージ内のすべてのクラスと、パッケージ外のサブクラスからアクセス可能です。パッケージ外の非サブクラスからはアクセスできません。publicはすべてからアクセス可能、privateは同一クラスのみ、デフォルト（修飾子なし）は同一パッケージのみです。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'public', false, 1),
    (gen_random_uuid(), q_id, 'protected', true, 2),
    (gen_random_uuid(), q_id, 'private', false, 3),
    (gen_random_uuid(), q_id, '修飾子なし（デフォルト）', false, 4);

  -- T1-Q5 (medium): 型変換（キャスト）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードでコンパイルエラーが発生するのはどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  'int型からlong型への変換は暗黙的（拡大変換）に行えますが、double型からint型への変換は明示的キャスト（縮小変換）が必要です。キャストなしで代入するとコンパイルエラーになります。',
  2, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int a = 10; long b = a;', false, 1),
    (gen_random_uuid(), q_id, 'double x = 3.14; int y = x;', true, 2),
    (gen_random_uuid(), q_id, 'int c = 100; double d = c;', false, 3),
    (gen_random_uuid(), q_id, 'char ch = ''A''; int n = ch;', false, 4);

  -- ============================================================
  -- Topic 2: OOP — 継承・インタフェース・多態性 (SILVER) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): extends と implements
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Javaにおいて、クラスがインタフェースを実装する際に使用するキーワードはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'クラスがインタフェースを実装する場合は implements を使用します。クラスの継承には extends を使用します。Javaではクラスの多重継承はできませんが、インタフェースは複数実装できます。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'extends', false, 1),
    (gen_random_uuid(), q_id, 'implements', true, 2),
    (gen_random_uuid(), q_id, 'inherits', false, 3),
    (gen_random_uuid(), q_id, 'uses', false, 4);

  -- T2-Q2 (medium): ランタイムディスパッチ（多態性）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードの実行結果はどれですか？\n\nclass Animal {\n  String speak() { return "..."; }\n}\nclass Dog extends Animal {\n  String speak() { return "ワン"; }\n}\n\nAnimal a = new Dog();\nSystem.out.println(a.speak());',
  'multiple_choice', 'medium', 'java', 'concept',
  'Javaではメソッド呼び出しは実行時のオブジェクトの実際の型（Dog）に基づいて解決されます（動的ディスパッチ）。変数の宣言型（Animal）ではなく、実際のインスタンスの型のメソッドが呼ばれます。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '...', false, 1),
    (gen_random_uuid(), q_id, 'ワン', true, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', false, 3),
    (gen_random_uuid(), q_id, 'NullPointerException', false, 4);

  -- T2-Q3 (medium): abstract と interface の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  '抽象クラス（abstract class）とインタフェース（interface）の違いについて、正しい記述はどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  '抽象クラスはインスタンスフィールド（状態）を持つことができますが、インタフェースは定数（public static final）のみ持てます。Java 8以降、インタフェースもdefaultメソッドで実装を持てるようになりましたが、状態は持てません。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インタフェースはインスタンスフィールドを持つことができる', false, 1),
    (gen_random_uuid(), q_id, '抽象クラスはインスタンスフィールドを持てるが、インタフェースは持てない', true, 2),
    (gen_random_uuid(), q_id, '抽象クラスは複数継承できる', false, 3),
    (gen_random_uuid(), q_id, 'インタフェースにはコンストラクタを定義できる', false, 4);

  -- T2-Q4 (hard): @Override の役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードでコンパイルエラーが発生する理由として正しいものはどれですか？\n\nclass Parent {\n  void greet() { System.out.println("Hello"); }\n}\nclass Child extends Parent {\n  @Override\n  void greet(String name) { System.out.println("Hello " + name); }\n}',
  'multiple_choice', 'hard', 'java', 'concept',
  '@Overrideアノテーションは、メソッドが親クラスのメソッドを正しくオーバーライドしていることをコンパイラに検証させます。greet(String name)はgreet()とシグネチャが異なるため、オーバーライドではなくオーバーロードになります。@Overrideが付いているためコンパイルエラーになります。',
  3, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Childクラスのアクセス修飾子が不足しているため', false, 1),
    (gen_random_uuid(), q_id, '引数リストが異なりオーバーライドの条件を満たさないため', true, 2),
    (gen_random_uuid(), q_id, 'Parentクラスのgreetがfinalであるため', false, 3),
    (gen_random_uuid(), q_id, '@Overrideは抽象メソッドにのみ使用可能なため', false, 4);

  -- T2-Q5 (hard): 多態性とリスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードの出力として正しいものはどれですか？\n\ninterface Shape { double area(); }\nclass Circle implements Shape {\n  double r;\n  Circle(double r) { this.r = r; }\n  public double area() { return Math.PI * r * r; }\n}\nclass Square implements Shape {\n  double s;\n  Square(double s) { this.s = s; }\n  public double area() { return s * s; }\n}\n\nList<Shape> shapes = List.of(new Circle(1), new Square(2));\nSystem.out.println(shapes.get(1).area());',
  'multiple_choice', 'hard', 'java', 'concept',
  'shapes.get(1)はSquare(2)を返します。Square.area()はs * s = 2 * 2 = 4.0を返します。List<Shape>で宣言していても、実行時には実際のオブジェクトのメソッドが呼ばれます（多態性）。',
  3, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3.141592653589793', false, 1),
    (gen_random_uuid(), q_id, '4.0', true, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラー', false, 3),
    (gen_random_uuid(), q_id, 'ClassCastException', false, 4);

  -- ============================================================
  -- Topic 3: 例外処理 (SILVER) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): checked と unchecked の分類
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Javaの例外について、検査例外（checked exception）に分類されるものはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'IOExceptionはExceptionのサブクラスかつRuntimeExceptionのサブクラスではないため、検査例外です。NullPointerException、ArrayIndexOutOfBoundsException、ClassCastExceptionはいずれもRuntimeExceptionのサブクラスであり、非検査例外です。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NullPointerException', false, 1),
    (gen_random_uuid(), q_id, 'IOException', true, 2),
    (gen_random_uuid(), q_id, 'ArrayIndexOutOfBoundsException', false, 3),
    (gen_random_uuid(), q_id, 'ClassCastException', false, 4);

  -- T3-Q2 (medium): catch の順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードでコンパイルエラーが発生する理由として正しいものはどれですか？\n\ntry {\n  // 処理\n} catch (Exception e) {\n  System.out.println("Exception");\n} catch (IOException e) {\n  System.out.println("IOException");\n}',
  'multiple_choice', 'medium', 'java', 'concept',
  'catch節は具体的な例外クラスから順に記述する必要があります。ExceptionはIOExceptionの親クラスであるため、先にExceptionをcatchすると、IOExceptionには到達不可能（unreachable）となりコンパイルエラーになります。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IOExceptionがimportされていないため', false, 1),
    (gen_random_uuid(), q_id, '親クラスのExceptionを先にcatchしており、IOExceptionに到達不可能なため', true, 2),
    (gen_random_uuid(), q_id, 'try文に処理が記述されていないため', false, 3),
    (gen_random_uuid(), q_id, 'catchブロックは1つしか記述できないため', false, 4);

  -- T3-Q3 (medium): try-with-resources
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'try-with-resources文で自動的にリソースがクローズされるために、リソースクラスが実装すべきインタフェースはどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  'try-with-resources文は、AutoCloseableインタフェースを実装したリソースに対して、tryブロック終了時に自動的にclose()を呼び出します。Closeableも利用可能ですが、AutoCloseableのサブインタフェースです。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Serializable', false, 1),
    (gen_random_uuid(), q_id, 'AutoCloseable', true, 2),
    (gen_random_uuid(), q_id, 'Iterable', false, 3),
    (gen_random_uuid(), q_id, 'Runnable', false, 4);

  -- T3-Q4 (medium): finally の実行タイミング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードの出力として正しいものはどれですか？\n\ntry {\n  System.out.print("A");\n  throw new RuntimeException();\n} catch (RuntimeException e) {\n  System.out.print("B");\n  return;\n} finally {\n  System.out.print("C");\n}',
  'multiple_choice', 'medium', 'java', 'concept',
  'tryブロックで"A"が出力され、例外がスローされます。catchブロックで"B"が出力され、returnが呼ばれますが、finallyブロックはreturn前に必ず実行されるため"C"も出力されます。結果は"ABC"です。',
  2, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AB', false, 1),
    (gen_random_uuid(), q_id, 'ABC', true, 2),
    (gen_random_uuid(), q_id, 'AC', false, 3),
    (gen_random_uuid(), q_id, 'A（その後RuntimeException）', false, 4);

  -- T3-Q5 (hard): 例外の変換（wrap）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードにおいて、例外変換（wrap）パターンを正しく実装しているのはどれですか？',
  'multiple_choice', 'hard', 'java', 'concept',
  '例外変換では、キャッチした例外を新しい例外のcause（原因）として保存します。これにより、上位レイヤーの例外に変換しつつ、元の例外情報（スタックトレース含む）が失われません。causeを渡さないと元の例外情報が消えてしまうため、デバッグが困難になります。',
  3, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'catch (IOException e) { throw new ServiceException(e.getMessage()); }', false, 1),
    (gen_random_uuid(), q_id, 'catch (IOException e) { throw new ServiceException("変換失敗", e); }', true, 2),
    (gen_random_uuid(), q_id, 'catch (IOException e) { throw new ServiceException(); }', false, 3),
    (gen_random_uuid(), q_id, 'catch (IOException e) { throw e; }', false, 4);

  -- ============================================================
  -- Topic 4: Collections & Streams (GOLD) — 5 questions
  -- ============================================================

  -- T4-Q1 (easy): コレクションの選択
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  '重複を許さず、要素の挿入順序も保証する必要があるコレクションとして最も適切なものはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'LinkedHashSetは重複を許さず（Setの特性）、挿入順序を保持します。HashSetは順序を保証せず、TreeSetは自然順序でソートします。ArrayListは重複を許容します。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ArrayList', false, 1),
    (gen_random_uuid(), q_id, 'HashSet', false, 2),
    (gen_random_uuid(), q_id, 'LinkedHashSet', true, 3),
    (gen_random_uuid(), q_id, 'TreeSet', false, 4);

  -- T4-Q2 (medium): Stream の遅延評価
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  'Java Stream APIにおける中間操作（filter, map等）の特徴として正しいものはどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  'Stream APIの中間操作は遅延評価（lazy evaluation）されます。終端操作（collect, forEach等）が呼ばれるまで、中間操作は実行されません。これにより不要な計算を省略でき、パフォーマンスが向上します。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '呼び出した時点で即座に実行される', false, 1),
    (gen_random_uuid(), q_id, '終端操作が呼ばれるまで実行されない（遅延評価）', true, 2),
    (gen_random_uuid(), q_id, '別スレッドで非同期に実行される', false, 3),
    (gen_random_uuid(), q_id, 'バッチ処理として一定数たまってから実行される', false, 4);

  -- T4-Q3 (medium): map と flatMap の違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'Stream APIにおけるmapとflatMapの違いについて、正しい記述はどれですか？',
  'multiple_choice', 'medium', 'java', 'concept',
  'mapは各要素を1対1で変換し、flatMapは各要素をStreamに変換してからフラット化（結合）します。例えばList<List<String>>をList<String>に変換する場合はflatMapが適切です。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'mapは要素をフィルタリングし、flatMapは変換する', false, 1),
    (gen_random_uuid(), q_id, 'mapは1対1変換、flatMapはStreamをフラット化して結合する', true, 2),
    (gen_random_uuid(), q_id, 'mapは終端操作で、flatMapは中間操作である', false, 3),
    (gen_random_uuid(), q_id, 'mapはプリミティブ型専用で、flatMapは参照型専用である', false, 4);

  -- T4-Q4 (hard): Stream の再利用不可
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'次のコードの実行結果はどれですか？\n\nStream<String> stream = List.of("a", "b", "c").stream();\nlong count = stream.count();\nString first = stream.findFirst().orElse("none");',
  'multiple_choice', 'hard', 'java', 'concept',
  'Streamは一度消費されると再利用できません。stream.count()でStreamが消費された後、stream.findFirst()を呼ぶとIllegalStateExceptionが発生します。再度使用するにはソースから新しいStreamを生成する必要があります。',
  3, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'count=3, first="a"', false, 1),
    (gen_random_uuid(), q_id, 'count=3, first="none"', false, 2),
    (gen_random_uuid(), q_id, 'IllegalStateException が発生する', true, 3),
    (gen_random_uuid(), q_id, 'count=3, first=null', false, 4);

  -- T4-Q5 (easy): Mapの基本操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000001',
  E'JavaのMap<String, Integer>に対して、キーが存在しない場合にデフォルト値を返すメソッドはどれですか？',
  'multiple_choice', 'easy', 'java', 'concept',
  'getOrDefaultメソッドは、指定したキーが存在する場合はその値を返し、存在しない場合は第2引数のデフォルト値を返します。get()はキーが存在しない場合にnullを返します。',
  1, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'get(key)', false, 1),
    (gen_random_uuid(), q_id, 'getOrDefault(key, defaultValue)', true, 2),
    (gen_random_uuid(), q_id, 'getIfPresent(key)', false, 3),
    (gen_random_uuid(), q_id, 'findOrDefault(key, defaultValue)', false, 4);

END $$;
