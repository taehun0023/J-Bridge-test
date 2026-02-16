# Lab: JAVA-SILVER-04-02 — 例外変換(wrap)とcause保存

## 目標

- レイヤー間の例外変換パターンを実装する
- causeチェーンを正しく構築し、root causeを辿れることを確認する
- カスタム例外クラスを適切に設計・実装する
- ログ出力のベストプラクティスを実践する

## 前提条件

- Java 17 がインストールされていること
- Maven 3.8 以上がインストールされていること
- JUnit 5 によるテスト実行が可能な環境であること
- ネットワークアクセスは不要

## 課題

以下の4つのタスクに取り組む。例外変換時にcauseを確実に保存し、causeチェーンが正しく形成されることを確認する。

### タスク1: カスタム例外クラスの実装

`DataAccessException` と `ServiceException` の2つのカスタム例外クラスを実装せよ。

**DataAccessException:**
- `RuntimeException` を継承する
- `(String message)` と `(String message, Throwable cause)` の2つのコンストラクタを持つ

**ServiceException:**
- `RuntimeException` を継承する
- `errorCode` フィールド（String型）を持つ
- `(String errorCode, String message)` と `(String errorCode, String message, Throwable cause)` の2つのコンストラクタを持つ
- `getErrorCode()` メソッドを持つ

```java
// src/main/java/com/example/exception/DataAccessException.java
package com.example.exception;

public class DataAccessException extends RuntimeException {
    // TODO: 2つのコンストラクタを実装
}

// src/main/java/com/example/exception/ServiceException.java
package com.example.exception;

public class ServiceException extends RuntimeException {
    private final String errorCode;
    // TODO: 2つのコンストラクタ + getErrorCode()を実装
}
```

### タスク2: 例外変換の実装

`UserRepository` クラスの `findById` メソッドを実装せよ。内部で `IOException` が発生した場合、`DataAccessException` に変換して再throwする。

- メッセージは `"USER_QUERY_FAILED"` とすること
- causeを必ず保存すること

```java
public static String findById(Path dataFile, long id)
```

### タスク3: 二段階の例外変換

`UserService` クラスの `getUser` メソッドを実装せよ。内部で `findById` を呼び出し、`DataAccessException` が発生した場合は `ServiceException` に変換する。

- errorCodeは `"E001"` とすること
- メッセージは `"ユーザー取得失敗"` とすること
- causeを保存し、causeチェーンが `ServiceException → DataAccessException → IOException` の3段階になることを確認すること

```java
public static String getUser(Path dataFile, long id)
```

### タスク4: root cause取得ユーティリティ

`ExceptionUtils` クラスの `getRootCause` メソッドを実装せよ。causeチェーンを再帰的に辿り、最も深い原因（root cause）を返す。

- causeがnullの場合は渡された例外自体を返す
- nullが渡された場合はnullを返す

```java
public static Throwable getRootCause(Throwable throwable)
```

## ファイル構成

