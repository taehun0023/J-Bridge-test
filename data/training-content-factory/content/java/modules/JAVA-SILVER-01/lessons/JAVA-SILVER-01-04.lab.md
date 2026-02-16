# Lab: JAVA-SILVER-01-04 — ポリモーフィズムと抽象クラス

## 目標

- ポリモーフィズムを活用して、スーパークラス型の変数で異なるサブクラスを統一的に扱えるようになる。
- 抽象クラスと抽象メソッドを正しく定義・実装できるようになる。
- `instanceof` を使った安全なダウンキャストを実装できるようになる。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- ネットワーク接続は不要

## 課題

### 課題1: 抽象クラスとポリモーフィズム

料金計算システムの階層を構築せよ。

**要件:**

**Ticket（抽象クラス）:**
1. パッケージ `jp.co.training` に属する
2. `protected String name` フィールド
3. `Ticket(String name)` コンストラクタ
4. `public String getName()` — チケット名を返す
5. `public abstract int getPrice()` — 抽象メソッド（料金を返す）
6. `toString()` をオーバーライドし `"チケット名: 料金円"` 形式の文字列を返す（例: `"大人: 1000円"`）

**AdultTicket（Ticket を継承）:**
1. `private int basePrice` フィールド
2. `AdultTicket(int basePrice)` コンストラクタ（名前は `"大人"`）
3. `getPrice()` は `basePrice` を返す

**ChildTicket（Ticket を継承）:**
1. `private int basePrice` フィールド
2. `ChildTicket(int basePrice)` コンストラクタ（名前は `"子供"`）
3. `getPrice()` は `basePrice / 2` を返す（半額）

**SeniorTicket（Ticket を継承）:**
1. `private int basePrice` フィールド
2. `SeniorTicket(int basePrice)` コンストラクタ（名前は `"シニア"`）
3. `getPrice()` は `(int)(basePrice * 0.7)` を返す（3割引）

**TicketCounter（ユーティリティクラス）:**
1. `public static int calculateTotal(Ticket[] tickets)` — チケット配列の合計料金を返す（ポリモーフィズムを活用）

### 課題2: instanceof を使ったダウンキャスト

動物の分類を行うプログラムを作成せよ。

**要件:**

**Animal（抽象クラス）:**
1. パッケージ `jp.co.training` に属する
2. `protected String name` フィールド
3. `Animal(String name)` コンストラクタ
4. `public String getName()` — 名前を返す
5. `public abstract String getSound()` — 鳴き声を返す抽象メソッド

**Swimmable（インタフェース — 後のレッスンの先取り）:**
- ここでは使用しない。代わりに `Dog` クラスに `public String fetch()` メソッドを持たせる

**Dog（Animal を継承）:**
1. `Dog(String name)` コンストラクタ
2. `getSound()` は `"ワン"` を返す
3. `public String fetch()` — `"名前がボールを持ってきた"` を返す

**Cat（Animal を継承）:**
1. `Cat(String name)` コンストラクタ
2. `getSound()` は `"ニャー"` を返す
3. `public String purr()` — `"名前がゴロゴロ言っている"` を返す

**AnimalHelper（ユーティリティクラス）:**
1. `public static String describeAll(Animal[] animals)` — 各動物の `"名前: 鳴き声"` を改行区切りで連結した文字列を返す
2. `public static String tryFetch(Animal animal)` — 引数が `Dog` のインスタンスなら `fetch()` を呼び出して結果を返す。それ以外は `"フェッチできません"` を返す（`instanceof` を使用すること）

### 課題3: テンプレートメソッドパターン

データ変換の共通フローを実装せよ。

**要件:**

**DataConverter（抽象クラス）:**
1. パッケージ `jp.co.training` に属する
2. `public final String convert(String input)` — テンプレートメソッド。以下の順で処理する:
   - `validate(input)` を呼び出し、`false` なら `"ERROR: invalid input"` を返す
   - `true` なら `transform(input)` を呼び出して結果を返す
3. `protected abstract boolean validate(String input)` — 入力の妥当性を検証する抽象メソッド
4. `protected abstract String transform(String input)` — 変換処理を行う抽象メソッド

**UpperCaseConverter（DataConverter を継承）:**
1. `validate` は `input` が `null` でなく空文字でなければ `true` を返す
2. `transform` は `input.toUpperCase()` を返す

**CsvToTabConverter（DataConverter を継承）:**
1. `validate` は `input` が `null` でなくカンマを含んでいれば `true` を返す
2. `transform` は `input` 内のカンマをタブ文字 (`\t`) に置換した文字列を返す

## ファイル構成

