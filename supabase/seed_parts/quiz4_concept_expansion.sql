-- ============================================================
-- Dev Assessment Quiz: Concept Questions Expansion
-- Quiz ID: a0000004-0000-0000-0000-000000000004
-- 60 questions (12 per subject × 5 subjects)
-- sort_order: 241–300
-- Difficulty per subject: easy 4, medium 5, hard 3
-- ============================================================

-- ============================================================
-- 1. Java (question_category = 'java') — sort_order 241–252
-- ============================================================

-- Java Q1 (easy) — Generics
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaのジェネリクスにおいて、List<String>に対してList<Object>を代入できない理由として正しいものはどれですか？',
'multiple_choice', 'easy', 'java', 'concept',
'Javaのジェネリクスは不変（invariant）です。List<String>はList<Object>のサブタイプではないため、型安全性を保つために代入が禁止されています。',
1, 241, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 241), 'StringはObjectを継承していないため', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 241), 'ジェネリクスは不変であり、List<String>はList<Object>のサブタイプではないため', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 241), 'コンパイラの最適化により禁止されているため', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 241), 'Listインターフェースがfinalとして定義されているため', false, 4);

-- Java Q2 (easy) — Lambda Expressions
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaのラムダ式が使用できるインターフェースの条件として正しいものはどれですか？',
'multiple_choice', 'easy', 'java', 'concept',
'ラムダ式は関数型インターフェース（抽象メソッドが1つだけのインターフェース）に対して使用できます。@FunctionalInterfaceアノテーションで明示できます。',
1, 242, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 242), 'すべてのメソッドがstaticであること', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 242), '抽象メソッドが1つだけ定義されていること', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 242), 'Serializableを実装していること', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 242), 'デフォルトメソッドが存在しないこと', false, 4);

-- Java Q3 (easy) — Access Modifiers
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaのアクセス修飾子において、同じパッケージ内の他のクラスとサブクラスからアクセス可能だが、パッケージ外の非サブクラスからはアクセスできないものはどれですか？',
'multiple_choice', 'easy', 'java', 'concept',
'protectedは同一パッケージ内のすべてのクラスと、パッケージ外のサブクラスからアクセス可能です。パッケージ外の非サブクラスからはアクセスできません。',
1, 243, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 243), 'public', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 243), 'private', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 243), 'protected', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 243), 'デフォルト（修飾子なし）', false, 4);

-- Java Q4 (easy) — Interface vs Abstract Class
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Java 8以降において、インターフェースと抽象クラスの違いとして正しいものはどれですか？',
'multiple_choice', 'easy', 'java', 'concept',
'Java 8以降、インターフェースもデフォルトメソッドを持てますが、コンストラクタやインスタンスフィールドは持てません。抽象クラスは状態（フィールド）を保持でき、コンストラクタも定義できます。',
1, 244, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 244), 'インターフェースはメソッドの実装を一切持てない', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 244), '抽象クラスは複数継承が可能である', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 244), '抽象クラスはインスタンスフィールドとコンストラクタを持てるが、インターフェースは持てない', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 244), 'インターフェースはstaticメソッドを定義できない', false, 4);

-- Java Q5 (medium) — Stream API
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaのStream APIにおいて、中間操作（intermediate operation）の特徴として正しいものはどれですか？',
'multiple_choice', 'medium', 'java', 'concept',
'中間操作は遅延評価（lazy evaluation）されます。終端操作が呼び出されるまで実際の処理は実行されません。これにより不要な計算を避け、パフォーマンスを最適化できます。',
1, 245, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 245), '呼び出した時点で即座に処理が実行される', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 245), '終端操作が呼び出されるまで処理が遅延される', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 245), '常に新しいコレクションを生成して返す', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 245), '一度のストリームで複数回実行できる', false, 4);

-- Java Q6 (medium) — Optional
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaのOptionalクラスの使い方として推奨されないパターンはどれですか？',
'multiple_choice', 'medium', 'java', 'concept',
'Optionalをフィールドやメソッドの引数として使用することは推奨されません。Optionalは主にメソッドの戻り値として「値がない可能性」を明示するために設計されています。フィールドに使うとシリアライズの問題も発生します。',
1, 246, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 246), 'メソッドの戻り値として使用する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 246), 'orElse()でデフォルト値を指定する', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 246), 'クラスのフィールド型として使用する', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 246), 'map()やflatMap()でチェーン処理する', false, 4);

-- Java Q7 (medium) — Collections Framework
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaのHashMapにおいて、キーのハッシュ衝突が発生した場合の内部動作として正しいものはどれですか？（Java 8以降）',
'multiple_choice', 'medium', 'java', 'concept',
'Java 8以降、HashMapはハッシュ衝突時にまずリンクリストでチェインしますが、同じバケットの要素数が閾値（8）を超えると赤黒木に変換されます。これにより最悪計算量がO(n)からO(log n)に改善されます。',
1, 247, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 247), '自動的にリハッシュして衝突を解消する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 247), 'リンクリストで管理し、要素数が閾値を超えると赤黒木に変換する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 247), '例外をスローして挿入を拒否する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 247), 'オープンアドレス法で次の空きスロットに格納する', false, 4);

-- Java Q8 (medium) — Exception Hierarchy
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaの例外処理において、チェック例外（checked exception）と非チェック例外（unchecked exception）の違いとして正しいものはどれですか？',
'multiple_choice', 'medium', 'java', 'concept',
'チェック例外はコンパイル時にcatchまたはthrows宣言が必要です。RuntimeExceptionとそのサブクラスは非チェック例外で、コンパイル時のチェックは不要です。Errorも非チェックですが例外とは別の分類です。',
1, 248, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 248), 'チェック例外はRuntimeExceptionのサブクラスである', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 248), 'チェック例外はコンパイル時にcatchまたはthrows宣言が必要である', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 248), '非チェック例外はtry-catchで捕捉できない', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 248), 'すべてのExceptionクラスはチェック例外である', false, 4);

