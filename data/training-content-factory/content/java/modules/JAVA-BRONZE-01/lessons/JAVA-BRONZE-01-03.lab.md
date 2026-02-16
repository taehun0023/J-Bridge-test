# Lab: JAVA-BRONZE-01-03 — 演算子と型変換

## 目標

- 算術演算子・比較演算子・論理演算子を正しく使用できるようになる。
- 整数除算と浮動小数点除算の違いを実際のコードで体験する。
- 暗黙の型変換（拡張変換）と明示的キャスト（縮小変換）の動作を理解する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- テキストエディタが使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: 整数除算と型変換

パッケージ `jp.co.training` に属する `DivisionCalc` クラスを作成し、整数除算と浮動小数点除算の違いを確認せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class DivisionCalc` として定義する
3. 以下の `public static` メソッドを実装する:
   - `int intDivide(int a, int b)` — 整数除算の結果を返す
   - `double doubleDivide(int a, int b)` — 浮動小数点除算の結果を返す（少なくとも一方をdoubleにキャストすること）
   - `int remainder(int a, int b)` — 剰余（余り）を返す

**実行例:**

```java
DivisionCalc.intDivide(7, 2);      // → 3
DivisionCalc.doubleDivide(7, 2);   // → 3.5
DivisionCalc.remainder(7, 2);      // → 1
```

### 課題2: 型変換ユーティリティ

パッケージ `jp.co.training` に属する `TypeConverter` クラスを作成し、型変換の動作を確認せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class TypeConverter` として定義する
3. 以下の `public static` メソッドを実装する:
   - `int doubleToInt(double value)` — double を int にキャスト（小数点以下切り捨て）して返す
   - `byte intToByte(int value)` — int を byte にキャスト（オーバーフロー許容）して返す
   - `int charToInt(char c)` — char を int に変換して返す（Unicode値）

**実行例:**

```java
TypeConverter.doubleToInt(3.99);   // → 3
TypeConverter.intToByte(200);      // → -56
TypeConverter.charToInt('A');      // → 65
```

### 課題3: 成績判定プログラム

パッケージ `jp.co.training` に属する `GradeChecker` クラスを作成し、算術・比較・論理演算子を組み合わせた成績判定を行え。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class GradeChecker` として定義する
3. `public static String getGrade(int score)` メソッドを実装する:
   - `score >= 90` → `"A"`
   - `score >= 80 && score < 90` → `"B"`
   - `score >= 70 && score < 80` → `"C"`
   - `score >= 60 && score < 70` → `"D"`
   - `score < 60` → `"F"`
4. `public static double calculateAverage(int[] scores)` メソッドを実装する:
   - 配列の平均値を `double` で返す（整数除算にならないよう注意）
   - 空配列の場合は `0.0` を返す

**実行例:**

```java
GradeChecker.getGrade(95);  // → "A"
GradeChecker.getGrade(75);  // → "C"
GradeChecker.calculateAverage(new int[]{80, 90, 70});  // → 80.0
```

## ファイル構成

```
lab-java-bronze-01-03/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── DivisionCalc.java    # 課題1
    │                   ├── TypeConverter.java   # 課題2
    │                   └── GradeChecker.java    # 課題3
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
    <artifactId>java-bronze-01-03-lab</artifactId>
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

    // --- 課題1: DivisionCalc ---

    @Test
    @DisplayName("課題1a: intDivide — 整数除算が正しい")
    void testIntDivide() {
        assertEquals(3, DivisionCalc.intDivide(7, 2));
        assertEquals(2, DivisionCalc.intDivide(10, 4));
        assertEquals(0, DivisionCalc.intDivide(3, 5));
    }

    @Test
    @DisplayName("課題1b: doubleDivide — 浮動小数点除算が正しい")
    void testDoubleDivide() {
        assertEquals(3.5, DivisionCalc.doubleDivide(7, 2), 0.0001);
        assertEquals(2.5, DivisionCalc.doubleDivide(10, 4), 0.0001);
        assertEquals(0.6, DivisionCalc.doubleDivide(3, 5), 0.0001);
    }

    @Test
    @DisplayName("課題1c: remainder — 剰余が正しい")
    void testRemainder() {
        assertEquals(1, DivisionCalc.remainder(7, 2));
        assertEquals(2, DivisionCalc.remainder(10, 4));
        assertEquals(0, DivisionCalc.remainder(10, 5));
    }

    // --- 課題2: TypeConverter ---

    @Test
    @DisplayName("課題2a: doubleToInt — double→intキャストが正しい（切り捨て）")
    void testDoubleToInt() {
        assertEquals(3, TypeConverter.doubleToInt(3.99));
        assertEquals(-3, TypeConverter.doubleToInt(-3.99));
        assertEquals(0, TypeConverter.doubleToInt(0.5));
    }

    @Test
    @DisplayName("課題2b: intToByte — int→byteキャストが正しい（オーバーフロー）")
    void testIntToByte() {
        assertEquals(-56, TypeConverter.intToByte(200));
        assertEquals(44, TypeConverter.intToByte(300));
        assertEquals(100, TypeConverter.intToByte(100));
    }

    @Test
    @DisplayName("課題2c: charToInt — char→int変換が正しい")
    void testCharToInt() {
        assertEquals(65, TypeConverter.charToInt('A'));
        assertEquals(97, TypeConverter.charToInt('a'));
        assertEquals(48, TypeConverter.charToInt('0'));
    }

    // --- 課題3: GradeChecker ---

    @Test
    @DisplayName("課題3a: getGrade — 成績判定が正しい")
    void testGetGrade() {
        assertEquals("A", GradeChecker.getGrade(95));
        assertEquals("A", GradeChecker.getGrade(90));
        assertEquals("B", GradeChecker.getGrade(85));
        assertEquals("C", GradeChecker.getGrade(75));
        assertEquals("D", GradeChecker.getGrade(65));
        assertEquals("F", GradeChecker.getGrade(59));
        assertEquals("F", GradeChecker.getGrade(0));
    }

    @Test
    @DisplayName("課題3b: calculateAverage — 平均値が正しい（浮動小数点）")
    void testCalculateAverage() {
        assertEquals(80.0, GradeChecker.calculateAverage(new int[]{80, 90, 70}), 0.0001);
        assertEquals(85.5, GradeChecker.calculateAverage(new int[]{85, 86}), 0.0001);
        assertEquals(100.0, GradeChecker.calculateAverage(new int[]{100}), 0.0001);
        assertEquals(0.0, GradeChecker.calculateAverage(new int[]{}), 0.0001);
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全8テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `doubleDivide` では `(double) a / b` とキャストすることで浮動小数点除算になる。`a / b` だけでは整数除算になってしまうので注意。
- **課題2のヒント:** `(int)` や `(byte)` を使ってキャストする。`charToInt` は型変換の代入（`int result = c;`）だけで実現できる。
- **課題3のヒント:** `getGrade` では `if/else if/else` を使う。`calculateAverage` では合計値を `double` で計算するか、除算時にキャストすること。空配列チェックは `scores.length == 0` で行う。
