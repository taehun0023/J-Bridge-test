-- ============================================================
-- Dev Practice Quiz: React 理解度テスト問題 (20 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000005
-- 4 topic areas × 5 questions each
-- Difficulty: easy 6, medium 10, hard 4 (30/50/20 ratio)
-- ============================================================

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000005', 'React 理解度テスト問題', 'framework', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: コンポーネント思考とJSX基礎 (DEV-REACT-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): JSXの特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'JSXでHTMLのclass属性を指定する場合に使用するプロパティ名はどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  'JSXはJavaScriptの拡張構文であり、classはJavaScriptの予約語のため使用できません。代わりにclassNameを使用します。同様に、for属性はhtmlForを使用します。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'className', true, 1),
    (gen_random_uuid(), q_id, 'class', false, 2),
    (gen_random_uuid(), q_id, 'cssClass', false, 3),
    (gen_random_uuid(), q_id, 'htmlClass', false, 4);

  -- T1-Q2 (easy): コンポーネント名の規則
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'Reactコンポーネントの名前を小文字で始めた場合（例: userCard）、何が起こりますか？',
  'multiple_choice', 'easy', 'react', 'concept',
  'Reactは小文字で始まる要素をHTML標準タグとして扱います。<userCard>はHTMLの未知のタグとして処理され、コンポーネントとしてレンダリングされません。コンポーネント名は必ず大文字で始める必要があります（例: UserCard）。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTML要素として扱われ、コンポーネントとしてレンダリングされない', true, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', false, 2),
    (gen_random_uuid(), q_id, '正常にコンポーネントとしてレンダリングされる', false, 3),
    (gen_random_uuid(), q_id, '自動的に大文字に変換される', false, 4);

  -- T1-Q3 (medium): keyの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'Reactでリスト要素にkey propを指定する理由はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'keyはReactが再レンダリング時にリスト要素を正しく識別するための一意な識別子です。keyがないとReactは要素の追加・削除・並び替え時に正しく対応できず、意図しない状態の保持やパフォーマンス低下が発生します。配列のindexをkeyに使うと、要素の順序変更時にバグが発生します。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '再レンダリング時に要素を正しく識別し、追加・削除・並び替えに対応するため', true, 1),
    (gen_random_uuid(), q_id, 'CSSスタイルを各要素に正しく適用するため', false, 2),
    (gen_random_uuid(), q_id, 'DOMの描画速度を向上させるため', false, 3),
    (gen_random_uuid(), q_id, 'イベントハンドラを各要素に紐付けるため', false, 4);

  -- T1-Q4 (medium): Propsの特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'ReactのPropsに関する説明として正しいものはどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'Propsは親コンポーネントから子コンポーネントへ渡される読み取り専用のデータです。子コンポーネントがPropsを直接変更することはできません。データは常に親→子の一方向に流れます。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '読み取り専用で、子コンポーネントから変更できない', true, 1),
    (gen_random_uuid(), q_id, '子コンポーネントが自由に変更できる', false, 2),
    (gen_random_uuid(), q_id, '子→親の方向にもデータを流せる', false, 3),
    (gen_random_uuid(), q_id, '文字列型のデータのみ渡せる', false, 4);

  -- T1-Q5 (hard): コンポーネント分離の判断
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'コンポーネントを分離すべきタイミングとして最も適切な判断基準はどれですか？',
  'multiple_choice', 'hard', 'react', 'concept',
  'コンポーネント分離の主な基準は「繰り返されるUIパターン」と「独立した変更領域」です。再利用性よりも可読性が重要であり、コンポーネントが約200行を超えた場合は分割を検討すべきです。ただし、過度な分割はPropsのバケツリレーを生み保守性を下げます。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UIパターンが繰り返される場合や、独立して変更される領域がある場合', true, 1),
    (gen_random_uuid(), q_id, '全ての関数を個別コンポーネントに分割する', false, 2),
    (gen_random_uuid(), q_id, 'コードが10行を超えた場合', false, 3),
    (gen_random_uuid(), q_id, 'CSSクラスの数が多い場合', false, 4);

  -- ============================================================
  -- Topic 2: State・Props・データフロー (DEV-REACT-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): useStateの基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useStateのセッター関数を呼び出した場合に起こることはどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  'useStateのセッター関数（例: setValue(newVal)）を呼ぶと、新しい値でStateが更新され、コンポーネントの再レンダリングがトリガーされます。Stateの変更がReactの再レンダリングの主要なトリガーです。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Stateが更新され、コンポーネントが再レンダリングされる', true, 1),
    (gen_random_uuid(), q_id, 'DOMが即座に更新される', false, 2),
    (gen_random_uuid(), q_id, 'ページ全体がリロードされる', false, 3),
    (gen_random_uuid(), q_id, '親コンポーネントに変更が通知される', false, 4);

  -- T2-Q2 (medium): 直接ミューテーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  '次のコードの問題点はどれですか？
