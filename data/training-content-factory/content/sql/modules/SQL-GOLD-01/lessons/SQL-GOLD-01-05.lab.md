# Lab: SQL-GOLD-01-05 — インデックスと実行計画

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
    job_title VARCHAR(100),
    is_active BOOLEAN NOT NULL DEFAULT true
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
(1, 'Engineering', 'Tokyo', 5000000),
(2, 'Sales', 'Osaka', 3000000),
(3, 'HR', 'Tokyo', 2000000);

INSERT INTO employees VALUES
(1, 'Tanaka', 1, 800000, '2020-04-01', 'tanaka@example.com', 'Tech Lead', true),
(2, 'Suzuki', 1, 650000, '2021-07-15', 'suzuki@example.com', 'Engineer', true),
(3, 'Yamamoto', 1, 650000, '2022-01-10', 'yamamoto@example.com', 'Engineer', true),
(4, 'Sato', 2, 750000, '2019-10-01', 'sato@example.com', 'Sales Manager', true),
(5, 'Ito', 2, 600000, '2021-03-20', 'ito@example.com', 'Sales Rep', true),
(6, 'Watanabe', 2, 550000, '2022-06-01', 'watanabe@example.com', 'Sales Rep', true),
(7, 'Kobayashi', 3, 700000, '2020-08-15', 'kobayashi@example.com', 'HR Manager', true),
(8, 'Kato', 3, 500000, '2023-02-01', 'kato@example.com', 'HR Staff', true),
(9, 'Nakamura', 1, 720000, '2020-11-01', 'nakamura@example.com', 'Senior Engineer', true),
(10, 'Yoshida', 2, 580000, '2023-04-15', 'yoshida@example.com', 'Sales Rep', false);

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

## Exercise 1: 基本的なインデックス作成と EXPLAIN

employees テーブルの department_id 列にインデックスを作成し、EXPLAIN で実行計画の変化を確認せよ。

**要件:**
- インデックス作成前に `EXPLAIN SELECT * FROM employees WHERE department_id = 1;` を実行する
- department_id 列に B-tree インデックスを作成する
- インデックス作成後に同じ EXPLAIN を実行し、スキャン方式の変化を確認する

<details>
<summary>ヒント</summary>

CREATE INDEX idx_name ON table(column) でインデックスを作成する。EXPLAIN の出力で Seq Scan が Index Scan に変わるか確認する。

</details>

<details>
<summary>模範解答</summary>

```sql
-- インデックスなしの状態
EXPLAIN SELECT * FROM employees WHERE department_id = 1;
-- → Seq Scan on employees（インデックスなし）

-- インデックスを作成
CREATE INDEX idx_employees_department ON employees(department_id);

-- インデックスありの状態
EXPLAIN SELECT * FROM employees WHERE department_id = 1;
-- → Index Scan using idx_employees_department on employees

-- 一意制約付きインデックスも作成
CREATE UNIQUE INDEX idx_employees_email ON employees(email);

-- 確認
EXPLAIN SELECT * FROM employees WHERE email = 'tanaka@example.com';
-- → Index Scan using idx_employees_email on employees
```

</details>

---

## Exercise 2: 複合インデックスと Leftmost Prefix の検証

sales テーブルに `(employee_id, sale_date)` の複合インデックスを作成し、Leftmost Prefix の原則を EXPLAIN で検証せよ。

**要件:**
- 複合インデックス `(employee_id, sale_date)` を作成する
- 以下の 3 つのクエリで EXPLAIN を実行し、インデックスが使われるか確認する:
  1. `WHERE employee_id = 5` （左端列のみ）
  2. `WHERE employee_id = 5 AND sale_date > '2025-03-01'` （両方の列）
  3. `WHERE sale_date > '2025-03-01'` （2 列目のみ）

<details>
<summary>ヒント</summary>

Leftmost Prefix の原則により、左端列（employee_id）を含む条件ではインデックスが使われるが、2 列目（sale_date）のみでは使われない。

</details>

<details>
<summary>模範解答</summary>