-- Java Q9 (medium) — Serialization
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaのシリアライズにおいて、serialVersionUIDを明示的に定義する主な理由はどれですか？',
'multiple_choice', 'medium', 'java', 'concept',
'serialVersionUIDを明示的に定義しない場合、コンパイラがクラス構造から自動生成します。クラスに変更を加えるとUIDが変わり、以前にシリアライズしたデータがデシリアライズできなくなります。明示的に定義することでバージョン互換性を制御できます。',
1, 249, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 249), 'シリアライズ処理の速度を向上させるため', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 249), 'クラス変更時のバージョン互換性を制御するため', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 249), 'セキュリティ上の暗号化キーとして使用するため', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 249), 'JVMがクラスを一意に識別するため', false, 4);

-- Java Q10 (hard) — Thread Safety
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'マルチスレッド環境でHashMapの代わりにConcurrentHashMapを使用する場合、ConcurrentHashMapの内部実装の特徴として正しいものはどれですか？（Java 8以降）',
'multiple_choice', 'hard', 'java', 'concept',
'Java 8以降のConcurrentHashMapは、セグメントロックではなくCAS（Compare-And-Swap）操作とノード単位のsynchronizedを使用します。読み取り操作はほぼロックフリーで、書き込み操作は影響を受けるバケットのみをロックします。',
1, 250, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 250), 'マップ全体に対して単一のロックを使用する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 250), 'CAS操作とバケット単位のsynchronizedにより、読み取りはロックフリーで動作する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 250), 'ReadWriteLockで読み取りと書き込みを分離する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 250), '各操作でマップ全体のコピーを作成するCopy-On-Write方式を使用する', false, 4);

-- Java Q11 (hard) — Memory Model
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Javaメモリモデル（JMM）において、volatileキーワードが保証するものとして正しいものはどれですか？',
'multiple_choice', 'hard', 'java', 'concept',
'volatileは可視性（visibility）と順序保証（happens-before関係）を提供します。あるスレッドがvolatile変数に書き込むと、その変更は他のすべてのスレッドに即座に可視になります。ただし、複合操作（例：i++）の原子性は保証しません。',
1, 251, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 251), '複合操作（read-modify-write）の原子性を保証する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 251), 'スレッド間での変数の可視性とhappens-before関係を保証する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 251), 'デッドロックの発生を防止する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 251), '変数へのアクセスを排他的に制御する（ミューテックスと同等）', false, 4);

-- Java Q12 (hard) — Design Patterns
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'あるクラスのインスタンス生成コストが高く、既存のインスタンスを複製して新しいオブジェクトを作りたい場合に最も適切なデザインパターンはどれですか？',
'multiple_choice', 'hard', 'java', 'concept',
'Prototypeパターンは、既存のオブジェクトをクローンして新しいインスタンスを生成するパターンです。生成コストが高いオブジェクトや、実行時にクラスを動的に決定する場合に有効です。JavaではCloneableインターフェースとclone()メソッドで実装できます。',
1, 252, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 252), 'Factory Methodパターン', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 252), 'Builderパターン', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 252), 'Singletonパターン', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 252), 'Prototypeパターン', true, 4);


-- ============================================================
-- 2. Spring Boot (question_category = 'spring_boot') — sort_order 253–264
-- ============================================================

-- Spring Boot Q1 (easy) — Bean Scope
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring BootにおけるBeanのデフォルトスコープはどれですか？',
'multiple_choice', 'easy', 'spring_boot', 'concept',
'SpringのBeanはデフォルトでsingletonスコープです。アプリケーションコンテキスト内で1つのインスタンスのみが生成され、すべての注入箇所で同じインスタンスが共有されます。',
1, 253, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 253), 'prototype', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 253), 'singleton', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 253), 'request', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 253), 'session', false, 4);

-- Spring Boot Q2 (easy) — Starter Dependencies
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootのスターター依存関係（starter dependencies）の主な目的はどれですか？',
'multiple_choice', 'easy', 'spring_boot', 'concept',
'スターター依存関係は、特定の機能に必要なライブラリ群を1つの依存関係としてまとめたものです。バージョン互換性が保証された関連ライブラリを一括で追加でき、依存関係管理を大幅に簡素化します。',
1, 254, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 254), 'アプリケーションの起動速度を向上させること', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 254), '関連ライブラリ群を互換性が保証されたバージョンで一括管理すること', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 254), 'テストコードを自動生成すること', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 254), 'デプロイ用のDockerイメージを作成すること', false, 4);

-- Spring Boot Q3 (easy) — Embedded Server
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootが組み込みサーバーを採用している利点として最も適切なものはどれですか？',
'multiple_choice', 'easy', 'spring_boot', 'concept',
'組み込みサーバーにより、外部のアプリケーションサーバーにWARをデプロイする必要がなくなり、JARファイル単体で実行可能になります。これにより環境構築が簡素化され、デプロイも容易になります。',
1, 255, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 255), 'WARファイルのサイズを削減できる', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 255), '外部サーバー不要でJAR単体で実行でき、デプロイが簡素化される', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 255), 'HTTPリクエストの処理速度が必ず向上する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 255), 'SSL/TLSの設定が不要になる', false, 4);

-- Spring Boot Q4 (easy) — DevTools
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Boot DevToolsが提供する主な機能はどれですか？',
'multiple_choice', 'easy', 'spring_boot', 'concept',
'DevToolsはクラスパスのファイル変更を検知して自動的にアプリケーションを再起動します（ホットリスタート）。また、テンプレートエンジンのキャッシュ無効化やリモートデバッグ機能も提供します。',
1, 256, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 256), 'コード変更を検知してアプリケーションを自動再起動する', true, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 256), 'データベーススキーマを自動マイグレーションする', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 256), 'テストコードを自動実行する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 256), '本番環境のパフォーマンスを最適化する', false, 4);

