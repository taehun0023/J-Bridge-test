# Dev Comprehensive Overhaul Instruction

## Purpose
- dev 영역도 종합시험 중심 구조로 재편한다.
- 현재 `/dev`는 subject 페이지, 이해도테스트 진입, 종합시험 개념이 서로 충분히 맞물려 있지 않다.
- 이번 전달 문서의 목적은 `dev 페이지의 이해도테스트(현재 문제 미작성)`, `종합시험`, `전면정비`를 하나의 작업 묶음으로 정의하는 것이다.

## Current Recognition
- `/dev` 허브는 subject 기반 UI를 갖고 있다.
- 하지만 `/dev/quiz`는 아직 `core_programming`, `framework` 중심의 부분 구현이다.
- 관련 교차 리뷰 문서들도 다음 문제를 이미 지적하고 있다.
  - subject 기반 quiz IA가 완성되지 않음
  - 일부 subject는 이해도테스트 문제풀이가 비어 있거나 미완성
  - title parsing 등 취약한 매핑 의존이 남아 있음
- 따라서 dev는 단순 UI 보수가 아니라 `문제 분류 -> 재고 조사 -> 구조 재설계`가 필요하다.

## Required Recognition
- dev도 CS와 같은 관점으로 본다.
- 최종 목표는 `종합시험 품질 확보`다.
- 이해도테스트는 종합시험을 위한 전제 정비 작업이다.
- 현재 문제 미작성 상태는 반드시 아래 둘로 구분해 조사해야 한다.
  - 실제 DB에 문제가 없는 경우
  - 문제는 있지만 subject/quiz IA가 제대로 연결되지 않은 경우

## Work Order
1. 현재 `/dev` subject 목록을 전수 확정한다.
2. 각 subject별 교육내용과 학습목표를 정리한다.
3. 각 subject의 이해도테스트 현황을 조사한다.
4. 현재 문제 미작성 상태를 `데이터 부재 / 연결 부재 / 품질 부재`로 나눈다.
5. 기존 dev 문제를 `aligned / adaptable / out_of_scope`로 분류한다.
6. subject별 `easy / medium / hard` 재고를 집계한다.
7. 이해도테스트 문제풀과 종합시험 문제풀 재사용 가능 범위를 구분한다.
8. `/dev/quiz`를 완전한 subject-based test IA로 재정의한다.
9. dev 종합시험 목표 수량과 카테고리 구성을 별도 제안안으로 정리한다.

## Classification Standard
- 모든 dev 문제는 아래 상태 중 하나를 가져야 한다.
  - `aligned`
  - `adaptable`
  - `out_of_scope`
- 각 문제는 아래 판단이 가능해야 한다.
  - 어느 subject인지
  - 난이도
  - 연결된 학습목표
  - 이해도테스트 사용 가능 여부
  - 종합시험 사용 가능 여부

## Understanding Quiz Expectations
- dev 이해도테스트는 subject 기반으로 완성돼야 한다.
- subject 페이지에서 보이는 학습 흐름과 퀴즈 구조가 대칭이어야 한다.
- 단순히 `/dev/quiz`에 카드만 추가하는 수준으로 끝내면 안 된다.
- 조사 시 반드시 아래를 확인한다.
  - 각 subject에 대응하는 pool quiz가 있는지
  - questions_per_attempt가 적절한지
  - question_category가 subject 구조와 맞는지
  - 실제 문제 수가 존재하는지

## Comprehensive Exam Direction
- dev도 종합시험 중심 구조로 간다.
- 다만 현재는 CS처럼 최종 문항 수가 확정되지 않았으므로, 먼저 아래 산출물을 만든다.
  - subject 목록
  - subject별 교육범위
  - subject별 문제 재고
  - 난이도 분포
  - 종합시험 후보 문제 수
  - 전용 문제 필요량
- 이 조사 결과를 바탕으로 dev 종합시험 최종 규칙을 확정한다.
- dev 종합시험은 처음에 정했던 규칙으로 유저가 자바나 자바스크립트를 선택하면 그에 맞는 카테고리가 종합시험에 출제된다.
- 종합시험은 (유저가 선택한 언어 20문제 + 그 언어의 프레임워크 20문제 + SQL 20문제)로 구성하고 난이도는 각각 쉬움 3할/ 중간 5할/ 어려움 2할로 출제되게 해줘.
- 유저가 선택한 언어 20문제(개념 10문제 + 코드해석 10문제) + 그 언어의 프레임워크 20문제(개념 10문제 + 코드해석 10문제) + SQL 20문제(개념 10문제 + 코드해석 10문제) 로 구성해줘

## Files That Must Be Reviewed
- `src/app/(main)/dev/page.tsx`
- `src/app/(main)/dev/quiz/page.tsx`
- `src/app/(main)/dev/quiz/[quizId]/page.tsx`
- `src/lib/dev-quiz.ts`
- `src/lib/dev-course.ts`
- `src/lib/dev-content.ts`
- 필요 시 종합시험 공통 로직

## Required Deliverables
- `dev subject inventory`
- `subject별 이해도테스트 상태표`
- `문제 미작성 원인 구분표`
- `subject x difficulty 재고표`
- `종합시험 후보군 제안서`
- `전면정비 우선순위표`

