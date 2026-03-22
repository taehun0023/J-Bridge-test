# 종합시험 후보군 제안서

## 종합시험 최종 규칙

| 항목 | 값 |
|------|-----|
| 총 문제 수 | **60문제** |
| 시험 시간 | **60분** |
| 합격 기준 | **70점** |
| Track 분기 | `profiles.target_coding_area` (java / javascript) |

## Track별 출제 구조

### Java Track
| Section | category | concept | code_reading | 소계 |
|---------|----------|---------|-------------|------|
| 1 | java | 10 | 10 | 20 |
| 2 | spring_boot | 10 | 10 | 20 |
| 3 | sql | 10 | 10 | 20 |
| **합계** | | **30** | **30** | **60** |

### JavaScript Track
| Section | category | concept | code_reading | 소계 |
|---------|----------|---------|-------------|------|
| 1 | javascript | 10 | 10 | 20 |
| 2 | react | 10 | 10 | 20 |
| 3 | sql | 10 | 10 | 20 |
| **합계** | | **30** | **30** | **60** |

## 각 subtype 10문제의 난이도 분포

| difficulty | 문제 수 | 비율 |
|-----------|--------|------|
| easy | 3 | 30% |
| medium | 5 | 50% |
| hard | 2 | 20% |

## 출제 알고리즘

```
for each category in [lang, framework, sql]:
  for each subtype in [concept, code_reading]:
    target = 10
    pick easy:   round(10 × 0.3) = 3
    pick medium: round(10 × 0.5) = 5
    pick hard:   round(10 × 0.2) = 2
    → 10문제
  → 20문제/category
→ 60문제/시험
```

Fallback 전략:
1. subtype 내 difficulty 부족 → 같은 subtype의 다른 difficulty에서 보충
2. subtype 부족 → 같은 category의 다른 subtype에서 보충
3. category 부족 → 기존 language group 랜덤 선택으로 fallback

## 문제풀 재사용 구조

```
assessment quiz (a0000004) — 300문제
  ├─ 종합시험 출제 source (60문제/회)
  └─ 이해도테스트 출제 source (20문제/회, subject별)
```

- 모든 문제는 assessment quiz에 보관
- 이해도테스트는 assessment quiz를 source에 포함하여 공유
- 중복 제거: `question_text` 기준 dedup

## Config 변경 내역

| 설정 | Before | After |
|------|--------|-------|
| `ASSESSMENT_TOTAL_QUESTIONS[4]` | 30 | **60** |
| `ASSESSMENT_TIME_LIMITS[4]` | 30 | **60** |
| `STEP4_CATEGORY_WEIGHTS_JAVA` | {java:16, spring_boot:8, sql:6} | **{java:20, spring_boot:20, sql:20}** |
| `STEP4_CATEGORY_WEIGHTS_JS` | {javascript:16, react:8, sql:6} | **{javascript:20, react:20, sql:20}** |
| `STEP4_DIFFICULTY_RATIOS` | {easy:0.2, medium:0.4, hard:0.4} | **{easy:0.3, medium:0.5, hard:0.2}** |
| `STEP4_SUBTYPE_SPLIT` (신규) | — | **{concept:10, code_reading:10}** |

## 구현 파일

| 파일 | 변경 내용 |
|------|----------|
| `00116_dev_question_subtype.sql` | `question_subtype` 컬럼 추가 + backfill |
| `assessment-config.ts` | 위 Config 변경 |
| `assessments.ts` | `fetchStep4DevStyle()` 3차원 선택 리라이트 |
| `execution.ts` | 변경 불필요 (이미 assessment quiz에서 출제) |
| `dev/quiz/[quizId]/page.tsx` | pool quiz → assessment source 포함 + subtype 밸런싱 |
| `admin/questions.ts` | `question_subtype` CRUD 지원 |
| `AdminCoursesClient.tsx` | サブタイプ 컬럼/필터/폼 추가 |
