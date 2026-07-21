# Java 초급 — 문제 · 해답 · 참고노트

모듈 **DEV-JAVA-01** · 전 17파트 · 한국어(ko) 기준 · 총 148문제

> 기준: **Java 17** · 웹=직접 입력 / 모바일=토큰 선택. 화면에서 정답 위치·토큰 순서는 무작위로 섞임. **순서 배열은 완성 코드(공백·들여쓰기 정규화) 기준으로 채점하여 동일한 코드 줄(예: 여러 `}`) 카드는 서로 교환 가능**하고, 객관식은 고유 ID, 코드 토큰은 뱅크 값으로 채점.

> 각 문제의 정답·해설과 파트별 참고노트를 담은 학습/채점용 자료. 실제 학습 콘텐츠(stage.json·mdx)에서 자동 추출. (오답 해설·용어 검수 반영본)

## 목차
1. **Java초급01 시작·출력·주석**
2. **Java초급02 변수·기본형·리터럴·상수**
3. **Java초급03 연산자·형변환**
4. **Java초급04 표준입력 Scanner**
5. **Java초급05 조건분기① if·else**
6. **Java초급06 조건분기② else if·switch·삼항연산자**
7. **Java초급07 반복문① for**
8. **Java초급08 반복문② while·do-while**
9. **Java초급09 반복문③ break·continue·중첩**
10. **Java초급10 배열① 선언·생성·요소 접근**
11. **Java초급11 배열② 순회·합계·검색**
12. **Java초급12 배열③ 2차원 배열**
13. **Java초급13 문자열① 생성·연결·비교**
14. **Java초급14 문자열② 메서드·분할·포맷**
15. **Java초급15 메서드① 정의·호출·매개변수**
16. **Java초급16 메서드② 반환값·조기 종료·배열**
17. **Java초급17 메서드③ 오버로딩·스코프**

---

# Part 1. Java초급01 시작·출력·주석

`DEV-JAVA-01-01` · 문제 13개 (코드 빈칸 4 · 객관식 8 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- Java 프로그램의 기본 형태를 작성할 수 있다.
- main 메서드가 프로그램의 시작점임을 알 수 있다.
- 화면에 문자를 출력할 수 있다.
- print와 println의 차이를 구분할 수 있다.
- 한 줄 주석과 여러 줄 주석을 작성할 수 있다.
- 대소문자, 큰따옴표, 세미콜론과 관련된 오류를 찾을 수 있다.

## 수업 내용

### Part 1. Java 프로그램의 기본 구조

**개념 설명**

- Java 코드는 클래스 내부에 작성한다.
- 지금은 클래스를 프로그램을 담는 바깥 영역이라고 이해하면 된다.
- Java 프로그램을 실행하면 main 메서드 내부의 코드가 위에서 아래로 실행된다.
- 파일 이름이 `Main.java`라면 클래스 이름도 `Main`으로 작성한다.
- 중괄호 `{ }`는 클래스와 메서드의 범위를 나타낸다.
- 실행문 끝에는 세미콜론 `;`을 붙인다.

**코드 문법 분해**

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Java 시작");
    }
}
```

| 코드 | 의미 |
|---|---|
| `public class Main` | Main이라는 프로그램 영역을 만든다. |
| `public static void main(String[] args)` | 프로그램이 시작되는 위치다. |
| `{ }` | 코드가 포함되는 범위를 나타낸다. |
| `System.out.println(...)` | 괄호 안의 내용을 화면에 출력한다. |
| `;` | 하나의 실행문이 끝났음을 나타낸다. |

`public`, `static`, `String[]`의 자세한 의미는 이후 파트에서 학습한다.
이번 파트에서는 main 선언 전체를 Java 프로그램의 시작 형식으로 익힌다.

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("첫 번째 Java 프로그램");
    }
}
```

**실행 흐름과 결과**

1. Java가 main 메서드를 찾는다.
2. main 내부의 첫 번째 실행문을 실행한다.
3. 화면에 문장을 출력한다.
4. 더 이상 실행할 코드가 없으므로 프로그램이 끝난다.

```
첫 번째 Java 프로그램
```

**자주 하는 실수**

```java
public class main {                            // 클래스 이름의 대소문자가 잘못됨
    public static void Main(String[] args) {   // main의 대소문자가 잘못됨
        system.out.println("Hello")            // System과 세미콜론 오류
    }
}
```

- 클래스 이름과 파일 이름을 다르게 작성한다.
- main을 Main으로 잘못 작성한다.
- 닫는 중괄호 `}`를 빠뜨린다.
- 실행문 끝에 세미콜론을 붙이지 않는다.
- System의 첫 글자를 소문자로 작성한다.

### Part 2. System.out.println() 출력

**개념 설명**

- `System.out.println()`은 괄호 안의 내용을 화면에 출력한다.
- 출력할 문자는 큰따옴표 `" "`로 감싸야 한다.
- `println`은 내용을 출력한 다음 줄을 바꾼다.
- 따라서 `println`을 두 번 사용하면 결과도 두 줄로 표시된다.
- Java는 대소문자를 구분하므로 정확한 철자로 작성해야 한다.

**코드 문법 분해**

```java
System.out.println("Hello");
```

| 부분 | 의미 |
|---|---|
| `System.out` | 화면으로 출력할 때 사용하는 기본 형식 |
| `println` | 내용을 출력한 후 줄을 바꾼다. |
| `"Hello"` | 화면에 출력할 문자 |
| `( )` | 출력할 내용을 작성하는 위치 |
| `;` | 출력문의 끝 |

**문제와 다른 예제**

```java
System.out.println("Java");
System.out.println("Beginner");
System.out.println("Lesson 01");
```

**실행 흐름과 결과**

- 첫 번째 println이 `Java`를 출력하고 줄을 바꾼다.
- 두 번째 println이 `Beginner`를 출력하고 줄을 바꾼다.
- 세 번째 println이 `Lesson 01`을 출력한다.

```
Java
Beginner
Lesson 01
```

**자주 하는 실수**

```java
System.out.println(Hello);     // 큰따옴표가 없음
system.out.println("Hello");   // System의 S가 소문자
System.out.Println("Hello");   // println의 p가 대문자
System.out.println("Hello")    // 세미콜론이 없음
```

문자를 출력할 때는 다음 형태를 정확히 지켜야 한다.

```java
System.out.println("출력할 문자");
```

### Part 3. print()와 println()의 차이

**개념 설명**

- `System.out.print()`도 괄호 안의 내용을 화면에 출력한다.
- 하지만 `print`는 출력한 다음 줄을 바꾸지 않는다.
- 다음 출력 내용은 같은 줄에 이어서 표시된다.
- 반대로 `println`은 출력 후 다음 줄로 이동한다.
- 두 출력문을 조합하면 같은 줄 출력과 줄바꿈을 조절할 수 있다.

**코드 문법 분해**

```java
System.out.print("Java");
System.out.println(" Start");
System.out.print("Done");
```

- 첫 번째 print는 `Java`를 출력하고 같은 줄에 머문다.
- 두 번째 println은 ` Start`를 이어서 출력한다.
- println이 실행되었으므로 다음 출력 위치가 아랫줄로 이동한다.
- 세 번째 print는 다음 줄에 `Done`을 출력한다.

**실행 결과**

```
Java Start
Done
```

**문제와 다른 예제**

```java
System.out.print("A");
System.out.print("B");
System.out.println("C");
System.out.println("D");
```

**실행 흐름과 결과**

- `A`를 출력하고 같은 줄에 머문다.
- `B`를 같은 줄에 이어서 출력한다.
- `C`를 이어서 출력하고 줄을 바꾼다.
- 다음 줄에 `D`를 출력한다.

```
ABC
D
```

**자주 하는 실수**

- print도 자동으로 줄을 바꾼다고 생각한다.
- 각 출력문 사이에 자동으로 공백이 생긴다고 생각한다.
- 코드에서 줄을 바꾸면 출력 결과도 줄이 바뀐다고 생각한다.
- print와 println의 철자를 혼동한다.

다음 두 코드는 결과가 다르다.

```java
System.out.print("A");
System.out.print("B");
```

```
AB
```

```java
System.out.println("A");
System.out.println("B");
```

```
A
B
```

### Part 4. 주석

**개념 설명**

- 주석은 코드에 설명을 남길 때 사용한다.
- 주석으로 작성된 내용은 프로그램이 실행하지 않는다.
- `//` 뒤의 내용은 해당 줄의 끝까지 주석이 된다.
- `/*`와 `*/` 사이의 내용은 여러 줄에 걸쳐 주석이 된다.
- 주석은 코드의 목적이나 주의사항을 설명할 때 사용한다.
- 실행해야 하는 코드를 주석 처리하지 않도록 주의해야 한다.

**코드 문법 분해**

```java
// 한 줄 주석
```

`//` 뒤에서 현재 줄이 끝나는 부분까지 주석으로 처리된다.

```java
/*
여러 줄을
작성할 수 있는 주석
*/
```

`/*`부터 `*/`까지의 모든 내용이 주석으로 처리된다.

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        // 학습 시작 메시지를 출력한다.
        System.out.println("학습 시작");

        /*
        다음 출력문은 주석 안에 있으므로
        실행되지 않는다.
        System.out.println("출력 안 됨");
        */
    }
}
```

**실행 흐름과 결과**

- 한 줄 주석은 실행하지 않는다.
- `학습 시작`을 출력한다.
- 여러 줄 주석 안의 출력문은 실행하지 않는다.
- 프로그램이 종료된다.

```
학습 시작
```

**자주 하는 실수**

```java
/ 한 줄 주석          // 슬래시가 하나뿐임

/*
여러 줄 주석          // 닫는 */가 없음
```

- 한 줄 주석을 슬래시 `/` 하나만 사용하여 작성한다.
- 여러 줄 주석의 마지막 `*/`를 빠뜨린다.
- 실행해야 하는 코드 앞에 실수로 `//`를 붙인다.
- 주석 안의 출력문도 실행된다고 생각한다.

## 다음으로

다음 학습 내용은 [Part 2「변수·기본형·리터럴·상수」](/dev/lessons/DEV-JAVA-01-02)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 1)

### 확인 1. 프로그램의 시작점  `객관식`

**문제.** 다음 중 Java 프로그램이 실행을 시작하는 위치는 무엇인가?

- **A.** class
- **B.** main ✅
- **C.** println
- **D.** System
- ✅ **정답:** B

> 💡 **해설.** Java 프로그램은 main 메서드에서 실행을 시작한다. class는 프로그램을 담는 영역, println은 출력 메서드, System은 표준 입출력을 담은 클래스다.

### 확인 2. 시작 메서드 찾기  `객관식`

**문제.** 다음 카드 중 main 메서드 선언 한 줄을 고르시오.

```java
public class Main {
    [①]
        System.out.println("준비 완료");
    }
}
```

- **A.** `public static void main(String[] args) {` ✅
- **B.** `public void main(String args) {`
- **C.** `public static int main(String[] args) {`
- **D.** `static void start(String[] args) {`
- ✅ **정답:** A

> 💡 **해설.** 자바 프로그램의 시작점은 public static void main(String[] args) 형태여야 한다. 매개변수는 String 배열이어야 하고, 반환형은 void이며, 이름은 반드시 main이어야 한다. String args처럼 배열이 아니거나 int로 반환하거나 이름이 start이면 시작 메서드로 인식되지 않는다.

### 확인 3. 코드 순서 맞추기  `순서 배열`

**문제.** 클래스 선언 → main 선언 → 출력문 순서로 배열하여 「실행 준비」를 출력하는 프로그램을 완성하시오.

- ✅ **정답 순서:**
```
public class Main {
    public static void main(String[] args) {
        System.out.println("실행 준비");
    }
}
```

- ❌ **오답 카드(제외):**
```
public static void start(String[] args) {
System.out.println("실행 완료");
```

> 💡 **해설.** 자바 프로그램의 시작 메서드는 main이어야 한다. start로 작성하면 프로그램의 시작점이 되지 않으며, 「실행 완료」는 목표 출력과 다르다.

### 확인 4. 올바른 출력문  `객관식`

**문제.** 화면에 Hello Java를 출력하는 올바른 코드는 무엇인가?

- **A.** `System.out.println("Hello Java");` ✅
- **B.** `System.out.println(Hello Java);`
- **C.** `system.out.println("Hello Java");`
- **D.** `System.out.Println("Hello Java");`
- ✅ **정답:** A

> 💡 **해설.** 출력할 문자는 큰따옴표로 감싸야 하고, System과 println의 대소문자도 정확해야 한다. 큰따옴표를 빼거나(B), S를 소문자로(C), p를 대문자로(D) 쓰면 모두 오류가 난다.

### 확인 5. print의 실행 결과  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
System.out.print("왼쪽");
System.out.print("→");
System.out.print("오른쪽");
```

- **A.** `왼쪽 → 오른쪽`
- **B.** `왼쪽→오른쪽` ✅
- **C.** 왼쪽, →, 오른쪽이 각각 다른 줄
- ✅ **정답:** B

> 💡 **해설.** print는 출력 후 줄을 바꾸지 않으므로 세 문자열이 한 줄에 그대로 이어진다. 사이에 공백이 없으므로 왼쪽→오른쪽이 붙어서 출력된다.

### 확인 6. 출력 메서드 선택  `코드 빈칸`

**문제.** 「첫 줄」 다음 줄에 「둘째 줄」이 오도록 빈칸에 메서드명을 채우시오.

```java
System.out.〔①〕("첫 줄");
System.out.〔②〕("둘째");
System.out.print(" 줄");
```
- ✅ **정답:** ① = `println` , ② = `print`
- 보기 토큰: `println` / `print` / `Print` / `Println`
- 실행결과:
```
첫 줄
둘째 줄
```

> 💡 **해설.** println은 출력 후 줄을 바꾸므로 「첫 줄」 다음에 줄이 바뀐다. print는 줄을 바꾸지 않아 「둘째」와 마지막의 「 줄」이 한 줄로 붙어 「둘째 줄」이 된다. 마지막 print는 고정이며, Print·Println은 대문자라 존재하지 않는 메서드다.

### 확인 7. 올바른 한 줄 주석  `객관식`

**문제.** 다음 중 올바른 한 줄 주석은 무엇인가?

- **A.** // 설명 ✅
- **B.** / 설명
- **C.** /* 설명
- **D.** 설명 */
- ✅ **정답:** A

> 💡 **해설.** 한 줄 주석은 슬래시 두 개 //로 시작해 그 줄 끝까지 적용된다. 슬래시 하나(/)나 여러 줄 주석 기호(/*, */)는 한 줄 주석이 아니다.

### 확인 8. 여러 줄 주석으로 가리기  `코드 빈칸`

**문제.** 가운데 출력문이 실행되지 않도록 여러 줄 주석으로 감싸 빈칸을 채우시오. (시작과 끝만 출력되어야 한다)

```java
System.out.println("시작");
〔①〕
System.out.println("이건 실행되지 않는다");
〔②〕
System.out.println("끝");
```
- ✅ **정답:** ① = `/*` , ② = `*/`
- 보기 토큰: `/*` / `*/` / `//`
- 실행결과:
```
시작
끝
```

> 💡 **해설.** 여러 줄 주석 /* */로 가운데 출력문을 감싸면 그 줄이 실행되지 않아 시작과 끝만 출력된다. //는 자기 한 줄만 주석 처리하므로, 가운데 출력문이나 뒤의 */가 코드로 남아 컴파일 오류가 난다.

### 확인 9. 주석과 실행 결과  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
System.out.println("첫 번째");
// System.out.println("두 번째");
System.out.println("세 번째");
```

- **A.** 첫 번째와 세 번째가 출력된다. (두 번째는 주석이라 실행 안 됨) ✅
- **B.** 첫 번째, 두 번째, 세 번째가 모두 출력된다.
- **C.** 아무것도 출력되지 않는다.
- ✅ **정답:** A

> 💡 **해설.** 두 번째 출력문은 //로 주석 처리되어 실행되지 않는다. 따라서 첫 번째와 세 번째만 두 줄로 출력된다.

### 확인 10. 오류 수정  `객관식`

**문제.** 다음 코드를 올바르게 고친 한 줄을 고르시오. — System.out.Println(Java);

```java
System.out.Println(Java);
```

- **A.** `System.out.println("Java");` ✅
- **B.** `System.out.Println("Java");`
- **C.** `System.out.println(Java);`
- **D.** `system.out.println("Java");`
- ✅ **정답:** A

> 💡 **해설.** 메서드 이름은 소문자 println이어야 하고, 출력할 문자열은 큰따옴표로 감싸야 한다. Println처럼 대문자로 쓰거나, Java를 따옴표 없이 쓰거나, System을 소문자 system으로 쓰면 컴파일 오류가 난다.

### 확인 11. 완전한 프로그램 — 두 줄 출력  `코드 빈칸`

**문제.** 다음 두 줄이 출력되도록 빈칸을 채워 프로그램을 완성하시오.

```text
Java
Start
```

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("〔①〕");
        System.out.println("〔②〕");
    }
}
```
- ✅ **정답:** ① = `Java` , ② = `Start`
- 보기 토큰: `Java` / `Start` / `Basic` / `Done`
- 실행결과:
```
Java
Start
```

> 💡 **해설.** 두 println이 각각 Java와 Start를 출력하고 줄을 바꿔 두 줄이 된다. 큰따옴표 안의 문자가 그대로 출력된다.

### 확인 12. 주석 범위 확인  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
System.out.println("위");
/*
System.out.println("가운데1");
System.out.println("가운데2");
*/
System.out.print("아래");
```

- **A.** `위` / `아래` ✅
- **B.** `위` / `가운데1` / `가운데2` / `아래`
- **C.** `위아래`
- **D.** 빈 출력
- ✅ **정답:** A

> 💡 **해설.** /* */ 사이의 코드는 주석이라 실행되지 않는다. 따라서 위는 println으로 줄을 바꿔 출력되고, 가운데1·가운데2는 주석이라 건너뛰며, 아래는 print로 출력된다. 결과는 위 다음 줄에 아래가 온다.

### 확인 13. 종합 — print와 println  `코드 빈칸`

**문제.** 다음 실행 결과가 나오도록 빈칸을 채우시오.

```text
Java Beginner
Lesson 01
```

```java
public class Main {
    public static void main(String[] args) {
        System.out.〔①〕("Java");
        System.out.〔②〕(" Beginner");
        System.out.println("Lesson 01");
    }
}
```
- ✅ **정답:** ① = `print` , ② = `println`
- 보기 토큰: `print` / `println` / `Print` / `Println`
- 실행결과:
```
Java Beginner
Lesson 01
```

> 💡 **해설.** print는 줄을 바꾸지 않으므로 Java 다음에 Beginner가 이어지고, println은 줄을 바꾸므로 그 뒤에서 줄이 바뀐다. 마지막 줄은 println으로 Lesson 01을 출력한다. Print·Println은 대문자라 존재하지 않는 메서드다.

---

# Part 2. Java초급02 변수·기본형·리터럴·상수

`DEV-JAVA-01-02` · 문제 15개 (코드 빈칸 5 · 객관식 10)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 변수를 선언하고 초기화할 수 있다.
- 변수에 저장된 값을 출력할 수 있다.
- Java의 8가지 기본형을 구분할 수 있다.
- 정수·실수·문자·논리 리터럴을 작성할 수 있다.
- long, float 리터럴의 접미사를 사용할 수 있다.
- final을 사용하여 상수를 선언할 수 있다.

## 수업 내용

### Part 1. 변수의 선언과 초기화

**개념 설명**

- 변수는 프로그램에서 값을 저장하는 이름 있는 공간이다.
- 변수를 사용하려면 먼저 저장할 값의 종류와 변수 이름을 선언해야 한다.
- 변수에 처음으로 값을 저장하는 것을 초기화라고 한다.
- 선언과 초기화는 한 문장으로 함께 작성할 수 있다.
- 이미 값이 저장된 변수에 새로운 값을 대입하면 기존 값은 새로운 값으로 바뀐다.
- main 메서드 안에서 선언한 변수는 값을 저장한 후 사용해야 한다.

**코드 문법 분해**

```java
int age = 20;
```

| 부분 | 의미 |
|---|---|
| `int` | 변수에 저장할 값의 자료형 |
| `age` | 변수 이름 |
| `=` | 오른쪽 값을 왼쪽 변수에 저장 |
| `20` | 변수에 저장할 값 |
| `;` | 변수 선언문의 끝 |

**선언과 초기화**

변수만 먼저 선언할 수 있다.

```java
int age;
```

선언한 변수에 나중에 값을 저장할 수 있다.

```java
age = 20;
```

선언과 동시에 값을 저장할 수도 있다.

```java
int age = 20;
```

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        int level = 1;
        System.out.println(level);

        level = 2;
        System.out.println(level);
    }
}
```

**실행 흐름과 결과**

1. `level`이라는 int 변수를 만든다.
2. `level`에 1을 저장한다.
3. 현재 저장된 1을 출력한다.
4. `level`에 새로운 값 2를 저장한다.
5. 기존 값 1이 사라지고 2가 출력된다.

```
1
2
```

**변수 이름 규칙**

```java
int age;
int studentCount;
int score2;
```

- 영문자, 숫자, `_`, `$`를 사용할 수 있다.
- 숫자로 시작할 수 없다.
- `int`, `class`, `public`과 같은 Java 예약어는 사용할 수 없다.
- 대소문자를 구분한다.
- 일반적으로 소문자로 시작하는 카멜 표기법을 사용한다.

```java
int studentCount;
int totalScore;
int userLevel;
```

**자주 하는 실수**

```java
int 1score = 100;       // 숫자로 시작할 수 없음
int class = 1;          // class는 예약어
int user age = 20;      // 이름에 공백을 사용할 수 없음
int score;
System.out.println(score); // 값을 저장하지 않고 사용
```

다음 두 변수는 서로 다른 변수다.

```java
int score = 80;
int Score = 90;
```

Java는 대소문자를 구분하므로 `score`와 `Score`를 다르게 처리한다.

### Part 2. Java의 8가지 기본형

**개념 설명**

- 자료형은 변수에 어떤 종류의 값을 저장할지 결정한다.
- Java의 기본형은 정수형, 실수형, 문자형, 논리형으로 구분된다.
- 기본형은 총 8개다.
- 같은 종류의 값이라도 저장 범위와 정밀도에 따라 여러 자료형으로 나뉜다.
- 초급 단계에서는 정수에 `int`, 실수에 `double`을 가장 많이 사용한다.

**기본형 종류**

| 분류 | 자료형 | 크기 | 저장하는 값 | 예시 |
|---|---|---|---|---|
| 정수형 | `byte` | 1바이트 | 작은 범위의 정수 | `byte level = 10;` |
| 정수형 | `short` | 2바이트 | 비교적 작은 정수 | `short year = 2026;` |
| 정수형 | `int` | 4바이트 | 일반적인 정수 | `int score = 100;` |
| 정수형 | `long` | 8바이트 | 매우 큰 정수 | `long distance = 3000000000L;` |
| 실수형 | `float` | 4바이트 | 단정밀도 실수 | `float rate = 3.5F;` |
| 실수형 | `double` | 8바이트 | 일반적인 실수 | `double height = 175.5;` |
| 문자형 | `char` | 2바이트 | 문자 한 개 | `char grade = 'A';` |
| 논리형 | `boolean` | JVM 표현 | 참 또는 거짓 | `boolean passed = true;` |

**정수형의 저장 범위**

| 자료형 | 저장 범위 |
|---|---|
| `byte` | -128 ∼ 127 |
| `short` | -32,768 ∼ 32,767 |
| `int` | -2,147,483,648 ∼ 2,147,483,647 |
| `long` | 약 -922경 ∼ 922경 |

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        byte level = 5;
        short year = 2026;
        int score = 95;
        long population = 8000000000L;

        float temperature = 24.5F;
        double height = 175.8;

        char grade = 'A';
        boolean passed = true;

        System.out.println(level);
        System.out.println(year);
        System.out.println(score);
        System.out.println(population);
        System.out.println(temperature);
        System.out.println(height);
        System.out.println(grade);
        System.out.println(passed);
    }
}
```

**실행 결과**

```
5
2026
95
8000000000
24.5
175.8
A
true
```

**자주 하는 실수**

```java
byte number = 200;       // byte의 저장 범위를 초과함
int count = 3000000000;  // int의 저장 범위를 초과함
char grade = "A";        // char는 작은따옴표를 사용해야 함
boolean result = "true"; // boolean 값에는 큰따옴표를 사용하지 않음
```

자료형이 저장할 수 있는 값의 범위를 초과하면 컴파일 오류가 발생할 수 있다.

### Part 3. 리터럴

**개념 설명**

- 리터럴은 코드에 직접 작성한 값 그 자체를 의미한다.
- `100`, `3.14`, `'A'`, `true` 등이 리터럴이다.
- 변수는 값을 저장하는 이름이고, 리터럴은 변수에 실제로 저장되는 값이다.
- 리터럴의 작성 방법은 값의 종류에 따라 다르다.
- 정수 리터럴은 기본적으로 int, 실수 리터럴은 기본적으로 double로 처리된다.

**코드 문법 분해**

```java
int score = 100;
```

- `int`: 변수의 자료형
- `score`: 변수 이름
- `100`: 정수 리터럴

```java
double height = 175.5;
```

- `double`: 변수의 자료형
- `height`: 변수 이름
- `175.5`: 실수 리터럴

**리터럴 종류**

| 종류 | 작성 예시 | 설명 |
|---|---|---|
| 정수 리터럴 | `10`, `-20`, `2026` | 소수점이 없는 수 |
| long 리터럴 | `3000000000L` | 큰 정수 뒤에 L 사용 |
| 실수 리터럴 | `3.14`, `175.5` | 기본적으로 double |
| float 리터럴 | `3.14F` | 실수 뒤에 F 사용 |
| 문자 리터럴 | `'A'`, `'가'` | 작은따옴표로 문자 하나 표현 |
| 문자열 리터럴 | `"Java"` | 큰따옴표로 여러 문자 표현 |
| 논리 리터럴 | `true`, `false` | 참과 거짓을 표현 |

**long 리터럴**

큰 정수를 long 변수에 저장할 때는 값 뒤에 `L`을 붙인다.

```java
long population = 8000000000L;
```

소문자 `l`도 사용할 수 있지만 숫자 1과 혼동될 수 있으므로 대문자 `L`을 사용하는 것이 좋다.

**float 리터럴**

소수점이 있는 값은 기본적으로 double이다. float 변수에 저장하려면 값 뒤에 `F`를 붙인다.

```java
float temperature = 24.5F;
double height = 175.8;
```

**문자와 문자열**

문자 한 개는 작은따옴표를 사용한다.

```java
char grade = 'A';
```

문자열은 큰따옴표를 사용한다.

```java
String language = "Java";
```

`String`은 기본형이 아니지만 문자와 문자열의 표기 차이를 구분하기 위해 여기서는 작성 방법만 확인한다. 자세한 사용법은 문자열 파트에서 학습한다.

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        int count = 30;
        long worldPopulation = 8000000000L;
        double price = 12.5;
        float temperature = 23.5F;
        char rank = 'S';
        boolean available = true;
        String message = "학습 시작";

        System.out.println(count);
        System.out.println(worldPopulation);
        System.out.println(price);
        System.out.println(temperature);
        System.out.println(rank);
        System.out.println(available);
        System.out.println(message);
    }
}
```

**실행 결과**

```
30
8000000000
12.5
23.5
S
true
학습 시작
```

**자주 하는 실수**

```java
long number = 3000000000; // 큰 정수에 L이 없음
float rate = 3.5;         // float 값에 F가 없음
char grade = "A";         // char에 큰따옴표 사용
String name = 'Java';     // 문자열에 작은따옴표 사용
boolean passed = True;    // true는 소문자로 작성
```

올바른 코드는 다음과 같다.

```java
long number = 3000000000L;
float rate = 3.5F;
char grade = 'A';
String name = "Java";
boolean passed = true;
```

### Part 4. 상수와 final

**개념 설명**

- 일반 변수는 새로운 값을 다시 저장할 수 있다.
- 반면 상수는 한 번 값을 저장한 후 변경하지 않는 값이다.
- Java에서는 변수 앞에 `final`을 붙여 값을 다시 대입하지 못하게 할 수 있다.
- 프로그램 전체에서 변경되면 안 되는 기준값을 나타낼 때 사용한다.
- 상수 이름은 일반적으로 모든 글자를 대문자로 작성한다.
- 여러 단어로 이루어진 이름은 밑줄 `_`로 연결한다.

**코드 문법 분해**

```java
final int MAX_SCORE = 100;
```

| 부분 | 의미 |
|---|---|
| `final` | 값을 한 번만 저장할 수 있게 함 |
| `int` | 상수에 저장할 값의 자료형 |
| `MAX_SCORE` | 상수 이름 |
| `100` | 저장할 정수 리터럴 |
| `;` | 선언문의 끝 |

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        final int DAILY_GOAL = 30;
        final double TAX_RATE = 0.1;
        final char TOP_GRADE = 'A';

        System.out.println(DAILY_GOAL);
        System.out.println(TAX_RATE);
        System.out.println(TOP_GRADE);
    }
}
```

**실행 결과**

```
30
0.1
A
```

**값 변경 제한**

일반 변수는 값을 변경할 수 있다.

```java
int score = 80;
score = 90;
```

final 변수는 한 번 값이 저장되면 변경할 수 없다.

```java
final int MAX_SCORE = 100;
MAX_SCORE = 200; // 컴파일 오류
```

**상수 이름 작성 방식**

```java
final int MAX_COUNT = 100;
final int DAILY_GOAL = 30;
final double TAX_RATE = 0.1;
```

다음과 같이 작성해도 문법 오류는 아니지만 상수임을 알아보기 어렵다.

```java
final int maxCount = 100;
```

일반적으로 상수는 `대문자_대문자` 형식을 권장한다.

**자주 하는 실수**

```java
final int MAX_SCORE = 100;
MAX_SCORE = 200; // final 값은 변경할 수 없음

final int MAX_SCORE;
System.out.println(MAX_SCORE); // 값을 저장하기 전에 사용할 수 없음
```

- final 값을 다시 변경하려고 한다.
- 상수를 선언하고 값을 저장하지 않은 상태에서 사용한다.
- 상수 이름을 일반 변수처럼 작성한다.
- final을 붙이면 자동으로 값이 저장된다고 생각한다.

## 종합 예제

```java
public class Main {
    public static void main(String[] args) {
        String courseName = "Java 초급";
        int partNumber = 2;
        char level = 'A';
        double studyHours = 1.5;
        boolean completed = false;

        final int DAILY_GOAL = 30;

        System.out.println(courseName);
        System.out.println(partNumber);
        System.out.println(level);
        System.out.println(studyHours);
        System.out.println(completed);
        System.out.println(DAILY_GOAL);
    }
}
```

**실행 흐름**

1. `courseName`에 문자열을 저장한다.
2. `partNumber`에 정수를 저장한다.
3. `level`에 문자 하나를 저장한다.
4. `studyHours`에 실수를 저장한다.
5. `completed`에 논리값을 저장한다.
6. `DAILY_GOAL`에 변경할 수 없는 값을 저장한다.
7. 각 변수와 상수의 값을 차례대로 출력한다.

**실행 결과**

```
Java 초급
2
A
1.5
false
30
```

## 다음으로

다음 학습 내용은 [Part 3「연산자·형변환」](/dev/lessons/DEV-JAVA-01-03)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 2)

### 확인 1. 변수 선언과 초기화  `객관식`

**문제.** score라는 정수형 변수를 선언하면서 100으로 초기화한 코드는 무엇인가?

- **A.** `int score = 100;` ✅
- **B.** `score int = 100;`
- **C.** `int = score 100;`
- **D.** `score = int 100;`
- ✅ **정답:** A

> 💡 **해설.** 선언은 「자료형 변수이름 = 값;」 순서다. int는 자료형, score는 변수 이름, 100은 정수 리터럴이다. 순서를 바꾸면 컴파일 오류가 난다.

### 확인 2. 변수 값 변경  `객관식`

**문제.** 다음 코드의 실행 결과는?

```java
int level = 1;
System.out.println(level);
level = 2;
System.out.println(level);
```

- **A.** 1과 2가 순서대로 각 줄에 출력된다. ✅
- **B.** 1이 두 번 출력된다.
- **C.** 2가 두 번 출력된다.
- ✅ **정답:** A

> 💡 **해설.** 먼저 1을 출력하고, level = 2로 값이 바뀐 뒤 2를 출력한다. 기존 값 1은 새로운 값 2로 대체된다.

### 확인 3. 변수 이름 규칙  `객관식`

**문제.** 다음 중 변수 이름으로 사용할 수 없는 것끼리만 묶은 것은?
(studentCount, 2score, class, score2, user level, _level)

- **A.** 2score, class, user level ✅
- **B.** studentCount, score2, _level
- **C.** 2score, score2, _level
- ✅ **정답:** A

> 💡 **해설.** 변수 이름은 숫자로 시작할 수 없고(2score), 예약어를 쓸 수 없으며(class), 공백을 포함할 수 없다(user level). studentCount·score2·_level은 규칙에 맞아 사용할 수 있다.

### 확인 4. 초기화되지 않은 변수  `객관식`

**문제.** 다음 코드를 실행하면 어떻게 되는가?

```java
int count;
System.out.println(count);
```

- **A.** 컴파일 오류가 발생한다. ✅
- **B.** 0이 출력된다.
- **C.** null이 출력된다.
- **D.** 아무것도 출력되지 않는다.
- ✅ **정답:** A

> 💡 **해설.** main 안에서 선언한 지역 변수는 값을 저장(초기화)한 후에만 사용할 수 있다. 초기화하지 않고 사용하면 「variable count might not have been initialized」 컴파일 오류가 난다. (필드와 달리 지역 변수는 0으로 자동 초기화되지 않는다.)

### 확인 5. 기본형 분류  `객관식`

**문제.** 다음 중 정수형(정수를 저장하는 기본형) 4가지만 올바르게 묶은 것은?

- **A.** byte, short, int, long ✅
- **B.** byte, short, int, float
- **C.** short, int, long, double
- ✅ **정답:** A

> 💡 **해설.** 정수형은 byte·short·int·long 4가지다. float·double은 실수형, char는 문자형, boolean은 논리형이다. Java 기본형은 총 8개다.

### 확인 6. 알맞은 자료형 채우기  `코드 빈칸`

**문제.** 각 값을 저장하기에 알맞은 기본형을 빈칸에 채우시오.

```java
〔①〕 age = 20;
〔②〕 height = 175.5;
〔③〕 grade = 'A';
〔④〕 completed = false;
System.out.println(age);
System.out.println(height);
System.out.println(grade);
System.out.println(completed);
```
- ✅ **정답:** ① = `int` , ② = `double` , ③ = `char` , ④ = `boolean`
- 보기 토큰: `int` / `double` / `char` / `boolean` / `String`
- 실행결과:
```
20
175.5
A
false
```

> 💡 **해설.** 정수 20은 int, 실수 175.5는 double, 문자 'A'는 char, 참/거짓 false는 boolean에 저장한다. String을 쓰면 기본형 값을 담을 수 없어 컴파일 오류(incompatible types)가 난다.

### 확인 7. 기본형이 아닌 것  `객관식`

**문제.** 다음 중 Java의 기본형이 아닌 것은 무엇인가?

- **A.** String ✅
- **B.** int
- **C.** double
- **D.** boolean
- ✅ **정답:** A

> 💡 **해설.** String은 기본형이 아니라 참조형(클래스)이다. Java의 기본형은 byte·short·int·long·float·double·char·boolean 8가지뿐이다.

### 확인 8. 리터럴의 기본 자료형  `객관식`

**문제.** 리터럴과 그 기본 자료형의 짝으로 모두 옳은 것은?

- **A.** 100 → int, 3.14 → double, 'A' → char, true → boolean ✅
- **B.** 100 → long, 3.14 → float, 'A' → String, true → boolean
- **C.** 100 → int, 3.14 → float, 'A' → char, true → int
- ✅ **정답:** A

> 💡 **해설.** 소수점 없는 정수 리터럴은 기본적으로 int, 소수점 있는 실수 리터럴은 기본적으로 double이다. 작은따옴표 문자는 char, true/false는 boolean이다.

### 확인 9. 리터럴 완성  `코드 빈칸`

**문제.** 각 리터럴이 자료형에 맞게 저장되도록 빈칸을 채우시오.

```java
long population = 8000000000〔①〕;
float temperature = 24.5〔②〕;
char grade = 〔③〕;
boolean passed = 〔④〕;
System.out.println(population);
System.out.println(temperature);
System.out.println(grade);
System.out.println(passed);
```
- ✅ **정답:** ① = `L` 또는 `l` , ② = `F` 또는 `f` , ③ = `'A'` , ④ = `true`
- 보기 토큰: `L` / `F` / `'A'` / `true` / `false`
- 실행결과:
```
8000000000
24.5
A
true
```

> 💡 **해설.** int 범위를 넘는 정수 리터럴에는 L 또는 l을 붙여 long으로 만들고, 실수 리터럴을 float에 저장할 때는 F 또는 f를 붙인다. 소문자도 문법상 사용할 수 있지만, 소문자 l은 숫자 1과 혼동하기 쉬워 보통 대문자 L을 권장한다. 문자는 작은따옴표를 사용한 'A', 논리값은 소문자 true로 작성한다.

### 확인 10. byte 저장 범위  `코드 빈칸`

**문제.** byte에 저장할 수 있는 값을 골라 빈칸을 채우시오.

```java
byte level = 〔①〕;

