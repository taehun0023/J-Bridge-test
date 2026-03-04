-- ============================================
-- J-Bridge Seed Data: IT語彙テスト (5セット × 50問 = 250問)
-- quiz_type: 'it_terminology', is_assessment: false
-- Categories:
--   Set 1: 開発基礎 (Development Basics)
--   Set 2: インフラ (Infrastructure)
--   Set 3: テスト・品質 (Testing & QA)
--   Set 4: プロジェクト管理 (Project Management)
--   Set 5: 総合 (Mixed/Advanced)
-- ============================================

BEGIN;

-- ============================================
-- Quiz 1: IT語彙テスト 第1回 - 開発基礎
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b1000001-0000-0000-0000-000000000001';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第1回', 'it_terminology', 70, 15, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「API」とは何の略称ですか？', 'API（Application Programming Interface）はソフトウェア同士が通信するためのインターフェースです。', 2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Application Programming Interface', TRUE, 1),
    (gen_random_uuid(), q_id, 'Advanced Program Integration', FALSE, 2),
    (gen_random_uuid(), q_id, 'Automated Process Interface', FALSE, 3),
    (gen_random_uuid(), q_id, 'Application Process Integration', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「IDE」の意味として最も適切なものは？', 'IDE（Integrated Development Environment）は統合開発環境のことで、コード編集・ビルド・デバッグなどを一つのツールで行えます。', 2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '統合開発環境', TRUE, 1),
    (gen_random_uuid(), q_id, 'インターネット配信環境', FALSE, 2),
    (gen_random_uuid(), q_id, '内部データ暗号化', FALSE, 3),
    (gen_random_uuid(), q_id, 'インフラ設計エンジン', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Git」について正しい説明はどれですか？', 'Gitは分散型バージョン管理システムで、ソースコードの変更履歴を追跡・管理します。', 2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '分散型バージョン管理システム', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの保存と検索を行うデータベース管理システム', FALSE, 2),
    (gen_random_uuid(), q_id, 'プロジェクト管理ツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの自動実行と結果検証を行うツール', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コミット」の意味として最も適切なものは？', 'コミット（Commit）はソースコードの変更内容をリポジトリに記録する操作です。', 2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更内容をリポジトリに記録すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードをサーバーにデプロイすること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブランチを作成すること', FALSE, 3),
    (gen_random_uuid(), q_id, '不要になったソースコードを整理して削除すること', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プルリクエスト」とは何ですか？', 'プルリクエスト（Pull Request）は変更内容をレビューしてもらい、メインブランチに統合するための依頼です。', 2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コード変更のレビューと統合を依頼すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'リモートリポジトリからコードを取得すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ローカルブランチを削除すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードをコンパイルすること', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マージ」の意味として最も適切なものは？', 'マージ（Merge）は複数のブランチの変更内容を一つに統合する操作です。', 2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブランチの変更を統合すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードを分岐させること', FALSE, 2),
    (gen_random_uuid(), q_id, 'リポジトリを複製すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードを圧縮すること', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リポジトリ」とは何ですか？', 'リポジトリ（Repository）はソースコードやファイルの変更履歴を保存する場所です。', 2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコードと変更履歴の保存場所', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト実行用に構築された専用環境', FALSE, 2),
    (gen_random_uuid(), q_id, 'アプリを本番公開するためのサーバー', FALSE, 3),
    (gen_random_uuid(), q_id, '技術文書を整理して管理するツール', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デプロイ」の意味として最も適切なものは？', 'デプロイ（Deploy）は開発したアプリケーションを本番環境に配置・公開する作業です。', 2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリケーションを本番環境に配置すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソースコードの動作を検証すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのテーブル構造を設計すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムの仕様書や設計書を作成すること', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フレームワーク」とは何ですか？', 'フレームワーク（Framework）はアプリケーション開発の土台となる基本構造やライブラリ集です。', 2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリ開発の基本構造を提供するソフトウェア', TRUE, 1),
    (gen_random_uuid(), q_id, 'コンピュータ機器の回路構成を示す設計図', FALSE, 2),
    (gen_random_uuid(), q_id, '機器同士をネットワークで接続する通信方式', FALSE, 3),
    (gen_random_uuid(), q_id, '機密データを安全に保護するための暗号化手法', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ライブラリ」の意味として最も適切なものは？', 'ライブラリ（Library）は再利用可能な関数やクラスをまとめたコード集です。', 2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再利用可能な関数やクラスの集合', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを永続的に保存するデータベースの一種', FALSE, 2),
    (gen_random_uuid(), q_id, '開発時に使用するテスト環境を指す用語', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク上で稼働するサーバーの種類', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SDK」とは何の略称ですか？', 'SDK（Software Development Kit）はソフトウェア開発に必要なツール一式です。', 2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Software Development Kit', TRUE, 1),
    (gen_random_uuid(), q_id, 'System Design Knowledge', FALSE, 2),
    (gen_random_uuid(), q_id, 'Server Data Keeper', FALSE, 3),
    (gen_random_uuid(), q_id, 'Secure Data Key', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コンパイル」の意味として最も適切なものは？', 'コンパイル（Compile）はソースコードを機械語に変換する処理です。', 2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコードを機械語に変換すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソースコードの動作を検証すること', FALSE, 2),
    (gen_random_uuid(), q_id, '完成したコードを本番環境にデプロイすること', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソースコードのバックアップを取得すること', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ビルド」とは何ですか？', 'ビルド（Build）はソースコードをコンパイル・リンクして実行可能なプログラムを生成する工程です。', 2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行可能なプログラムを生成する工程', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードに含まれるバグを発見して修正する作業', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのテーブルや構造を構築する作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーのプロセスを開始して起動する操作', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デバッグ」の意味として最も適切なものは？', 'デバッグ（Debug）はプログラムの不具合（バグ）を発見し修正する作業です。', 2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムのバグを発見・修正すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムをデプロイすること', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラムを設計すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'プログラムをバックアップすること', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リファクタリング」とは何ですか？', 'リファクタリング（Refactoring）は外部の動作を変えずに、コードの内部構造を改善する作業です。', 2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '動作を変えずにコードの内部構造を改善すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムに新しい機能や要件を追加すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラム内の不具合を発見して修正すること', FALSE, 3),
    (gen_random_uuid(), q_id, '不要になったソースコードを整理して削除すること', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI/CD」の「CI」は何の略称ですか？', 'CI（Continuous Integration）は継続的インテグレーションのことで、コード変更を頻繁に統合する手法です。', 2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Continuous Integration', TRUE, 1),
    (gen_random_uuid(), q_id, 'Code Inspection', FALSE, 2),
    (gen_random_uuid(), q_id, 'Central Infrastructure', FALSE, 3),
    (gen_random_uuid(), q_id, 'Common Interface', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI/CD」の「CD」は何の略称ですか？', 'CD（Continuous Delivery/Deployment）は継続的デリバリー/デプロイメントの略です。', 2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Continuous Delivery / Continuous Deployment', TRUE, 1),
    (gen_random_uuid(), q_id, 'Code Distribution for Application Modules', FALSE, 2),
    (gen_random_uuid(), q_id, 'Central Database Configuration Protocol', FALSE, 3),
    (gen_random_uuid(), q_id, 'Configuration Design Management System', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「JSON」とは何の略称ですか？', 'JSON（JavaScript Object Notation）はデータ交換用の軽量フォーマットです。', 2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JavaScript Object Notation', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java Standard Object Network', FALSE, 2),
    (gen_random_uuid(), q_id, 'Joint System Operation Node', FALSE, 3),
    (gen_random_uuid(), q_id, 'JavaScript Online Service Name', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「REST API」の「REST」とは何ですか？', 'REST（Representational State Transfer）はWebサービスの設計原則の一つです。', 2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Representational State Transfer', TRUE, 1),
    (gen_random_uuid(), q_id, 'Remote Execution Standard Technology', FALSE, 2),
    (gen_random_uuid(), q_id, 'Real-time Event Stream Transfer', FALSE, 3),
    (gen_random_uuid(), q_id, 'Reliable Server Transmission', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「エンドポイント」の意味として最も適切なものは？', 'エンドポイント（Endpoint）はAPIの接続先URLのことです。', 2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'APIの接続先URL', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムの最終行', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワークの終端装置', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの最後のレコード', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バージョン管理」の説明として最も適切なものは？', 'バージョン管理はファイルの変更履歴を記録・追跡し、過去の状態に戻せるようにする仕組みです。', 2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ファイルの変更履歴を記録・追跡する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソフトウェア製品の販売と流通を管理するシステム', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーのOSやミドルウェアを更新する作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトで使用するプログラミング言語の管理', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「オブジェクト指向」の英語表記は？', 'オブジェクト指向（Object-Oriented）はデータと処理をオブジェクトとしてまとめるプログラミングパラダイムです。', 2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Object-Oriented', TRUE, 1),
    (gen_random_uuid(), q_id, 'Output-Organized', FALSE, 2),
    (gen_random_uuid(), q_id, 'Operation-Optimized', FALSE, 3),
    (gen_random_uuid(), q_id, 'Open-Option', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「継承」（けいしょう）はオブジェクト指向の概念ですが、英語では何と言いますか？', '継承（Inheritance）は親クラスの属性やメソッドを子クラスが引き継ぐ仕組みです。', 2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Inheritance', TRUE, 1),
    (gen_random_uuid(), q_id, 'Encapsulation', FALSE, 2),
    (gen_random_uuid(), q_id, 'Polymorphism', FALSE, 3),
    (gen_random_uuid(), q_id, 'Abstraction', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「カプセル化」の説明として最も適切なものは？', 'カプセル化（Encapsulation）はデータと処理を一つにまとめ、外部からの直接アクセスを制限する仕組みです。', 2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データと処理をまとめ外部アクセスを制限すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを暗号化して外部に漏洩しないようにすること', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラムのファイルサイズを圧縮して保存すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードを複数のファイルやモジュールに分割すること', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ポリモーフィズム」とは何ですか？', 'ポリモーフィズム（Polymorphism）は同一のインターフェースで異なる動作を実現する多態性です。', 2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '同一インターフェースで異なる動作を実現すること', TRUE, 1),
    (gen_random_uuid(), q_id, '複数のクラスを一つに統合して管理すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースを複数のサーバーに分散配置すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーを複数台構成にして冗長化運用すること', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「変数」（へんすう）の英語表記は？', '変数（Variable）はプログラムでデータを格納するための名前付きの領域です。', 2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Variable', TRUE, 1),
    (gen_random_uuid(), q_id, 'Function', FALSE, 2),
    (gen_random_uuid(), q_id, 'Constant', FALSE, 3),
    (gen_random_uuid(), q_id, 'Parameter', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「関数」（かんすう）の説明として正しいものは？', '関数（Function）は特定の処理をまとめて名前を付け、繰り返し呼び出せるようにしたものです。', 2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '特定の処理をまとめて再利用可能にしたもの', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムの実行中にデータを保存する領域', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラム実行時に表示されるエラーメッセージ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルのデータ形式や種類を示す拡張子', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「配列」（はいれつ）の英語表記は？', '配列（Array）は同じ型のデータを連続して格納するデータ構造です。', 2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Array', TRUE, 1),
    (gen_random_uuid(), q_id, 'Object', FALSE, 2),
    (gen_random_uuid(), q_id, 'String', FALSE, 3),
    (gen_random_uuid(), q_id, 'Boolean', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「例外処理」（れいがいしょり）の英語表記は？', '例外処理（Exception Handling）はプログラム実行中に発生するエラーに対処する仕組みです。', 2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Exception Handling', TRUE, 1),
    (gen_random_uuid(), q_id, 'Error Logging System', FALSE, 2),
    (gen_random_uuid(), q_id, 'Bug Tracking Tool', FALSE, 3),
    (gen_random_uuid(), q_id, 'Code Review Process', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スタック」と「キュー」の違いとして正しいものは？', 'スタック（Stack）はLIFO（後入れ先出し）、キュー（Queue）はFIFO（先入れ先出し）のデータ構造です。', 2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スタックはLIFO、キューはFIFO', TRUE, 1),
    (gen_random_uuid(), q_id, 'スタックはFIFO、キューはLIFO', FALSE, 2),
    (gen_random_uuid(), q_id, '両方ともFIFO', FALSE, 3),
    (gen_random_uuid(), q_id, '両方ともLIFO', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「npm」とは何ですか？', 'npm（Node Package Manager）はNode.jsのパッケージ管理ツールです。', 2, 31);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Node.jsのパッケージ管理ツール', TRUE, 1),
    (gen_random_uuid(), q_id, 'Pythonのパッケージ管理ツール', FALSE, 2),
    (gen_random_uuid(), q_id, 'Javaのビルドツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの構造やデータを管理する運用ツール', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コールバック関数」の説明として最も適切なものは？', 'コールバック関数（Callback Function）は別の関数の引数として渡され、後から呼び出される関数です。', 2, 32);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '他の関数に引数として渡され後から呼び出される関数', TRUE, 1),
    (gen_random_uuid(), q_id, 'エラー発生時にシステムが自動的に呼び出す関数', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラムの起動時に最初に呼び出されて実行される関数', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースへの接続を確立して操作するための関数', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「非同期処理」（ひどうきしょり）の英語表記は？', '非同期処理（Asynchronous Processing）は処理の完了を待たずに次の処理を実行する方式です。', 2, 33);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Asynchronous Processing', TRUE, 1),
    (gen_random_uuid(), q_id, 'Synchronous Processing', FALSE, 2),
    (gen_random_uuid(), q_id, 'Parallel Computing', FALSE, 3),
    (gen_random_uuid(), q_id, 'Sequential Processing', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「型」（かた）の英語表記で最も一般的なものは？', '型（Type）はデータの種類を定義するもので、String、Number、Booleanなどがあります。', 2, 34);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Type', TRUE, 1),
    (gen_random_uuid(), q_id, 'Mode', FALSE, 2),
    (gen_random_uuid(), q_id, 'Kind', FALSE, 3),
    (gen_random_uuid(), q_id, 'Class', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コンソール」の開発における主な用途は？', 'コンソール（Console）は開発者がログ出力やデバッグ情報を確認するためのインターフェースです。', 2, 35);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ログ出力やデバッグ情報の確認', TRUE, 1),
    (gen_random_uuid(), q_id, '画像やレイアウトの視覚的な編集作業', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの構造やレコードを管理する作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク機器の通信状態の監視と管理', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「パッケージマネージャー」の役割は？', 'パッケージマネージャーはライブラリや依存関係のインストール・管理を行うツールです。', 2, 36);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ライブラリや依存関係の管理', TRUE, 1),
    (gen_random_uuid(), q_id, 'メモリ領域の割り当てと解放の管理', FALSE, 2),
    (gen_random_uuid(), q_id, 'ファイルサイズを圧縮して保存する処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーの稼働状態と性能の監視業務', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スニペット」とは何ですか？', 'スニペット（Snippet）は再利用可能な短いコード断片のことです。', 2, 37);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再利用可能な短いコード断片', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードのエラーメッセージ', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストケースの一種', FALSE, 3),
    (gen_random_uuid(), q_id, 'デザインパターンの名前', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「シンタックスエラー」とは何ですか？', 'シンタックスエラー（Syntax Error）はプログラムの文法規則に違反した場合に発生するエラーです。', 2, 38);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの文法エラー', TRUE, 1),
    (gen_random_uuid(), q_id, 'メモリ不足エラー', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク接続エラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース接続エラー', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ランタイム」の意味として最も適切なものは？', 'ランタイム（Runtime）はプログラムが実行されている時間・環境のことです。', 2, 39);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの実行時・実行環境', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムのコンパイル時間', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラムの設計時間', FALSE, 3),
    (gen_random_uuid(), q_id, 'プログラムのテスト時間', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ソースコード」と「バイトコード」の違いは？', 'ソースコードは人間が書くプログラム、バイトコードはコンパイル後の中間コードです。', 2, 40);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコードは人間用、バイトコードはコンパイル後の中間コード', TRUE, 1),
    (gen_random_uuid(), q_id, '両方ともプログラマーが直接記述するソースコード', FALSE, 2),
    (gen_random_uuid(), q_id, '両方ともCPUが直接実行可能な機械語の形式で記述される', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソースコードはバイナリ形式で、バイトコードはテキスト形式で記述される', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「インターフェース」の開発における意味は？', 'インターフェース（Interface）はクラスやモジュール間の接続仕様を定義したものです。', 2, 41);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスやモジュール間の接続仕様', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザー向けの画面レイアウトのデザイン', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベース内のテーブル構造や列の定義', FALSE, 3),
    (gen_random_uuid(), q_id, '機器間を物理的に接続するネットワークケーブル', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「クロージャ」とは何ですか？', 'クロージャ（Closure）は外側のスコープの変数を参照できる関数のことです。', 2, 42);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '外側のスコープの変数を参照できる関数', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムを終了させる命令', FALSE, 2),
    (gen_random_uuid(), q_id, 'ファイルを閉じる処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの接続を切断する処理', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デザインパターン」の説明として最も適切なものは？', 'デザインパターン（Design Pattern）はソフトウェア設計でよく使われる問題解決の定石です。', 2, 43);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソフトウェア設計の問題解決の定石', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーインターフェースの画面テンプレート', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのテーブルとリレーション設計', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストケースの記述方法と作成手順の指針', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「MVC」とは何の略称ですか？', 'MVC（Model-View-Controller）はソフトウェアの設計パターンの一つです。', 2, 44);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Model-View-Controller', TRUE, 1),
    (gen_random_uuid(), q_id, 'Main-Variable-Class', FALSE, 2),
    (gen_random_uuid(), q_id, 'Module-Version-Control', FALSE, 3),
    (gen_random_uuid(), q_id, 'Memory-Virtual-Cache', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DRY原則」の「DRY」とは何の略ですか？', 'DRY（Don''t Repeat Yourself）は同じコードを繰り返し書かないという原則です。', 2, 45);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Don''t Repeat Yourself', TRUE, 1),
    (gen_random_uuid(), q_id, 'Data Recovery Year', FALSE, 2),
    (gen_random_uuid(), q_id, 'Debug Run Yield', FALSE, 3),
    (gen_random_uuid(), q_id, 'Deploy Release Yearly', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CRUD」とは何の略称ですか？', 'CRUD（Create, Read, Update, Delete）はデータ操作の基本4操作です。', 2, 46);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Create, Read, Update, Delete', TRUE, 1),
    (gen_random_uuid(), q_id, 'Copy, Remove, Upload, Download', FALSE, 2),
    (gen_random_uuid(), q_id, 'Connect, Run, Update, Debug', FALSE, 3),
    (gen_random_uuid(), q_id, 'Compile, Release, Undo, Deploy', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ミドルウェア」とは何ですか？', 'ミドルウェア（Middleware）はOSとアプリケーションの間で動作するソフトウェアです。', 2, 47);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'OSとアプリケーションの間で動作するソフトウェア', TRUE, 1),
    (gen_random_uuid(), q_id, 'ハードウェア機器を制御するためのドライバー', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザー画面を構築するフロントエンドフレームワーク', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの保存方式が異なるデータベースの種類', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ログ」（Log）の開発における主な用途は？', 'ログはシステムやアプリケーションの動作記録で、障害調査やデバッグに使用されます。', 2, 48);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムの動作記録・障害調査', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーインターフェースの設計', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのバックアップ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワークの構築', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「依存関係」（いぞんかんけい）の英語表記は？', '依存関係（Dependency）はソフトウェアが動作するために必要とする外部ライブラリやモジュールの関係です。', 2, 49);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Dependency', TRUE, 1),
    (gen_random_uuid(), q_id, 'Reference', FALSE, 2),
    (gen_random_uuid(), q_id, 'Association', FALSE, 3),
    (gen_random_uuid(), q_id, 'Connection', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「環境変数」（かんきょうへんすう）とは何ですか？', '環境変数（Environment Variable）はOSやアプリケーションの動作設定を保持する変数です。', 2, 50);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'OSやアプリの動作設定を保持する変数', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラム全体で参照可能なグローバル変数', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベーステーブル内の各列のカラム名', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSSで定義する再利用可能なカスタムプロパティ', FALSE, 4);

END $$;

-- ============================================
-- Quiz 2: IT語彙テスト 第2回 - インフラ
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b1000002-0000-0000-0000-000000000002';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第2回', 'it_terminology', 70, 15, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「サーバー」の説明として最も適切なものは？', 'サーバー（Server）はクライアントからの要求に応じてサービスやデータを提供するコンピュータです。', 2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントにサービスやデータを提供するコンピュータ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーがデータを入力するための専用端末装置', FALSE, 2),
    (gen_random_uuid(), q_id, '機器間を接続する物理的なネットワークケーブルの種類', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソフトウェア開発で使用するプログラミング言語の名称', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「クラウド」の意味として最も適切なものは？', 'クラウド（Cloud）はインターネット経由でコンピューティングリソースを提供するサービス形態です。', 2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インターネット経由でリソースを提供するサービス', TRUE, 1),
    (gen_random_uuid(), q_id, '自社ビル内に設置された専用のサーバールーム', FALSE, 2),
    (gen_random_uuid(), q_id, 'データのバックアップに使用する外付けハードディスク', FALSE, 3),
    (gen_random_uuid(), q_id, '無線通信によりデバイス間を接続するワイヤレスネットワーク', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「AWS」とは何の略称ですか？', 'AWS（Amazon Web Services）はAmazonが提供するクラウドコンピューティングサービスです。', 2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Amazon Web Services', TRUE, 1),
    (gen_random_uuid(), q_id, 'Advanced Web System', FALSE, 2),
    (gen_random_uuid(), q_id, 'Automated Workflow Service', FALSE, 3),
    (gen_random_uuid(), q_id, 'Application Web Server', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「オンプレミス」とは何ですか？', 'オンプレミス（On-Premises）は自社内にサーバーやシステムを設置・運用する形態です。', 2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自社内にサーバーを設置・運用する形態', TRUE, 1),
    (gen_random_uuid(), q_id, 'クラウド上でサーバーを運用する形態', FALSE, 2),
    (gen_random_uuid(), q_id, 'レンタルサーバーを利用する形態', FALSE, 3),
    (gen_random_uuid(), q_id, '外部委託でシステムを運用する形態', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DNS」とは何の略称ですか？', 'DNS（Domain Name System）はドメイン名をIPアドレスに変換するシステムです。', 2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Domain Name System', TRUE, 1),
    (gen_random_uuid(), q_id, 'Data Network Service', FALSE, 2),
    (gen_random_uuid(), q_id, 'Digital Node System', FALSE, 3),
    (gen_random_uuid(), q_id, 'Dynamic Network Standard', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ロードバランサー」の役割は？', 'ロードバランサー（Load Balancer）はサーバーへのアクセスを分散し、負荷を均等にする装置です。', 2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーへのアクセスを分散させる', TRUE, 1),
    (gen_random_uuid(), q_id, '通信データを暗号化してセキュリティを確保する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク上のウイルスを検知して駆除する', FALSE, 3),
    (gen_random_uuid(), q_id, '電子メールを指定された宛先に自動配信する', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「IPアドレス」の説明として正しいものは？', 'IPアドレスはネットワーク上の機器を識別するための番号です。', 2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ネットワーク上の機器を識別する番号', TRUE, 1),
    (gen_random_uuid(), q_id, 'インターネット上に公開されたウェブサイトの名前', FALSE, 2),
    (gen_random_uuid(), q_id, '電子メールの送受信に使用するアドレスの一種', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソフトウェアの更新状況を示すバージョン番号', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ファイアウォール」の役割として最も適切なものは？', 'ファイアウォール（Firewall）は不正なネットワーク通信を遮断するセキュリティ装置です。', 2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '不正な通信を遮断するセキュリティ装置', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを圧縮する装置', FALSE, 2),
    (gen_random_uuid(), q_id, 'インターネット速度を向上させる装置', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルを共有する装置', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「VPN」とは何の略称ですか？', 'VPN（Virtual Private Network）はインターネット上に暗号化された専用通信路を構築する技術です。', 2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Virtual Private Network', TRUE, 1),
    (gen_random_uuid(), q_id, 'Visual Processing Node', FALSE, 2),
    (gen_random_uuid(), q_id, 'Variable Program Network', FALSE, 3),
    (gen_random_uuid(), q_id, 'Virtual Public Node', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「LAN」と「WAN」の違いは？', 'LAN（Local Area Network）は限られた範囲のネットワーク、WAN（Wide Area Network）は広域ネットワークです。', 2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LANは限定範囲、WANは広域のネットワーク', TRUE, 1),
    (gen_random_uuid(), q_id, 'LANは無線接続のみ、WANは有線接続のみ対応', FALSE, 2),
    (gen_random_uuid(), q_id, 'LANは常に高速通信、WANは常に低速通信で動作', FALSE, 3),
    (gen_random_uuid(), q_id, 'LANは安全な通信環境、WANは非暗号化の通信環境', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SSH」とは何の略称ですか？', 'SSH（Secure Shell）は暗号化された安全な通信でリモートサーバーに接続するプロトコルです。', 2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Secure Shell', TRUE, 1),
    (gen_random_uuid(), q_id, 'System Service Host', FALSE, 2),
    (gen_random_uuid(), q_id, 'Server Side Hosting', FALSE, 3),
    (gen_random_uuid(), q_id, 'Standard Security Hash', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Docker」の説明として最も適切なものは？', 'Docker はアプリケーションをコンテナとしてパッケージ化し、どの環境でも同じように動作させるプラットフォームです。', 2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンテナ型の仮想化プラットフォーム', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソフトウェア開発で使用するプログラミング言語の名称', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの保存と検索を行うデータベース管理システム', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの自動実行と結果検証を行うツール', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コンテナ」のインフラにおける意味は？', 'コンテナ（Container）はアプリケーションとその依存関係を隔離された環境にパッケージ化したものです。', 2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリと依存関係を隔離環境にパッケージ化したもの', TRUE, 1),
    (gen_random_uuid(), q_id, 'ファイルやデータを階層的に格納するフォルダ構造', FALSE, 2),
    (gen_random_uuid(), q_id, '通信サービスを識別するためのネットワーク接続ポート', FALSE, 3),
    (gen_random_uuid(), q_id, 'データセンターに設置されるサーバーの物理的な筐体', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「仮想マシン」（かそうマシン）の英語表記は？', '仮想マシン（Virtual Machine）は物理サーバー上に仮想的に構築されたコンピュータ環境です。', 2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Virtual Machine', TRUE, 1),
    (gen_random_uuid(), q_id, 'Visual Manager', FALSE, 2),
    (gen_random_uuid(), q_id, 'Variable Module', FALSE, 3),
    (gen_random_uuid(), q_id, 'Verified Model', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スケーラビリティ」とは何ですか？', 'スケーラビリティ（Scalability）はシステムの負荷増加に対して柔軟に対応できる拡張性です。', 2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムの拡張性・負荷対応能力', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムのセキュリティ強度', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムの処理速度', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムの可用性', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「冗長化」（じょうちょうか）の目的は？', '冗長化（Redundancy）はシステムの一部が故障しても全体が停止しないよう予備を用意することです。', 2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '障害時にシステムが停止しないよう予備を用意すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'データをアルゴリズムで圧縮してストレージ容量を節約すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク帯域を最適化して通信速度を向上させること', FALSE, 3),
    (gen_random_uuid(), q_id, '同じ処理を行うコードの重複箇所を整理して排除すること', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CDN」とは何の略称ですか？', 'CDN（Content Delivery Network）はコンテンツを地理的に分散配置し高速配信するネットワークです。', 2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Content Delivery Network', TRUE, 1),
    (gen_random_uuid(), q_id, 'Central Data Node', FALSE, 2),
    (gen_random_uuid(), q_id, 'Cloud Database Network', FALSE, 3),
    (gen_random_uuid(), q_id, 'Continuous Deployment Network', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「HTTPS」の「S」は何を意味しますか？', 'HTTPSのSはSecureの略で、SSL/TLSにより通信が暗号化されていることを示します。', 2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Secure', TRUE, 1),
    (gen_random_uuid(), q_id, 'Speed', FALSE, 2),
    (gen_random_uuid(), q_id, 'Standard', FALSE, 3),
    (gen_random_uuid(), q_id, 'Service', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プロキシサーバー」の役割は？', 'プロキシサーバー（Proxy Server）はクライアントとサーバーの間に立ち、通信を中継する装置です。', 2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントとサーバー間の通信を中継する', TRUE, 1),
    (gen_random_uuid(), q_id, 'データベースの構造やレコードを管理運用する', FALSE, 2),
    (gen_random_uuid(), q_id, '電子メールをサーバー経由で送受信する処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルをアーカイブ形式に圧縮して保存する', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ポート番号」の説明として正しいものは？', 'ポート番号はネットワーク通信で特定のサービスやアプリケーションを識別するための番号です。', 2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '特定のサービスを識別するための番号', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバー筐体に設けられた物理的な接続口', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク上のIPアドレスに対する別名称', FALSE, 3),
    (gen_random_uuid(), q_id, 'ウェブサイトのURLに含まれるドメイン名の一部', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Kubernetes」の説明として最も適切なものは？', 'Kubernetes（K8s）はコンテナのデプロイ・スケーリング・管理を自動化するオーケストレーションツールです。', 2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンテナオーケストレーションツール', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソフトウェアを記述するプログラミング言語', FALSE, 2),
    (gen_random_uuid(), q_id, 'クラウド上にデータを保存するストレージサービス', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの保存と検索を行うデータベースエンジン', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SaaS」とは何の略称ですか？', 'SaaS（Software as a Service）はインターネット経由でソフトウェアを提供するサービス形態です。', 2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Software as a Service', TRUE, 1),
    (gen_random_uuid(), q_id, 'Server as a System', FALSE, 2),
    (gen_random_uuid(), q_id, 'Storage and Archive Service', FALSE, 3),
    (gen_random_uuid(), q_id, 'Security as a Standard', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「IaaS」とは何の略称ですか？', 'IaaS（Infrastructure as a Service）はインフラ環境をクラウドで提供するサービスです。', 2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Infrastructure as a Service', TRUE, 1),
    (gen_random_uuid(), q_id, 'Internet as a Service', FALSE, 2),
    (gen_random_uuid(), q_id, 'Integration and Automation Service', FALSE, 3),
    (gen_random_uuid(), q_id, 'Information Architecture Service', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「PaaS」とは何の略称ですか？', 'PaaS（Platform as a Service）はアプリケーション開発・実行プラットフォームをクラウドで提供するサービスです。', 2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Platform as a Service', TRUE, 1),
    (gen_random_uuid(), q_id, 'Program as a Service', FALSE, 2),
    (gen_random_uuid(), q_id, 'Process Automation Service', FALSE, 3),
    (gen_random_uuid(), q_id, 'Private Access Service', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SSL/TLS」の主な目的は？', 'SSL/TLSは通信を暗号化し、データの盗聴や改ざんを防ぐプロトコルです。', 2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '通信の暗号化とデータ保護', TRUE, 1),
    (gen_random_uuid(), q_id, 'データベースの最適化', FALSE, 2),
    (gen_random_uuid(), q_id, 'ファイルサイズを圧縮して保存する処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリ領域の割り当てと解放の管理', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「TCP」と「UDP」の違いとして正しいものは？', 'TCPは信頼性の高い接続型通信、UDPは高速だが信頼性が低い非接続型通信です。', 2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'TCPは信頼性重視、UDPは速度重視', TRUE, 1),
    (gen_random_uuid(), q_id, 'TCPは無線、UDPは有線', FALSE, 2),
    (gen_random_uuid(), q_id, 'TCPは暗号化あり、UDPは暗号化なし', FALSE, 3),
    (gen_random_uuid(), q_id, '基本設計と詳細設計に明確な違いは存在しない', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ルーター」の役割として最も適切なものは？', 'ルーター（Router）は異なるネットワーク間でデータの転送経路を決定する装置です。', 2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ネットワーク間のデータ転送経路を決定する', TRUE, 1),
    (gen_random_uuid(), q_id, '通信データを暗号化してセキュリティを確保する', FALSE, 2),
    (gen_random_uuid(), q_id, '不正なプログラムやウイルスを検出して隔離する', FALSE, 3),
    (gen_random_uuid(), q_id, 'データやファイルをストレージ上に保存して管理する', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スイッチ」のネットワーク機器としての役割は？', 'スイッチ（Switch）はLAN内の機器間でデータフレームを転送するネットワーク機器です。', 2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LAN内の機器間でデータを転送する', TRUE, 1),
    (gen_random_uuid(), q_id, 'デバイスをインターネットに接続する通信装置', FALSE, 2),
    (gen_random_uuid(), q_id, '通信データを暗号化してセキュリティを確保する', FALSE, 3),
    (gen_random_uuid(), q_id, '電子メールをサーバー経由で送受信する処理', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DHCP」とは何の略称ですか？', 'DHCP（Dynamic Host Configuration Protocol）はIPアドレスを自動で割り当てるプロトコルです。', 2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Dynamic Host Configuration Protocol', TRUE, 1),
    (gen_random_uuid(), q_id, 'Data Hosting Control Protocol', FALSE, 2),
    (gen_random_uuid(), q_id, 'Digital Hardware Connection Protocol', FALSE, 3),
    (gen_random_uuid(), q_id, 'Domain Host Communication Protocol', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「NAS」とは何の略称ですか？', 'NAS（Network Attached Storage）はネットワークに直接接続して使用するファイルサーバーです。', 2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Network Attached Storage', TRUE, 1),
    (gen_random_uuid(), q_id, 'Node Application System', FALSE, 2),
    (gen_random_uuid(), q_id, 'New Access Server', FALSE, 3),
    (gen_random_uuid(), q_id, 'Network Administration Service', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「RAID」の目的として最も適切なものは？', 'RAID（Redundant Array of Independent Disks）は複数のディスクを組み合わせ、信頼性や性能を向上させる技術です。', 2, 31);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ディスクの信頼性と性能の向上', TRUE, 1),
    (gen_random_uuid(), q_id, 'ネットワーク全体の通信速度と帯域の向上', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの機密性を確保するための暗号化処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'プログラムの実行処理速度を最適化して高速化', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バックアップ」の種類で「差分バックアップ」とは？', '差分バックアップ（Differential Backup）はフルバックアップ以降に変更されたデータのみを保存する方法です。', 2, 32);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フルバックアップ以降の変更分のみ保存', TRUE, 1),
    (gen_random_uuid(), q_id, '全データを毎回保存', FALSE, 2),
    (gen_random_uuid(), q_id, '前回バックアップからの変更分のみ保存', FALSE, 3),
    (gen_random_uuid(), q_id, '重要なファイルのみ保存', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「サブネットマスク」の役割は？', 'サブネットマスクはIPアドレスのネットワーク部とホスト部を区別するための値です。', 2, 33);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IPアドレスのネットワーク部とホスト部を区別する', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーが入力したパスワードを画面上で隠す処理', FALSE, 2),
    (gen_random_uuid(), q_id, '不正なプログラムやウイルスを検出して隔離する', FALSE, 3),
    (gen_random_uuid(), q_id, '通信データを暗号化してセキュリティを確保する', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ミドルウェア」のインフラにおける位置付けは？', 'ミドルウェアはOSとアプリケーションの間に位置し、両者の橋渡しをするソフトウェアです。', 2, 34);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'OSとアプリケーションの間に位置する', TRUE, 1),
    (gen_random_uuid(), q_id, 'ハードウェアとOSの間に位置する', FALSE, 2),
    (gen_random_uuid(), q_id, 'アプリケーションの上に位置する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク機器の中に位置する', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マイクロサービス」の説明として最も適切なものは？', 'マイクロサービスはアプリケーションを小さな独立したサービスに分割するアーキテクチャです。', 2, 35);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリを小さな独立したサービスに分割する設計', TRUE, 1),
    (gen_random_uuid(), q_id, '物理的に小さなサーバー機器を使う設計手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'マイクロプロセッサ向けに最適化した専用サービス', FALSE, 3),
    (gen_random_uuid(), q_id, '少人数チームで小規模プロジェクトを進める手法', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リバースプロキシ」の役割は？', 'リバースプロキシはクライアントからのリクエストを受け、内部サーバーに転送する中継装置です。', 2, 36);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントのリクエストを内部サーバーに転送する', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーの稼働状況やアクセスログを取得する', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの内容を定期的にバックアップする', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルの内容を暗号化して安全に保管する処理', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「オートスケーリング」とは何ですか？', 'オートスケーリング（Auto Scaling）は負荷に応じてサーバー台数を自動的に増減させる仕組みです。', 2, 37);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '負荷に応じてサーバー台数を自動増減する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーを自動的にアップデートする仕組み', FALSE, 2),
    (gen_random_uuid(), q_id, 'データを自動的にバックアップする仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティを自動的に強化する仕組み', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デーモン」（daemon）とは何ですか？', 'デーモンはバックグラウンドで常時動作するプロセスのことです。', 2, 38);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バックグラウンドで常時動作するプロセス', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト目的で意図的にエラーを発生させるプログラム', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンピュータに被害を与える悪意あるウイルスの一種', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの際に使用する仮想的なダミーデータ群', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ストレージ」の種類で「オブジェクトストレージ」とは？', 'オブジェクトストレージはデータをオブジェクト単位で管理し、大量の非構造化データの保存に適したストレージです。', 2, 39);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データをオブジェクト単位で管理するストレージ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ディレクトリ階層で管理するファイルシステム形式', FALSE, 2),
    (gen_random_uuid(), q_id, 'データをブロック単位で読み書きするストレージ形式', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリ上に一時的にデータを保持するストレージ領域', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SLA」とは何の略称ですか？', 'SLA（Service Level Agreement）はサービス品質の保証内容を定めた合意書です。', 2, 40);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Service Level Agreement', TRUE, 1),
    (gen_random_uuid(), q_id, 'System Log Analysis', FALSE, 2),
    (gen_random_uuid(), q_id, 'Software License Agreement', FALSE, 3),
    (gen_random_uuid(), q_id, 'Server Load Average', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「可用性」（かようせい）の英語表記は？', '可用性（Availability）はシステムが必要な時に利用可能な状態である割合を示します。', 2, 41);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Availability', TRUE, 1),
    (gen_random_uuid(), q_id, 'Accessibility', FALSE, 2),
    (gen_random_uuid(), q_id, 'Reliability', FALSE, 3),
    (gen_random_uuid(), q_id, 'Durability', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フェイルオーバー」とは何ですか？', 'フェイルオーバー（Failover）は障害発生時に自動的に予備システムに切り替わる仕組みです。', 2, 42);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '障害時に自動で予備システムに切り替わること', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムの管理者が手動で再起動を行うこと', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの複製を別の場所にバックアップすること', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムの異常やエラーの詳細をログに記録すること', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「監視」（かんし）のインフラにおける英語表記は？', '監視（Monitoring）はシステムの稼働状況やパフォーマンスを継続的に確認する作業です。', 2, 43);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Monitoring', TRUE, 1),
    (gen_random_uuid(), q_id, 'Auditing', FALSE, 2),
    (gen_random_uuid(), q_id, 'Tracking', FALSE, 3),
    (gen_random_uuid(), q_id, 'Scanning', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レイテンシ」とは何ですか？', 'レイテンシ（Latency）はデータの送受信にかかる遅延時間のことです。', 2, 44);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データ送受信の遅延時間', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの転送速度', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーの処理能力', FALSE, 3),
    (gen_random_uuid(), q_id, 'ストレージの容量', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スループット」の意味として最も適切なものは？', 'スループット（Throughput）は一定時間内に処理できるデータ量や処理件数です。', 2, 45);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一定時間内に処理できるデータ量', TRUE, 1),
    (gen_random_uuid(), q_id, 'データ送受信にかかる遅延時間の指標', FALSE, 2),
    (gen_random_uuid(), q_id, 'システム稼働中に発生するエラーの発生率', FALSE, 3),
    (gen_random_uuid(), q_id, 'アプリケーションが消費するメモリの使用量', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Nginx」の説明として最も適切なものは？', 'Nginx（エンジンエックス）は高性能なWebサーバー・リバースプロキシサーバーです。', 2, 46);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '高性能なWebサーバー・リバースプロキシ', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの保存と検索を行うデータベースエンジン', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソフトウェアを記述するプログラミング言語', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンテナの作成と運用を管理するためのツール', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「キャッシュ」のインフラにおける目的は？', 'キャッシュ（Cache）は頻繁にアクセスされるデータを高速な記憶域に一時保存し、応答速度を向上させます。', 2, 47);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの応答速度を向上させるため', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを暗号化するため', FALSE, 2),
    (gen_random_uuid(), q_id, 'データを永続的に保存するため', FALSE, 3),
    (gen_random_uuid(), q_id, 'データを圧縮するため', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI/CDパイプライン」の目的は？', 'CI/CDパイプラインはコードの変更からテスト・ビルド・デプロイまでを自動化する一連の流れです。', 2, 48);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト・ビルド・デプロイの自動化', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードレビュー工程の自動化と効率化', FALSE, 2),
    (gen_random_uuid(), q_id, 'ドキュメント生成と更新処理の自動化', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの運用管理タスクの自動化', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Infrastructure as Code」（IaC）とは何ですか？', 'IaCはインフラの構成をコードで管理し、自動的にプロビジョニングする手法です。', 2, 49);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インフラ構成をコードで管理・自動化する手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーにプログラムをインストールする手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク機器を手動で設定する手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースをコマンドで操作する手法', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ディザスタリカバリ」（DR）とは何ですか？', 'ディザスタリカバリ（Disaster Recovery）は災害時にシステムを復旧するための計画・仕組みです。', 2, 50);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '災害時のシステム復旧計画・仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの定期的な複製とバックアップ保存', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムの安全性を確認するセキュリティ監査', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク帯域に対する負荷テストの実施', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: IT語彙テスト 第3回 - テスト・品質
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b1000003-0000-0000-0000-000000000003';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第3回', 'it_terminology', 70, 15, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「単体テスト」（たんたいテスト）の英語表記は？', '単体テスト（Unit Test）は個々の関数やメソッドが正しく動作するか確認するテストです。', 2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Unit Test', TRUE, 1),
    (gen_random_uuid(), q_id, 'Integration Test', FALSE, 2),
    (gen_random_uuid(), q_id, 'System Test', FALSE, 3),
    (gen_random_uuid(), q_id, 'Acceptance Test', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「結合テスト」（けつごうテスト）の目的は？', '結合テスト（Integration Test）は複数のモジュールを組み合わせた時に正しく動作するか確認するテストです。', 2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数モジュールの連携動作の確認', TRUE, 1),
    (gen_random_uuid(), q_id, '個々の関数の動作確認', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーインターフェースの確認', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの性能確認', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「E2Eテスト」の「E2E」は何の略ですか？', 'E2E（End-to-End）テストはシステム全体を通して、ユーザー視点で動作を確認するテストです。', 2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'End-to-End', TRUE, 1),
    (gen_random_uuid(), q_id, 'Error-to-Error', FALSE, 2),
    (gen_random_uuid(), q_id, 'Entry-to-Exit', FALSE, 3),
    (gen_random_uuid(), q_id, 'Execute-to-Evaluate', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「回帰テスト」（かいきテスト）とは何ですか？', '回帰テスト（Regression Test）はコード変更後に既存機能が壊れていないか確認するテストです。', 2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更後に既存機能が壊れていないか確認するテスト', TRUE, 1),
    (gen_random_uuid(), q_id, '新しく追加した機能のみを対象にテストすること', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムの処理速度やパフォーマンスを測定するテスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムのセキュリティ上の脆弱性を検証するテスト', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストケース」の説明として最も適切なものは？', 'テストケース（Test Case）はテストの入力値・実行手順・期待結果を記述したものです。', 2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '入力値・実行手順・期待結果を記述したもの', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト実行のために構築された専用サーバー環境', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストの実行と結果を判定する自動化プログラム', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト実行後に出力される詳細な結果レポート', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バグ」の正式な英語表現は？', 'バグ（Bug）はプログラムの欠陥・不具合のことで、正式にはDefectやFaultとも呼ばれます。', 2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Bug / Defect', TRUE, 1),
    (gen_random_uuid(), q_id, 'Error / Crash', FALSE, 2),
    (gen_random_uuid(), q_id, 'Fault / Failure', FALSE, 3),
    (gen_random_uuid(), q_id, 'Issue / Problem', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト駆動開発」（TDD）の進め方として正しいものは？', 'TDD（Test-Driven Development）はテストを先に書き、そのテストを通すコードを後から書く開発手法です。', 2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストを先に書き、コードを後から書く', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードを先に書き、テストを後から書く', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストとコードを同時に書く', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストは書かず、手動で確認する', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「モック」（Mock）とは何ですか？', 'モック（Mock）はテスト時に本物のオブジェクトの代わりに使う偽のオブジェクトです。', 2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト用の偽のオブジェクト', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト実行後に出力される詳細な結果レポート', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストの自動実行と結果検証を行うツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト環境の設定ファイル', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スタブ」（Stub）の説明として最も適切なものは？', 'スタブ（Stub）は未実装の関数の代わりに固定値を返すテスト用のダミー関数です。', 2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '固定値を返すテスト用のダミー関数', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト結果を記録するログ', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト実行用のサーバー', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストデータを生成するツール', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「カバレッジ」（Coverage）とは何ですか？', 'カバレッジ（Coverage）はテストがコード全体のどの程度をカバーしているかの指標です。', 2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストがコード全体をカバーしている割合', TRUE, 1),
    (gen_random_uuid(), q_id, 'コード変更後に新たに発見されたバグの発生率', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストスイート全体の実行完了に要する時間', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクト内で作成されたテストケースの総数', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「受入テスト」（うけいれテスト）の英語表記は？', '受入テスト（Acceptance Test）はシステムが要件を満たしているか顧客が確認するテストです。', 2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Acceptance Test', TRUE, 1),
    (gen_random_uuid(), q_id, 'Approval Test', FALSE, 2),
    (gen_random_uuid(), q_id, 'Admission Test', FALSE, 3),
    (gen_random_uuid(), q_id, 'Achievement Test', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「負荷テスト」（ふかテスト）の目的は？', '負荷テスト（Load Test）はシステムに大量のアクセスを与えて性能や安定性を確認するテストです。', 2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大量アクセス時の性能と安定性の確認', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーインターフェースの画面デザイン確認', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムに潜むセキュリティ脆弱性の確認', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース内のデータの整合性と一貫性確認', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ホワイトボックステスト」の説明は？', 'ホワイトボックステストは内部構造（コード）を理解した上で行うテスト手法です。', 2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードの内部構造を理解した上で行うテスト', TRUE, 1),
    (gen_random_uuid(), q_id, '外部仕様書の記述のみに基づいて行うテスト手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーがリリース前に実施する最終的なテスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティの脆弱性検出に特化したテスト手法', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ブラックボックステスト」の説明は？', 'ブラックボックステストは内部構造を知らずに、入出力の仕様のみに基づいて行うテストです。', 2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '入出力の仕様のみに基づいて行うテスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの内部構造に基づいて行うテスト', FALSE, 2),
    (gen_random_uuid(), q_id, '暗号化機能のテスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'バックアップ機能のテスト', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「アサーション」（Assertion）とは何ですか？', 'アサーション（Assertion）はテストで期待する結果を検証するための宣言文です。', 2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストで期待結果を検証する宣言文', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト実行時に使用するデータの入力値', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト実行に必要な環境やパラメータの設定', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストスイートを起動するための実行コマンド', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「境界値分析」（きょうかいちぶんせき）とは何ですか？', '境界値分析（Boundary Value Analysis）は入力値の境界付近でテストを行い、バグを発見する手法です。', 2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '入力値の境界付近を重点的にテストする手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'すべての入力値を網羅的にテストする手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'ランダムな値でテストする手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'ユーザーの操作パターンをテストする手法', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「同値分割」（どうちぶんかつ）の英語表記は？', '同値分割（Equivalence Partitioning）は入力値を同等のグループに分割し、各グループから代表値をテストする手法です。', 2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Equivalence Partitioning', TRUE, 1),
    (gen_random_uuid(), q_id, 'Equal Distribution Testing', FALSE, 2),
    (gen_random_uuid(), q_id, 'Even Splitting Method', FALSE, 3),
    (gen_random_uuid(), q_id, 'Element Parsing Analysis', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ペネトレーションテスト」とは何ですか？', 'ペネトレーションテスト（Penetration Test）は実際に攻撃を試みてセキュリティの脆弱性を発見するテストです。', 2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '攻撃を試みてセキュリティ脆弱性を発見するテスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムの処理速度やパフォーマンスを測定するテスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザビリティの向上を目的として評価するテスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの整合性と一貫性を確認するためのテスト', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スモークテスト」の目的は？', 'スモークテスト（Smoke Test）はシステムの主要機能が基本的に動作するか素早く確認するテストです。', 2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '主要機能が基本的に動作するか素早く確認する', TRUE, 1),
    (gen_random_uuid(), q_id, '全機能をカバーするように網羅的にテストする手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムの最大負荷限界を確認する性能テスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムのセキュリティ強度を検証するための手法', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト自動化」のメリットとして最も適切なものは？', 'テスト自動化は繰り返しテストの工数削減と品質の安定化が主なメリットです。', 2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '繰り返しテストの工数削減と品質安定化', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストケースの作成工程が完全に不要になること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソフトウェアに含まれるバグが完全になくなること', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべての検証において手動テストが一切不要になる', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「品質保証」（ひんしつほしょう）の英語略称は？', '品質保証（Quality Assurance、QA）はソフトウェアの品質を組織的に保証するプロセスです。', 2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'QA', TRUE, 1),
    (gen_random_uuid(), q_id, 'QC', FALSE, 2),
    (gen_random_uuid(), q_id, 'QM', FALSE, 3),
    (gen_random_uuid(), q_id, 'QT', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コードレビュー」の主な目的は？', 'コードレビュー（Code Review）は他の開発者がコードを確認し、バグや改善点を発見する作業です。', 2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグや改善点を発見し品質を向上させる', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの実行速度やパフォーマンスを測定する', FALSE, 2),
    (gen_random_uuid(), q_id, 'コードの問題箇所を自動的に検出して修正する', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードからAPI仕様などのドキュメントを生成する', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「静的解析」（せいてきかいせき）とは何ですか？', '静的解析（Static Analysis）はプログラムを実行せずにソースコードを解析して問題を検出する手法です。', 2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行せずにソースコードを解析する手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'プログラムを実行して動作を確認する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの構造を分析する手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク通信を分析する手法', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リンター」（Linter）の役割は？', 'リンター（Linter）はコードのスタイル違反や潜在的なバグを自動検出するツールです。', 2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードのスタイル違反や潜在バグの自動検出', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードを自動的に機械語にコンパイルする処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'コードの変更を自動的に本番環境にデプロイする', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードの変更履歴を自動的にバックアップする処理', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フィクスチャ」（Fixture）のテストにおける意味は？', 'フィクスチャ（Fixture）はテスト実行前に準備する初期データや環境設定のことです。', 2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト実行前に準備する初期データや環境', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト結果に基づいて作成される修正パッチファイル', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストが失敗した際に出力されるエラーログ情報', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト手順を記述して自動実行するスクリプト', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「パフォーマンステスト」の説明として最も適切なものは？', 'パフォーマンステストはシステムの応答時間やスループットなどの性能を測定するテストです。', 2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムの応答時間やスループットを測定する', TRUE, 1),
    (gen_random_uuid(), q_id, '個々の機能が仕様通りに正しく動作するか確認する', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムに潜むセキュリティの脆弱性を検出する処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'ユーザーの操作体験に対する満足度を測定する手法', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ストレステスト」の目的は？', 'ストレステストはシステムの限界を超える負荷を与えて、障害発生時の挙動を確認するテストです。', 2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '限界を超える負荷での障害時の挙動確認', TRUE, 1),
    (gen_random_uuid(), q_id, '通常のユーザー操作を想定した動作の確認テスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーインターフェースの操作性と使いやすさ確認', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース内のデータの整合性と正確性の確認', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストピラミッド」の考え方で、最も数が多いテストは？', 'テストピラミッドでは、Unit Test > Integration Test > E2E Testの順に多くのテストを書くのが理想です。', 2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Unit Test', TRUE, 1),
    (gen_random_uuid(), q_id, 'Integration Test', FALSE, 2),
    (gen_random_uuid(), q_id, 'E2E Test', FALSE, 3),
    (gen_random_uuid(), q_id, 'Manual Test', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デグレード」（デグレ）とは何ですか？', 'デグレード（Degrade）はコード変更により以前は動作していた機能が壊れる現象です。', 2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変更により既存機能が壊れる現象', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムの性能が向上する現象', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストが自動的に実行される機能', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードが自動的に最適化される機能', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト仕様書」の英語表記は？', 'テスト仕様書（Test Specification）はテストの目的・範囲・方法・条件を記載した文書です。', 2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Test Specification', TRUE, 1),
    (gen_random_uuid(), q_id, 'Test Document Report', FALSE, 2),
    (gen_random_uuid(), q_id, 'Test Manual Guide', FALSE, 3),
    (gen_random_uuid(), q_id, 'Test Blueprint Design', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「エビデンス」のテストにおける意味は？', 'エビデンス（Evidence）はテスト実行結果の証拠（スクリーンショットやログ）です。', 2, 31);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト実行結果の証拠', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストケースの一覧', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト環境の設定情報', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト計画書', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI」環境でテストが失敗した場合、日本の職場で一般的に使われる表現は？', 'CIでテストが失敗することを「ビルドが落ちた」「テストが落ちた」と表現します。', 2, 32);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストが落ちた / ビルドが落ちた', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストの一部が自動的にスキップされて飛んだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストケースがリポジトリから消えて実行不能になった', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの実行プロセスが途中でフリーズして止まった', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ユーザビリティテスト」の目的は？', 'ユーザビリティテストは実際のユーザーにシステムを使ってもらい、使いやすさを評価するテストです。', 2, 33);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムの使いやすさを評価する', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムの処理速度を測定する', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムのセキュリティを検証する', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムの可用性を確認する', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「A/Bテスト」とは何ですか？', 'A/Bテストは2つのバージョンを比較して、どちらが効果的か検証する手法です。', 2, 34);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2つのバージョンを比較して効果を検証する手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'AチームとBチームが別々にテストする手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストをA段階とB段階に分ける手法', FALSE, 3),
    (gen_random_uuid(), q_id, '自動テストと手動テストを併用する手法', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストダブル」（Test Double）とは何ですか？', 'テストダブルはテスト時に本物のコンポーネントの代わりに使用する代替物の総称です（Mock、Stub、Spy等）。', 2, 35);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト用代替コンポーネントの総称', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト結果の信頼性のためにテストを2回実行すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト品質向上のために2人1組でテストを行うこと', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの網羅性を上げるためテストケースを倍にすること', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「探索的テスト」（たんさくてきテスト）とは何ですか？', '探索的テスト（Exploratory Testing）はテスターが事前にテストケースを作らず、経験と直感でテストする手法です。', 2, 36);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '事前のケースなしに経験と直感でテストする手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'すべての入力パターンを網羅的に検証するテスト手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'スクリプトによって自動的に実行されるテスト手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの整合性と性能を検証するテスト手法', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「不具合報告書」に含めるべき情報として最も重要なものは？', '不具合報告書には再現手順、期待結果、実際の結果を明記することが最も重要です。', 2, 37);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再現手順・期待結果・実際の結果', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスターの名前と日時のみ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソースコード全体', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトの全体スケジュール', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI/CDパイプラインでテストを実行するメリット」は？', 'CI/CDでテストを自動実行することで、コード変更のたびに品質を継続的に確認できます。', 2, 38);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コード変更のたびに品質を継続的に確認できる', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストケースの記述と作成が自動的に行われる', FALSE, 2),
    (gen_random_uuid(), q_id, 'バグが検出されると自動的にコードが修正される', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト用の環境構築が一切不要になる仕組み', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「互換性テスト」の目的は？', '互換性テスト（Compatibility Test）は異なるブラウザ・OS・デバイスでの動作を確認するテストです。', 2, 39);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '異なるブラウザ・OS・デバイスでの動作確認', TRUE, 1),
    (gen_random_uuid(), q_id, '新旧バージョン間でのデータ形式の整合性の確認', FALSE, 2),
    (gen_random_uuid(), q_id, '異なるプログラミング言語の環境での動作確認テスト', FALSE, 3),
    (gen_random_uuid(), q_id, '異なるデータベース製品を用いた環境での動作確認', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト計画」に含めるべき内容は？', 'テスト計画（Test Plan）にはテスト範囲、スケジュール、手法、体制、リスクなどを含めます。', 2, 40);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト範囲・スケジュール・手法・体制', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト実行用に記述されたコードのみの記載', FALSE, 2),
    (gen_random_uuid(), q_id, '発見されたバグの件名と状態の一覧のみの記載', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト実行後の結果と合否判定のみの記載文書', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Selenium」の説明として最も適切なものは？', 'Selenium はブラウザの操作を自動化するテストツールで、E2Eテストに広く使用されます。', 2, 41);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブラウザ操作を自動化するテストツール', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーの稼働状態を常時監視する運用ツール', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの構造やデータを管理する運用ツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソースコードの品質や構造を分析する解析ツール', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「JUnit」とは何ですか？', 'JUnit はJava言語向けの単体テストフレームワークです。', 2, 42);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Java向けの単体テストフレームワーク', TRUE, 1),
    (gen_random_uuid(), q_id, 'JavaScript向けのビルドツール', FALSE, 2),
    (gen_random_uuid(), q_id, 'Python向けのデバッガー', FALSE, 3),
    (gen_random_uuid(), q_id, 'C#向けのIDE', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストの優先度」を決める基準として最も適切なものは？', 'テストの優先度はビジネスへの影響度とバグ発生確率を基準に決定します。', 2, 43);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ビジネスへの影響度とバグ発生確率', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクト全体のソースコードの行数', FALSE, 2),
    (gen_random_uuid(), q_id, '担当する開発者個人の好みや経験に基づく判断', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストスイート全体の実行完了に要する時間', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バグの重要度」の一般的な分類は？', 'バグの重要度は一般的に Critical > Major > Minor > Trivial に分類されます。', 2, 44);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Critical > Major > Minor > Trivial', TRUE, 1),
    (gen_random_uuid(), q_id, 'High > Medium > Low の3段階のみに分類する方式', FALSE, 2),
    (gen_random_uuid(), q_id, 'A > B > C > D > E のアルファベット順で分類する方式', FALSE, 3),
    (gen_random_uuid(), q_id, '1 > 2 > 3 > 4 > 5 の数字順のみに分類する方式', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テスト環境」（テストかんきょう）の英語表記は？', 'テスト環境（Test Environment / Staging Environment）は本番と同じ構成でテストを行う環境です。', 2, 45);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Test Environment / Staging', TRUE, 1),
    (gen_random_uuid(), q_id, 'Production Environment / Live', FALSE, 2),
    (gen_random_uuid(), q_id, 'Development Environment / Dev', FALSE, 3),
    (gen_random_uuid(), q_id, 'Local Environment / Sandbox', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スナップショットテスト」とは何ですか？', 'スナップショットテストはUIの出力結果を保存し、変更前後の差分を検出するテストです。', 2, 46);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UIの出力を保存し変更前後の差分を検出する', TRUE, 1),
    (gen_random_uuid(), q_id, '画面の表示状態をスクリーンショットで撮影するテスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのバックアップと復元を検証するテスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーに瞬間的な高負荷をかける性能テスト手法', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コードフォーマッター」と「リンター」の違いは？', 'フォーマッターはコードの見た目を自動整形し、リンターはコードの品質問題を検出します。', 2, 47);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フォーマッターは見た目整形、リンターは品質問題検出', TRUE, 1),
    (gen_random_uuid(), q_id, '両方とも同じ機能', FALSE, 2),
    (gen_random_uuid(), q_id, 'フォーマッターはテスト用、リンターはデプロイ用', FALSE, 3),
    (gen_random_uuid(), q_id, 'フォーマッターはバグ修正、リンターはコード生成', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストのべき等性」（idempotency）とは何ですか？', 'テストのべき等性は何度実行しても同じ結果が得られるテストの性質です。', 2, 48);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '何度実行しても同じ結果が得られる性質', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストが短時間で高速に実行される性質のこと', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト環境が自動的に修復されて復旧する性質', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストを複数同時に並列実行できるという性質', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テストマトリクス」の目的は？', 'テストマトリクスはテスト対象の条件の組み合わせを表にして、漏れなくテストするためのツールです。', 2, 49);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '条件の組み合わせを表にして漏れなくテストする', TRUE, 1),
    (gen_random_uuid(), q_id, 'テストの実行結果を分類・集計して可視化する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト対象のコードからテストコードを自動で生成する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト項目ごとの優先順位とスケジュールを決める', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「品質メトリクス」の例として適切なものは？', '品質メトリクスにはバグ密度、テストカバレッジ率、MTBF（平均故障間隔）などがあります。', 2, 50);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグ密度・テストカバレッジ率・MTBF', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの行数・ファイル数・フォルダ数', FALSE, 2),
    (gen_random_uuid(), q_id, '開発者の人数・勤務時間・給与', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー台数・ストレージ容量・CPU使用率', FALSE, 4);

END $$;

-- ============================================
-- Quiz 4: IT語彙テスト 第4回 - プロジェクト管理
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b1000004-0000-0000-0000-000000000004';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第4回', 'it_terminology', 70, 15, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「アジャイル開発」の特徴として最も適切なものは？', 'アジャイル開発（Agile Development）は短い反復サイクルで柔軟に開発を進める手法です。', 2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '短い反復サイクルで柔軟に開発を進める', TRUE, 1),
    (gen_random_uuid(), q_id, '最初に全ての要件を確定してから開発する', FALSE, 2),
    (gen_random_uuid(), q_id, '一人の開発者がすべてを担当する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストを行わずに素早くリリースする', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スクラム」の説明として最も適切なものは？', 'スクラム（Scrum）はアジャイル開発のフレームワークで、スプリントと呼ばれる短期間で開発を反復します。', 2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アジャイル開発のフレームワークの一つ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ウォーターフォール型の開発手法を表す別の名称', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストの自動実行や結果検証を行うツールの名前', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソフトウェア開発に使用するプログラミング言語の種類', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スプリント」とは何ですか？', 'スプリント（Sprint）はスクラムにおける1〜4週間の開発サイクルです。', 2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スクラムにおける短期間の開発サイクル', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクト開始から完了までの全体スケジュール', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストの計画から実行完了までの実施期間', FALSE, 3),
    (gen_random_uuid(), q_id, '本番環境へのリリースを行うデプロイのタイミング', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プロダクトオーナー」の役割は？', 'プロダクトオーナー（Product Owner）はプロダクトの価値を最大化する責任者で、バックログの優先順位を決定します。', 2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロダクトの価値最大化とバックログ管理', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソースコードの品質を維持するための品質管理活動', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーの安定稼働を維持するための運用管理業務', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストの計画・実行・結果報告を行う実行管理業務', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スクラムマスター」の役割は？', 'スクラムマスター（Scrum Master）はスクラムの進行を支援し、チームの障害を取り除く役割です。', 2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スクラムの進行支援とチームの障害除去', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロダクトの機能仕様と要件を決定する業務', FALSE, 2),
    (gen_random_uuid(), q_id, 'プロダクトの機能をソースコードとして実装する業務', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト計画に基づきテストの実行と検証を実施する業務', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バックログ」とは何ですか？', 'バックログ（Backlog）は開発すべき機能や改善項目を優先順位付けしたリストです。', 2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発すべき機能や改善項目の優先順位リスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムで発見されたバグと対応状況の一覧表', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーの稼働状況や処理内容のログファイル', FALSE, 3),
    (gen_random_uuid(), q_id, '過去に実施したプロジェクトの実績と履歴記録', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デイリースタンドアップ」の目的は？', 'デイリースタンドアップ（Daily Standup）は毎日短時間で進捗・障害・計画を共有する会議です。', 2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎日の進捗・障害・計画の共有', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの品質確認のためコードレビューを実施', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト実行結果と検出された問題の報告共有', FALSE, 3),
    (gen_random_uuid(), q_id, 'リリース前にデプロイ作業の承認を得る手続き', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レトロスペクティブ」（振り返り）の目的は？', 'レトロスペクティブ（Retrospective）はスプリント終了後にチームの改善点を話し合う会議です。', 2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スプリント後にチームの改善点を話し合う', TRUE, 1),
    (gen_random_uuid(), q_id, '次のスプリントで実施するタスクの工数を見積もる', FALSE, 2),
    (gen_random_uuid(), q_id, '顧客に完成した成果物のデモンストレーションを行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'スプリント中に発見されたバグの原因を調査し修正する', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ウォーターフォール開発」の特徴は？', 'ウォーターフォール（Waterfall）は要件定義→設計→実装→テスト→リリースを順番に進める開発手法です。', 2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '工程を順番に進める逐次的な開発手法', TRUE, 1),
    (gen_random_uuid(), q_id, '短い反復で開発する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストを先に行う開発手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'ドキュメントを作成しない開発手法', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「カンバン」の説明として最も適切なものは？', 'カンバン（Kanban）はタスクの状態を視覚的に管理するボードを使ったプロジェクト管理手法です。', 2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスクの状態を視覚的に管理する手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'スプリント単位で反復的に開発を進める手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストスクリプトにより自動的に検証を行う手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブル構成やリレーションを設計する手法', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ストーリーポイント」とは何ですか？', 'ストーリーポイント（Story Point）はタスクの相対的な作業量や複雑さを表す見積もり単位です。', 2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスクの相対的な作業量を表す見積もり単位', TRUE, 1),
    (gen_random_uuid(), q_id, 'タスクの完了に必要な所要時間を示す指標', FALSE, 2),
    (gen_random_uuid(), q_id, 'バグの深刻度や影響範囲を示す重要度レベル', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト管理ツールで割り振られるテストケース番号', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ベロシティ」のスクラムにおける意味は？', 'ベロシティ（Velocity）はチームが1スプリントで完了できるストーリーポイントの量です。', 2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1スプリントで完了できるストーリーポイント量', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの開始から完了までの総予算額', FALSE, 2),
    (gen_random_uuid(), q_id, 'プロジェクトに参加するチームメンバーの人数', FALSE, 3),
    (gen_random_uuid(), q_id, 'プログラムが処理を完了するまでの実行速度', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「WBS」とは何の略称ですか？', 'WBS（Work Breakdown Structure）はプロジェクトの作業を階層的に分割した構成図です。', 2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Work Breakdown Structure', TRUE, 1),
    (gen_random_uuid(), q_id, 'Web Based System', FALSE, 2),
    (gen_random_uuid(), q_id, 'Workflow Business Standard', FALSE, 3),
    (gen_random_uuid(), q_id, 'Wide Band Service', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ガントチャート」の用途は？', 'ガントチャート（Gantt Chart）はプロジェクトのスケジュールを横棒グラフで視覚化する図表です。', 2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スケジュールを横棒グラフで視覚化する', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの品質をメトリクスで定量的に測定する', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースのテーブル間の関連構造を表す図', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク機器の接続構成を示す図を描く', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マイルストーン」の意味は？', 'マイルストーン（Milestone）はプロジェクトの重要な節目や到達点のことです。', 2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトの重要な節目・到達点', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクト全体に必要な予算計画と配分', FALSE, 2),
    (gen_random_uuid(), q_id, 'プロジェクトに参加するメンバーのチーム構成', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトで採用されている開発プログラミング言語', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スコープ」のプロジェクト管理における意味は？', 'スコープ（Scope）はプロジェクトの作業範囲や成果物の範囲を定義したものです。', 2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトの作業範囲・成果物の範囲', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの費用見積もりと予算配分計画', FALSE, 2),
    (gen_random_uuid(), q_id, 'プロジェクトに潜在するリスクの一覧と対策', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトの各チームの役割分担と編成方針', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スコープクリープ」とは何ですか？', 'スコープクリープ（Scope Creep）はプロジェクトの範囲が管理されずに徐々に拡大する問題です。', 2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクト範囲が管理されず徐々に拡大すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの実コストが予算を大幅に超過すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'チームメンバーがプロジェクトの途中で離脱すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト環境のサーバーやインフラに発生する障害', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ステークホルダー」とは？', 'ステークホルダー（Stakeholder）はプロジェクトに関わる利害関係者全体を指します。', 2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトの利害関係者全体', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトマネージャーのみ', FALSE, 2),
    (gen_random_uuid(), q_id, '開発チームのみ', FALSE, 3),
    (gen_random_uuid(), q_id, '顧客のみ', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リスク管理」の最初のステップは？', 'リスク管理はまずリスクの特定（識別）から始めます。', 2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リスクの特定・識別', TRUE, 1),
    (gen_random_uuid(), q_id, 'リスクの対策実施', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスクの報告書作成', FALSE, 3),
    (gen_random_uuid(), q_id, 'リスクの予算確保', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「見積もり」（みつもり）のIT開発における英語表記は？', '見積もり（Estimation）は作業量、期間、コストを予測する作業です。', 2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Estimation', TRUE, 1),
    (gen_random_uuid(), q_id, 'Calculation', FALSE, 2),
    (gen_random_uuid(), q_id, 'Prediction', FALSE, 3),
    (gen_random_uuid(), q_id, 'Evaluation', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「要件定義」（ようけんていぎ）の英語表記は？', '要件定義（Requirements Definition）はシステムに求められる機能や性能を明確にする工程です。', 2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Requirements Definition', TRUE, 1),
    (gen_random_uuid(), q_id, 'System Design Document', FALSE, 2),
    (gen_random_uuid(), q_id, 'Feature Planning Phase', FALSE, 3),
    (gen_random_uuid(), q_id, 'Process Mapping Method', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「基本設計」と「詳細設計」の違いは？', '基本設計はシステム全体の構成を決め、詳細設計は各モジュールの内部処理を決めます。', 2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '基本設計は全体構成、詳細設計は内部処理を決定', TRUE, 1),
    (gen_random_uuid(), q_id, '基本設計はUI設計のみ、詳細設計はDB設計のみ担当', FALSE, 2),
    (gen_random_uuid(), q_id, '基本設計はテスト計画のみ、詳細設計は実装方針のみ', FALSE, 3),
    (gen_random_uuid(), q_id, '基本設計と詳細設計に明確な違いは存在しない', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「MVP」とは何の略称ですか？', 'MVP（Minimum Viable Product）は必要最小限の機能を持つ製品で、市場の反応を検証するために作られます。', 2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Minimum Viable Product', TRUE, 1),
    (gen_random_uuid(), q_id, 'Most Valuable Player', FALSE, 2),
    (gen_random_uuid(), q_id, 'Maximum Version Product', FALSE, 3),
    (gen_random_uuid(), q_id, 'Main Virtual Platform', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ユーザーストーリー」の書き方として一般的な形式は？', 'ユーザーストーリーは「〜として、〜したい。なぜなら〜だから」の形式で書きます。', 2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「〜として、〜したい。なぜなら〜」の形式', TRUE, 1),
    (gen_random_uuid(), q_id, '「〜の機能を実装する」のみを記述する形式', FALSE, 2),
    (gen_random_uuid(), q_id, '「エラーが発生した場合は〜に対処する」の形式', FALSE, 3),
    (gen_random_uuid(), q_id, '「テスト項目：〜の動作を確認する」の形式', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「スプリントレビュー」の目的は？', 'スプリントレビュー（Sprint Review）はスプリントの成果物をステークホルダーにデモ・確認してもらう会議です。', 2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '成果物をステークホルダーにデモ・確認する', TRUE, 1),
    (gen_random_uuid(), q_id, 'チーム内の課題と改善点を全員で話し合う', FALSE, 2),
    (gen_random_uuid(), q_id, '次のスプリントのタスクと優先順位を計画する', FALSE, 3),
    (gen_random_uuid(), q_id, '報告されたバグの修正状況と対応進捗を確認する', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「バーンダウンチャート」の用途は？', 'バーンダウンチャート（Burndown Chart）はスプリント中の残作業量の推移をグラフで示す図です。', 2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '残作業量の推移をグラフで表示する', TRUE, 1),
    (gen_random_uuid(), q_id, 'バグの発生件数を表示する', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーのCPU使用率を表示する', FALSE, 3),
    (gen_random_uuid(), q_id, '売上の推移を表示する', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DoD」（Definition of Done）とは何ですか？', 'DoD（Definition of Done）はタスクやストーリーが「完了」と見なすための条件定義です。', 2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスクの完了条件の定義', TRUE, 1),
    (gen_random_uuid(), q_id, 'デプロイの手順書', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの設計書', FALSE, 3),
    (gen_random_uuid(), q_id, 'ドキュメントの一覧', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プランニングポーカー」とは何ですか？', 'プランニングポーカー（Planning Poker）はチーム全員でカードを使ってタスクの見積もりを行う手法です。', 2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'カードを使ってチームでタスクを見積もる手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'カードゲームの形式でチームの連携力を強化する活動', FALSE, 2),
    (gen_random_uuid(), q_id, 'タスクをメンバーにランダムに割り当てて効率化する手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトのリスク要因を分析するための手法', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「技術的負債」（ぎじゅつてきふさい）の英語表記は？', '技術的負債（Technical Debt）は短期的な対応のために将来的に追加作業が必要になるコードや設計の問題です。', 2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Technical Debt', TRUE, 1),
    (gen_random_uuid(), q_id, 'Technical Risk', FALSE, 2),
    (gen_random_uuid(), q_id, 'Technical Issue', FALSE, 3),
    (gen_random_uuid(), q_id, 'Technical Failure', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DevOps」の説明として最も適切なものは？', 'DevOps（Development + Operations）は開発と運用の連携を強化し、ソフトウェアの迅速なリリースを実現する文化・手法です。', 2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発と運用の連携を強化する文化・手法', TRUE, 1),
    (gen_random_uuid(), q_id, '開発者がサーバー運用業務も兼任して担当すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソフトウェア開発で使用される統合開発ツールの名前', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストスクリプトにより自動的に検証を行う手法', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「KPT」（ケーピーティー）とは何ですか？', 'KPT（Keep, Problem, Try）は振り返りのフレームワークで、良かったこと・問題・改善策を整理します。', 2, 31);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Keep・Problem・Tryの振り返り手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの進捗を管理するツールの名前', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソフトウェアテスト技法を表す英字略称のこと', FALSE, 3),
    (gen_random_uuid(), q_id, 'プログラミング言語の名称を短縮した略称のこと', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「JIRA」は主にどのような目的で使われますか？', 'JIRAはプロジェクト管理・課題追跡ツールで、アジャイル開発のタスク管理に広く使われます。', 2, 32);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクト管理・課題追跡', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの変更を自動的にテストする処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースの構造やレコードを管理する作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーの稼働状態と負荷状況を常時監視', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「クリティカルパス」とは何ですか？', 'クリティカルパス（Critical Path）はプロジェクトの最長経路で、遅延するとプロジェクト全体が遅れる作業の連鎖です。', 2, 33);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトの最長経路で遅延が全体に影響する作業連鎖', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの中核となる最も重要な設定ファイル', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムのセキュリティに関わる重大な脆弱性の報告', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト項目を重要度に基づき並べた優先順位リスト', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「工数」（こうすう）の英語表記は？', '工数（Man-hours / Person-hours）はプロジェクトの作業量を人×時間で表した単位です。', 2, 34);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Man-hours / Person-hours', TRUE, 1),
    (gen_random_uuid(), q_id, 'Work Points Measurement', FALSE, 2),
    (gen_random_uuid(), q_id, 'Task Units Counting', FALSE, 3),
    (gen_random_uuid(), q_id, 'Labor Index Rating', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「人月」（にんげつ）とは何ですか？', '人月（Man-month）は1人が1ヶ月で行える作業量を表す単位です。', 2, 35);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1人が1ヶ月で行える作業量の単位', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの開始から完了までの期間', FALSE, 2),
    (gen_random_uuid(), q_id, 'チームメンバーが組織に在籍している月数', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーが運用開始してからの稼働月数', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リリースノート」の目的は？', 'リリースノート（Release Note）はソフトウェアのバージョンアップ時に変更内容を利用者に伝える文書です。', 2, 36);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バージョンアップの変更内容を利用者に伝える', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソースコード内に開発者向けに記述された内部コメント', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト実行後の検証結果をまとめた公式報告書', FALSE, 3),
    (gen_random_uuid(), q_id, 'システムの内部構造を記述した開発者向けの設計書', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ペアプログラミング」とは何ですか？', 'ペアプログラミング（Pair Programming）は2人の開発者が1台のPCでコードを書く手法です。', 2, 37);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2人の開発者が1台のPCでコードを書く手法', TRUE, 1),
    (gen_random_uuid(), q_id, '2つのプログラムをサーバー上で同時に実行する技術', FALSE, 2),
    (gen_random_uuid(), q_id, '2つのブランチを同時にリポジトリへマージする方法', FALSE, 3),
    (gen_random_uuid(), q_id, '2つのテストスイートを並行して同時実行する手法', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「コンフリクト」のプロジェクト管理における意味は？', 'コンフリクト（Conflict）はGitでの変更の衝突や、チーム内の意見の対立を指します。', 2, 38);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードの変更衝突やチーム内の意見対立', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーのハードウェアやソフトウェアに生じる障害', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムのセキュリティに関わる脆弱性や攻撃リスク', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト実行時に期待結果と異なり判定される失敗', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SoR」と「SoE」の違いは？', 'SoR（System of Record）は記録のシステム、SoE（System of Engagement）はつながりのシステムです。', 2, 39);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SoRは記録・管理系、SoEはユーザー体験重視系', TRUE, 1),
    (gen_random_uuid(), q_id, 'SoRは開発環境、SoEは本番環境', FALSE, 2),
    (gen_random_uuid(), q_id, 'SoRはフロントエンド、SoEはバックエンド', FALSE, 3),
    (gen_random_uuid(), q_id, '基本設計と詳細設計に明確な違いは存在しない', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「PoC」とは何の略称ですか？', 'PoC（Proof of Concept）は技術やアイデアの実現可能性を検証するための実証実験です。', 2, 40);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Proof of Concept', TRUE, 1),
    (gen_random_uuid(), q_id, 'Point of Contact', FALSE, 2),
    (gen_random_uuid(), q_id, 'Plan of Completion', FALSE, 3),
    (gen_random_uuid(), q_id, 'Process of Certification', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「チケット」のIT開発における意味は？', 'チケット（Ticket）はバグや機能要求などの作業項目を管理するための単位です。', 2, 41);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグや機能要求などの作業管理単位', TRUE, 1),
    (gen_random_uuid(), q_id, 'システムへのアクセス権限を証明する証明書', FALSE, 2),
    (gen_random_uuid(), q_id, 'リリース前に関係者の承認を得るデプロイ承認書', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソフトウェアの正規利用を認証するライセンスキー', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「イテレーション」とは何ですか？', 'イテレーション（Iteration）はアジャイル開発における開発の反復サイクルです。', 2, 42);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アジャイル開発の反復サイクル', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの完了前に行う最終段階の作業', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストスイートが実行された累計の回数記録', FALSE, 3),
    (gen_random_uuid(), q_id, 'コード内で繰り返し実行される反復処理の記述', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ブロッカー」のプロジェクト管理における意味は？', 'ブロッカー（Blocker）は作業の進行を妨げる障害や問題のことです。', 2, 43);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '作業の進行を妨げる障害や問題', TRUE, 1),
    (gen_random_uuid(), q_id, 'アクセスを遮断するセキュリティ機能', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストを失敗させるバグ', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリ不足エラー', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「プロトタイプ」の開発における目的は？', 'プロトタイプ（Prototype）は製品の試作品で、要件の確認やフィードバック収集に使用されます。', 2, 44);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '要件確認やフィードバック収集のための試作品', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーに配布するための本番リリース用の製品', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト手順を記述して自動実行するスクリプト', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースのテーブル構造を示す設計図の文書', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「OKR」とは何の略称ですか？', 'OKR（Objectives and Key Results）は目標と主要な成果指標を設定する目標管理手法です。', 2, 45);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Objectives and Key Results', TRUE, 1),
    (gen_random_uuid(), q_id, 'Online Knowledge Repository', FALSE, 2),
    (gen_random_uuid(), q_id, 'Operational Key Requirements', FALSE, 3),
    (gen_random_uuid(), q_id, 'Organized Knowledge Resource', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「タスクの依存関係」とは何ですか？', 'タスクの依存関係は、あるタスクが完了しないと次のタスクを開始できない関係のことです。', 2, 46);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あるタスク完了が次のタスク開始の前提条件になる関係', TRUE, 1),
    (gen_random_uuid(), q_id, 'タスクが同じ担当者にまとめて割り当てられている関係性', FALSE, 2),
    (gen_random_uuid(), q_id, 'タスクが同じカテゴリや分類に属しているという関係', FALSE, 3),
    (gen_random_uuid(), q_id, 'タスクに設定された優先度レベルが同じである関係', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ドキュメンテーション」の重要性として最も適切なものは？', 'ドキュメンテーションはチーム間の知識共有やシステムの保守性向上に不可欠です。', 2, 47);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '知識共有とシステム保守性の向上', TRUE, 1),
    (gen_random_uuid(), q_id, 'コードの実行処理速度とパフォーマンスの向上', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムのセキュリティ対策と防御力の強化', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーの運用コストとインフラ費用の削減', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ポストモーテム」（Postmortem）とは何ですか？', 'ポストモーテム（Postmortem）は障害やプロジェクト終了後に原因分析と再発防止策を検討する振り返りです。', 2, 48);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '障害後の原因分析と再発防止策の検討', TRUE, 1),
    (gen_random_uuid(), q_id, 'プロジェクト開始前に実施するキックオフ計画会議', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト環境やデータの整備を行う事前準備作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイの実施前に関係者と行う最終確認作業', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SRE」とは何の略称ですか？', 'SRE（Site Reliability Engineering）はサイトの信頼性を工学的に向上させるGoogleが提唱した手法です。', 2, 49);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Site Reliability Engineering', TRUE, 1),
    (gen_random_uuid(), q_id, 'Software Release Engineering', FALSE, 2),
    (gen_random_uuid(), q_id, 'System Recovery Environment', FALSE, 3),
    (gen_random_uuid(), q_id, 'Security Risk Evaluation', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ふりかえり」の手法として「PDCA」の各ステップは？', 'PDCA（Plan, Do, Check, Act）は計画→実行→評価→改善のサイクルです。', 2, 50);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Plan→ Do→ Check→ Act', TRUE, 1),
    (gen_random_uuid(), q_id, 'Prepare → Design → Code → Apply', FALSE, 2),
    (gen_random_uuid(), q_id, 'Program → Debug → Compile → Archive', FALSE, 3),
    (gen_random_uuid(), q_id, 'Process → Data → Control → Action', FALSE, 4);

END $$;

-- ============================================
-- Quiz 5: IT語彙テスト 第5回 - 総合（セキュリティ・DB・アーキテクチャ等）
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b1000005-0000-0000-0000-000000000005';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, lesson_id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, NULL, 'IT語彙テスト 第5回', 'it_terminology', 70, 15, FALSE, NULL);

  -- Question 1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SQL」とは何の略称ですか？', 'SQL（Structured Query Language）はデータベースを操作するための問い合わせ言語です。', 2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Structured Query Language', TRUE, 1),
    (gen_random_uuid(), q_id, 'System Quality Language', FALSE, 2),
    (gen_random_uuid(), q_id, 'Server Queue Logic', FALSE, 3),
    (gen_random_uuid(), q_id, 'Standard Question Library', FALSE, 4);

  -- Question 2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SQLインジェクション」とは何ですか？', 'SQLインジェクション（SQL Injection）は悪意のあるSQL文を注入してデータベースを不正操作する攻撃です。', 2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '不正なSQL文を注入してDBを不正操作する攻撃', TRUE, 1),
    (gen_random_uuid(), q_id, 'SQLクエリの実行速度を最適化して向上させる技術', FALSE, 2),
    (gen_random_uuid(), q_id, 'SQLのバグを検出し自動的に修正するための支援ツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'SQLデータベースを新しいバージョンへ更新する手法', FALSE, 4);

  -- Question 3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「XSS」とは何の略称ですか？', 'XSS（Cross-Site Scripting）は悪意のあるスクリプトをWebページに埋め込む攻撃です。', 2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Cross-Site Scripting', TRUE, 1),
    (gen_random_uuid(), q_id, 'Cross-Server Security', FALSE, 2),
    (gen_random_uuid(), q_id, 'XML Style Sheet', FALSE, 3),
    (gen_random_uuid(), q_id, 'Extended Security Standard', FALSE, 4);

  -- Question 4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CSRF」とは何の略称ですか？', 'CSRF（Cross-Site Request Forgery）はユーザーの意図しないリクエストを送信させる攻撃です。', 2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Cross-Site Request Forgery', TRUE, 1),
    (gen_random_uuid(), q_id, 'Client-Server Response Format', FALSE, 2),
    (gen_random_uuid(), q_id, 'Central System Recovery Function', FALSE, 3),
    (gen_random_uuid(), q_id, 'Continuous Security Review Framework', FALSE, 4);

  -- Question 5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「暗号化」（あんごうか）の英語表記は？', '暗号化（Encryption）はデータを読み取り不能な形式に変換して保護する技術です。', 2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Encryption', TRUE, 1),
    (gen_random_uuid(), q_id, 'Encoding', FALSE, 2),
    (gen_random_uuid(), q_id, 'Compression', FALSE, 3),
    (gen_random_uuid(), q_id, 'Hashing', FALSE, 4);

  -- Question 6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「認証」と「認可」の違いは？', '認証（Authentication）は本人確認、認可（Authorization）はアクセス権限の確認です。', 2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '認証は本人確認、認可はアクセス権限の確認', TRUE, 1),
    (gen_random_uuid(), q_id, '認証はパスワード、認可はID', FALSE, 2),
    (gen_random_uuid(), q_id, '両者は同じ意味', FALSE, 3),
    (gen_random_uuid(), q_id, '認証はサーバー側、認可はクライアント側', FALSE, 4);

  -- Question 7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「OAuth」の説明として最も適切なものは？', 'OAuth はサードパーティアプリケーションにアクセス権限を安全に委譲するための認可プロトコルです。', 2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アクセス権限を安全に委譲する認可プロトコル', TRUE, 1),
    (gen_random_uuid(), q_id, 'パスワードを安全にハッシュ化・暗号化するアルゴリズム', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースへのアクセスを制御するための認証機能', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイアウォールのルールと通信制御の設定方式', FALSE, 4);

  -- Question 8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「JWT」とは何の略称ですか？', 'JWT（JSON Web Token）はJSONベースの認証トークンで、ステートレスな認証に使用されます。', 2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JSON Web Token', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java Web Technology', FALSE, 2),
    (gen_random_uuid(), q_id, 'JavaScript Widget Tool', FALSE, 3),
    (gen_random_uuid(), q_id, 'Joint Work Template', FALSE, 4);

  -- Question 9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「RDB」とは何の略称ですか？', 'RDB（Relational Database）はテーブル（表）形式でデータを管理するデータベースです。', 2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Relational Database', TRUE, 1),
    (gen_random_uuid(), q_id, 'Remote Data Backup', FALSE, 2),
    (gen_random_uuid(), q_id, 'Real-time Data Bridge', FALSE, 3),
    (gen_random_uuid(), q_id, 'Redundant Data Block', FALSE, 4);

  -- Question 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「NoSQL」の説明として最も適切なものは？', 'NoSQLはリレーショナルでないデータベースの総称で、ドキュメント型やキーバリュー型などがあります。', 2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リレーショナルでないデータベースの総称', TRUE, 1),
    (gen_random_uuid(), q_id, 'SQLを使わないプログラミング手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベースを使わないシステム設計', FALSE, 3),
    (gen_random_uuid(), q_id, 'SQLの新しいバージョン', FALSE, 4);

  -- Question 11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「正規化」（せいきか）のデータベースにおける目的は？', '正規化（Normalization）はデータの重複を排除し、整合性を保つためのテーブル設計手法です。', 2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの重複排除と整合性の維持', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの機密性を確保するための暗号化処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'データのファイルサイズを削減するための圧縮処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース内のレコードを高速に検索する処理', FALSE, 4);

  -- Question 12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「インデックス」のデータベースにおける役割は？', 'インデックス（Index）はデータベースの検索速度を向上させるための索引です。', 2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの検索速度を向上させるための索引', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを安全に保管するためのバックアップ方法', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの内容を保護するための暗号化の方法', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースから不要なレコードを削除する方法', FALSE, 4);

  -- Question 13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「トランザクション」の説明として最も適切なものは？', 'トランザクション（Transaction）はデータベース操作の一連の処理単位で、全て成功か全て取り消しのいずれかです。', 2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DB操作の一連の処理単位', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの転送処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク通信の単位', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルの読み書き処理', FALSE, 4);

  -- Question 14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ACID」特性の各要素は？', 'ACID（Atomicity, Consistency, Isolation, Durability）はトランザクションの4つの特性です。', 2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Atomicity, Consistency, Isolation, Durability', TRUE, 1),
    (gen_random_uuid(), q_id, 'Authentication, Certification, Integration, Distribution', FALSE, 2),
    (gen_random_uuid(), q_id, 'Availability, Capacity, Integrity, Delivery', FALSE, 3),
    (gen_random_uuid(), q_id, 'Access, Control, Identity, Data', FALSE, 4);

  -- Question 15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ORM」とは何の略称ですか？', 'ORM（Object-Relational Mapping）はオブジェクトとRDBのテーブルを対応付ける技術です。', 2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Object-Relational Mapping', TRUE, 1),
    (gen_random_uuid(), q_id, 'Online Resource Management', FALSE, 2),
    (gen_random_uuid(), q_id, 'Open Runtime Module', FALSE, 3),
    (gen_random_uuid(), q_id, 'Operational Risk Monitoring', FALSE, 4);

  -- Question 16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マイグレーション」のデータベースにおける意味は？', 'マイグレーション（Migration）はデータベースのスキーマ変更をバージョン管理する仕組みです。', 2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DBスキーマ変更のバージョン管理の仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'データベースの内容を定期的にバックアップする処理', FALSE, 2),
    (gen_random_uuid(), q_id, '既存のサーバーから新環境へのシステム移行作業', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトで使用するプログラミング言語の変更', FALSE, 4);

  -- Question 17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「キャッシュ」のアプリケーションにおける目的は？', 'キャッシュ（Cache）は頻繁にアクセスするデータを一時保存し、処理速度を向上させます。', 2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '頻繁にアクセスするデータの一時保存で速度向上', TRUE, 1),
    (gen_random_uuid(), q_id, 'データをストレージに永続的に保存して維持する処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの機密性を確保するための暗号化処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの複製を別の記憶領域にバックアップする処理', FALSE, 4);

  -- Question 18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「GraphQL」の特徴は？', 'GraphQLはクライアントが必要なデータだけを指定して取得できるAPIクエリ言語です。', 2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '必要なデータだけを指定して取得できるAPI言語', TRUE, 1),
    (gen_random_uuid(), q_id, 'グラフ構造のデータベースを操作するための言語', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの可視化やグラフ描画に使うライブラリ', FALSE, 3),
    (gen_random_uuid(), q_id, 'SQLに新しい機能や構文を追加した拡張版の言語', FALSE, 4);

  -- Question 19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「WebSocket」の特徴として最も適切なものは？', 'WebSocketはクライアントとサーバー間で双方向のリアルタイム通信を可能にするプロトコルです。', 2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '双方向のリアルタイム通信を実現するプロトコル', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバー間でファイルを転送するためのプロトコル', FALSE, 2),
    (gen_random_uuid(), q_id, '電子メールの送受信に使用される通信プロトコル', FALSE, 3),
    (gen_random_uuid(), q_id, 'クライアントがデータベースに接続するプロトコル', FALSE, 4);

  -- Question 20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SSR」と「CSR」の違いは？', 'SSR（Server-Side Rendering）はサーバー側でHTMLを生成、CSR（Client-Side Rendering）はブラウザ側で生成します。', 2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SSRはサーバー側、CSRはブラウザ側でHTMLを生成', TRUE, 1),
    (gen_random_uuid(), q_id, 'SSRはセキュリティ制御、CSRはキャッシュ管理を表す略称', FALSE, 2),
    (gen_random_uuid(), q_id, 'SSRは静的サイト生成専用、CSRは動的サイト生成専用の技術', FALSE, 3),
    (gen_random_uuid(), q_id, '基本設計と詳細設計に明確な違いは存在しない', FALSE, 4);

  -- Question 21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SPA」とは何の略称ですか？', 'SPA（Single Page Application）はページ遷移なしでコンテンツを動的に切り替えるWebアプリです。', 2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Single Page Application', TRUE, 1),
    (gen_random_uuid(), q_id, 'Secure Protocol Architecture', FALSE, 2),
    (gen_random_uuid(), q_id, 'Server Process Automation', FALSE, 3),
    (gen_random_uuid(), q_id, 'System Performance Analysis', FALSE, 4);

  -- Question 22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「マイクロフロントエンド」とは何ですか？', 'マイクロフロントエンドはフロントエンドアプリを小さな独立した部分に分割する設計パターンです。', 2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フロントエンドを小さな独立部分に分割する設計', TRUE, 1),
    (gen_random_uuid(), q_id, 'モバイルデバイス向けに最適化した小さなUI設計', FALSE, 2),
    (gen_random_uuid(), q_id, 'スタイルの定義を効率化するCSSフレームワーク名', FALSE, 3),
    (gen_random_uuid(), q_id, '機能を最小限に絞り込んだJavaScriptの軽量版', FALSE, 4);

  -- Question 23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CORS」とは何の略称ですか？', 'CORS（Cross-Origin Resource Sharing）は異なるオリジン間でリソースを共有するための仕組みです。', 2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Cross-Origin Resource Sharing', TRUE, 1),
    (gen_random_uuid(), q_id, 'Central Object Repository System', FALSE, 2),
    (gen_random_uuid(), q_id, 'Client-Origin Request Security', FALSE, 3),
    (gen_random_uuid(), q_id, 'Cache Optimization Response Standard', FALSE, 4);

  -- Question 24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ハッシュ化」と「暗号化」の違いは？', 'ハッシュ化は一方向（元に戻せない）、暗号化は双方向（復号可能）の変換です。', 2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ハッシュ化は一方向、暗号化は復号可能', TRUE, 1),
    (gen_random_uuid(), q_id, '両方とも一方向', FALSE, 2),
    (gen_random_uuid(), q_id, '両方とも復号可能', FALSE, 3),
    (gen_random_uuid(), q_id, 'ハッシュ化は復号可能、暗号化は一方向', FALSE, 4);

  -- Question 25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「アーキテクチャ」のソフトウェアにおける意味は？', 'ソフトウェアアーキテクチャはシステムの全体的な構造・設計方針のことです。', 2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システムの全体的な構造・設計方針', TRUE, 1),
    (gen_random_uuid(), q_id, 'ソフトウェア開発に使用するプログラミング言語の種類', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーのCPUやメモリなどのハードウェア構成', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク機器の接続と構成を示す接続図', FALSE, 4);

  -- Question 26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「モノリシック」アーキテクチャの特徴は？', 'モノリシック（Monolithic）はアプリケーション全体を一つの大きなコードベースとして構築するアーキテクチャです。', 2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリ全体を一つの大きなコードベースで構築', TRUE, 1),
    (gen_random_uuid(), q_id, '機能を小さなサービスに分割して個別に構築する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバー管理不要なクラウド環境上で構築する手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンテナ仮想化技術を使って環境を構築する手法', FALSE, 4);

  -- Question 27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「サーバーレス」の説明として最も適切なものは？', 'サーバーレス（Serverless）はサーバー管理不要で、関数単位でコードを実行するクラウドサービスです。', 2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー管理不要で関数単位でコードを実行', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーを使わずにオフラインで動作するアプリ', FALSE, 2),
    (gen_random_uuid(), q_id, '物理サーバーが一切存在しないクラウドシステム', FALSE, 3),
    (gen_random_uuid(), q_id, 'クライアント側のブラウザのみで動作するアプリ', FALSE, 4);

  -- Question 28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「メッセージキュー」の用途は？', 'メッセージキュー（Message Queue）はシステム間の非同期通信を実現するためのミドルウェアです。', 2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'システム間の非同期通信を実現する', TRUE, 1),
    (gen_random_uuid(), q_id, 'メッセージの内容を暗号化して安全に送信する', FALSE, 2),
    (gen_random_uuid(), q_id, 'リアルタイムのチャットアプリケーションを構築する', FALSE, 3),
    (gen_random_uuid(), q_id, '指定条件に基づき電子メールを自動的に送信する', FALSE, 4);

  -- Question 29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レプリケーション」のデータベースにおける意味は？', 'レプリケーション（Replication）はデータベースのデータを複数のサーバーに複製する仕組みです。', 2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DBデータを複数のサーバーに複製する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの機密性を保護するために暗号化する仕組み', FALSE, 2),
    (gen_random_uuid(), q_id, 'データのサイズを圧縮してストレージを節約する仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, '不要になったデータを安全に消去して削除する仕組み', FALSE, 4);

  -- Question 30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「シャーディング」とは何ですか？', 'シャーディング（Sharding）はデータベースを分割して複数のサーバーに分散配置する手法です。', 2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DBを分割して複数サーバーに分散配置する手法', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの機密情報を暗号化して安全に管理する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの複製を別の環境にバックアップして保管する手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'データ容量を効率的に圧縮して保存領域を節約する手法', FALSE, 4);

  -- Question 31
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「DDoS攻撃」とは何ですか？', 'DDoS（Distributed Denial of Service）攻撃は多数のコンピュータから一斉にアクセスし、サービスを停止させる攻撃です。', 2, 31);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '多数から一斉にアクセスしサービスを停止させる攻撃', TRUE, 1),
    (gen_random_uuid(), q_id, 'データベースの内容を不正に書き換えて改ざんする攻撃', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーのパスワードを不正に入手して盗み取る攻撃', FALSE, 3),
    (gen_random_uuid(), q_id, '大量のスパムメールを一斉に送信して妨害する攻撃', FALSE, 4);

  -- Question 32
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ゼロトラスト」セキュリティとは？', 'ゼロトラスト（Zero Trust）は社内外を問わず全てのアクセスを信頼せず検証するセキュリティモデルです。', 2, 32);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全アクセスを信頼せず検証するセキュリティモデル', TRUE, 1),
    (gen_random_uuid(), q_id, 'セキュリティの対策コストをゼロにする運用モデル', FALSE, 2),
    (gen_random_uuid(), q_id, '社内ネットワーク内部の通信のみを信頼するモデル', FALSE, 3),
    (gen_random_uuid(), q_id, 'パスワードの代わりに生体認証を使う認証モデル', FALSE, 4);

  -- Question 33
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「二要素認証」（にようそにんしょう）の英語略称は？', '二要素認証（Two-Factor Authentication、2FA）は2つの異なる認証要素を使用する認証方式です。', 2, 33);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2FA', TRUE, 1),
    (gen_random_uuid(), q_id, 'SSO', FALSE, 2),
    (gen_random_uuid(), q_id, 'MFA', FALSE, 3),
    (gen_random_uuid(), q_id, 'PKI', FALSE, 4);

  -- Question 34
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「WAF」とは何の略称ですか？', 'WAF（Web Application Firewall）はWebアプリケーションへの攻撃を検知・遮断するファイアウォールです。', 2, 34);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Web Application Firewall', TRUE, 1),
    (gen_random_uuid(), q_id, 'Wide Area Framework', FALSE, 2),
    (gen_random_uuid(), q_id, 'Wireless Access Function', FALSE, 3),
    (gen_random_uuid(), q_id, 'Web API Format', FALSE, 4);

  -- Question 35
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「イベント駆動アーキテクチャ」の特徴は？', 'イベント駆動アーキテクチャ（Event-Driven Architecture）はイベントの発生に応じて処理を実行する設計パターンです。', 2, 35);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'イベントの発生に応じて処理を実行する', TRUE, 1),
    (gen_random_uuid(), q_id, 'スケジュールに従って処理を実行する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーの手動操作で処理を実行する', FALSE, 3),
    (gen_random_uuid(), q_id, '一定間隔で処理を実行する', FALSE, 4);

  -- Question 36
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「API Gateway」の役割は？', 'API GatewayはクライアントからのAPIリクエストを受け付け、適切なサービスにルーティングする入り口です。', 2, 36);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'APIリクエストを受付しサービスにルーティングする', TRUE, 1),
    (gen_random_uuid(), q_id, 'APIの仕様書やドキュメントを自動的に生成する処理', FALSE, 2),
    (gen_random_uuid(), q_id, 'APIのエンドポイントに対するテストを自動実行する処理', FALSE, 3),
    (gen_random_uuid(), q_id, 'APIの定義に基づきクライアントコードを自動生成する', FALSE, 4);

  -- Question 37
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「デッドロック」とは何ですか？', 'デッドロック（Deadlock）は複数のプロセスが互いにリソースを待ち合い、処理が進まなくなる状態です。', 2, 37);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数プロセスが互いにリソースを待ち処理停止する状態', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーのプロセスが異常終了してダウンする障害状態', FALSE, 2),
    (gen_random_uuid(), q_id, 'プログラムの処理が終了条件を満たさず無限に繰り返す状態', FALSE, 3),
    (gen_random_uuid(), q_id, '通信回線やネットワーク接続が途中で切断される障害状態', FALSE, 4);

  -- Question 38
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ガベージコレクション」（GC）とは何ですか？', 'ガベージコレクション（Garbage Collection）は不要になったメモリ領域を自動的に解放する仕組みです。', 2, 38);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '不要なメモリ領域を自動解放する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, '不要なファイルを自動削除する仕組み', FALSE, 2),
    (gen_random_uuid(), q_id, '不要なプロセスを自動停止する仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, '不要なログを自動消去する仕組み', FALSE, 4);

  -- Question 39
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「Webhook」の説明として最も適切なものは？', 'Webhook は特定のイベント発生時に指定のURLにHTTPリクエストを自動送信する仕組みです。', 2, 39);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'イベント発生時に指定URLにHTTPリクエストを送信する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, 'Webページの内容を定期的に自動取得してスクレイピングする仕組み', FALSE, 2),
    (gen_random_uuid(), q_id, 'Webサイトの稼働状態や応答速度を継続的に常時監視する仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, 'Webページの表示を高速化するためにキャッシュを管理する仕組み', FALSE, 4);

  -- Question 40
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「CI/CDツール」の例として適切なものは？', 'GitHub Actions、Jenkins、CircleCIなどがCI/CDツールの代表例です。', 2, 40);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GitHub Actions / Jenkins / CircleCI', TRUE, 1),
    (gen_random_uuid(), q_id, 'React / Vue.js / Angular / Svelte', FALSE, 2),
    (gen_random_uuid(), q_id, 'MySQL / PostgreSQL / MongoDB / Redis', FALSE, 3),
    (gen_random_uuid(), q_id, 'Figma / Sketch / Adobe XD / Canva', FALSE, 4);

  -- Question 41
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「リファレンスアーキテクチャ」とは何ですか？', 'リファレンスアーキテクチャは特定の問題領域に対する推奨されるシステム構成の参照モデルです。', 2, 41);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '推奨されるシステム構成の参照モデル', TRUE, 1),
    (gen_random_uuid(), q_id, '開発技術を学ぶためのプログラミング参考書籍', FALSE, 2),
    (gen_random_uuid(), q_id, 'APIの利用方法を説明する公式ドキュメント資料', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト実施における方針と手順のガイドライン', FALSE, 4);

  -- Question 42
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「テナント」のクラウドにおける意味は？', 'テナント（Tenant）はクラウドサービスの利用者（組織）単位のことで、マルチテナントは複数組織で共有する構成です。', 2, 42);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラウドサービスの利用者単位', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバーの物理的な設置場所', FALSE, 2),
    (gen_random_uuid(), q_id, '機器同士をネットワークで接続する通信方式', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの保存形式', FALSE, 4);

  -- Question 43
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「冪等性」（べきとうせい）のAPIにおける意味は？', '冪等性（Idempotency）は同じリクエストを何度送信しても同じ結果になるAPI設計の特性です。', 2, 43);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '同じリクエストを何度送信しても同じ結果になる特性', TRUE, 1),
    (gen_random_uuid(), q_id, 'リクエストがサーバーで高速に処理されるという特性', FALSE, 2),
    (gen_random_uuid(), q_id, 'リクエストの内容が自動的に暗号化されるという特性', FALSE, 3),
    (gen_random_uuid(), q_id, 'リクエストが失敗時に自動的にリトライされるという特性', FALSE, 4);

  -- Question 44
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「レートリミット」（Rate Limit）の目的は？', 'レートリミットは一定時間内のAPIリクエスト数を制限し、過負荷やDDoS攻撃を防止します。', 2, 44);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'APIリクエスト数を制限し過負荷を防止する', TRUE, 1),
    (gen_random_uuid(), q_id, 'データの転送速度を上限値に制限して制御する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーの一定時間内のログイン回数を制限する', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースへの同時接続数を上限値で制限する', FALSE, 4);

  -- Question 45
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「ブルーグリーンデプロイメント」とは何ですか？', 'ブルーグリーンデプロイメントは本番（Blue）と新版（Green）の2環境を用意し、切り替えてリリースする手法です。', 2, 45);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2つの環境を切り替えてリリースする手法', TRUE, 1),
    (gen_random_uuid(), q_id, '環境を色分けして管理する手法', FALSE, 2),
    (gen_random_uuid(), q_id, 'デプロイを2段階で行う手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト環境と本番環境を同期する手法', FALSE, 4);

  -- Question 46
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「カナリアリリース」の特徴は？', 'カナリアリリース（Canary Release）は新バージョンを一部のユーザーにのみ先行公開し、問題ないか確認する手法です。', 2, 46);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一部ユーザーに先行公開して問題を確認する手法', TRUE, 1),
    (gen_random_uuid(), q_id, '全ユーザーに対して一斉に新版をリリースする手法', FALSE, 2),
    (gen_random_uuid(), q_id, '決まったスケジュールでリリースを定期的に行う手法', FALSE, 3),
    (gen_random_uuid(), q_id, 'リリース直前にテスト工程を全て自動化する手法', FALSE, 4);

  -- Question 47
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「オブザーバビリティ」（Observability）とは？', 'オブザーバビリティはログ・メトリクス・トレースを統合してシステム状態を可視化・分析する能力です。', 2, 47);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ログ・メトリクス・トレースでシステム状態を可視化する能力', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバールームに物理的な監視カメラを設置して録画する運用', FALSE, 2),
    (gen_random_uuid(), q_id, 'Webサイト上でのユーザー行動パターンを分析する手法のこと', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソースコードを実行せずに構文や品質を検査する静的解析手法', FALSE, 4);

  -- Question 48
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「サービスメッシュ」とは何ですか？', 'サービスメッシュ（Service Mesh）はマイクロサービス間の通信を管理・制御するインフラ層です。', 2, 48);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マイクロサービス間通信を管理するインフラ層', TRUE, 1),
    (gen_random_uuid(), q_id, 'ネットワーク機器同士をメッシュ状に接続する方式', FALSE, 2),
    (gen_random_uuid(), q_id, 'サービスの稼働率や可用性を測定する監視ツール', FALSE, 3),
    (gen_random_uuid(), q_id, 'API定義からコードやドキュメントを自動生成するツール', FALSE, 4);

  -- Question 49
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「SOLID原則」のうち「S」は何を表しますか？', 'SOLID原則のSは Single Responsibility Principle（単一責任の原則）で、クラスは一つの責任だけを持つべきという原則です。', 2, 49);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Single Responsibility Principle', TRUE, 1),
    (gen_random_uuid(), q_id, 'Secure System Protection Principle', FALSE, 2),
    (gen_random_uuid(), q_id, 'Simple Structure Planning Principle', FALSE, 3),
    (gen_random_uuid(), q_id, 'Shared Service Platform Principle', FALSE, 4);

  -- Question 50
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice', '「フィーチャーフラグ」（Feature Flag）とは何ですか？', 'フィーチャーフラグは設定の切り替えで機能の有効/無効をコード変更なしに制御する仕組みです。', 2, 50);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '設定切り替えで機能の有効/無効を制御する仕組み', TRUE, 1),
    (gen_random_uuid(), q_id, '新機能の開発における優先度を示すためのラベル', FALSE, 2),
    (gen_random_uuid(), q_id, '検出されたバグの緊急度と重要度を示すフラグ値', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト実行結果の合格・不合格を示すフラグの値', FALSE, 4);

END $$;

-- ============================================
-- Post-insert: set question_category and difficulty
-- question_category = 'vocabulary' for all IT vocabulary questions
-- difficulty by sort_order: 初級 1-10, 中級 11-30, 上級 31-50
-- ============================================
UPDATE quiz_questions SET question_category = 'vocabulary'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
);

UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 1 AND 10;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 11 AND 30;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b1000001-0000-0000-0000-000000000001',
  'b1000002-0000-0000-0000-000000000002',
  'b1000003-0000-0000-0000-000000000003',
  'b1000004-0000-0000-0000-000000000004',
  'b1000005-0000-0000-0000-000000000005'
) AND sort_order BETWEEN 31 AND 50;

COMMIT;
