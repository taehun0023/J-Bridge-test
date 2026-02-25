# Evidence: SQL-GOLD-01-03 — DML (INSERT / UPDATE / DELETE / MERGE)

[E1] DML（Data Manipulation Language）はテーブル内のデータを操作する SQL 文の総称であり、INSERT, UPDATE, DELETE, SELECT が含まれる。DDL と異なりトランザクション内で実行され、COMMIT / ROLLBACK で確定・取消が可能である。

[E2] INSERT INTO ... VALUES 文は 1 行または複数行のデータを明示的に挿入する。複数行挿入は INSERT INTO table VALUES (row1), (row2), ... の構文でまとめて記述でき、1 行ずつ INSERT するより高速である。

[E3] INSERT INTO ... SELECT 文は他のテーブルやサブクエリの結果セットをそのまま挿入する。列数とデータ型が一致する必要がある。大量データのコピーやテーブル間のデータ移行に使われる。

[E4] UPDATE SET WHERE 文は指定した条件に一致する行の列値を変更する。WHERE 句を省略すると全行が更新されるため、本番環境では極めて危険である。

[E5] UPDATE 文ではサブクエリを SET 句や WHERE 句で使用可能であり、他テーブルの値を参照して更新する「相関サブクエリ UPDATE」が実務で頻出する。一部の RDBMS では UPDATE ... FROM / UPDATE ... JOIN 構文もサポートする。

[E6] DELETE FROM WHERE 文は条件に一致する行を削除する。WHERE 句を省略すると全行が削除される。DELETE は行ごとにログを記録するため、大量削除は TRUNCATE より低速だがロールバック可能である。

[E7] TRUNCATE TABLE はテーブルの全行を高速に削除するが、多くの RDBMS でロールバック不可であり、トリガーも発火しない。FOREIGN KEY で参照されているテーブルには TRUNCATE できない場合がある。

[E8] MERGE 文（SQL:2003 標準）は対象テーブルとソースを結合し、一致する行は UPDATE、一致しない行は INSERT を行う UPSERT 操作を単一文で実現する。WHEN MATCHED / WHEN NOT MATCHED で分岐を定義する。

[E9] PostgreSQL は MERGE の代わりに INSERT ... ON CONFLICT DO UPDATE（UPSERT）を提供する。MySQL は INSERT ... ON DUPLICATE KEY UPDATE を使う。構文は RDBMS ごとに異なるが、目的は同じ「あれば更新、なければ挿入」である。

[E10] RETURNING 句（PostgreSQL, Oracle など）は INSERT / UPDATE / DELETE の結果行を即座に返す。INSERT 後の自動採番 ID の取得や、DELETE した行の確認に便利である。

[E11] UPDATE や DELETE で WHERE 句を忘れる事故を防ぐため、先に SELECT で対象行を確認してから UPDATE / DELETE に書き換えるのが実務のベストプラクティスである。

[E12] INSERT 時に列リストを省略すると、テーブル定義の全列にデータを指定する必要がある。列の追加・削除でクエリが壊れるため、常に列リストを明示すべきである。

[E13] 大量 INSERT ではバッチ INSERT（複数行 VALUES）やバルクロード（COPY 文など）を使い、1 行ずつの INSERT を避けることでパフォーマンスが大幅に改善する。

[E14] UPDATE / DELETE は実行前に BEGIN TRANSACTION で明示的にトランザクションを開始し、結果を確認してから COMMIT するのが安全なパターンである。

## Code snippets

```sql
-- 複数行 INSERT
INSERT INTO employees (id, name, department_id, salary, hire_date, email, job_title)
VALUES
    (11, 'Morita', 1, 620000, '2025-01-15', 'morita@example.com', 'Engineer'),
    (12, 'Fujita', 2, 580000, '2025-02-01', 'fujita@example.com', 'Sales Rep');

-- INSERT INTO SELECT
INSERT INTO employee_archive (id, name, department_id, salary)
SELECT id, name, department_id, salary
FROM employees
WHERE hire_date < '2020-01-01';

-- UPDATE with subquery
UPDATE employees
SET salary = salary * 1.1
WHERE department_id = (SELECT id FROM departments WHERE name = 'Engineering');

-- DELETE with confirmation pattern
BEGIN;
SELECT * FROM employees WHERE hire_date < '2019-01-01';  -- 確認
DELETE FROM employees WHERE hire_date < '2019-01-01';
COMMIT;

-- MERGE (SQL standard)
MERGE INTO products AS target
USING new_products AS source
ON target.id = source.id
WHEN MATCHED THEN
    UPDATE SET target.price = source.price, target.stock_quantity = source.stock_quantity
WHEN NOT MATCHED THEN
    INSERT (id, name, category, price, cost, stock_quantity)
    VALUES (source.id, source.name, source.category, source.price, source.cost, source.stock_quantity);

-- PostgreSQL UPSERT
INSERT INTO products (id, name, price, stock_quantity)
VALUES (1, 'Widget', 1500, 100)
ON CONFLICT (id) DO UPDATE
SET price = EXCLUDED.price, stock_quantity = EXCLUDED.stock_quantity;
```

## Sources

- ISO/IEC 9075:2023 (SQL standard) — Part 2: Foundation, Section 14 Data manipulation
- SQL:2003 standard — MERGE statement specification
