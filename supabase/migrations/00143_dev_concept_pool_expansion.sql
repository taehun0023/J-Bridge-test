-- ============================================================
-- Expand concept question pool for Step 4 comprehensive exam
-- Fixes bottleneck slots where overlap > 30% across 3 attempts
-- spring_boot +5, sql +5, javascript +1, react +5 = 16 total
-- All inserted into assessment quiz a0000004-*
-- ============================================================

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Spring Boot concept +5 (easy 2 + medium 3)
  -- ============================================================

  -- SB-C1 (easy): Beanのライフサイクル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Spring Bootにおけるアプリケーション起動時のBeanの登録プロセスとして正しいものはどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  '@SpringBootApplicationが付与されたクラスのパッケージとサブパッケージを自動スキャンし、@Component系アノテーション（@Service, @Repository, @Controller含む）が付いたクラスをBeanとして登録します。',
  1, 391, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パッケージスキャンで@Component系アノテーションのクラスを検出し登録', true, 1),
    (gen_random_uuid(), q_id, 'XMLファイルにBeanを全て定義する', false, 2),
    (gen_random_uuid(), q_id, '開発者がmain()内で手動でnewして登録する', false, 3),
    (gen_random_uuid(), q_id, 'アプリケーション起動後にリクエストが来た時点で初めて登録される', false, 4);

  -- SB-C2 (easy): Serviceの単体テスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Spring BootでServiceクラスの単体テストが容易になる理由はどれですか？',
  'multiple_choice', 'easy', 'spring_boot', 'concept',
  'DIにより依存先をモック（テスト用偽物）に差し替えられるため、DBやAPIに接続せずにServiceのロジックだけをテストできます。フィールド注入より、コンストラクタ注入の方がモックの差し替えが簡単です。',
  1, 392, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DIにより依存先をモックに差し替えて、ロジックのみテストできる', true, 1),
    (gen_random_uuid(), q_id, 'Springが自動的にテストコードを生成する', false, 2),
    (gen_random_uuid(), q_id, 'Serviceは常にstaticメソッドだからテストしやすい', false, 3),
    (gen_random_uuid(), q_id, 'テストには必ず本番DBへの接続が必要', false, 4);

  -- SB-C3 (medium): Propagation属性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  '@Transactionalのpropagation属性REQUIRES_NEWの動作はどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'REQUIRES_NEWは常に新しいトランザクションを作成し、既存のトランザクションがあれば一時停止します。内側のトランザクションが失敗しても外側には影響しません。監査ログの記録など、メインの処理結果に関わらず確実にCOMMITしたい場合に使用します。',
  2, 393, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '既存トランザクションを一時停止し、常に新しいトランザクションを作成する', true, 1),
    (gen_random_uuid(), q_id, '既存トランザクションに参加し、なければ新規作成する', false, 2),
    (gen_random_uuid(), q_id, '既存トランザクションが必須で、なければ例外をスローする', false, 3),
    (gen_random_uuid(), q_id, 'トランザクションを使用しない', false, 4);

  -- SB-C4 (medium): Entity vs DTO
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Entityクラスを直接APIレスポンスとして返す場合のリスクはどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  'Entityを直接返すと、パスワードなどの機密フィールドがAPIレスポンスに含まれる可能性があります。またDB側のカラム変更がAPIの応答形式に直接影響するため、DTOを使用してAPI仕様とDB構造を分離すべきです。',
  2, 394, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '機密フィールドが露出し、DB変更がAPI応答に直接影響する', true, 1),
    (gen_random_uuid(), q_id, 'パフォーマンスが著しく低下する', false, 2),
    (gen_random_uuid(), q_id, 'Entityは@RestControllerで返せないためコンパイルエラーになる', false, 3),
    (gen_random_uuid(), q_id, 'JPA Sessionが自動的に閉じられてデータが消える', false, 4);

  -- SB-C5 (medium): @EntityGraph
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'N+1問題の解決策として@EntityGraphを使用する利点はどれですか？',
  'multiple_choice', 'medium', 'spring_boot', 'concept',
  '@EntityGraphはJPQLを書かずにアノテーションだけで関連エンティティのEager Loadingを指定できます。Fetch Joinと同様に1クエリで関連データを取得しますが、リポジトリメソッドに宣言的に適用できるため可読性が高いです。',
  2, 395, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JPQLなしでアノテーションだけでEager Loading指定できる', true, 1),
    (gen_random_uuid(), q_id, 'N+1問題を検出してログに出力する', false, 2),
    (gen_random_uuid(), q_id, 'キャッシュ機能を自動で有効にする', false, 3),
    (gen_random_uuid(), q_id, 'SQL実行を完全にスキップする', false, 4);

  -- ============================================================
  -- SQL concept +5 (easy 2 + medium 3)
  -- ============================================================

  -- SQL-C1 (easy): PRIMARY KEY
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'PRIMARY KEY制約の特徴として正しいものはどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'PRIMARY KEYはテーブル内の各行を一意に識別するための制約です。NULLを許容せず（NOT NULL + UNIQUE）、テーブルごとに1つだけ定義できます。複合主キーとして複数カラムの組み合わせも可能です。',
  1, 396, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各行を一意に識別し、NULLを許容しない', true, 1),
    (gen_random_uuid(), q_id, 'NULLを許容するが値の重複は不可', false, 2),
    (gen_random_uuid(), q_id, '1テーブルに複数定義でき、NULLも許容する', false, 3),
    (gen_random_uuid(), q_id, '外部キー参照のためだけに使用される', false, 4);

  -- SQL-C2 (easy): ORDER BYの方向
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'ORDER BY price DESCの意味として正しいものはどれですか？',
  'multiple_choice', 'easy', 'sql', 'concept',
  'DESCはdescending（降順）の略で、値が大きい順に並べます。ASCはascending（昇順）で、ORDER BYのデフォルトはASCです。',
  1, 397, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'priceが大きい順（降順）に並べる', true, 1),
    (gen_random_uuid(), q_id, 'priceが小さい順（昇順）に並べる', false, 2),
    (gen_random_uuid(), q_id, 'priceの重複を排除する', false, 3),
    (gen_random_uuid(), q_id, 'priceがNULLの行を先頭に表示する', false, 4);

  -- SQL-C3 (medium): 外部キーの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  '外部キー（FOREIGN KEY）制約の主な役割はどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  '外部キーは参照先テーブルに存在しない値の挿入を防ぎ、テーブル間の関係性（参照整合性）を保証します。例えばemployeesのdepartment_idにFKがあれば、departmentsテーブルに存在しないIDは挿入できません。',
  2, 398, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '参照先に存在しない値の挿入を防ぎ、テーブル間の参照整合性を保証する', true, 1),
    (gen_random_uuid(), q_id, 'テーブルの検索速度を向上させる（インデックスと同等）', false, 2),
    (gen_random_uuid(), q_id, 'テーブルのデータを暗号化する', false, 3),
    (gen_random_uuid(), q_id, 'JOINを使用する際に必須の制約', false, 4);

  -- SQL-C4 (medium): DISTINCTの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'SELECT DISTINCT department FROM employeesの動作はどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'DISTINCTは結果から重複行を除去します。employeesの全departmentカラムから一意な値のみを返します。10人が3部署に所属していれば、結果は3行になります。',
  2, 399, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '重複を除去し、一意なdepartment値のみ返す', true, 1),
    (gen_random_uuid(), q_id, 'departmentカラムにUNIQUE制約を追加する', false, 2),
    (gen_random_uuid(), q_id, '最初に見つかったdepartmentだけを返す', false, 3),
    (gen_random_uuid(), q_id, 'NULLのdepartmentを除外する', false, 4);

  -- SQL-C5 (medium): ALTER TABLE
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  '本番環境でALTER TABLEを実行する際に注意すべきことはどれですか？',
  'multiple_choice', 'medium', 'sql', 'concept',
  'ALTER TABLEでカラム追加は比較的安全ですが、既存カラムの型変更やNOT NULL追加は既存データとの整合性チェックが必要です。大きなテーブルではロックが長時間かかり、サービスに影響する可能性があります。',
  2, 400, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大きなテーブルではロックが長時間かかり、サービスに影響する可能性がある', true, 1),
    (gen_random_uuid(), q_id, 'ALTER TABLEは常に即座に完了する', false, 2),
    (gen_random_uuid(), q_id, 'ALTER TABLEは自動的にROLLBACKされる', false, 3),
    (gen_random_uuid(), q_id, 'ALTER TABLEはテストDB以外では使用できない', false, 4);

  -- ============================================================
  -- JavaScript concept +1 (medium 1)
  -- ============================================================

  -- JS-C1 (medium): テンプレートリテラル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'JavaScriptのテンプレートリテラル（バッククォート）の特徴として正しいものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'テンプレートリテラル（``）は複数行の文字列を改行なしで記述でき、${式}で変数や式を埋め込めます。通常の文字列（''や""）では改行に\nが必要で、変数は+で結合する必要があります。',
  2, 401, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数行記述と${式}による変数埋め込みが可能', true, 1),
    (gen_random_uuid(), q_id, '通常の文字列より処理速度が速い', false, 2),
    (gen_random_uuid(), q_id, 'HTMLタグを自動的にエスケープする', false, 3),
    (gen_random_uuid(), q_id, 'TypeScript専用の構文', false, 4);

  -- ============================================================
  -- React concept +5 (easy 2 + medium 3)
  -- ============================================================

  -- REACT-C1 (easy): 単方向データフロー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Reactの「単方向データフロー」の意味として正しいものはどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  'Reactではデータは親から子へPropsとして一方向に流れます。子が親のデータを直接変更することはできず、コールバック関数経由で間接的に通知します。これによりデータの流れが予測しやすくなります。',
  1, 402, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データが親→子の一方向にPropsとして流れる', true, 1),
    (gen_random_uuid(), q_id, 'データがコンポーネント間を自由に双方向に流れる', false, 2),
    (gen_random_uuid(), q_id, 'データベースからUIへの一方向のみ更新可能', false, 3),
    (gen_random_uuid(), q_id, 'グローバル変数で全コンポーネントが共有する', false, 4);

  -- REACT-C2 (easy): Fragmentの用途
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Reactで<></>（Fragment）を使用する理由はどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  'Reactコンポーネントは単一のルート要素を返す必要があります。Fragmentを使うと余分なDOMノード（divなど）を追加せずに複数の要素をグループ化できます。',
  1, 403, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '余分なDOMノードなしで複数要素をグループ化する', true, 1),
    (gen_random_uuid(), q_id, 'コンポーネントのパフォーマンスを最適化する', false, 2),
    (gen_random_uuid(), q_id, 'エラーバウンダリとして機能する', false, 3),
    (gen_random_uuid(), q_id, 'CSSスタイルを自動適用する', false, 4);

  -- REACT-C3 (medium): useContextの用途
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'ReactのuseContextが解決する問題はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'Props drilling（深いコンポーネントツリーでPropsを中間コンポーネントに何段も渡す）を回避できます。Contextに値を設定すれば、ツリー内のどのコンポーネントからでも直接アクセスできます。テーマ、認証状態、言語設定など広範囲で共有する値に適しています。',
  2, 404, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Props drilling（中間コンポーネントへの不要なProps受け渡し）の回避', true, 1),
    (gen_random_uuid(), q_id, 'APIリクエストのキャッシュ管理', false, 2),
    (gen_random_uuid(), q_id, 'コンポーネントのスタイリング', false, 3),
    (gen_random_uuid(), q_id, 'ルーティングの管理', false, 4);

  -- REACT-C4 (medium): 制御コンポーネントと非制御コンポーネント
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'Reactの制御コンポーネント（controlled component）の特徴はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  '制御コンポーネントはフォーム要素の値をReact Stateで管理します。valueとonChange属性を組み合わせて、入力値を常にStateと同期させます。バリデーションや入力制御が容易になりますが、非制御コンポーネント（useRef）より記述量が多くなります。',
  2, 405, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フォーム値をReact Stateで管理し、value+onChangeで同期する', true, 1),
    (gen_random_uuid(), q_id, 'DOM要素をuseRefで直接操作する', false, 2),
    (gen_random_uuid(), q_id, 'サーバーサイドでフォーム処理を行う', false, 3),
    (gen_random_uuid(), q_id, 'フォーム送信時のみStateを更新する', false, 4);

  -- REACT-C5 (medium): useRefの用途
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004',
  'useRefの特徴としてuseStateと異なる点はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'useRefは.currentの値が変更されても再レンダリングをトリガーしません。レンダリングをまたいで値を保持したいが、UIの更新は不要な場合（タイマーID、DOM参照、前回の値の記憶など）に使用します。',
  2, 406, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '値の変更が再レンダリングをトリガーしない', true, 1),
    (gen_random_uuid(), q_id, '初期値が設定できない', false, 2),
    (gen_random_uuid(), q_id, 'コンポーネントのアンマウント時に値がリセットされる', false, 3),
    (gen_random_uuid(), q_id, 'サーバーコンポーネントでのみ使用可能', false, 4);

END $$;