System.out.println(level);
```
- ✅ **정답:** ① = `127`
- 보기 토큰: `127` / `128` / `-129` / `3.5`
- 실행결과:
```
127
```

> 💡 **해설.** byte의 저장 범위는 -128부터 127까지다. 127은 저장할 수 있지만 128과 -129는 범위를 벗어나며, 3.5는 정수가 아닌 실수라 byte에 바로 저장할 수 없다.

### 확인 11. 상수 선언  `코드 빈칸`

**문제.** 값을 변경할 수 없는 정수 상수를 선언하도록 빈칸을 채우시오.

```java
〔①〕 int MAX_SCORE = 100;
System.out.println(MAX_SCORE);
```
- ✅ **정답:** ① = `final`
- 보기 토큰: `final` / `const` / `fixed` / `readonly`
- 실행결과:
```
100
```

> 💡 **해설.** final을 붙인 변수에는 값을 다시 대입할 수 없다. Java에서는 const, fixed, readonly를 상수 선언 키워드로 사용하지 않는다. 상수 이름은 MAX_SCORE처럼 대문자와 밑줄로 쓰는 것이 관례다.

### 확인 12. 상수 값 변경  `객관식`

**문제.** 다음 코드에서 어떤 일이 일어나는가?

```java
final int DAILY_GOAL = 30;
DAILY_GOAL = 50;
```

- **A.** 컴파일 오류가 발생한다. ✅
- **B.** 값이 50으로 변경된다.
- **C.** 값이 30으로 유지된 채 정상 실행된다.
- **D.** DAILY_GOAL이 일반 변수로 바뀐다.
- ✅ **정답:** A

> 💡 **해설.** final 변수는 한 번 값이 저장되면 다시 대입할 수 없다. DAILY_GOAL = 50;에서 「cannot assign a value to final variable」 컴파일 오류가 난다.

### 확인 13. 실행 결과 예측  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (각 변수를 순서대로 println)

```java
int partNumber = 2;
double studyHours = 1.5;
char grade = 'A';
boolean completed = false;
final int DAILY_GOAL = 30;
```

- **A.** 2, 1.5, A, false, 30 이 순서대로 각 줄에 출력된다. ✅
- **B.** partNumber, studyHours, grade, completed, DAILY_GOAL (변수 이름이 출력된다).
- **C.** 2, 1.5, A, true, 30 이 출력된다.
- ✅ **정답:** A

> 💡 **해설.** println은 변수 이름이 아니라 변수에 저장된 값을 출력한다. 저장된 값이 순서대로 2, 1.5, A, false, 30으로 출력된다. completed는 false이므로 true가 아니다.

### 확인 14. 오류 수정  `객관식`

**문제.** 다음 코드에는 여러 오류가 있다. 모두 올바르게 고친 것은?

```java
int 2level = 2;
char grade = "A";
boolean passed = True;
float rate = 1.5;
long population = 8000000000;
```

- **A.** `int level2 = 2; / char grade = 'A'; / boolean passed = true; / float rate = 1.5F; / long population = 8000000000L;` ✅
- **B.** `int 2level = 2; / char grade = 'A'; / boolean passed = true; / float rate = 1.5; / long population = 8000000000;`
- **C.** `int level2 = 2; / char grade = "A"; / boolean passed = True; / float rate = 1.5F; / long population = 8000000000L;`
- ✅ **정답:** A

> 💡 **해설.** 이름은 숫자로 시작할 수 없어 level2로, char는 작은따옴표 'A'로, 논리값은 소문자 true로, float 리터럴에는 F를, int 범위를 넘는 큰 정수에는 L을 붙여야 한다. 다섯 가지를 모두 고친 것은 A뿐이다.

### 확인 15. 종합 — 변수와 상수 프로그램  `코드 빈칸`

**문제.** 다음 조건을 만족하도록 빈칸을 채우시오. courseName="Java", partNumber=2, level='B', completed=false, 상수 MAX_SCORE=100 을 저장하고 순서대로 출력한다.

```java
public class Main {
    public static void main(String[] args) {
        String courseName = "〔①〕";
        int partNumber = 〔②〕;
        char level = 〔③〕;
        boolean completed = 〔④〕;
        final int MAX_SCORE = 〔⑤〕;
        System.out.println(courseName);
        System.out.println(partNumber);
        System.out.println(level);
        System.out.println(completed);
        System.out.println(MAX_SCORE);
    }
}
```
- ✅ **정답:** ① = `Java` , ② = `2` , ③ = `'B'` , ④ = `false` , ⑤ = `100`
- 보기 토큰: `Java` / `2` / `'B'` / `false` / `100` / `true` / `'A'`
- 실행결과:
```
Java
2
B
false
100
```

> 💡 **해설.** 문자열은 큰따옴표 안에 Java, 정수는 2, 문자는 작은따옴표 'B', 논리값은 false, 상수 값은 100을 넣는다. char에 'A'를 넣으면 B 대신 A가 출력되고, boolean에 true를 넣으면 false 대신 true가 출력되어 결과가 달라진다.

---

# Part 3. Java초급03 연산자·형변환

`DEV-JAVA-01-03` · 문제 10개 (코드 빈칸 6 · 객관식 4)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 산술 연산자로 값을 계산한다.
- 대입·증감 연산자로 변수 값을 변경한다.
- 비교·논리 연산의 결과를 구한다.
- 연산자 우선순위를 이해한다.
- 자동 형변환과 강제 형변환을 구분한다.

## 수업 내용

### Part 1. 산술·대입·증감 연산자

**개념 설명**

- 산술 연산자는 숫자를 계산할 때 사용한다.
- `+`, `-`, `*`, `/`는 사칙연산이고 `%`는 나머지를 구한다.
- 정수끼리 나누면 소수점 이하가 버려진다.
- `+=`, `-=`, `*=`, `/=`는 계산한 결과를 같은 변수에 다시 저장한다.
- `++`와 `--`는 변수 값을 1씩 증가하거나 감소시킨다.

**코드 문법**

| 연산자 | 의미 | 예 |
|---|---|---|
| `+` | 덧셈 | `10 + 3` |
| `-` | 뺄셈 | `10 - 3` |
| `*` | 곱셈 | `10 * 3` |
| `/` | 나눗셈 | `10 / 3` |
| `%` | 나머지 | `10 % 3` |
| `+=` | 더한 후 저장 | `number += 3` |
| `++` | 1 증가 | `number++` |
| `--` | 1 감소 | `number--` |

**예제**

```java
int number = 10;

number += 5;
number++;
number--;

System.out.println(number);
System.out.println(10 / 3);
System.out.println(10 % 3);
```

**실행 결과**

```
15
3
1
```

**자주 하는 실수**

```java
double result = 5 / 2;
```

정수끼리 먼저 계산하므로 결과는 2.5가 아니라 2.0이다.

또한 증감 연산자를 다른 대입문에 사용하면 위치에 따라 결과가 달라진다.

```java
int number = 5;
int result = number++;
```

`result`에는 5, `number`에는 6이 저장된다.

### Part 2. 비교·논리 연산자

**개념 설명**

- 비교 연산자는 두 값을 비교하고 true 또는 false를 만든다.
- `==`는 두 값이 같은지, `!=`는 다른지 비교한다.
- `>`, `<`, `>=`, `<=`는 값의 크기를 비교한다.
- `&&`는 양쪽 조건이 모두 참일 때 참이다.
- `||`는 하나 이상의 조건이 참일 때 참이다.
- `!`는 true와 false를 반대로 바꾼다.

**코드 문법**

| 연산자 | 의미 |
|---|---|
| `==` | 같다 |
| `!=` | 같지 않다 |
| `>`, `<` | 크다, 작다 |
| `>=`, `<=` | 크거나 같다, 작거나 같다 |
| `&&` | 양쪽이 모두 참 |
| `\|\|` | 하나 이상 참 |
| `!` | 논리값 반전 |

**예제**

```java
int score = 80;
boolean submitted = true;

boolean passed = score >= 60;
boolean completed = passed && submitted;
boolean excellent = score >= 90 || completed;

System.out.println(passed);
System.out.println(completed);
System.out.println(excellent);
```

**실행 결과**

```
true
true
true
```

**자주 하는 실수**

```java
score = 80;                  // 값을 저장 (대입)
boolean same = score == 80;  // 값이 같은지 비교 (결과는 boolean)
```

`=`는 대입, `==`는 비교다. `score == 80;`처럼 비교식만 단독으로 쓰면 문장이 되지 못해 컴파일 오류가 난다.

### Part 3. 연산자 우선순위

**개념 설명**

- 한 문장에 여러 연산자가 있으면 정해진 우선순위에 따라 계산한다.
- 곱셈·나눗셈·나머지가 덧셈·뺄셈보다 먼저 실행된다.
- 비교 연산은 산술 계산이 끝난 후 실행된다.
- 괄호를 사용하면 괄호 안의 계산을 먼저 실행할 수 있다.
- 계산 순서가 헷갈리면 괄호로 명확하게 표현하는 것이 좋다.

**예제**

```java
int first = 2 + 3 * 4;
int second = (2 + 3) * 4;

System.out.println(first);
System.out.println(second);
```

**실행 흐름과 결과**

```
2 + 3 * 4   → 2 + 12 → 14
(2 + 3) * 4 → 5 * 4  → 20
```

```
14
20
```

**자주 하는 실수**

- 모든 계산이 무조건 왼쪽부터 실행된다고 생각하면 안 된다.
- 복잡한 식에서는 우선순위를 암기하기보다 괄호를 사용하는 것이 안전하다.

### Part 4. 자동 형변환과 강제 형변환

**개념 설명**

- 형변환은 값을 다른 자료형으로 바꾸는 것이다.
- 작은 범위의 숫자형을 큰 범위의 숫자형에 저장하면 자동으로 변환된다.
- 큰 범위의 숫자형을 작은 범위로 바꿀 때는 `(자료형)`을 작성한다.
- 이를 강제 형변환이라고 한다.
- 실수를 정수로 변환하면 소수점 이하는 버려진다.
- 강제 형변환할 값이 자료형의 범위를 넘으면 원래 값이 보존되지 않을 수 있다.

**자동 형변환 방향**

작은 자료형의 값을 더 큰 자료형에 저장하면 자동으로 변환되며, 이를 **확대 기본형 변환**이라고 한다.

```
byte → short → int → long → float → double
char → int → long → float → double
```

- `char`도 `int` 이상의 정수·실수형으로 자동 변환된다.
- `long → float`, `long → double`처럼 정수에서 실수로 변환될 때는 자동 변환은 되지만 값이 크면 정밀도가 손실될 수 있다.
- "작은 범위에서 큰 범위"는 이해를 돕는 표현이며, 정확한 이름은 확대 기본형 변환이다.

**예제**

```java
int count = 10;
double first = count;

double price = 3.8;
int second = (int) price;

double division = (double) 5 / 2;

System.out.println(first);
System.out.println(second);
System.out.println(division);
```

**실행 흐름과 결과**

1. `count`는 자동으로 double로 변환된다.
2. 3.8을 int로 변환하면 소수점 이하가 버려진다.
3. 5를 먼저 double로 변환하므로 실수 나눗셈이 실행된다.

```
10.0
3
2.5
```

**자주 하는 실수**

```java
double first = 5 / 2;            // 2.0
double second = (double) 5 / 2;  // 2.5
double third = (double) (5 / 2); // 2.0
```

형변환을 계산 전에 하는지, 계산 후에 하는지에 따라 결과가 달라진다.

## 커리큘럼 경계

이번 파트에서는 다음 내용을 제외합니다.

- Scanner 입력: 초급 04
- if·else: 초급 05
- 삼항 연산자: 초급 06
- 문자열 연결과 비교: 초급 13

## 핵심 요약

```java
int result = 10 + 3;
int remainder = 10 % 3;

int number = 5;
number += 2;
number++;

boolean passed = number >= 5 && number <= 10;

double division = (double) 5 / 2;
int integer = (int) 3.8;
```

- 정수 나눗셈은 소수점 이하를 버린다.
- 비교 연산의 결과는 boolean이다.
- `=`는 대입, `==`는 비교다.
- 자동 형변환(확대 기본형 변환)은 더 큰 자료형에 저장할 때 발생한다.
- 강제 형변환은 `(자료형)`으로 작성한다.

## 다음으로

다음 학습 내용은 [Part 4「표준입력 Scanner」](/dev/lessons/DEV-JAVA-01-04)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 3)

### 확인 1. 계산식 완성  `코드 빈칸`

**문제.** 물건 7개의 총액을 구하도록 빈칸에 연산자를 채우시오.

```java
int items = 7;
int price = 1200;
int total = items 〔①〕 price;
System.out.println(total);
```
- ✅ **정답:** ① = `*`
- 보기 토큰: `*` / `+` / `/` / `%`
- 실행결과:
```
8400
```

> 💡 **해설.** 총액은 개수 × 단가이므로 곱셈 *를 쓴다. 7 * 1200 = 8400이다. +는 1207, /는 0, %는 7이 되어 답이 아니다.

### 확인 2. 정수 나눗셈 결과  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
int boxes = 17;
int trucks = 4;
System.out.println(boxes / trucks);
System.out.println(boxes % trucks);
```

- **A.** `4` / `1` ✅
- **B.** `4.25` / `1`
- **C.** `4` / `4`
- **D.** `5` / `1`
- ✅ **정답:** A

> 💡 **해설.** 정수끼리 나누면 소수점 이하를 버려 17 / 4 = 4이고, %는 나머지라 17 % 4 = 1이다. 정수 나눗셈은 4.25가 아니라 4가 된다.

### 확인 3. 복합 대입  `코드 빈칸`

**문제.** energy가 15 줄고 다시 2배가 되도록 빈칸을 채우시오.

```java
int energy = 50;
energy 〔①〕 15;
energy 〔②〕 2;
System.out.println(energy);
```
- ✅ **정답:** ① = `-=` , ② = `*=`
- 보기 토큰: `-=` / `*=` / `+=` / `/=`
- 실행결과:
```
70
```

> 💡 **해설.** 15를 빼므로 -=, 2배로 늘리므로 *=를 쓴다. 50 - 15 = 35, 35 * 2 = 70이다. +=·/= 이나 순서가 바뀌면 결과가 달라진다.

### 확인 4. 전위 증가  `코드 빈칸`

**문제.** turn을 1 증가시킨 값을 next에 저장하도록 빈칸을 채우시오.

```java
int turn = 8;
int next = 〔①〕turn;
System.out.println(next);
```
- ✅ **정답:** ① = `++`
- 보기 토큰: `++` / `--` / `+` / `+=`
- 실행결과:
```
9
```

> 💡 **해설.** 전위 증가 ++turn은 turn을 먼저 9로 만든 뒤 그 값을 next에 저장한다. --는 7, 단항 +는 8 그대로, +=는 이 자리에서 문법 오류가 난다.

### 확인 5. 비교 연산자  `코드 빈칸`

**문제.** remaining이 0과 같은지 비교해 empty에 저장하도록 빈칸을 채우시오.

```java
int remaining = 0;
boolean empty = remaining 〔①〕 0;
System.out.println(empty);
```
- ✅ **정답:** ① = `==`
- 보기 토큰: `==` / `=` / `!=` / `>`
- 실행결과:
```
true
```

> 💡 **해설.** 값이 같은지는 == 로 비교한다. 0 == 0은 true다. =는 대입이라 boolean에 int를 넣어 컴파일 오류, !=와 >는 false가 되어 답이 아니다.

### 확인 6. 논리 연산자  `코드 빈칸`

**문제.** month가 6 이상이면서 8 이하인지 두 조건을 모두 만족하는지 확인하도록 빈칸을 채우시오.

```java
int month = 10;
boolean summer = month >= 6 〔①〕 month <= 8;
System.out.println(summer);
```
- ✅ **정답:** ① = `&&`
- 보기 토큰: `&&` / `||` / `!=` / `!`
- 실행결과:
```
false
```

> 💡 **해설.** 두 조건을 모두 만족해야 하므로 그리고를 뜻하는 &&를 쓴다. month가 10이면 6 이상은 참이지만 8 이하가 거짓이라 &&는 false다. ||는 하나만 참이어도 true라 결과가 달라지고, !·!=는 이 자리에 맞지 않는다.

### 확인 7. 대입과 비교 구분  `객관식`

**문제.** mode에 3을 저장하는 코드 한 줄로 옳은 것은?

- **A.** `mode == 3;`
- **B.** `mode = 3;` ✅
- **C.** `mode != 3;`
- **D.** `int = mode 3;`
- ✅ **정답:** B

> 💡 **해설.** 값을 저장하는 것은 대입 연산자 =이므로 mode = 3;이 옳다. mode == 3;·mode != 3;은 비교식이라 단독 문장으로 쓸 수 없어 컴파일 오류이고, int = mode 3;도 문법에 맞지 않는다.

### 확인 8. 우선순위 지정  `객관식`

**문제.** 2와 5를 먼저 더한 뒤 3을 곱하는 코드 한 줄로 옳은 것은?

- **A.** `int result = 2 + 5 * 3;`
- **B.** `int result = 2 + (5 * 3);`
- **C.** `int result = (2 + 5) * 3;` ✅
- **D.** `int result = 2 * 5 + 3;`
- ✅ **정답:** C

> 💡 **해설.** 괄호로 (2 + 5)를 먼저 계산해 7을 만든 뒤 3을 곱해야 21이 된다. 괄호가 없으면 곱셈이 먼저라 2 + 15 = 17, 2 * 5 + 3 = 13이 된다.

### 확인 9. 자동 형변환  `객관식`

**문제.** 컴파일되는 코드 한 줄로 옳은 것은?

- **A.** `int distance = 25.8;`
- **B.** `byte distance = 200;`
- **C.** `boolean distance = 1;`
- **D.** `double distance = 25;` ✅
- ✅ **정답:** D

> 💡 **해설.** 정수 25는 double에 자동으로 변환되어 저장되므로 double distance = 25;는 컴파일된다. 실수 25.8을 int에 넣거나, 200을 byte(최대 127)에 넣거나, 1을 boolean에 넣으면 오류가 난다.

### 확인 10. 강제 형변환  `코드 빈칸`

**문제.** 실수 temperature의 소수점 이하를 버리고 정수로 저장하도록 빈칸을 채우시오.

```java
double temperature = 18.9;
int whole = 〔①〕 temperature;
System.out.println(whole);
```
- ✅ **정답:** ① = `(int)`
- 보기 토큰: `(int)` / `(double)` / `int` / `parseInt`
- 실행결과:
```
18
```

> 💡 **해설.** 실수를 정수로 바꾸려면 (int)로 강제 형변환한다. (int)18.9는 소수점 이하를 버려 18이다. (double)은 int에 넣을 수 없어 오류, int·parseInt는 이 자리에서 문법 오류가 난다.

---

# Part 4. Java초급04 표준입력 Scanner

`DEV-JAVA-01-04` · 문제 9개 (코드 빈칸 5 · 객관식 4)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- Scanner를 사용하기 위해 import를 작성한다.
- 키보드로 입력한 값을 변수에 저장한다.
- 자료형에 맞는 입력 메서드를 사용한다.
- next()와 nextLine()의 차이를 구분한다.
- 숫자 입력 후 nextLine()을 사용할 때 발생하는 문제를 해결한다.

## 수업 내용

### Part 1. Scanner 준비

**개념 설명**

- Scanner는 키보드로 입력한 값을 읽을 때 사용하는 기능이다.
- 사용하려면 파일 위쪽에 `import java.util.Scanner;`를 작성한다.
- 그다음 `new Scanner(System.in)`으로 입력을 받을 준비를 한다.
- `System.in`은 키보드에서 입력된 값을 의미한다.
- 클래스와 객체의 자세한 의미는 중급에서 배우므로 지금은 기본 형식으로 익힌다.

**코드 문법 분해**

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        scanner.close();
    }
}
```

| 코드 | 의미 |
|---|---|
| `import java.util.Scanner;` | Scanner를 사용할 수 있게 불러온다. |
| `Scanner` | 입력 기능의 자료형 |
| `scanner` | 입력 기능을 사용할 변수 이름 |
| `new Scanner(System.in)` | 키보드 입력을 받을 준비 |
| `scanner.close()` | 입력 사용 종료 |

**문제와 다른 예제**

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int number = input.nextInt();
        System.out.println(number);

        input.close();
    }
}
```

**실행 흐름과 결과**

입력:

```
20
```

출력:

```
20
```

**자주 하는 실수**

- `import java.util.Scanner;`를 작성하지 않는다.
- import를 클래스 내부에 작성한다.
- `System.in`을 `System.out`으로 잘못 작성한다.
- 선언한 이름은 `scanner`인데 `input.nextInt()`처럼 다른 이름을 사용한다.

### Part 2. 자료형에 맞는 입력 메서드

**개념 설명**

- 입력값의 자료형에 따라 사용하는 메서드가 다르다.
- 정수는 `nextInt()`, 실수는 `nextDouble()`을 주로 사용한다.
- 한 단어는 `next()`, 한 줄 전체는 `nextLine()`으로 입력받는다.
- 입력한 값은 변수에 저장한 후 출력이나 계산에 사용할 수 있다.
- 숫자 변수에 문자를 입력하면 실행 중 오류가 발생할 수 있다.

**주요 입력 메서드**

| 입력할 값 | 메서드 | 사용 예 |
|---|---|---|
| int 정수 | `nextInt()` | `int age = scanner.nextInt();` |
| long 정수 | `nextLong()` | `long count = scanner.nextLong();` |
| float 실수 | `nextFloat()` | `float rate = scanner.nextFloat();` |
| double 실수 | `nextDouble()` | `double height = scanner.nextDouble();` |
| boolean | `nextBoolean()` | `boolean passed = scanner.nextBoolean();` |
| 한 단어 | `next()` | `String name = scanner.next();` |
| 한 줄 | `nextLine()` | `String message = scanner.nextLine();` |

**문제와 다른 예제**

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int age = scanner.nextInt();
        double height = scanner.nextDouble();
        boolean student = scanner.nextBoolean();

        System.out.println(age);
        System.out.println(height);
        System.out.println(student);

        scanner.close();
    }
}
```

**실행 흐름과 결과**

입력:

```
25
175.5
true
```

출력:

```
25
175.5
true
```

**자주 하는 실수**

```java
int age = scanner.nextDouble(); // 자료형이 맞지 않음
```

올바른 코드는 다음과 같다.

```java
int age = scanner.nextInt();
```

`nextInt()`를 사용할 때 `Java`와 같은 문자를 입력하면 정수로 읽을 수 없으므로 오류가 발생한다.

### Part 3. next()와 nextLine()

**개념 설명**

- `next()`는 공백을 기준으로 한 단어만 읽는다.
- `nextLine()`은 Enter를 누르기 전까지 한 줄 전체를 읽는다.
- 이름이나 명령어처럼 공백이 없는 값은 `next()`로 받을 수 있다.
- 주소나 문장처럼 공백이 포함된 값은 `nextLine()`을 사용해야 한다.

**예제**

```java
Scanner scanner = new Scanner(System.in);

String word = scanner.next();
System.out.println(word);
```

입력:

```
Hello Java
```

출력:

```
Hello
```

`next()`는 첫 번째 공백 전까지만 읽는다.

```java
Scanner scanner = new Scanner(System.in);

String line = scanner.nextLine();
System.out.println(line);
```

같은 내용을 입력하면 한 줄 전체를 읽는다.

입력:

```
Hello Java
```

출력:

```
Hello Java
```

**자주 하는 실수**

공백이 포함된 이름이나 문장을 `next()`로 입력받으면 첫 번째 단어만 저장된다.

```java
String message = scanner.next();
```

한 줄 전체가 필요하다면 `nextLine()`을 사용한다.

```java
String message = scanner.nextLine();
```

### Part 4. 숫자 입력 후 nextLine()

**개념 설명**

- `nextInt()`와 `nextDouble()`은 숫자만 읽고 Enter 입력은 남겨둔다.
- 그 직후 `nextLine()`을 호출하면 남아 있는 Enter를 먼저 읽을 수 있다.
- 이 경우 사용자가 문장을 입력하기 전에 빈 문자열이 저장된다.
- 숫자를 입력한 뒤 `nextLine()`을 사용하려면 중간에서 `nextLine()`을 한 번 더 호출한다.

**문제가 발생하는 코드**

```java
Scanner scanner = new Scanner(System.in);

int age = scanner.nextInt();
String name = scanner.nextLine();

System.out.println(age);
System.out.println(name);
```

`nextInt()`가 숫자만 읽기 때문에 name에는 원하는 문장이 입력되지 않을 수 있다.

**수정 코드**

```java
Scanner scanner = new Scanner(System.in);

int age = scanner.nextInt();
scanner.nextLine();

String name = scanner.nextLine();

System.out.println(age);
System.out.println(name);
```

**실행 흐름과 결과**

입력:

```
25
이태훈
```

실행 순서는 다음과 같다.

1. `nextInt()`가 25를 읽는다.
2. 첫 번째 `nextLine()`이 남아 있는 Enter를 처리한다.
3. 두 번째 `nextLine()`이 이태훈을 읽는다.

출력:

```
25
이태훈
```

**자주 하는 실수**

다음 코드처럼 숫자 입력 직후 바로 `nextLine()`을 사용한다.

```java
int age = scanner.nextInt();
String name = scanner.nextLine();
```

다음과 같이 남아 있는 Enter를 먼저 처리해야 한다.

```java
int age = scanner.nextInt();
scanner.nextLine();
String name = scanner.nextLine();
```

## 종합 예제

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String name = scanner.nextLine();
        int age = scanner.nextInt();
        double height = scanner.nextDouble();

        System.out.println(name);
        System.out.println(age);
        System.out.println(height);

        scanner.close();
    }
}
```

입력:

```
이태훈
25
175.5
```

출력:

```
이태훈
25
175.5
```

## 커리큘럼 경계

이번 파트에서는 키보드 입력값을 변수에 저장하는 방법까지만 학습합니다.

- 입력값에 따라 분기: 초급 05
- 입력값을 반복해서 받기: 초급 07∼09
- 문자열 메서드 사용: 초급 14
- 입력 오류를 예외로 처리: 중급 예외 파트

`Scanner`에는 문자 하나를 직접 입력하는 `nextChar()`가 없습니다. 문자 한 개를 꺼내는 방법은 문자열 메서드를 배운 후 다룹니다.

## 핵심 요약

```java
import java.util.Scanner;

Scanner scanner = new Scanner(System.in);

int age = scanner.nextInt();
double height = scanner.nextDouble();

scanner.nextLine();
String name = scanner.nextLine();

scanner.close();
```

- Scanner를 사용하려면 import가 필요하다.
- 자료형에 맞는 입력 메서드를 사용한다.
- `next()`는 한 단어, `nextLine()`은 한 줄을 읽는다.
- 숫자 입력 후 `nextLine()`을 사용할 때는 남아 있는 Enter를 처리한다.

## 다음으로

다음 학습 내용은 [Part 5「조건분기① if·else」](/dev/lessons/DEV-JAVA-01-05)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 4)

### 확인 1. Scanner 준비  `코드 빈칸`

**문제.** 빈칸을 채워 키보드 입력을 받을 준비를 완성하시오.

```java
import java.util.〔①〕;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(〔②〕);
    }
}
```
- ✅ **정답:** ① = `Scanner` , ② = `System.in`
- 보기 토큰: `Scanner` / `System.in` / `System.out` / `Scan`
- 실행결과: 출력 없음 (기대 출력: 빈 문자열)

> 💡 **해설.** Scanner는 java.util 패키지에 있으므로 import java.util.Scanner; 로 불러온다. 키보드 입력은 System.in을 넘겨 new Scanner(System.in)으로 준비한다. System.out은 출력용이라 넣으면 컴파일 오류가 난다.

### 확인 2. 입력 메서드 연결  `객관식`

**문제.** 입력할 값과 알맞은 메서드를 바르게 연결한 것은?
① int 정수 ② double 실수 ③ boolean ④ 한 단어 ⑤ 한 줄 전체

- **A.** ① `nextInt()`, ② `nextDouble()`, ③ `nextBoolean()`, ④ `next()`, ⑤ `nextLine()` ✅
- **B.** ① `nextInt()`, ② `nextBoolean()`, ③ `nextDouble()`, ④ `nextLine()`, ⑤ `next()`
- **C.** ① `nextDouble()`, ② `nextInt()`, ③ `nextBoolean()`, ④ `next()`, ⑤ `nextLine()`
- ✅ **정답:** A

> 💡 **해설.** 정수는 nextInt(), 실수는 nextDouble(), 논리값은 nextBoolean(), 공백 없는 한 단어는 next(), Enter 전까지 한 줄 전체는 nextLine()으로 입력받는다.

### 확인 3. 정수 입력  `코드 빈칸`

**문제.** 정수를 입력받아 age 변수에 저장하도록 빈칸을 채우시오. (입력값 25)

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int age = scanner.〔①〕();
        System.out.println(age);
    }
}
```
- ✅ **정답:** ① = `nextInt`
- 보기 토큰: `nextInt` / `nextDouble` / `nextLine` / `next`
- 입력 예:
```
25
```
- 실행결과:
```
25
```

> 💡 **해설.** 정수를 읽는 메서드는 nextInt()다. nextDouble()·nextLine()·next()는 각각 double·String을 돌려주므로 int 변수 age에 바로 저장하면 컴파일 오류가 난다. 입력값 25가 그대로 출력된다.

### 확인 4. 여러 자료형 입력  `객관식`

**문제.** 다음 코드에 25, 175.5, true 를 순서대로 입력하면 실행 결과는?

```java
Scanner scanner = new Scanner(System.in);
int age = scanner.nextInt();
double height = scanner.nextDouble();
boolean student = scanner.nextBoolean();
System.out.println(age);
System.out.println(height);
System.out.println(student);
```

- **A.** `25`, `175.5`, `true` 가 순서대로 각 줄에 출력된다. ✅
- **B.** `25.0`, `175.5`, `true`
- **C.** `25`, `175`, `true`
- ✅ **정답:** A

> 💡 **해설.** 각 입력값이 자료형에 맞는 메서드로 읽혀 age=25, height=175.5, student=true로 저장되고 순서대로 출력된다. int는 25(25.0이 아님), double은 175.5(175이 아님)로 나온다.

### 확인 5. next() 뒤 남은 문장  `객관식`

**문제.** 입력으로 open file을 한 줄에 입력했을 때 실행 결과로 옳은 것은?

```java
Scanner scanner = new Scanner(System.in);
String command = scanner.next();
String rest = scanner.nextLine();

