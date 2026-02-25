# Evidence: SQL-GOLD-01-01 — ウィンドウ関数

[E1] ウィンドウ関数は SQL:2003 で標準化され、集約をしつつ各行を保持したまま計算できる仕組みである。GROUP BY と異なり、行を潰さない。

[E2] OVER 句はウィンドウ関数の必須構成要素であり、PARTITION BY で分割キー、ORDER BY で順序を指定する。OVER() を空にするとテーブル全体が 1 つのウィンドウになる。

[E3] ROW_NUMBER() は各パーティション内で一意の連番を振る。同値があっても番号は重複しない（非決定的な場合がある）。

[E4] RANK() は同値に同じ順位を付与し、次の順位をスキップする（例: 1, 2, 2, 4）。DENSE_RANK() はスキップしない（例: 1, 2, 2, 3）。

[E5] LAG(column, offset, default) は現在行より offset 行前の値を返す。LEAD(column, offset, default) は offset 行後の値を返す。offset のデフォルトは 1。

[E6] SUM() OVER / AVG() OVER など集約関数にウィンドウを適用すると、累積合計・移動平均を行ごとに計算できる。

[E7] フレーム句（ROWS BETWEEN ... AND ...）はウィンドウフレームの範囲を制御する。デフォルトは RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW。

[E8] ROWS フレームは物理行数で範囲を決め、RANGE フレームは値の論理範囲で決める。ROWS の方が挙動が直感的で予測しやすい。

[E9] NTILE(n) はパーティション内の行を n 個のバケットに均等分割する。行数が n で割り切れない場合、先頭バケットに余りが分配される。

[E10] ウィンドウ関数は SELECT 句と ORDER BY 句でのみ使用可能。WHERE 句や HAVING 句で直接使うことはできない。サブクエリでラップする必要がある。

[E11] FIRST_VALUE() / LAST_VALUE() はフレーム内の最初・最後の値を返す。LAST_VALUE() はデフォルトフレームが CURRENT ROW までのため、UNBOUNDED FOLLOWING を明示しないと期待通りに動かない。

[E12] 複数のウィンドウ関数で同じ OVER 定義を使う場合、WINDOW 句（WINDOW w AS (PARTITION BY ...)）で名前を付けて再利用できる（SQL:2003 標準）。

[E13] ウィンドウ関数はクエリの論理実行順序で WHERE / GROUP BY / HAVING の後、ORDER BY の前に評価される。

## Code snippets

```sql
-- ROW_NUMBER / RANK / DENSE_RANK の比較
SELECT
    name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    RANK()       OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rnk
FROM employees;

-- LAG / LEAD で前月比を計算
SELECT
    sale_date,
    amount,
    LAG(amount, 1, 0)  OVER (ORDER BY sale_date) AS prev_amount,
    LEAD(amount, 1, 0) OVER (ORDER BY sale_date) AS next_amount,
    amount - LAG(amount, 1, 0) OVER (ORDER BY sale_date) AS diff
FROM sales;

-- 累積合計（Running Total）
SELECT
    sale_date,
    amount,
    SUM(amount) OVER (ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM sales;

-- 3行移動平均
SELECT
    sale_date,
    amount,
    AVG(amount) OVER (ORDER BY sale_date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg_3
FROM sales;
```

## Sources

- ISO/IEC 9075:2023 (SQL standard) — Part 2: Foundation, Section 7.11 Window functions
- SQL:2003 standard — Window function specification
