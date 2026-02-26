# Lab: SQL-SILVER-01-02 — サブクエリ

## セットアップ

以下の SQL を実行して練習用テーブルを作成してください。

```sql
CREATE TABLE departments (
    id         INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    location   VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id              INT PRIMARY KEY,
    name            VARCHAR(50)  NOT NULL,
    department_id   INT          REFERENCES departments(id),
    salary          INT          NOT NULL,
    hire_date       DATE         NOT NULL
);

CREATE TABLE orders (
    id            INT PRIMARY KEY,
    employee_id   INT  NOT NULL REFERENCES employees(id),
    amount        INT  NOT NULL,
    order_date    DATE NOT NULL
);

INSERT INTO departments (id, name, location) VALUES
(1, 'Engineering', 'Tokyo'),
(2, 'Sales',       'Osaka'),
(3, 'HR',          'Tokyo'),
(4, 'Marketing',   'Nagoya');

INSERT INTO employees (id, name, department_id, salary, hire_date) VALUES
(101, 'Tanaka Taro',    1, 550000, '2020-04-01'),
(102, 'Suzuki Hanako',  1, 480000, '2022-01-15'),
(103, 'Sato Kenji',     2, 600000, '2019-07-01'),
(104, 'Yamada Yuki',    2, 350000, '2023-10-01'),
(105, 'Takahashi Mika', 3, 520000, '2018-04-01'),
(106, 'Ito Daisuke',    1, 620000, '2021-06-01'),
(107, 'Watanabe Rin',   3, 360000, '2023-04-01'),
(108, 'Nakamura Sho',   2, 380000, '2024-01-10');

INSERT INTO orders (id, employee_id, amount, order_date) VALUES
(1001, 103, 150000, '2024-02-15'),
(1002, 104, 80000,  '2024-03-20'),
(1003, 103, 200000, '2024-05-10'),
(1004, 108, 50000,  '2023-11-01'),
(1005, 101, 120000, '2024-06-01');
```

---

## 演習 1: スカラーサブクエリ

全社員の平均給与よりも給与が高い従業員の名前と給与を取得してください。

**期待される出力列:** name, salary

<details>
<summary>ヒント</summary>

WHERE 句でスカラーサブクエリを使い、`AVG(salary)` と比較します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

</details>

---

## 演習 2: 導出テーブル（テーブルサブクエリ）

部署ごとの平均給与を求め、平均給与が 450000 を超える部署の department_id と平均給与を取得してください。FROM 句のサブクエリ（導出テーブル）を使用すること。

**期待される出力列:** department_id, avg_salary

<details>
<summary>ヒント</summary>

FROM 句にサブクエリを書き、必ず別名（AS）を付けてください。サブクエリ内で GROUP BY を使って部署ごとの平均を求めます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT dept_avg.department_id, dept_avg.avg_salary
FROM (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avg
WHERE dept_avg.avg_salary > 450000;
```

</details>

---

## 演習 3: IN サブクエリ

東京（Tokyo）にある部署に所属する従業員の名前を取得してください。IN サブクエリを使用すること。

**期待される出力列:** name

<details>
<summary>ヒント</summary>

まず departments テーブルから location が 'Tokyo' の部署 id を取得するサブクエリを作り、WHERE ... IN で使用します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name
FROM employees
WHERE department_id IN (
  SELECT id FROM departments WHERE location = 'Tokyo'
);
```

</details>

---

## 演習 4: EXISTS

注文（orders）が1件以上ある従業員の名前を取得してください。EXISTS を使用すること。

**期待される出力列:** name

<details>
<summary>ヒント</summary>

EXISTS の中で相関サブクエリを使い、外側の employees.id と orders.employee_id を結びつけます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name
FROM employees e
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.employee_id = e.id
);
```

</details>

---

## 演習 5: 相関サブクエリ

自分の所属部署の平均給与よりも給与が高い従業員の名前、給与、department_id を取得してください。相関サブクエリを使用すること。

**期待される出力列:** name, salary, department_id

<details>
<summary>ヒント</summary>

WHERE 句の相関サブクエリで、外側テーブルの department_id を参照して部署ごとの AVG(salary) を求め、比較します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e1.name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
  SELECT AVG(e2.salary)
  FROM employees e2
  WHERE e2.department_id = e1.department_id
);
```

</details>
