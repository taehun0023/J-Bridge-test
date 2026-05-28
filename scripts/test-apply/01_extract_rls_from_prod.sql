-- ============================================================
-- 01_extract_rls_from_prod.sql
-- ============================================================
-- 用途: 本番 (PROD / wxhyczlwdmeelcshqgci) の Supabase Dashboard SQL Editor で実行
-- 目的: PROD の現在の RLS 状態 (有効化テーブル + ポリシー定義) を
--       test DB に再現するための SQL 文字列を1カラムにまとめて出力する
-- 使い方:
--   1. PROD Dashboard → SQL Editor で本ファイル全体を実行
--   2. 結果カラム "sql" をすべて選択してコピー
--   3. 02_apply_rls_to_test.sql の指定箇所に貼り付け
--   4. 02_apply_rls_to_test.sql を test Dashboard → SQL Editor で実行
-- 対象スキーマ: public, storage
--   (auth / realtime / extensions などは Supabase managed なので除外)
-- ============================================================

WITH
-- ============================================
-- (1) RLS 有効化テーブル一覧
--     pg_class.relrowsecurity = true のテーブルを抽出
-- ============================================
rls_enabled_tables AS (
  SELECT
    n.nspname AS schemaname,
    c.relname AS tablename
  FROM pg_class c
  JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE c.relkind = 'r'                       -- 普通のテーブルのみ
    AND c.relrowsecurity = true               -- RLS 有効
    AND n.nspname IN ('public', 'storage')
),
-- ============================================
-- (2) ポリシー一覧
--     pg_policies ビューから全項目を取得
-- ============================================
policies AS (
  SELECT
    schemaname,
    tablename,
    policyname,
    permissive,                                -- PERMISSIVE / RESTRICTIVE
    cmd,                                       -- SELECT / INSERT / UPDATE / DELETE / ALL
    array_to_string(roles, ', ') AS roles_str, -- {authenticated, anon} → "authenticated, anon"
    qual,                                      -- USING 条件式 (NULL の場合あり)
    with_check                                 -- WITH CHECK 条件式 (NULL の場合あり)
  FROM pg_policies
  WHERE schemaname IN ('public', 'storage')
),
-- ============================================
-- (3) 出力用 SQL 文字列を組み立て
-- ============================================
output_sql AS (
  -- (3-a) セクションヘッダ: RLS 有効化
  SELECT
    1 AS section,
    0 AS sort_key,
    '-- ============================================' AS sql
  UNION ALL
  SELECT 1, 1, '-- (A) RLS 有効化 (' || count(*)::text || ' tables)'
    FROM rls_enabled_tables
  UNION ALL
  SELECT 1, 2, '-- ============================================'
  UNION ALL
  -- (3-b) ALTER TABLE ... ENABLE ROW LEVEL SECURITY
  SELECT
    1,
    10,
    'ALTER TABLE ' || quote_ident(schemaname) || '.' || quote_ident(tablename)
      || ' ENABLE ROW LEVEL SECURITY;'
  FROM rls_enabled_tables

  UNION ALL

  -- (3-c) セクションヘッダ: ポリシー削除 (冪等)
  SELECT 2, 0, ''
  UNION ALL
  SELECT 2, 1, '-- ============================================'
  UNION ALL
  SELECT 2, 2, '-- (B) 既存ポリシー削除 (DROP IF EXISTS / 冪等)'
  UNION ALL
  SELECT 2, 3, '-- ============================================'
  UNION ALL
  SELECT
    2,
    10,
    'DROP POLICY IF EXISTS ' || quote_ident(policyname)
      || ' ON ' || quote_ident(schemaname) || '.' || quote_ident(tablename) || ';'
  FROM policies

  UNION ALL

  -- (3-d) セクションヘッダ: ポリシー作成
  SELECT 3, 0, ''
  UNION ALL
  SELECT 3, 1, '-- ============================================'
  UNION ALL
  SELECT 3, 2, '-- (C) ポリシー作成 (' || count(*)::text || ' policies)'
    FROM policies
  UNION ALL
  SELECT 3, 3, '-- ============================================'
  UNION ALL
  -- (3-e) CREATE POLICY 本体
  --       PERMISSIVE はデフォルトなので省略、RESTRICTIVE のみ明示
  SELECT
    3,
    10,
    'CREATE POLICY ' || quote_ident(policyname)
      || ' ON ' || quote_ident(schemaname) || '.' || quote_ident(tablename)
      || CASE WHEN permissive = 'RESTRICTIVE' THEN ' AS RESTRICTIVE' ELSE '' END
      || ' FOR ' || cmd
      || ' TO ' || roles_str
      || CASE WHEN qual IS NOT NULL       THEN ' USING (' || qual || ')'           ELSE '' END
      || CASE WHEN with_check IS NOT NULL THEN ' WITH CHECK (' || with_check || ')' ELSE '' END
      || ';'
  FROM policies
)
SELECT sql
FROM output_sql
ORDER BY section, sort_key, sql;
