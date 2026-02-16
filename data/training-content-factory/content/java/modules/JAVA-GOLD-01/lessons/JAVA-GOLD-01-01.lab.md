# Lab: JAVA-GOLD-01-01 — ジェネリクスの基礎

## 目標

ジェネリクスの基本概念を実践的に理解する。型パラメータを用いたクラスとメソッドを自分で実装し、型安全なコードと raw type の違いを体験する。

所要時間: 30〜45分

## 前提条件

- Java 17 がインストールされていること
- Maven が使用可能であること
- ジェネリクスの基礎（型パラメータ、型消去、ダイヤモンド演算子）の概念を学習済みであること
- ネットワーク接続は不要

## 課題

以下の4つの課題に取り組む。すべてのクラスに型パラメータを正しく定義し、コンパイル時の型安全を保証すること。

### 課題1: ジェネリクス `Box<T>` クラスの実装

任意の型の値を1つ格納できるジェネリクスクラス `Box<T>` を実装せよ。

**実装するクラス:** `src/main/java/generics/Box.java`

```java
package generics;

public class Box<T> {

    /**
     * コンストラクタ: 値を受け取って格納する。
     * @param value 格納する値（null 許容）
     */
    public Box(T value) { /* TODO */ }

    /**
     * 格納された値を返す。
     * @return 格納された値
     */
    public T getValue() { /* TODO */ }

    /**
     * 格納された値を新しい値で置き換える。
     * @param value 新しい値
     */
    public void setValue(T value) { /* TODO */ }

    /**
     * 値が null でないかどうかを返す。
     * @return 値が null でなければ true
     */
    public boolean isPresent() { /* TODO */ }

    /**
     * 値が null の場合に代替値を返す。
     * @param defaultValue 代替値
     * @return 格納された値。null の場合は defaultValue
     */
    public T orElse(T defaultValue) { /* TODO */ }
}
```

### 課題2: ジェネリクス `Pair<K, V>` クラスの実装

2つの異なる型の値を組にして保持するジェネリクスクラス `Pair<K, V>` を実装せよ。

**実装するクラス:** `src/main/java/generics/Pair.java`

```java
package generics;

public class Pair<K, V> {

    /**
     * コンストラクタ: キーと値を受け取る。
     */
    public Pair(K key, V value) { /* TODO */ }

    /**
     * キーを返す。
     */
    public K getKey() { /* TODO */ }

    /**
     * 値を返す。
     */
    public V getValue() { /* TODO */ }

    /**
     * キーと値を入れ替えた新しい Pair を返す。
     * @return 値がキー、キーが値となった Pair<V, K>
     */
    public Pair<V, K> swap() { /* TODO */ }

    /**
     * toString の実装。
     * @return "(key, value)" 形式の文字列
     */
    @Override
    public String toString() { /* TODO */ }
}
```

### 課題3: ジェネリクスユーティリティメソッドの実装

ジェネリクスメソッドをまとめたユーティリティクラス `GenericUtils` を実装せよ。

**実装するクラス:** `src/main/java/generics/GenericUtils.java`

```java
package generics;

import java.util.List;

public class GenericUtils {

    /**
     * リストの最初の要素を返す。リストが空または null の場合は null を返す。
     * @param list 対象リスト
     * @param <T> 要素の型
     * @return 最初の要素。空または null の場合は null
     */
    public static <T> T firstOrNull(List<T> list) { /* TODO */ }

    /**
     * リストの最後の要素を返す。リストが空または null の場合は null を返す。
     * @param list 対象リスト
     * @param <T> 要素の型
     * @return 最後の要素。空または null の場合は null
     */
    public static <T> T lastOrNull(List<T> list) { /* TODO */ }

    /**
     * 2つの Box の中身を入れ替える。
     * @param a 1つ目の Box
     * @param b 2つ目の Box
     * @param <T> 格納されている値の型
     */
    public static <T> void swapBoxes(Box<T> a, Box<T> b) { /* TODO */ }

    /**
     * 3つの値のうち null でないものを順に探して返す。
     * すべて null の場合は null を返す。
     * @param first 第一候補
     * @param second 第二候補
     * @param third 第三候補
     * @param <T> 値の型
     * @return 最初に見つかった null でない値
     */
    public static <T> T coalesce(T first, T second, T third) { /* TODO */ }
}
```

