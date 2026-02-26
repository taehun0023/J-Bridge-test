# Lab: SQL-GOLD-01-04 — トランザクション

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE accounts (
    id INT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL,
    balance DECIMAL(12, 2) NOT NULL CHECK (balance >= 0)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    version INT NOT NULL DEFAULT 1
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES accounts(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL,
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO accounts VALUES
(1, 'Tanaka', 500000),
(2, 'Suzuki', 300000),
(3, 'Yamamoto', 150000),
(4, 'Sato', 800000),
(5, 'Ito', 50000);

INSERT INTO products VALUES
(1, 'Laptop', 120000, 10, 1),
(2, 'Monitor', 45000, 25, 1),
(3, 'Keyboard', 8000, 50, 1),
(4, 'Mouse', 3000, 100, 1),
(5, 'Headset', 15000, 30, 1);
```

---

## Exercise 1: 基本的な BEGIN / COMMIT / ROLLBACK

口座 1（Tanaka）から口座 2（Suzuki）へ 100,000 円を振り替えるトランザクションを書け。残高を引き落とし、入金し、COMMIT で確定すること。

**要件:**
- BEGIN でトランザクションを開始する
- accounts テーブルの balance を更新する（引き落とし → 入金）
- COMMIT で確定する

<details>
<summary>ヒント</summary>

2 つの UPDATE 文を BEGIN と COMMIT で囲む。

</details>

<details>
<summary>模範解答</summary>

```sql
BEGIN;

UPDATE accounts SET balance = balance - 100000 WHERE id = 1;
UPDATE accounts SET balance = balance + 100000 WHERE id = 2;

COMMIT;

-- 確認
SELECT * FROM accounts WHERE id IN (1, 2);
-- Tanaka: 400000, Suzuki: 400000
```

</details>

---

## Exercise 2: SAVEPOINT による部分ロールバック

1 つのトランザクション内で 3 つの商品を注文する。2 番目の注文の後に SAVEPOINT を設定し、3 番目の注文を ROLLBACK TO SAVEPOINT で取り消した後、別の注文を入れて COMMIT せよ。

**要件:**
- BEGIN でトランザクション開始
- 注文 1: product_id=3（Keyboard）を 2 個、account_id=1
- 注文 2: product_id=4（Mouse）を 5 個、account_id=1
- SAVEPOINT sp1 を設定
- 注文 3: product_id=5（Headset）を 3 個、account_id=1
- ROLLBACK TO SAVEPOINT sp1 で注文 3 を取り消し
- 注文 4: product_id=2（Monitor）を 1 個、account_id=1
- COMMIT で確定

<details>
<summary>ヒント</summary>

SAVEPOINT sp1 で復帰点を作り、ROLLBACK TO SAVEPOINT sp1 でその地点に戻る。注文 1, 2, 4 が残る。

</details>

<details>
<summary>模範解答</summary>

```sql
BEGIN;

INSERT INTO orders (account_id, product_id, quantity, total_amount)
VALUES (1, 3, 2, 16000);

INSERT INTO orders (account_id, product_id, quantity, total_amount)
VALUES (1, 4, 5, 15000);

SAVEPOINT sp1;

INSERT INTO orders (account_id, product_id, quantity, total_amount)
VALUES (1, 5, 3, 45000);

ROLLBACK TO SAVEPOINT sp1;

INSERT INTO orders (account_id, product_id, quantity, total_amount)
VALUES (1, 2, 1, 45000);

COMMIT;

-- 確認: 注文 1, 2, 4 が存在し、注文 3（Headset）は存在しない
SELECT o.id, p.name, o.quantity, o.total_amount
FROM orders o JOIN products p ON o.product_id = p.id
WHERE o.account_id = 1;
```

</details>

---

## Exercise 3: 分離レベルの違いを体験する

2 つのセッションで READ COMMITTED と REPEATABLE READ の動作の違いを確認する手順を書け。以下のシナリオを SQL で記述すること。

**シナリオ:**
1. セッション A で分離レベルを設定してトランザクションを開始し、product_id=1 の stock を読み取る
2. セッション B で product_id=1 の stock を更新して COMMIT する
3. セッション A で再度 product_id=1 の stock を読み取る
4. READ COMMITTED と REPEATABLE READ で結果がどう異なるか確認する

<details>
<summary>ヒント</summary>

SET TRANSACTION ISOLATION LEVEL で分離レベルを設定する。READ COMMITTED では 2 回目の読み取りで変更が見え、REPEATABLE READ では見えない。

</details>

<details>
<summary>模範解答</summary>

```sql
-- === READ COMMITTED の場合 ===

-- セッション A
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
SELECT stock FROM products WHERE id = 1;  -- 結果: 10

    -- セッション B（別のターミナルで実行）
    -- UPDATE products SET stock = 5 WHERE id = 1;
    -- COMMIT;

SELECT stock FROM products WHERE id = 1;  -- 結果: 5（変更が見える）
COMMIT;

-- === REPEATABLE READ の場合 ===

-- stock を 10 に戻す
UPDATE products SET stock = 10 WHERE id = 1;

-- セッション A
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN;
SELECT stock FROM products WHERE id = 1;  -- 結果: 10

    -- セッション B（別のターミナルで実行）
    -- UPDATE products SET stock = 5 WHERE id = 1;
    -- COMMIT;

SELECT stock FROM products WHERE id = 1;  -- 結果: 10（変更が見えない！）
COMMIT;
```

**解説:** READ COMMITTED ではコミット済みの変更が即座に見えるが、REPEATABLE READ ではトランザクション開始時点のスナップショットを見続けるため、他のトランザクションの変更は見えない。

</details>

---

## Exercise 4: デッドロックのシナリオ

2 つのトランザクションが accounts テーブルでデッドロックを起こすシナリオを SQL で記述せよ。

**要件:**
- TX-A: 口座 1 を更新 → 口座 2 を更新
- TX-B: 口座 2 を更新 → 口座 1 を更新
- 実行順序を交互にしてデッドロックを発生させる

<details>
<summary>ヒント</summary>

TX-A が口座 1 をロックし、TX-B が口座 2 をロックした後、互いに相手のロックを要求するとデッドロックが発生する。

</details>

<details>
<summary>模範解答</summary>

```sql
-- === TX-A（セッション 1） ===
BEGIN;
UPDATE accounts SET balance = balance - 10000 WHERE id = 1;  -- id=1 をロック
-- ここで TX-B の操作を待つ

-- === TX-B（セッション 2） ===
BEGIN;
UPDATE accounts SET balance = balance - 20000 WHERE id = 2;  -- id=2 をロック
-- ここで TX-A の操作を待つ

-- === TX-A（セッション 1、続き） ===
UPDATE accounts SET balance = balance + 10000 WHERE id = 2;  -- id=2 のロック待ち...

-- === TX-B（セッション 2、続き） ===
UPDATE accounts SET balance = balance + 20000 WHERE id = 1;  -- id=1 のロック待ち... → デッドロック!

-- RDBMS がデッドロックを検出し、一方のトランザクションをロールバックする
-- ERROR: deadlock detected

-- === 防止策: ロック順序を統一する ===
-- TX-A: id=1 → id=2（昇順）
-- TX-B: id=1 → id=2（昇順）← id=2 → id=1 ではなく順序を統一
BEGIN;
UPDATE accounts SET balance = balance - 20000 WHERE id = 1;  -- 先に id=1
UPDATE accounts SET balance = balance + 20000 WHERE id = 2;  -- 次に id=2
COMMIT;
```

</details>

---

## Exercise 5: 楽観的ロック（version カラム）

products テーブルの version カラムを使った楽観的ロックを実装せよ。product_id=1 の価格を 130,000 に更新するが、他のトランザクションが先に変更していた場合は更新が失敗する（0 行更新）ことを確認する。

**要件:**
1. product_id=1 の現在の price と version を取得する
2. 取得した version を条件に含めて UPDATE を実行する
3. 更新成功の場合と、他で先に version が変わった場合の両方を示す

<details>
<summary>ヒント</summary>

UPDATE ... SET price = 新価格, version = version + 1 WHERE id = 1 AND version = 取得した version; を使う。更新行数が 0 なら他で変更済み。

</details>

<details>
<summary>模範解答</summary>

```sql
-- ステップ 1: 現在の値を取得
SELECT id, name, price, version FROM products WHERE id = 1;
-- 結果: id=1, name='Laptop', price=120000, version=1

-- ステップ 2: 楽観的ロックで更新（成功ケース）
UPDATE products
SET price = 130000, version = version + 1
WHERE id = 1 AND version = 1;
-- 結果: UPDATE 1（1 行更新 → 成功）

-- 確認
SELECT id, name, price, version FROM products WHERE id = 1;
-- 結果: id=1, name='Laptop', price=130000, version=2

-- ステップ 3: 別のトランザクションが古い version で更新を試みる（失敗ケース）
UPDATE products
SET price = 140000, version = version + 1
WHERE id = 1 AND version = 1;
-- 結果: UPDATE 0（0 行更新 → 失敗。version が既に 2 に変わっているため）

-- ステップ 4: 失敗した場合の再試行
-- 最新データを再取得
SELECT id, name, price, version FROM products WHERE id = 1;
-- 結果: id=1, name='Laptop', price=130000, version=2

-- 最新 version で再試行
UPDATE products
SET price = 140000, version = version + 1
WHERE id = 1 AND version = 2;
-- 結果: UPDATE 1（1 行更新 → 成功）
```

</details>