```
exception-wrap-lab/
├── pom.xml
└── src/
    ├── main/java/com/example/exception/
    │   ├── DataAccessException.java    ← 実装対象
    │   ├── ServiceException.java       ← 実装対象
    │   ├── UserRepository.java         ← 実装対象
    │   ├── UserService.java            ← 実装対象
    │   └── ExceptionUtils.java         ← 実装対象
    └── test/java/com/example/exception/
        └── ExceptionWrapTest.java      ← 自動採点テスト（変更不可）
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
    <artifactId>exception-wrap-lab</artifactId>
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
// DataAccessException.java
package com.example.exception;

public class DataAccessException extends RuntimeException {
    public DataAccessException(String message) {
        // TODO
        throw new UnsupportedOperationException("未実装");
    }

    public DataAccessException(String message, Throwable cause) {
        // TODO
        throw new UnsupportedOperationException("未実装");
    }
}

// ServiceException.java
package com.example.exception;

public class ServiceException extends RuntimeException {
    private final String errorCode;

    public ServiceException(String errorCode, String message) {
        // TODO
        throw new UnsupportedOperationException("未実装");
    }

    public ServiceException(String errorCode, String message, Throwable cause) {
        // TODO
        throw new UnsupportedOperationException("未実装");
    }

    public String getErrorCode() {
        // TODO
        throw new UnsupportedOperationException("未実装");
    }
}

// UserRepository.java
package com.example.exception;

import java.nio.file.Files;
import java.nio.file.Path;

public class UserRepository {
    public static String findById(Path dataFile, long id) {
        // TODO: Files.readString(dataFile)でファイル読み込み
        //       IOExceptionが発生した場合、DataAccessException("USER_QUERY_FAILED", e)に変換
        throw new UnsupportedOperationException("未実装");
    }
}

// UserService.java
package com.example.exception;

import java.nio.file.Path;

public class UserService {
    public static String getUser(Path dataFile, long id) {
        // TODO: UserRepository.findById()を呼び出し
        //       DataAccessExceptionが発生した場合、ServiceException("E001", "ユーザー取得失敗", e)に変換
        throw new UnsupportedOperationException("未実装");
    }
}

// ExceptionUtils.java
package com.example.exception;

public class ExceptionUtils {
    public static Throwable getRootCause(Throwable throwable) {
        // TODO: causeチェーンを辿ってroot causeを返す
        //       causeがnullなら渡された例外自体を返す
        //       nullが渡された場合はnullを返す
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

class ExceptionWrapTest {

    @TempDir
    Path tempDir;

    // === タスク1: カスタム例外クラス ===

    @Test
    void dataAccessException_メッセージのみ() {
        DataAccessException ex = new DataAccessException("TEST");
        assertEquals("TEST", ex.getMessage());
        assertNull(ex.getCause());
    }

    @Test
    void dataAccessException_メッセージとcause() {
        IOException cause = new IOException("original");
        DataAccessException ex = new DataAccessException("TEST", cause);
        assertEquals("TEST", ex.getMessage());
        assertSame(cause, ex.getCause());
    }

    @Test
    void serviceException_errorCodeとメッセージ() {
        ServiceException ex = new ServiceException("E001", "テスト");
        assertEquals("E001", ex.getErrorCode());
        assertEquals("テスト", ex.getMessage());
        assertNull(ex.getCause());
    }

    @Test
    void serviceException_errorCodeとメッセージとcause() {
        DataAccessException cause = new DataAccessException("DAE");
        ServiceException ex = new ServiceException("E002", "テスト", cause);
        assertEquals("E002", ex.getErrorCode());
        assertEquals("テスト", ex.getMessage());
        assertSame(cause, ex.getCause());
    }

    // === タスク2: 例外変換 ===

    @Test
    void findById_正常系_ファイル内容を返す() throws IOException {
        Path file = tempDir.resolve("users.txt");
        Files.writeString(file, "user_data");
        String result = UserRepository.findById(file, 1L);
        assertEquals("user_data", result);
    }

    @Test
    void findById_異常系_DataAccessExceptionに変換() {
        Path noFile = tempDir.resolve("missing.txt");
        DataAccessException ex = assertThrows(DataAccessException.class, () -> {
            UserRepository.findById(noFile, 1L);
        });
        assertEquals("USER_QUERY_FAILED", ex.getMessage());
        assertInstanceOf(IOException.class, ex.getCause());
    }

    // === タスク3: 二段階の例外変換 ===

    @Test
    void getUser_正常系_ファイル内容を返す() throws IOException {
        Path file = tempDir.resolve("users2.txt");
        Files.writeString(file, "user_info");
        String result = UserService.getUser(file, 1L);
        assertEquals("user_info", result);
    }

    @Test
    void getUser_異常系_ServiceExceptionに変換() {
        Path noFile = tempDir.resolve("missing2.txt");
        ServiceException ex = assertThrows(ServiceException.class, () -> {
            UserService.getUser(noFile, 1L);
        });
        assertEquals("E001", ex.getErrorCode());
        assertEquals("ユーザー取得失敗", ex.getMessage());
    }

    @Test
    void getUser_異常系_causeチェーンが3段階() {
        Path noFile = tempDir.resolve("missing3.txt");
        ServiceException ex = assertThrows(ServiceException.class, () -> {
            UserService.getUser(noFile, 1L);
        });
        // ServiceException → DataAccessException → IOException
        assertInstanceOf(DataAccessException.class, ex.getCause());
        assertInstanceOf(IOException.class, ex.getCause().getCause());
    }

    // === タスク4: root cause取得 ===

    @Test
    void getRootCause_3段階のcauseチェーン() {
        IOException root = new IOException("root");
        DataAccessException mid = new DataAccessException("mid", root);
        ServiceException top = new ServiceException("E001", "top", mid);

        Throwable result = ExceptionUtils.getRootCause(top);
        assertSame(root, result);
    }

    @Test
    void getRootCause_causeなしの場合は自身を返す() {
        RuntimeException ex = new RuntimeException("no cause");
        Throwable result = ExceptionUtils.getRootCause(ex);
        assertSame(ex, result);
    }

    @Test
    void getRootCause_nullの場合はnullを返す() {
        assertNull(ExceptionUtils.getRootCause(null));
    }
}
```

## ヒント

1. **タスク1**: `super(message)` や `super(message, cause)` で親クラスのコンストラクタに委譲する。`errorCode` フィールドはコンストラクタ内で `this.errorCode = errorCode` で設定する。

2. **タスク2**: `Files.readString(dataFile)` をtry-catchで囲み、catchブロックで `throw new DataAccessException("USER_QUERY_FAILED", e)` とする。

3. **タスク3**: `UserRepository.findById(dataFile, id)` をtry-catchで囲み、`DataAccessException` を捕捉して `throw new ServiceException("E001", "ユーザー取得失敗", e)` とする。

4. **タスク4**: whileループで `throwable.getCause() != null` の間causeを辿り続ける。最後に残った `throwable` がroot causeである。
