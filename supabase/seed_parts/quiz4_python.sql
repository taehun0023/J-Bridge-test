-- Python concept + code_reading questions for dev assessment quiz
-- 30 questions: concept 15 (331-345) + code_reading 15 (346-360)
-- question_category = 'python'
-- For understanding test only (not included in comprehensive exam)

-- ===== CONCEPT (15): easy 5, medium 7, hard 3 =====

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのデータ型のうち、変更不可（イミュータブル）なものはどれですか？',
    'multiple_choice', 'easy', 'python', 'concept',
    'tupleはイミュータブル（変更不可）で、list, dict, setはミュータブル（変更可能）です。', 1, 331, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'list', false, 1),
    (gen_random_uuid(), q_id, 'tuple', true, 2),
    (gen_random_uuid(), q_id, 'dict', false, 3),
    (gen_random_uuid(), q_id, 'set', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのf-stringの使い方として正しいものはどれですか？',
    'multiple_choice', 'easy', 'python', 'concept',
    'f-stringはf"..."の形式で、波括弧{}内に式を直接書けるフォーマット文字列です。', 1, 332, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'f"名前は{name}です"', true, 1),
    (gen_random_uuid(), q_id, 'f("名前は" + name + "です")', false, 2),
    (gen_random_uuid(), q_id, 'format("名前は%sです", name)', false, 3),
    (gen_random_uuid(), q_id, 'f[名前は{name}です]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのwith文が主に使われる場面として最も適切なものはどれですか？',
    'multiple_choice', 'easy', 'python', 'concept',
    'with文はコンテキストマネージャを利用してリソースの確実な開放を保証します。ファイル操作が代表的な例です。', 1, 333, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ループの条件指定', false, 1),
    (gen_random_uuid(), q_id, 'ファイルやDB接続などリソースの自動開放', true, 2),
    (gen_random_uuid(), q_id, '例外の種類を判別する', false, 3),
    (gen_random_uuid(), q_id, '関数の引数にデフォルト値を設定する', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonで仮想環境（venv）を使用する主な理由はどれですか？',
    'multiple_choice', 'easy', 'python', 'concept',
    '仮想環境はプロジェクトごとにパッケージの依存関係を分離するために使用します。', 1, 334, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Pythonの実行速度を向上させるため', false, 1),
    (gen_random_uuid(), q_id, 'プロジェクトごとにパッケージの依存関係を分離するため', true, 2),
    (gen_random_uuid(), q_id, 'コードのセキュリティを強化するため', false, 3),
    (gen_random_uuid(), q_id, '複数のPythonファイルを同時に実行するため', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonの*argsと**kwargsの違いとして正しいものはどれですか？',
    'multiple_choice', 'easy', 'python', 'concept',
    '*argsは位置引数をタプルとして受け取り、**kwargsはキーワード引数を辞書として受け取ります。', 1, 335, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '*argsはリスト、**kwargsはセットを受け取る', false, 1),
    (gen_random_uuid(), q_id, '*argsは位置引数をタプルで、**kwargsはキーワード引数を辞書で受け取る', true, 2),
    (gen_random_uuid(), q_id, '*argsは必須引数、**kwargsはオプション引数を意味する', false, 3),
    (gen_random_uuid(), q_id, '*argsは数値のみ、**kwargsは文字列のみ受け取る', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのリスト内包表記の利点として正しいものはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'リスト内包表記はforループとappendを使うより簡潔で、一般的に高速に動作します。', 1, 336, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリ使用量がゼロになる', false, 1),
    (gen_random_uuid(), q_id, 'forループより簡潔に書け、一般的に高速に動作する', true, 2),
    (gen_random_uuid(), q_id, '無限リストを扱える', false, 3),
    (gen_random_uuid(), q_id, '型安全性が保証される', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのジェネレータとリストの最も大きな違いはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'ジェネレータは値を遅延評価（lazy evaluation）し、一度に全要素をメモリに保持しません。', 1, 337, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ジェネレータはソート済みのデータのみ扱える', false, 1),
    (gen_random_uuid(), q_id, 'ジェネレータは値を遅延評価し全要素を一度にメモリに保持しない', true, 2),
    (gen_random_uuid(), q_id, 'ジェネレータはリストより常に高速に動作する', false, 3),
    (gen_random_uuid(), q_id, 'ジェネレータはインデックスでアクセスできる', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのデコレータの役割として正しいものはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'デコレータは既存の関数やクラスの振る舞いを変更せずに機能を追加する仕組みです。', 1, 338, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数の戻り値の型を固定する', false, 1),
    (gen_random_uuid(), q_id, '既存の関数の振る舞いを変更せず機能を追加する', true, 2),
    (gen_random_uuid(), q_id, '関数をプライベートにする', false, 3),
    (gen_random_uuid(), q_id, '関数の実行を非同期にする', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのtry/except/finally文において、finallyブロックが実行されるタイミングはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'finallyブロックは例外の有無に関わらず、try/exceptの後に必ず実行されます。', 1, 339, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '例外が発生した場合のみ実行される', false, 1),
    (gen_random_uuid(), q_id, '例外の有無に関わらず必ず実行される', true, 2),
    (gen_random_uuid(), q_id, '例外が発生しなかった場合のみ実行される', false, 3),
    (gen_random_uuid(), q_id, 'except内でreturnした場合は実行されない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのtype hintsについて正しい説明はどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'type hintsは型を明示するアノテーションで、実行時には強制されませんが可読性とツールの支援に役立ちます。', 1, 340, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行時に型チェックが行われ型不一致でエラーになる', false, 1),
    (gen_random_uuid(), q_id, '実行時に強制されないが可読性とツール支援に役立つ', true, 2),
    (gen_random_uuid(), q_id, 'Python 2系でのみ使用可能', false, 3),
    (gen_random_uuid(), q_id, 'クラスには使えず関数のみに適用可能', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのlambda式の特徴として正しいものはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'lambda式は無名関数を一行で定義でき、単一の式のみを含むことができます。', 1, 341, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '複数行の処理を書くことができる', false, 1),
    (gen_random_uuid(), q_id, '無名関数を一行で定義でき単一の式のみ含む', true, 2),
    (gen_random_uuid(), q_id, 'defで定義した関数より常に高速', false, 3),
    (gen_random_uuid(), q_id, '引数を取ることができない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのモジュールとパッケージの違いとして正しいものはどれですか？',
    'multiple_choice', 'medium', 'python', 'concept',
    'モジュールは単一の.pyファイル、パッケージは__init__.pyを含むディレクトリです。', 1, 342, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'モジュールはクラス、パッケージは関数の集合', false, 1),
    (gen_random_uuid(), q_id, 'モジュールは単一の.pyファイル、パッケージは__init__.pyを含むディレクトリ', true, 2),
    (gen_random_uuid(), q_id, 'モジュールはpipでインストールしたもの、パッケージは自作のもの', false, 3),
    (gen_random_uuid(), q_id, 'モジュールとパッケージは同じ意味', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'PythonのGIL（Global Interpreter Lock）の影響として正しいものはどれですか？',
    'multiple_choice', 'hard', 'python', 'concept',
    'GILにより、CPython ではマルチスレッドでもCPUバウンドな処理は並列実行されません。I/Oバウンドには影響が少ないです。', 1, 343, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マルチプロセスが使えなくなる', false, 1),
    (gen_random_uuid(), q_id, 'CPUバウンドなマルチスレッド処理が並列実行されない', true, 2),
    (gen_random_uuid(), q_id, 'I/O処理が全てブロッキングになる', false, 3),
    (gen_random_uuid(), q_id, 'asyncioが使用できなくなる', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのダックタイピングの概念として正しいものはどれですか？',
    'multiple_choice', 'hard', 'python', 'concept',
    'ダックタイピングでは、オブジェクトの型ではなく、そのオブジェクトが持つメソッドや属性で判断します。', 1, 344, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変数宣言時に型を指定する方式', false, 1),
    (gen_random_uuid(), q_id, 'オブジェクトの型ではなく持つメソッドや属性で判断する方式', true, 2),
    (gen_random_uuid(), q_id, '動的に型を変換する機能', false, 3),
    (gen_random_uuid(), q_id, 'クラスの多重継承を可能にする仕組み', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    'Pythonのクラスにおけるメソッド解決順序（MRO）はどのアルゴリズムに基づいていますか？',
    'multiple_choice', 'hard', 'python', 'concept',
    'Python 3ではC3線形化アルゴリズムを使用してMROを決定します。', 1, 345, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '深さ優先探索（DFS）', false, 1),
    (gen_random_uuid(), q_id, 'C3線形化アルゴリズム', true, 2),
    (gen_random_uuid(), q_id, '幅優先探索（BFS）', false, 3),
    (gen_random_uuid(), q_id, 'ダイクストラ法', false, 4);
END $$;

-- ===== CODE READING (15): easy 4, medium 8, hard 3 =====

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nnums = [1, 2, 3, 4, 5]\nprint(nums[1:4])',
    'multiple_choice', 'easy', 'python', 'code_reading',
    'スライス[1:4]はインデックス1から3まで（4は含まない）の要素を取得します。', 1, 346, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, 2, 3, 4]', false, 1),
    (gen_random_uuid(), q_id, '[2, 3, 4]', true, 2),
    (gen_random_uuid(), q_id, '[2, 3, 4, 5]', false, 3),
    (gen_random_uuid(), q_id, '[1, 2, 3]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nd = {"a": 1, "b": 2}\nd["c"] = 3\nprint(len(d))',
    'multiple_choice', 'easy', 'python', 'code_reading',
    '辞書に新しいキー"c"を追加すると要素数は3になります。', 1, 347, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2', false, 1),
    (gen_random_uuid(), q_id, '3', true, 2),
    (gen_random_uuid(), q_id, 'KeyError', false, 3),
    (gen_random_uuid(), q_id, '6', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nfor i, v in enumerate(["a", "b", "c"]):\n    print(i, v)',
    'multiple_choice', 'easy', 'python', 'code_reading',
    'enumerateはインデックスと値のペアを返します。デフォルトのインデックスは0から始まります。', 1, 348, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1 a / 2 b / 3 c', false, 1),
    (gen_random_uuid(), q_id, '0 a / 1 b / 2 c', true, 2),
    (gen_random_uuid(), q_id, 'a 0 / b 1 / c 2', false, 3),
    (gen_random_uuid(), q_id, '(0, a) / (1, b) / (2, c)', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nresult = [x**2 for x in range(5) if x % 2 == 0]\nprint(result)',
    'multiple_choice', 'easy', 'python', 'code_reading',
    'range(5)は0~4。偶数(0,2,4)の2乗は0,4,16です。', 1, 349, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[0, 1, 4, 9, 16]', false, 1),
    (gen_random_uuid(), q_id, '[0, 4, 16]', true, 2),
    (gen_random_uuid(), q_id, '[1, 9, 25]', false, 3),
    (gen_random_uuid(), q_id, '[4, 16]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ntext = "Hello World"\nprint(text.lower().split())',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'lower()で小文字化し、split()でスペースで分割します。', 1, 350, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '["Hello", "World"]', false, 1),
    (gen_random_uuid(), q_id, '["hello", "world"]', true, 2),
    (gen_random_uuid(), q_id, '"hello world"', false, 3),
    (gen_random_uuid(), q_id, '["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ntry:\n    x = 1 / 0\nexcept ZeroDivisionError:\n    print("A")\nfinally:\n    print("B")',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'ZeroDivisionErrorが捕捉され"A"が出力され、finallyは必ず実行されるため"B"も出力されます。', 1, 351, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A のみ', false, 1),
    (gen_random_uuid(), q_id, 'A と B', true, 2),
    (gen_random_uuid(), q_id, 'B のみ', false, 3),
    (gen_random_uuid(), q_id, 'エラーが発生して何も出力されない', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nclass Dog:\n    def __init__(self, name):\n        self.name = name\n    def speak(self):\n        return f"{self.name}: ワン!"\n\nd = Dog("ポチ")\nprint(d.speak())',
    'multiple_choice', 'medium', 'python', 'code_reading',
    '__init__でnameが"ポチ"に設定され、speakメソッドでf-stringにより"ポチ: ワン!"が返されます。', 1, 352, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Dog: ワン!', false, 1),
    (gen_random_uuid(), q_id, 'ポチ: ワン!', true, 2),
    (gen_random_uuid(), q_id, 'ワン!', false, 3),
    (gen_random_uuid(), q_id, 'AttributeError', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ndef gen():\n    yield 1\n    yield 2\n    yield 3\n\ng = gen()\nprint(next(g))\nprint(next(g))',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'ジェネレータは呼び出すたびにyieldの位置から再開します。最初のnext()で1、次で2が返されます。', 1, 353, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1 と 1', false, 1),
    (gen_random_uuid(), q_id, '1 と 2', true, 2),
    (gen_random_uuid(), q_id, '1 と 3', false, 3),
    (gen_random_uuid(), q_id, '[1, 2, 3] と [1, 2, 3]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nresult = list(map(lambda x: x * 2, [1, 2, 3]))\nprint(result)',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'mapは各要素にlambda関数を適用します。各要素が2倍されます。', 1, 354, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[1, 2, 3, 1, 2, 3]', false, 1),
    (gen_random_uuid(), q_id, '[2, 4, 6]', true, 2),
    (gen_random_uuid(), q_id, '[1, 4, 9]', false, 3),
    (gen_random_uuid(), q_id, '[[1, 1], [2, 2], [3, 3]]', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ndef greet(*names):\n    return len(names)\n\nprint(greet("太郎", "花子", "次郎"))',
    'multiple_choice', 'medium', 'python', 'code_reading',
    '*namesは可変長引数をタプルとして受け取ります。3つの引数が渡されるのでlen()は3です。', 1, 355, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', false, 1),
    (gen_random_uuid(), q_id, '3', true, 2),
    (gen_random_uuid(), q_id, '("太郎", "花子", "次郎")', false, 3),
    (gen_random_uuid(), q_id, 'TypeError', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nd = {k: v for k, v in zip("abc", [1, 2, 3])}\nprint(d)',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'zipで文字とリストをペアにし、辞書内包表記で辞書を生成します。', 1, 356, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{1: "a", 2: "b", 3: "c"}', false, 1),
    (gen_random_uuid(), q_id, '{"a": 1, "b": 2, "c": 3}', true, 2),
    (gen_random_uuid(), q_id, '[("a", 1), ("b", 2), ("c", 3)]', false, 3),
    (gen_random_uuid(), q_id, '{"abc": [1, 2, 3]}', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\nresult = list(zip([1, 2, 3], ["a", "b"]))\nprint(result)',
    'multiple_choice', 'medium', 'python', 'code_reading',
    'zipは短い方のイテラブルに合わせて終了します。3番目の要素はペアにならず無視されます。', 1, 357, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '[(1, "a"), (2, "b"), (3, None)]', false, 1),
    (gen_random_uuid(), q_id, '[(1, "a"), (2, "b")]', true, 2),
    (gen_random_uuid(), q_id, '[(1, "a"), (2, "b"), (3, "")]', false, 3),
    (gen_random_uuid(), q_id, 'ValueError', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ndef make_counter():\n    count = 0\n    def increment():\n        nonlocal count\n        count += 1\n        return count\n    return increment\n\nc = make_counter()\nprint(c(), c(), c())',
    'multiple_choice', 'hard', 'python', 'code_reading',
    'クロージャでnonlocal変数を使い、呼び出すたびにcountが増加します。', 1, 358, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0 0 0', false, 1),
    (gen_random_uuid(), q_id, '1 2 3', true, 2),
    (gen_random_uuid(), q_id, '1 1 1', false, 3),
    (gen_random_uuid(), q_id, 'UnboundLocalError', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ndef decorator(func):\n    def wrapper(*args):\n        print("before")\n        result = func(*args)\n        print("after")\n        return result\n    return wrapper\n\n@decorator\ndef add(a, b):\n    print("adding")\n    return a + b\n\nprint(add(1, 2))',
    'multiple_choice', 'hard', 'python', 'code_reading',
    'デコレータによりwrapperが先に実行され、before → adding → after → 3の順に出力されます。', 1, 359, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'adding / 3', false, 1),
    (gen_random_uuid(), q_id, 'before / adding / after / 3', true, 2),
    (gen_random_uuid(), q_id, 'before / after / adding / 3', false, 3),
    (gen_random_uuid(), q_id, '3 / before / adding / after', false, 4);
END $$;

DO $$ DECLARE q_id UUID;
BEGIN
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (gen_random_uuid(), 'a0000004-0000-0000-0000-000000000004',
    E'以下のPythonコードの出力はどれですか？\n\ndef factorial(n):\n    if n <= 1:\n        return 1\n    return n * factorial(n - 1)\n\nprint(factorial(5))',
    'multiple_choice', 'hard', 'python', 'code_reading',
    '5! = 5 × 4 × 3 × 2 × 1 = 120 です。', 1, 360, true)
  RETURNING id INTO q_id;
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '25', false, 1),
    (gen_random_uuid(), q_id, '120', true, 2),
    (gen_random_uuid(), q_id, '60', false, 3),
    (gen_random_uuid(), q_id, 'RecursionError', false, 4);
END $$;
