# Lab: JAVA-GOLD-01-05 — Stream実践 — collect / reduce / groupingBy

## 目標

- Collectors の各種メソッド（toList, toMap, groupingBy, partitioningBy, joining）を実践する
- reduce の3パターンを使い分ける
- 実践的なビジネスデータをStreamで集計する

所要時間: 30〜45分

## 前提条件

- Java 17 がインストールされていること
- Maven が使用可能であること
- Stream APIの基本（中間操作・終端操作）を学習済みであること
- ネットワーク接続は不要

## 課題

### 課題1: 基本的なCollectors

`StreamCollectors` クラスの以下のメソッドを実装せよ。

**toNameMap**: 社員リストから名前をキー、給与を値とするMapを生成する。同名の場合は高い給与を優先する。

```java
public static Map<String, Integer> toNameMap(List<Employee> employees)
```

**joinNames**: 社員名を指定された区切り文字で連結する。

```java
public static String joinNames(List<Employee> employees, String delimiter)
```

### 課題2: groupingByの活用

**countByDepartment**: 部署ごとの社員数をMapで返す。

```java
public static Map<String, Long> countByDepartment(List<Employee> employees)
```

**averageSalaryByDepartment**: 部署ごとの平均給与をMapで返す。

```java
public static Map<String, Double> averageSalaryByDepartment(List<Employee> employees)
```

**namesByDepartment**: 部署ごとの社員名リストをMapで返す。名前はアルファベット順にソートされていること。

```java
public static Map<String, List<String>> namesByDepartment(List<Employee> employees)
```

### 課題3: partitioningByとreduce

**partitionBySalary**: 指定された閾値以上/未満で社員を二分割する。

```java
public static Map<Boolean, List<Employee>> partitionBySalary(
    List<Employee> employees, int threshold)
```

**totalSalary**: 全社員の給与合計をreduceで計算する（初期値あり）。

```java
public static int totalSalary(List<Employee> employees)
```

**highestPaid**: 最も給与が高い社員をOptionalで返す（初期値なしreduce）。

```java
public static Optional<Employee> highestPaid(List<Employee> employees)
```

## ファイル構成

```
lab-java-gold-01-05/
├── pom.xml
└── src/
    ├── main/java/collectors/
    │   ├── Employee.java           ← 提供済み
    │   └── StreamCollectors.java   ← 実装対象
    └── test/java/collectors/
        └── StreamCollectorsTest.java ← 自動採点テスト（変更不可）
```

**pom.xml:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.jbridge.lab</groupId>
    <artifactId>java-gold-01-05</artifactId>
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

### Employee.java（提供済み）

```java
package collectors;

public record Employee(String name, String dept, int salary) {}
```

### StreamCollectors.java（実装テンプレート）

```java
package collectors;

import java.util.*;
import java.util.stream.Collectors;

public class StreamCollectors {

    // 課題1
    public static Map<String, Integer> toNameMap(List<Employee> employees) {
        // TODO: 名前をキー、給与を値とするMap。同名なら高い給与を優先
        throw new UnsupportedOperationException("未実装");
    }

    public static String joinNames(List<Employee> employees, String delimiter) {
        // TODO: 社員名を指定区切り文字で連結
        throw new UnsupportedOperationException("未実装");
    }

    // 課題2
    public static Map<String, Long> countByDepartment(List<Employee> employees) {
        // TODO: 部署ごとの社員数
        throw new UnsupportedOperationException("未実装");
    }

    public static Map<String, Double> averageSalaryByDepartment(List<Employee> employees) {
        // TODO: 部署ごとの平均給与
        throw new UnsupportedOperationException("未実装");
    }

    public static Map<String, List<String>> namesByDepartment(List<Employee> employees) {
        // TODO: 部署ごとの社員名リスト（アルファベット順）
        throw new UnsupportedOperationException("未実装");
    }

    // 課題3
    public static Map<Boolean, List<Employee>> partitionBySalary(
            List<Employee> employees, int threshold) {
        // TODO: 閾値以上/未満で二分割
        throw new UnsupportedOperationException("未実装");
    }

    public static int totalSalary(List<Employee> employees) {
        // TODO: reduce(初期値あり)で給与合計
        throw new UnsupportedOperationException("未実装");
    }

    public static Optional<Employee> highestPaid(List<Employee> employees) {
        // TODO: reduce(初期値なし)で最高給与の社員
        throw new UnsupportedOperationException("未実装");
    }
}
```

## 自動採点（JUnit 5）

