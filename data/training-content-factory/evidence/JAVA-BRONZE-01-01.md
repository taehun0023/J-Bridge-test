# Evidence: JAVA-BRONZE-01-01

[E1] Javaプログラムのエントリーポイントは `public static void main(String[] args)` メソッドである。JVMはこのシグネチャを持つメソッドを探して実行を開始する。
[E2] `javac` コマンドはソースファイル (.java) をバイトコード (.class) にコンパイルする。`java` コマンドはJVM上で .class ファイルを実行する。
[E3] JDK（Java Development Kit）はコンパイラ（javac）やツール類を含む開発キットである。JRE（Java Runtime Environment）はJVMとクラスライブラリを含む実行環境である。JVMはバイトコードを解釈・実行する仮想マシンである。
[E4] パッケージ宣言（`package com.example;`）はソースファイルの先頭に記述し、クラスの名前空間を定義する。パッケージ宣言は省略可能だが、実務では必ず宣言する。
[E5] `import` 文はパッケージ宣言の後、クラス定義の前に記述する。他パッケージのクラスを完全修飾名なしで使用可能にする。
[E6] 1つのソースファイルに `public` クラスは最大1つであり、ファイル名は `public` クラス名と一致しなければならない。
[E7] コンパイルエラーは `javac` 実行時に発生し、文法エラーや型の不一致などが原因となる。実行時エラー（RuntimeException等）は `java` 実行時に発生する。
[E8] mainメソッドのシグネチャが正しくない場合（例：`static` がない、引数が `String[]` でない）、JVMは起動時にエラーを報告する。
[E9] `String[] args` はコマンドライン引数を受け取るパラメータである。`java MyApp hello world` と実行すると `args[0]` は `"hello"`、`args[1]` は `"world"` になる。
[E10] Java 11以降、単一ソースファイルであれば `java MyApp.java` と直接実行できる（ソースファイルモード）。ただし複数ファイルの場合は `javac` によるコンパイルが必要。
[E11] クラスパスは、JVMがクラスファイルを検索するパスを指定する。`-cp` または `-classpath` オプションで明示的に設定できる。
[E12] `public static void main(String... args)` は可変長引数構文であり、`String[] args` と等価である。JVMのエントリーポイントとして有効である。

## Code snippets
```java
// HelloWorld.java
package com.example;

public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```

```bash
# コンパイルと実行
javac -d out com/example/HelloWorld.java
java -cp out com.example.HelloWorld
```

```java
// mainシグネチャ誤り例（staticがない）
public class Bad {
    public void main(String[] args) {  // コンパイルは通るが実行時エラー
        System.out.println("This won't run");
    }
}
```

## Sources
- sources/java/oracle/exams/JAVA_EXAM_1Z0-818_JPN.md (Section 1: Javaプログラムの作成と実行)
- sources/java/oracle/docs/JAVA_JDK17_HOME.md
- sources/java/oracle/docs/JAVA_JLS17.md (Chapter 7: Packages and Modules, Chapter 12: Execution)
