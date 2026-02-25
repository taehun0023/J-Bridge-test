# Evidence: SQL-BRONZE-01-02

[E1] WHERE 句は FROM 句の後に記述し、行の抽出条件を指定する。条件が TRUE の行のみが結果セットに含まれる。
[E2] 比較演算子 = は等値比較、<> は非等値比較を行う（!= は多くの DBMS で使えるが ANSI SQL 標準は <>）。
[E3] >, <, >=, <= は数値・日付・文字列に対して大小比較を行う。文字列の比較順序は照合順序（collation）に依存する。
[E4] BETWEEN A AND B は A 以上 B 以下（A <= x <= B）の範囲検索を行い、境界値を含む。
[E5] IN (値リスト) は複数の等値条件を OR で繋いだものと等価であり、可読性を高める。
[E6] LIKE 演算子はパターンマッチングに使い、% は 0 文字以上の任意文字列、_ は 1 文字の任意文字を表す。
[E7] IS NULL / IS NOT NULL は NULL 値の判定に使う。= NULL は正しくなく、常に UNKNOWN を返す。
[E8] AND は両方の条件が TRUE の場合に TRUE を返し、OR はいずれかが TRUE なら TRUE を返す。
[E9] NOT は条件の真偽を反転させる。NOT IN, NOT LIKE, NOT BETWEEN などの形式でも使える。
[E10] WHERE 句の条件評価順序は NOT > AND > OR であり、意図と異なる結果を防ぐために括弧を使うべきである。
[E11] SQL の三値論理では、NULL を含む比較は TRUE でも FALSE でもなく UNKNOWN となる。
[E12] WHERE 句はインデックスの利用有無に影響するため、パフォーマンスにとって重要な句である。

## Code snippets

```sql
-- 等値比較
SELECT * FROM employees WHERE department_id = 1;

-- 非等値比較
SELECT * FROM employees WHERE department_id <> 1;

-- 範囲指定（BETWEEN）
SELECT * FROM employees WHERE salary BETWEEN 300000 AND 500000;

-- IN リスト
SELECT * FROM employees WHERE department_id IN (1, 2, 3);

-- LIKE パターンマッチング
SELECT * FROM employees WHERE name LIKE '田%';

-- IS NULL / IS NOT NULL
SELECT * FROM employees WHERE email IS NULL;
SELECT * FROM employees WHERE email IS NOT NULL;

-- AND / OR / NOT と括弧
SELECT * FROM employees
WHERE (department_id = 1 OR department_id = 2)
  AND salary >= 400000;

-- NOT IN
SELECT * FROM employees WHERE department_id NOT IN (4, 5);
```

## Sources

- ISO/IEC 9075-1:2023 — Information technology — Database languages — SQL — Part 1: Framework
- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
