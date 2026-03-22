-- ============================================================
-- Dev 理解度テスト: code_reading questions supplement
-- Adds code_reading subtype questions to balance concept/code_reading ratio
-- Spring Boot +6, SQL +9, JavaScript +2, React +8, Python +7, Next.js +9 = 51 total
-- ============================================================

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Spring Boot code_reading +6 (source quiz e1000001-...-02)
  -- ============================================================

  -- SB-CR1 (medium): DI コンストラクタ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次のコードの動作として正しいものはどれですか？\n\n@Service\npublic class OrderService {\n  private final UserRepository userRepo;\n  private final ProductRepository prodRepo;\n\n  public OrderService(UserRepository userRepo, ProductRepository prodRepo) {\n    this.userRepo = userRepo;\n    this.prodRepo = prodRepo;\n  }\n}',
  'multiple_choice', 'medium', 'spring_boot', 'code_reading',
  'コンストラクタが1つだけの場合、@Autowiredを省略してもSpringが自動的にDIを行います。finalフィールドで宣言しているため、注入後に変更できず安全です。',
  2, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Autowiredなしでも2つのRepositoryが自動注入される', true, 1),
    (gen_random_uuid(), q_id, '@Autowiredがないため注入されずNullPointerExceptionが発生する', false, 2),
    (gen_random_uuid(), q_id, 'finalフィールドのためDIが無効になる', false, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', false, 4);

  -- SB-CR2 (medium): @Transactional ロールバック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次のコードでIOExceptionが発生した場合の動作はどれですか？\n\n@Transactional\npublic void processFile(String path) throws IOException {\n  repository.save(new Record(path));\n  readExternalFile(path); // throws IOException\n}',
  'multiple_choice', 'medium', 'spring_boot', 'code_reading',
  '@Transactionalのデフォルトでは、RuntimeException（非チェック例外）のみロールバックされます。IOExceptionはチェック例外のため、saveは確定され（COMMIT）、ロールバックされません。rollbackFor=Exception.classを指定する必要があります。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'saveはCOMMITされ、ロールバックされない（IOExceptionはチェック例外）', true, 1),
    (gen_random_uuid(), q_id, 'saveがロールバックされる', false, 2),
    (gen_random_uuid(), q_id, 'トランザクション自体が開始されない', false, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', false, 4);

  -- SB-CR3 (hard): N+1 Fetch Join
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次の2つのコードの違いとして正しいものはどれですか？\n\nコードA:\nList<Department> depts = deptRepository.findAll();\nfor (Department d : depts) {\n  d.getEmployees().size();\n}\n\nコードB:\n@Query("SELECT d FROM Department d JOIN FETCH d.employees")\nList<Department> findAllWithEmployees();',
  'multiple_choice', 'hard', 'spring_boot', 'code_reading',
  'コードAはN+1問題が発生します。findAll()で1クエリ、各部署のgetEmployees()で追加クエリが発行されます。コードBはFetch JoinでDepartmentとEmployeesを1クエリで取得するため効率的です。',
  3, 23, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードAはN+1問題が発生し、コードBは1クエリで完了する', true, 1),
    (gen_random_uuid(), q_id, '両方とも同じ数のクエリを発行する', false, 2),
    (gen_random_uuid(), q_id, 'コードBはメモリ使用量が大幅に増加する', false, 3),
    (gen_random_uuid(), q_id, 'コードAの方がパフォーマンスが良い', false, 4);

  -- SB-CR4 (easy): レイヤー責務
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次のControllerコードの問題点はどれですか？\n\n@RestController\npublic class UserController {\n  @Autowired\n  private UserRepository userRepository;\n\n  @GetMapping("/users/{id}")\n  public User getUser(@PathVariable Long id) {\n    return userRepository.findById(id).orElseThrow();\n  }\n}',
  'multiple_choice', 'easy', 'spring_boot', 'code_reading',
  'ControllerがServiceを介さず直接Repositoryを呼び出しています。ビジネスロジック追加時にControllerの修正が必要になり、ロジックの再利用ができません。Controller→Service→Repositoryの依存方向を守るべきです。',
  1, 24, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Serviceを介さずControllerが直接Repositoryを呼んでいる', true, 1),
    (gen_random_uuid(), q_id, '@PathVariableの使い方が間違っている', false, 2),
    (gen_random_uuid(), q_id, 'orElseThrow()は使用禁止のメソッドである', false, 3),
    (gen_random_uuid(), q_id, '問題はなく正常に動作する', false, 4);

  -- SB-CR5 (medium): application.yml 読み取り
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次の設定で--spring.profiles.active=prodで起動した場合、spring.datasource.urlの値はどれですか？\n\napplication.yml:\nspring:\n  datasource:\n    url: jdbc:postgresql://localhost:5432/myapp\n\napplication-prod.yml:\nspring:\n  datasource:\n    url: ${DATABASE_URL}',
  'multiple_choice', 'medium', 'spring_boot', 'code_reading',
  'プロファイル別ファイル（application-prod.yml）はベースファイル（application.yml）の値を上書きします。prodプロファイルが有効な場合、datasource.urlは環境変数DATABASE_URLの値になります。',
  2, 25, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '環境変数DATABASE_URLの値（prodが上書き）', true, 1),
    (gen_random_uuid(), q_id, 'jdbc:postgresql://localhost:5432/myapp（ベースが優先）', false, 2),
    (gen_random_uuid(), q_id, '両方の値が結合される', false, 3),
    (gen_random_uuid(), q_id, 'エラーで起動しない', false, 4);

  -- SB-CR6 (hard): ダーティチェック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  E'次のコードでsave()を呼ばずにデータが更新される理由はどれですか？\n\n@Transactional\npublic void updateName(Long id, String name) {\n  Employee emp = repository.findById(id).orElseThrow();\n  emp.setName(name);\n  // save()なし\n}',
  'multiple_choice', 'hard', 'spring_boot', 'code_reading',
  'JPAのダーティチェック機能により、@Transactional内で管理状態のEntityのフィールドが変更されると、トランザクションCOMMIT時に自動的にUPDATE文が発行されます。明示的にsave()を呼ぶ必要はありません。',
  3, 26, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JPAのダーティチェックがCOMMIT時に変更を検知して自動UPDATE', true, 1),
    (gen_random_uuid(), q_id, 'データは実際には更新されない', false, 2),
    (gen_random_uuid(), q_id, '@Transactionalが自動的にsave()を呼ぶ', false, 3),
    (gen_random_uuid(), q_id, 'setName()がDBを直接更新する', false, 4);

  -- ============================================================
  -- SQL code_reading +9 (source quiz e1000001-...-03)
  -- ============================================================

  -- SQL-CR1 (easy): SELECT結果予測
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'employeesテーブルに以下のデータがある場合、次のSQLの結果は何行ですか？\n\nデータ: 営業部3人、開発部5人、人事部2人\n\nSELECT department, COUNT(*) FROM employees GROUP BY department;',
  'multiple_choice', 'easy', 'sql', 'code_reading',
  'GROUP BY departmentにより部署ごとに1行が返されます。3つの部署があるため結果は3行です。各行にdepartmentとCOUNT(*)が含まれます。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3行（部署数と同じ）', true, 1),
    (gen_random_uuid(), q_id, '10行（全従業員数）', false, 2),
    (gen_random_uuid(), q_id, '1行（集計結果のみ）', false, 3),
    (gen_random_uuid(), q_id, '0行（GROUP BYで空になる）', false, 4);

  -- SQL-CR2 (medium): JOIN結果予測
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの結果として正しいものはどれですか？\n\nemployees: (1,田中,10), (2,佐藤,10), (3,鈴木,NULL)\ndepartments: (10,営業部), (20,開発部)\n\nSELECT e.name, d.dept_name\nFROM employees e\nLEFT JOIN departments d ON e.dept_id = d.id;',
  'multiple_choice', 'medium', 'sql', 'code_reading',
  'LEFT JOINは左テーブル（employees）の全行を返します。鈴木はdept_id=NULLのため、departmentsに一致せずdept_nameがNULLになります。開発部は従業員がいないため結果に含まれません。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3行: 田中-営業部, 佐藤-営業部, 鈴木-NULL', true, 1),
    (gen_random_uuid(), q_id, '2行: 田中-営業部, 佐藤-営業部（鈴木は除外）', false, 2),
    (gen_random_uuid(), q_id, '4行: 全従業員+開発部も含む', false, 3),
    (gen_random_uuid(), q_id, '0行: NULLがあるためエラー', false, 4);

  -- SQL-CR3 (medium): HAVING
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの結果として正しいものはどれですか？\n\norders: 顧客A(3件), 顧客B(1件), 顧客C(5件), 顧客D(2件)\n\nSELECT customer, COUNT(*) AS order_count\nFROM orders\nGROUP BY customer\nHAVING COUNT(*) >= 3\nORDER BY order_count DESC;',
  'multiple_choice', 'medium', 'sql', 'code_reading',
  'GROUP BYで顧客ごとにグループ化し、HAVING COUNT(*) >= 3で3件以上の顧客のみ抽出します。顧客A(3件)と顧客C(5件)が該当し、ORDER BY DESCで顧客C→顧客Aの順になります。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2行: 顧客C(5), 顧客A(3)', true, 1),
    (gen_random_uuid(), q_id, '4行: 全顧客', false, 2),
    (gen_random_uuid(), q_id, '1行: 顧客C(5)のみ', false, 3),
    (gen_random_uuid(), q_id, '3行: 顧客A, C, D', false, 4);

  -- SQL-CR4 (easy): WHERE条件
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの結果はどれですか？\n\nproducts: (1,りんご,100), (2,バナナ,200), (3,みかん,150), (4,ぶどう,300)\n\nSELECT name, price FROM products WHERE price >= 150 ORDER BY price;',
  'multiple_choice', 'easy', 'sql', 'code_reading',
  'WHERE price >= 150で150円以上の商品をフィルタし、ORDER BY priceで価格の昇順に並べます。みかん(150), バナナ(200), ぶどう(300)の3行が返されます。',
  1, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3行: みかん(150), バナナ(200), ぶどう(300)', true, 1),
    (gen_random_uuid(), q_id, '2行: バナナ(200), ぶどう(300)', false, 2),
    (gen_random_uuid(), q_id, '4行: 全商品', false, 3),
    (gen_random_uuid(), q_id, '3行: ぶどう(300), バナナ(200), みかん(150)', false, 4);

  -- SQL-CR5 (medium): INNER JOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの結果は何行ですか？\n\nstudents: (1,田中,101), (2,佐藤,102), (3,鈴木,101)\ncourses: (101,数学), (102,英語), (103,理科)\n\nSELECT s.name, c.course_name\nFROM students s\nINNER JOIN courses c ON s.course_id = c.id;',
  'multiple_choice', 'medium', 'sql', 'code_reading',
  'INNER JOINは両テーブルで一致する行のみ返します。3人の学生全員がcourse_idを持ち、courses表に対応する行があるため3行返されます。理科(103)は学生がいないため結果に含まれません。',
  2, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3行', true, 1),
    (gen_random_uuid(), q_id, '4行（理科も含む）', false, 2),
    (gen_random_uuid(), q_id, '2行（重複course_idは1行にまとめる）', false, 3),
    (gen_random_uuid(), q_id, '6行（3×2のクロス結合）', false, 4);

  -- SQL-CR6 (hard): トランザクション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLを実行した後、accounts表のbalanceはどうなりますか？\n\naccounts: (1,口座A,10000), (2,口座B,5000)\n\nBEGIN;\nUPDATE accounts SET balance = balance - 3000 WHERE id = 1;\nUPDATE accounts SET balance = balance + 3000 WHERE id = 2;\nROLLBACK;',
  'multiple_choice', 'hard', 'sql', 'code_reading',
  'ROLLBACKが実行されたため、BEGIN以降の全てのUPDATEが取り消されます。口座Aは10000、口座Bは5000のまま変更されません。トランザクションの原子性により、ROLLBACKは全変更を巻き戻します。',
  3, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '口座A=10000, 口座B=5000（ROLLBACKで全て取消）', true, 1),
    (gen_random_uuid(), q_id, '口座A=7000, 口座B=8000（更新が確定）', false, 2),
    (gen_random_uuid(), q_id, '口座A=7000, 口座B=5000（1つ目だけ確定）', false, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', false, 4);

  -- SQL-CR7 (medium): サブクエリ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの意味として正しいものはどれですか？\n\nSELECT name, salary\nFROM employees\nWHERE salary > (SELECT AVG(salary) FROM employees);',
  'multiple_choice', 'medium', 'sql', 'code_reading',
  'サブクエリ(SELECT AVG(salary) FROM employees)は全従業員の平均給与を計算します。外側のクエリはその平均より給与が高い従業員のname, salaryを返します。サブクエリは先に実行され、その結果が外側のWHERE条件に使用されます。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全従業員の平均給与より高い従業員を抽出する', true, 1),
    (gen_random_uuid(), q_id, '各部署の平均給与より高い従業員を抽出する', false, 2),
    (gen_random_uuid(), q_id, '給与が最も高い従業員1人を返す', false, 3),
    (gen_random_uuid(), q_id, '平均給与の値のみを返す', false, 4);

  -- SQL-CR8 (easy): COUNT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次のSQLの結果はどれですか？\n\nusers: (1,田中,tokyo), (2,佐藤,NULL), (3,鈴木,osaka), (4,高橋,NULL)\n\nSELECT COUNT(*), COUNT(city) FROM users;',
  'multiple_choice', 'easy', 'sql', 'code_reading',
  'COUNT(*)は全行数をカウントするため4。COUNT(city)はcityがNULLでない行のみカウントするため2。NULLの扱いの違いが重要です。',
  1, 23, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4, 2', true, 1),
    (gen_random_uuid(), q_id, '4, 4', false, 2),
    (gen_random_uuid(), q_id, '2, 2', false, 3),
    (gen_random_uuid(), q_id, '4, 0', false, 4);

  -- SQL-CR9 (hard): EXPLAIN解釈
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000003',
  E'次の2つのSQLのうち、emailカラムにインデックスがある場合にインデックスが使用されるのはどれですか？\n\nクエリA: SELECT * FROM users WHERE email = ''test@example.com'';\nクエリB: SELECT * FROM users WHERE email LIKE ''%example%'';',
  'multiple_choice', 'hard', 'sql', 'code_reading',
  'B-Treeインデックスは先頭からの前方一致でのみ有効です。クエリAは完全一致のためインデックスが使用されます。クエリBは先頭がワイルドカード（%）のためインデックスが使えず、フルテーブルスキャンになります。',
  3, 24, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クエリAのみ（完全一致はインデックス有効、先頭%は無効）', true, 1),
    (gen_random_uuid(), q_id, '両方ともインデックスが使用される', false, 2),
    (gen_random_uuid(), q_id, 'クエリBのみ（LIKE句はインデックス専用）', false, 3),
    (gen_random_uuid(), q_id, 'どちらもインデックスは使用されない', false, 4);

  -- ============================================================
  -- JavaScript code_reading +2 (source quiz e1000001-...-04)
  -- ============================================================

  -- JS-CR1 (medium): スプレッド構文
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  E'次のコードの実行結果はどれですか？\n\nconst a = [1, 2, 3];\nconst b = [...a];\nb.push(4);\nconsole.log(a.length, b.length);',
  'multiple_choice', 'medium', 'javascript', 'code_reading',
  'スプレッド構文[...a]は配列の浅いコピーを作成します。bはaとは別のオブジェクトなので、b.push(4)はbにのみ影響します。a.length=3、b.length=4です。',
  2, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3, 4', true, 1),
    (gen_random_uuid(), q_id, '4, 4', false, 2),
    (gen_random_uuid(), q_id, '3, 3', false, 3),
    (gen_random_uuid(), q_id, 'TypeError', false, 4);

  -- JS-CR2 (hard): 分割代入
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  E'次のコードの実行結果はどれですか？\n\nconst { a, b = 10, ...rest } = { a: 1, c: 3, d: 4 };\nconsole.log(a, b, rest);',
  'multiple_choice', 'hard', 'javascript', 'code_reading',
  '分割代入で、aは1、bはオブジェクトに存在しないためデフォルト値10、restは残りのプロパティ{c:3, d:4}を受け取ります。',
  3, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1, 10, { c: 3, d: 4 }', true, 1),
    (gen_random_uuid(), q_id, '1, undefined, { c: 3, d: 4 }', false, 2),
    (gen_random_uuid(), q_id, '1, 10, { a: 1, c: 3, d: 4 }', false, 3),
    (gen_random_uuid(), q_id, 'SyntaxError', false, 4);

  -- ============================================================
  -- React code_reading +8 (source quiz e1000001-...-05)
  -- ============================================================

  -- REACT-CR1 (easy): useState初期値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでボタンを3回クリックした後の表示はどれですか？\n\nfunction Counter() {\n  const [count, setCount] = useState(0);\n  return <button onClick={() => setCount(count + 1)}>{count}</button>;\n}',
  'multiple_choice', 'easy', 'react', 'code_reading',
  'useStateの初期値は0です。ボタンクリックごとにsetCount(count+1)でcountが1ずつ増加します。3回クリック後はcount=3が表示されます。',
  1, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3', true, 1),
    (gen_random_uuid(), q_id, '0', false, 2),
    (gen_random_uuid(), q_id, '1', false, 3),
    (gen_random_uuid(), q_id, 'NaN', false, 4);

  -- REACT-CR2 (medium): useEffect依存配列
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードの問題点はどれですか？\n\nfunction UserProfile({ userId }) {\n  const [user, setUser] = useState(null);\n  useEffect(() => {\n    fetch(`/api/users/${userId}`)\n      .then(res => res.json())\n      .then(data => setUser(data));\n  });\n  return <div>{user?.name}</div>;\n}',
  'multiple_choice', 'medium', 'react', 'code_reading',
  'useEffectの第2引数（依存配列）が省略されているため、毎回のレンダリング後にfetchが実行されます。setUserによる再レンダリング→fetch→setUser→再レンダリングの無限ループが発生します。正しくは[userId]を依存配列に指定します。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '依存配列が省略されており、無限ループが発生する', true, 1),
    (gen_random_uuid(), q_id, 'fetchのエラーハンドリングがない', false, 2),
    (gen_random_uuid(), q_id, 'userがnullの場合にエラーが発生する', false, 3),
    (gen_random_uuid(), q_id, '問題なく正常に動作する', false, 4);

  -- REACT-CR3 (medium): 配列State更新
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次の2つのコードのうち、正しくStateを更新するのはどれですか？\n\nコードA:\nsetTodos([...todos, newTodo]);\n\nコードB:\ntodos.push(newTodo);\nsetTodos(todos);',
  'multiple_choice', 'medium', 'react', 'code_reading',
  'コードAはスプレッド構文で新しい配列を作成するためReactが変更を検知して再レンダリングします。コードBはpushで元の配列を直接変更しますが、参照が同じままなのでReactは変更を検知できません。',
  2, 23, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードAのみ（新しい配列を作成するため変更が検知される）', true, 1),
    (gen_random_uuid(), q_id, '両方とも正しく動作する', false, 2),
    (gen_random_uuid(), q_id, 'コードBのみ（pushの方が効率的）', false, 3),
    (gen_random_uuid(), q_id, 'どちらも正しくない', false, 4);

  -- REACT-CR4 (hard): useEffectクリーンアップ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでコンポーネントがアンマウントされた場合の動作はどれですか？\n\nuseEffect(() => {\n  const timer = setInterval(() => console.log("tick"), 1000);\n  return () => clearInterval(timer);\n}, []);',
  'multiple_choice', 'hard', 'react', 'code_reading',
  'useEffectのreturn関数（クリーンアップ）はコンポーネントのアンマウント時に実行されます。clearInterval(timer)によりタイマーが停止されます。クリーンアップがないとメモリリークが発生します。',
  3, 24, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'clearIntervalが実行され、タイマーが停止する', true, 1),
    (gen_random_uuid(), q_id, 'タイマーが停止せず、バックグラウンドで動き続ける', false, 2),
    (gen_random_uuid(), q_id, 'エラーが発生する', false, 3),
    (gen_random_uuid(), q_id, 'return関数は無視される', false, 4);

  -- REACT-CR5 (easy): 条件付きレンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでisLoggedIn=falseの場合の表示はどれですか？\n\nfunction App({ isLoggedIn }) {\n  return (\n    <div>\n      {isLoggedIn ? <Dashboard /> : <LoginForm />}\n    </div>\n  );\n}',
  'multiple_choice', 'easy', 'react', 'code_reading',
  '三項演算子による条件付きレンダリングです。isLoggedInがfalseの場合、LoginFormコンポーネントが表示されます。',
  1, 25, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LoginFormが表示される', true, 1),
    (gen_random_uuid(), q_id, 'Dashboardが表示される', false, 2),
    (gen_random_uuid(), q_id, '何も表示されない', false, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', false, 4);

  -- REACT-CR6 (medium): Props経由のコールバック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでChildのボタンをクリックした場合の動作はどれですか？\n\nfunction Parent() {\n  const [msg, setMsg] = useState("");\n  return <Child onSend={(text) => setMsg(text)} />;\n}\n\nfunction Child({ onSend }) {\n  return <button onClick={() => onSend("hello")}>送信</button>;\n}',
  'multiple_choice', 'medium', 'react', 'code_reading',
  'ChildがonSend("hello")を呼ぶと、ParentのsetMsg("hello")が実行され、ParentのmsgStateが"hello"に更新されます。これが子→親へのデータ伝達パターン（コールバックProps）です。',
  2, 26, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ParentのmsgStateが"hello"に更新される', true, 1),
    (gen_random_uuid(), q_id, 'ChildのStateが更新される', false, 2),
    (gen_random_uuid(), q_id, 'エラーが発生する（Propsは読み取り専用）', false, 3),
    (gen_random_uuid(), q_id, '何も起こらない', false, 4);

  -- REACT-CR7 (medium): React.memo
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでParentのcountが変更された場合、Childは再レンダリングされますか？\n\nconst Child = React.memo(function Child({ name }) {\n  return <div>{name}</div>;\n});\n\nfunction Parent() {\n  const [count, setCount] = useState(0);\n  return <><Child name="太郎" /><button onClick={() => setCount(c => c+1)}>{count}</button></>;\n}',
  'multiple_choice', 'medium', 'react', 'code_reading',
  'React.memoはPropsの浅い比較で変更がなければ再レンダリングをスキップします。Childのname="太郎"は文字列リテラルで毎回同じ値なので、Parentが再レンダリングされてもChildはスキップされます。',
  2, 27, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スキップされる（nameが変更されていないため）', true, 1),
    (gen_random_uuid(), q_id, '再レンダリングされる（親が再レンダリングされたため）', false, 2),
    (gen_random_uuid(), q_id, 'エラーが発生する', false, 3),
    (gen_random_uuid(), q_id, 'React.memoは機能しない', false, 4);

  -- REACT-CR8 (hard): key変更によるリセット
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  E'次のコードでuserIdが変更された場合の動作はどれですか？\n\nfunction App({ userId }) {\n  return <UserForm key={userId} userId={userId} />;\n}\n\nfunction UserForm({ userId }) {\n  const [name, setName] = useState("");\n  return <input value={name} onChange={e => setName(e.target.value)} />;\n}',
  'multiple_choice', 'hard', 'react', 'code_reading',
  'keyが変更されるとReactはコンポーネントを破棄して新しいインスタンスを作成します。UserFormのStateが完全にリセットされ、nameは空文字に戻ります。これはkeyによるState完全リセットパターンです。',
  3, 28, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UserFormが完全に再作成され、nameStateが空にリセットされる', true, 1),
    (gen_random_uuid(), q_id, 'nameStateは保持されたまま、userIdだけ更新される', false, 2),
    (gen_random_uuid(), q_id, 'keyは表示用でレンダリングに影響しない', false, 3),
    (gen_random_uuid(), q_id, 'エラーが発生する', false, 4);

  -- ============================================================
  -- Python code_reading +7 (source quiz e1000001-...-08)
  -- ============================================================

  -- PY-CR1 (easy): リスト操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\nnums = [1, 2, 3, 4, 5]\nresult = nums[1:4]\nprint(result)',
  'multiple_choice', 'easy', 'python', 'code_reading',
  'Pythonのスライスnums[1:4]はインデックス1から3まで（4は含まない）の要素を返します。[2, 3, 4]が結果です。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[2, 3, 4]', true, 1),
    (gen_random_uuid(), q_id, '[1, 2, 3, 4]', false, 2),
    (gen_random_uuid(), q_id, '[2, 3]', false, 3),
    (gen_random_uuid(), q_id, '[1, 2, 3]', false, 4);

  -- PY-CR2 (medium): 辞書操作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\ndata = {"a": 1, "b": 2}\nresult = data.get("c", 0)\nprint(result)',
  'multiple_choice', 'medium', 'python', 'code_reading',
  'dict.get(key, default)はキーが存在しない場合にデフォルト値を返します。"c"キーは存在しないため、デフォルト値の0が返されます。data["c"]ならKeyErrorが発生します。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0', true, 1),
    (gen_random_uuid(), q_id, 'None', false, 2),
    (gen_random_uuid(), q_id, 'KeyError', false, 3),
    (gen_random_uuid(), q_id, '""（空文字列）', false, 4);

  -- PY-CR3 (medium): リスト内包表記フィルタ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\nnums = [1, 2, 3, 4, 5, 6]\nresult = [x ** 2 for x in nums if x % 2 == 0]\nprint(result)',
  'multiple_choice', 'medium', 'python', 'code_reading',
  'リスト内包表記のif条件でx%2==0（偶数）をフィルタし、各値を2乗します。偶数は2,4,6で、それぞれ4,16,36になります。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[4, 16, 36]', true, 1),
    (gen_random_uuid(), q_id, '[1, 4, 9, 16, 25, 36]', false, 2),
    (gen_random_uuid(), q_id, '[2, 4, 6]', false, 3),
    (gen_random_uuid(), q_id, '[1, 9, 25]', false, 4);

  -- PY-CR4 (hard): with文と例外
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの出力はどれですか？\n\ntry:\n  print("A")\n  raise ValueError("error")\nexcept ValueError:\n  print("B")\nelse:\n  print("C")\nfinally:\n  print("D")',
  'multiple_choice', 'hard', 'python', 'code_reading',
  'tryブロックでA出力後にValueErrorが発生します。exceptで捕捉されBが出力されます。elseは例外未発生時のみ実行されるためスキップ。finallyは常に実行されDが出力されます。結果はA, B, Dです。',
  3, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A, B, D', true, 1),
    (gen_random_uuid(), q_id, 'A, B, C, D', false, 2),
    (gen_random_uuid(), q_id, 'A, B', false, 3),
    (gen_random_uuid(), q_id, 'A, D', false, 4);

  -- PY-CR5 (easy): 文字列フォーマット
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\nname = "太郎"\nage = 25\nprint(f"{name}さんは{age}歳です")',
  'multiple_choice', 'easy', 'python', 'code_reading',
  'f-stringは文字列内の{}にPython式を埋め込む構文です。nameとageの値がそれぞれ展開されます。',
  1, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '太郎さんは25歳です', true, 1),
    (gen_random_uuid(), q_id, '{name}さんは{age}歳です', false, 2),
    (gen_random_uuid(), q_id, 'SyntaxError', false, 3),
    (gen_random_uuid(), q_id, 'nameさんはage歳です', false, 4);

  -- PY-CR6 (medium): lambda
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\ndata = [{"name": "B", "age": 30}, {"name": "A", "age": 25}, {"name": "C", "age": 35}]\nresult = sorted(data, key=lambda x: x["age"])\nprint(result[0]["name"])',
  'multiple_choice', 'medium', 'python', 'code_reading',
  'sorted()のkey引数にlambdaを渡してageでソートします。age昇順で25→30→35となり、result[0]はage=25の{"name": "A"}です。',
  2, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A', true, 1),
    (gen_random_uuid(), q_id, 'B', false, 2),
    (gen_random_uuid(), q_id, 'C', false, 3),
    (gen_random_uuid(), q_id, '25', false, 4);

  -- PY-CR7 (medium): zip
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  E'次のコードの実行結果はどれですか？\n\nkeys = ["a", "b", "c"]\nvalues = [1, 2, 3]\nresult = dict(zip(keys, values))\nprint(result)',
  'multiple_choice', 'medium', 'python', 'code_reading',
  'zip()は2つのリストを対応するペアにまとめます。dict()でそのペアを辞書に変換します。結果は{"a": 1, "b": 2, "c": 3}です。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{"a": 1, "b": 2, "c": 3}', true, 1),
    (gen_random_uuid(), q_id, '[("a", 1), ("b", 2), ("c", 3)]', false, 2),
    (gen_random_uuid(), q_id, '{"a": "1", "b": "2", "c": "3"}', false, 3),
    (gen_random_uuid(), q_id, 'TypeError', false, 4);

  -- ============================================================
  -- Next.js code_reading +9 (source quiz e1000001-...-09)
  -- ============================================================

  -- NJS-CR1 (easy): ファイルルーティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のファイル構造でアクセス可能なURLはどれですか？\n\napp/\n  (dashboard)/\n    settings/\n      page.tsx\n    profile/\n      page.tsx',
  'multiple_choice', 'easy', 'nextjs', 'code_reading',
  'ルートグループ(dashboard)はURLに含まれません。settings/page.tsxは/settings、profile/page.tsxは/profileでアクセスできます。/(dashboard)/settingsではありません。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/settings と /profile', true, 1),
    (gen_random_uuid(), q_id, '/dashboard/settings と /dashboard/profile', false, 2),
    (gen_random_uuid(), q_id, '/(dashboard)/settings と /(dashboard)/profile', false, 3),
    (gen_random_uuid(), q_id, 'アクセスできない（page.tsxの位置が不正）', false, 4);

  -- NJS-CR2 (medium): Server Component
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のコードは正常に動作しますか？\n\n// page.tsx（"use client"なし）\nexport default async function Page() {\n  const data = await fetch("https://api.example.com/data");\n  const json = await data.json();\n  return <div>{json.title}</div>;\n}',
  'multiple_choice', 'medium', 'nextjs', 'code_reading',
  'サーバーコンポーネント（デフォルト）はasync関数として定義でき、コンポーネント内で直接awaitが使えます。fetchの結果をそのままJSXで返すことが可能です。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '正常に動作する（サーバーコンポーネントはasync/await可能）', true, 1),
    (gen_random_uuid(), q_id, 'エラー（コンポーネントはasyncにできない）', false, 2),
    (gen_random_uuid(), q_id, 'エラー（useEffectを使う必要がある）', false, 3),
    (gen_random_uuid(), q_id, '動作するが、クライアントでfetchが実行される', false, 4);

  -- NJS-CR3 (medium): use client境界
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のコードでエラーが発生する理由はどれですか？\n\n"use client"\nimport { createClient } from "@/lib/supabase/server"\n\nexport default function Dashboard() {\n  const supabase = createClient();\n  // ...\n}',
  'multiple_choice', 'medium', 'nextjs', 'code_reading',
  '"use client"ディレクティブによりこのファイルはクライアントコンポーネントになります。サーバー専用モジュール（supabase/server）をクライアントでインポートするとビルドエラーが発生します。クライアントではsupabase/clientを使用する必要があります。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントコンポーネントからサーバー専用モジュールをインポートしている', true, 1),
    (gen_random_uuid(), q_id, 'createClientの引数が不足している', false, 2),
    (gen_random_uuid(), q_id, '"use client"の位置が間違っている', false, 3),
    (gen_random_uuid(), q_id, 'Supabaseはクライアントで使用できない', false, 4);

  -- NJS-CR4 (easy): loading.tsx
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のファイルの役割はどれですか？\n\n// app/dashboard/loading.tsx\nexport default function Loading() {\n  return <div className="animate-spin">読み込み中...</div>;\n}',
  'multiple_choice', 'easy', 'nextjs', 'code_reading',
  'loading.tsxはReact Suspenseのフォールバックとして機能し、ページコンテンツの読み込み中に表示されるUIです。サーバーコンポーネントのデータ取得中に自動的にこのUIが表示されます。',
  1, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/dashboardのデータ取得中に表示されるローディングUI', true, 1),
    (gen_random_uuid(), q_id, 'アプリケーション起動時の初期画面', false, 2),
    (gen_random_uuid(), q_id, 'エラー発生時に表示されるフォールバック', false, 3),
    (gen_random_uuid(), q_id, 'SEO用のメタデータを定義するファイル', false, 4);

  -- NJS-CR5 (medium): 並列vs逐次フェッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次の2つのコードの実行時間の違いはどれですか？（各fetchは1秒かかるとする）\n\nコードA:\nconst [users, posts] = await Promise.all([\n  fetchUsers(),\n  fetchPosts(),\n]);\n\nコードB:\nconst users = await fetchUsers();\nconst posts = await fetchPosts();',
  'multiple_choice', 'medium', 'nextjs', 'code_reading',
  'コードAはPromise.allで2つのfetchを並列実行するため約1秒で完了します。コードBは逐次実行（ウォーターフォール）のため1+1=約2秒かかります。独立したリクエストは並列化すべきです。',
  2, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードA≈1秒、コードB≈2秒（並列vs逐次）', true, 1),
    (gen_random_uuid(), q_id, '両方とも約1秒', false, 2),
    (gen_random_uuid(), q_id, '両方とも約2秒', false, 3),
    (gen_random_uuid(), q_id, 'コードA≈2秒、コードB≈1秒', false, 4);

  -- NJS-CR6 (hard): revalidatePath
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のServer Actionの動作はどれですか？\n\n"use server"\nimport { revalidatePath } from "next/cache"\n\nexport async function createPost(formData: FormData) {\n  await db.insert({ title: formData.get("title") });\n  revalidatePath("/posts");\n}',
  'multiple_choice', 'hard', 'nextjs', 'code_reading',
  'Server ActionでDBに挿入後、revalidatePath("/posts")を呼ぶことで/postsページのキャッシュが無効化されます。次回/postsにアクセスした時に最新データで再生成されます。',
  3, 21, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DB挿入後、/postsのキャッシュを無効化して次回アクセス時に再生成', true, 1),
    (gen_random_uuid(), q_id, '/postsページを即座にリロードする', false, 2),
    (gen_random_uuid(), q_id, '/postsのデータを削除する', false, 3),
    (gen_random_uuid(), q_id, 'フォームをリセットする', false, 4);

  -- NJS-CR7 (medium): children pattern
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のコードでServerDataがサーバーで実行される理由はどれですか？\n\n// ClientWrapper.tsx ("use client")\nexport default function ClientWrapper({ children }) {\n  const [open, setOpen] = useState(false);\n  return <div>{open && children}</div>;\n}\n\n// page.tsx (Server Component)\nexport default function Page() {\n  return <ClientWrapper><ServerData /></ClientWrapper>;\n}',
  'multiple_choice', 'medium', 'nextjs', 'code_reading',
  'ServerDataはpage.tsx（サーバーコンポーネント）内でJSXとしてレンダリングされ、結果のHTMLがchildren propとしてClientWrapperに渡されます。"use client"の影響はClientWrapper自身とそのimportのみで、children経由で渡されたサーバーコンポーネントには影響しません。',
  2, 22, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'childrenとしてJSX要素を渡すことで、サーバーでレンダリング済みのHTMLが渡される', true, 1),
    (gen_random_uuid(), q_id, '"use client"がないファイルは全てサーバーで実行される', false, 2),
    (gen_random_uuid(), q_id, 'ClientWrapper内のuseStateがサーバー実行を強制する', false, 3),
    (gen_random_uuid(), q_id, 'ServerDataは実際にはクライアントで実行される', false, 4);

  -- NJS-CR8 (easy): error.tsx
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のファイルの動作はどれですか？\n\n// app/dashboard/error.tsx\n"use client"\nexport default function Error({ error, reset }) {\n  return (\n    <div>\n      <h2>エラーが発生しました</h2>\n      <button onClick={() => reset()}>再試行</button>\n    </div>\n  );\n}',
  'multiple_choice', 'easy', 'nextjs', 'code_reading',
  'error.tsxはエラーバウンダリとして機能し、/dashboardでエラーが発生した場合にこのUIが表示されます。reset()を呼ぶとエラー状態をクリアして再レンダリングを試みます。"use client"が必要です。',
  1, 23, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/dashboardでエラー発生時に表示され、reset()で再試行できるUI', true, 1),
    (gen_random_uuid(), q_id, 'アプリ全体のエラーログを記録するファイル', false, 2),
    (gen_random_uuid(), q_id, '404ページとして表示される', false, 3),
    (gen_random_uuid(), q_id, 'テスト実行時のエラーハンドラ', false, 4);

  -- NJS-CR9 (hard): 動的レンダリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  E'次のコードが静的レンダリングではなく動的レンダリングになる理由はどれですか？\n\nimport { cookies } from "next/headers"\n\nexport default async function Page() {\n  const cookieStore = await cookies();\n  const token = cookieStore.get("session");\n  const data = await fetchData(token?.value);\n  return <div>{data.title}</div>;\n}',
  'multiple_choice', 'hard', 'nextjs', 'code_reading',
  'cookies()はリクエスト時にのみ確定する値を返す関数です。Next.jsはこの関数の使用を検知して自動的に動的レンダリングに切り替えます。ビルド時にはcookieの値が不明なため、静的生成ができません。',
  3, 24, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'cookies()がリクエスト時にのみ確定するため、静的生成が不可能', true, 1),
    (gen_random_uuid(), q_id, 'async関数はすべて動的レンダリングになる', false, 2),
    (gen_random_uuid(), q_id, 'fetchData関数が外部APIを呼んでいるため', false, 3),
    (gen_random_uuid(), q_id, 'サーバーコンポーネントはすべて動的レンダリング', false, 4);

END $$;
