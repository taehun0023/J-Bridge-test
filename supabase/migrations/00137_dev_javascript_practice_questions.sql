-- ============================================================
-- Dev Practice Quiz: JavaScript 理解度テスト問題 (20 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000004
-- 4 topic areas × 5 questions each
-- Difficulty: easy 6, medium 10, hard 4 (30/50/20 ratio)
-- ============================================================

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000004', 'JavaScript 理解度テスト問題', 'core_programming', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: 言語基礎とランタイム動作 (DEV-JS-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): var/let/constのスコープ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'JavaScriptのlet宣言の特徴として正しいものはどれですか？',
  'multiple_choice', 'easy', 'javascript', 'concept',
  'letはブロックスコープを持ちます。if文やfor文のブロック{}内で宣言するとその中でのみ有効です。varは関数スコープのため、ブロック外からもアクセスできてしまいます。constはletと同じブロックスコープですが、再代入が不可です。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブロックスコープを持ち、宣言したブロック内でのみ有効', true, 1),
    (gen_random_uuid(), q_id, '関数スコープを持ち、関数全体で有効', false, 2),
    (gen_random_uuid(), q_id, 'グローバルスコープのみで使用可能', false, 3),
    (gen_random_uuid(), q_id, '再代入が一切できない', false, 4);

  -- T1-Q2 (easy): 暗黙的型変換
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のJavaScriptの式の結果はどれですか？ "5" + 3',
  'multiple_choice', 'easy', 'javascript', 'concept',
  'JavaScriptでは+演算子の片方が文字列の場合、もう一方も文字列に変換されて結合されます。"5" + 3 は "53"（文字列）になります。一方、"5" - 3 は数値演算となり2を返します。この暗黙的型変換はバグの原因になるため、===で厳密比較を使うことが推奨されます。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"53"（文字列結合）', true, 1),
    (gen_random_uuid(), q_id, '8（数値加算）', false, 2),
    (gen_random_uuid(), q_id, 'NaN（型不一致エラー）', false, 3),
    (gen_random_uuid(), q_id, 'TypeError（型エラー）', false, 4);

  -- T1-Q3 (medium): ホイスティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードの実行結果はどれですか？
