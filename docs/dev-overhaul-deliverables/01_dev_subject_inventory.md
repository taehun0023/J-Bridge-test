# Dev Subject Inventory

## 전체 Subject 목록

| # | Subject | URL | quiz_type | question_category | pool quiz ID | courseId |
|---|---------|-----|-----------|-------------------|-------------|---------|
| 1 | Common Workplace Fundamentals | `/dev/cwf` | core_programming | cwf | e0000001-...-0007 | dev-common-workplace-fundamentals |
| 2 | Java | `/dev/java` | core_programming | java | e0000001-...-0001 | dev-java |
| 3 | JavaScript | `/dev/javascript` | core_programming | javascript | e0000001-...-0004 | dev-javascript |
| 4 | Python | `/dev/python` | core_programming | python | e0000001-...-0008 | dev-python |
| 5 | SQL | `/dev/sql` | core_programming | sql | e0000001-...-0003 | dev-sql |
| 6 | Spring Boot | `/dev/spring-boot` | core_programming | spring_boot | e0000001-...-0002 | dev-spring-boot |
| 7 | React | `/dev/react` | framework | react | e0000001-...-0005 | dev-react |
| 8 | Next.js | `/dev/nextjs` | framework | nextjs | e0000001-...-0009 | dev-nextjs |

## Subject → 종합시험 매핑

종합시험은 유저의 `target_coding_area` 선택에 따라 track이 결정됨.

| Track | 출제 Subject | 각 20문제 |
|-------|-------------|-----------|
| Java Track | java + spring_boot + sql | 60문제 |
| JS Track | javascript + react + sql | 60문제 |

## 종합시험 미포함 Subject

| Subject | 사유 |
|---------|------|
| CWF | 이해도테스트 전용, 종합시험 미포함 |
| Python | 이해도테스트 전용, 종합시험 미포함 |
| Next.js | 이해도테스트 전용, 종합시험 미포함 |

## Subject 연결 방식

- title parsing: **미사용** (CS와 달리 hardcoded UUID 매핑)
- 연결 정의: `src/lib/dev-quiz.ts` → `DEV_QUIZ_SET_DEFINITIONS`
- CTA 링크: subject 상세 페이지 → `/dev/quiz?category={category}`
- 모든 subject에 CTA 연결 정상 확인됨
