# Lab: SQL-BRONZE-01-03 — ORDER BY / LIMIT / OFFSET

## セットアップ

以下のテーブルとデータを使用する。

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT,
    stock INT NOT NULL
);

INSERT INTO employees VALUES
(1, 'Tanaka',    'Engineering', 800000, '2020-04-01'),
(2, 'Suzuki',    'Engineering', 650000, '2021-07-15'),
(3, 'Yamamoto',  'Sales',       600000, '2022-01-10'),
(4, 'Sato',      'Sales',       750000, '2019-10-01'),
(5, 'Ito',       'Engineering', 650000, '2021-03-20'),
(6, 'Watanabe',  'HR',          550000, '2022-06-01'),
(7, 'Kobayashi', 'HR',          700000, '2020-08-15'),
(8, 'Kato',      'Sales',       500000, '2023-02-01'),
(9, 'Nakamura',  'Engineering', 720000, '2020-11-01'),
(10, 'Yoshida',  'HR',          580000, '2023-04-15');

INSERT INTO products VALUES
(1, 'ノートPC',       'Electronics', 120000, 25),
(2, 'マウス',         'Electronics', 3000,   150),
(3, 'キーボード',     'Electronics', 8000,   80),
(4, 'モニター',       'Electronics', 45000,  40),
(5, 'デスク',         'Furniture',   35000,  15),
(6, 'チェア',         'Furniture',   50000,  20),
(7, 'ヘッドセット',   'Electronics', NULL,   0),
(8, 'USBケーブル',    'Accessories', 500,    200),
(9, 'マウスパッド',   'Accessories', NULL,   100),
(10, 'Webカメラ',     'Electronics', 12000,  60);
```

---

## Exercise 1: ASC / DESC ソート

employees テーブルから全従業員を給与の降順で取得せよ。給与が同じ場合は名前の昇順で並べよ。

**期待される出力列:** `name, department, salary`

<details>
<summary>ヒント</summary>

ORDER BY に複数の列を指定し、それぞれに ASC または DESC を付ける。デフォルトは ASC なので、昇順の場合は省略可能。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, department, salary
FROM employees
ORDER BY salary DESC, name ASC;
```

</details>

---

## Exercise 2: 複数列ソート

employees テーブルから全従業員を部門名の昇順、同一部門内では入社日の古い順に取得せよ。

**期待される出力列:** `name, department, hire_date, salary`

<details>
<summary>ヒント</summary>

ORDER BY department ASC で部門名をソートし、第 2 キーとして hire_date ASC を指定する。入社日が古い＝値が小さい＝昇順。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, department, hire_date, salary
FROM employees
ORDER BY department ASC, hire_date ASC;
```

</details>

---

## Exercise 3: LIMIT による上位取得

products テーブルから価格が高い順に上位 3 件を取得せよ。ただし price が NULL の行は除外すること。

**期待される出力列:** `name, category, price`

<details>
<summary>ヒント</summary>

WHERE price IS NOT NULL で NULL を除外し、ORDER BY price DESC で価格の高い順に並べ、LIMIT 3 で 3 件に制限する。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, category, price
FROM products
WHERE price IS NOT NULL
ORDER BY price DESC
LIMIT 3;
```

</details>

---

## Exercise 4: OFFSET + LIMIT によるページング

products テーブルから price が NULL でない商品を価格の昇順で並べ、2 ページ目を取得せよ（1 ページあたり 3 件）。

**期待される出力列:** `name, category, price`

<details>
<summary>ヒント</summary>

1 ページあたり 3 件の 2 ページ目は、先頭 3 件をスキップして次の 3 件を取得する。OFFSET 3 LIMIT 3 を使う。ORDER BY なしでは結果が不定になるため必ず ORDER BY を指定すること。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, category, price
FROM products
WHERE price IS NOT NULL
ORDER BY price ASC
LIMIT 3 OFFSET 3;
```

</details>

---

## Exercise 5: NULLS LAST によるソート制御

products テーブルの全商品を価格の昇順で取得せよ。ただし price が NULL の商品は最後に表示すること。

**期待される出力列:** `name, category, price`

<details>
<summary>ヒント</summary>

ORDER BY price ASC NULLS LAST を使う。NULLS LAST を指定すると NULL 値がソート結果の最後に配置される。

</details>

<details>
<summary>模範解答</summary>

```sql
SELECT name, category, price
FROM products
ORDER BY price ASC NULLS LAST;
```

</details>