```sql
-- 複合インデックスを作成
CREATE INDEX idx_sales_emp_date ON sales(employee_id, sale_date);

-- ケース 1: 左端列のみ → インデックスが使われる
EXPLAIN SELECT * FROM sales WHERE employee_id = 5;
-- → Index Scan using idx_sales_emp_date

-- ケース 2: 両方の列 → インデックスが使われる
EXPLAIN SELECT * FROM sales WHERE employee_id = 5 AND sale_date > '2025-03-01';
-- → Index Scan using idx_sales_emp_date

-- ケース 3: 2 列目のみ → インデックスが使われない
EXPLAIN SELECT * FROM sales WHERE sale_date > '2025-03-01';
-- → Seq Scan on sales（Leftmost Prefix の原則によりインデックス使用不可）
```

</details>

---

## Exercise 3: カバリングインデックスと Index Only Scan

「department_id で絞り込み、salary だけを取得する」クエリに対して、カバリングインデックスを作成し Index Only Scan を実現せよ。

**要件:**
- カバリングインデックスなしで `EXPLAIN ANALYZE` を実行する
- `(department_id, salary)` のカバリングインデックスを作成する
- 同じクエリで `EXPLAIN ANALYZE` を実行し、Index Only Scan になることを確認する

<details>
<summary>ヒント</summary>

SELECT salary FROM employees WHERE department_id = 1 というクエリに対し、(department_id, salary) のインデックスがあればテーブルにアクセスせずインデックスだけでデータを返せる。

</details>

<details>
<summary>模範解答</summary>

```sql
-- カバリングインデックスなし
EXPLAIN ANALYZE SELECT salary FROM employees WHERE department_id = 1;
-- → Index Scan using idx_employees_department（テーブルにもアクセスが必要）

-- カバリングインデックスを作成
CREATE INDEX idx_emp_dept_salary ON employees(department_id, salary);

-- カバリングインデックスあり
EXPLAIN ANALYZE SELECT salary FROM employees WHERE department_id = 1;
-- → Index Only Scan using idx_emp_dept_salary
-- テーブル本体へのアクセスが不要になり I/O が削減される
```

</details>

---

## Exercise 4: 部分インデックスの作成

アクティブな従業員（is_active = true）だけを対象にした部分インデックスを作成し、アクティブ/非アクティブそれぞれの検索でどのように使われるかを確認せよ。

**要件:**
- `is_active = true` の条件付き部分インデックスを department_id 列に作成する
- `WHERE department_id = 2 AND is_active = true` で EXPLAIN を実行する
- `WHERE department_id = 2 AND is_active = false` で EXPLAIN を実行する
- 両者の実行計画の違いを確認する

<details>
<summary>ヒント</summary>

CREATE INDEX ... WHERE is_active = true で部分インデックスを作成する。条件が一致するクエリでのみこのインデックスが使われる。

</details>

<details>
<summary>模範解答</summary>

```sql
-- 部分インデックスを作成
CREATE INDEX idx_active_emp_dept ON employees(department_id)
WHERE is_active = true;

-- アクティブな従業員の検索 → 部分インデックスが使われる
EXPLAIN SELECT * FROM employees WHERE department_id = 2 AND is_active = true;
-- → Index Scan using idx_active_emp_dept

-- 非アクティブな従業員の検索 → 部分インデックスは使われない
EXPLAIN SELECT * FROM employees WHERE department_id = 2 AND is_active = false;
-- → Seq Scan on employees（部分インデックスの条件に一致しないため）
```

</details>

---

## Exercise 5: SARGable でないクエリの修正

以下の SARGable でないクエリをインデックスが使われるように修正せよ。2 つのアプローチ（クエリ修正と関数インデックス）の両方を示すこと。

**対象クエリ:**
```sql
SELECT * FROM employees WHERE UPPER(name) = 'TANAKA';
SELECT * FROM sales WHERE EXTRACT(YEAR FROM sale_date) = 2025;
```

<details>
<summary>ヒント</summary>

