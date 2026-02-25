# Evidence: SQL-BRONZE-01-03

[E1] ORDER BY 句は SELECT 文の結果セットを指定した列の値に基づいてソートする。デフォルトは ASC（昇順）。
[E2] DESC キーワードを指定すると降順にソートされる。ASC と DESC は列ごとに個別指定可能。
[E3] ORDER BY に複数列を指定すると、第 1 ソートキーが同値の場合に第 2 ソートキーで並べ替える。
[E4] ORDER BY は列名、列の位置番号（1 始まり）、または列別名で指定できる。
[E5] NULL 値のソート順は DBMS により異なるが、ANSI SQL では NULLS FIRST / NULLS LAST で制御可能。
[E6] LIMIT 句は結果セットの最大行数を制限する。広く使われるが ANSI SQL 標準ではない。
[E7] OFFSET 句は結果セットの先頭から指定した行数をスキップする。LIMIT と組み合わせてページングを実現する。
[E8] ANSI SQL 標準のページング構文は FETCH FIRST N ROWS ONLY（OFFSET M ROWS FETCH FIRST N ROWS ONLY）。
[E9] ORDER BY なしの LIMIT/OFFSET は結果の順序が不定であり、ページングとして正しく機能しない可能性がある。
[E10] OFFSET が大きくなるほどパフォーマンスが低下する傾向がある（DBMS は内部的に OFFSET + LIMIT 行を処理する）。
[E11] ORDER BY 句は SQL の論理処理順序において最後（SELECT の後）に評価される。
[E12] 列の位置番号指定（ORDER BY 1, 2）は保守性の観点から列名指定が推奨される。

## Code snippets

```sql
-- 昇順ソート（ASC は省略可能）
SELECT * FROM employees ORDER BY salary ASC;

-- 降順ソート
SELECT * FROM employees ORDER BY salary DESC;

-- 複数列ソート
SELECT * FROM employees ORDER BY department_id ASC, salary DESC;

-- LIMIT（非標準だが広く普及）
SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

-- OFFSET + LIMIT（ページング）
SELECT * FROM employees ORDER BY salary DESC LIMIT 10 OFFSET 20;

-- ANSI SQL 標準構文
SELECT * FROM employees
ORDER BY salary DESC
OFFSET 20 ROWS FETCH FIRST 10 ROWS ONLY;

-- NULLS LAST
SELECT * FROM employees ORDER BY email NULLS LAST;
```

## Sources

- ISO/IEC 9075-1:2023 — Information technology — Database languages — SQL — Part 1: Framework
- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
