# Lab: SQL-SILVER-01-04 — CTE と WITH 句

## セットアップ

以下の SQL を実行してテーブルとデータを準備する。

```sql
CREATE TABLE departments (
    id    INT PRIMARY KEY,
    name  VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id            INT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    manager_id    INT,
    salary        INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

INSERT INTO departments (id, name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR');

INSERT INTO employees (id, name, department_id, manager_id, salary) VALUES
(1,  'Tanaka',    1, NULL, 800000),
(2,  'Sato',      1, 1,    600000),
(3,  'Suzuki',    2, 1,    550000),
(4,  'Yamada',    1, 2,    450000),
(5,  'Ito',       2, 3,    400000),
(6,  'Watanabe',  3, 1,    500000),
(7,  'Nakamura',  1, 2,    420000),
(8,  'Kobayashi', 2, 3,    380000),
(9,  'Kato',      3, 6,    350000),
(10, 'Yoshida',   1, 4,    300000);
```

---

## 演習 1: 基本的な CTE

CTE を使用して、部門ごとの平均給与を計算し、平均給与が 450000 を超える部門の名前と平均給与を表示せよ。

**期待される出力列:** `dept_name`, `avg_salary`

| dept_name   | avg_salary |
|-------------|------------|
| Engineering | 514000     |
| HR          | 425000     |

※ avg_salary は RDBMS によって端数処理が異なる場合がある。

<details>
<summary>ヒント</summary>

WITH 句で部門ごとの平均給与を計算する CTE を定義し、メインクエリで departments テーブルと JOIN して部門名を取得する。WHERE で平均給与の条件を指定する。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.name AS dept_name, da.avg_salary
FROM departments d
JOIN dept_avg da ON d.id = da.department_id
WHERE da.avg_salary > 450000
ORDER BY da.avg_salary DESC;
```

CTE `dept_avg` で部門ごとの平均給与を算出し、メインクエリで departments テーブルと結合して部門名を表示している。

</details>

---

## 演習 2: 複数 CTE の定義

2つの CTE を使用して、以下を求めよ。
1. 部門ごとの従業員数を集計する CTE `dept_count`
2. `dept_count` を参照し、従業員数が 3 人以上の部門のみ抽出する CTE `large_dept`

最終的に部門名と従業員数を表示せよ。

**期待される出力列:** `dept_name`, `emp_count`

| dept_name   | emp_count |
|-------------|-----------|
| Engineering | 5         |
| Sales       | 3         |

<details>
<summary>ヒント</summary>

WITH キーワードは最初に1回だけ書き、2つの CTE をカンマで区切る。2番目の CTE `large_dept` は1番目の CTE `dept_count` を FROM 句で参照する。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH
  dept_count AS (
    SELECT department_id, COUNT(*) AS emp_count
    FROM employees
    GROUP BY department_id
  ),
  large_dept AS (
    SELECT department_id, emp_count
    FROM dept_count
    WHERE emp_count >= 3
  )
SELECT d.name AS dept_name, ld.emp_count
FROM departments d
JOIN large_dept ld ON d.id = ld.department_id
ORDER BY ld.emp_count DESC;
```

`dept_count` で部門ごとの人数を計算し、`large_dept` でその結果から 3 人以上の部門に絞り込んでいる。WITH は1回だけ書き、CTE 間はカンマで区切る。

</details>

---

## 演習 3: CTE の複数回参照

CTE を1つ定義し、同一クエリ内で2回参照して、全社の従業員数合計と平均給与を1行で表示せよ。

**期待される出力列:** `total_employees`, `company_avg_salary`

| total_employees | company_avg_salary |
|-----------------|-------------------|
| 10              | 475000            |

<details>
<summary>ヒント</summary>

部門ごとの集計を行う CTE を定義し、メインクエリのスカラーサブクエリで同じ CTE を2回参照する。SUM で従業員数の合計、AVG で平均給与を求める。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH dept_stats AS (
    SELECT department_id,
           COUNT(*) AS emp_count,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    (SELECT SUM(emp_count) FROM dept_stats) AS total_employees,
    (SELECT AVG(avg_salary) FROM dept_stats) AS company_avg_salary;
```

CTE `dept_stats` を1回定義し、メインクエリ内で2回参照している。サブクエリで同じロジックを書く場合は SELECT を2回繰り返す必要があるが、CTE なら定義は1回で済む。

</details>

---

## 演習 4: 再帰 CTE — 組織ツリー

再帰 CTE を使用して、Tanaka（id=1）を頂点とする組織ツリーを表示せよ。各従業員の階層レベル（Tanaka を 1 とする）も出力すること。レベルの昇順、同レベル内は名前の昇順で並べよ。

**期待される出力列:** `id`, `name`, `level`

| id | name      | level |
|----|-----------|-------|
| 1  | Tanaka    | 1     |
| 2  | Sato      | 2     |
| 3  | Suzuki    | 2     |
| 6  | Watanabe  | 2     |
| 4  | Yamada    | 3     |
| 5  | Ito       | 3     |
| 7  | Nakamura  | 3     |
| 8  | Kobayashi | 3     |
| 9  | Kato      | 3     |
| 10 | Yoshida   | 4     |

<details>
<summary>ヒント</summary>

アンカーメンバーで manager_id IS NULL の行（Tanaka）を取得し、level = 1 とする。リカーシブメンバーでは employees テーブルと org_tree を manager_id = id で結合し、level を +1 する。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH RECURSIVE org_tree AS (
    -- アンカーメンバー: トップ（manager_id が NULL）
    SELECT id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- リカーシブメンバー: 子を再帰的に探索
    SELECT e.id, e.name, e.manager_id, ot.level + 1
    FROM employees e
    JOIN org_tree ot ON e.manager_id = ot.id
)
SELECT id, name, level
FROM org_tree
ORDER BY level, name;
```

アンカーメンバーで Tanaka（manager_id IS NULL）を取得し、リカーシブメンバーで部下を再帰的に探索する。JOIN 条件 `e.manager_id = ot.id` により、リーフノードに到達すると結果が空になり再帰が終了する。

</details>

---

## 演習 5: 再帰 CTE — 連番生成

再帰 CTE を使用して 1 から 10 までの連番を生成し、各数値とその二乗を表示せよ。

**期待される出力列:** `n`, `n_squared`

| n  | n_squared |
|----|-----------|
| 1  | 1         |
| 2  | 4         |
| 3  | 9         |
| 4  | 16        |
| 5  | 25        |
| 6  | 36        |
| 7  | 49        |
| 8  | 64        |
| 9  | 81        |
| 10 | 100       |

<details>
<summary>ヒント</summary>

アンカーメンバーで SELECT 1 AS n とし、リカーシブメンバーで n + 1 を計算する。終了条件として WHERE n < 10 を必ず含めること。n_squared はメインクエリの SELECT で n * n として計算する。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 10
)
SELECT n, n * n AS n_squared
FROM seq;
```

アンカーメンバーで n=1 を生成し、WHERE n < 10 の終了条件で n=10 まで繰り返す。終了条件がないと無限ループになるため注意。メインクエリで n * n を計算して二乗を表示している。

</details>
