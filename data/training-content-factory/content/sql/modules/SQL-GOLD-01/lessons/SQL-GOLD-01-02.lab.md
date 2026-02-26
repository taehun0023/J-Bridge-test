# Lab: SQL-GOLD-01-02 — DDL

## セットアップ

このラボは DDL（CREATE / ALTER / DROP）操作に焦点を当てるため、最小限のセットアップとする。

```sql
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO departments VALUES (1, 'Engineering'), (2, 'Sales'), (3, 'HR');
```

---

## Exercise 1: 制約付きテーブルの作成

以下の要件を満たす `employees` テーブルを作成せよ。

- `id` : INTEGER, 主キー
- `name` : VARCHAR(100), NULL 不可
- `email` : VARCHAR(200), NULL 不可, 一意
- `department_id` : INTEGER, `departments(id)` を参照する外部キー（親削除時は SET NULL）
- `salary` : DECIMAL(10,2), NULL 不可, 0 以上の CHECK 制約
- `hire_date` : DATE, NULL 不可, デフォルトは CURRENT_DATE
- `status` : VARCHAR(20), NULL 不可, デフォルトは 'active', 値は 'active', 'inactive', 'suspended' のいずれか

<details>
<summary>ヒント</summary>

列レベル制約で PRIMARY KEY, NOT NULL, UNIQUE, CHECK, DEFAULT, REFERENCES を組み合わせる。

</details>

<details>
<summary>模範解答</summary>

```sql
CREATE TABLE employees (
    id            INTEGER       PRIMARY KEY,
    name          VARCHAR(100)  NOT NULL,
    email         VARCHAR(200)  NOT NULL UNIQUE,
    department_id INTEGER       REFERENCES departments(id) ON DELETE SET NULL,
    salary        DECIMAL(10,2) NOT NULL CHECK (salary >= 0),
    hire_date     DATE          NOT NULL DEFAULT CURRENT_DATE,
    status        VARCHAR(20)   NOT NULL DEFAULT 'active'
                                CHECK (status IN ('active', 'inactive', 'suspended'))
);
```

</details>

---

## Exercise 2: 複合主キーと外部キー

以下の要件を満たす `project_assignments` テーブルを作成せよ。

- `employee_id` : INTEGER, NOT NULL
- `project_id` : INTEGER, NOT NULL
- `role` : VARCHAR(50), NOT NULL
- `assigned_date` : DATE, NOT NULL, デフォルトは CURRENT_DATE
- 複合主キー: (employee_id, project_id)
- `employee_id` は `employees(id)` を参照（親削除時は CASCADE）
- 別途 `projects` テーブルも作成すること（id INTEGER PK, name VARCHAR(200) NOT NULL, budget DECIMAL(15,2) CHECK (budget >= 0)）
- `project_id` は `projects(id)` を参照（親削除時は RESTRICT）

<details>
<summary>ヒント</summary>

複合主キーはテーブルレベル制約で定義する。外部キーも FOREIGN KEY (...) REFERENCES ... で明示的に書く。

</details>

<details>
<summary>模範解答</summary>

```sql
CREATE TABLE projects (
    id     INTEGER       PRIMARY KEY,
    name   VARCHAR(200)  NOT NULL,
    budget DECIMAL(15,2) CHECK (budget >= 0)
);

CREATE TABLE project_assignments (
    employee_id   INTEGER     NOT NULL,
    project_id    INTEGER     NOT NULL,
    role          VARCHAR(50) NOT NULL,
    assigned_date DATE        NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id)  REFERENCES projects(id)  ON DELETE RESTRICT
);
```

</details>

---

## Exercise 3: ALTER TABLE 操作

以下の ALTER TABLE 操作を順番に実行せよ。

1. `employees` テーブルに `phone VARCHAR(20)` 列を追加
2. `employees` テーブルに `updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP` 列を追加
3. `phone` 列に UNIQUE 制約 `uq_employee_phone` を追加
4. `uq_employee_phone` 制約を削除
5. `phone` 列を削除

<details>
<summary>ヒント</summary>

ADD COLUMN, ADD CONSTRAINT, DROP CONSTRAINT, DROP COLUMN をそれぞれ使う。

</details>

<details>
<summary>模範解答</summary>

```sql
-- 1. phone 列を追加
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);

-- 2. updated_at 列を追加
ALTER TABLE employees ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 3. UNIQUE 制約を追加
ALTER TABLE employees ADD CONSTRAINT uq_employee_phone UNIQUE (phone);

-- 4. UNIQUE 制約を削除
ALTER TABLE employees DROP CONSTRAINT uq_employee_phone;

-- 5. phone 列を削除
ALTER TABLE employees DROP COLUMN phone;
```

</details>

---

## Exercise 4: CHECK 制約の活用

以下の要件を満たす `products` テーブルを作成せよ。

- `id` : INTEGER, 主キー
- `name` : VARCHAR(200), NOT NULL
- `price` : DECIMAL(10,2), NOT NULL, 0 より大きい
- `discount_rate` : DECIMAL(3,2), デフォルト 0.00, 0.00 以上 1.00 以下
- `stock` : INTEGER, NOT NULL, デフォルト 0, 0 以上
- `category` : VARCHAR(50), NOT NULL, 値は 'electronics', 'clothing', 'food', 'other' のいずれか

<details>
<summary>ヒント</summary>

CHECK 制約で price > 0, discount_rate BETWEEN 0.00 AND 1.00, stock >= 0, category IN (...) を定義する。

</details>

<details>
<summary>模範解答</summary>

```sql
CREATE TABLE products (
    id            INTEGER       PRIMARY KEY,
    name          VARCHAR(200)  NOT NULL,
    price         DECIMAL(10,2) NOT NULL CHECK (price > 0),
    discount_rate DECIMAL(3,2)  DEFAULT 0.00 CHECK (discount_rate >= 0.00 AND discount_rate <= 1.00),
    stock         INTEGER       NOT NULL DEFAULT 0 CHECK (stock >= 0),
    category      VARCHAR(50)   NOT NULL CHECK (category IN ('electronics', 'clothing', 'food', 'other'))
);
```

</details>

---

## Exercise 5: DROP TABLE と TRUNCATE TABLE

以下の操作を順番に実行し、動作の違いを確認せよ。

1. `temp_logs` テーブルを作成（id INTEGER PK, message VARCHAR(500), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP）
2. テストデータを 3 行 INSERT
3. `TRUNCATE TABLE` でデータを削除し、テーブルが残っていることを確認
4. `DROP TABLE IF EXISTS` でテーブルを完全に削除
5. 存在しないテーブルに対して `DROP TABLE IF EXISTS` を実行し、エラーが出ないことを確認

<details>
<summary>ヒント</summary>

TRUNCATE 後に SELECT で 0 件を確認。DROP 後に SELECT するとテーブルが存在しないエラーになる。

</details>

<details>
<summary>模範解答</summary>

```sql
-- 1. テーブル作成
CREATE TABLE temp_logs (
    id         INTEGER      PRIMARY KEY,
    message    VARCHAR(500),
    created_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- 2. テストデータ挿入
INSERT INTO temp_logs (id, message) VALUES
(1, 'System started'),
(2, 'User logged in'),
(3, 'Data processed');

-- 3. TRUNCATE でデータのみ削除
TRUNCATE TABLE temp_logs;

-- テーブルは残っている（0 件が返る）
SELECT COUNT(*) FROM temp_logs;

-- 4. DROP TABLE で完全削除
DROP TABLE IF EXISTS temp_logs;

-- 5. 存在しないテーブルに対しても安全
DROP TABLE IF EXISTS temp_logs;
```

</details>
