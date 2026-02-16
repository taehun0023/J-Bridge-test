# Lab: JAVA-SILVER-01-03 — 継承とオーバーライド

## 目標

- `extends` による継承を正しく実装し、スーパークラスのフィールド・メソッドを再利用できるようになる。
- `super` を使ったコンストラクタ呼び出しとメソッド呼び出しを実装できるようになる。
- `toString()`、`equals()`、`hashCode()` のオーバーライドを実装できるようになる。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- ネットワーク接続は不要

## 課題

### 課題1: Shapeクラスの継承階層

図形の継承階層を構築せよ。

**要件:**

**Shape クラス（スーパークラス）:**
1. パッケージ `jp.co.training` に属する
2. `protected String color` フィールド
3. `Shape(String color)` コンストラクタ
4. `public String getColor()` — 色を返す
5. `public double getArea()` — 面積を返す（デフォルトで `0.0` を返す）
6. `toString()` をオーバーライドし `"Shape(色)"`形式の文字列を返す

**Circle クラス（Shape を継承）:**
1. `private double radius` フィールド
2. `Circle(String color, double radius)` コンストラクタ（`super` を使用）
3. `getArea()` をオーバーライドし `Math.PI * radius * radius` を返す
4. `public double getRadius()` — 半径を返す
5. `toString()` をオーバーライドし `"Circle(色, 半径=X.X)"` 形式の文字列を返す（小数点1桁は `String.format("%.1f", radius)` を使用）

**Rectangle クラス（Shape を継承）:**
1. `private double width`、`private double height` フィールド
2. `Rectangle(String color, double width, double height)` コンストラクタ（`super` を使用）
3. `getArea()` をオーバーライドし `width * height` を返す
4. `public double getWidth()`、`public double getHeight()` — 幅・高さを返す
5. `toString()` をオーバーライドし `"Rectangle(色, 幅=X.X, 高さ=X.X)"` 形式の文字列を返す

### 課題2: equals() と hashCode() のオーバーライド

座標を表す `Coordinate` クラスを作成し、論理的等価性を実装せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `Coordinate` クラスを作成する
2. `private final int x`、`private final int y` フィールド
3. `Coordinate(int x, int y)` コンストラクタ
4. `public int getX()`、`public int getY()` メソッド
5. `equals(Object)` をオーバーライドし、x と y が同じなら `true` を返す
6. `hashCode()` をオーバーライドし、`equals` と整合する実装にする（`Objects.hash(x, y)` を使用）
7. `toString()` をオーバーライドし `"(x, y)"` 形式の文字列を返す

### 課題3: super を使ったメソッド拡張

ログ出力を行う `Logger` クラスと、タイムスタンプ付きの `TimestampLogger` クラスを作成せよ。

**要件:**

**Logger クラス:**
1. パッケージ `jp.co.training` に属する
2. `public String format(String message)` — `"[LOG] メッセージ"` 形式の文字列を返す

**TimestampLogger クラス（Logger を継承）:**
1. `private String timestamp` フィールド
2. `TimestampLogger(String timestamp)` コンストラクタ
3. `format(String message)` をオーバーライドし、`super.format(message)` の結果の先頭に `"[タイムスタンプ] "` を付加して返す
   - 例: `timestamp` が `"2024-01-15"` で `message` が `"起動"` の場合、`"[2024-01-15] [LOG] 起動"` を返す

## ファイル構成

