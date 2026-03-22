-- ============================================================
-- Dev Practice Quiz: Next.js 理解度テスト問題 (15 questions)
-- Source quiz for pool quiz e0000001-0000-0000-0000-000000000009
-- 3 topic areas × 5 questions each
-- Difficulty: easy 5, medium 7, hard 3 (33/47/20 ratio)
-- ============================================================

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('e1000001-0000-0000-0000-000000000009', 'Next.js 理解度テスト問題', 'framework', 70, NULL, false, false, NULL)
ON CONFLICT (id) DO NOTHING;

DO $$
DECLARE q_id UUID;
BEGIN

  -- ============================================================
  -- Topic 1: App Routerの構造とファイル規約 (DEV-NEXT-01) — 5 questions
  -- ============================================================

  -- T1-Q1 (easy): ファイルベースルーティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.js App Routerで app/blog/[slug]/page.tsx を作成した場合、対応するURLはどれですか？',
  'multiple_choice', 'easy', 'nextjs', 'concept',
  'App Routerではフォルダ構造がそのままURLパスになります。[slug]は動的セグメントで、任意の値を受け取れます。page.tsxファイルがあるフォルダのみがURLとしてアクセス可能になります。',
  1, 1, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/blog/任意の値（例: /blog/hello-world）', true, 1),
    (gen_random_uuid(), q_id, '/blog/slug', false, 2),
    (gen_random_uuid(), q_id, '/blog/[slug]', false, 3),
    (gen_random_uuid(), q_id, '/app/blog/[slug]', false, 4);

  -- T1-Q2 (easy): ルートグループ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.jsのルートグループ (auth) の特徴はどれですか？',
  'multiple_choice', 'easy', 'nextjs', 'concept',
  '丸括弧で囲んだフォルダはルートグループとして扱われ、URLパスには含まれません。(auth)/login/page.tsxは/loginでアクセスできます。ルートグループはフォルダの整理やレイアウトの分離に使用します。',
  1, 2, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URLパスに影響せず、フォルダの整理やレイアウト分離に使用する', true, 1),
    (gen_random_uuid(), q_id, 'URLパスに含まれ、/auth/loginのようになる', false, 2),
    (gen_random_uuid(), q_id, '認証が必要なルートを自動的に保護する', false, 3),
    (gen_random_uuid(), q_id, 'APIルート専用のフォルダを作成する', false, 4);

  -- T1-Q3 (medium): 特殊ファイル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.js App Routerのlayout.tsxの特徴として正しいものはどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'layout.tsxは共有レイアウトを定義し、自身のフォルダとその全ての子孫ページに適用されます。親のlayoutは子のlayoutをラップする入れ子構造になります。ルートのapp/layout.tsxは全ページに適用される最上位レイアウトです。',
  2, 3, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自身のフォルダと全ての子孫ページに適用される共有レイアウト', true, 1),
    (gen_random_uuid(), q_id, '同じフォルダのpage.tsxにのみ適用される', false, 2),
    (gen_random_uuid(), q_id, 'CSSスタイルシートを読み込むための特殊ファイル', false, 3),
    (gen_random_uuid(), q_id, 'ページ遷移時のアニメーションを定義するファイル', false, 4);

  -- T1-Q4 (medium): page.tsxの必要性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'App Routerで app/settings/ フォルダにlayout.tsxのみがありpage.tsxがない場合、/settingsにアクセスするとどうなりますか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'page.tsxファイルがないフォルダはURLとしてアクセスできません。/settingsにアクセスすると404エラーが返されます。layout.tsxはUIの共有構造を定義するだけで、ルートとして機能するにはpage.tsxが必要です。',
  2, 4, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '404エラー（page.tsxがないとURLにアクセスできない）', true, 1),
    (gen_random_uuid(), q_id, 'layout.tsxの内容が表示される', false, 2),
    (gen_random_uuid(), q_id, '空白ページが表示される', false, 3),
    (gen_random_uuid(), q_id, '親フォルダのpage.tsxにリダイレクトされる', false, 4);

  -- T1-Q5 (hard): 動的パラメータ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.js 15以降のApp Routerでpage.tsxのparamsを使用する正しい方法はどれですか？',
  'multiple_choice', 'hard', 'nextjs', 'concept',
  'Next.js 15以降ではparamsはPromiseとして渡されるため、使用前にawaitで解決する必要があります。以前のバージョンでは直接オブジェクトとしてアクセスできましたが、非同期化されました。',
  3, 5, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'const { slug } = await params のようにawaitで解決してから使用する', true, 1),
    (gen_random_uuid(), q_id, 'params.slugで直接アクセスする', false, 2),
    (gen_random_uuid(), q_id, 'useParams()フックで取得する', false, 3),
    (gen_random_uuid(), q_id, 'getServerSideProps()で取得する', false, 4);

  -- ============================================================
  -- Topic 2: ServerとClientコンポーネントの境界 (DEV-NEXT-02) — 5 questions
  -- ============================================================

  -- T2-Q1 (easy): デフォルトのコンポーネント種別
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.js App Routerでコンポーネントに何も指定しない場合、どのタイプとして扱われますか？',
  'multiple_choice', 'easy', 'nextjs', 'concept',
  'App Routerではデフォルトで全てのコンポーネントがサーバーコンポーネントとして扱われます。クライアントコンポーネントにするには、ファイルの先頭に"use client"ディレクティブを追加する必要があります。',
  1, 6, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーコンポーネント', true, 1),
    (gen_random_uuid(), q_id, 'クライアントコンポーネント', false, 2),
    (gen_random_uuid(), q_id, '共有コンポーネント（両方で動作）', false, 3),
    (gen_random_uuid(), q_id, 'スタティックコンポーネント', false, 4);

  -- T2-Q2 (medium): use clientの影響範囲
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  '"use client"ディレクティブの影響範囲として正しいものはどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  '"use client"はそのファイルとそこからimportされた全てのモジュールをクライアントコンポーネントとして扱います。兄弟ファイルや親コンポーネントには影響しません。境界はできるだけリーフ（末端）に近い位置に置くのがベストプラクティスです。',
  2, 7, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そのファイルとimportされた全てのモジュールがクライアントになる', true, 1),
    (gen_random_uuid(), q_id, 'そのファイルのみがクライアントになる', false, 2),
    (gen_random_uuid(), q_id, 'プロジェクト全体がクライアントレンダリングになる', false, 3),
    (gen_random_uuid(), q_id, 'そのファイルと兄弟ファイル全てがクライアントになる', false, 4);

  -- T2-Q3 (medium): サーバーコンポーネントの制限
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'サーバーコンポーネントで使用できないものはどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'サーバーコンポーネントはサーバー上で実行されるため、ブラウザAPIやReact Hooks（useState, useEffect等）、イベントハンドラ（onClick等）は使用できません。代わりにDB直接アクセス、ファイルI/O、async/awaitが使えます。',
  2, 8, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'useState, useEffect, onClickなどのHooksやイベントハンドラ', true, 1),
    (gen_random_uuid(), q_id, 'データベースへの直接クエリ', false, 2),
    (gen_random_uuid(), q_id, 'async/awaitによる非同期処理', false, 3),
    (gen_random_uuid(), q_id, 'サーバー環境変数へのアクセス', false, 4);

  -- T2-Q4 (hard): シリアライゼーション
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'サーバーコンポーネントからクライアントコンポーネントにPropsとして渡せないものはどれですか？',
  'multiple_choice', 'hard', 'nextjs', 'concept',
  'サーバー→クライアントの境界ではデータがシリアライズ（JSON化）されて転送されます。関数、クラスインスタンス、Symbolなどシリアライズできないデータは渡せません。文字列、数値、オブジェクト、配列などJSON互換のデータは渡せます。',
  3, 9, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数（シリアライズできないため）', true, 1),
    (gen_random_uuid(), q_id, '文字列', false, 2),
    (gen_random_uuid(), q_id, 'オブジェクト（{}）', false, 3),
    (gen_random_uuid(), q_id, '配列', false, 4);

  -- T2-Q5 (medium): サーバーコンポーネントの渡し方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'クライアントコンポーネント内でサーバーコンポーネントを使用する方法はどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'クライアントコンポーネント内でサーバーコンポーネントを直接importして使うことはできません。代わりに、親のサーバーコンポーネントでchildrenやslot propsとしてJSXを渡すパターンを使います。サーバー側でレンダリングされたHTMLがクライアントに渡されます。',
  2, 10, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'children propとしてJSX要素を渡す', true, 1),
    (gen_random_uuid(), q_id, 'クライアントコンポーネント内で直接importする', false, 2),
    (gen_random_uuid(), q_id, 'useServerComponent()フックで取得する', false, 3),
    (gen_random_uuid(), q_id, 'サーバーコンポーネントをクライアントで使うことはできない', false, 4);

  -- ============================================================
  -- Topic 3: データフェッチ・キャッシュ・プロジェクト構成 (DEV-NEXT-03) — 5 questions
  -- ============================================================

  -- T3-Q1 (easy): サーバーコンポーネントのデータ取得
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.jsのサーバーコンポーネントでデータを取得する方法として最も適切なものはどれですか？',
  'multiple_choice', 'easy', 'nextjs', 'concept',
  'サーバーコンポーネントはasync関数として定義でき、コンポーネント内で直接fetchやDBクエリを実行できます。別途APIルートを作成する必要はありません。これによりデータ取得と表示を1つのコンポーネントで完結できます。',
  1, 11, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'asyncコンポーネント内で直接fetchやDBクエリを実行する', true, 1),
    (gen_random_uuid(), q_id, 'useEffect内でfetchを呼び出す', false, 2),
    (gen_random_uuid(), q_id, 'getServerSidePropsを定義する', false, 3),
    (gen_random_uuid(), q_id, '必ずAPIルートを経由してデータを取得する', false, 4);

  -- T3-Q2 (medium): 並列フェッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  '複数の独立したデータ取得を行う場合のベストプラクティスはどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  '独立した複数のfetch/クエリはPromise.allで並列実行すべきです。逐次実行（ウォーターフォール）すると各リクエストが前のリクエストの完了を待つため、合計時間が長くなります。依存関係がない場合は並列が最適です。',
  2, 12, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Promise.allで並列に実行する', true, 1),
    (gen_random_uuid(), q_id, 'awaitで1つずつ順番に実行する', false, 2),
    (gen_random_uuid(), q_id, 'setTimeoutで時間差をつけて実行する', false, 3),
    (gen_random_uuid(), q_id, 'useEffectで個別にフェッチする', false, 4);

  -- T3-Q3 (medium): 動的レンダリングのトリガー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.jsで静的レンダリングから動的レンダリングに自動切替されるケースはどれですか？',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'cookies()やheaders()などリクエスト時にしか確定しない値を使用すると、Next.jsは自動的に動的レンダリングに切り替えます。searchParamsの使用やcache: "no-store"のfetchも同様です。これらがない場合はデフォルトで静的レンダリング（ビルド時生成）になります。',
  2, 13, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'cookies()、headers()、searchParamsの使用', true, 1),
    (gen_random_uuid(), q_id, 'useStateの使用', false, 2),
    (gen_random_uuid(), q_id, 'CSSモジュールの使用', false, 3),
    (gen_random_uuid(), q_id, 'TypeScriptの型定義の使用', false, 4);

  -- T3-Q4 (hard): revalidate
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  'Next.jsのデータキャッシュでrevalidateを設定しない場合のデフォルト動作はどれですか？',
  'multiple_choice', 'hard', 'nextjs', 'concept',
  'Next.jsのfetchはデフォルトでキャッシュされ（Data Cache）、revalidateを明示しないと自動更新されません。つまりビルド時のデータが永続的にキャッシュされます。最新データが必要な場合はrevalidate秒数の指定、revalidatePath/Tagの使用、またはcache: "no-store"の設定が必要です。',
  3, 14, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャッシュが永続化され、自動的には更新されない', true, 1),
    (gen_random_uuid(), q_id, '60秒ごとに自動更新される', false, 2),
    (gen_random_uuid(), q_id, 'キャッシュされず、毎回新しいデータを取得する', false, 3),
    (gen_random_uuid(), q_id, 'ページアクセス時に毎回再検証される', false, 4);

  -- T3-Q5 (medium): ウォーターフォール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, points, sort_order, is_published)
  VALUES (q_id, 'e1000001-0000-0000-0000-000000000009',
  '次のコードの問題点はどれですか？
const users = await fetchUsers();
const posts = await fetchPosts();
const comments = await fetchComments();',
  'multiple_choice', 'medium', 'nextjs', 'concept',
  'この書き方ではfetchUsers→fetchPosts→fetchCommentsが順番に実行され、合計時間は3つの合計になります（ウォーターフォール）。3つのリクエストは独立しているため、Promise.allで並列実行すれば最も遅いリクエストの時間で完了できます。',
  2, 15, true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '逐次実行（ウォーターフォール）になり、不必要に遅くなる', true, 1),
    (gen_random_uuid(), q_id, '3つのリクエストが並列に実行される', false, 2),
    (gen_random_uuid(), q_id, 'awaitを3回使うとメモリリークが発生する', false, 3),
    (gen_random_uuid(), q_id, 'サーバーコンポーネントではawaitを連続使用できない', false, 4);

END $$;