-- Spring Boot Q5 (medium) — Auto-Configuration Mechanism
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootの自動設定（Auto-Configuration）が動作する仕組みとして正しいものはどれですか？',
'multiple_choice', 'medium', 'spring_boot', 'concept',
'Auto-Configurationは@EnableAutoConfigurationにより有効化され、META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.importsに定義されたクラスを読み込みます。各クラスは@Conditionalアノテーションで条件付きでBeanを登録します。',
1, 257, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 257), 'アプリケーション起動時にすべてのクラスをスキャンして最適な設定を推測する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 257), 'クラスパス上のライブラリと@Conditional条件に基づいてBeanを自動登録する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 257), 'application.propertiesに記述された設定のみを反映する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 257), 'XMLファイルに定義されたBean定義を自動的に読み込む', false, 4);

-- Spring Boot Q6 (medium) — Profile-Based Configuration
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootのプロファイル（Profile）機能について正しい説明はどれですか？',
'multiple_choice', 'medium', 'spring_boot', 'concept',
'プロファイルにより環境ごとに異なる設定やBeanを切り替えられます。application-{profile}.propertiesで環境別設定を定義し、spring.profiles.activeで有効化します。@Profile アノテーションで特定環境でのみBeanを登録することもできます。',
1, 258, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 258), 'ユーザーの権限レベルに応じてアクセス制御を行う機能である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 258), '実行環境に応じて設定やBeanの登録を切り替える機能である', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 258), 'アプリケーションのメモリ使用量を制限する機能である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 258), 'ログレベルを環境ごとに自動設定する専用の機能である', false, 4);

-- Spring Boot Q7 (medium) — Actuator Endpoints
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Boot Actuatorの/healthエンドポイントがDOWNステータスを返す場合の動作として正しいものはどれですか？',
'multiple_choice', 'medium', 'spring_boot', 'concept',
'Actuatorの/healthエンドポイントは各HealthIndicator（DB接続、ディスク容量、外部サービスなど）の結果を集約します。いずれかがDOWNの場合、全体のステータスもDOWNとなり、HTTPステータスコード503を返します。',
1, 259, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 259), 'アプリケーションを自動的にシャットダウンする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 259), 'HTTPステータス200でDOWN情報をJSON形式で返す', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 259), 'HTTPステータス503でDOWNステータスと詳細情報を返す', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 259), '管理者にメール通知を自動送信する', false, 4);

-- Spring Boot Q8 (medium) — Testing with @SpringBootTest
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'@SpringBootTestアノテーションと@WebMvcTestアノテーションの違いとして正しいものはどれですか？',
'multiple_choice', 'medium', 'spring_boot', 'concept',
'@SpringBootTestはアプリケーション全体のコンテキストをロードする統合テスト用です。@WebMvcTestはWebレイヤー（Controller）のみをロードするスライステストで、Service/Repositoryは自動ロードされないためモックが必要です。',
1, 260, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 260), '@WebMvcTestはアプリケーション全体をロードし、@SpringBootTestはControllerのみをロードする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 260), '@SpringBootTestは全コンテキストをロードし、@WebMvcTestはWebレイヤーのみをロードする', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 260), '両者に機能的な違いはなく、命名規約の違いのみである', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 260), '@SpringBootTestはユニットテスト用、@WebMvcTestは結合テスト用である', false, 4);

-- Spring Boot Q9 (medium) — Logging Configuration
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootでログレベルを特定のパッケージに対して変更する方法として正しいものはどれですか？',
'multiple_choice', 'medium', 'spring_boot', 'concept',
'application.propertiesでlogging.level.パッケージ名=LEVELと指定することで、特定パッケージのログレベルを設定できます。Actuatorが有効な場合は実行時に/actuator/loggersエンドポイントで動的変更も可能です。',
1, 261, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 261), 'ソースコード内でLogger.setLevel()を直接呼び出す', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 261), 'application.propertiesでlogging.level.パッケージ名=LEVELと指定する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 261), '環境変数LOG_LEVELを設定する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 261), '@LogLevel アノテーションをクラスに付与する', false, 4);

-- Spring Boot Q10 (hard) — Conditional Beans
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootで@ConditionalOnMissingBeanアノテーションが果たす役割として正しいものはどれですか？',
'multiple_choice', 'hard', 'spring_boot', 'concept',
'@ConditionalOnMissingBeanは、指定された型のBeanがコンテキストにまだ登録されていない場合にのみBeanを登録します。これにより、ユーザーが独自のBeanを定義した場合はそちらが優先され、Auto-Configurationのデフォルト実装はスキップされます。',
1, 262, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 262), '指定されたBeanが存在しない場合にエラーをスローする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 262), '指定された型のBeanが未登録の場合にのみBeanを登録し、ユーザー定義を優先する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 262), '既存のBeanを自動的に上書きする', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 262), '複数のBean候補からランダムに1つを選択する', false, 4);

-- Spring Boot Q11 (hard) — Externalized Configuration
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootの外部設定（Externalized Configuration）の優先順位として正しいものはどれですか？（高い順）',
'multiple_choice', 'hard', 'spring_boot', 'concept',
'Spring Bootの設定は17以上のソースから読み込まれ、コマンドライン引数が最も優先度が高く、次にOS環境変数、application.propertiesの順です。JARの外部にあるapplication.propertiesはJAR内部のものより優先されます。',
1, 263, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 263), 'application.properties → 環境変数 → コマンドライン引数', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 263), '環境変数 → コマンドライン引数 → application.properties', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 263), 'コマンドライン引数 → 環境変数 → application.properties', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 263), 'すべて同じ優先度で、最後に読み込まれたものが適用される', false, 4);

-- Spring Boot Q12 (hard) — Scheduled Tasks
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Spring Bootの@Scheduledアノテーションにおいて、fixedRateとfixedDelayの違いとして正しいものはどれですか？',
'multiple_choice', 'hard', 'spring_boot', 'concept',
'fixedRateは前回の実行開始時刻から指定間隔で次の実行を開始します（処理時間に関係なく一定間隔）。fixedDelayは前回の実行完了時刻から指定間隔で次の実行を開始します。処理時間が長い場合、fixedRateではタスクが重複実行される可能性があります。',
1, 264, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 264), 'fixedRateは非同期実行、fixedDelayは同期実行を行う', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 264), 'fixedRateは実行開始間隔、fixedDelayは実行完了から次の開始までの間隔である', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 264), 'fixedRateはミリ秒単位、fixedDelayは秒単位で指定する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 264), 'fixedRateはcron式の代替、fixedDelayは一回限りの実行である', false, 4);


