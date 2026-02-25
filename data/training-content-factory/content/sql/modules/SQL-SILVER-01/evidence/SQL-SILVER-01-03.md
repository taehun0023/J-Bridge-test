# Evidence: SQL-SILVER-01-03

[E1] LEFT JOIN（LEFT OUTER JOIN）は左テーブルの全行を保持し、右テーブルに一致がない場合は NULL で埋める。RIGHT JOIN はその逆で右テーブルの全行を保持する。
[E2] FULL OUTER JOIN は左右両方のテーブルの全行を保持し、一致しない側を NULL で埋める。ANSI SQL 標準で定義されている。
[E3] CROSS JOIN は2つのテーブルの直積（デカルト積）を生成し、左テーブルの各行と右テーブルの全行を組み合わせる。結果行数は左行数 × 右行数となる。
[E4] 自己結合（self-join）は同一テーブルに別名を付けて結合する手法であり、階層データや同一テーブル内の行間比較に使用する。
[E5] USING 句は結合条件を簡潔に書くための構文で、両テーブルに同名の列がある場合に使用できる。ON t1.col = t2.col の代わりに USING(col) と書ける。
[E6] USING 句で指定した列は結果セットに1回のみ出現し、テーブル修飾子なしで参照できる。
[E7] RIGHT JOIN は論理的に LEFT JOIN のテーブル順序を入れ替えたものと等価であるため、可読性のために LEFT JOIN に統一する慣習がある。
[E8] FULL OUTER JOIN は MySQL 8.0 以前ではサポートされていなかったが、ANSI SQL 標準には含まれている。
[E9] CROSS JOIN は結合条件を指定しない場合に使用し、テストデータ生成やカレンダー表の作成などに活用される。
[E10] 自己結合で manager_id と id を結合すると、従業員とその上司の情報を1行で取得できる。
[E11] OUTER JOIN で WHERE 句に右テーブル（NULL 側）の条件を書くと、事実上 INNER JOIN と同じ結果になる場合がある。条件は ON 句に書くか、IS NULL チェックと組み合わせる必要がある。
[E12] NATURAL JOIN は両テーブルの同名列すべてで自動結合するが、意図しない列で結合されるリスクがあるため、本番コードでは USING か ON を明示するのが推奨される。

## Code snippets

```sql
-- RIGHT JOIN
SELECT e.name, d.name AS dept_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;

-- FULL OUTER JOIN
SELECT e.name, d.name AS dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id;

-- CROSS JOIN
SELECT e.name, d.name AS dept_name
FROM employees e
CROSS JOIN departments d;

-- 自己結合（上司の取得）
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;

-- USING 句
SELECT e.name, d.name AS dept_name
FROM employees e
JOIN departments d USING(department_id);

-- FULL OUTER JOIN で一致なしの行を抽出
SELECT e.name, d.name AS dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.id
WHERE e.id IS NULL OR d.id IS NULL;
```

## Sources

- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
- Standard SQL (ISO/IEC 9075)