```java
package collectors;

import org.junit.jupiter.api.Test;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;

class StreamCollectorsTest {

    static final List<Employee> EMPLOYEES = List.of(
        new Employee("Alice", "Dev", 600_000),
        new Employee("Bob", "Sales", 400_000),
        new Employee("Charlie", "Dev", 550_000),
        new Employee("David", "Sales", 450_000),
        new Employee("Eve", "Dev", 500_000)
    );

    // === 課題1 ===

    @Test
    void toNameMap_基本() {
        Map<String, Integer> map = StreamCollectors.toNameMap(EMPLOYEES);
        assertEquals(600_000, map.get("Alice"));
        assertEquals(400_000, map.get("Bob"));
        assertEquals(5, map.size());
    }

    @Test
    void toNameMap_同名で高い給与が優先() {
        List<Employee> dups = List.of(
            new Employee("Alice", "Dev", 500_000),
            new Employee("Alice", "Sales", 700_000)
        );
        Map<String, Integer> map = StreamCollectors.toNameMap(dups);
        assertEquals(700_000, map.get("Alice"));
    }

    @Test
    void joinNames() {
        String result = StreamCollectors.joinNames(EMPLOYEES, ", ");
        assertTrue(result.contains("Alice"));
        assertTrue(result.contains("Bob"));
        assertTrue(result.contains(", "));
    }

    @Test
    void joinNames_空リスト() {
        assertEquals("", StreamCollectors.joinNames(List.of(), ", "));
    }

    // === 課題2 ===

    @Test
    void countByDepartment() {
        Map<String, Long> counts = StreamCollectors.countByDepartment(EMPLOYEES);
        assertEquals(3L, counts.get("Dev"));
        assertEquals(2L, counts.get("Sales"));
    }

    @Test
    void averageSalaryByDepartment() {
        Map<String, Double> avgs = StreamCollectors.averageSalaryByDepartment(EMPLOYEES);
        assertEquals(550_000.0, avgs.get("Dev"), 0.1);
        assertEquals(425_000.0, avgs.get("Sales"), 0.1);
    }

    @Test
    void namesByDepartment_ソート済み() {
        Map<String, List<String>> names = StreamCollectors.namesByDepartment(EMPLOYEES);
        assertEquals(List.of("Alice", "Charlie", "Eve"), names.get("Dev"));
        assertEquals(List.of("Bob", "David"), names.get("Sales"));
    }

    // === 課題3 ===

    @Test
    void partitionBySalary() {
        Map<Boolean, List<Employee>> result =
            StreamCollectors.partitionBySalary(EMPLOYEES, 500_000);
        assertEquals(3, result.get(true).size());   // 600k, 550k, 500k
        assertEquals(2, result.get(false).size());   // 400k, 450k
    }

    @Test
    void totalSalary() {
        assertEquals(2_500_000, StreamCollectors.totalSalary(EMPLOYEES));
    }

    @Test
    void totalSalary_空リスト() {
        assertEquals(0, StreamCollectors.totalSalary(List.of()));
    }

    @Test
    void highestPaid() {
        Optional<Employee> result = StreamCollectors.highestPaid(EMPLOYEES);
        assertTrue(result.isPresent());
        assertEquals("Alice", result.get().name());
        assertEquals(600_000, result.get().salary());
    }

    @Test
    void highestPaid_空リスト() {
        assertTrue(StreamCollectors.highestPaid(List.of()).isEmpty());
    }
}
```

## ヒント

- **課題1-toNameMap**: `Collectors.toMap(Employee::name, Employee::salary, Integer::max)` でキー重複時に高い給与を優先する。
- **課題1-joinNames**: `.map(Employee::name).collect(Collectors.joining(delimiter))` で実装できる。
- **課題2-countByDepartment**: `Collectors.groupingBy(Employee::dept, Collectors.counting())` を使用する。
- **課題2-averageSalaryByDepartment**: downstream に `Collectors.averagingInt(Employee::salary)` を使用する。
- **課題2-namesByDepartment**: downstream に `Collectors.mapping(Employee::name, Collectors.toList())` を使用し、結果のリストを各部署ごとにソートする。または `Collectors.collectingAndThen` でソート処理を追加する。
- **課題3-partitionBySalary**: `Collectors.partitioningBy(e -> e.salary() >= threshold)` で二分割する。
- **課題3-totalSalary**: `.map(Employee::salary).reduce(0, Integer::sum)` で初期値ありのreduceを使用する。
- **課題3-highestPaid**: `.reduce((a, b) -> a.salary() >= b.salary() ? a : b)` で初期値なしのreduce（Optional返却）を使用する。
