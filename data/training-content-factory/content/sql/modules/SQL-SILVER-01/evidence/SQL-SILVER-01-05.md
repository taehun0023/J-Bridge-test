# Evidence: SQL-SILVER-01-05

[E1] CASE 式は SQL における条件分岐を実現する式であり、SELECT 句、WHERE 句、ORDER BY 句、UPDATE の SET 句など様々な場所で使用できる。
[E2] 検索 CASE 式の構文は CASE WHEN condition THEN result [WHEN ...] [ELSE default] END であり、最初に TRUE となった WHEN の THEN 値を返す。
[E3] 単純 CASE 式の構文は CASE expression WHEN value THEN result [WHEN ...] [ELSE default] END であり、式の値と各 WHEN 値を比較する。
[E4] CASE 式で ELSE を省略した場合、どの WHEN 条件にも一致しない行に対して NULL が返される。
[E5] COALESCE(expr1, expr2, ...) は引数を左から順に評価し、最初の非 NULL 値を返す。すべて NULL の場合は NULL を返す。
[E6] COALESCE は CASE WHEN expr1 IS NOT NULL THEN expr1 WHEN expr2 IS NOT NULL THEN expr2 ... END と等価である。
[E7] NULLIF(expr1, expr2) は2つの式が等しい場合に NULL を返し、異なる場合に expr1 を返す。ゼロ除算の回避に活用される。
[E8] 条件付き集約（conditional aggregation）は CASE 式を集約関数内に入れることで、1回のクエリで複数条件の集計を行うテクニックである。
[E9] SUM(CASE WHEN condition THEN 1 ELSE 0 END) は条件を満たす行数をカウントするパターンであり、COUNT(CASE WHEN condition THEN 1 END) とも書ける。
[E10] NULL は他の NULL と等しくない。col = NULL は常に UNKNOWN となるため、NULL の判定には IS NULL / IS NOT NULL を使用する。
[E11] 集約関数（SUM, AVG, COUNT(列名)等）は NULL を無視して計算する。COUNT(*) のみ NULL を含む全行をカウントする。
[E12] CASE 式の各 THEN / ELSE の戻り値は互換性のあるデータ型である必要がある。文字型と数値型を混在させるとエラーまたは暗黙の型変換が発生する。

## Code snippets

```sql
-- 検索 CASE 式
SELECT name, salary,
  CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary >= 50000 THEN 'Mid'
    ELSE 'Low'
  END AS salary_grade
FROM employees;

-- 単純 CASE 式
SELECT name, status,
  CASE status
    WHEN 'shipped' THEN '発送済'
    WHEN 'pending' THEN '保留中'
    WHEN 'cancelled' THEN 'キャンセル'
    ELSE '不明'
  END AS status_jp
FROM orders;

-- COALESCE
SELECT name, COALESCE(email, 'no-email@example.com') AS contact
FROM employees;

-- NULLIF（ゼロ除算回避）
SELECT name, revenue / NULLIF(cost, 0) AS profit_ratio
FROM products;

-- 条件付き集約
SELECT department_id,
  COUNT(*) AS total,
  SUM(CASE WHEN salary >= 60000 THEN 1 ELSE 0 END) AS high_earners,
  AVG(CASE WHEN hire_date >= '2023-01-01' THEN salary END) AS new_hire_avg
FROM employees
GROUP BY department_id;
```

## Sources

- ISO/IEC 9075-2:2023 — Information technology — Database languages — SQL — Part 2: Foundation
- Standard SQL (ISO/IEC 9075)
