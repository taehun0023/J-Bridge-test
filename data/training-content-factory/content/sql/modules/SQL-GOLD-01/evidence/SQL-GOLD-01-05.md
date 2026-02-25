# Evidence: SQL-GOLD-01-05 — インデックスと実行計画

[E1] インデックスはテーブル内のデータを高速に検索するための補助的なデータ構造であり、書籍の索引に相当する。インデックスがなければ全行を走査（フルテーブルスキャン）する必要がある。

[E2] B-tree（Balanced Tree）は最も一般的なインデックス構造であり、等価検索（=）と範囲検索（<, >, BETWEEN）の両方を効率的に処理できる。多くの RDBMS でデフォルトのインデックス型である。

[E3] CREATE INDEX 文でテーブルの列にインデックスを作成する。CREATE INDEX idx_name ON table(column) が基本構文。CREATE UNIQUE INDEX にすると一意制約付きのインデックスになる。

[E4] 複合インデックス（Composite Index）は複数列を組み合わせたインデックスである。CREATE INDEX idx ON table(col1, col2) で作成する。左端列優先（Leftmost Prefix）の原則により、(col1, col2) のインデックスは col1 単独の検索にも使えるが、col2 単独の検索には使えない。

[E5] カバリングインデックス（Covering Index）はクエリが必要とする全ての列を含むインデックスである。テーブル本体へのアクセスが不要になり（Index Only Scan）、I/O が大幅に削減される。

[E6] EXPLAIN（または EXPLAIN ANALYZE）はクエリの実行計画を表示するコマンドである。EXPLAIN は推定コストのみ、EXPLAIN ANALYZE は実際に実行して実測値も含めて表示する。

[E7] フルテーブルスキャン（Seq Scan）はテーブルの全行を順次読み取る方式で、インデックスなし時やテーブルの大部分を取得する場合に選択される。少量データのテーブルではインデックスより高速な場合もある。

[E8] インデックススキャン（Index Scan）はインデックスを使って条件に一致する行を特定し、テーブルから該当行を取得する。選択性（Selectivity）が高い（=結果行が少ない）クエリで有効である。

[E9] インデックスオンリースキャン（Index Only Scan）はインデックスだけで必要なデータを取得し、テーブル本体にアクセスしない。カバリングインデックスが存在する場合に発生し、最も高速である。

[E10] インデックスを追加するとSELECT は高速化するが、INSERT / UPDATE / DELETE はインデックスの更新コストにより低速化する。インデックスの数はトレードオフであり、読み取り中心のワークロードでは多く、書き込み中心では最小限にすべきである。

[E11] WHERE 句で関数を適用した列（例: WHERE UPPER(name) = 'TANAKA'）ではインデックスが使われない（SARGable でない）。関数インデックス（CREATE INDEX idx ON table(UPPER(name))）で対処可能だが、クエリ側を修正する方が望ましい。

[E12] 統計情報（Statistics）はオプティマイザが実行計画を決定するために使うデータ分布の情報である。ANALYZE コマンド（PostgreSQL）で統計を更新する。統計が古いと最適でない実行計画が選ばれる。

[E13] ハッシュインデックスは等価検索（=）のみに特化したインデックスで、範囲検索には使えない。PostgreSQL ではバージョン 10 以降で WAL 対応となり実用的になった。

[E14] 部分インデックス（Partial Index）は WHERE 条件付きで作成するインデックスで、特定の条件に一致する行のみをインデックス化する。CREATE INDEX idx ON table(col) WHERE condition の構文で作成し、インデックスサイズの削減と検索速度の向上を両立する。

[E15] インデックスの選定基準は (1) WHERE 句で頻繁に使われる列、(2) JOIN 条件の列、(3) ORDER BY で使われる列、(4) 選択性の高い列（カーディナリティが高い列）を優先する。

## Code snippets

```sql
-- 基本的なインデックス作成
CREATE INDEX idx_employees_department ON employees(department_id);
CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE UNIQUE INDEX idx_employees_email ON employees(email);

-- 複合インデックス
CREATE INDEX idx_sales_emp_date ON sales(employee_id, sale_date);

-- 部分インデックス
CREATE INDEX idx_active_employees ON employees(department_id)
WHERE job_title != 'Retired';

-- EXPLAIN で実行計画を確認
EXPLAIN SELECT * FROM employees WHERE department_id = 1;
EXPLAIN ANALYZE SELECT * FROM sales WHERE sale_date BETWEEN '2025-01-01' AND '2025-03-31';

-- インデックスが使われないパターン
EXPLAIN SELECT * FROM employees WHERE UPPER(name) = 'TANAKA';  -- Seq Scan

-- 関数インデックスで対処
CREATE INDEX idx_employees_upper_name ON employees(UPPER(name));
EXPLAIN SELECT * FROM employees WHERE UPPER(name) = 'TANAKA';  -- Index Scan
```

## Sources

- ISO/IEC 9075:2023 (SQL standard) — Part 2: Foundation, Section 11.8 Index definition
- PostgreSQL documentation — Indexes, EXPLAIN
- B-tree index structure — Knuth, The Art of Computer Programming, Vol. 3
