# Lab: SQL-SILVER-01-01 — GROUP BY と HAVING

## セットアップ

以下の SQL を実行して練習用テーブルを作成してください。

```sql
CREATE TABLE departments (
    id           INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    location     VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id              INT PRIMARY KEY,
    name            VARCHAR(50)  NOT NULL,
    department_id   INT          NOT NULL REFERENCES departments(id),
    salary          INT          NOT NULL,
    hire_date       DATE         NOT NULL,
    email           VARCHAR(100)
);

CREATE TABLE orders (
    id              INT PRIMARY KEY,
    employee_id     INT          NOT NULL REFERENCES employees(id),
    order_date      DATE         NOT NULL,
    total_amount    INT          NOT NULL
);

CREATE TABLE order_items (
    id           INT PRIMARY KEY,
    order_id     INT          NOT NULL REFERENCES orders(id),
    product_name VARCHAR(50)  NOT NULL,
    category     VARCHAR(30)  NOT NULL,
    quantity     INT          NOT NULL,
    unit_price   INT          NOT NULL
);

INSERT INTO departments (id, name, location) VALUES
(1, 'Engineering', 'Tokyo'),
(2, 'Sales',       'Osaka'),
(3, 'HR',          'Tokyo'),
(4, 'Marketing',   'Nagoya');

INSERT INTO employees (id, name, department_id, salary, hire_date, email) VALUES
(1,  'Tanaka Taro',     1, 550000, '2020-04-01', 'tanaka@example.com'),
(2,  'Suzuki Hanako',   1, 380000, '2023-01-15', 'suzuki@example.com'),
(3,  'Sato Kenji',      2, 600000, '2019-07-01', 'sato@example.com'),
(4,  'Yamada Yuki',     2, 350000, '2022-10-01', NULL),
(5,  'Takahashi Mika',  3, 580000, '2018-04-01', 'takahashi@example.com'),
(6,  'Ito Daisuke',     1, 550000, '2021-06-01', 'ito@example.com'),
(7,  'Watanabe Rin',    3, 360000, '2023-04-01', NULL),
(8,  'Nakamura Sho',    2, 350000, '2024-01-10', 'nakamura@example.com'),
(9,  'Kobayashi Yui',   1, 420000, '2023-07-01', 'kobayashi@example.com'),
(10, 'Yoshida Ken',     4, 480000, '2022-03-01', 'yoshida@example.com');

INSERT INTO orders (id, employee_id, order_date, total_amount) VALUES
(1,  3, '2024-01-15', 150000),
(2,  3, '2024-02-20', 200000),
(3,  4, '2024-01-25', 80000),
(4,  8, '2024-03-10', 120000),
(5,  1, '2024-02-01', 300000),
(6,  6, '2024-03-15', 250000),
(7,  10,'2024-01-30', 90000),
(8,  10,'2024-02-28', 110000);

INSERT INTO order_items (id, order_id, product_name, category, quantity, unit_price) VALUES
(1,  1, 'Laptop',      'Electronics', 1, 120000),
(2,  1, 'Mouse',       'Electronics', 2, 15000),
(3,  2, 'Desk',        'Furniture',   1, 200000),
(4,  3, 'Keyboard',    'Electronics', 4, 20000),
(5,  4, 'Chair',       'Furniture',   2, 60000),
(6,  5, 'Server',      'Electronics', 1, 300000),
(7,  6, 'Monitor',     'Electronics', 5, 50000),
(8,  7, 'Notebook',    'Stationery',  10, 9000),
(9,  8, 'Pen Set',     'Stationery',  20, 5500);
```

---

## 演習 1: 複数列の GROUP BY

部署ごと・勤務地ごとの従業員数を求めてください。departments テーブルと employees テーブルを結合して、部署名（`departments.name`）と勤務地（`departments.location`）でグループ化し、各グループの従業員数を `emp_count` として表示してください。

**期待される出力列:** dept_name, location, emp_count

<details>
<summary>ヒント</summary>

departments と employees を JOIN し、GROUP BY に `d.name, d.location` の 2 列を指定します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT d.name AS dept_name,
       d.location,
       COUNT(e.id) AS emp_count
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.name, d.location;
```

</details>

---

## 演習 2: HAVING で集約関数による絞り込み

部署ごとの平均給与を求め、平均給与が 400000 以上の部署のみ表示してください。結果は平均給与の降順でソートしてください。

**期待される出力列:** department_id, avg_salary

<details>
<summary>ヒント</summary>

GROUP BY で department_id ごとにまとめ、HAVING AVG(salary) >= 400000 で絞り込みます。ORDER BY で降順ソートします。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT department_id,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 400000
ORDER BY avg_salary DESC;
```

</details>

---

## 演習 3: WHERE + GROUP BY + HAVING の併用

2022年以降に入社した従業員のみを対象として、部署ごとの人数を集計し、人数が 2 名以上の部署のみ表示してください。

**期待される出力列:** department_id, emp_count

<details>
<summary>ヒント</summary>

WHERE で hire_date >= '2022-01-01' の行を先に絞り込み、その後 GROUP BY で集計、HAVING COUNT(*) >= 2 でフィルタします。WHERE は行レベル、HAVING はグループレベルのフィルタです。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT department_id,
       COUNT(*) AS emp_count
FROM employees
WHERE hire_date >= '2022-01-01'
GROUP BY department_id
HAVING COUNT(*) >= 2;
```

</details>

---

## 演習 4: JOIN + GROUP BY による集計

部署ごとの注文合計金額を求めてください。departments、employees、orders の 3 テーブルを結合し、部署名（`departments.name`）でグループ化して合計金額を `total_order_amount` として表示してください。合計金額の降順でソートしてください。

**期待される出力列:** dept_name, total_order_amount

<details>
<summary>ヒント</summary>

departments → employees → orders の順に JOIN し、GROUP BY d.name で部署単位にまとめます。SUM(o.total_amount) で合計金額を求めます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT d.name AS dept_name,
       SUM(o.total_amount) AS total_order_amount
FROM departments d
JOIN employees e ON d.id = e.department_id
JOIN orders o ON e.id = o.employee_id
GROUP BY d.name
ORDER BY total_order_amount DESC;
```

</details>

---

## 演習 5: COUNT(DISTINCT ...) の活用

商品カテゴリごとに、注文件数（重複しない注文 ID の数）と合計売上（`quantity * unit_price` の合計）を求めてください。合計売上が 100000 以上のカテゴリのみ表示し、合計売上の降順でソートしてください。

**期待される出力列:** category, order_count, total_revenue

<details>
<summary>ヒント</summary>

order_items テーブルを GROUP BY category で集計します。同じ注文に複数の明細がある場合があるため、注文件数は COUNT(DISTINCT order_id) を使います。HAVING で合計売上を絞り込みます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT category,
       COUNT(DISTINCT order_id) AS order_count,
       SUM(quantity * unit_price) AS total_revenue
FROM order_items
GROUP BY category
HAVING SUM(quantity * unit_price) >= 100000
ORDER BY total_revenue DESC;
```

</details>
