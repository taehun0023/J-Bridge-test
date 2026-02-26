# Lab: SQL-SILVER-01-03 — 結合の応用

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    manager_id INT,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing'),
(5, 'Legal');

INSERT INTO employees VALUES
(1, 'Tanaka',    1, NULL, 800000),
(2, 'Suzuki',    1, 1,    650000),
(3, 'Yamamoto',  2, 1,    600000),
(4, 'Sato',      2, 3,    550000),
(5, 'Ito',       1, 2,    700000),
(6, 'Watanabe',  3, 1,    500000),
(7, 'Kobayashi', NULL, NULL, 450000);

INSERT INTO projects VALUES
(1, 'Project Alpha', 1),
(2, 'Project Beta',  2),
(3, 'Project Gamma', 4),
(4, 'Project Delta', 1);
```

---

## Exercise 1: RIGHT JOIN

departments テーブルを基準に、各部署に所属する従業員を RIGHT JOIN で取得せよ。従業員がいない部署も表示すること。

**期待される出力列:** `emp_name, dept_name`

<details>
<summary>ヒント</summary>

employees を左テーブル、departments を右テーブルとして RIGHT JOIN する。RIGHT JOIN は右テーブルの全行を保持するため、従業員がいない部署も結果に含まれる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name AS emp_name, d.name AS dept_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id
ORDER BY d.name;
```

</details>

---

## Exercise 2: FULL OUTER JOIN

employees と departments を FULL OUTER JOIN で結合し、所属部署のない従業員と従業員のいない部署の両方を含む結果を取得せよ。さらに、不一致行（片方が NULL）のみを抽出せよ。

**期待される出力列:** `emp_name, dept_name`

<details>
<summary>ヒント</summary>

FULL OUTER JOIN で結合した後、WHERE 句で e.employee_id IS NULL OR d.department_id IS NULL の条件を付けると、一致しなかった行のみを抽出できる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name AS emp_name, d.name AS dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL OR d.department_id IS NULL
ORDER BY d.name;
```

</details>

---

## Exercise 3: CROSS JOIN

departments テーブルと以下の四半期テーブルを CROSS JOIN し、全部署 × 全四半期の組み合わせを生成せよ。

```sql
-- 四半期テーブル（WITH 句で定義）
WITH quarters AS (
    SELECT 'Q1' AS quarter
    UNION ALL SELECT 'Q2'
    UNION ALL SELECT 'Q3'
    UNION ALL SELECT 'Q4'
)
```

**期待される出力列:** `dept_name, quarter`

<details>
<summary>ヒント</summary>

WITH 句で quarters を定義し、departments と CROSS JOIN する。5部署 × 4四半期 = 20行が出力される。

</details>

<details>
<summary>模範解答</summary>

```sql
WITH quarters AS (
    SELECT 'Q1' AS quarter
    UNION ALL SELECT 'Q2'
    UNION ALL SELECT 'Q3'
    UNION ALL SELECT 'Q4'
)
SELECT d.name AS dept_name, q.quarter
FROM departments d
CROSS JOIN quarters q
ORDER BY d.name, q.quarter;
```

</details>

---

## Exercise 4: 自己結合（上司の取得）

employees テーブルを自己結合し、各従業員とその上司の名前を取得せよ。上司がいない従業員（manager_id が NULL）も結果に含めること。

**期待される出力列:** `employee, manager`

<details>
<summary>ヒント</summary>

employees テーブルに e（従業員）と m（上司）の2つの別名を付けて LEFT JOIN する。e.manager_id = m.employee_id で結合する。LEFT JOIN を使うことで manager_id が NULL の従業員も結果に含まれる。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;
```

</details>

---

## Exercise 5: USING 句

projects テーブルと departments テーブルを USING 句を用いて結合し、各プロジェクトとその所属部署名を取得せよ。両テーブルに共通する department_id 列で結合すること。

**期待される出力列:** `department_id, project_name, dept_name`

<details>
<summary>ヒント</summary>

projects テーブルと departments テーブルの両方に department_id 列がある。ON p.department_id = d.department_id の代わりに USING(department_id) と書ける。USING で指定した列は結果セットに1回だけ出現する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT department_id, p.name AS project_name, d.name AS dept_name
FROM projects p
JOIN departments d USING(department_id)
ORDER BY department_id;
```

</details>
