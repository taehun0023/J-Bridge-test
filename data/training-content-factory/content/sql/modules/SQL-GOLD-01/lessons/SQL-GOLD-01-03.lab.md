# Lab: SQL-GOLD-01-03 — DML

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(15, 2)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id),
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(200),
    job_title VARCHAR(100)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category VARCHAR(50),
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO departments VALUES
(1, 'Engineering', 'Tokyo', 5000000),
(2, 'Sales', 'Osaka', 3000000),
(3, 'HR', 'Tokyo', 2000000);

INSERT INTO employees VALUES
(1, 'Tanaka', 1, 800000, '2020-04-01', 'tanaka@example.com', 'Tech Lead'),
(2, 'Suzuki', 1, 650000, '2021-07-15', 'suzuki@example.com', 'Engineer'),
(3, 'Yamamoto', 1, 650000, '2022-01-10', 'yamamoto@example.com', 'Engineer'),
(4, 'Sato', 2, 750000, '2019-10-01', 'sato@example.com', 'Sales Manager'),
(5, 'Ito', 2, 600000, '2021-03-20', 'ito@example.com', 'Sales Rep'),
(6, 'Watanabe', 2, 550000, '2022-06-01', 'watanabe@example.com', 'Sales Rep'),
(7, 'Kobayashi', 3, 700000, '2020-08-15', 'kobayashi@example.com', 'HR Manager'),
(8, 'Kato', 3, 500000, '2023-02-01', 'kato@example.com', 'HR Staff');

INSERT INTO products VALUES
(101, 'Keyboard', 8500, 50, 'Peripherals', TRUE),
(102, 'Mouse', 3200, 100, 'Peripherals', TRUE),
(103, 'Monitor', 45000, 20, 'Display', TRUE),
(104, 'USB Cable', 800, 200, 'Accessories', TRUE),
(105, 'Webcam', 12000, 0, 'Peripherals', FALSE),
(106, 'Headset', 15000, 5, 'Audio', TRUE);
```

---

## Exercise 1: 複数行 INSERT

新しく入社した 3 名の従業員を 1 つの INSERT 文で追加せよ。

| id | name | department_id | salary | hire_date | email | job_title |
|---|---|---|---|---|---|---|
| 9 | Morimoto | 1 | 620000 | 2025-04-01 | morimoto@example.com | Engineer |
| 10 | Fujita | 2 | 580000 | 2025-04-01 | fujita@example.com | Sales Rep |
| 11 | Ogawa | 3 | 510000 | 2025-04-01 | ogawa@example.com | HR Staff |

<details>
<summary>ヒント</summary>

INSERT INTO ... VALUES で複数行を (row1), (row2), (row3) のように記述する。

</details>

<details>
<summary>模範解答</summary>

```sql
INSERT INTO employees (id, name, department_id, salary, hire_date, email, job_title)
VALUES
    (9,  'Morimoto', 1, 620000, '2025-04-01', 'morimoto@example.com', 'Engineer'),
    (10, 'Fujita',   2, 580000, '2025-04-01', 'fujita@example.com',   'Sales Rep'),
    (11, 'Ogawa',    3, 510000, '2025-04-01', 'ogawa@example.com',    'HR Staff');