-- ============================================================
-- 3. SQL (question_category = 'sql') — sort_order 265–276
-- ============================================================

-- SQL Q1 (easy) — Normalization Forms
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースの第2正規形（2NF）の条件として正しいものはどれですか？',
'multiple_choice', 'easy', 'sql', 'concept',
'第2正規形は第1正規形を満たし、かつすべての非キー属性が主キー全体に完全関数従属していること（部分関数従属がないこと）が条件です。複合主キーの一部にのみ依存する属性がある場合、2NFを満たしません。',
1, 265, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 265), 'すべての属性が原子的な値であること', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 265), '1NFを満たし、すべての非キー属性が主キー全体に完全関数従属していること', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 265), '推移的関数従属が存在しないこと', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 265), '外部キーがすべて定義されていること', false, 4);

-- SQL Q2 (easy) — ACID Properties
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'トランザクションのACID特性における「隔離性（Isolation）」が保証するものはどれですか？',
'multiple_choice', 'easy', 'sql', 'concept',
'隔離性は、同時に実行される複数のトランザクションが互いに干渉しないことを保証します。各トランザクションは他のトランザクションの中間状態を見ることができず、あたかも逐次的に実行されたかのように振る舞います。',
1, 266, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 266), 'トランザクションの結果が永続的に保存されること', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 266), 'トランザクション内の操作がすべて成功するかすべて失敗すること', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 266), '同時実行されるトランザクションが互いの中間状態に影響されないこと', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 266), 'データベースの整合性制約が常に満たされること', false, 4);

-- SQL Q3 (easy) — Constraint Types
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースのUNIQUE制約とPRIMARY KEY制約の違いとして正しいものはどれですか？',
'multiple_choice', 'easy', 'sql', 'concept',
'PRIMARY KEYはテーブルに1つだけ定義でき、NULLを許可しません。UNIQUE制約は複数定義でき、多くのDBMSではNULLを1つ許可します（実装依存）。どちらも値の一意性を保証します。',
1, 267, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 267), 'UNIQUE制約はインデックスを作成しないが、PRIMARY KEYはインデックスを作成する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 267), 'PRIMARY KEYはテーブルに1つだけでNULL不可、UNIQUEは複数定義可能でNULLを許容できる', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 267), '両者は完全に同じ機能であり、名前が異なるだけである', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 267), 'UNIQUE制約は外部キーの参照先にできないが、PRIMARY KEYはできる', false, 4);

-- SQL Q4 (easy) — View vs Materialized View
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ビュー（VIEW）とマテリアライズドビュー（MATERIALIZED VIEW）の違いとして正しいものはどれですか？',
'multiple_choice', 'easy', 'sql', 'concept',
'ビューはクエリ定義のみを保存し、アクセス時に毎回クエリを実行します。マテリアライズドビューはクエリ結果をディスクに物理的に保存するため高速ですが、データが古くなる可能性があり、明示的なリフレッシュが必要です。',
1, 268, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 268), 'ビューはデータを物理保存し、マテリアライズドビューはクエリ定義のみを保存する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 268), 'ビューはクエリ定義のみ保存して毎回実行し、マテリアライズドビューは結果を物理保存する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 268), '両者は同じ仕組みで、名前が異なるだけである', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 268), 'マテリアライズドビューはINSERT/UPDATE/DELETEが可能だが、ビューは読み取り専用である', false, 4);

-- SQL Q5 (medium) — Index Types
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'B-treeインデックスとハッシュインデックスの使い分けとして正しいものはどれですか？',
'multiple_choice', 'medium', 'sql', 'concept',
'B-treeインデックスは等値検索に加え、範囲検索やソートにも効率的です。ハッシュインデックスは等値検索に特化しており高速ですが、範囲検索やORDER BYには使用できません。',
1, 269, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 269), 'B-treeは文字列専用、ハッシュは数値専用のインデックスである', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 269), 'B-treeは範囲検索やソートにも有効だが、ハッシュは等値検索に特化している', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 269), 'ハッシュインデックスはB-treeより常に高速である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 269), 'B-treeはメモリ上のみ、ハッシュはディスク上のみで動作する', false, 4);

-- SQL Q6 (medium) — Stored Procedure vs Function
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースのストアドプロシージャとファンクション（ユーザー定義関数）の一般的な違いとして正しいものはどれですか？',
'multiple_choice', 'medium', 'sql', 'concept',
'ファンクションは必ず値を返し、SELECT文の中で呼び出せます。ストアドプロシージャは値を返す義務がなく、CALL/EXECで呼び出します。プロシージャはトランザクション制御が可能ですが、ファンクションは一般的に制限されます。',
1, 270, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 270), 'ストアドプロシージャは読み取り専用で、ファンクションは書き込みも可能である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 270), 'ファンクションは値を返しSELECT内で使用可能だが、プロシージャは値を返す義務がない', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 270), '両者は完全に同じ機能であり、呼び方が異なるだけである', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 270), 'プロシージャはPL/SQL専用で、ファンクションはすべてのDBMSで使用できる', false, 4);

-- SQL Q7 (medium) — Trigger Concepts
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベーストリガーのBEFOREトリガーとAFTERトリガーの使い分けとして適切なものはどれですか？',
'multiple_choice', 'medium', 'sql', 'concept',
'BEFOREトリガーはDML操作の前に実行され、データの検証や値の変更（NEW行の修正）に適しています。AFTERトリガーはDML操作の後に実行され、監査ログの記録や他テーブルへの連動更新に適しています。',
1, 271, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 271), 'BEFOREはSELECT操作用、AFTERはINSERT/UPDATE/DELETE操作用である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 271), 'BEFOREはデータ検証や値の修正に、AFTERは監査ログや連動更新に適している', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 271), 'BEFOREはロールバック可能だが、AFTERはロールバックできない', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 271), 'BEFOREは行レベルのみ、AFTERは文レベルのみで動作する', false, 4);

