# Evidence: SQL-BRONZE-01-05

[E1] JOIN は複数のテーブルを結合して 1 つの結果セットを作成する SQL の機能である。
[E2] INNER JOIN は両方のテーブルで結合条件を満たす行のみを返す。一致しない行は除外される。
[E3] LEFT JOIN（LEFT OUTER JOIN）は左テーブルの全行を返し、右テーブルに一致がない場合は NULL で埋める。
[E4] ON 句は結合条件を指定する。通常は主キーと外部キーの等値条件を指定する。
[E5] テーブル別名（alias）は JOIN 文で複数テーブルの列を区別するために使い、クエリの可読性を高める。
[E6] テーブル別名は FROM 句や JOIN 句で AS キーワード（省略可能）の後に指定する。
[E7] 同名の列が複数テーブルに存在する場合、テーブル名またはテーブル別名で修飾しないと曖昧性エラーが発生する。
[E8] 3 つ以上のテーブルを結合する場合は JOIN を連鎖的に記述する。
[E9] INNER JOIN は単に JOIN とも書ける（INNER は省略可能）。
[E10] LEFT JOIN の結果で右テーブル側が NULL のレコードをフィルタすると「左テーブルにあって右テーブルにないデータ」を抽出できる。
[E11] 結合条件を間違えるとクロス結合（全組み合わせ）になり、意図しない大量の行が生成される。
[E12] RIGHT JOIN は LEFT JOIN の左右を入れ替えたものと等価であり、実務では LEFT JOIN に統一する慣習がある。

## Code snippets

```sql
-- INNER JOIN
SELECT e.name, d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- LEFT JOIN
SELECT e.name, d.name AS department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- LEFT JOIN で不一致を抽出
SELECT e.name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.id IS NULL;

-- 3 テーブル結合
SELECT e.name, d.name AS department_name, p.name AS project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN project_assignments pa ON e.id = pa.employee_id
INNER JOIN projects p ON pa.project_id = p.id;

-- テーブル別名を使った自己結合的な例
SELECT e.name AS employee_name, d.name AS dept_name, d.location
FROM employees AS e
LEFT JOIN departments AS d ON e.department_id = d.id;
```

## Sources

- ISO/IEC 9075-1:2023 — Information technology — Database languages — SQL — Part 1: Framework
- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
