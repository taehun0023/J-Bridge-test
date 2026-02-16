# Lab: JAVA-SILVER-01-01 — クラスとインスタンス

## 目標

- クラスを定義し、フィールドとメソッドを適切に実装できるようになる。
- アクセス修飾子を正しく使い分け、カプセル化を実現できるようになる。
- `new` キーワードによるインスタンス生成と参照の仕組みを体験する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- ネットワーク接続は不要

## 課題

### 課題1: Productクラスの作成

商品情報を管理する `Product` クラスを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `Product` クラスを作成する
2. 以下の `private` フィールドを定義する:
   - `String name` — 商品名
   - `int price` — 価格（0以上）
   - `int stock` — 在庫数（0以上）
3. 以下の `public` メソッドを実装する:
   - `void setName(String name)` — 商品名を設定する
   - `String getName()` — 商品名を返す
   - `void setPrice(int price)` — 価格を設定する（0未満の場合は設定しない）
   - `int getPrice()` — 価格を返す
   - `void setStock(int stock)` — 在庫数を設定する（0未満の場合は設定しない）
   - `int getStock()` — 在庫数を返す
   - `String getInfo()` — `"商品名:価格円(在庫:在庫数)"` 形式の文字列を返す
     - 例: `"ノートPC:98000円(在庫:5)"`

### 課題2: BankAccountクラスの作成

銀行口座を管理する `BankAccount` クラスを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `BankAccount` クラスを作成する
2. 以下の `private` フィールドを定義する:
   - `String owner` — 口座名義人
   - `int balance` — 残高（初期値0）
3. 以下の `public` メソッドを実装する:
   - `void setOwner(String owner)` — 名義人を設定する
   - `String getOwner()` — 名義人を返す
   - `int getBalance()` — 残高を返す
   - `void deposit(int amount)` — 入金する（amount が 0 以下の場合は何もしない）
   - `boolean withdraw(int amount)` — 出金する。残高が足りれば出金して `true` を返す。残高不足または amount が 0 以下の場合は何もせず `false` を返す

### 課題3: 参照の動作確認

`ReferenceDemo` クラスで参照コピーの動作を確認するプログラムを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `ReferenceDemo` クラスを作成する
2. `public static String demonstrateReference()` メソッドを実装する:
   - `Product` のインスタンスを1つ生成し、名前を `"Original"` に設定する
   - 別の変数に同じインスタンスの参照を代入する
   - 2番目の変数を使って名前を `"Modified"` に変更する
   - 最初の変数から `getName()` で取得した値を返す（参照が同一なら `"Modified"` が返る）

## ファイル構成

```
lab-java-silver-01-01/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── Product.java         # 課題1
    │                   ├── BankAccount.java     # 課題2
    │                   └── ReferenceDemo.java   # 課題3
    └── test/
        └── java/
            └── jp/
                └── co/
                    └── training/
                        └── LabTest.java
```

**pom.xml:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>jp.co.training</groupId>
    <artifactId>java-silver-01-01-lab</artifactId>
    <version>1.0.0</version>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>5.10.2</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>
```

## 自動採点（JUnit 5）

```java
package jp.co.training;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class LabTest {

    // === 課題1: Product ===

    @Test
    @DisplayName("課題1a: Product — 商品名の設定と取得")
    void testProductName() {
        Product p = new Product();
        p.setName("ノートPC");
        assertEquals("ノートPC", p.getName());
    }

    @Test
    @DisplayName("課題1b: Product — 価格の設定と取得")
    void testProductPrice() {
        Product p = new Product();
        p.setPrice(98000);
        assertEquals(98000, p.getPrice());
    }

    @Test
    @DisplayName("課題1c: Product — 負の価格は設定されない")
    void testProductNegativePrice() {
        Product p = new Product();
        p.setPrice(100);
        p.setPrice(-50);
        assertEquals(100, p.getPrice(),
            "負の値を設定しても元の値が維持されること");
    }

    @Test
    @DisplayName("課題1d: Product — 在庫の設定と取得")
    void testProductStock() {
        Product p = new Product();
        p.setStock(5);
        assertEquals(5, p.getStock());
    }

    @Test
    @DisplayName("課題1e: Product — getInfo()の出力形式")
    void testProductGetInfo() {
        Product p = new Product();
        p.setName("ノートPC");
        p.setPrice(98000);
        p.setStock(5);
        assertEquals("ノートPC:98000円(在庫:5)", p.getInfo());
    }

    // === 課題2: BankAccount ===

    @Test
    @DisplayName("課題2a: BankAccount — 名義人の設定と取得")
    void testBankAccountOwner() {
        BankAccount account = new BankAccount();
        account.setOwner("田中太郎");
        assertEquals("田中太郎", account.getOwner());
    }

    @Test
    @DisplayName("課題2b: BankAccount — 初期残高は0")
    void testBankAccountInitialBalance() {
        BankAccount account = new BankAccount();
        assertEquals(0, account.getBalance());
    }

    @Test
    @DisplayName("課題2c: BankAccount — 入金で残高が増える")
    void testBankAccountDeposit() {
        BankAccount account = new BankAccount();
        account.deposit(10000);
        account.deposit(5000);
        assertEquals(15000, account.getBalance());
    }

    @Test
    @DisplayName("課題2d: BankAccount — 0以下の入金は無視される")
    void testBankAccountDepositInvalid() {
        BankAccount account = new BankAccount();
        account.deposit(10000);
        account.deposit(0);
        account.deposit(-500);
        assertEquals(10000, account.getBalance());
    }

    @Test
    @DisplayName("課題2e: BankAccount — 出金成功でtrueを返す")
    void testBankAccountWithdrawSuccess() {
        BankAccount account = new BankAccount();
        account.deposit(10000);
        boolean result = account.withdraw(3000);
        assertTrue(result);
        assertEquals(7000, account.getBalance());
    }

    @Test
    @DisplayName("課題2f: BankAccount — 残高不足でfalseを返す")
    void testBankAccountWithdrawInsufficient() {
        BankAccount account = new BankAccount();
        account.deposit(1000);
        boolean result = account.withdraw(5000);
        assertFalse(result);
        assertEquals(1000, account.getBalance(),
            "残高不足の場合、残高は変化しないこと");
    }

    // === 課題3: ReferenceDemo ===

    @Test
    @DisplayName("課題3: ReferenceDemo — 参照コピーの動作確認")
    void testReferenceDemo() {
        String result = ReferenceDemo.demonstrateReference();
        assertEquals("Modified", result,
            "参照コピーにより、同一オブジェクトの変更が反映されること");
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全12テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `getInfo()` では文字列連結 (`+`) を使って `"商品名:価格円(在庫:在庫数)"` 形式にする。`setPrice` と `setStock` では `if (price >= 0)` のようなバリデーションを入れる。
- **課題2のヒント:** `withdraw` では `amount > 0 && balance >= amount` の条件を満たす場合のみ出金を実行する。`deposit` では `amount > 0` の場合のみ残高に加算する。
- **課題3のヒント:** `Product p1 = new Product(); Product p2 = p1;` のように代入すると、p1とp2は同一オブジェクトを参照する。p2経由で変更した結果はp1からも見える。
- **カプセル化の注意:** フィールドを `private` にし忘れるとテストでは検知できないが、設計として不適切である。フィールドには必ず `private` を付けること。
