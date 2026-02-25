# Evidence: SQL-SILVER-01-04

[E1] CTE（Common Table Expression）は WITH 句を使用して定義する名前付き一時結果セットであり、直後の SELECT / INSERT / UPDATE / DELETE 文で参照できる。
[E2] CTE の基本構文は WITH cte_name AS (SELECT ...) SELECT ... FROM cte_name である。
[E3] 1つの WITH 句で複数の CTE をカンマ区切りで定義でき、後続の CTE は先に定義された CTE を参照できる。
[E4] CTE はクエリの可読性を向上させ、複雑なサブクエリをトップダウンで記述できる。FROM 句の導出テーブルと論理的には等価である。
[E5] 再帰 CTE（RECURSIVE）はアンカーメンバーとリカーシブメンバーを UNION ALL で結合し、階層データの探索やシーケンス生成に使用する。
[E6] 再帰 CTE の構文は WITH RECURSIVE cte_name AS (anchor UNION ALL recursive) SELECT ... FROM cte_name である。ANSI SQL では RECURSIVE キーワードが必要。
[E7] 再帰 CTE が無限ループに陥ることを防ぐため、リカーシブメンバーに終了条件を必ず含める必要がある。多くの DBMS は再帰回数の上限を持つ。
[E8] CTE は同一クエリ内で複数回参照できるが、サブクエリは使用するたびに記述を繰り返す必要がある。
[E9] CTE のスコープは直後の1つの SQL 文のみであり、複数の文にまたがって参照することはできない。
[E10] CTE はビューと異なり、データベースオブジェクトとして保存されず、クエリ実行時にのみ存在する。
[E11] CTE を使用した場合とサブクエリを使用した場合の実行計画は、多くの DBMS で同等だが、DBMS によっては CTE をマテリアライズ（実体化）する場合がある。
[E12] 再帰 CTE は組織図のツリー構造、部品表（BOM）、経路探索などの階層クエリに特に有用である。

## Code snippets

```sql
-- 基本的な CTE
WITH dept_salary AS (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
)
SELECT d.name, ds.avg_salary
FROM departments d
JOIN dept_salary ds ON d.id = ds.department_id;

-- 複数 CTE
WITH
  dept_count AS (
    SELECT department_id, COUNT(*) AS emp_count
    FROM employees
    GROUP BY department_id
  ),
  high_count_dept AS (
    SELECT department_id, emp_count
    FROM dept_count
    WHERE emp_count >= 5
  )
SELECT d.name, hc.emp_count
FROM departments d
JOIN high_count_dept hc ON d.id = hc.department_id;

-- 再帰 CTE（組織階層）
WITH RECURSIVE org_tree AS (
  SELECT id, name, manager_id, 1 AS level
  FROM employees
  WHERE manager_id IS NULL
  UNION ALL
  SELECT e.id, e.name, e.manager_id, ot.level + 1
  FROM employees e
  JOIN org_tree ot ON e.manager_id = ot.id
)
SELECT id, name, level FROM org_tree;

-- 再帰 CTE（連番生成）
WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 10
)
SELECT n FROM seq;
```

## Sources

- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
- Standard SQL (ISO/IEC 9075)
