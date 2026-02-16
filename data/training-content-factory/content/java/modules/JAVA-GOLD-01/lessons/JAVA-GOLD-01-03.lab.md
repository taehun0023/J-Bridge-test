# Lab: JAVA-GOLD-01-03 — コレクション — List / Set / Map

## 目標

- List / Set / Map の基本操作を実装を通じて理解する
- equals/hashCode契約を正しく実装する
- 不変コレクション（List.of等）の特性を体験する
- 各コレクション実装の特性に応じた使い分けを実践する

所要時間: 30〜45分

## 前提条件

- Java 17 がインストールされていること
- Maven が使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: equals/hashCodeの正しい実装

`Student` クラスを実装せよ。`studentId` フィールドで同一性を判定する。

- `equals()`: 同じ `studentId` を持つ場合に `true` を返す
- `hashCode()`: `studentId` のhashCodeを返す
- `toString()`: `"Student{id=xxx, name=xxx}"` 形式の文字列を返す

```java
public class Student {
    private final String studentId;
    private final String name;
    // TODO: コンストラクタ, getter, equals, hashCode, toString
}
```

### 課題2: コレクション操作ユーティリティ

`CollectionUtils` クラスの以下のメソッドを実装せよ。

**removeDuplicates**: Listから重複を除去し、元の順序を保持した新しいListを返す。

```java
public static <T> List<T> removeDuplicates(List<T> list)
```

**groupByLength**: 文字列リストを文字列長でグルーピングし、Map<Integer, List<String>>として返す。

```java
public static Map<Integer, List<String>> groupByLength(List<String> words)
```

**invertMap**: Map<K,V>のキーと値を入れ替えたMap<V,K>を返す。値の重複がある場合は後の要素で上書き。

```java
public static <K, V> Map<V, K> invertMap(Map<K, V> original)
```

### 課題3: ソート済みコレクション

`SortedCollectionUtils` クラスの以下のメソッドを実装せよ。

**topN**: Integer のListから上位N件を降順で返す。TreeSetの逆順を使用すること。

```java
public static List<Integer> topN(List<Integer> numbers, int n)
```

## ファイル構成

```
lab-java-gold-01-03/
├── pom.xml
└── src/
    ├── main/java/collections/
    │   ├── Student.java               ← 実装対象
    │   ├── CollectionUtils.java       ← 実装対象
    │   └── SortedCollectionUtils.java ← 実装対象
    └── test/java/collections/
        └── CollectionLabTest.java     ← 自動採点テスト（変更不可）
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
    <artifactId>java-gold-01-03</artifactId>
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
package collections;

import org.junit.jupiter.api.Test;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;

class CollectionLabTest {

    // === 課題1: Student equals/hashCode ===

    @Test
    void studentEquals_同じID() {
        Student a = new Student("S001", "Alice");
        Student b = new Student("S001", "Bob");
        assertEquals(a, b);
    }

    @Test
    void studentEquals_異なるID() {
        Student a = new Student("S001", "Alice");
        Student b = new Student("S002", "Alice");
        assertNotEquals(a, b);
    }

    @Test
    void studentHashCode_同じIDは同じhashCode() {
        Student a = new Student("S001", "Alice");
        Student b = new Student("S001", "Bob");
        assertEquals(a.hashCode(), b.hashCode());
    }

    @Test
    void studentInHashSet_重複排除() {
        Set<Student> set = new HashSet<>();
        set.add(new Student("S001", "Alice"));
        set.add(new Student("S001", "Bob"));
        set.add(new Student("S002", "Charlie"));
        assertEquals(2, set.size());
    }

    @Test
    void studentToString() {
        Student s = new Student("S001", "Alice");
        assertEquals("Student{id=S001, name=Alice}", s.toString());
    }

    // === 課題2: CollectionUtils ===

    @Test
    void removeDuplicates_順序保持() {
        List<String> input = List.of("b", "a", "c", "a", "b");
        List<String> result = CollectionUtils.removeDuplicates(input);
        assertEquals(List.of("b", "a", "c"), result);
    }

    @Test
    void removeDuplicates_重複なし() {
        List<Integer> input = List.of(1, 2, 3);
        assertEquals(List.of(1, 2, 3), CollectionUtils.removeDuplicates(input));
    }

    @Test
    void removeDuplicates_空リスト() {
        assertTrue(CollectionUtils.removeDuplicates(List.of()).isEmpty());
    }

    @Test
    void groupByLength() {
        List<String> words = List.of("hi", "hello", "go", "world", "ok");
        Map<Integer, List<String>> result = CollectionUtils.groupByLength(words);
        assertEquals(List.of("hi", "go", "ok"), result.get(2));
        assertEquals(List.of("hello", "world"), result.get(5));
    }

    @Test
    void invertMap() {
        Map<String, Integer> original = new LinkedHashMap<>();
        original.put("a", 1);
        original.put("b", 2);
        original.put("c", 3);
        Map<Integer, String> result = CollectionUtils.invertMap(original);
        assertEquals("a", result.get(1));
        assertEquals("b", result.get(2));
        assertEquals("c", result.get(3));
    }

    // === 課題3: SortedCollectionUtils ===

    @Test
    void topN_上位3件() {
        List<Integer> numbers = List.of(5, 1, 8, 3, 9, 2, 7);
        List<Integer> result = SortedCollectionUtils.topN(numbers, 3);
        assertEquals(List.of(9, 8, 7), result);
    }

    @Test
    void topN_全件より多い場合() {
        List<Integer> numbers = List.of(3, 1, 2);
        List<Integer> result = SortedCollectionUtils.topN(numbers, 10);
        assertEquals(List.of(3, 2, 1), result);
    }

    @Test
    void topN_重複あり() {
        List<Integer> numbers = List.of(5, 5, 3, 3, 1);
        List<Integer> result = SortedCollectionUtils.topN(numbers, 3);
        assertEquals(List.of(5, 3, 1), result);
    }
}
```

## ヒント

- **課題1**: `equals()` は `instanceof` パターンマッチングを使い、`studentId` で比較する。`hashCode()` は `studentId.hashCode()` を返す。
- **課題2-removeDuplicates**: `LinkedHashSet` にListの要素を追加すると、挿入順序を保持しつつ重複が排除される。結果を `new ArrayList<>()` で変換して返す。
- **課題2-groupByLength**: `HashMap<Integer, List<String>>` を使い、各文字列の `length()` をキーとして、`computeIfAbsent()` でリストを取得して追加する。
- **課題2-invertMap**: 新しい `HashMap<V, K>` を生成し、元のMapの `entrySet()` をループして `put(entry.getValue(), entry.getKey())` する。
- **課題3**: `TreeSet<>(Comparator.reverseOrder())` で降順のTreeSetを作成し、全要素を追加後、先頭からN件を取得する。