System.out.println("[" + command + "]");
System.out.println("[" + rest + "]");
```

- **A.** `[open file]` / `[]`
- **B.** `[open]` / `[file]`
- **C.** `[open]` / `[ file]` ✅
- **D.** `[]` / `[open file]`
- ✅ **정답:** C

> 💡 **해설.** next()는 open까지만 읽고 공백부터 줄 끝까지는 입력에 남긴다. 이어지는 nextLine()은 남은 ' file'을 읽으므로 앞쪽 공백도 문자열에 포함되어 [ file]이 된다.

### 확인 6. 잘못된 입력 메서드  `객관식`

**문제.** 다음 중 자료형에 맞지 않아 오류가 나는 코드는?

```java
int age = scanner.nextInt();
double height = scanner.nextDouble();
boolean passed = scanner.nextBoolean();
int score = scanner.nextDouble();
String name = scanner.next();
```

- **A.** `int score = scanner.nextDouble();` ✅
- **B.** `double height = scanner.nextDouble();`
- **C.** `String name = scanner.next();`
- ✅ **정답:** A

> 💡 **해설.** nextDouble()의 반환값은 double이므로 int 변수 score에 바로 저장할 수 없어 컴파일 오류(incompatible types)가 난다. 정수를 받으려면 scanner.nextInt()를 써야 한다.

### 확인 7. 숫자 다음 문장 입력  `코드 빈칸`

**문제.** 나이를 입력한 다음 한 줄짜리 주소를 정상적으로 읽도록 빈칸을 채우시오.

```java
Scanner scanner = new Scanner(System.in);
int age = scanner.nextInt();
scanner.〔①〕();
String address = scanner.〔②〕();
System.out.println(address);
```
- ✅ **정답:** ① = `nextLine` , ② = `nextLine`
- 보기 토큰: `nextLine` / `nextLine` / `next` / `nextInt` / `close`
- 입력 예:
```
25
Seoul City
```
- 실행결과:
```
Seoul City
```

> 💡 **해설.** nextInt() 뒤에는 줄바꿈이 남아 있으므로 먼저 nextLine()으로 그 줄바꿈을 비운 뒤, 다시 nextLine()으로 공백이 포함된 한 줄 주소를 읽는다. next()는 공백 앞까지만 읽고, nextInt는 숫자가 아니라 오류가 난다.

### 확인 8. Scanner 변수 일치  `코드 빈칸`

**문제.** 선언한 Scanner 변수 이름에 맞게 빈칸을 채우시오.

```java
Scanner keyboard = new Scanner(System.in);
double weight = 〔①〕.nextDouble();
System.out.println(weight);
```
- ✅ **정답:** ① = `keyboard`
- 보기 토큰: `keyboard` / `scanner` / `Scanner` / `input`
- 입력 예:
```
65.5
```
- 실행결과:
```
65.5
```

> 💡 **해설.** Scanner 객체를 keyboard라는 이름으로 선언했으므로 입력도 keyboard.nextDouble()로 받아야 한다. scanner·input은 선언되지 않은 이름이라 오류, Scanner는 클래스 이름이라 이 자리에 올 수 없다.

### 확인 9. 세 자료형 입력  `코드 빈칸`

**문제.** 활성 여부, 가격, 상품 코드를 순서대로 입력받도록 빈칸을 채우시오.

```java
Scanner scanner = new Scanner(System.in);

boolean active = scanner.〔①〕();
double price = scanner.〔②〕();
String code = scanner.〔③〕();

System.out.println(active);
System.out.println(price);
System.out.println(code);
```
- ✅ **정답:** ① = `nextBoolean` , ② = `nextDouble` , ③ = `next`
- 보기 토큰: `nextBoolean` / `nextDouble` / `next` / `nextInt` / `nextLine`
- 입력 예:
```
true 15.5 A12
```
- 실행결과:
```
true
15.5
A12
```

> 💡 **해설.** 활성 여부는 boolean이라 nextBoolean(), 가격은 실수라 nextDouble(), 상품 코드는 공백 없는 한 단어라 next()로 받는다. 자료형이 맞지 않는 메서드를 쓰면 컴파일 오류나 입력 오류가 나고, nextLine()은 앞 공백까지 읽어 결과가 달라진다.

---

# Part 5. Java초급05 조건분기① if·else

`DEV-JAVA-01-05` · 문제 10개 (코드 빈칸 7 · 객관식 1 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- if로 조건이 참일 때만 코드를 실행한다.
- if-else로 조건에 따라 두 가지 흐름 중 하나를 선택한다.
- 비교·논리 연산자로 조건식을 작성한다.
- 중첩 if로 조건을 단계적으로 검사한다.
- 조건문의 실행 흐름과 자주 발생하는 오류를 이해한다.

## 수업 내용

### Part 1. if 조건문

**개념 설명**

- if는 조건에 따라 코드의 실행 여부를 결정한다.
- 괄호 `( )` 안에는 결과가 true 또는 false인 조건식을 작성한다.
- 조건이 true이면 중괄호 안의 코드를 실행한다.
- 조건이 false이면 중괄호 안의 코드를 건너뛴다.
- 조건문이 끝난 후에는 다음 코드를 계속 실행한다.

**코드 문법**

```java
if (조건식) {
    조건이 true일 때 실행할 코드
}
```

**예제**

```java
int score = 80;

if (score >= 60) {
    System.out.println("합격");
}

System.out.println("검사 완료");
```

**실행 흐름과 결과**

1. `score >= 60`을 계산한다.
2. 결과가 true이므로 "합격"을 출력한다.
3. 조건문이 끝난 후 "검사 완료"를 출력한다.

```
합격
검사 완료
```

score가 50이라면 조건이 false이므로 다음과 같이 출력된다.

```
검사 완료
```

**자주 하는 실수**

조건식에는 boolean 결과가 필요하다.

```java
if (score) { // 오류: score는 int
    System.out.println("실행");
}
```

다음과 같이 비교식을 작성해야 한다.

```java
if (score >= 60) {
    System.out.println("실행");
}
```

### Part 2. if-else 조건문

**개념 설명**

- if-else는 조건에 따라 두 가지 코드 중 하나를 실행한다.
- 조건이 true이면 if 영역을 실행한다.
- 조건이 false이면 else 영역을 실행한다.
- 두 영역이 동시에 실행되는 경우는 없다.
- else에는 별도의 조건식을 작성하지 않는다.

**코드 문법**

```java
if (조건식) {
    조건이 true일 때 실행할 코드
} else {
    조건이 false일 때 실행할 코드
}
```

**예제**

```java
int score = 55;

if (score >= 60) {
    System.out.println("합격");
} else {
    System.out.println("불합격");
}
```

**실행 흐름과 결과**

1. `score >= 60`을 계산한다.
2. `55 >= 60`은 false다.
3. if 영역을 건너뛴다.
4. else 영역의 "불합격"을 출력한다.

```
불합격
```

**자주 하는 실수**

else 뒤에는 조건식을 작성하지 않는다.

```java
if (score >= 60) {
    System.out.println("합격");
} else (score < 60) { // 오류
    System.out.println("불합격");
}
```

올바른 코드는 다음과 같다.

```java
if (score >= 60) {
    System.out.println("합격");
} else {
    System.out.println("불합격");
}
```

여러 조건을 순서대로 검사하는 else if는 다음 파트에서 학습한다.

### Part 3. 비교·논리 연산자를 사용한 조건식

**개념 설명**

- 조건식은 비교 연산자와 논리 연산자로 작성할 수 있다.
- `&&`는 모든 조건이 참일 때만 전체 결과가 참이다.
- `||`는 하나 이상의 조건이 참이면 전체 결과가 참이다.
- `!`는 기존 조건의 결과를 반대로 바꾼다.
- 복잡한 조건은 괄호를 사용하면 의미가 명확해진다.

**예제**

```java
int age = 20;
boolean hasTicket = true;

if (age >= 18 && hasTicket) {
    System.out.println("입장 가능");
} else {
    System.out.println("입장 불가");
}
```

**실행 흐름과 결과**

1. `age >= 18`은 true다.
2. `hasTicket`도 true다.
3. `true && true`의 결과는 true다.
4. "입장 가능"을 출력한다.

```
입장 가능
```

**다른 조건 예제**

```java
boolean weekend = false;
boolean holiday = true;

if (weekend || holiday) {
    System.out.println("휴일");
} else {
    System.out.println("평일");
}
```

```
휴일
```

**자주 하는 실수**

대입 연산자 `=`와 비교 연산자 `==`를 혼동하지 않아야 한다.

```java
boolean member = true;

if (member == true) {
    System.out.println("회원");
}
```

boolean 변수는 다음처럼 직접 조건으로 사용하는 것이 더 간단하다.

```java
if (member) {
    System.out.println("회원");
}
```

반대 조건은 `!`를 사용한다.

```java
if (!member) {
    System.out.println("비회원");
}
```

### Part 4. 중첩 if

**개념 설명**

- if 내부에 다른 if를 작성할 수 있다.
- 이를 중첩 if라고 한다.
- 바깥쪽 조건이 true일 때만 안쪽 조건을 검사한다.
- 여러 조건을 단계적으로 확인할 때 사용할 수 있다.
- 중첩이 많아지면 실행 흐름이 복잡해지므로 필요한 경우에만 사용한다.

**예제**

```java
int age = 20;
boolean hasTicket = true;

if (age >= 18) {
    System.out.println("나이 확인 완료");

    if (hasTicket) {
        System.out.println("입장 가능");
    }
}
```

**실행 흐름과 결과**

1. `age >= 18`을 검사한다.
2. 결과가 true이므로 "나이 확인 완료"를 출력한다.
3. 안쪽에서 `hasTicket`을 검사한다.
4. 결과가 true이므로 "입장 가능"을 출력한다.

```
나이 확인 완료
입장 가능
```

age가 18보다 작으면 안쪽 if는 검사하지 않는다.

**자주 하는 실수**

중괄호를 생략하면 코드가 어느 조건에 포함되는지 알아보기 어려워진다.

```java
if (age >= 18)
    System.out.println("성인");
    System.out.println("확인 완료");
```

실제로는 첫 번째 출력문만 if에 포함된다. 초급 단계에서는 항상 중괄호를 작성하는 것이 좋다.

```java
if (age >= 18) {
    System.out.println("성인");
    System.out.println("확인 완료");
}
```

## 종합 예제

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int score = scanner.nextInt();

        if (score >= 60) {
            System.out.println("합격");
        } else {
            System.out.println("불합격");
        }

        System.out.println("채점 완료");

        scanner.close();
    }
}
```

입력:

```
75
```

실행 결과:

```
합격
채점 완료
```

입력값이 40이라면 다음과 같이 출력된다.

```
불합격
채점 완료
```

## 다음으로

다음 학습 내용은 [Part 6「조건분기② else if·switch·삼항연산자」](/dev/lessons/DEV-JAVA-01-06)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 5)

### 확인 1. if 조건 완성  `코드 빈칸`

**문제.** score가 60 이상일 때 "합격"을 출력하도록 빈칸을 채우시오.

```java
int score = 75;

if (score 〔①〕 60) {
    System.out.println("합격");
}
```
- ✅ **정답:** ① = `>=`
- 보기 토큰: `>=` / `==` / `=` / `<=`
- 실행결과:
```
합격
```

> 💡 **해설.** "60 이상"은 크거나 같음이므로 >=를 쓴다. score가 75라 75 >= 60은 true여서 합격이 출력된다. ==나 <=는 75에 대해 false라 아무것도 출력되지 않고, =는 대입이라 조건식(boolean)이 아니어서 컴파일 오류가 난다.

### 확인 2. if-else 완성  `코드 빈칸`

**문제.** age가 18 이상이면 "성인", 아니면 "미성년자"를 출력하도록 빈칸을 채우시오.

```java
int age = 16;

if (age 〔①〕 18) {
    System.out.println("성인");
} 〔②〕 {
    System.out.println("미성년자");
}
```
- ✅ **정답:** ① = `>=` , ② = `else`
- 보기 토큰: `>=` / `<` / `else` / `if`
- 실행결과:
```
미성년자
```

> 💡 **해설.** 조건은 "18 이상"이므로 >=, 조건이 거짓일 때 실행할 블록은 else다. age가 16이라 16 >= 18은 false여서 else의 미성년자가 출력된다. <를 쓰면 16 < 18이 true라 성인이 출력되고, else 자리에 if를 넣으면 문법 오류가 난다.

### 확인 3. 미리 계산한 조건 사용  `코드 빈칸`

**문제.** 미리 계산해 둔 hot 변수를 if 조건식에 사용하여 「냉방 시작」을 출력하도록 빈칸을 채우시오.

```java
int temperature = 28;
boolean hot = temperature > 25;

if (〔①〕) {
    System.out.println("냉방 시작");
}
```
- ✅ **정답:** ① = `hot`
- 보기 토큰: `hot` / `!hot` / `temperature` / `"hot"`
- 실행결과:
```
냉방 시작
```

> 💡 **해설.** hot에는 temperature > 25의 결과인 true가 저장되어 있다. if 조건식에는 boolean 값인 hot을 그대로 사용할 수 있다. !hot은 false가 되어 출력되지 않고, temperature는 int라 조건식에 바로 쓸 수 없으며, "hot"은 문자열이라 컴파일 오류가 난다.

### 확인 4. 쿠폰 사용 조건  `코드 빈칸`

**문제.** 주문 금액이 3만원 이상이면서 쿠폰이 있을 때만 쿠폰 사용 가능을 출력하도록 빈칸을 채우시오.

```java
int orderAmount = 35000;
boolean hasCoupon = false;

if (orderAmount >= 30000 〔①〕 hasCoupon) {
    System.out.println("쿠폰 사용 가능");
} else {
    System.out.println("쿠폰 사용 불가");
}
```
- ✅ **정답:** ① = `&&`
- 보기 토큰: `&&` / `||` / `!` / `+`
- 실행결과:
```
쿠폰 사용 불가
```

> 💡 **해설.** 두 조건을 모두 만족해야 하므로 그리고를 뜻하는 &&를 쓴다. 금액은 3만원 이상이지만 쿠폰이 없어(false) &&는 거짓이 되어 「쿠폰 사용 불가」가 출력된다. ||는 하나만 참이어도 참이라 「쿠폰 사용 가능」이 나오고, !·+는 이 자리에 맞지 않는다.

### 확인 5. if 밖의 코드 확인  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
int humidity = 40;

if (humidity >= 70) {
    System.out.println("습함");
}

System.out.println("측정 종료");
```

- **A.** `습함`, `측정 종료`
- **B.** `측정 종료` ✅
- **C.** `습함`
- **D.** 빈 출력
- ✅ **정답:** B

> 💡 **해설.** 습도가 40이라 70 이상 조건이 거짓이므로 if 안의 「습함」은 출력되지 않는다. if 밖의 문장은 조건과 무관하게 실행되므로 「측정 종료」만 출력된다.

### 확인 6. 비밀번호 길이 비교  `코드 빈칸`

**문제.** 비밀번호 길이가 8과 같은지 비교하도록 빈칸을 채우시오.

```java
int passwordLength = 8;

if (passwordLength 〔①〕 8) {
    System.out.println("기준 길이");
} else {
    System.out.println("다른 길이");
}
```
- ✅ **정답:** ① = `==`
- 보기 토큰: `==` / `!=` / `>` / `=`
- 실행결과:
```
기준 길이
```

> 💡 **해설.** 값이 같은지는 == 로 비교한다. 8 == 8은 참이라 「기준 길이」가 출력된다. !=와 >는 거짓이 되어 「다른 길이」가 나오고, =는 대입이라 조건 자리에서 컴파일 오류가 난다.

### 확인 7. 입력받은 속도 판정  `코드 빈칸`

**문제.** 속도를 입력받아 80을 초과하면 "과속", 그렇지 않으면 "정상"을 출력하도록 빈칸에 연산자를 채우시오.

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int speed = scanner.nextInt();

        if (speed 〔①〕 80) {
            System.out.println("과속");
        } else {
            System.out.println("정상");
        }
    }
}
```
- ✅ **정답:** ① = `>`
- 보기 토큰: `>` / `<` / `<=` / `==`
- 입력 예:
```
95
```
- 실행결과:
```
과속
```

> 💡 **해설.** '초과'는 크다는 뜻이므로 > 를 쓴다. speed가 95이면 95 > 80이 true라 「과속」이 출력된다. <·<=·==는 모두 false가 되어 else의 「정상」이 출력되므로 답이 아니다.

### 확인 8. 잔액과 카드 상태 중첩 검사  `순서 배열`

**문제.** balance 선언 → cardActive 선언 → 카드 활성 검사 → 잔액 검사 → 출력 순서로 배열하시오. 카드가 활성 상태이고 잔액이 5000 이상이면 「결제 가능」만 출력한다.

- ✅ **정답 순서:**
```
int balance = 7000;
boolean cardActive = true;
if (cardActive) {
    if (balance >= 5000) {
        System.out.println("결제 가능");
    }
}
```

- ❌ **오답 카드(제외):**
```
if (balance < 5000) {
System.out.println("결제 불가");
```

> 💡 **해설.** 바깥 if로 카드 활성 여부를 확인하고, 그 안에서 잔액이 5000 이상인지 검사한다. balance < 5000은 조건이 반대이며, 「결제 불가」는 문제에서 요구한 출력이 아니다.

### 확인 9. Scanner 전체 코드 조립  `순서 배열`

**문제.** import → 클래스 선언 → main 선언 → Scanner 생성 → 정수 입력 → 조건 판정과 출력 → Scanner 종료 순서로 배열하시오. 0 이상이면 「0 이상」, 아니면 「음수」를 출력하며, Scanner는 판정과 출력이 모두 끝난 뒤 닫는다.

- ✅ **정답 순서:**
```
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();
        if (number >= 0) {
            System.out.println("0 이상");
        } else {
            System.out.println("음수");
        }
        scanner.close();
    }
}
```

- ❌ **오답 카드(제외):**
```
int number = scanner.nextLine();
if (number > 0) {
```

> 💡 **해설.** import → 클래스 선언 → main 선언 → Scanner 준비 → 정수 입력 → if 조건 → 참일 때 0 이상 → else → 거짓일 때 음수 → 조건 닫기 → close → main 닫기 → 클래스 닫기 순서다.

### 확인 10. 짝수·홀수 완성  `코드 빈칸`

**문제.** 정수를 입력받아 짝수이면 "짝수", 아니면 "홀수"를 출력하도록 빈칸을 채우시오. (입력값 4)

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number = scanner.nextInt();

        if (number 〔①〕 2 〔②〕 0) {
            System.out.println("짝수");
        } 〔③〕 {
            System.out.println("홀수");
        }

        scanner.〔④〕();
    }
}
```
- ✅ **정답:** ① = `%` , ② = `==` , ③ = `else` , ④ = `close`
- 보기 토큰: `%` / `==` / `else` / `close` / `/` / `!=` / `if` / `end`
- 입력 예:
```
4
```
- 실행결과:
```
짝수
```

> 💡 **해설.** 짝수 판정은 2로 나눈 나머지(%)가 0과 같은지(==)로 한다. number가 4라 4 % 2 == 0은 true여서 짝수가 출력된다. 조건이 거짓일 때 블록은 else, Scanner 종료는 close()다. /는 몫이라 판정이 달라지고, !=는 홀수가 되며, end는 없는 메서드라 컴파일 오류가 난다.

---

# Part 6. Java초급06 조건분기② else if·switch·삼항연산자

`DEV-JAVA-01-06` · 문제 7개 (코드 빈칸 3 · 객관식 3 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- else if로 여러 조건을 순서대로 검사한다.
- switch로 하나의 값을 여러 경우와 비교한다.
- case, break, default의 역할을 구분한다.
- 화살표 switch 문법을 사용할 수 있다.
- 삼항 연산자로 간단한 두 가지 결과를 선택한다.

## 수업 내용

### Part 1. else if

**개념 설명**

- else if는 세 가지 이상의 실행 흐름이 필요할 때 사용한다.
- 조건은 위에서 아래로 순서대로 검사한다.
- 처음으로 true가 된 영역만 실행하고 나머지는 검사하지 않는다.
- 모든 조건이 false이면 마지막 else가 실행된다.
- 마지막 else는 필요하지 않으면 생략할 수 있다.

**코드 문법**

```java
if (조건식1) {
    조건식1이 true일 때 실행
} else if (조건식2) {
    조건식2가 true일 때 실행
} else {
    모든 조건이 false일 때 실행
}
```

**예제**

```java
int score = 85;

if (score >= 90) {
    System.out.println("A");
} else if (score >= 80) {
    System.out.println("B");
} else if (score >= 70) {
    System.out.println("C");
} else {
    System.out.println("D");
}
```

**실행 흐름과 결과**

1. `85 >= 90`은 false다.
2. `85 >= 80`은 true다.
3. "B"를 출력한다.
4. 아래의 조건은 더 이상 검사하지 않는다.

```
B
```

**조건 순서**

범위가 좁은 조건을 먼저 작성해야 한다.

```java
if (score >= 60) {
    System.out.println("합격");
} else if (score >= 90) {
    System.out.println("우수");
}
```

95를 입력해도 첫 번째 조건이 먼저 참이므로 "우수"는 실행되지 않는다. 올바른 순서는 다음과 같다.

```java
if (score >= 90) {
    System.out.println("우수");
} else if (score >= 60) {
    System.out.println("합격");
} else {
    System.out.println("불합격");
}
```

**자주 하는 실수**

```java
elseif (score >= 80) { } // 오류
else (score >= 80) { }   // 오류
```

Java에서는 반드시 다음과 같이 작성한다.

```java
else if (score >= 80) { }
```

### Part 2. switch

**개념 설명**

- switch는 하나의 값을 여러 case와 비교할 때 사용한다.
- 일치하는 case를 찾으면 해당 위치부터 코드를 실행한다.
- 전통적인 문법에서는 break로 switch를 종료해야 한다.
- break가 없으면 다음 case까지 이어서 실행될 수 있다.
- 어떤 case와도 일치하지 않으면 default가 실행된다.
- 이번 파트에서는 int 값을 사용하는 기본 형태를 학습한다.

**기본 문법**

```java
switch (값) {
    case 값1:
        실행할 코드
        break;
    case 값2:
        실행할 코드
        break;
    default:
        일치하는 값이 없을 때 실행
}
```

**예제**

```java
int menu = 2;

switch (menu) {
    case 1:
        System.out.println("조회");
        break;
    case 2:
        System.out.println("등록");
        break;
    case 3:
        System.out.println("삭제");
        break;
    default:
        System.out.println("잘못된 메뉴");
}
```

**실행 흐름과 결과**

1. `menu`에 저장된 값은 2다.
2. `case 1`과 일치하지 않는다.
3. `case 2`와 일치하므로 "등록"을 출력한다.
4. `break`를 만나 switch를 종료한다.

```
등록
```

**break를 빠뜨린 경우**

```java
int menu = 1;

switch (menu) {
    case 1:
        System.out.println("조회");
    case 2:
        System.out.println("등록");
        break;
    default:
        System.out.println("잘못된 메뉴");
}
```

실행 결과:

```
조회
등록
```

`case 1`에 break가 없으므로 case 2까지 이어서 실행된다.

**화살표 switch**

Java 17에서는 화살표 `->`를 사용하는 형태도 사용할 수 있다.

```java
int menu = 2;

switch (menu) {
    case 1 -> System.out.println("조회");
    case 2 -> System.out.println("등록");
    case 3 -> System.out.println("삭제");
    default -> System.out.println("잘못된 메뉴");
}
```

화살표 형태는 다음 case로 이어지지 않으므로 break가 필요하지 않다.

**자주 하는 실수**

콜론 문법과 화살표 문법을 섞지 않는다.

```java
case 1:
    System.out.println("조회");
    break;
case 1 -> System.out.println("조회");
```

또한 case 값은 중복해서 작성할 수 없다.

### Part 3. 삼항 연산자

**개념 설명**

- 삼항 연산자는 조건에 따라 두 값 중 하나를 선택한다.
- `?` 앞에는 결과가 true 또는 false인 조건식을 작성한다.
- 조건이 true이면 `?` 뒤의 값을 선택한다.
- 조건이 false이면 `:` 뒤의 값을 선택한다.
- 간단한 if-else를 한 줄로 표현할 때 사용한다.

**코드 문법**

```java
조건식 ? 참일_때_값 : 거짓일_때_값
```

결과를 변수에 저장할 수 있다.

```java
String result = score >= 60 ? "합격" : "불합격";
```

**예제**

```java
int age = 16;

String result = age >= 18 ? "성인" : "미성년자";

System.out.println(result);
```

**실행 흐름과 결과**

1. `age >= 18`을 계산한다.
2. `16 >= 18`은 false다.
3. `:` 뒤의 "미성년자"를 선택한다.
4. 선택된 값을 result에 저장한다.

```
미성년자
```

**if-else와 비교**

다음 두 코드는 같은 결과를 만든다.

```java
String result;

if (score >= 60) {
    result = "합격";
} else {
    result = "불합격";
}
```

```java
String result = score >= 60 ? "합격" : "불합격";
```

**자주 하는 실수**

`?`와 `:`의 위치를 바꾸면 안 된다.

```java
String result = score >= 60 : "합격" ? "불합격"; // 오류
```

올바른 형태:

```java
String result = score >= 60 ? "합격" : "불합격";
```

삼항 연산자를 여러 번 중첩하면 읽기 어려워진다.

```java
String result = score >= 90 ? "A"
        : score >= 80 ? "B"
        : score >= 70 ? "C"
        : "D";
```

이런 경우에는 else if를 사용하는 것이 더 명확하다.

## 다음으로

다음 학습 내용은 [Part 7「반복문① for」](/dev/lessons/DEV-JAVA-01-07)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 6)

### 확인 1. 택배 무게 분류  `객관식`

**문제.** 무게가 5 이하이면 소형, 15 이하이면 중형, 나머지는 대형을 출력하도록 빈칸에 들어갈 코드 한 줄을 고르시오.

```java
int weight = 12;

