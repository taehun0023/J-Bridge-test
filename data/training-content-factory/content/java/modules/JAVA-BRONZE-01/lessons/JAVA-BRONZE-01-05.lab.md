# Lab: JAVA-BRONZE-01-05 — 繰り返し — for / while / 拡張for

## 目標

- `for` 文、`while` 文、拡張for文（for-each）を使い分けて繰り返し処理を実装できるようになる。
- `break` と `continue` を使ったループ制御を正しく実装できるようになる。
- ネストしたループとラベル付き `break` の使い方を理解する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- テキストエディタが使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: 配列の統計計算

パッケージ `jp.co.training` に属する `ArrayStats` クラスを作成し、配列の統計値を計算せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class ArrayStats` として定義する
3. 以下の `public static` メソッドを実装する:
   - `int sum(int[] arr)` — 拡張for文を使って配列の合計を返す。空配列なら `0`
   - `double average(int[] arr)` — 配列の平均値を `double` で返す。空配列なら `0.0`
   - `int max(int[] arr)` — 配列の最大値を返す。空配列なら `Integer.MIN_VALUE`
   - `int min(int[] arr)` — 配列の最小値を返す。空配列なら `Integer.MAX_VALUE`

**実行例:**

```java
int[] data = {85, 92, 78, 96, 64};
ArrayStats.sum(data);      // → 415
ArrayStats.average(data);  // → 83.0
ArrayStats.max(data);      // → 96
ArrayStats.min(data);      // → 64
```

### 課題2: FizzBuzz

パッケージ `jp.co.training` に属する `FizzBuzz` クラスを作成し、FizzBuzzプログラムを実装せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class FizzBuzz` として定義する
3. `public static String[] generate(int n)` メソッドを実装する:
   - 1 から `n` までの各数値について以下のルールで文字列を生成し、`String[]` で返す:
     - 3と5の両方で割り切れる → `"FizzBuzz"`
     - 3で割り切れる → `"Fizz"`
     - 5で割り切れる → `"Buzz"`
     - それ以外 → 数値を文字列にしたもの（例: `"1"`, `"2"`）
   - `n <= 0` の場合は空配列 `new String[0]` を返す

**実行例:**

```java
FizzBuzz.generate(5);  // → {"1", "2", "Fizz", "4", "Buzz"}
FizzBuzz.generate(15); // → 最後の要素が "FizzBuzz"
```

### 課題3: 素数判定

パッケージ `jp.co.training` に属する `PrimeChecker` クラスを作成し、素数判定とリスト生成を行え。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class PrimeChecker` として定義する
3. `public static boolean isPrime(int n)` メソッドを実装する:
   - `n` が素数なら `true`、そうでなければ `false` を返す
   - 1以下の数は素数ではない
   - ヒント: 2から `Math.sqrt(n)` まで割り切れるかチェックする（`break` を活用）
4. `public static int countPrimes(int limit)` メソッドを実装する:
   - 2 から `limit` までの素数の個数を返す
   - `limit < 2` の場合は `0` を返す

**実行例:**

```java
PrimeChecker.isPrime(7);      // → true
PrimeChecker.isPrime(10);     // → false
PrimeChecker.countPrimes(20); // → 8 (2,3,5,7,11,13,17,19)
```

## ファイル構成

```
lab-java-bronze-01-05/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── ArrayStats.java     # 課題1
    │                   ├── FizzBuzz.java       # 課題2
    │                   └── PrimeChecker.java   # 課題3
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
    <artifactId>java-bronze-01-05-lab</artifactId>
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

import static org.junit.jupiter.api.Assertions.*;

class LabTest {

    // --- 課題1: ArrayStats ---

    @Test
    @DisplayName("課題1a: sum — 配列の合計が正しい")
    void testSum() {
        assertEquals(415, ArrayStats.sum(new int[]{85, 92, 78, 96, 64}));
        assertEquals(10, ArrayStats.sum(new int[]{10}));
        assertEquals(0, ArrayStats.sum(new int[]{}));
    }

