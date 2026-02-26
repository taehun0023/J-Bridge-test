# Lab: SQL-BRONZE-01-04 — 集約関数

## セットアップ

以下の SQL を実行してテーブルとデータを準備する。

```sql
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    department_id INT,
    salary        INT
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    employee_id INT NOT NULL,
    amount      INT NOT NULL,
    order_date  DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_id, name, department_id, salary) VALUES
(1, 'Tanaka',  10, 350000),
(2, 'Suzuki',  10, 400000),
(3, 'Yamada',  20, 280000),
(4, 'Sato',    20, NULL),
(5, 'Ito',     30, 320000),
(6, 'Watanabe', 30, 350000),
(7, 'Nakamura', 30, 290000),
(8, 'Kobayashi', 10, 310000);

INSERT INTO orders (order_id, employee_id, amount, order_date) VALUES
(101, 1, 50000,  '2025-01-15'),
(102, 1, 30000,  '2025-02-10'),
(103, 2, 80000,  '2025-01-20'),
(104, 3, 20000,  '2025-03-05'),
(105, 5, 60000,  '2025-01-25'),
(106, 5, 45000,  '2025-02-28'),
(107, 5, 35000,  '2025-03-15'),
(108, 6, 70000,  '2025-02-14'),
(109, 7, 25000,  '2025-03-01'),
(110, 8, 40000,  '2025-01-30');
```

---

## 演習 1: COUNT(*) と COUNT(列名) の違い

employees テーブルの全行数と、salary 列が NULL でない行数をそれぞれ取得せよ。

**期待される出力列:** `total_rows`, `salary_count`

| total_rows | salary_count |
|------------|-------------|
| 8          | 7           |

<details>
<summary>ヒント</summary>

COUNT(*) は NULL を含む全行をカウントする。COUNT(salary) は salary が NULL でない行のみカウントする。1 つの SELECT 文で両方を取得できる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    COUNT(*)      AS total_rows,
    COUNT(salary) AS salary_count
FROM employees;
```

COUNT(*) は全 8 行を返し、COUNT(salary) は Sato の salary が NULL のため 7 を返す。

</details>

---

## 演習 2: SUM と AVG

employees テーブルから salary の合計値と平均値を取得せよ。

**期待される出力列:** `salary_sum`, `salary_avg`

| salary_sum | salary_avg |
|-----------|-----------|
| 2300000   | 328571    |

<details>
<summary>ヒント</summary>

SUM と AVG はどちらも NULL 値を無視する。AVG の分母は NULL でない行数（7 行）となる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    SUM(salary) AS salary_sum,
    AVG(salary) AS salary_avg
FROM employees;
```

salary が NULL の Sato は無視される。合計は 350000 + 400000 + 280000 + 320000 + 350000 + 290000 + 310000 = 2300000。平均は 2300000 / 7 ≒ 328571（RDBMS によって端数処理が異なる）。

</details>

---

## 演習 3: MIN と MAX

orders テーブルから注文金額（amount）の最小値・最大値と、注文日（order_date）の最も古い日付・最も新しい日付を取得せよ。

**期待される出力列:** `min_amount`, `max_amount`, `earliest_date`, `latest_date`

| min_amount | max_amount | earliest_date | latest_date |
|-----------|-----------|---------------|-------------|
| 20000     | 80000     | 2025-01-15    | 2025-03-15  |

<details>
<summary>ヒント</summary>

MIN / MAX は数値だけでなく日付にも使える。1 つの SELECT 文で 4 つの集約関数を並べて取得できる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    MIN(amount)     AS min_amount,
    MAX(amount)     AS max_amount,
    MIN(order_date) AS earliest_date,
    MAX(order_date) AS latest_date
FROM orders;
```

MIN / MAX は数値だけでなく日付型にも適用できる。

</details>

---

## 演習 4: GROUP BY

employees テーブルから部門ごと（department_id）の人数と平均給与を取得せよ。department_id の昇順で表示すること。

**期待される出力列:** `department_id`, `emp_count`, `avg_salary`

| department_id | emp_count | avg_salary |
|--------------|----------|-----------|
| 10           | 3        | 353333    |
| 20           | 2        | 280000    |
| 30           | 3        | 320000    |

<details>
<summary>ヒント</summary>

GROUP BY department_id でグループ化する。SELECT 句には GROUP BY で指定した列（department_id）と集約関数のみ記述できる。AVG(salary) は NULL を除外して計算される点に注意（部門 20 の Sato は NULL のため分母は 1）。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    department_id,
    COUNT(*)    AS emp_count,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY department_id;
```

部門 10: (350000 + 400000 + 310000) / 3 ≒ 353333。部門 20: Sato の salary は NULL のため AVG は 280000 / 1 = 280000。部門 30: (320000 + 350000 + 290000) / 3 = 320000。

</details>

---

## 演習 5: HAVING

orders テーブルから従業員ごとの注文合計金額を集計し、合計金額が 50000 以上の従業員のみを表示せよ。合計金額の降順で並べること。

**期待される出力列:** `employee_id`, `total_amount`

| employee_id | total_amount |
|------------|-------------|
| Ito (5)    | 140000      |
| Tanaka (1) | 80000       |
| Suzuki (2) | 80000       |
| Watanabe (6)| 70000      |

<details>
<summary>ヒント</summary>

GROUP BY employee_id で従業員ごとにグループ化し、HAVING SUM(amount) >= 50000 で合計が 50000 以上のグループに絞り込む。WHERE はグループ化前の行フィルタ、HAVING はグループ化後のフィルタであることに注意。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
    employee_id,
    SUM(amount) AS total_amount
FROM orders
GROUP BY employee_id
HAVING SUM(amount) >= 50000
ORDER BY total_amount DESC;
```

HAVING 句は GROUP BY の結果に対する条件フィルタである。employee_id = 3 (20000), 7 (25000), 8 (40000) は合計が 50000 未満のため除外される。

</details>
