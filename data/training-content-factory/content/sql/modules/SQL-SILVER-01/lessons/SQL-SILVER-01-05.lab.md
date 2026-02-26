# Lab: SQL-SILVER-01-05 — CASE 式と NULL 処理

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id),
    salary DECIMAL(10, 2),
    hire_date DATE NOT NULL,
    email VARCHAR(200),
    manager_id INT,
    mobile_phone VARCHAR(20),
    office_phone VARCHAR(20)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    revenue DECIMAL(12, 2),
    cost DECIMAL(12, 2)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(12, 2),
    order_date DATE NOT NULL
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Tokyo'),
(2, 'Sales', 'Osaka'),
(3, 'HR', 'Tokyo'),
(4, 'Marketing', NULL);

INSERT INTO employees VALUES
(1,  'Tanaka',    1, 90000,  '2020-04-01', 'tanaka@example.com',    NULL, '090-1111-1111', '03-1111-1111'),
(2,  'Suzuki',    1, 55000,  '2021-07-15', NULL,                    1,    NULL,             '03-2222-2222'),
(3,  'Yamamoto',  1, 72000,  '2022-01-10', 'yamamoto@example.com',  1,    '090-3333-3333', NULL),
(4,  'Sato',      2, 85000,  '2019-10-01', 'sato@example.com',      NULL, '090-4444-4444', '06-4444-4444'),
(5,  'Ito',       2, 48000,  '2023-03-20', NULL,                    4,    NULL,             NULL),
(6,  'Watanabe',  2, 62000,  '2022-06-01', 'watanabe@example.com',  4,    '090-6666-6666', '06-6666-6666'),
(7,  'Kobayashi', 3, 78000,  '2020-08-15', 'kobayashi@example.com', NULL, '090-7777-7777', '03-7777-7777'),
(8,  'Kato',      3, 45000,  '2023-02-01', NULL,                    7,    NULL,             '03-8888-8888'),
(9,  'Nakamura',  1, NULL,   '2024-01-15', 'nakamura@example.com',  1,    '090-9999-9999', NULL),
(10, 'Yoshida',   2, 51000,  '2023-04-15', NULL,                    4,    NULL,             NULL);

INSERT INTO products VALUES
(1, 'Widget A',   'Hardware',  1500,  300000, 180000),
(2, 'Widget B',   'Hardware',  2500,  500000, 0),
(3, 'Service X',  'Software',  8000,  960000, 320000),
(4, 'Service Y',  'Software',  5000,  NULL,   250000),
(5, 'Tool Z',     'Hardware',  3000,  450000, 450000),
(6, 'License Q',  'Software',  12000, 720000, NULL);

INSERT INTO orders VALUES
(1,  101, 'shipped',   15000, '2025-01-10'),
(2,  102, 'pending',   8000,  '2025-01-15'),
(3,  101, 'shipped',   22000, '2025-02-05'),
(4,  103, 'cancelled', 5000,  '2025-02-20'),
(5,  102, 'shipped',   18000, '2025-03-01'),
(6,  104, 'pending',   9500,  '2025-03-10'),
(7,  101, 'delivered', 30000, '2025-04-02'),
(8,  103, 'shipped',   12000, '2025-04-15'),
(9,  102, 'cancelled', 7000,  '2025-05-01'),
(10, 104, 'delivered', 25000, '2025-05-20');
```

---

## Exercise 1: 検索 CASE 式による給与等級の分類

従業員の給与に基づいて等級を分類せよ。salary が NULL の場合は '未設定' とする。

- 80000 以上: 'A等級'
- 60000 以上: 'B等級'
- 60000 未満: 'C等級'
- NULL: '未設定'

**期待される出力列:** `name, salary, grade`

<details>
<summary>ヒント</summary>

CASE WHEN を使い、条件は厳しいものから順に記述する。salary が NULL の場合を先に処理するか、ELSE で '未設定' を返す。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, salary,
  CASE
    WHEN salary IS NULL     THEN '未設定'
    WHEN salary >= 80000    THEN 'A等級'
    WHEN salary >= 60000    THEN 'B等級'
    ELSE 'C等級'
  END AS grade
FROM employees
ORDER BY salary DESC NULLS LAST;
```

