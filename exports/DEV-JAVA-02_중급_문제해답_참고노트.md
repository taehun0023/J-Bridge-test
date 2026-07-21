# Java 중급 — 문제 · 해답 · 참고노트

모듈 **DEV-JAVA-02** · 전 12파트 · 한국어(ko) 기준 · 총 126문제

> 기준: **Java 17** · 웹=직접 입력 / 모바일=토큰 선택. 화면에서 정답 위치·토큰 순서는 무작위로 섞임. **순서 배열은 완성 코드(공백·들여쓰기 정규화) 기준으로 채점하여 동일한 코드 줄(예: 여러 `}`) 카드는 서로 교환 가능**하고, 객관식은 고유 ID, 코드 토큰은 뱅크 값으로 채점.

> 각 문제의 정답·해설과 파트별 참고노트를 담은 학습/채점용 자료. 실제 학습 콘텐츠(stage.json·mdx)에서 자동 추출. (오답 해설·용어 검수 반영본)

## 목차
1. **Java중급01 클래스와 객체**
2. **Java중급02 필드와 인스턴스 메서드**
3. **Java중급03 생성자와 this**
4. **Java중급04 생성자 오버로딩**
5. **Java중급05 패키지·import·프로젝트 구조**
6. **Java중급06 접근 제어자·접근 범위**
7. **Java중급07 캡슐화·getter·setter**
8. **Java중급08 static·final·클래스 상수**
9. **Java중급09 객체 참조·null·매개변수 전달**
10. **Java중급10 객체 배열·객체 간 협력**
11. **Java중급11 상속 기본**
12. **Java중급12 오버라이딩·super**

---

# Part 1. Java중급01 클래스와 객체

`DEV-JAVA-02-01` · 문제 9개 (코드 빈칸 5 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 클래스와 객체의 관계를 설명한다.
- 객체를 표현하는 클래스를 선언한다.
- new를 사용하여 객체를 생성한다.
- 점 연산자로 객체의 데이터에 접근한다.
- 하나의 클래스로 여러 객체를 만든다.

## 수업 내용

### Part 1. 클래스와 객체

학생 한 명의 정보를 여러 변수로 표현할 수 있다.

```java
String name = "민수";
int score = 85;
```

학생이 여러 명이면 학생마다 변수를 따로 만들어야 한다.

```java
String name1 = "민수";
int score1 = 85;

String name2 = "지수";
int score2 = 92;
```

클래스를 사용하면 이름과 점수처럼 서로 관련된 데이터를 하나의 객체로 묶을 수 있다.

```java
class Student {
    String name;
    int score;
}
```

클래스는 객체가 어떤 데이터를 가질지 정의한 설계도다. 위 Student 클래스는 학생 객체가 이름과 점수를 가질 수 있도록 정의한다.

클래스를 선언한 것만으로 학생 객체가 만들어지지는 않는다.

### Part 2. 객체 생성

클래스로 실제 객체를 만들 때는 new를 사용한다.

```java
Student student = new Student();
```

- `Student`: 객체를 만들 때 사용하는 클래스
- `student`: 생성한 객체를 사용하는 변수
- `new Student()`: 새로운 Student 객체 생성

객체를 생성하는 기본 형식은 다음과 같다.

```java
클래스명 객체변수 = new 클래스명();
```

클래스로부터 생성된 객체를 해당 클래스의 인스턴스라고 한다.

```java
Student student = new Student();
```

위에서 생성한 객체는 Student 클래스의 인스턴스다. `Student()`가 동작하는 자세한 과정은 생성자 파트에서 학습한다.

**자주 하는 실수**

객체를 생성할 때 new를 빠뜨리면 안 된다.

```java
Student student = Student(); // 컴파일 오류
```

올바른 코드는 다음과 같다.

```java
Student student = new Student();
```

자바는 대소문자를 구분하므로 클래스 이름도 정확하게 작성해야 한다.

```java
Student student = new student(); // 컴파일 오류
```

### Part 3. 객체의 데이터 사용

객체가 가진 데이터에는 점 연산자 `.`로 접근한다.

```java
Student student = new Student();

student.name = "민수";
student.score = 85;
```

객체의 데이터를 읽을 때도 점 연산자를 사용한다.

```java
System.out.println(student.name);
System.out.println(student.score);
```

**실행 결과**

```text
민수
85
```

기본 형식은 다음과 같다.

```java
객체변수.데이터이름 = 값;
System.out.println(객체변수.데이터이름);
```

객체 내부에 선언된 변수의 정확한 명칭과 특징은 다음 파트에서 학습한다.

**자주 하는 실수**

점 연산자를 빠뜨리면 객체의 데이터를 사용할 수 없다.

```java
student name = "민수"; // 컴파일 오류
student.name = "민수";
```

클래스에 선언되지 않은 데이터도 사용할 수 없다.

```java
class Student {
    String name;
    int score;
}

Student student = new Student();

student.age = 20; // age가 선언되어 있지 않으므로 컴파일 오류
```

### Part 4. 하나의 클래스로 여러 객체 만들기

하나의 클래스로 여러 객체를 만들 수 있다.

```java
Student student1 = new Student();
Student student2 = new Student();
```

두 객체에 서로 다른 값을 저장할 수 있다.

```java
student1.name = "민수";
student1.score = 85;

student2.name = "지수";
student2.score = 92;
```

```java
System.out.println(student1.name);
System.out.println(student1.score);

System.out.println(student2.name);
System.out.println(student2.score);
```

**실행 결과**

```text
민수
85
지수
92
```

student1과 student2는 같은 Student 클래스로 만들었지만 서로 다른 객체다. 클래스는 한 번 선언하고, 그 클래스를 이용하여 필요한 수만큼 객체를 만들 수 있다.

### 종합 예제

```java
class Product {
    String name;
    int price;
}

public class Main {
    public static void main(String[] args) {
        Product product1 = new Product();
        Product product2 = new Product();

        product1.name = "키보드";
        product1.price = 35000;

        product2.name = "마우스";
        product2.price = 20000;

        System.out.println(product1.name + ": " + product1.price + "원");
        System.out.println(product2.name + ": " + product2.price + "원");
    }
}
```

**실행 결과**

```text
키보드: 35000원
마우스: 20000원
```

Product 클래스는 상품 객체가 이름과 가격을 가질 수 있도록 정의한다. product1과 product2는 같은 클래스로 생성된 서로 다른 객체다.

## 다음으로

다음 학습 내용은 [Part 2「필드와 인스턴스 메서드」](/dev/lessons/DEV-JAVA-02-02)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 1)

### 확인 1. 클래스 선언과 객체 생성  `코드 빈칸`

**문제.** 드론을 표현하는 클래스를 선언하고 drone 객체를 생성하도록 빈칸을 채우시오.

```java
〔①〕 Drone {
    String model;
    int altitude;
}

public class Main {
    public static void main(String[] args) {
        〔②〕 drone = 〔③〕 〔④〕();

        drone.model = "A-10";
        drone.altitude = 120;

        System.out.println(drone.model);
        System.out.println(drone.altitude);
    }
}
```
- ✅ **정답:** ① = `class` , ② = `Drone` , ③ = `new` , ④ = `Drone`
- 보기 토큰: `class` / `Drone` / `Drone` / `new` / `drone` / `String` / `void` / `Main`
- 실행결과:
```
A-10
120
```

> 💡 **해설.** 클래스는 class 키워드로 선언한다. 객체 생성은 클래스명 객체변수 = new 클래스명(); 형식이므로 두 자리 모두 대문자로 시작하는 Drone이 들어간다. drone은 객체 변수라 타입 자리에 올 수 없다.

### 확인 2. 객체의 데이터 사용  `코드 빈칸`

**문제.** 이용권 소유자와 구역 번호를 저장하고 하린 / 3구역을 출력하도록 빈칸을 채우시오.

```java
class Pass {
    String owner;
    int zone;
}

public class Main {
    public static void main(String[] args) {
        Pass pass = new Pass();

        〔①〕.owner = "하린";
        pass.〔②〕 = 3;

        System.out.println(
            〔③〕.owner + " / " + pass.〔④〕 + "구역"
        );
    }
}
```
- ✅ **정답:** ① = `pass` , ② = `zone` , ③ = `pass` , ④ = `zone`
- 보기 토큰: `pass` / `pass` / `zone` / `zone` / `Pass` / `owner` / `name` / `"3"`
- 실행결과:
```
하린 / 3구역
```

> 💡 **해설.** 생성된 객체의 데이터는 pass.owner, pass.zone처럼 객체 변수와 점 연산자로 사용한다. Pass는 클래스 이름이라 정적 접근이 되어 오류이고, name은 클래스에 선언되지 않은 이름이다.

### 확인 3. 객체 하나를 사용하는 프로그램  `순서 배열`

**문제.** Badge 클래스 선언 → grade 선언 → Main·main 선언 → 객체 생성 → 등급 저장 → 등급 출력 순서로 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
class Badge {
    String grade;
}
public class Main {
    public static void main(String[] args) {
        Badge badge = new Badge();
        badge.grade = "GOLD";
        System.out.println(badge.grade);
    }
}
```

- ❌ **오답 카드(제외):**
```
        Badge badge = Badge();
        badge.level = "GOLD";
```

> 💡 **해설.** Badge 클래스를 먼저 선언하고 Main에서 new Badge()로 객체를 생성한다. 객체 생성에는 new가 필요하며, Badge 클래스에는 level이 아니라 grade가 선언되어 있다.

### 확인 4. 서로 다른 객체의 데이터 선택  `코드 빈칸`

**문제.** 두 게임 프로필에서 필요한 값을 선택하여 노바 : 70점을 출력하도록 빈칸을 채우시오.

```java
class GameProfile {
    String nickname;
    int score;
}

public class Main {
    public static void main(String[] args) {
        GameProfile profile1 = new GameProfile();
        GameProfile profile2 = new GameProfile();

        profile1.nickname = "루크";
        profile1.score = 70;

        profile2.nickname = "노바";
        profile2.score = 95;

        System.out.println(
            〔①〕.nickname + " : " + 〔②〕.score + "점"
        );
    }
}
```
- ✅ **정답:** ① = `profile2` , ② = `profile1`
- 보기 토큰: `profile2` / `profile1` / `GameProfile` / `nickname` / `score`
- 실행결과:
```
노바 : 70점
```

> 💡 **해설.** 「노바」는 profile2.nickname에, 70은 profile1.score에 저장되어 있다. 같은 클래스로 만든 객체라도 각 객체의 데이터는 서로 구분된다.

### 확인 5. 두 객체의 값 추적  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫째 줄 / 둘째 줄)

- **A.** `10` / `11`
- **B.** `10` / `13` ✅
- **C.** `8` / `11`
- **D.** `13` / `13`
- ✅ **정답:** B

> 💡 **해설.** 먼저 storage1.count가 8에서 10으로 변경된다. 그다음 storage2.count에는 현재 storage1.count인 10과 기존 값 3을 더한 13이 저장된다.

### 확인 6. 같은 클래스로 두 객체 만들기  `순서 배열`

**문제.** Seat·number 선언 → Main·main 선언 → left 객체 생성 후 4 저장 → right 객체 생성 후 9 저장 → right, left 순서로 번호 출력 순서로 배열하여 9, 4를 출력하시오.

- ✅ **정답 순서:**
```
class Seat {
    int number;
}
public class Main {
    public static void main(String[] args) {
        Seat left = new Seat();
        left.number = 4;
        Seat right = new Seat();
        right.number = 9;
        System.out.println(right.number);
        System.out.println(left.number);
    }
}
```

- ❌ **오답 카드(제외):**
```
        Seat right = new left();
        System.out.println(Seat.number);
```

> 💡 **해설.** left와 right는 같은 Seat 클래스로 만든 서로 다른 객체다. new 뒤에는 객체 변수 left가 아니라 클래스 이름 Seat를 작성한다. number는 객체를 통해 사용하므로 Seat.number로 출력할 수 없다.

### 확인 7. 클래스에 맞는 객체 생성  `코드 빈칸`

**문제.** 모니터와 마우스를 각각 올바른 클래스로 생성하도록 빈칸을 채우시오.

```java
class Monitor {
    int size;
}

class Mouse {
    String color;
}

public class Main {
    public static void main(String[] args) {
        〔①〕 monitor = new 〔②〕();
        〔③〕 mouse = new 〔④〕();

        monitor.size = 27;
        mouse.color = "검정";

        System.out.println(monitor.size);
        System.out.println(mouse.color);
    }
}
```
- ✅ **정답:** ① = `Monitor` , ② = `Monitor` , ③ = `Mouse` , ④ = `Mouse`
- 보기 토큰: `Monitor` / `Monitor` / `Mouse` / `Mouse` / `monitor` / `mouse` / `int` / `String`
- 실행결과:
```
27
검정
```

> 💡 **해설.** size는 Monitor 클래스에, color는 Mouse 클래스에 선언되어 있다. 각 변수의 클래스와 new 뒤의 클래스가 일치해야 이후 데이터 접근도 올바르게 컴파일된다.

### 확인 8. 변경된 객체의 값 확인  `코드 빈칸`

**문제.** 값이 변경되는 순서를 확인하여 70, 90을 차례로 출력하도록 빈칸을 채우시오.

```java
class Screen {
    int brightness;
}

public class Main {
    public static void main(String[] args) {
        Screen first = new Screen();
        Screen second = new Screen();

        first.brightness = 30;
        second.brightness = 70;

        first.brightness = second.brightness;
        second.brightness = 90;

        System.out.println(〔①〕.brightness);
        System.out.println(〔②〕.brightness);
    }
}
```
- ✅ **정답:** ① = `first` , ② = `second`
- 보기 토큰: `first` / `second` / `Screen` / `brightness` / `30` / `90`
- 실행결과:
```
70
90
```

> 💡 **해설.** first.brightness = second.brightness가 실행될 때 second의 현재 값 70이 first에 저장된다. 이후 second만 90으로 변경되므로 최종값은 first가 70, second가 90이다.

### 확인 9. 서로 다른 두 클래스의 전체 코드  `순서 배열`

**문제.** Book·title 선언 → Shelf·number 선언 → Main·main 선언 → book, shelf 순서로 객체 생성 → 값 저장 → 출력 순서로 배열하시오.

- ✅ **정답 순서:**
```
class Book {
    String title;
}
class Shelf {
    int number;
}
public class Main {
    public static void main(String[] args) {
        Book book = new Book();
        Shelf shelf = new Shelf();
        book.title = "자바의 시작";
        shelf.number = 5;
        System.out.println(book.title);
        System.out.println(shelf.number);
    }
}
```

- ❌ **오답 카드(제외):**
```
        Book book = new Shelf();
        shelf.title = "자바의 시작";
```

> 💡 **해설.** book은 Book 객체를, shelf는 Shelf 객체를 사용해야 한다. Book 변수에 Shelf 객체를 저장할 수 없으며, title은 Book 클래스에만 선언되어 있으므로 shelf.title은 사용할 수 없다.

---

# Part 2. Java중급02 필드와 인스턴스 메서드

`DEV-JAVA-02-02` · 문제 9개 (코드 빈칸 5 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 인스턴스 필드에 객체의 상태를 저장한다.
- 객체마다 서로 다른 필드값을 관리한다.
- 인스턴스 메서드를 선언하고 호출한다.
- 인스턴스 메서드에서 필드를 읽거나 변경한다.
- 매개변수와 반환값이 있는 인스턴스 메서드를 작성한다.

## 수업 내용

### Part 1. 인스턴스 필드

메서드 안의 지역변수는 메서드 실행이 끝나면 사라져 해당 객체의 상태로 남지 않는다. 게임 캐릭터의 이름과 레벨처럼 객체가 계속 기억해야 하는 데이터는 객체에 속한 필드로 저장해야 한다. 인스턴스 필드는 여러 객체가 같은 구조를 사용하면서도 각자의 상태를 따로 유지하기 위해 사용한다.

클래스 내부에서 메서드 바깥에 선언한 변수를 필드라고 한다.

```java
class Player {
    String nickname;
    int level;
}
```

nickname과 level은 Player 객체가 가지는 인스턴스 필드다.

```java
Player player1 = new Player();
Player player2 = new Player();

player1.nickname = "전사";
player1.level = 5;

player2.nickname = "마법사";
player2.level = 8;
```

같은 클래스로 만든 객체라도 각각 별도의 필드값을 가진다.

```java
System.out.println(player1.nickname);
System.out.println(player2.nickname);
```

**실행 결과**

```text
전사
마법사
```

player1의 필드를 변경해도 player2의 필드는 변경되지 않는다.

```java
player1.level = 10;

System.out.println(player1.level);
System.out.println(player2.level);
```

**실행 결과**

```text
10
8
```

필드는 객체의 상태를 저장한다. 메서드 안에서 선언하는 지역변수와 달리 특정 객체에 속한다.

### Part 2. 인스턴스 메서드

객체의 데이터를 처리하는 코드를 객체 밖에서 직접 작성하면 같은 계산이 여러 곳에 반복된다.

```java
counter1.count = counter1.count + 3;
counter2.count = counter2.count + 3;
```

이렇게 객체 밖에서 계산을 반복하면 같은 동작이 여러 곳에 흩어진다.

인스턴스 메서드를 사용하면 객체가 수행할 동작을 객체 안에 정의하고 호출만 하면 된다.

```java
counter1.increase(3);
counter2.increase(3);
```

인스턴스 메서드를 사용하면 객체의 데이터를 처리하는 코드를 객체 안에 모을 수 있다. 호출하는 쪽에서는 계산 과정을 반복하지 않고 객체가 수행할 동작만 요청한다. 객체마다 자신의 필드를 사용하여 같은 동작을 수행해야 할 때 인스턴스 메서드를 사용한다.

클래스 안에는 객체가 수행할 기능을 메서드로 선언할 수 있다.

```java
class Bell {
    void ring() {
        System.out.println("종이 울립니다.");
    }
}
```

객체에 속하는 메서드를 인스턴스 메서드라고 한다. 인스턴스 메서드는 객체를 생성한 뒤 점 연산자로 호출한다.

```java
Bell bell = new Bell();

bell.ring();
```

**실행 결과**

```text
종이 울립니다.
```

기본 형식은 다음과 같다.

```java
class 클래스명 {
    반환형 메서드명() {
        실행할 코드;
    }
}
```

호출할 때는 객체 변수를 사용한다.

```java
객체변수.메서드명();
```

**자주 하는 실수**

인스턴스 메서드는 클래스 이름으로 직접 호출하지 않는다.

```java
Bell bell = new Bell();

Bell.ring(); // 컴파일 오류
```

생성한 객체를 통해 호출해야 한다.

```java
bell.ring();
```

### Part 3. 메서드에서 필드 사용

인스턴스 메서드는 자신을 호출한 객체의 필드를 사용할 수 있다.

```java
class Member {
    String name;
    int points;

    void showInfo() {
        System.out.println(name + ": " + points + "점");
    }
}
```

```java
Member member1 = new Member();
Member member2 = new Member();

member1.name = "민수";
member1.points = 80;

member2.name = "지수";
member2.points = 95;

member1.showInfo();
member2.showInfo();
```

**실행 결과**

```text
민수: 80점
지수: 95점
```

member1.showInfo()를 호출하면 member1의 필드를 사용하고, member2.showInfo()를 호출하면 member2의 필드를 사용한다. 메서드 코드는 하나지만 호출한 객체에 따라 사용하는 데이터가 달라진다.

### Part 4. 필드를 변경하는 메서드

인스턴스 메서드에서 필드값을 변경할 수 있다.

```java
class Counter {
    int count;

    void increase(int amount) {
        count = count + amount;
    }
}
```

```java
Counter counter = new Counter();

counter.count = 5;
counter.increase(3);
counter.increase(2);

System.out.println(counter.count);
```

**실행 결과**

```text
10
```

counter.increase(3)을 호출하면 amount에 3이 전달되고 해당 counter 객체의 count가 증가한다.

객체마다 메서드를 따로 호출할 수도 있다.

```java
Counter counter1 = new Counter();
Counter counter2 = new Counter();

counter1.count = 10;
counter2.count = 20;

counter1.increase(5);
counter2.increase(2);

System.out.println(counter1.count);
System.out.println(counter2.count);
```

**실행 결과**

```text
15
22
```

동일한 increase()를 호출해도 각 객체의 count가 따로 변경된다.

### Part 5. 값을 반환하는 인스턴스 메서드

인스턴스 메서드는 객체의 필드를 이용하여 계산한 값을 반환할 수 있다.

```java
class Rectangle {
    int width;
    int height;

    int getArea() {
        return width * height;
    }
}
```

```java
Rectangle rectangle = new Rectangle();

rectangle.width = 6;
rectangle.height = 4;

int area = rectangle.getArea();

System.out.println(area);
```

**실행 결과**

```text
24
```

rectangle.getArea()는 rectangle 객체의 width와 height를 사용하여 넓이를 반환한다.

매개변수와 필드를 함께 사용할 수도 있다.

```java
class Price {
    int amount;

    int calculateTotal(int quantity) {
        return amount * quantity;
    }
}
```

```java
Price price = new Price();

price.amount = 3000;

System.out.println(price.calculateTotal(4));
```

**실행 결과**

```text
12000
```

amount는 객체에 속하는 필드이고 quantity는 메서드를 호출할 때 전달되는 매개변수다.

### 종합 예제

```java
class Wallet {
    String owner;
    int money;

    void addMoney(int amount) {
        money = money + amount;
    }

    void spendMoney(int amount) {
        money = money - amount;
    }

    void showInfo() {
        System.out.println(owner + ": " + money + "원");
    }
}

public class Main {
    public static void main(String[] args) {
        Wallet wallet1 = new Wallet();
        Wallet wallet2 = new Wallet();

        wallet1.owner = "민수";
        wallet1.money = 10000;

        wallet2.owner = "지수";
        wallet2.money = 20000;

        wallet1.addMoney(5000);
        wallet2.spendMoney(3000);

        wallet1.showInfo();
        wallet2.showInfo();
    }
}
```

**실행 결과**

```text
민수: 15000원
지수: 17000원
```

wallet1과 wallet2는 서로 다른 필드값을 가진다. 같은 메서드를 호출하더라도 메서드를 호출한 객체의 money가 변경된다.

## 다음으로

다음 학습 내용은 [Part 3「생성자와 this」](/dev/lessons/DEV-JAVA-02-03)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 2)

### 확인 1. 인스턴스 메서드 정의와 호출  `코드 빈칸`

**문제.** 알람 객체에 저장된 메시지를 출력하는 인스턴스 메서드를 정의하고 호출하도록 빈칸을 채우시오.

```java
class Alarm {
    String message;

    〔①〕 〔②〕() {
        System.out.println(message);
    }
}

public class Main {
    public static void main(String[] args) {
        Alarm alarm = new Alarm();

        alarm.message = "기상 시간입니다.";

        〔③〕.〔④〕();
    }
}
```
- ✅ **정답:** ① = `void` , ② = `showMessage` , ③ = `alarm` , ④ = `showMessage`
- 보기 토큰: `void` / `showMessage` / `showMessage` / `alarm` / `Alarm` / `message` / `String` / `println`
- 실행결과:
```
기상 시간입니다.
```

> 💡 **해설.** 출력만 하고 값을 반환하지 않으므로 반환형은 void다. 인스턴스 메서드는 클래스 이름 Alarm이 아니라 생성된 객체를 사용하는 변수 alarm으로 호출한다.

### 확인 2. 필드를 변경하는 메서드 조립  `순서 배열`

**문제.** Meter·value 선언 → increase() 정의 → Main·main 선언 → 객체 생성 후 10 저장 → increase(4) 호출 → value 출력 순서로 배열하여 14를 출력하시오.

- ✅ **정답 순서:**
```
class Meter {
    int value;
    void increase(int amount) {
        value = value + amount;
    }
}
public class Main {
    public static void main(String[] args) {
        Meter meter = new Meter();
        meter.value = 10;
        meter.increase(4);
        System.out.println(meter.value);
    }
}
```

- ❌ **오답 카드(제외):**
```
        value = amount + amount;
        Meter.increase(4);
```

> 💡 **해설.** increase()는 자신을 호출한 meter 객체의 value에 amount를 더한다. meter.increase(4)를 호출하면 10에 4가 더해진다. 클래스 이름 Meter로 인스턴스 메서드를 직접 호출할 수 없다.

### 확인 3. 메서드에서 필드 사용  `코드 빈칸`

**문제.** printLabel()이 자신을 호출한 객체의 이름과 코드를 출력하도록 완성하시오.

```java
class Label {
    String name;
    int code;

