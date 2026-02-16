# Lab: JAVA-BRONZE-01-01 — プログラムの構造とコンパイル

## 目標

- パッケージ付きのJavaクラスを作成し、`javac` と `java` コマンドで正しくコンパイル・実行できるようになる。
- mainメソッドの正しいシグネチャを理解し、誤ったシグネチャがどのようなエラーを引き起こすか体験する。
- コマンドライン引数の受け取り方を実装できるようになる。

## 前提条件

- JDK 17 がインストールされていること（`javac -version` で確認）
- ターミナル（コマンドプロンプト / bash）の基本操作ができること
- テキストエディタが使用可能であること
- ネットワーク接続は不要

## 課題

### 課題1: HelloWorldプログラムの作成と実行

パッケージ `jp.co.training` に属する `HelloWorld` クラスを作成し、コンパイル・実行せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class HelloWorld` として定義する
3. mainメソッドのシグネチャは `public static void main(String[] args)` とする
4. 標準出力に `"Hello, Java Bronze!"` と出力する

**実行手順:**

```bash
# プロジェクトルートで以下を実行する
javac -d out src/main/java/jp/co/training/HelloWorld.java
java -cp out jp.co.training.HelloWorld
```

**期待される出力:**

```
Hello, Java Bronze!
```

### 課題2: コマンドライン引数を使ったグリーティング

パッケージ `jp.co.training` に属する `Greeting` クラスを作成し、コマンドライン引数で受け取った名前に対してメッセージを出力せよ。

**要件:**
1. パッケージ宣言 `package jp.co.training;` をファイルの先頭に記述する
2. `public class Greeting` として定義する
3. mainメソッドで以下のロジックを実装する:
   - 引数が1つ以上ある場合: `"こんにちは、<名前>さん！"` を出力する（`<名前>` は `args[0]`）
   - 引数がない場合: `"こんにちは、ゲストさん！"` を出力する

**実行手順:**

```bash
javac -d out src/main/java/jp/co/training/Greeting.java
java -cp out jp.co.training.Greeting 田中
java -cp out jp.co.training.Greeting
```

**期待される出力:**

```
こんにちは、田中さん！
こんにちは、ゲストさん！
```

### 課題3: mainシグネチャのエラー体験

意図的に誤ったmainメソッドを含むクラスを作成し、エラーの種類を確認せよ。

**要件:**
1. パッケージ `jp.co.training` に属する `BadMain` クラスを作成する
2. mainメソッドから `static` を除いた `public void main(String[] args)` で定義する
3. コンパイルが成功することを確認する
4. 実行時にエラーが発生することを確認する
5. エラーメッセージの内容を確認し、コンパイルエラーと実行時エラーの違いを理解する

**確認手順:**

```bash
javac -d out src/main/java/jp/co/training/BadMain.java   # コンパイル成功
java -cp out jp.co.training.BadMain             # 実行時エラー発生
```

## ファイル構成

```
lab-java-bronze-01-01/
├── pom.xml                              # Maven設定（自動採点用）
└── src/
    ├── main/
    │   └── java/
    │       └── jp/
    │           └── co/
    │               └── training/
    │                   ├── HelloWorld.java      # 課題1
    │                   ├── Greeting.java        # 課題2
    │                   └── BadMain.java         # 課題3
    └── test/
        └── java/
            └── jp/
                └── co/
                    └── training/
                        └── LabTest.java # JUnit 5 テスト
```

> **注意:** Maven標準レイアウトに従い、ソースファイルは `src/main/java/jp/co/training/` に配置する。`mvn test` で自動採点するために以下の `pom.xml` とテストクラスを使用する。

**pom.xml:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>jp.co.training</groupId>
    <artifactId>java-bronze-01-01-lab</artifactId>
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

以下のテストクラスで課題1・課題2の出力を自動検証する。

```java
package jp.co.training;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.*;

class LabTest {

    /**
     * 標準出力をキャプチャするヘルパーメソッド。
     * 指定されたRunnableを実行し、標準出力に書き込まれた文字列を返す。
     */
    private String captureStdout(Runnable task) {
        PrintStream original = System.out;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        System.setOut(new PrintStream(baos));
        try {
            task.run();
        } finally {
            System.setOut(original);
        }
        return baos.toString().trim();
    }

    @Test
    @DisplayName("課題1: HelloWorld — 正しい出力を返す")
    void testHelloWorld() {
        String output = captureStdout(() ->
            HelloWorld.main(new String[]{})
        );
        assertEquals("Hello, Java Bronze!", output,
            "HelloWorld.main() は 'Hello, Java Bronze!' を出力すること");
    }

    @Test
    @DisplayName("課題2a: Greeting — 引数ありの場合、名前付きメッセージを出力する")
    void testGreetingWithName() {
        String output = captureStdout(() ->
            Greeting.main(new String[]{"田中"})
        );
        assertEquals("こんにちは、田中さん！", output,
            "引数 '田中' を渡した場合、'こんにちは、田中さん！' を出力すること");
    }

    @Test
    @DisplayName("課題2b: Greeting — 引数なしの場合、ゲストメッセージを出力する")
    void testGreetingWithoutName() {
        String output = captureStdout(() ->
            Greeting.main(new String[]{})
        );
        assertEquals("こんにちは、ゲストさん！", output,
            "引数なしの場合、'こんにちは、ゲストさん！' を出力すること");
    }

    @Test
    @DisplayName("課題3: BadMain — staticなしのmainメソッドが存在する")
    void testBadMainHasNonStaticMain() throws Exception {
        // BadMainクラスが存在することを確認
        Class<?> clazz = Class.forName("jp.co.training.BadMain");
        assertNotNull(clazz, "BadMain クラスが存在すること");

        // staticでないmainメソッドが存在することを確認
        var method = clazz.getDeclaredMethod("main", String[].class);
        assertNotNull(method, "main(String[]) メソッドが存在すること");
        assertFalse(
            java.lang.reflect.Modifier.isStatic(method.getModifiers()),
            "BadMain.main() は static でないこと（意図的な誤り）"
        );
    }
}
```

**テスト実行方法:**

```bash
mvn test
```

**合格基準:** 全4テストが `PASSED` であること。

## ヒント

- **課題1のヒント:** `System.out.println()` の引数に出力したい文字列をダブルクォートで囲んで渡す。セミコロンを忘れないこと。
- **課題2のヒント:** `args.length` で引数の個数を確認できる。`if (args.length > 0)` で分岐し、引数がある場合は `args[0]` を使用する。文字列連結には `+` 演算子を使う。
- **課題3のヒント:** コンパイルは成功するはずである。`java` コマンドで実行したときに表示されるエラーメッセージをよく読み、なぜ実行できないのかを考えること。
- **パッケージの注意:** `package jp.co.training;` を宣言したソースファイルは、必ず `src/main/java/jp/co/training/` ディレクトリに配置すること。ディレクトリ構造とパッケージ宣言が一致しないとコンパイルエラーになる。
- **クラスパスの注意:** `javac -d out` でコンパイルした後、`java -cp out jp.co.training.HelloWorld` のように完全修飾クラス名をドット区切りで指定する。スラッシュ (`/`) ではなくドット (`.`) を使うこと。