if (weight <= 5) {
    System.out.println("소형");
[①]
    System.out.println("중형");
} else {
    System.out.println("대형");
}
```

- **A.** `} else if (weight <= 15) {` ✅
- **B.** `} if (weight <= 15) {`
- **C.** `} else if (weight >= 15) {`
- **D.** `} else {`
- ✅ **정답:** A

> 💡 **해설.** else if를 사용해야 앞 조건이 거짓일 때만 다음 조건을 검사한다. weight가 12이면 5 이하가 아니고 15 이하이므로 「중형」이 출력된다. else if 대신 별도의 if를 쓰면 5 이하인 값도 두 번 검사되고, 15 이상으로 조건을 뒤집으면 「대형」이 나오며, else만 쓰면 else가 두 개가 되어 컴파일 오류다.

### 확인 2. 배터리 상태 분류  `순서 배열`

**문제.** 배터리 값을 선언 → 높은 상태 검사 → 보통 상태 검사 → 낮은 상태 처리 순서로 배열하시오.

- ✅ **정답 순서:**
```
int battery = 27;
if (battery >= 80) {
    System.out.println("충분");
} else if (battery >= 30) {
    System.out.println("보통");
} else {
    System.out.println("충전 필요");
}
```

- ❌ **오답 카드(제외):**
```
if (battery >= 20) {
System.out.println("충전 완료");
```

> 💡 **해설.** battery 값을 선언하고 높은 상태부터 else if로 차례로 검사한다. 27은 80 이상도 30 이상도 아니므로 마지막 else의 「충전 필요」가 출력된다.

### 확인 3. switch 기본 문법 완성  `코드 빈칸`

**문제.** day 값과 일치하는 요일을 출력하도록 빈칸을 채우시오. (day = 3)

```java
int day = 3;

switch (day) {
    〔①〕 1:
        System.out.println("월요일");
        〔②〕;
    〔③〕 3:
        System.out.println("수요일");
        〔④〕;
    〔⑤〕:
        System.out.println("다른 요일");
}
```
- ✅ **정답:** ① = `case` , ② = `break` , ③ = `case` , ④ = `break` , ⑤ = `default`
- 보기 토큰: `case` / `case` / `break` / `break` / `default` / `if` / `continue` / `switch`
- 실행결과:
```
수요일
```

> 💡 **해설.** 비교할 값 앞에는 case, 각 처리를 끝낼 때는 break, 일치하는 값이 없을 때는 default를 쓴다. day가 3이라 case 3이 실행되어 수요일을 출력하고 break로 switch를 빠져나온다. continue는 반복문 키워드이고 if는 case 자리에 쓸 수 없다.

### 확인 4. 문자열 switch의 fall-through  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
String command = "open";

switch (command) {
    case "open":
        System.out.println("열기");
    case "save":
        System.out.println("저장");
        break;
    default:
        System.out.println("알 수 없음");
}
```

- **A.** `열기`, `저장` ✅
- **B.** `열기`
- **C.** `저장`
- **D.** `열기`, `알 수 없음`
- ✅ **정답:** A

> 💡 **해설.** command가 open이라 case "open"이 실행되어 「열기」를 출력한다. break가 없으면 다음 case로 넘어가므로 case "save"의 「저장」도 출력되고, 그 뒤 break로 switch를 빠져나온다. 그래서 열기와 저장이 함께 출력된다.

### 확인 5. 화면 모드 선택  `코드 빈칸`

**문제.** 18시 전이면 "주간", 그렇지 않으면 "야간"이 저장되도록 삼항 연산자를 완성하시오.

```java
int hour = 21;
String mode = hour 〔①〕 18 〔②〕 "주간" 〔③〕 "야간";

System.out.println(mode);
```
- ✅ **정답:** ① = `<` , ② = `?` , ③ = `:`
- 보기 토큰: `<` / `?` / `:` / `>` / `->` / `else`
- 실행결과:
```
야간
```

> 💡 **해설.** 삼항 연산자는 조건 ? 참일 때 값 : 거짓일 때 값 형태다. hour가 21이면 21 < 18이 false이므로 「야간」이 저장된다. >는 참이 되어 「주간」이 나오고, ->·else는 삼항 연산자 기호가 아니라 컴파일 오류가 난다.

### 확인 6. if-else를 삼항 연산자로 변경  `객관식`

**문제.** 다음 if-else와 같은 결과를 만드는 삼항 연산자 코드는?

```java
int age = 16;
String result;

if (age >= 18) {
    result = "성인";
} else {
    result = "미성년자";
}
```

- **A.** `String result = age >= 18 ? "성인" : "미성년자";` ✅
- **B.** `String result = age >= 18 : "성인" ? "미성년자";`
- **C.** `String result = age = 18 ? "성인" : "미성년자";`
- **D.** `String result = age >= 18 ? "미성년자" : "성인";`
- ✅ **정답:** A

> 💡 **해설.** 조건이 true이면 ? 뒤의 성인, false이면 : 뒤의 미성년자가 선택되어야 한다. B는 ?와 :의 위치가 바뀌어 오류, C는 = 대입이라 조건이 아니고, D는 참/거짓의 값이 뒤바뀌었다.

### 확인 7. 입력값을 else-if로 분류  `코드 빈칸`

**문제.** 공기질 수치를 입력받아 50 이하는 좋음, 100 이하는 보통, 나머지는 나쁨을 출력하도록 빈칸을 채우시오.

```java
Scanner scanner = new Scanner(System.in);
int airQuality = scanner.〔①〕();

if (airQuality 〔②〕 50) {
    System.out.println("좋음");
} else if (airQuality 〔③〕 100) {
    System.out.println("보통");
} else {
    System.out.println("나쁨");
}
```
- ✅ **정답:** ① = `nextInt` , ② = `<=` , ③ = `<=`
- 보기 토큰: `nextInt` / `nextDouble` / `<=` / `<=` / `>=` / `>`
- 입력 예:
```
51
```
- 실행결과:
```
보통
```

> 💡 **해설.** 수치는 정수라 nextInt()로 받고, 「이하」는 작거나 같음이므로 <=로 비교한다. 입력이 51이면 50 이하가 아니고 100 이하라 「보통」이 출력된다. >=·>는 조건이 반대로 되어 다른 결과가 나온다.

---

# Part 7. Java초급07 반복문① for

`DEV-JAVA-01-07` · 문제 8개 (코드 빈칸 5 · 객관식 1 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- for문의 초기식·조건식·증감식을 구분한다.
- 코드를 정해진 횟수만큼 반복한다.
- 반복 순서를 증가 또는 감소시킬 수 있다.
- 반복문으로 합계와 개수를 계산한다.
- 반복 횟수와 조건식의 경계를 정확하게 작성한다.

## 수업 내용

### Part 1. for문의 기본 구조

**개념 설명**

- for문은 코드를 일정한 횟수만큼 반복할 때 사용한다.
- 소괄호 안에는 초기식, 조건식, 증감식을 작성한다.
- 초기식은 반복을 시작하기 전에 한 번만 실행된다.
- 조건식이 true인 동안 중괄호 내부를 반복한다.
- 한 번 실행할 때마다 증감식이 실행된 후 조건을 다시 검사한다.

**코드 문법 분해**

```java
for (int i = 1; i <= 3; i++) {
    System.out.println(i);
}
```

| 부분 | 의미 |
|---|---|
| `int i = 1` | 반복 변수 i를 만들고 1부터 시작 |
| `i <= 3` | i가 3 이하인 동안 반복 |
| `i++` | 한 번 반복할 때마다 i를 1 증가 |
| `{ }` | 반복해서 실행할 코드 |

**실행 흐름**

| 순서 | i | 조건 결과 | 실행 |
|---|---|---|---|
| 1 | 1 | `1 <= 3` → true | 1 출력 |
| 2 | 2 | `2 <= 3` → true | 2 출력 |
| 3 | 3 | `3 <= 3` → true | 3 출력 |
| 4 | 4 | `4 <= 3` → false | 반복 종료 |

**실행 결과**

```
1
2
3
```

**문제와 다른 예제**

```java
for (int count = 0; count < 3; count++) {
    System.out.println("Java");
}
```

```
Java
Java
Java
```

count는 0, 1, 2일 때 실행되므로 총 3번 반복한다.

**자주 하는 실수**

for문 뒤에 세미콜론을 붙이지 않는다.

```java
for (int i = 1; i <= 3; i++); {
    System.out.println("Java");
}
```

세미콜론 때문에 반복할 코드가 없는 for문이 된다. 올바른 코드는 다음과 같다.

```java
for (int i = 1; i <= 3; i++) {
    System.out.println("Java");
}
```

### Part 2. 증가·감소·간격 조절

**개념 설명**

- 반복 변수는 반드시 1씩 증가할 필요가 없다.
- `i--`를 사용하면 값을 1씩 감소시킬 수 있다.
- `i += 2`처럼 작성하면 2씩 증가시킬 수 있다.
- 초기값과 조건식, 증감식은 같은 방향으로 작성해야 한다.
- 증감 방향이 조건과 맞지 않으면 반복이 끝나지 않을 수 있다.

**1씩 증가**

```java
for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}
```

```
1
2
3
4
5
```

**1씩 감소**

```java
for (int i = 5; i >= 1; i--) {
    System.out.println(i);
}
```

```
5
4
3
2
1
```

**2씩 증가**

```java
for (int i = 0; i <= 6; i += 2) {
    System.out.println(i);
}
```

```
0
2
4
6
```

**실행 흐름**

- 시작값 0
- → 0 출력
- → 2 출력
- → 4 출력
- → 6 출력
- → 8은 조건을 만족하지 않으므로 종료

**자주 하는 실수**

다음 반복문은 i가 계속 감소하므로 종료되지 않는다.

```java
for (int i = 1; i <= 5; i--) {
    System.out.println(i);
}
```

올바른 증감 방향은 다음과 같다.

```java
for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}
```

### Part 3. 반복 횟수와 범위

**개념 설명**

- `<`와 `<=`에 따라 마지막으로 반복하는 값이 달라진다.
- `i < 5`는 i가 5가 되기 전에 종료한다.
- `i <= 5`는 i가 5일 때도 실행한다.
- 반복 횟수를 잘못 계산하면 한 번 적거나 많이 실행될 수 있다.
- 이러한 오류를 경계값 오류 또는 오프바이원 오류라고 한다.

**두 조건의 차이**

```java
for (int i = 1; i < 5; i++) {
    System.out.println(i);
}
```

```
1
2
3
4
```

```java
for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}
```

```
1
2
3
4
5
```

**정해진 횟수만 반복**

다음 형태는 0부터 시작하여 정확히 5번 반복한다.

```java
for (int i = 0; i < 5; i++) {
    System.out.println("반복");
}
```

i의 값은 다음과 같이 변한다.

```
0, 1, 2, 3, 4
```

**자주 하는 실수**

다음 코드는 5번이 아니라 6번 실행된다.

```java
for (int i = 0; i <= 5; i++) {
    System.out.println("반복");
}
```

i가 0, 1, 2, 3, 4, 5일 때 실행되기 때문이다.

### Part 4. 합계와 개수 계산

**개념 설명**

- 반복문 밖에 변수를 만들면 반복 결과를 계속 누적할 수 있다.
- 합계를 계산할 변수는 일반적으로 0으로 초기화한다.
- 반복할 때마다 현재 값을 합계 변수에 더한다.
- 조건에 맞는 횟수를 계산할 때는 개수 변수를 1씩 증가시킨다.
- 누적 변수는 반복문이 시작될 때마다 다시 만들어지지 않도록 밖에 선언한다.

**합계 계산**

```java
int sum = 0;

for (int i = 1; i <= 5; i++) {
    sum += i;
}

System.out.println(sum);
```

**실행 흐름**

- `sum = 0`
- `sum = 0 + 1` → 1
- `sum = 1 + 2` → 3
- `sum = 3 + 3` → 6
- `sum = 6 + 4` → 10
- `sum = 10 + 5` → 15

**실행 결과**

```
15
```

**조건에 맞는 개수 계산**

```java
int count = 0;

for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
        count++;
    }
}

System.out.println(count);
```

1부터 10까지의 짝수는 2, 4, 6, 8, 10이므로 결과는 다음과 같다.

```
5
```

**자주 하는 실수**

누적 변수를 반복문 내부에서 초기화하면 합계가 유지되지 않는다.

```java
for (int i = 1; i <= 5; i++) {
    int sum = 0;
    sum += i;
}
```

올바른 코드는 반복문 밖에서 sum을 선언한다.

```java
int sum = 0;

for (int i = 1; i <= 5; i++) {
    sum += i;
}
```

## 다음으로

다음 학습 내용은 [Part 8「반복문② while·do-while」](/dev/lessons/DEV-JAVA-01-08)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 7)

### 확인 1. 2부터 6까지 반복  `코드 빈칸`

**문제.** 2부터 6까지 출력하도록 빈칸을 채우시오.

```java
for (int i = 〔①〕; i 〔②〕 6; i〔③〕) {
    System.out.println(i);
}
```
- ✅ **정답:** ① = `2` , ② = `<=` , ③ = `++`
- 보기 토큰: `2` / `<=` / `++` / `1` / `<` / `--`
- 실행결과:
```
2
3
4
5
6
```

> 💡 **해설.** 2부터 시작하므로 초깃값은 2, 6까지 포함하므로 조건은 <=, 1씩 늘리므로 ++를 쓴다. 1부터 시작하면 1이 먼저 나오고, <는 6이 빠지며, --는 값이 줄어 무한 반복이 된다.

### 확인 2. 세제곱 출력  `코드 빈칸`

**문제.** 2부터 4까지 각 수의 세제곱을 출력하도록 빈칸을 채우시오.

```java
for (int number = 〔①〕; number 〔②〕 4; number〔③〕) {
    System.out.println(number 〔④〕 number 〔⑤〕 number);
}
```
- ✅ **정답:** ① = `2` , ② = `<=` , ③ = `++` , ④ = `*` , ⑤ = `*`
- 보기 토큰: `2` / `<=` / `++` / `*` / `*` / `1` / `<` / `+`
- 실행결과:
```
8
27
64
```

> 💡 **해설.** 2부터 4까지 반복하며 number * number * number로 세제곱을 구한다. 2³=8, 3³=27, 4³=64다. 1부터 시작하거나 <를 쓰면 범위가 달라지고, +를 쓰면 곱이 아니라 합이 되어 결과가 달라진다.

### 확인 3. 3씩 감소  `코드 빈칸`

**문제.** 12부터 3까지 3씩 감소하며 출력하도록 빈칸을 채우시오.

```java
for (int number = 12; number 〔①〕 3; number 〔②〕 3) {
    System.out.println(number);
}
```
- ✅ **정답:** ① = `>=` , ② = `-=`
- 보기 토큰: `>=` / `>` / `<=` / `==` / `-=` / `+=` / `--` / `/=`
- 실행결과:
```
12
9
6
3
```

> 💡 **해설.** 3까지 포함하려면 조건은 >=이고, 3씩 줄이므로 -=를 쓴다. 12, 9, 6, 3이 출력된다. >는 3이 빠지고, +=는 값이 늘어 무한 반복, --는 1씩 줄어 결과가 달라진다.

### 확인 4. 반복 범위 코드 선택  `객관식`

**문제.** 2, 5, 8, 11을 출력하는 for문 선언 한 줄로 옳은 것은?

- **A.** `for (int n = 2; n < 11; n += 3) {`
- **B.** `for (int n = 2; n <= 11; n += 3) {` ✅
- **C.** `for (int n = 2; n <= 11; n++) {`
- **D.** `for (int n = 3; n <= 11; n += 2) {`
- ✅ **정답:** B

> 💡 **해설.** 2에서 시작해 11까지 포함하며 3씩 늘려야 2, 5, 8, 11이 된다. n < 11은 11이 빠지고, n++는 2부터 11까지 모두 출력하며, n = 3부터 2씩 늘리면 홀수만 나온다.

### 확인 5. 두 배씩 증가하는 for문 조립  `순서 배열`

**문제.** 초깃값 선언 → 조건 검사 → 두 배 증가 순서로 배열하여 2, 4, 8, 16을 출력하시오.

- ✅ **정답 순서:**
```
for (int seats = 2; seats <= 16; seats *= 2) {
    System.out.println(seats);
}
```

- ❌ **오답 카드(제외):**
```
for (int seats = 2; seats < 16; seats += 2) {
System.out.println(seats * 2);
```

> 💡 **해설.** 초깃값 2에서 시작해 16 이하인 동안 seats를 두 배로 늘리며 출력한다. 2, 4, 8, 16이 출력된다.

### 확인 6. 누적 곱  `코드 빈칸`

**문제.** 1부터 4까지 곱한 값을 계산하도록 빈칸을 채우시오.

```java
int product = 〔①〕;

for (int n = 1; n <= 4; n++) {
    product 〔②〕 n;
}

System.out.println(product);
```
- ✅ **정답:** ① = `1` , ② = `*=`
- 보기 토큰: `1` / `*=` / `0` / `4` / `-1` / `+=` / `-=` / `/=`
- 실행결과:
```
24
```

> 💡 **해설.** 곱셈의 시작값은 1이어야 하고, 값을 곱해 누적하므로 *=를 쓴다. 1 × 1 × 2 × 3 × 4 = 24다. 0으로 시작하면 계속 0이고, +=는 합이 되어 11, /=는 0이 된다.

### 확인 7. 4의 배수 개수  `코드 빈칸`

**문제.** 1부터 20까지 4의 배수 개수를 세도록 빈칸을 채우시오.

```java
int matches = 0;

for (int n = 1; n <= 20; n++) {
    if (n 〔①〕 4 〔②〕 0) {
        matches〔③〕;
    }
}

System.out.println(matches);
```
- ✅ **정답:** ① = `%` , ② = `==` , ③ = `++`
- 보기 토큰: `%` / `/` / `*` / `+` / `==` / `!=` / `>=` / `=` / `++` / `--` / `+= 2`
- 실행결과:
```
5
```

> 💡 **해설.** 4로 나눈 나머지가 0이면 4의 배수이므로 n % 4 == 0으로 확인하고 matches++로 센다. 4, 8, 12, 16, 20 → 5개다. /는 몫이라 조건이 달라지고, !=는 배수가 아닌 개수, =는 대입이라 오류가 난다.

### 확인 8. 입력값의 배수 출력  `순서 배열`

**문제.** 정수 base를 입력받아 base × 1부터 base × 3까지 출력하는 프로그램을 카드로 완성하시오. (입력이 4이면 4, 8, 12)

- ✅ **정답 순서:**
```
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int base = scanner.nextInt();
        for (int n = 1; n <= 3; n++) {
            System.out.println(base * n);
        }
    }
}
```

- ❌ **오답 카드(제외):**
```
System.out.println(base + n);
for (int n = 0; n < 3; n++) {
```

> 💡 **해설.** base를 입력받아 n을 1부터 3까지 반복하며 base * n을 출력한다. 입력이 4이면 4, 8, 12가 출력된다. base + n은 곱이 아니라 합이 되고, n을 0부터 시작하면 0배가 먼저 나와 결과가 달라진다.

---

# Part 8. Java초급08 반복문② while·do-while

`DEV-JAVA-01-08` · 문제 7개 (코드 빈칸 4 · 객관식 1 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- while문의 조건 검사와 실행 순서를 이해한다.
- 반복 변수를 직접 초기화하고 변경한다.
- 입력값에 따라 반복을 계속하거나 종료한다.
- do-while이 최소 한 번 실행되는 이유를 이해한다.
- while과 do-while의 차이를 구분한다.

## 수업 내용

### Part 1. while문의 기본 구조

**개념 설명**

- while문은 조건식이 true인 동안 코드를 반복한다.
- 반복하기 전에 조건을 먼저 검사한다.
- 처음부터 조건이 false이면 반복 영역을 한 번도 실행하지 않는다.
- for문과 달리 초기식과 증감식을 소괄호 안에 함께 작성하지 않는다.
- 반복에 사용할 변수는 while문 전에 만들고 반복문 안에서 변경해야 한다.

**코드 문법 분해**

```java
int i = 1;

while (i <= 3) {
    System.out.println(i);
    i++;
}
```

| 코드 | 의미 |
|---|---|
| `int i = 1` | 반복 변수의 시작값 |
| `i <= 3` | 반복을 계속할 조건 |
| `System.out.println(i)` | 반복해서 실행할 코드 |
| `i++` | 반복 변수 변경 |

**실행 흐름**

| 순서 | i | 조건 결과 | 실행 |
|---|---|---|---|
| 1 | 1 | true | 1 출력 후 i를 2로 변경 |
| 2 | 2 | true | 2 출력 후 i를 3으로 변경 |
| 3 | 3 | true | 3 출력 후 i를 4로 변경 |
| 4 | 4 | false | 반복 종료 |

**실행 결과**

```
1
2
3
```

**문제와 다른 예제**

```java
int count = 0;

while (count < 3) {
    System.out.println("Java");
    count++;
}
```

```
Java
Java
Java
```

**자주 하는 실수**

반복 변수를 변경하지 않으면 조건이 계속 true일 수 있다.

```java
int i = 1;

while (i <= 3) {
    System.out.println(i);
}
```

i가 계속 1이므로 반복이 끝나지 않는다.

```java
while (i <= 3) {
    System.out.println(i);
    i++;
}
```

### Part 2. while을 이용한 계산

**개념 설명**

- while문으로도 합계와 개수를 계산할 수 있다.
- 합계 변수와 반복 변수는 반복문 전에 초기화한다.
- 반복문 안에서는 합계를 계산한 후 반복 변수를 변경한다.
- 변수 변경 위치가 빠지거나 잘못되면 반복 횟수와 결과가 달라진다.
- 반복 횟수가 명확하면 for, 조건에 따라 반복하면 while이 자연스럽다.

**합계 계산 예제**

```java
int i = 1;
int sum = 0;

while (i <= 5) {
    sum += i;
    i++;
}

System.out.println(sum);
```

**실행 흐름**

- `i = 1, sum = 0`
- `i = 2, sum = 1`
- `i = 3, sum = 3`
- `i = 4, sum = 6`
- `i = 5, sum = 10`
- `i = 6, sum = 15`

조건을 다시 검사하면 `6 <= 5`가 false이므로 반복이 종료된다.

**실행 결과**

```
15
```

**감소 반복**

```java
int number = 3;

while (number >= 1) {
    System.out.println(number);
    number--;
}
```

```
3
2
1
```

**자주 하는 실수**

증가하는 조건에서 변수를 감소시키면 반복이 종료되지 않을 수 있다.

```java
int i = 1;

while (i <= 5) {
    System.out.println(i);
    i--;
}
```

초기값, 조건식, 변수 변경 방향을 함께 확인해야 한다.

### Part 3. 입력값에 따른 반복

**개념 설명**

- 반복 횟수를 미리 알 수 없고 입력값에 따라 종료해야 할 때 while문을 사용할 수 있다.
- 반복 전에 첫 번째 값을 입력받고 조건을 검사한다.
- 반복문 안에서 현재 값을 처리한 후 다음 값을 다시 입력받는다.
- 종료를 나타내는 특정 값을 종료값 또는 센티널 값이라고 한다.

**예제**

사용자가 0을 입력할 때까지 입력된 숫자를 출력한다.

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        int number = scanner.nextInt();

        while (number != 0) {
            System.out.println(number);
            number = scanner.nextInt();
        }

        scanner.close();
    }
}
```

**실행 흐름과 결과**

입력:

```
5
3
0
```

실행 과정:

- `5 != 0`이므로 5를 출력한다.
- 다음 값 3을 입력받는다.
- `3 != 0`이므로 3을 출력한다.
- 다음 값 0을 입력받는다.
- `0 != 0`은 false이므로 종료한다.

출력:

```
5
3
```

종료값 0은 출력되지 않는다.

**자주 하는 실수**

반복문 안에서 다음 값을 입력받지 않으면 같은 값을 계속 검사한다.

```java
int number = scanner.nextInt();

while (number != 0) {
    System.out.println(number);
}
```

다음 입력을 반복문 안에서 받아야 한다.

```java
while (number != 0) {
    System.out.println(number);
    number = scanner.nextInt();
}
```

### Part 4. do-while

**개념 설명**

- do-while은 코드를 먼저 실행한 후 조건을 검사한다.
- 따라서 조건이 처음부터 false여도 반복 영역을 최소 한 번 실행한다.
- do 뒤의 중괄호 안에 반복할 코드를 작성한다.
- 마지막 `while (조건식)` 뒤에는 세미콜론을 붙여야 한다.
- 메뉴를 최소 한 번 보여주거나 입력을 먼저 받아야 할 때 사용할 수 있다.

**코드 문법 분해**

```java
int i = 1;

do {
    System.out.println(i);
    i++;
} while (i <= 3);
```

| 코드 | 의미 |
|---|---|
| `do` | 조건 검사 전에 코드 실행 |
| `{ }` | 반복할 코드 |
| `while (i <= 3)` | 다음 반복 여부 검사 |
| `;` | do-while문의 끝 |

**실행 결과**

```
1
2
3
```

**처음부터 조건이 거짓인 경우**

```java
int number = 10;

while (number < 5) {
    System.out.println("while 실행");
}
```

아무것도 출력되지 않는다.

```java
int number = 10;

do {
    System.out.println("do-while 실행");
} while (number < 5);
```

조건은 false지만 먼저 실행하므로 다음과 같이 출력된다.

```
do-while 실행
```

**문제와 다른 예제**

```java
int count = 3;

do {
    System.out.println(count);
    count--;
} while (count >= 1);
```

```
3
2
1
```

**자주 하는 실수**

마지막 세미콜론을 빠뜨리지 않아야 한다.

```java
do {
    System.out.println("실행");
} while (false) // 오류
```

올바른 코드는 다음과 같다.

```java
do {
    System.out.println("실행");
} while (false);
```

## for, while, do-while 비교

| 반복문 | 조건 검사 | 적합한 상황 |
|---|---|---|
| `for` | 실행 전 | 반복 횟수가 명확한 경우 |
| `while` | 실행 전 | 조건에 따라 반복 횟수가 달라지는 경우 |
| `do-while` | 실행 후 | 코드를 최소 한 번 실행해야 하는 경우 |

## 다음으로

다음 학습 내용은 [Part 9「반복문③ break·continue·중첩」](/dev/lessons/DEV-JAVA-01-09)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 8)

### 확인 1. 값을 두 배로 증가  `코드 빈칸`

**문제.** 3에서 시작하여 40보다 작은 동안 값을 출력하고 두 배로 증가시키도록 완성하시오.

```java
int value = 3;

while (value 〔①〕 40) {
    System.out.println(value);
    value 〔②〕 2;
}
```
- ✅ **정답:** ① = `<` , ② = `*=`
- 보기 토큰: `<` / `*=` / `>` / `>=` / `==` / `+=` / `/=` / `++`
- 실행결과:
```
3
6
12
24
```

> 💡 **해설.** 40보다 작은 동안 반복하므로 조건은 <이고, 두 배로 늘리므로 value *= 2를 쓴다. 3, 6, 12, 24가 출력되고 48은 40보다 작지 않아 멈춘다. >·>=·==는 처음부터 거짓이라 아무것도 출력되지 않고, +=는 2씩만 늘며, /=는 값이 줄어 무한 반복이 된다.

### 확인 2. 일정량 감소  `코드 빈칸`

**문제.** 10에서 시작하여 0보다 큰 동안 값을 출력하고 3씩 줄이도록 빈칸을 채우시오.

```java
int water = 10;

while (water > 0) {
    System.out.println(water);
    water 〔①〕 3;
}
```
- ✅ **정답:** ① = `-=`
- 보기 토큰: `-=` / `+=` / `*=` / `/=`
- 실행결과:
```
10
7
4
1
```

> 💡 **해설.** 3씩 줄이므로 -=를 쓴다. 10, 7, 4, 1이 출력되고 다음은 -2라 0보다 크지 않아 멈춘다. +=·*=는 값이 늘어 무한 반복하고, /=는 결과가 달라진다.

### 확인 3. 자릿수 세기  `코드 빈칸`

**문제.** 4827의 자릿수를 while문으로 세도록 완성하시오.

```java
int number = 4827;
int digits = 0;

while (number 〔①〕 0) {
    number 〔②〕 10;
    digits〔③〕;
}

System.out.println(digits);
```
- ✅ **정답:** ① = `>` , ② = `/=` , ③ = `++`
- 보기 토큰: `>` / `/=` / `++` / `<` / `==` / `>=` / `%=` / `*=` / `-=` / `--` / `+= 2` / `+`
- 실행결과:
```
4
```

> 💡 **해설.** number가 0보다 큰 동안 number /= 10으로 한 자리씩 줄이고 digits++로 자릿수를 센다. 4827 → 482 → 48 → 4 → 0으로 네 번 반복해 4가 된다. <·==는 처음부터 거짓이라 0이 나오고, %=·*=·-=는 자릿수가 줄지 않아 무한 반복하거나 결과가 달라진다.

### 확인 4. 각 자리 역순 출력  `순서 배열`

**문제.** 507의 각 숫자를 오른쪽부터 출력하도록 카드를 배열하시오.

- ✅ **정답 순서:**
```
int number = 507;
while (number > 0) {
    System.out.println(number % 10);
    number /= 10;
}
```

- ❌ **오답 카드(제외):**
```
number *= 10;
System.out.println(number / 10);
```

> 💡 **해설.** number % 10으로 마지막 자리를 얻어 출력하고, number /= 10으로 자리를 하나씩 줄인다. 507 → 7, 0, 5 순으로 출력된다. number *= 10이나 number / 10 출력은 자리를 오른쪽부터 꺼내는 데 맞지 않는다.

### 확인 5. 종료값 전까지 합계  `코드 빈칸`

**문제.** -1이 입력될 때까지 입력값을 합산하도록 빈칸을 채우시오. (입력 4, 6, -1)

```java
Scanner scanner = new Scanner(System.in);
int number = scanner.nextInt();
int total = 0;

while (number 〔①〕 -1) {
    total 〔②〕 number;
    number = scanner.〔③〕();
}

System.out.println(total);
```
- ✅ **정답:** ① = `!=` , ② = `+=` , ③ = `nextInt`
- 보기 토큰: `!=` / `+=` / `nextInt` / `==` / `-=` / `nextLine`
- 입력 예:
```
4 6 -1
```
- 실행결과:
```
10
```

> 💡 **해설.** -1이 아닌 동안 반복해야 하므로 조건은 !=이고, 값을 더해 누적하므로 +=를 쓴다. 다음 정수는 nextInt()로 받는다. 4 + 6 = 10이 되고 -1에서 멈춘다. ==는 처음부터 거짓이라 합산되지 않고, -=는 빼기, nextLine()은 문자열이라 오류가 난다.

### 확인 6. 실행 결과 비교  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
int first = 5;
while (first < 3) {
    System.out.println("while");
}

int second = 5;
do {
    System.out.println("do-while");
} while (second < 3);
```

- **A.** 아무것도 출력되지 않는다.
- **B.** `while` 만 출력된다.
- **C.** `do-while` 만 출력된다. ✅
- **D.** `while` 과 `do-while` 이 모두 출력된다.
- ✅ **정답:** C

> 💡 **해설.** while은 조건(5 < 3)을 먼저 검사하는데 false라 한 번도 실행되지 않는다. do-while은 코드를 먼저 실행한 뒤 조건을 검사하므로, 조건이 false여도 do-while이 한 번 출력된다.

### 확인 7. 양수가 입력될 때까지 반복  `순서 배열`

**문제.** Scanner 생성 → 변수 선언 → do 블록에서 입력 → 0 이하인지 검사 → 처음 입력된 양수 출력 → Scanner 종료 순서로 배열하시오. Scanner는 양수를 출력한 뒤 닫는다.

- ✅ **정답 순서:**
```
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int number;
        do {
            number = scanner.nextInt();
        } while (number <= 0);
        System.out.println(number);
        scanner.close();
    }
}
```

- ❌ **오답 카드(제외):**
```
} while (number < 0);
number = scanner.nextLine();
```

> 💡 **해설.** do-while은 먼저 입력을 받고(number = scanner.nextInt()) 그 값이 0 이하인 동안 반복한다. -2·0은 0 이하라 다시 입력받고, 5는 양수라 조건(5 <= 0)이 false여서 종료된 뒤 5가 출력된다. number를 반복문 밖에서 선언해야 while 조건에서 쓸 수 있다.

---

# Part 9. Java초급09 반복문③ break·continue·중첩

`DEV-JAVA-01-09` · 문제 8개 (코드 빈칸 4 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- break로 반복문을 즉시 종료한다.
- continue로 현재 반복만 건너뛴다.
- 중첩 반복문의 바깥쪽·안쪽 실행 순서를 이해한다.
- 중첩 반복문으로 표와 간단한 모양을 출력한다.
- 중첩 반복문에서 break와 continue가 적용되는 범위를 구분한다.

## 수업 내용

### Part 1. break

**개념 설명**

- break는 실행 중인 반복문을 즉시 종료한다.
- break 아래에 남은 코드는 실행하지 않는다.
- 반복 조건이 아직 true여도 반복문 밖으로 이동한다.
- 특정 값을 찾았거나 종료값이 입력되었을 때 사용할 수 있다.
- 이전 파트에서는 switch를 종료할 때 사용했지만 이번에는 반복문 종료에 사용한다.

**코드 문법 분해**

```java
for (int i = 1; i <= 10; i++) {
    if (i == 4) {
        break;
    }

    System.out.println(i);
}
```

| 코드 | 의미 |
|---|---|
| `i <= 10` | 원래는 10까지 반복 |
| `i == 4` | i가 4인지 확인 |
| `break` | 현재 반복문을 즉시 종료 |
| `println` | break되지 않은 값만 출력 |

**실행 흐름과 결과**

- `i = 1` → 1 출력
- `i = 2` → 2 출력
- `i = 3` → 3 출력
- `i = 4` → break 실행

```
1
2
3
```

i가 4일 때는 출력문보다 break가 먼저 실행되므로 4는 출력되지 않는다.

**입력 종료 예제**

```java
Scanner scanner = new Scanner(System.in);

while (true) {
    int number = scanner.nextInt();

    if (number == 0) {
        break;
    }

    System.out.println(number);
}

scanner.close();
```

입력:

```
5
3
0
```

출력:

```
5
3
```

`while (true)`는 조건이 항상 참이지만 0이 입력되면 break로 종료한다.

**자주 하는 실수**

break 뒤의 코드는 같은 반복에서 실행되지 않는다.

```java
if (number == 0) {
    break;
    System.out.println("종료"); // 실행할 수 없는 코드
}
```

종료 메시지가 필요하다면 break 전에 작성한다.

```java
if (number == 0) {
    System.out.println("종료");
    break;
}
```

### Part 2. continue

**개념 설명**

- continue는 현재 반복에서 남은 코드만 건너뛴다.
- 반복문 전체를 종료하지는 않는다.
- for문에서는 증감식으로 이동한 후 다음 조건을 검사한다.
- while문에서는 조건식 검사 위치로 이동한다.
- 특정 값만 출력이나 계산에서 제외할 때 사용할 수 있다.

**코드 문법 분해**

```java
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        continue;
    }

    System.out.println(i);
}
```

| 코드 | 의미 |
|---|---|
| `i == 3` | 건너뛸 값을 확인 |
| `continue` | 현재 반복의 남은 코드 생략 |
| `println` | 3을 제외한 값만 출력 |

**실행 흐름과 결과**

- `i = 1` → 1 출력
- `i = 2` → 2 출력
- `i = 3` → continue
- `i = 4` → 4 출력
- `i = 5` → 5 출력

```
1
2
4
5
```

**조건에 맞는 값 제외**

```java
for (int i = 1; i <= 6; i++) {
    if (i % 2 == 0) {
        continue;
    }

    System.out.println(i);
}
```

짝수일 때 출력문을 건너뛴다.

```
1
3
5
```

**while에서의 주의점**

```java
int i = 0;

while (i < 5) {
    i++;

    if (i == 3) {
        continue;
    }

    System.out.println(i);
}
```

i를 먼저 증가시킨 후 continue를 검사한다.

```
1
2
4
5
```

**자주 하는 실수**

다음 코드는 i가 3일 때 계속 같은 반복을 실행할 수 있다.

```java
int i = 1;

while (i <= 5) {
    if (i == 3) {
        continue;
    }

    System.out.println(i);
    i++;
}
```

`i == 3`일 때 i++를 건너뛰기 때문이다. while에서 continue를 사용할 때는 변수 변경 위치를 확인해야 한다.

### Part 3. break와 continue 비교

| 구분 | break | continue |
|---|---|---|
| 역할 | 반복문 전체 종료 | 현재 반복만 건너뜀 |
| 다음 실행 위치 | 반복문 다음 코드 | 다음 반복 |
| 반복 계속 여부 | 종료 | 계속 |
| 주요 사용 상황 | 값 발견, 종료 입력 | 특정 값 제외 |

**비교 예제**

```java
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        break;
    }

    System.out.println(i);
}
```

```
1
2
```

```java
for (int i = 1; i <= 5; i++) {
    if (i == 3) {
        continue;
    }

    System.out.println(i);
}
```

```
1
2
4
5
```

break는 반복을 끝내지만 continue는 다음 반복을 계속한다.

### Part 4. 중첩 반복문

**개념 설명**

- 반복문 안에 다른 반복문을 작성할 수 있다.
- 이를 중첩 반복문이라고 한다.
- 바깥쪽 반복문이 한 번 실행될 때 안쪽 반복문은 전체 반복을 수행한다.
- 바깥쪽과 안쪽 반복 변수는 서로 다른 이름을 사용한다.
- 일반적으로 바깥쪽은 행, 안쪽은 열을 표현할 때 사용한다.

**코드 문법 분해**

```java
for (int row = 1; row <= 2; row++) {
    for (int column = 1; column <= 3; column++) {
        System.out.print(row);
        System.out.print(" ");
        System.out.println(column);
    }
}
```

| 변수 | 역할 |
|---|---|
| `row` | 바깥쪽 반복 위치 |
| `column` | 안쪽 반복 위치 |
| 바깥쪽 반복 횟수 | 2번 |
| 안쪽 반복 횟수 | 바깥쪽 한 번마다 3번 |
| 전체 실행 횟수 | 2 × 3으로 6번 |

**실행 흐름과 결과**

- `row = 1` → column = 1, 2, 3
- `row = 2` → column = 1, 2, 3

```
1 1
1 2
1 3
2 1
2 2
2 3
```

**별 모양 출력**

```java
for (int row = 1; row <= 3; row++) {
    for (int column = 1; column <= row; column++) {
        System.out.print("*");
    }

    System.out.println();
}
```

**실행 흐름**

- row가 1일 때 별을 1개 출력한다.
- row가 2일 때 별을 2개 출력한다.
- row가 3일 때 별을 3개 출력한다.

```
*
**
***
```

**자주 하는 실수**

안쪽 반복문의 조건에서 잘못된 변수를 사용하면 정상적으로 종료되지 않을 수 있다.

```java
for (int row = 1; row <= 3; row++) {
    for (int column = 1; row <= 3; column++) {
        System.out.println(column);
    }
}
```

안쪽 반복문의 조건에는 column을 사용해야 한다.

```java
for (int column = 1; column <= 3; column++) {
```

### Part 5. 중첩 반복문의 break

**개념 설명**

- 중첩 반복문에서 일반적인 break는 가장 가까운 반복문 하나만 종료한다.
- 안쪽 반복문에서 break를 실행해도 바깥쪽 반복문은 계속 실행된다.
- 따라서 바깥쪽 반복이 다시 실행되면 안쪽 반복도 처음부터 다시 시작한다.

**예제**

```java
for (int row = 1; row <= 2; row++) {
    for (int column = 1; column <= 3; column++) {
        if (column == 2) {
            break;
        }

        System.out.print(row);
        System.out.print(" ");
        System.out.println(column);
    }
}
```

**실행 흐름과 결과**

- `row = 1`
  - column = 1 → 출력
  - column = 2 → 안쪽 반복문 종료
- `row = 2`
  - column = 1 → 출력
  - column = 2 → 안쪽 반복문 종료

```
1 1
2 1
```

바깥쪽 반복문은 종료되지 않는다.

**중첩 반복문의 continue**

안쪽 반복문에서 continue를 실행하면 안쪽 반복의 현재 차례만 건너뛴다.

```java
for (int row = 1; row <= 2; row++) {
    for (int column = 1; column <= 3; column++) {
        if (column == 2) {
            continue;
        }

        System.out.print(row);
        System.out.print(" ");
        System.out.println(column);
    }
}
```

```
1 1
1 3
2 1
2 3
```

**자주 하는 실수**

안쪽의 break가 모든 반복문을 종료한다고 생각하면 안 된다.

```java
break;
```

일반적인 break는 가장 가까운 반복문 하나만 종료한다. 라벨을 사용해 바깥쪽 반복문을 종료하는 문법도 있지만 초급 과정에서는 제외한다.

## 다음으로

다음 학습 내용은 [Part 10「배열① 선언·생성·요소 접근」](/dev/lessons/DEV-JAVA-01-10)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 9)

### 확인 1. 첫 번째 7의 배수에서 종료  `코드 빈칸`

**문제.** 10부터 30까지 보면서 처음 만나는 7의 배수를 출력하고 반복을 멈추도록 빈칸을 채우시오.

```java
for (int number = 10; number <= 30; number++) {
    if (number % 7 == 0) {
        System.out.println(number);
        〔①〕;
    }
}
System.out.println("완료");
```
- ✅ **정답:** ① = `break`
- 보기 토큰: `break` / `continue` / `case` / `default`
- 실행결과:
```
14
완료
```

> 💡 **해설.** break는 반복문을 즉시 끝내므로 처음 만난 7의 배수 14를 출력한 뒤 반복이 종료되고 「완료」가 출력된다. continue를 사용하면 반복을 끝내지 않고 다음 숫자를 계속 검사한다. case와 default는 switch에서 사용하는 문법이므로 이 위치에 사용할 수 없다.

### 확인 2. 입력 종료 코드 선택  `객관식`

**문제.** 0이 입력되면 while문을 종료하도록 빈칸에 들어갈 코드 한 줄을 고르시오.

```java
while (true) {
    int number = scanner.nextInt();
    if (number == 0) {
        ____
    }
    System.out.println(number);
}
```

- **A.** `continue;`
- **B.** `break;` ✅
- **C.** `number++;`
- **D.** `scanner.close();`
- ✅ **정답:** B

> 💡 **해설.** while (true)는 조건이 항상 참이므로 0이 입력되면 break로 반복문을 종료해야 한다. continue를 쓰면 반복을 끝내지 않고 다음 입력을 계속 받는다.

### 확인 3. 3의 배수 건너뛰기  `코드 빈칸`

**문제.** 1부터 8까지 출력하되 3의 배수는 건너뛰도록 빈칸을 채우시오.

```java
for (int number = 1; number <= 8; number++) {
    if (number % 3 == 0) {
        〔①〕;
    }
    System.out.println(number);
}
```
- ✅ **정답:** ① = `continue`
- 보기 토큰: `continue` / `break` / `case` / `default`
- 실행결과:
```
1
2
4
5
7
8
```

> 💡 **해설.** continue는 현재 반복의 남은 코드를 건너뛰므로 3과 6이 출력되지 않는다. break를 사용하면 3에서 반복문 자체가 끝나 1과 2만 출력된다. case와 default는 switch에서 사용하는 문법이라 이 위치에 사용할 수 없다.

### 확인 4. 감소 중 특정 값 건너뛰기  `순서 배열`

**문제.** 6부터 1까지 감소하며 출력하되 4는 건너뛰도록 초기화 → 조건 → 4 처리 → 출력 → 감소 순서로 배열하시오.

- ✅ **정답 순서:**
```
int number = 6;
while (number >= 1) {
    if (number == 4) {
        number--;
        continue;
    }
    System.out.println(number);
    number--;
}
```

- ❌ **오답 카드(제외):**
```
number++;
break;
```

> 💡 **해설.** number가 4일 때는 number--로 값을 줄인 뒤 continue로 출력을 건너뛴다. 4를 건너뛴 continue 앞에서 number를 줄이지 않으면 무한 반복이 되므로 주의한다. 결과는 6, 5, 3, 2, 1이다.

### 확인 5. 그룹별 인원 수 누적  `코드 빈칸`

**문제.** 1번 그룹 2명, 2번 그룹 4명, 3번 그룹 6명일 때 전체 인원 수를 계산하도록 빈칸을 채우시오.

```java
int total = 〔①〕;

for (int group = 1; group 〔②〕 3; group〔③〕) {
    for (int member = 1; member 〔④〕 group * 2; member〔⑤〕) {
        total〔⑥〕;
    }
}

System.out.println(total);
```
- ✅ **정답:** ① = `0` , ② = `<=` , ③ = `++` , ④ = `<=` , ⑤ = `++` , ⑥ = `++`
- 보기 토큰: `0` / `<=` / `<=` / `++` / `++` / `++` / `1` / `<` / `--` / `+= 2`
- 실행결과:
```
12
```

> 💡 **해설.** 합계는 0에서 시작하고, 그룹은 1부터 3까지(<=) ++로 돈다. 각 그룹의 인원은 group * 2명이므로 안쪽 반복도 <=와 ++를 쓰고, 사람마다 total++로 센다. 2 + 4 + 6 = 12다. 1부터 시작하거나 <를 쓰면 개수가 달라진다.

### 확인 6. 중첩 반복문의 break 범위  `순서 배열`

**문제.** row를 바깥 반복문, col을 안쪽 반복문으로 배치하시오. col이 2가 되면 안쪽 반복문만 종료하여 다음 결과가 나오게 하시오.

```text
1-1
2-1
```

- ✅ **정답 순서:**
```
for (int row = 1; row <= 2; row++) {
    for (int col = 1; col <= 3; col++) {
        if (col == 2) {
            break;
        }
        System.out.println(row + "-" + col);
    }
}
```

- ❌ **오답 카드(제외):**
```
if (row == 2) {
continue;
```

> 💡 **해설.** break는 자신을 감싼 가장 안쪽 반복문만 종료한다. col이 2가 되면 안쪽 반복문이 끝나지만 바깥쪽 row 반복문은 계속된다. col이 1일 때만 출력되므로 row마다 한 줄씩 1-1, 2-1이 출력된다.

### 확인 7. 종료값과 제외값 처리  `코드 빈칸`

**문제.** -1이면 종료, 0이면 세지 않고 건너뛰고, 나머지는 개수를 세도록 빈칸을 채우시오.

```java
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int count = 0;

        while (true) {
            int number = scanner.nextInt();

            if (number == -1) {
                〔①〕;
            }

            if (number == 0) {
                〔②〕;
            }

            count〔③〕;
        }

        System.out.println(count);
    }
}
```
- ✅ **정답:** ① = `break` , ② = `continue` , ③ = `++`
- 보기 토큰: `break` / `continue` / `++` / `stop` / `skip` / `--` / `+= 2` / `+`
- 입력 예:
```
3 0 8 -1
```
- 실행결과:
```
2
```

> 💡 **해설.** -1이면 break로 반복을 끝내고, 0이면 continue로 count++를 건너뛴다. 나머지 값은 count++로 센다. 입력 3, 0, 8, -1에서 3과 8만 세어 2가 된다. break가 없으면 while(true) 뒤 출력문에 도달할 수 없어 컴파일 오류이고, continue 자리에 break를 쓰면 0에서 반복이 끝나 1이 된다.

### 확인 8. 대각선 위치 건너뛰기  `순서 배열`

**문제.** row를 바깥 반복문, column을 안쪽 반복문으로 배치하시오. 행과 열이 같은 위치는 건너뛰어 다음 순서로 출력하시오.

```text
1,2
1,3
2,1
2,3
3,1
3,2
```

- ✅ **정답 순서:**
```
for (int row = 1; row <= 3; row++) {
    for (int column = 1; column <= 3; column++) {
        if (row == column) {
            continue;
        }
        System.out.println(row + "," + column);
    }
}
```

- ❌ **오답 카드(제외):**
```
if (row != column) {
break;
```

> 💡 **해설.** 안쪽 반복에서 row와 column이 같으면 continue로 출력을 건너뛴다. 대각선(1,1 / 2,2 / 3,3)을 제외한 나머지 위치가 출력된다.

---

# Part 10. Java초급10 배열① 선언·생성·요소 접근

`DEV-JAVA-01-10` · 문제 7개 (코드 빈칸 3 · 객관식 3 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 배열이 필요한 이유를 이해한다.
- 배열 변수를 선언하고 배열을 생성한다.
- 초기값을 사용해 배열을 한 번에 만든다.
- 인덱스로 배열 요소를 읽고 변경한다.
- length로 배열의 길이를 확인한다.
- 배열의 기본값과 인덱스 범위 오류를 이해한다.

## 수업 내용

### Part 1. 배열의 개념과 선언

**개념 설명**

- 배열은 같은 자료형의 값을 여러 개 저장하는 공간이다.
- 변수를 각각 만들지 않고 하나의 배열 이름으로 여러 값을 관리할 수 있다.
- 배열의 각 저장 공간을 요소라고 한다.
- 배열을 사용하려면 먼저 배열 변수를 선언해야 한다.
- 선언만 하면 실제 값을 저장할 배열 공간은 아직 만들어지지 않는다.

**일반 변수를 사용한 경우**

```java
int score1 = 80;
int score2 = 90;
int score3 = 100;
```

값이 많아질수록 변수를 계속 추가해야 한다.

**배열 선언**

```java
int[] scores;
```

**코드 문법 분해**

| 코드 | 의미 |
|---|---|
| `int` | 배열 요소의 자료형 |
| `[]` | 배열임을 표시 |
| `scores` | 배열 변수 이름 |

다음 문법도 사용할 수 있다.

```java
int scores[];
```

하지만 자료형과 배열 표시가 붙어 있는 다음 형태를 권장한다.

```java
int[] scores;
```

**다른 자료형의 배열**

```java
double[] prices;
char[] grades;
boolean[] results;
String[] names;
```

한 배열에는 선언한 자료형에 맞는 값만 저장할 수 있다.

**자주 하는 실수**

```java
int scores;   // 일반 int 변수
int[] scores; // int 배열 변수
```

`[]`가 없으면 배열이 아니라 값 하나만 저장하는 일반 변수다.

### Part 2. 배열 생성

**개념 설명**

- 배열을 선언한 후에는 실제 요소를 저장할 공간을 생성해야 한다.
- 배열은 `new 자료형[길이]` 형식으로 생성한다.
- 길이는 배열에 저장할 수 있는 요소의 개수다.
- 배열의 길이는 생성할 때 결정되며 이후 변경할 수 없다.
- 선언과 생성을 한 문장으로 작성할 수도 있다.

**선언과 생성 분리**

```java
int[] scores;
scores = new int[3];
```

**선언과 생성 동시 작성**

```java
int[] scores = new int[3];
```

**코드 문법 분해**

```java
int[] scores = new int[3];
```

| 부분 | 의미 |
|---|---|
| `int[]` | int 배열의 자료형 |
| `scores` | 배열 변수 이름 |
| `new` | 새로운 배열 생성 |
| `int[3]` | int 요소 3개를 저장할 공간 |

**생성된 배열 구조**

| 인덱스 | 0 | 1 | 2 |
|---|---|---|---|
| 요소값 | 0 | 0 | 0 |

int 배열을 생성하면 각 요소는 우선 0으로 초기화된다.

**문제와 다른 예제**

```java
double[] temperatures = new double[4];

System.out.println(temperatures.length);
```

실행 결과:

```
4
```

**자주 하는 실수**

배열 선언과 생성에서 자료형이 달라서는 안 된다.

```java
int[] scores = new double[3]; // 오류
```

올바른 코드는 다음과 같다.

```java
int[] scores = new int[3];
```

### Part 3. 초기값으로 배열 생성

**개념 설명**

- 저장할 값을 알고 있다면 배열 생성과 동시에 값을 작성할 수 있다.
- 중괄호 안에 값을 쉼표로 구분하여 작성한다.
- 배열의 길이는 작성한 값의 개수에 따라 자동으로 결정된다.
- 모든 값은 배열의 자료형과 맞아야 한다.

**기본 문법**

```java
int[] scores = {80, 90, 100};
```

생성된 배열의 구조는 다음과 같다.

| 인덱스 | 0 | 1 | 2 |
|---|---|---|---|
| 요소값 | 80 | 90 | 100 |

**다른 작성 방법**

```java
int[] scores = new int[]{80, 90, 100};
```

두 코드는 같은 값이 들어 있는 배열을 만든다.

```java
int[] scores = {80, 90, 100};
int[] points = new int[]{80, 90, 100};
```

**문제와 다른 예제**

```java
char[] grades = {'A', 'B', 'C'};
boolean[] results = {true, false, true};

System.out.println(grades.length);
System.out.println(results.length);
```

실행 결과:

```
3
3
```

**자주 하는 실수**

선언이 끝난 배열 변수에는 중괄호만 사용하여 값을 대입할 수 없다.

```java
int[] scores;
scores = {80, 90, 100}; // 오류
```

다음과 같이 `new int[]`를 사용해야 한다.

```java
int[] scores;
scores = new int[]{80, 90, 100};
```

### Part 4. 인덱스로 요소 접근

**개념 설명**

- 배열의 각 요소에는 인덱스라는 위치 번호가 있다.
- Java 배열의 첫 번째 인덱스는 0이다.
- 길이가 3인 배열의 인덱스는 0, 1, 2다.
- `배열이름[인덱스]`로 요소를 읽거나 변경할 수 있다.
- 배열의 마지막 인덱스는 항상 `배열길이 - 1`이다.

**요소 읽기**

```java
int[] scores = {80, 90, 100};

System.out.println(scores[0]);
System.out.println(scores[1]);
System.out.println(scores[2]);
```

실행 결과:

```
80
90
100
```

**요소 변경**

```java
int[] scores = {80, 90, 100};

scores[1] = 95;

System.out.println(scores[1]);
```

**실행 흐름과 결과**

- `scores[1]`에는 90이 저장되어 있다.
- `scores[1] = 95`로 두 번째 요소를 변경한다.
- 변경된 값 95를 출력한다.

```
95
```

**값을 이용한 계산**

```java
int[] numbers = {10, 20, 30};

int result = numbers[0] + numbers[2];

System.out.println(result);
```

```
40
```

**자주 하는 실수**

첫 번째 요소를 1번 인덱스로 생각하면 안 된다.

```java
int[] scores = {80, 90, 100};

System.out.println(scores[1]);
```

출력되는 값은 첫 번째 값 80이 아니라 두 번째 값 90이다.

### Part 5. 배열 길이와 기본값

**배열 길이**

배열의 길이는 `length`로 확인한다.

```java
int[] scores = new int[3];

System.out.println(scores.length);
```

```
3
```

`length`는 메서드가 아니므로 소괄호를 붙이지 않는다.

```java
scores.length;   // 올바름
scores.length(); // 오류
```

**마지막 인덱스**

길이가 3인 배열의 마지막 인덱스는 2다.

```java
int[] scores = {80, 90, 100};

System.out.println(scores[scores.length - 1]);
```

```
100
```

**배열 요소의 기본값**

배열을 길이만 지정해 생성하면 각 요소에 기본값이 저장된다.

| 배열 자료형 | 기본값 |
|---|---|
| `byte`, `short`, `int`, `long` | 0 |
| `float`, `double` | 0.0 |
| `boolean` | false |
| `char` | 값이 없는 문자 `\u0000` |
| `String` 등 참조형 | null |

**기본값 예제**

```java
int[] numbers = new int[2];
boolean[] results = new boolean[2];
String[] names = new String[2];

System.out.println(numbers[0]);
System.out.println(results[0]);
System.out.println(names[0]);
```

```
0
false
null
```

**인덱스 범위 오류**

```java
int[] scores = new int[3];

System.out.println(scores[3]);
```

길이가 3인 배열의 인덱스는 0, 1, 2다. `scores[3]`에 접근하면 실행 중 오류가 발생한다.

**자주 하는 실수**

```java
int[] scores = new int[3];

scores[-1] = 10; // 범위를 벗어남
scores[3] = 10;  // 범위를 벗어남
```

사용 가능한 범위는 `0 이상, scores.length 미만`이다.

## 다음으로

다음 학습 내용은 [Part 11「배열② 순회·합계·검색」](/dev/lessons/DEV-JAVA-01-11)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 10)

### 확인 1. boolean 배열 선언과 생성  `코드 빈칸`

**문제.** 논리값 4개를 저장할 배열을 생성하도록 빈칸을 채우시오.

```java
boolean〔①〕 checks = 〔②〕 boolean[〔③〕];
System.out.println(checks.length);
```
- ✅ **정답:** ① = `[]` , ② = `new` , ③ = `4`
- 보기 토큰: `[]` / `new` / `4` / `()` / `final` / `0`
- 실행결과:
```
4
```

> 💡 **해설.** 배열 타입은 boolean[]로 쓰고, 배열은 new boolean[크기]로 생성한다. 크기를 4로 주면 length가 4가 된다. ()나 final은 배열 선언·생성 문법에 맞지 않고, 크기를 0으로 주면 length가 0이 된다.

### 확인 2. 초기값으로 배열 생성  `객관식`

**문제.** 80, 90, 100이 저장된 int 배열을 올바르게 만든 코드는?

- **A.** `int[] scores = {80, 90, 100};` ✅
- **B.** `int scores = {80, 90, 100};`
- **C.** `int[] scores = (80, 90, 100);`
- **D.** `int[] scores = new int[80, 90, 100];`
- ✅ **정답:** A

> 💡 **해설.** 초기값 배열은 자료형 뒤에 []를 붙이고 중괄호 안에 값을 쉼표로 구분해 작성한다. []가 없으면 배열이 아니고, 소괄호나 new int[80, 90, 100] 형식은 문법 오류다.

### 확인 3. 인덱스로 요소 읽기  `코드 빈칸`

**문제.** 첫 번째 요소와 세 번째 요소를 출력하도록 빈칸에 인덱스를 채우시오.

```java
int[] scores = {80, 90, 100};

System.out.println(scores[〔①〕]);
System.out.println(scores[〔②〕]);
```
- ✅ **정답:** ① = `0` , ② = `2`
- 보기 토큰: `0` / `2` / `1` / `3`
- 실행결과:
```
80
100
```

> 💡 **해설.** Java 배열의 첫 번째 인덱스는 0, 세 번째는 2다. scores[0]은 80, scores[2]는 100을 출력한다. 1을 쓰면 두 번째 값 90이 나오고, 3은 인덱스 범위를 벗어나 실행 중 오류가 난다.

### 확인 4. 문자열 배열 요소 변경  `객관식`

**문제.** 인덱스 1의 값을 「진행」으로 바꾸는 코드 한 줄로 옳은 것은?

```java
String[] statuses = {"대기", "대기", "완료"};
____
System.out.println(statuses[1]);
```

- **A.** `statuses[2] = "진행";`
- **B.** `statuses[1] == "진행";`
- **C.** `statuses[1] = "진행";` ✅
- **D.** `statuses = "진행";`
- ✅ **정답:** C

> 💡 **해설.** 배열 요소를 바꿀 때는 인덱스를 지정해 대입한다. statuses[1] = "진행";은 인덱스 1의 값을 진행으로 바꾼다. 인덱스 2는 다른 위치를 바꾸고, statuses[1] == "진행";은 비교식이라 단독 문장이 될 수 없어 컴파일 오류이며, statuses = "진행"은 배열 변수에 문자열을 넣어 오류가 난다.

### 확인 5. 배열 길이와 마지막 요소  `코드 빈칸`

**문제.** 배열의 길이와 마지막 요소를 출력하도록 빈칸을 채우시오. (①과 ②에는 같은 코드를 넣는다.)

```java
int[] scores = {80, 90, 100};

System.out.println(scores.〔①〕);
System.out.println(scores[scores.〔②〕 〔③〕 1]);
```
- ✅ **정답:** ① = `length` , ② = `length` , ③ = `-`
- 보기 토큰: `length` / `length` / `-` / `+` / `size` / `%`
- 실행결과:
```
3
100
```

> 💡 **해설.** 배열의 길이는 length로 확인하고 소괄호를 붙이지 않는다. 마지막 인덱스는 length - 1이므로 scores[scores.length - 1]은 세 번째 값 100이다. +를 쓰면 length + 1 = 4로 범위를 벗어나 실행 중 오류가, size는 존재하지 않는 필드라 컴파일 오류가 난다.

### 확인 6. 배열 생성 직후 기본값  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
double[] prices = new double[2];
prices[1] = 2.5;

System.out.println(prices[0]);
System.out.println(prices[1]);
```

- **A.** `null` / `2.5`
- **B.** `0.0` / `2.5` ✅
- **C.** `0` / `2.5`
- **D.** `2.5` / `2.5`
- ✅ **정답:** B

> 💡 **해설.** double 배열은 생성되면 각 요소가 기본값 0.0으로 초기화된다. prices[1]에만 2.5를 넣었으므로 prices[0]은 0.0, prices[1]은 2.5다. 정수 0이나 null이 아니라 실수 0.0이다.

### 확인 7. 배열 코드 조립  `순서 배열`

**문제.** 70·80·90 배열 생성 → 두 번째 요소를 85로 변경 → 그 요소 출력 → 배열 길이 출력 순으로 코드를 배열하시오.

- ✅ **정답 순서:**
```
int[] scores = {70, 80, 90};
scores[1] = 85;
System.out.println(scores[1]);
System.out.println(scores.length);
```

- ❌ **오답 카드(제외):**
```
scores[2] = 85;
System.out.println(scores[0]);
```

> 💡 **해설.** 배열을 만든 뒤 scores[1] = 85로 두 번째 요소를 바꾸고, scores[1](=85)과 scores.length(=3)를 순서대로 출력한다. 결과는 85와 3이다.

---

# Part 11. Java초급11 배열② 순회·합계·검색

`DEV-JAVA-01-11` · 문제 7개 (코드 빈칸 3 · 객관식 2 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 일반 for문으로 배열의 모든 요소를 순서대로 처리한다.
- 향상된 for문의 문법과 제한을 이해한다.
- 배열 요소의 합계와 평균을 계산한다.
- 배열에서 원하는 값이 존재하는지 확인한다.
- 검색한 요소의 인덱스를 구한다.

## 수업 내용

### Part 1. 일반 for문으로 배열 순회

**개념 설명**

- 배열 순회는 배열의 첫 번째 요소부터 마지막 요소까지 차례대로 처리하는 것이다.
- 배열의 첫 번째 인덱스는 0이다.
- 반복 조건에는 배열 길이인 `length`를 사용한다.
- 인덱스는 0부터 `length - 1`까지 이동한다.
- 일반 for문은 현재 인덱스가 필요하거나 배열 요소를 변경할 때 적합하다.

**코드 문법 분해**

```java
int[] scores = {80, 90, 100};

for (int i = 0; i < scores.length; i++) {
    System.out.println(scores[i]);
}
```

| 코드 | 의미 |
|---|---|
| `int i = 0` | 첫 번째 인덱스부터 시작 |
| `i < scores.length` | 배열 길이보다 작은 동안 반복 |
| `i++` | 다음 인덱스로 이동 |
| `scores[i]` | 현재 인덱스의 요소 |

**실행 흐름**

| i | scores[i] | 실행 |
|---|---|---|
| 0 | 80 | 80 출력 |
| 1 | 90 | 90 출력 |
| 2 | 100 | 100 출력 |
| 3 | 접근하지 않음 | 조건이 거짓이므로 종료 |

**실행 결과**

```
80
90
100
```

**배열 요소 변경**

```java
int[] numbers = {10, 20, 30};

for (int i = 0; i < numbers.length; i++) {
    numbers[i] += 5;
}

System.out.println(numbers[0]);
System.out.println(numbers[1]);
System.out.println(numbers[2]);
```

```
15
25
35
```

**자주 하는 실수**

반복 조건에 `<=`를 사용하면 배열 범위를 벗어난다.

```java
for (int i = 0; i <= scores.length; i++) {
    System.out.println(scores[i]);
}
```

올바른 조건은 `i < scores.length`다.

### Part 2. 향상된 for문

**개념 설명**

- 향상된 for문은 배열 요소를 처음부터 끝까지 순서대로 꺼낸다.
- 인덱스 변수를 직접 만들 필요가 없다.
- 코드가 간단하므로 모든 요소를 읽기만 할 때 적합하다.
- 현재 인덱스가 필요하거나 배열 요소를 직접 변경해야 한다면 일반 for문을 사용한다.

**코드 문법 분해**

```java
for (요소자료형 변수 : 배열) {
    반복할 코드
}
```

```java
int[] scores = {80, 90, 100};

for (int score : scores) {
    System.out.println(score);
}
```

| 부분 | 의미 |
|---|---|
| `int score` | 배열에서 꺼낸 요소를 저장할 변수 |
| `:` | 배열의 각 요소를 순서대로 꺼냄 |
| `scores` | 순회할 배열 |

**실행 흐름과 결과**

- `score = 80` → 80 출력
- `score = 90` → 90 출력
- `score = 100` → 100 출력

```
80
90
100
```

**문제와 다른 예제**

```java
String[] names = {"Kim", "Lee", "Park"};

for (String name : names) {
    System.out.println(name);
}
```

```
Kim
Lee
Park
```

**배열 요소 변경 시 주의**

```java
int[] numbers = {10, 20, 30};

for (int number : numbers) {
    number += 5;
}

System.out.println(numbers[0]);
```

```
10
```

`number`는 현재 요소의 값을 복사해서 받은 변수다. number를 변경해도 배열의 실제 요소는 변경되지 않는다. 배열을 변경하려면 일반 for문을 사용한다.

```java
for (int i = 0; i < numbers.length; i++) {
    numbers[i] += 5;
}
```

### Part 3. 배열 요소의 합계와 평균

**개념 설명**

- 배열의 합계를 계산하려면 합계 변수를 0으로 초기화한다.
- 반복문으로 각 요소를 꺼내 합계 변수에 더한다.
- 모든 요소를 사용하므로 일반 for문과 향상된 for문 모두 사용할 수 있다.
- 평균은 합계를 배열 길이로 나누어 계산한다.
- 실수 평균이 필요하면 나누기 전에 double로 형변환해야 한다.

**합계 계산**

```java
int[] scores = {80, 90, 100};
int sum = 0;

for (int score : scores) {
    sum += score;
}

System.out.println(sum);
```

**실행 흐름**

- `sum = 0`
- `sum = 0 + 80` → 80
- `sum = 80 + 90` → 170
- `sum = 170 + 100` → 270

**실행 결과**

```
270
```

**평균 계산**

```java
int[] scores = {80, 90, 100};
int sum = 0;

for (int score : scores) {
    sum += score;
}

double average = (double) sum / scores.length;

System.out.println(average);
```

```
90.0
```

**자주 하는 실수**

합계 변수를 반복문 안에서 초기화하면 값이 누적되지 않는다.

```java
for (int score : scores) {
    int sum = 0;
    sum += score;
}
```

sum은 반복문 전에 선언해야 한다.

```java
int sum = 0;

for (int score : scores) {
    sum += score;
}
```

평균을 정수끼리 계산하면 소수점 이하가 버려질 수 있다.

```java
double average = sum / scores.length;
```

실수 평균이 필요하면 다음과 같이 작성한다.

```java
double average = (double) sum / scores.length;
```

### Part 4. 배열에서 값 검색

**개념 설명**

- 배열의 첫 번째 요소부터 값을 하나씩 비교하는 방법을 선형 검색이라고 한다.
- 찾으려는 값과 현재 요소가 같으면 검색에 성공한 것이다.
- 검색 성공 여부는 boolean 변수에 저장할 수 있다.
- 값을 찾으면 더 이상 확인할 필요가 없으므로 break로 반복을 종료할 수 있다.

**값 존재 여부 검색**

```java
int[] numbers = {10, 20, 30, 40};
int target = 30;
boolean found = false;

for (int number : numbers) {
    if (number == target) {
        found = true;
        break;
    }
}

System.out.println(found);
```

**실행 흐름과 결과**

- `10 == 30` → false
- `20 == 30` → false
- `30 == 30` → true
- found를 true로 변경
- break로 반복 종료

```
true
```

**찾지 못한 경우**

```java
int target = 50;
```

배열의 모든 요소를 확인해도 같은 값이 없으므로 found는 계속 false다.

```
false
```

**자주 하는 실수**

found를 처음부터 true로 초기화하면 검색 결과가 항상 참이 된다.

```java
boolean found = true; // 잘못된 초기값
```

검색 전에는 아직 값을 찾지 못한 상태이므로 false로 시작한다.

```java
boolean found = false;
```

### Part 5. 검색한 요소의 인덱스

**개념 설명**

- 찾은 값의 위치가 필요하면 일반 for문을 사용한다.
- 검색 결과 인덱스는 처음에 -1로 초기화한다.
- 배열의 인덱스는 0 이상이므로 -1은 찾지 못했다는 의미로 사용할 수 있다.
- 값을 찾으면 현재 인덱스를 저장하고 반복문을 종료한다.

**코드 문법**

```java
int[] numbers = {10, 20, 30, 40};
int target = 30;
int foundIndex = -1;

for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
        foundIndex = i;
        break;
    }
}

