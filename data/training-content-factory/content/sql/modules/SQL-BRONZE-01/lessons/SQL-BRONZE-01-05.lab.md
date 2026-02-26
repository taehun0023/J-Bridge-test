# Lab: SQL-BRONZE-01-05 — JOIN の基礎

## セットアップ

以下の SQL を実行して練習用テーブルを作成してください。

```sql
CREATE TABLE departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    name          VARCHAR(50)  NOT NULL,
    department_id INT          NOT NULL,
    position      VARCHAR(30)  NOT NULL,
    salary        INT          NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id   INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget       INT          NOT NULL
);

CREATE TABLE project_assignments (
    assignment_id INT PRIMARY KEY,
    employee_id   INT NOT NULL,
    project_id    INT NOT NULL,
    role          VARCHAR(30) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR'),
(4, 'Marketing');

INSERT INTO employees (employee_id, name, department_id, position, salary) VALUES
(101, 'Tanaka Taro',    1, 'Senior Engineer',  5500000),
(102, 'Suzuki Hanako',  1, 'Junior Engineer',  3800000),
(103, 'Sato Kenji',     2, 'Sales Manager',    6000000),
(104, 'Yamada Yuki',    2, 'Sales Associate',  3500000),
(105, 'Takahashi Mika', 3, 'HR Manager',       5800000);

INSERT INTO projects (project_id, project_name, budget) VALUES
(201, 'Web Redesign',    5000000),
(202, 'Mobile App',      8000000),
(203, 'Data Migration',  3000000);

INSERT INTO project_assignments (assignment_id, employee_id, project_id, role) VALUES
(1, 101, 201, 'Lead'),
(2, 102, 201, 'Developer'),
(3, 101, 202, 'Architect'),
(4, 103, 202, 'Stakeholder');
```

**データ確認:**
- departments: 4 部署（Engineering, Sales, HR, Marketing）
- employees: 5 名（Engineering 2 名, Sales 2 名, HR 1 名）
- projects: 3 プロジェクト
- project_assignments: 4 件（employee 104, 105 はプロジェクト未配属。project 203 は担当者なし）
- Marketing 部署には社員がいない

---

## 演習 1: INNER JOIN — 社員と部署名の取得

employees テーブルと departments テーブルを INNER JOIN で結合し、社員名（name）と部署名（department_name）を取得してください。

**期待される出力列:** name, department_name

<details>
<summary>ヒント</summary>

INNER JOIN は両方のテーブルで結合条件を満たす行のみを返します。ON 句で `employees.department_id = departments.department_id` を指定します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
```

結果は 5 行（全社員に対応する部署が存在するため）。Marketing 部署は社員がいないため結果に含まれない。

</details>

---

## 演習 2: LEFT JOIN — 全部署と所属社員の一覧

departments テーブルを左テーブルとして employees テーブルと LEFT JOIN し、全部署名と所属する社員名を取得してください。社員がいない部署も結果に含めてください。

**期待される出力列:** department_name, name

<details>
<summary>ヒント</summary>

LEFT JOIN は左テーブル（departments）の全行を返します。右テーブル（employees）に一致がない場合、name 列は NULL になります。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT d.department_name, e.name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;
```

結果は 6 行。Marketing 部署は社員がいないため name が NULL で表示される。

</details>

---

## 演習 3: LEFT JOIN + IS NULL — 社員がいない部署の抽出

LEFT JOIN を使って、社員が 1 人もいない部署の部署名を取得してください。

**期待される出力列:** department_name

<details>
<summary>ヒント</summary>

LEFT JOIN の結果で右テーブル側の列が NULL のレコードを WHERE 句でフィルタすると、「左テーブルにあって右テーブルにないデータ」を抽出できます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
```

結果は 1 行（Marketing）。

</details>

---

## 演習 4: 3 テーブル結合 — プロジェクト配属の詳細一覧

employees、project_assignments、projects の 3 つのテーブルを結合し、社員名（name）、プロジェクト名（project_name）、プロジェクトでの役割（role）を取得してください。

**期待される出力列:** name, project_name, role

<details>
<summary>ヒント</summary>

3 つ以上のテーブルを結合する場合は JOIN を連鎖的に記述します。employees → project_assignments → projects の順で結合するとわかりやすくなります。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT e.name, p.project_name, pa.role
FROM employees e
INNER JOIN project_assignments pa ON e.employee_id = pa.employee_id
INNER JOIN projects p ON pa.project_id = p.project_id;
```

結果は 4 行。プロジェクトに配属されていない社員（Yamada, Takahashi）は除外される。

</details>

---

## 演習 5: テーブル別名を活用した結合

演習 4 と同じ結果を、テーブル別名を使わずにテーブルのフルネームで記述してください。その後、テーブル別名を使ったバージョンと比較し、可読性の違いを確認してください。

**期待される出力列:** name, project_name, role

<details>
<summary>ヒント</summary>

テーブル別名を使わない場合、同名の列が複数テーブルに存在するとテーブル名で修飾する必要があり、クエリが長くなります。別名を使うと可読性が大幅に向上します。

</details>

<details>
<summary>模範解答</summary>

テーブル別名なし:

```sql
SELECT employees.name, projects.project_name, project_assignments.role
FROM employees
INNER JOIN project_assignments ON employees.employee_id = project_assignments.employee_id
INNER JOIN projects ON project_assignments.project_id = projects.project_id;
```

テーブル別名あり（推奨）:

```sql
SELECT e.name, p.project_name, pa.role
FROM employees e
INNER JOIN project_assignments pa ON e.employee_id = pa.employee_id
INNER JOIN projects p ON pa.project_id = p.project_id;
```

テーブル別名を使うことでクエリが短く読みやすくなる。AS キーワードは省略可能（`employees AS e` と `employees e` は同じ意味）。

</details>
