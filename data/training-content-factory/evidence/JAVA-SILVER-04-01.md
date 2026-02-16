# Evidence: JAVA-SILVER-04-01

[E1] checked例外はコンパイラが処理（try-catch）または宣言（throws）を強制する。IOException, SQLExceptionなどがこれに該当する。
[E2] unchecked例外は主にRuntimeExceptionのサブクラスであり、処理/宣言が強制されない。NullPointerException, IllegalArgumentExceptionなどが該当する。
[E3] Error系列（OutOfMemoryError, StackOverflowError等）はアプリケーションが通常回復・処理の対象としない。
[E4] throwsは例外処理の責任を呼び出し元に委譲する設計選択である。メソッドシグネチャに宣言する。
[E5] try-catchは現在のレイヤーで回復・代替・ログ出力・変換など意味のある処理を行う場合に使う。
[E6] catchブロックで例外を「握りつぶす」行為（空のcatch、無視）は原因究明を困難にするアンチパターンである。
[E7] 例外を変換（wrap）する際はcauseを必ず保存しなければスタックトレースが失われる。`new XxxException(msg, e)` の形で元の例外をcauseとして渡す。
[E8] finallyは資源解放に使えるが、try-with-resourcesの方がより安全かつ簡潔である。
[E9] try-with-resourcesはAutoCloseableを実装したリソースをスコープ終了時に自動的にcloseする。Java 7以降で使用可能。
[E10] 複数の例外を一度にキャッチするmulti-catch（`catch (IOException | SQLException e)`）が可能だが、共通処理ロジックが同一の場合にのみ使用する。

## Code snippets
```java
// checked例外 — throwsを宣言しないとコンパイルエラー
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class CheckedExample {
    // throws宣言が必要
    static String readFile(Path path) throws IOException {
        return Files.readString(path);
    }
}
```

```java
// unchecked例外 — コンパイル時にはチェックされない
public class UncheckedExample {
    static int divide(int a, int b) {
        return a / b;  // b==0 なら ArithmeticException（実行時）
    }
}
```

```java
// 例外変換 — causeを保存
try {
    readFile(Path.of("data.txt"));
} catch (IOException e) {
    throw new IllegalStateException("READ_FAILED", e);  // causeを保存
}
```

```java
// try-with-resources
try (var reader = Files.newBufferedReader(Path.of("data.txt"))) {
    System.out.println(reader.readLine());
}  // readerは自動的にcloseされる
```

## Sources
- sources/java/oracle/exams/JAVA_EXAM_1Z0-816_JPN.md (Section: 例外処理とアサーション)
- sources/java/oracle/docs/JAVA_JLS17.md (Chapter 11: Exceptions)
- sources/java/oracle/tutorials/JAVA_TUTORIAL_EXCEPTIONS.md