アプローチ 1: 関数を列に適用せず、定数側を変換するか範囲条件に書き換える。
アプローチ 2: 関数インデックスを作成する。

</details>

<details>
<summary>模範解答</summary>

```sql
-- === クエリ 1: UPPER(name) = 'TANAKA' ===

-- アプローチ A: 関数インデックスを作成
CREATE INDEX idx_emp_upper_name ON employees(UPPER(name));

EXPLAIN SELECT * FROM employees WHERE UPPER(name) = 'TANAKA';
-- → Index Scan using idx_emp_upper_name

-- === クエリ 2: EXTRACT(YEAR FROM sale_date) = 2025 ===

-- アプローチ A: 範囲条件に書き換える（クエリ修正）
CREATE INDEX idx_sales_date ON sales(sale_date);

EXPLAIN SELECT * FROM sales
WHERE sale_date >= '2025-01-01' AND sale_date < '2026-01-01';
-- → Index Scan using idx_sales_date（範囲条件なのでインデックスが使われる）

-- アプローチ B: 関数インデックスを作成
CREATE INDEX idx_sales_year ON sales(EXTRACT(YEAR FROM sale_date));

EXPLAIN SELECT * FROM sales WHERE EXTRACT(YEAR FROM sale_date) = 2025;
-- → Index Scan using idx_sales_year
-- ただしクエリ側を修正するアプローチ A の方が汎用的で望ましい
```

</details>

---

## Exercise 6: インデックスの総合設計

以下のクエリパターンが頻繁に実行されるシステムにおいて、最適なインデックス設計を行え。インデックスを作成し、それぞれの EXPLAIN で効果を確認すること。

**頻出クエリパターン:**
1. 担当者別の月次売上集計: `SELECT employee_id, SUM(amount) FROM sales WHERE sale_date BETWEEN '2025-01-01' AND '2025-01-31' GROUP BY employee_id`
2. 特定部門のアクティブ従業員の給与一覧: `SELECT name, salary FROM employees WHERE department_id = 1 AND is_active = true ORDER BY salary DESC`
3. メールアドレスによる従業員検索: `SELECT * FROM employees WHERE email = 'tanaka@example.com'`

<details>
<summary>ヒント</summary>

クエリ 1: WHERE の sale_date と GROUP BY の employee_id を考慮した複合インデックス。
クエリ 2: 部分インデックス + カバリングインデックスの組み合わせ。
クエリ 3: 一意制約付きインデックス。

</details>

<details>
<summary>模範解答</summary>

```sql
-- クエリ 1: 月次売上集計
-- sale_date で範囲検索 → employee_id で GROUP BY → amount を集計
-- (sale_date, employee_id, amount) のカバリングインデックスが最適
CREATE INDEX idx_sales_date_emp_amount ON sales(sale_date, employee_id, amount);

EXPLAIN ANALYZE
SELECT employee_id, SUM(amount)
FROM sales
WHERE sale_date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY employee_id;
-- → Index Only Scan using idx_sales_date_emp_amount

-- クエリ 2: 特定部門のアクティブ従業員
-- 部分インデックス（is_active = true）+ カバリング（name, salary）
CREATE INDEX idx_active_dept_salary_name ON employees(department_id, salary DESC, name)
WHERE is_active = true;

EXPLAIN ANALYZE
SELECT name, salary
FROM employees
WHERE department_id = 1 AND is_active = true
ORDER BY salary DESC;
-- → Index Only Scan using idx_active_dept_salary_name

-- クエリ 3: メールアドレス検索
-- 一意性が保証されるため UNIQUE INDEX を使用
-- （Exercise 1 で作成済みの場合は不要）
-- CREATE UNIQUE INDEX idx_employees_email ON employees(email);

EXPLAIN ANALYZE
SELECT * FROM employees WHERE email = 'tanaka@example.com';
-- → Index Scan using idx_employees_email

-- 統計情報を更新して最適な実行計画を確保
ANALYZE employees;
ANALYZE sales;
```

</details>