### 課題4: 型安全の確認（コードリーディング）

以下のコードを `src/main/java/generics/TypeSafetyDemo.java` に記述し、コメントで指示された箇所の動作を確認せよ。

**実装するクラス:** `src/main/java/generics/TypeSafetyDemo.java`

```java
package generics;

import java.util.ArrayList;
import java.util.List;

public class TypeSafetyDemo {

    /**
     * raw type を使用した場合の問題を実演する。
     * このメソッドは意図的に raw type を使い、ClassCastException を発生させる。
     * @throws ClassCastException 型不整合により実行時に発生する
     */
    @SuppressWarnings("unchecked")
    public static void unsafeDemo() {
        // TODO: raw type の List を作成し、String と Integer を混在させて格納する
        // TODO: Integer の要素を String にキャストして ClassCastException を発生させる
    }

    /**
     * ジェネリクスを使用した型安全なコードを実演する。
     * @return 型安全に取得された文字列のリスト
     */
    public static List<String> safeDemo() {
        // TODO: ジェネリクス付きの List<String> を作成し、要素を追加して返す
        // キャスト不要で安全に要素を取得できることを確認する
        return null; // TODO: 実装で置き換える
    }
}
```

## ファイル構成

```
lab-java-gold-01-01/
├── pom.xml
├── src/
│   ├── main/
│   │   └── java/
│   │       └── generics/
│   │           ├── Box.java
│   │           ├── Pair.java
│   │           ├── GenericUtils.java
│   │           └── TypeSafetyDemo.java
│   └── test/
│       └── java/
│           └── generics/
│               ├── BoxTest.java
│               ├── PairTest.java
│               ├── GenericUtilsTest.java
│               └── TypeSafetyDemoTest.java
└── README.md
```

**pom.xml** の最小構成:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.jbridge.lab</groupId>
    <artifactId>java-gold-01-01</artifactId>
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

以下のテストがすべて通れば合格とする。

### BoxTest.java

```java
package generics;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class BoxTest {

    @Test
    void shouldStoreAndRetrieveString() {
        Box<String> box = new Box<>("hello");
        assertEquals("hello", box.getValue());
    }

    @Test
    void shouldStoreAndRetrieveInteger() {
        Box<Integer> box = new Box<>(42);
        assertEquals(42, box.getValue());
    }

    @Test
    void shouldHandleNullValue() {
        Box<String> box = new Box<>(null);
        assertNull(box.getValue());
    }

    @Test
    void shouldSetNewValue() {
        Box<String> box = new Box<>("old");
        box.setValue("new");
        assertEquals("new", box.getValue());
    }

    @Test
    void isPresentReturnsTrueWhenValueExists() {
        Box<String> box = new Box<>("hello");
        assertTrue(box.isPresent());
    }

    @Test
    void isPresentReturnsFalseWhenValueIsNull() {
        Box<String> box = new Box<>(null);
        assertFalse(box.isPresent());
    }

    @Test
    void orElseReturnsValueWhenPresent() {
        Box<String> box = new Box<>("hello");
        assertEquals("hello", box.orElse("default"));
    }

    @Test
    void orElseReturnsDefaultWhenNull() {
        Box<String> box = new Box<>(null);
        assertEquals("default", box.orElse("default"));
    }
}
```

### PairTest.java

