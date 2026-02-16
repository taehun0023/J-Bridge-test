# Lab: JAVA-SILVER-01-05 — インタフェースとデフォルトメソッド

## 目標

- インタフェースの宣言と `implements` による実装を正しく行えるようになる。
- 複数インタフェースの実装とデフォルトメソッドの活用を体験する。
- 関数型インタフェースとラムダ式の基本的な使い方を理解する。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- Maven がインストールされていること（`mvn -version` で確認）
- ネットワーク接続は不要

## 課題

### 課題1: 複数インタフェースの実装

メディアプレーヤーの機能を表すインタフェース群を作成し、実装クラスを構築せよ。

**要件:**

**Playable インタフェース:**
1. パッケージ `jp.co.training` に属する
2. `String play()` — 再生メッセージを返す抽象メソッド

**Recordable インタフェース:**
1. パッケージ `jp.co.training` に属する
2. `String record()` — 録音/録画メッセージを返す抽象メソッド

**Describable インタフェース:**
1. パッケージ `jp.co.training` に属する
2. `default String describe()` — デフォルトで `"メディアデバイス"` を返すデフォルトメソッド

**MusicPlayer クラス（Playable, Describable を実装）:**
1. `private String name` フィールド
2. `MusicPlayer(String name)` コンストラクタ
3. `play()` は `"名前で音楽を再生中"` を返す
4. `describe()` をオーバーライドし `"名前 - 音楽プレーヤー"` を返す

**VideoRecorder クラス（Playable, Recordable, Describable を実装）:**
1. `private String name` フィールド
2. `VideoRecorder(String name)` コンストラクタ
3. `play()` は `"名前で映像を再生中"` を返す
4. `record()` は `"名前で映像を録画中"` を返す
5. `describe()` をオーバーライドし `"名前 - ビデオレコーダー"` を返す

### 課題2: デフォルトメソッドの衝突解決

2つのインタフェースのデフォルトメソッドが衝突するケースを実装せよ。

**要件:**

**Greetable インタフェース:**
1. パッケージ `jp.co.training` に属する
2. `default String greet()` — `"Hello"` を返すデフォルトメソッド

**Farewell インタフェース:**
1. パッケージ `jp.co.training` に属する
2. `default String greet()` — `"Goodbye"` を返すデフォルトメソッド

**Polite クラス（Greetable, Farewell を実装）:**
1. `greet()` をオーバーライドし `"Hello and Goodbye"` を返す
   - 内部で `Greetable.super.greet()` と `Farewell.super.greet()` を使って `"Greetable.super.greet() + \" and \" + Farewell.super.greet()"` の形で構築すること

### 課題3: 関数型インタフェースの作成と使用

文字列を変換する関数型インタフェースを作成せよ。

**要件:**

**TextFormatter（関数型インタフェース）:**
1. パッケージ `jp.co.training` に属する
2. `@FunctionalInterface` アノテーションを付ける
3. `String format(String text)` — 抽象メソッド
4. `default TextFormatter andThen(TextFormatter after)` — 自分の結果を `after` に渡す合成メソッド
   - `return text -> after.format(this.format(text));`
5. `static TextFormatter identity()` — 入力をそのまま返す `TextFormatter` を返すファクトリメソッド

**TextFormatterHelper クラス:**
1. パッケージ `jp.co.training` に属する
2. `public static String applyFormatters(String text, TextFormatter... formatters)` — 複数のフォーマッタを順に適用した結果を返す
   - フォーマッタが0個の場合はそのまま `text` を返す
   - フォーマッタが1個以上の場合は順に `andThen` で合成して適用する

## ファイル構成

