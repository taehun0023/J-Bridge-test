# CS Comprehensive Overhaul Instruction

## Purpose
- CS 영역은 더 이상 `onboarding assessment step 3` 개념으로 운영하지 않는다.
- 앞으로의 기준 플로우는 `교육컨텐츠 -> 이해도 테스트 -> 종합시험`이다.
- 실제 전면정비의 최종 목표는 `종합시험 문제 품질 확보`다.
- 구현자는 기존 step 3 assessment 재사용 관성을 버리고, CS 종합시험을 별도 규칙으로 재설계해야 한다.

## Core Recognition
- 기존 CS 종합시험은 사실상 `assessment-config`와 `fetchStep3CsStyle`에 묶여 있다.
- 현재 구조는 다음 한계를 가진다.
  - `30문항` 기준이다.
  - 카테고리별 가중치 기반이다.
  - 종합시험과 교육컨텐츠 정합성이 충분히 보장되지 않는다.
  - 기존 임시 문제들이 교육내용 밖 범위를 포함할 수 있다.
- 따라서 CS 종합시험은 더 이상 기존 step 3 selection을 사용하면 안 된다.

## Final Exam Target
- 총 8개 카테고리 유지
  - `basic_theory`
  - `data_structure`
  - `algorithm`
  - `computer_architecture`
  - `database`
  - `network`
  - `os`
  - `security`
- 종합시험 출제 규칙
  - 총 `80문항`
  - 카테고리당 `10문항`
  - 카테고리별 난이도 비율 `easy 30% / medium 50% / hard 20%`
  - 실제 출제 수 `3 / 5 / 2`
- 최소 문제풀 목표
  - 카테고리당 총 `30문항`
  - 난이도별 최소 `easy 9 / medium 15 / hard 6`

## Pool Strategy
- 문제풀 전략은 `부분 재사용`으로 고정한다.
- 이해도 테스트 문제와 종합시험 문제는 완전 공용으로 두지 않는다.
- 운영 원칙
  - 이해도 테스트: 교육내용과 직접 대응하는 문제 우선
  - 종합시험: 이해도 테스트에서 검증된 문제 일부 + 종합시험 전용 문제 사용
  - 교육내용 밖 문제는 우선 제외

## Classification Standard
- 모든 기존 CS 문제를 `학습목표 기준`으로 전수 분류한다.
- 각 문제는 최소 아래 상태 중 하나를 가져야 한다.
  - `aligned`
  - `adaptable`
  - `out_of_scope`
- 각 문제는 최소 아래 판단이 가능해야 한다.
  - 카테고리
  - 난이도
  - 연결된 학습목표
  - 이해도 테스트 사용 가능 여부
  - 종합시험 사용 가능 여부

## Required Work Order
1. 현재 CS 교육컨텐츠의 lesson/module/학습목표 표를 확정한다.
2. 기존 CS 문제를 전수 조사해 `aligned / adaptable / out_of_scope`로 분류한다.
3. 카테고리/난이도/사용처별 재고표를 만든다.
4. 종합시험 목표치 `30문항 (9/15/6)` 기준으로 부족분을 산정한다.
5. 이해도 테스트 문제풀을 교육컨텐츠 기준으로 다시 정렬한다.
6. 종합시험 전용 카테고리 구조를 설계한다.
7. `80문항`, `카테고리당 10문항`, `3/5/2` 규칙으로 selection 로직을 교체한다.
8. exam/review/report/history 영향 범위를 반영한다.

## Understanding Quiz Policy
- 이해도 테스트는 교육내용 정합성이 최우선이다.
- 각 `check-1`, `check-2`, `final`은 해당 시점까지 학습한 범위만 다뤄야 한다.
- 권장 난이도 비율
  - `30/50/20`
- 현재처럼 final만 더 어려운 비율을 쓰는 구조는 유지 대상이 아니다.
- 이해도 테스트는 랜덤성보다 학습범위 검증이 우선이다.

