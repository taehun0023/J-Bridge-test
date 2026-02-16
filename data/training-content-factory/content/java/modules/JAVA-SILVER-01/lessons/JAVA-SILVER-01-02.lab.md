# Lab: JAVA-SILVER-01-02 — コンストラクタとthis

## 目標

- デフォルトコンストラクタとパラメータ付きコンストラクタの違いを理解し実装できるようになる。
- コンストラクタのオーバーロードと `this()` によるチェーンを正しく実装できるようになる。
- コピーコンストラクタパターンを実装し、参照コピーとの違いを体験する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- ネットワーク接続は不要

## 課題

### 課題1: Rectangleクラスの作成

矩形（長方形）を表す `Rectangle` クラスを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `Rectangle` クラスを作成する
2. `private` フィールド: `int width`（幅）、`int height`（高さ）
3. 以下のコンストラクタを定義する:
   - `Rectangle()` — 幅1、高さ1で初期化（`this()` チェーンを使用すること）
   - `Rectangle(int side)` — 正方形用。幅・高さともに `side` で初期化（`this()` チェーンを使用すること）
   - `Rectangle(int width, int height)` — 幅と高さを指定して初期化（メインコンストラクタ）
4. 以下のメソッドを実装する:
   - `int getWidth()` — 幅を返す
   - `int getHeight()` — 高さを返す
   - `int getArea()` — 面積（幅×高さ）を返す
   - `int getPerimeter()` — 周長（(幅+高さ)×2）を返す

### 課題2: StudentクラスとCopyコンストラクタ

学生情報を管理する `Student` クラスを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `Student` クラスを作成する
2. `private` フィールド: `String name`（名前）、`int grade`（学年、1〜6）、`String club`（部活名）
3. 以下のコンストラクタを定義する:
   - `Student(String name, int grade, String club)` — 全フィールドを初期化
   - `Student(String name, int grade)` — 部活なし（clubを `"なし"` で初期化）。`this()` チェーンを使用すること
   - `Student(Student other)` — コピーコンストラクタ。引数のStudentの全フィールド値をコピー
4. 以下のメソッドを実装する:
   - `String getName()` — 名前を返す
   - `int getGrade()` — 学年を返す
   - `String getClub()` — 部活名を返す
   - `void setClub(String club)` — 部活名を変更する
   - `String getProfile()` — `"名前(学年年) - 部活名"` 形式の文字列を返す（例: `"田中(3年) - サッカー部"`）

### 課題3: 初期化順序の確認

初期化ブロックとコンストラクタの実行順序を確認する `InitOrder` クラスを作成せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `InitOrder` クラスを作成する
2. `private` フィールド `String log` をフィールド初期化で `"F"` に設定する
3. インスタンス初期化ブロックで `log` に `"I"` を連結する
4. 以下のコンストラクタを定義する:
   - `InitOrder()` — `log` に `"C"` を連結する
   - `InitOrder(String extra)` — `log` に `extra` を連結する
5. `String getLog()` メソッドで `log` の値を返す

## ファイル構成

```
lab-java-silver-01-02/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── Rectangle.java      # 課題1
    │                   ├── Student.java        # 課題2
    │                   └── InitOrder.java      # 課題3
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
    <artifactId>java-silver-01-02-lab</artifactId>
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

    // === 課題1: Rectangle ===

    @Test
    @DisplayName("課題1a: Rectangle() — デフォルトは1x1")
    void testRectangleDefault() {
        Rectangle r = new Rectangle();
        assertEquals(1, r.getWidth());
        assertEquals(1, r.getHeight());
    }

    @Test
    @DisplayName("課題1b: Rectangle(side) — 正方形")
    void testRectangleSquare() {
        Rectangle r = new Rectangle(5);
        assertEquals(5, r.getWidth());
        assertEquals(5, r.getHeight());
    }

    @Test
    @DisplayName("課題1c: Rectangle(w,h) — 幅と高さ指定")
    void testRectangleFull() {
        Rectangle r = new Rectangle(4, 6);
        assertEquals(4, r.getWidth());
        assertEquals(6, r.getHeight());
    }

    @Test
    @DisplayName("課題1d: getArea() — 面積計算")
    void testRectangleArea() {
        Rectangle r = new Rectangle(3, 7);
        assertEquals(21, r.getArea());
    }

    @Test
    @DisplayName("課題1e: getPerimeter() — 周長計算")
    void testRectanglePerimeter() {
        Rectangle r = new Rectangle(3, 7);
        assertEquals(20, r.getPerimeter());
    }

    // === 課題2: Student ===

    @Test
    @DisplayName("課題2a: Student(name,grade,club) — 全引数コンストラクタ")
    void testStudentFull() {
        Student s = new Student("田中", 3, "サッカー部");
        assertEquals("田中", s.getName());
        assertEquals(3, s.getGrade());
        assertEquals("サッカー部", s.getClub());
    }

    @Test
    @DisplayName("課題2b: Student(name,grade) — 部活なし")
    void testStudentNoClub() {
        Student s = new Student("鈴木", 2);
        assertEquals("鈴木", s.getName());
        assertEquals(2, s.getGrade());
        assertEquals("なし", s.getClub());
    }

    @Test
    @DisplayName("課題2c: Student(other) — コピーコンストラクタ")
    void testStudentCopy() {
        Student original = new Student("山田", 4, "野球部");
        Student copy = new Student(original);
        assertEquals("山田", copy.getName());
        assertEquals(4, copy.getGrade());
        assertEquals("野球部", copy.getClub());

        // コピーを変更しても元のインスタンスに影響しないことを確認
        copy.setClub("テニス部");
        assertEquals("野球部", original.getClub(),
            "コピーの変更がオリジナルに影響しないこと");
    }

    @Test
    @DisplayName("課題2d: getProfile() — プロフィール形式")
    void testStudentProfile() {
        Student s = new Student("田中", 3, "サッカー部");
        assertEquals("田中(3年) - サッカー部", s.getProfile());
    }

    // === 課題3: InitOrder ===

    @Test
    @DisplayName("課題3a: InitOrder() — 初期化順序 F→I→C")
    void testInitOrderDefault() {
        InitOrder io = new InitOrder();
        assertEquals("FIC", io.getLog(),
            "フィールド初期化(F)→初期化ブロック(I)→コンストラクタ(C)の順");
    }

    @Test
    @DisplayName("課題3b: InitOrder(extra) — 初期化順序 F→I→extra")
    void testInitOrderWithParam() {
        InitOrder io = new InitOrder("X");
        assertEquals("FIX", io.getLog(),
            "フィールド初期化(F)→初期化ブロック(I)→コンストラクタ(X)の順");
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全11テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `Rectangle()` は `this(1)` を、`Rectangle(int side)` は `this(side, side)` を呼び出すことでチェーンを実現する。メインコンストラクタ `Rectangle(int width, int height)` に実際の初期化ロジックを集約する。
- **課題2のヒント:** コピーコンストラクタでは `this.name = other.name` のように各フィールドをコピーする。Stringはイミュータブル（不変）なので参照コピーでも安全。`getProfile()` は `name + "(" + grade + "年) - " + club` のように文字列連結する。
- **課題3のヒント:** フィールド初期化 `String log = "F"` → インスタンス初期化ブロック `{ log += "I"; }` → コンストラクタの順で実行される。この順序は Java 言語仕様で定められている。
- **thisチェーンの注意:** `this()` はコンストラクタの最初のステートメントでなければならない。`this.field = value` を `this()` の前に書くとコンパイルエラーになる。
