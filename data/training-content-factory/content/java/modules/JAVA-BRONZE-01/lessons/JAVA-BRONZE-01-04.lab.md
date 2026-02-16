# Lab: JAVA-BRONZE-01-04 — 条件分岐 — if / switch

## 目標

- `if/else if/else` を使った範囲条件の判定を正しく実装できるようになる。
- `switch` 文と `switch` 式（Java 14+）の違いを理解し、適切に使い分けられるようになる。
- 三項演算子を使った簡潔な条件分岐を記述できるようになる。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- テキストエディタが使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: 成績ランク判定

パッケージ `jp.co.training` に属する `GradeRank` クラスを作成し、点数に応じた成績ランクを判定せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class GradeRank` として定義する
3. `public static String getRank(int score)` メソッドを実装する:
   - `score` が 0 未満 または 100 より大きい場合: `"エラー"`
   - `score >= 90`: `"S"`
   - `score >= 80`: `"A"`
   - `score >= 70`: `"B"`
   - `score >= 60`: `"C"`
   - `score < 60`: `"D"`
4. `public static String getPassFail(int score)` メソッドを実装する:
   - 三項演算子を使用して、`score >= 60` なら `"合格"` 、そうでなければ `"不合格"` を返す

**実行例:**

```java
GradeRank.getRank(95);      // → "S"
GradeRank.getRank(75);      // → "B"
GradeRank.getRank(-1);      // → "エラー"
GradeRank.getPassFail(80);  // → "合格"
GradeRank.getPassFail(50);  // → "不合格"
```

### 課題2: 曜日判定（switch式）

パッケージ `jp.co.training` に属する `DayClassifier` クラスを作成し、曜日に応じた分類を行え。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class DayClassifier` として定義する
3. `public static String classify(String day)` メソッドを実装する:
   - switch式（アロー構文）を使用する
   - `"MON"`, `"TUE"`, `"WED"`, `"THU"`, `"FRI"` → `"平日"`
   - `"SAT"` → `"半休"`
   - `"SUN"` → `"休日"`
   - それ以外 → `"不明"`
4. `public static int getWorkHours(String day)` メソッドを実装する:
   - switch式を使用する
   - 平日（`"MON"`〜`"FRI"`） → `8`
   - `"SAT"` → `4`
   - `"SUN"` → `0`
   - それ以外 → `-1`

**実行例:**

```java
DayClassifier.classify("MON");      // → "平日"
DayClassifier.classify("SAT");      // → "半休"
DayClassifier.classify("SUN");      // → "休日"
DayClassifier.getWorkHours("FRI");  // → 8
DayClassifier.getWorkHours("SAT");  // → 4
```

### 課題3: 季節判定（月番号からswitch）

