# Lab: JAVA-GOLD-01-04 — Stream API — 中間操作と終端操作

## 目標

- Streamパイプラインを使ったデータ処理を実践する
- filter, map, flatMap, sorted, distinct の中間操作を体験する
- forEach, collect, count, reduce, findFirst の終端操作を実装する
- Optionalの正しい使い方を実践する

所要時間: 30〜45分

## 前提条件

- Java 17 がインストールされていること
- Maven が使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: 基本的なStream操作

`StreamPractice` クラスの以下のメソッドを実装せよ。

**filterByPrefix**: 指定されたプレフィックスで始まる文字列のみを返す。

```java
public static List<String> filterByPrefix(List<String> words, String prefix)
```

**toUpperCaseList**: 文字列リストをすべて大文字に変換して返す。

```java
public static List<String> toUpperCaseList(List<String> words)
```

**sumOfEvenNumbers**: 整数リストの偶数のみの合計を返す。

```java
public static int sumOfEvenNumbers(List<Integer> numbers)
```

### 課題2: flatMapとdistinct

**uniqueCharacters**: 文字列リストの各文字列を1文字ずつに分解し、重複なし・ソート済みの文字リストを返す。

```java
public static List<String> uniqueCharacters(List<String> words)
```

ヒント: `word.chars().mapToObj(c -> String.valueOf((char) c))` で1文字ずつのStreamに変換できる。

### 課題3: reduceとOptional

**longestString**: 文字列リストから最も長い文字列をOptionalで返す。

```java
public static Optional<String> longestString(List<String> words)
```

**concatenateWithSeparator**: 文字列リストを指定された区切り文字で連結して返す。リストが空の場合は空文字列を返す。

```java
public static String concatenateWithSeparator(List<String> words, String separator)
```

### 課題4: 実践的なパイプライン

**topScoringStudents**: 学生リスト（名前,スコアのペア）からスコアが閾値以上の学生名を、スコア降順で返す。

```java
public static List<String> topScoringStudents(
    List<Map.Entry<String, Integer>> students, int threshold)
```

## ファイル構成

```
lab-java-gold-01-04/
├── pom.xml
└── src/
    ├── main/java/streams/
    │   └── StreamPractice.java      ← 実装対象
    └── test/java/streams/
        └── StreamPracticeTest.java  ← 自動採点テスト（変更不可）
```

**pom.xml:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.jbridge.lab</groupId>
    <artifactId>java-gold-01-04</artifactId>
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
package streams;

import org.junit.jupiter.api.Test;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;

class StreamPracticeTest {

    // === 課題1 ===

    @Test
    void filterByPrefix() {
        var words = List.of("apple", "avocado", "banana", "apricot");
        assertEquals(List.of("apple", "avocado", "apricot"),
            StreamPractice.filterByPrefix(words, "a"));
    }

    @Test
    void filterByPrefix_一致なし() {
        assertEquals(List.of(),
            StreamPractice.filterByPrefix(List.of("x", "y"), "a"));
    }

    @Test
    void toUpperCaseList() {
        assertEquals(List.of("HELLO", "WORLD"),
            StreamPractice.toUpperCaseList(List.of("hello", "world")));
    }

    @Test
    void sumOfEvenNumbers() {
        assertEquals(12,
            StreamPractice.sumOfEvenNumbers(List.of(1, 2, 3, 4, 5, 6)));
    }

    @Test
    void sumOfEvenNumbers_偶数なし() {
        assertEquals(0,
            StreamPractice.sumOfEvenNumbers(List.of(1, 3, 5)));
    }

    // === 課題2 ===

    @Test
    void uniqueCharacters() {
        var result = StreamPractice.uniqueCharacters(List.of("abc", "bcd"));
        assertEquals(List.of("a", "b", "c", "d"), result);
    }

    @Test
    void uniqueCharacters_単語1つ() {
        assertEquals(List.of("a", "b", "c"),
            StreamPractice.uniqueCharacters(List.of("cba")));
    }

    // === 課題3 ===

    @Test
    void longestString() {
        var result = StreamPractice.longestString(
            List.of("hi", "hello", "hey"));
        assertTrue(result.isPresent());
        assertEquals("hello", result.get());
    }

    @Test
    void longestString_空リスト() {
        assertTrue(StreamPractice.longestString(List.of()).isEmpty());
    }

    @Test
    void concatenateWithSeparator() {
        assertEquals("a-b-c",
            StreamPractice.concatenateWithSeparator(
                List.of("a", "b", "c"), "-"));
    }

    @Test
    void concatenateWithSeparator_空リスト() {
        assertEquals("",
            StreamPractice.concatenateWithSeparator(List.of(), ","));
    }

    // === 課題4 ===

    @Test
    void topScoringStudents() {
        var students = List.of(
            Map.entry("Alice", 85),
            Map.entry("Bob", 92),
            Map.entry("Charlie", 78),
            Map.entry("David", 95),
            Map.entry("Eve", 88)
        );
        assertEquals(List.of("David", "Bob", "Eve"),
            StreamPractice.topScoringStudents(students, 85));
    }

    @Test
    void topScoringStudents_閾値以上なし() {
        var students = List.of(
            Map.entry("Alice", 50),
            Map.entry("Bob", 60)
        );
        assertTrue(StreamPractice.topScoringStudents(students, 90).isEmpty());
    }
}
```

## ヒント

- **課題1-filterByPrefix**: `.filter(w -> w.startsWith(prefix))` を使用する。
- **課題1-toUpperCaseList**: `.map(String::toUpperCase)` でメソッド参照を使用する。
- **課題1-sumOfEvenNumbers**: `.filter(n -> n % 2 == 0)` でフィルタ後、`.mapToInt(Integer::intValue).sum()` または `.reduce(0, Integer::sum)` で合計する。
- **課題2**: `.flatMap(word -> word.chars().mapToObj(c -> String.valueOf((char) c)))` で1文字ずつに分解し、`.distinct().sorted()` で重複除去・ソートする。
- **課題3-longestString**: `.reduce((a, b) -> a.length() >= b.length() ? a : b)` で最長文字列を求める。
- **課題3-concatenateWithSeparator**: `.reduce((a, b) -> a + separator + b).orElse("")` または `String.join(separator, words)` を使用する。
- **課題4**: `.filter` → `.sorted` → `.map` のパイプライン。ソートは `Comparator.comparingInt(Map.Entry::getValue).reversed()` で降順にできる。