System.out.println(foundIndex);
```

**실행 흐름과 결과**

- `numbers[0] = 10` → 일치하지 않음
- `numbers[1] = 20` → 일치하지 않음
- `numbers[2] = 30` → 일치
- foundIndex = 2
- 반복 종료

```
2
```

**찾지 못한 경우**

```java
int target = 50;
```

같은 값이 없으므로 foundIndex는 초기값 -1을 유지한다.

```
-1
```

**문제와 다른 예제**

```java
int[] numbers = {5, 8, 12, 8};
int target = 8;
int foundIndex = -1;

for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
        foundIndex = i;
        break;
    }
}

System.out.println(foundIndex);
```

```
1
```

같은 값이 여러 개 있다면 break 때문에 첫 번째 위치를 반환한다.

**자주 하는 실수**

찾은 값을 저장하는 것과 인덱스를 저장하는 것을 혼동하지 않아야 한다.

```java
foundIndex = numbers[i]; // 요소의 값을 저장
```

인덱스가 필요하면 i를 저장한다.

```java
foundIndex = i;
```

## 일반 for문과 향상된 for문 선택

| 필요한 작업 | 적절한 반복문 |
|---|---|
| 모든 요소 출력 | 둘 다 가능 |
| 모든 요소 합계 | 둘 다 가능 |
| 현재 인덱스 확인 | 일반 for |
| 배열 요소 직접 변경 | 일반 for |
| 값 존재 여부 검색 | 둘 다 가능 |
| 검색한 위치 확인 | 일반 for |

## 다음으로

다음 학습 내용은 [Part 12「배열③ 2차원 배열」](/dev/lessons/DEV-JAVA-01-12)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 11)

### 확인 1. 가격 배열 순회  `코드 빈칸`

**문제.** prices 배열의 모든 요소를 일반 for문으로 출력하도록 빈칸을 채우시오.

```java
int[] prices = {1500, 2400, 900};

for (int index = 〔①〕; index 〔②〕 prices.〔③〕; index〔④〕) {
    System.out.println(prices[〔⑤〕]);
}
```
- ✅ **정답:** ① = `0` , ② = `<` , ③ = `length` , ④ = `++` , ⑤ = `index`
- 보기 토큰: `0` / `<` / `length` / `++` / `index` / `1` / `<=` / `--` / `i`
- 실행결과:
```
1500
2400
900
```

> 💡 **해설.** 인덱스는 0부터 시작해 배열 길이 prices.length보다 작은 동안(<) ++로 증가하며 prices[index]를 출력한다. 1부터 시작하면 첫 요소가 빠지고, <=는 범위를 벗어나 실행 중 오류가 나며, i는 선언되지 않은 이름이라 오류가 난다.

### 확인 2. 문자열 배열 향상된 for  `코드 빈칸`

**문제.** colors 배열의 모든 요소를 향상된 for문으로 출력하도록 빈칸을 채우시오.

```java
String[] colors = {"red", "green", "blue"};

for (〔①〕 color 〔②〕 colors) {
    System.out.println(color);
}
```
- ✅ **정답:** ① = `String` , ② = `:`
- 보기 토큰: `String` / `:` / `String[]` / `int` / `char` / `;`
- 실행결과:
```
red
green
blue
```

> 💡 **해설.** 향상된 for문은 (요소자료형 변수 : 배열) 형태다. 요소가 문자열이므로 String, 구분 기호는 콜론(:)이다. String[]는 요소가 아니라 배열 자체의 자료형이고, 세미콜론이나 int·char는 이 자리에 맞지 않는다.

### 확인 3. 배열 요소 변경  `객관식`

**문제.** 배열의 모든 요소에 5를 더하려면 빈칸에 어떤 코드를 넣어야 하는가?

```java
int[] numbers = {10, 20, 30};

