# 문제 미작성 원인 구분표

## 구분 기준

| 원인 | 설명 |
|------|------|
| 데이터 부재 | DB에 문제 레코드 자체가 없음 |
| 연결 부재 | 문제는 있지만 quiz IA가 연결되지 않음 |
| 품질 부재 | 문제는 있지만 분류/난이도/subtype 미설정 |

## 정비 전 상태 (Before)

| Subject | pool quiz 문제 | assessment 문제 | 원인 |
|---------|---------------|----------------|------|
| Java | 0 | concept 18 + code_reading 30 = 48 | **연결 부재** — assessment에는 있지만 pool quiz가 source에 포함하지 않음 |
| Spring Boot | 0 | concept 18 + code_reading 0 = 18 | **연결 부재** + **데이터 부재** (code_reading 미작성) |
| SQL | 0 | concept 18 + code_reading 0 = 18 | **연결 부재** + **데이터 부재** (code_reading 미작성) |
| JavaScript | 0 | concept 18 + code_reading 30 = 48 | **연결 부재** — assessment에는 있지만 pool quiz가 source에 포함하지 않음 |
| React | 0 | concept 18 + code_reading 0 = 18 | **연결 부재** + **데이터 부재** (code_reading 미작성) |
| CWF | 0 | 0 | **데이터 부재** (종합시험 범위 외) |
| Python | 0 | 0 | **데이터 부재** (종합시험 범위 외) |
| Next.js | 0 | 0 | **데이터 부재** (종합시험 범위 외) |

## 정비 후 상태 (After)

| Subject | pool quiz 문제 | assessment 문제 | 원인 | 해결 방법 |
|---------|---------------|----------------|------|----------|
| Java | 0 (shared) | concept 30 + code_reading 30 = 60 | **해결됨** | pool quiz → assessment source 포함 + concept 12문제 추가 |
| Spring Boot | 0 (shared) | concept 30 + code_reading 30 = 60 | **해결됨** | pool quiz → assessment source 포함 + concept 12 + code_reading 30 추가 |
| SQL | 0 (shared) | concept 30 + code_reading 30 = 60 | **해결됨** | pool quiz → assessment source 포함 + concept 12 + code_reading 30 추가 |
| JavaScript | 0 (shared) | concept 30 + code_reading 30 = 60 | **해결됨** | pool quiz → assessment source 포함 + concept 12문제 추가 |
| React | 0 (shared) | concept 30 + code_reading 30 = 60 | **해결됨** | pool quiz → assessment source 포함 + concept 12 + code_reading 30 추가 |
| CWF | 0 | 0 | **데이터 부재** (미해결) | 후속 작업 필요 |
| Python | 0 | 0 | **데이터 부재** (미해결) | 후속 작업 필요 |
| Next.js | 0 | 0 | **데이터 부재** (미해결) | 후속 작업 필요 |

## 주요 해결 패턴

### 1. 연결 부재 해결
- `dev/quiz/[quizId]/page.tsx`에서 pool quiz의 source에 `a0000004` (assessment quiz) 포함
- `quiz_type === 'core_programming' || quiz_type === 'framework'` 조건으로 자동 포함

### 2. 데이터 부재 해결
- 시드 파일 4건으로 150문제 추가:
  - `quiz4_spring_boot_code.sql` — Spring Boot code_reading 30문제
  - `quiz4_react_code.sql` — React code_reading 30문제
  - `quiz4_sql_code.sql` — SQL code_reading 30문제
  - `quiz4_concept_expansion.sql` — 5과목 concept 각 12문제 = 60문제

### 3. 품질 부재 해결
- `question_subtype` 컬럼 추가 (`00116_dev_question_subtype.sql`)
- 기존 150문제 backfill: sort_order ≤90 → concept, >90 → code_reading
- 신규 150문제는 작성 시점에 subtype 지정
