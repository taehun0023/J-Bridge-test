# Evidence: SQL-GOLD-01-04 — トランザクション (ACID, 分離レベル, デッドロック)

[E1] トランザクションはデータベース操作の論理的な作業単位であり、複数の SQL 文を一つのまとまりとして扱う。全てが成功すれば COMMIT で確定し、途中で失敗すれば ROLLBACK で全て取り消される。

[E2] ACID 特性はトランザクションが満たすべき 4 つの性質である。Atomicity（原子性）: 全てか無か。Consistency（一貫性）: 制約を常に満たす。Isolation（分離性）: 同時実行が互いに干渉しない。Durability（永続性）: COMMIT 後のデータは障害後も失われない。

[E3] BEGIN（または START TRANSACTION）でトランザクションを明示的に開始する。COMMIT で変更を確定し、ROLLBACK で開始時点の状態に戻す。多くの RDBMS では自動コミットモード（AUTOCOMMIT）がデフォルトであり、明示的に BEGIN しないと各文が独立したトランザクションとして扱われる。

[E4] SAVEPOINT はトランザクション内に中間復帰点を設定する。ROLLBACK TO SAVEPOINT で特定の地点まで部分的にロールバックでき、トランザクション全体を破棄せずに済む。RELEASE SAVEPOINT でセーブポイントを解放する。

[E5] 分離レベル（Isolation Level）はトランザクション間の可視性を制御する。SQL 標準では READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE の 4 段階が定義されている。

[E6] READ UNCOMMITTED は最低の分離レベルであり、他トランザクションの未コミットデータを読める（ダーティリード）。実用上ほとんど使われない。

[E7] READ COMMITTED は多くの RDBMS（PostgreSQL, Oracle など）のデフォルト分離レベルであり、コミット済みのデータのみ読める。同一トランザクション内で同じクエリが異なる結果を返す可能性がある（ノンリピータブルリード）。

[E8] REPEATABLE READ はトランザクション開始時のスナップショットを基準に読み取る。同一クエリは同じ結果を返すが、他トランザクションが挿入した新しい行が見える可能性がある（ファントムリード）。MySQL InnoDB のデフォルト。

[E9] SERIALIZABLE は最高の分離レベルであり、トランザクションを完全に直列実行したかのように振る舞う。ダーティリード、ノンリピータブルリード、ファントムリードのすべてを防ぐが、パフォーマンスが最も低い。

[E10] デッドロックは 2 つ以上のトランザクションが互いにロックの解放を待つ状態であり、どちらも進行できなくなる。RDBMS はデッドロック検出機構を持ち、いずれかのトランザクションを強制ロールバック（victim 選定）して解消する。

[E11] デッドロックを防ぐベストプラクティスは、(1) リソースのロック順序を統一する、(2) トランザクションを短く保つ、(3) 必要最小限のロックを取得する、(4) 適切な分離レベルを選択する、の 4 点である。

[E12] 楽観的ロック（Optimistic Locking）はバージョン番号やタイムスタンプで更新衝突を検出する方式で、実際のロックは取得しない。悲観的ロック（Pessimistic Locking）は SELECT FOR UPDATE などで行を明示的にロックする方式である。

[E13] PostgreSQL は MVCC（Multi-Version Concurrency Control）を使い、読み取りと書き込みが互いをブロックしない。各トランザクションはスナップショットを参照するため、読み取り側にロック待ちが発生しない。

[E14] SET TRANSACTION ISOLATION LEVEL 文でトランザクションの分離レベルを個別に設定できる。セッション全体のデフォルトを変更するには SET SESSION CHARACTERISTICS を使う。

## Code snippets

```sql
-- 基本的なトランザクション
BEGIN;
UPDATE employees SET salary = salary * 1.1 WHERE department_id = 1;
UPDATE departments SET budget = budget - 500000 WHERE id = 1;
COMMIT;

-- SAVEPOINT の使用
BEGIN;
INSERT INTO employees (id, name, department_id, salary, hire_date, email, job_title)
VALUES (20, 'Aoki', 1, 600000, '2025-03-01', 'aoki@example.com', 'Engineer');
SAVEPOINT sp1;
UPDATE employees SET salary = -100 WHERE id = 20;  -- エラー想定
ROLLBACK TO SAVEPOINT sp1;  -- sp1 まで戻す
UPDATE employees SET salary = 600000 WHERE id = 20;
COMMIT;

-- 分離レベルの設定
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;
SELECT * FROM products WHERE stock_quantity > 0;
UPDATE products SET stock_quantity = stock_quantity - 1 WHERE id = 1;
COMMIT;

-- 悲観的ロック（SELECT FOR UPDATE）
BEGIN;
SELECT * FROM products WHERE id = 1 FOR UPDATE;
UPDATE products SET stock_quantity = stock_quantity - 1 WHERE id = 1;
COMMIT;
```

## Sources

- ISO/IEC 9075:2023 (SQL standard) — Part 2: Foundation, Section 4.35 Transactions
- SQL standard — Transaction isolation levels (Section 4.35.4)
