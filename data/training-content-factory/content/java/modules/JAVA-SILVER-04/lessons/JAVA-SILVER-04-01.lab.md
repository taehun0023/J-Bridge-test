# Lab: JAVA-SILVER-04-01 — Checked vs Unchecked / throws vs try-catch

## 目標

- checked例外とunchecked例外の違いを実装を通じて理解する
- throws宣言とtry-catchの使い分けを実践する
- 例外変換時のcause保存を正しく実装する
- try-with-resourcesとmulti-catchを適切に使用する

## 前提条件

- Java 17 がインストールされていること
- Maven 3.8 以上がインストールされていること
- JUnit 5 によるテスト実行が可能な環境であること
- ネットワークアクセスは不要

## 課題

以下の4つのタスクを`ExceptionPractice`クラスに実装せよ。各メソッドのシグネチャと仕様は下記の通り。

### タスク1: checked例外のthrows宣言

`readFileContent`メソッドを実装せよ。指定されたパスのファイル内容を文字列として返す。

- checked例外（IOException）をthrows宣言で呼び出し元に委譲すること
- `java.nio.file.Files.readString(Path)` を使用すること

```java
public static String readFileContent(Path path) throws IOException
```

### タスク2: 例外変換とcause保存

`safeReadFile`メソッドを実装せよ。内部で`readFileContent`を呼び出し、IOExceptionが発生した場合は`IllegalStateException`に変換して再throwする。

- 変換時に元のIOExceptionをcauseとして必ず保存すること
- IllegalStateExceptionのメッセージは `"FILE_READ_FAILED"` とすること

```java
public static String safeReadFile(Path path)
```

### タスク3: try-with-resourcesによるリソース管理

`readFirstLine`メソッドを実装せよ。指定されたパスのファイルの最初の1行を返す。

- `Files.newBufferedReader(Path)` でBufferedReaderを取得し、try-with-resourcesで管理すること
- IOExceptionが発生した場合はcauseを保存して`IllegalStateException`（メッセージ: `"READLINE_FAILED"`）に変換すること

```java
public static String readFirstLine(Path path)
```

### タスク4: multi-catchの活用

`parseAndDivide`メソッドを実装せよ。2つの文字列を受け取り、整数に変換して除算結果を返す。

- `Integer.parseInt`でNumberFormatExceptionが発生する可能性がある
- 0除算でArithmeticExceptionが発生する可能性がある
- 上記2つの例外をmulti-catchで捕捉し、`IllegalArgumentException`に変換して再throwすること
- メッセージは `"PARSE_OR_DIVIDE_FAILED"` とし、causeを保存すること

```java
public static int parseAndDivide(String a, String b)
```

## ファイル構成

```
exception-lab/
├── pom.xml
└── src/
    ├── main/java/com/example/exception/
    │   └── ExceptionPractice.java    ← 実装対象
    └── test/java/com/example/exception/
        └── ExceptionPracticeTest.java ← 自動採点テスト（変更不可）
```

### pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.example</groupId>
    <artifactId>exception-lab</artifactId>
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

### ExceptionPractice.java（実装テンプレート）

```java
package com.example.exception;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class ExceptionPractice {

    // タスク1: checked例外のthrows宣言
    public static String readFileContent(Path path) throws IOException {
        // TODO: Files.readString(path) を使用してファイル内容を返す
        throw new UnsupportedOperationException("未実装");
    }

    // タスク2: 例外変換とcause保存
    public static String safeReadFile(Path path) {
        // TODO: readFileContent を呼び出し、IOExceptionをIllegalStateExceptionに変換
        //       メッセージ: "FILE_READ_FAILED", causeを保存すること
        throw new UnsupportedOperationException("未実装");
    }

    // タスク3: try-with-resourcesによるリソース管理
    public static String readFirstLine(Path path) {
        // TODO: Files.newBufferedReader で取得したreaderをtry-with-resourcesで管理
        //       IOExceptionをIllegalStateException("READLINE_FAILED", e)に変換
        throw new UnsupportedOperationException("未実装");
    }

    // タスク4: multi-catchの活用
    public static int parseAndDivide(String a, String b) {
        // TODO: Integer.parseIntで変換して除算
        //       NumberFormatException | ArithmeticException をmulti-catchで捕捉
        //       IllegalArgumentException("PARSE_OR_DIVIDE_FAILED", e)に変換
        throw new UnsupportedOperationException("未実装");
    }
}
```

## 自動採点（JUnit 5）