    @Test
    @DisplayName("課題1b: average — 配列の平均が正しい")
    void testAverage() {
        assertEquals(83.0, ArrayStats.average(new int[]{85, 92, 78, 96, 64}), 0.0001);
        assertEquals(10.0, ArrayStats.average(new int[]{10}), 0.0001);
        assertEquals(0.0, ArrayStats.average(new int[]{}), 0.0001);
    }

    @Test
    @DisplayName("課題1c: max / min — 最大値・最小値が正しい")
    void testMaxMin() {
        int[] data = {85, 92, 78, 96, 64};
        assertEquals(96, ArrayStats.max(data));
        assertEquals(64, ArrayStats.min(data));
        assertEquals(Integer.MIN_VALUE, ArrayStats.max(new int[]{}));
        assertEquals(Integer.MAX_VALUE, ArrayStats.min(new int[]{}));
    }

    // --- 課題2: FizzBuzz ---

    @Test
    @DisplayName("課題2a: generate — FizzBuzz の基本動作")
    void testFizzBuzzBasic() {
        String[] result = FizzBuzz.generate(5);
        assertArrayEquals(new String[]{"1", "2", "Fizz", "4", "Buzz"}, result);
    }

    @Test
    @DisplayName("課題2b: generate — FizzBuzz の15までの完全テスト")
    void testFizzBuzzFull() {
        String[] result = FizzBuzz.generate(15);
        assertEquals(15, result.length);
        assertEquals("Fizz", result[2]);       // 3
        assertEquals("Buzz", result[4]);       // 5
        assertEquals("Fizz", result[5]);       // 6
        assertEquals("FizzBuzz", result[14]);  // 15
    }

    @Test
    @DisplayName("課題2c: generate — 0以下は空配列")
    void testFizzBuzzEmpty() {
        assertArrayEquals(new String[0], FizzBuzz.generate(0));
        assertArrayEquals(new String[0], FizzBuzz.generate(-1));
    }

    // --- 課題3: PrimeChecker ---

    @Test
    @DisplayName("課題3a: isPrime — 素数判定が正しい")
    void testIsPrime() {
        assertFalse(PrimeChecker.isPrime(0));
        assertFalse(PrimeChecker.isPrime(1));
        assertTrue(PrimeChecker.isPrime(2));
        assertTrue(PrimeChecker.isPrime(3));
        assertFalse(PrimeChecker.isPrime(4));
        assertTrue(PrimeChecker.isPrime(5));
        assertTrue(PrimeChecker.isPrime(7));
        assertFalse(PrimeChecker.isPrime(9));
        assertTrue(PrimeChecker.isPrime(11));
        assertTrue(PrimeChecker.isPrime(97));
        assertFalse(PrimeChecker.isPrime(100));
    }

    @Test
    @DisplayName("課題3b: countPrimes — 素数の個数が正しい")
    void testCountPrimes() {
        assertEquals(0, PrimeChecker.countPrimes(1));
        assertEquals(1, PrimeChecker.countPrimes(2));
        assertEquals(4, PrimeChecker.countPrimes(10));
        assertEquals(8, PrimeChecker.countPrimes(20));
        assertEquals(25, PrimeChecker.countPrimes(100));
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全8テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** 拡張for文 `for (int val : arr)` で全要素を処理する。`average` では `(double) sum / arr.length` とキャストする。空配列チェックを忘れずに。
- **課題2のヒント:** for文で 1 から n までループし、`%` 演算子で割り切れるかを判定する。3と5の両方で割り切れるケースを最初に判定すること（`if (i % 15 == 0)` または `if (i % 3 == 0 && i % 5 == 0)`）。`String.valueOf(i)` で int を String に変換できる。
- **課題3のヒント:** `isPrime` では 2 から `(int) Math.sqrt(n)` まで割り切れるかをチェックする。割り切れた時点で `break` してループを抜け、`false` を返す。`countPrimes` では `isPrime` メソッドを再利用する。
