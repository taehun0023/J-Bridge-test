# Subject별 이해도테스트 상태표

## 상태 정의

| 상태 | 설명 |
|------|------|
| active | pool quiz 존재 + 문제풀 확보 + 정상 출제 |
| shared | assessment quiz에서 문제 공유하여 출제 가능 |
| empty | pool quiz 존재하지만 전용 문제 미작성 |

## Subject별 상태 (정비 후)

| Subject | pool quiz | 전용 문제 수 | assessment 공유 | questions_per_attempt | 상태 |
|---------|-----------|------------|----------------|----------------------|------|
| Java | e0000001-...-0001 | 0 | concept 30 + code_reading 30 = 60 | 20 | **shared** |
| Spring Boot | e0000001-...-0002 | 0 | concept 30 + code_reading 30 = 60 | 20 | **shared** |
| SQL | e0000001-...-0003 | 0 | concept 30 + code_reading 30 = 60 | 20 | **shared** |
| JavaScript | e0000001-...-0004 | 0 | concept 30 + code_reading 30 = 60 | 20 | **shared** |
| React | e0000001-...-0005 | 0 | concept 30 + code_reading 30 = 60 | 20 | **shared** |
| CWF | e0000001-...-0007 | 0 | 0 | 20 | **empty** |
| Python | e0000001-...-0008 | 0 | 0 | 20 | **empty** |
| Next.js | e0000001-...-0009 | 0 | 0 | 20 | **empty** |

## 공유 메커니즘

정비 후, 이해도테스트(pool quiz)는 `assessment quiz a0000004`의 문제를 source에 포함:

```
pool quiz (quiz_type = core_programming/framework)
  ↓ source 검색
  같은 quiz_type + is_pool=false + is_assessment=false (기존)
  + assessment quiz a0000004 (신규 추가)
  ↓ question_category 필터
  해당 subject의 문제만 추출
  ↓ subtype 밸런싱
  concept 10 + code_reading 10 = 20문제
```

## 미작성 Subject 후속 작업

| Subject | 필요 작업 | 우선순위 |
|---------|----------|---------|
| CWF | 전용 문제 작성 필요 (종합시험 미포함이므로 pool 전용) | 낮음 |
| Python | 전용 문제 작성 필요 | 낮음 |
| Next.js | 전용 문제 작성 필요 | 낮음 |