```
lab-java-silver-01-04/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── Ticket.java           # 課題1
    │                   ├── AdultTicket.java       # 課題1
    │                   ├── ChildTicket.java       # 課題1
    │                   ├── SeniorTicket.java      # 課題1
    │                   ├── TicketCounter.java     # 課題1
    │                   ├── Animal.java            # 課題2
    │                   ├── Dog.java               # 課題2
    │                   ├── Cat.java               # 課題2
    │                   ├── AnimalHelper.java      # 課題2
    │                   ├── DataConverter.java     # 課題3
    │                   ├── UpperCaseConverter.java # 課題3
    │                   └── CsvToTabConverter.java  # 課題3
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
    <artifactId>java-silver-01-04-lab</artifactId>
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

    // === 課題1: Ticket 階層とポリモーフィズム ===

    @Test
    @DisplayName("課題1a: AdultTicket — 基本料金をそのまま返す")
    void testAdultTicket() {
        AdultTicket t = new AdultTicket(1000);
        assertEquals("大人", t.getName());
        assertEquals(1000, t.getPrice());
    }

    @Test
    @DisplayName("課題1b: ChildTicket — 半額を返す")
    void testChildTicket() {
        ChildTicket t = new ChildTicket(1000);
        assertEquals("子供", t.getName());
        assertEquals(500, t.getPrice());
    }

    @Test
    @DisplayName("課題1c: SeniorTicket — 3割引を返す")
    void testSeniorTicket() {
        SeniorTicket t = new SeniorTicket(1000);
        assertEquals("シニア", t.getName());
        assertEquals(700, t.getPrice());
    }

    @Test
    @DisplayName("課題1d: Ticket.toString() — 正しい形式")
    void testTicketToString() {
        Ticket t = new AdultTicket(1000);
        assertEquals("大人: 1000円", t.toString());
    }

    @Test
    @DisplayName("課題1e: TicketCounter — 合計料金の計算（ポリモーフィズム）")
    void testTicketCounterTotal() {
        Ticket[] tickets = {
            new AdultTicket(1000),
            new ChildTicket(1000),
            new SeniorTicket(1000)
        };
        assertEquals(2200, TicketCounter.calculateTotal(tickets));
    }

    // === 課題2: instanceof とダウンキャスト ===

    @Test
    @DisplayName("課題2a: Dog — getSound()とfetch()")
    void testDog() {
        Dog dog = new Dog("ポチ");
        assertEquals("ワン", dog.getSound());
        assertEquals("ポチがボールを持ってきた", dog.fetch());
    }

    @Test
    @DisplayName("課題2b: Cat — getSound()とpurr()")
    void testCat() {
        Cat cat = new Cat("タマ");
        assertEquals("ニャー", cat.getSound());
        assertEquals("タマがゴロゴロ言っている", cat.purr());
    }

    @Test
    @DisplayName("課題2c: AnimalHelper.describeAll — 全動物の説明")
    void testDescribeAll() {
        Animal[] animals = { new Dog("ポチ"), new Cat("タマ") };
        String result = AnimalHelper.describeAll(animals);
        assertEquals("ポチ: ワン\nタマ: ニャー", result);
    }

    @Test
    @DisplayName("課題2d: AnimalHelper.tryFetch — Dogの場合")
    void testTryFetchDog() {
        Animal dog = new Dog("ポチ");
        assertEquals("ポチがボールを持ってきた", AnimalHelper.tryFetch(dog));
    }

    @Test
    @DisplayName("課題2e: AnimalHelper.tryFetch — Catの場合")
    void testTryFetchCat() {
        Animal cat = new Cat("タマ");
        assertEquals("フェッチできません", AnimalHelper.tryFetch(cat));
    }

    // === 課題3: テンプレートメソッドパターン ===

    @Test
    @DisplayName("課題3a: UpperCaseConverter — 正常な変換")
    void testUpperCaseConverter() {
        DataConverter converter = new UpperCaseConverter();
        assertEquals("HELLO WORLD", converter.convert("hello world"));
    }

    @Test
    @DisplayName("課題3b: UpperCaseConverter — 空文字の場合エラー")
    void testUpperCaseConverterEmpty() {
        DataConverter converter = new UpperCaseConverter();
        assertEquals("ERROR: invalid input", converter.convert(""));
    }

    @Test
    @DisplayName("課題3c: UpperCaseConverter — nullの場合エラー")
    void testUpperCaseConverterNull() {
        DataConverter converter = new UpperCaseConverter();
        assertEquals("ERROR: invalid input", converter.convert(null));
    }

    @Test
    @DisplayName("課題3d: CsvToTabConverter — 正常な変換")
    void testCsvToTabConverter() {
        DataConverter converter = new CsvToTabConverter();
        assertEquals("a\tb\tc", converter.convert("a,b,c"));
    }

    @Test
    @DisplayName("課題3e: CsvToTabConverter — カンマなしの場合エラー")
    void testCsvToTabConverterNoComma() {
        DataConverter converter = new CsvToTabConverter();
        assertEquals("ERROR: invalid input", converter.convert("abc"));
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全15テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `TicketCounter.calculateTotal()` はポリモーフィズムを活用する。`for (Ticket t : tickets) { total += t.getPrice(); }` のように、Ticket型の変数を通じて各サブクラスの `getPrice()` を呼び出す。`toString()` は `getName() + ": " + getPrice() + "円"` で実装する。
- **課題2のヒント:** `AnimalHelper.describeAll()` は `StringBuilder` を使って効率的に文字列を連結する。改行の扱いに注意（最後の要素の後に改行を入れない）。`tryFetch()` は `if (animal instanceof Dog dog)` でパターンマッチングを使うか、`if (animal instanceof Dog)` の後に明示的にキャストする。
- **課題3のヒント:** `DataConverter.convert()` はテンプレートメソッドであり、`validate()` → `transform()` の流れを定義する。`CsvToTabConverter` の `validate` ではString の `contains(",")` メソッドを使う。`transform` では `replace(",", "\t")` を使う。
- **abstractの注意:** 抽象クラスは直接インスタンス化できない。`new Ticket("test")` はコンパイルエラーになる。テストではサブクラスのインスタンスを使用すること。