    void printLabel() {
        System.out.println(〔①〕 + "-" + 〔②〕);
    }
}

public class Main {
    public static void main(String[] args) {
        Label label1 = new Label();
        Label label2 = new Label();

        label1.name = "입장";
        label1.code = 101;

        label2.name = "퇴장";
        label2.code = 202;

        〔③〕.printLabel();
        〔④〕.printLabel();
    }
}
```
- ✅ **정답:** ① = `name` , ② = `code` , ③ = `label1` , ④ = `label2`
- 보기 토큰: `name` / `code` / `label1` / `label2` / `Label` / `printLabel` / `"name"` / `"code"`
- 실행결과:
```
입장-101
퇴장-202
```

> 💡 **해설.** printLabel() 안의 name과 code는 메서드를 호출한 객체의 필드다. label1이 호출하면 label1의 값이, label2가 호출하면 label2의 값이 출력된다. "name"과 "code"는 필드값이 아니라 글자 그대로의 문자열이다.

### 확인 4. 객체별 메서드 실행 결과  `객관식`

**문제.** 다음 코드의 실행 결과로 옳은 것은? (첫째 줄 / 둘째 줄)

- **A.** `13` / `15`
- **B.** `10` / `18`
- **C.** `13` / `18` ✅
- **D.** `18` / `18`
- ✅ **정답:** C

> 💡 **해설.** gauge1.add(3)으로 gauge1.value는 13이 된다. 이후 gauge2.add(gauge1.value)는 gauge2의 기존 값 5에 13을 더하므로 gauge2.value는 18이 된다.

### 확인 5. 값을 반환하는 메서드 조립  `순서 배열`

**문제.** Fare·price 선언 → total() 정의 → Main·main 선언 → 객체 생성 후 2500 저장 → total(3) 반환값 저장 → 결과 출력 순서로 배열하여 7500을 출력하시오.

- ✅ **정답 순서:**
```
class Fare {
    int price;
    int total(int count) {
        return price * count;
    }
}
public class Main {
    public static void main(String[] args) {
        Fare fare = new Fare();
        fare.price = 2500;
        int result = fare.total(3);
        System.out.println(result);
    }
}
```

- ❌ **오답 카드(제외):**
```
        return count * count;
        int result = fare.total();
```

> 💡 **해설.** total()은 fare 객체의 price와 전달받은 count를 곱해 반환한다. total()에는 int 매개변수가 있으므로 호출할 때 수량을 전달해야 한다. count * count는 9를 반환하므로 요구사항에 맞지 않는다.

### 확인 6. 필드를 변경하는 두 메서드  `코드 빈칸`

**문제.** 재고를 7개 추가한 뒤 5개 제거하여 22를 출력하도록 메서드를 완성하시오.

```java
class Inventory {
    int stock;

    void add(int amount) {
        stock 〔①〕 amount;
    }

    void remove(int amount) {
        stock 〔②〕 amount;
    }
}

public class Main {
    public static void main(String[] args) {
        Inventory inventory = new Inventory();

        inventory.stock = 20;

        inventory.〔③〕(7);
        inventory.〔④〕(5);

        System.out.println(inventory.stock);
    }
}
```
- ✅ **정답:** ① = `+=` , ② = `-=` , ③ = `add` , ④ = `remove`
- 보기 토큰: `+=` / `-=` / `add` / `remove` / `+` / `-` / `stock` / `amount`
- 실행결과:
```
22
```

> 💡 **해설.** add()는 stock에 amount를 더하고 remove()는 amount를 뺀다. 처음 재고 20에 7을 더한 뒤 5를 빼므로 최종 재고는 22다. stock + amount;처럼 계산식만 작성한 것은 올바른 대입문이 아니다.

### 확인 7. 필드로 계산한 값 반환  `코드 빈칸`

**문제.** 이동 거리와 속력을 이용하여 이동 시간을 반환하도록 빈칸을 채우시오.

```java
class Travel {
    int distance;
    int speed;

    〔①〕 getTime() {
        〔②〕 〔③〕 / 〔④〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Travel travel = new Travel();

        travel.distance = 120;
        travel.speed = 60;

        System.out.println(travel.〔⑤〕());
    }
}
```
- ✅ **정답:** ① = `int` , ② = `return` , ③ = `distance` , ④ = `speed` , ⑤ = `getTime`
- 보기 토큰: `int` / `return` / `distance` / `speed` / `getTime` / `void` / `double` / `*` / `calculate`
- 실행결과:
```
2
```

> 💡 **해설.** 정수 이동 시간을 반환하므로 반환형은 int다. getTime()은 자신을 호출한 travel 객체의 distance를 speed로 나눈 값을 반환한다. void 메서드는 정숫값을 반환할 수 없다.

### 확인 8. 같은 메서드를 호출하는 두 객체  `순서 배열`

**문제.** Light·color 선언 → showColor() 정의 → Main·main 선언 → first, second 순서로 객체 생성 → first에 빨강·second에 파랑 저장 → second, first 순서로 showColor() 호출 순서로 배열하여 파랑, 빨강을 출력하시오.

- ✅ **정답 순서:**
```
class Light {
    String color;
    void showColor() {
        System.out.println(color);
    }
}
public class Main {
    public static void main(String[] args) {
        Light first = new Light();
        Light second = new Light();
        first.color = "빨강";
        second.color = "파랑";
        second.showColor();
        first.showColor();
    }
}
```

- ❌ **오답 카드(제외):**
```
        Light.showColor();
        first.color = second.color;
```

> 💡 **해설.** second.showColor()는 second의 color인 "파랑"을 출력하고, first.showColor()는 first의 color인 "빨강"을 출력한다. Light.showColor()처럼 클래스 이름으로 인스턴스 메서드를 호출할 수 없다.

### 확인 9. 종합 — 필드 변경과 반환값 사용  `코드 빈칸`

**문제.** 두 저축 객체에 각각 돈을 추가하고 21000, 15000을 차례로 출력하도록 빈칸을 채우시오.

```java
class Savings {
    int balance;

    void deposit(int amount) {
        balance = balance + amount;
    }

    int getBalance() {
        return balance;
    }
}

public class Main {
    public static void main(String[] args) {
        Savings savings1 = new Savings();
        Savings savings2 = new Savings();

        savings1.balance = 10000;
        savings2.balance = 20000;

        〔①〕.deposit(5000);
        〔②〕.deposit(1000);

        System.out.println(〔③〕.〔④〕());
        System.out.println(〔⑤〕.〔⑥〕());
    }
}
```
- ✅ **정답:** ① = `savings1` , ② = `savings2` , ③ = `savings2` , ④ = `getBalance` , ⑤ = `savings1` , ⑥ = `getBalance`
- 보기 토큰: `savings1` / `savings1` / `savings2` / `savings2` / `getBalance` / `getBalance` / `Savings` / `deposit` / `balance`
- 실행결과:
```
21000
15000
```

> 💡 **해설.** savings1에는 5000원이 추가되어 15000원이 되고 savings2에는 1000원이 추가되어 21000원이 된다. 첫 번째 출력은 savings2, 두 번째 출력은 savings1의 getBalance()를 호출해야 한다.

---

# Part 3. Java중급03 생성자와 this

`DEV-JAVA-02-03` · 문제 9개 (코드 빈칸 5 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 생성자의 역할과 호출 시점을 설명한다.
- 클래스에 생성자를 선언한다.
- 생성자 매개변수로 필드의 초깃값을 전달한다.
- this가 현재 객체를 뜻한다는 것을 이해한다.
- this.field로 필드와 매개변수를 구분한다.

## 수업 내용

### Part 1. 생성자가 필요한 이유

생성자를 사용하지 않으면 객체를 생성한 뒤 필드에 값을 따로 저장해야 한다.

```java
class Student {
    String name;
    int score;
}
```

```java
Student student = new Student();

student.name = "민수";
student.score = 85;
```

필드 저장을 빠뜨리면 필요한 값이 없는 상태로 객체를 사용할 수 있다.

생성자를 사용하면 객체를 만들 때 필요한 값을 함께 전달할 수 있다.

```java
Student student = new Student("민수", 85);
```

생성자는 객체가 생성될 때 필드의 초깃값을 설정하는 역할을 한다.

### Part 2. 생성자 선언과 호출

생성자는 클래스 이름과 같은 이름으로 선언한다.

```java
class Robot {
    String model;

    Robot() {
        model = "기본 모델";
    }
}
```

생성자는 반환형을 작성하지 않는다.

```java
Robot() {
    model = "기본 모델";
}
```

new Robot()으로 객체를 생성하면 Robot() 생성자가 자동으로 실행된다.

```java
Robot robot = new Robot();

System.out.println(robot.model);
```

**실행 결과**

```text
기본 모델
```

생성자는 일반 메서드처럼 객체를 만든 뒤 따로 호출하지 않는다.

```java
Robot robot = new Robot();

robot.Robot(); // 생성자를 다시 호출하는 형태로 사용할 수 없음
```

**자주 하는 실수**

생성자에 void를 작성하면 생성자가 아니라 일반 메서드가 된다.

```java
class Robot {
    String model;

    // 생성자가 아니라 이름이 Robot인 메서드
    void Robot() {
        model = "기본 모델";
    }
}
```

생성자는 반환형 없이 작성해야 한다.

```java
Robot() {
    model = "기본 모델";
}
```

### Part 3. 매개변수가 있는 생성자

생성자도 매개변수를 받을 수 있다.

```java
class Product {
    String name;
    int price;

    Product(String productName, int productPrice) {
        name = productName;
        price = productPrice;
    }
}
```

객체를 생성할 때 생성자의 매개변수에 맞는 값을 전달한다.

```java
Product product = new Product("키보드", 35000);

System.out.println(product.name);
System.out.println(product.price);
```

**실행 결과**

```text
키보드
35000
```

다음 호출에서 전달한 값은 선언된 순서대로 매개변수에 들어간다.

```java
new Product("키보드", 35000);
```

- `"키보드"` → productName
- `35000` → productPrice

생성자가 실행되면서 전달받은 값이 객체의 필드에 저장된다.

**자주 하는 실수**

생성자에 매개변수가 있으면 객체를 생성할 때 필요한 값을 전달해야 한다.

```java
class Product {
    String name;

    Product(String productName) {
        name = productName;
    }
}
```

```java
Product product = new Product(); // 컴파일 오류
```

올바른 호출은 다음과 같다.

```java
Product product = new Product("마우스");
```

### Part 4. this와 this.field

필드와 매개변수의 이름을 같게 작성하면 이름이 겹친다.

```java
class Member {
    String name;

    Member(String name) {
        name = name;
    }
}
```

생성자 안의 name은 가까운 위치에 선언된 매개변수를 뜻한다. 따라서 name = name은 매개변수에 매개변수 값을 다시 대입할 뿐 필드를 변경하지 않는다.

필드를 분명하게 가리킬 때 this.field를 사용한다.

```java
class Member {
    String name;

    Member(String name) {
        this.name = name;
    }
}
```

this는 현재 생성 중인 객체를 뜻한다.

```java
this.name = name;
```

- `this.name`: 현재 객체의 name 필드
- `name`: 생성자로 전달받은 매개변수

여러 필드도 같은 방식으로 초기화할 수 있다.

```java
class Member {
    String name;
    int level;

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}
```

```java
Member member = new Member("지수", 7);

System.out.println(member.name);
System.out.println(member.level);
```

**실행 결과**

```text
지수
7
```

### Part 5. 객체마다 실행되는 생성자

객체를 생성할 때마다 해당 객체를 위한 생성자가 실행된다.

```java
class Book {
    String title;
    int price;

    Book(String title, int price) {
        this.title = title;
        this.price = price;
    }
}
```

```java
Book book1 = new Book("자바 기초", 18000);
Book book2 = new Book("자료구조", 22000);

System.out.println(book1.title + ": " + book1.price);
System.out.println(book2.title + ": " + book2.price);
```

**실행 결과**

```text
자바 기초: 18000
자료구조: 22000
```

book1을 생성할 때 전달한 값은 book1의 필드에 저장되고, book2를 생성할 때 전달한 값은 book2의 필드에 저장된다.

### Part 6. 기본 생성자

클래스에 생성자를 하나도 선언하지 않으면 컴파일러가 매개변수 없는 기본 생성자를 자동으로 제공한다.

```java
class Item {
    String name;
}
```

따라서 다음과 같이 객체를 생성할 수 있다.

```java
Item item = new Item();
```

하지만 생성자를 하나라도 직접 선언하면 컴파일러는 기본 생성자를 자동으로 제공하지 않는다.

```java
class Item {
    String name;

    Item(String name) {
        this.name = name;
    }
}
```

```java
Item item = new Item(); // 컴파일 오류
```

선언된 생성자에 맞게 값을 전달해야 한다.

```java
Item item = new Item("연필");
```

매개변수 없는 생성자와 매개변수가 있는 생성자를 함께 사용하는 방법은 다음 파트의 생성자 오버로딩에서 학습한다.

### 종합 예제

```java
class Laptop {
    String model;
    int memory;

    Laptop(String model, int memory) {
        this.model = model;
        this.memory = memory;
    }

    void showInfo() {
        System.out.println(model + ": " + memory + "GB");
    }
}

public class Main {
    public static void main(String[] args) {
        Laptop laptop1 = new Laptop("CodeBook", 16);
        Laptop laptop2 = new Laptop("DevNote", 32);

        laptop1.showInfo();
        laptop2.showInfo();
    }
}
```

**실행 결과**

```text
CodeBook: 16GB
DevNote: 32GB
```

new Laptop()이 실행될 때마다 생성자가 호출된다. this.model과 this.memory는 현재 생성 중인 객체의 필드를 뜻한다.

## 다음으로

다음 학습 내용은 [Part 4「생성자 오버로딩」](/dev/lessons/DEV-JAVA-02-04)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 3)

### 확인 1. 생성자 선언과 호출  `코드 빈칸`

**문제.** 목적지를 전달받아 필드에 저장하는 생성자를 선언하고 부산을 전달하여 객체를 생성하도록 빈칸을 채우시오.

```java
class Parcel {
    String destination;

    〔①〕(String destination) {
        〔②〕.〔③〕 = 〔④〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Parcel parcel = new 〔⑤〕("부산");

        System.out.println(parcel.destination);
    }
}
```
- ✅ **정답:** ① = `Parcel` , ② = `this` , ③ = `destination` , ④ = `destination` , ⑤ = `Parcel`
- 보기 토큰: `Parcel` / `Parcel` / `this` / `destination` / `destination` / `parcel` / `void` / `String` / `new`
- 실행결과:
```
부산
```

> 💡 **해설.** 생성자 이름은 클래스 이름 Parcel과 같아야 하며 반환형을 작성하지 않는다. this.destination은 현재 객체의 필드이고 오른쪽 destination은 생성자로 전달받은 매개변수다.

### 확인 2. this.field로 필드 초기화  `코드 빈칸`

**문제.** 생성자로 전달받은 이름과 레벨을 같은 이름의 필드에 저장하도록 빈칸을 채우시오.

```java
class Player {
    String name;
    int level;

