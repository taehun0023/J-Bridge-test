# Evidence: JAVA-GOLD-01-01

[E1] ジェネリクス導入前はコレクションにObject型で格納し、取り出し時にキャストが必要だった。型を間違えるとClassCastExceptionが実行時に発生する。
[E2] 型パラメータ `<T>` はクラスやメソッドに宣言し、コンパイル時に型安全を保証する。`class Box<T> { T value; }` のように使用する。
[E3] 型消去（Type Erasure）により、ジェネリクスの型情報はコンパイル後に消去される。実行時には `Box<String>` と `Box<Integer>` は同じ `Box` クラスとして扱われる。
[E4] raw type（`Box box = new Box();` のように型パラメータを省略）を使うとコンパイル時に警告が発生し、型安全が失われる。
[E5] ジェネリクスメソッドはメソッドの戻り値型の前に型パラメータを宣言する。`static <T> T firstOrNull(List<T> list)` のように定義する。
[E6] ダイヤモンド演算子 `<>` はJava 7以降で使用可能。右辺の型パラメータをコンパイラが推論する。`Box<String> box = new Box<>();`
[E7] 型パラメータには参照型のみ指定可能で、プリミティブ型（int, double等）は直接指定できない。`Box<int>` はコンパイルエラーとなる。ラッパー型（Integer, Double等）を使用する。
[E8] 型パラメータの慣例として、`T`（Type）、`E`（Element）、`K`（Key）、`V`（Value）、`N`（Number）が使用される。
[E9] `instanceof` チェックにジェネリクス型は使用できない。型消去により実行時に型パラメータの情報が存在しないため、`obj instanceof Box<String>` はコンパイルエラーとなる。
[E10] ジェネリクス配列の直接生成（`new T[]`、`new Box<String>[]`）はできない。型安全を保証できないためコンパイラが禁止する。
[E11] 複数の型パラメータを持つクラスやインターフェースを定義できる。`interface Pair<K, V> { K getKey(); V getValue(); }` のように使用する。
[E12] 再帰的型境界（Recursive Type Bound）は型パラメータ自身を境界に含めるパターンである。`<T extends Comparable<T>>` は自分自身と比較可能な型を表す。

## Code snippets
```java
// ジェネリクス未使用 — Object キャスト問題
List list = new ArrayList();
list.add("hello");
Integer num = (Integer) list.get(0);  // ClassCastException!
```

```java
// ジェネリクス使用 — コンパイル時型安全
List<String> list = new ArrayList<>();
list.add("hello");
// list.add(123);  // コンパイルエラー — 型安全
String s = list.get(0);  // キャスト不要
```

```java
// ジェネリクスクラスの定義
public class Box<T> {
    private T value;

    public Box(T value) { this.value = value; }
    public T getValue() { return value; }
}
```

```java
// ジェネリクスメソッド
public static <T> T firstOrNull(List<T> list) {
    return list.isEmpty() ? null : list.get(0);
}
```

## Sources
- sources/java/oracle/tutorials/JAVA_TUTORIAL_GENERICS.md
- sources/java/oracle/docs/JAVA_API_17.md (java.util package)
- sources/java/oracle/docs/JAVA_JLS17.md (Chapter 4: Types, Values, and Variables)
