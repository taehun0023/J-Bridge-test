# Lab: JAVA-BRONZE-01-02 — 基本型と変数のスコープ

## 目標

- 8つのプリミティブ型を正しく宣言・初期化し、それぞれの特性を理解する。
- ローカル変数・インスタンス変数・クラス変数の違いとデフォルト値の有無を体験する。
- `final` キーワードの効果を確認し、定数の定義方法を習得する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- テキストエディタが使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: プリミティブ型の宣言と表示

パッケージ `jp.co.training` に属する `PrimitiveTypes` クラスを作成し、8つのプリミティブ型を宣言・表示せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class PrimitiveTypes` として定義する
3. mainメソッド内で以下の変数を宣言・初期化し、すべてを `System.out.println` で出力する:
   - `byte b = 100;`
   - `short s = 30000;`
   - `int i = 2000000000;`
   - `long l = 5000000000L;`
   - `float f = 2.5F;`
   - `double d = 3.141592653589793;`
   - `char c = 'Z';`
   - `boolean flag = true;`
4. 出力フォーマットは `"型名: 値"` とする（例: `"byte: 100"`）

**期待される出力:**

```
byte: 100
short: 30000
int: 2000000000
long: 5000000000
float: 2.5
double: 3.141592653589793
char: Z
boolean: true
```

### 課題2: デフォルト値の確認

パッケージ `jp.co.training` に属する `DefaultValues` クラスを作成し、インスタンス変数のデフォルト値を確認せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class DefaultValues` として定義する
3. 以下のインスタンス変数を**初期化せずに**宣言する:
   - `int num`
   - `double decimal`
   - `boolean flag`
   - `char letter`
   - `String text`
4. `public String getDefaults()` メソッドを作成し、各変数の値を以下のフォーマットで1行ずつ連結した文字列を返す:
   - `"int: " + num + "\n" + "double: " + decimal + "\n" + "boolean: " + flag + "\n" + "char: [" + letter + "]\n" + "String: " + text`
5. mainメソッドで `DefaultValues` インスタンスを生成し、`getDefaults()` の戻り値を出力する

**期待される出力:**

```
int: 0
double: 0.0
boolean: false
char: [ ]
String: null
```

> 注意: `char` のデフォルト値は `\u0000`（ヌル文字）であり、表示上は空白に見える。

### 課題3: final変数と定数の定義

パッケージ `jp.co.training` に属する `TaxCalculator` クラスを作成し、`final` を使った定数定義と計算を行え。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class TaxCalculator` として定義する
3. クラス定数 `public static final double TAX_RATE = 0.10;` を宣言する
4. `public static int calculateTax(int price)` メソッドを作成する:
   - `price * TAX_RATE` を計算し、小数点以下を切り捨てて `int` で返す（`(int)` キャストを使用）
5. `public static int calculateTotal(int price)` メソッドを作成する:
   - `price + calculateTax(price)` を返す
6. mainメソッドで以下を出力する:
   - `calculateTax(1000)` の結果
   - `calculateTotal(1000)` の結果

**期待される出力:**

```
Tax: 100
Total: 1100
```

## ファイル構成

```
lab-java-bronze-01-02/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── PrimitiveTypes.java   # 課題1
    │                   ├── DefaultValues.java    # 課題2
    │                   └── TaxCalculator.java    # 課題3
    └── test/
        └── java/
            └── jp/
                └── co/
                    └── training/
                        └── LabTest.java
```

> **注意:** Maven標準レイアウトに従い、ソースファイルは `src/main/java/jp/co/training/` に配置する。

**pom.xml:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>jp.co.training</groupId>
    <artifactId>java-bronze-01-02-lab</artifactId>
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

以下のテストクラスで各課題を自動検証する。

```java
package jp.co.training;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

class LabTest {

    private String captureStdout(Runnable task) {
        PrintStream original = System.out;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        System.setOut(new PrintStream(baos));
        try {
            task.run();
        } finally {
            System.setOut(original);
        }
        return baos.toString().trim();
    }

    @Test
    @DisplayName("課題1: PrimitiveTypes — 8つのプリミティブ型が正しく出力される")
    void testPrimitiveTypes() {
        String output = captureStdout(() ->
            PrimitiveTypes.main(new String[]{})
        );
        assertTrue(output.contains("byte: 100"), "byte の出力が正しいこと");
        assertTrue(output.contains("short: 30000"), "short の出力が正しいこと");
        assertTrue(output.contains("int: 2000000000"), "int の出力が正しいこと");
        assertTrue(output.contains("long: 5000000000"), "long の出力が正しいこと");
        assertTrue(output.contains("float: 2.5"), "float の出力が正しいこと");
        assertTrue(output.contains("double: 3.141592653589793"), "double の出力が正しいこと");
        assertTrue(output.contains("char: Z"), "char の出力が正しいこと");
        assertTrue(output.contains("boolean: true"), "boolean の出力が正しいこと");
    }

    @Test
    @DisplayName("課題2: DefaultValues — デフォルト値が正しく表示される")
    void testDefaultValues() {
        DefaultValues dv = new DefaultValues();
        String result = dv.getDefaults();
        assertTrue(result.contains("int: 0"), "int のデフォルト値が 0 であること");
        assertTrue(result.contains("double: 0.0"), "double のデフォルト値が 0.0 であること");
        assertTrue(result.contains("boolean: false"), "boolean のデフォルト値が false であること");
        assertTrue(result.contains("String: null"), "String のデフォルト値が null であること");
    }

    @Test
    @DisplayName("課題3a: TaxCalculator — 税額が正しく計算される")
    void testCalculateTax() {
        assertEquals(100, TaxCalculator.calculateTax(1000),
            "1000円の税額は100円であること");
        assertEquals(0, TaxCalculator.calculateTax(0),
            "0円の税額は0円であること");
        assertEquals(99, TaxCalculator.calculateTax(999),
            "999円の税額は99円であること（切り捨て）");
    }

    @Test
    @DisplayName("課題3b: TaxCalculator — 合計が正しく計算される")
    void testCalculateTotal() {
        assertEquals(1100, TaxCalculator.calculateTotal(1000),
            "1000円の合計は1100円であること");
        assertEquals(0, TaxCalculator.calculateTotal(0),
            "0円の合計は0円であること");
    }

    @Test
    @DisplayName("課題3c: TaxCalculator — TAX_RATE定数が正しく定義されている")
    void testTaxRateConstant() throws Exception {
        var field = TaxCalculator.class.getDeclaredField("TAX_RATE");
        assertTrue(java.lang.reflect.Modifier.isStatic(field.getModifiers()),
            "TAX_RATE は static であること");
        assertTrue(java.lang.reflect.Modifier.isFinal(field.getModifiers()),
            "TAX_RATE は final であること");
        assertEquals(0.10, field.getDouble(null), 0.001,
            "TAX_RATE の値は 0.10 であること");
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全5テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `long` リテラルには `L` サフィックス、`float` リテラルには `F` サフィックスを忘れずに付けること。`System.out.println("byte: " + b);` のように文字列連結で出力する。
- **課題2のヒント:** インスタンス変数は初期化しなくてもコンパイルエラーにはならない。`getDefaults()` メソッドでは `+` 演算子と `"\n"` で文字列を連結する。`char` のデフォルト値はヌル文字 `\u0000` であることに注意。
- **課題3のヒント:** `(int)(price * TAX_RATE)` でキャストすると小数点以下が切り捨てられる。`static final` の宣言順序は `public static final double TAX_RATE = 0.10;` とする。
