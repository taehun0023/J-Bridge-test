# Lab: SQL-BRONZE-01-02 — WHERE と演算子

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary INT NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(200),
    manager_id INT
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price INT NOT NULL,
    stock INT,
    discontinued BOOLEAN DEFAULT FALSE,
    description VARCHAR(500)
);

INSERT INTO employees VALUES
(1, 'Tanaka',    'Engineering', 650000, '2020-04-01', 'tanaka@example.com', NULL),
(2, 'Suzuki',    'Engineering', 500000, '2021-07-15', 'suzuki@example.com', 1),
(3, 'Yamamoto',  'Sales',       480000, '2022-01-10', NULL,                 1),
(4, 'Sato',      'Sales',       550000, '2019-10-01', 'sato@example.com',   NULL),
(5, 'Ito',       'HR',          520000, '2021-03-20', 'ito@example.com',    4),
(6, 'Watanabe',  'HR',          470000, '2023-06-01', 'watanabe@example.com', 4),
(7, 'Kobayashi', 'Engineering', 700000, '2018-08-15', 'kobayashi@example.com', NULL),
(8, 'Kato',      NULL,          450000, '2024-02-01', 'kato@example.com',   7);

INSERT INTO products VALUES
(1, 'ノートPC',     'Electronics', 120000, 15,   FALSE, 'ビジネス向け軽量ノートPC'),
(2, 'マウス',       'Electronics', 3500,   200,  FALSE, 'ワイヤレスマウス'),
(3, 'デスク',       'Furniture',   45000,  30,   FALSE, 'スタンディングデスク'),
(4, 'モニター',     'Electronics', 35000,  50,   FALSE, '27インチ 4Kモニター'),
(5, 'キーボード',   'Electronics', 8000,   NULL, FALSE, NULL),
(6, 'プリンター',   'Electronics', 25000,  0,    TRUE,  '旧モデル・販売終了'),
(7, 'チェア',       'Furniture',   60000,  12,   FALSE, 'エルゴノミクスチェア'),
(8, '付箋',         'Stationery',  300,    500,  FALSE, '75mm正方形 5色パック'),
(9, 'ペン',         'Stationery',  150,    NULL, FALSE, NULL),
(10, 'ホワイトボード', 'Furniture', 18000,  8,    FALSE, '900x600mm');
```

---

## Exercise 1: 等値比較と比較演算子

Engineering 部門に所属し、かつ給与が 500000 以上の従業員の名前と給与を取得せよ。

**期待される出力列:** `name, salary`

<details>
<summary>ヒント</summary>

WHERE 句で department = 'Engineering' と salary >= 500000 の 2 つの条件を AND で結合する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, salary
FROM employees
WHERE department = 'Engineering'
  AND salary >= 500000
ORDER BY salary DESC;
```

結果:

| name      | salary |
|-----------|--------|
| Kobayashi | 700000 |
| Tanaka    | 650000 |
| Suzuki    | 500000 |

</details>

---

## Exercise 2: BETWEEN と IN

給与が 470000 以上 550000 以下の従業員のうち、部門が Sales または HR の従業員の名前、部門、給与を取得せよ。

**期待される出力列:** `name, department, salary`

<details>
<summary>ヒント</summary>

BETWEEN を使って給与範囲を指定し、IN を使って部門を絞り込む。両方の条件を AND で結合する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, department, salary
FROM employees
WHERE salary BETWEEN 470000 AND 550000
  AND department IN ('Sales', 'HR')
ORDER BY salary DESC;
```

結果:

| name     | department | salary |
|----------|------------|--------|
| Sato     | Sales      | 550000 |
| Ito      | HR         | 520000 |
| Yamamoto | Sales      | 480000 |
| Watanabe | HR         | 470000 |

</details>

---

## Exercise 3: LIKE によるパターンマッチング

products テーブルから、名前に「ー」（長音）を含む商品の名前とカテゴリを取得せよ。また、別のクエリで description が「ビジネス」で始まる商品の名前と説明を取得せよ。

**期待される出力列:**
- クエリ1: `name, category`
- クエリ2: `name, description`

<details>
<summary>ヒント</summary>

LIKE '%ー%' で「ー」を含む文字列を検索する。LIKE 'ビジネス%' で「ビジネス」で始まる文字列を検索する。

</details>

<details>
<summary>模範解答</summary>

```sql
-- クエリ1: 名前に「ー」を含む商品
SELECT name, category
FROM products
WHERE name LIKE '%ー%';
```

結果:

| name           | category    |
|----------------|-------------|
| ノートPC       | Electronics |
| マウス         | Electronics |
| モニター       | Electronics |
| キーボード     | Electronics |
| プリンター     | Electronics |
| チェア         | Furniture   |
| ホワイトボード | Furniture   |

```sql
-- クエリ2: description が「ビジネス」で始まる商品
SELECT name, description
FROM products
WHERE description LIKE 'ビジネス%';
```

結果:

| name     | description            |
|----------|------------------------|
| ノートPC | ビジネス向け軽量ノートPC |

</details>

---

## Exercise 4: IS NULL と IS NOT NULL

部門が未設定（NULL）の従業員と、products テーブルで description が NULL の商品をそれぞれ取得せよ。

**期待される出力列:**
- クエリ1: `name, department`（従業員）
- クエリ2: `name, category`（商品）

<details>
<summary>ヒント</summary>

NULL の判定には = NULL ではなく IS NULL を使う。= NULL は常に UNKNOWN を返すため正しく動作しない。

</details>

<details>
<summary>模範解答</summary>

```sql
-- クエリ1: 部門が未設定の従業員
SELECT name, department
FROM employees
WHERE department IS NULL;
```

結果:

| name | department |
|------|------------|
| Kato | NULL       |

```sql
-- クエリ2: description が NULL の商品
SELECT name, category
FROM products
WHERE description IS NULL;
```

結果:

| name       | category    |
|------------|-------------|
| キーボード | Electronics |
| ペン       | Stationery  |

</details>

---

## Exercise 5: AND / OR / NOT と括弧による優先順位制御

products テーブルから、以下の条件を満たす商品を取得せよ:
「Electronics カテゴリで価格が 10000 未満」 **または** 「Stationery カテゴリ」の商品。ただし、販売終了（discontinued = TRUE）の商品は除外する。

**期待される出力列:** `name, category, price, discontinued`

<details>
<summary>ヒント</summary>

AND は OR より優先順位が高いため、OR 条件を括弧で囲まないと意図と異なる結果になる。NOT を使って discontinued = TRUE を除外する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, category, price, discontinued
FROM products
WHERE (
        (category = 'Electronics' AND price < 10000)
        OR category = 'Stationery'
      )
  AND NOT discontinued
ORDER BY category, price;
```

結果:

| name       | category    | price | discontinued |
|------------|-------------|-------|--------------|
| マウス     | Electronics | 3500  | FALSE        |
| キーボード | Electronics | 8000  | FALSE        |
| ペン       | Stationery  | 150   | FALSE        |
| 付箋       | Stationery  | 300   | FALSE        |

注意: プリンター（Electronics, 25000）は価格条件で除外。discontinued = TRUE の商品も除外される。括弧を付けないと AND が先に評価され、意図しない結果になる可能性がある。

</details>