</details>

---

## Exercise 2: 単純 CASE 式による注文ステータスの日本語変換

orders テーブルの status を日本語に変換して表示せよ。未知のステータスは '不明' と表示する。

- shipped → '発送済'
- pending → '保留中'
- cancelled → 'キャンセル'
- delivered → '配達完了'
- その他 → '不明'

**期待される出力列:** `id, status, status_jp, total_amount`

<details>
<summary>ヒント</summary>

単純 CASE 式（CASE status WHEN ... THEN ...）を使用する。ELSE で '不明' を明示する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT id, status,
  CASE status
    WHEN 'shipped'   THEN '発送済'
    WHEN 'pending'   THEN '保留中'
    WHEN 'cancelled' THEN 'キャンセル'
    WHEN 'delivered'  THEN '配達完了'
    ELSE '不明'
  END AS status_jp,
  total_amount
FROM orders
ORDER BY id;
```

</details>

---

## Exercise 3: COALESCE による連絡先の優先順位付き取得

従業員の連絡先を優先順位付きで取得せよ。mobile_phone → office_phone → email の順に優先し、すべて NULL の場合は '連絡先なし' と表示する。

**期待される出力列:** `name, mobile_phone, office_phone, email, contact`

<details>
<summary>ヒント</summary>

COALESCE は複数の引数を取り、左から順に最初の非 NULL 値を返す。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name,
       mobile_phone,
       office_phone,
       email,
       COALESCE(mobile_phone, office_phone, email, '連絡先なし') AS contact
FROM employees
ORDER BY id;
```

</details>

---

## Exercise 4: NULLIF によるゼロ除算の回避

products テーブルで、各商品の利益率（revenue / cost）を計算せよ。cost が 0 の場合はゼロ除算を回避し、revenue または cost が NULL の場合は NULL とする。結果は小数点以下2桁に丸めること。

**期待される出力列:** `name, revenue, cost, profit_ratio`

<details>
<summary>ヒント</summary>

NULLIF(cost, 0) を使うと、cost が 0 の場合に NULL が返され、除算結果は NULL になる。ROUND で丸める。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name,
       revenue,
       cost,
       ROUND(revenue / NULLIF(cost, 0), 2) AS profit_ratio
FROM products
ORDER BY id;
```

</details>

---

## Exercise 5: 条件付き集約による部門別レポート

部門ごとに以下の集計を1つのクエリで実行せよ。

- 従業員数（total）
- 給与 70000 以上の人数（high_salary）
- 給与 70000 未満の人数（low_salary）
- メールが未登録（NULL）の人数（no_email）
- 平均給与（NULL を除外し、0 にフォールバック）（avg_salary）

**期待される出力列:** `dept_name, total, high_salary, low_salary, no_email, avg_salary`

<details>
<summary>ヒント</summary>

SUM(CASE WHEN condition THEN 1 ELSE 0 END) パターンで条件別の集計を行う。COALESCE で AVG の NULL を 0 に変換する。LEFT JOIN で従業員がいない部門も含める。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT
  d.name AS dept_name,
  COUNT(e.id) AS total,
  SUM(CASE WHEN e.salary >= 70000 THEN 1 ELSE 0 END) AS high_salary,
  SUM(CASE WHEN e.salary < 70000 THEN 1 ELSE 0 END) AS low_salary,
  SUM(CASE WHEN e.email IS NULL THEN 1 ELSE 0 END) AS no_email,
  COALESCE(ROUND(AVG(e.salary), 2), 0) AS avg_salary
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.name
ORDER BY total DESC;
```

</details>
