# Lab: JAVA-GOLD-01-02 — 境界ワイルドカードとPECS原則

## 目標

- 上限境界(`<? extends T>`)と下限境界(`<? super T>`)の動作を実装を通じて理解する
- PECS原則を正しく適用したジェネリクスメソッドを実装する
- 非境界ワイルドカード(`<?>`)の使い方を体験する

所要時間: 30〜45分

## 前提条件

- Java 17 がインストールされていること
- Maven が使用可能であること
- ジェネリクスの基礎（型パラメータ、型消去）の概念を学習済みであること
- ネットワーク接続は不要

## 課題

### 課題1: PECS原則に基づくtransferメソッド

`WildcardUtils` クラスの `transfer` メソッドを実装せよ。ソースリストのすべての要素をターゲットリストにコピーする。

- PECS原則に従い、適切なワイルドカードを使用すること
- src（Producer）→ `<? extends T>`
- dest（Consumer）→ `<? super T>`

```java
public static <T> void transfer(List<? super T> dest, List<? extends T> src)
```

### 課題2: 条件付きフィルタリング

`WildcardUtils` クラスの `filterGreaterThan` メソッドを実装せよ。ソースリストから閾値より大きい要素のみを新しいリストに格納して返す。

- Comparable を使って比較すること
- ソースリストにはPECS原則に基づく適切なワイルドカードを使用すること

```java
public static <T extends Comparable<T>> List<T> filterGreaterThan(
    List<? extends T> src, T threshold)
```

### 課題3: 非境界ワイルドカードの活用

`WildcardUtils` クラスの以下のメソッドを実装せよ。

**countNulls**: リスト内のnull要素の数を返す。要素の型に依存しないため非境界ワイルドカードを使用する。

```java
public static int countNulls(List<?> list)
```

**printAll**: リスト内のすべての要素を改行区切りで標準出力に出力する。

```java
public static void printAll(List<?> list)
```

### 課題4: 上限境界を使ったsum計算

`WildcardUtils` クラスの `sumNumbers` メソッドを実装せよ。Number型のサブクラスを要素とするリストの合計を`double`で返す。

```java
public static double sumNumbers(List<? extends Number> numbers)
```

## ファイル構成

```
lab-java-gold-01-02/
├── pom.xml
└── src/
    ├── main/java/wildcards/
    │   └── WildcardUtils.java      ← 実装対象
    └── test/java/wildcards/
        └── WildcardUtilsTest.java   ← 自動採点テスト（変更不可）
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
    <artifactId>java-gold-01-02</artifactId>
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

### WildcardUtils.java（実装テンプレート）

```java
package wildcards;

import java.util.List;

public class WildcardUtils {

    // 課題1: PECS原則に基づくtransfer
    public static <T> void transfer(List<? super T> dest, List<? extends T> src) {
        // TODO: srcのすべての要素をdestに追加する
        throw new UnsupportedOperationException("未実装");
    }

    // 課題2: 条件付きフィルタリング
    public static <T extends Comparable<T>> List<T> filterGreaterThan(
            List<? extends T> src, T threshold) {
        // TODO: srcからthresholdより大きい要素のみを新しいリストに格納して返す
        throw new UnsupportedOperationException("未実装");
    }

    // 課題3-1: null要素のカウント
    public static int countNulls(List<?> list) {
        // TODO: リスト内のnull要素の数を返す
        throw new UnsupportedOperationException("未実装");
    }

    // 課題3-2: 全要素の出力
    public static void printAll(List<?> list) {
        // TODO: リスト内のすべての要素を改行区切りで標準出力に出力
        throw new UnsupportedOperationException("未実装");
    }

    // 課題4: Number合計
    public static double sumNumbers(List<? extends Number> numbers) {
        // TODO: リスト内のNumber要素の合計をdoubleで返す
        throw new UnsupportedOperationException("未実装");
    }
}
```

## 自動採点（JUnit 5）

```java
package wildcards;