    Player(String name, int level) {
        〔①〕.name = 〔②〕;
        〔③〕.level = 〔④〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Player player = new Player("루나", 8);

        System.out.println(player.name);
        System.out.println(player.level);
    }
}
```
- ✅ **정답:** ① = `this` , ② = `name` , ③ = `this` , ④ = `level`
- 보기 토큰: `this` / `this` / `name` / `level` / `Player` / `player` / `"name"` / `"level"`
- 실행결과:
```
루나
8
```

> 💡 **해설.** this.name과 this.level은 현재 생성 중인 객체의 필드다. 오른쪽의 name과 level은 생성자로 전달받은 매개변수다. 큰따옴표를 사용하면 변수가 아니라 문자열 자체가 된다.

### 확인 3. 매개변수 없는 생성자 조립  `순서 배열`

**문제.** Lamp·color 선언 → 매개변수 없는 생성자 선언 → color를 "하양"으로 초기화 → Main·main 선언 → 객체 생성 → color 출력 순서로 배열하여 하양을 출력하시오.

- ✅ **정답 순서:**
```
class Lamp {
    String color;
    Lamp() {
        color = "하양";
    }
}
public class Main {
    public static void main(String[] args) {
        Lamp lamp = new Lamp();
        System.out.println(lamp.color);
    }
}
```

- ❌ **오답 카드(제외):**
```
    void Lamp() {
        Lamp lamp = Lamp();
```

> 💡 **해설.** 생성자에는 반환형을 작성하지 않는다. new Lamp()가 실행되면 Lamp() 생성자가 자동으로 호출되어 color에 "하양"이 저장된다. 객체를 생성할 때는 new가 필요하다.

### 확인 4. 생성자와 같은 이름의 메서드  `객관식`

**문제.** 다음 코드를 컴파일한 결과로 옳은 것은?

- **A.** 점검이 출력된다.
- **B.** Notice가 출력된다.
- **C.** 아무것도 출력되지 않는다.
- **D.** Notice(String) 생성자가 없어서 컴파일 오류가 발생한다. ✅
- ✅ **정답:** D

> 💡 **해설.** void Notice(String message)는 반환형 void가 있으므로 생성자가 아니라 일반 메서드다. 선언된 생성자가 없으므로 매개변수 없는 기본 생성자만 자동 제공된다. 따라서 문자열을 받는 new Notice("점검")과 일치하는 생성자가 없어 컴파일 오류가 발생한다.

### 확인 5. 생성자 인수의 타입과 순서  `코드 빈칸`

**문제.** 서버 이름과 포트 번호를 생성자에 올바른 타입과 순서로 전달하여 api:8080을 출력하시오.

```java
class Server {
    String name;
    int port;

    Server(String name, int port) {
        this.name = name;
        this.port = port;
    }
}

public class Main {
    public static void main(String[] args) {
        Server server = new Server(〔①〕, 〔②〕);

        System.out.println(server.name + ":" + server.port);
    }
}
```
- ✅ **정답:** ① = `"api"` , ② = `8080`
- 보기 토큰: `"api"` / `8080` / `api` / `"8080"` / `80` / `8080.0` / `name` / `port`
- 실행결과:
```
api:8080
```

> 💡 **해설.** 생성자의 첫 번째 매개변수는 String, 두 번째는 int다. 따라서 문자열 "api"와 정수 8080을 해당 순서로 전달해야 한다. "8080"은 문자열이고 8080.0은 double이므로 int 매개변수에 맞지 않는다.

### 확인 6. 매개변수가 있는 생성자 조립  `순서 배열`

**문제.** Ticket·type 선언 → 문자열을 받는 생성자 선언 → this.type에 매개변수 저장 → Main·main 선언 → "VIP" 전달하여 객체 생성 → type 출력 순서로 배열하여 VIP를 출력하시오.

- ✅ **정답 순서:**
```
class Ticket {
    String type;
    Ticket(String type) {
        this.type = type;
    }
}
public class Main {
    public static void main(String[] args) {
        Ticket ticket = new Ticket("VIP");
        System.out.println(ticket.type);
    }
}
```

- ❌ **오답 카드(제외):**
```
    void Ticket(String type) {
        Ticket ticket = new Ticket();
```

> 💡 **해설.** Ticket(String type)을 직접 선언했으므로 객체를 생성할 때 문자열을 전달해야 한다. new Ticket()과 일치하는 매개변수 없는 생성자는 자동으로 제공되지 않는다. void를 붙이면 생성자가 아니라 일반 메서드가 된다.

### 확인 7. 생성자로 서로 다른 객체 초기화  `코드 빈칸`

**문제.** 두 반려동물 객체를 생성하여 두 번째 객체의 이름과 첫 번째 객체의 나이를 이용해 콩이 / 2살을 출력하시오.

```java
class Pet {
    String name;
    int age;

    Pet(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

public class Main {
    public static void main(String[] args) {
        Pet pet1 = new Pet(〔①〕, 〔②〕);
        Pet pet2 = new Pet(〔③〕, 〔④〕);

        System.out.println(pet2.name + " / " + pet1.age + "살");
    }
}
```
- ✅ **정답:** ① = `"보리"` , ② = `2` , ③ = `"콩이"` , ④ = `5`
- 보기 토큰: `"보리"` / `2` / `"콩이"` / `5` / `보리_id` / `콩이_id` / `"2"` / `"5"`
- 실행결과:
```
콩이 / 2살
```

> 💡 **해설.** pet1을 생성할 때 "보리"와 2가 pet1의 필드에 저장되고, pet2를 생성할 때 "콩이"와 5가 pet2의 필드에 저장된다. 각 객체를 생성할 때마다 생성자가 별도로 실행된다.

### 확인 8. 기본 생성자가 제공되지 않는 경우  `코드 빈칸`

**문제.** Badge(String grade) 생성자가 선언된 클래스의 객체를 올바르게 생성하고 등급을 출력하도록 빈칸을 채우시오.

```java
class Badge {
    String grade;

    Badge(String grade) {
        this.grade = grade;
    }
}

public class Main {
    public static void main(String[] args) {
        Badge badge = new Badge(〔①〕);

        System.out.println(badge.〔②〕);
    }
}
```
- ✅ **정답:** ① = `"GOLD"` , ② = `grade`
- 보기 토큰: `"GOLD"` / `grade` / `GOLD` / `"grade"` / `Badge` / `badge` / `String`
- 실행결과:
```
GOLD
```

> 💡 **해설.** Badge(String grade)를 직접 선언했으므로 객체를 생성할 때 문자열 인수를 전달해야 한다. 인수 없이 new Badge()를 호출할 수 없으며, 저장된 값은 badge.grade로 읽는다.

### 확인 9. 종합 — 생성자와 인스턴스 메서드  `순서 배열`

**문제.** Room·name·capacity 선언 → 두 값을 받는 생성자 선언 → this.field로 초기화 → showInfo() 정의 → Main·main 선언 → room1, room2 순서로 객체 생성 → room2, room1 순서로 정보 출력 순서로 배열하시오.

- ✅ **정답 순서:**
```
class Room {
    String name;
    int capacity;
    Room(String name, int capacity) {
        this.name = name;
        this.capacity = capacity;
    }
    void showInfo() {
        System.out.println(name + ": " + capacity);
    }
}
public class Main {
    public static void main(String[] args) {
        Room room1 = new Room("A룸", 20);
        Room room2 = new Room("B룸", 30);
        room2.showInfo();
        room1.showInfo();
    }
}
```

- ❌ **오답 카드(제외):**
```
        Room room1 = new Room();
        this.capacity = name;
```

> 💡 **해설.** 생성자는 전달받은 name과 capacity를 각 객체의 필드에 저장한다. room2.showInfo()는 room2의 필드를, room1.showInfo()는 room1의 필드를 사용한다. 매개변수가 있는 생성자를 선언했으므로 new Room()으로는 객체를 생성할 수 없다.

---

# Part 4. Java중급04 생성자 오버로딩

`DEV-JAVA-02-04` · 문제 9개 (코드 빈칸 5 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 객체를 여러 방식으로 생성해야 하는 이유를 설명한다.
- 필요한 정보의 양에 따라 서로 다른 생성자를 제공한다.
- 생성자마다 반복되는 초기화 코드를 찾는다.
- this()로 다른 생성자에 초기화를 맡긴다.
- 생성자 오버로딩이 필요한 경우와 필요하지 않은 경우를 구분한다.

## 수업 내용

### Part 1. 생성자를 여러 개 사용하는 이유

앞 파트에서는 하나의 생성자로 객체를 만들었다.

```java
class Member {
    String name;
    int level;

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}
```

이 클래스의 객체를 만들려면 이름과 레벨을 모두 전달해야 한다.

```java
Member member = new Member("민수", 5);
```

하지만 프로그램에서는 객체를 만들 때 가지고 있는 정보가 서로 다를 수 있다.

- 방문자는 이름이 없을 수 있다.
- 새 회원은 이름만 있고 레벨은 기본값을 사용할 수 있다.
- 기존 회원은 이름과 레벨이 모두 있을 수 있다.

이때 생성자를 여러 형태로 제공하면 상황에 맞게 객체를 만들 수 있다.

```java
class Member {
    String name;
    int level;

    Member() {
        name = "게스트";
        level = 1;
    }

    Member(String name) {
        this.name = name;
        level = 1;
    }

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}
```

```java
Member guest = new Member();
Member newMember = new Member("민수");
Member existingMember = new Member("지수", 7);
```

각 객체는 서로 다른 방법으로 생성된다.

```java
System.out.println(guest.name + ": " + guest.level);
System.out.println(newMember.name + ": " + newMember.level);
System.out.println(existingMember.name + ": " + existingMember.level);
```

**실행 결과**

```text
게스트: 1
민수: 1
지수: 7
```

이처럼 같은 종류의 객체를 입력 가능한 정보에 따라 여러 방식으로 만들어야 할 때 생성자 오버로딩을 사용한다.

### Part 2. 생성자 오버로딩

생성자 오버로딩은 같은 클래스에 매개변수 구성이 다른 생성자를 여러 개 선언하는 것이다.

```java
Member()
Member(String name)
Member(String name, int level)
```

객체를 생성할 때 전달한 인수에 맞는 생성자가 자동으로 선택된다.

- `new Member();` → 인수가 없으므로 `Member()`가 실행된다.
- `new Member("민수");` → String 하나를 전달했으므로 `Member(String name)`이 실행된다.
- `new Member("지수", 7);` → String과 int를 전달했으므로 `Member(String name, int level)`이 실행된다.

생성자는 다음 차이로 구분한다.

- 매개변수 개수
- 매개변수 타입
- 매개변수 순서

매개변수 이름만 바꾸는 것은 오버로딩이 아니다.

```java
class Member {
    Member(String name) {
    }

    // 컴파일 오류
    Member(String nickname) {
    }
}
```

두 생성자 모두 String 하나를 받으므로 호출할 때 구분할 수 없다.

### Part 3. 생성자 코드가 반복되는 문제

생성자를 여러 개 만들면 같은 초기화 코드가 반복될 수 있다.

```java
class Member {
    String name;
    int level;

    Member() {
        name = "게스트";
        level = 1;
    }

    Member(String name) {
        this.name = name;
        level = 1;
    }

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}
```

현재 기본 레벨인 1이 두 생성자에 반복되어 있다. 기본 레벨을 10으로 변경하려면 여러 생성자를 찾아서 수정해야 한다.

```java
Member() {
    name = "게스트";
    level = 10;
}

Member(String name) {
    this.name = name;
    level = 10;
}
```

한 곳을 빠뜨리면 생성자마다 서로 다른 기본값을 사용하게 될 수 있다. 초기화 규칙이 여러 생성자에 반복될 때 this()를 사용한다.

### Part 4. this()로 초기화 모으기

this()는 같은 클래스에 있는 다른 생성자를 호출한다.

```java
class Member {
    String name;
    int level;

    Member() {
        this("게스트", 1);
    }

    Member(String name) {
        this(name, 1);
    }

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}
```

실제 필드 초기화는 마지막 생성자에서만 처리한다.

```text
Member()
    → Member("게스트", 1)
    → 필드 초기화
Member(String name)
    → Member(name, 1)
    → 필드 초기화
```

기본 레벨을 변경해야 할 때도 this()에 전달하는 값만 확인하면 된다.

```java
Member() {
    this("게스트", 10);
}

Member(String name) {
    this(name, 10);
}
```

여러 생성자가 같은 필드를 각각 초기화하는 대신, 가장 많은 정보를 받는 생성자에 초기화를 모을 수 있다.

### Part 5. this()와 this.field의 차이

두 표현에는 서로 다른 역할이 있다.

```java
class Product {
    String name;
    int price;

    Product() {
        this("상품 미정", 0);
    }

    Product(String name) {
        this(name, 0);
    }

    Product(String name, int price) {
        this.name = name;
        this.price = price;
    }
}
```

`this(...)`는 다른 생성자를 호출한다.

```java
this("상품 미정", 0);
this(name, 0);
```

`this.field`는 현재 객체의 필드를 가리킨다.

```java
this.name = name;
this.price = price;
```

따라서 다음과 같이 구분한다.

- `this(...)`: 초기화를 다른 생성자에게 맡길 때 사용
- `this.name`: 현재 객체의 name 필드를 사용할 때 작성
- `this.price`: 현재 객체의 price 필드를 사용할 때 작성

### Part 6. this() 사용 규칙

this()는 생성자의 첫 번째 실행문이어야 한다.

```java
Product() {
    this("상품 미정", 0);
}
```

다음과 같이 this()보다 먼저 다른 코드를 실행할 수 없다.

```java
Product() {
    System.out.println("객체 생성");

    // 컴파일 오류
    this("상품 미정", 0);
}
```

생성자가 자기 자신을 다시 호출해서도 안 된다.

```java
class Product {
    Product() {
        // 자기 자신을 다시 호출하므로 오류
        this();
    }
}
```

생성자끼리 서로 반복해서 호출하는 것도 허용되지 않는다.

```java
class Product {
    Product() {
        this("상품");
    }

    Product(String name) {
        this();
    }
}
```

이 코드는 생성자 호출이 끝나지 않으므로 컴파일 오류가 발생한다.

### Part 7. 언제 사용해야 하는가

생성자 오버로딩은 다음과 같은 경우에 사용한다.

**일부 정보에 기본값을 사용할 수 있는 경우**

```java
Course course1 = new Course("Java");
Course course2 = new Course("Java", 30);
```

첫 번째 객체는 기본 정원을 사용하고 두 번째 객체는 정원을 직접 지정할 수 있다.

**객체를 만드는 상황이 여러 가지인 경우**

```java
Member guest = new Member();
Member member = new Member("민수");
Member manager = new Member("지수", 10);
```

방문자, 일반 회원, 기존 회원을 서로 다른 정보로 생성할 수 있다.

**여러 생성자에서 같은 초기화가 반복되는 경우**

```java
Member() {
    this("게스트", 1);
}

Member(String name) {
    this(name, 1);
}
```

this()로 공통 초기화를 한 생성자에 모을 수 있다.

반대로 객체 생성에 반드시 필요한 정보가 정해져 있다면 불필요하게 생성자를 여러 개 만들 필요는 없다.

```java
class Account {
    String id;

    Account(String id) {
        this.id = id;
    }
}
```

계정에는 id가 반드시 필요하다면 Account()를 추가하지 않는 편이 안전하다.

```java
new Account();        // 허용하지 않음
new Account("user01"); // id를 반드시 전달
```

생성자 오버로딩은 객체 생성을 무조건 편하게 만드는 기능이 아니다. 생략해도 되는 값에는 기본값을 제공하고, 반드시 필요한 값은 생성자에서 요구하기 위해 사용한다.

### 종합 예제

강좌는 다음 세 가지 상황에서 생성할 수 있다고 가정한다.

- 강좌 정보가 아직 정해지지 않음
- 강좌 이름만 정해짐
- 강좌 이름과 정원이 모두 정해짐

```java
class Course {
    String title;
    int capacity;

    Course() {
        this("미정", 0);
    }

    Course(String title) {
        this(title, 20);
    }

    Course(String title, int capacity) {
        this.title = title;
        this.capacity = capacity;
    }

    void showInfo() {
        System.out.println(title + ": " + capacity + "명");
    }
}

public class Main {
    public static void main(String[] args) {
        Course undecided = new Course();
        Course regular = new Course("Java");
        Course special = new Course("Python", 30);

        undecided.showInfo();
        regular.showInfo();
        special.showInfo();
    }
}
```

**실행 결과**

```text
미정: 0명
Java: 20명
Python: 30명
```

- `new Course()`: 정보가 아직 없으므로 기본값 사용
- `new Course("Java")`: 제목만 전달하고 정원은 기본값 20 사용
- `new Course("Python", 30)`: 제목과 정원을 모두 직접 지정

세 생성자가 따로 필드를 초기화하지 않고 마지막 생성자에 초기화 작업을 모은다.

## 다음으로

다음 학습 내용은 [Part 5「패키지·import·프로젝트 구조」](/dev/lessons/DEV-JAVA-02-05)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 4)

### 확인 1. 필요한 정보에 맞는 생성자 호출  `코드 빈칸`

**문제.** 이름만 있는 신규 회원과 이름·레벨이 모두 있는 관리자를 생성하도록 빈칸을 채우시오.

```java
class Member {
    String name;
    int level;

    Member() {
        this("게스트", 1);
    }

    Member(String name) {
        this(name, 1);
    }

    Member(String name, int level) {
        this.name = name;
        this.level = level;
    }
}

public class Main {
    public static void main(String[] args) {
        Member guest = new Member();
        Member newMember = new Member(〔①〕);
        Member manager = new Member(〔②〕, 〔③〕);

        System.out.println(guest.name + ": " + guest.level);
        System.out.println(newMember.name + ": " + newMember.level);
        System.out.println(manager.name + ": " + manager.level);
    }
}
```
- ✅ **정답:** ① = `"민수"` , ② = `"지수"` , ③ = `10`
- 보기 토큰: `"민수"` / `"지수"` / `10` / `민수` / `지수` / `"10"` / `1` / `name`
- 실행결과:
```
게스트: 1
민수: 1
지수: 10
```

> 💡 **해설.** 정보가 없으면 Member(), 이름만 있으면 Member(String), 이름과 레벨이 모두 있으면 Member(String, int)를 사용한다. 필요한 정보의 양에 따라 알맞은 생성자를 선택한다.

### 확인 2. 기본값을 다른 생성자에 전달  `코드 빈칸`

**문제.** 좌석 수를 생략하면 기본값 15를 사용하고, 실제 필드 초기화는 두 값을 받는 생성자에서 처리하도록 완성하시오.

```java
class Workshop {
    String topic;
    int seats;

    Workshop(String topic) {
        〔①〕(topic, 15);
    }

    Workshop(String topic, int seats) {
        〔②〕.topic = 〔③〕;
        〔④〕.seats = 〔⑤〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Workshop workshop = new Workshop("웹 개발");

        System.out.println(workshop.topic);
        System.out.println(workshop.seats);
    }
}
```
- ✅ **정답:** ① = `this` , ② = `this` , ③ = `topic` , ④ = `this` , ⑤ = `seats`
- 보기 토큰: `this` / `this` / `this` / `topic` / `seats` / `Workshop` / `workshop` / `String` / `int`
- 실행결과:
```
웹 개발
15
```

> 💡 **해설.** Workshop(String)은 좌석 수가 없는 경우에 사용한다. this(topic, 15)로 기본 좌석 수를 전달하고, 실제 필드 초기화는 Workshop(String, int)에서 처리한다.

### 확인 3. 필수값과 선택값이 있는 생성자 조립  `순서 배열`

**문제.** 배송 주소는 반드시 받고, 배송 방법을 생략하면 "일반"을 사용하도록 한 줄씩 배열하여 서울, 일반을 출력하시오.

- ✅ **정답 순서:**
```
class Shipping {
    String address;
    String method;
    Shipping(String address) {
        this(address, "일반");
    }
    Shipping(String address, String method) {
        this.address = address;
        this.method = method;
    }
}
public class Main {
    public static void main(String[] args) {
        Shipping shipping =
            new Shipping("서울");
        System.out.println(shipping.address);
        System.out.println(shipping.method);
    }
}
```

- ❌ **오답 카드(제외):**
```
        this("일반", address);
        this.method = address;
```

> 💡 **해설.** 주소는 반드시 필요하므로 매개변수 없는 생성자는 제공하지 않는다. 배송 방법을 생략하면 Shipping(String)이 "일반"을 대신 전달한다. 오답 코드는 주소와 배송 방법의 위치가 뒤바뀌어 요구한 결과가 나오지 않는다.

### 확인 4. 생성자 구성 선택  `객관식`

**문제.** 사용자 이름은 반드시 입력하고, 역할을 생략하면 "USER"를 사용해야 한다. 요구사항에 가장 알맞은 생성자 구성은?

- **A.** `User()`(빈 값)와 `User(String, String)`
- **B.** `User(String)`이 `this(username, "USER")` 호출 + `User(String, String)` 초기화 ✅
- **C.** `User(String)`이 `this(username)`으로 자기 자신 호출
- **D.** `User(String username)`과 `User(String name)` (매개변수 구성 동일)
- ✅ **정답:** B

> 💡 **해설.** 사용자 이름은 필수이므로 매개변수 없는 생성자를 제공하지 않는다. 역할만 선택값이므로 User(String)이 "USER"를 전달하고, User(String, String)이 실제 필드를 초기화하는 구성이 적절하다. C는 자기 자신을 호출하고 D는 매개변수 구성이 같아 오버로딩되지 않는다.

### 확인 5. 매개변수 타입으로 생성자 선택  `코드 빈칸`

**문제.** 정수 식별자와 문자열 식별자가 서로 다른 생성자를 호출하도록 빈칸을 채우시오.

```java
class Identifier {
    String value;

    Identifier(int number) {
        value = "N-" + number;
    }

    Identifier(String text) {
        value = "T-" + text;
    }
}

public class Main {
    public static void main(String[] args) {
        Identifier numberId = new Identifier(〔①〕);
        Identifier textId = new Identifier(〔②〕);

        System.out.println(numberId.value);
        System.out.println(textId.value);
    }
}
```
- ✅ **정답:** ① = `7` , ② = `"7"`
- 보기 토큰: `7` / `"7"` / `'7'` / `7.0` / `number` / `text`
- 실행결과:
```
N-7
T-7
```

> 💡 **해설.** 정수 7은 Identifier(int)를 호출하고 문자열 "7"은 Identifier(String)을 호출한다. 인수의 개수는 같지만 타입이 달라 서로 다른 생성자가 선택된다.

### 확인 6. 세 생성자의 초기화 연결  `순서 배열`

**문제.** 제목만 전달한 보고서에 기본 페이지 수 1을 저장하도록 한 줄씩 배열하여 월간 보고서, 1을 출력하시오.

- ✅ **정답 순서:**
```
class Report {
    String title;
    int pages;
    Report() {
        this("제목 없음");
    }
    Report(String title) {
        this(title, 1);
    }
    Report(String title, int pages) {
        this.title = title;
        this.pages = pages;
    }
}
public class Main {
    public static void main(String[] args) {
        Report report =
            new Report("월간 보고서");
        System.out.println(report.title);
        System.out.println(report.pages);
    }
}
```

- ❌ **오답 카드(제외):**
```
        this(1, title);
        this(title);
```

> 💡 **해설.** Report(String)은 페이지 수가 생략된 경우 기본값 1을 전달한다. this(title)을 작성하면 현재 실행 중인 Report(String)을 다시 호출하므로 오류가 발생한다. this(1, title)은 매개변수 타입과 순서가 맞지 않는다.

### 확인 7. 필수 ID와 선택 레벨  `코드 빈칸`

**문제.** 계정 ID는 반드시 전달하고, 레벨을 생략한 계정에는 기본값 1을 사용하도록 객체를 생성하시오.

```java
class Account {
    String id;
    int level;

    Account(String id) {
        this(id, 1);
    }

    Account(String id, int level) {
        this.id = id;
        this.level = level;
    }
}

public class Main {
    public static void main(String[] args) {
        Account basic = new Account(〔①〕);
        Account advanced = new Account(〔②〕, 〔③〕);

        System.out.println(basic.id + ": " + basic.level);
        System.out.println(advanced.id + ": " + advanced.level);
    }
}
```
- ✅ **정답:** ① = `"user01"` , ② = `"admin01"` , ③ = `8`
- 보기 토큰: `"user01"` / `"admin01"` / `8` / `user01` / `admin01` / `"8"` / `1` / `level`
- 실행결과:
```
user01: 1
admin01: 8
```

> 💡 **해설.** ID는 필수이므로 두 생성자 모두 String id를 받는다. 일반 계정은 ID만 전달하여 기본 레벨 1을 사용하고, 기존 레벨이 있는 계정은 ID와 레벨을 모두 전달한다.

### 확인 8. 인수 개수에 따른 객체 초기화  `코드 빈칸`

**문제.** 정사각형과 직사각형에 알맞은 값을 전달하여 넓이 25와 24를 차례로 출력하시오.

```java
class Box {
    int width;
    int height;

    Box(int size) {
        this(size, size);
    }

    Box(int width, int height) {
        this.width = width;
        this.height = height;
    }

    int getArea() {
        return width * height;
    }
}

public class Main {
    public static void main(String[] args) {
        Box square = new Box(〔①〕);
        Box rectangle = new Box(〔②〕, 〔③〕);

        System.out.println(square.getArea());
        System.out.println(rectangle.getArea());
    }
}
```
- ✅ **정답:** ① = `5` , ② = `4` , ③ = `6`
- 보기 토큰: `5` / `4` / `6` / `"5"` / `24` / `25` / `width` / `height`
- 실행결과:
```
25
24
```

> 💡 **해설.** 정사각형은 한 변의 길이만 받으면 되므로 Box(int)를 사용한다. 직사각형은 너비와 높이가 모두 필요하므로 Box(int, int)를 사용한다. Box(int)는 같은 값을 두 번 전달하여 마지막 생성자에서 필드를 초기화한다.

### 확인 9. 종합 — 기본 배송비와 지정 배송비  `순서 배열`

**문제.** 주소만 받으면 기본 배송비 3000을 사용하고, 배송비가 정해졌다면 지정하도록 한 줄씩 배열하여 부산 배송과 서울 배송 순서로 출력하시오.

- ✅ **정답 순서:**
```
class Delivery {
    String address;
    int fee;
    Delivery(String address) {
        this(address, 3000);
    }
    Delivery(String address, int fee) {
        this.address = address;
        this.fee = fee;
    }
    void showInfo() {
        System.out.println(address + ": " + fee);
    }
}
public class Main {
    public static void main(String[] args) {
        Delivery normal =
            new Delivery("서울");
        Delivery custom =
            new Delivery("부산", 5000);
        custom.showInfo();
        normal.showInfo();
    }
}
```

- ❌ **오답 카드(제외):**
```
        this(3000, address);
        Delivery normal = new Delivery();
```

> 💡 **해설.** 주소는 필수이므로 모든 생성자가 String address를 받는다. 배송비를 생략하면 Delivery(String)이 기본값 3000을 전달하고, 배송비가 별도로 정해졌다면 Delivery(String, int)를 사용한다. 인수가 없는 생성자는 선언되지 않았으므로 new Delivery()는 사용할 수 없다.

---

# Part 5. Java중급05 패키지·import·프로젝트 구조

`DEV-JAVA-02-05` · 문제 9개 (코드 빈칸 5 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 클래스가 많아질 때 패키지가 필요한 이유를 설명한다.
- 클래스가 속할 패키지를 선언한다.
- 패키지 이름과 폴더 구조를 일치시킨다.
- 다른 패키지의 클래스를 import하여 사용한다.
- 같은 패키지에서는 import가 필요하지 않음을 이해한다.
- 여러 파일로 이루어진 Java 프로젝트의 기본 구조를 구성한다.

## 수업 내용

### Part 1. 패키지가 필요한 이유

지금까지는 클래스 수가 적어 하나의 위치에서 관리할 수 있었다.

```text
Main.java
Student.java
Teacher.java
Product.java
Order.java
```

프로젝트가 커지면 클래스 파일이 계속 늘어난다.

```text
Main.java
Student.java
Teacher.java
Product.java
Order.java
User.java
Admin.java
Payment.java
Delivery.java
Review.java
```

모든 클래스를 한곳에 두면 다음 문제가 생긴다.

- 원하는 클래스를 찾기 어렵다.
- 어떤 기능에 속한 클래스인지 구분하기 어렵다.
- 같은 이름의 클래스를 만들 수 없다.
- 프로젝트의 기능별 구조를 파악하기 어렵다.

패키지는 관련 있는 클래스를 하나의 그룹으로 묶는다.

```text
school
 ├─ Student.java
 └─ Teacher.java

shop
 ├─ Product.java
 └─ Order.java
```

학교와 관련된 클래스는 school, 쇼핑과 관련된 클래스는 shop 패키지로 나눌 수 있다.

패키지가 다르면 같은 이름의 클래스도 구분할 수 있다.

```text
shop.User
admin.User
```

두 클래스의 이름은 모두 User지만 전체 이름이 다르다.

- shop.User: 쇼핑몰 사용자
- admin.User: 관리자 사용자

클래스가 많아졌을 때 기능별로 정리하고 이름 충돌을 막기 위해 패키지를 사용한다.

### Part 2. package 선언

클래스가 속할 패키지는 파일의 첫 부분에서 선언한다.

```java
package school;

public class Student {
}
```

기본 형식은 다음과 같다.

```java
package 패키지이름;
```

`package school;`은 Student 클래스가 school 패키지에 속한다는 뜻이다.

일반적으로 패키지 이름은 영문 소문자로 작성한다.

```java
package school;
package shop;
package account;
```

여러 단계의 패키지는 점으로 구분한다.

```java
package school.student;
package shop.order;
```

패키지 선언은 주석을 제외하고 파일의 첫 번째 실행 가능한 선언이어야 한다.

```java
package school;

public class Student {
}
```

다음 위치에는 작성할 수 없다.

```java
public class Student {
    package school; // 컴파일 오류
}
```

**자주 하는 실수**

패키지 이름 뒤에는 세미콜론이 필요하다.

```java
package school // 컴파일 오류
package school;
```

하나의 소스 파일에는 하나의 package 선언만 작성한다.

```java
package school;
package shop; // 컴파일 오류
```

### Part 3. 패키지와 폴더 구조

패키지 이름은 일반적으로 소스 파일이 들어 있는 폴더 구조와 일치시킨다.

```text
src/
└─ school/
   └─ Student.java
```

Student.java:

```java
package school;

public class Student {
}
```

여러 단계의 패키지는 폴더도 여러 단계로 구성한다.

```text
src/
└─ school/
   └─ student/
      └─ Student.java
```

Student.java:

```java
package school.student;

public class Student {
}
```

다음 패키지 이름은:

```java
package school.student;
```

다음 폴더 구조에 대응한다.

```text
school/student/
```

패키지 이름과 폴더 구조가 다르면 IDE나 빌드 도구에서 클래스를 찾지 못하거나 잘못된 패키지 오류가 발생할 수 있다.

public 클래스의 이름과 파일 이름도 일치시킨다.

```java
// Student.java
public class Student {
}
```

다음 구성은 잘못되었다.

```java
// Member.java
public class Student {
}
```

public 클래스 이름이 Student라면 파일 이름도 Student.java여야 한다.

### Part 4. 같은 패키지의 클래스 사용

같은 패키지에 있는 클래스는 import 없이 사용할 수 있다.

프로젝트 구조:

```text
src/
└─ school/
   ├─ Student.java
   └─ SchoolMain.java
```

Student.java:

```java
package school;

public class Student {
    public void introduce() {
        System.out.println("학생입니다.");
    }
}
```

SchoolMain.java:

```java
package school;

public class SchoolMain {
    public static void main(String[] args) {
        Student student = new Student();

        student.introduce();
    }
}
```

두 클래스 모두 school 패키지에 속하므로 다음 import는 필요하지 않다.

```java
import school.Student;
```

같은 패키지의 클래스는 클래스 이름만으로 서로 찾을 수 있다.

예제에 사용한 public의 자세한 접근 규칙은 다음 파트에서 학습한다. 여기서는 다른 파일에서 클래스를 사용하기 위한 형태로 사용한다.

### Part 5. 다른 패키지와 import

다른 패키지에 있는 클래스를 짧은 이름으로 사용하려면 import를 작성한다.

프로젝트 구조:

```text
src/
├─ school/
│  └─ Student.java
└─ app/
   └─ Main.java
```

Student.java:

```java
package school;

public class Student {
    public void introduce() {
        System.out.println("학생입니다.");
    }
}
```

Main.java:

```java
package app;

import school.Student;

public class Main {
    public static void main(String[] args) {
        Student student = new Student();

        student.introduce();
    }
}
```

`import school.Student;`는 school 패키지의 Student 클래스를 현재 파일에서 Student라는 짧은 이름으로 사용할 수 있게 한다.

import는 package 선언 다음, 클래스 선언 전에 작성한다.

```java
package app;

import school.Student;

public class Main {
}
```

다음 순서로 작성하면 안 된다.

```java
import school.Student;
package app; // 컴파일 오류
```

올바른 작성 순서는 다음과 같다.

- package 선언
- import 선언
- class 선언

### Part 6. import를 사용하는 이유

import가 없더라도 클래스의 전체 이름을 작성하면 다른 패키지의 클래스를 사용할 수 있다.

```java
school.Student student = new school.Student();
```

이를 전체 패키지 이름을 포함한 클래스 이름이라고 한다.

같은 클래스를 여러 번 사용하면 전체 이름을 반복해야 한다.

```java
school.Student first = new school.Student();
school.Student second = new school.Student();
```

import를 사용하면 코드가 짧아진다.

```java
import school.Student;

Student first = new Student();
Student second = new Student();
```

다른 패키지의 클래스를 여러 번 사용하면서 전체 이름을 반복하지 않기 위해 import를 사용한다.

import는 클래스를 설치하거나 파일을 복사하는 기능이 아니다. 컴파일러에게 짧은 클래스 이름이 어느 패키지의 클래스를 뜻하는지 알려준다.

### Part 7. import가 필요하지 않은 경우

다음 경우에는 import를 작성하지 않아도 된다.

**현재 클래스와 같은 패키지에 있는 경우**

```java
package school;
```

같은 school 패키지에 있는 클래스는 바로 사용할 수 있다.

**java.lang 패키지에 있는 경우**

String과 System 등의 클래스는 java.lang 패키지에 속한다.

```java
String message = "Java";
System.out.println(message);
```

다음 import는 자동으로 적용되므로 직접 작성하지 않는다.

```java
import java.lang.String;
import java.lang.System;
```

**클래스의 전체 이름을 직접 작성하는 경우**

```java
java.util.Scanner scanner =
        new java.util.Scanner(System.in);
```

전체 이름을 작성했으므로 다음 import는 필요하지 않다.

```java
import java.util.Scanner;
```

전체 이름은 서로 다른 패키지에 같은 이름의 클래스가 있을 때 구분하기 위해 사용할 수 있다.

### Part 8. 여러 클래스를 import하기

필요한 클래스를 각각 import할 수 있다.

```java
import java.util.Scanner;
import java.util.ArrayList;
```

별표 `*`를 사용하면 한 패키지에 직접 포함된 여러 클래스를 불러올 수도 있다.

```java
import java.util.*;
```

하지만 `*`는 하위 패키지까지 포함하지 않는다.

```java
import java.util.*;
```

위 코드는 다음 패키지의 클래스를 자동으로 포함하지 않는다.

```text
java.util.concurrent
java.util.function
```

어떤 클래스를 사용하는지 쉽게 확인하려면 필요한 클래스를 직접 작성하는 방식이 명확하다.

```java
import java.util.Scanner;
import java.util.ArrayList;
```

### Part 9. 프로젝트 기본 구조

여러 파일을 사용하는 Java 프로젝트는 일반적으로 소스 코드를 src 폴더 아래에 배치한다.

```text
project/
└─ src/
   ├─ app/
   │  └─ Main.java
   ├─ school/
   │  ├─ Student.java
   │  └─ Teacher.java
   └─ shop/
      ├─ Product.java
      └─ Order.java
```

각 파일의 package 선언은 src 아래의 폴더 구조와 맞춘다.

Main.java:

```java
package app;
```

Student.java:

```java
package school;
```

Product.java:

```java
package shop;
```

프로젝트를 기능별 패키지로 나누면 다음 장점이 있다.

- 관련 클래스를 함께 찾을 수 있다.
- 클래스의 역할과 소속을 파악하기 쉽다.
- 같은 이름의 클래스를 서로 다른 패키지에서 사용할 수 있다.
- 기능이 추가되어도 파일을 체계적으로 관리할 수 있다.

처음부터 클래스가 한두 개뿐인 짧은 연습 프로그램이라면 패키지가 없어도 실행할 수 있다. 하지만 여러 기능과 파일을 가진 프로젝트에서는 패키지를 사용하는 것이 좋다.

### 종합 예제

프로젝트 구조:

```text
src/
├─ app/
│  └─ Main.java
└─ library/
   └─ Book.java
```

Book.java:

```java
package library;

public class Book {
    public void showTitle() {
        System.out.println("Java Guide");
    }
}
```

Main.java:

```java
package app;

import library.Book;

public class Main {
    public static void main(String[] args) {
        Book book = new Book();

        book.showTitle();
    }
}
```

**실행 결과**

```text
Java Guide
```

Book 클래스는 library 패키지에 있고 Main 클래스는 app 패키지에 있다. Main에서 다른 패키지의 Book을 짧은 이름으로 사용하기 위해 `import library.Book;`을 작성한다.

## 다음으로

다음 학습 내용은 [Part 6「접근 제어자·접근 범위」](/dev/lessons/DEV-JAVA-02-06)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 5)

### 확인 1. 폴더에 맞는 package 선언  `코드 빈칸`

**문제.** src/library/ 아래에 있는 Book.java가 library 패키지에 속하도록 빈칸을 채우시오. (빈칸 2곳)

```java
〔①〕 〔②〕;

public class Book {
}
```
- ✅ **정답:** ① = `package` , ② = `library`
- 보기 토큰: `package` / `library` / `import` / `Book` / `src` / `class`
- 실행결과:
```

```

> 💡 **해설.** src 아래의 library 폴더에 있는 클래스는 package library;로 선언한다. package는 클래스가 소속된 패키지를 지정하고 import는 다른 패키지의 클래스를 사용할 때 작성한다.

### 확인 2. 다른 패키지의 클래스 사용  `코드 빈칸`

**문제.** app 패키지의 Main에서 device 패키지의 Printer를 사용하도록 빈칸을 채우시오. (빈칸 5곳)

```java
package 〔①〕;

import 〔②〕.〔③〕;

public class Main {
    public static void main(String[] args) {
        〔④〕 printer = new 〔⑤〕();

        printer.print();
    }
}
```
- ✅ **정답:** ① = `app` , ② = `device` , ③ = `Printer` , ④ = `Printer` , ⑤ = `Printer`
- 보기 토큰: `app` / `device` / `Printer` / `Printer` / `Printer` / `printer` / `Main` / `package` / `src`
- 실행결과:
```
인쇄 시작
```

> 💡 **해설.** Main은 app 패키지에 있고 Printer는 device 패키지에 있다. 다른 패키지의 클래스를 짧은 이름으로 사용하려면 import device.Printer;를 작성해야 한다.

### 확인 3. package·import·class 순서 조립  `순서 배열`

**문제.** music 패키지의 Song을 app 패키지에서 사용하도록 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
package app;
import music.Song;
public class Main {
    public static void main(String[] args) {
        Song song = new Song();
        song.play();
    }
}
```

- ❌ **오답 카드(제외):**
```
import music;
Song.play();
```

> 💡 **해설.** package, import, class 순서로 작성한다. import에는 패키지 이름만 적는 것이 아니라 music.Song처럼 사용할 클래스까지 작성한다. play()는 인스턴스 메서드이므로 생성된 song 객체로 호출한다.

### 확인 4. import가 필요한 상황  `객관식`

**문제.** 명시적인 import가 반드시 필요한 상황은?

- **A.** java.lang.String을 String으로 사용한다.
- **B.** school 패키지의 Main에서 같은 school 패키지의 Student를 사용한다.
- **C.** java.util.Scanner라는 전체 이름을 코드에 직접 작성한다.
- **D.** app 패키지의 Main에서 school 패키지의 Student를 Student라는 짧은 이름으로 사용한다. ✅
- ✅ **정답:** D

> 💡 **해설.** 다른 패키지의 클래스를 짧은 이름으로 사용하려면 import가 필요하다. 같은 패키지의 클래스와 java.lang의 클래스는 import 없이 사용할 수 있다. 전체 패키지 이름을 직접 작성한 경우에도 import가 필요하지 않다.

### 확인 5. 전체 클래스 이름으로 Scanner 사용  `코드 빈칸`

**문제.** import를 작성하지 않고 Scanner의 전체 클래스 이름을 사용해 정수를 입력받도록 빈칸을 채우시오. 입력값은 25다. (빈칸 2곳)

```java
public class Main {
    public static void main(String[] args) {
        〔①〕 scanner =
                new 〔②〕(System.in);

        int number = scanner.nextInt();

        System.out.println(number);

        scanner.close();
    }
}
```
- ✅ **정답:** ① = `java.util.Scanner` , ② = `java.util.Scanner`
- 보기 토큰: `java.util.Scanner` / `java.util.Scanner` / `Scanner` / `java.lang.Scanner` / `java.util` / `System.in`
- 실행결과:
```
25
```

> 💡 **해설.** import를 사용하지 않으면 java.util.Scanner라는 전체 이름을 선언과 객체 생성에 모두 작성해야 한다. import는 이 전체 이름을 Scanner라는 짧은 이름으로 사용할 수 있게 한다.

### 확인 6. 같은 패키지의 클래스 사용  `순서 배열`

**문제.** Teacher와 SchoolMain이 모두 school 패키지에 있다. import 없이 Teacher를 사용하도록 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
package school;
public class SchoolMain {
    public static void main(String[] args) {
        Teacher teacher = new Teacher();
        teacher.introduce();
    }
}
```

- ❌ **오답 카드(제외):**
```
import Teacher;
Teacher.introduce();
```

> 💡 **해설.** Teacher와 SchoolMain은 모두 school 패키지에 있으므로 import가 필요하지 않다. import Teacher;는 패키지를 포함하지 않은 잘못된 import이며, introduce()는 Teacher 객체로 호출해야 한다.

### 확인 7. 여러 단계의 패키지 선언  `코드 빈칸`

**문제.** 폴더 구조 src/com/acme/payment/Receipt.java와 일치하도록 package 선언을 완성하시오. (빈칸 3곳)

```java
package 〔①〕.〔②〕.〔③〕;

public class Receipt {
}
```
- ✅ **정답:** ① = `com` , ② = `acme` , ③ = `payment`
- 보기 토큰: `com` / `acme` / `payment` / `src` / `Receipt` / `package` / `app`
- 실행결과:
```

```

> 💡 **해설.** src 아래의 폴더 경로 com/acme/payment는 패키지 이름 com.acme.payment에 대응한다. src는 소스 코드의 기준 폴더이므로 package 이름에 포함하지 않는다.

### 확인 8. 여러 클래스 import  `코드 빈칸`

**문제.** app 패키지의 Main에서 model.User와 admin.Permission을 사용하도록 import를 완성하시오. (빈칸 2곳)

```java
package app;

import 〔①〕.User;
import 〔②〕.Permission;

public class Main {
    public static void main(String[] args) {
        User user = new User();
        Permission permission = new Permission();

        System.out.println("준비 완료");
    }
}
```
- ✅ **정답:** ① = `model` , ② = `admin`
- 보기 토큰: `model` / `admin` / `app` / `User` / `Permission` / `java.lang` / `src`
- 실행결과:
```
준비 완료
```

> 💡 **해설.** User의 전체 이름은 model.User이고 Permission의 전체 이름은 admin.Permission이다. 서로 다른 패키지의 클래스를 사용하므로 각 클래스를 별도로 import한다.

### 확인 9. 종합 — 두 클래스가 있는 프로젝트  `순서 배열`

**문제.** library 패키지의 Book과 Member를 app 패키지에서 사용하도록 Main.java를 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
package app;
import library.Book;
import library.Member;
public class Main {
    public static void main(String[] args) {
        Book book = new Book();
        Member member = new Member();
        book.showTitle();
        member.showName();
    }
}
```

- ❌ **오답 카드(제외):**
```
import library.Book.Member;
Book member = new Member();
```

> 💡 **해설.** Book과 Member는 library 패키지에 있으므로 각각 import한다. library.Book.Member는 Member가 Book 내부에 있는 것처럼 작성한 잘못된 경로다. Book 변수에는 Member 객체를 저장할 수 없다.

---

# Part 6. Java중급06 접근 제어자·접근 범위

`DEV-JAVA-02-06` · 문제 11개 (코드 빈칸 7 · 객관식 1 · 순서 3)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 접근 범위를 제한해야 하는 이유를 설명한다.
- public, protected, 접근 제어자 없음, private을 구분한다.
- 같은 클래스·같은 패키지·다른 패키지의 접근 차이를 이해한다.
- 클래스와 생성자의 접근 범위를 지정한다.
- 외부에 공개할 기능과 내부에서만 사용할 기능을 구분한다.

## 수업 내용

### Part 1. 접근 제어자가 필요한 이유

클래스의 모든 기능을 외부에서 사용할 필요는 없다.

```java
class OrderService {
    void placeOrder() {
        checkStock();
        calculatePrice();
    }

    void checkStock() {
        System.out.println("재고 확인");
    }

    void calculatePrice() {
        System.out.println("가격 계산");
    }
}
```

외부에서는 주문 기능인 placeOrder()만 호출하면 된다. 재고 확인과 가격 계산은 주문 처리 과정에서 내부적으로 사용하는 기능이다.

모든 메서드가 공개되면 외부 코드가 내부 처리 메서드를 직접 호출할 수 있다.

```java
service.checkStock();
service.calculatePrice();
```

접근 제어자를 사용하면 다음을 구분할 수 있다.

- 다른 패키지에서도 사용할 공개 기능
- 같은 패키지에서만 공유할 기능
- 현재 클래스 내부에서만 사용할 기능
- 상속받은 클래스에서 사용할 기능

접근 제어자는 클래스의 모든 코드를 공개하지 않고 필요한 부분만 사용할 수 있게 하기 위해 사용한다.

### Part 2. 네 가지 접근 범위

Java의 접근 범위는 네 가지다.

| 접근 형태 | 같은 클래스 | 같은 패키지 | 다른 패키지의 자식 클래스 | 다른 패키지 |
|---|---|---|---|---|
| public | 가능 | 가능 | 가능 | 가능 |
| protected | 가능 | 가능 | 가능 | 불가능 |
| 접근 제어자 없음 | 가능 | 가능 | 불가능 | 불가능 |
| private | 가능 | 불가능 | 불가능 | 불가능 |

접근 범위는 다음 순서로 좁아진다.

```text
public → protected → 접근 제어자 없음 → private
```

**public**

어디에서나 사용할 수 있다.

```java
public void placeOrder() {
}
```

다른 패키지에 있는 클래스에도 제공해야 하는 기능에 사용한다.

**private**

선언된 클래스 내부에서만 사용할 수 있다.

```java
private void calculatePrice() {
}
```

클래스의 내부 처리 과정처럼 외부에서 직접 호출할 필요가 없는 기능에 사용한다.

**접근 제어자 없음**

접근 제어자를 작성하지 않으면 같은 패키지에서만 사용할 수 있다.

```java
void checkStock() {
}
```

이를 package-private 또는 기본 접근 범위라고 한다.

default라는 접근 제어자를 작성하는 것은 아니다.

```java
// 잘못된 코드
default void checkStock() {
}
```

접근 제어자를 생략해야 한다.

```java
void checkStock() {
}
```

**protected**

같은 패키지와 상속받은 클래스에서 사용할 수 있다.

```java
protected void updateStatus() {
}
```

다른 패키지에 있는 일반 클래스에는 공개되지 않는다. 상속받은 클래스에서의 정확한 사용 규칙은 상속 파트에서 학습한다.

### Part 3. 같은 패키지와 다른 패키지

ProductService가 shop 패키지에 있다고 가정한다.

ProductService.java:

```java
package shop;

public class ProductService {
    public void sell() {
        checkStock();
        calculatePrice();
    }

    void checkStock() {
        System.out.println("재고 확인");
    }

    private void calculatePrice() {
        System.out.println("가격 계산");
    }
}
```

같은 shop 패키지의 클래스에서는 public과 접근 제어자 없는 메서드를 사용할 수 있다.

ShopMain.java:

```java
package shop;

public class ShopMain {
    public static void main(String[] args) {
        ProductService service =
                new ProductService();

        service.sell();
        service.checkStock();

        // private이므로 컴파일 오류
        // service.calculatePrice();
    }
}
```

다른 app 패키지에서는 public 메서드만 사용할 수 있다.

Main.java:

```java
package app;

import shop.ProductService;

public class Main {
    public static void main(String[] args) {
        ProductService service =
                new ProductService();

        service.sell();

        // 같은 패키지가 아니므로 컴파일 오류
        // service.checkStock();

        // private이므로 컴파일 오류
        // service.calculatePrice();
    }
}
```

패키지가 달라지면 접근 가능한 범위도 달라진다.

### Part 4. private 메서드

private 메서드는 해당 클래스 내부에서만 호출할 수 있다.

```java
class MessageService {
    public void send() {
        prepareMessage();
        System.out.println("메시지 전송");
    }

    private void prepareMessage() {
        System.out.println("메시지 준비");
    }
}
```

외부에서는 공개된 send()만 호출한다.

```java
MessageService service =
        new MessageService();

service.send();
```

**실행 결과**

```text
메시지 준비
메시지 전송
```

다음 호출은 허용되지 않는다.

```java
// 컴파일 오류
service.prepareMessage();
```

prepareMessage()는 외부에서 독립적으로 사용할 기능이 아니라 send()의 내부 처리 과정이다. 이처럼 클래스 내부에서만 필요한 보조 메서드에는 private을 사용한다.

### Part 5. 클래스의 접근 범위

다른 패키지에서 최상위 클래스를 사용하려면 클래스를 public으로 선언한다.

```java
package shop;

public class Product {
}
```

public 클래스의 이름은 파일 이름과 같아야 한다.

```text
Product.java
```

접근 제어자를 작성하지 않은 클래스는 같은 패키지에서만 사용할 수 있다.

```java
package shop;

class ProductHelper {
}
```

ProductHelper는 shop 패키지 내부에서만 사용할 수 있다.

최상위 클래스에는 다음 두 접근 형태만 사용할 수 있다.

```java
public class Product {
}
```

```java
class ProductHelper {
}
```

최상위 클래스에 private이나 protected는 사용할 수 없다.

```java
// 컴파일 오류
private class Product {
}
```

```java
// 컴파일 오류
protected class Product {
}
```

### Part 6. 생성자의 접근 범위

생성자에도 접근 제어자를 작성할 수 있다.

```java
public class Product {
    public Product() {
    }
}
```

public 생성자는 다른 패키지에서도 호출할 수 있다.

```java
Product product = new Product();
```

접근 제어자가 없는 생성자는 같은 패키지에서만 호출할 수 있다.

```java
public class Product {
    Product() {
    }
}
```

Product 클래스가 public이어도 생성자가 공개되지 않았으므로 다른 패키지에서는 객체를 만들 수 없다.

```java
// 다른 패키지에서는 컴파일 오류
Product product = new Product();
```

private 생성자는 같은 클래스 내부에서만 호출할 수 있다.

```java
public class Product {
    private Product() {
    }
}
```

이 경우 클래스 밖에서는 new Product()를 사용할 수 없다. private 생성자를 실제로 활용하는 방법은 이후 static을 학습한 뒤 다룰 수 있다.

### Part 7. 접근 범위 선택 기준

접근 범위는 기능을 어디까지 공개해야 하는지에 따라 결정한다.

| 사용 상황 | 접근 형태 |
|---|---|
| 모든 패키지에 공개할 기능 | public |
| 같은 패키지에서만 공유할 기능 | 접근 제어자 없음 |
| 같은 패키지와 자식 클래스에서 사용할 기능 | protected |
| 현재 클래스 내부에서만 사용할 기능 | private |

일반적으로 외부에 제공해야 하는 기능은 public으로 선언한다.

```java
public void start() {
}
```

내부 처리 과정은 private으로 제한한다.

```java
private void prepare() {
}
```

패키지 내부의 여러 클래스가 함께 사용하는 기능은 접근 제어자를 생략할 수 있다.

```java
void check() {
}
```

처음부터 모든 기능을 public으로 만들기보다는 실제로 외부에서 사용해야 하는 기능인지 확인한 뒤 공개하는 것이 좋다.

### 종합 예제

프로젝트 구조:

```text
src/
├─ service/
│  └─ DeliveryService.java
└─ app/
   └─ Main.java
```

DeliveryService.java:

```java
package service;

public class DeliveryService {
    public void deliver() {
        checkAddress();
        preparePackage();
        System.out.println("배송 시작");
    }

    void checkAddress() {
        System.out.println("주소 확인");
    }

    private void preparePackage() {
        System.out.println("포장 준비");
    }
}
```

Main.java:

```java
package app;

import service.DeliveryService;

public class Main {
    public static void main(String[] args) {
        DeliveryService service =
                new DeliveryService();

        service.deliver();
    }
}
```

**실행 결과**

```text
주소 확인
포장 준비
배송 시작
```

app 패키지에서는 public인 deliver()만 호출할 수 있다. checkAddress()는 같은 service 패키지에서만 사용할 수 있고, preparePackage()는 DeliveryService 내부에서만 사용할 수 있다.

## 다음으로

다음 학습 내용은 [Part 7「캡슐화·getter·setter」](/dev/lessons/DEV-JAVA-02-07)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 6)

### 확인 1. 공개 메서드와 내부 메서드  `코드 빈칸`

**문제.** 외부에서는 send()만 호출하고, prepare()는 MessageService 내부에서만 사용하도록 빈칸을 채우시오. (빈칸 4곳)

```java
class MessageService {
    〔①〕 void send() {
        〔②〕();
        System.out.println("메시지 전송");
    }

    〔③〕 void prepare() {
        System.out.println("메시지 준비");
    }
}

public class Main {
    public static void main(String[] args) {
        MessageService service =
                new MessageService();

        service.〔④〕();
    }
}
```
- ✅ **정답:** ① = `public` , ② = `prepare` , ③ = `private` , ④ = `send`
- 보기 토큰: `public` / `prepare` / `private` / `send` / `protected` / `service` / `MessageService` / `print`
- 실행결과:
```
메시지 준비
메시지 전송
```

> 💡 **해설.** 외부에서 호출할 send()는 public으로 공개한다. prepare()는 send()의 내부 처리 과정이므로 private으로 제한한다. private 메서드는 같은 클래스의 send() 안에서는 호출할 수 있다.

### 확인 2. 같은 패키지의 package-private 메서드  `코드 빈칸`

**문제.** Warehouse와 WarehouseMain은 같은 warehouse 패키지에 있다. 접근 제어자가 없는 inspect()를 호출하도록 빈칸을 채우시오. (빈칸 2곳)

```java
package warehouse;

public class WarehouseMain {
    public static void main(String[] args) {
        Warehouse warehouse =
                new Warehouse();

        〔①〕.〔②〕();
    }
}
```
- ✅ **정답:** ① = `warehouse` , ② = `inspect`
- 보기 토큰: `warehouse` / `inspect` / `Warehouse` / `WarehouseMain` / `private` / `public`
- 실행결과:
```
창고 점검
```

> 💡 **해설.** inspect()에는 접근 제어자가 없으므로 같은 warehouse 패키지에서 사용할 수 있다. 인스턴스 메서드이므로 클래스 이름이 아니라 warehouse 객체로 호출한다.

### 확인 3. 다른 패키지에서 public 메서드 호출  `순서 배열`

**문제.** app 패키지의 Main에서 service 패키지의 JobService를 사용하도록 한 줄씩 배열하시오. 다른 패키지에서는 public인 execute()만 호출한다.

- ✅ **정답 순서:**
```
package app;
import service.JobService;
public class Main {
    public static void main(String[] args) {
        JobService service =
            new JobService();
        service.execute();
    }
}
```

- ❌ **오답 카드(제외):**
```
        service.prepare();
        service.check();
```

> 💡 **해설.** Main은 service와 다른 패키지에 있으므로 public인 execute()만 호출할 수 있다. prepare()는 같은 패키지에서만 사용할 수 있고 check()는 JobService 내부에서만 사용할 수 있다.

### 확인 4. 접근 가능한 메서드  `객관식`

**문제.** 컴파일되는 호출은?

- **A.** 같은 패키지의 다른 클래스에서 private 메서드를 호출한다.
- **B.** 다른 패키지에서 접근 제어자가 없는 메서드를 호출한다.
- **C.** 다른 패키지에서 public 클래스를 import한 뒤 public 메서드를 호출한다. ✅
- **D.** 다른 패키지의 관계없는 클래스에서 protected 메서드를 호출한다.
- ✅ **정답:** C

> 💡 **해설.** public은 모든 패키지에서 접근할 수 있다. private은 같은 클래스에서만 사용할 수 있고, 접근 제어자가 없으면 같은 패키지에서만 사용할 수 있다. protected의 다른 패키지 접근은 상속 관계가 필요하다.

### 확인 5. 다른 패키지에 클래스와 생성자 공개  `코드 빈칸`

**문제.** app 패키지에서 Printer 객체를 생성하고 print()를 호출할 수 있도록 접근 제어자를 채우시오. (빈칸 3곳)

```java
package device;

〔①〕 class Printer {
    〔②〕 Printer() {
    }

    〔③〕 void print() {
        System.out.println("인쇄");
    }
}
```
- ✅ **정답:** ① = `public` , ② = `public` , ③ = `public`
- 보기 토큰: `public` / `public` / `public` / `private` / `protected` / `class` / `Printer` / `device`
- 실행결과:
```
인쇄
```

> 💡 **해설.** 다른 패키지에서 클래스를 사용하려면 클래스가 public이어야 한다. 객체를 생성하려면 생성자도 public이어야 하고, print()를 호출하려면 메서드 역시 public이어야 한다.

### 확인 6. 같은 패키지에서 두 메서드 사용  `순서 배열`

**문제.** Worker와 TeamMain은 모두 team 패키지에 있다. public인 work()와 접근 제어자가 없는 report()를 차례로 호출하도록 배열하시오.

- ✅ **정답 순서:**
```
package team;
public class TeamMain {
    public static void main(String[] args) {
        Worker worker = new Worker();
        worker.work();
        worker.report();
    }
}
```

- ❌ **오답 카드(제외):**
```
        worker.reset();
        Worker.work();
```

> 💡 **해설.** TeamMain은 Worker와 같은 team 패키지에 있으므로 public인 work()와 package-private인 report()를 모두 호출할 수 있다. private인 reset()은 Worker 클래스 밖에서 호출할 수 없다.

### 확인 7. 외부 객체 생성을 막는 생성자  `코드 빈칸`

**문제.** Token 클래스 밖에서 new Token()을 호출할 수 없도록 생성자의 접근 제어자를 채우시오. (빈칸 1곳)

```java
package token;

public class Token {
    〔①〕 Token() {
        System.out.println("토큰 생성");
    }
}
```
- ✅ **정답:** ① = `private`
- 보기 토큰: `private` / `public` / `protected` / `class` / `void` / `Token`
- 실행결과:
```

```

> 💡 **해설.** private 생성자는 Token 클래스 내부에서만 호출할 수 있다. 따라서 다른 클래스에서는 new Token()으로 객체를 직접 생성할 수 없다. 생성자에는 void와 같은 반환형을 작성하지 않는다.

### 확인 8. public 클래스와 패키지 내부 클래스  `코드 빈칸`

**문제.** 파일 이름이 Service.java일 때 Service는 다른 패키지에 공개하고, ServiceHelper는 service 패키지 안에서만 사용하도록 완성하시오. (빈칸 2곳)

```java
package service;

〔①〕 class 〔②〕 {
}

class ServiceHelper {
}
```
- ✅ **정답:** ① = `public` , ② = `Service`
- 보기 토큰: `public` / `Service` / `private` / `protected` / `ServiceHelper` / `service` / `class`
- 실행결과:
```

```

> 💡 **해설.** 다른 패키지에 공개할 Service는 public으로 선언하고 파일 이름과 클래스 이름을 일치시킨다. ServiceHelper에는 접근 제어자가 없으므로 같은 service 패키지에서만 사용할 수 있다. 하나의 파일에는 public 최상위 클래스를 하나만 둘 수 있다.

### 확인 9. 세 가지 접근 범위 조립  `순서 배열`

**문제.** OrderService의 메서드를 접근 범위와 실행 순서에 맞게 한 줄씩 배열하시오. app 패키지의 Main이 placeOrder()를 호출한다.

- ✅ **정답 순서:**
```
package shop;
public class OrderService {
    public void placeOrder() {
        checkStock();
        calculatePrice();
        System.out.println("주문 완료");
    }
    void checkStock() {
        System.out.println("재고 확인");
    }
    private void calculatePrice() {
        System.out.println("가격 계산");
    }
}
```

- ❌ **오답 카드(제외):**
```
    private void placeOrder() {
    void calculatePrice(int price) {
```

> 💡 **해설.** app 패키지에서 호출할 placeOrder()는 public이어야 한다. checkStock()은 접근 제어자가 없으므로 shop 패키지 내부에서 공유할 수 있다. calculatePrice()는 placeOrder()의 내부 처리 과정이므로 private으로 제한한다.

### 확인 10. protected 메서드 구분  `코드 빈칸`

**문제.** inspect()를 protected로 선언하고, 다른 패키지의 일반 클래스에는 public인 run()만 공개하도록 빈칸을 채우시오. (빈칸 3곳)

```java
// Tool.java
package core;

public class Tool {
    〔①〕 void inspect() {
        System.out.println("내부 점검");
    }

    public void run() {
        〔②〕();
        System.out.println("도구 실행");
    }
}

// Main.java
package app;

import core.Tool;

public class Main {
    public static void main(String[] args) {
        Tool tool = new Tool();

        tool.〔③〕();
    }
}
```
- ✅ **정답:** ① = `protected` , ② = `inspect` , ③ = `run`
- 보기 토큰: `protected` / `inspect` / `run` / `public` / `private` / `Tool` / `tool`
- 실행결과:
```
내부 점검
도구 실행
```

> 💡 **해설.** app의 Main은 Tool과 다른 패키지에 있고 상속 관계도 아니므로 protected인 inspect()를 직접 호출할 수 없다. 외부에는 public인 run()만 공개하고, run()이 클래스 내부에서 inspect()를 호출한다. protected의 상속 관련 접근 방법은 상속 파트에서 자세히 학습한다.

### 확인 11. 지역변수와 접근 제어자  `코드 빈칸`

**문제.** 메서드 내부의 지역변수를 올바르게 선언하여 15를 출력하시오. (빈칸 1곳)

```java
class Calculator {
    public void calculate() {
        〔①〕

        total += 5;

        System.out.println(total);
    }
}

public class Main {
    public static void main(String[] args) {
        Calculator calculator =
                new Calculator();

        calculator.calculate();
    }
}
```
- ✅ **정답:** ① = `int total = 10;`
- 보기 토큰: `int total = 10;` / `private int total = 10;` / `public int total = 10;` / `protected int total = 10;` / `int total == 10;`
- 실행결과:
```
15
```

> 💡 **해설.** 메서드 내부에 선언하는 지역변수에는 public, protected, private 같은 접근 제어자를 사용할 수 없다. 접근 제어자는 클래스·필드·메서드·생성자 등에 사용한다. ==는 비교 연산자이므로 변수 초기화에는 대입 연산자 =를 사용해야 한다.

---

# Part 7. Java중급07 캡슐화·getter·setter

`DEV-JAVA-02-07` · 문제 12개 (코드 빈칸 9 · 객관식 1 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 필드를 외부에서 직접 변경하지 못하게 해야 하는 이유를 이해한다.
- private 필드와 public 메서드로 객체의 데이터를 보호한다.
- getter와 setter를 작성하고 사용한다.
- setter에서 잘못된 값이 저장되지 않도록 검사한다.
- 모든 필드에 getter와 setter를 만들 필요가 없다는 것을 이해한다.

## 수업 내용

### Part 1. 필드를 직접 공개하면 생기는 문제

다음 클래스는 잔액을 public 필드로 공개하고 있다.

```java
class BankAccount {
    public int balance;
}
```

외부에서 필드에 직접 접근할 수 있다.

```java
BankAccount account = new BankAccount();

account.balance = 10000;
account.balance = -50000;
```

잔액에 음수가 들어가면 안 되는 상황이어도 아무런 제한 없이 저장된다.

필드를 공개하면 객체가 지켜야 할 규칙을 외부 코드가 쉽게 깨뜨릴 수 있다.

### Part 2. 캡슐화가 필요한 이유

캡슐화는 객체의 데이터를 외부에서 직접 다루지 못하게 하고, 객체가 제공하는 메서드를 통해서만 사용하도록 만드는 것이다.

```java
class BankAccount {
    private int balance;
}
```

balance가 private이므로 다음 코드는 작성할 수 없다.

```java
BankAccount account = new BankAccount();
account.balance = -50000;   // 컴파일 오류
```

대신 객체가 잔액을 확인하거나 변경하는 메서드를 제공한다.

```java
class BankAccount {
    private int balance;

    public void deposit(int amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public int getBalance() {
        return balance;
    }
}
```

```java
BankAccount account = new BankAccount();

account.deposit(10000);
System.out.println(account.getBalance());
```

**실행 결과**

```text
10000
```

이제 잔액을 변경하는 규칙을 BankAccount가 직접 관리한다.

### Part 3. getter로 값 읽기

getter는 private 필드의 값을 외부에 반환하는 메서드다.

```java
class Student {
    private String name;

    public Student(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
```

```java
Student student = new Student("민수");

System.out.println(student.getName());
```

**실행 결과**

```text
민수
```

getter의 일반적인 이름은 get필드명이다.

```java
getName()
getAge()
getScore()
```

논리값을 반환하는 getter는 is로 시작하기도 한다.

```java
class Member {
    private boolean active;

    public boolean isActive() {
        return active;
    }
}
```

### Part 4. setter로 값 변경하기

setter는 외부에서 받은 값을 private 필드에 저장하는 메서드다.

```java
class Student {
    private int score;

    public void setScore(int score) {
        this.score = score;
    }

    public int getScore() {
        return score;
    }
}
```

```java
Student student = new Student();

student.setScore(85);
System.out.println(student.getScore());
```

**실행 결과**

```text
85
```

setter의 일반적인 이름은 set필드명이다.

```java
setName(...)
setAge(...)
setScore(...)
```

### Part 5. setter에서 값 검사하기

setter는 값을 저장하기 전에 올바른 값인지 검사할 수 있다.

```java
class Student {
    private int score;

    public void setScore(int score) {
        if (score >= 0 && score <= 100) {
            this.score = score;
        }
    }

    public int getScore() {
        return score;
    }
}
```

```java
Student student = new Student();

student.setScore(80);
student.setScore(150);

System.out.println(student.getScore());
```

**실행 결과**

```text
80
```

150은 허용 범위를 벗어나므로 저장되지 않는다.

필드를 직접 공개했다면 외부 코드마다 점수 범위를 검사해야 한다. setter에서 검사하면 점수 변경 규칙을 한곳에서 관리할 수 있다.

### Part 6. 모든 필드에 setter를 만들 필요는 없다

다음 상품 번호는 객체가 생성된 뒤 바뀌면 안 된다고 가정한다.

```java
class Product {
    private String productCode;
    private int price;

    public Product(String productCode, int price) {
        this.productCode = productCode;
        this.price = price;
    }

    public String getProductCode() {
        return productCode;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        if (price >= 0) {
            this.price = price;
        }
    }
}
```

productCode에는 getter만 있고 setter는 없다. 외부에서는 상품 번호를 확인할 수 있지만 변경할 수는 없다.

```java
Product product = new Product("P100", 3000);

System.out.println(product.getProductCode());
product.setPrice(3500);
System.out.println(product.getPrice());
```

**실행 결과**

```text
P100
3500
```

모든 필드에 getter와 setter를 자동으로 만드는 것은 올바른 캡슐화가 아니다. 외부에 읽기나 변경을 허용해야 하는 필드에만 필요한 메서드를 제공해야 한다.

### Part 7. 단순 setter보다 행동을 나타내는 메서드 사용하기

잔액을 변경하기 위해 다음과 같은 setter를 제공할 수 있다.

```java
public void setBalance(int balance) {
    this.balance = balance;
}
```

하지만 이 메서드는 잔액이 왜 변경되는지 나타내지 못한다.

```java
account.setBalance(50000);
```

입금인지, 출금인지, 잔액 수정인지 알기 어렵다.

객체가 실제로 수행하는 행동을 메서드 이름으로 표현하는 편이 좋다.

```java
class BankAccount {
    private int balance;

    public void deposit(int amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public boolean withdraw(int amount) {
        if (amount <= 0 || amount > balance) {
            return false;
        }

        balance -= amount;
        return true;
    }

    public int getBalance() {
        return balance;
    }
}
```

```java
BankAccount account = new BankAccount();

account.deposit(30000);
account.withdraw(12000);

System.out.println(account.getBalance());
```

**실행 결과**

```text
18000
```

deposit()과 withdraw()는 잔액 변경 이유를 분명하게 나타내며, 각각의 규칙도 객체 내부에서 검사한다.

### Part 8. 캡슐화는 단순히 필드를 숨기는 것이 아니다

다음 클래스는 필드를 private으로 선언했지만 아무 값이나 저장할 수 있는 setter를 제공한다.

```java
class Member {
    private int age;

    public void setAge(int age) {
        this.age = age;
    }
}
```

이 경우 다음과 같은 잘못된 값이 저장될 수 있다.

```java
member.setAge(-20);
```

필드를 private으로 선언하는 것만으로는 충분하지 않다. 객체가 지켜야 하는 규칙을 메서드 안에서 관리해야 한다.

```java
class Member {
    private int age;

    public void setAge(int age) {
        if (age >= 0) {
            this.age = age;
        }
    }

    public int getAge() {
        return age;
    }
}
```

캡슐화의 목적은 다음과 같다.

- 외부에서 필드를 직접 변경하지 못하게 한다.
- 잘못된 값이 저장되는 것을 막는다.
- 데이터 변경 규칙을 객체 내부에서 관리한다.
- 외부에는 필요한 기능만 공개한다.

### 종합 예제

```java
class BankAccount {
    private String owner;
    private int balance;

    public BankAccount(String owner, int balance) {
        this.owner = owner;

        if (balance >= 0) {
            this.balance = balance;
        }
    }

    public String getOwner() {
        return owner;
    }

    public int getBalance() {
        return balance;
    }

    public void deposit(int amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public boolean withdraw(int amount) {
        if (amount <= 0 || amount > balance) {
            return false;
        }

        balance -= amount;
        return true;
    }
}

public class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount("지수", 20000);

        account.deposit(10000);

        boolean success = account.withdraw(8000);

        System.out.println("예금주: " + account.getOwner());
        System.out.println("출금 성공: " + success);
        System.out.println("잔액: " + account.getBalance());
    }
}
```

**실행 결과**

```text
예금주: 지수
출금 성공: true
잔액: 22000
```

owner와 balance는 외부에서 직접 변경할 수 없다. 잔액은 deposit()과 withdraw()를 통해서만 변경되므로 계좌가 지켜야 할 규칙을 BankAccount 내부에서 관리할 수 있다.

## 다음으로

다음 학습 내용은 [Part 8「static·final·클래스 상수」](/dev/lessons/DEV-JAVA-02-08)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 7)

### 확인 1. 필드를 숨기고 값 읽기  `코드 빈칸`

**문제.** name을 외부에서 직접 변경하지 못하게 하고, getter로 읽을 수 있도록 완성하시오. (빈칸 3곳)

```java
class Member {
    〔①〕 String name;

    public Member(String name) {
        this.name = name;
    }

    〔②〕 String getName() {
        〔③〕 name;
    }
}
```
- ✅ **정답:** ① = `private` , ② = `public` , ③ = `return`
- 보기 토큰: `private` / `public` / `protected` / `void` / `return` / `print` / `this`
- 실행결과:
```

```

> 💡 **해설.** 필드는 private으로 보호하고, 외부에서 사용할 getter는 public으로 선언한다. getter는 return으로 필드 값을 돌려준다.

### 확인 2. getter 호출하기  `코드 빈칸`

**문제.** 직접 필드에 접근하지 않고 학생의 이름을 출력하도록 완성하시오. (빈칸 1곳)

```java
class Student {
    private String name;

    public Student(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

public class Main {
    public static void main(String[] args) {
        Student student = new Student("민수");

        System.out.println(student.〔①〕());
    }
}
```
- ✅ **정답:** ① = `getName`
- 보기 토큰: `getName` / `setName` / `name`
- 실행결과:
```
민수
```

> 💡 **해설.** name은 private이므로 student.name으로 접근하지 않고 getName()을 호출한다.

### 확인 3. boolean getter 완성하기  `코드 빈칸`

**문제.** 회원의 활성화 상태를 반환하도록 완성하시오. (빈칸 3곳)

```java
class Member {
    private boolean active;

    public Member(boolean active) {
        this.active = active;
    }

    public 〔①〕 〔②〕() {
        〔③〕 active;
    }
}
```
- ✅ **정답:** ① = `boolean` , ② = `isActive` , ③ = `return`
- 보기 토큰: `boolean` / `String` / `void` / `isActive` / `setActive` / `getName` / `return` / `print` / `this`
- 실행결과:
```

```

> 💡 **해설.** 논리값을 반환하는 getter는 일반적으로 isActive()처럼 is로 시작한다. 반환형은 boolean이고 return으로 값을 돌려준다.

### 확인 4. 기본 setter 작성하기  `순서 배열`

**문제.** score를 변경하는 setter를 완성하도록 카드를 위에서부터 순서대로 배열하시오.

- ✅ **정답 순서:**
```
    public void setScore(int score) {
        this.score = score;
    }
```

- ❌ **오답 카드(제외):**
```
        score = this.score;
    public int setScore(int score) {
        return score;
```

> 💡 **해설.** this.score는 필드이고 오른쪽의 score는 setter가 전달받은 매개변수다. 반환값이 없으므로 void로 선언한다.

### 확인 5. 점수 범위 검사하기  `코드 빈칸`

**문제.** 점수가 0 이상 100 이하일 때만 저장하도록 완성하시오. (빈칸 5곳)

```java
class Student {
    private int score;

    public void setScore(int score) {
        if (score 〔①〕 0 〔②〕 score 〔③〕 100) {
            〔④〕 = 〔⑤〕;
        }
    }

    public int getScore() {
        return score;
    }
}
```
- ✅ **정답:** ① = `>=` , ② = `&&` , ③ = `<=` , ④ = `this.score` , ⑤ = `score`
- 보기 토큰: `>=` / `>` / `&&` / `||` / `+` / `<=` / `<` / `!=` / `this.score` / `score` / `this` / `100`
- 실행결과:
```

```

> 💡 **해설.** 두 범위 조건을 모두 만족해야 하므로 &&를 사용한다. 0 이상은 >=, 100 이하는 <=로 표현하고, this.score에 매개변수 score를 저장한다.

### 확인 6. 잘못된 값 거부하기  `코드 빈칸`

**문제.** 음수 나이는 저장하지 않도록 완성하시오. (빈칸 3곳)

```java
class Person {
    private int age = 20;

    public void setAge(int age) {
        if (〔①〕) {
            〔②〕 = 〔③〕;
        }
    }

    public int getAge() {
        return age;
    }
}

public class Main {
    public static void main(String[] args) {
        Person person = new Person();

        person.setAge(-5);
        System.out.println(person.getAge());
    }
}
```
- ✅ **정답:** ① = `age >= 0` , ② = `this.age` , ③ = `age`
- 보기 토큰: `age >= 0` / `age < 0` / `age == 0` / `this.age` / `age` / `this` / `0`
- 실행결과:
```
20
```

> 💡 **해설.** -5는 조건을 만족하지 않으므로 기존 값 20이 유지된다. 나이는 0 이상만 허용하므로 age >= 0으로 검사하고, this.age에 매개변수 age를 저장한다.

### 확인 7. 읽기 전용 상품 번호  `코드 빈칸`

**문제.** 상품 번호는 확인할 수 있지만 생성 후에는 변경할 수 없도록 완성하시오. (빈칸 3곳)

```java
class Product {
    private String productCode;

    public Product(String productCode) {
        this.productCode = productCode;
    }

    public 〔①〕 〔②〕() {
        return 〔③〕;
    }
}
```
- ✅ **정답:** ① = `String` , ② = `getProductCode` , ③ = `productCode`
- 보기 토큰: `String` / `void` / `boolean` / `getProductCode` / `setProductCode` / `changeProductCode` / `productCode` / `"productCode"` / `this`
- 실행결과:
```

```

> 💡 **해설.** getter만 제공하고 setter를 제공하지 않으면 외부에서 상품 번호를 읽을 수만 있다. 반환형은 String이고 필드 productCode를 그대로 반환한다.

### 확인 8. 올바른 캡슐화 방법  `객관식`

**문제.** 은행 계좌의 잔액을 관리하는 방법으로 가장 알맞은 것을 고르시오.

- **A.** `public int balance;`로 필드를 직접 공개한다.
- **B.** `private int balance;`로 숨기고 값을 그대로 저장하는 `setBalance()`를 제공한다.
- **C.** `private int balance;`로 숨기고 검사 없이 `deposit()`·`withdraw()`를 제공한다.
- **D.** `private int balance;`로 숨기고 입금·출금 규칙을 검사하는 `deposit()`·`withdraw()`를 제공한다. ✅
- ✅ **정답:** D

> 💡 **해설.** 필드를 숨기는 것뿐 아니라 객체가 지켜야 하는 입금·출금 규칙도 메서드 안에서 검사해야 한다. deposit()은 양수만 받고, withdraw()는 잔액을 넘는 출금을 거부한다.

### 확인 9. 입금 메서드 완성하기  `코드 빈칸`

**문제.** 양수만 잔액에 입금할 수 있도록 완성하시오. (빈칸 4곳)

```java
class BankAccount {
    private int balance;

    public void deposit(int amount) {
        if (〔①〕) {
            〔②〕 〔③〕 〔④〕;
        }
    }

    public int getBalance() {
        return balance;
    }
}
```
- ✅ **정답:** ① = `amount > 0` , ② = `balance` , ③ = `+=` , ④ = `amount`
- 보기 토큰: `amount > 0` / `amount < 0` / `balance > 0` / `balance` / `amount` / `this` / `+=` / `-=` / `=` / `0`
- 실행결과:
```

```

> 💡 **해설.** setBalance()로 잔액을 임의 변경하지 않고 deposit()으로 입금 규칙을 관리한다. amount > 0일 때만 balance += amount로 더한다.

### 확인 10. 출금 성공 여부 반환하기  `코드 빈칸`

**문제.** 출금액이 올바르지 않거나 잔액보다 많으면 출금하지 않고 false를 반환하도록 완성하시오. (빈칸 6곳)

```java
class BankAccount {
    private int balance = 30000;

    public boolean withdraw(int amount) {
        if (amount 〔①〕 0 〔②〕 amount 〔③〕 balance) {
            return 〔④〕;
        }

        balance 〔⑤〕 amount;
        return 〔⑥〕;
    }

    public int getBalance() {
        return balance;
    }
}
```
- ✅ **정답:** ① = `<=` , ② = `||` , ③ = `>` , ④ = `false` , ⑤ = `-=` , ⑥ = `true`
- 보기 토큰: `<=` / `<` / `>=` / `||` / `&&` / `+` / `>` / `==` / `false` / `true` / `balance` / `-=` / `+=` / `=` / `amount`
- 실행결과:
```

```

> 💡 **해설.** 사용할 수 없는 출금액이면 잔액을 변경하기 전에 종료한다. amount <= 0이거나 amount > balance이면 false를 반환하고, 정상적인 경우에만 balance -= amount로 차감한 뒤 true를 반환한다.

### 확인 11. 캡슐화된 계좌 완성하기  `순서 배열`

**문제.** owner와 balance는 private으로 두고 balance의 setter는 만들지 않는다. deposit()으로 5000을 입금한 뒤 잔액 15000을 출력하도록 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
class BankAccount {
    private String owner;
    private int balance;
    public BankAccount(String owner, int balance) {
        this.owner = owner;
        this.balance = balance;
    }
    public int getBalance() {
        return balance;
    }
    public void deposit(int amount) {
        balance += amount;
    }
}
public class Main {
    public static void main(String[] args) {
        BankAccount account = new BankAccount("지수", 10000);
        account.deposit(5000);
        System.out.println(account.getBalance());
    }
}
```

- ❌ **오답 카드(제외):**
```
    public void setBalance(int balance) {
        balance = amount;
```

> 💡 **해설.** 잔액을 직접 바꾸는 setter 대신 입금 목적을 분명하게 나타내는 deposit()을 사용한다. deposit()은 balance += amount로 기존 잔액에 더한다.

### 확인 12. 빈 문자열을 거부하는 setter  `코드 빈칸`

**문제.** 빈 문자열은 닉네임으로 저장하지 않도록 완성하시오. (빈칸 3곳)

```java
class User {
    private String nickname = "손님";

    public void setNickname(String nickname) {
        if (〔①〕) {
            〔②〕 = 〔③〕;
        }
    }

    public String getNickname() {
        return nickname;
    }
}

public class Main {
    public static void main(String[] args) {
        User user = new User();

        user.setNickname("");
        user.setNickname("코딩왕");

        System.out.println(user.getNickname());
    }
}
```
- ✅ **정답:** ① = `!nickname.isEmpty()` , ② = `this.nickname` , ③ = `nickname`
- 보기 토큰: `!nickname.isEmpty()` / `nickname.isEmpty()` / `nickname.equals("")` / `this.nickname` / `nickname` / `this` / `"손님"`
- 실행결과:
```
코딩왕
```

> 💡 **해설.** setter는 전달받은 값을 그대로 저장하는 메서드가 아니라, 저장 가능한 값인지 검사하는 역할도 할 수 있다. 빈 문자열이 아닐 때만 this.nickname에 저장한다.

---

# Part 8. Java중급08 static·final·클래스 상수

`DEV-JAVA-02-08` · 문제 15개 (코드 빈칸 7 · 객관식 6 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 인스턴스 필드와 static 필드의 차이를 설명한다.
- static 필드와 메서드를 클래스 이름으로 사용한다.
- 여러 객체가 하나의 static 필드를 공유하는 과정을 설명한다.
- static 메서드에서 접근할 수 있는 멤버를 구분한다.
- final 필드를 선언하고 생성자에서 초기화한다.
- static final로 클래스 상수를 선언하고 사용한다.

## 수업 내용

### Part 1. 객체마다 필요한 값과 공유해야 하는 값

일반 필드는 객체마다 따로 만들어진다.

```java
class Student {
    private String name;
    private int score;

    public Student(String name, int score) {
        this.name = name;
        this.score = score;
    }

    public int getScore() {
        return score;
    }
}
```

```java
Student student1 = new Student("민수", 85);
Student student2 = new Student("지수", 92);

System.out.println(student1.getScore());
System.out.println(student2.getScore());
```

**실행 결과**

```text
85
92
```

student1과 student2는 서로 다른 score를 가진다. 이렇게 객체마다 따로 존재하는 필드를 인스턴스 필드라고 한다.

하지만 전체 학생 수처럼 모든 객체가 함께 사용해야 하는 값도 있다. 일반 필드로 학생 수를 선언하면 객체마다 별도의 값이 생기므로 전체 수를 한곳에서 관리할 수 없다.

### Part 2. static 필드

static 필드는 객체마다 만들어지지 않고 클래스에 하나만 존재한다.

```java
class Student {
    private String name;
    private static int count;
}
```

- name: 학생 객체마다 따로 존재
- count: Student 클래스에 하나만 존재

기본 형식은 다음과 같다.

```java
class 클래스명 {
    static 자료형 필드이름;
}
```

객체를 만들 때 전체 학생 수를 증가시키려면 생성자에서 count를 증가시킬 수 있다.

```java
class Student {
    private String name;
    private static int count;

    public Student(String name) {
        this.name = name;
        count++;
    }
}
```

```java
Student student1 = new Student("민수");
Student student2 = new Student("지수");
```

두 객체를 만들었지만 count는 객체마다 생기지 않는다. 두 생성자가 같은 count 하나를 차례대로 증가시킨다.

### Part 3. static 메서드

count는 private이므로 외부에서 직접 접근할 수 없다. 클래스 전체의 학생 수를 반환하는 static 메서드를 제공할 수 있다.

```java
class Student {
    private String name;
    private static int count;

    public Student(String name) {
        this.name = name;
        count++;
    }

    public static int getCount() {
        return count;
    }
}
```

static 메서드는 객체가 아니라 클래스 이름으로 호출한다.

```java
new Student("민수");
new Student("지수");

System.out.println(Student.getCount());
```

**실행 결과**

```text
2
```

기본 형식은 다음과 같다.

```java
class 클래스명 {
    public static 반환형 메서드명() {
        // 실행할 코드
    }
}
```

```java
클래스명.메서드명();
```

전체 학생 수는 특정 학생 한 명의 값이 아니므로 다음처럼 객체로 호출하지 않는다.

```java
Student student = new Student("민수");

student.getCount();  // 동작하지만 권장하지 않음
Student.getCount();  // 권장
```

### Part 4. static 메서드의 접근 범위

static 메서드는 객체 없이 호출할 수 있다. 따라서 특정 객체에 속한 인스턴스 필드를 직접 사용할 수 없다.

```java
class Student {
    private String name;
    private static int count;

    public static int getCount() {
        return count;
    }

    public static void printName() {
        System.out.println(name); // 컴파일 오류
    }
}
```

count는 클래스에 하나만 존재하므로 접근할 수 있다. 하지만 name은 학생 객체마다 다르기 때문에 어떤 학생의 이름인지 알 수 없다.

static 메서드에서 인스턴스 필드가 필요하면 객체를 전달받아 사용해야 한다.

```java
class Student {
    private String name;

    public Student(String name) {
        this.name = name;
    }

    public static void printName(Student student) {
        System.out.println(student.name);
    }
}
```

```java
Student student = new Student("민수");
Student.printName(student);
```

**실행 결과**

```text
민수
```

static 메서드에는 현재 객체가 없으므로 this도 사용할 수 없다.

```java
public static void show() {
    System.out.println(this.name); // 컴파일 오류
}
```

### Part 5. final 필드

final 필드는 값을 한 번만 정할 수 있다. 한 번 정한 뒤에는 다른 값을 다시 대입할 수 없다.

회원 번호처럼 객체마다 값은 다르지만, 객체 생성 후 바뀌면 안 되는 값에 사용할 수 있다.

```java
class Member {
    private final String memberId;

    public Member(String memberId) {
        this.memberId = memberId;
    }

    public String getMemberId() {
        return memberId;
    }
}
```

```java
Member member = new Member("M100");
System.out.println(member.getMemberId());
```

**실행 결과**

```text
M100
```

다음과 같이 값을 다시 대입할 수 없다.

```java
class Member {
    private final String memberId;

    public Member(String memberId) {
        this.memberId = memberId;
    }

    public void changeMemberId(String memberId) {
        this.memberId = memberId; // 컴파일 오류
    }
}
```

final 필드를 선언하면서 값을 넣지 않았다면 생성자에서 반드시 값을 정해야 한다.

```java
class Product {
    private final String productCode;

    public Product(String productCode) {
        this.productCode = productCode;
    }
}
```

final은 값을 바꾸지 못하게 할 뿐, 클래스에 하나만 존재하게 하지는 않는다. static이 없는 final 필드는 객체마다 따로 존재한다.

### Part 6. static final 클래스 상수

모든 객체가 함께 사용하면서 값도 바뀌면 안 되는 경우에는 static final을 사용한다.

```java
class Circle {
    public static final double PI = 3.14;
}
```

- static: 클래스에 하나만 존재
- final: 값을 다시 변경할 수 없음

클래스 상수는 클래스 이름으로 접근한다.

```java
double area = Circle.PI * 5 * 5;

System.out.println(Circle.PI);
System.out.println(area);
```

**실행 결과**

```text
3.14
78.5
```

다음과 같이 클래스 상수에 다른 값을 다시 대입할 수 없다.

```java
Circle.PI = 3.14159; // 컴파일 오류
```

### Part 7. 클래스 상수 이름 작성하기

클래스 상수는 모든 글자를 대문자로 작성하는 것이 관례다. 여러 단어로 이루어진 이름은 밑줄로 구분한다.

```java
class Config {
    public static final int MAX_USERS = 100;
    public static final String COUNTRY_CODE = "KR";
    public static final int DEFAULT_TIMEOUT = 30;
}
```

사용할 때는 숫자나 문자열을 코드에 반복해서 직접 작성하지 않고 상수 이름을 사용한다.

```java
if (userCount < Config.MAX_USERS) {
    System.out.println("가입 가능");
}
```

100이라는 숫자만 사용하면 그 숫자의 의미를 바로 알기 어렵다. MAX_USERS라는 이름을 사용하면 최대 사용자 수라는 의미가 분명해진다.

### Part 8. static, final, static final 구분하기

| 선언 | 존재하는 개수 | 변경 가능 여부 | 사용 예 |
|---|---|---|---|
| 인스턴스 필드 | 객체마다 하나 | 변경 가능 | 이름, 잔액, 점수 |
| static 필드 | 클래스에 하나 | 변경 가능 | 생성된 객체 수 |
| final 필드 | 객체마다 하나 | 변경 불가 | 회원 번호, 제품 번호 |
| static final 필드 | 클래스에 하나 | 변경 불가 | 최대 인원, 원주율 |

### Part 9. 언제 사용하는가

static 필드는 클래스 전체에서 하나의 값을 공유해야 할 때 사용한다.

```java
private static int totalAccounts;
```

final 필드는 객체마다 값은 다르지만 생성된 뒤에는 바뀌면 안 될 때 사용한다.

```java
private final String accountNumber;
```

static final은 모든 객체가 함께 사용하며 프로그램 실행 중 변경되면 안 되는 값에 사용한다.

```java
public static final String BANK_NAME = "한빛은행";
```

변경 가능한 static 필드는 프로그램의 여러 곳에서 함께 바뀌므로 관리하기 어려워질 수 있다. 필요한 경우 private으로 보호하고 static 메서드로 사용하도록 만든다.

### 종합 예제

```java
class Account {
    public static final String BANK_NAME = "한빛은행";

    private static int totalAccounts;

    private final String accountNumber;
    private String owner;
    private int balance;

    public Account(String accountNumber, String owner, int balance) {
        this.accountNumber = accountNumber;
        this.owner = owner;

        if (balance >= 0) {
            this.balance = balance;
        }

        totalAccounts++;
    }

    public static int getTotalAccounts() {
        return totalAccounts;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public String getOwner() {
        return owner;
    }

    public int getBalance() {
        return balance;
    }

    public void deposit(int amount) {
        if (amount > 0) {
            balance += amount;
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Account account1 =
                new Account("A100", "지민", 10000);

        Account account2 =
                new Account("A200", "서준", 20000);

        account1.deposit(5000);

        System.out.println(Account.BANK_NAME);
        System.out.println(
                account1.getAccountNumber() + " / "
                + account1.getOwner() + " / "
                + account1.getBalance()
        );
        System.out.println(
                account2.getAccountNumber() + " / "
                + account2.getOwner() + " / "
                + account2.getBalance()
        );
        System.out.println(
                "총 계좌 수: " + Account.getTotalAccounts()
        );
    }
}
```

**실행 결과**

```text
한빛은행
A100 / 지민 / 15000
A200 / 서준 / 20000
총 계좌 수: 2
```

- BANK_NAME은 클래스에 하나만 있고 변경할 수 없다.
- totalAccounts는 모든 계좌가 공유하며 계좌가 생성될 때 증가한다.
- accountNumber는 계좌마다 다르지만 생성 후 변경할 수 없다.
- owner와 balance는 각 계좌 객체가 따로 가진다.

## 다음으로

다음 학습 내용은 [Part 9「객체 참조·null·매개변수 전달」](/dev/lessons/DEV-JAVA-02-09)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 8)

### 확인 1. 공유 필드 선언하기  `코드 빈칸`

**문제.** 모든 Player 객체가 전체 플레이어 수 하나를 공유하도록 완성하시오. (빈칸 1곳)

```java
class Player {
    private String nickname;
    private 〔①〕 int totalPlayers;
}
```
- ✅ **정답:** ① = `static`
- 보기 토큰: `static` / `final` / `public`
- 실행결과:
```

```

> 💡 **해설.** static 필드는 객체마다 만들어지지 않고 클래스에 하나만 존재한다. final은 초기화가 필요하고 접근 제어자는 이미 private으로 지정되어 있다.

### 확인 2. 공유된 값 예측하기  `객관식`

**문제.** 세 개의 Member 객체를 만든 뒤 Member.getCount()의 실행 결과는? (count는 static)
```java
new Member();
new Member();
new Member();
System.out.println(Member.getCount());
```

- **A.** 0
- **B.** 1
- **C.** 3 ✅
- ✅ **정답:** C

> 💡 **해설.** 생성자가 세 번 실행되며 클래스가 공유하는 count 하나가 세 번 증가하여 3이 된다.

### 확인 3. static 메서드 완성하기  `코드 빈칸`

**문제.** 객체를 만들지 않고 전체 주문 수를 확인할 수 있도록 완성하시오. (빈칸 2곳)

```java
class Order {
    private static int count = 5;

    public 〔①〕 int getCount() {
        return count;
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println(〔②〕.getCount());
    }
}
```
- ✅ **정답:** ① = `static` , ② = `Order`
- 보기 토큰: `static` / `final` / `private` / `Order` / `order` / `Main`
- 실행결과:
```
5
```

> 💡 **해설.** static 메서드는 객체 변수가 아니라 클래스 이름 Order로 호출한다. getCount()가 static이어야 객체 없이 호출할 수 있다.

### 확인 4. static 메서드의 오류 수정  `객관식`

**문제.** showName()은 static 메서드라서 인스턴스 필드 name에 직접 접근할 수 없다. 오류가 발생한 줄 `System.out.println(name);`을 올바르게 고친 것은?

- **A.** `System.out.println(user.name);` ✅
- **B.** `System.out.println(this.name);`
- **C.** `System.out.println(User.name);`
- ✅ **정답:** A

> 💡 **해설.** static 메서드에는 현재 객체가 없으므로 전달받은 user 객체를 통해 인스턴스 필드에 접근해야 한다. this는 static 메서드에서 쓸 수 없고, User.name은 인스턴스 필드를 클래스 이름으로 접근하려 해 오류가 난다.

### 확인 5. static 메서드에서 this 제거하기  `코드 빈칸`

**문제.** 클래스 이름으로 count에 접근하도록 완성하시오. (빈칸 1곳)

```java
class Counter {
    private static int count = 10;

    public static int getCount() {
        return 〔①〕.count;
    }
}
```
- ✅ **정답:** ① = `Counter`
- 보기 토큰: `Counter` / `this` / `new Counter()`
- 실행결과:
```

```

> 💡 **해설.** static 메서드에서는 this를 사용할 수 없다. 클래스 이름 Counter로 static 필드 count에 접근한다.

### 확인 6. 생성된 객체 수 세기  `순서 배열`

**문제.** Ticket 객체를 두 개 생성하고 static count로 개수 2를 출력하도록 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
class Ticket {
    private static int count;
    public Ticket() {
        count++;
    }
    public static int getCount() {
        return count;
    }
}
public class Main {
    public static void main(String[] args) {
        new Ticket();
        new Ticket();
        System.out.println(Ticket.getCount());
    }
}
```

- ❌ **오답 카드(제외):**
```
    public int getCount() {
        count = 1;
```

> 💡 **해설.** 두 생성자가 같은 static count를 차례대로 증가시켜 2가 된다. getCount()는 static이어야 Ticket.getCount()로 호출할 수 있다.

### 확인 7. final 필드 초기화하기  `코드 빈칸`

**문제.** 기기마다 다른 일련번호를 가지며 생성 후에는 변경할 수 없도록 완성하시오. (빈칸 3곳)

```java
class Device {
    private 〔①〕 String serialNumber;

    public Device(String serialNumber) {
        〔②〕 = 〔③〕;
    }

    public String getSerialNumber() {
        return serialNumber;
    }
}
```
- ✅ **정답:** ① = `final` , ② = `this.serialNumber` , ③ = `serialNumber`
- 보기 토큰: `final` / `static` / `public` / `this.serialNumber` / `serialNumber` / `this` / `"serialNumber"`
- 실행결과:
```

```

> 💡 **해설.** 선언할 때 값을 넣지 않은 final 필드는 생성자에서 한 번 초기화할 수 있다. this.serialNumber에 매개변수 serialNumber를 대입한다. static이면 모든 기기가 값을 공유해 버린다.

### 확인 8. final 재대입 오류 찾기  `객관식`

**문제.** final 필드 productCode를 사용하는 다음 Product에서 컴파일 오류가 발생하는 한 줄은?

- **A.** `private final String productCode;`
- **B.** `this.productCode = productCode;` (생성자)
- **C.** `this.productCode = productCode;` (changeCode) ✅
- **D.** `return productCode;`
- ✅ **정답:** C

> 💡 **해설.** 생성자에서 이미 값이 정해진 final 필드에는 다른 값을 다시 대입할 수 없다. 생성자의 첫 대입은 정상이지만 changeCode()의 재대입에서 컴파일 오류가 난다.

### 확인 9. 클래스 상수 선언하기  `코드 빈칸`

**문제.** 최대 사용자 수를 클래스 상수로 선언하시오. (빈칸 2곳)

```java
class Config {
    public 〔①〕 〔②〕 int MAX_USERS = 100;
}
```
- ✅ **정답:** ① = `static` , ② = `final`
- 보기 토큰: `static` / `final` / `private` / `int`
- 실행결과:
```

```

> 💡 **해설.** 클래스에 하나만 존재하면서 변경할 수 없는 값은 static final로 선언한다. private이면 외부에서 사용할 수 없고, int를 한 번 더 쓰면 중복 선언이 된다.

### 확인 10. 클래스 상수 사용하기  `순서 배열`

**문제.** BASIC_FEE를 클래스 상수로 선언하고 클래스 이름으로 사용해 기본요금에 추가요금 2000을 더한 5000을 출력하도록 배열하시오.

- ✅ **정답 순서:**
```
class Delivery {
    public static final int BASIC_FEE = 3000;
}
public class Main {
    public static void main(String[] args) {
        int total = Delivery.BASIC_FEE + 2000;
        System.out.println(total);
    }
}
```

- ❌ **오답 카드(제외):**
```
    public static int BASIC_FEE = 3000;
        int total = BASIC_FEE - 2000;
```

> 💡 **해설.** 클래스 상수는 클래스명.상수명 형태로 사용한다. Delivery.BASIC_FEE(3000)에 2000을 더해 5000이 된다. 클래스 이름 없이 BASIC_FEE만 쓰면 Main에서 찾을 수 없다.

### 확인 11. 인스턴스 값과 공유값 예측하기  `객관식`

**문제.** personal은 인스턴스 필드, total은 static이다. score1.add(10)·score2.add(20) 후 personal1·personal2·total 순서로 출력하면?

- **A.** 10 / 20 / 30 ✅
- **B.** 30 / 30 / 30
- **C.** 10 / 20 / 20
- ✅ **정답:** A

> 💡 **해설.** personal은 객체마다 따로 존재해 각각 10, 20이고, total은 두 객체가 공유하여 10+20=30이 된다.

### 확인 12. 알맞은 클래스 상수 선택하기  `객관식`

**문제.** 세율 0.1을 모든 객체가 함께 사용하고 실행 중에는 변경하지 못하게 하려고 한다. 가장 알맞은 선언은?

- **A.** `public double taxRate = 0.1;`
- **B.** `public static double taxRate = 0.1;`
- **C.** `public final double TAX_RATE = 0.1;`
- **D.** `public static final double TAX_RATE = 0.1;` ✅
- ✅ **정답:** D

> 💡 **해설.** 하나만 존재해야 하므로 static, 변경할 수 없어야 하므로 final을 함께 사용한다. static이 없으면 객체마다 생기고, final이 없으면 값을 바꿀 수 있다.

### 확인 13. static과 final 구분하기  `객관식`

**문제.** COMPANY는 static final, employeeId는 final 필드다. Employee.COMPANY·employee1·employee2의 id 순서로 출력하면?

- **A.** 코드회사 / E100 / E200 ✅
- **B.** 코드회사 / E100 / E100
- **C.** E100 / E200 / 코드회사
- ✅ **정답:** A

> 💡 **해설.** COMPANY는 클래스가 공유하는 상수이고 employeeId는 객체마다 다른 final 필드다. 따라서 회사명과 각 사원의 서로 다른 사번이 출력된다.

### 확인 14. static 메서드의 직접 접근 구분하기  `코드 빈칸`

**문제.** getUserCount()가 컴파일되도록 완성하시오. (빈칸 1곳)

```java
class GameUser {
    private String nickname;
    private static int userCount;

    public GameUser(String nickname) {
        this.nickname = nickname;
        userCount++;
    }

    public static int getUserCount() {
        return 〔①〕;
    }
}
```
- ✅ **정답:** ① = `userCount`
- 보기 토큰: `userCount` / `nickname` / `this.userCount`
- 실행결과:
```

```

> 💡 **해설.** userCount는 static 필드이므로 static 메서드에서 직접 사용할 수 있다. nickname은 인스턴스 필드이고 this는 static 메서드에서 사용할 수 없다.

### 확인 15. 계좌 클래스 완성하기  `코드 빈칸`

**문제.** 은행 이름은 클래스 상수, 전체 계좌 수는 클래스가 하나만 관리, 계좌 번호는 계좌마다 다르며 변경 불가, 계좌 생성 시 전체 수 증가하도록 완성하시오. (빈칸 6곳)

```java
class Account {
    public 〔①〕 〔②〕 String BANK_NAME = "한빛은행";

    private 〔③〕 int totalAccounts;
    private 〔④〕 String accountNumber;

    public Account(String accountNumber) {
        this.accountNumber = accountNumber;
        〔⑤〕++;
    }

    public static int getTotalAccounts() {
        return 〔⑥〕;
    }

    public String getAccountNumber() {
        return accountNumber;
    }
}
```
- ✅ **정답:** ① = `static` , ② = `final` , ③ = `static` , ④ = `final` , ⑤ = `totalAccounts` , ⑥ = `totalAccounts`
- 보기 토큰: `static` / `final` / `private` / `public` / `totalAccounts` / `accountNumber` / `BANK_NAME` / `String` / `int`
- 실행결과:
```

```

> 💡 **해설.** BANK_NAME은 static final 클래스 상수, totalAccounts는 변경 가능한 static 공유값, accountNumber는 객체마다 다른 final 고정값이다. 생성자에서 totalAccounts를 증가시키고 static 메서드로 반환한다.

---

# Part 9. Java중급09 객체 참조·null·매개변수 전달

`DEV-JAVA-02-09` · 문제 10개 (코드 빈칸 3 · 객관식 6 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 객체 변수에 객체 자체가 아니라 참조값이 저장된다는 것을 이해한다.
- 두 변수가 같은 객체를 참조하는 상황을 설명한다.
- null을 검사하여 NullPointerException을 방지한다.
- 객체를 매개변수로 전달하고 객체의 상태를 변경한다.
- 매개변수에 새 객체를 대입해도 호출한 변수는 바뀌지 않는 이유를 설명한다.

## 수업 내용

### Part 1. 객체 변수에는 참조값이 저장된다

```java
Member member = new Member("민수");
```

new Member("민수")는 객체를 생성하고, member에는 그 객체를 찾아갈 수 있는 참조값이 저장된다.

```java
class Member {
    private String name;

    public Member(String name) {
        this.name = name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
```

```java
Member member = new Member("민수");
System.out.println(member.getName());
```

**실행 결과**

```text
민수
```

### Part 2. 참조값을 복사하면 같은 객체를 가리킨다

```java
Member member1 = new Member("민수");
Member member2 = member1;
```

새로운 객체를 만든 것이 아니라 member1의 참조값을 member2에 복사한 것이다.

```java
member2.setName("지수");

System.out.println(member1.getName());
System.out.println(member2.getName());
```

**실행 결과**

```text
지수
지수
```

두 변수가 같은 객체를 가리키므로 어느 변수를 통해 변경해도 같은 객체가 변경된다.

### Part 3. 참조형 변수의 == 비교

객체 변수에 ==를 사용하면 두 변수가 같은 객체를 가리키는지 검사한다.

```java
Member member1 = new Member("민수");
Member member2 = member1;
Member member3 = new Member("민수");

System.out.println(member1 == member2);
System.out.println(member1 == member3);
```

**실행 결과**

```text
true
false
```

member1과 member3의 이름은 같지만 서로 다른 객체다.

### Part 4. null

null은 참조형 변수가 현재 아무 객체도 가리키지 않는다는 뜻이다.

```java
Member member = null;
```

null인 변수로 필드나 메서드에 접근하면 NullPointerException이 발생한다.

```java
Member member = null;
System.out.println(member.getName()); // 실행 중 오류
```

사용하기 전에 검사할 수 있다.

```java
if (member != null) {
    System.out.println(member.getName());
}
```

지역 변수는 값을 직접 넣기 전까지 사용할 수 없으므로 필요하면 null로 초기화한다.

### Part 5. 참조 변수에 다른 객체 대입하기

```java
Member member1 = new Member("민수");
Member member2 = member1;

member2 = new Member("지수");
```

member2가 새로운 객체를 가리키도록 변경되었지만 member1은 기존 객체를 계속 가리킨다.

```java
System.out.println(member1.getName());
System.out.println(member2.getName());
```

**실행 결과**

```text
민수
지수
```

참조 변수를 바꾸는 것과 객체 내부의 값을 바꾸는 것은 서로 다르다.

### Part 6. 객체를 매개변수로 전달하기

Java는 메서드를 호출할 때 변수의 값을 복사하여 전달한다. 객체 변수에는 참조값이 들어 있으므로 참조값이 복사된다.

```java
class Counter {
    private int value;

    public void increase() {
        value++;
    }

    public int getValue() {
        return value;
    }
}
```

```java
public static void increaseCounter(Counter counter) {
    counter.increase();
}
```

```java
Counter counter = new Counter();

increaseCounter(counter);

System.out.println(counter.getValue());
```

**실행 결과**

```text
1
```

호출한 쪽과 매개변수가 같은 객체를 가리키므로 객체 내부의 값이 변경된다.

### Part 7. 매개변수에 새 객체를 대입하는 경우

```java
public static void replace(Member member) {
    member = new Member("교체된 회원");
}
```

```java
Member member = new Member("기존 회원");

replace(member);

System.out.println(member.getName());
```

**실행 결과**

```text
기존 회원
```

메서드에는 참조값의 복사본이 전달된다. 매개변수 member에 새 객체를 대입해도 호출한 쪽의 member는 바뀌지 않는다.

### 종합 예제

```java
class Profile {
    private String nickname;

    public Profile(String nickname) {
        this.nickname = nickname;
    }

    public void setNickname(String nickname) {
        if (!nickname.isEmpty()) {
            this.nickname = nickname;
        }
    }

    public String getNickname() {
        return nickname;
    }
}

public class Main {
    public static void rename(Profile profile) {
        profile.setNickname("코딩왕");
    }

    public static void replace(Profile profile) {
        profile = new Profile("새 프로필");
    }

    public static void main(String[] args) {
        Profile profile = new Profile("손님");

        rename(profile);
        System.out.println(profile.getNickname());

        replace(profile);
        System.out.println(profile.getNickname());
    }
}
```

**실행 결과**

```text
코딩왕
코딩왕
```

rename()은 같은 객체의 내부 값을 변경한다. replace()는 복사된 참조값만 변경하므로 호출한 쪽의 변수에는 영향을 주지 않는다.

## 다음으로

다음 학습 내용은 [Part 10「객체 배열·객체 간 협력」](/dev/lessons/DEV-JAVA-02-10)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 9)

### 확인 1. 객체 생성과 참조 저장  `코드 빈칸`

**문제.** 객체를 생성하여 member에 참조값을 저장하도록 완성하시오. (빈칸 1곳)

```java
class Member {
    private String name;

    public Member(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

public class Main {
    public static void main(String[] args) {
        Member member = 〔①〕 Member("유나");
        System.out.println(member.getName());
    }
}
```
- ✅ **정답:** ① = `new`
- 보기 토큰: `new` / `this` / `static`
- 실행결과:
```
유나
```

> 💡 **해설.** new는 객체를 생성하고 그 참조값을 반환한다. member에는 생성된 객체를 가리키는 참조값이 저장된다.

### 확인 2. 같은 객체를 참조하는 변수  `객관식`

**문제.** score2 = score1 후 score2.setValue(90)을 하면 score1.getValue()의 결과는?
```java
Score score2 = score1;
score2.setValue(90);
System.out.println(score1.getValue());
```

- **A.** 0
- **B.** 컴파일 오류
- **C.** 90 ✅
- ✅ **정답:** C

> 💡 **해설.** score2 = score1은 참조값을 복사하므로 두 변수가 같은 Score 객체를 가리킨다. score2로 변경한 값이 score1에도 반영되어 90이 출력된다.

### 확인 3. 객체 참조 비교  `객관식`

**문제.** book2 = book1, book3 = new Book()일 때 다음 두 줄의 출력은?
```java
System.out.println(book1 == book2);
System.out.println(book1 == book3);
```

- **A.** true / false ✅
- **B.** true / true
- **C.** false / false
- ✅ **정답:** A

> 💡 **해설.** book2는 book1의 참조값을 복사해 같은 객체를 가리키므로 true, book3은 new로 만든 다른 객체이므로 false다. ==는 같은 객체인지 비교한다.

### 확인 4. null 안전 검사  `코드 빈칸`

**문제.** member가 객체를 가리킬 때만 이름을 출력하도록 빈칸을 채우시오. (빈칸 1곳)

```java
class Member {
    private String name;

    public Member(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

public class Main {
    public static void main(String[] args) {
        Member member = null;

        if (〔①〕) {
            System.out.println(member.getName());
        }
    }
}
```
- ✅ **정답:** ① = `member != null`
- 보기 토큰: `member != null` / `member == null` / `member.getName()`
- 실행결과:
```

```

> 💡 **해설.** member != null이면 member가 객체를 가리킬 때만 안으로 들어간다. 지금은 null이므로 아무것도 출력되지 않는다. member == null이나 member.getName()을 넣으면 null 상태에서 메서드를 호출해 NullPointerException(실행 중 오류)이 발생한다.

### 확인 5. NullPointerException 방지  `객관식`

**문제.** book이 null일 수 있다. `System.out.println(book.getTitle());`이 안전하게 실행되도록 감쌀 조건으로 알맞은 것은?

- **A.** `if (book != null)` ✅
- **B.** `if (book == null)`
- **C.** `if (book.getTitle() != null)`
- ✅ **정답:** A

> 💡 **해설.** book이 객체를 가리킬 때(book != null)만 메서드를 호출해야 안전하다. book == null이면 null일 때 접근하게 되고, book.getTitle() != null은 조건을 검사하는 동안 이미 null 객체의 메서드를 호출해 오류가 난다.

### 확인 6. 참조 변수 다시 대입하기  `객관식`

**문제.** member2 = member1 후 member2 = new Member("지수")를 하면 member1·member2의 이름은?
```java
Member member2 = member1;
member2 = new Member("지수");
```

- **A.** 민수 / 지수 ✅
- **B.** 지수 / 지수
- **C.** 민수 / 민수
- ✅ **정답:** A

> 💡 **해설.** member2에 new로 만든 새 객체를 대입하면 member2만 새 객체를 가리키고 member1은 기존 객체를 계속 가리킨다. 참조 변수를 바꾸는 것은 객체 내부 값을 바꾸는 것과 다르다.

### 확인 7. 객체 상태 변경하기  `코드 빈칸`

**문제.** 전달된 Product 객체의 가격을 1000 낮추도록 빈칸을 채우시오. (빈칸 1곳)

```java
class Product {
    private int price;

    public Product(int price) {
        this.price = price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }
}

public class Main {
    public static void discount(Product product) {
        product.〔①〕(product.getPrice() - 1000);
    }

    public static void main(String[] args) {
        Product product = new Product(5000);
        discount(product);
        System.out.println(product.getPrice());
    }
}
```
- ✅ **정답:** ① = `setPrice`
- 보기 토큰: `setPrice` / `getPrice` / `new`
- 실행결과:
```
4000
```

> 💡 **해설.** 전달된 참조값을 통해 원래 Product 객체의 가격을 변경하려면 setPrice()를 호출한다. getPrice는 값을 읽을 뿐 변경하지 못하고 인수를 받지 않아 오류가 난다.

### 확인 8. 매개변수 재대입 결과  `객관식`

**문제.** replace()가 매개변수에 새 Box(100)을 대입한 뒤 box.getValue()의 결과는?
```java
public static void replace(Box box) {
    box = new Box(100);
}
```

- **A.** 10 ✅
- **B.** 100
- **C.** null
- ✅ **정답:** A

> 💡 **해설.** 메서드에는 참조값의 복사본이 전달된다. 매개변수 box에 새 객체를 대입해도 호출한 쪽의 box는 기존 객체를 계속 가리키므로 10이 출력된다.

### 확인 9. 객체 매개변수 전달 방식  `객관식`

**문제.** 객체를 매개변수로 전달하는 방식에 대한 설명 중 맞는 것은?

- **A.** 객체 전체가 메서드로 복사된다.
- **B.** 호출한 객체 변수가 매개변수로 이동한다.
- **C.** 객체를 가리키는 참조값이 복사되어 전달된다. ✅
- **D.** 매개변수에 새 객체를 넣으면 호출한 변수도 바뀐다.
- ✅ **정답:** C

> 💡 **해설.** Java는 참조값의 복사본을 전달한다. 따라서 같은 객체를 가리켜 내부 값은 바꿀 수 있지만, 매개변수에 새 객체를 대입해도 호출한 쪽 변수는 바뀌지 않는다.

### 확인 10. 객체 변경 과정 완성하기  `순서 배열`

**문제.** change()를 정의하고 main()에서 호출하여 20을 출력하도록 한 줄씩 배열하시오. (Box 클래스는 이미 있다)

- ✅ **정답 순서:**
```
public class Main {
    public static void change(Box box) {
        box.setValue(20);
    }
    public static void main(String[] args) {
        Box box = new Box(10);
        change(box);
        System.out.println(box.getValue());
    }
}
```

- ❌ **오답 카드(제외):**
```
        box = new Box(20);
```

> 💡 **해설.** change()는 전달받은 참조값으로 같은 Box 객체의 값을 setValue(20)로 변경한다. box = new Box(20)은 매개변수만 새 객체로 바꾸므로 호출한 쪽에는 영향을 주지 않는다.

---

# Part 10. Java중급10 객체 배열·객체 간 협력

`DEV-JAVA-02-10` · 문제 11개 (코드 빈칸 8 · 객관식 2 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 객체를 저장하는 배열을 선언하고 생성한다.
- 객체 배열의 각 요소가 참조값을 저장한다는 것을 이해한다.
- 반복문으로 객체 배열을 순회한다.
- 객체 배열에서 합계와 검색을 수행한다.
- 한 객체가 다른 객체를 사용하여 작업하는 협력 관계를 구현한다.

## 수업 내용

### Part 1. 객체 배열이 필요한 이유

학생 여러 명을 각각의 변수에 저장하면 관리하기 어렵다.

```java
Student student1 = new Student("민수", 80);
Student student2 = new Student("지수", 90);
Student student3 = new Student("서준", 70);
```

객체 배열을 사용하면 같은 종류의 객체를 하나의 배열로 관리할 수 있다.

```java
Student[] students = new Student[3];
```

이 코드는 Student 객체 세 개를 만든 것이 아니다. Student 객체의 참조값을 저장할 공간 세 개를 만든다.

처음에는 모든 요소가 null이다.

### Part 2. 객체 배열에 객체 저장하기

```java
students[0] = new Student("민수", 80);
students[1] = new Student("지수", 90);
students[2] = new Student("서준", 70);
```

각 요소를 통해 객체의 메서드를 호출할 수 있다.

```java
System.out.println(students[1].getName());
```

**실행 결과**

```text
지수
```

### Part 3. 선언과 동시에 객체 저장하기

```java
Student[] students = {
    new Student("민수", 80),
    new Student("지수", 90),
    new Student("서준", 70)
};
```

배열에는 객체 자체가 아니라 각 객체를 가리키는 참조값이 저장된다.

### Part 4. 객체 배열 순회하기

```java
for (int i = 0; i < students.length; i++) {
    System.out.println(students[i].getName());
}
```

향상된 for문을 사용해도 된다.

```java
for (Student student : students) {
    System.out.println(student.getName());
}
```

요소가 null일 가능성이 있다면 먼저 검사한다.

```java
for (Student student : students) {
    if (student != null) {
        System.out.println(student.getName());
    }
}
```

### Part 5. 객체 배열의 합계 구하기

```java
int total = 0;

for (Student student : students) {
    total += student.getScore();
}

System.out.println(total);
```

**실행 결과**

```text
240
```

객체 배열에서도 일반 배열처럼 합계, 평균, 최댓값, 검색 작업을 수행할 수 있다. 차이점은 요소의 메서드를 통해 값을 사용한다는 것이다.

### Part 6. 객체 간 협력이 필요한 이유

주문 금액을 계산하려면 주문 객체가 상품의 가격을 알아야 한다.

```java
class Product {
    private String name;
    private int price;

    public Product(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public int getPrice() {
        return price;
    }
}
```

Order 객체가 Product 객체를 필드로 가질 수 있다.

```java
class Order {
    private Product product;
    private int quantity;

    public Order(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return product.getPrice() * quantity;
    }
}
```

```java
Product product = new Product("키보드", 30000);
Order order = new Order(product, 2);

System.out.println(order.getTotalPrice());
```

**실행 결과**

```text
60000
```

Order가 모든 상품 정보를 직접 복사하지 않고 Product 객체에 가격을 요청한다. 이렇게 객체가 다른 객체의 기능을 사용하여 작업하는 것을 객체 간 협력이라고 한다.

### 종합 예제

```java
class Student {
    private String name;
    private int score;

    public Student(String name, int score) {
        this.name = name;
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public int getScore() {
        return score;
    }
}

class Classroom {
    private Student[] students;

    public Classroom(Student[] students) {
        this.students = students;
    }

    public int getTotalScore() {
        int total = 0;

        for (Student student : students) {
            if (student != null) {
                total += student.getScore();
            }
        }

        return total;
    }
}

public class Main {
    public static void main(String[] args) {
        Student[] students = {
            new Student("민수", 80),
            new Student("지수", 90),
            new Student("서준", 70)
        };

        Classroom classroom = new Classroom(students);

        System.out.println(classroom.getTotalScore());
    }
}
```

**실행 결과**

```text
240
```

## 다음으로

다음 학습 내용은 [Part 11「상속 기본」](/dev/lessons/DEV-JAVA-02-11)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 10)

### 확인 1. 객체 배열 선언하기  `코드 빈칸`

**문제.** Product 객체 3개를 저장할 배열을 선언하고 생성하시오. (빈칸 2곳)

```java
class Product {
}

public class Main {
    public static void main(String[] args) {
        〔①〕[] products = new 〔②〕[3];
    }
}
```
- ✅ **정답:** ① = `Product` , ② = `Product`
- 보기 토큰: `Product` / `Product` / `products` / `String` / `new`
- 실행결과:
```

```

> 💡 **해설.** Product[]는 Product 객체의 참조값을 저장하는 배열 타입이고, new Product[3]은 참조값을 담을 공간 3개를 만든다. 아직 객체는 생성되지 않아 모두 null이다.

### 확인 2. 객체 배열의 초기값  `객관식`

**문제.** `Book[] books = new Book[2];` 직후 두 요소를 출력하면?
```java
System.out.println(books[0]);
System.out.println(books[1]);
```

- **A.** null / null ✅
- **B.** 0 / 0
- **C.** 컴파일 오류
- ✅ **정답:** A

> 💡 **해설.** 배열만 생성했으므로 아직 Book 객체는 저장되지 않았다. 참조형 배열의 초기값은 null이다.

### 확인 3. 객체 저장하고 사용하기  `코드 빈칸`

**문제.** 배열에 Book 객체를 저장하고 제목을 출력하시오. (빈칸 2곳)

```java
class Book {
    private String title;
    public Book(String title) { this.title = title; }
    public String getTitle() { return title; }
}

public class Main {
    public static void main(String[] args) {
        Book[] books = new Book[2];
        books[0] = 〔①〕 Book("자바 기초");
        System.out.println(books[0].〔②〕());
    }
}
```
- ✅ **정답:** ① = `new` , ② = `getTitle`
- 보기 토큰: `new` / `this` / `static` / `getTitle` / `setTitle` / `title`
- 실행결과:
```
자바 기초
```

> 💡 **해설.** new로 Book 객체를 만들어 배열 요소에 저장하고, getTitle()로 제목을 읽는다. title은 필드 이름이라 메서드처럼 호출할 수 없다.

### 확인 4. 객체 배열 순회하기  `코드 빈칸`

**문제.** 인덱스 for문으로 모든 학생의 이름을 출력하시오. (빈칸 2곳)

```java
class Student {
    private String name;
    public Student(String name) { this.name = name; }
    public String getName() { return name; }
}

public class Main {
    public static void main(String[] args) {
        Student[] students = { new Student("민수"), new Student("지수") };
        for (int i = 0; i < students.〔①〕; i++) {
            System.out.println(students[i].〔②〕());
        }
    }
}
```
- ✅ **정답:** ① = `length` , ② = `getName`
- 보기 토큰: `length` / `size` / `count` / `getName` / `setName` / `name`
- 실행결과:
```
민수
지수
```

> 💡 **해설.** 배열의 요소 개수는 length 필드로 얻는다. 각 요소의 이름은 getName()으로 읽는다. size()나 count는 배열에 없다.

### 확인 5. null 요소 건너뛰기  `코드 빈칸`

**문제.** 배열에 null이 섞여 있을 때 null이 아닌 상품 이름만 출력하시오. (빈칸 1곳)

```java
class Product {
    private String name;
    public Product(String name) { this.name = name; }
    public String getName() { return name; }
}

public class Main {
    public static void main(String[] args) {
        Product[] products = { new Product("사과"), null, new Product("바나나") };
        for (Product product : products) {
            if (〔①〕) {
                System.out.println(product.getName());
            }
        }
    }
}
```
- ✅ **정답:** ① = `product != null`
- 보기 토큰: `product != null` / `product == null` / `products != null`
- 실행결과:
```
사과
바나나
```

> 💡 **해설.** product != null인 요소만 메서드를 호출해야 안전하다. product == null이면 null 요소에서 getName()을 호출해 실행 중 오류(NullPointerException)가 난다. products != null은 배열 자체만 검사한다.

### 확인 6. 점수 합계 계산하기  `코드 빈칸`

**문제.** 학생 배열의 점수 합계를 구하도록 완성하시오. (빈칸 2곳)

```java
class Student {
    private int score;
    public Student(int score) { this.score = score; }
    public int getScore() { return score; }
}

public class Main {
    public static int sum(Student[] students) {
        int total = 0;
        for (Student student : students) {
            total 〔①〕 student.〔②〕();
        }
        return total;
    }

    public static void main(String[] args) {
        Student[] students = { new Student(80), new Student(90), new Student(70) };
        System.out.println(sum(students));
    }
}
```
- ✅ **정답:** ① = `+=` , ② = `getScore`
- 보기 토큰: `+=` / `-=` / `=` / `getScore` / `setScore` / `getName`
- 실행결과:
```
240
```

> 💡 **해설.** total += student.getScore()로 각 학생의 점수를 누적한다. -=나 =를 쓰면 합계가 되지 않고, getName은 점수가 아니라 이름을 반환한다.

### 확인 7. 이름으로 객체 검색하기  `코드 빈칸`

**문제.** 이름이 정확히 일치하는 학생을 찾아 반환하도록 완성하시오. (빈칸 2곳)

```java
class Student {
    private String name;
    public Student(String name) { this.name = name; }
    public String getName() { return name; }
}

public class Main {
    public static Student find(Student[] students, String name) {
        for (Student student : students) {
            if (student != null && student.getName().〔①〕(name)) {
                return 〔②〕;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Student[] students = { new Student("이지수"), new Student("지수") };
        System.out.println(find(students, "지수").getName());
    }
}
```
- ✅ **정답:** ① = `equals` , ② = `student`
- 보기 토큰: `equals` / `contains` / `isEmpty` / `student` / `students` / `name`
- 실행결과:
```
지수
```

> 💡 **해설.** 이름 비교는 equals로 정확히 같은지 확인한다. contains는 부분 포함이라 "이지수"도 "지수"를 포함해 먼저 걸리므로 원하는 결과가 아니다. 찾으면 그 student 객체를 반환한다.

### 확인 8. 상품과 주문의 협력  `코드 빈칸`

**문제.** 주문 금액이 상품 가격 × 수량이 되도록 완성하시오. (빈칸 3곳)

```java
class Product {
    private int price;
    public Product(int price) { this.price = price; }
    public int getPrice() { return price; }
}

class Order {
    private Product product;
    private int quantity;
    public Order(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }
    public int getTotalPrice() {
        return 〔①〕.〔②〕() * 〔③〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Product product = new Product(30000);
        Order order = new Order(product, 2);
        System.out.println(order.getTotalPrice());
    }
}
```
- ✅ **정답:** ① = `product` , ② = `getPrice` , ③ = `quantity`
- 보기 토큰: `product` / `quantity` / `Order` / `getPrice` / `setPrice` / `getName` / `quantity` / `price`
- 실행결과:
```
60000
```

> 💡 **해설.** Order가 product 객체에 getPrice()로 가격을 요청하고 quantity를 곱해 금액을 계산한다. 이렇게 다른 객체의 기능을 사용하는 것이 객체 간 협력이다.

### 확인 9. 객체 간 협력 결과  `객관식`

**문제.** 가격 15000인 product로 order1(수량 2), order2(수량 3)을 만들면 각 총액은?
```java
Product product = new Product("마우스", 15000);
Order order1 = new Order(product, 2);
Order order2 = new Order(product, 3);
```

- **A.** 30000 / 45000 ✅
- **B.** 30000 / 30000
- **C.** 45000 / 45000
- ✅ **정답:** A

> 💡 **해설.** 두 주문 모두 같은 product의 가격 15000을 사용한다. order1은 ×2로 30000, order2는 ×3으로 45000이다.

### 확인 10. 객체 배열 완성하기  `순서 배열`

**문제.** 학생 두 명을 배열에 저장하고 이름을 차례대로 출력하도록 배열하시오. (Student 클래스는 이미 있다)

- ✅ **정답 순서:**
```
public class Main {
    public static void main(String[] args) {
        Student[] students = {
            new Student("민수"),
            new Student("지수")
        };
        for (Student student : students) {
            System.out.println(student.getName());
        }
    }
}
```

- ❌ **오답 카드(제외):**
```
        Student student = new Student("민수");
```

> 💡 **해설.** 중괄호 초기화로 학생 두 명을 배열에 저장하고, 향상된 for문으로 각 학생의 이름을 출력한다. 단일 변수 선언은 배열이 아니므로 순회할 수 없다.

### 확인 11. 학급 평균 구하기  `코드 빈칸`

**문제.** 학생 점수의 평균을 실수로 구하도록 완성하시오. (빈칸 2곳)

```java
class Student {
    private int score;
    public Student(int score) { this.score = score; }
    public int getScore() { return score; }
}

class Classroom {
    private Student[] students;
    public Classroom(Student[] students) { this.students = students; }
    public double getAverage() {
        int total = 0;
        for (Student student : students) {
            total += student.getScore();
        }
        return 〔①〕 / students.〔②〕;
    }
}

public class Main {
    public static void main(String[] args) {
        Student[] students = { new Student(85), new Student(90) };
        Classroom classroom = new Classroom(students);
        System.out.println(classroom.getAverage());
    }
}
```
- ✅ **정답:** ① = `(double) total` , ② = `length`
- 보기 토큰: `(double) total` / `total` / `students` / `length` / `size` / `count`
- 실행결과:
```
87.5
```

> 💡 **해설.** double 평균을 구하려면 정수 나눗셈이 되지 않도록 (double) total로 형변환한다. total만 쓰면 정수 나눗셈이 되어 소수점이 사라진다. 요소 개수는 length로 얻는다.

---

# Part 11. Java중급11 상속 기본

`DEV-JAVA-02-11` · 문제 10개 (코드 빈칸 4 · 객관식 5 · 순서 1)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 여러 클래스의 공통 필드와 메서드를 부모 클래스로 분리한다.
- extends로 부모 클래스를 상속한다.
- 자식 객체에서 상속받은 메서드를 사용한다.
- private과 protected 멤버의 상속 접근 차이를 구분한다.
- 상속이 적합한 is-a 관계와 객체 협력이 적합한 has-a 관계를 구분한다.

## 수업 내용

### Part 1. 상속이 필요한 이유

여러 클래스에 같은 코드가 반복될 수 있다.

```java
class Developer {
    private String name;

    public void introduce() {
        System.out.println("이름: " + name);
    }
}

class Designer {
    private String name;

    public void introduce() {
        System.out.println("이름: " + name);
    }
}
```

공통 내용을 부모 클래스로 옮기면 중복을 줄일 수 있다.

### Part 2. extends로 상속하기

```java
class Employee {
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void introduce() {
        System.out.println("이름: " + name);
    }
}
```

```java
class Developer extends Employee {
    public void code() {
        System.out.println("코드를 작성합니다.");
    }
}
```

Developer는 Employee의 접근 가능한 필드와 메서드를 물려받는다.

```java
Developer developer = new Developer();

developer.setName("민수");
developer.introduce();
developer.code();
```

**실행 결과**

```text
이름: 민수
코드를 작성합니다.
```

### Part 3. 부모와 자식 관계

Developer extends Employee는 "개발자는 직원이다"라는 관계를 나타낸다.

```text
Developer is an Employee
```

이처럼 자식이 부모의 한 종류라고 말할 수 있는 관계를 is-a 관계라고 한다.

상속은 단순히 코드를 복사하기 위한 기능이 아니다. 실제로 부모와 자식의 종류 관계가 성립할 때 사용해야 한다.

### Part 4. private 멤버 접근

부모의 private 필드는 자식 클래스에서 직접 접근할 수 없다.

```java
class Employee {
    private String name;
}

class Developer extends Employee {
    public void printName() {
        System.out.println(name); // 컴파일 오류
    }
}
```

부모가 제공하는 getter나 메서드를 사용한다.

```java
class Developer extends Employee {
    public void printName() {
        System.out.println(getName());
    }
}
```

### Part 5. protected 멤버

protected 멤버는 자식 클래스에서 접근할 수 있다.

```java
class Employee {
    protected String department;
}

class Developer extends Employee {
    public void setDepartment(String department) {
        this.department = department;
    }
}
```

하지만 필드를 보호하려면 가능한 경우 private 필드와 메서드를 사용하는 편이 좋다.

### Part 6. 자식 클래스의 멤버 추가

자식 클래스는 부모에게서 받은 기능과 자기 기능을 함께 가진다.

```java
class Animal {
    public void eat() {
        System.out.println("먹습니다.");
    }
}

class Dog extends Animal {
    public void bark() {
        System.out.println("짖습니다.");
    }
}
```

```java
Dog dog = new Dog();

dog.eat();
dog.bark();
```

**실행 결과**

```text
먹습니다.
짖습니다.
```

### Part 7. 상속과 객체 협력 구분하기

자동차와 탈것은 종류 관계이므로 상속을 고려할 수 있다.

```text
Car is a Vehicle
```

자동차와 엔진은 자동차가 엔진을 사용하는 관계다.

```text
Car has an Engine
```

이 경우에는 상속하지 않고 필드로 객체를 가진다.

```java
class Car {
    private Engine engine;
}
```

### Part 8. 생성자는 상속되지 않는다

부모의 필드와 메서드는 상속될 수 있지만 생성자는 상속되지 않는다.

```java
class Parent {
    public Parent() {
        System.out.println("부모 생성");
    }
}

class Child extends Parent {
}
```

Child 객체를 만들면 부모 부분도 필요하므로 부모 생성자가 먼저 실행된다. 자식 생성자에서 부모 생성자를 직접 선택하는 방법은 다음 파트의 super()에서 사용한다.

### 종합 예제

```java
class Employee {
    private String name;

    public void setName(String name) {
        if (!name.isEmpty()) {
            this.name = name;
        }
    }

    public String getName() {
        return name;
    }

    public void work() {
        System.out.println(name + "이(가) 근무합니다.");
    }
}

class Developer extends Employee {
    public void develop() {
        System.out.println(getName() + "이(가) 개발합니다.");
    }
}

public class Main {
    public static void main(String[] args) {
        Developer developer = new Developer();

        developer.setName("민수");
        developer.work();
        developer.develop();
    }
}
```

**실행 결과**

```text
민수이(가) 근무합니다.
민수이(가) 개발합니다.
```

## 다음으로

다음 학습 내용은 [Part 12「오버라이딩·super」](/dev/lessons/DEV-JAVA-02-12)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 11)

### 확인 1. 클래스 상속하기  `코드 빈칸`

**문제.** Dog가 Animal을 상속하도록 완성하시오. (빈칸 1곳)

```java
class Animal {
}

class Dog 〔①〕 Animal {
}
```
- ✅ **정답:** ① = `extends`
- 보기 토큰: `extends` / `implements` / `super`
- 실행결과:
```

```

> 💡 **해설.** 클래스 상속은 extends를 사용한다. implements는 인터페이스를 구현할 때 쓰고, super는 부모 멤버를 호출할 때 쓴다.

### 확인 2. 상속받은 메서드 사용  `객관식`

**문제.** Cat은 Animal을 상속한다. cat.eat()과 cat.meow()의 출력은?
```java
Cat cat = new Cat();
cat.eat();
cat.meow();
```

- **A.** 먹습니다. / 야옹 ✅
- **B.** 야옹 / 먹습니다.
- **C.** 컴파일 오류
- ✅ **정답:** A

> 💡 **해설.** Cat은 Animal의 eat()을 상속받아 사용할 수 있고, 자신이 정의한 meow()도 가진다. 호출 순서대로 먹습니다., 야옹이 출력된다.

### 확인 3. private 필드 접근 오류 수정  `객관식`

**문제.** Developer는 Employee를 상속하지만 부모의 private name에 직접 접근할 수 없다. printName()의 출력문을 올바르게 고친 것은?

- **A.** `System.out.println(getName());` ✅
- **B.** `System.out.println(this.name);`
- **C.** `System.out.println(Employee.name);`
- ✅ **정답:** A

> 💡 **해설.** 부모의 private 필드는 자식에서 직접 쓸 수 없으므로 부모가 제공하는 getName()을 호출한다. this.name도 private이라 접근할 수 없고, Employee.name은 인스턴스 필드를 클래스 이름으로 접근하려 해 오류가 난다.

### 확인 4. protected 필드 사용  `코드 빈칸`

**문제.** 자식 Car에서 부모의 speed를 사용할 수 있도록 완성하시오. (빈칸 2곳)

```java
class Vehicle {
    〔①〕 int speed;
}

class Car extends Vehicle {
    public void accelerate() {
        〔②〕++;
    }
}
```
- ✅ **정답:** ① = `protected` , ② = `speed`
- 보기 토큰: `protected` / `private` / `static` / `speed` / `Vehicle` / `Car`
- 실행결과:
```

```

> 💡 **해설.** protected 멤버는 자식 클래스에서 접근할 수 있다. private이면 자식에서 speed에 접근할 수 없어 오류가 난다. accelerate()는 상속받은 speed 필드를 증가시킨다.

### 확인 5. 부모와 자식의 필드 상태  `객관식`

**문제.** Developer는 Employee를 상속한다. developer1·developer2에 각각 이름을 설정하면 출력은?
```java
developer1.setName("민수");
developer2.setName("지수");
System.out.println(developer1.getName());
System.out.println(developer2.getName());
```

- **A.** 민수 / 지수 ✅
- **B.** 지수 / 지수
- **C.** 민수 / 민수
- ✅ **정답:** A

> 💡 **해설.** 상속받은 인스턴스 필드도 자식 객체마다 따로 존재한다. developer1과 developer2는 각자의 name을 가지므로 민수, 지수가 그대로 출력된다.

### 확인 6. 상속이 적합한 관계  `객관식`

**문제.** 상속(is-a)이 가장 적합한 관계를 고르시오.

- **A.** 자동차는 엔진이다.
- **B.** 주문은 상품이다.
- **C.** 개발자는 직원이다. ✅
- **D.** 교실은 학생이다.
- ✅ **정답:** C

> 💡 **해설.** 상속은 자식이 부모의 한 종류인 is-a 관계일 때 적합하다. 개발자는 직원의 한 종류이므로 상속이 알맞다. 나머지는 가지거나 사용하는 has-a 관계다.

### 확인 7. 중복 메서드 상속하기  `코드 빈칸`

**문제.** Student가 Person을 상속하도록 완성하시오. (빈칸 1곳)

```java
class Person {
    public void introduce() {
        System.out.println("자기소개");
    }
}

class Student 〔①〕 Person {
    public void study() {
        System.out.println("공부");
    }
}
```
- ✅ **정답:** ① = `extends`
- 보기 토큰: `extends` / `implements` / `super`
- 실행결과:
```

```

> 💡 **해설.** 클래스를 상속할 때는 extends를 사용한다. Student는 Person의 introduce()를 물려받고 자신의 study()를 추가로 가진다.

### 확인 8. 자식 클래스 완성하기  `순서 배열`

**문제.** Bicycle이 Vehicle을 상속하고, move()와 ringBell()을 차례로 실행하도록 배열하시오. (Vehicle의 move()는 "이동합니다."를 출력한다)

- ✅ **정답 순서:**
```
class Bicycle extends Vehicle {
    public void ringBell() {
        System.out.println("벨을 울립니다.");
    }
}
public class Main {
    public static void main(String[] args) {
        Bicycle bicycle = new Bicycle();
        bicycle.move();
        bicycle.ringBell();
    }
}
```

- ❌ **오답 카드(제외):**
```
class Bicycle implements Vehicle {
```

> 💡 **해설.** Bicycle은 extends로 Vehicle을 상속받아 move()를 물려받고, 자신의 ringBell()을 추가한다. Vehicle은 클래스이므로 implements로는 상속할 수 없다.

### 확인 9. 상속과 객체 협력 구분  `객관식`

**문제.** Car가 Engine을 사용하는 관계를 올바르게 작성한 코드는?

- **A.** `class Car extends Engine {}`
- **B.** `class Car { private Engine engine; }` ✅
- **C.** `class Engine extends Car {}`
- ✅ **정답:** B

> 💡 **해설.** 자동차는 엔진의 한 종류가 아니라 엔진을 가지고 사용하는 객체다. 따라서 상속(extends)이 아니라 필드로 Engine 객체를 가지는 has-a 관계로 작성한다.

### 확인 10. 상속 종합 완성  `코드 빈칸`

**문제.** Designer가 Employee를 상속하고 부모의 이름을 사용하도록 완성하시오. (빈칸 2곳)

```java
class Employee {
    private String name;
    public void setName(String name) { this.name = name; }
    public String getName() { return name; }
    public void work() { System.out.println(getName() + " 근무"); }
}

class Designer 〔①〕 Employee {
    public void design() {
        System.out.println(〔②〕() + " 디자인");
    }
}

public class Main {
    public static void main(String[] args) {
        Designer designer = new Designer();
        designer.setName("민수");
        designer.design();
    }
}
```
- ✅ **정답:** ① = `extends` , ② = `getName`
- 보기 토큰: `extends` / `super` / `static` / `getName` / `setName` / `name`
- 실행결과:
```
민수 디자인
```

> 💡 **해설.** Designer는 extends로 Employee를 상속받아 setName()과 getName()을 물려받는다. design()에서 부모의 getName()으로 이름을 얻어 출력한다.

---

# Part 12. Java중급12 오버라이딩·super

`DEV-JAVA-02-12` · 문제 12개 (코드 빈칸 5 · 객관식 5 · 순서 2)

<details><summary>📘 <b>참고노트</b> (펼치기)</summary>

## 학습 목표

이 파트를 학습한 후 다음 작업을 할 수 있어야 합니다.

- 부모에게서 상속받은 메서드를 자식에게 맞게 재정의한다.
- @Override로 오버라이딩 여부를 검사한다.
- 오버라이딩과 메서드 오버로딩을 구분한다.
- super로 부모 메서드를 호출한다.
- super()로 부모 생성자를 호출한다.
- 부모 생성자와 자식 생성자의 실행 순서를 설명한다.

## 수업 내용

### Part 1. 오버라이딩이 필요한 이유

자식 클래스는 부모 메서드를 그대로 사용할 수 있다. 하지만 같은 행동이라도 자식마다 실행 내용이 달라야 할 수 있다.

```java
class Animal {
    public void sound() {
        System.out.println("동물이 소리를 냅니다.");
    }
}

class Dog extends Animal {
}
```

Dog에 맞는 소리를 출력하려면 부모의 sound()를 다시 정의한다.

```java
class Dog extends Animal {
    @Override
    public void sound() {
        System.out.println("멍멍");
    }
}
```

```java
Dog dog = new Dog();
dog.sound();
```

**실행 결과**

```text
멍멍
```

### Part 2. 오버라이딩 작성 조건

오버라이딩하려면 부모 메서드와 다음 내용이 일치해야 한다.

- 메서드 이름
- 매개변수의 개수
- 매개변수의 타입
- 매개변수의 순서
- 호환되는 반환형

```java
class Parent {
    public void print(int value) {
        System.out.println(value);
    }
}

class Child extends Parent {
    @Override
    public void print(int value) {
        System.out.println("자식: " + value);
    }
}
```

매개변수가 달라지면 오버라이딩이 아니라 오버로딩이 된다.

```java
public void print(String value) {
}
```

### Part 3. @Override

@Override는 아래 메서드가 부모 메서드를 재정의한다는 것을 컴파일러에 알린다.

```java
@Override
public void sound() {
    System.out.println("멍멍");
}
```

메서드 이름을 잘못 작성하면 컴파일러가 오류를 알려준다.

```java
@Override
public void sounds() { // 컴파일 오류
    System.out.println("멍멍");
}
```

오버라이딩할 때는 @Override를 작성하는 것이 안전하다.

### Part 4. 접근 범위 규칙

자식의 오버라이딩 메서드는 부모 메서드보다 접근 범위를 좁힐 수 없다.

```java
class Parent {
    public void run() {
    }
}

class Child extends Parent {
    @Override
    private void run() { // 컴파일 오류
    }
}
```

부모가 public이면 자식도 public으로 작성해야 한다.

또한 final 메서드는 자식에서 오버라이딩할 수 없다.

```java
class Parent {
    public final void stop() {
    }
}
```

### Part 5. super로 부모 메서드 호출하기

자식이 메서드를 완전히 교체하지 않고 부모 기능에 내용을 추가하고 싶을 수 있다.

```java
class Employee {
    public void work() {
        System.out.println("업무를 시작합니다.");
    }
}

class Developer extends Employee {
    @Override
    public void work() {
        super.work();
        System.out.println("코드를 작성합니다.");
    }
}
```

```java
Developer developer = new Developer();
developer.work();
```

**실행 결과**

```text
업무를 시작합니다.
코드를 작성합니다.
```

super.work()는 현재 객체의 부모 클래스에 정의된 work()를 호출한다.

### Part 6. super()로 부모 생성자 호출하기

부모 클래스에 매개변수가 있는 생성자만 있다면 자식 생성자에서 super(...)로 부모 생성자를 호출해야 한다.

```java
class Employee {
    private String name;

    public Employee(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
```

```java
class Developer extends Employee {
    private String language;

    public Developer(String name, String language) {
        super(name);
        this.language = language;
    }
}
```

super(name)은 부모 클래스의 Employee(String name) 생성자를 호출한다.

### Part 7. super()는 첫 번째 실행문이어야 한다

```java
public Developer(String name, String language) {
    super(name);
    this.language = language;
}
```

다음 코드는 컴파일되지 않는다.

```java
public Developer(String name, String language) {
    this.language = language;
    super(name); // 컴파일 오류
}
```

부모 부분을 먼저 초기화한 뒤 자식 부분을 초기화해야 하므로 super()는 생성자의 첫 번째 실행문이어야 한다.

this()와 super()는 모두 첫 번째 실행문이어야 하므로 같은 생성자에서 둘을 함께 직접 호출할 수 없다.

### Part 8. 부모 생성자와 자식 생성자의 실행 순서

```java
class Parent {
    public Parent() {
        System.out.println("부모 생성자");
    }
}

class Child extends Parent {
    public Child() {
        System.out.println("자식 생성자");
    }
}
```

```java
new Child();
```

**실행 결과**

```text
부모 생성자
자식 생성자
```

자식 객체를 만들 때 부모 부분이 먼저 초기화되고 자식 부분이 나중에 초기화된다.

### 종합 예제

```java
class Employee {
    private String name;

    public Employee(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void work() {
        System.out.println(name + "이(가) 업무를 시작합니다.");
    }
}

class Developer extends Employee {
    private String language;

    public Developer(String name, String language) {
        super(name);
        this.language = language;
    }

    @Override
    public void work() {
        super.work();
        System.out.println(language + "로 개발합니다.");
    }
}

public class Main {
    public static void main(String[] args) {
        Developer developer =
                new Developer("민수", "Java");

        developer.work();
    }
}
```

**실행 결과**

```text
민수이(가) 업무를 시작합니다.
Java로 개발합니다.
```

## 다음으로

다음 학습 내용은 [Part 13「다형성」](/dev/lessons/DEV-JAVA-02-13)이다.

</details>

## ✍ 확인 문제 · 해답 (Part 12)

### 확인 1. 메서드 오버라이딩  `코드 빈칸`

**문제.** Cat이 부모 Animal의 sound()를 재정의함을 표시하시오. (빈칸 1곳)

```java
class Animal {
    public void sound() {
        System.out.println("동물 소리");
    }
}

class Cat extends Animal {
    〔①〕
    public void sound() {
        System.out.println("야옹");
    }
}
```
- ✅ **정답:** ① = `@Override`
- 보기 토큰: `@Override` / `@Overload` / `@Super`
- 실행결과:
```

```

> 💡 **해설.** @Override는 부모 메서드를 재정의한다는 것을 컴파일러에 알린다. @Overload와 @Super는 존재하지 않는 애너테이션이라 컴파일 오류가 난다.

### 확인 2. 재정의된 메서드 결과  `객관식`

**문제.** Bird가 sound()를 오버라이딩했다. bird.sound()의 출력은?
```java
Bird bird = new Bird();
bird.sound();
```

- **A.** 짹짹 ✅
- **B.** 동물 소리
- **C.** 컴파일 오류
- ✅ **정답:** A

> 💡 **해설.** Bird가 부모의 sound()를 오버라이딩했으므로 자식 객체로 호출하면 재정의한 짹짹이 출력된다.

### 확인 3. 잘못된 메서드 이름 수정  `코드 빈칸`

**문제.** 부모 Animal의 sound()를 오버라이딩하도록 메서드 이름을 채우시오. (빈칸 1곳)

```java
class Animal {
    public void sound() {
        System.out.println("동물 소리");
    }
}

class Dog extends Animal {
    @Override
    public void 〔①〕() {
        System.out.println("멍멍");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.sound();
    }
}
```
- ✅ **정답:** ① = `sound`
- 보기 토큰: `sound` / `sounds` / `Sound`
- 실행결과:
```
멍멍
```

> 💡 **해설.** 오버라이딩은 부모와 메서드 이름이 정확히 같아야 한다. sounds나 Sound는 부모에 없는 이름이라 @Override에서 컴파일 오류가 난다. 이름이 sound여야 dog.sound()가 재정의된 멍멍을 출력한다.

### 확인 4. 접근 범위 오류 수정  `객관식`

**문제.** 부모의 public run()을 올바르게 오버라이딩하려면 [빈칸]에 들어갈 접근 제어자는?
```java
@Override
[빈칸] void run() { ... }
```

- **A.** public ✅
- **B.** private
- **C.** 생략(아무것도 쓰지 않음)
- ✅ **정답:** A

> 💡 **해설.** 오버라이딩 메서드는 부모보다 접근 범위를 좁힐 수 없다. 부모가 public이므로 자식도 public이어야 한다. private이나 생략(package-private)은 범위를 좁혀 컴파일 오류가 난다.

### 확인 5. final 메서드 오류 찾기  `객관식`

**문제.** final 메서드 stop()을 자식 Robot이 오버라이딩할 때 컴파일 오류가 나는 이유는?

- **A.** Machine을 상속할 수 없어서
- **B.** stop()의 반환형이 없어서
- **C.** final 메서드를 오버라이딩해서 ✅
- **D.** @Override를 사용할 수 없어서
- ✅ **정답:** C

> 💡 **해설.** final 메서드는 자식에서 오버라이딩할 수 없다. Machine은 상속 가능하고, stop()은 void 반환형이 있으며, @Override도 정상 사용할 수 있으므로 오류 원인은 final 오버라이딩이다.

### 확인 6. 부모 메서드에 기능 추가  `코드 빈칸`

**문제.** 부모의 work()를 먼저 실행한 뒤 자식 기능을 추가하도록 완성하시오. (빈칸 1곳)

```java
class Employee {
    public void work() {
        System.out.println("업무를 시작합니다.");
    }
}

class Developer extends Employee {
    @Override
    public void work() {
        〔①〕.work();
        System.out.println("코드를 작성합니다.");
    }
}

public class Main {
    public static void main(String[] args) {
        Developer developer = new Developer();
        developer.work();
    }
}
```
- ✅ **정답:** ① = `super`
- 보기 토큰: `super` / `this` / `Employee`
- 실행결과:
```
업무를 시작합니다.
코드를 작성합니다.
```

> 💡 **해설.** super.work()는 부모 클래스의 work()를 호출한다. this.work()는 자기 자신을 다시 호출해 무한 재귀(실행 중 오류)가 되고, Employee.work()는 인스턴스 메서드를 클래스 이름으로 호출해 컴파일 오류가 난다.

### 확인 7. 부모 생성자 호출하기  `코드 빈칸`

**문제.** 자식 Student 생성자에서 부모 Person의 생성자에 이름을 전달하시오. (빈칸 2곳)

```java
class Person {
    private String name;
    public Person(String name) { this.name = name; }
    public String getName() { return name; }
}

class Student extends Person {
    private int grade;
    public Student(String name, int grade) {
        〔①〕(〔②〕);
        this.grade = grade;
    }
}

public class Main {
    public static void main(String[] args) {
        Student student = new Student("민수", 1);
        System.out.println(student.getName());
    }
}
```
- ✅ **정답:** ① = `super` , ② = `name`
- 보기 토큰: `super` / `this` / `new` / `name` / `grade` / `this.name`
- 실행결과:
```
민수
```

> 💡 **해설.** super(name)은 부모 Person(String name) 생성자를 호출한다. this(...)는 같은 클래스의 다른 생성자를 호출하려 하지만 없어서 오류가 나고, grade를 넘기면 이름이 아니라 정수를 전달하게 된다.

### 확인 8. 생성자 실행 순서  `객관식`

**문제.** new Child()를 실행하면 출력 순서는? (Parent 생성자는 "부모", Child 생성자는 "자식"을 출력)

- **A.** 부모 / 자식 ✅
- **B.** 자식 / 부모
- **C.** 자식만
- ✅ **정답:** A

> 💡 **해설.** 자식 객체를 만들면 부모 부분이 먼저 초기화되므로 부모 생성자가 먼저 실행되고 자식 생성자가 나중에 실행된다.

### 확인 9. super() 위치 수정  `순서 배열`

**문제.** super()가 첫 번째 실행문이 되도록 생성자를 한 줄씩 배열하시오.

- ✅ **정답 순서:**
```
    public Developer(String name, String language) {
        super(name);
        this.language = language;
    }
```

> 💡 **해설.** super()는 생성자의 첫 번째 실행문이어야 한다. 부모 부분을 먼저 초기화한 뒤 자식 필드를 초기화하므로 super(name)이 this.language 대입보다 앞에 와야 컴파일된다.

### 확인 10. 오버라이딩과 오버로딩 구분  `객관식`

**문제.** 부모 메서드 `public void print(int value)`를 오버라이딩한 코드는?

- **A.** `public void print(String value) {}`
- **B.** `public void print(int value) { System.out.println(value); }` ✅
- **C.** `public int print(int value) { return value; }`
- ✅ **정답:** B

> 💡 **해설.** 오버라이딩은 메서드 이름과 매개변수 구성이 부모와 같아야 한다. A는 매개변수 타입이 달라 오버로딩이고, C는 반환형이 호환되지 않아 오버라이딩이 아니다.

### 확인 11. 부모 기능을 포함한 오버라이딩  `순서 배열`

**문제.** Developer가 Employee의 work()를 오버라이딩하면서 부모의 work()를 먼저 실행하도록 배열하시오. (Employee.work()는 "업무를 시작합니다." 출력)

- ✅ **정답 순서:**
```
class Developer extends Employee {
    @Override
    public void work() {
        super.work();
        System.out.println("Java 개발");
    }
}
```

- ❌ **오답 카드(제외):**
```
        this.work();
class Developer implements Employee {
    public void work(String language) {
```

> 💡 **해설.** @Override로 work()를 재정의하고 super.work()로 부모 기능을 먼저 실행한 뒤 자식 출력을 더한다. this.work()는 무한 재귀가 되고, implements는 클래스 상속에 쓸 수 없으며, 매개변수를 바꾸면 오버라이딩이 아니라 오버로딩이 된다.

### 확인 12. 생성자와 오버라이딩 종합  `코드 빈칸`

**문제.** Manager가 부모 생성자를 호출하고 work()를 오버라이딩하도록 완성하시오. (빈칸 3곳)

```java
class Employee {
    private String name;
    public Employee(String name) { this.name = name; }
    public void work() {
        System.out.println("기본 업무");
    }
}

class Manager extends Employee {
    private String department;
    public Manager(String name, String department) {
        〔①〕(name);
        this.department = department;
    }

    〔②〕
    public void work() {
        〔③〕.work();
        System.out.println(department + " 관리");
    }
}

public class Main {
    public static void main(String[] args) {
        Manager manager = new Manager("민수", "개발팀");
        manager.work();
    }
}
```
- ✅ **정답:** ① = `super` , ② = `@Override` , ③ = `super`
- 보기 토큰: `super` / `this` / `new Employee` / `@Override` / `@Overload` / `static` / `super` / `this` / `Employee`
- 실행결과:
```
기본 업무
개발팀 관리
```

> 💡 **해설.** super(name)으로 부모 생성자를 호출하고, @Override로 work() 재정의를 표시하며, super.work()로 부모의 기본 업무를 먼저 실행한다. 이후 department와 함께 관리 내용을 출력한다.

---