## Concrete Task Text For Dev Team
- 현행 `/dev`의 subject, quiz, exam 흐름을 전수 조사한다.
- 현재 이해도테스트로 노출되지만 문제풀이가 없거나 불완전한 subject를 식별한다.
- 각 dev subject별 문제를 `aligned / adaptable / out_of_scope`로 분류한다.
- 각 subject별 `easy / medium / hard` 재고를 집계한다.
- 종합시험에 재사용 가능한 문제와 전용 문제 필요량을 분리 산정한다.
- `/dev/quiz`를 완전한 subject-based test IA로 재정의한다.
- dev 종합시험의 목표 문항 수, subject 분포, 난이도 분포를 제안서 형태로 제출한다.
- 작업 순서는 반드시 `문제 분류 -> 문제수 재정비 -> 종합시험 설계`를 따른다.

## Non-Negotiable Constraints
- dev는 종합시험 중심 구조로 정리한다.
- 이해도테스트는 최종 목표가 아니라 종합시험을 위한 전제 정비 단계다.
- 현재 문제 미작성 상태는 감으로 처리하지 말고 데이터 기준으로 구분한다.
- UI 개편보다 먼저 문제풀 구조와 연결 구조를 조사한다.

## Execution Checklist

### Phase 1. 조사
- [ ] `/dev`의 전체 subject 목록을 확정한다.
- [ ] 각 subject의 lesson/module/학습목표를 정리한다.
- [ ] `/dev/quiz`에 실제 노출되는 pool quiz 목록을 추출한다.
- [ ] 현재 문제 미작성 상태를 subject별로 조사한다.
- [ ] 조사 구분 기준:
  - [ ] 문제 자체 부재
  - [ ] quiz 연결 부재
  - [ ] category 매핑 부재
  - [ ] 문제 품질 부재

### Phase 2. 문제 분류
- [ ] 기존 dev 문제를 `aligned / adaptable / out_of_scope`로 전수 분류한다.
- [ ] 각 문제를 subject와 학습목표에 연결한다.
- [ ] 각 문제의 사용처를 판정한다.
- [ ] 사용처 구분 기준:
  - [ ] 이해도 테스트 가능
  - [ ] 종합시험 가능
  - [ ] 둘 다 가능

### Phase 3. 재고 조사
- [ ] subject별 총 문제 수를 집계한다.
- [ ] subject별 `easy / medium / hard` 재고를 집계한다.
- [ ] 이해도 테스트 후보 재고와 종합시험 후보 재고를 분리한다.
- [ ] 현재 subject별 미작성/부족 상태를 표로 정리한다.
- [ ] 종합시험용 최소 필요량 제안 초안을 작성한다.

### Phase 4. 이해도 테스트 재편
- [ ] `/dev/quiz`를 완전한 subject-based IA로 재정의한다.
- [ ] 각 subject별 이해도 테스트 진입점이 존재하는지 확인한다.
- [ ] 문제 없는 subject는 “미작성” 상태로 명확히 표시할지, 비노출 처리할지 정책을 정한다.
- [ ] title parsing 기반 subject 판별이 남아 있다면 제거 대상으로 표시한다.
- [ ] lesson/subject 페이지와 이해도 테스트 CTA의 연결을 재정렬한다.

### Phase 5. 종합시험 설계
- [ ] dev 종합시험에 사용할 subject 축을 확정한다.
- [ ] subject별 문항 수 목표 초안을 만든다.
- [ ] 난이도 분포 목표 초안을 만든다.
- [ ] 이해도 테스트 문제 재사용 범위를 정의한다.
- [ ] 전용 문제 작성이 필요한 subject를 우선순위화한다.

### Phase 6. 구현 준비
- [ ] `src/lib/dev-quiz.ts`의 subject 매핑 방식 개선 범위를 정리한다.
- [ ] `/dev/quiz/page.tsx`의 데이터 모델 개편 범위를 정리한다.
- [ ] `/dev/quiz/[quizId]/page.tsx`의 selection 로직 변경 범위를 정리한다.
- [ ] 종합시험 공통 로직과의 접점 파일을 식별한다.
- [ ] 최종 구현 전에 필요한 데이터 보강량을 subject별로 산정한다.

### Phase 7. 검증
- [ ] 모든 dev subject가 quiz IA상에서 식별 가능한지 검증한다.
- [ ] 문제 미작성 상태가 데이터 기준으로 설명 가능한지 검증한다.
- [ ] subject별 재고표와 실제 quiz 연결이 일치하는지 검증한다.
- [ ] 종합시험 후보군 표가 subject별로 비어 있지 않은지 검증한다.
- [ ] CS 전면정비와 충돌 없이 공통 로직을 사용할 수 있는지 검토한다.

### Deliverables Checklist
- [ ] dev subject inventory
- [ ] subject별 이해도 테스트 상태표
- [ ] 문제 미작성 원인 구분표
- [ ] subject x difficulty 재고표
- [ ] 종합시험 후보군 제안서
- [ ] 전면정비 우선순위표
