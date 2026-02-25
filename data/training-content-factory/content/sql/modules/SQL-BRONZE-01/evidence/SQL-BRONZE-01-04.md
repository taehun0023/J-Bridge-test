# Evidence: SQL-BRONZE-01-04

[E1] COUNT(*) はグループ内の全行数を返す。NULL を含む行もカウントされる。
[E2] COUNT(列名) は指定列が NULL でない行数を返す。COUNT(*) と結果が異なる場合がある。
[E3] SUM は指定列の合計値を返す。NULL 値は無視される。数値型以外に適用するとエラーになる。
[E4] AVG は指定列の平均値を返す。NULL 値は分母・分子の両方から除外される。
[E5] MIN / MAX は指定列の最小値・最大値を返す。数値だけでなく文字列や日付にも使える。
[E6] GROUP BY 句は指定した列の値が同じ行をグループ化し、各グループに対して集約関数を適用する。
[E7] GROUP BY を使う場合、SELECT 句には GROUP BY で指定した列か集約関数のみを記述できる。
[E8] HAVING 句は GROUP BY の結果に対する条件フィルタであり、集約関数の結果に対して条件を指定できる。
[E9] WHERE は個々の行に対するフィルタ、HAVING はグループに対するフィルタという違いがある。
[E10] SQL の論理処理順序は FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY である。
[E11] 集約関数内で DISTINCT を指定できる（例: COUNT(DISTINCT department_id)）。
[E12] GROUP BY なしで集約関数を使うと、テーブル全体が 1 つのグループとして扱われる。

## Code snippets

```sql
-- COUNT(*) と COUNT(列)
SELECT COUNT(*) AS total_rows, COUNT(email) AS has_email FROM employees;

-- SUM / AVG
SELECT SUM(salary) AS total_salary, AVG(salary) AS avg_salary FROM employees;

-- MIN / MAX
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;

-- GROUP BY
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- HAVING
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 400000;

-- COUNT(DISTINCT)
SELECT COUNT(DISTINCT department_id) AS dept_count FROM employees;

-- WHERE + GROUP BY + HAVING の組み合わせ
SELECT department_id, COUNT(*) AS emp_count
FROM employees
WHERE hire_date >= '2023-01-01'
GROUP BY department_id
HAVING COUNT(*) >= 2;
```

## Sources

- ISO/IEC 9075-1:2023 — Information technology — Database languages — SQL — Part 1: Framework
- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
