# 전면정비 우선순위표

## 기존 문제 분류 (aligned / adaptable / out_of_scope)

### 정비 전 150문제

| category | subtype | 수량 | 분류 | 사유 |
|----------|---------|------|------|------|
| java | concept | 18 | **aligned** | category, difficulty, subtype 매핑 완료 |
| java | code_reading | 30 | **aligned** | 기존 quiz4_java_code.sql 출처, 코드해석 문제 |
| javascript | concept | 18 | **aligned** | category, difficulty, subtype 매핑 완료 |
| javascript | code_reading | 30 | **aligned** | 기존 quiz4_javascript_code.sql 출처, 코드해석 문제 |
| spring_boot | concept | 18 | **aligned** | category 통합 완료 (00115 마이그레이션) |
| react | concept | 18 | **aligned** | category 통합 완료 |
| sql | concept | 18 | **aligned** | category 통합 완료 |

**out_of_scope: 0문제** — 전 문제가 종합시험/이해도테스트에 활용 가능

### 신규 150문제

| 파일 | category | subtype | 수량 | 분류 |
|------|----------|---------|------|------|
| quiz4_spring_boot_code.sql | spring_boot | code_reading | 30 | **aligned** |
| quiz4_react_code.sql | react | code_reading | 30 | **aligned** |
| quiz4_sql_code.sql | sql | code_reading | 30 | **aligned** |
| quiz4_concept_expansion.sql | java | concept | 12 | **aligned** |
| quiz4_concept_expansion.sql | spring_boot | concept | 12 | **aligned** |
| quiz4_concept_expansion.sql | sql | concept | 12 | **aligned** |
| quiz4_concept_expansion.sql | javascript | concept | 12 | **aligned** |
| quiz4_concept_expansion.sql | react | concept | 12 | **aligned** |

## 완료된 작업 우선순위

| 순위 | 작업 | 상태 | 영향 범위 |
|------|------|------|----------|
| **P0** | question_subtype 컬럼 추가 | **완료** | 전 dev 문제의 분류 기반 |
| **P0** | 종합시험 60문제/60분 구조 재편 | **완료** | 종합시험 출제 품질 |
| **P0** | 3차원 출제 로직 (category×subtype×difficulty) | **완료** | 종합시험 밸런스 |
| **P1** | code_reading 문제 작성 (spring_boot, react, sql) | **완료** | 종합시험 필수 재고 |
| **P1** | concept 문제 보충 (5과목 각 12문제) | **완료** | 3배 랜덤화 여유 확보 |
| **P1** | 이해도테스트 → assessment quiz 공유 연결 | **완료** | pool quiz 출제 가능화 |
| **P2** | Admin UI subtype 지원 | **완료** | 관리 편의 |

## 미완료 후속 작업

| 순위 | 작업 | 상태 | 비고 |
|------|------|------|------|
| **P3** | CWF 이해도테스트 문제 작성 | 미착수 | 종합시험 범위 외, 이해도테스트 전용 |
| **P3** | Python 이해도테스트 문제 작성 | 미착수 | 종합시험 범위 외, 이해도테스트 전용 |
| **P3** | Next.js 이해도테스트 문제 작성 | 미착수 | 종합시험 범위 외, 이해도테스트 전용 |
| **P4** | 이해도테스트 전용 문제 분리 (assessment 미포함 문제) | 검토 필요 | 현재는 공유 구조로 충분 |

## Execution Checklist 대조

### Phase 1. 조사 — **완료**
- [x] `/dev`의 전체 subject 목록 확정 (8개 subject)
- [x] 각 subject의 lesson/module/학습목표 정리
- [x] `/dev/quiz`에 실제 노출되는 pool quiz 목록 추출
- [x] 현재 문제 미작성 상태를 subject별로 조사
- [x] 조사 구분: 데이터 부재 / 연결 부재 / 품질 부재

### Phase 2. 문제 분류 — **완료**
- [x] 기존 dev 문제를 aligned / adaptable / out_of_scope로 전수 분류
- [x] 각 문제를 subject와 학습목표에 연결
- [x] 각 문제의 사용처 판정 (이해도/종합/둘 다)

### Phase 3. 재고 조사 — **완료**
- [x] subject별 총 문제 수 집계
- [x] subject별 easy / medium / hard 재고 집계
- [x] 이해도 테스트 후보와 종합시험 후보 분리
- [x] 현재 subject별 미작성/부족 상태 표 정리
- [x] 종합시험용 최소 필요량 제안 초안 작성

### Phase 4. 이해도 테스트 재편 — **완료**
- [x] `/dev/quiz`를 완전한 subject-based IA로 재정의 (기존 구조 유지, 연결만 보강)
- [x] 각 subject별 이해도 테스트 진입점 확인 (8개 전부 존재)
- [x] 문제 없는 subject의 처리 정책 확인 (빈 풀 → "問題がまだ登録されていません" 표시)
- [x] title parsing 기반 subject 판별 확인 (미사용 — 제거 대상 없음)
- [x] lesson/subject 페이지와 이해도 테스트 CTA 연결 확인 (정상)

### Phase 5. 종합시험 설계 — **완료**
- [x] dev 종합시험에 사용할 subject 축 확정 (Java track / JS track)
- [x] subject별 문항 수 목표 (각 20문제 = concept 10 + code_reading 10)
- [x] 난이도 분포 목표 (easy 30% / medium 50% / hard 20%)
- [x] 이해도 테스트 문제 재사용 범위 정의 (assessment quiz 공유)
- [x] 전용 문제 작성 필요 subject 우선순위화

### Phase 6. 구현 준비 — **완료**
- [x] `src/lib/dev-quiz.ts` subject 매핑 확인 (변경 불필요)
- [x] `/dev/quiz/page.tsx` 데이터 모델 확인 (변경 불필요)
- [x] `/dev/quiz/[quizId]/page.tsx` selection 로직 변경 (assessment source 추가 + subtype 밸런싱)
- [x] 종합시험 공통 로직 접점 파일 식별 (assessments.ts, execution.ts, assessment-config.ts)
- [x] 데이터 보강량 산정 (150문제: code_reading 90 + concept 60)

### Phase 7. 검증 — **부분 완료**
- [x] 모든 dev subject가 quiz IA상에서 식별 가능
- [x] 문제 미작성 상태가 데이터 기준으로 설명 가능
- [x] subject별 재고표와 실제 quiz 연결 일치
- [x] 종합시험 후보군 표가 subject별로 비어 있지 않음
- [x] CS 전면정비와 충돌 없이 공통 로직 사용 가능 (TypeScript 0 에러)
- [ ] 런타임 검증 (실제 시험 시작 → 60문제 출제 확인) — DB 적용 후 가능

### Deliverables — **전수 완료**
- [x] dev subject inventory → `01_dev_subject_inventory.md`
- [x] subject별 이해도 테스트 상태표 → `02_understanding_test_status.md`
- [x] 문제 미작성 원인 구분표 → `03_missing_questions_analysis.md`
- [x] subject × difficulty 재고표 → `04_subject_difficulty_inventory.md`
- [x] 종합시험 후보군 제안서 → `05_comprehensive_exam_proposal.md`
- [x] 전면정비 우선순위표 → `06_overhaul_priority.md` (본 문서)
