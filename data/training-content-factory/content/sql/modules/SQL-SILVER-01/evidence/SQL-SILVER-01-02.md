# Evidence: SQL-SILVER-01-02

[E1] サブクエリ（副問合せ）とは、別の SQL 文の内部に入れ子として記述される SELECT 文のことである。
[E2] スカラーサブクエリは単一の値（1行1列）を返すサブクエリであり、SELECT 句や WHERE 句の比較演算子の右辺で使用できる。
[E3] 行サブクエリは単一行（複数列）を返し、行コンストラクタとの比較に使用できる（例: WHERE (col1, col2) = (SELECT ...)）。
[E4] テーブルサブクエリ（導出テーブル / derived table）は複数行・複数列を返し、FROM 句で仮想テーブルとして使用する。FROM 句で使用する場合、必ず別名を付ける必要がある。
[E5] EXISTS は相関サブクエリと組み合わせて使用し、サブクエリが1行以上返す場合に TRUE を返す。NOT EXISTS はサブクエリが0行の場合に TRUE を返す。
[E6] 相関サブクエリ（correlated subquery）は外側のクエリの値を参照するサブクエリであり、外側の各行ごとに評価される。
[E7] IN 演算子はサブクエリの結果セットに値が含まれるかを判定する。NOT IN は含まれないかを判定するが、NULL が混在すると予期しない結果になる場合がある。
[E8] NOT IN のサブクエリ結果に NULL が含まれると、比較結果が UNKNOWN となり行が返されない。安全のため NOT EXISTS を使用するのが推奨される。
[E9] スカラーサブクエリが複数行を返すとランタイムエラーとなる。確実に1行だけ返すことを保証する必要がある。
[E10] サブクエリは WHERE 句、FROM 句、SELECT 句、HAVING 句のいずれでも使用可能である。
[E11] 非相関サブクエリは外側のクエリに依存せず、一度だけ評価されるため、一般に相関サブクエリより効率的である。
[E12] ANY / ALL 演算子はサブクエリの結果と比較演算子を組み合わせ、いずれかの値（ANY）またはすべての値（ALL）に対して条件を満たすかを判定する。

## Code snippets

```sql
-- スカラーサブクエリ（WHERE 句）
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- スカラーサブクエリ（SELECT 句）
SELECT name,
       salary,
       salary - (SELECT AVG(salary) FROM employees) AS diff_from_avg
FROM employees;

-- テーブルサブクエリ（FROM 句・導出テーブル）
SELECT dept_avg.department_id, dept_avg.avg_salary
FROM (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avg
WHERE dept_avg.avg_salary > 50000;

-- IN サブクエリ
SELECT name FROM employees
WHERE department_id IN (SELECT id FROM departments WHERE location = 'Tokyo');

-- EXISTS（相関サブクエリ）
SELECT d.name
FROM departments d
WHERE EXISTS (
  SELECT 1 FROM employees e WHERE e.department_id = d.id
);

-- NOT EXISTS
SELECT d.name
FROM departments d
WHERE NOT EXISTS (
  SELECT 1 FROM employees e WHERE e.department_id = d.id
);

-- ANY / ALL
SELECT name, salary FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 2);
```

## Sources

- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
- Standard SQL (ISO/IEC 9075)
