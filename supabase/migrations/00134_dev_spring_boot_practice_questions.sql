-- ============================================================
-- Dev Practice Quiz: Spring Boot 理解度テスト問題 (20 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000002
-- 4 topic areas × 5 questions each
-- Difficulty: easy 6, medium 10, hard 4 (30/50/20 ratio)
-- ============================================================

-- 1) Source quiz record (non-pool, non-assessment)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000002', 'Spring Boot 理解度テスト問題', 'framework', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

-- 2) 20 questions
DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: アプリケーション構造とDI (DEV-SB-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): アノテーションの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootにおいて、ビジネスロジックを担当するクラスに付与するアノテーションはどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  '@Serviceはビジネスロジック層のBeanであることを示すアノテーションです。@Repositoryはデータアクセス層、@Controllerはリクエスト処理層、@Componentは汎用的なBeanに使用します。機能的には@Componentと同じですが、役割を明示するために使い分けます。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Service', true, 1),
    (gen_random_uuid(), q_id, '@Repository', false, 2),
    (gen_random_uuid(), q_id, '@Controller', false, 3),
    (gen_random_uuid(), q_id, '@Component', false, 4);

  -- T1-Q2 (easy): DIの目的
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '依存性注入（DI）の主な目的として最も適切なものはどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  'DIはクラスが自分で依存オブジェクトを生成するのではなく、フレームワークが外部から注入する仕組みです。これによりクラス間の結合度が下がり、テストや差し替えが容易になります。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラス間の結合度を下げ、テストや差し替えを容易にする', true, 1),
    (gen_random_uuid(), q_id, 'アプリケーションの起動速度を向上させる', false, 2),
    (gen_random_uuid(), q_id, 'データベースへの接続を自動化する', false, 3),
    (gen_random_uuid(), q_id, 'HTTPリクエストのルーティングを管理する', false, 4);

  -- T1-Q3 (medium): コンストラクタインジェクション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootで推奨される依存性注入の方法はどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'コンストラクタインジェクションが現在のベストプラクティスです。finalフィールドを使用でき、依存関係が明示的になります。コンストラクタが1つだけの場合は@Autowiredの記述も不要です。フィールドインジェクション（@Autowiredをフィールドに付与）はテストが困難で依存関係が隠蔽されるため推奨されません。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンストラクタインジェクション（finalフィールド + コンストラクタ）', true, 1),
    (gen_random_uuid(), q_id, 'フィールドインジェクション（@Autowiredをフィールドに付与）', false, 2),
    (gen_random_uuid(), q_id, 'セッターインジェクション（setterメソッドに@Autowired）', false, 3),
    (gen_random_uuid(), q_id, 'staticファクトリーメソッドで直接生成', false, 4);

  -- T1-Q4 (medium): パッケージスキャン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@SpringBootApplicationを付与したクラスが com.example.app パッケージにある場合、自動スキャンの対象となるパッケージはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  '@SpringBootApplicationはコンポーネントスキャンを有効にし、そのクラスのパッケージとサブパッケージのみを対象とします。com.example.appの場合、com.example.app.serviceは対象ですが、com.example.otherは対象外です。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'com.example.app とそのサブパッケージ', true, 1),
    (gen_random_uuid(), q_id, 'com.example 以下の全パッケージ', false, 2),
    (gen_random_uuid(), q_id, 'プロジェクト内の全パッケージ', false, 3),
    (gen_random_uuid(), q_id, '@ComponentScanで明示したパッケージのみ', false, 4);

  -- T1-Q5 (hard): @Repositoryの特別な機能
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@Repositoryアノテーションが@Componentと異なる追加機能として正しいものはどれですか？',
  'multiple_choice', 'hard', 'spring_boot', 'concept',
  '@Repositoryは@Componentの特殊化であり、データアクセス層で発生する例外をSpringのDataAccessExceptionに自動変換する機能を持っています。これにより、JDBCやJPAなど異なるデータアクセス技術固有の例外を統一的に処理できます。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データアクセス例外をSpringのDataAccessExceptionに自動変換する', true, 1),
    (gen_random_uuid(), q_id, 'データベースコネクションプールを自動管理する', false, 2),
    (gen_random_uuid(), q_id, 'トランザクションを自動的に開始・終了する', false, 3),
    (gen_random_uuid(), q_id, 'SQLクエリのキャッシュ機能を提供する', false, 4);

  -- ============================================================
  -- Topic 2: Controller-Service-Repository (DEV-SB-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): レイヤーの依存方向
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootの3層アーキテクチャにおける正しい依存方向はどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  '依存方向は Controller → Service → Repository の一方向のみが正しいです。上方向（Repository → Service）や横方向の依存は設計上の問題であり、循環依存やレイヤー責務の混乱を招きます。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Controller → Service → Repository', true, 1),
    (gen_random_uuid(), q_id, 'Repository → Service → Controller', false, 2),
    (gen_random_uuid(), q_id, 'Controller → Repository → Service', false, 3),
    (gen_random_uuid(), q_id, '各レイヤーが自由に依存してよい', false, 4);

  -- T2-Q2 (medium): Controllerの責務
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Controllerレイヤーの責務として不適切なものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'Controllerの責務はHTTPリクエストの受け取り、バリデーション、Serviceへの委譲、レスポンスの返却です。在庫チェックなどのビジネスロジックはServiceレイヤーが担当すべきです。Controllerにビジネスロジックを含めると、テストが困難になり再利用性が低下します。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '在庫数を確認して不足なら注文を拒否する', true, 1),
    (gen_random_uuid(), q_id, 'HTTPリクエストのパラメータを受け取る', false, 2),
    (gen_random_uuid(), q_id, 'リクエストのバリデーションを行う', false, 3),
    (gen_random_uuid(), q_id, 'Serviceに処理を委譲してレスポンスを返す', false, 4);

  -- T2-Q3 (medium): DTOとEntityの分離
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'DTOとEntityを分離する主な理由として最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'DTOとEntityを分離することで、API仕様とデータベーススキーマを独立に変更できます。Entityのカラム名変更がAPI応答に影響したり、API項目追加のためにテーブルを変更する必要がなくなります。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API仕様とDBスキーマの変更を独立させるため', true, 1),
    (gen_random_uuid(), q_id, 'アプリケーションのメモリ使用量を削減するため', false, 2),
    (gen_random_uuid(), q_id, 'データベースへのクエリ速度を向上させるため', false, 3),
    (gen_random_uuid(), q_id, 'Javaのクラス数を増やしてコード品質を上げるため', false, 4);

  -- T2-Q4 (medium): Serviceレイヤーの責務
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Serviceレイヤーの責務として最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'Serviceレイヤーはビジネスロジックの実装、複数Repositoryの組み合わせ、トランザクション管理を担当します。ResponseEntityの返却はControllerの責務であり、ServiceがHTTPに依存すると再利用性が失われます。',
  2, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数のRepositoryを組み合わせてビジネスロジックを実行する', true, 1),
    (gen_random_uuid(), q_id, 'HTTPステータスコードを決定してResponseEntityを返す', false, 2),
    (gen_random_uuid(), q_id, 'SQLクエリを直接記述してデータを取得する', false, 3),
    (gen_random_uuid(), q_id, 'リクエストのContent-Typeを判定する', false, 4);

  -- T2-Q5 (hard): ControllerがRepositoryを直接呼ぶ問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'ControllerがServiceを介さず直接Repositoryを呼び出す設計の問題点として最も重大なものはどれですか？',
  'multiple_choice', 'hard', 'spring_boot', 'concept',
  'ControllerがRepositoryを直接呼ぶと、ビジネスロジックの追加時にControllerを修正する必要があります。複数のControllerから同じロジックが必要な場合はコードが重複し、トランザクション管理も困難になります。将来の変更がUI層に直接影響するため、保守性が大幅に低下します。',
  3, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ビジネスロジック追加時にController修正が必要になり、ロジックの重複と保守性低下を招く', true, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生してアプリケーションが起動しない', false, 2),
    (gen_random_uuid(), q_id, 'データベースへの接続数が倍増してパフォーマンスが低下する', false, 3),
    (gen_random_uuid(), q_id, 'Spring Bootのセキュリティ機能が無効化される', false, 4);

  -- ============================================================
  -- Topic 3: 設定とProfile管理 (DEV-SB-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): プロファイルの目的
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootのプロファイル機能の主な目的はどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  'プロファイルは環境（開発・ステージング・本番）ごとに異なる設定を適用するための仕組みです。application-dev.ymlやapplication-prod.ymlのように環境別の設定ファイルを用意し、実行時に切り替えます。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '環境ごとに異なる設定（DB接続先、ログレベル等）を切り替える', true, 1),
    (gen_random_uuid(), q_id, 'ユーザーの認証・認可プロファイルを管理する', false, 2),
    (gen_random_uuid(), q_id, 'アプリケーションの性能プロファイリングを行う', false, 3),
    (gen_random_uuid(), q_id, 'Javaのメモリプロファイルを最適化する', false, 4);

  -- T3-Q2 (medium): @Valueと@ConfigurationProperties
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@Valueと@ConfigurationPropertiesの使い分けとして正しいものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  '@Valueは単一値の注入に適しており、@ConfigurationPropertiesはprefixで構造化された設定をまとめてバインドします。グループ化された複数の設定（例: notification.enabled, notification.retry-count, notification.timeout）を管理する場合は@ConfigurationPropertiesが適切です。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Valueは単一値、@ConfigurationPropertiesはグループ化された設定のバインドに適する', true, 1),
    (gen_random_uuid(), q_id, '@Valueは本番環境用、@ConfigurationPropertiesは開発環境用に使う', false, 2),
    (gen_random_uuid(), q_id, '@ValueはString型のみ、@ConfigurationPropertiesは全型に対応する', false, 3),
    (gen_random_uuid(), q_id, '両者は完全に同じ機能であり、好みで使い分ける', false, 4);

  -- T3-Q3 (medium): 設定の優先順位
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootの設定値が複数の場所で定義されている場合、最も優先されるものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'Spring Bootの設定優先順位は、コマンドライン引数 > 環境変数 > application-{profile}.yml > application.yml の順です。本番デプロイ時にコマンドライン引数やOS環境変数でファイルの設定を上書きできます。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コマンドライン引数（--server.port=9090）', true, 1),
    (gen_random_uuid(), q_id, 'application.yml（ベース設定ファイル）', false, 2),
    (gen_random_uuid(), q_id, 'application-prod.yml（プロファイル別設定ファイル）', false, 3),
    (gen_random_uuid(), q_id, 'ソースコード内のハードコーディング', false, 4);

  -- T3-Q4 (medium): セキュリティのベストプラクティス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '本番環境のデータベースパスワードの管理方法として最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  '本番のパスワードやシークレットはYAMLファイルに直接書かず、環境変数やシークレット管理ツールで管理します。YAMLには${DB_PASSWORD}のようなプレースホルダーを記述し、実行時に環境変数から値を注入します。YAMLファイルをGitにコミットしてもパスワードが漏洩しません。',
  2, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'YAMLに${DB_PASSWORD}プレースホルダーを記述し、環境変数で注入する', true, 1),
    (gen_random_uuid(), q_id, 'application-prod.ymlに直接パスワードを記述し、.gitignoreに追加する', false, 2),
    (gen_random_uuid(), q_id, 'ソースコード内にfinal定数として定義する', false, 3),
    (gen_random_uuid(), q_id, 'application.ymlにBase64エンコードして記述する', false, 4);

  -- T3-Q5 (hard): プロファイル設定の競合
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'application.ymlにserver.port=8080、application-prod.ymlにserver.port=9090と定義し、--spring.profiles.active=prodで起動した場合、さらにコマンドラインで--server.port=7070を指定するとポート番号はいくつになりますか？',
  'multiple_choice', 'hard', 'spring_boot', 'concept',
  '設定の優先順位はコマンドライン引数 > プロファイル別ファイル > ベースファイルです。コマンドライン引数の--server.port=7070が最も高い優先順位を持つため、application-prod.ymlの9090よりも優先されます。',
  3, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '7070（コマンドライン引数が最優先）', true, 1),
    (gen_random_uuid(), q_id, '9090（プロファイル設定が最優先）', false, 2),
    (gen_random_uuid(), q_id, '8080（ベース設定が最優先）', false, 3),
    (gen_random_uuid(), q_id, 'エラーで起動しない（設定の競合）', false, 4);

  -- ============================================================
  -- Topic 4: データアクセス・トランザクション (DEV-SB-04) — 5 questions
  -- ============================================================

  -- T4-Q1 (easy): JPA Repositoryの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Data JPAでfindByDepartment(String department)というメソッドを定義した場合の動作はどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  'Spring Data JPAはメソッド名からクエリを自動生成します。findByDepartmentは「departmentカラムが引数と一致するレコードを検索する」クエリに変換されます。SQLを明示的に書く必要がありません。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'departmentカラムが引数と一致するレコードを自動検索する', true, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーになる（実装が必要）', false, 2),
    (gen_random_uuid(), q_id, '全レコードを取得してからJavaでフィルタリングする', false, 3),
    (gen_random_uuid(), q_id, 'departmentテーブル自体を検索する', false, 4);

  -- T4-Q2 (medium): @Transactionalのロールバック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@Transactionalが付与されたメソッドで例外が発生した場合、デフォルトでロールバックされるのはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'Spring Bootの@Transactionalはデフォルトで、RuntimeException（非チェック例外）が発生した場合のみロールバックします。チェック例外（IOExceptionなど）ではロールバックされません。チェック例外でもロールバックしたい場合はrollbackFor = Exception.classを指定する必要があります。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'RuntimeException（非チェック例外）のみ', true, 1),
    (gen_random_uuid(), q_id, '全ての例外（チェック例外含む）', false, 2),
    (gen_random_uuid(), q_id, 'IOExceptionのみ', false, 3),
    (gen_random_uuid(), q_id, 'Errorクラスのみ', false, 4);

  -- T4-Q3 (medium): readOnly = true
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@Transactional(readOnly = true)を指定する主な効果はどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'readOnly = trueを指定すると、JPAのダーティチェック（変更検知）が無効化され、メモリ使用量とCPU負荷が軽減されます。読み取り専用の操作であることをフレームワークに伝えることでパフォーマンスが最適化されます。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ダーティチェックが無効化され、読み取りパフォーマンスが向上する', true, 1),
    (gen_random_uuid(), q_id, 'データベースへの接続がリードレプリカに自動切替される', false, 2),
    (gen_random_uuid(), q_id, 'SELECT文以外のSQLが自動的にブロックされる', false, 3),
    (gen_random_uuid(), q_id, 'トランザクション自体が開始されなくなる', false, 4);

  -- T4-Q4 (hard): N+1問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  '@OneToMany(fetch = FetchType.LAZY)で関連付けられたEntityをfindAll()で100件取得し、ループ内で関連コレクションにアクセスした場合、発行されるSQLクエリの総数は最大何件ですか？',
  'multiple_choice', 'hard', 'spring_boot', 'concept',
  'これがN+1問題です。findAll()で1クエリ（親Entity100件取得）、その後ループ内で各親Entityの関連コレクションにアクセスするたびに1クエリが発行されるため、最大で1 + 100 = 101クエリになります。Fetch Joinや@EntityGraphで1〜2クエリに削減できます。',
  3, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '101件（1件のfindAll + 100件の関連データ取得）', true, 1),
    (gen_random_uuid(), q_id, '1件（JPAが自動的にJOINで取得する）', false, 2),
    (gen_random_uuid(), q_id, '100件（親Entityの件数と同じ）', false, 3),
    (gen_random_uuid(), q_id, '2件（親テーブルと子テーブルの2クエリ）', false, 4);

  -- T4-Q5 (hard): privateメソッドの@Transactional
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000002',
  'Spring Bootでprivateメソッドに@Transactionalを付与した場合の動作はどれですか？',
  'multiple_choice', 'hard', 'spring_boot', 'concept',
  'Spring BootはAOPプロキシを使って@Transactionalを実現しています。privateメソッドはプロキシ経由で呼び出せないため、@Transactionalが無視されます。同様に、同じクラス内でthis.method()で呼び出した場合もプロキシを経由しないため、トランザクションが適用されません。',
  3, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Transactionalが無視され、トランザクション管理が行われない', true, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', false, 2),
    (gen_random_uuid(), q_id, '正常にトランザクションが適用される', false, 3),
    (gen_random_uuid(), q_id, '起動時にBeanDefinitionExceptionが発生する', false, 4);

END $$;
