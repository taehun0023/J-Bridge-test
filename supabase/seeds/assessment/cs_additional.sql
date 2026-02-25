-- ============================================
-- J-Bridge CS Knowledge Additional Categories
-- 3 new categories: basic_theory, database, security
-- 90 questions total (30 each), sort_order 91-180
-- Quiz ID: a0000003-0000-0000-0000-000000000003
-- ============================================

-- ============================================
-- Category: basic_theory (sort_order 91-120)
-- easy: 6, medium: 12, hard: 12
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== basic_theory - EASY (6) =====

  -- Q91: 2進数の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '10進数の「10」を2進数に変換すると正しいものはどれか。', '10を2で繰り返し割ると、10→5余り0、5→2余り1、2→1余り0、1→0余り1となり、下から読むと1010です。', 1, 91, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1100', FALSE, 1),
    (gen_random_uuid(), q_id, '1010', TRUE, 2),
    (gen_random_uuid(), q_id, '1001', FALSE, 3),
    (gen_random_uuid(), q_id, '1110', FALSE, 4);

  -- Q92: 16進数の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '16進数の「FF」を10進数に変換すると正しいものはどれか。', 'F=15なので、FF = 15×16 + 15 = 240 + 15 = 255です。', 1, 92, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '255', TRUE, 1),
    (gen_random_uuid(), q_id, '256', FALSE, 2),
    (gen_random_uuid(), q_id, '200', FALSE, 3),
    (gen_random_uuid(), q_id, '155', FALSE, 4);

  -- Q93: 論理演算AND
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '論理演算において「1 AND 0」の結果はどれか。', 'AND演算は両方のビットが1の場合のみ1を返します。1 AND 0 = 0です。', 1, 93, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, '0', TRUE, 2),
    (gen_random_uuid(), q_id, '10', FALSE, 3),
    (gen_random_uuid(), q_id, '未定義', FALSE, 4);

  -- Q94: コンパイラとインタプリタ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'コンパイラの説明として正しいものはどれか。', 'コンパイラはソースコード全体を一括して機械語に変換するプログラムです。インタプリタは1行ずつ逐次実行します。', 1, 94, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソースコードを1行ずつ逐次実行する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ソースコードの文法エラーだけをチェックする', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソースコード全体を一括して機械語に変換する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ソースコードをバイトコードに変換して仮想マシンで実行する', FALSE, 4);

  -- Q95: スタックとヒープ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'メモリ領域のスタックの特徴として正しいものはどれか。', 'スタック領域はLIFO（後入れ先出し）方式で管理され、関数のローカル変数や戻りアドレスが格納されます。', 1, 95, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラマが明示的に確保・解放するメモリ領域', FALSE, 1),
    (gen_random_uuid(), q_id, 'FIFO方式で管理される領域', FALSE, 2),
    (gen_random_uuid(), q_id, 'LIFO方式で管理され関数のローカル変数が格納される', TRUE, 3),
    (gen_random_uuid(), q_id, 'ガベージコレクションによって管理される領域', FALSE, 4);

  -- Q96: ASCII文字コード
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ASCIIコードの説明として正しいものはどれか。', 'ASCIIは7ビット（128文字）で英数字・記号・制御文字を表現する文字コードです。', 1, 96, 'easy', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本語を含む多言語対応の文字コード', FALSE, 1),
    (gen_random_uuid(), q_id, '7ビットで128種類の文字を表現する文字コード', TRUE, 2),
    (gen_random_uuid(), q_id, '16ビットで世界中の文字を表現する文字コード', FALSE, 3),
    (gen_random_uuid(), q_id, '可変長エンコーディングを使用する文字コード', FALSE, 4);

  -- ===== basic_theory - MEDIUM (12) =====

  -- Q97: XOR演算
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '2進数「1011」と「0110」のXOR演算の結果はどれか。', 'XORは各ビットが異なるとき1になります。1⊕0=1, 0⊕1=1, 1⊕1=0, 1⊕0=1 → 1101です。', 1, 97, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1111', FALSE, 1),
    (gen_random_uuid(), q_id, '0010', FALSE, 2),
    (gen_random_uuid(), q_id, '1101', TRUE, 3),
    (gen_random_uuid(), q_id, '0100', FALSE, 4);

  -- Q98: Big-O比較
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '次の計算量を小さい順に並べたとき、正しいものはどれか。', 'O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2^n) が一般的な計算量の大小関係です。', 1, 98, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1) < O(n) < O(log n) < O(n²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n) < O(1) < O(n) < O(n²)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(1) < O(log n) < O(n) < O(n²)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(1) < O(log n) < O(n²) < O(n)', FALSE, 4);

  -- Q99: OOPの4大特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'オブジェクト指向プログラミングの4大特徴に含まれないものはどれか。', 'OOPの4大特徴はカプセル化、継承、ポリモーフィズム、抽象化です。並列処理はOOPの特徴ではありません。', 1, 99, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'カプセル化', FALSE, 1),
    (gen_random_uuid(), q_id, '継承', FALSE, 2),
    (gen_random_uuid(), q_id, '並列処理', TRUE, 3),
    (gen_random_uuid(), q_id, 'ポリモーフィズム', FALSE, 4);

  -- Q100: ポリモーフィズム
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ポリモーフィズム（多態性）の説明として正しいものはどれか。', 'ポリモーフィズムとは同じインターフェースで異なる実装を呼び出せる仕組みのことです。', 1, 100, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスの内部実装を外部から隠蔽すること', FALSE, 1),
    (gen_random_uuid(), q_id, '親クラスの属性やメソッドを子クラスが引き継ぐこと', FALSE, 2),
    (gen_random_uuid(), q_id, '同じインターフェースで異なる実装を呼び出せること', TRUE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの状態を永続化すること', FALSE, 4);

  -- Q101: UTF-8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'UTF-8の特徴として正しいものはどれか。', 'UTF-8は可変長エンコーディングで、ASCII互換性があり、1〜4バイトで文字を表現します。', 1, 101, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべての文字を2バイト固定で表現する', FALSE, 1),
    (gen_random_uuid(), q_id, '可変長エンコーディングでASCII互換性がある', TRUE, 2),
    (gen_random_uuid(), q_id, 'すべての文字を4バイト固定で表現する', FALSE, 3),
    (gen_random_uuid(), q_id, '日本語を1バイトで表現できる', FALSE, 4);

  -- Q102: 浮動小数点
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'IEEE 754の単精度浮動小数点数のビット数はどれか。', 'IEEE 754の単精度（float）は32ビット（符号1+指数8+仮数23）、倍精度（double）は64ビットです。', 1, 102, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '16ビット', FALSE, 1),
    (gen_random_uuid(), q_id, '32ビット', TRUE, 2),
    (gen_random_uuid(), q_id, '64ビット', FALSE, 3),
    (gen_random_uuid(), q_id, '128ビット', FALSE, 4);

  -- Q103: デザインパターン - Singleton
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Singletonパターンの目的として正しいものはどれか。', 'Singletonパターンはクラスのインスタンスが1つだけであることを保証し、そのグローバルなアクセスポイントを提供します。', 1, 103, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトの生成を工場クラスに委譲する', FALSE, 1),
    (gen_random_uuid(), q_id, 'オブジェクト間の1対多の依存関係を定義する', FALSE, 2),
    (gen_random_uuid(), q_id, 'クラスのインスタンスを1つだけに制限する', TRUE, 3),
    (gen_random_uuid(), q_id, 'アルゴリズムをカプセル化して交換可能にする', FALSE, 4);

  -- Q104: SOLID - 単一責任の原則
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SOLID原則の「S」（単一責任の原則）の説明として正しいものはどれか。', '単一責任の原則（SRP）は、クラスは変更する理由がただ1つであるべきという原則です。', 1, 104, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスは変更する理由がただ1つであるべき', TRUE, 1),
    (gen_random_uuid(), q_id, 'クラスは拡張に対して開き、修正に対して閉じるべき', FALSE, 2),
    (gen_random_uuid(), q_id, 'サブクラスは親クラスと置換可能であるべき', FALSE, 3),
    (gen_random_uuid(), q_id, 'クライアントに不要なインターフェースへの依存を強制すべきでない', FALSE, 4);

  -- Q105: 関数型プログラミング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '関数型プログラミングの特徴として正しいものはどれか。', '関数型プログラミングでは副作用を避け、不変データと純粋関数を重視します。', 1, 105, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスとオブジェクトを中心に設計する', FALSE, 1),
    (gen_random_uuid(), q_id, '手続きの順序を明示的に記述する', FALSE, 2),
    (gen_random_uuid(), q_id, '副作用を避け不変データと純粋関数を重視する', TRUE, 3),
    (gen_random_uuid(), q_id, 'goto文を積極的に使用する', FALSE, 4);

  -- Q106: ヒープメモリ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ヒープ領域の特徴として正しいものはどれか。', 'ヒープ領域は動的にメモリを確保・解放する領域で、プログラマまたはGCが管理します。スタックより遅いが柔軟です。', 1, 106, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数呼び出し時に自動的に確保・解放される', FALSE, 1),
    (gen_random_uuid(), q_id, '動的にメモリを確保でき、明示的またはGCで解放される', TRUE, 2),
    (gen_random_uuid(), q_id, 'コンパイル時にサイズが決定される固定領域', FALSE, 3),
    (gen_random_uuid(), q_id, '読み取り専用のメモリ領域', FALSE, 4);

  -- Q107: 2の補数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '8ビットの2の補数表現で「-1」を表すビット列はどれか。', '2の補数で-1を表すには全ビットを1にします。8ビットでは11111111(=0xFF)です。', 1, 107, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10000001', FALSE, 1),
    (gen_random_uuid(), q_id, '11111111', TRUE, 2),
    (gen_random_uuid(), q_id, '11111110', FALSE, 3),
    (gen_random_uuid(), q_id, '10000000', FALSE, 4);

  -- Q108: Observerパターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Observerパターンの説明として正しいものはどれか。', 'Observerパターンはオブジェクト間の1対多の依存関係を定義し、あるオブジェクトの状態変化を依存オブジェクトに自動通知します。', 1, 108, 'medium', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトの生成を専門のクラスに委譲する', FALSE, 1),
    (gen_random_uuid(), q_id, 'アルゴリズムの骨格を定義し詳細をサブクラスに委ねる', FALSE, 2),
    (gen_random_uuid(), q_id, '複雑なサブシステムへの統一インターフェースを提供する', FALSE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの状態変化を依存オブジェクトに自動通知する', TRUE, 4);

  -- ===== basic_theory - HARD (12) =====

  -- Q109: 浮動小数点の誤差
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'IEEE 754浮動小数点数で0.1+0.2が0.3にならない原因として正しいものはどれか。', '0.1や0.2は2進数で無限小数になるため、有限ビットで表現すると丸め誤差が発生し、正確に0.3にはなりません。', 1, 109, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUの演算精度が不足しているため', FALSE, 1),
    (gen_random_uuid(), q_id, '0.1や0.2が2進数で無限小数となり丸め誤差が生じるため', TRUE, 2),
    (gen_random_uuid(), q_id, 'コンパイラの最適化によるバグのため', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリアライメントのずれにより計算結果が変わるため', FALSE, 4);

  -- Q110: SOLID - リスコフの置換原則
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'リスコフの置換原則（LSP）に違反する例として最も適切なものはどれか。', 'LSPではサブクラスは親クラスと置換可能であるべきです。正方形が長方形を継承しsetWidthで高さも変わる場合、長方形の契約に違反します。', 1, 110, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Animalクラスを継承したDogクラスがbarkメソッドを追加する', FALSE, 1),
    (gen_random_uuid(), q_id, 'RectangleクラスをSquareが継承しsetWidthで高さも変更される', TRUE, 2),
    (gen_random_uuid(), q_id, 'Listインターフェースを実装したArrayListクラス', FALSE, 3),
    (gen_random_uuid(), q_id, 'Vehicleクラスを継承したCarクラスがdriveメソッドをオーバーライドする', FALSE, 4);

  -- Q111: ガベージコレクション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'マーク・アンド・スイープ方式のガベージコレクションの説明として正しいものはどれか。', 'マーク・アンド・スイープはルートから到達可能なオブジェクトをマークし、マークされていないオブジェクトを解放する方式です。', 1, 111, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '参照カウントが0になったオブジェクトを即座に解放する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリプールを世代別に分けて若い世代を頻繁に回収する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ルートから到達可能なオブジェクトをマークし、未マークを解放する', TRUE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトのスコープ終了時に自動的にデストラクタを呼ぶ', FALSE, 4);

  -- Q112: 依存性逆転の原則
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SOLID原則の「D」（依存性逆転の原則）の説明として正しいものはどれか。', '依存性逆転の原則（DIP）は上位モジュールは下位モジュールに依存すべきでなく、両者とも抽象に依存すべきという原則です。', 1, 112, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスは1つの責任だけを持つべき', FALSE, 1),
    (gen_random_uuid(), q_id, '上位モジュールは下位モジュールに依存せず両者とも抽象に依存すべき', TRUE, 2),
    (gen_random_uuid(), q_id, 'サブクラスは親クラスと置換可能であるべき', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソフトウェアは拡張に対して開き修正に対して閉じるべき', FALSE, 4);

  -- Q113: Strategyパターン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Strategyパターンを適用すべき状況として最も適切なものはどれか。', 'Strategyパターンはアルゴリズムをカプセル化し実行時に切り替え可能にします。ソートアルゴリズムの切り替えが典型例です。', 1, 113, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトの生成過程が複雑で段階的に構築したい', FALSE, 1),
    (gen_random_uuid(), q_id, '複数のソートアルゴリズムを実行時に切り替えたい', TRUE, 2),
    (gen_random_uuid(), q_id, 'サブシステムへのアクセスを統一インターフェースで提供したい', FALSE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの状態に応じて振る舞いを変えたい', FALSE, 4);

  -- Q114: ジェネリクスの型消去
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Javaのジェネリクスにおける型消去（Type Erasure）の説明として正しいものはどれか。', 'Javaのジェネリクスはコンパイル時に型チェックを行い、実行時には型パラメータの情報が消去されます（後方互換性のため）。', 1, 114, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行時に型パラメータの情報が保持され動的型チェックが行われる', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンパイル時に型チェック後、実行時には型パラメータ情報が消去される', TRUE, 2),
    (gen_random_uuid(), q_id, 'ジェネリック型はコンパイル時にプリミティブ型に変換される', FALSE, 3),
    (gen_random_uuid(), q_id, '型パラメータはリフレクションで常に取得可能', FALSE, 4);

  -- Q115: メモリリーク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'GC対応言語（Java等）でメモリリークが発生するケースとして正しいものはどれか。', 'GC言語でも、不要になったオブジェクトへの参照をコレクション等が保持し続けると、GCが回収できずメモリリークになります。', 1, 115, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ローカル変数を大量に宣言した場合', FALSE, 1),
    (gen_random_uuid(), q_id, 'staticフィールドのリストに不要なオブジェクトを追加し続ける場合', TRUE, 2),
    (gen_random_uuid(), q_id, 'メソッドの再帰呼び出しが深い場合', FALSE, 3),
    (gen_random_uuid(), q_id, 'プリミティブ型の配列を確保した場合', FALSE, 4);

  -- Q116: クロージャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クロージャ（closure）の説明として正しいものはどれか。', 'クロージャは関数とその関数が定義された環境（自由変数の束縛）を一体化したものです。', 1, 116, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数が自身を再帰的に呼び出す仕組み', FALSE, 1),
    (gen_random_uuid(), q_id, '関数と定義時の環境（自由変数の束縛）を一体化したもの', TRUE, 2),
    (gen_random_uuid(), q_id, '関数をコンパイル時にインライン展開する最適化手法', FALSE, 3),
    (gen_random_uuid(), q_id, '関数の実行結果をキャッシュして再利用する仕組み', FALSE, 4);

  -- Q117: 末尾再帰最適化
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '末尾再帰最適化（Tail Call Optimization）の説明として正しいものはどれか。', '末尾再帰最適化は再帰呼び出しが関数の最後の操作である場合、新しいスタックフレームを作らずにループに変換する最適化です。', 1, 117, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再帰を並列処理に変換してCPUコアを活用する最適化', FALSE, 1),
    (gen_random_uuid(), q_id, '再帰の結果をメモ化してキャッシュする最適化', FALSE, 2),
    (gen_random_uuid(), q_id, '末尾位置の再帰呼び出しをループに変換しスタック消費を抑える最適化', TRUE, 3),
    (gen_random_uuid(), q_id, '再帰の深さに上限を設けてスタックオーバーフローを防ぐ仕組み', FALSE, 4);

  -- Q118: Factoryパターン vs Abstract Factory
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Abstract Factoryパターンの目的として正しいものはどれか。', 'Abstract Factoryは関連するオブジェクト群を具象クラスを指定せずに生成するためのインターフェースを提供します。', 1, 118, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つのオブジェクトの生成手順を段階的に定義する', FALSE, 1),
    (gen_random_uuid(), q_id, '既存オブジェクトのクローンを作成する', FALSE, 2),
    (gen_random_uuid(), q_id, '関連するオブジェクト群を具象クラスを指定せず生成する', TRUE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの生成をサブクラスに委譲する', FALSE, 4);

  -- Q119: 不変オブジェクト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '不変オブジェクト（Immutable Object）の利点として正しくないものはどれか。', '不変オブジェクトはスレッドセーフで安全ですが、状態変更のたびに新しいオブジェクトを生成するためメモリ効率は低下する可能性があります。', 1, 119, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スレッドセーフであり同期処理が不要', FALSE, 1),
    (gen_random_uuid(), q_id, 'ハッシュマップのキーとして安全に使用できる', FALSE, 2),
    (gen_random_uuid(), q_id, '状態変更時に常にメモリ効率が向上する', TRUE, 3),
    (gen_random_uuid(), q_id, '副作用がなく予測可能な動作をする', FALSE, 4);

  -- Q120: 計算量 - 償却解析
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '動的配列（ArrayList等）の末尾追加における償却計算量はどれか。', '動的配列は容量超過時に倍のサイズに再確保しますが、n回の追加の合計コストはO(n)なので、償却計算量はO(1)です。', 1, 120, 'hard', 'basic_theory');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(1) 償却', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(n²) 償却', FALSE, 4);