```java
package generics;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class PairTest {

    @Test
    void shouldStoreKeyAndValue() {
        Pair<String, Integer> pair = new Pair<>("age", 25);
        assertEquals("age", pair.getKey());
        assertEquals(25, pair.getValue());
    }

    @Test
    void shouldHandleDifferentTypes() {
        Pair<Integer, Boolean> pair = new Pair<>(1, true);
        assertEquals(1, pair.getKey());
        assertTrue(pair.getValue());
    }

    @Test
    void swapShouldReverseKeyAndValue() {
        Pair<String, Integer> original = new Pair<>("name", 42);
        Pair<Integer, String> swapped = original.swap();
        assertEquals(42, swapped.getKey());
        assertEquals("name", swapped.getValue());
    }

    @Test
    void toStringShouldFormatCorrectly() {
        Pair<String, Integer> pair = new Pair<>("key", 100);
        assertEquals("(key, 100)", pair.toString());
    }

    @Test
    void shouldHandleNullKeyAndValue() {
        Pair<String, String> pair = new Pair<>(null, null);
        assertNull(pair.getKey());
        assertNull(pair.getValue());
    }
}
```

### GenericUtilsTest.java

```java
package generics;

import org.junit.jupiter.api.Test;
import java.util.ArrayList;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class GenericUtilsTest {

    @Test
    void firstOrNullReturnsFirstElement() {
        List<String> list = List.of("a", "b", "c");
        assertEquals("a", GenericUtils.firstOrNull(list));
    }

    @Test
    void firstOrNullReturnsNullForEmptyList() {
        List<String> list = List.of();
        assertNull(GenericUtils.firstOrNull(list));
    }

    @Test
    void firstOrNullReturnsNullForNull() {
        assertNull(GenericUtils.firstOrNull(null));
    }

    @Test
    void lastOrNullReturnsLastElement() {
        List<Integer> list = List.of(1, 2, 3);
        assertEquals(3, GenericUtils.lastOrNull(list));
    }

    @Test
    void lastOrNullReturnsNullForEmptyList() {
        List<Integer> list = List.of();
        assertNull(GenericUtils.lastOrNull(list));
    }

    @Test
    void lastOrNullReturnsNullForNull() {
        assertNull(GenericUtils.lastOrNull(null));
    }

    @Test
    void swapBoxesShouldExchangeValues() {
        Box<String> a = new Box<>("first");
        Box<String> b = new Box<>("second");
        GenericUtils.swapBoxes(a, b);
        assertEquals("second", a.getValue());
        assertEquals("first", b.getValue());
    }

    @Test
    void coalesceReturnsFirstNonNull() {
        assertEquals("a", GenericUtils.coalesce("a", "b", "c"));
        assertEquals("b", GenericUtils.coalesce(null, "b", "c"));
        assertEquals("c", GenericUtils.coalesce(null, null, "c"));
    }

    @Test
    void coalesceReturnsNullWhenAllNull() {
        assertNull(GenericUtils.coalesce(null, null, null));
    }
}
```

### TypeSafetyDemoTest.java

```java
package generics;

import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class TypeSafetyDemoTest {

    @Test
    void unsafeDemoShouldThrowClassCastException() {
        assertThrows(ClassCastException.class, TypeSafetyDemo::unsafeDemo);
    }

    @Test
    void safeDemoShouldReturnNonEmptyList() {
        List<String> result = TypeSafetyDemo.safeDemo();
        assertNotNull(result);
        assertFalse(result.isEmpty());
    }

    @Test
    void safeDemoShouldContainOnlyStrings() {
        List<String> result = TypeSafetyDemo.safeDemo();
        for (String s : result) {
            assertNotNull(s);
        }
    }
}
```

## ヒント

- `Box<T>` の `orElse` メソッドは三項演算子を使うと1行で書ける
- `Pair` の `swap()` は新しい `Pair<V, K>` インスタンスを生成して返す
- `GenericUtils.swapBoxes` では一時変数に値を退避してから入れ替える
- `GenericUtils.coalesce` は `if` 文を3回書くか、可変長引数版を作ってループで処理してもよい
- `TypeSafetyDemo.unsafeDemo()` では raw type の `List` に `String` と `Integer` を混在させ、`Integer` の要素を `(String)` でキャストすると `ClassCastException` が発生する
- すべてのジェネリクスクラスでダイヤモンド演算子 `<>` を活用すること