console.log(x);
var x = 10;',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'varはホイスティングにより宣言がスコープの先頭に巻き上げられますが、値の代入は元の位置で行われます。そのため、console.logの時点ではxは宣言済みだが値は未代入のためundefinedになります。letの場合はTDZ（一時的デッドゾーン）によりReferenceErrorが発生します。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'undefined', true, 1),
    (gen_random_uuid(), q_id, '10', false, 2),
    (gen_random_uuid(), q_id, 'ReferenceError', false, 3),
    (gen_random_uuid(), q_id, 'null', false, 4);

  -- T1-Q4 (medium): constとオブジェクトの変更
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードの実行結果はどれですか？
const obj = { a: 1 };
obj.a = 2;
console.log(obj.a);',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'constは変数への再代入を防ぎますが、オブジェクトの中身（プロパティ）の変更は可能です。obj = {} は再代入なのでTypeErrorですが、obj.a = 2 はプロパティの変更なので許可されます。これはconstが参照の不変性を保証するのであって、値の不変性は保証しないためです。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2（constでもオブジェクトのプロパティは変更可能）', true, 1),
    (gen_random_uuid(), q_id, 'TypeError（constは変更不可）', false, 2),
    (gen_random_uuid(), q_id, '1（変更が無視される）', false, 3),
    (gen_random_uuid(), q_id, 'undefined', false, 4);

  -- T1-Q5 (hard): varとletのループ動作
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードで出力される値はどれですか？
for (var i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 0);
}',
  'multiple_choice', 'hard', 'javascript', 'concept',
  'varは関数スコープのため、ループ全体で1つのiを共有します。setTimeoutのコールバックが実行される時点ではループは既に完了しており、iは3になっています。letを使うとブロックスコープにより各反復で独立したiが作られるため0, 1, 2が出力されます。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3, 3, 3', true, 1),
    (gen_random_uuid(), q_id, '0, 1, 2', false, 2),
    (gen_random_uuid(), q_id, '2, 2, 2', false, 3),
    (gen_random_uuid(), q_id, 'undefined, undefined, undefined', false, 4);

  -- ============================================================
  -- Topic 2: 非同期フローとPromise (DEV-JS-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): Promiseの状態
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'Promiseが正常に完了した際の状態はどれですか？',
  'multiple_choice', 'easy', 'javascript', 'concept',
  'Promiseは3つの状態を持ちます。pending（処理中）、fulfilled（成功）、rejected（失敗）です。成功時はfulfilled状態になり、.then()で結果を受け取れます。失敗時はrejected状態になり、.catch()でエラーを処理します。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'fulfilled', true, 1),
    (gen_random_uuid(), q_id, 'resolved', false, 2),
    (gen_random_uuid(), q_id, 'completed', false, 3),
    (gen_random_uuid(), q_id, 'settled', false, 4);

  -- T2-Q2 (medium): 実行順序
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードの出力順序はどれですか？
console.log("A");
setTimeout(() => console.log("B"), 0);
Promise.resolve().then(() => console.log("C"));
console.log("D");',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'JavaScriptの実行順序は、同期コード → マイクロタスク（Promise.then） → マクロタスク（setTimeout）です。まず同期コードのA, Dが順に実行され、次にマイクロタスクのCが実行され、最後にマクロタスクのBが実行されます。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A, D, C, B', true, 1),
    (gen_random_uuid(), q_id, 'A, B, C, D', false, 2),
    (gen_random_uuid(), q_id, 'A, D, B, C', false, 3),
    (gen_random_uuid(), q_id, 'A, C, D, B', false, 4);

  -- T2-Q3 (medium): async/await
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'async関数の戻り値として正しい説明はどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'async関数は常にPromiseを返します。return 42と書いてもPromise.resolve(42)が返されます。awaitはそのPromiseが解決されるまで関数の実行を一時停止し、解決された値を取り出します。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '常にPromiseを返す', true, 1),
    (gen_random_uuid(), q_id, 'returnで指定した値をそのまま返す', false, 2),
    (gen_random_uuid(), q_id, 'undefinedを返す', false, 3),
    (gen_random_uuid(), q_id, 'コールバック関数を返す', false, 4);

  -- T2-Q4 (hard): Promise.allとPromise.allSettled
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'Promise.all([p1, p2, p3])でp2がrejectされた場合の動作はどれですか？',
  'multiple_choice', 'hard', 'javascript', 'concept',
  'Promise.allは1つでもrejectされると即座にrejectされます（fail-fast）。p1やp3の結果は無視されます。全てのPromiseの結果（成功/失敗に関わらず）を取得したい場合はPromise.allSettledを使用します。allSettledは各Promiseのstatusとvalue/reasonを含むオブジェクト配列を返します。',
  3, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '即座にrejectされ、他のPromiseの結果は無視される', true, 1),
    (gen_random_uuid(), q_id, 'p2のみスキップして、p1とp3の結果を配列で返す', false, 2),
    (gen_random_uuid(), q_id, '全てのPromiseが完了するまで待ち、エラー情報を含む配列を返す', false, 3),
    (gen_random_uuid(), q_id, 'p2を自動的にリトライする', false, 4);

  -- T2-Q5 (medium): エラーハンドリング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'async/awaitでのエラーハンドリング方法として最も一般的なものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'async/awaitではtry-catch構文でエラーを捕捉するのが最も一般的です。awaitしたPromiseがrejectされると例外がスローされ、catch節で処理できます。.then/.catchチェーンも使えますが、async/awaitではtry-catchの方が可読性が高いです。',
  2, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'try-catch構文でawaitをラップする', true, 1),
    (gen_random_uuid(), q_id, 'window.onerrorでグローバルにキャッチする', false, 2),
    (gen_random_uuid(), q_id, 'if文でnullチェックする', false, 3),
    (gen_random_uuid(), q_id, 'async関数内では例外は発生しない', false, 4);

  -- ============================================================
  -- Topic 3: DOM・イベント・ブラウザ動作 (DEV-JS-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): textContentとinnerHTML
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'ユーザー入力をDOM要素に表示する際、XSSを防ぐために使用すべきプロパティはどれですか？',
  'multiple_choice', 'easy', 'javascript', 'concept',
  'textContentはテキストとしてそのまま表示し、HTMLタグは解釈しません。innerHTMLはHTMLとして解釈するため、ユーザー入力に<script>タグが含まれている場合にXSS（クロスサイトスクリプティング）攻撃のリスクがあります。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'textContent', true, 1),
    (gen_random_uuid(), q_id, 'innerHTML', false, 2),
    (gen_random_uuid(), q_id, 'outerHTML', false, 3),
    (gen_random_uuid(), q_id, 'innerText', false, 4);

  -- T3-Q2 (medium): イベント伝播
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'DOMイベントのバブリングフェーズの説明として正しいものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'イベント伝播は3段階あります。キャプチャリング（上→下）、ターゲット（イベント発生要素）、バブリング（下→上）です。バブリングでは、クリックされた子要素から親要素へとイベントが伝わります。これを利用したイベント委譲パターンが効率的です。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'イベントが発生した要素から親要素へ向かって伝播する', true, 1),
    (gen_random_uuid(), q_id, 'イベントが親要素から発生した要素へ向かって伝播する', false, 2),
    (gen_random_uuid(), q_id, 'イベントが発生した要素でのみ処理される', false, 3),
    (gen_random_uuid(), q_id, 'イベントが全ての兄弟要素に伝播する', false, 4);

  -- T3-Q3 (medium): e.targetとe.currentTarget
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '親要素にイベントリスナーを設定し、子要素をクリックした場合、e.targetとe.currentTargetの値はどうなりますか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'e.targetは実際にクリックされた要素（子要素）を指し、e.currentTargetはイベントリスナーが設定された要素（親要素）を指します。イベント委譲パターンでは、e.targetを確認して実際にクリックされた要素を特定します。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'e.target=子要素、e.currentTarget=親要素', true, 1),
    (gen_random_uuid(), q_id, 'e.target=親要素、e.currentTarget=子要素', false, 2),
    (gen_random_uuid(), q_id, '両方とも親要素', false, 3),
    (gen_random_uuid(), q_id, '両方とも子要素', false, 4);

  -- T3-Q4 (medium): イベント委譲
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'イベント委譲（Event Delegation）の利点として最も適切なものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'イベント委譲は親要素にリスナーを1つ設定し、バブリングを利用して子要素のイベントを処理するパターンです。動的に追加された子要素も自動的にイベント処理の対象になるのが最大の利点です。各要素に個別リスナーを設定する必要がありません。',
  2, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '動的に追加された要素も自動的にイベント処理の対象になる', true, 1),
    (gen_random_uuid(), q_id, 'イベントの伝播速度が向上する', false, 2),
    (gen_random_uuid(), q_id, 'CSSセレクタによる要素選択が高速化される', false, 3),
    (gen_random_uuid(), q_id, 'ブラウザのメモリ使用量が0になる', false, 4);

  -- T3-Q5 (hard): querySelectorAllの戻り値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'document.querySelectorAll(".item")の戻り値に対してArray.from()を使用する理由はどれですか？',
  'multiple_choice', 'hard', 'javascript', 'concept',
  'querySelectorAllは静的なNodeListを返します。NodeListはforEachは使えますが、map、filter、reduceなどの配列メソッドは使用できません。Array.from()で配列に変換することで、これらのメソッドが使用可能になります。',
  3, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NodeListにはmap/filterなどの配列メソッドがないため、配列に変換する', true, 1),
    (gen_random_uuid(), q_id, 'NodeListはイミュータブルで要素の追加削除ができないため', false, 2),
    (gen_random_uuid(), q_id, 'NodeListはforEachも使用できないため', false, 3),
    (gen_random_uuid(), q_id, 'パフォーマンスの最適化のため', false, 4);

  -- ============================================================
  -- Topic 4: モジュール・スコープ・実務パターン (DEV-JS-04) — 5 questions
  -- ============================================================

  -- T4-Q1 (easy): ESモジュールとCommonJS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'ES Modulesのimport/exportの特徴として正しいものはどれですか？',
  'multiple_choice', 'easy', 'javascript', 'concept',
  'ES Modules（ESM）のimport/exportは静的解析が可能で、ファイルの先頭（トップレベル）でのみ使用できます。これによりツリーシェイキング（未使用コードの除去）が可能です。CommonJSのrequire()は動的で、条件分岐の中でも呼び出せます。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '静的解析が可能で、トップレベルでのみ使用できる', true, 1),
    (gen_random_uuid(), q_id, '条件分岐の中でも動的にインポートできる', false, 2),
    (gen_random_uuid(), q_id, 'Node.js専用の構文である', false, 3),
    (gen_random_uuid(), q_id, 'デフォルトエクスポートは使用できない', false, 4);

  -- T4-Q2 (medium): クロージャ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードでcounter()を3回呼び出した場合の戻り値はどれですか？
