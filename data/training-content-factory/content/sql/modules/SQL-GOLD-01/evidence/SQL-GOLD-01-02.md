# Evidence: SQL-GOLD-01-02 — DDL: CREATE TABLE / ALTER / 制約

[E1] DDL（Data Definition Language）はデータベースの構造を定義する SQL 文の総称であり、CREATE, ALTER, DROP, TRUNCATE が含まれる。DML（データ操作）とは異なり、多くの RDBMS で自動コミットされる。

[E2] CREATE TABLE 文でテーブルを作成する際、各列にはデータ型を指定する。標準 SQL の基本データ型には INTEGER, SMALLINT, BIGINT, DECIMAL(p,s), NUMERIC(p,s), REAL, DOUBLE PRECISION, CHAR(n), VARCHAR(n), DATE, TIME, TIMESTAMP, BOOLEAN がある。

[E3] PRIMARY KEY 制約は列の値が一意かつ NOT NULL であることを保証する。テーブルに 1 つだけ定義可能。複合主キーは PRIMARY KEY (col1, col2) で定義する。

[E4] FOREIGN KEY 制約は参照整合性を保証する。REFERENCES 句で参照先テーブルと列を指定し、ON DELETE / ON UPDATE でカスケード動作（CASCADE, SET NULL, SET DEFAULT, RESTRICT, NO ACTION）を指定できる。

[E5] UNIQUE 制約は列（または列の組み合わせ）の値が一意であることを保証する。NULL の扱いは RDBMS によって異なるが、標準 SQL では NULL 同士は重複とみなさない。

[E6] CHECK 制約は列の値が指定した条件式を満たすことを保証する。例: CHECK (salary >= 0)、CHECK (status IN ('active', 'inactive'))。

[E7] NOT NULL 制約は列に NULL 値を許可しないことを指定する。PRIMARY KEY は暗黙的に NOT NULL を含む。

[E8] DEFAULT 句は INSERT 時に値が省略された列に自動的に設定される値を指定する。DEFAULT CURRENT_TIMESTAMP のような式も使用可能。

[E9] ALTER TABLE は既存テーブルの構造を変更する。ADD COLUMN, DROP COLUMN, ALTER COLUMN（型変更）、ADD CONSTRAINT, DROP CONSTRAINT などの操作が可能。

[E10] DROP TABLE はテーブルとそのデータを完全に削除する。IF EXISTS 句を付けることで、テーブルが存在しない場合のエラーを回避できる。CASCADE を付けると依存オブジェクト（ビュー、外部キーなど）も削除する。

[E11] TRUNCATE TABLE はテーブルのデータをすべて削除するが、テーブル構造は保持する。DELETE FROM と異なり、通常はロールバック不可で高速である。

[E12] テーブル名・列名の命名規則として、標準 SQL では引用符なしの識別子は大文字小文字を区別しない。snake_case が広く推奨される。

[E13] 制約には列レベル制約（列定義の後に記述）とテーブルレベル制約（全列定義の後に記述）がある。複合キーの PRIMARY KEY や FOREIGN KEY はテーブルレベルで定義する。

## Code snippets

```sql
-- 制約付き CREATE TABLE
CREATE TABLE employees (
    id          INTEGER      PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    department_id INTEGER    REFERENCES departments(id) ON DELETE SET NULL,
    salary      DECIMAL(10,2) NOT NULL CHECK (salary >= 0),
    hire_date   DATE         NOT NULL DEFAULT CURRENT_DATE,
    email       VARCHAR(200) UNIQUE,
    manager_id  INTEGER      REFERENCES employees(id),
    job_title   VARCHAR(100)
);

-- ALTER TABLE の例
ALTER TABLE employees ADD COLUMN phone VARCHAR(20);
ALTER TABLE employees DROP COLUMN phone;
ALTER TABLE employees ADD CONSTRAINT chk_email CHECK (email LIKE '%@%');

-- DROP TABLE
DROP TABLE IF EXISTS temp_data CASCADE;
```

## Sources

- ISO/IEC 9075:2023 (SQL standard) — Part 2: Foundation, Section 11 Schema definition and manipulation
- Standard SQL data types specification
