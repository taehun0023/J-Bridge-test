# Lab: JAVA-SILVER-04-03 — try-with-resourcesとAutoCloseable

## 目標

- try-with-resources構文を使ったリソース管理を実践する
- カスタムAutoCloseableクラスを実装する
- 複数リソースの宣言順序とclose順序を理解する
- 抑制例外（suppressed exceptions）の取得方法を体験する

## 前提条件

- Java 17 がインストールされていること
- Maven 3.8 以上がインストールされていること
- JUnit 5 によるテスト実行が可能な環境であること
- ネットワークアクセスは不要

## 課題

以下の4つのタスクに取り組む。try-with-resourcesとAutoCloseableの仕組みを実装を通じて理解する。

### タスク1: カスタムAutoCloseableの実装

`ManagedConnection` クラスを実装せよ。DB接続を模擬するAutoCloseableクラスである。

- `AutoCloseable` を実装する
- コンストラクタで `opened` フラグを `true` に設定する
- `query(String sql)` メソッドは、closeされている場合に `IllegalStateException("ALREADY_CLOSED")` を投げ、開いている場合は `"Result: " + sql` を返す
- `close()` メソッドは冪等に実装する（2回目以降は何もしない）
- `isOpen()` メソッドで現在の状態を返す

```java
public class ManagedConnection implements AutoCloseable
```

### タスク2: try-with-resourcesでのファイル操作

`FileProcessor` クラスの `countLines` メソッドを実装せよ。指定されたパスのファイルの行数を返す。

- `Files.newBufferedReader(path)` をtry-with-resourcesで管理すること
- IOExceptionが発生した場合は `IllegalStateException("COUNT_FAILED", e)` に変換すること

```java
public static int countLines(Path path)
```

### タスク3: 複数リソースの管理

`FileCopier` クラスの `copyFile` メソッドを実装せよ。入力ファイルの内容を出力ファイルにコピーする。

- `Files.newBufferedReader(source)` と `Files.newBufferedWriter(target)` を1つのtry-with-resources文で管理すること
- IOExceptionが発生した場合は `IllegalStateException("COPY_FAILED", e)` に変換すること

```java
public static void copyFile(Path source, Path target)
```

### タスク4: 抑制例外の取得

`SuppressedExceptionCollector` クラスの `collectSuppressed` メソッドを実装せよ。引数で受け取った例外の抑制例外のメッセージをリストで返す。

- `getSuppressed()` で抑制例外の配列を取得する
- 各抑制例外の `getMessage()` をリストに追加して返す
- 抑制例外がない場合は空リストを返す

```java
public static List<String> collectSuppressed(Throwable throwable)
```

## ファイル構成

```
twr-lab/
├── pom.xml
└── src/
    ├── main/java/com/example/twr/
    │   ├── ManagedConnection.java            ← 実装対象
    │   ├── FileProcessor.java                ← 実装対象
    │   ├── FileCopier.java                   ← 実装対象
    │   └── SuppressedExceptionCollector.java  ← 実装対象
    └── test/java/com/example/twr/
        └── TryWithResourcesTest.java         ← 自動採点テスト（変更不可）
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
    <artifactId>twr-lab</artifactId>
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

### 実装テンプレート

```java
// ManagedConnection.java
package com.example.twr;

public class ManagedConnection implements AutoCloseable {
    private boolean opened;

    public ManagedConnection() {
        // TODO: openedをtrueに設定
        throw new UnsupportedOperationException("未実装");
    }

    public String query(String sql) {
        // TODO: closeされている場合はIllegalStateException("ALREADY_CLOSED")
        //       開いている場合は "Result: " + sql を返す
        throw new UnsupportedOperationException("未実装");
    }

    public boolean isOpen() {
        // TODO: openedの状態を返す
        throw new UnsupportedOperationException("未実装");
    }

    @Override
    public void close() {
        // TODO: 冪等に実装（2回目以降は何もしない）
        throw new UnsupportedOperationException("未実装");
    }
}

// FileProcessor.java
package com.example.twr;

import java.nio.file.Files;
import java.nio.file.Path;

public class FileProcessor {
    public static int countLines(Path path) {
        // TODO: try-with-resourcesでBufferedReaderを管理し、行数を返す
        //       IOExceptionはIllegalStateException("COUNT_FAILED", e)に変換
        throw new UnsupportedOperationException("未実装");
    }
}

// FileCopier.java
package com.example.twr;

import java.nio.file.Files;
import java.nio.file.Path;

public class FileCopier {
    public static void copyFile(Path source, Path target) {
        // TODO: try-with-resourcesでreaderとwriterを管理し、内容をコピー
        //       IOExceptionはIllegalStateException("COPY_FAILED", e)に変換
        throw new UnsupportedOperationException("未実装");
    }
}

// SuppressedExceptionCollector.java
package com.example.twr;