END $$;

-- ============================================
-- Category: database (sort_order 121-150)
-- easy: 6, medium: 12, hard: 12
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== database - EASY (6) =====

  -- Q121: SELECT文の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLでテーブルの全カラムを取得する文として正しいものはどれか。', 'SELECT * FROM テーブル名 で、指定テーブルの全カラム・全行を取得できます。', 1, 121, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET * FROM users', FALSE, 1),
    (gen_random_uuid(), q_id, 'SELECT * FROM users', TRUE, 2),
    (gen_random_uuid(), q_id, 'FETCH ALL FROM users', FALSE, 3),
    (gen_random_uuid(), q_id, 'READ * FROM users', FALSE, 4);

  -- Q122: WHERE句
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLのWHERE句の役割として正しいものはどれか。', 'WHERE句は取得する行を条件で絞り込むために使用します。', 1, 122, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'カラムの表示順を指定する', FALSE, 1),
    (gen_random_uuid(), q_id, '取得する行を条件で絞り込む', TRUE, 2),
    (gen_random_uuid(), q_id, '結果をグループ化する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルを結合する', FALSE, 4);

  -- Q123: PRIMARY KEY
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '主キー（PRIMARY KEY）の制約として正しいものはどれか。', '主キーはNULL不可かつ一意（UNIQUE）であり、テーブル内の各行を一意に識別します。', 1, 123, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NULL値を許容し重複も可能', FALSE, 1),
    (gen_random_uuid(), q_id, 'NULL値を許容するが重複は不可', FALSE, 2),
    (gen_random_uuid(), q_id, 'NULL不可かつ一意でなければならない', TRUE, 3),
    (gen_random_uuid(), q_id, 'NULL不可だが重複は許容される', FALSE, 4);

  -- Q124: RDBMS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'RDBMSの説明として正しいものはどれか。', 'RDBMS（Relational Database Management System）はデータを表（テーブル）形式で管理し、SQL言語で操作するデータベース管理システムです。', 1, 124, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データをJSON形式のドキュメントで管理するシステム', FALSE, 1),
    (gen_random_uuid(), q_id, 'データをキーと値のペアで管理するシステム', FALSE, 2),
    (gen_random_uuid(), q_id, 'データをグラフ構造で管理するシステム', FALSE, 3),
    (gen_random_uuid(), q_id, 'データを表形式で管理しSQLで操作するシステム', TRUE, 4);

  -- Q125: ORDER BY
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLで結果を降順に並べ替えるキーワードはどれか。', 'ORDER BY カラム名 DESC で降順、ASCで昇順に並べ替えます。デフォルトはASC（昇順）です。', 1, 125, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ASC', FALSE, 1),
    (gen_random_uuid(), q_id, 'DESC', TRUE, 2),
    (gen_random_uuid(), q_id, 'REVERSE', FALSE, 3),
    (gen_random_uuid(), q_id, 'DOWN', FALSE, 4);

  -- Q126: GROUP BY
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLのGROUP BY句と共に使用する集約関数でないものはどれか。', 'COUNT, SUM, AVG, MAX, MINは集約関数です。CONCATは文字列結合関数であり集約関数ではありません。', 1, 126, 'easy', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'COUNT', FALSE, 1),
    (gen_random_uuid(), q_id, 'SUM', FALSE, 2),
    (gen_random_uuid(), q_id, 'AVG', FALSE, 3),
    (gen_random_uuid(), q_id, 'CONCAT', TRUE, 4);

  -- ===== database - MEDIUM (12) =====

  -- Q127: INNER JOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'INNER JOINの説明として正しいものはどれか。', 'INNER JOINは両テーブルで結合条件に一致する行のみを返します。一致しない行は結果に含まれません。', 1, 127, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全行と一致する右テーブルの行を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '両テーブルで結合条件に一致する行のみを返す', TRUE, 2),
    (gen_random_uuid(), q_id, '両テーブルの全行の組み合わせを返す', FALSE, 3),
    (gen_random_uuid(), q_id, '右テーブルの全行と一致する左テーブルの行を返す', FALSE, 4);

  -- Q128: LEFT JOIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'LEFT JOINの説明として正しいものはどれか。', 'LEFT JOINは左テーブルの全行を返し、右テーブルに一致する行がない場合はNULLで埋めます。', 1, 128, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '両テーブルで一致する行のみ返す', FALSE, 1),
    (gen_random_uuid(), q_id, '右テーブルの全行を返し左に一致がなければNULL', FALSE, 2),
    (gen_random_uuid(), q_id, '左テーブルの全行を返し右に一致がなければNULL', TRUE, 3),
    (gen_random_uuid(), q_id, '両テーブルの全行を返す', FALSE, 4);

  -- Q129: 第1正規形
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '第1正規形（1NF）の条件として正しいものはどれか。', '第1正規形では各カラムの値が原子的（これ以上分割できない）であること、つまり繰り返しグループや複数値を含まないことが条件です。', 1, 129, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全ての非キー属性が主キーに完全関数従属していること', FALSE, 1),
    (gen_random_uuid(), q_id, '各カラムの値が原子的で繰り返しグループがないこと', TRUE, 2),
    (gen_random_uuid(), q_id, '推移的関数従属がないこと', FALSE, 3),
    (gen_random_uuid(), q_id, '外部キーが設定されていること', FALSE, 4);

  -- Q130: ACID特性 - Atomicity
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トランザクションのACID特性のうち「A（原子性）」の説明として正しいものはどれか。', '原子性（Atomicity）はトランザクション内の操作が全て成功するか全て失敗するかのどちらかであることを保証します。', 1, 130, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'トランザクション完了後のデータが永続的に保存される', FALSE, 1),
    (gen_random_uuid(), q_id, '同時実行されるトランザクションが互いに干渉しない', FALSE, 2),
    (gen_random_uuid(), q_id, 'トランザクション内の操作が全て成功するか全て失敗する', TRUE, 3),
    (gen_random_uuid(), q_id, 'データの整合性制約が常に満たされる', FALSE, 4);

  -- Q131: インデックス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'データベースインデックスの一般的なデメリットとして正しいものはどれか。', 'インデックスは検索を高速化しますが、INSERT/UPDATE/DELETE時にインデックスの更新も必要になるため、書き込み性能が低下します。', 1, 131, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SELECT文の実行が遅くなる', FALSE, 1),
    (gen_random_uuid(), q_id, 'INSERT/UPDATE/DELETE時の性能が低下する', TRUE, 2),
    (gen_random_uuid(), q_id, 'テーブルの行数に上限が生じる', FALSE, 3),
    (gen_random_uuid(), q_id, 'トランザクションが使用できなくなる', FALSE, 4);

  -- Q132: ER図
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ER図（Entity-Relationship Diagram）の構成要素に含まれないものはどれか。', 'ER図はエンティティ（実体）、リレーションシップ（関連）、属性で構成されます。メソッドはクラス図の要素です。', 1, 132, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'エンティティ（実体）', FALSE, 1),
    (gen_random_uuid(), q_id, 'リレーションシップ（関連）', FALSE, 2),
    (gen_random_uuid(), q_id, '属性', FALSE, 3),
    (gen_random_uuid(), q_id, 'メソッド', TRUE, 4);

  -- Q133: NoSQL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'NoSQLデータベースの特徴として正しいものはどれか。', 'NoSQLは固定スキーマ不要で水平スケーリングに優れますが、複雑なJOINやトランザクションのサポートはRDBMSより限定的です。', 1, 133, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '常にACIDトランザクションを完全サポートする', FALSE, 1),
    (gen_random_uuid(), q_id, '固定スキーマが必須である', FALSE, 2),
    (gen_random_uuid(), q_id, 'スキーマレスで水平スケーリングに優れる', TRUE, 3),
    (gen_random_uuid(), q_id, 'SQL言語でのみ操作可能', FALSE, 4);

  -- Q134: サブクエリ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLのサブクエリ（副問合せ）の説明として正しいものはどれか。', 'サブクエリはSELECT文の中に埋め込まれた別のSELECT文で、WHERE句やFROM句などで使用できます。', 1, 134, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルを物理的に結合する操作', FALSE, 1),
    (gen_random_uuid(), q_id, 'SELECT文の中に埋め込まれた別のSELECT文', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベースのバックアップを作成する文', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルのスキーマを変更する文', FALSE, 4);

  -- Q135: HAVING句
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLのHAVING句とWHERE句の違いとして正しいものはどれか。', 'WHERE句はグループ化前の行に条件を適用し、HAVING句はGROUP BY後のグループに条件を適用します。', 1, 135, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HAVING句はGROUP BY後のグループに条件を適用する', TRUE, 1),
    (gen_random_uuid(), q_id, 'WHERE句はGROUP BY後に条件を適用する', FALSE, 2),
    (gen_random_uuid(), q_id, 'HAVING句はインデックスを使用できない', FALSE, 3),
    (gen_random_uuid(), q_id, '両者に機能的な違いはない', FALSE, 4);

  -- Q136: FOREIGN KEY
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '外部キー（FOREIGN KEY）の役割として正しいものはどれか。', '外部キーは参照先テーブルの主キー（またはユニークキー）を参照し、テーブル間の参照整合性を保証します。', 1, 136, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル内の行を一意に識別する', FALSE, 1),
    (gen_random_uuid(), q_id, '検索速度を向上させるためのインデックス', FALSE, 2),
    (gen_random_uuid(), q_id, 'テーブル間の参照整合性を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, 'カラムの値がNULLでないことを保証する', FALSE, 4);

  -- Q137: B-Treeインデックス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'B-Treeインデックスの検索計算量として正しいものはどれか。', 'B-Treeはバランス木であり、検索・挿入・削除の計算量はいずれもO(log n)です。', 1, 137, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q138: VIEW
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'データベースのVIEW（ビュー）の説明として正しいものはどれか。', 'VIEWはSELECT文を保存した仮想テーブルで、データを物理的に保持せず、参照時にクエリが実行されます。', 1, 138, 'medium', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データを物理的に複製したテーブル', FALSE, 1),
    (gen_random_uuid(), q_id, 'SELECT文を保存した仮想テーブル', TRUE, 2),
    (gen_random_uuid(), q_id, 'テーブルのバックアップコピー', FALSE, 3),
    (gen_random_uuid(), q_id, 'インデックスの一種', FALSE, 4);

  -- ===== database - HARD (12) =====

  -- Q139: 第3正規形
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '第3正規形（3NF）の条件として正しいものはどれか。', '第3正規形は第2正規形を満たし、かつ非キー属性が他の非キー属性に推移的に関数従属しないことが条件です。', 1, 139, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各カラムの値が原子的であること', FALSE, 1),
    (gen_random_uuid(), q_id, '部分関数従属がないこと', FALSE, 2),
    (gen_random_uuid(), q_id, '非キー属性間の推移的関数従属がないこと', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべての決定子が候補キーであること', FALSE, 4);

  -- Q140: デッドロック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'データベースのデッドロックの説明として正しいものはどれか。', 'デッドロックは2つ以上のトランザクションが互いに相手のロック解放を待ち続け、どちらも進行できない状態です。', 1, 140, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つのトランザクションが長時間ロックを保持している状態', FALSE, 1),
    (gen_random_uuid(), q_id, '2つ以上のトランザクションが互いのロック解放を待ち合う状態', TRUE, 2),
    (gen_random_uuid(), q_id, 'トランザクションがタイムアウトでロールバックされた状態', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブル全体にロックがかかりアクセスできない状態', FALSE, 4);

  -- Q141: レプリケーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'マスター・スレーブレプリケーションの一般的な構成として正しいものはどれか。', 'マスター・スレーブ構成ではマスターが書き込みを担当し、スレーブに非同期でデータを複製して読み取り負荷を分散します。', 1, 141, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マスターとスレーブの両方で書き込みを行う', FALSE, 1),
    (gen_random_uuid(), q_id, 'スレーブがマスターにデータを送信する', FALSE, 2),
    (gen_random_uuid(), q_id, 'マスターで書き込みスレーブで読み取りを分散する', TRUE, 3),
    (gen_random_uuid(), q_id, 'マスターは読み取り専用でスレーブが書き込みを行う', FALSE, 4);

  -- Q142: SQLインジェクション対策
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLインジェクション対策として最も効果的なものはどれか。', 'プリペアドステートメント（パラメータ化クエリ）はSQL文とパラメータを分離するため、SQLインジェクションを根本的に防止します。', 1, 142, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '入力値の長さを制限する', FALSE, 1),
    (gen_random_uuid(), q_id, 'エラーメッセージを非表示にする', FALSE, 2),
    (gen_random_uuid(), q_id, 'プリペアドステートメントを使用する', TRUE, 3),
    (gen_random_uuid(), q_id, 'データベースユーザーの権限を最小化する', FALSE, 4);

  -- Q143: トランザクション分離レベル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トランザクション分離レベルで「ファントムリード」を防止できるレベルはどれか。', 'SERIALIZABLE分離レベルのみがファントムリード（他トランザクションの挿入による幻像読取り）を防止できます。', 1, 143, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'READ UNCOMMITTED', FALSE, 1),
    (gen_random_uuid(), q_id, 'READ COMMITTED', FALSE, 2),
    (gen_random_uuid(), q_id, 'REPEATABLE READ', FALSE, 3),
    (gen_random_uuid(), q_id, 'SERIALIZABLE', TRUE, 4);

  -- Q144: ストアドプロシージャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ストアドプロシージャの利点として正しくないものはどれか。', 'ストアドプロシージャはネットワーク往復を減らし再利用性が高いですが、デバッグが難しくDB依存になるためポータビリティは低下します。', 1, 144, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ネットワーク通信量の削減', FALSE, 1),
    (gen_random_uuid(), q_id, 'SQLの再利用性向上', FALSE, 2),
    (gen_random_uuid(), q_id, '他のDBMSへの容易な移植', TRUE, 3),
    (gen_random_uuid(), q_id, 'セキュリティの向上', FALSE, 4);

  -- Q145: 楽観的ロック vs 悲観的ロック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '楽観的ロック（Optimistic Locking）の実装方法として一般的なものはどれか。', '楽観的ロックではバージョン番号やタイムスタンプを使い、更新時に値が変わっていないか確認して競合を検出します。', 1, 145, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '読み取り時にSELECT FOR UPDATEで行ロックする', FALSE, 1),
    (gen_random_uuid(), q_id, 'バージョン番号カラムで更新時に競合を検出する', TRUE, 2),
    (gen_random_uuid(), q_id, 'テーブル全体にロックをかける', FALSE, 3),
    (gen_random_uuid(), q_id, 'トランザクション分離レベルをSERIALIZABLEにする', FALSE, 4);

  -- Q146: EXPLAIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SQLのEXPLAIN文の用途として正しいものはどれか。', 'EXPLAINはクエリの実行計画を表示し、インデックスの使用状況やスキャン方式を確認してパフォーマンスチューニングに活用します。', 1, 146, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルの構造を表示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クエリの実行計画を表示する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベースのバックアップを作成する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルの統計情報を更新する', FALSE, 4);

  -- Q147: シャーディング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'データベースシャーディングの説明として正しいものはどれか。', 'シャーディングはデータを特定のキーで分割し、複数のデータベースサーバーに水平分散する手法です。', 1, 147, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データを同じサーバー内の複数テーブルに分割する', FALSE, 1),
    (gen_random_uuid(), q_id, 'データベースの読み取りレプリカを作成する', FALSE, 2),
    (gen_random_uuid(), q_id, 'データをキーに基づいて複数サーバーに水平分散する', TRUE, 3),
    (gen_random_uuid(), q_id, 'テーブルを縦方向に分割して別テーブルにする', FALSE, 4);

  -- Q148: CAP定理
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'CAP定理の説明として正しいものはどれか。', 'CAP定理は分散システムにおいて一貫性(C)・可用性(A)・分断耐性(P)の3つを同時に満たすことはできないという定理です。', 1, 148, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '分散システムではC・A・Pの3つを同時に満たせない', TRUE, 1),
    (gen_random_uuid(), q_id, 'データベースの容量・アクセス速度・価格は同時に最適化できない', FALSE, 2),
    (gen_random_uuid(), q_id, 'トランザクションの一貫性・原子性・永続性は同時に保証できない', FALSE, 3),
    (gen_random_uuid(), q_id, 'クエリの計算量・メモリ使用量・精度を同時に最適化できない', FALSE, 4);

  -- Q149: MVCC
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'MVCC（Multi-Version Concurrency Control）の説明として正しいものはどれか。', 'MVCCはデータの複数バージョンを保持し、読み取りと書き込みが互いにブロックしない同時実行制御方式です。', 1, 149, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '排他ロックで読み取りと書き込みを直列化する方式', FALSE, 1),
    (gen_random_uuid(), q_id, 'データの複数バージョンを保持し読み書きが互いにブロックしない方式', TRUE, 2),
    (gen_random_uuid(), q_id, 'タイムスタンプ順にトランザクションを実行する方式', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブル全体をロックして一貫性を保つ方式', FALSE, 4);

  -- Q150: N+1問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'N+1問題の説明と対策として正しいものはどれか。', 'N+1問題は一覧取得で1クエリ、各行の関連データ取得でN回クエリが発行される問題で、JOINやEager Loadingで対策します。', 1, 150, 'hard', 'database');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックスが未設定で全件スキャンが発生する問題。インデックス作成で解決', FALSE, 1),
    (gen_random_uuid(), q_id, '関連データ取得で大量のクエリが発行される問題。JOINやEager Loadingで対策', TRUE, 2),
    (gen_random_uuid(), q_id, 'トランザクションのロック競合で性能が低下する問題。分離レベル変更で対策', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルの正規化不足でデータが重複する問題。正規化で対策', FALSE, 4);

END $$;

-- ============================================
-- Category: security (sort_order 151-180)
-- easy: 6, medium: 12, hard: 12
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== security - EASY (6) =====

  -- Q151: 共通鍵暗号
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '共通鍵暗号方式の特徴として正しいものはどれか。', '共通鍵暗号は暗号化と復号に同じ鍵を使用する方式で、処理速度が速いですが鍵の共有が課題です。', 1, 151, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '暗号化と復号に異なる鍵を使用する', FALSE, 1),
    (gen_random_uuid(), q_id, '暗号化と復号に同じ鍵を使用する', TRUE, 2),
    (gen_random_uuid(), q_id, '鍵を使用せずに暗号化する', FALSE, 3),
    (gen_random_uuid(), q_id, '一方向にのみ変換できる', FALSE, 4);

  -- Q152: HTTPS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPSの説明として正しいものはどれか。', 'HTTPSはHTTP通信をSSL/TLSで暗号化したプロトコルで、通信内容の盗聴や改ざんを防止します。', 1, 152, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTPの高速版プロトコル', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP通信をSSL/TLSで暗号化したプロトコル', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTP/2の別名', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTTPにキャッシュ機能を追加したプロトコル', FALSE, 4);

  -- Q153: ハッシュ関数の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュ関数の特徴として正しいものはどれか。', 'ハッシュ関数は任意長の入力から固定長の出力を生成する一方向関数で、元のデータを復元できません。', 1, 153, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '出力から元のデータを復元できる', FALSE, 1),
    (gen_random_uuid(), q_id, '入力の長さに応じて出力の長さが変わる', FALSE, 2),
    (gen_random_uuid(), q_id, '任意長の入力から固定長の出力を生成する一方向関数', TRUE, 3),
    (gen_random_uuid(), q_id, '同じ入力でも毎回異なる出力を生成する', FALSE, 4);

  -- Q154: ファイアウォール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ファイアウォールの基本的な役割として正しいものはどれか。', 'ファイアウォールはネットワーク間の通信を監視し、定められたルールに基づいて許可または拒否するセキュリティ装置です。', 1, 154, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ウイルスを検出して駆除する', FALSE, 1),
    (gen_random_uuid(), q_id, 'データを暗号化して送受信する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク通信をルールに基づき許可または拒否する', TRUE, 3),
    (gen_random_uuid(), q_id, 'パスワードの強度を検証する', FALSE, 4);

  -- Q155: パスワード保存
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'パスワードの安全な保存方法として正しいものはどれか。', 'パスワードは平文で保存せず、ソルト付きハッシュ（bcrypt等）で保存するのが安全です。', 1, 155, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '平文のまま保存する', FALSE, 1),
    (gen_random_uuid(), q_id, 'Base64エンコードして保存する', FALSE, 2),
    (gen_random_uuid(), q_id, '共通鍵で暗号化して保存する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ソルト付きハッシュ（bcrypt等）で保存する', TRUE, 4);

  -- Q156: VPN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'VPN（Virtual Private Network）の主な目的として正しいものはどれか。', 'VPNはインターネット上に暗号化されたトンネルを構築し、安全なプライベート通信を実現する技術です。', 1, 156, 'easy', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Webサイトの表示速度を向上させる', FALSE, 1),
    (gen_random_uuid(), q_id, '暗号化トンネルで安全なプライベート通信を実現する', TRUE, 2),
    (gen_random_uuid(), q_id, 'メールの添付ファイルを自動圧縮する', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースのバックアップを自動化する', FALSE, 4);

  -- ===== security - MEDIUM (12) =====

  -- Q157: 公開鍵暗号
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '公開鍵暗号方式でデータを暗号化して送信する場合、使用する鍵の組み合わせとして正しいものはどれか。', '公開鍵暗号では送信者が受信者の公開鍵で暗号化し、受信者が自分の秘密鍵で復号します。', 1, 157, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '送信者の公開鍵で暗号化、受信者の秘密鍵で復号', FALSE, 1),
    (gen_random_uuid(), q_id, '受信者の公開鍵で暗号化、受信者の秘密鍵で復号', TRUE, 2),
    (gen_random_uuid(), q_id, '送信者の秘密鍵で暗号化、受信者の公開鍵で復号', FALSE, 3),
    (gen_random_uuid(), q_id, '共通の秘密鍵で暗号化と復号を行う', FALSE, 4);

  -- Q158: SSL/TLSハンドシェイク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SSL/TLSハンドシェイクの過程で行われないものはどれか。', 'SSL/TLSハンドシェイクではサーバー証明書の検証、暗号スイートの合意、セッション鍵の生成を行います。ユーザー認証はアプリケーション層の処理です。', 1, 158, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー証明書の検証', FALSE, 1),
    (gen_random_uuid(), q_id, '暗号スイートの合意', FALSE, 2),
    (gen_random_uuid(), q_id, 'セッション鍵の生成', FALSE, 3),
    (gen_random_uuid(), q_id, 'ユーザーIDとパスワードの照合', TRUE, 4);

  -- Q159: XSS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クロスサイトスクリプティング（XSS）の対策として最も基本的なものはどれか。', 'XSSは悪意のあるスクリプトをWebページに注入する攻撃で、出力時のHTMLエスケープが基本対策です。', 1, 159, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SQLのパラメータ化クエリを使用する', FALSE, 1),
    (gen_random_uuid(), q_id, '出力時にHTMLエスケープを行う', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTPSを使用する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイアウォールを導入する', FALSE, 4);

  -- Q160: CSRF
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'CSRF（Cross-Site Request Forgery）の対策として正しいものはどれか。', 'CSRFはユーザーの認証済みセッションを利用して不正リクエストを送信する攻撃で、CSRFトークンによる検証が有効な対策です。', 1, 160, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '入力値をHTMLエスケープする', FALSE, 1),
    (gen_random_uuid(), q_id, 'プリペアドステートメントを使用する', FALSE, 2),
    (gen_random_uuid(), q_id, 'CSRFトークンをフォームに埋め込み検証する', TRUE, 3),
    (gen_random_uuid(), q_id, 'パスワードを定期的に変更する', FALSE, 4);

  -- Q161: OAuth 2.0
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OAuth 2.0の説明として正しいものはどれか。', 'OAuth 2.0はリソースオーナーの資格情報を共有せずに、サードパーティにリソースへの限定的なアクセスを認可するプロトコルです。', 1, 161, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パスワードを暗号化して保存するための規格', FALSE, 1),
    (gen_random_uuid(), q_id, '通信を暗号化するためのプロトコル', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザーの資格情報を共有せずにリソースアクセスを認可するプロトコル', TRUE, 3),
    (gen_random_uuid(), q_id, 'IPアドレスを隠すための匿名化プロトコル', FALSE, 4);

  -- Q162: JWT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'JWT（JSON Web Token）の構造として正しいものはどれか。', 'JWTはヘッダー・ペイロード・署名の3部分をドット(.)で区切った構造で、Base64URLエンコードされています。', 1, 162, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ユーザーID + パスワード + タイムスタンプ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ヘッダー + ペイロード + 署名', TRUE, 2),
    (gen_random_uuid(), q_id, '公開鍵 + 秘密鍵 + 証明書', FALSE, 3),
    (gen_random_uuid(), q_id, 'セッションID + Cookie + トークン', FALSE, 4);

  -- Q163: デジタル署名
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'デジタル署名の目的として正しいものはどれか。', 'デジタル署名は送信者の秘密鍵で署名し受信者が公開鍵で検証することで、改ざん検出と送信者の認証を実現します。', 1, 163, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データを暗号化して機密性を保つ', FALSE, 1),
    (gen_random_uuid(), q_id, 'データの改ざん検出と送信者の認証', TRUE, 2),
    (gen_random_uuid(), q_id, 'ネットワークの通信速度を向上させる', FALSE, 3),
    (gen_random_uuid(), q_id, 'パスワードを安全に保存する', FALSE, 4);

  -- Q164: 二要素認証
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二要素認証（2FA）の「二要素」に含まれない組み合わせはどれか。', '認証の3要素は知識（パスワード）、所持（スマホ）、生体（指紋）です。パスワード+秘密の質問は両方とも知識要素なので二要素になりません。', 1, 164, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パスワード + ワンタイムパスワード（SMS）', FALSE, 1),
    (gen_random_uuid(), q_id, 'パスワード + 指紋認証', FALSE, 2),
    (gen_random_uuid(), q_id, 'パスワード + 秘密の質問', TRUE, 3),
    (gen_random_uuid(), q_id, 'パスワード + ハードウェアトークン', FALSE, 4);

  -- Q165: HTTPヘッダーセキュリティ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Content-Security-Policy（CSP）ヘッダーの目的として正しいものはどれか。', 'CSPはWebページが読み込めるリソースの出所を制限することで、XSSやデータインジェクション攻撃を軽減します。', 1, 165, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブラウザのキャッシュを制御する', FALSE, 1),
    (gen_random_uuid(), q_id, 'レスポンスの圧縮方式を指定する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ページが読み込めるリソースの出所を制限する', TRUE, 3),
    (gen_random_uuid(), q_id, 'CORSの許可ドメインを指定する', FALSE, 4);

  -- Q166: SHA-256
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SHA-256の説明として正しいものはどれか。', 'SHA-256はSHA-2ファミリーのハッシュ関数で、任意長の入力から256ビット（32バイト）の固定長ハッシュ値を出力します。', 1, 166, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '256ビットの鍵で暗号化する共通鍵暗号', FALSE, 1),
    (gen_random_uuid(), q_id, '256ビットの固定長ハッシュ値を出力するハッシュ関数', TRUE, 2),
    (gen_random_uuid(), q_id, '256ビットの公開鍵を生成する非対称暗号', FALSE, 3),
    (gen_random_uuid(), q_id, '最大256文字のパスワードに対応する認証方式', FALSE, 4);

  -- Q167: CORS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'CORS（Cross-Origin Resource Sharing）の説明として正しいものはどれか。', 'CORSはブラウザの同一オリジンポリシーを制御し、異なるオリジンからのリソースアクセスを安全に許可する仕組みです。', 1, 167, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー間でデータを同期する仕組み', FALSE, 1),
    (gen_random_uuid(), q_id, 'SQLインジェクションを防止する仕組み', FALSE, 2),
    (gen_random_uuid(), q_id, '異なるオリジンからのリソースアクセスを制御する仕組み', TRUE, 3),
    (gen_random_uuid(), q_id, 'Cookieの有効期限を管理する仕組み', FALSE, 4);

  -- Q168: セッション固定攻撃
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'セッション固定攻撃（Session Fixation）の対策として正しいものはどれか。', 'セッション固定攻撃はログイン前に設定したセッションIDをログイン後も使い回すことで発生します。ログイン後にセッションIDを再生成することが対策です。', 1, 168, 'medium', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTPSを使用する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ログイン後にセッションIDを再生成する', TRUE, 2),
    (gen_random_uuid(), q_id, 'パスワードをハッシュ化して保存する', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSRFトークンを使用する', FALSE, 4);

  -- ===== security - HARD (12) =====

  -- Q169: 公開鍵基盤（PKI）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'PKI（Public Key Infrastructure）における認証局（CA）の役割として正しいものはどれか。', '認証局（CA）はデジタル証明書を発行し、公開鍵の所有者の身元を保証する信頼の根幹です。', 1, 169, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの暗号化を実行する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ファイアウォールの設定を管理する', FALSE, 2),
    (gen_random_uuid(), q_id, 'デジタル証明書を発行し公開鍵の所有者を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, 'VPN接続のトンネルを構築する', FALSE, 4);

  -- Q170: TLS 1.3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'TLS 1.3における改善点として正しいものはどれか。', 'TLS 1.3ではハンドシェイクが1-RTTに短縮され、脆弱な暗号スイートが廃止、0-RTT再接続もサポートされています。', 1, 170, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ハンドシェイクが3-RTTに拡張された', FALSE, 1),
    (gen_random_uuid(), q_id, 'RSA鍵交換が必須になった', FALSE, 2),
    (gen_random_uuid(), q_id, 'ハンドシェイクが1-RTTに短縮され脆弱な暗号スイートが廃止された', TRUE, 3),
    (gen_random_uuid(), q_id, 'SSL 3.0との後方互換性が追加された', FALSE, 4);

  -- Q171: XSS の種類
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Stored XSS（格納型XSS）の説明として正しいものはどれか。', 'Stored XSSは悪意のあるスクリプトがサーバーのDBに保存され、他のユーザーがページを閲覧した際に実行される攻撃です。', 1, 171, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URLパラメータに含まれたスクリプトがそのまま応答に反映される攻撃', FALSE, 1),
    (gen_random_uuid(), q_id, '悪意のスクリプトがDBに保存され他ユーザー閲覧時に実行される攻撃', TRUE, 2),
    (gen_random_uuid(), q_id, 'DOMの操作を通じてクライアント側でスクリプトが実行される攻撃', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSSを悪用してページの表示を改ざんする攻撃', FALSE, 4);

  -- Q172: レインボーテーブル攻撃
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'レインボーテーブル攻撃の対策として最も効果的なものはどれか。', 'レインボーテーブルは事前計算されたハッシュ値の対応表です。ソルト（ランダムな値）を付加してハッシュ化すれば、事前計算表が無効になります。', 1, 172, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'より長いハッシュ関数（SHA-512等）を使用する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ハッシュを複数回繰り返す', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソルト（ランダムな値）を付加してハッシュ化する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ハッシュ値を暗号化して保存する', FALSE, 4);

  -- Q173: OAuth 2.0 認可コードフロー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OAuth 2.0の認可コードフロー（Authorization Code Flow）で、認可コードからアクセストークンを取得する際に必要なものはどれか。', '認可コードフローではクライアントがバックチャネルで認可コード+クライアントシークレットをトークンエンドポイントに送信してアクセストークンを取得します。', 1, 173, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ユーザーのパスワード', FALSE, 1),
    (gen_random_uuid(), q_id, '認可コードとクライアントシークレット', TRUE, 2),
    (gen_random_uuid(), q_id, 'リフレッシュトークンのみ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ユーザーのセッションID', FALSE, 4);

  -- Q174: ゼロデイ脆弱性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ゼロデイ脆弱性の説明として正しいものはどれか。', 'ゼロデイ脆弱性はベンダーがまだ認知していない、またはパッチが公開されていない脆弱性のことです。', 1, 174, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '発見から0日以内に修正された脆弱性', FALSE, 1),
    (gen_random_uuid(), q_id, 'パッチが公開されていない未修正の脆弱性', TRUE, 2),
    (gen_random_uuid(), q_id, '影響範囲が0人の軽微な脆弱性', FALSE, 3),
    (gen_random_uuid(), q_id, '0時(深夜)に発見された脆弱性', FALSE, 4);

  -- Q175: セキュアコーディング - 入力検証
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'セキュアコーディングにおける入力検証の原則として正しいものはどれか。', 'ホワイトリスト方式は許可するパターンを明示的に定義するため、ブラックリスト方式より安全です。サーバーサイドでの検証が必須です。', 1, 175, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントサイドの検証のみで十分', FALSE, 1),
    (gen_random_uuid(), q_id, 'ブラックリスト方式で危険な文字をフィルタする', FALSE, 2),
    (gen_random_uuid(), q_id, 'ホワイトリスト方式で許可パターンを定義しサーバーサイドで検証する', TRUE, 3),
    (gen_random_uuid(), q_id, '入力値の長さだけを制限すれば安全', FALSE, 4);

  -- Q176: HSTS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HSTS（HTTP Strict Transport Security）の説明として正しいものはどれか。', 'HSTSはブラウザにHTTPSでのみ通信するよう強制するHTTPレスポンスヘッダーで、HTTPへのダウングレード攻撃を防止します。', 1, 176, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTPとHTTPSを自動的に切り替える仕組み', FALSE, 1),
    (gen_random_uuid(), q_id, 'ブラウザにHTTPS通信のみを強制しHTTPダウングレードを防止する', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTP/2の暗号化通信機能', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー間のHTTPS通信を保証する仕組み', FALSE, 4);

  -- Q177: OWASP Top 10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OWASP Top 10に含まれないカテゴリはどれか。', 'OWASP Top 10はWebアプリの重大なセキュリティリスクのリストです。ネットワーク帯域幅の最適化はセキュリティリスクではありません。', 1, 177, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インジェクション', FALSE, 1),
    (gen_random_uuid(), q_id, '認証の不備', FALSE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク帯域幅の最適化', TRUE, 3),
    (gen_random_uuid(), q_id, 'セキュリティの設定ミス', FALSE, 4);

  -- Q178: 中間者攻撃（MITM）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '中間者攻撃（Man-in-the-Middle）を防ぐための技術として最も効果的なものはどれか。', '中間者攻撃は通信を傍受・改ざんする攻撃で、TLS/SSL証明書による暗号化と相互認証が最も効果的な対策です。', 1, 178, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ファイアウォールの導入', FALSE, 1),
    (gen_random_uuid(), q_id, 'ウイルス対策ソフトの導入', FALSE, 2),
    (gen_random_uuid(), q_id, 'TLS/SSL証明書による暗号化と認証', TRUE, 3),
    (gen_random_uuid(), q_id, 'IPアドレスのフィルタリング', FALSE, 4);

  -- Q179: JWTの脆弱性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'JWTの「alg: none」脆弱性の説明として正しいものはどれか。', 'alg:none攻撃はJWTヘッダーのアルゴリズムをnoneに変更し、署名検証をバイパスする攻撃です。サーバーは許可するアルゴリズムを明示的に指定すべきです。', 1, 179, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'トークンの有効期限を無期限に設定する攻撃', FALSE, 1),
    (gen_random_uuid(), q_id, 'アルゴリズムをnoneに変更して署名検証をバイパスする攻撃', TRUE, 2),
    (gen_random_uuid(), q_id, 'ペイロードに大量のデータを含めてサーバーを過負荷にする攻撃', FALSE, 3),
    (gen_random_uuid(), q_id, 'トークンを複製して複数のセッションを同時に利用する攻撃', FALSE, 4);

  -- Q180: 脆弱性スキャン vs ペネトレーションテスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '脆弱性スキャンとペネトレーションテストの違いとして正しいものはどれか。', '脆弱性スキャンは自動ツールで既知の脆弱性を検出し、ペネトレーションテストは専門家が実際に攻撃を試みて脆弱性の悪用可能性を検証します。', 1, 180, 'hard', 'security');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '両者は同じ手法で実施される', FALSE, 1),
    (gen_random_uuid(), q_id, '脆弱性スキャンは手動、ペネトレーションテストは自動で実施される', FALSE, 2),
    (gen_random_uuid(), q_id, '脆弱性スキャンは自動検出、ペネトレーションテストは専門家が実際に攻撃を試みる', TRUE, 3),
    (gen_random_uuid(), q_id, '脆弱性スキャンはネットワーク、ペネトレーションテストはアプリのみが対象', FALSE, 4);

END $$;
