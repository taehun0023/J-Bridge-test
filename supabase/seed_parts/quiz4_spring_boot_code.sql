-- ============================================
-- Quiz 4 追加: Spring Boot コードリーディング問題 (30 questions)
-- Category: spring_boot
-- Subtype: code_reading
-- sort_order: 151-180
-- Difficulty: easy 9, medium 15, hard 6
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== spring_boot / code_reading - EASY (9) =====

  -- Q151: @RestControllerの基本的なGETリクエスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のSpring Bootコードに対してGET /helloリクエストを送ったとき、レスポンスボディは何か。\n\n@RestController\npublic class HelloController {\n  @GetMapping("/hello")\n  public String hello() {\n    return "Hello World";\n  }\n}', '@RestControllerは@Controller + @ResponseBodyの複合アノテーションである。@GetMapping("/hello")でGET /helloに対応し、戻り値の文字列"Hello World"がそのままレスポンスボディとして返される。', 1, 151, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Hello World', TRUE, 1),
    (gen_random_uuid(), q_id, '{"message":"Hello World"}', FALSE, 2),
    (gen_random_uuid(), q_id, 'helloビューテンプレートが表示される', FALSE, 3),
    (gen_random_uuid(), q_id, '404 Not Found', FALSE, 4);

  -- Q152: @PathVariableの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対してGET /users/42リクエストを送ったとき、レスポンスは何か。\n\n@RestController\n@RequestMapping("/users")\npublic class UserController {\n  @GetMapping("/{id}")\n  public String getUser(@PathVariable Long id) {\n    return "User: " + id;\n  }\n}', '@RequestMapping("/users")でベースパスが/usersになり、@GetMapping("/{id}")で/users/{id}に対応する。@PathVariableによりURLの{id}部分が引数idにバインドされ、42が渡されるため"User: 42"が返される。', 1, 152, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'User: {id}', FALSE, 1),
    (gen_random_uuid(), q_id, 'User: 42', TRUE, 2),
    (gen_random_uuid(), q_id, 'User: null', FALSE, 3),
    (gen_random_uuid(), q_id, '400 Bad Request', FALSE, 4);

  -- Q153: @Autowiredによるコンストラクタインジェクション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードについて正しい説明はどれか。\n\n@Service\npublic class OrderService {\n  private final OrderRepository orderRepo;\n\n  public OrderService(OrderRepository orderRepo) {\n    this.orderRepo = orderRepo;\n  }\n}', 'Spring 4.3以降、コンストラクタが1つだけの場合は@Autowiredを省略できる。SpringがOrderRepositoryのBeanを見つけてコンストラクタに自動注入する。finalフィールドにより不変性が保証される。', 1, 153, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Autowiredがないのでインジェクションされない', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンストラクタが1つなので@Autowired省略可能で、OrderRepositoryが自動注入される', TRUE, 2),
    (gen_random_uuid(), q_id, 'finalフィールドにはDIできないためコンパイルエラーになる', FALSE, 3),
    (gen_random_uuid(), q_id, '@Serviceアノテーションではなく@Componentが必要である', FALSE, 4);

  -- Q154: application.propertiesの基本設定
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のapplication.propertiesの設定内容から、アプリケーション起動時のポート番号はどれか。\n\nserver.port=9090\nspring.datasource.url=jdbc:mysql://localhost:3306/mydb\nspring.jpa.hibernate.ddl-auto=update', 'server.portプロパティはSpring Bootの組み込みサーバーのポート番号を指定する。9090が設定されているため、デフォルトの8080ではなく9090番ポートで起動する。', 1, 154, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8080', FALSE, 1),
    (gen_random_uuid(), q_id, '3306', FALSE, 2),
    (gen_random_uuid(), q_id, '9090', TRUE, 3),
    (gen_random_uuid(), q_id, '80', FALSE, 4);

  -- Q155: @RequestParamの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対してGET /search?keyword=Springリクエストを送ったとき、レスポンスは何か。\n\n@RestController\npublic class SearchController {\n  @GetMapping("/search")\n  public String search(@RequestParam String keyword) {\n    return "検索: " + keyword;\n  }\n}', '@RequestParamはクエリパラメータをメソッド引数にバインドする。?keyword=Springにより引数keywordに"Spring"が渡され、"検索: Spring"が返される。', 1, 155, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '検索: null', FALSE, 1),
    (gen_random_uuid(), q_id, '検索: keyword', FALSE, 2),
    (gen_random_uuid(), q_id, '検索: Spring', TRUE, 3),
    (gen_random_uuid(), q_id, '400 Bad Request', FALSE, 4);

  -- Q156: @ResponseStatusアノテーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対してPOST /itemsリクエストが成功した場合のHTTPステータスコードは何か。\n\n@RestController\npublic class ItemController {\n  @PostMapping("/items")\n  @ResponseStatus(HttpStatus.CREATED)\n  public String create(@RequestBody String name) {\n    return "作成: " + name;\n  }\n}', '@ResponseStatus(HttpStatus.CREATED)により、正常終了時のHTTPステータスコードが201 Createdに設定される。デフォルトの200 OKではなく201が返される。', 1, 156, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '200 OK', FALSE, 1),
    (gen_random_uuid(), q_id, '201 Created', TRUE, 2),
    (gen_random_uuid(), q_id, '204 No Content', FALSE, 3),
    (gen_random_uuid(), q_id, '301 Moved Permanently', FALSE, 4);

  -- Q157: @Valueでプロパティ読み込み
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードとapplication.propertiesで、GET /infoのレスポンスは何か。\n\n# application.properties\napp.name=MyApp\napp.version=2.0\n\n@RestController\npublic class InfoController {\n  @Value("${app.name}")\n  private String appName;\n\n  @GetMapping("/info")\n  public String info() {\n    return appName;\n  }\n}', '@Valueアノテーションにより、application.propertiesのapp.nameの値"MyApp"がappNameフィールドに注入される。そのため/infoのレスポンスは"MyApp"となる。', 1, 157, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '${app.name}', FALSE, 1),
    (gen_random_uuid(), q_id, 'MyApp', TRUE, 2),
    (gen_random_uuid(), q_id, 'null', FALSE, 3),
    (gen_random_uuid(), q_id, '起動時にエラーが発生する', FALSE, 4);

  -- Q158: @Repositoryの基本的なメソッド呼び出し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、userRepository.findById(1L)が空のOptionalを返した場合、GET /users/1のレスポンスは何か。\n\n@RestController\n@RequestMapping("/users")\npublic class UserController {\n  @Autowired\n  private UserRepository userRepository;\n\n  @GetMapping("/{id}")\n  public String getUser(@PathVariable Long id) {\n    return userRepository.findById(id)\n      .map(u -> u.getName())\n      .orElse("不明");\n  }\n}', 'findById()はOptionalを返す。空のOptionalに対してmapは実行されず、orElse("不明")のデフォルト値が返される。そのためレスポンスは"不明"となる。', 1, 158, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'null', FALSE, 1),
    (gen_random_uuid(), q_id, 'NoSuchElementException発生', FALSE, 2),
    (gen_random_uuid(), q_id, '不明', TRUE, 3),
    (gen_random_uuid(), q_id, '404 Not Found', FALSE, 4);

  -- Q159: @PostMappingと@RequestBodyの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対して、POST /api/echoでリクエストボディ{"message":"test"}を送った場合の動作として正しいのはどれか。\n\n@RestController\n@RequestMapping("/api")\npublic class EchoController {\n  @PostMapping("/echo")\n  public Map<String, String> echo(@RequestBody Map<String, String> body) {\n    return body;\n  }\n}', '@RequestBodyによりリクエストボディのJSONがMap<String, String>に変換される。そのMapをそのまま返しているため、@RestControllerにより再度JSONに変換されて{"message":"test"}がレスポンスとして返される。', 1, 159, 'easy', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{"message":"test"}がそのままJSONで返される', TRUE, 1),
    (gen_random_uuid(), q_id, 'bodyオブジェクトのtoString()が返される', FALSE, 2),
    (gen_random_uuid(), q_id, '415 Unsupported Media Typeエラー', FALSE, 3),
    (gen_random_uuid(), q_id, '空のレスポンスが返される', FALSE, 4);

  -- ===== spring_boot / code_reading - MEDIUM (15) =====

  -- Q160: Service層のビジネスロジック追跡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、GET /orders/total?userId=1リクエスト時、orderRepository.findByUserId(1L)が金額100と200の注文を返した場合、レスポンスは何か。\n\n@Service\npublic class OrderService {\n  @Autowired\n  private OrderRepository orderRepository;\n\n  public int calculateTotal(Long userId) {\n    return orderRepository.findByUserId(userId)\n      .stream()\n      .mapToInt(Order::getAmount)\n      .sum();\n  }\n}\n\n@RestController\npublic class OrderController {\n  @Autowired\n  private OrderService orderService;\n\n  @GetMapping("/orders/total")\n  public String total(@RequestParam Long userId) {\n    return "合計: " + orderService.calculateTotal(userId);\n  }\n}', 'OrderServiceのcalculateTotalメソッドはリポジトリから取得した注文リストの金額をstream().mapToInt().sum()で合計する。100 + 200 = 300となり、コントローラで"合計: 300"が返される。', 1, 160, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '合計: 300', TRUE, 1),
    (gen_random_uuid(), q_id, '合計: [100, 200]', FALSE, 2),
    (gen_random_uuid(), q_id, '300', FALSE, 3),
    (gen_random_uuid(), q_id, 'NullPointerException発生', FALSE, 4);

  -- Q161: @Validバリデーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対して、POST /usersで{"name":"","email":"invalid"}を送った場合の動作はどれか。\n\npublic class UserDto {\n  @NotBlank\n  private String name;\n  @Email\n  private String email;\n  // getter/setter省略\n}\n\n@RestController\npublic class UserController {\n  @PostMapping("/users")\n  public String create(@Valid @RequestBody UserDto dto) {\n    return "OK";\n  }\n}', '@Validにより@NotBlankと@Emailのバリデーションが実行される。nameが空文字列なので@NotBlankに違反し、emailが不正なフォーマットなので@Emailに違反する。バリデーションエラーにより400 Bad Requestが返される。', 1, 161, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"OK"が返される', FALSE, 1),
    (gen_random_uuid(), q_id, '400 Bad Request（バリデーションエラー）', TRUE, 2),
    (gen_random_uuid(), q_id, '500 Internal Server Error', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラー', FALSE, 4);

  -- Q162: @ControllerAdviceによる例外ハンドリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、GET /products/999リクエスト時にProductNotFoundExceptionがスローされた場合のHTTPステータスコードは何か。\n\n@ControllerAdvice\npublic class GlobalExceptionHandler {\n  @ExceptionHandler(ProductNotFoundException.class)\n  @ResponseStatus(HttpStatus.NOT_FOUND)\n  @ResponseBody\n  public Map<String, String> handleNotFound(ProductNotFoundException ex) {\n    return Map.of("error", ex.getMessage());\n  }\n}\n\n@RestController\npublic class ProductController {\n  @GetMapping("/products/{id}")\n  public Product getProduct(@PathVariable Long id) {\n    throw new ProductNotFoundException("商品が見つかりません");\n  }\n}', '@ControllerAdviceがアプリケーション全体の例外をキャッチする。ProductNotFoundExceptionが発生すると@ExceptionHandlerメソッドが呼ばれ、@ResponseStatus(HttpStatus.NOT_FOUND)により404が返される。', 1, 162, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '200 OK', FALSE, 1),
    (gen_random_uuid(), q_id, '400 Bad Request', FALSE, 2),
    (gen_random_uuid(), q_id, '404 Not Found', TRUE, 3),
    (gen_random_uuid(), q_id, '500 Internal Server Error', FALSE, 4);

  -- Q163: Beanスコープの動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードについて正しい説明はどれか。\n\n@Component\n@Scope("prototype")\npublic class TaskProcessor {\n  private int count = 0;\n  public int increment() {\n    return ++count;\n  }\n}\n\n@RestController\npublic class TaskController {\n  @Autowired\n  private TaskProcessor processor;\n\n  @GetMapping("/task")\n  public int process() {\n    return processor.increment();\n  }\n}', '@Scope("prototype")はBeanを注入の度に新しいインスタンスを生成するが、@Autowiredによるフィールドインジェクションは起動時に1回だけ行われる。そのためprocessorは実質的にシングルトンと同じ動作となり、リクエスト毎にcountが増加し続ける。', 1, 163, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト毎に新しいTaskProcessorが生成されるため常に1が返る', FALSE, 1),
    (gen_random_uuid(), q_id, 'prototypeスコープだがフィールド注入は1回なので、countは増加し続ける', TRUE, 2),
    (gen_random_uuid(), q_id, '@Scopeが無効でコンパイルエラーになる', FALSE, 3),
    (gen_random_uuid(), q_id, 'リクエスト毎にcountが0にリセットされる', FALSE, 4);

  -- Q164: JPA Entityマッピング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJPAエンティティがマッピングされるテーブル名とカラム名の組み合わせとして正しいのはどれか。\n\n@Entity\n@Table(name = "employees")\npublic class Employee {\n  @Id\n  @GeneratedValue(strategy = GenerationType.IDENTITY)\n  private Long id;\n\n  @Column(name = "full_name", nullable = false)\n  private String name;\n\n  private String department;\n}', '@Table(name = "employees")によりテーブル名はemployeesとなる。@Column(name = "full_name")によりnameフィールドはfull_nameカラムにマッピングされる。departmentは@Columnがないためフィールド名がそのままカラム名となる。', 1, 164, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル: employee, カラム: name, department', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブル: employees, カラム: full_name, department', TRUE, 2),
    (gen_random_uuid(), q_id, 'テーブル: employees, カラム: name, department', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブル: Employee, カラム: full_name, department', FALSE, 4);

  -- Q165: Spring JPAクエリメソッド
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のリポジトリインターフェースのメソッドが生成するSQLクエリとして最も近いのはどれか。\n\npublic interface ProductRepository extends JpaRepository<Product, Long> {\n  List<Product> findByPriceGreaterThanAndCategoryOrderByPriceDesc(\n    int price, String category\n  );\n}', 'Spring Data JPAのクエリメソッド命名規則により、findBy + Price + GreaterThan + And + Category + OrderBy + Price + Descと解析される。priceが指定値より大きく、categoryが一致するProductをprice降順で取得するSQLが生成される。', 1, 165, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SELECT * FROM product WHERE price > ? AND category = ? ORDER BY price DESC', TRUE, 1),
    (gen_random_uuid(), q_id, 'SELECT * FROM product WHERE price >= ? AND category = ? ORDER BY price ASC', FALSE, 2),
    (gen_random_uuid(), q_id, 'SELECT * FROM product WHERE price > ? OR category = ? ORDER BY price DESC', FALSE, 3),
    (gen_random_uuid(), q_id, 'SELECT * FROM product WHERE category = ? ORDER BY price DESC LIMIT ?', FALSE, 4);

  -- Q166: @Configurationによるbean定義
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードについて正しい説明はどれか。\n\n@Configuration\npublic class AppConfig {\n  @Bean\n  public PasswordEncoder passwordEncoder() {\n    return new BCryptPasswordEncoder();\n  }\n\n  @Bean\n  public RestTemplate restTemplate() {\n    return new RestTemplate();\n  }\n}', '@Configurationクラス内の@Beanメソッドの戻り値はSpringコンテナにBeanとして登録される。デフォルトでシングルトンスコープのため、アプリケーション全体で1つのインスタンスが共有される。他のコンポーネントから@Autowiredで注入可能となる。', 1, 166, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PasswordEncoderとRestTemplateがそれぞれシングルトンBeanとして登録される', TRUE, 1),
    (gen_random_uuid(), q_id, '@Beanメソッドが呼ばれるたびに新しいインスタンスが生成される', FALSE, 2),
    (gen_random_uuid(), q_id, '@Configurationがないと@Beanは無効である', FALSE, 3),
    (gen_random_uuid(), q_id, '@Beanメソッドはstaticでなければならない', FALSE, 4);

  -- Q167: @RequestParamのdefaultValue
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードに対してGET /listリクエスト（パラメータなし）を送った場合のレスポンスは何か。\n\n@RestController\npublic class ListController {\n  @GetMapping("/list")\n  public String list(\n    @RequestParam(defaultValue = "0") int page,\n    @RequestParam(defaultValue = "10") int size) {\n    return "page=" + page + ", size=" + size;\n  }\n}', '@RequestParamにdefaultValueが指定されている場合、パラメータが省略されるとデフォルト値が使用される。pageもsizeも省略されているのでそれぞれ0と10が使われ、"page=0, size=10"が返される。', 1, 167, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '400 Bad Request（必須パラメータ不足）', FALSE, 1),
    (gen_random_uuid(), q_id, 'page=null, size=null', FALSE, 2),
    (gen_random_uuid(), q_id, 'page=0, size=10', TRUE, 3),
    (gen_random_uuid(), q_id, 'page=1, size=10', FALSE, 4);

  -- Q168: @Transactionalのロールバック動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでtransferメソッド実行中にRuntimeExceptionが発生した場合の動作はどれか。\n\n@Service\npublic class AccountService {\n  @Autowired\n  private AccountRepository accountRepo;\n\n  @Transactional\n  public void transfer(Long fromId, Long toId, int amount) {\n    Account from = accountRepo.findById(fromId).orElseThrow();\n    from.setBalance(from.getBalance() - amount);\n    accountRepo.save(from);\n\n    if (amount > 10000) {\n      throw new RuntimeException("限度額超過");\n    }\n\n    Account to = accountRepo.findById(toId).orElseThrow();\n    to.setBalance(to.getBalance() + amount);\n    accountRepo.save(to);\n  }\n}', '@TransactionalはデフォルトでRuntimeException（非チェック例外）発生時にロールバックする。from.setBalance()によるsave()もロールバックされるため、両方のアカウントの残高は変更前の状態に戻る。', 1, 168, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'fromの残高のみ減少し、toの残高は変わらない', FALSE, 1),
    (gen_random_uuid(), q_id, '両方の変更がロールバックされ、残高は変更前に戻る', TRUE, 2),
    (gen_random_uuid(), q_id, 'RuntimeExceptionなのでロールバックされない', FALSE, 3),
    (gen_random_uuid(), q_id, 'fromのsave()は即座にコミットされるためロールバックできない', FALSE, 4);

  -- Q169: ResponseEntityの使い方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、idに対応するUserが存在する場合と存在しない場合のHTTPステータスコードの組み合わせとして正しいのはどれか。\n\n@RestController\n@RequestMapping("/api/users")\npublic class UserApiController {\n  @Autowired\n  private UserService userService;\n\n  @GetMapping("/{id}")\n  public ResponseEntity<User> getUser(@PathVariable Long id) {\n    return userService.findById(id)\n      .map(ResponseEntity::ok)\n      .orElse(ResponseEntity.notFound().build());\n  }\n}', 'ResponseEntity::okは200 OKのResponseEntityを返すメソッド参照。ResponseEntity.notFound().build()は404 Not Foundを返す。findByIdがOptionalを返し、存在すればmap(ok)で200、空ならorElseで404が返される。', 1, 169, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '存在する場合: 200, 存在しない場合: 404', TRUE, 1),
    (gen_random_uuid(), q_id, '存在する場合: 200, 存在しない場合: 500', FALSE, 2),
    (gen_random_uuid(), q_id, '存在する場合: 201, 存在しない場合: 404', FALSE, 3),
    (gen_random_uuid(), q_id, '存在する場合: 200, 存在しない場合: 204', FALSE, 4);

  -- Q170: application.ymlの階層設定
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のapplication.yml設定を読み、spring.jpa.hibernate.ddl-autoの値は何か。\n\nspring:\n  datasource:\n    url: jdbc:postgresql://localhost:5432/mydb\n    username: admin\n  jpa:\n    hibernate:\n      ddl-auto: validate\n    show-sql: true', 'YAMLの階層構造により、spring.jpa.hibernate.ddl-autoはvalidateとなる。validateはエンティティとテーブルの一致を検証するがスキーマ変更は行わないモードである。show-sqlはspring.jpa.show-sqlでtrueとなる。', 1, 170, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'update', FALSE, 1),
    (gen_random_uuid(), q_id, 'create', FALSE, 2),
    (gen_random_uuid(), q_id, 'validate', TRUE, 3),
    (gen_random_uuid(), q_id, 'none', FALSE, 4);

  -- Q171: @Profileによる環境切り替え
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、spring.profiles.active=prodで起動した場合、GET /api/configのレスポンスは何か。\n\n@Configuration\npublic class DataSourceConfig {\n  @Bean\n  @Profile("dev")\n  public String dbUrl() {\n    return "jdbc:h2:mem:devdb";\n  }\n\n  @Bean\n  @Profile("prod")\n  public String dbUrl() {\n    return "jdbc:postgresql://prod-server:5432/appdb";\n  }\n}\n\n@RestController\npublic class ConfigController {\n  @Autowired\n  private String dbUrl;\n\n  @GetMapping("/api/config")\n  public String config() {\n    return dbUrl;\n  }\n}', '@Profile("prod")が付いたBeanのみがアクティブになる。prodプロファイルではPostgreSQLのURLが登録されるため、dbUrlに"jdbc:postgresql://prod-server:5432/appdb"が注入される。', 1, 171, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'jdbc:h2:mem:devdb', FALSE, 1),
    (gen_random_uuid(), q_id, 'jdbc:postgresql://prod-server:5432/appdb', TRUE, 2),
    (gen_random_uuid(), q_id, 'NoUniqueBeanDefinitionException発生', FALSE, 3),
    (gen_random_uuid(), q_id, 'null', FALSE, 4);

  -- Q172: @ManyToOneリレーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のJPAエンティティの関係として正しい説明はどれか。\n\n@Entity\npublic class Comment {\n  @Id\n  @GeneratedValue(strategy = GenerationType.IDENTITY)\n  private Long id;\n  private String content;\n\n  @ManyToOne(fetch = FetchType.LAZY)\n  @JoinColumn(name = "post_id")\n  private Post post;\n}\n\n@Entity\npublic class Post {\n  @Id\n  @GeneratedValue(strategy = GenerationType.IDENTITY)\n  private Long id;\n  private String title;\n\n  @OneToMany(mappedBy = "post")\n  private List<Comment> comments;\n}', '@ManyToOneはCommentから見てPostが「多対一」の関係であることを示す。@JoinColumn(name = "post_id")によりcommentテーブルにpost_id外部キーが作成される。fetch = FetchType.LAZYによりCommentを取得してもPostは実際にアクセスするまで読み込まれない。', 1, 172, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'commentテーブルにpost_id外部キーが作成され、Postは遅延読み込みされる', TRUE, 1),
    (gen_random_uuid(), q_id, 'postテーブルにcomment_id外部キーが作成される', FALSE, 2),
    (gen_random_uuid(), q_id, '中間テーブルpost_commentが自動作成される', FALSE, 3),
    (gen_random_uuid(), q_id, 'FetchType.LAZYなのでCommentからPostを参照できない', FALSE, 4);

  -- Q173: Spring Securityの基本設定
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のSpring Security設定で、認証なしでアクセス可能なパスはどれか。\n\n@Configuration\n@EnableWebSecurity\npublic class SecurityConfig {\n  @Bean\n  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {\n    http\n      .authorizeHttpRequests(auth -> auth\n        .requestMatchers("/api/public/**").permitAll()\n        .requestMatchers("/api/admin/**").hasRole("ADMIN")\n        .anyRequest().authenticated()\n      );\n    return http.build();\n  }\n}', 'permitAll()は認証なしでアクセスを許可する。"/api/public/**"パターンに一致するパスのみ認証不要。"/api/admin/**"はADMINロールが必要。それ以外は認証（ログイン）が必要。', 1, 173, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/api/admin/users', FALSE, 1),
    (gen_random_uuid(), q_id, '/api/public/health', TRUE, 2),
    (gen_random_uuid(), q_id, '/api/users/me', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべてのパスが認証不要', FALSE, 4);

  -- Q174: @Scheduledによる定期実行
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードの動作として正しい説明はどれか。\n\n@Component\npublic class ReportScheduler {\n  @Autowired\n  private ReportService reportService;\n\n  @Scheduled(cron = "0 0 9 * * MON")\n  public void generateWeeklyReport() {\n    reportService.generate();\n  }\n}', 'cron式 "0 0 9 * * MON" は「毎週月曜日の9時0分0秒」を意味する。フォーマットは「秒 分 時 日 月 曜日」である。MONは月曜日を表す。このメソッドは毎週月曜日の午前9時に自動実行される。', 1, 174, 'medium', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎日9時に実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '毎週月曜日の午前9時に実行される', TRUE, 2),
    (gen_random_uuid(), q_id, '9分ごとに実行される', FALSE, 3),
    (gen_random_uuid(), q_id, '毎月1日の9時に実行される', FALSE, 4);

  -- ===== spring_boot / code_reading - HARD (6) =====

  -- Q175: @Transactional伝播の動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、outerMethod()実行中にinnerMethod()内でRuntimeExceptionが発生し、outerMethod()でキャッチした場合の動作はどれか。\n\n@Service\npublic class OuterService {\n  @Autowired\n  private InnerService innerService;\n\n  @Transactional\n  public void outerMethod() {\n    // DB操作A\n    try {\n      innerService.innerMethod();\n    } catch (RuntimeException e) {\n      // 例外をキャッチ\n    }\n    // DB操作B\n  }\n}\n\n@Service\npublic class InnerService {\n  @Transactional(propagation = Propagation.REQUIRED)\n  public void innerMethod() {\n    // DB操作C\n    throw new RuntimeException("エラー");\n  }\n}', 'Propagation.REQUIREDはデフォルトの伝播で、既存トランザクションに参加する。innerMethodで例外が発生すると、参加しているトランザクションにロールバックマークが付く。outerMethodで例外をキャッチしてもトランザクションのコミット時にUnexpectedRollbackExceptionが発生し、操作A/B/Cすべてがロールバックされる。', 1, 175, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '操作AとBはコミットされ、操作Cのみロールバックされる', FALSE, 1),
    (gen_random_uuid(), q_id, 'catchで例外を処理したため操作A/B/Cすべてコミットされる', FALSE, 2),
    (gen_random_uuid(), q_id, 'トランザクションにロールバックマークが付き、A/B/Cすべてロールバックされる', TRUE, 3),
    (gen_random_uuid(), q_id, '操作AはコミットされBとCはロールバックされる', FALSE, 4);

  -- Q176: REQUIRES_NEWの伝播動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードで、processOrder()内でsendNotification()が例外をスローした場合、orderRepository.save(order)の結果はどうなるか。\n\n@Service\npublic class OrderProcessService {\n  @Autowired\n  private OrderRepository orderRepository;\n  @Autowired\n  private NotificationService notificationService;\n\n  @Transactional\n  public void processOrder(Order order) {\n    orderRepository.save(order);\n    try {\n      notificationService.sendNotification(order);\n    } catch (RuntimeException e) {\n      // ログ出力のみ\n    }\n  }\n}\n\n@Service\npublic class NotificationService {\n  @Transactional(propagation = Propagation.REQUIRES_NEW)\n  public void sendNotification(Order order) {\n    // 通知送信処理\n    throw new RuntimeException("通知失敗");\n  }\n}', 'REQUIRES_NEWは既存トランザクションを一時停止し、新しいトランザクションを開始する。sendNotificationの例外で新しいトランザクションはロールバックされるが、元のトランザクションには影響しない。catchで例外を処理しているため、processOrderのトランザクションは正常にコミットされる。', 1, 176, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'orderのsaveはロールバックされる', FALSE, 1),
    (gen_random_uuid(), q_id, 'orderのsaveは正常にコミットされる', TRUE, 2),
    (gen_random_uuid(), q_id, 'UnexpectedRollbackException発生ですべてロールバック', FALSE, 3),
    (gen_random_uuid(), q_id, 'REQUIRES_NEWは無視されREQUIREDと同じ動作になる', FALSE, 4);

  -- Q177: Spring Securityフィルターチェーンの読み取り
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のSpring Security設定で、ADMIN権限のユーザーがPOST /api/usersにリクエストした場合の動作はどれか。\n\n@Configuration\n@EnableWebSecurity\npublic class SecurityConfig {\n  @Bean\n  public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {\n    http\n      .csrf(csrf -> csrf.disable())\n      .authorizeHttpRequests(auth -> auth\n        .requestMatchers(HttpMethod.GET, "/api/**").authenticated()\n        .requestMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")\n        .requestMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")\n        .anyRequest().denyAll()\n      )\n      .httpBasic(Customizer.withDefaults());\n    return http.build();\n  }\n}', 'POST /api/usersは.requestMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")に一致する。リクエスト者がADMIN権限を持っているため、アクセスが許可される。CSRFは無効化されているため、POSTリクエストでもCSRFトークンは不要。', 1, 177, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '403 Forbidden（CSRFトークン不足）', FALSE, 1),
    (gen_random_uuid(), q_id, 'リクエストが許可されて正常に処理される', TRUE, 2),
    (gen_random_uuid(), q_id, '401 Unauthorized', FALSE, 3),
    (gen_random_uuid(), q_id, 'denyAll()によりすべてのリクエストが拒否される', FALSE, 4);

  -- Q178: 循環依存の問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでアプリケーション起動時に発生する問題と、その解決方法として正しいのはどれか。\n\n@Service\npublic class ServiceA {\n  private final ServiceB serviceB;\n  public ServiceA(ServiceB serviceB) {\n    this.serviceB = serviceB;\n  }\n}\n\n@Service\npublic class ServiceB {\n  private final ServiceA serviceA;\n  public ServiceB(ServiceA serviceA) {\n    this.serviceA = serviceA;\n  }\n}', 'ServiceAのコンストラクタでServiceBが必要だが、ServiceBのコンストラクタでServiceAが必要という循環依存が発生する。Spring Boot 2.6以降ではデフォルトで循環依存が禁止されており、起動時にBeanCurrentlyInCreationExceptionが発生する。解決策としてはsetterインジェクション+@Lazyや設計の見直しが必要。', 1, 178, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '循環依存により起動時にエラーが発生する。@Lazyや設計見直しで解決する', TRUE, 1),
    (gen_random_uuid(), q_id, 'Springが自動的に循環を解決するため問題なく動作する', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラーになる', FALSE, 3),
    (gen_random_uuid(), q_id, '実行時にStackOverflowErrorが発生する', FALSE, 4);

  -- Q179: N+1問題の識別
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでdepartmentが10件ある場合、合計何回のSQLクエリが実行されるか。\n\n@Entity\npublic class Department {\n  @Id\n  private Long id;\n  private String name;\n\n  @OneToMany(mappedBy = "department", fetch = FetchType.LAZY)\n  private List<Employee> employees;\n}\n\n@Service\npublic class DeptService {\n  @Autowired\n  private DepartmentRepository deptRepo;\n\n  public List<String> getAllDeptInfo() {\n    List<Department> depts = deptRepo.findAll();\n    return depts.stream()\n      .map(d -> d.getName() + ": " + d.getEmployees().size())\n      .collect(Collectors.toList());\n  }\n}', 'これはN+1問題の典型例。findAll()で1回のクエリが実行されdepartmentを10件取得する。その後、各departmentのgetEmployees()が呼ばれるたびにLAZYフェッチにより個別のSQLが発行される。合計1 + 10 = 11回のクエリが実行される。@EntityGraphやJOIN FETCHで解決可能。', 1, 179, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1回（findAllのみ）', FALSE, 1),
    (gen_random_uuid(), q_id, '2回（departmentとemployeeの2テーブル）', FALSE, 2),
    (gen_random_uuid(), q_id, '10回（department毎に1回）', FALSE, 3),
    (gen_random_uuid(), q_id, '11回（1 + N問題で1 + 10回）', TRUE, 4);

  -- Q180: @Transactional + 自己呼び出しの罠
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでpublicMethod()を外部から呼び出した場合、internalUpdate()のトランザクション動作はどれか。\n\n@Service\npublic class MyService {\n  @Autowired\n  private MyRepository myRepo;\n\n  public void publicMethod() {\n    // 何らかの処理\n    internalUpdate();\n  }\n\n  @Transactional\n  public void internalUpdate() {\n    myRepo.save(new MyEntity("data"));\n  }\n}', 'SpringのAOPプロキシは外部からの呼び出しのみインターセプトする。publicMethod()が同じクラス内のinternalUpdate()を呼ぶ場合、プロキシを経由せずthis.internalUpdate()として直接呼ばれるため、@Transactionalが適用されない。これは自己呼び出し（self-invocation）問題として知られる。', 1, 180, 'hard', 'spring_boot', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Transactionalが正常に適用されトランザクション内で実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '自己呼び出しのためプロキシを経由せず@Transactionalが適用されない', TRUE, 2),
    (gen_random_uuid(), q_id, 'publicMethodに@Transactionalがないためコンパイルエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'internalUpdate()が2回実行される', FALSE, 4);

END $$;