import java.util.List;

public class SuppressedExceptionCollector {
    public static List<String> collectSuppressed(Throwable throwable) {
        // TODO: getSuppressed()で抑制例外を取得し、各getMessage()をリストで返す
        throw new UnsupportedOperationException("未実装");
    }
}
```

## 自動採点（JUnit 5）

```java
package com.example.twr;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class TryWithResourcesTest {

    @TempDir
    Path tempDir;

    // === タスク1: ManagedConnection ===

    @Test
    void connection_オープン後にクエリ実行可能() {
        try (ManagedConnection conn = new ManagedConnection()) {
            assertTrue(conn.isOpen());
            assertEquals("Result: SELECT 1", conn.query("SELECT 1"));
        }
    }

    @Test
    void connection_close後はクエリでIllegalStateException() {
        ManagedConnection conn = new ManagedConnection();
        conn.close();
        assertFalse(conn.isOpen());
        assertThrows(IllegalStateException.class, () -> conn.query("SELECT 1"));
    }

    @Test
    void connection_tryWithResources後は自動close() {
        ManagedConnection conn;
        try (ManagedConnection c = new ManagedConnection()) {
            conn = c;
            assertTrue(conn.isOpen());
        }
        assertFalse(conn.isOpen());
    }

    @Test
    void connection_close冪等性_2回呼んでも例外なし() {
        ManagedConnection conn = new ManagedConnection();
        conn.close();
        assertDoesNotThrow(conn::close);  // 2回目も安全
    }

    // === タスク2: FileProcessor ===

    @Test
    void countLines_正常系_行数を返す() throws IOException {
        Path file = tempDir.resolve("lines.txt");
        Files.writeString(file, "line1\nline2\nline3");
        assertEquals(3, FileProcessor.countLines(file));
    }

    @Test
    void countLines_空ファイル_0を返す() throws IOException {
        Path file = tempDir.resolve("empty.txt");
        Files.writeString(file, "");
        assertEquals(0, FileProcessor.countLines(file));
    }

    @Test
    void countLines_異常系_IllegalStateExceptionに変換() {
        Path noFile = tempDir.resolve("missing.txt");
        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            FileProcessor.countLines(noFile);
        });
        assertEquals("COUNT_FAILED", ex.getMessage());
        assertInstanceOf(IOException.class, ex.getCause());
    }

    // === タスク3: FileCopier ===

    @Test
    void copyFile_正常系_内容がコピーされる() throws IOException {
        Path source = tempDir.resolve("source.txt");
        Path target = tempDir.resolve("target.txt");
        Files.writeString(source, "Hello\nWorld");

        FileCopier.copyFile(source, target);

        assertEquals("Hello\nWorld", Files.readString(target));
    }

    @Test
    void copyFile_異常系_存在しないソースでIllegalStateException() {
        Path source = tempDir.resolve("no_source.txt");
        Path target = tempDir.resolve("target2.txt");

        IllegalStateException ex = assertThrows(IllegalStateException.class, () -> {
            FileCopier.copyFile(source, target);
        });
        assertEquals("COPY_FAILED", ex.getMessage());
        assertInstanceOf(IOException.class, ex.getCause());
    }

    // === タスク4: SuppressedExceptionCollector ===

    @Test
    void collectSuppressed_抑制例外あり() {
        RuntimeException main = new RuntimeException("main");
        main.addSuppressed(new Exception("sup1"));
        main.addSuppressed(new Exception("sup2"));

        List<String> result = SuppressedExceptionCollector.collectSuppressed(main);
        assertEquals(List.of("sup1", "sup2"), result);
    }

    @Test
    void collectSuppressed_抑制例外なし() {
        RuntimeException main = new RuntimeException("main");
        List<String> result = SuppressedExceptionCollector.collectSuppressed(main);
        assertTrue(result.isEmpty());
    }
}
```

## ヒント

1. **タスク1**: `opened` フラグを `boolean` フィールドとして管理する。`close()` では `if (opened)` をチェックしてから `opened = false` を設定する。これにより冪等性が保証される。

2. **タスク2**: `try (var reader = Files.newBufferedReader(path))` でリーダーを取得し、whileループで `readLine()` が `null` でない間カウントする。catchブロックで `IOException` を捕捉して `throw new IllegalStateException("COUNT_FAILED", e)` とする。

3. **タスク3**: `try (var reader = Files.newBufferedReader(source); var writer = Files.newBufferedWriter(target))` で2つのリソースを同時に管理する。readLineで読み、writerで書き込む。改行処理に注意。

4. **タスク4**: `throwable.getSuppressed()` で `Throwable[]` を取得し、各要素の `getMessage()` を `ArrayList` に追加する。Java 8以降であれば `Arrays.stream(throwable.getSuppressed()).map(Throwable::getMessage).toList()` でも実装可能。