パッケージ `jp.co.training` に属する `SeasonChecker` クラスを作成し、月番号から季節を判定せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class SeasonChecker` として定義する
3. `public static String getSeason(int month)` メソッドを実装する:
   - switch式を使用する
   - `3, 4, 5` → `"春"`
   - `6, 7, 8` → `"夏"`
   - `9, 10, 11` → `"秋"`
   - `12, 1, 2` → `"冬"`
   - それ以外 → `"不明"`

**実行例:**

```java
SeasonChecker.getSeason(4);   // → "春"
SeasonChecker.getSeason(8);   // → "夏"
SeasonChecker.getSeason(12);  // → "冬"
SeasonChecker.getSeason(0);   // → "不明"
```

## ファイル構成

```
lab-java-bronze-01-04/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── GradeRank.java       # 課題1
    │                   ├── DayClassifier.java   # 課題2
    │                   └── SeasonChecker.java   # 課題3
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
    <artifactId>java-bronze-01-04-lab</artifactId>
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

    // --- 課題1: GradeRank ---

    @Test
    @DisplayName("課題1a: getRank — 各ランクが正しく判定される")
    void testGetRank() {
        assertEquals("S", GradeRank.getRank(100));
        assertEquals("S", GradeRank.getRank(90));
        assertEquals("A", GradeRank.getRank(89));
        assertEquals("A", GradeRank.getRank(80));
        assertEquals("B", GradeRank.getRank(79));
        assertEquals("B", GradeRank.getRank(70));
        assertEquals("C", GradeRank.getRank(69));
        assertEquals("C", GradeRank.getRank(60));
        assertEquals("D", GradeRank.getRank(59));
        assertEquals("D", GradeRank.getRank(0));
    }

    @Test
    @DisplayName("課題1b: getRank — 範囲外はエラー")
    void testGetRankOutOfRange() {
        assertEquals("エラー", GradeRank.getRank(-1));
        assertEquals("エラー", GradeRank.getRank(101));
    }

    @Test
    @DisplayName("課題1c: getPassFail — 合否判定が正しい")
    void testGetPassFail() {
        assertEquals("合格", GradeRank.getPassFail(60));
        assertEquals("合格", GradeRank.getPassFail(100));
        assertEquals("不合格", GradeRank.getPassFail(59));
        assertEquals("不合格", GradeRank.getPassFail(0));
    }

    // --- 課題2: DayClassifier ---

    @Test
    @DisplayName("課題2a: classify — 曜日分類が正しい")
    void testClassify() {
        assertEquals("平日", DayClassifier.classify("MON"));
        assertEquals("平日", DayClassifier.classify("TUE"));
        assertEquals("平日", DayClassifier.classify("WED"));
        assertEquals("平日", DayClassifier.classify("THU"));
        assertEquals("平日", DayClassifier.classify("FRI"));
        assertEquals("半休", DayClassifier.classify("SAT"));
        assertEquals("休日", DayClassifier.classify("SUN"));
        assertEquals("不明", DayClassifier.classify("XXX"));
    }

    @Test
    @DisplayName("課題2b: getWorkHours — 労働時間が正しい")
    void testGetWorkHours() {
        assertEquals(8, DayClassifier.getWorkHours("MON"));
        assertEquals(8, DayClassifier.getWorkHours("FRI"));
        assertEquals(4, DayClassifier.getWorkHours("SAT"));
        assertEquals(0, DayClassifier.getWorkHours("SUN"));
        assertEquals(-1, DayClassifier.getWorkHours("INVALID"));
    }

    // --- 課題3: SeasonChecker ---

    @Test
    @DisplayName("課題3: getSeason — 季節判定が正しい")
    void testGetSeason() {
        assertEquals("春", SeasonChecker.getSeason(3));
        assertEquals("春", SeasonChecker.getSeason(4));
        assertEquals("春", SeasonChecker.getSeason(5));
        assertEquals("夏", SeasonChecker.getSeason(6));
        assertEquals("夏", SeasonChecker.getSeason(7));
        assertEquals("夏", SeasonChecker.getSeason(8));
        assertEquals("秋", SeasonChecker.getSeason(9));
        assertEquals("秋", SeasonChecker.getSeason(10));
        assertEquals("秋", SeasonChecker.getSeason(11));
        assertEquals("冬", SeasonChecker.getSeason(12));
        assertEquals("冬", SeasonChecker.getSeason(1));
        assertEquals("冬", SeasonChecker.getSeason(2));
        assertEquals("不明", SeasonChecker.getSeason(0));
        assertEquals("不明", SeasonChecker.getSeason(13));
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全6テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `getRank` では `if/else if/else` を使い、範囲外チェックを最初に行う。`getPassFail` は `return (score >= 60) ? "合格" : "不合格";` の1行で実装できる。
- **課題2のヒント:** switch式のアロー構文では `case "MON", "TUE", "WED", "THU", "FRI" -> "平日";` のようにカンマで複数の値をまとめられる。
- **課題3のヒント:** 月番号の `12, 1, 2` を冬にまとめることに注意。switch式では `case 12, 1, 2 -> "冬";` と記述できる。
