# Lab: SQL-BRONZE-01-01 — SELECT と FROM

## セットアップ

以下の SQL を実行して練習用テーブルを作成してください。

```sql
CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    name          VARCHAR(50)  NOT NULL,
    department    VARCHAR(30)  NOT NULL,
    position      VARCHAR(30)  NOT NULL,
    salary        INT          NOT NULL,
    hire_date     DATE         NOT NULL,
    email         VARCHAR(100) NOT NULL,
    is_active     BOOLEAN      NOT NULL DEFAULT TRUE
);

INSERT INTO employees (employee_id, name, department, position, salary, hire_date, email, is_active) VALUES
(1, 'Tanaka Taro',    'Engineering', 'Senior Engineer',  5500000, '2020-04-01', 'tanaka@example.com',    TRUE),
(2, 'Suzuki Hanako',  'Engineering', 'Junior Engineer',  3800000, '2023-01-15', 'suzuki@example.com',    TRUE),
(3, 'Sato Kenji',     'Sales',       'Sales Manager',    6000000, '2019-07-01', 'sato@example.com',      TRUE),
(4, 'Yamada Yuki',    'Sales',       'Sales Associate',  3500000, '2022-10-01', 'yamada@example.com',    TRUE),
(5, 'Takahashi Mika', 'HR',          'HR Manager',       5800000, '2018-04-01', 'takahashi@example.com', TRUE),
(6, 'Ito Daisuke',    'Engineering', 'Senior Engineer',  5500000, '2021-06-01', 'ito@example.com',       TRUE),
(7, 'Watanabe Rin',   'HR',          'HR Associate',     3600000, '2023-04-01', 'watanabe@example.com',  FALSE),
(8, 'Nakamura Sho',   'Sales',       'Sales Associate',  3500000, '2024-01-10', 'nakamura@example.com',  TRUE);
```

---

## 演習 1: 全列取得

employees テーブルの全データを取得してください。

**期待される出力列:** employee_id, name, department, position, salary, hire_date, email, is_active

<details>
<summary>ヒント</summary>

全列を取得するには `SELECT *` を使います。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT * FROM employees;
```

</details>

---

## 演習 2: 列を指定して取得

employees テーブルから名前（name）と部署（department）のみを取得してください。

**期待される出力列:** name, department

<details>
<summary>ヒント</summary>

取得したい列名をカンマ区切りで SELECT 句に並べます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, department FROM employees;
```

</details>

---

## 演習 3: 列別名の使用

employees テーブルから name を「社員名」、salary を「年収」という列名で取得してください。

**期待される出力列:** 社員名, 年収

<details>
<summary>ヒント</summary>

AS キーワードを使って列に別名を付けます。日本語の別名は二重引用符で囲みます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name AS "社員名", salary AS "年収" FROM employees;
```

</details>

---

## 演習 4: 重複の除去

employees テーブルに存在する部署（department）の一覧を重複なしで取得してください。

**期待される出力列:** department

<details>
<summary>ヒント</summary>

重複行を除去するには SELECT の直後に DISTINCT を置きます。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT DISTINCT department FROM employees;
```

</details>

---

## 演習 5: 複数列の DISTINCT

employees テーブルから部署（department）と役職（position）の重複しない組み合わせを取得してください。

**期待される出力列:** department, position

<details>
<summary>ヒント</summary>

DISTINCT は SELECT 句に指定した全列の組み合わせで重複を判定します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT DISTINCT department, position FROM employees;
```

</details>

---

## 演習 6: 列別名と DISTINCT の組み合わせ

employees テーブルから重複しない部署の一覧を取得し、列名を「部署名」として表示してください。

**期待される出力列:** 部署名

<details>
<summary>ヒント</summary>

DISTINCT と AS を 1 つのクエリに組み合わせて使います。DISTINCT は SELECT の直後、AS は列名の後に配置します。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT DISTINCT department AS "部署名" FROM employees;
```

</details>
