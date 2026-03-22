-- ============================================================
-- Dev Practice Quiz: Python 理解度テスト問題 (15 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000008
-- 3 topic areas × 5 questions each
-- Difficulty: easy 5, medium 7, hard 3 (33/47/20 ratio)
-- ============================================================

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000008', 'Python 理解度テスト問題', 'core_programming', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: 基礎とスクリプト指向 (DEV-PY-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): if __name__の意味
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'Pythonで if __name__ == "__main__": の意味として正しいものはどれですか？',
  'multiple_choice', 'easy', 'python', 'concept',
  'Pythonファイルが直接実行された場合、__name__変数は"__main__"になります。他のファイルからimportされた場合はモジュール名が入ります。この条件文により、直接実行時のみ特定のコードを実行し、ライブラリとしてインポートされた時は実行しないようにできます。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ファイルが直接実行された場合のみ、このブロックのコードを実行する', true, 1),
    (gen_random_uuid(), q_id, 'mainという名前の関数が定義されている場合に実行する', false, 2),
    (gen_random_uuid(), q_id, 'ファイルの先頭で必ず実行される初期化コード', false, 3),
    (gen_random_uuid(), q_id, 'テスト実行時のみ有効になる条件文', false, 4);

  -- T1-Q2 (easy): ミュータブルとイミュータブル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'Pythonでイミュータブル（変更不可）な型はどれですか？',
  'multiple_choice', 'easy', 'python', 'concept',
  'tupleはイミュータブル（変更不可）な型です。一度作成すると要素の追加・変更・削除ができません。listは変更可能、dictは変更可能、setも変更可能です。strもイミュータブルですが、選択肢の中ではtupleが該当します。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'tuple', true, 1),
    (gen_random_uuid(), q_id, 'list', false, 2),
    (gen_random_uuid(), q_id, 'dict', false, 3),
    (gen_random_uuid(), q_id, 'set', false, 4);

  -- T1-Q3 (medium): ミュータブルデフォルト引数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  '次のコードでadd_item("b")を呼んだ場合の戻り値はどれですか？
def add_item(item, items=[]):
    items.append(item)
    return items

add_item("a")
result = add_item("b")',
  'multiple_choice', 'medium', 'python', 'concept',
  'Pythonではデフォルト引数のリストは関数定義時に1度だけ生成され、呼び出しごとに共有されます。1回目のadd_item("a")でitemsに["a"]が入り、2回目のadd_item("b")では同じリストに追加されるため["a", "b"]になります。正しくはdefault=Noneとし、関数内でnew listを作成します。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '["a", "b"]（デフォルト引数のリストが共有される）', true, 1),
    (gen_random_uuid(), q_id, '["b"]（毎回新しいリストが作られる）', false, 2),
    (gen_random_uuid(), q_id, 'TypeError（引数が足りない）', false, 3),
    (gen_random_uuid(), q_id, '["a"]（最初の呼び出しの結果のみ）', false, 4);

  -- T1-Q4 (medium): strのイミュータブル性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  '次のコードの実行後、sの値はどれですか？
s = "hello"
s.upper()
print(s)',
  'multiple_choice', 'medium', 'python', 'concept',
  'Pythonの文字列はイミュータブルです。upper()メソッドは新しい文字列を返しますが、元の文字列sは変更しません。結果を使用するにはs = s.upper()のように再代入する必要があります。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'hello（元の文字列は変更されない）', true, 1),
    (gen_random_uuid(), q_id, 'HELLO（upper()で変更される）', false, 2),
    (gen_random_uuid(), q_id, 'TypeError（文字列は変更不可）', false, 3),
    (gen_random_uuid(), q_id, 'None', false, 4);

  -- T1-Q5 (hard): 関数への引数渡し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  '次のコードの実行後、dataの値はどれですか？
def modify(items):
    items.append("new")