function makeCounter() {
  let count = 0;
  return function() { return ++count; };
}
const counter = makeCounter();',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'クロージャは定義されたスコープの変数への参照を保持します。makeCounter()が返す関数はcount変数への参照を保持しており、呼び出すたびにcountが増加します。counter()を3回呼ぶと1, 2, 3が順に返されます。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1, 2, 3（countが保持され増加し続ける）', true, 1),
    (gen_random_uuid(), q_id, '1, 1, 1（毎回countが0にリセットされる）', false, 2),
    (gen_random_uuid(), q_id, 'undefined, undefined, undefined', false, 3),
    (gen_random_uuid(), q_id, 'ReferenceError（countにアクセスできない）', false, 4);

  -- T4-Q3 (medium): thisバインディング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'アロー関数のthisに関する説明として正しいものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'アロー関数は独自のthisを持たず、定義された場所のthis（レキシカルthis）を引き継ぎます。通常の関数は呼び出し方によってthisが変わりますが、アロー関数ではbind/call/applyでもthisを変更できません。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '定義された場所のthisを引き継ぎ、bind/call/applyでも変更できない', true, 1),
    (gen_random_uuid(), q_id, '常にグローバルオブジェクト（window）を参照する', false, 2),
    (gen_random_uuid(), q_id, '呼び出し元のオブジェクトをthisとして参照する', false, 3),
    (gen_random_uuid(), q_id, 'thisはundefinedになる', false, 4);

  -- T4-Q4 (hard): setTimeoutとthis
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  '次のコードでsetTimeout内のthis.nameはどうなりますか？
const user = {
  name: "太郎",
  greet() {
    setTimeout(function() {
      console.log(this.name);
    }, 100);
  }
};
user.greet();',
  'multiple_choice', 'hard', 'javascript', 'concept',
  'setTimeoutに渡した通常の関数はデフォルトバインディングでthisがグローバルオブジェクト（ブラウザではwindow）になります。window.nameはデフォルトで空文字列です。アロー関数を使うかbindを使えば、user.greet()のthis（userオブジェクト）を保持できます。',
  3, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'undefined または空文字列（thisがグローバルを指す）', true, 1),
    (gen_random_uuid(), q_id, '"太郎"（userオブジェクトのname）', false, 2),
    (gen_random_uuid(), q_id, 'TypeError（thisがnull）', false, 3),
    (gen_random_uuid(), q_id, 'ReferenceError（nameが未定義）', false, 4);

  -- T4-Q5 (medium): thisの4つのルール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000004',
  'JavaScriptのthisバインディングルールのうち、最も優先されるものはどれですか？',
  'multiple_choice', 'medium', 'javascript', 'concept',
  'thisの優先順位は、new > 明示的バインディング（call/apply/bind） > 暗黙的バインディング（ドットの左側） > デフォルトバインディング（関数呼び出し）です。newが最も優先されます。',
  2, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'newバインディング（コンストラクタ呼び出し）', true, 1),
    (gen_random_uuid(), q_id, '明示的バインディング（call/apply/bind）', false, 2),
    (gen_random_uuid(), q_id, '暗黙的バインディング（メソッド呼び出し）', false, 3),
    (gen_random_uuid(), q_id, 'デフォルトバインディング（単純呼び出し）', false, 4);

END $$;