-- SQL Q8 (medium) — Database Lock Types
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースにおける共有ロック（Shared Lock）と排他ロック（Exclusive Lock）の関係として正しいものはどれですか？',
'multiple_choice', 'medium', 'sql', 'concept',
'共有ロック同士は互換性があり、複数トランザクションが同時に共有ロックを取得できます（同時読み取り可能）。排他ロックは他のすべてのロック（共有・排他）と非互換で、排他ロック中は他のトランザクションからの読み取り・書き込みがブロックされます。',
1, 272, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 272), '共有ロック中でも排他ロックを同時に取得できる', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 272), '共有ロック同士は同時取得可能だが、排他ロックは他のすべてのロックと非互換である', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 272), '排他ロック同士は互換性があり、同時取得できる', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 272), '共有ロックはテーブルレベルのみ、排他ロックは行レベルのみで適用される', false, 4);

-- SQL Q9 (medium) — Query Optimization
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'SQLのクエリ最適化において、インデックスが使用されなくなる（フルテーブルスキャンになる）ケースとして正しいものはどれですか？',
'multiple_choice', 'medium', 'sql', 'concept',
'WHERE句でインデックスカラムに関数を適用すると（例：WHERE YEAR(created_at) = 2024）、インデックスが利用できずフルスキャンになります。これを「SARGable（Search ARGument ABLE）でない」条件と呼びます。',
1, 273, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 273), 'WHERE句でインデックスカラムに等値比較を使用した場合', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 273), 'WHERE句でインデックスカラムに関数を適用した場合', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 273), 'SELECT句でインデックスカラムのみを指定した場合', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 273), 'ORDER BY句でインデックスカラムを指定した場合', false, 4);

-- SQL Q10 (hard) — Partitioning
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースのテーブルパーティショニングにおいて、レンジパーティションとリストパーティションの使い分けとして適切なものはどれですか？',
'multiple_choice', 'hard', 'sql', 'concept',
'レンジパーティションは連続的な値の範囲（日付、ID範囲など）で分割する場合に適しています。リストパーティションは離散的な値のリスト（地域コード、カテゴリなど）で分割する場合に適しています。',
1, 274, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 274), 'レンジは小さいテーブル用、リストは大きいテーブル用である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 274), 'レンジは日付などの連続値の範囲で、リストは地域コードなど離散値のリストで分割する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 274), 'レンジは読み取り最適化用、リストは書き込み最適化用である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 274), 'レンジはインデックス不要、リストはインデックス必須である', false, 4);

-- SQL Q11 (hard) — Replication Concepts
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースの同期レプリケーションと非同期レプリケーションのトレードオフとして正しいものはどれですか？',
'multiple_choice', 'hard', 'sql', 'concept',
'同期レプリケーションはレプリカへの書き込み完了を確認してからコミットするため、データ損失リスクが低いですが、レイテンシが増加します。非同期レプリケーションはコミット後にレプリカに反映するため高速ですが、障害時にデータ損失の可能性があります。',
1, 275, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 275), '同期はデータ安全性が高いがレイテンシが増加し、非同期は高速だがデータ損失リスクがある', true, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 275), '同期は読み取り専用レプリカ用、非同期は書き込み可能レプリカ用である', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 275), '同期は同一データセンター内のみ、非同期は地理分散環境のみで使用する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 275), '同期はスキーマ変更の反映用、非同期はデータ変更の反映用である', false, 4);

-- SQL Q12 (hard) — Backup Strategies
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'データベースバックアップにおける差分バックアップと増分バックアップの違いとして正しいものはどれですか？',
'multiple_choice', 'hard', 'sql', 'concept',
'差分バックアップは最後のフルバックアップ以降に変更されたすべてのデータを保存します。増分バックアップは最後のバックアップ（フルまたは増分）以降の変更のみを保存します。復元時、差分はフル+差分で済みますが、増分はフル+すべての増分が必要です。',
1, 276, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 276), '差分はデータのみ、増分はスキーマのみをバックアップする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 276), '差分は最後のフルバックアップ以降の全変更、増分は最後のバックアップ以降の変更のみを保存する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 276), '差分はホットバックアップ、増分はコールドバックアップの別名である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 276), '両者はバックアップ容量が同じで、復元速度のみが異なる', false, 4);


-- ============================================================
-- 4. JavaScript (question_category = 'javascript') — sort_order 277–288
-- ============================================================

-- JavaScript Q1 (easy) — Closure
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのクロージャ（closure）の説明として正しいものはどれですか？',
'multiple_choice', 'easy', 'javascript', 'concept',
'クロージャとは、関数がその外側のスコープの変数を参照し続ける仕組みです。外側の関数が実行を終えた後でも、内側の関数は外側のスコープの変数にアクセスできます。これはレキシカルスコープに基づいています。',
1, 277, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 277), '関数を即座に実行するパターンのことである', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 277), '関数が定義されたスコープの変数を、そのスコープの実行終了後も参照し続ける仕組みである', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 277), 'グローバル変数をカプセル化するためのクラス構文である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 277), 'コールバック関数の別名である', false, 4);

-- JavaScript Q2 (easy) — Destructuring
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptの分割代入（destructuring）において、const { name: userName } = obj; の動作として正しいものはどれですか？',
'multiple_choice', 'easy', 'javascript', 'concept',
'オブジェクトの分割代入で { name: userName } と書くと、objのnameプロパティの値をuserNameという変数名で取り出します。コロンの左がプロパティ名、右が新しい変数名です。',
1, 278, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 278), 'objにuserNameというプロパティを追加する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 278), 'objのnameプロパティの値をuserNameという変数に代入する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 278), 'objのuserNameプロパティの値をnameという変数に代入する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 278), 'nameとuserNameの両方の変数を作成する', false, 4);