const [items, setItems] = useState(["a", "b"]);
items.push("c");',
  'multiple_choice', 'medium', 'react', 'concept',
  'Stateを直接変更（ミューテーション）しても、Reactは変更を検知できず再レンダリングされません。Reactは参照の比較で変更を検知するため、新しい配列を作成する必要があります。正しくは setItems([...items, "c"]) です。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Stateを直接変更しても再レンダリングされないため、画面に反映されない', true, 1),
    (gen_random_uuid(), q_id, 'constで宣言しているためTypeErrorが発生する', false, 2),
    (gen_random_uuid(), q_id, 'pushメソッドは配列に使用できない', false, 3),
    (gen_random_uuid(), q_id, '問題なく動作し、画面に"c"が表示される', false, 4);

  -- T2-Q3 (medium): 子→親のデータフロー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  '子コンポーネントから親コンポーネントにデータを渡す方法はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'Reactのデータフローは親→子の一方向です。子から親にデータを渡すには、親がコールバック関数をPropsとして子に渡し、子がそのコールバックを呼び出してデータを引数として渡します。これがReactにおける子→親通信の標準パターンです。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '親がコールバック関数をPropsとして渡し、子がそれを呼び出す', true, 1),
    (gen_random_uuid(), q_id, '子コンポーネントが直接親のStateを変更する', false, 2),
    (gen_random_uuid(), q_id, 'グローバル変数を使って共有する', false, 3),
    (gen_random_uuid(), q_id, 'DOMイベントを発火して親に通知する', false, 4);

  -- T2-Q4 (hard): Stateのリフトアップ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'Stateのリフトアップ（持ち上げ）を行う場合のデメリットとして正しいものはどれですか？',
  'multiple_choice', 'hard', 'react', 'concept',
  'Stateを共通の親に持ち上げると、Stateが変更されるたびに親コンポーネントとその全ての子コンポーネントが再レンダリングされます。共有が不要な兄弟コンポーネントも再レンダリングの対象になるため、パフォーマンスへの影響を考慮する必要があります。',
  3, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'State変更時に全ての子コンポーネント（共有不要な兄弟含む）が再レンダリングされる', true, 1),
    (gen_random_uuid(), q_id, 'Stateの更新が非同期でなくなる', false, 2),
    (gen_random_uuid(), q_id, '子コンポーネントからStateにアクセスできなくなる', false, 3),
    (gen_random_uuid(), q_id, 'TypeScriptの型チェックが無効になる', false, 4);

  -- T2-Q5 (medium): イミュータブル更新
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'Stateのオブジェクトを更新する正しい方法はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'Reactでは新しいオブジェクトを作成して更新する必要があります。スプレッド構文で既存のプロパティをコピーし、変更したいプロパティだけ上書きすることで、イミュータブルな更新を行います。直接プロパティを変更すると参照が変わらず再レンダリングされません。',
  2, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'setUser({ ...user, name: "新しい名前" })', true, 1),
    (gen_random_uuid(), q_id, 'user.name = "新しい名前"', false, 2),
    (gen_random_uuid(), q_id, 'setUser(user.name = "新しい名前")', false, 3),
    (gen_random_uuid(), q_id, 'Object.assign(user, { name: "新しい名前" })', false, 4);

  -- ============================================================
  -- Topic 3: Hooksと副作用 (DEV-REACT-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): useEffectの依存配列
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useEffect(() => { ... }, [])の第2引数に空配列を指定した場合の動作はどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  '空の依存配列[]はマウント時（初回レンダリング後）に1回だけ実行されることを意味します。API呼び出しやイベントリスナーの登録など、初期化処理に使用します。依存配列を省略すると毎回レンダリング後に実行されます。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マウント時（初回レンダリング後）に1回だけ実行される', true, 1),
    (gen_random_uuid(), q_id, '毎回のレンダリング後に実行される', false, 2),
    (gen_random_uuid(), q_id, '一度も実行されない', false, 3),
    (gen_random_uuid(), q_id, 'コンポーネントがアンマウントされる時のみ実行される', false, 4);

  -- T3-Q2 (medium): クリーンアップ関数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useEffectのクリーンアップ関数（return () => { ... }）が実行されるタイミングはどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'クリーンアップ関数は次のEffect実行前とコンポーネントのアンマウント時に実行されます。タイマーのクリア、イベントリスナーの解除、APIリクエストのキャンセルなどのリソース解放に使用します。クリーンアップを忘れるとメモリリークが発生します。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次のEffect実行前とアンマウント時', true, 1),
    (gen_random_uuid(), q_id, 'マウント直後のみ', false, 2),
    (gen_random_uuid(), q_id, 'State変更時のみ', false, 3),
    (gen_random_uuid(), q_id, 'ブラウザのタブが閉じられる時のみ', false, 4);

  -- T3-Q3 (medium): 依存配列の不備
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useEffectの依存配列を省略した場合に発生しうる問題はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  '依存配列を省略するとEffectは毎回のレンダリング後に実行されます。API呼び出しを含むEffectの場合、State更新→再レンダリング→API呼び出し→State更新の無限ループが発生する可能性があります。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎回レンダリング後に実行され、無限ループが発生する可能性がある', true, 1),
    (gen_random_uuid(), q_id, 'Effectが一度も実行されない', false, 2),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', false, 3),
    (gen_random_uuid(), q_id, 'パフォーマンスが向上する', false, 4);

  -- T3-Q4 (hard): useEffectでのasync
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useEffect内で非同期処理を行う正しい方法はどれですか？',
  'multiple_choice', 'hard', 'react', 'concept',
  'useEffectのコールバック関数自体をasyncにすることはできません。asyncはPromiseを返しますが、useEffectはクリーンアップ関数またはundefinedの返却を期待しているためです。内部でasync関数を定義して即座に呼び出すパターンを使います。',
  3, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Effect内部でasync関数を定義し、それを呼び出す', true, 1),
    (gen_random_uuid(), q_id, 'useEffect(async () => { ... }, [])', false, 2),
    (gen_random_uuid(), q_id, 'useAsyncEffect()フックを使用する', false, 3),
    (gen_random_uuid(), q_id, 'awaitをuseEffectの外側で使用する', false, 4);

  -- T3-Q5 (hard): レースコンディション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useEffect内でAPIを呼び出す際のレースコンディションを防ぐ方法はどれですか？',
  'multiple_choice', 'hard', 'react', 'concept',
  'クリーンアップ関数でcancelledフラグを設定し、APIレスポンス受信時にフラグを確認します。依存値が素早く変わるとEffect1→Effect2の順で呼ばれますが、レスポンスがEffect2→Effect1の順で返ることがあり、古い結果が新しい結果を上書きするのを防ぎます。',
  3, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クリーンアップでcancelledフラグを設定し、レスポンス受信時に確認する', true, 1),
    (gen_random_uuid(), q_id, 'APIリクエストにタイムアウトを設定する', false, 2),
    (gen_random_uuid(), q_id, 'リクエストをキューに入れて順番に処理する', false, 3),
    (gen_random_uuid(), q_id, 'レースコンディションはReactでは発生しない', false, 4);

  -- ============================================================
  -- Topic 4: レンダリング動作とパフォーマンス (DEV-REACT-04) — 5 questions
  -- ============================================================

  -- T4-Q1 (easy): 再レンダリングの条件
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'Reactコンポーネントが再レンダリングされる条件として正しいものはどれですか？',
  'multiple_choice', 'easy', 'react', 'concept',
  '再レンダリングは主に3つの条件で発生します。(1)自身のStateが変更された時、(2)親コンポーネントが再レンダリングされた時、(3)Contextの値が変更された時です。Propsが変更されなくても、親が再レンダリングされると子も再レンダリングされます。',
  1, 16, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自身のState変更、親の再レンダリング、Context変更のいずれか', true, 1),
    (gen_random_uuid(), q_id, 'Propsが変更された時のみ', false, 2),
    (gen_random_uuid(), q_id, 'setStateが呼ばれた時のみ', false, 3),
    (gen_random_uuid(), q_id, 'DOMに変更がある時のみ', false, 4);

  -- T4-Q2 (medium): React.memo
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'React.memoの動作として正しいものはどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'React.memoはコンポーネントをラップし、Propsが変更されていない場合に再レンダリングをスキップします。比較は浅い等価性（シャロー・イコーリティ）で行われるため、オブジェクトや配列のPropsは毎回新しい参照が作られると効果がありません。',
  2, 17, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Propsが浅い比較で変更されていない場合、再レンダリングをスキップする', true, 1),
    (gen_random_uuid(), q_id, 'コンポーネントのメモリ使用量を削減する', false, 2),
    (gen_random_uuid(), q_id, 'Stateの変更も含めて全ての再レンダリングを防止する', false, 3),
    (gen_random_uuid(), q_id, 'コンポーネントを一度だけレンダリングしてキャッシュする', false, 4);

  -- T4-Q3 (medium): useMemo
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useMemoの主な用途はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'useMemoは計算結果をメモ化し、依存配列が変更されない限り再計算を防ぎます。重い計算（大量データのフィルタリング・ソート等）や、オブジェクト参照の安定化（React.memoと組み合わせて使用）に有効です。',
  2, 18, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '計算結果のメモ化と、オブジェクト参照の安定化', true, 1),
    (gen_random_uuid(), q_id, 'APIレスポンスのキャッシュ', false, 2),
    (gen_random_uuid(), q_id, 'コンポーネントのマウント回数の制限', false, 3),
    (gen_random_uuid(), q_id, 'DOMの直接操作の最適化', false, 4);

  -- T4-Q4 (medium): useCallbackの必要性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'useCallbackが効果を発揮するために同時に必要な条件はどれですか？',
  'multiple_choice', 'medium', 'react', 'concept',
  'useCallbackは関数の参照を安定化させますが、受け取る子コンポーネントがReact.memoでラップされていないと意味がありません。memoなしでは親の再レンダリングで子も必ず再レンダリングされるため、関数参照が安定していても効果がありません。',
  2, 19, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '子コンポーネントがReact.memoでラップされていること', true, 1),
    (gen_random_uuid(), q_id, '関数がasyncであること', false, 2),
    (gen_random_uuid(), q_id, '依存配列が空であること', false, 3),
    (gen_random_uuid(), q_id, 'Stateを使用していないこと', false, 4);

  -- T4-Q5 (hard): インラインオブジェクトの問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000005',
  'React.memoでラップされた子コンポーネントに<Child style={{color: "red"}} />のようにインラインオブジェクトを渡した場合の問題はどれですか？',
  'multiple_choice', 'hard', 'react', 'concept',
  'インラインオブジェクトは毎回のレンダリングで新しい参照が作成されるため、React.memoの浅い比較では常に「変更あり」と判定されます。memoの最適化効果が無効化され、毎回再レンダリングされます。useMemoで参照を安定化させる必要があります。',
  3, 20, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎回新しい参照が作られるため、memoの最適化が無効化される', true, 1),
    (gen_random_uuid(), q_id, 'TypeScriptの型チェックでエラーが発生する', false, 2),
    (gen_random_uuid(), q_id, 'パフォーマンスが向上する', false, 3),
    (gen_random_uuid(), q_id, 'CSSスタイルが適用されない', false, 4);

END $$;