```
lab-java-silver-01-05/
├── pom.xml
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── Playable.java          # 課題1
    │                   ├── Recordable.java        # 課題1
    │                   ├── Describable.java       # 課題1
    │                   ├── MusicPlayer.java       # 課題1
    │                   ├── VideoRecorder.java     # 課題1
    │                   ├── Greetable.java         # 課題2
    │                   ├── Farewell.java          # 課題2
    │                   ├── Polite.java            # 課題2
    │                   ├── TextFormatter.java     # 課題3
    │                   └── TextFormatterHelper.java # 課題3
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
    <artifactId>java-silver-01-05-lab</artifactId>
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

    // === 課題1: 複数インタフェースの実装 ===

    @Test
    @DisplayName("課題1a: MusicPlayer — play()")
    void testMusicPlayerPlay() {
        MusicPlayer mp = new MusicPlayer("iPod");
        assertEquals("iPodで音楽を再生中", mp.play());
    }

    @Test
    @DisplayName("課題1b: MusicPlayer — describe()")
    void testMusicPlayerDescribe() {
        MusicPlayer mp = new MusicPlayer("iPod");
        assertEquals("iPod - 音楽プレーヤー", mp.describe());
    }

    @Test
    @DisplayName("課題1c: MusicPlayer — Playable型として扱える")
    void testMusicPlayerAsPlayable() {
        Playable p = new MusicPlayer("iPod");
        assertEquals("iPodで音楽を再生中", p.play());
    }

    @Test
    @DisplayName("課題1d: VideoRecorder — play()")
    void testVideoRecorderPlay() {
        VideoRecorder vr = new VideoRecorder("DVR");
        assertEquals("DVRで映像を再生中", vr.play());
    }

    @Test
    @DisplayName("課題1e: VideoRecorder — record()")
    void testVideoRecorderRecord() {
        VideoRecorder vr = new VideoRecorder("DVR");
        assertEquals("DVRで映像を録画中", vr.record());
    }

    @Test
    @DisplayName("課題1f: VideoRecorder — describe()")
    void testVideoRecorderDescribe() {
        VideoRecorder vr = new VideoRecorder("DVR");
        assertEquals("DVR - ビデオレコーダー", vr.describe());
    }

    @Test
    @DisplayName("課題1g: Describable — デフォルト実装")
    void testDescribableDefault() {
        Describable d = new Describable() {};
        assertEquals("メディアデバイス", d.describe());
    }

    // === 課題2: デフォルトメソッドの衝突解決 ===

    @Test
    @DisplayName("課題2a: Polite — greet()の衝突解決")
    void testPoliteGreet() {
        Polite p = new Polite();
        assertEquals("Hello and Goodbye", p.greet());
    }

    @Test
    @DisplayName("課題2b: Polite — Greetable型として扱える")
    void testPoliteAsGreetable() {
        Greetable g = new Polite();
        assertEquals("Hello and Goodbye", g.greet());
    }

    // === 課題3: 関数型インタフェース ===

    @Test
    @DisplayName("課題3a: TextFormatter — ラムダ式で実装")
    void testTextFormatterLambda() {
        TextFormatter upper = text -> text.toUpperCase();
        assertEquals("HELLO", upper.format("hello"));
    }

    @Test
    @DisplayName("課題3b: TextFormatter — andThenで合成")
    void testTextFormatterAndThen() {
        TextFormatter trim = text -> text.trim();
        TextFormatter upper = text -> text.toUpperCase();
        TextFormatter combined = trim.andThen(upper);
        assertEquals("HELLO", combined.format("  hello  "));
    }

    @Test
    @DisplayName("課題3c: TextFormatter — identity()")
    void testTextFormatterIdentity() {
        TextFormatter id = TextFormatter.identity();
        assertEquals("test", id.format("test"));
    }

    @Test
    @DisplayName("課題3d: TextFormatterHelper — 複数フォーマッタの適用")
    void testTextFormatterHelperMultiple() {
        TextFormatter trim = text -> text.trim();
        TextFormatter upper = text -> text.toUpperCase();
        TextFormatter exclaim = text -> text + "!";
        String result = TextFormatterHelper.applyFormatters(
            "  hello  ", trim, upper, exclaim
        );
        assertEquals("HELLO!", result);
    }

    @Test
    @DisplayName("課題3e: TextFormatterHelper — フォーマッタなし")
    void testTextFormatterHelperEmpty() {
        String result = TextFormatterHelper.applyFormatters("hello");
        assertEquals("hello", result);
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全14テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `MusicPlayer` は `Playable` と `Describable` を、`VideoRecorder` は `Playable`、`Recordable`、`Describable` の3つを `implements` する。各メソッドに `@Override` を付けて実装する。`Describable` のデフォルト実装をテストするため、匿名クラス `new Describable() {}` が使われている。
- **課題2のヒント:** `Polite.greet()` 内で `Greetable.super.greet()` と `Farewell.super.greet()` を使い、`" and "` で連結する。このパターンは2つのインタフェースのデフォルトメソッドが衝突した場合の標準的な解決方法である。
- **課題3のヒント:** `TextFormatter` は `@FunctionalInterface` を付け、抽象メソッドは `format(String)` の1つだけ。`andThen` のデフォルトメソッドは `return text -> after.format(this.format(text));` で実装する。`TextFormatterHelper.applyFormatters` では、最初のフォーマッタを起点に `for` ループで `andThen` を繰り返し適用する。
- **ラムダ式の注意:** `TextFormatter upper = text -> text.toUpperCase();` のように、ラムダ式の引数名は自由に決められる。アロー (`->`) の右側に式を書くと、その結果が自動的に返される。
