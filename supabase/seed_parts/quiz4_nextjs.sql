-- ============================================
-- Quiz 4 追加: Next.js App Router 問題 (30 questions)
-- Category: nextjs
-- sort_order: 361-390
-- Concept (361-375): easy 5, medium 7, hard 3
-- Code Reading (376-390): easy 4, medium 8, hard 3
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- =============================================
  -- CONCEPT questions (question_subtype='concept')
  -- sort_order: 361-375
  -- =============================================

  -- ===== nextjs concept - EASY (5) =====

  -- Q361: App Router構造
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerにおいて、URLパス /about に対応するファイルはどれか。', 'App Routerではapp/ディレクトリ内のフォルダ構造がURLパスに対応する。/aboutにアクセスするにはapp/about/page.tsxファイルが必要である。', 1, 361, 'easy', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'pages/about.tsx', FALSE, 1),
    (gen_random_uuid(), q_id, 'app/about/page.tsx', TRUE, 2),
    (gen_random_uuid(), q_id, 'app/about.tsx', FALSE, 3),
    (gen_random_uuid(), q_id, 'app/about/index.tsx', FALSE, 4);

  -- Q362: Server Components vs Client Components
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerにおけるデフォルトのコンポーネント種別はどれか。', 'App Routerでは、すべてのコンポーネントはデフォルトでServer Componentとして扱われる。Client Componentにするには明示的に''use client''ディレクティブを宣言する必要がある。', 1, 362, 'easy', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Client Component', FALSE, 1),
    (gen_random_uuid(), q_id, 'Server Component', TRUE, 2),
    (gen_random_uuid(), q_id, 'Shared Component', FALSE, 3),
    (gen_random_uuid(), q_id, 'Static Component', FALSE, 4);

  -- Q363: 'use client'ディレクティブ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '''use client''ディレクティブの役割として正しいものはどれか。', '''use client''はファイルの先頭に記述し、そのファイルとそこからインポートされるモジュールをClient Componentとして扱うことを宣言する。useStateやonClickなどブラウザAPIを使う場合に必要となる。', 1, 363, 'easy', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーサイドでのみ実行されることを宣言する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クライアントサイドのインタラクティブ機能を使うことを宣言する', TRUE, 2),
    (gen_random_uuid(), q_id, 'SSRを無効にすることを宣言する', FALSE, 3),
    (gen_random_uuid(), q_id, 'TypeScriptの型チェックを有効にする', FALSE, 4);

  -- Q364: page.tsxとlayout.tsxの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'App Routerにおけるlayout.tsxの特徴として正しいものはどれか。', 'layout.tsxは子ルート間で共有されるUIを定義する。ページ遷移時にlayoutは再レンダリングされず状態が保持される。childrenプロップで子ページを受け取る。', 1, 364, 'easy', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ページ遷移のたびに再マウントされる', FALSE, 1),
    (gen_random_uuid(), q_id, 'APIエンドポイントを定義する', FALSE, 2),
    (gen_random_uuid(), q_id, '子ルート間で共有されるUIを定義し、状態が保持される', TRUE, 3),
    (gen_random_uuid(), q_id, 'エラーハンドリング専用のコンポーネントである', FALSE, 4);

  -- Q365: 動的ルート[slug]
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerで動的ルートを定義する正しいフォルダ名はどれか。', '動的ルートはフォルダ名を角括弧で囲んで定義する。例えばapp/blog/[slug]/page.tsxは/blog/任意の値というURLパターンにマッチする。', 1, 365, 'easy', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'app/blog/:slug/page.tsx', FALSE, 1),
    (gen_random_uuid(), q_id, 'app/blog/{slug}/page.tsx', FALSE, 2),
    (gen_random_uuid(), q_id, 'app/blog/[slug]/page.tsx', TRUE, 3),
    (gen_random_uuid(), q_id, 'app/blog/$slug/page.tsx', FALSE, 4);

  -- ===== nextjs concept - MEDIUM (7) =====

  -- Q366: loading.tsxとerror.tsx
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'App Routerのloading.tsxについて正しい説明はどれか。', 'loading.tsxはReact Suspenseを利用して、page.tsxの読み込み中に自動的に表示されるフォールバックUIである。同階層のpage.tsxをSuspenseバウンダリで自動的にラップする。', 1, 366, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントサイドのJavaScript読み込み完了を待つファイルである', FALSE, 1),
    (gen_random_uuid(), q_id, 'React Suspenseを利用したフォールバックUIを自動で提供する', TRUE, 2),
    (gen_random_uuid(), q_id, 'エラー発生時のフォールバックUIを定義するファイルである', FALSE, 3),
    (gen_random_uuid(), q_id, '静的アセットのプリロードを制御するファイルである', FALSE, 4);

  -- Q367: Server Actions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js Server Actionsについて正しい説明はどれか。', 'Server Actionsは''use server''ディレクティブで定義され、サーバー上で実行される非同期関数である。formのaction属性やClient Componentから直接呼び出せ、APIルートを別途作成する必要がない。', 1, 367, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアントサイドで実行されるフォーム処理関数である', FALSE, 1),
    (gen_random_uuid(), q_id, '''use server''で定義し、サーバー上で実行される非同期関数である', TRUE, 2),
    (gen_random_uuid(), q_id, 'getServerSidePropsの後継機能である', FALSE, 3),
    (gen_random_uuid(), q_id, 'ミドルウェアで実行されるアクション関数である', FALSE, 4);

  -- Q368: fetch+cache（データフェッチ）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App RouterのServer Componentでのデータフェッチについて正しいものはどれか。', 'Server Componentでは直接awaitを使ってデータフェッチできる。Next.jsはfetch APIを拡張しており、cache/revalidateオプションで自動的にキャッシュ制御が可能である。', 1, 368, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Server ComponentではuseEffectを使ってデータを取得する', FALSE, 1),
    (gen_random_uuid(), q_id, 'Server Componentで直接awaitを使いfetchでデータ取得できる', TRUE, 2),
    (gen_random_uuid(), q_id, 'データフェッチは必ずRoute Handlerを経由する必要がある', FALSE, 3),
    (gen_random_uuid(), q_id, 'Server Componentではデータフェッチできない', FALSE, 4);

  -- Q369: Metadata API
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerでページのメタデータ（title, description等）を設定する方法として推奨されるものはどれか。', 'App Routerではpage.tsxやlayout.tsxからmetadataオブジェクトまたはgenerateMetadata関数をエクスポートすることで、型安全にメタデータを設定できる。', 1, 369, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'next/headコンポーネントを使用する', FALSE, 1),
    (gen_random_uuid(), q_id, 'metadataオブジェクトまたはgenerateMetadata関数をエクスポートする', TRUE, 2),
    (gen_random_uuid(), q_id, 'document.titleを直接操作する', FALSE, 3),
    (gen_random_uuid(), q_id, 'next.config.jsで全ページ共通のメタデータを定義する', FALSE, 4);

  -- Q370: middleware
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.jsのmiddleware.tsの配置場所と実行タイミングとして正しいものはどれか。', 'middleware.tsはプロジェクトのルート（またはsrc/）に1つだけ配置し、リクエストが完了する前に実行される。認証チェックやリダイレクト、ヘッダー書き換えなどに利用する。', 1, 370, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各ルートフォルダに配置し、該当パスのリクエスト後に実行される', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトルートに1つ配置し、リクエスト完了前に実行される', TRUE, 2),
    (gen_random_uuid(), q_id, 'app/api/内に配置し、APIリクエスト時のみ実行される', FALSE, 3),
    (gen_random_uuid(), q_id, 'next.config.js内で定義し、ビルド時に実行される', FALSE, 4);

  -- Q371: next/image
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'next/imageのImageコンポーネントが提供する最適化機能として正しくないものはどれか。', 'next/imageは自動的にWebP/AVIF変換、遅延読み込み、レスポンシブサイズ最適化を行う。しかしSVGファイルの自動ラスタライズは行わない。SVGはそのまま提供される。', 1, 371, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自動的にWebP/AVIF形式に変換する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ビューポート外の画像を遅延読み込みする', FALSE, 2),
    (gen_random_uuid(), q_id, 'SVGファイルを自動的にラスタライズ変換する', TRUE, 3),
    (gen_random_uuid(), q_id, 'デバイスに応じた適切なサイズの画像を提供する', FALSE, 4);

  -- Q372: 環境変数NEXT_PUBLIC_
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.jsの環境変数でNEXT_PUBLIC_プレフィックスが付いた変数の特徴はどれか。', 'NEXT_PUBLIC_プレフィックス付きの環境変数はビルド時にインライン化され、ブラウザに送信されるJavaScriptバンドルに含まれる。プレフィックスなしの変数はサーバーサイドでのみアクセス可能。', 1, 372, 'medium', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーサイドでのみ参照可能な変数である', FALSE, 1),
    (gen_random_uuid(), q_id, 'ブラウザ側のJavaScriptからもアクセス可能になる', TRUE, 2),
    (gen_random_uuid(), q_id, '本番環境でのみ有効になる変数である', FALSE, 3),
    (gen_random_uuid(), q_id, 'パブリックフォルダのパスを指定する変数である', FALSE, 4);

  -- ===== nextjs concept - HARD (3) =====

  -- Q373: ISR（Incremental Static Regeneration）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'App RouterでISR（Incremental Static Regeneration）を実現するために、fetchオプションに指定するものはどれか。', 'App Routerでは、fetch関数のnext.revalidateオプションに秒数を指定することでISRを実現する。指定した秒数が経過すると、次のリクエスト時にバックグラウンドで再生成が行われる。', 1, 373, 'hard', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'cache: ''force-cache''', FALSE, 1),
    (gen_random_uuid(), q_id, 'next: { revalidate: 秒数 }', TRUE, 2),
    (gen_random_uuid(), q_id, 'mode: ''isr''', FALSE, 3),
    (gen_random_uuid(), q_id, 'stale-while-revalidate: 秒数', FALSE, 4);

  -- Q374: Parallel Routes と Intercepting Routes
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'App RouterのParallel Routesを定義する際に使用するフォルダ命名規則はどれか。', 'Parallel Routesは@で始まる名前付きスロット（例: @modal, @sidebar）を使って定義する。layoutのpropsとしてスロットを受け取り、同一レイアウト内で複数のページを同時にレンダリングできる。', 1, 374, 'hard', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '(groupName)フォルダを使用する', FALSE, 1),
    (gen_random_uuid(), q_id, '[...slot]フォルダを使用する', FALSE, 2),
    (gen_random_uuid(), q_id, '@slotNameフォルダを使用する', TRUE, 3),
    (gen_random_uuid(), q_id, '_parallelフォルダを使用する', FALSE, 4);

  -- Q375: Route Handlers
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'App RouterのRoute Handler（route.ts）について正しい説明はどれか。', 'Route Handlerはapp/ディレクトリ内のroute.tsファイルで定義する。Web標準のRequest/Responseオブジェクトを使用し、同一フォルダにpage.tsxとroute.tsを共存させることはできない。', 1, 375, 'hard', 'nextjs', 'concept', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'page.tsxと同じフォルダ内に配置して共存できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'Express.jsと同じreq/resオブジェクトを使用する', FALSE, 2),
    (gen_random_uuid(), q_id, 'Web標準のRequest/Responseを使い、page.tsxとは同一フォルダに共存不可', TRUE, 3),
    (gen_random_uuid(), q_id, 'Server Actionsの内部で自動的に生成される', FALSE, 4);

  -- =============================================
  -- CODE READING questions (question_subtype='code_reading')
  -- sort_order: 376-390
  -- =============================================

  -- ===== nextjs code_reading - EASY (4) =====

  -- Q376: page.tsxレンダリング結果
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のServer Componentがレンダリングする内容はどれか。\n\n// app/page.tsx\nexport default function Home() {\n  const title = "Welcome";\n  return (\n    <main>\n      <h1>{title}</h1>\n      <p>Next.js App Router</p>\n    </main>\n  );\n}', 'Server Componentは通常のReactコンポーネントと同様にJSXをレンダリングする。titleに"Welcome"が代入されており、<h1>Welcome</h1>と<p>Next.js App Router</p>が表示される。', 1, 376, 'easy', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<h1>{title}</h1>と<p>Next.js App Router</p>がそのまま表示される', FALSE, 1),
    (gen_random_uuid(), q_id, '<h1>Welcome</h1>と<p>Next.js App Router</p>が表示される', TRUE, 2),
    (gen_random_uuid(), q_id, 'Server Componentなので何も表示されない', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイルエラーが発生する', FALSE, 4);

  -- Q377: layout.tsxネスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のlayout.tsxが/dashboard/settingsにアクセスした時に生成するHTML構造はどれか。\n\n// app/layout.tsx\nexport default function RootLayout({ children }) {\n  return <html><body><nav>Global</nav>{children}</body></html>;\n}\n\n// app/dashboard/layout.tsx\nexport default function DashboardLayout({ children }) {\n  return <div><aside>Sidebar</aside><main>{children}</main></div>;\n}\n\n// app/dashboard/settings/page.tsx\nexport default function Settings() {\n  return <h1>Settings</h1>;\n}', 'App Routerではlayoutがネストされる。RootLayoutのchildren内にDashboardLayoutが入り、そのchildren内にSettingsページが入る。結果、Global → Sidebar → Settingsの順で表示される。', 1, 377, 'easy', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Global → Settings のみ（Sidebarは表示されない）', FALSE, 1),
    (gen_random_uuid(), q_id, 'Global → Sidebar → Settings の順で表示される', TRUE, 2),
    (gen_random_uuid(), q_id, 'Sidebar → Settings のみ（Globalは上書きされる）', FALSE, 3),
    (gen_random_uuid(), q_id, 'Settings のみ表示される', FALSE, 4);

  -- Q378: 'use client'+useState
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコンポーネントの初回レンダリング時に表示される内容はどれか。\n\n''use client'';\nimport { useState } from ''react'';\n\nexport default function Counter() {\n  const [count, setCount] = useState(0);\n  return (\n    <div>\n      <p>Count: {count}</p>\n      <button onClick={() => setCount(count + 1)}>+1</button>\n    </div>\n  );\n}', '''use client''によりClient Componentとなり、useStateが使用可能になる。初期値は0なので、初回レンダリング時には「Count: 0」と「+1」ボタンが表示される。', 1, 378, 'easy', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Count: 0 と +1ボタンが表示される', TRUE, 1),
    (gen_random_uuid(), q_id, 'Count: 1 と +1ボタンが表示される', FALSE, 2),
    (gen_random_uuid(), q_id, 'Server Componentエラーが発生する', FALSE, 3),
    (gen_random_uuid(), q_id, '何も表示されない', FALSE, 4);

  -- Q379: dynamic route params
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '/blog/hello-worldにアクセスした時、次のコンポーネントが表示する内容はどれか。\n\n// app/blog/[slug]/page.tsx\nexport default async function BlogPost(\n  { params }: { params: Promise<{ slug: string }> }\n) {\n  const { slug } = await params;\n  return <h1>Post: {slug}</h1>;\n}', '動的ルート[slug]はURLのその部分をパラメータとして受け取る。/blog/hello-worldの場合、slug="hello-world"となり、「Post: hello-world」が表示される。', 1, 379, 'easy', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Post: [slug]', FALSE, 1),
    (gen_random_uuid(), q_id, 'Post: hello-world', TRUE, 2),
    (gen_random_uuid(), q_id, 'Post: undefined', FALSE, 3),
    (gen_random_uuid(), q_id, 'Post: blog', FALSE, 4);

  -- ===== nextjs code_reading - MEDIUM (8) =====

  -- Q380: Server Componentデータフェッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のServer Componentの動作について正しいものはどれか。\n\n// app/users/page.tsx\nasync function getUsers() {\n  const res = await fetch(''https://api.example.com/users'', {\n    next: { revalidate: 3600 }\n  });\n  return res.json();\n}\n\nexport default async function UsersPage() {\n  const users = await getUsers();\n  return <ul>{users.map(u => <li key={u.id}>{u.name}</li>)}</ul>;\n}', 'Server Componentでは直接asyncにしてawaitでデータを取得できる。next: { revalidate: 3600 }はISRの設定で、3600秒（1時間）ごとにキャッシュが再検証される。', 1, 380, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアント側でfetchが実行され、3600msのタイムアウトが設定される', FALSE, 1),
    (gen_random_uuid(), q_id, 'サーバー側でデータ取得し、1時間ごとにキャッシュが再検証される', TRUE, 2),
    (gen_random_uuid(), q_id, 'ビルド時に一度だけデータ取得され、以降は更新されない', FALSE, 3),
    (gen_random_uuid(), q_id, 'リクエストのたびにデータ取得が行われる（キャッシュなし）', FALSE, 4);

  -- Q381: Server Action form
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードでフォーム送信時に実行されるのはどこか。\n\n// app/actions.ts\n''use server'';\nexport async function createPost(formData: FormData) {\n  const title = formData.get(''title'');\n  // DB保存処理\n}\n\n// app/new/page.tsx\nimport { createPost } from ''../actions'';\nexport default function NewPost() {\n  return (\n    <form action={createPost}>\n      <input name="title" />\n      <button type="submit">送信</button>\n    </form>\n  );\n}', '''use server''で定義されたcreatePost関数はServer Actionであり、フォーム送信時にサーバー上で実行される。FormDataオブジェクトが自動的に引数として渡される。', 1, 381, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブラウザ上でcreatePost関数が実行される', FALSE, 1),
    (gen_random_uuid(), q_id, 'サーバー上でcreatePostが実行され、FormDataが引数として渡される', TRUE, 2),
    (gen_random_uuid(), q_id, 'API Route /api/createPostが自動生成されて呼び出される', FALSE, 3),
    (gen_random_uuid(), q_id, 'エラーになる（formのactionに関数は指定できない）', FALSE, 4);

  -- Q382: generateStaticParams
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のコードの効果として正しいものはどれか。\n\n// app/blog/[slug]/page.tsx\nexport async function generateStaticParams() {\n  const posts = await fetch(''https://api.example.com/posts'').then(r => r.json());\n  return posts.map((post) => ({ slug: post.slug }));\n}\n\nexport default async function Post({ params }) {\n  const { slug } = await params;\n  return <h1>{slug}</h1>;\n}', 'generateStaticParamsは動的ルートのパラメータを事前に生成する関数である。ビルド時にAPIから取得したpost一覧のslugに基づいて静的ページが生成される。', 1, 382, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト時にスラグをバリデーションする', FALSE, 1),
    (gen_random_uuid(), q_id, 'ビルド時にpost一覧のslugに基づいて静的ページを事前生成する', TRUE, 2),
    (gen_random_uuid(), q_id, 'ランタイムにslugパラメータのデフォルト値を設定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー起動時にルートテーブルを動的に生成する', FALSE, 4);

  -- Q383: middleware redirect
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のmiddlewareの動作として正しいものはどれか。\n\n// middleware.ts\nimport { NextResponse } from ''next/server'';\nimport type { NextRequest } from ''next/server'';\n\nexport function middleware(request: NextRequest) {\n  const token = request.cookies.get(''session'');\n  if (!token && request.nextUrl.pathname.startsWith(''/dashboard'')) {\n    return NextResponse.redirect(new URL(''/login'', request.url));\n  }\n  return NextResponse.next();\n}\n\nexport const config = {\n  matcher: [''/dashboard/:path*'']\n};', 'このmiddlewareはsessionクッキーがない状態で/dashboard以下にアクセスすると/loginにリダイレクトする。matcherにより/dashboard以下のパスでのみ実行される。', 1, 383, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全ページでsessionクッキーの有無をチェックする', FALSE, 1),
    (gen_random_uuid(), q_id, '/dashboard以下にsessionなしでアクセスすると/loginにリダイレクトする', TRUE, 2),
    (gen_random_uuid(), q_id, '/loginにアクセスするとsessionクッキーを自動生成する', FALSE, 3),
    (gen_random_uuid(), q_id, 'sessionクッキーがあると/dashboardへのアクセスを拒否する', FALSE, 4);

  -- Q384: loading表示タイミング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のファイル構成で/dashboardにアクセスした時の動作として正しいものはどれか。\n\n// app/dashboard/loading.tsx\nexport default function Loading() {\n  return <p>読み込み中...</p>;\n}\n\n// app/dashboard/page.tsx\nexport default async function Dashboard() {\n  const data = await fetch(''https://api.example.com/slow'', {\n    cache: ''no-store''\n  }).then(r => r.json());\n  return <div>{data.message}</div>;\n}', 'loading.tsxはpage.tsxをSuspenseで自動的にラップする。page.tsxのasyncデータフェッチが完了するまで「読み込み中...」が表示され、完了後にpage.tsxの内容に置き換わる。', 1, 384, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データ取得完了まで白い画面が表示される', FALSE, 1),
    (gen_random_uuid(), q_id, '「読み込み中...」が表示された後、データ取得完了で内容に切り替わる', TRUE, 2),
    (gen_random_uuid(), q_id, '「読み込み中...」とデータが同時に表示される', FALSE, 3),
    (gen_random_uuid(), q_id, 'loading.tsxはClient Componentでないと動作しない', FALSE, 4);

  -- Q385: searchParams取得
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '/search?q=nextjsにアクセスした時、次のコンポーネントが表示する内容はどれか。\n\n// app/search/page.tsx\nexport default async function SearchPage(\n  { searchParams }: { searchParams: Promise<{ q?: string }> }\n) {\n  const { q } = await searchParams;\n  return <h1>検索: {q ?? "キーワードなし"}</h1>;\n}', 'App RouterではsearchParamsプロップでクエリパラメータを受け取れる。?q=nextjsの場合、qに"nextjs"が入り、「検索: nextjs」が表示される。', 1, 385, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '検索: キーワードなし', FALSE, 1),
    (gen_random_uuid(), q_id, '検索: nextjs', TRUE, 2),
    (gen_random_uuid(), q_id, '検索: undefined', FALSE, 3),
    (gen_random_uuid(), q_id, '検索: ?q=nextjs', FALSE, 4);

  -- Q386: error ErrorBoundary
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のerror.tsxの動作について正しいものはどれか。\n\n''use client'';\nexport default function Error({\n  error,\n  reset,\n}: {\n  error: Error & { digest?: string };\n  reset: () => void;\n}) {\n  return (\n    <div>\n      <h2>エラーが発生しました</h2>\n      <p>{error.message}</p>\n      <button onClick={() => reset()}>再試行</button>\n    </div>\n  );\n}', 'error.tsxはReact Error Boundaryとして機能する。同階層のpage.tsxでエラーが発生するとこのコンポーネントが表示される。''use client''が必須で、reset()で再レンダリングを試みることができる。', 1, 386, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Server Componentとして動作し、エラーログをサーバーに送信する', FALSE, 1),
    (gen_random_uuid(), q_id, 'Client Componentとしてエラーを表示し、reset()で再レンダリングを試みる', TRUE, 2),
    (gen_random_uuid(), q_id, 'layout.tsxのエラーもキャッチする', FALSE, 3),
    (gen_random_uuid(), q_id, '''use client''なしでも正常に動作する', FALSE, 4);

  -- Q387: next/image props
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のImageコンポーネントの動作として正しいものはどれか。\n\nimport Image from ''next/image'';\n\nexport default function Avatar() {\n  return (\n    <Image\n      src="/avatar.png"\n      alt="User avatar"\n      width={100}\n      height={100}\n      priority\n    />\n  );\n}', 'priorityプロップを指定すると、画像のプリロードが有効になり遅延読み込み（lazy loading）が無効化される。LCP（Largest Contentful Paint）に影響する重要な画像に使用する。', 1, 387, 'medium', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'priorityにより画像品質が最大化される', FALSE, 1),
    (gen_random_uuid(), q_id, 'priorityによりプリロードが有効化され、遅延読み込みが無効になる', TRUE, 2),
    (gen_random_uuid(), q_id, 'ローカル画像なのでwidthとheightの指定は不要である', FALSE, 3),
    (gen_random_uuid(), q_id, 'priorityは非推奨のプロパティでありエラーになる', FALSE, 4);

  -- ===== nextjs code_reading - HARD (3) =====

  -- Q388: revalidatePath/Tag
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のServer Actionでフォーム送信後に起こる動作として正しいものはどれか。\n\n''use server'';\nimport { revalidatePath } from ''next/cache'';\n\nexport async function addComment(formData: FormData) {\n  const body = formData.get(''body'') as string;\n  await db.comments.create({ data: { body } });\n  revalidatePath(''/blog/[slug]'', ''page'');\n}', 'revalidatePath(''/blog/[slug]'', ''page'')は/blog/以下の全動的ルートページのキャッシュを無効化する。第2引数''page''でpage.tsxのキャッシュのみを対象とし、layoutのキャッシュは保持される。', 1, 388, 'hard', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '/blog/[slug]というリテラルパスのキャッシュのみ無効化される', FALSE, 1),
    (gen_random_uuid(), q_id, '/blog/以下の全動的ルートのpageキャッシュが無効化される', TRUE, 2),
    (gen_random_uuid(), q_id, 'アプリケーション全体のキャッシュが無効化される', FALSE, 3),
    (gen_random_uuid(), q_id, 'クライアント側のブラウザキャッシュが削除される', FALSE, 4);

  -- Q389: cookies()/headers()
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のServer Componentの動作について正しいものはどれか。\n\nimport { cookies, headers } from ''next/headers'';\n\nexport default async function Page() {\n  const cookieStore = await cookies();\n  const theme = cookieStore.get(''theme'')?.value ?? ''light'';\n  const headersList = await headers();\n  const ua = headersList.get(''user-agent'') ?? ''unknown'';\n  return (\n    <div>\n      <p>Theme: {theme}</p>\n      <p>UA: {ua.substring(0, 20)}</p>\n    </div>\n  );\n}', 'cookies()とheaders()はServer Componentで使用でき、リクエストのクッキーとヘッダーを読み取る。これらを使用するとページは動的レンダリングとなり、静的生成されない。', 1, 389, 'hard', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'cookies()とheaders()はClient Componentでのみ使用可能である', FALSE, 1),
    (gen_random_uuid(), q_id, 'ページは静的生成される（ビルド時にクッキーが確定する）', FALSE, 2),
    (gen_random_uuid(), q_id, 'リクエストのクッキーとヘッダーを読み取り、動的レンダリングとなる', TRUE, 3),
    (gen_random_uuid(), q_id, 'cookies()はServer Actionでのみ使用可能である', FALSE, 4);

  -- Q390: Route Handler GET/POST
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, question_subtype, is_published)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '次のRoute Handlerに対してPOSTリクエストを送った時の動作として正しいものはどれか。\n\n// app/api/items/route.ts\nimport { NextResponse } from ''next/server'';\n\nconst items: string[] = [];\n\nexport async function GET() {\n  return NextResponse.json(items);\n}\n\nexport async function POST(request: Request) {\n  const { name } = await request.json();\n  items.push(name);\n  return NextResponse.json(\n    { message: ''作成しました'' },\n    { status: 201 }\n  );\n}', 'HTTPメソッドに対応する名前の関数をエクスポートすることでRoute Handlerが定義される。POSTリクエスト時はPOST関数が呼ばれ、request.json()でボディを取得し、ステータス201で応答する。ただしモジュールレベルの変数itemsはサーバーレスでリクエスト間の永続性が保証されない点に注意。', 1, 390, 'hard', 'nextjs', 'code_reading', true);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET関数が呼ばれ、空配列が返される', FALSE, 1),
    (gen_random_uuid(), q_id, 'POST関数が呼ばれ、ステータス201で{ message: ''作成しました'' }が返される', TRUE, 2),
    (gen_random_uuid(), q_id, '405 Method Not Allowedが返される', FALSE, 3),
    (gen_random_uuid(), q_id, 'GETとPOSTの両方が順番に実行される', FALSE, 4);

END $$;