-- JavaScript Q3 (easy) — Spread/Rest Operators
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのスプレッド構文でオブジェクトをコピーした場合（const copy = { ...original }）の特徴として正しいものはどれですか？',
'multiple_choice', 'easy', 'javascript', 'concept',
'スプレッド構文によるオブジェクトコピーはシャローコピー（浅いコピー）です。トップレベルのプロパティは新しいオブジェクトにコピーされますが、ネストされたオブジェクトは参照が共有されます。',
1, 279, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 279), 'ディープコピーが行われ、ネストされたオブジェクトも完全に独立する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 279), 'シャローコピーが行われ、ネストされたオブジェクトは参照が共有される', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 279), '元のオブジェクトへの参照のみがコピーされる（同一オブジェクト）', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 279), 'プロトタイプチェーンも含めてすべてコピーされる', false, 4);

-- JavaScript Q4 (easy) — Module System
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのESModules（ESM）とCommonJS（CJS）の違いとして正しいものはどれですか？',
'multiple_choice', 'easy', 'javascript', 'concept',
'ESMはimport/exportを使い静的解析が可能で、Tree Shakingに対応しています。CJSはrequire()/module.exportsを使い動的にモジュールをロードします。ESMは非同期ロード、CJSは同期ロードが基本です。',
1, 280, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 280), 'ESMは動的ロード、CJSは静的解析が可能である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 280), 'ESMはimport/exportで静的解析可能、CJSはrequire()で動的ロードする', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 280), 'ESMはサーバーサイド専用、CJSはブラウザ専用である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 280), '両者は構文が異なるだけで、機能的な違いはない', false, 4);

-- JavaScript Q5 (medium) — Prototype Chain
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのプロトタイプチェーンにおいて、obj.toString()を呼び出した時の検索順序として正しいものはどれですか？',
'multiple_choice', 'medium', 'javascript', 'concept',
'JavaScriptはまずオブジェクト自身のプロパティを検索し、見つからなければ__proto__（[[Prototype]]）を辿ってプロトタイプチェーンを遡ります。最終的にObject.prototypeに到達し、そこにもなければundefinedを返します。',
1, 281, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 281), 'Object.prototype → コンストラクタのprototype → obj自身のプロパティ', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 281), 'obj自身のプロパティ → プロトタイプチェーンを遡り → Object.prototypeまで検索', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 281), 'グローバルスコープ → obj自身のプロパティ → プロトタイプ', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 281), 'すべてのプロトタイプを並列に検索して最初に見つかったものを返す', false, 4);

-- JavaScript Q6 (medium) — Event Loop
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのイベントループにおいて、マイクロタスク（microtask）とマクロタスク（macrotask）の実行順序として正しいものはどれですか？',
'multiple_choice', 'medium', 'javascript', 'concept',
'イベントループでは、コールスタックが空になった後、まずすべてのマイクロタスク（Promise.then、queueMicrotask等）を処理し、その後に次のマクロタスク（setTimeout、setInterval等）を1つ処理します。マイクロタスクは常にマクロタスクより優先されます。',
1, 282, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 282), 'マクロタスクが先に処理され、次にマイクロタスクが処理される', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 282), 'すべてのマイクロタスクを処理してから、次のマクロタスクを1つ処理する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 282), 'マイクロタスクとマクロタスクは登録順に交互に処理される', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 282), '両者は別スレッドで並列に処理される', false, 4);

-- JavaScript Q7 (medium) — Promise Chaining
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのPromiseチェーンにおいて、.then()内でthrowされたエラーの挙動として正しいものはどれですか？',
'multiple_choice', 'medium', 'javascript', 'concept',
'.then()内でthrowされたエラーは、チェーン内の次の.catch()（またはthenの第2引数）で捕捉されます。.catch()がない場合はUnhandled Promise Rejectionとなります。.catch()の後に.then()があれば、エラー処理後に正常フローに戻ります。',
1, 283, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 283), 'Promiseチェーン全体が即座に停止し、エラーが外部にスローされる', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 283), 'チェーン内の次の.catch()で捕捉され、その後のチェーンは正常に続行できる', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 283), 'エラーは無視され、次の.then()にundefinedが渡される', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 283), '最初の.then()に自動的にリトライされる', false, 4);

-- JavaScript Q8 (medium) — async/await
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのasync/awaitにおいて、複数の非同期処理を並列実行するための正しい方法はどれですか？',
'multiple_choice', 'medium', 'javascript', 'concept',
'複数のawaitを順次書くと直列実行になります。並列実行にはPromise.allを使い、すべてのPromiseを同時に開始してから結果をまとめて待ちます。Promise.allSettledを使えば、一部が失敗しても全結果を取得できます。',
1, 284, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 284), 'await a(); await b(); と連続して書けば自動的に並列実行される', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 284), 'Promise.allで複数のPromiseをまとめて待つ', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 284), 'async関数内の処理は常に並列実行される', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 284), 'Web Workerを使わない限り並列実行は不可能である', false, 4);

-- JavaScript Q9 (medium) — WeakMap/WeakSet
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのWeakMapがMapと異なる重要な特徴はどれですか？',
'multiple_choice', 'medium', 'javascript', 'concept',
'WeakMapのキーはオブジェクトのみで、キーへの参照が弱参照です。キーとなるオブジェクトへの他の参照がなくなるとガベージコレクションの対象になります。このため列挙不可で、size プロパティもありません。メモリリーク防止に有効です。',
1, 285, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 285), 'WeakMapはMapより高速にアクセスできる', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 285), 'キーがオブジェクトのみで弱参照のため、参照がなくなるとGCの対象になる', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 285), 'WeakMapは不変（immutable）でエントリの追加・削除ができない', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 285), 'WeakMapはプリミティブ型のキーのみサポートする', false, 4);