```

</details>

---

## Exercise 2: INSERT INTO ... SELECT

employee_archive テーブルを作成し、2021年より前に入社した従業員をアーカイブテーブルにコピーせよ。

```sql
CREATE TABLE employee_archive (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    job_title VARCHAR(100)
);
```

**期待される結果:** hire_date が '2021-01-01' より前の従業員が employee_archive に挿入される。

<details>
<summary>ヒント</summary>

INSERT INTO ... SELECT ... FROM employees WHERE hire_date < '2021-01-01' を使う。

</details>

<details>
<summary>模範解答</summary>

```sql
INSERT INTO employee_archive (id, name, department_id, salary, hire_date, job_title)
SELECT id, name, department_id, salary, hire_date, job_title
FROM employees
WHERE hire_date < '2021-01-01';
```

</details>

---

## Exercise 3: サブクエリを使った UPDATE

各従業員の給与を、その従業員が属する部門の平均給与を下回っている場合のみ 10% 昇給させよ。まず SELECT で対象者を確認してから UPDATE を実行すること。

**期待される出力:** 部門平均を下回る従業員の salary が 10% 増加する。

<details>
<summary>ヒント</summary>

1. SELECT で対象者を確認:
   WHERE salary < (SELECT AVG(salary) FROM employees e2 WHERE e2.department_id = employees.department_id)
2. 確認後に UPDATE SET salary = salary * 1.1 WHERE ... と同じ条件を使う。

</details>

<details>
<summary>模範解答</summary>

```sql
-- Step 1: 対象者を確認
SELECT id, name, department_id, salary
FROM employees e
WHERE salary < (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- Step 2: 確認後に UPDATE
UPDATE employees e
SET salary = salary * 1.1
WHERE salary < (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
```

</details>

---

## Exercise 4: 安全な DELETE（確認→削除）

is_active が FALSE の商品を products テーブルから削除せよ。ただし、先に SELECT で削除対象を確認してから DELETE を実行すること。

**期待される結果:** is_active = FALSE の商品（id=105, Webcam）が削除される。

<details>
<summary>ヒント</summary>

1. SELECT * FROM products WHERE is_active = FALSE; で対象を確認する。
2. 確認後に DELETE FROM products WHERE is_active = FALSE; を実行する。

</details>

<details>
<summary>模範解答</summary>

```sql
-- Step 1: 削除対象を確認
SELECT * FROM products WHERE is_active = FALSE;

-- Step 2: 確認後に削除
DELETE FROM products WHERE is_active = FALSE;
```

</details>

---

## Exercise 5: MERGE / UPSERT

以下の新しい商品データを products テーブルに UPSERT（存在すれば更新、なければ挿入）せよ。PostgreSQL の INSERT ... ON CONFLICT 構文を使用すること。

| id | name | price | stock_quantity | category | is_active |
|---|---|---|---|---|---|
| 101 | Keyboard Pro | 12000 | 30 | Peripherals | TRUE |
| 102 | Mouse | 2800 | 50 | Peripherals | TRUE |
| 107 | Speakers | 9800 | 40 | Audio | TRUE |

- 既存商品（id=101, 102）は name と price を更新し、stock_quantity は既存在庫に加算する。
- 新商品（id=107）は新規挿入する。

<details>
<summary>ヒント</summary>

INSERT INTO products (...) VALUES (...), (...), (...) ON CONFLICT (id) DO UPDATE SET ... を使う。
既存在庫への加算は products.stock_quantity + EXCLUDED.stock_quantity とする。

</details>

<details>
<summary>模範解答</summary>

```sql
INSERT INTO products (id, name, price, stock_quantity, category, is_active)
VALUES
    (101, 'Keyboard Pro', 12000, 30, 'Peripherals', TRUE),
    (102, 'Mouse', 2800, 50, 'Peripherals', TRUE),
    (107, 'Speakers', 9800, 40, 'Audio', TRUE)
ON CONFLICT (id) DO UPDATE
SET name = EXCLUDED.name,
    price = EXCLUDED.price,
    stock_quantity = products.stock_quantity + EXCLUDED.stock_quantity;
```

</details>

---

## Exercise 6: RETURNING 句の活用

以下の操作を RETURNING 句付きで実行せよ。

1. products テーブルに新商品（id=108, 'Tablet Stand', price=5500, stock_quantity=25, category='Accessories', is_active=TRUE）を挿入し、挿入された行の id と name を返す。
2. Peripherals カテゴリの全商品の price を 5% 値上げし、更新された行の id, name, price を返す。

<details>
<summary>ヒント</summary>

INSERT INTO ... VALUES (...) RETURNING id, name; と UPDATE ... SET ... WHERE ... RETURNING id, name, price; を使う。

</details>

<details>
<summary>模範解答</summary>

```sql
-- 1. INSERT with RETURNING
INSERT INTO products (id, name, price, stock_quantity, category, is_active)
VALUES (108, 'Tablet Stand', 5500, 25, 'Accessories', TRUE)
RETURNING id, name;

-- 2. UPDATE with RETURNING
UPDATE products
SET price = price * 1.05
WHERE category = 'Peripherals'
RETURNING id, name, price;
```

</details>