```
lab-java-silver-01-03/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── Shape.java            # 課題1
    │                   ├── Circle.java           # 課題1
    │                   ├── Rectangle.java        # 課題1
    │                   ├── Coordinate.java       # 課題2
    │                   ├── Logger.java           # 課題3
    │                   └── TimestampLogger.java  # 課題3
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
    <artifactId>java-silver-01-03-lab</artifactId>
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

    // === 課題1: Shape 継承階層 ===

    @Test
    @DisplayName("課題1a: Circle — getArea()が正しい面積を返す")
    void testCircleArea() {
        Circle c = new Circle("赤", 5.0);
        assertEquals(Math.PI * 25, c.getArea(), 0.001);
    }

    @Test
    @DisplayName("課題1b: Circle — 色と半径の取得")
    void testCircleProperties() {
        Circle c = new Circle("青", 3.0);
        assertEquals("青", c.getColor());
        assertEquals(3.0, c.getRadius(), 0.001);
    }

    @Test
    @DisplayName("課題1c: Circle — toString()の形式")
    void testCircleToString() {
        Circle c = new Circle("赤", 5.0);
        assertEquals("Circle(赤, 半径=5.0)", c.toString());
    }

    @Test
    @DisplayName("課題1d: Rectangle — getArea()が正しい面積を返す")
    void testRectangleArea() {
        Rectangle r = new Rectangle("緑", 4.0, 6.0);
        assertEquals(24.0, r.getArea(), 0.001);
    }

    @Test
    @DisplayName("課題1e: Rectangle — 色・幅・高さの取得")
    void testRectangleProperties() {
        Rectangle r = new Rectangle("黄", 3.0, 7.0);
        assertEquals("黄", r.getColor());
        assertEquals(3.0, r.getWidth(), 0.001);
        assertEquals(7.0, r.getHeight(), 0.001);
    }

    @Test
    @DisplayName("課題1f: Rectangle — toString()の形式")
    void testRectangleToString() {
        Rectangle r = new Rectangle("緑", 4.0, 6.0);
        assertEquals("Rectangle(緑, 幅=4.0, 高さ=6.0)", r.toString());
    }

    @Test
    @DisplayName("課題1g: Shape — デフォルトのgetArea()は0.0")
    void testShapeDefaultArea() {
        Shape s = new Shape("白") {};
        assertEquals(0.0, s.getArea(), 0.001);
    }

    // === 課題2: Coordinate ===

    @Test
    @DisplayName("課題2a: Coordinate — equals()で論理的等価性を判定")
    void testCoordinateEquals() {
        Coordinate c1 = new Coordinate(3, 5);
        Coordinate c2 = new Coordinate(3, 5);
        Coordinate c3 = new Coordinate(1, 2);
        assertTrue(c1.equals(c2));
        assertFalse(c1.equals(c3));
        assertFalse(c1.equals(null));
    }

    @Test
    @DisplayName("課題2b: Coordinate — hashCode()の整合性")
    void testCoordinateHashCode() {
        Coordinate c1 = new Coordinate(3, 5);
        Coordinate c2 = new Coordinate(3, 5);
        assertEquals(c1.hashCode(), c2.hashCode(),
            "equalsがtrueのオブジェクトは同じhashCodeを返すこと");
    }

    @Test
    @DisplayName("課題2c: Coordinate — toString()の形式")
    void testCoordinateToString() {
        Coordinate c = new Coordinate(3, 5);
        assertEquals("(3, 5)", c.toString());
    }

    @Test
    @DisplayName("課題2d: Coordinate — getterメソッド")
    void testCoordinateGetters() {
        Coordinate c = new Coordinate(10, 20);
        assertEquals(10, c.getX());
        assertEquals(20, c.getY());
    }

    // === 課題3: Logger 継承 ===

    @Test
    @DisplayName("課題3a: Logger — format()の形式")
    void testLoggerFormat() {
        Logger logger = new Logger();
        assertEquals("[LOG] 起動", logger.format("起動"));
    }

    @Test
    @DisplayName("課題3b: TimestampLogger — super.format()を使った拡張")
    void testTimestampLoggerFormat() {
        TimestampLogger tl = new TimestampLogger("2024-01-15");
        assertEquals("[2024-01-15] [LOG] 起動", tl.format("起動"));
    }

    @Test
    @DisplayName("課題3c: TimestampLogger — 別のタイムスタンプで動作確認")
    void testTimestampLoggerFormat2() {
        TimestampLogger tl = new TimestampLogger("2024-12-31");
        assertEquals("[2024-12-31] [LOG] エラー発生", tl.format("エラー発生"));
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全14テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `Circle` と `Rectangle` のコンストラクタでは `super(color)` を先頭で呼び出す。`getArea()` は各サブクラスで `@Override` を付けてオーバーライドする。`String.format("%.1f", value)` で小数点1桁の表示ができる。
- **課題2のヒント:** `equals()` のパターンは「(1) 同一参照チェック → (2) nullチェック・型チェック → (3) キャスト → (4) フィールド比較」の4ステップ。`hashCode()` は `Objects.hash(x, y)` を使えば簡単に実装できる。`import java.util.Objects;` を忘れないこと。
- **課題3のヒント:** `TimestampLogger.format()` 内で `super.format(message)` を呼び出し、その戻り値の先頭に `"[" + timestamp + "] "` を付加する。これが `super` によるメソッド再利用パターンである。
- **toString()の注意:** テストではフォーマットが完全一致で検証される。スペースや記号の位置に注意すること。
