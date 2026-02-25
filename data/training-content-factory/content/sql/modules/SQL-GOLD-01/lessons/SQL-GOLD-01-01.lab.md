# Lab: SQL-GOLD-01-01 — ウィンドウ関数

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(15, 2),
    manager_id INT
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id),
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(200),
    manager_id INT,
    job_title VARCHAR(100)
);

CREATE TABLE sales (
    id INT PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    product_id INT,
    sale_date DATE NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    region VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Tokyo', 5000000, 1),
(2, 'Sales', 'Osaka', 3000000, 4),
(3, 'HR', 'Tokyo', 2000000, 7);

INSERT INTO employees VALUES
(1, 'Tanaka', 1, 800000, '2020-04-01', 'tanaka@example.com', NULL, 'Tech Lead'),
(2, 'Suzuki', 1, 650000, '2021-07-15', 'suzuki@example.com', 1, 'Engineer'),
(3, 'Yamamoto', 1, 650000, '2022-01-10', 'yamamoto@example.com', 1, 'Engineer'),
(4, 'Sato', 2, 750000, '2019-10-01', 'sato@example.com', NULL, 'Sales Manager'),
(5, 'Ito', 2, 600000, '2021-03-20', 'ito@example.com', 4, 'Sales Rep'),
(6, 'Watanabe', 2, 550000, '2022-06-01', 'watanabe@example.com', 4, 'Sales Rep'),
(7, 'Kobayashi', 3, 700000, '2020-08-15', 'kobayashi@example.com', NULL, 'HR Manager'),
(8, 'Kato', 3, 500000, '2023-02-01', 'kato@example.com', 7, 'HR Staff'),
(9, 'Nakamura', 1, 720000, '2020-11-01', 'nakamura@example.com', 1, 'Senior Engineer'),
(10, 'Yoshida', 2, 580000, '2023-04-15', 'yoshida@example.com', 4, 'Sales Rep');

INSERT INTO sales VALUES
(1,  5, 101, '2025-01-15', 150000, 'Kanto'),
(2,  6, 102, '2025-01-20', 80000, 'Kansai'),
(3,  5, 101, '2025-02-10', 200000, 'Kanto'),
(4,  6, 103, '2025-02-15', 120000, 'Kansai'),
(5, 10, 101, '2025-02-28', 95000, 'Kanto'),
(6,  5, 102, '2025-03-05', 180000, 'Kanto'),
(7,  6, 101, '2025-03-12', 160000, 'Kansai'),
(8, 10, 103, '2025-03-20', 110000, 'Kanto'),
(9,  5, 101, '2025-04-01', 220000, 'Kanto'),
(10, 6, 102, '2025-04-10', 140000, 'Kansai'),
(11,10, 101, '2025-04-15', 130000, 'Kanto'),
(12, 5, 103, '2025-05-05', 250000, 'Kanto'),
(13, 6, 101, '2025-05-18', 175000, 'Kansai'),
(14,10, 102, '2025-05-25', 145000, 'Kanto'),
(15, 5, 101, '2025-06-10', 190000, 'Kanto');
```

---

## Exercise 1: 部門別の給与ランキング

各部門内で給与の高い順にランキングを付けよ。ROW_NUMBER、RANK、DENSE_RANK の 3 つすべてを表示すること。

**期待される出力列:** `name, department_id, salary, row_num, rnk, dense_rnk`

<details>
<summary>ヒント</summary>

PARTITION BY department_id ORDER BY salary DESC を使用する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    RANK()       OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rnk
FROM employees
ORDER BY department_id, salary DESC;
```

</details>

---

## Exercise 2: 前月比の売上差分

sales テーブルを月別に集計し、各月の売上合計と前月との差分を表示せよ。

**期待される出力列:** `month, monthly_total, prev_month_total, diff`

<details>
<summary>ヒント</summary>

GROUP BY で月集計した後、LAG() で前月の集計値を取得する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS monthly_total,
    LAG(SUM(amount), 1) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS prev_month_total,
    SUM(amount) - LAG(SUM(amount), 1) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS diff
FROM sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;
```

</details>

---

## Exercise 3: 累積売上合計

sales テーブルで、日付順に累積合計（running total）を計算し、各行に表示せよ。

**期待される出力列:** `sale_date, amount, running_total`

<details>
<summary>ヒント</summary>

SUM(amount) OVER (ORDER BY sale_date ROWS BETWEEN ...) を使う。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM sales
ORDER BY sale_date;
```

</details>

---

## Exercise 4: 営業担当者別 Top-2 売上

各営業担当者（employee_id）ごとに売上金額が高い上位 2 件のみを取得せよ。

**期待される出力列:** `employee_id, sale_date, amount, rn`

<details>
<summary>ヒント</summary>

ROW_NUMBER() で順位を付け、CTE でフィルタリングする。WHERE 句では直接ウィンドウ関数を使えない。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH ranked_sales AS (
    SELECT
        employee_id,
        sale_date,
        amount,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY amount DESC) AS rn
    FROM sales
)
SELECT employee_id, sale_date, amount, rn
FROM ranked_sales
WHERE rn <= 2
ORDER BY employee_id, rn;
```

</details>

---

## Exercise 5: 3件移動平均と前後の売上比較

sales テーブルで、日付順に各売上レコードの前後 1 件を含む 3 件移動平均を計算し、前の売上額（LAG）と次の売上額（LEAD）も並べて表示せよ。

**期待される出力列:** `sale_date, amount, prev_amount, next_amount, moving_avg_3`

<details>
<summary>ヒント</summary>

LAG / LEAD は offset=1 のデフォルトを使う。AVG には ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING を使う。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    sale_date,
    amount,
    LAG(amount, 1)  OVER (ORDER BY sale_date) AS prev_amount,
    LEAD(amount, 1) OVER (ORDER BY sale_date) AS next_amount,
    ROUND(
        AVG(amount) OVER (ORDER BY sale_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING), 2
    ) AS moving_avg_3
FROM sales
ORDER BY sale_date;
```

</details>

---

## Exercise 6: 全社給与に対する比率と部門内累積比率

各従業員の給与が全社合計に占める比率（%）と、部門内で給与の高い順に並べたときの部門給与に対する累積比率を計算せよ。

**期待される出力列:** `name, department_id, salary, pct_of_company, cumulative_dept_pct`

<details>
<summary>ヒント</summary>

全社比率: salary / SUM(salary) OVER ()。
累積部門比率: SUM(salary) OVER (PARTITION BY department_id ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) / SUM(salary) OVER (PARTITION BY department_id)。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    name,
    department_id,
    salary,
    ROUND(salary * 100.0 / SUM(salary) OVER (), 2) AS pct_of_company,
    ROUND(
        SUM(salary) OVER (PARTITION BY department_id ORDER BY salary DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
        * 100.0
        / SUM(salary) OVER (PARTITION BY department_id),
        2
    ) AS cumulative_dept_pct
FROM employees
ORDER BY department_id, salary DESC;
```

</details>