for (int i = 0; i < numbers.length; i++) {
    ____
}
```

- **A.** `numbers[i] += 5;` ✅
- **B.** `i += 5;`
- **C.** `numbers += 5;`
- **D.** `numbers[0] += i;`
- ✅ **정답:** A

> 💡 **해설.** 현재 인덱스 i의 요소에 5를 더해야 하므로 numbers[i] += 5;다. i += 5는 반복 변수를 바꿔 순회가 깨지고, numbers += 5는 배열에 직접 더할 수 없어 오류, numbers[0] += i는 첫 요소만 바꾼다.

### 확인 4. 홀수 합계 조립  `순서 배열`

**문제.** 배열 선언 → 합계 초기화 → 순회 → 홀수 검사 → 누적 → 출력 순서로 배열하시오.

- ✅ **정답 순서:**
```
int[] values = {3, 8, 5, 10};
int oddTotal = 0;
for (int value : values) {
    if (value % 2 != 0) {
        oddTotal += value;
    }
}
System.out.println(oddTotal);
```

- ❌ **오답 카드(제외):**
```
if (value % 2 == 0) {
oddTotal = value;
```

> 💡 **해설.** value % 2 != 0이면 홀수이므로 oddTotal에 더한다. 3, 8, 5, 10 중 홀수는 3과 5라 합은 8이다.

### 확인 5. 향상된 for문의 복사값  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
int[] points = {2, 4};

for (int point : points) {
    point *= 10;
}

System.out.println(points[0]);
System.out.println(points[1]);
```

- **A.** `20` / `40`
- **B.** `10` / `10`
- **C.** `0` / `0`
- **D.** `2` / `4` ✅
- ✅ **정답:** D

> 💡 **해설.** 향상된 for문의 변수 point에는 배열 요소의 값이 복사되어 들어간다. point를 바꿔도 원본 배열 points는 변하지 않으므로 2, 4가 그대로 출력된다.

### 확인 6. 음수 존재 여부 검색  `코드 빈칸`

**문제.** 음수를 아직 찾지 않은 상태를 나타내도록 hasNegative를 false로 초기화하고, 음수를 하나 찾으면 true로 바꾼 뒤 즉시 검색을 끝내도록 빈칸을 채우시오.

```java
int[] temperatures = {-3, -1, -2};
boolean hasNegative = 〔①〕;

for (int temperature : temperatures) {
    if (temperature 〔②〕 0) {
        hasNegative = 〔③〕;
        〔④〕;
    }
}

System.out.println(hasNegative);
```
- ✅ **정답:** ① = `false` , ② = `<` , ③ = `true` , ④ = `break`
- 보기 토큰: `false` / `true` / `null` / `0` / `<` / `>` / `==` / `>=` / `1` / `break` / `continue` / `default` / `else`
- 실행결과:
```
true
```

> 💡 **해설.** 검색을 시작하기 전에는 음수를 아직 찾지 않았으므로 hasNegative를 false로 초기화한다. 0보다 작은지는 <로 확인한다. 음수를 찾으면 hasNegative에 true를 저장하고 break로 검색을 즉시 끝낸다. continue는 반복을 끝내지 않고 다음 요소를 계속 검사하므로 문제에서 요구한 즉시 종료가 아니다.

### 확인 7. 마지막으로 발견한 인덱스  `순서 배열`

**문제.** 배열 선언 → 검색값 선언 → 인덱스 초기화 → 전체 검색 → 출력 순서로 배열하시오. break를 쓰지 않아 마지막 위치를 저장한다.

- ✅ **정답 순서:**
```
int[] values = {4, 9, 4, 2};
int target = 4;
int foundIndex = -1;
for (int index = 0; index < values.length; index++) {
    if (values[index] == target) {
        foundIndex = index;
    }
}
System.out.println(foundIndex);
```

- ❌ **오답 카드(제외):**
```
if (values[index] != target) {
foundIndex = target;
```

> 💡 **해설.** break를 쓰지 않으므로 target과 같은 값을 만날 때마다 foundIndex가 갱신되어 마지막 위치가 남는다. 4는 인덱스 0과 2에 있으므로 마지막인 2가 출력된다.

---

# Part 12. Java초급12 배열③ 2차원 배열

`DEV-JAVA-01-12` · 문제 7개 (코드 빈칸 3 · 객관식 2 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 2차원 배열을 선언하고 생성한다.
- 행과 열의 인덱스로 요소에 접근한다.
- 초기값을 사용해 2차원 배열을 생성한다.
- length로 행과 열의 길이를 확인한다.
- 중첩 반복문으로 모든 요소를 순회한다.
- 행마다 길이가 다른 2차원 배열을 이해한다.

## 수업 내용

### Part 1. 2차원 배열 선언과 생성

**개념 설명**

- 2차원 배열은 여러 개의 1차원 배열을 저장하는 배열이다.
- 표처럼 행과 열로 이루어진 데이터를 표현할 때 사용한다.
- 첫 번째 인덱스는 행, 두 번째 인덱스는 열을 나타낸다.
- 행과 열의 인덱스는 모두 0부터 시작한다.
- `new int[2][3]`은 2행 3열의 배열을 생성한다.

**코드 문법 분해**

```java
int[][] numbers = new int[2][3];
```

| 코드 | 의미 |
|---|---|
| `int[][]` | int 2차원 배열 자료형 |
| `numbers` | 배열 변수 이름 |
| `new int[2][3]` | 2행 3열의 배열 생성 |
| 첫 번째 `[]` | 행 |
| 두 번째 `[]` | 열 |

**배열 구조**

```
        열 0   열 1   열 2
행 0      0      0      0
행 1      0      0      0
```

int 배열이므로 각 요소는 기본값 0으로 초기화된다.

**선언과 생성 분리**

```java
int[][] numbers;
numbers = new int[2][3];
```

**문제와 다른 예제**

```java
boolean[][] seats = new boolean[3][2];

System.out.println(seats.length);
System.out.println(seats[0].length);
```

실행 결과:

```
3
2
```

**자주 하는 실수**

2차원 배열에는 대괄호가 두 쌍 필요하다.

```java
int[] numbers = new int[2][3];   // 오류
int[][] numbers = new int[2][3]; // 올바름
```

### Part 2. 초기값으로 2차원 배열 생성

**개념 설명**

- 저장할 값을 알고 있다면 중괄호를 사용해 2차원 배열을 만들 수 있다.
- 바깥쪽 중괄호는 전체 배열을 나타낸다.
- 안쪽 중괄호 하나가 한 행을 나타낸다.
- 각 행의 값은 쉼표로 구분한다.
- 행의 개수와 각 행의 열 개수는 작성한 값에 따라 결정된다.

**기본 문법**

```java
int[][] numbers = {
    {10, 20, 30},
    {40, 50, 60}
};
```

**구조**

```
        열 0   열 1   열 2
행 0     10     20     30
행 1     40     50     60
```

다음과 같이 한 줄로도 작성할 수 있다.

```java
int[][] numbers = {{10, 20, 30}, {40, 50, 60}};
```

**코드 문법 분해**

```java
{
    {10, 20, 30},
    {40, 50, 60}
}
```

| 부분 | 의미 |
|---|---|
| 바깥쪽 `{ }` | 전체 2차원 배열 |
| `{10, 20, 30}` | 0번 행 |
| `{40, 50, 60}` | 1번 행 |
| 각 숫자 | 해당 행의 요소 |

**문제와 다른 예제**

```java
String[][] names = {
    {"Kim", "Lee"},
    {"Park", "Choi"}
};

System.out.println(names[0][0]);
System.out.println(names[1][1]);
```

실행 결과:

```
Kim
Choi
```

**자주 하는 실수**

각 행을 구분하는 중괄호를 빠뜨리면 안 된다.

```java
int[][] numbers = {10, 20, 30, 40}; // 오류
```

2차원 배열은 행별로 중괄호를 작성한다.

```java
int[][] numbers = {
    {10, 20},
    {30, 40}
};
```

### Part 3. 행과 열로 요소 접근

**개념 설명**

- 2차원 배열의 요소는 `배열이름[행][열]`로 접근한다.
- 첫 번째 대괄호는 행의 인덱스다.
- 두 번째 대괄호는 해당 행 안의 열 인덱스다.
- 요소를 읽을 수도 있고 새로운 값으로 변경할 수도 있다.
- 행이나 열의 범위를 벗어나면 실행 중 오류가 발생한다.

**요소 읽기**

```java
int[][] numbers = {
    {10, 20, 30},
    {40, 50, 60}
};

System.out.println(numbers[0][1]);
System.out.println(numbers[1][2]);
```

실행 결과:

```
20
60
```

**요소 변경**

```java
numbers[1][0] = 45;

System.out.println(numbers[1][0]);
```

```
45
```

**실행 흐름**

- `numbers[1]` → 두 번째 행 {40, 50, 60}
- `numbers[1][0]` → 두 번째 행의 첫 번째 값 40
- 45 대입 → 40이 45로 변경

**한 행 접근**

`numbers[0]`은 첫 번째 행 전체를 나타내는 1차원 배열이다.

```java
int[] firstRow = numbers[0];

System.out.println(firstRow[2]);
```

```
30
```

**자주 하는 실수**

행과 열의 순서를 반대로 생각하지 않아야 한다. `numbers[행][열]` 순서이며, 다음 배열에서 50의 위치는 `[1][1]`이다.

```
        열 0   열 1
행 0     10     20
행 1     40     50
```

### Part 4. 행과 열의 길이

**개념 설명**

- `배열.length`는 2차원 배열의 행 개수를 나타낸다.
- `배열[행].length`는 해당 행의 열 개수를 나타낸다.
- length에는 소괄호를 붙이지 않는다.
- 각 행의 길이가 다를 수 있으므로 열 길이는 현재 행을 기준으로 확인해야 한다.

**예제**

```java
int[][] numbers = {
    {10, 20, 30},
    {40, 50, 60}
};

System.out.println(numbers.length);
System.out.println(numbers[0].length);
System.out.println(numbers[1].length);
```

실행 결과:

```
2
3
3
```

**마지막 요소 접근**

```java
int lastRow = numbers.length - 1;
int lastColumn = numbers[lastRow].length - 1;

System.out.println(numbers[lastRow][lastColumn]);
```

```
60
```

**자주 하는 실수**

다음 코드는 행 개수를 열 길이로 잘못 사용하고 있다.

```java
numbers.length
```

열 길이는 현재 행에서 확인해야 한다.

```java
numbers[row].length
```

### Part 5. 중첩 for문으로 순회

**개념 설명**

- 2차원 배열의 모든 요소를 처리하려면 중첩 반복문을 사용한다.
- 바깥쪽 반복문은 행을 이동한다.
- 안쪽 반복문은 현재 행의 열을 이동한다.
- 행 조건에는 `numbers.length`를 사용한다.
- 열 조건에는 `numbers[row].length`를 사용한다.

**코드 문법 분해**

```java
int[][] numbers = {
    {10, 20, 30},
    {40, 50, 60}
};

for (int row = 0; row < numbers.length; row++) {
    for (int column = 0; column < numbers[row].length; column++) {
        System.out.println(numbers[row][column]);
    }
}
```

| 반복문 | 역할 |
|---|---|
| 바깥쪽 for | 다음 행으로 이동 |
| 안쪽 for | 현재 행의 요소를 순서대로 처리 |
| `numbers[row][column]` | 현재 요소 |

**실행 흐름과 결과**

- `row = 0` → 10, 20, 30
- `row = 1` → 40, 50, 60

```
10
20
30
40
50
60
```

**행과 열 형태로 출력**

```java
for (int row = 0; row < numbers.length; row++) {
    for (int column = 0; column < numbers[row].length; column++) {
        System.out.print(numbers[row][column]);
        System.out.print(" ");
    }

    System.out.println();
}
```

```
10 20 30
40 50 60
```

**향상된 for문**

```java
for (int[] row : numbers) {
    for (int number : row) {
        System.out.println(number);
    }
}
```

바깥쪽 반복에서는 한 행을 int[]로 꺼내고, 안쪽 반복에서는 해당 행의 요소를 하나씩 꺼낸다.

**자주 하는 실수**

안쪽 반복문의 조건에 전체 행 개수를 사용하면 안 된다.

```java
for (int column = 0; column < numbers.length; column++) {
```

올바른 조건은 다음과 같다.

```java
for (int column = 0; column < numbers[row].length; column++) {
```

### Part 6. 행마다 길이가 다른 배열

**개념 설명**

- Java의 2차원 배열은 여러 1차원 배열을 저장하는 구조다.
- 따라서 모든 행의 길이가 같을 필요는 없다.
- 행마다 열 개수가 다른 배열을 가변 배열 또는 들쭉날쭉한 배열이라고 한다.
- 이러한 배열을 순회할 때는 반드시 각 행의 length를 사용해야 한다.

**예제**

```java
int[][] numbers = {
    {10, 20},
    {30, 40, 50},
    {60}
};
```

**구조**

```
행 0 → 10 20
행 1 → 30 40 50
행 2 → 60
```

**행별 길이**

```java
System.out.println(numbers.length);
System.out.println(numbers[0].length);
System.out.println(numbers[1].length);
System.out.println(numbers[2].length);
```

```
3
2
3
1
```

**전체 요소 순회**

```java
for (int row = 0; row < numbers.length; row++) {
    for (int column = 0; column < numbers[row].length; column++) {
        System.out.println(numbers[row][column]);
    }
}
```

**자주 하는 실수**

모든 행의 길이가 같다고 가정하면 범위를 벗어날 수 있다.

```java
for (int column = 0; column < numbers[0].length; column++) {
    System.out.println(numbers[row][column]);
}
```

각 행의 길이를 사용해야 한다.

```java
column < numbers[row].length
```

## 다음으로

다음 학습 내용은 [Part 13「문자열① 생성·연결·비교」](/dev/lessons/DEV-JAVA-01-13)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 12)

### 확인 1. 2차원 배열 선언과 생성  `코드 빈칸`

**문제.** 2행 3열의 int 배열을 생성하도록 빈칸을 채우시오. (행 개수와 열 개수를 출력한다)

```java
int〔①〕 numbers = new int[〔②〕][〔③〕];
System.out.println(numbers.length);
System.out.println(numbers[0].length);
```
- ✅ **정답:** ① = `[][]` , ② = `2` , ③ = `3`
- 보기 토큰: `[][]` / `2` / `3` / `[]` / `0` / `4`
- 실행결과:
```
2
3
```

> 💡 **해설.** 2차원 배열 자료형은 대괄호 두 쌍(int[][])이고, new int[2][3]으로 2행 3열을 생성한다. 행 개수 numbers.length는 2, 열 개수 numbers[0].length는 3이다. 대괄호 한 쌍만 쓰면 자료형이 맞지 않아 오류, 숫자를 바꾸면 행·열 개수가 달라진다.

### 확인 2. 초기값으로 배열 생성  `객관식`

**문제.** 다음 표와 같은 2차원 배열을 만드는 코드는? (10 20 / 30 40)

- **A.** `int[][] numbers = {{10, 20}, {30, 40}};` ✅
- **B.** `int[] numbers = {{10, 20}, {30, 40}};`
- **C.** `int[][] numbers = {10, 20, 30, 40};`
- **D.** `int[][] numbers = new int[10, 20, 30, 40];`
- ✅ **정답:** A

> 💡 **해설.** 2차원 배열은 int[][]로 선언하고, 안쪽 중괄호 하나가 한 행을 나타낸다. {{10, 20}, {30, 40}}은 2행 2열이 된다. int[]는 대괄호가 부족하고, 중괄호로 행을 나누지 않거나 new int[...] 안에 값을 넣으면 오류다.

### 확인 3. 요소 접근과 변경  `코드 빈칸`

**문제.** 50을 출력한 뒤 40을 45로 변경하도록 빈칸에 인덱스를 채우시오.

```java
int[][] numbers = {
    {10, 20, 30},
    {40, 50, 60}
};

System.out.println(numbers[〔①〕][〔②〕]);

numbers[〔③〕][〔④〕] = 45;

System.out.println(numbers[1][0]);
```
- ✅ **정답:** ① = `1` , ② = `1` , ③ = `1` , ④ = `0`
- 보기 토큰: `1` / `1` / `1` / `0` / `2` / `3`
- 실행결과:
```
50
45
```

> 💡 **해설.** 50은 두 번째 행(인덱스 1) 두 번째 열(인덱스 1)이므로 numbers[1][1]이다. 40은 두 번째 행 첫 번째 열이므로 numbers[1][0] = 45로 변경한다. 행·열 인덱스는 모두 0부터 시작하며, 범위를 벗어나면 실행 중 오류가 난다.

### 확인 4. 행과 열의 길이  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
int[][] numbers = {
    {10, 20},
    {30, 40, 50},
    {60}
};

System.out.println(numbers.length);
System.out.println(numbers[0].length);
System.out.println(numbers[1].length);
System.out.println(numbers[2].length);
```

- **A.** `3`, `2`, `3`, `1` ✅
- **B.** `3`, `3`, `3`, `3`
- **C.** `2`, `3`, `1`, `3`
- **D.** `6`, `2`, `3`, `1`
- ✅ **정답:** A

> 💡 **해설.** numbers.length는 행 개수 3이다. 각 행의 열 개수는 numbers[행].length로, 0번 행은 2개, 1번 행은 3개, 2번 행은 1개다. 전체 요소 수(6)가 아니라 행 개수임에 주의한다.

### 확인 5. 행별 합계  `코드 빈칸`

**문제.** 행마다 길이가 다른 배열의 각 행 합계를 출력하도록 빈칸을 채우시오.

```java
int[][] seats = {{1, 2}, {3, 4, 5}};

for (int row = 0; row 〔①〕 seats.length; row〔②〕) {
    int rowTotal = 0;
    for (int column = 0; column 〔③〕 seats[row].length; column〔④〕) {
        rowTotal += seats[row][column];
    }
    System.out.println(rowTotal);
}
```
- ✅ **정답:** ① = `<` , ② = `++` , ③ = `<` , ④ = `++`
- 보기 토큰: `<` / `<` / `++` / `++` / `<=` / `>` / `==` / `--` / `+= 2` / `+`
- 실행결과:
```
3
12
```

> 💡 **해설.** 바깥 반복은 행 개수만큼, 안쪽 반복은 현재 행의 길이만큼 돌아야 하므로 조건은 각각 <이고 증가는 ++이다. 0번 행 1+2=3, 1번 행 3+4+5=12가 출력된다. <=는 범위를 벗어나 실행 중 오류가 나고, 다른 증감은 결과가 달라진다.

### 확인 6. 향상된 for문 코드 조립  `순서 배열`

**문제.** 향상된 for문으로 2차원 배열의 모든 요소를 출력하는 코드를 실행 순서대로 배열하시오.

- ✅ **정답 순서:**
```
int[][] numbers = {{10, 20}, {30, 40}};
for (int[] row : numbers) {
    for (int number : row) {
        System.out.println(number);
    }
}
```

- ❌ **오답 카드(제외):**
```
for (int number : numbers) {
System.out.println(row);
```

> 💡 **해설.** 바깥쪽 향상된 for는 한 행을 int[] row로 꺼내고, 안쪽 향상된 for는 그 행의 요소를 int number로 하나씩 꺼낸다. 행 요소를 int로 받으면 안 되므로 바깥쪽 변수는 int[]여야 한다. 결과는 10·20·30·40이다.

### 확인 7. 길이가 다른 행의 전체 합계  `순서 배열`

**문제.** 배열 선언 → 합계 초기화 → 바깥 순회 → 안쪽 순회 → 누적 → 출력 순서로 배열하시오.

- ✅ **정답 순서:**
```
int[][] values = {{2}, {4, 6, 8}, {10, 12}};
int total = 0;
for (int[] row : values) {
    for (int value : row) {
        total += value;
    }
}
System.out.println(total);
```

- ❌ **오답 카드(제외):**
```
for (int value : values) {
total = value;
```

> 💡 **해설.** 바깥 향상된 for로 각 행(int[])을 꺼내고, 안쪽 향상된 for로 그 행의 요소를 더한다. 행 길이가 달라도 각 행을 끝까지 순회하므로 2+4+6+8+10+12 = 42가 된다.

---

# Part 13. Java초급13 문자열① 생성·연결·비교

`DEV-JAVA-01-13` · 문제 8개 (코드 빈칸 3 · 객관식 4 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- String 변수를 선언하고 문자열을 생성한다.
- 문자열 리터럴과 new String()의 차이를 이해한다.
- `+`와 `+=`로 문자열을 연결한다.
- 문자열과 숫자가 함께 연결되는 순서를 이해한다.
- `==`와 `equals()`의 차이를 구분한다.
- 문자열 내용이 다른지 비교할 수 있다.

## 수업 내용

### Part 1. 문자열 생성

**개념 설명**

- 문자열은 여러 문자가 연결된 값을 의미한다.
- Java에서는 문자열을 String 자료형으로 표현한다.
- String은 기본형이 아니며 대문자 S로 시작한다.
- 문자열 값은 큰따옴표 `" "`로 감싼다.
- 일반적으로 문자열 리터럴을 변수에 직접 대입하여 생성한다.

**기본 문법**

```java
String language = "Java";
```

**코드 문법 분해**

| 코드 | 의미 |
|---|---|
| `String` | 문자열 자료형 |
| `language` | 문자열 변수 이름 |
| `"Java"` | 문자열 리터럴 |
| `=` | 문자열을 변수에 저장 |

**여러 문자열 생성**

```java
String name = "Lee";
String language = "Java";
String message = "학습 시작";
String empty = "";
```

`""`는 문자가 하나도 없는 빈 문자열이다.

**문자와 문자열 차이**

```java
char grade = 'A';
String text = "A";
```

| 구분 | 자료형 | 작성 기호 |
|---|---|---|
| 문자 한 개 | `char` | 작은따옴표 `' '` |
| 문자열 | `String` | 큰따옴표 `" "` |

**new String()으로 생성**

```java
String first = "Java";
String second = new String("Java");
```

두 변수의 문자열 내용은 모두 "Java"다. 하지만 문자열을 새로 만들기 위해 new String()을 직접 사용할 필요는 거의 없다. 일반적으로 다음 방식을 사용한다.

```java
String language = "Java";
```

**문제와 다른 예제**

```java
public class Main {
    public static void main(String[] args) {
        String course = "Java 초급";
        String part = "문자열";

        System.out.println(course);
        System.out.println(part);
    }
}
```

**실행 결과**

```
Java 초급
문자열
```

**자주 하는 실수**

String의 첫 글자를 소문자로 작성하면 안 된다.

```java
string language = "Java"; // 오류
```

올바른 코드는 다음과 같다.

```java
String language = "Java";
```

문자열에 작은따옴표를 사용해서도 안 된다.

```java
String language = 'Java'; // 오류
String language = "Java"; // 올바름
```

### Part 2. 문자열 연결

**개념 설명**

- `+` 연산자를 사용하면 여러 문자열을 하나로 연결할 수 있다.
- 문자열과 문자열뿐 아니라 문자열과 숫자도 연결할 수 있다.
- 연결된 결과는 새로운 문자열이다.
- `+=`를 사용하면 기존 변수에 문자열을 연결한 결과를 다시 저장할 수 있다.
- 문자열은 한 번 만들어지면 내부 내용을 직접 변경할 수 없다.

**문자열과 문자열 연결**

```java
String first = "Hello";
String second = "Java";

String result = first + " " + second;

System.out.println(result);
```

**실행 결과**

```
Hello Java
```

**코드 문법 분해**

```java
String result = first + " " + second;
```

| 부분 | 의미 |
|---|---|
| `first` | "Hello" |
| `" "` | 공백 하나 |
| `second` | "Java" |
| `+` | 문자열 연결 |
| `result` | 연결 결과를 저장할 변수 |

**+=로 연결**

```java
String message = "Java";

message += " Beginner";

System.out.println(message);
```

```
Java Beginner
```

다음 코드와 같은 의미다.

```java
message = message + " Beginner";
```

**문자열과 숫자 연결**

```java
String name = "Java";
int level = 1;

String result = name + " Level " + level;

System.out.println(result);
```

```
Java Level 1
```

문자열과 숫자를 `+`로 연결하면 숫자가 문자열 형태로 연결된다.

**계산과 문자열 연결 순서**

```java
System.out.println("결과: " + 10 + 20);
```

왼쪽부터 문자열 연결이 실행된다.

- `"결과: " + 10` → `"결과: 10"`
- `"결과: 10" + 20` → `"결과: 1020"`

실행 결과:

```
결과: 1020
```

숫자를 먼저 계산하려면 괄호를 사용한다.

```java
System.out.println("결과: " + (10 + 20));
```

```
결과: 30
```

**문자열 연결 결과 저장**

```java
String message = "Java";
String result = message + " Beginner";

System.out.println(message);
```

위 코드는 연결 결과를 result에 저장했으므로 message는 그대로 "Java"다. message 자체를 바꾸려면 다음과 같이 message에 다시 대입한다.

```java
message = message + " Beginner";
```

또는 다음과 같이 작성한다.

```java
message += " Beginner";
```

**자주 하는 실수**

문자열 연결과 숫자 계산 순서를 혼동하지 않아야 한다.

```java
String result = "합계: " + 5 + 3;
```

```
합계: 53
```

숫자를 먼저 더하려면 괄호를 사용한다.

```java
String result = "합계: " + (5 + 3);
```

```
합계: 8
```

### Part 3. ==와 equals() 비교

**개념 설명**

- 문자열의 내용이 같은지 비교할 때는 `equals()`를 사용한다.
- `==`는 두 변수가 같은 문자열 객체를 가리키는지 비교한다.
- 문자열 리터럴끼리는 `==`가 true가 나올 때도 있지만 내용 비교에 사용하면 안 된다.
- `equals()`는 실제 문자열 내용을 비교하여 true 또는 false를 반환한다.

**equals() 기본 문법**

```java
문자열1.equals(문자열2)
```

**내용 비교**

```java
String first = "Java";
String second = new String("Java");

System.out.println(first.equals(second));
```

실행 결과:

```
true
```

두 문자열의 내용이 모두 "Java"이기 때문이다.

**== 비교**

```java
String first = "Java";
String second = new String("Java");

System.out.println(first == second);
```

실행 결과:

```
false
```

second는 new String()으로 별도로 생성되었으므로 같은 대상을 가리키지 않는다.

**비교 결과 확인**

```java
String input = "admin";

if (input.equals("admin")) {
    System.out.println("관리자");
} else {
    System.out.println("일반 사용자");
}
```

```
관리자
```

**문자열 내용이 다른지 비교**

`equals()`의 결과 앞에 `!`를 붙이면 내용이 다른지 확인할 수 있다.

```java
String first = "Java";
String second = "Python";

boolean different = !first.equals(second);

System.out.println(different);
```

```
true
```

**실행 흐름**

- `first.equals(second)` → false
- `!false` → true

**자주 하는 실수**

문자열 내용을 `==`로 비교하지 않는다.

```java
String input = new String("admin");

if (input == "admin") {
    System.out.println("관리자");
}
```

문자열 내용이 같아도 조건이 false가 될 수 있다. 올바른 코드는 다음과 같다.

```java
if (input.equals("admin")) {
    System.out.println("관리자");
}
```

### Part 4. 문자열 리터럴과 ==의 주의점

**개념 설명**

- Java는 같은 문자열 리터럴을 공유해서 사용할 수 있다.
- 따라서 리터럴로 만든 두 문자열을 `==`로 비교하면 true가 나올 수 있다.
- 하지만 new String()으로 만든 문자열과 비교하면 false가 될 수 있다.
- 이러한 차이 때문에 `==`의 결과에 의존해서 문자열 내용을 비교하면 안 된다.

**예제**

```java
String first = "Java";
String second = "Java";
String third = new String("Java");

System.out.println(first == second);
System.out.println(first == third);

System.out.println(first.equals(second));
System.out.println(first.equals(third));
```

**실행 결과**

```
true
false
true
true
```

**결과 정리**

| 비교 | 결과 | 이유 |
|---|---|---|
| `first == second` | true | 같은 문자열 리터럴 공유 |
| `first == third` | false | third는 새로 생성 |
| `first.equals(second)` | true | 내용이 같음 |
| `first.equals(third)` | true | 내용이 같음 |

**올바른 비교 기준**

```java
first.equals(second)
```

문자열을 비교할 때는 생성 방식과 관계없이 `equals()`를 사용한다.

**char와 String 비교**

| 구분 | char | String |
|---|---|---|
| 표현 대상 | 문자 한 개 | 문자열 |
| 작성 기호 | `'A'` | `"A"` |
| 자료형 종류 | 기본형 | 참조형 |
| 같은지 비교 | `==` | `equals()` |

```java
char firstGrade = 'A';
char secondGrade = 'A';

System.out.println(firstGrade == secondGrade);
```

```java
String firstText = "A";
String secondText = new String("A");

System.out.println(firstText.equals(secondText));
```

두 결과 모두 true다.

## 다음으로

다음 학습 내용은 [Part 14「문자열② 메서드·분할·포맷」](/dev/lessons/DEV-JAVA-01-14)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 13)

### 확인 1. 문자열 생성  `객관식`

**문제.** language에 문자열 "Java"를 저장하는 올바른 코드는?

- **A.** `String language = "Java";` ✅
- **B.** `String language = 'Java';`
- **C.** `string language = "Java";`
- **D.** `char language = "Java";`
- ✅ **정답:** A

> 💡 **해설.** 문자열 자료형은 대문자 S로 시작하는 String이고, 문자열 값은 큰따옴표로 감싼다. 작은따옴표는 문자(char)용이고, string은 소문자라 존재하지 않으며, char에는 문자열을 담을 수 없다.

### 확인 2. 위치 문자열 연결  `코드 빈칸`

**문제.** city와 country를 쉼표로 연결해 "Seoul, Korea"를 만들도록 빈칸을 채우시오. (①과 ②에는 같은 연산자를 넣는다.)

```java
String city = "Seoul";
String country = "Korea";
String location = city 〔①〕 ", " 〔②〕 country;
System.out.println(location);
```
- ✅ **정답:** ① = `+` , ② = `+`
- 보기 토큰: `+` / `+` / `-` / `*` / `==`
- 실행결과:
```
Seoul, Korea
```

> 💡 **해설.** 문자열은 + 연산자로 연결한다. city + ", " + country는 Seoul과 Korea를 쉼표로 이어 Seoul, Korea가 된다. -·*는 문자열에 쓸 수 없고, ==는 비교라 연결이 되지 않아 오류가 난다.

### 확인 3. 숫자를 먼저 계산하여 연결  `객관식`

**문제.** 실행 결과가 "결과: 30"이 되는 코드는?

- **A.** `String result = "결과: " + 10 + 20;`
- **B.** `String result = "결과: " + (10 + 20);` ✅
- **C.** `String result = "결과: " + "10 + 20";`
- **D.** `String result = "결과: " + 10 * 20;`
- ✅ **정답:** B

> 💡 **해설.** 괄호로 (10 + 20)을 먼저 계산해 30을 만든 뒤 문자열에 연결해야 「결과: 30」이 된다. 괄호가 없으면 왼쪽부터 연결되어 「결과: 1020」, 곱셈은 「결과: 200」이 된다.

### 확인 4. 연결 결과 다시 저장하기  `객관식`

**문제.** message에 " Ready"를 연결한 결과를 다시 저장하여 "System Ready"가 출력되도록 하는 코드로 옳은 것은?

```java
String message = "System";

____

System.out.println(message);
```

- **A.** `message + " Ready";`
- **B.** `message = message + " Ready";` ✅
- **C.** `message == " Ready";`
- **D.** `message = " Ready";`
- ✅ **정답:** B

> 💡 **해설.** 문자열을 연결한 결과를 message에 다시 대입해야 "System Ready"가 된다. message + " Ready";와 message == " Ready";는 대입·증감·호출이 아닌 식이라 단독 문장으로 쓸 수 없어 컴파일 오류이고, message = " Ready"는 기존 값 System을 지우고 Ready만 저장한다.

### 확인 5. 문자열 내용 비교  `코드 빈칸`

**문제.** 두 문자열의 내용이 같은지 비교하도록 빈칸에 메서드 이름을 채우시오.

```java
String first = "Java";
String second = new String("Java");

boolean same = first.〔①〕(second);

System.out.println(same);
```
- ✅ **정답:** ① = `equals`
- 보기 토큰: `equals` / `compare` / `equal` / `same`
- 실행결과:
```
true
```

> 💡 **해설.** 문자열 내용 비교는 equals() 메서드로 한다. 두 문자열의 내용이 모두 "Java"이므로 first.equals(second)는 true다. compare·equal·same은 String에 없는 이름이라 컴파일 오류가 난다.

### 확인 6. 객체와 내용 비교  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
String first = "blue";
String second = new String("blue");

System.out.println(first == second);
System.out.println(first.equals(second));
```

- **A.** `true` / `true`
- **B.** `false` / `false`
- **C.** `false` / `true` ✅
- **D.** `true` / `false`
- ✅ **정답:** C

> 💡 **해설.** new String()으로 만든 second는 별도의 객체라 == 로 참조를 비교하면 false다. 하지만 equals()는 내용을 비교하므로 두 문자열의 내용이 같아 true다. 문자열 내용 비교는 반드시 equals()를 쓴다.

### 확인 7. 다른 명령인지 비교  `코드 빈칸`

**문제.** current와 requested의 내용이 다르면 changed가 true가 되도록 빈칸을 채우시오.

```java
String current = "ON";
String requested = "OFF";
boolean changed = 〔①〕current.〔②〕(requested);
System.out.println(changed);
```
- ✅ **정답:** ① = `!` , ② = `equals`
- 보기 토큰: `!` / `equals` / `=` / `==` / `+` / `compare` / `same` / `equal`
- 실행결과:
```
true
```

> 💡 **해설.** equals()로 내용을 비교하고 그 앞에 !를 붙이면 「다른지」를 확인할 수 있다. "ON".equals("OFF")는 false이고, !false는 true다. ==·=는 이 자리에 올 수 없고, compare·same·equal은 존재하지 않는 메서드라 오류가 난다.

### 확인 8. 입력 문자열 비교 코드 조립  `순서 배열`

**문제.** import → 클래스 선언 → main 선언 → Scanner 생성 → 한 줄 입력 → 문자열 비교와 출력 → Scanner 종료 순서로 배열하시오. Scanner는 결과를 출력한 뒤 닫는다.

- ✅ **정답 순서:**
```
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine();
        if (input.equals("admin")) {
            System.out.println("관리자");
        } else {
            System.out.println("일반 사용자");
        }
        scanner.close();
    }
}
```

- ❌ **오답 카드(제외):**
```
String input = scanner.nextInt();
if (input != "admin") {
```

> 💡 **해설.** 한 줄 입력은 nextLine()으로 받고, 문자열 내용 비교는 input.equals("admin")으로 한다. ==로 비교하면 내용이 같아도 false가 될 수 있으므로 반드시 equals()를 쓴다. admin이면 관리자, 아니면 일반 사용자가 출력된다.

---

# Part 14. Java초급14 문자열② 메서드·분할·포맷

`DEV-JAVA-01-14` · 문제 8개 (코드 빈칸 4 · 객관식 3 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 문자열 길이와 특정 위치의 문자를 확인한다.
- 문자열의 일부를 잘라 새로운 문자열을 만든다.
- 문자열 안에서 원하는 내용을 검색하거나 변경한다.
- split()으로 문자열을 여러 요소로 분리한다.
- printf()와 String.format()으로 출력 형식을 지정한다.
- 문자열 메서드의 실행 결과를 새로 저장해야 하는 이유를 이해한다.

## 수업 내용

### Part 1. 길이·문자·부분 문자열

**개념 설명**

- String은 문자열을 처리하는 여러 메서드를 제공한다.
- `length()`는 문자열의 문자 개수를 반환한다.
- `charAt(index)`는 지정한 인덱스의 문자 하나를 반환한다.
- `substring()`은 문자열의 일부를 잘라 새로운 문자열로 반환한다.
- 문자열의 첫 번째 인덱스는 배열과 마찬가지로 0이다.

**주요 메서드**

| 메서드 | 기능 | 예시 |
|---|---|---|
| `length()` | 문자열 길이 | `text.length()` |
| `charAt(index)` | 지정한 위치의 문자 | `text.charAt(0)` |
| `substring(begin)` | begin부터 끝까지 자르기 | `text.substring(2)` |
| `substring(begin, end)` | begin부터 end 직전까지 자르기 | `text.substring(1, 4)` |

**length()**

```java
String text = "Java";

System.out.println(text.length());
```

```
4
```

**charAt()**

```java
String text = "Java";

System.out.println(text.charAt(0));
System.out.println(text.charAt(3));
```

```
J
a
```

사용 가능한 인덱스는 0부터 `text.length() - 1`까지다.

**substring()**

```java
String text = "JavaBasic";

System.out.println(text.substring(4));
System.out.println(text.substring(0, 4));
```

```
Basic
Java
```

`substring(0, 4)`는 인덱스 0부터 3까지만 포함한다. 마지막 인덱스 4는 결과에 포함되지 않는다.

**문제와 다른 예제**

```java
String code = "DEV-2026";

String category = code.substring(0, 3);
String year = code.substring(4);

System.out.println(category);
System.out.println(year);
```

```
DEV
2026
```

**자주 하는 실수**

문자열의 길이가 4라고 해서 인덱스 4에 접근할 수 있는 것은 아니다.

```java
String text = "Java";

System.out.println(text.charAt(4)); // 실행 중 오류
```

마지막 인덱스는 3이다.

```java
text.charAt(text.length() - 1)
```

### Part 2. 검색·변환·치환

**개념 설명**

- 문자열 메서드로 특정 내용의 포함 여부나 위치를 확인할 수 있다.
- `contains()`는 문자열이 포함되어 있는지 확인한다.
- `indexOf()`는 문자열이 처음 나타나는 인덱스를 반환한다.
- 찾지 못하면 -1을 반환한다.
- `replace()`는 문자열의 일부를 다른 내용으로 바꾼 새 문자열을 만든다.
- `trim()`은 문자열 앞뒤의 공백을 제거한 새 문자열을 만든다.

**주요 메서드**

| 메서드 | 기능 | 반환 예시 |
|---|---|---|
| `contains("문자열")` | 포함 여부 확인 | true, false |
| `indexOf("문자열")` | 처음 나타난 위치 | 인덱스 또는 -1 |
| `startsWith("문자열")` | 해당 내용으로 시작하는지 확인 | true, false |
| `endsWith("문자열")` | 해당 내용으로 끝나는지 확인 | true, false |
| `replace("기존", "변경")` | 문자열 내용 치환 | 새로운 문자열 |
| `trim()` | 앞뒤 공백 제거 | 새로운 문자열 |
| `toUpperCase()` | 영문 대문자로 변환 | 새로운 문자열 |
| `toLowerCase()` | 영문 소문자로 변환 | 새로운 문자열 |

**검색 예제**

```java
String text = "Java Beginner";

System.out.println(text.contains("Java"));
System.out.println(text.indexOf("Beginner"));
System.out.println(text.indexOf("Python"));
```

```
true
5
-1
```

**변환 예제**

```java
String text = "  java basic  ";

String result = text.trim().toUpperCase();

System.out.println(result);
```

```
JAVA BASIC
```

**치환 예제**

```java
String date = "2026/07/18";

String result = date.replace("/", "-");

System.out.println(result);
```

```
2026-07-18
```

**문자열은 직접 변경되지 않음**

```java
String text = "java";

text.toUpperCase();

System.out.println(text);
```

```
java
```

메서드가 반환한 결과를 저장해야 한다.

```java
text = text.toUpperCase();

System.out.println(text);
```

```
JAVA
```

**자주 하는 실수**

`indexOf()`가 값을 찾지 못했을 때 0을 반환한다고 생각하면 안 된다.

```java
String text = "Java";

System.out.println(text.indexOf("Python"));
```

```
-1
```

인덱스 0은 문자열의 첫 번째 위치이므로 검색 실패를 나타낼 수 없다.

### Part 3. split()으로 문자열 분할

**개념 설명**

- `split()`은 문자열을 기준 문자로 나누어 String[] 배열로 반환한다.
- 분할 기준으로 사용한 문자는 결과 배열에 포함되지 않는다.
- 반환된 배열은 인덱스나 반복문으로 처리할 수 있다.
- 쉼표로 구분된 데이터나 날짜처럼 일정한 구분자가 있는 문자열에 사용한다.

**기본 문법**

```java
String[] 결과배열 = 문자열.split("구분자");
```

**쉼표로 분할**

```java
String data = "Java,Python,JavaScript";

String[] languages = data.split(",");

System.out.println(languages[0]);
System.out.println(languages[1]);
System.out.println(languages[2]);
```

```
Java
Python
JavaScript
```

**코드 문법 분해**

```java
String[] languages = data.split(",");
```

| 부분 | 의미 |
|---|---|
| `data` | 분할할 원본 문자열 |
| `split(",")` | 쉼표를 기준으로 분할 |
| `String[]` | 분할 결과의 자료형 |
| `languages` | 결과 배열 이름 |

**분할 결과 순회**

```java
String data = "Kim,Lee,Park";
String[] names = data.split(",");

for (String name : names) {
    System.out.println(name);
}
```

```
Kim
Lee
Park
```

**날짜 분할**

```java
String date = "2026-07-18";
String[] parts = date.split("-");

System.out.println(parts[0]);
System.out.println(parts[1]);
System.out.println(parts[2]);
```

```
2026
07
18
```

**점을 기준으로 분할**

`split()`의 구분자는 정규 표현식으로 처리된다. 점 `.`은 특별한 의미를 가지므로 역슬래시를 사용해야 한다.

```java
String address = "www.example.com";

String[] parts = address.split("\\.");
```

결과:

```
www
example
com
```

**자주 하는 실수**

다음 코드는 점을 일반 문자로 처리하지 않는다.

```java
String[] parts = address.split(".");
```

점을 기준으로 나누려면 다음과 같이 작성한다.

```java
String[] parts = address.split("\\.");
```

### Part 4. printf()로 형식 출력

**개념 설명**

- `System.out.printf()`는 값을 지정한 형식에 맞춰 출력한다.
- 문자열 안에 형식 지정자를 작성하고 뒤에 출력할 값을 전달한다.
- `%s`는 문자열, `%d`는 정수, `%f`는 실수를 나타낸다.
- `%.2f`는 실수를 소수점 둘째 자리까지 출력한다.
- `%n`은 줄바꿈을 의미한다.

**주요 형식 지정자**

| 지정자 | 값의 종류 | 예시 |
|---|---|---|
| `%s` | 문자열 | "Java" |
| `%d` | 정수 | 100 |
| `%f` | 실수 | 3.14 |
| `%.1f` | 소수점 첫째 자리 | 3.1 |
| `%.2f` | 소수점 둘째 자리 | 3.14 |
| `%n` | 줄바꿈 | 다음 줄로 이동 |

**기본 문법**

```java
System.out.printf("형식 문자열", 값1, 값2);
```

**예제**

```java
String name = "Lee";
int score = 95;
double average = 92.345;

System.out.printf("이름: %s%n", name);
System.out.printf("점수: %d%n", score);
System.out.printf("평균: %.2f%n", average);
```

**실행 결과**

```
이름: Lee
점수: 95
평균: 92.35
```

92.345는 소수점 둘째 자리까지 출력되면서 반올림된다.

**여러 값 출력**

```java
String product = "Keyboard";
int quantity = 3;
double price = 2500.5;

System.out.printf("%s %d개 %.1f원%n", product, quantity, price);
```

```
Keyboard 3개 2500.5원
```

**자주 하는 실수**

`printf()`는 자동으로 줄을 바꾸지 않는다.

```java
System.out.printf("%d", 10);
System.out.printf("%d", 20);
```

```
1020
```

줄바꿈이 필요하면 `%n`을 사용한다.

```java
System.out.printf("%d%n", 10);
System.out.printf("%d%n", 20);
```

### Part 5. String.format()으로 형식 문자열 생성

**개념 설명**

- `String.format()`은 지정한 형식에 맞는 문자열을 만들어 반환한다.
- `printf()`는 즉시 화면에 출력하지만 `String.format()`은 출력하지 않는다.
- 반환된 문자열을 변수에 저장한 후 필요한 곳에서 사용할 수 있다.
- 형식 지정자는 `printf()`와 동일하게 사용한다.

**기본 문법**

```java
String 결과 = String.format("형식 문자열", 값1, 값2);
```

**예제**

```java
String name = "Lee";
int score = 95;

String result = String.format("%s님의 점수는 %d점입니다.", name, score);

System.out.println(result);
```

```
Lee님의 점수는 95점입니다.
```

**printf()와 비교**

```java
System.out.printf("점수: %d%n", score);
```

화면에 바로 출력한다.

```java
String result = String.format("점수: %d", score);
```

문자열을 만들어 result에 저장한다.

**문제와 다른 예제**

```java
String item = "Monitor";
double price = 19999.5;

String message = String.format("%s: %.1f원", item, price);

System.out.println(message);
```

```
Monitor: 19999.5원
```

**자주 하는 실수**

`String.format()`이 자동으로 출력한다고 생각하면 안 된다.

```java
String.format("점수: %d", 100);
```

반환값을 저장하거나 출력해야 한다.

```java
String result = String.format("점수: %d", 100);
System.out.println(result);
```

또는 다음과 같이 바로 출력한다.

```java
System.out.println(String.format("점수: %d", 100));
```

## 메서드 선택 기준

| 필요한 작업 | 사용할 기능 |
|---|---|
| 문자열 길이 | `length()` |
| 특정 위치의 문자 | `charAt()` |
| 문자열 일부 추출 | `substring()` |
| 포함 여부 확인 | `contains()` |
| 위치 검색 | `indexOf()` |
| 내용 치환 | `replace()` |
| 앞뒤 공백 제거 | `trim()` |
| 문자열 분할 | `split()` |
| 형식에 맞춰 바로 출력 | `printf()` |
| 형식 문자열 생성 | `String.format()` |

## 다음으로

다음 학습 내용은 [Part 15「메서드① 정의·호출·매개변수」](/dev/lessons/DEV-JAVA-01-15)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 14)

### 확인 1. 길이와 문자 확인  `코드 빈칸`

**문제.** 문자열 길이와 첫 번째 문자를 출력하도록 빈칸에 메서드 이름을 채우시오.

```java
String text = "Java";

System.out.println(text.〔①〕());
System.out.println(text.〔②〕(0));
```
- ✅ **정답:** ① = `length` , ② = `charAt`
- 보기 토큰: `length` / `charAt` / `size` / `count` / `indexOf` / `substring`
- 실행결과:
```
4
J
```

> 💡 **해설.** length()는 문자 개수를 반환해 4, charAt(0)은 인덱스 0의 문자 J를 반환한다. size()·count()는 String에 없는 이름이라 컴파일 오류이고, indexOf·substring은 인자가 필요해 이 자리에 그대로 쓰면 오류가 난다.

### 확인 2. 부분 문자열 추출  `객관식`

**문제.** "JavaBasic"에서 "Basic"만 잘라내는 코드 한 줄로 옳은 것은?

```java
String text = "JavaBasic";

____

System.out.println(result);
```

- **A.** `String result = text.substring(0, 4);`
- **B.** `String result = text.substring(4);` ✅
- **C.** `String result = text.charAt(4);`
- **D.** `String result = text.substring(5);`
- ✅ **정답:** B

> 💡 **해설.** substring(4)는 인덱스 4의 B부터 문자열 끝까지 반환해 Basic이 된다. substring(0, 4)는 인덱스 0~3인 Java, substring(5)는 asic이 되고, charAt(4)는 문자 하나(char)라 String 변수에 담으면 컴파일 오류가 난다.

### 확인 3. 문자열 검색  `코드 빈칸`

**문제.** "Java" 포함 여부와 "Beginner"가 시작되는 인덱스를 구하도록 빈칸에 메서드 이름을 채우시오.

```java
String text = "Java Beginner";

boolean hasJava = text.〔①〕("Java");
int beginnerIndex = text.〔②〕("Beginner");

System.out.println(hasJava);
System.out.println(beginnerIndex);
```
- ✅ **정답:** ① = `contains` , ② = `indexOf`
- 보기 토큰: `contains` / `indexOf` / `equals` / `substring` / `replace` / `length`
- 실행결과:
```
true
5
```

> 💡 **해설.** contains()는 포함 여부를 boolean으로 돌려줘 true, indexOf()는 처음 나타난 위치를 돌려줘 Beginner의 시작 인덱스 5가 된다. equals()는 전체 내용이 같은지 비교하므로 false이고, substring·replace·length는 이 자리에서 반환값 자료형이 맞지 않아 컴파일 오류가 난다.

### 확인 4. 문자열 메서드의 반환값  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
String text = " java ";

text.trim();
text.toUpperCase();

System.out.println("[" + text + "]");
```

- **A.** `[JAVA]`
- **B.** `[java]`
- **C.** `[ java ]` ✅
- **D.** `[ JAVA ]`
- ✅ **정답:** C

> 💡 **해설.** trim()과 toUpperCase()는 새 문자열을 반환할 뿐 text 자체를 바꾸지 않는데, 반환값을 저장하지 않았으므로 text는 그대로 " java "다. 따라서 앞뒤 공백이 그대로 남아 [ java ]가 출력된다. 실제로 바꾸려면 text = text.trim().toUpperCase();처럼 결과를 다시 저장해야 한다.

### 확인 5. 문자열 분할  `코드 빈칸`

**문제.** 쉼표를 기준으로 문자열을 분할하고 모든 결과를 출력하도록 빈칸에 메서드·자료형·기호를 채우시오.

```java
String data = "Java,Python,JavaScript";

String[] languages = data.〔①〕(",");

for (〔②〕 language 〔③〕 languages) {
    System.out.println(language);
}
```
- ✅ **정답:** ① = `split` , ② = `String` , ③ = `:`
- 보기 토큰: `split` / `String` / `:` / `replace` / `String[]` / `;`
- 실행결과:
```
Java
Python
JavaScript
```

> 💡 **해설.** split(",")은 쉼표를 기준으로 나눠 String[] 배열을 돌려주고, 향상된 for문은 (String language : languages) 형태로 배열 요소를 하나씩 꺼낸다. 요소의 자료형은 배열 요소와 같은 String이고 구분 기호는 콜론(:)이다. String[]는 요소가 아니라 배열 전체의 자료형이라 맞지 않고, replace는 인자가 두 개 필요하며 세미콜론은 이 자리에 올 수 없어 컴파일 오류가 난다.

### 확인 6. 세로 막대를 기준으로 분할  `객관식`

**문제.** 문자열 red|green|blue를 세로 막대 문자 |를 기준으로 분할하는 코드로 옳은 것은?

```java
String colors = "red|green|blue";

____
```

- **A.** `String[] parts = colors.split("|");`
- **B.** `String[] parts = colors.split("/");`
- **C.** `String[] parts = colors.split("\\|");` ✅
- **D.** `String[] parts = colors.split(",");`
- ✅ **정답:** C

> 💡 **해설.** split()의 구분자는 정규 표현식으로 처리된다. |는 정규 표현식에서 특별한 의미가 있으므로 문자 자체로 나누려면 역슬래시로 이스케이프해야 하고, 자바 문자열 안에서는 역슬래시를 한 번 더 써 "\\|"로 작성한다. "|"만 쓰면 모든 위치에 매칭돼 의도대로 나뉘지 않고, "/"·","는 이 문자열에 없어 분할되지 않는다.

### 확인 7. printf() 형식 완성  `코드 빈칸`

**문제.** 이름·점수·평균을 지정된 형식으로 출력하도록 빈칸에 메서드 이름과 형식 지정자를 채우시오. (평균은 소수점 둘째 자리까지)

```java
String name = "Lee";
int score = 95;
double average = 92.345;

System.out.〔①〕(
    "이름: 〔②〕, 점수: 〔③〕, 평균: 〔④〕〔⑤〕",
    name,
    score,
    average
);
```
- ✅ **정답:** ① = `printf` , ② = `%s` , ③ = `%d` , ④ = `%.2f` , ⑤ = `%n`
- 보기 토큰: `printf` / `%s` / `%d` / `%.2f` / `%n` / `println` / `%f`
- 실행결과:
```
이름: Lee, 점수: 95, 평균: 92.35
```

> 💡 **해설.** printf()는 형식 문자열의 지정자 자리에 뒤의 값을 순서대로 넣어 출력한다. 문자열 name은 %s, 정수 score는 %d, 실수 average는 소수점 둘째 자리까지 %.2f로 나타내고 마지막 %n으로 줄을 바꾼다. 92.345는 %.2f에서 반올림돼 92.35가 된다. %d 자리에 문자열이 오면 실행 중 오류가 나므로 값의 자료형에 맞는 지정자를 써야 하고, printf 대신 println을 쓰면 이런 형식 인자를 받을 수 없어 컴파일 오류가 난다.

### 확인 8. 주문 문장 만들기  `순서 배열`

**문제.** 상품명 선언 → 수량 선언 → 가격 선언 → 형식 문자열 생성 → 출력 순서로 코드를 배열하시오.

- ✅ **정답 순서:**
```
String item = "Book";
int quantity = 2;
double price = 12500.5;
String result = String.format("%s %d개: %.1f원", item, quantity, price);
System.out.println(result);
```

- ❌ **오답 카드(제외):**
```
String result = String.format("%d %s개: %.1f원", item, quantity, price);
System.out.println(price);
```

> 💡 **해설.** String.format()에서 %s에는 상품명, %d에는 정수 수량, %.1f에는 실수 가격이 들어간다. 사용할 변수들을 먼저 선언하고, 만들어진 문자열을 result에 저장한 다음 출력한다. 결과는 Book 2개: 12500.5원이다.

---

# Part 15. Java초급15 메서드① 정의·호출·매개변수

`DEV-JAVA-01-15` · 문제 9개 (코드 빈칸 5 · 객관식 3 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 메서드를 사용하는 이유를 이해한다.
- 매개변수가 없는 void 메서드를 정의하고 호출한다.
- 매개변수와 인수의 차이를 구분한다.
- 여러 개의 매개변수를 선언하고 값을 전달한다.
- 메서드 호출부터 종료까지의 실행 흐름을 이해한다.
- 메서드 정의 위치와 호출 문법을 올바르게 작성한다.

## 수업 내용

### Part 1. 메서드의 개념

**개념 설명**

- 메서드는 특정 작업을 수행하도록 묶어 놓은 코드다.
- 반복해서 사용하는 코드를 메서드로 만들면 중복을 줄일 수 있다.
- 메서드는 이름을 사용해 필요한 시점에 호출한다.
- 호출된 메서드의 실행이 끝나면 호출했던 위치로 돌아온다.
- 이번 파트에서는 값을 반환하지 않는 void 메서드를 사용한다.

**메서드를 사용하지 않은 코드**

```java
System.out.println("학습 시작");
System.out.println("Java");

System.out.println("학습 시작");
System.out.println("Java");
```

같은 코드가 반복되고 있다.

**메서드를 사용한 코드**

```java
static void printLesson() {
    System.out.println("학습 시작");
    System.out.println("Java");
}
```

필요한 위치에서 메서드를 호출한다.

```java
printLesson();
printLesson();
```

**실행 결과**

```
학습 시작
Java
학습 시작
Java
```

**메서드 이름**

메서드 이름은 일반적으로 소문자로 시작하는 카멜 표기법을 사용한다.

```java
printMessage
showResult
printUserInfo
```

메서드가 수행하는 작업을 알 수 있도록 동작을 나타내는 이름을 사용하는 것이 좋다.

### Part 2. 메서드 정의와 호출

**개념 설명**

- 메서드 정의는 메서드가 실행할 코드를 작성하는 것이다.
- 메서드 호출은 정의된 메서드를 실제로 실행하는 것이다.
- 메서드는 클래스 내부이면서 다른 메서드의 외부에 정의한다.
- main에서 직접 호출할 이번 단계의 메서드에는 static을 붙인다.
- static의 자세한 의미는 중급 과정에서 학습한다.

**기본 문법**

```java
static void 메서드이름() {
    실행할 코드
}
```

**코드 문법 분해**

```java
static void greet() {
    System.out.println("안녕하세요");
}
```

| 부분 | 의미 |
|---|---|
| `static` | main에서 직접 호출할 수 있게 함 |
| `void` | 반환하는 값이 없음 |
| `greet` | 메서드 이름 |
| `( )` | 매개변수를 작성하는 위치 |
| `{ }` | 메서드가 실행할 코드 |

**메서드 호출**

```java
greet();
```

메서드 이름 뒤에 소괄호와 세미콜론을 작성한다.

**전체 예제**

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("시작");

        greet();

        System.out.println("종료");
    }

    static void greet() {
        System.out.println("안녕하세요");
    }
}
```

**실행 흐름**

- main 메서드가 시작된다.
- "시작"을 출력한다.
- greet()를 호출한다.
- greet 내부에서 "안녕하세요"를 출력한다.
- greet가 종료되어 main으로 돌아간다.
- "종료"를 출력한다.

**실행 결과**

```
시작
안녕하세요
종료
```

**자주 하는 실수**

메서드를 main 내부에 정의할 수 없다.

```java
public static void main(String[] args) {
    static void greet() { // 오류
        System.out.println("안녕하세요");
    }
}
```

메서드는 main의 중괄호가 끝난 뒤 클래스 내부에 작성한다.

```java
public static void main(String[] args) {
    greet();
}

static void greet() {
    System.out.println("안녕하세요");
}
```

### Part 3. 매개변수와 인수

**개념 설명**

- 매개변수는 메서드가 외부에서 값을 전달받기 위해 선언하는 변수다.
- 메서드를 호출할 때 전달하는 실제 값을 인수라고 한다.
- 매개변수는 메서드 이름 뒤의 소괄호 안에 선언한다.
- 호출할 때는 매개변수의 자료형에 맞는 값을 전달해야 한다.
- 전달받은 값은 메서드 내부에서 사용할 수 있다.

**기본 문법**

```java
static void 메서드이름(자료형 매개변수) {
    실행할 코드
}
```

**예제**

```java
static void greet(String name) {
    System.out.println(name);
    System.out.println("안녕하세요");
}
```

메서드 호출:

```java
greet("Lee");
```

**용어 구분**

```java
static void greet(String name)
```

name은 매개변수다.

```java
greet("Lee");
```

"Lee"는 호출할 때 전달하는 인수다.

**전체 예제**

```java
public class Main {
    public static void main(String[] args) {
        greet("Lee");
        greet("Kim");
    }

    static void greet(String name) {
        System.out.println(name);
        System.out.println("안녕하세요");
    }
}
```

**실행 흐름과 결과**

첫 번째 호출:

- "Lee" 전달 → name에 "Lee" 저장 → Lee 출력 → 안녕하세요 출력

두 번째 호출:

- "Kim" 전달 → name에 "Kim" 저장 → Kim 출력 → 안녕하세요 출력

실행 결과:

```
Lee
안녕하세요
Kim
안녕하세요
```

**자주 하는 실수**

매개변수가 있는 메서드를 호출하면서 값을 전달하지 않으면 오류가 발생한다.

```java
static void greet(String name) {
    System.out.println(name);
}

greet(); // 오류
```

문자열 값을 전달해야 한다.

```java
greet("Lee");
```

자료형이 다른 값을 전달해도 오류가 발생할 수 있다.

```java
greet(100); // 오류
```

greet의 매개변수는 String이므로 문자열을 전달해야 한다.

### Part 4. 여러 개의 매개변수

**개념 설명**

- 메서드는 여러 값을 전달받을 수 있다.
- 매개변수는 쉼표로 구분한다.
- 각 매개변수마다 자료형과 이름을 모두 작성해야 한다.
- 호출할 때는 매개변수의 개수, 순서, 자료형을 맞춰야 한다.
- 전달된 인수는 작성된 순서대로 매개변수에 저장된다.

**기본 문법**

```java
static void 메서드이름(
        자료형 매개변수1,
        자료형 매개변수2) {

    실행할 코드
}
```

한 줄로도 작성할 수 있다.

```java
static void printUser(String name, int age) {
    System.out.println(name);
    System.out.println(age);
}
```

**호출**

```java
printUser("Lee", 25);
```

**실행 흐름**

- "Lee" → name
- 25 → age

**전체 예제**

```java
public class Main {
    public static void main(String[] args) {
        printUser("Lee", 25);
        printUser("Kim", 30);
    }

    static void printUser(String name, int age) {
        System.out.println(name);
        System.out.println(age);
    }
}
```

**실행 결과**

```
Lee
25
Kim
30
```

**숫자 매개변수 예제**

```java
static void printTotal(int first, int second) {
    int total = first + second;

    System.out.println(total);
}
```

호출:

```java
printTotal(10, 20);
```

실행 결과:

```
30
```

**자주 하는 실수**

매개변수마다 자료형을 작성해야 한다.

```java
static void printTotal(int first, second) { // 오류
}
```

올바른 코드는 다음과 같다.

```java
static void printTotal(int first, int second) {
}
```

호출할 때 순서를 바꾸면 다른 매개변수에 값이 전달된다.

```java
static void printUser(String name, int age) {
}
```

올바른 호출:

```java
printUser("Lee", 25);
```

다음 호출은 자료형 순서가 맞지 않아 오류가 발생한다.

```java
printUser(25, "Lee"); // 오류
```

### Part 5. 메서드 재사용과 실행 순서

**개념 설명**

- 한 번 정의한 메서드는 여러 번 호출할 수 있다.
- 호출할 때마다 전달하는 인수를 다르게 지정할 수 있다.
- 메서드는 호출된 순서대로 실행된다.
- 한 메서드의 실행이 끝나야 다음 코드가 실행된다.

**예제**

```java
public class Main {
    public static void main(String[] args) {
        printMessage("첫 번째");
        printMessage("두 번째");
        printMessage("세 번째");
    }

    static void printMessage(String message) {
        System.out.println(message);
    }
}
```

**실행 흐름과 결과**

- printMessage("첫 번째") 호출 → 첫 번째 출력
- printMessage("두 번째") 호출 → 두 번째 출력
- printMessage("세 번째") 호출 → 세 번째 출력

```
첫 번째
두 번째
세 번째
```

**메서드에서 다른 메서드 호출**

```java
public class Main {
    public static void main(String[] args) {
        startLesson();
    }

    static void startLesson() {
        System.out.println("수업 시작");
        printTopic("메서드");
    }

    static void printTopic(String topic) {
        System.out.println(topic);
    }
}
```

**실행 결과**

```
수업 시작
메서드
```

main이 startLesson()을 호출하고, startLesson()이 다시 printTopic()을 호출한다.

**자주 하는 실수**

메서드를 정의하기만 하면 자동으로 실행된다고 생각하면 안 된다.

```java
static void greet() {
    System.out.println("안녕하세요");
}
```

호출하지 않으면 실행되지 않는다.

```java
greet();
```

## 다음으로

다음 학습 내용은 [Part 16「메서드② 반환값·조기 종료·배열」](/dev/lessons/DEV-JAVA-01-16)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 15)

### 확인 1. 메서드 정의 후 호출  `순서 배열`

**문제.** 클래스 선언 → showStart() 정의 → main 정의 → showStart() 호출 순서로 배열하시오. 이 문제에서는 showStart()를 main보다 먼저 작성한다.

- ✅ **정답 순서:**
```
public class Main {
    static void showStart() {
        System.out.println("시작");
    }
    public static void main(String[] args) {
        showStart();
    }
}
```

- ❌ **오답 카드(제외):**
```
static void showStart(String text) {
showStart;
```

> 💡 **해설.** 메서드는 클래스 안이면서 main 밖에 static void showStart()로 정의하고, main에서 showStart();로 호출한다. main이 실행되면 showStart()가 호출되어 「시작」이 출력된다.

### 확인 2. 이름을 받아 인사  `코드 빈칸`

**문제.** String 매개변수 name을 받아 Hello, Java를 출력하도록 자료형과 문자열 연결 연산자를 채우시오.

```java
public class Main {
    static void greet(〔①〕 name) {
        System.out.println("Hello, " 〔②〕 name);
    }
    public static void main(String[] args) {
        greet("Java");
    }
}
```
- ✅ **정답:** ① = `String` , ② = `+`
- 보기 토큰: `String` / `char` / `+` / `-`
- 실행결과:
```
Hello, Java
```

> 💡 **해설.** name에는 문자열이 전달되므로 매개변수 자료형은 String이다. "Hello, "와 name은 +로 연결한다. char는 문자 한 개를 저장하는 자료형이고, -는 문자열 연결에 사용할 수 없다.

### 확인 3. 두 매개변수로 범위 출력  `코드 빈칸`

**문제.** 반환형·매개변수 타입·호출 인수를 채워 2부터 4까지 출력하도록 완성하시오.

```java
public class Main {
    static 〔①〕 printRange(〔②〕 start, 〔③〕 end) {
        for (int i = start; i <= end; i++) {
            System.out.println(i);
        }
    }

    public static void main(String[] args) {
        printRange(〔④〕, 〔⑤〕);
    }
}
```
- ✅ **정답:** ① = `void` , ② = `int` , ③ = `int` , ④ = `2` , ⑤ = `4`
- 보기 토큰: `void` / `int` / `int` / `2` / `4` / `String` / `double` / `1` / `3`
- 실행결과:
```
2
3
4
```

> 💡 **해설.** 반환값이 없는 메서드이므로 void를 사용한다. start와 end는 정수이므로 각각 int이며, printRange(2, 4)를 호출하면 2부터 4까지 출력된다.

### 확인 4. 다른 타입의 인수 전달  `코드 빈칸`

**문제.** printUser(String name, int age)에 이름 "Kim"과 나이 20을 매개변수의 자료형과 순서에 맞게 전달하시오.

```java
public class Main {
    static void printUser(String name, int age) {
        System.out.println(name + ": " + age);
    }
    public static void main(String[] args) {
        printUser(〔①〕, 〔②〕);
    }
}
```
- ✅ **정답:** ① = `"Kim"` , ② = `20`
- 보기 토큰: `"Kim"` / `20` / `Kim` / `"20"`
- 실행결과:
```
Kim: 20
```

> 💡 **해설.** 첫 번째 매개변수는 String이므로 큰따옴표로 감싼 "Kim"을 전달하고, 두 번째는 int이므로 따옴표 없는 20을 전달한다. Kim은 선언되지 않은 변수로 처리되고, "20"은 문자열이라 int age에 전달할 수 없다.

### 확인 5. 문자열 여러 번 출력  `코드 빈칸`

**문제.** 문자열과 반복 횟수를 매개변수로 받아 지정된 횟수만큼 문자열을 출력하도록 빈칸을 채우시오.

```java
public class Main {
    static void repeat(〔①〕 text, 〔②〕 count) {
        for (int i = 0; i < count; i++) {
            System.out.println(〔③〕);
        }
    }
    public static void main(String[] args) {
        repeat("A", 2);
    }
}
```
- ✅ **정답:** ① = `String` , ② = `int` , ③ = `text`
- 보기 토큰: `String` / `int` / `text` / `count` / `void`
- 실행결과:
```
A
A
```

> 💡 **해설.** 출력할 값 text는 문자열이므로 String, 반복 횟수 count는 정수이므로 int를 사용한다. 반복문 안에서는 반복 횟수가 아니라 출력할 문자열 text를 출력해야 한다. void는 매개변수 자료형으로 사용할 수 없다.

### 확인 6. Scanner 값을 메서드에 전달  `코드 빈칸`

**문제.** nextLine()으로 공백을 포함한 이름 전체를 입력받아 greet()의 인수로 전달하도록 빈칸을 채우시오.

```java
import java.util.Scanner;

public class Main {
    static void greet(String name) {
        System.out.println("Hello, " + name);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String name = sc.〔①〕();
        〔②〕(name);
    }
}
```
- ✅ **정답:** ① = `nextLine` , ② = `greet`
- 보기 토큰: `next` / `nextLine` / `greet` / `print` / `name`
- 입력 예:
```
Kim Lee
```
- 실행결과:
```
Hello, Kim Lee
```

> 💡 **해설.** nextLine()은 Kim Lee처럼 공백이 포함된 한 줄 전체를 읽는다. next()는 첫 단어 Kim만 읽는다. 입력값을 저장한 뒤에는 greet(name)으로 메서드를 호출해야 한다. print는 정의된 메서드가 아니며, name(name)처럼 변수 이름을 메서드로 호출할 수도 없다.

### 확인 7. 매개변수와 인수의 차이는?  `객관식`

**문제.** 매개변수와 인수에 대한 올바른 설명은?

- **A.** 매개변수는 호출할 때 전달하는 값이고, 인수는 선언부의 변수다.
- **B.** 매개변수는 메서드 선언부의 변수이고, 인수는 호출할 때 전달하는 값이다. ✅
- **C.** 매개변수와 인수는 모두 메서드 선언부에 작성한다.
- **D.** 매개변수와 인수는 모두 메서드 호출문에 작성한다.
- ✅ **정답:** B

> 💡 **해설.** greet(String name)의 name은 메서드 선언부에 있는 매개변수이고, greet("Java")의 "Java"는 호출할 때 전달하는 인수다.

### 확인 8. void의 의미는?  `객관식`

**문제.** 메서드 반환형 void의 의미로 옳은 것은?

- **A.** 매개변수를 선언할 수 없다는 뜻이다.
- **B.** 다른 메서드에서 호출할 수 없다는 뜻이다.
- **C.** 반환값은 없지만 메서드 내부 코드는 실행할 수 있다. ✅
- **D.** 반드시 출력문을 포함해야 한다는 뜻이다.
- ✅ **정답:** C

> 💡 **해설.** void는 호출한 곳으로 돌려주는 반환값이 없다는 뜻이다. 매개변수를 받을 수 있고 다른 메서드에서 호출할 수도 있으며, 출력문 포함 여부와는 관계없다.

### 확인 9. 메서드 호출과 복귀 순서  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
public class Main {
    static void pack() {
        System.out.println("포장");
    }

    public static void main(String[] args) {
        System.out.println("주문 접수");
        pack();
        System.out.println("배송 준비");
    }
}
```

- **A.** `포장` / `주문 접수` / `배송 준비`
- **B.** `주문 접수` / `포장` / `배송 준비` ✅
- **C.** `주문 접수` / `배송 준비` / `포장`
- **D.** `주문 접수` / `배송 준비`
- ✅ **정답:** B

> 💡 **해설.** main에서 먼저 주문 접수를 출력한 뒤 pack()을 호출한다. pack()이 포장을 출력하고 종료되면 호출했던 위치로 돌아와 다음 문장인 배송 준비를 출력한다.

---

# Part 16. Java초급16 메서드② 반환값·조기 종료·배열

`DEV-JAVA-01-16` · 문제 7개 (코드 빈칸 3 · 객관식 2 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- return으로 메서드의 실행 결과를 반환한다.
- 반환값을 변수에 저장하거나 다른 코드에서 사용한다.
- 반환형과 반환값의 자료형을 일치시킨다.
- return으로 메서드를 조기에 종료한다.
- 배열을 메서드의 매개변수로 전달한다.
- 배열 요소를 변경했을 때 원본 배열에 미치는 영향을 이해한다.
- 배열을 반환하는 메서드를 작성한다.

## 수업 내용

### Part 1. 반환값이 있는 메서드

**개념 설명**

- 메서드는 작업 결과를 호출한 위치로 돌려줄 수 있다.
- 결과를 돌려주는 것을 반환이라고 한다.
- 반환값이 있는 메서드는 void 대신 반환할 값의 자료형을 작성한다.
- `return 값;`이 실행되면 해당 값이 호출한 위치로 전달된다.
- 메서드의 반환형과 return 값의 자료형은 맞아야 한다.

**기본 문법**

```java
static 반환형 메서드이름(매개변수) {
    return 반환값;
}
```

**코드 문법 분해**

```java
static int add(int first, int second) {
    return first + second;
}
```

| 부분 | 의미 |
|---|---|
| `static` | main에서 직접 호출할 수 있게 함 |
| `int` | 메서드의 반환형 |
| `add` | 메서드 이름 |
| `int first, int second` | 매개변수 |
| `return first + second` | 계산 결과를 호출한 위치로 반환 |

**메서드 호출**

```java
int result = add(10, 20);

System.out.println(result);
```

**실행 흐름과 결과**

- add(10, 20)을 호출한다.
- first에 10, second에 20이 전달된다.
- first + second를 계산한다.
- 결과 30을 반환한다.
- 반환값을 result에 저장한다.

```
30
```

**출력만 하는 메서드와 비교**

값을 출력만 하는 void 메서드는 결과를 화면에 보여줄 수 있지만 호출한 곳에서 그 결과를 다시 사용할 수 없다.

```java
static void printTotal(int first, int second) {
    System.out.println(first + second);
}
```

이 메서드는 결과를 화면에 보여줄 수 있지만 호출한 곳에서 다시 계산하거나 비교할 수 없다.

반환값이 있는 메서드는 결과를 돌려주므로 호출한 곳에서 저장하거나 다시 활용할 수 있다.

```java
static int calculateTotal(int first, int second) {
    return first + second;
}
```

```java
int total = calculateTotal(10, 20);
int doubled = total * 2;
boolean expensive = total >= 25;
```

계산 결과를 출력만 하는 것이 아니라 저장·비교·재계산하거나 다른 메서드에 전달해야 할 때 반환값을 사용한다. 메서드는 결과를 어떻게 사용할지 결정하지 않고 결과만 돌려주므로 여러 상황에서 재사용할 수 있다.

**여러 반환형**

```java
static double getPrice() {
    return 1500.5;
}
```

```java
static boolean isAdult(int age) {
    return age >= 18;
}
```

```java
static String getMessage() {
    return "학습 완료";
}
```

**반환값 직접 사용**

반환값을 반드시 변수에 저장할 필요는 없다.

```java
System.out.println(add(10, 20));
```

다른 계산에서도 사용할 수 있다.

```java
int result = add(10, 20) * 2;
```

**자주 하는 실수**

반환형과 다른 자료형을 반환하면 오류가 발생한다.

```java
static int getScore() {
    return "100"; // 오류
}
```

올바른 코드는 다음과 같다.

```java
static int getScore() {
    return 100;
}
```

### Part 2. 모든 실행 경로의 return

**개념 설명**

- 반환값이 있는 메서드는 실행 가능한 모든 경로에서 값을 반환해야 한다.
- 조건에 따라 return이 실행되지 않을 가능성이 있으면 컴파일 오류가 발생한다.
- if-else의 각 영역에서 값을 반환하거나 조건문 뒤에 기본 반환값을 작성해야 한다.

**잘못된 코드**

```java
static String checkScore(int score) {
    if (score >= 60) {
        return "합격";
    }
}
```

score가 60 미만이면 반환되는 값이 없으므로 오류가 발생한다.

**수정 방법 1: if-else**

```java
static String checkScore(int score) {
    if (score >= 60) {
        return "합격";
    } else {
        return "불합격";
    }
}
```

**수정 방법 2: 조건문 뒤에서 반환**

```java
static String checkScore(int score) {
    if (score >= 60) {
        return "합격";
    }

    return "불합격";
}
```

**실행 흐름**

```java
String result = checkScore(75);
```

- 75 >= 60은 true다.
- "합격"을 반환한다.
- 메서드가 즉시 종료된다.
- 아래의 return "불합격"은 실행하지 않는다.

**자주 하는 실수**

return 다음에 실행문을 작성할 수 없다.

```java
static int getNumber() {
    return 10;
    System.out.println("종료"); // 실행할 수 없는 코드
}
```

return이 실행되면 메서드가 즉시 종료된다.

### Part 3. 조기 종료

**개념 설명**

- 메서드의 중간에서 return을 실행하면 남은 코드를 실행하지 않고 종료할 수 있다.
- 이를 조기 종료라고 한다.
- 잘못된 입력을 먼저 검사하고 메서드를 끝낼 때 유용하다.
- void 메서드에서는 반환값 없이 `return;`만 작성한다.
- 반환값이 있는 메서드에서는 반환형에 맞는 값을 함께 작성해야 한다.

**void 메서드의 조기 종료**

```java
static void printScore(int score) {
    if (score < 0) {
        System.out.println("잘못된 점수");
        return;
    }

    System.out.println(score);
}
```

**실행 흐름**

```java
printScore(-10);
```

- score < 0이 true다.
- "잘못된 점수"를 출력한다.
- return;으로 메서드를 종료한다.
- 마지막 출력문은 실행하지 않는다.

```
잘못된 점수
```

**반환값이 있는 메서드의 조기 종료**

```java
static int normalizeScore(int score) {
    if (score < 0) {
        return 0;
    }

    return score;
}
```

호출:

```java
System.out.println(normalizeScore(-10));
System.out.println(normalizeScore(80));
```

```
0
80
```

**조건문 중첩 줄이기**

```java
static void printUser(String name, boolean active) {
    if (!active) {
        return;
    }

    System.out.println(name);
}
```

처리할 수 없는 조건을 먼저 종료하면 중첩된 else를 줄일 수 있다.

**자주 하는 실수**

void 메서드에서 값을 반환할 수 없다.

```java
static void printMessage() {
    return "완료"; // 오류
}
```

void 메서드의 조기 종료는 다음과 같이 작성한다.

```java
return;
```

### Part 4. 배열을 매개변수로 전달

**개념 설명**

- 배열도 일반 변수처럼 메서드의 매개변수로 전달할 수 있다.
- 배열 매개변수는 `자료형[] 이름`으로 선언한다.
- 메서드는 전달받은 배열의 length와 각 요소를 사용할 수 있다.
- 배열 전체의 합계·검색·변경 작업을 메서드로 분리할 수 있다.

**기본 문법**

```java
static void 메서드이름(int[] numbers) {
    실행할 코드
}
```

**배열 합계 메서드**

```java
static int sum(int[] numbers) {
    int total = 0;

    for (int number : numbers) {
        total += number;
    }

    return total;
}
```

**호출 예제**

```java
public class Main {
    public static void main(String[] args) {
        int[] scores = {80, 90, 100};

        int result = sum(scores);

        System.out.println(result);
    }

    static int sum(int[] numbers) {
        int total = 0;

        for (int number : numbers) {
            total += number;
        }

        return total;
    }
}
```

**실행 흐름과 결과**

- scores 전달 → numbers로 배열 요소 확인 → 80 + 90 + 100 계산 → 270 반환

```
270
```

**배열 길이 반환**

```java
static int getLength(int[] numbers) {
    return numbers.length;
}
```

**자주 하는 실수**

배열 매개변수의 대괄호를 빠뜨리면 값 하나를 받는 매개변수가 된다.

```java
static int sum(int numbers) { // 배열이 아님
}
```

올바른 코드는 다음과 같다.

```java
static int sum(int[] numbers) {
}
```

### Part 5. 메서드에서 배열 요소 변경

**개념 설명**

- Java는 모든 인수를 값으로 전달한다.
- 배열을 전달할 때는 배열을 가리키는 참조값이 복사되어 전달된다.
- 호출한 쪽과 메서드가 같은 배열을 가리키므로 메서드 안에서 요소를 변경하면 원본 배열도 변경된다.
- 하지만 매개변수 자체에 새 배열을 대입해도 호출한 쪽의 배열 변수는 바뀌지 않는다.

**배열 요소 변경**

```java
static void changeFirst(int[] numbers) {
    numbers[0] = 100;
}
```

호출:

```java
int[] values = {10, 20, 30};

changeFirst(values);

System.out.println(values[0]);
```

실행 결과:

```
100
```

메서드 안에서 변경한 배열 요소가 원본 배열에도 반영된다.

**매개변수에 새 배열 대입**

```java
static void replaceArray(int[] numbers) {
    numbers = new int[]{100, 200, 300};
}
```

호출:

```java
int[] values = {10, 20, 30};

replaceArray(values);

System.out.println(values[0]);
```

실행 결과:

```
10
```

numbers에 새 배열을 대입해도 values가 가리키는 배열은 바뀌지 않는다.

**동작 비교**

| 메서드 내부 작업 | 원본 배열 |
|---|---|
| `numbers[0] = 100` | 요소가 변경됨 |
| `numbers = new int[]{...}` | 원본 배열 변수는 변경되지 않음 |

**자주 하는 실수**

- 배열 전체가 복사되어 전달된다고 생각하면 안 된다.
- 배열 요소를 변경하면 호출한 쪽에서도 변경된 값이 보인다.

### Part 6. 배열을 반환하는 메서드

**개념 설명**

- 메서드는 배열도 반환할 수 있다.
- 반환형을 `int[]`, `String[]`처럼 작성한다.
- return 뒤에는 해당 자료형의 배열을 작성한다.
- 호출한 쪽에서는 반환된 배열을 배열 변수에 저장한다.

**배열 반환 문법**

```java
static int[] 메서드이름() {
    return new int[]{값1, 값2};
}
```

**예제**

```java
static int[] createScores() {
    return new int[]{80, 90, 100};
}
```

호출:

```java
int[] scores = createScores();

System.out.println(scores[0]);
System.out.println(scores[1]);
System.out.println(scores[2]);
```

실행 결과:

```
80
90
100
```

**계산한 배열 반환**

```java
static int[] doubleValues(int[] numbers) {
    int[] result = new int[numbers.length];

    for (int i = 0; i < numbers.length; i++) {
        result[i] = numbers[i] * 2;
    }

    return result;
}
```

호출:

```java
int[] values = {10, 20, 30};
int[] doubled = doubleValues(values);

for (int value : doubled) {
    System.out.println(value);
}
```

실행 결과:

```
20
40
60
```

원본 배열을 직접 변경하지 않고 새로운 배열을 만들어 반환한다.

**자주 하는 실수**

배열을 반환하면서 반환형을 int로 작성하면 안 된다.

```java
static int createScores() {
    return new int[]{80, 90, 100}; // 오류
}
```

올바른 반환형은 int[]다.

```java
static int[] createScores() {
    return new int[]{80, 90, 100};
}
```

### Part 7. 배열 검색과 조기 반환

**개념 설명**

- 배열에서 원하는 값을 찾으면 즉시 return하여 검색을 끝낼 수 있다.
- 검색한 인덱스를 반환하고, 찾지 못하면 -1을 반환할 수 있다.
- 값을 찾은 후 별도의 found 변수를 만들거나 break를 사용할 필요가 없다.

**예제**

```java
static int findIndex(int[] numbers, int target) {
    for (int i = 0; i < numbers.length; i++) {
        if (numbers[i] == target) {
            return i;
        }
    }

    return -1;
}
```

**호출**

```java
int[] numbers = {10, 20, 30, 40};

System.out.println(findIndex(numbers, 30));
System.out.println(findIndex(numbers, 50));
```

**실행 흐름과 결과**

첫 번째 호출:

- 10 확인 → 불일치
- 20 확인 → 불일치
- 30 확인 → 인덱스 2 반환 → 메서드 종료

두 번째 호출:

- 모든 요소 확인 → 찾지 못함 → -1 반환

```
2
-1
```

**자주 하는 실수**

반복문 안에 return -1을 작성하면 첫 번째 요소가 일치하지 않는 순간 검색이 끝난다.

```java
static int findIndex(int[] numbers, int target) {
    for (int i = 0; i < numbers.length; i++) {
        if (numbers[i] == target) {
            return i;
        }

        return -1; // 잘못된 위치
    }

    return -1;
}
```

검색 실패를 의미하는 return -1은 반복문이 모두 끝난 뒤 작성해야 한다.

## 다음으로

다음 학습 내용은 [Part 17「메서드③ 오버로딩·스코프」](/dev/lessons/DEV-JAVA-01-17)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 16)

### 확인 1. 계산 결과 반환  `코드 빈칸`

**문제.** 직사각형의 넓이를 반환하도록 빈칸에 반환형·키워드·연산자를 채우시오.

```java
public class Main {
    static 〔①〕 rectangle(int width, int height) {
        〔②〕 width 〔③〕 height;
    }

    public static void main(String[] args) {
        System.out.println(rectangle(6, 4));
    }
}
```
- ✅ **정답:** ① = `int` , ② = `return` , ③ = `*`
- 보기 토큰: `int` / `return` / `*` / `void` / `boolean` / `String` / `println` / `break` / `continue` / `+` / `/` / `%`
- 실행결과:
```
24
```

> 💡 **해설.** 넓이는 정수 곱이므로 반환형은 int, 값을 돌려주므로 return, 곱셈은 *를 쓴다. 6 * 4 = 24가 반환되어 출력된다. void는 값을 반환할 수 없어 오류이고, +는 10, /는 1, %는 2가 되어 답이 아니다.

### 확인 2. 모든 경로에서 값 반환  `순서 배열`

**문제.** 거리가 1 이하이면 「도보」, 10 이하이면 「자전거」, 그보다 멀면 「버스」를 반환하도록 조건을 가까운 거리부터 검사하는 순서로 배열하시오.

- ✅ **정답 순서:**
```
static String selectTransport(int distance) {
    if (distance <= 1) {
        return "도보";
    }
    if (distance <= 10) {
        return "자전거";
    }
    return "버스";
}
```

- ❌ **오답 카드(제외):**
```
if (distance >= 10) {
return "자동차";
```

> 💡 **해설.** 반환형이 String이므로 모든 실행 경로에서 문자열을 반환해야 한다. 1 이하면 「도보」, 10 이하면 「자전거」, 그 외에는 「버스」를 반환한다. selectTransport(7)은 1보다 크고 10 이하라 「자전거」가 반환된다.

### 확인 3. void 메서드 조기 종료  `코드 빈칸`

**문제.** 수량이 0 이하이면 아무것도 출력하지 않고 메서드를 종료하도록 빈칸에 키워드를 채우시오.

```java
public class Main {
    static void printQuantity(int quantity) {
        if (quantity <= 0) {
            〔①〕;
        }

        System.out.println(quantity);
    }

    public static void main(String[] args) {
        printQuantity(-3);
    }
}
```
- ✅ **정답:** ① = `return`
- 보기 토큰: `return` / `break` / `continue` / `exit`
- 실행결과: 출력 없음 (기대 출력: 빈 문자열)

> 💡 **해설.** void 메서드는 값 없이 return;만으로 즉시 종료한다. quantity가 -3이면 조건이 참이라 return이 실행되어 아래 출력문에 도달하지 않으므로 아무것도 출력되지 않는다. break·continue는 반복문 안에서만 쓸 수 있고 exit는 그런 키워드가 없어 컴파일 오류다.

### 확인 4. 배열을 받아 개수 반환  `코드 빈칸`

**문제.** 반환형·매개변수 타입·연산자·반환 키워드를 채워 3의 배수 개수를 반환하도록 완성하시오.

```java
public class Main {
    static 〔①〕 countMultiplesOfThree(〔②〕 values) {
        int count = 0;

        for (int value : values) {
            if (value 〔③〕 3 〔④〕 0) {
                count〔⑤〕;
            }
        }

        〔⑥〕 count;
    }

    public static void main(String[] args) {
        int[] data = {3, 4, 6, 8, 9};
        System.out.println(countMultiplesOfThree(data));
    }
}
```
- ✅ **정답:** ① = `int` , ② = `int[]` , ③ = `%` , ④ = `==` , ⑤ = `++` , ⑥ = `return`
- 보기 토큰: `int` / `int[]` / `%` / `==` / `++` / `return` / `void` / `String[]` / `/` / `!=` / `--` / `break`
- 실행결과:
```
3
```

> 💡 **해설.** 개수를 반환하므로 반환형은 int, 매개변수는 정수 배열이므로 int[]이다. value % 3 == 0으로 3의 배수를 확인해 count++로 개수를 세고, 마지막에 return count로 결과를 반환한다.

### 확인 5. 배열 요소 변경과 재대입  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은?

```java
public class Main {
    static void edit(int[] data) {
        data[1] = 50;

        data = new int[]{7, 8};
        data[0] = 99;
    }

    public static void main(String[] args) {
        int[] numbers = {10, 20, 30};

        edit(numbers);

        System.out.println(numbers[0] + "," + numbers[1]);
    }
}
```

- **A.** `99,50`
- **B.** `10,50` ✅
- **C.** `99,8`
- **D.** `10,20`
- ✅ **정답:** B

> 💡 **해설.** data[1] = 50은 원본 배열 요소를 바꾸므로 numbers[1]이 50이 된다. 이후 data = new int[]{7, 8}은 매개변수만 새 배열을 가리키게 하므로 numbers에는 영향이 없고, data[0] = 99도 새 배열만 바꾼다. 따라서 numbers[0]은 10 그대로여서 「10,50」이 출력된다.

### 확인 6. 배열 반환  `객관식`

**문제.** 두 값을 담은 배열을 반환하는 코드 한 줄로 옳은 것은?

```java
public class Main {
    static int[] makePair(int left, int right) {
        ____
    }

    public static void main(String[] args) {
        int[] pair = makePair(4, 9);

        System.out.println(pair[0]);
        System.out.println(pair[1]);
    }
}
```

- **A.** `return left + right;`
- **B.** `new int[]{left, right};`
- **C.** `return new int[]{left, right};` ✅
- **D.** `return int[]{left, right};`
- ✅ **정답:** C

> 💡 **해설.** 반환형이 int[]이므로 return 뒤에 new int[]{left, right} 형태의 배열을 돌려줘야 한다. makePair(4, 9)는 {4, 9}를 반환해 4와 9가 출력된다. return left + right는 정수를 반환해 형이 맞지 않고, return이 없거나 new를 빠뜨리면 컴파일 오류가 난다.

### 확인 7. 배열 검색 후 조기 반환  `순서 배열`

**문제.** 배열에 0이 있으면 즉시 true, 끝까지 없으면 false를 반환하도록 실행 순서대로 배열하시오.

- ✅ **정답 순서:**
```
static boolean hasZero(int[] values) {
    for (int value : values) {
        if (value == 0) {
            return true;
        }
    }
    return false;
}
```

- ❌ **오답 카드(제외):**
```
if (value != 0) {
break;
```

> 💡 **해설.** 반복문 안에서 0을 찾으면 즉시 return true로 메서드를 끝내고, 끝까지 못 찾으면 반복문이 끝난 뒤 return false를 실행한다. {4, 0, 7}에는 0이 있으므로 true가 반환된다. return false를 반복문 안에 두면 첫 요소만 확인하고 끝나므로 반복문 밖에 두어야 한다.

---

# Part 17. Java초급17 메서드③ 오버로딩·스코프

`DEV-JAVA-01-17` · 문제 8개 (코드 빈칸 2 · 객관식 4 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 같은 이름의 메서드를 여러 형태로 정의한다.
- 매개변수의 개수·타입·순서로 메서드를 구분한다.
- 매개변수와 지역변수를 사용할 수 있는 범위를 이해한다.
- 블록 밖에서 변수를 사용할 때 발생하는 오류를 구분한다.

## 수업 내용

### Part 1. 메서드 오버로딩

같은 작업이라도 입력 형태마다 다른 이름으로 메서드를 만들면 호출하는 사람이 이름을 모두 기억해야 한다. 예를 들어 정수 출력은 displayInt(), 문자열 출력은 displayString()처럼 이름이 나뉜다.

```java
displayInt(10);
displayString("Java");
```

오버로딩을 사용하면 입력값은 달라도 하는 일이 같은 메서드를 display()라는 하나의 이름으로 사용할 수 있다.

```java
display(10);
display("Java");
```

같은 의미의 작업을 일관된 이름으로 제공해야 할 때 오버로딩을 사용한다.

오버로딩은 이름이 같은 메서드를 매개변수 구성이 다르게 여러 개 정의하는 것이다.

```java
static void display(int value) {
    System.out.println("정수: " + value);
}

static void display(String value) {
    System.out.println("문자열: " + value);
}
```

호출할 때 전달한 인수에 따라 실행할 메서드가 결정된다.

```java
display(10);
display("Java");
```

**실행 결과**

```
정수: 10
문자열: Java
```

10은 int, "Java"는 String이므로 서로 다른 메서드가 호출된다.

### Part 2. 매개변수 개수가 다른 오버로딩

매개변수 개수가 다르면 같은 이름을 사용할 수 있다.

```java
static void connect(String name) {
    System.out.println(name);
}

static void connect(String first, String second) {
    System.out.println(first + "-" + second);
}
```

```java
connect("서버");
connect("서버", "데이터베이스");
```

**실행 결과**

```
서버
서버-데이터베이스
```

호출할 때 전달한 인수의 개수로 메서드가 구분된다.

### Part 3. 매개변수 타입과 순서

매개변수의 타입이나 순서가 다르면 오버로딩이 성립한다.

```java
static void describe(String name, int level) {
    System.out.println(name + ": " + level);
}

static void describe(int level, String name) {
    System.out.println(level + ": " + name);
}
```

```java
describe("전사", 5);
describe(5, "마법사");
```

첫 번째 호출은 String, int, 두 번째 호출은 int, String 형태의 메서드를 실행한다.

인수를 잘못된 순서로 전달하면 원하는 메서드를 찾지 못해 컴파일 오류가 발생할 수 있다.

### Part 4. 반환형만 다른 메서드는 만들 수 없다

반환형은 오버로딩을 구분하는 기준이 아니다.

```java
static int convert(int number) {
    return number;
}

// 컴파일 오류
static double convert(int number) {
    return number;
}
```

두 메서드 모두 이름이 convert이고 매개변수가 int 하나다. 호출문만 보면 어떤 메서드를 실행해야 하는지 구분할 수 없다.

```java
convert(10);
```

오버로딩이 성립하려면 반환형이 아니라 다음 중 하나가 달라야 한다.

- 매개변수 개수
- 매개변수 타입
- 매개변수 순서

### Part 5. 호출할 메서드 결정

컴파일러는 메서드 이름과 전달된 인수의 타입을 확인한다.

```java
static void printAmount(int amount) {
    System.out.println("정수 금액");
}

static void printAmount(double amount) {
    System.out.println("실수 금액");
}
```

```java
printAmount(5000);
printAmount(5000.5);
```

**실행 결과**

```
정수 금액
실수 금액
```

5000은 int 리터럴이고 5000.5는 double 리터럴이다. 따라서 첫 번째는 int 메서드, 두 번째는 double 메서드를 호출한다.

### Part 6. 변수의 스코프

프로그램에는 여러 메서드와 블록에서 같은 이름의 변수가 필요할 수 있다. 모든 변수가 프로그램 전체에서 사용된다면 서로 이름이 충돌하고, 관계없는 코드가 값을 잘못 변경할 수 있다. 스코프는 변수를 필요한 영역에서만 사용하게 하여 이름 충돌과 잘못된 접근을 막는다.

스코프는 변수를 사용할 수 있는 코드의 범위다.

```java
static void showPrice(int price) {
    int tax = price / 10;

    System.out.println(price);
    System.out.println(tax);
}
```

- price는 매개변수이며 showPrice() 내부에서 사용할 수 있다.
- tax는 지역변수이며 선언된 위치부터 메서드가 끝날 때까지 사용할 수 있다.
- showPrice() 밖에서는 두 변수를 사용할 수 없다.

```java
showPrice(20000);

// 오류
System.out.println(price);
```

메서드가 종료되면 해당 호출에서 사용한 매개변수와 지역변수도 더 이상 사용할 수 없다.

### Part 7. 블록 스코프

중괄호 `{ }` 안에서 선언한 변수는 해당 블록 안에서만 사용할 수 있다.

```java
int price = 15000;

if (price >= 10000) {
    int discount = 1000;
    System.out.println(discount);
}

// 컴파일 오류
System.out.println(discount);
```

discount는 if 블록 안에서 선언되었으므로 블록 밖에서는 사용할 수 없다.

반복문의 변수도 반복문 내부에서만 사용할 수 있다.

```java
for (int i = 0; i < 3; i++) {
    System.out.println(i);
}

// 컴파일 오류
System.out.println(i);
```

### Part 8. 같은 범위에서 같은 이름 사용

같은 범위에서는 같은 이름의 지역변수를 다시 선언할 수 없다.

```java
int count = 1;

// 컴파일 오류
int count = 2;
```

매개변수와 같은 이름의 지역변수도 같은 메서드 안에서 다시 선언할 수 없다.

```java
static void update(int count) {
    // 컴파일 오류
    int count = 10;
}
```

하지만 서로 겹치지 않는 별개의 블록이라면 같은 이름을 다시 사용할 수 있다.

```java
if (true) {
    int message = 1;
    System.out.println(message);
}

if (true) {
    int message = 2;
    System.out.println(message);
}
```

각 message는 서로 다른 블록에 속한다.

## 핵심 정리

- 메서드 이름이 같아도 매개변수 구성이 다르면 오버로딩할 수 있다.
- 매개변수의 개수·타입·순서가 구분 기준이다.
- 반환형만 다르게 작성한 것은 오버로딩이 아니다.
- 지역변수와 매개변수는 선언된 메서드 내부에서만 사용한다.
- if, for 등의 블록에서 선언한 변수는 해당 블록 밖에서 사용할 수 없다.
- 같은 범위에서 같은 이름의 지역변수를 다시 선언할 수 없다.

## 다음으로

이것으로 Java 초급 과정을 모두 마쳤다. 변수와 자료형부터 조건문·반복문·배열·문자열·메서드까지 프로그램의 기본 구조를 익혔다. 지금까지 배운 내용을 바탕으로 직접 코드를 작성하고 실행하며 연습해 보자.

</details>

## ✍ 확인 문제 · 해답 (Part 17)

### 확인 1. 타입이 다른 오버로딩  `코드 빈칸`

**문제.** 문자열을 받는 메서드와 정수를 받는 메서드가 오버로딩되도록 빈칸에 타입을 채우시오.

```java
public class Main {
    static void notifyUser(〔①〕 text) {
        System.out.println("알림: " + text);
    }

    static void notifyUser(〔②〕 code) {
        System.out.println("코드: " + code);
    }

    public static void main(String[] args) {
        notifyUser("점검 시작");
        notifyUser(404);
    }
}
```
- ✅ **정답:** ① = `String` , ② = `int`
- 보기 토큰: `String` / `int` / `double` / `boolean` / `char` / `void`
- 실행결과:
```
알림: 점검 시작
코드: 404
```

> 💡 **해설.** 매개변수 타입이 String과 int로 다르므로 오버로딩이 성립한다. "점검 시작"은 String, 404는 int라 각각 다른 메서드가 호출된다. 두 자리에 같은 타입을 쓰면 매개변수가 같아 중복 정의가 되어 컴파일 오류이고, double을 쓰면 404가 404.0으로 출력되어 결과가 달라진다.

### 확인 2. 매개변수 개수가 다른 오버로딩  `객관식`

**문제.** 두 번째 book() 메서드의 선언부로 올바른 것은?

```java
public class Main {
    static void book(String room) {
        System.out.println(room + " 예약");
    }

    [①] {
        System.out.println(room + " " + nights + "박 예약");
    }

    public static void main(String[] args) {
        book("A룸");
        book("B룸", 3);
    }
}
```

- **A.** `static void book(String room, int nights)` ✅
- **B.** `static void book(String room)`
- **C.** `static int book(String room)`
- **D.** `static void book(int nights)`
- ✅ **정답:** A

> 💡 **해설.** 방과 박 수 두 값을 받으려면 매개변수가 String room, int nights 두 개여야 한다. 첫 번째 메서드와 개수가 달라 오버로딩이 성립한다. 매개변수가 room 하나뿐이면 첫 번째 메서드와 중복되고, room을 받지 않으면 본문에서 room을 찾지 못해 컴파일 오류가 난다.

### 확인 3. 매개변수 순서가 다른 오버로딩  `코드 빈칸`

**문제.** 매개변수 순서에 맞게 두 호출문을 각 빈칸에서 고르시오.

```java
public class Main {
    static void deliver(String product, boolean urgent) {
        System.out.println("상품 먼저");
    }

    static void deliver(boolean urgent, String product) {
        System.out.println("긴급 여부 먼저");
    }

    public static void main(String[] args) {
        〔①〕
        〔②〕
    }
}
```
- ✅ **정답:** ① = `deliver("책", false);` , ② = `deliver(true, "노트북");`
- 보기 토큰: `deliver("책", false);` / `deliver(true, "노트북");` / `deliver(false, "책");` / `deliver("노트북", true);` / `deliver(false);` / `deliver("책", "false");`
- 실행결과:
```
상품 먼저
긴급 여부 먼저
```

> 💡 **해설.** 첫 호출은 (String, boolean) 순서라 deliver("책", false)로 「상품 먼저」 메서드를, 둘째 호출은 (boolean, String) 순서라 deliver(true, "노트북")로 「긴급 여부 먼저」 메서드를 부른다. deliver(false, "책")은 boolean이 먼저라 「긴급 여부 먼저」 메서드를 호출하고, deliver("노트북", true)는 String이 먼저라 「상품 먼저」 메서드를 호출한다. 두 코드 모두 컴파일되지만 문제에서 요구한 호출 순서와 반대다. 인수 개수나 타입이 맞지 않는 나머지는 컴파일 오류가 난다.

### 확인 4. 올바른 오버로딩 선언  `객관식`

**문제.** 다음 메서드와 올바르게 오버로딩되는 메서드는?

```java
static int encode(int value) {
    return value + 1;
}
```

- **A.** `static String encode(int value) { return "" + value; }`
- **B.** `static String decode(String value) { return value; }`
- **C.** `static String encode(String value) { return "[" + value + "]"; }` ✅
- **D.** `static String encode(String) { return "값"; }`
- ✅ **정답:** C

> 💡 **해설.** 매개변수 타입이 int에서 String으로 달라 encode를 올바르게 오버로딩한다. 매개변수는 그대로 두고 반환형만 바꾼 것은 오버로딩이 아니라 중복 정의이고, 이름을 decode로 바꾸면 오버로딩이 아니며, 매개변수 이름이 없는 선언은 문법 오류다.

### 확인 5. 호출되는 메서드 예측  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫 줄 / 둘째 줄)

```java
public class Main {
    static void mark(char token) {
        System.out.println("문자");
    }

    static void mark(String token) {
        System.out.println("문자열");
    }

    public static void main(String[] args) {
        mark('A');
        mark("A");
    }
}
```

- **A.** `문자열` / `문자`
- **B.** `문자` / `문자열` ✅
- **C.** `문자` / `문자`
- **D.** `문자열` / `문자열`
- ✅ **정답:** B

> 💡 **해설.** 'A'는 작은따옴표라 char, "A"는 큰따옴표라 String이다. 따라서 첫 호출은 char 메서드로 「문자」, 둘째 호출은 String 메서드로 「문자열」이 출력된다.

### 확인 6. 매개변수와 지역변수의 범위  `순서 배열`

**문제.** 클래스 선언 → calculateFare() 정의 → main 정의 → calculateFare(3) 호출 순서로 배열하시오. 이 문제에서는 calculateFare()를 main보다 먼저 작성한다.

- ✅ **정답 순서:**
```
public class Main {
    static void calculateFare(int distance) {
        int fare = distance * 100;
        System.out.println(fare);
    }
    public static void main(String[] args) {
        calculateFare(3);
    }
}
```

- ❌ **오답 카드(제외):**
```
int fare = distance + 100;
calculateFare();
```

> 💡 **해설.** distance는 매개변수, fare는 지역변수로 calculateFare() 안에서 사용한다. distance * 100으로 계산하므로 calculateFare(3)은 300을 출력한다. distance + 100은 103을 만들며, calculateFare()는 필요한 int 인수가 없어 컴파일 오류가 난다.

### 확인 7. if와 for의 블록 스코프  `순서 배열`

**문제.** raining 선언 → if 블록 실행 → for 블록 실행 순서로 배열하여 「우산」, 1, 2를 차례로 출력하시오. item과 step은 각각 선언된 블록 안에서만 사용한다.

- ✅ **정답 순서:**
```
boolean raining = true;
if (raining) {
    String item = "우산";
    System.out.println(item);
}
for (int step = 1; step <= 2; step++) {
    System.out.println(step);
}
```

- ❌ **오답 카드(제외):**
```
if (!raining) {
for (int step = 0; step < 2; step++) {
```

> 💡 **해설.** raining이 true이므로 if (raining)에서 「우산」이 출력되고, 이어지는 for문이 1과 2를 출력한다. if (!raining)은 실행되지 않으며, step = 0; step < 2는 0과 1을 출력하므로 목표 결과와 다르다.

### 확인 8. 재선언과 재대입 구분  `객관식`

**문제.** 이미 선언된 level의 값을 2로 변경하도록 빈칸에 들어갈 코드 한 줄로 옳은 것은?

```java
public class Main {
    public static void main(String[] args) {
        int level = 1;

        ____

        System.out.println(level);
    }
}
```

- **A.** `int level = 2;`
- **B.** `level == 2;`
- **C.** `int level;`
- **D.** `level = 2;` ✅
- ✅ **정답:** D

> 💡 **해설.** level은 이미 선언되었으므로 값만 바꾸는 재대입 level = 2;를 쓴다. int level = 2;나 int level;은 같은 범위에서 다시 선언하는 것이라 컴파일 오류이고, level == 2;는 비교식이라 단독 문장으로 쓸 수 없어 역시 컴파일 오류다.

---
