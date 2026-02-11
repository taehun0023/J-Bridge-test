-- ============================================
-- Quiz 4: 開発実務能力ランク試験 (90 questions)
-- Categories: java_core, spring_boot, javascript_core, react, sql
-- Java path: java_core + spring_boot + sql
-- JavaScript path: javascript_core + react + sql
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== java_core - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのプリミティブ型として正しいものはどれか。', 'Javaのプリミティブ型にはint、double、boolean、charなど8種類があり、Stringはプリミティブ型ではなく参照型である。', 1, 1, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'String', FALSE, 1),
    (gen_random_uuid(), q_id, 'int', TRUE, 2),
    (gen_random_uuid(), q_id, 'Integer', FALSE, 3),
    (gen_random_uuid(), q_id, 'Object', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのStringクラスで文字列の長さを取得するメソッドはどれか。', 'String.length()は文字列の文字数を返すメソッドである。size()はCollectionのメソッドであり、Stringには存在しない。', 1, 2, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'size()', FALSE, 1),
    (gen_random_uuid(), q_id, 'count()', FALSE, 2),
    (gen_random_uuid(), q_id, 'length()', TRUE, 3),
    (gen_random_uuid(), q_id, 'getLength()', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaで配列を宣言する正しい構文はどれか。', 'Javaでは「int[] arr = new int[5];」のように型名の後に[]を付けて配列を宣言する。', 1, 3, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int arr = new int[5];', FALSE, 1),
    (gen_random_uuid(), q_id, 'int[] arr = new int[5];', TRUE, 2),
    (gen_random_uuid(), q_id, 'array<int> arr = new array(5);', FALSE, 3),
    (gen_random_uuid(), q_id, 'int arr[] = new int[];', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのswitch文で各caseの最後に記述すべきキーワードはどれか。', 'break文を記述しないとフォールスルーが発生し、次のcaseも実行されてしまう。意図しない動作を防ぐためにbreakを記述する。', 1, 4, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'continue', FALSE, 1),
    (gen_random_uuid(), q_id, 'return', FALSE, 2),
    (gen_random_uuid(), q_id, 'exit', FALSE, 3),
    (gen_random_uuid(), q_id, 'break', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのfor文「for (int i = 0; i < 5; i++)」で、ループは何回実行されるか。', 'iは0から始まり、i < 5の条件が満たされる間ループするため、0,1,2,3,4の計5回実行される。', 1, 5, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4回', FALSE, 1),
    (gen_random_uuid(), q_id, '5回', TRUE, 2),
    (gen_random_uuid(), q_id, '6回', FALSE, 3),
    (gen_random_uuid(), q_id, '無限ループ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaでクラスからオブジェクトを生成するキーワードはどれか。', 'newキーワードはコンストラクタを呼び出してヒープ領域にオブジェクトを生成する。', 1, 6, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'create', FALSE, 1),
    (gen_random_uuid(), q_id, 'instance', FALSE, 2),
    (gen_random_uuid(), q_id, 'new', TRUE, 3),
    (gen_random_uuid(), q_id, 'init', FALSE, 4);

  -- ===== java_core - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaの継承でサブクラスが親クラスのメソッドを再定義することを何と呼ぶか。', 'オーバーライドは親クラスのメソッドをサブクラスで再定義することである。オーバーロードは同名メソッドを引数違いで複数定義することを指す。', 1, 7, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オーバーロード', FALSE, 1),
    (gen_random_uuid(), q_id, 'オーバーライド', TRUE, 2),
    (gen_random_uuid(), q_id, 'カプセル化', FALSE, 3),
    (gen_random_uuid(), q_id, 'アップキャスト', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのインターフェースについて正しい説明はどれか。', 'インターフェースはメソッドのシグネチャを定義し、実装クラスがそのメソッドを具体的に実装する。Java 8以降はdefaultメソッドも定義可能。', 1, 8, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インスタンスを直接生成できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'フィールドに可変の状態を持つことができる', FALSE, 2),
    (gen_random_uuid(), q_id, '1つのクラスは1つのインターフェースしか実装できない', FALSE, 3),
    (gen_random_uuid(), q_id, 'メソッドのシグネチャを定義し、実装クラスで具体化する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのtry-catch文でfinallyブロックの特徴として正しいものはどれか。', 'finallyブロックは例外の発生有無にかかわらず必ず実行される。リソースの解放処理などに使用する。', 1, 9, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '例外が発生した場合のみ実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '例外が発生しなかった場合のみ実行される', FALSE, 2),
    (gen_random_uuid(), q_id, '例外の発生有無にかかわらず必ず実行される', TRUE, 3),
    (gen_random_uuid(), q_id, 'catchブロックで例外を再スローした場合は実行されない', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのArrayListとLinkedListの違いとして正しいものはどれか。', 'ArrayListは内部的に配列を使用するためランダムアクセスが高速だが、中間への挿入・削除は遅い。LinkedListはその逆の特性を持つ。', 1, 10, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ArrayListはスレッドセーフだがLinkedListはそうではない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ArrayListはランダムアクセスが高速で、LinkedListは挿入・削除が高速', TRUE, 2),
    (gen_random_uuid(), q_id, 'LinkedListはイミュータブルだがArrayListはミュータブル', FALSE, 3),
    (gen_random_uuid(), q_id, 'ArrayListは重複を許さないがLinkedListは許す', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのHashMapでキーにnullを使用した場合の動作はどれか。', 'HashMapはキーとしてnullを1つだけ許容する。一方、Hashtableはキーにnullを許容しない。', 1, 11, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NullPointerExceptionが発生する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーになる', FALSE, 2),
    (gen_random_uuid(), q_id, 'nullキーを1つだけ許容する', TRUE, 3),
    (gen_random_uuid(), q_id, 'nullキーを複数格納できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのジェネリクスを使う主な利点はどれか。', 'ジェネリクスによりコンパイル時に型安全性が保証され、不要なキャストを排除できる。実行時のClassCastExceptionを防止する効果がある。', 1, 12, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行速度が大幅に向上する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ使用量が削減される', FALSE, 2),
    (gen_random_uuid(), q_id, 'マルチスレッド処理が安全になる', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイル時に型安全性が保証される', TRUE, 4);

  -- ===== java_core - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Java Stream APIのcollect(Collectors.groupingBy(...))の戻り値の型はどれか。', 'groupingByはストリームの要素を指定した条件でグループ化し、Map<K, List<V>>を返す。', 1, 13, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'List<Map<K, V>>', FALSE, 1),
    (gen_random_uuid(), q_id, 'Set<K>', FALSE, 2),
    (gen_random_uuid(), q_id, 'Map<K, List<V>>', TRUE, 3),
    (gen_random_uuid(), q_id, 'Optional<Map<K, V>>', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのラムダ式で外部変数を参照する場合、その変数に求められる条件はどれか。', 'ラムダ式からアクセスするローカル変数はfinalまたは実質的にfinal(値が変更されない)でなければならない。', 1, 14, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'static修飾子が付いていること', FALSE, 1),
    (gen_random_uuid(), q_id, 'finalまたは実質的にfinalであること', TRUE, 2),
    (gen_random_uuid(), q_id, 'volatile修飾子が付いていること', FALSE, 3),
    (gen_random_uuid(), q_id, 'publicアクセス修飾子であること', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのsynchronizedキーワードの説明として正しいものはどれか。', 'synchronizedはモニタロックを取得して排他制御を行い、同時に1つのスレッドだけがそのブロックを実行できるようにする。', 1, 15, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メソッドの実行を非同期にする', FALSE, 1),
    (gen_random_uuid(), q_id, '複数スレッドの同時実行を許可する', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッド間でデータをコピーする', FALSE, 3),
    (gen_random_uuid(), q_id, 'モニタロックにより排他制御を行う', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JVMのガベージコレクションについて正しい説明はどれか。', 'GCはヒープ領域の不要なオブジェクトを自動的に回収する。スタック領域はメソッド終了時に自動解放されるためGCの対象外。', 1, 16, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ヒープ領域の不要なオブジェクトを自動回収する', TRUE, 1),
    (gen_random_uuid(), q_id, 'スタック領域のローカル変数を定期的に削除する', FALSE, 2),
    (gen_random_uuid(), q_id, '開発者がSystem.gc()で確実に実行できる', FALSE, 3),
    (gen_random_uuid(), q_id, 'メソッド領域のクラス定義情報をクリアする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GoFデザインパターンのSingletonパターンの目的はどれか。', 'Singletonパターンはクラスのインスタンスが1つだけ存在することを保証し、そのグローバルなアクセスポイントを提供する。', 1, 17, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトの生成手順を段階的に制御する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クラスのインスタンスを1つだけに制限する', TRUE, 2),
    (gen_random_uuid(), q_id, 'オブジェクト間の依存関係を疎結合にする', FALSE, 3),
    (gen_random_uuid(), q_id, 'アルゴリズムの切り替えを容易にする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのvolatileキーワードの効果として正しいものはどれか。', 'volatileはメインメモリから直接読み書きすることを保証し、スレッド間での可視性を確保する。ただし原子性は保証しない。', 1, 18, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変数への書き込みを原子的操作にする', FALSE, 1),
    (gen_random_uuid(), q_id, '変数をイミュータブルにする', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッド間での変数の可視性を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, '変数へのアクセスにロックを取得する', FALSE, 4);

  -- ===== spring_boot - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootで@RestControllerアノテーションの役割はどれか。', '@RestControllerは@Controllerと@ResponseBodyを組み合わせたもので、メソッドの戻り値をそのままHTTPレスポンスボディとして返す。', 1, 19, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTMLテンプレートをレンダリングして返す', FALSE, 1),
    (gen_random_uuid(), q_id, 'レスポンスボディにデータを直接返すコントローラを定義する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベース接続を管理するBeanを定義する', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティフィルタを適用するコントローラを定義する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@RequestMappingアノテーションの用途はどれか。', '@RequestMappingはHTTPリクエストのURLパスとHTTPメソッドをコントローラのメソッドにマッピングする。', 1, 20, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データベーステーブルとエンティティをマッピングする', FALSE, 1),
    (gen_random_uuid(), q_id, 'オブジェクト間の依存関係をマッピングする', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTPリクエストのURLをコントローラメソッドにマッピングする', TRUE, 3),
    (gen_random_uuid(), q_id, 'JSONフィールドとJavaフィールドをマッピングする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Autowiredアノテーションの役割はどれか。', '@Autowiredはスプリングコンテナに登録されたBeanを自動的に注入(DI)する。型に基づいて適切なBeanを検索して注入する。', 1, 21, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスをSpring Beanとして登録する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メソッドの戻り値をキャッシュする', FALSE, 2),
    (gen_random_uuid(), q_id, 'トランザクション管理を有効にする', FALSE, 3),
    (gen_random_uuid(), q_id, '依存するBeanを自動的に注入する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootのapplication.propertiesファイルの役割はどれか。', 'application.propertiesはサーバーポート、DB接続情報、ログレベルなどアプリケーションの各種設定を定義するファイルである。', 1, 22, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリケーションの各種設定を定義する', TRUE, 1),
    (gen_random_uuid(), q_id, 'Bean定義をXML形式で記述する', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストケースの実行順序を指定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ビルドの依存関係を管理する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'DI(依存性の注入)の説明として正しいものはどれか。', 'DIはオブジェクトが必要とする依存オブジェクトを外部から注入する設計パターンで、疎結合を実現する。', 1, 23, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラス内部で直接依存オブジェクトをnewで生成する', FALSE, 1),
    (gen_random_uuid(), q_id, '静的メソッドのみを使って処理を実行する', FALSE, 2),
    (gen_random_uuid(), q_id, '外部から依存オブジェクトを注入して疎結合を実現する', TRUE, 3),
    (gen_random_uuid(), q_id, 'グローバル変数で全クラスのインスタンスを共有する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootでサーバーのポート番号を変更する設定はどれか。', 'application.propertiesでserver.portを設定することでデフォルトの8080から別のポートに変更できる。', 1, 24, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'spring.port=9090', FALSE, 1),
    (gen_random_uuid(), q_id, 'app.server.port=9090', FALSE, 2),
    (gen_random_uuid(), q_id, 'server.port=9090', TRUE, 3),
    (gen_random_uuid(), q_id, 'http.port=9090', FALSE, 4);

  -- ===== spring_boot - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Service、@Repository、@Componentの共通点はどれか。', 'これらはすべて@Componentの特殊化であり、クラスをSpring Beanとして登録する。@Serviceはビジネスロジック層、@Repositoryはデータアクセス層を示す。', 1, 25, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてクラスをSpring Beanとして登録する', TRUE, 1),
    (gen_random_uuid(), q_id, 'すべてHTTPリクエストを処理できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'すべてトランザクション管理機能を持つ', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべてデータベースアクセス機能を提供する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Beanのデフォルトスコープはどれか。', 'Spring Beanのデフォルトスコープはsingletonで、アプリケーション全体で1つのインスタンスのみ生成される。', 1, 26, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'prototype', FALSE, 1),
    (gen_random_uuid(), q_id, 'request', FALSE, 2),
    (gen_random_uuid(), q_id, 'singleton', TRUE, 3),
    (gen_random_uuid(), q_id, 'session', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Transactionalアノテーションの効果はどれか。', '@Transactionalを付けたメソッドはトランザクション内で実行され、例外発生時に自動的にロールバックされる。', 1, 27, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メソッドの実行を非同期にする', FALSE, 1),
    (gen_random_uuid(), q_id, 'メソッドの実行結果をキャッシュする', FALSE, 2),
    (gen_random_uuid(), q_id, 'メソッドをトランザクション内で実行し例外時にロールバックする', TRUE, 3),
    (gen_random_uuid(), q_id, 'メソッドへのアクセスを認証済みユーザーに制限する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Securityでパスワードを安全に保存するための推奨方法はどれか。', 'Spring SecurityではBCryptPasswordEncoderなどでパスワードをハッシュ化して保存する。平文保存は重大なセキュリティリスクとなる。', 1, 28, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '平文のまま保存する', FALSE, 1),
    (gen_random_uuid(), q_id, 'Base64でエンコードして保存する', FALSE, 2),
    (gen_random_uuid(), q_id, 'AESで暗号化して保存する', FALSE, 3),
    (gen_random_uuid(), q_id, 'BCryptなどでハッシュ化して保存する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'RESTful API設計でリソース「ユーザー一覧取得」の適切なエンドポイントはどれか。', 'RESTful設計ではリソース名を複数形の名詞で表し、HTTPメソッドで操作を区別する。GET /usersがユーザー一覧取得の標準的な設計。', 1, 29, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'POST /getUsers', FALSE, 1),
    (gen_random_uuid(), q_id, 'GET /user/list', FALSE, 2),
    (gen_random_uuid(), q_id, 'GET /users', TRUE, 3),
    (gen_random_uuid(), q_id, 'GET /fetchAllUsers', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootで@PathVariableの用途はどれか。', '@PathVariableはURLパスの一部を変数として受け取る。例えば/users/{id}の{id}をメソッド引数にバインドする。', 1, 30, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエストボディのJSONをオブジェクトにバインドする', FALSE, 1),
    (gen_random_uuid(), q_id, 'URLパスの一部を変数として受け取る', TRUE, 2),
    (gen_random_uuid(), q_id, 'クエリパラメータを変数として受け取る', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTTPヘッダの値を変数として受け取る', FALSE, 4);

  -- ===== spring_boot - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring AOPにおける「Advice」の説明として正しいものはどれか。', 'Adviceは特定のJoinPointで実行される処理のこと。Before、After、Aroundなどの種類があり、横断的関心事を分離して実装する。', 1, 31, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AOPを適用する対象クラスの条件式', FALSE, 1),
    (gen_random_uuid(), q_id, '特定のJoinPointで実行される横断的処理', TRUE, 2),
    (gen_random_uuid(), q_id, 'AOPプロキシの生成戦略の設定', FALSE, 3),
    (gen_random_uuid(), q_id, 'アスペクトの適用順序を制御する仕組み', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Springでカスタムバリデーションを作成する際に実装するインターフェースはどれか。', 'ConstraintValidatorインターフェースを実装し、isValidメソッドで検証ロジックを記述する。対応するアノテーションも定義する必要がある。', 1, 32, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Validator', FALSE, 1),
    (gen_random_uuid(), q_id, 'ValidationHandler', FALSE, 2),
    (gen_random_uuid(), q_id, 'ConstraintValidator', TRUE, 3),
    (gen_random_uuid(), q_id, 'FieldValidator', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA/HibernateのN+1問題の説明として正しいものはどれか。', 'N+1問題は親エンティティ取得に1回、関連する子エンティティの取得にN回のクエリが発行される問題。FETCH JOINやEntityGraphで解決できる。', 1, 33, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つのクエリでN+1件のレコードを取得してメモリ不足になる問題', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクションがN+1回ネストしてデッドロックが発生する問題', FALSE, 2),
    (gen_random_uuid(), q_id, '親エンティティ1回+子エンティティN回のクエリが発行される問題', TRUE, 3),
    (gen_random_uuid(), q_id, 'N+1個のテーブルをJOINしてパフォーマンスが低下する問題', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Batchの基本構成要素として正しい組み合わせはどれか。', 'Spring BatchはJob→Step→(Reader/Processor/Writer)の構造で、大量データのバッチ処理を標準化されたパターンで実装する。', 1, 34, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Task → Worker → Result', FALSE, 1),
    (gen_random_uuid(), q_id, 'Pipeline → Stage → Filter', FALSE, 2),
    (gen_random_uuid(), q_id, 'Job → Step → Reader/Processor/Writer', TRUE, 3),
    (gen_random_uuid(), q_id, 'Queue → Consumer → Handler', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'マイクロサービスアーキテクチャでサービス間通信の障害対策として使われるパターンはどれか。', 'サーキットブレーカーパターンは障害が発生したサービスへの呼び出しを遮断し、障害の連鎖を防止する。Resilience4jなどで実装できる。', 1, 35, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーキットブレーカーパターン', TRUE, 1),
    (gen_random_uuid(), q_id, 'ファクトリパターン', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブザーバーパターン', FALSE, 3),
    (gen_random_uuid(), q_id, 'デコレータパターン', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring AOPのPointcut式「execution(* com.example.service.*.*(..))」の意味はどれか。', 'この式はcom.example.serviceパッケージの全クラスの全メソッド(任意の引数・戻り値)にマッチする。', 1, 36, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージのpublicメソッドのみ対象', FALSE, 1),
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージの全クラスの全メソッドが対象', TRUE, 2),
    (gen_random_uuid(), q_id, 'com.example.serviceとそのサブパッケージの全メソッドが対象', FALSE, 3),
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージの引数なしメソッドのみ対象', FALSE, 4);

  -- ===== javascript_core - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのlet、const、varの中で再代入が不可能なのはどれか。', 'constは宣言時に初期化が必須で、再代入ができない。ただしオブジェクトや配列の中身の変更は可能である。', 1, 37, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'var', FALSE, 1),
    (gen_random_uuid(), q_id, 'let', FALSE, 2),
    (gen_random_uuid(), q_id, 'const', TRUE, 3),
    (gen_random_uuid(), q_id, 'letとconst両方', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptで typeof null の結果はどれか。', 'typeof nullは"object"を返す。これはJavaScriptの初期実装からのバグだが、後方互換性のため修正されていない。', 1, 38, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"null"', FALSE, 1),
    (gen_random_uuid(), q_id, '"undefined"', FALSE, 2),
    (gen_random_uuid(), q_id, '"object"', TRUE, 3),
    (gen_random_uuid(), q_id, '"boolean"', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのアロー関数の正しい構文はどれか。', 'アロー関数は(引数) => { 処理 }の形式で記述する。ES6で導入され、従来のfunction式より簡潔に書ける。', 1, 39, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'function => (x) { return x; }', FALSE, 1),
    (gen_random_uuid(), q_id, '(x) -> { return x; }', FALSE, 2),
    (gen_random_uuid(), q_id, '(x) => { return x; }', TRUE, 3),
    (gen_random_uuid(), q_id, 'x --> { return x; }', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの配列メソッドmap()の説明として正しいものはどれか。', 'map()は各要素にコールバック関数を適用し、その結果から新しい配列を生成して返す。元の配列は変更しない。', 1, 40, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '条件に合う要素だけを抽出した新しい配列を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '各要素にコールバックを適用した新しい配列を返す', TRUE, 2),
    (gen_random_uuid(), q_id, '配列の全要素を1つの値に集約して返す', FALSE, 3),
    (gen_random_uuid(), q_id, '配列の末尾に新しい要素を追加する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのテンプレートリテラルで変数を埋め込む構文はどれか。', 'テンプレートリテラルはバッククォート(`)で囲み、${変数名}で変数を埋め込む。文字列連結より可読性が高い。', 1, 41, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"Hello #{name}"', FALSE, 1),
    (gen_random_uuid(), q_id, '''Hello ${name}''', FALSE, 2),
    (gen_random_uuid(), q_id, '`Hello ${name}`', TRUE, 3),
    (gen_random_uuid(), q_id, '"Hello {{name}}"', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの配列メソッドfilter()の説明として正しいものはどれか。', 'filter()はコールバック関数でtrueを返す要素だけを集めた新しい配列を返す。元の配列は変更されない。', 1, 42, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '配列の最初の要素を取り出す', FALSE, 1),
    (gen_random_uuid(), q_id, '配列の要素を昇順にソートする', FALSE, 2),
    (gen_random_uuid(), q_id, '各要素を変換した新しい配列を返す', FALSE, 3),
    (gen_random_uuid(), q_id, '条件を満たす要素だけの新しい配列を返す', TRUE, 4);

  -- ===== javascript_core - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのクロージャの説明として正しいものはどれか。', 'クロージャは関数とその関数が宣言されたレキシカルスコープの組み合わせで、外部関数が終了した後も外部変数にアクセスできる。', 1, 43, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '非同期処理を同期的に実行する仕組み', FALSE, 1),
    (gen_random_uuid(), q_id, '関数が定義されたスコープの変数を保持し続ける仕組み', TRUE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティを外部からアクセス不能にする仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, 'グローバル変数を自動的にガベージコレクションする仕組み', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのPromiseの3つの状態として正しいものはどれか。', 'Promiseはpending(保留)、fulfilled(成功)、rejected(失敗)の3つの状態を持ち、一度settledになると変更されない。', 1, 44, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'start、running、complete', FALSE, 1),
    (gen_random_uuid(), q_id, 'pending、fulfilled、rejected', TRUE, 2),
    (gen_random_uuid(), q_id, 'waiting、resolved、failed', FALSE, 3),
    (gen_random_uuid(), q_id, 'init、success、error', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのasync/awaitについて正しい説明はどれか。', 'awaitはasync関数内でPromiseの解決を待ち、コードを同期的に見えるように記述できる。async関数は常にPromiseを返す。', 1, 45, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'awaitはどの関数内でも使用できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'async関数は常にundefinedを返す', FALSE, 2),
    (gen_random_uuid(), q_id, 'awaitはスレッドをブロックして待機する', FALSE, 3),
    (gen_random_uuid(), q_id, 'async関数は常にPromiseを返し、awaitでPromiseの解決を待つ', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの分割代入で正しい構文はどれか。', '分割代入はオブジェクトや配列から値を取り出して変数に代入する構文。オブジェクトは{}、配列は[]を使う。', 1, 46, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'const (a, b) = [1, 2];', FALSE, 1),
    (gen_random_uuid(), q_id, 'const {a, b} = {a: 1, b: 2};', TRUE, 2),
    (gen_random_uuid(), q_id, 'const <a, b> = {a: 1, b: 2};', FALSE, 3),
    (gen_random_uuid(), q_id, 'const [a, b] = {a: 1, b: 2};', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのスプレッド演算子(...)の使い方として正しいものはどれか。', 'スプレッド演算子は配列やオブジェクトの要素を展開する。配列の結合やオブジェクトのシャローコピーに使用される。', 1, 47, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'const merged = [...arr1, ...arr2];', TRUE, 1),
    (gen_random_uuid(), q_id, 'const merged = [..arr1, ..arr2];', FALSE, 2),
    (gen_random_uuid(), q_id, 'const merged = [*arr1, *arr2];', FALSE, 3),
    (gen_random_uuid(), q_id, 'const merged = [&arr1, &arr2];', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのプロトタイプチェーンの説明として正しいものはどれか。', 'プロトタイプチェーンはオブジェクトが自身にないプロパティを参照した際、__proto__を辿って親オブジェクトを順に検索する仕組みである。', 1, 48, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数の呼び出し順序を管理するスタック構造', FALSE, 1),
    (gen_random_uuid(), q_id, '非同期処理のコールバックを管理するキュー構造', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティ検索を親オブジェクトに委譲する仕組み', TRUE, 3),
    (gen_random_uuid(), q_id, 'DOMノードの親子関係を表現するツリー構造', FALSE, 4);

  -- ===== javascript_core - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのイベントループでマイクロタスクに分類されるものはどれか。', 'Promise.then/catch/finallyやMutationObserverのコールバックはマイクロタスクに分類される。setTimeoutやsetIntervalはマクロタスク。', 1, 49, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'setTimeout', FALSE, 1),
    (gen_random_uuid(), q_id, 'setInterval', FALSE, 2),
    (gen_random_uuid(), q_id, 'requestAnimationFrame', FALSE, 3),
    (gen_random_uuid(), q_id, 'Promise.then', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのWeakMapの特徴として正しいものはどれか。', 'WeakMapのキーはオブジェクトのみで、キーへの参照が弱参照のためガベージコレクションの対象になる。列挙やサイズ取得はできない。', 1, 50, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キーに文字列と数値のみ使用できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'キーはオブジェクトのみで弱参照のためGC対象になる', TRUE, 2),
    (gen_random_uuid(), q_id, 'for...ofで列挙可能である', FALSE, 3),
    (gen_random_uuid(), q_id, 'sizeプロパティで要素数を取得できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのProxyオブジェクトで実現できることはどれか。', 'Proxyはオブジェクトの基本操作(get、set、deleteなど)をインターセプトしてカスタムな動作を定義できる。バリデーションやログ出力に活用される。', 1, 51, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティアクセスをインターセプトしてカスタム処理を行う', TRUE, 1),
    (gen_random_uuid(), q_id, 'オブジェクトのメモリ使用量を監視する', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトをイミュータブルに変換する', FALSE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの型を動的に変換する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ESModules(ESM)とCommonJS(CJS)の違いとして正しいものはどれか。', 'ESMはimport/exportを使い静的解析が可能。CJSはrequire/module.exportsを使い動的にロードする。ESMはTree Shakingに対応しやすい。', 1, 52, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ESMはrequireを使い、CJSはimportを使う', FALSE, 1),
    (gen_random_uuid(), q_id, 'ESMはNode.js専用で、CJSはブラウザ専用', FALSE, 2),
    (gen_random_uuid(), q_id, 'ESMは静的解析が可能で、CJSは動的にロードする', TRUE, 3),
    (gen_random_uuid(), q_id, 'ESMとCJSは完全に同じ仕様で互換性がある', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'TypeScriptのユニオン型「string | number」の説明として正しいものはどれか。', 'ユニオン型は複数の型のいずれかを取りうることを示す。型ガードを使って実行時に型を絞り込むことができる。', 1, 53, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'stringとnumberの両方のプロパティを持つ型', FALSE, 1),
    (gen_random_uuid(), q_id, 'stringかnumberのいずれかの値を取りうる型', TRUE, 2),
    (gen_random_uuid(), q_id, 'stringをnumberに変換する型', FALSE, 3),
    (gen_random_uuid(), q_id, 'stringとnumberを結合した新しい型', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptで以下のコード実行順序として正しいものはどれか。console.log("A"); setTimeout(() => console.log("B"), 0); Promise.resolve().then(() => console.log("C"));', 'A→C→Bの順。同期コード(A)が先に実行され、マイクロタスク(Promise.then: C)がマクロタスク(setTimeout: B)より優先される。', 1, 54, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A → B → C', FALSE, 1),
    (gen_random_uuid(), q_id, 'A → C → B', TRUE, 2),
    (gen_random_uuid(), q_id, 'C → A → B', FALSE, 3),
    (gen_random_uuid(), q_id, 'A → B → C が同時', FALSE, 4);

  -- ===== react - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのJSXで正しいものはどれか。', 'JSXではHTMLのclass属性はclassNameと書く。JavaScriptの予約語classと衝突するためである。', 1, 55, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<div class="container">...</div>', FALSE, 1),
    (gen_random_uuid(), q_id, '<div className="container">...</div>', TRUE, 2),
    (gen_random_uuid(), q_id, '<div cssClass="container">...</div>', FALSE, 3),
    (gen_random_uuid(), q_id, '<div style-class="container">...</div>', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseStateフックの説明として正しいものはどれか。', 'useStateはコンポーネントに状態変数を追加するフック。現在の状態値と更新関数のペアを返す。', 1, 56, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンポーネントのライフサイクルを管理する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネントに状態変数と更新関数を提供する', TRUE, 2),
    (gen_random_uuid(), q_id, '副作用処理を実行する', FALSE, 3),
    (gen_random_uuid(), q_id, 'グローバルな状態を全コンポーネントで共有する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseEffectの第2引数に空配列[]を渡した場合の動作はどれか。', '空配列を渡すとコンポーネントの初回マウント時のみ実行される。クリーンアップ関数はアンマウント時に実行される。', 1, 57, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎回のレンダリング後に実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '一度も実行されない', FALSE, 2),
    (gen_random_uuid(), q_id, '初回マウント時のみ実行される', TRUE, 3),
    (gen_random_uuid(), q_id, 'stateが変更されたときのみ実行される', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactで親コンポーネントから子コンポーネントにデータを渡す仕組みはどれか。', 'propsは親から子への一方向データフロー。子コンポーネントはpropsを受け取り、読み取り専用として扱う。', 1, 58, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'state', FALSE, 1),
    (gen_random_uuid(), q_id, 'context', FALSE, 2),
    (gen_random_uuid(), q_id, 'ref', FALSE, 3),
    (gen_random_uuid(), q_id, 'props', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのJSXで条件付きレンダリングを行う方法として正しいものはどれか。', 'JSX内では三項演算子(condition ? A : B)や論理AND演算子(condition && A)で条件付きレンダリングが可能。if文は直接使えない。', 1, 59, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{if (show) <Component />}', FALSE, 1),
    (gen_random_uuid(), q_id, '{show ? <Component /> : null}', TRUE, 2),
    (gen_random_uuid(), q_id, '{switch(show) { case true: <Component /> }}', FALSE, 3),
    (gen_random_uuid(), q_id, '<Component v-if={show} />', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactでリストをレンダリングする際にkey属性が必要な理由はどれか。', 'keyは各要素を一意に識別するため、Reactの差分検出(reconciliation)を効率化する。keyがないとリスト全体の再レンダリングが発生しうる。', 1, 60, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CSSスタイルを要素に適用するため', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベントハンドラをバインドするため', FALSE, 2),
    (gen_random_uuid(), q_id, 'Reactの差分検出を効率化するため', TRUE, 3),
    (gen_random_uuid(), q_id, 'アクセシビリティを向上させるため', FALSE, 4);

  -- ===== react - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseContextフックの用途はどれか。', 'useContextはContext APIの値を購読するフック。propsのバケツリレーを避けて、ネストの深いコンポーネントにもデータを渡せる。', 1, 61, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DOM要素への直接参照を取得する', FALSE, 1),
    (gen_random_uuid(), q_id, 'propsを経由せずにコンポーネントツリー全体でデータを共有する', TRUE, 2),
    (gen_random_uuid(), q_id, '非同期データのローディング状態を管理する', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンポーネントのメモ化を行う', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseRefフックの特徴として正しいものはどれか。', 'useRefは.currentプロパティを持つオブジェクトを返す。値を変更しても再レンダリングをトリガーしないため、DOM参照や前回値の保持に使う。', 1, 62, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '値の変更時に再レンダリングをトリガーする', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネント間でデータを共有する', FALSE, 2),
    (gen_random_uuid(), q_id, '値の変更で再レンダリングされず、レンダリング間で値を保持する', TRUE, 3),
    (gen_random_uuid(), q_id, '非同期処理の結果を自動的にキャッシュする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseMemoとuseCallbackの違いとして正しいものはどれか。', 'useMemoは計算結果の値をメモ化し、useCallbackは関数自体をメモ化する。どちらも不要な再計算を防ぐパフォーマンス最適化に使う。', 1, 63, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'useMemoは関数を、useCallbackは値をメモ化する', FALSE, 1),
    (gen_random_uuid(), q_id, 'useMemoは値を、useCallbackは関数をメモ化する', TRUE, 2),
    (gen_random_uuid(), q_id, 'useMemoは同期処理用、useCallbackは非同期処理用', FALSE, 3),
    (gen_random_uuid(), q_id, '両者は同じ機能でエイリアスの関係である', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactのカスタムフックの命名規則として正しいものはどれか。', 'カスタムフックは「use」で始まる関数名にする必要がある。これによりReactがフックのルールを自動的に検証できる。', 1, 64, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'hookで始まる（例: hookFetchData）', FALSE, 1),
    (gen_random_uuid(), q_id, 'customで始まる（例: customFetchData）', FALSE, 2),
    (gen_random_uuid(), q_id, 'useで始まる（例: useFetchData）', TRUE, 3),
    (gen_random_uuid(), q_id, '特に命名規則はない', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Routerの<Link>コンポーネントと通常の<a>タグの違いはどれか。', 'Linkコンポーネントはクライアントサイドルーティングで画面遷移を行い、ページ全体のリロードを発生させない。SPAのUXを維持できる。', 1, 65, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<Link>は外部リンク専用で、<a>は内部リンク専用', FALSE, 1),
    (gen_random_uuid(), q_id, '<Link>はページリロードなしでルーティングし、<a>はリロードが発生する', TRUE, 2),
    (gen_random_uuid(), q_id, '機能に違いはなく、<Link>は<a>のエイリアスである', FALSE, 3),
    (gen_random_uuid(), q_id, '<Link>はSEO対策用で、<a>はユーザー操作用', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactでuseEffectのクリーンアップ関数が実行されるタイミングはどれか。', 'クリーンアップ関数はコンポーネントのアンマウント時と、依存配列の値が変わって次のエフェクトが実行される前に呼ばれる。', 1, 66, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンポーネントの初回マウント時のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '毎回のレンダリング前', FALSE, 2),
    (gen_random_uuid(), q_id, 'アンマウント時および次のエフェクト実行前', TRUE, 3),
    (gen_random_uuid(), q_id, 'ブラウザのタブが閉じられた時のみ', FALSE, 4);

  -- ===== react - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Server Componentsの特徴として正しいものはどれか。', 'Server Componentsはサーバー上でレンダリングされ、JavaScriptバンドルに含まれない。データフェッチを直接行い、クライアントへの転送量を削減する。', 1, 67, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアント側でのみ実行され、SSRには対応しない', FALSE, 1),
    (gen_random_uuid(), q_id, 'useStateやuseEffectなどのフックを自由に使用できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーでレンダリングされ、クライアントのJSバンドルに含まれない', TRUE, 3),
    (gen_random_uuid(), q_id, 'onClick等のイベントハンドラを直接設定できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerでpage.tsxファイルの役割はどれか。', 'App Routerではファイルシステムベースのルーティングを採用し、page.tsxはそのルートセグメントのUIを定義するファイルである。', 1, 68, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ルートセグメントのUIを定義するファイル', TRUE, 1),
    (gen_random_uuid(), q_id, 'エラーハンドリングを定義するファイル', FALSE, 2),
    (gen_random_uuid(), q_id, 'ローディングUIを定義するファイル', FALSE, 3),
    (gen_random_uuid(), q_id, 'レイアウトを定義するファイル', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.jsのSSR、SSG、ISRの説明として正しいものはどれか。', 'SSRはリクエスト毎にサーバーでレンダリング、SSGはビルド時に静的生成、ISRはSSGに加えて一定間隔でバックグラウンド再生成を行う。', 1, 69, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SSRはクライアントのみでレンダリングする方式', FALSE, 1),
    (gen_random_uuid(), q_id, 'SSGはリクエスト毎にサーバーでレンダリングする方式', FALSE, 2),
    (gen_random_uuid(), q_id, 'ISRはビルド時に生成し、一定間隔でバックグラウンド再生成する方式', TRUE, 3),
    (gen_random_uuid(), q_id, 'SSR、SSG、ISRはすべて同じ動作をする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのSuspenseコンポーネントの主な用途はどれか。', 'Suspenseは非同期処理(データフェッチやコード分割)の完了を待つ間にフォールバックUIを表示する。React 18以降で機能が拡張された。', 1, 70, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'エラー発生時にフォールバックUIを表示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネントのメモ化を行う', FALSE, 2),
    (gen_random_uuid(), q_id, '非同期処理の完了を待つ間にフォールバックUIを表示する', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンポーネントのレンダリング順序を制御する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのErrorBoundaryの説明として正しいものはどれか。', 'ErrorBoundaryはクラスコンポーネントで実装され、子コンポーネントのレンダリング中のエラーをキャッチしてフォールバックUIを表示する。', 1, 71, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数コンポーネントのフックとして実装する', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベントハンドラ内のエラーもキャッチできる', FALSE, 2),
    (gen_random_uuid(), q_id, '子コンポーネントのレンダリングエラーをキャッチしてフォールバックUIを表示する', TRUE, 3),
    (gen_random_uuid(), q_id, '非同期処理のエラーを自動的にリトライする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactの状態管理でuseReducerが適している場面はどれか。', 'useReducerは複数の値が関連する複雑な状態遷移に適している。action typeに基づいて状態を更新し、ロジックを集約できる。', 1, 72, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単一のboolean値のトグル', FALSE, 1),
    (gen_random_uuid(), q_id, 'APIレスポンスのキャッシュ管理', FALSE, 2),
    (gen_random_uuid(), q_id, '複数の関連する値を持つ複雑な状態遷移', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンポーネント間のグローバル状態共有', FALSE, 4);

  -- ===== sql - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでテーブルから条件を指定してデータを取得する構文はどれか。', 'SELECT文のWHERE句で条件を指定してデータを絞り込む。ORDER BYで並び替えも可能。', 1, 73, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET * FROM users FILTER age > 20;', FALSE, 1),
    (gen_random_uuid(), q_id, 'FIND * FROM users IF age > 20;', FALSE, 2),
    (gen_random_uuid(), q_id, 'SELECT * FROM users WHERE age > 20;', TRUE, 3),
    (gen_random_uuid(), q_id, 'FETCH * FROM users WHEN age > 20;', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでテーブルに新しいレコードを追加する文はどれか。', 'INSERT INTO文でテーブルに新しい行を追加する。VALUES句で各カラムの値を指定する。', 1, 74, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ADD INTO users VALUES (...);', FALSE, 1),
    (gen_random_uuid(), q_id, 'INSERT INTO users VALUES (...);', TRUE, 2),
    (gen_random_uuid(), q_id, 'CREATE INTO users VALUES (...);', FALSE, 3),
    (gen_random_uuid(), q_id, 'PUT INTO users VALUES (...);', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのINNER JOINの説明として正しいものはどれか。', 'INNER JOINは両方のテーブルで結合条件に一致するレコードのみを返す。一致しないレコードは結果に含まれない。', 1, 75, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全レコードと右テーブルの一致レコードを返す', FALSE, 1),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '両テーブルで結合条件に一致するレコードのみを返す', TRUE, 3),
    (gen_random_uuid(), q_id, '右テーブルの全レコードと左テーブルの一致レコードを返す', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのCOUNT関数の説明として正しいものはどれか。', 'COUNT(*)はNULLを含む全行数を返し、COUNT(列名)はその列がNULLでない行数を返す。', 1, 76, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '指定した列の合計値を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '指定した列の平均値を返す', FALSE, 2),
    (gen_random_uuid(), q_id, '指定した列の最大値を返す', FALSE, 3),
    (gen_random_uuid(), q_id, '行数を数えて返す', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのORDER BYでデフォルトの並び順はどれか。', 'ORDER BYのデフォルトはASC(昇順)。降順にする場合はDESCを明示的に指定する。', 1, 77, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DESC（降順）', FALSE, 1),
    (gen_random_uuid(), q_id, 'ASC（昇順）', TRUE, 2),
    (gen_random_uuid(), q_id, 'RANDOM（ランダム）', FALSE, 3),
    (gen_random_uuid(), q_id, 'INSERT順', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでレコードを削除する文として正しいものはどれか。', 'DELETE FROM文でWHERE句を指定して条件に合うレコードを削除する。WHERE句を省略すると全件削除される。', 1, 78, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'REMOVE FROM users WHERE id = 1;', FALSE, 1),
    (gen_random_uuid(), q_id, 'DROP FROM users WHERE id = 1;', FALSE, 2),
    (gen_random_uuid(), q_id, 'DELETE FROM users WHERE id = 1;', TRUE, 3),
    (gen_random_uuid(), q_id, 'ERASE FROM users WHERE id = 1;', FALSE, 4);

  -- ===== sql - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのLEFT JOINの説明として正しいものはどれか。', 'LEFT JOINは左テーブルの全レコードを返し、右テーブルに一致がない場合はNULLで埋める。', 1, 79, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全レコードを返し、右テーブルに一致がなければNULL', TRUE, 1),
    (gen_random_uuid(), q_id, '両テーブルで一致するレコードのみを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '右テーブルの全レコードを返し、左テーブルに一致がなければNULL', FALSE, 3),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返し、一致がなければNULL', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのサブクエリの説明として正しいものはどれか。', 'サブクエリはSQL文の中に埋め込まれた別のSELECT文。WHERE句、FROM句、SELECT句などで使用でき、動的な条件指定が可能。', 1, 80, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルを結合するための専用構文', FALSE, 1),
    (gen_random_uuid(), q_id, 'SQL文の中に埋め込まれた別のSELECT文', TRUE, 2),
    (gen_random_uuid(), q_id, 'ストアドプロシージャの別名', FALSE, 3),
    (gen_random_uuid(), q_id, 'インデックスを作成するための構文', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのGROUP BYとHAVINGの関係として正しいものはどれか。', 'GROUP BYでグループ化した後、HAVINGでグループに対する条件を指定する。WHEREはグループ化前の行に、HAVINGはグループ化後に適用される。', 1, 81, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HAVINGはWHEREと同じで、どちらを使っても同じ結果になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'HAVINGはGROUP BYなしでも使用できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'HAVINGはGROUP BY後のグループに対して条件を指定する', TRUE, 3),
    (gen_random_uuid(), q_id, 'HAVINGはORDER BYの代わりに使用する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースインデックスの主な目的はどれか。', 'インデックスはテーブルのデータ検索を高速化する。ただし追加のストレージが必要で、INSERT/UPDATE/DELETEの速度は低下する。', 1, 82, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの整合性を保証する', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルの容量を削減する', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの暗号化を行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの検索速度を向上させる', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのトランザクションでCOMMITの役割はどれか。', 'COMMITはトランザクション内の全変更を確定してデータベースに反映する。ROLLBACKは変更を取り消してトランザクション開始前の状態に戻す。', 1, 83, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'トランザクション内の変更を取り消す', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクション内の全変更を確定する', TRUE, 2),
    (gen_random_uuid(), q_id, 'トランザクションの分離レベルを設定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'トランザクションのセーブポイントを作成する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのRIGHT JOINの説明として正しいものはどれか。', 'RIGHT JOINは右テーブルの全レコードを返し、左テーブルに一致がない場合はNULLで埋める。LEFT JOINの逆の動作をする。', 1, 84, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '両テーブルで一致するレコードのみを返す', FALSE, 1),
    (gen_random_uuid(), q_id, '左テーブルの全レコードと右テーブルの一致レコードを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '右テーブルの全レコードを返し、左テーブルに一致がなければNULL', TRUE, 3),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返す', FALSE, 4);

  -- ===== sql - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのウィンドウ関数ROW_NUMBER()の説明として正しいものはどれか。', 'ROW_NUMBER()はパーティション内の各行に一意の連番を割り当てる。OVER句でパーティションと並び順を指定する。', 1, 85, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル全体の行数を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '指定した列の累積合計を計算する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パーティション内の各行に一意の連番を割り当てる', TRUE, 3),
    (gen_random_uuid(), q_id, '重複する行を自動的に削除する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのEXPLAIN文の主な用途はどれか。', 'EXPLAINはクエリの実行計画を表示し、テーブルスキャンやインデックスの使用状況を確認できる。パフォーマンスチューニングに不可欠。', 1, 86, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルの構造(DDL)を表示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クエリの実行計画を表示しパフォーマンスを分析する', TRUE, 2),
    (gen_random_uuid(), q_id, 'クエリの結果を見やすいフォーマットで表示する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルの統計情報を更新する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースの第3正規形(3NF)の条件として正しいものはどれか。', '第3正規形は第2正規形を満たし、かつ非キー属性が主キーに対して推移的関数従属していないこと。非キー列間の依存を排除する。', 1, 87, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全カラムが原子的な値を持つこと', FALSE, 1),
    (gen_random_uuid(), q_id, '部分関数従属が存在しないこと', FALSE, 2),
    (gen_random_uuid(), q_id, '推移的関数従属が存在しないこと', TRUE, 3),
    (gen_random_uuid(), q_id, '全テーブルに外部キーが設定されていること', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースのデッドロック対策として有効なものはどれか。', 'テーブルやレコードのロック取得順序を全トランザクションで統一することで、循環待ちを防ぎデッドロックを回避できる。', 1, 88, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックスを全テーブルに作成する', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクションの分離レベルをREAD UNCOMMITTEDにする', FALSE, 2),
    (gen_random_uuid(), q_id, 'ロック取得順序を全トランザクションで統一する', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべてのクエリにNOLOCKヒントを付ける', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースのパーティショニングの説明として正しいものはどれか。', 'パーティショニングは大きなテーブルを特定の条件(日付、ID範囲など)で分割して管理する。クエリ対象を限定しパフォーマンスを向上させる。', 1, 89, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルのカラムを複数テーブルに分割する', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルを条件に基づいて複数の物理的な区画に分割する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベースを複数のサーバーに複製する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルのインデックスを複数作成する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのウィンドウ関数LAG()の用途はどれか。', 'LAG()は現在の行から指定した行数だけ前の行の値を取得する。前月比較や差分計算などに使用される。', 1, 90, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '現在の行から指定した行数だけ前の行の値を取得する', TRUE, 1),
    (gen_random_uuid(), q_id, '現在の行から指定した行数だけ後の行の値を取得する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パーティション内の最初の行の値を取得する', FALSE, 3),
    (gen_random_uuid(), q_id, 'パーティション内の最後の行の値を取得する', FALSE, 4);

END $$;