import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class WildcardUtilsTest {

    // === 課題1: transfer ===

    @Test
    void transferCopiesAllElements() {
        List<Integer> src = List.of(1, 2, 3);
        List<Number> dest = new ArrayList<>();
        WildcardUtils.transfer(dest, src);
        assertEquals(3, dest.size());
        assertEquals(1, dest.get(0));
        assertEquals(2, dest.get(1));
        assertEquals(3, dest.get(2));
    }

    @Test
    void transferWithEmptySource() {
        List<String> src = List.of();
        List<Object> dest = new ArrayList<>();
        WildcardUtils.transfer(dest, src);
        assertTrue(dest.isEmpty());
    }

    @Test
    void transferAppendsToExistingElements() {
        List<Integer> src = List.of(4, 5);
        List<Number> dest = new ArrayList<>(List.of(1, 2, 3));
        WildcardUtils.transfer(dest, src);
        assertEquals(5, dest.size());
    }

    // === 課題2: filterGreaterThan ===

    @Test
    void filterGreaterThanReturnsMatchingElements() {
        List<Integer> src = List.of(1, 5, 3, 8, 2, 7);
        List<Integer> result = WildcardUtils.filterGreaterThan(src, 4);
        assertEquals(List.of(5, 8, 7), result);
    }

    @Test
    void filterGreaterThanWithStrings() {
        List<String> src = List.of("apple", "banana", "cherry", "date");
        List<String> result = WildcardUtils.filterGreaterThan(src, "cherry");
        assertEquals(List.of("date"), result);
    }

    @Test
    void filterGreaterThanReturnsEmptyWhenNoMatch() {
        List<Integer> src = List.of(1, 2, 3);
        List<Integer> result = WildcardUtils.filterGreaterThan(src, 10);
        assertTrue(result.isEmpty());
    }

    // === 課題3: countNulls & printAll ===

    @Test
    void countNullsReturnsCorrectCount() {
        List<String> list = new ArrayList<>();
        list.add("a");
        list.add(null);
        list.add("b");
        list.add(null);
        assertEquals(2, WildcardUtils.countNulls(list));
    }

    @Test
    void countNullsReturnsZeroForNoNulls() {
        assertEquals(0, WildcardUtils.countNulls(List.of(1, 2, 3)));
    }

    @Test
    void countNullsReturnsZeroForEmptyList() {
        assertEquals(0, WildcardUtils.countNulls(List.of()));
    }

    @Test
    void printAllDoesNotThrow() {
        assertDoesNotThrow(() -> WildcardUtils.printAll(List.of("a", "b")));
        assertDoesNotThrow(() -> WildcardUtils.printAll(List.of(1, 2, 3)));
        assertDoesNotThrow(() -> WildcardUtils.printAll(List.of()));
    }

    // === 課題4: sumNumbers ===

    @Test
    void sumNumbersWithIntegers() {
        List<Integer> ints = List.of(1, 2, 3, 4, 5);
        assertEquals(15.0, WildcardUtils.sumNumbers(ints), 0.001);
    }

    @Test
    void sumNumbersWithDoubles() {
        List<Double> doubles = List.of(1.5, 2.5, 3.0);
        assertEquals(7.0, WildcardUtils.sumNumbers(doubles), 0.001);
    }

    @Test
    void sumNumbersWithEmptyList() {
        List<Integer> empty = List.of();
        assertEquals(0.0, WildcardUtils.sumNumbers(empty), 0.001);
    }

    @Test
    void sumNumbersWithMixedViaNumber() {
        List<Number> mixed = new ArrayList<>();
        mixed.add(10);
        mixed.add(2.5);
        mixed.add(7L);
        assertEquals(19.5, WildcardUtils.sumNumbers(mixed), 0.001);
    }
}
```

## ヒント

- **課題1**: forループで `src` の各要素を `dest.add(item)` で追加するだけで完成する。PECS原則によりsrcからの読み取りとdestへの書き込みが型安全に行える。
- **課題2**: 新しい `ArrayList<T>` を生成し、srcの各要素について `item.compareTo(threshold) > 0` であれば追加する。
- **課題3-1**: forループで各要素が `null` であればカウントを増やす。
- **課題3-2**: forループで各要素を `System.out.println(item)` で出力する。
- **課題4**: forループで各要素の `doubleValue()` を合計する。Number型として読み取れるため `n.doubleValue()` が使用可能。