-- JavaScript Q10 (hard) — Symbol
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのSymbolの特徴として正しいものはどれですか？',
'multiple_choice', 'hard', 'javascript', 'concept',
'Symbolは一意かつ不変のプリミティブ値で、プロパティキーの衝突を防ぎます。Symbol.for()でグローバルレジストリを使えば共有可能です。for...inやObject.keys()では列挙されず、Object.getOwnPropertySymbols()で取得できます。',
1, 286, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 286), 'Symbol()は同じ引数で呼び出すと同一のSymbolを返す', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 286), '一意なプリミティブ値で、for...inやObject.keys()では列挙されない', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 286), 'Symbolはオブジェクト型であり、プロパティを持つことができる', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 286), 'SymbolはJSON.stringify()で正しくシリアライズされる', false, 4);

-- JavaScript Q11 (hard) — Proxy/Reflect
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのProxyオブジェクトの使用例として最も適切なものはどれですか？',
'multiple_choice', 'hard', 'javascript', 'concept',
'Proxyはオブジェクトの基本操作（プロパティアクセス、代入、関数呼び出し等）をインターセプトできるメタプログラミング機能です。バリデーション、ログ記録、アクセス制御、リアクティブシステムの実装などに活用されます。',
1, 287, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 287), '非同期処理のエラーハンドリングを自動化する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 287), 'オブジェクトのプロパティアクセスをインターセプトしてバリデーションやログ記録を行う', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 287), 'WebSocketを使ったリアルタイム通信を実装する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 287), 'DOMの仮想化とバッチ更新を行う', false, 4);

-- JavaScript Q12 (hard) — Generator Functions
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'JavaScriptのジェネレータ関数（function*）の特徴として正しいものはどれですか？',
'multiple_choice', 'hard', 'javascript', 'concept',
'ジェネレータ関数はyieldキーワードで実行を一時停止し、next()の呼び出しで再開できます。イテレータプロトコルに準拠しており、for...ofで反復可能です。遅延評価により無限シーケンスの表現も可能です。',
1, 288, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 288), '呼び出すと即座に最後まで実行され、すべてのyield値を配列で返す', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 288), 'yieldで実行を一時停止し、next()で再開でき、遅延評価が可能である', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 288), 'async/awaitの内部実装であり、直接使用することは推奨されない', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 288), '並列実行のためのマルチスレッド機能である', false, 4);


-- ============================================================
-- 5. React (question_category = 'react') — sort_order 289–300
-- ============================================================

-- React Q1 (easy) — Virtual DOM Reconciliation
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Reactの仮想DOM（Virtual DOM）が実際のDOM更新を効率化する仕組みとして正しいものはどれですか？',
'multiple_choice', 'easy', 'react', 'concept',
'Reactは状態変更時に新しい仮想DOMツリーを作成し、前回の仮想DOMと比較（diff）します。差分のみを実際のDOMに反映するため、直接DOM操作するより効率的です。このプロセスをReconciliation（差分検出）と呼びます。',
1, 289, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 289), '実際のDOMを直接操作して最小限の変更を行う', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 289), '前後の仮想DOMツリーを比較し、差分のみを実際のDOMに反映する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 289), '仮想DOMをWeb Workerで処理してメインスレッドの負荷を軽減する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 289), 'DOMの更新をバッファリングして、一定間隔でまとめて反映する', false, 4);

-- React Q2 (easy) — Error Boundaries
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ReactのError Boundaryが捕捉できるエラーの範囲として正しいものはどれですか？',
'multiple_choice', 'easy', 'react', 'concept',
'Error Boundaryはレンダリング中、ライフサイクルメソッド中、子コンポーネントのコンストラクタ内で発生したエラーを捕捉します。イベントハンドラ内のエラーや非同期処理のエラーは捕捉できません。',
1, 290, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 290), 'アプリケーション内のすべてのJavaScriptエラーを捕捉する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 290), 'レンダリング中と子コンポーネントのライフサイクル内のエラーを捕捉する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 290), 'イベントハンドラ内のエラーのみを捕捉する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 290), 'ネットワークリクエストのエラーのみを捕捉する', false, 4);

-- React Q3 (easy) — Controlled vs Uncontrolled Components
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Reactにおける制御コンポーネント（Controlled Component）の特徴として正しいものはどれですか？',
'multiple_choice', 'easy', 'react', 'concept',
'制御コンポーネントでは、フォーム要素の値がReactのstateによって管理されます。ユーザーの入力はイベントハンドラを通じてstateを更新し、stateの値がvalue propとして要素に反映されます。Single Source of Truthの原則に従います。',
1, 291, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 291), 'フォーム要素の値がDOM自体によって管理される', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 291), 'refを使ってDOMから直接値を取得する', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 291), 'フォーム要素の値がReactのstateで管理され、value propで反映される', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 291), 'コンポーネントの外部から値を変更できないようにする仕組みである', false, 4);

-- React Q4 (easy) — Portal Concept
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ReactのPortalを使う主な目的はどれですか？',
'multiple_choice', 'easy', 'react', 'concept',
'Portalは子コンポーネントを親のDOM階層の外にあるDOMノードにレンダリングする機能です。モーダル、ツールチップ、ドロップダウンなど、CSSのoverflowやz-indexの制約を超えて表示する必要がある場合に使用します。イベントのバブリングはReactツリーに従います。',
1, 292, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 292), 'コンポーネント間でstateを共有するため', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 292), '親のDOM階層の外にあるDOMノードに子をレンダリングするため', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 292), 'サーバーサイドレンダリングを実現するため', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 292), 'コンポーネントの遅延ロードを行うため', false, 4);

-- React Q5 (medium) — React Fiber Architecture
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'React Fiberアーキテクチャが従来のReconcilierに対して改善した点として正しいものはどれですか？',
'multiple_choice', 'medium', 'react', 'concept',
'React Fiberは差分検出処理を小さな単位（fiber）に分割し、中断・再開可能にしました。これにより重い更新処理でもメインスレッドをブロックせず、ユーザー操作に対する応答性を維持できます。優先度ベースのスケジューリングも可能になりました。',
1, 293, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 293), '仮想DOMを廃止し、直接DOM操作に変更した', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 293), 'レンダリング処理を分割して中断・再開可能にし、優先度ベースのスケジューリングを実現した', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 293), 'Web Workerでレンダリングを並列実行するようにした', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 293), 'コンパイル時にReactコードをネイティブコードに変換するようにした', false, 4);