## Comprehensive Exam Category Design
- 종합시험은 카테고리별 별도 풀을 우선 사용한다.
- 권장 카테고리 키
  - `cs_comp_basic_theory`
  - `cs_comp_data_structure`
  - `cs_comp_algorithm`
  - `cs_comp_computer_architecture`
  - `cs_comp_database`
  - `cs_comp_network`
  - `cs_comp_os`
  - `cs_comp_security`
- 이해도 테스트 전용 카테고리(`*_check_1`, `*_check_2`, `*_final`)는 당분간 유지 가능하다.

## Comprehensive Exam Selection Rules
- CS 종합시험은 별도 함수로 분리한다.
- 권장 함수명
  - `fetchCsComprehensiveQuestions(...)`
- 선택 순서
  - 카테고리별 종합시험 전용 풀에서 `3 / 5 / 2` 우선 추출
  - 부족하면 같은 카테고리의 이해도 테스트용 `aligned / adaptable` 문제에서 보충
  - 그래도 부족하면 같은 카테고리 내 나머지 문제로만 fallback
- 금지 사항
  - 다른 카테고리 문제로 부족분 보충
  - 기존 `fetchStep3CsStyle` 재사용

## Files That Must Be Reviewed
- `src/lib/assessment-config.ts`
- `src/lib/supabase/queries/assessments.ts`
- `src/app/actions/comprehensive-exam/execution.ts`
- `src/app/(main)/exam/[examId]/page.tsx`
- `src/app/actions/admin/weakness-report.ts`
- `src/lib/cs-quiz.ts`
- `src/app/(main)/cs/quiz/[quizId]/page.tsx`

## Expected Outputs
- `CS 문제 전수 분류표`
- `카테고리 x 난이도 x 사용처 재고표`
- `카테고리별 부족 문제 수량표`
- `새 종합시험 selection spec`
- `이해도 테스트 재편 spec`

## Non-Negotiable Constraints
- CS에는 더 이상 온보딩 평가 개념이 없다.
- CS 종합시험은 `80문항`으로 고정한다.
- 8개 카테고리 구조는 유지한다.
- 난이도 비율은 카테고리별 `30/50/20`으로 고정한다.
- 최소 문제풀 기준은 카테고리별 `30문항`, `9/15/6`이다.

## Claude Code Handoff
Claude Code에게 아래 인식을 그대로 전달한다.

### Handoff Summary
- CS는 `assessment step 3`가 아니라 `comprehensive-first` 구조다.
- `교육컨텐츠 -> 이해도 테스트 -> 종합시험` 흐름으로 재정렬한다.
- 최종 목표는 `종합시험 문제 품질 확보`다.
- 기존 step 3 assessment selection은 CS 종합시험에서 제거 대상이다.
- 최종 종합시험 규칙은 아래와 같다.
  - `8 categories`
  - `10 questions per category`
  - `80 total`
  - `3 easy / 5 medium / 2 hard per category`
- 최소 문제풀 목표는 아래와 같다.
  - `30 per category`
  - `9 easy / 15 medium / 6 hard`
- 작업 순서는 아래와 같다.
  - 문제 전수 분류
  - 재고 조사
  - 부족분 산정
  - 이해도 테스트 재편
  - 종합시험 카테고리/selection 교체
- 문제 분류 상태는 아래 3개다.
  - `aligned`
  - `adaptable`
  - `out_of_scope`
- 문제풀 전략은 `부분 재사용`이다.
  - 이해도 테스트 문제 일부는 종합시험으로 재사용 가능
  - 종합시험은 전용 풀 우선

### Claude Task Breakdown
- Step A: CS 교육목표 기준 문제 분류 체계 확정
- Step B: 카테고리/난이도/사용처 재고 집계
- Step C: 종합시험 전용 카테고리 구조 설계
- Step D: 80문항 selection 로직 설계
- Step E: review/report/history 영향 범위 반영
- Step F: 부족 문제 작성 계획 수량화

## Execution Checklist

