# Evidence: SQL-BRONZE-01-01

[E1] SELECT 文は SQL においてデータを取得するための基本構文であり、最低限 SELECT と FROM の 2 つの句で構成される。
[E2] SELECT * はテーブルの全列を取得する省略記法であるが、本番コードでは列名を明示するのが推奨される。
[E3] SELECT 句に列名をカンマ区切りで並べることで、取得する列を限定できる。
[E4] AS キーワードを用いた列別名（alias）は、結果セットの列ヘッダーを変更するが、元テーブルのスキーマには影響しない。
[E5] AS キーワードは省略可能であり、`SELECT name employee_name FROM employees` のように書ける（ANSI SQL 準拠）。
[E6] DISTINCT キーワードは SELECT の直後に置き、結果セットから重複行を除去する。
[E7] DISTINCT は SELECT 句に指定された全列の組み合わせに対して重複判定を行う。
[E8] FROM 句はデータソースとなるテーブルまたはビューを指定する。
[E9] SQL キーワード（SELECT, FROM, AS, DISTINCT 等）は大文字・小文字を区別しないが、慣例として大文字表記が多い。
[E10] 列別名にスペースや予約語を含める場合は二重引用符（ANSI SQL）で囲む必要がある。
[E11] SELECT DISTINCT は内部的にソートまたはハッシュ処理を行うため、大量データに対してはパフォーマンスコストが発生する。
[E12] SQL 文の末尾にはセミコロン（;）を付けるのが標準であり、複数の文を区切る役割を持つ。

## Code snippets

```sql
-- 全列取得
SELECT * FROM employees;

-- 列指定
SELECT name, salary FROM employees;

-- 列別名（AS あり）
SELECT name AS employee_name, salary AS monthly_salary FROM employees;

-- 列別名（AS 省略）
SELECT name employee_name, salary monthly_salary FROM employees;

-- DISTINCT（単一列）
SELECT DISTINCT department_id FROM employees;

-- DISTINCT（複数列の組み合わせ）
SELECT DISTINCT department_id, salary FROM employees;
```

## Sources

- ISO/IEC 9075-1:2023 — Information technology — Database languages — SQL — Part 1: Framework
- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