-- React Q6 (medium) — Concurrent Mode
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ReactのConcurrent Modeにおけるトランジション（useTransition）の目的として正しいものはどれですか？',
'multiple_choice', 'medium', 'react', 'concept',
'useTransitionは優先度の低いstate更新を「トランジション」としてマークし、優先度の高い更新（ユーザー入力など）に割り込まれることを許可します。これにより重い再レンダリングが発生してもUIの応答性を維持できます。',
1, 294, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 294), 'CSSアニメーションをReactで管理するための機能である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 294), '低優先度の更新をマークし、高優先度の更新による割り込みを許可してUIの応答性を維持する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 294), 'ページ間遷移のプリフェッチとキャッシュを行う機能である', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 294), 'コンポーネントのマウント・アンマウント時のアニメーションを定義する機能である', false, 4);

-- React Q7 (medium) — Suspense for Data Fetching
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ReactのSuspenseコンポーネントの役割として正しいものはどれですか？',
'multiple_choice', 'medium', 'react', 'concept',
'Suspenseは子コンポーネントが非同期処理（データ取得やコード読み込み）の完了を待っている間、fallbackとして指定したUIを表示します。React.lazyによるコード分割やデータフェッチライブラリと組み合わせて宣言的にローディング状態を管理できます。',
1, 295, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 295), 'エラー発生時のフォールバックUIを表示する', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 295), '非同期処理の完了を待つ間、宣言的にフォールバックUIを表示する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 295), 'コンポーネントのレンダリングを一定時間遅延させる', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 295), 'パフォーマンスの測定とプロファイリングを行う', false, 4);

-- React Q8 (medium) — Strict Mode Behavior
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'ReactのStrictModeが開発環境で行う動作として正しいものはどれですか？',
'multiple_choice', 'medium', 'react', 'concept',
'StrictModeは開発環境でコンポーネントを2回レンダリングし、レンダリングの副作用を検出します。また、非推奨のライフサイクルメソッドの使用を警告し、レガシーなAPIの使用を検知します。本番環境には影響しません。',
1, 296, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 296), 'TypeScriptの型チェックをより厳密に行う', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 296), 'コンポーネントを2回レンダリングして副作用を検出し、非推奨APIの使用を警告する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 296), 'レンダリングパフォーマンスを計測してコンソールに表示する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 296), '本番環境でもバンドルサイズを最適化する', false, 4);

-- React Q9 (medium) — Synthetic Events
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Reactの合成イベント（SyntheticEvent）がネイティブDOMイベントと異なる点として正しいものはどれですか？',
'multiple_choice', 'medium', 'react', 'concept',
'ReactのSyntheticEventはブラウザ間のイベントの差異を吸収するラッパーです。すべてのイベントはルートに委譲（イベントデリゲーション）され、パフォーマンスが向上します。イベントオブジェクトはプールされて再利用される場合があります。',
1, 297, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 297), 'ネイティブイベントより多くのイベントタイプをサポートする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 297), 'ブラウザ間の差異を吸収し、イベントデリゲーションで効率的に処理する', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 297), 'イベントバブリングが無効化されている', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 297), '非同期にイベントを処理してメインスレッドをブロックしない', false, 4);

-- React Q10 (hard) — Server Components vs Client Components
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'React Server Components（RSC）の特徴として正しいものはどれですか？',
'multiple_choice', 'hard', 'react', 'concept',
'Server ComponentsはサーバーでのみレンダリングされJavaScriptバンドルに含まれません。直接データベースやファイルシステムにアクセスでき、useState/useEffectは使用できません。クライアントへのJavaScriptを削減しつつ、動的なUIを構築できます。',
1, 298, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 298), 'サーバーでレンダリング後、クライアントでもハイドレーションされる', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 298), 'サーバーでのみレンダリングされ、JSバンドルに含まれず、useState等のフックは使用できない', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 298), 'SSRの改良版で、すべてのコンポーネントをサーバーで実行する', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 298), 'Client Componentsの子としてのみ使用できる', false, 4);

-- React Q11 (hard) — Hydration
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Reactのハイドレーション（hydration）において、サーバーレンダリングのHTMLとクライアント側のレンダリング結果が一致しない場合の動作として正しいものはどれですか？',
'multiple_choice', 'hard', 'react', 'concept',
'ハイドレーション時にサーバーとクライアントのレンダリング結果が一致しない場合（hydration mismatch）、Reactは開発環境で警告を出します。React 18では不一致部分をクライアント側のレンダリング結果で置き換えますが、これはパフォーマンスの低下とUIのちらつきを引き起こす可能性があります。',
1, 299, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 299), 'エラーをスローしてアプリケーションがクラッシュする', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 299), 'サーバー側のHTMLをそのまま維持し、クライアント側の変更を無視する', false, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 299), '警告を出し、不一致部分をクライアント側の結果で置き換えるが、パフォーマンスが低下する', true, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 299), '自動的にページ全体を再レンダリングしてSSRを再実行する', false, 4);

-- React Q12 (hard) — Render Props vs HOC
INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
'Reactにおいて、Render PropsパターンがHOC（Higher-Order Component）パターンに比べて優れている点はどれですか？',
'multiple_choice', 'hard', 'react', 'concept',
'Render Propsはpropsの出所が明確で名前衝突のリスクが低く、コンポーネントツリーが読みやすいです。HOCは複数適用すると「ラッパー地獄」になりやすく、propsの透過性やデバッグ時の追跡が困難になります。ただし現在はカスタムフックが両者の代替として主流です。',
1, 300, true);

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 300), '実行速度がHOCより常に高速である', false, 1),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 300), 'propsの出所が明確で名前衝突のリスクが低く、コンポーネント構造が読みやすい', true, 2),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 300), 'TypeScriptとの互換性がHOCより高い', false, 3),
  (gen_random_uuid(), (SELECT id FROM quiz_questions WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order = 300), 'Server Componentsで使用可能だが、HOCは使用できない', false, 4);
