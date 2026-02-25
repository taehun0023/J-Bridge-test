# Evidence: SQL-SILVER-01-01

[E1] GROUP BY 句は SELECT 文の FROM / WHERE の後に記述し、指定した列の値が同じ行をグループにまとめる。
[E2] GROUP BY に複数列を指定すると、すべての列の値の組み合わせごとにグループが作られる。
[E3] GROUP BY を使用する場合、SELECT 句には GROUP BY に指定した列か集約関数（COUNT, SUM, AVG, MIN, MAX）のみ記述できる（ANSI SQL 準拠）。
[E4] HAVING 句は GROUP BY によって生成されたグループに対して条件を指定し、条件を満たさないグループを除外する。
[E5] WHERE 句は個々の行に対するフィルタであり、HAVING 句はグループに対するフィルタである。WHERE は GROUP BY より前に、HAVING は GROUP BY より後に評価される。
[E6] HAVING 句には集約関数を含む条件を記述できるが、WHERE 句には集約関数を直接記述できない。
[E7] SQL の論理的な評価順序は FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY である。
[E8] GROUP BY と JOIN を組み合わせることで、結合後のデータに対してグループ集計が可能となる。
[E9] COUNT(*) はグループ内の全行数を返し、COUNT(列名) はその列が NULL でない行の数を返す。
[E10] GROUP BY で集約した結果に ORDER BY を適用することで、集計結果を任意の順序でソートできる。
[E11] HAVING COUNT(*) >= N のように HAVING で集約関数の結果に条件を付けるパターンは頻出である。
[E12] GROUP BY ROLLUP や GROUP BY CUBE は ANSI SQL の拡張であり、小計や総計を自動生成できるが、DBMS によりサポート状況が異なる。

## Code snippets

```sql
-- 単一列 GROUP BY
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id;

-- 複数列 GROUP BY
SELECT department_id, status, COUNT(*) AS cnt
FROM orders
GROUP BY department_id, status;

-- HAVING で集約条件
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- WHERE + GROUP BY + HAVING
SELECT department_id, SUM(salary) AS total_salary
FROM employees
WHERE hire_date >= '2023-01-01'
GROUP BY department_id
HAVING SUM(salary) > 100000;

-- GROUP BY + JOIN
SELECT d.name, COUNT(e.id) AS emp_count
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.name;
```

## Sources

- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
- Standard SQL (ISO/IEC 9075)