data = ["a", "b"]
modify(data)',
  'multiple_choice', 'hard', 'python', 'concept',
  'Pythonではリストはミュータブルオブジェクトであり、関数に渡すと参照が共有されます。関数内でappendすると、元のリストが直接変更されます。イミュータブルな型（str, int, tuple）の場合は関数内で変更しても元の変数に影響しません。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '["a", "b", "new"]（リストは参照が共有されるため元のデータが変更される）', true, 1),
    (gen_random_uuid(), q_id, '["a", "b"]（関数内の変更は元のデータに影響しない）', false, 2),
    (gen_random_uuid(), q_id, 'TypeError（リストは関数に渡せない）', false, 3),
    (gen_random_uuid(), q_id, '["new"]（元のデータが置き換えられる）', false, 4);

  -- ============================================================
  -- Topic 2: データ処理パターンと標準ライブラリ (DEV-PY-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): リスト内包表記
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  '次のリスト内包表記の結果はどれですか？ [x * 2 for x in range(4)]',
  'multiple_choice', 'easy', 'python', 'concept',
  'リスト内包表記は[式 for 変数 in イテラブル]の形式です。range(4)は0, 1, 2, 3を生成し、各値を2倍した結果がリストになります。forループより簡潔に記述でき、Pythonらしい書き方です。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[0, 2, 4, 6]', true, 1),
    (gen_random_uuid(), q_id, '[2, 4, 6, 8]', false, 2),
    (gen_random_uuid(), q_id, '[0, 1, 2, 3]', false, 3),
    (gen_random_uuid(), q_id, '[1, 2, 3, 4]', false, 4);

  -- T2-Q2 (medium): dict.getとKeyError
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'Pythonでdict[key]の代わりにdict.get(key, default)を使用する利点はどれですか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'dict[key]はキーが存在しない場合にKeyErrorを発生させますが、dict.get(key, default)はデフォルト値を返します。存在しないキーへのアクセスが想定される場合に安全にデータを取得できます。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キーが存在しない場合にKeyErrorではなくデフォルト値を返す', true, 1),
    (gen_random_uuid(), q_id, '辞書の検索速度が向上する', false, 2),
    (gen_random_uuid(), q_id, '辞書にキーが自動的に追加される', false, 3),
    (gen_random_uuid(), q_id, '戻り値の型がOptionalになる', false, 4);

  -- T2-Q3 (medium): ジェネレータの特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'ジェネレータ式（丸括弧で作成）の特徴として正しいものはどれですか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'ジェネレータ式は遅延評価で要素を1つずつ生成します。大量のデータを扱う場合にメモリ効率が良いですが、一度しかイテレートできない（使い切り）という制約があります。2回目のイテレーションでは空になります。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '遅延評価でメモリ効率が良いが、一度しかイテレートできない', true, 1),
    (gen_random_uuid(), q_id, 'リストと同じで何度でもイテレートできる', false, 2),
    (gen_random_uuid(), q_id, '要素の追加・削除が可能', false, 3),
    (gen_random_uuid(), q_id, 'インデックスでランダムアクセスが可能', false, 4);

  -- T2-Q4 (hard): groupbyの注意点
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'itertools.groupby()を使用する際に事前に必要な操作はどれですか？',
  'multiple_choice', 'hard', 'python', 'concept',
  'groupby()は連続する同一キーの要素のみをグループ化します。ソートされていないデータでは同じキーが離れた位置にあると別グループになってしまいます。正しくグループ化するには、事前にキーでソートする必要があります。',
  3, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'グループ化キーでデータをソートする', true, 1),
    (gen_random_uuid(), q_id, 'データをリストに変換する', false, 2),
    (gen_random_uuid(), q_id, 'キーをハッシュ可能な型に変換する', false, 3),
    (gen_random_uuid(), q_id, '特別な前処理は不要', false, 4);

  -- T2-Q5 (medium): defaultdict
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'collections.defaultdict(list)の動作として正しいものはどれですか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'defaultdict(list)は存在しないキーにアクセスした際に、自動的に空のリストを作成して返します。通常のdictではKeyErrorが発生しますが、defaultdictでは初期化を省略でき、グルーピング処理を簡潔に書けます。引数はcallable（呼び出し可能オブジェクト）である必要があります。',
  2, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '存在しないキーにアクセスすると自動的に空リストを作成する', true, 1),
    (gen_random_uuid(), q_id, '全てのキーの値をリストに変換する', false, 2),
    (gen_random_uuid(), q_id, 'キーをリスト型のみに制限する', false, 3),
    (gen_random_uuid(), q_id, '辞書の値をソートしてリストにする', false, 4);

  -- ============================================================
  -- Topic 3: ファイルI/O・エラー処理 (DEV-PY-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): with文の目的
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'Pythonのwith文でファイルを開く主な利点はどれですか？',
  'multiple_choice', 'easy', 'python', 'concept',
  'with文はコンテキストマネージャを使用してリソースの自動クリーンアップを保証します。例外が発生しても確実にファイルがクローズされます。with文を使わない場合、例外発生時にclose()が呼ばれずリソースリークが発生する可能性があります。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '例外発生時も確実にファイルがクローズされる', true, 1),
    (gen_random_uuid(), q_id, 'ファイルの読み込み速度が向上する', false, 2),
    (gen_random_uuid(), q_id, 'ファイルの暗号化が自動的に行われる', false, 3),
    (gen_random_uuid(), q_id, 'ファイルが存在しない場合に自動作成される', false, 4);

  -- T3-Q2 (medium): try/except/else/finally
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'try/except/else/finally構文において、elseブロックが実行される条件はどれですか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'elseブロックはtryブロックで例外が発生しなかった場合にのみ実行されます。例外が発生した場合はexceptに移行し、elseはスキップされます。finallyは例外の有無に関わらず常に実行されます。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'tryブロックで例外が発生しなかった場合のみ', true, 1),
    (gen_random_uuid(), q_id, 'exceptブロックの後に常に実行される', false, 2),
    (gen_random_uuid(), q_id, '例外が発生した場合のみ', false, 3),
    (gen_random_uuid(), q_id, 'finallyの前に必ず実行される', false, 4);

  -- T3-Q3 (medium): エンコーディング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'Pythonでファイルを読む際にencoding="utf-8"を明示すべき理由はどれですか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'PythonのデフォルトエンコーディングはOS依存です（WindowsはCP932、LinuxはUTF-8）。エンコーディングを明示しないと、異なるOS間でUnicodeDecodeErrorが発生する可能性があります。特にWindowsで作成したスクリプトをLinuxで実行する場合に問題になります。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'デフォルトエンコーディングがOS依存のため、異なる環境でエラーが発生する', true, 1),
    (gen_random_uuid(), q_id, 'ファイルの読み込み速度が向上する', false, 2),
    (gen_random_uuid(), q_id, 'ファイルのセキュリティが強化される', false, 3),
    (gen_random_uuid(), q_id, 'Python 2との互換性を保つため', false, 4);

  -- T3-Q4 (hard): 広すぎるexcept
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'except Exception: で全ての例外をキャッチすることの問題点はどれですか？',
  'multiple_choice', 'hard', 'python', 'concept',
  '広すぎるexceptは想定外のバグ（TypeError, AttributeError等）まで隠蔽してしまい、問題の発見が遅れます。デバッグが非常に困難になります。FileNotFoundError, PermissionErrorなど具体的な例外を指定してキャッチし、予期しない例外は上位に伝播させるべきです。',
  3, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '想定外のバグ（TypeError等）も隠蔽され、問題発見が遅れる', true, 1),
    (gen_random_uuid(), q_id, 'パフォーマンスが大幅に低下する', false, 2),
    (gen_random_uuid(), q_id, 'except Exceptionはシンタックスエラーになる', false, 3),
    (gen_random_uuid(), q_id, 'finallyブロックが実行されなくなる', false, 4);

  -- T3-Q5 (medium): finallyの実行保証
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000008',
  'try内にreturn文がある場合、finallyブロックはどうなりますか？',
  'multiple_choice', 'medium', 'python', 'concept',
  'finallyブロックはtry内にreturn文があっても実行されます。Pythonではreturn前にfinallyが実行され、リソースのクリーンアップが保証されます。これがwith文やfinally文がリソース管理に適している理由です。',
  2, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'return前にfinallyが実行される（クリーンアップ保証）', true, 1),
    (gen_random_uuid(), q_id, 'returnによりfinallyはスキップされる', false, 2),
    (gen_random_uuid(), q_id, 'returnとfinallyが同時に存在するとSyntaxError', false, 3),
    (gen_random_uuid(), q_id, 'return後にfinallyが実行される（順序が逆転する）', false, 4);

END $$;