```java
package com.example.exception;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.*;

class ExceptionPracticeTest {

    @TempDir
    Path tempDir;

    // === タスク1: readFileContent ===

    @Test
    void readFileContent_正常系_ファイル内容を返す() throws IOException {
        Path file = tempDir.resolve("test.txt");
        Files.writeString(file, "Hello, Java!");

        String result = ExceptionPractice.readFileContent(file);
        assertEquals("Hello, Java!", result);
    }

    @Test
    void readFileContent_異常系_存在しないファイルでIOExceptionをthrow() {
        Path noFile = tempDir.resolve("nonexistent.txt");

        assertThrows(IOException.class, () -> {
            ExceptionPractice.readFileContent(noFile);
        });
    }

    // === タスク2: safeReadFile ===

    @Test
    void safeReadFile_正常系_ファイル内容を返す() throws IOException {
        Path file = tempDir.resolve("safe.txt");
        Files.writeString(file, "Safe content");

        String result = ExceptionPractice.safeReadFile(file);
        assertEquals("Safe content", result);
    }

    @Test
    void safeReadFile_異常系_IllegalStateExceptionに変換される() {
        Path noFile = tempDir.resolve("missing.txt");

        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            ExceptionPractice.safeReadFile(noFile);
        });
        assertEquals("FILE_READ_FAILED", ex.getMessage());
    }

    @Test
    void safeReadFile_異常系_causeにIOExceptionが保存されている() {
        Path noFile = tempDir.resolve("missing2.txt");

        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            ExceptionPractice.safeReadFile(noFile);
        });
        assertNotNull(ex.getCause(), "causeが保存されていない");
        assertInstanceOf(IOException.class, ex.getCause());
    }

    // === タスク3: readFirstLine ===

    @Test
    void readFirstLine_正常系_最初の行を返す() throws IOException {
        Path file = tempDir.resolve("lines.txt");
        Files.writeString(file, "first\nsecond\nthird");

        String result = ExceptionPractice.readFirstLine(file);
        assertEquals("first", result);
    }

    @Test
    void readFirstLine_異常系_IllegalStateExceptionに変換される() {
        Path noFile = tempDir.resolve("nolines.txt");

        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            ExceptionPractice.readFirstLine(noFile);
        });
        assertEquals("READLINE_FAILED", ex.getMessage());
    }

    @Test
    void readFirstLine_異常系_causeにIOExceptionが保存されている() {
        Path noFile = tempDir.resolve("nolines2.txt");

        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            ExceptionPractice.readFirstLine(noFile);
        });
        assertNotNull(ex.getCause(), "causeが保存されていない");
        assertInstanceOf(IOException.class, ex.getCause());
    }

    // === タスク4: parseAndDivide ===

    @Test
    void parseAndDivide_正常系_除算結果を返す() {
        assertEquals(5, ExceptionPractice.parseAndDivide("10", "2"));
        assertEquals(3, ExceptionPractice.parseAndDivide("9", "3"));
    }

    @Test
    void parseAndDivide_異常系_数値変換失敗でIllegalArgumentException() {
        IllegalArgumentException ex = assertThrows(IllegalArgumentException.class, () -> {
            ExceptionPractice.parseAndDivide("abc", "2");
        });
        assertEquals("PARSE_OR_DIVIDE_FAILED", ex.getMessage());
        assertInstanceOf(NumberFormatException.class, ex.getCause());
    }

    @Test
    void parseAndDivide_異常系_0除算でIllegalArgumentException() {
        IllegalArgumentException ex = assertThrows(IllegalArgumentException.class, () -> {
            ExceptionPractice.parseAndDivide("10", "0");
        });
        assertEquals("PARSE_OR_DIVIDE_FAILED", ex.getMessage());
        assertInstanceOf(ArithmeticException.class, ex.getCause());
    }

    @Test
    void parseAndDivide_異常系_causeが保存されている() {
        IllegalArgumentException ex = assertThrows(IllegalArgumentException.class, () -> {
            ExceptionPractice.parseAndDivide("xyz", "1");
        });
        assertNotNull(ex.getCause(), "causeが保存されていない");
    }
}
```

## ヒント

1. **タスク1**: `Files.readString(Path)` は `IOException` をthrowする。メソッドシグネチャの `throws IOException` がその宣言を担う。メソッド本体では単純に `Files.readString(path)` を呼び出して返すだけでよい。

2. **タスク2**: try-catchで `readFileContent` を呼び出し、catchブロックで `throw new IllegalStateException("FILE_READ_FAILED", e)` とする。第2引数の `e` がcauseの保存にあたる。

3. **タスク3**: `try (var reader = Files.newBufferedReader(path))` の形でtry-with-resourcesを使用する。`reader.readLine()` で最初の行を取得できる。catchブロックの構造はタスク2と同様。

4. **タスク4**: `catch (NumberFormatException | ArithmeticException e)` の形でmulti-catchを使用する。catchブロック内で `throw new IllegalArgumentException("PARSE_OR_DIVIDE_FAILED", e)` とする。