### Phase 1. 조사
- [ ] 현재 CS lesson/module/학습목표 목록을 과목별로 정리한다.
- [ ] 기존 CS quiz/question이 어느 카테고리와 `question_category`를 쓰는지 추출한다.
- [ ] 기존 종합시험이 참조하는 selection/config 경로를 문서화한다.
- [ ] 현재 이해도 테스트 세트별 문제 수와 난이도 분포를 조사한다.
- [ ] 현재 종합시험 후보 문제 수를 카테고리/난이도 기준으로 조사한다.

### Phase 2. 문제 분류
- [ ] 모든 CS 문제에 대해 `aligned / adaptable / out_of_scope`를 판정한다.
- [ ] 각 문제를 하나 이상의 학습목표와 연결한다.
- [ ] 각 문제의 사용처를 판정한다.
- [ ] 사용처 구분 기준:
  - [ ] 이해도 테스트 가능
  - [ ] 종합시험 가능
  - [ ] 둘 다 가능
- [ ] `out_of_scope` 문제 목록을 별도 분리한다.

### Phase 3. 재고표 작성
- [ ] 카테고리별 총 문제 수를 집계한다.
- [ ] 카테고리별 `easy / medium / hard` 재고를 집계한다.
- [ ] 이해도 테스트용 재고와 종합시험용 재고를 분리 집계한다.
- [ ] 카테고리별 최소 종합시험 목표 `30문항 (9/15/6)`과 비교한다.
- [ ] 부족 수량표를 작성한다.

### Phase 4. 이해도 테스트 재편
- [ ] `check-1`, `check-2`, `final`의 범위를 교육내용 기준으로 다시 정의한다.
- [ ] 교육내용 밖 문제를 이해도 테스트 후보에서 제거한다.
- [ ] 세트별 난이도 규칙을 `30/50/20`으로 통일할지 최종 확정한다.
- [ ] 세트별 최소 회전 수를 기준으로 추가 문제 필요량을 산정한다.
- [ ] 현재 사실상 고정 출제인 세트를 우선 보강 대상으로 표시한다.

### Phase 5. 종합시험 설계
- [ ] 종합시험 전용 카테고리 키를 확정한다.
- [ ] 카테고리별 10문항 출제 정책을 config로 정의한다.
- [ ] `3 / 5 / 2` 난이도 규칙을 config로 정의한다.
- [ ] 같은 카테고리 내 fallback 정책을 설계한다.
- [ ] 다른 카테고리 문제 혼합 금지 규칙을 명시한다.

### Phase 6. 구현
- [ ] `assessment-config`에서 CS 종합시험이 step 3 assessment 규칙을 재사용하지 않도록 분리한다.
- [ ] CS 종합시험 전용 selection 함수를 추가한다.
- [ ] `comprehensive exam execution`이 새 80문항 규칙을 사용하도록 교체한다.
- [ ] exam page가 80문항/time limit 기준을 올바르게 반영하도록 수정한다.
- [ ] weakness report/review/history가 새 분포를 처리하도록 보정한다.

### Phase 7. 검증
- [ ] 종합시험이 정확히 80문항을 반환하는지 검증한다.
- [ ] 8개 카테고리별 10문항이 보장되는지 검증한다.
- [ ] 카테고리별 `3 / 5 / 2`가 우선 충족되는지 검증한다.
- [ ] fallback이 다른 카테고리 침범 없이 동작하는지 검증한다.
- [ ] 이해도 테스트가 교육범위 밖 문제를 포함하지 않는지 검증한다.
- [ ] 부족 재고 상태에서도 시스템이 실패하지 않고 명시적 fallback을 사용하는지 검증한다.

### Deliverables Checklist
- [ ] CS 문제 전수 분류표
- [ ] 카테고리/난이도/사용처 재고표
- [ ] 부족 문제 수량표
- [ ] 이해도 테스트 재편 명세
- [ ] 80문항 종합시험 selection 명세
- [ ] 영향 파일 목록과 변경 이유
