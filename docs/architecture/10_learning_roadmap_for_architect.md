# 10. 아키텍트 학습 로드맵 (Learning Roadmap for Architect)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** J-Bridge 시스템을 인수받아 아키텍트 역할을 수행할 엔지니어
> **전제 조건:** Web 개발 기초 경험 (React, SQL, REST API 수준)

---

## 목차

1. [4주 학습 로드맵](#1-4주-학습-로드맵)
2. [아키텍트 체크리스트 (20항목)](#2-아키텍트-체크리스트-20항목)
3. [인터뷰 스크립트](#3-인터뷰-스크립트)
4. [학습 팁 & 리소스](#4-학습-팁--리소스)
5. [자기 진단 가이드](#5-자기-진단-가이드)
6. [교차 참조 인덱스](#6-교차-참조-인덱스)

---

## 1. 4주 학습 로드맵

> **총 학습량:** 4주, 주 6일, 1일 1~2시간 (총 24~48시간)
> **학습 방식:** 문서 정독 → 코드 확인 → 다이어그램 재현 → 구두 설명 연습

---

### Week 1: 시스템 전체상 파악 (System Big Picture)

**목표:** J-Bridge가 무엇이며, 어떻게 구성되어 있고, 코드가 어디에 있는지를 설명할 수 있다.

| Day | 학습 문서 | 학습 목표 | 핸즈온 연습 | 예상 시간 |
|:---:|:---------|:---------|:-----------|:---------:|
| **D1** | [01_system_overview.md](./01_system_overview.md) 1~3장 | Next.js 16 App Router + BFF 모놀리스 아키텍처를 이해한다. Server Component / Client Component / Server Action 3계층 구분을 설명할 수 있다 | (1) `src/app/(main)/layout.tsx`를 열어 RSC → CC 데이터 전달 패턴을 확인한다. (2) `src/app/actions/` 폴더를 열어 17개 Server Action 파일 목록과 각각의 역할을 메모한다 | 1.5h |
| **D2** | [01_system_overview.md](./01_system_overview.md) 4~9장 | Supabase(Auth/DB/Storage), Judge0(코드 실행), Google TTS(음성 합성) 3개 외부 시스템 연동 구조를 이해한다. CQRS-Lite 패턴(Server Actions = Command, Queries = Read)을 설명할 수 있다 | (1) `src/lib/supabase/`에서 클라이언트 생성 코드를 확인한다. (2) `judge0/docker-compose.yml`을 열어 컨테이너 구성(Server/Workers/Redis/Postgres)을 확인한다. (3) 의존성 다이어그램을 종이에 직접 그려본다 | 1.5h |
| **D3** | [02_folder_responsibility.md](./02_folder_responsibility.md) 1~3장 | 프로젝트 루트 구조(src, supabase, scripts, judge0, docs)와 src 내부 구조(app, components, lib, middleware)를 암기 수준으로 파악한다 | (1) 터미널에서 `ls` 명령으로 실제 폴더 구조를 확인하고 문서와 대조한다. (2) Route Group `(auth)` vs `(main)` 분리 이유를 메모한다. (3) `src/components/` 하위 폴더별 역할을 정리한다 | 1.5h |
| **D4** | [02_folder_responsibility.md](./02_folder_responsibility.md) 4~7장 | 60개 page.tsx 라우트 맵을 이해하고, `assessment-config.ts`가 허브 파일로서 7개 모듈에 의존되는 구조를 이해한다. 파일별 Server/Client 구분, 변경 빈도 추정을 확인한다 | (1) `src/lib/assessment-config.ts`를 열어 어떤 상수들이 정의되어 있고, 이를 import하는 파일을 `grep`으로 찾아본다. (2) 전체 라우트 맵을 인쇄/복사하여 핵심 경로에 형광펜으로 표시한다 | 1.5h |
| **D5** | [03_runtime_flow.md](./03_runtime_flow.md) 1~3장 | 로그인 → Middleware → Dashboard 흐름과 Comprehensive Exam 전체 생명주기를 시퀀스 다이어그램으로 설명할 수 있다 | (1) `src/middleware.ts`를 열어 인증 체크 → 온보딩 분기 → RBAC 분기 코드 흐름을 따라간다. (2) 종합시험 흐름에서 `comprehensive-exam.ts` Server Action의 주요 함수(startExam, submitAnswer, completeExam)를 확인한다. (3) 로그인 시퀀스를 종이에 직접 다시 그려본다 | 2h |
| **D6** | [03_runtime_flow.md](./03_runtime_flow.md) 4~7장 | Code Submission + Judge0, TTS Caching, Score Recalculation, Quiz Submission 4개 런타임 흐름을 이해한다. 각 흐름의 성능 병목 지점을 식별할 수 있다 | (1) `src/lib/judge0/client.ts`에서 polling 루프를 확인한다. (2) `src/app/api/tts/route.ts`에서 캐시 확인 → 합성 → 저장 흐름을 따라간다. (3) `src/app/actions/scores.ts`의 `recalculateUserScores()`를 열어 8개 순차 쿼리 위치를 확인한다 | 2h |

**Week 1 완료 기준:** 다음 질문에 막힘 없이 답할 수 있어야 한다.
- "J-Bridge의 기술 스택과 아키텍처 스타일을 설명해주세요."
- "Server Component와 Server Action의 차이, 각각 언제 사용하는지 설명해주세요."
- "사용자가 로그인해서 대시보드를 보기까지 어떤 코드가 실행되나요?"

---

### Week 2: 데이터와 보안의 심층 이해 (Data & Security Deep Dive)

**목표:** 42개 테이블의 관계, 마이그레이션 진화 흐름, RLS 보안 모델, 3-Layer RBAC를 설명할 수 있다.

| Day | 학습 문서 | 학습 목표 | 핸즈온 연습 | 예상 시간 |
|:---:|:---------|:---------|:-----------|:---------:|
| **D1** | [04_data_architecture.md](./04_data_architecture.md) 1~3장 | 48개 마이그레이션의 6-Phase 진화를 이해한다. 42개 테이블을 카테고리별(User/Content/Quiz/Code/Japanese/Exam/Ranking/Admin)로 분류할 수 있다. ASCII ERD에서 주요 FK 관계를 추적할 수 있다 | (1) `supabase/migrations/` 폴더에서 실제 마이그레이션 파일명을 확인하고 Phase 분류와 대조한다. (2) ERD를 인쇄하여 `profiles` 테이블에서 출발하는 모든 FK 경로를 색깔별로 추적한다 | 2h |
| **D2** | [04_data_architecture.md](./04_data_architecture.md) 4~7장 | 트랜잭션 경계 부재 문제(scores.ts의 8개 순차 UPSERT), 28개 확인된 인덱스와 7개 추가 제안 인덱스, 시드 구조(36파일, ~14,400 레코드), 스키마 갭(DB_Schema.md 대비 13개 미구현 테이블)을 파악한다 | (1) `supabase/seed_parts/` 폴더에서 시드 파일 목록을 확인한다. (2) 스키마 갭 분석 표에서 "미구현" 테이블과 "신규 추가" 테이블을 구분하여 메모한다. (3) `src/app/actions/scores.ts`에서 트랜잭션 없이 UPSERT가 실행되는 L205-255 구간을 확인한다 | 1.5h |
| **D3** | [06_security_design.md](./06_security_design.md) 1장 | RLS 정책 매트릭스를 이해한다. `is_admin()`, `is_mentor()`, `is_admin_or_mentor()`, `is_mentor_of()` 4개 헬퍼 함수의 역할과 `SECURITY DEFINER` 의미를 설명할 수 있다. 42개 테이블 중 RLS 정책 누락이 있는 테이블을 식별할 수 있다 | (1) 마이그레이션 파일에서 `is_admin()` 함수 정의를 찾아 읽는다 (`00019`, `00035`). (2) RLS 매트릭스에서 "정책 누락"으로 표시된 테이블(lesson_resources, projects, project_requirements, jlpt_vocabulary, it_glossary)을 목록화한다 | 1.5h |
| **D4** | [06_security_design.md](./06_security_design.md) 2~4장 | 3-Layer RBAC(Middleware → Server Action → RLS) 구조를 이해한다. Service Role Key 15개 사용 지점의 보안 리스크를 파악한다. `quiz_question_options_safe` VIEW가 왜 필요한지 설명할 수 있다 | (1) `src/middleware.ts`에서 RBAC 경로 보호 코드를 확인한다. (2) Server Action 파일에서 `getUser()` 패턴을 검색하여 인증 검사 방식을 확인한다. (3) VIEW 정의를 마이그레이션에서 찾아 `is_correct` 컬럼이 제외된 것을 확인한다 | 1.5h |
| **D5** | [06_security_design.md](./06_security_design.md) 5~7장 | 12개 보안 갭(G1-G12)을 이해하고, STRIDE 위협 모델의 각 카테고리별 위협을 설명할 수 있다. 3-Phase 보안 개선 로드맵의 우선순위를 설명할 수 있다 | (1) G1~G12 보안 갭 목록을 위험도 순으로 재정렬해본다. (2) Judge0 `privileged: true` Docker 모드(G2)와 인증 미설정(G1)의 구체적 공격 시나리오를 메모한다. (3) STRIDE 표에서 "현재 대응 없음" 항목을 추출한다 | 1.5h |
| **D6** | [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) 전체 | 네트워크 토폴로지(Browser → Next.js → Supabase/Judge0/TTS), API 카탈로그(64개 Server Action + 3개 API Route), Judge0 네트워크 보안 리스크, 장애 모드 분석(Supabase/Judge0/TTS 장애 시 영향), 환경 변수 카탈로그를 파악한다 | (1) ASCII 네트워크 토폴로지를 종이에 다시 그려본다. (2) `.env.local` 파일(또는 환경 변수 목록)을 확인하여 문서와 대조한다. (3) Judge0가 `localhost:2358`에서 **인증 없이** 노출되는 보안 문제를 정리한다 | 2h |

**Week 2 완료 기준:** 다음 질문에 막힘 없이 답할 수 있어야 한다.
- "DB 스키마가 48개 마이그레이션을 거쳐 어떻게 진화했는지 설명해주세요."
- "RLS와 Server Action과 Middleware, 각 레이어에서 어떤 보안 검사를 하나요?"
- "현재 가장 심각한 보안 갭은 무엇이고 어떻게 해결하겠습니까?"

---

### Week 3: 도메인 모델과 확장성 (Domain & Scalability)

**목표:** 3개 시험 시스템, 5축 점수 산정 로직, Paiza 랭크 시스템을 설명할 수 있다. 시스템의 확장 한계와 병목 지점, 비용 최적화 전략을 제시할 수 있다.

| Day | 학습 문서 | 학습 목표 | 핸즈온 연습 | 예상 시간 |
|:---:|:---------|:---------|:-----------|:---------:|
| **D1** | [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) 1~2장 | 4-Tier 도메인 계층(LMS → Exam → HR Evaluation → Mentoring)을 이해한다. DDD 관점에서 Entity, Aggregate, Value Object를 식별할 수 있다 | (1) 도메인 계층 다이어그램을 종이에 그리고, 각 계층에 속하는 테이블을 매핑한다. (2) `profiles`가 여러 Aggregate의 루트에서 참조되는 구조를 확인한다 | 1.5h |
| **D2** | [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) 3장 | 3개 시험 시스템(Regular Quiz / Assessment Quiz / Comprehensive Exam)의 차이를 표로 정리할 수 있다. 각 시험의 트리거, 채점 방식, 결과 활용처를 설명할 수 있다 | (1) `src/app/actions/quiz.ts`에서 `startQuizAttempt()`, `submitQuizAnswers()` 함수를 읽는다. (2) `src/app/actions/comprehensive-exam.ts`에서 종합시험 관련 함수를 읽는다. (3) 3개 시험 시스템의 비교표를 직접 다시 작성해본다 | 2h |
| **D3** | [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) 4~5장 | 5축 레이더 점수 산정 공식(각 축의 가중치, 입력 데이터, 계산 로직)을 수식 수준으로 이해한다. Paiza식 코딩 랭크(D→S) 승급 조건과 시험 풀 구성을 설명할 수 있다 | (1) `scores.ts`를 열어 5축 각각의 계산 코드 위치를 확인하고, 문서의 수식과 대조한다. (2) 5축 레이더 차트에서 각 축 이름(生活日本語, ビジネス日本語, CS知識, 開発実務能力, ビジネスリテラシー)을 일본어로 암기한다. (3) `assessment-config.ts`에서 각 등급별 시간 제한, 문제 수 설정을 확인한다 | 2h |
| **D4** | [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) 6~8장 + [08_scalability_analysis.md](./08_scalability_analysis.md) 1장 | 랭킹 시스템(3개월 시즌, 설계-구현 갭), 점수 갱신 트리거 분석, 도메인 이벤트 흐름을 이해한다. 품질 속성 매트릭스 8개 항목(성능/보안/확장성/신뢰성/유지보수/운영/테스트/배포)의 현재 수준과 목표 수준의 갭을 파악한다 | (1) 랭킹 시스템의 설계-구현 갭(DB_Schema.md vs 실제 마이그레이션)을 정리한다. (2) 품질 속성 매트릭스를 인쇄하여 갭이 가장 큰 항목(-3, -2)에 표시한다. (3) "테스트 용이성 갭 -3"의 구체적 근거를 정리한다 | 1.5h |
| **D5** | [08_scalability_analysis.md](./08_scalability_analysis.md) 2~5장 | 4대 성능 병목(`recalculateUserScores` 8회 순차 쿼리, Judge0 polling, 페이지네이션 부분 적용, TTS 순차 합성)을 이해한다. 유저 규모별 확장 한계(~30명 안정/~50명 모니터링 필요/~100명 병목 시작)를 수치로 설명할 수 있다 | (1) `scores.ts`의 `recalculateAllScores()` 함수에서 순차 처리 코드를 확인한다. (2) 30/50/100/500명 시나리오별 추정 응답시간을 자신만의 표로 정리한다. (3) Vercel 함수 10초 타임아웃 제약이 어느 규모에서 문제가 되는지 계산한다 | 1.5h |
| **D6** | [08_scalability_analysis.md](./08_scalability_analysis.md) 6~8장 | 모니터링 전략(Vercel Analytics/Sentry/Supabase Dashboard), 리스크 관리(데이터/가용성/성능/보안), 3-Tier 확장 전략(Short-term Quick Fix / Mid-term Architecture / Long-term Platform), 비용 최적화 분석을 이해한다 | (1) 3-Tier 확장 전략을 타임라인과 함께 정리한다. (2) Supabase 무료 → Pro 전환 시점과 비용 변화를 메모한다. (3) "현재 아키텍처로 100명을 지원하려면?" 질문에 대한 답변을 준비한다 | 1.5h |

**Week 3 완료 기준:** 다음 질문에 막힘 없이 답할 수 있어야 한다.
- "5축 레이더 차트의 각 축은 어떤 데이터에서 어떻게 계산되나요?"
- "Regular Quiz, Assessment, Comprehensive Exam의 차이를 설명해주세요."
- "사용자가 100명으로 늘어나면 어디서 문제가 생기고, 어떻게 대응하겠습니까?"

---

### Week 4: 리팩토링 전략과 종합 연습 (Refactoring & Synthesis)

**목표:** 코드 개선 우선순위를 제시하고, 전체 시스템을 2분 안에 설명할 수 있다. 모든 문서의 내용을 교차 참조하며 아키텍처 의사결정을 설명할 수 있다.

| Day | 학습 문서 | 학습 목표 | 핸즈온 연습 | 예상 시간 |
|:---:|:---------|:---------|:-----------|:---------:|
| **D1** | [09_refactoring_candidates.md](./09_refactoring_candidates.md) 1~2장 | 3대 God Function(`recalculateUserScores` 245줄, `comprehensive-exam.ts` 462줄, `admin.ts` 432줄/15함수)을 분석하고, 각각의 혼합된 책임을 설명할 수 있다. 5개 Quick Win(에러 로깅, Auth 헬퍼 추출, 알림 패턴 추출, admin.ts 도메인 분리, 레거시 제거)을 우선순위 포함하여 설명할 수 있다 | (1) `scores.ts`, `comprehensive-exam.ts`, `admin.ts` 3개 파일을 열어 실제 줄 수와 함수 수를 확인한다. (2) Quick Win #1(에러 로깅)의 구현 방안을 자신의 언어로 30초 내에 설명하는 연습을 한다 | 2h |
| **D2** | [09_refactoring_candidates.md](./09_refactoring_candidates.md) 3~4장 | 모듈 분리 후보(scoring/, tts/, notification/)의 Before/After 구조를 이해한다. 마이크로서비스 경계 분석에서 "모놀리스 유지 추천"의 근거를 설명할 수 있다 | (1) scoring 모듈 분리안의 파일 구조를 직접 설계해본다(문서 참조 없이). (2) "왜 마이크로서비스가 아닌 모놀리스를 유지하는가?" 질문에 대해 3가지 근거를 준비한다 (팀 규모, 트래픽 수준, 운영 복잡도) | 1.5h |
| **D3** | [09_refactoring_candidates.md](./09_refactoring_candidates.md) 5~7장 | DB 리팩토링 제안(미사용 테이블, 스키마 문서화, 인덱스 추가, enum 정리, 트랜잭션 도입)을 이해한다. 10주 코드 품질 개선 로드맵의 Phase별 목표를 설명할 수 있다. 리팩토링 리스크 평가 매트릭스를 활용할 수 있다 | (1) 10주 로드맵에서 각 Phase의 "완료 기준"을 메모한다. (2) 리스크 평가 매트릭스에서 "높은 영향 + 높은 리스크" 항목을 우선 식별한다. (3) DB 리팩토링 중 "트랜잭션 도입"을 RPC 함수로 구현하는 방법을 조사한다 | 1.5h |
| **D4** | 전체 문서 교차 복습 | 9개 문서의 핵심 내용을 3분 이내에 요약할 수 있다. 문서 간 교차 참조 관계를 설명할 수 있다 | (1) 각 문서의 핵심 키워드 3개씩을 뽑아 총 27개 키워드 목록을 만든다. (2) 키워드 목록을 보고 관련 문서와 섹션을 즉시 연상하는 연습을 한다. (3) 본 문서 6장의 교차 참조 인덱스를 활용하여 주제별 문서 연결을 확인한다 | 1.5h |
| **D5** | 인터뷰 스크립트 연습 | 2분 시스템 소개 스크립트를 암기하여 자연스럽게 말할 수 있다. 5개 심화 시나리오에 대해 구조화된 답변을 할 수 있다 | (1) 3장의 2분 스크립트를 소리 내어 3회 읽는다. (2) 타이머를 설정하고 2분 내에 완료하는 연습을 한다. (3) 5개 심화 시나리오 중 2개를 골라 답변을 즉석에서 말하는 연습을 한다 | 2h |
| **D6** | 종합 시뮬레이션 | 모의 인터뷰를 통해 전체 지식을 검증한다. 아키텍트 체크리스트 20항목을 자기 진단한다 | (1) 동료에게 부탁하여 30분 모의 인터뷰를 진행한다 (불가능할 경우 거울 앞에서 혼자 진행). (2) 2장 체크리스트 20항목을 체크하고, 미달 항목에 대해 추가 학습 계획을 세운다. (3) 5장 자기 진단 가이드의 점수를 산출한다 | 2h |

**Week 4 완료 기준:** 다음을 수행할 수 있어야 한다.
- 2분 시스템 소개를 자연스럽게 구술할 수 있다
- 아키텍트 체크리스트 20항목 중 16항목 이상을 체크할 수 있다
- 임의의 심화 질문에 대해 관련 문서와 코드 위치를 30초 내에 안내할 수 있다

---

## 2. 아키텍트 체크리스트 (20항목)

> 각 항목에 대해 "확인"(코드/설정에서 직접 검증 가능) 또는 "추정"(문서/패턴 분석 기반)을 표시했다.
> 체크하려면 해당 항목을 **코드나 설정 파일에서 직접 확인**했거나, **구두로 3문장 이상 설명**할 수 있어야 한다.

### A. 시스템 구조 (문서 01, 02)

- [ ] **A1.** Next.js 16 App Router 기반 BFF 모놀리스 아키텍처를 다이어그램 없이 구두로 설명할 수 있다. Server Component(RSC), Client Component(CC), Server Action의 역할 분담을 설명할 수 있다. `[확인: 01_system_overview 2장]`

- [ ] **A2.** src/ 내부 구조(app/, components/, lib/, middleware.ts)의 각 폴더 책임과 의존 방향을 설명할 수 있다. Route Group `(auth)` vs `(main)`의 분리 목적을 설명할 수 있다. `[확인: 02_folder_responsibility 2장]`

- [ ] **A3.** 17개 Server Action 파일의 역할을 전부 열거할 수 있다. `assessment-config.ts`가 허브 파일로서 7개 모듈에 의존되는 구조를 설명할 수 있다. `[확인: 02_folder_responsibility 4장]`

- [ ] **A4.** 외부 시스템 3개(Supabase Auth/DB/Storage, Judge0, Google Cloud TTS)의 연동 방식과 통신 프로토콜을 설명할 수 있다. `[확인: 01_system_overview 9장, 05_network 1장]`

### B. 런타임 흐름 (문서 03)

- [ ] **B1.** 로그인 → Middleware(인증+RBAC+온보딩) → Dashboard 렌더링까지의 전체 흐름을 시퀀스로 설명할 수 있다. Middleware에서 `auth.getUser()`가 매 요청마다 호출되는 이유를 설명할 수 있다. `[확인: 03_runtime_flow 2장]`

- [ ] **B2.** Code Submission → Judge0 polling → 결과 저장 흐름에서, polling 방식의 장단점과 WebSocket 대안을 설명할 수 있다. `[확인: 03_runtime_flow 4장]`

- [ ] **B3.** `recalculateUserScores()` 함수의 8개 순차 쿼리 파이프라인을 설명할 수 있다. 트랜잭션 부재로 인한 부분 갱신 리스크를 설명할 수 있다. `[확인: 03_runtime_flow 6장, 04_data 4장]`

### C. 데이터 아키텍처 (문서 04)

- [ ] **C1.** 48개 마이그레이션의 6-Phase 진화(Core Foundation → 등급+랭킹 → 안정화+Assessment → 콘텐츠 확장+멘토링 → 콘텐츠 관리 고도화 → CS지식+국제화)를 설명할 수 있다. `[확인: 04_data_architecture 1장]`

- [ ] **C2.** 42개 테이블의 카테고리 분류와 주요 FK 관계를 ERD 수준으로 설명할 수 있다. `profiles` 테이블이 10개 이상의 다른 테이블에서 참조되는 중심 엔티티임을 설명할 수 있다. `[확인: 04_data_architecture 2~3장]`

- [ ] **C3.** DB_Schema.md 대비 13개 스키마 갭(미구현 테이블 vs 신규 추가 테이블)을 설명할 수 있다. 시드 구조(36파일, ~14,400 레코드)와 운영 스크립트(merge-seeds, apply-seeds)의 역할을 설명할 수 있다. `[확인: 04_data_architecture 6~7장]`

### D. 보안 (문서 05, 06)

- [ ] **D1.** 3-Layer RBAC(Middleware → Server Action → RLS)의 각 레이어 역할과, 레이어 간 갭(Middleware에서 `/api/*` 경로 보호 부재 등)을 설명할 수 있다. `[확인: 06_security_design 2장]`

- [ ] **D2.** Service Role Key가 RLS를 우회하는 15개 사용 지점을 파악하고, 각각의 필요성과 리스크를 설명할 수 있다. `[확인: 06_security_design 3장]`

- [ ] **D3.** 12개 보안 갭(G1-G12) 중 상위 3개(Judge0 인증 미설정, Docker privileged 모드, Service Role Key 노출 리스크)의 공격 시나리오와 대응 방안을 설명할 수 있다. `[확인: 06_security_design 5장]`

### E. 도메인 모델 (문서 07)

- [ ] **E1.** 3개 시험 시스템(Regular Quiz / Assessment / Comprehensive Exam)의 트리거, 문제 풀 구성, 채점 방식, 결과 활용처 차이를 표로 정리하여 설명할 수 있다. `[확인: 07_exam_and_domain 3장]`

- [ ] **E2.** 5축 레이더 점수 산정 로직에서, 각 축의 입력 데이터(quiz_attempts, code_submissions 등)와 가중치, 계산 공식을 설명할 수 있다. Assessment 점수가 가중치를 갖는 이유를 설명할 수 있다. `[확인: 07_exam_and_domain 4장]`

- [ ] **E3.** Paiza식 코딩 랭크(D→S) 승급 시스템의 시험 풀 구성, 합격 기준, 등급별 배지 시스템을 설명할 수 있다. `[확인: 07_exam_and_domain 5장]`

### F. 확장성 & 리팩토링 (문서 08, 09)

- [ ] **F1.** 품질 속성 매트릭스 8개 항목의 현재 수준과 목표 수준의 갭을 설명할 수 있다. 갭이 가장 큰 항목(테스트 용이성 -3)의 구체적 근거를 3개 이상 제시할 수 있다. `[확인: 08_scalability 1장]`

- [ ] **F2.** 4대 성능 병목(scores.ts 순차 쿼리, Judge0 polling, 페이지네이션 부재, TTS 순차 합성)의 원인과 해결 방안을 각각 설명할 수 있다. `[확인: 08_scalability 2장]`

- [ ] **F3.** God Function 3개의 리팩토링 방안(모듈 분리, 책임 분리, Promise.all 병렬화)과 5개 Quick Win의 우선순위를 설명할 수 있다. "마이크로서비스가 아닌 모놀리스 유지"를 추천하는 근거를 설명할 수 있다. `[확인: 09_refactoring 1~4장]`

---

## 3. 인터뷰 스크립트

### 3.1 2분 시스템 소개 스크립트

> 아래 스크립트는 기술 면접이나 인수인계 미팅에서 J-Bridge 시스템을 처음 소개할 때 사용한다. 2분 내에 완료하는 것을 목표로 한다.

---

**[도입 — 15초]**

J-Bridge는 한국인 IT 엔지니어를 교육하여 일본 기업에 파견하기 위한 **사내 LMS**입니다. 초대 전용 시스템으로, Admin이 계정을 생성하고, Mentor와 Mentee 3계층 RBAC로 역할을 분리합니다. 핵심 목표는 파견 준비도를 **5축 레이더 차트**와 **Paiza식 코딩 등급(S~D)**으로 정량적으로 측정하는 것입니다.

**[아키텍처 — 30초]**

기술적으로는 **Next.js 16 App Router 기반의 풀스택 모놀리스**입니다. Next.js가 BFF(Backend For Frontend) 역할을 하며, Server Component에서 데이터를 조회하고, Client Component에 props로 전달하는 패턴을 따릅니다. 모든 데이터 변경은 17개의 **Server Action** 파일에서 수행됩니다.

백엔드는 **Supabase**가 담당합니다. PostgreSQL 데이터베이스에 42개 테이블, Auth는 GoTrue 기반 JWT, Storage는 TTS 오디오 캐시에 사용됩니다. 코드 실행은 **Judge0** Docker 컨테이너에서 수행되며, 음성 합성은 **Google Cloud TTS API**를 호출합니다.

**[핵심 도메인 — 45초]**

도메인은 4계층으로 구성됩니다. **LMS**(학습 콘텐츠, 코스/레슨), **시험 플랫폼**(Regular Quiz, Assessment, Comprehensive Exam 3종 시험 + 코딩 제출), **HR 평가**(5축 레이더 점수 + Paiza 코딩 랭크 + 시즌 랭킹), **멘토링**(Mentor-Mentee 매칭, 과제 배정, 피드백).

5축 레이더 차트는 生活日本語, ビジネス日本語, CS知識, 開発実務能力, ビジネスリテラシー 5개 축으로 구성됩니다. 각 축의 점수는 퀴즈 성적, 코드 제출 합격률, 코딩 등급 시험 결과를 **가중 평균**하여 산출됩니다. 이 점수는 `recalculateUserScores()` 함수에서 8개의 DB 쿼리를 순차 실행하여 계산되는데, 이것이 현재 가장 큰 성능 병목입니다.

**[보안과 과제 — 30초]**

보안은 3-Layer RBAC로 설계되어 있습니다. Edge Middleware에서 경로 보호, Server Action에서 역할 검증, PostgreSQL RLS에서 행 단위 접근 제어를 수행합니다. 다만 Judge0의 인증 미설정, Docker privileged 모드 등 12개 보안 갭이 식별되어 있습니다.

현재 ~30명 규모에 최적화되어 있으며, 100명 이상으로 확장하려면 점수 재계산 병렬화, 페이지네이션 완전 적용, 모니터링 인프라 구축이 필요합니다. 테스트 코드가 0건이고 `ignoreBuildErrors: true`가 설정되어 있어, 품질 기반 확보가 최우선 과제입니다.

---

### 3.2 심화 인터뷰 시나리오 (5개)

---

#### 시나리오 1: "점수 재계산 로직에 버그가 발생했습니다. 디버깅 절차를 설명해주세요."

**모범 답변:**

먼저 점수 재계산의 전체 흐름을 설명하겠습니다. `recalculateUserScores()` 함수는 `src/app/actions/scores.ts`의 L18-262에 위치하며, 단일 사용자에 대해 8개의 순차 DB 쿼리를 실행합니다.

**디버깅 절차는 다음과 같습니다:**

**1단계 — 입력 데이터 확인:** Q1(profiles)에서 `is_japanese` 플래그를 확인합니다. 이 값에 따라 점수 계산 경로가 갈립니다. Q2(quiz_attempts)에서 해당 사용자의 시험 이력이 올바르게 JOIN되는지 확인합니다. 특히 `is_assessment` 구분이 정확한지 확인합니다.

**2단계 — 축별 계산 로직 검증:** 5축 각각의 계산을 격리하여 검증합니다. 예를 들어 Axis 1(生活日本語)이 문제라면, L76-99 구간에서 JLPT 관련 퀴즈의 `score`와 `total_questions` 값을 직접 쿼리하여 가중 평균 결과를 수동 계산하고, 함수 출력값과 비교합니다.

**3단계 — 쓰기 작업 검증:** Q5-Q8의 UPSERT/INSERT 결과를 DB에서 직접 확인합니다. 여기서 **트랜잭션이 없다는 점**이 중요합니다. Q5(japanese_skills UPSERT)는 성공했지만 Q7(attitude_culture_skills UPSERT)에서 실패한 경우, 부분 갱신 상태가 됩니다. 이런 경우 해당 사용자의 3개 스킬 테이블 타임스탬프를 비교하여 불일치를 발견할 수 있습니다.

**4단계 — 재현 및 수정:** 문제가 발생한 사용자의 ID로 함수를 다시 호출하여 재현합니다. 현재 에러 로깅이 없기 때문에(`fire-and-forget` 패턴, `.catch(() => {})`), 가장 먼저 해야 할 일은 각 쿼리 단계에 로깅을 추가하는 것입니다. 이것이 09_refactoring_candidates.md에서 Quick Win #1으로 제안된 "에러 로깅 추가"입니다.

**근본 해결책으로는** scoring 모듈 분리(09문서 3.1절)를 통해 축별 계산을 독립 함수로 만들고, 단위 테스트를 작성하는 것을 제안합니다. 또한 Supabase RPC 함수를 이용한 트랜잭션 래핑으로 부분 갱신 문제를 해결해야 합니다.

---

#### 시나리오 2: "사용자 수가 100명으로 늘어났을 때 예상되는 문제와 대응 방안을 설명해주세요."

**모범 답변:**

08_scalability_analysis.md의 분석에 따르면, 현재 아키텍처는 **~30명에서 안정적, ~50명에서 모니터링 필요, ~100명에서 병목이 시작**됩니다.

**예상 문제 1 — 점수 재계산 타임아웃:**
`recalculateAllScores()`는 전체 사용자에 대해 순차적으로 `recalculateUserScores()`를 호출합니다. 100명이면 800개 쿼리가 순차 실행되어 **20~64초**가 소요됩니다. Vercel 함수의 기본 타임아웃은 10초이므로, 실행이 완료되지 않습니다.

대응: (1) 읽기 쿼리 4개를 `Promise.all`로 병렬화하면 RTT가 4배에서 1배로 줄어듭니다. (2) 배치 재계산을 Supabase Edge Function이나 Cron Job으로 옮겨 타임아웃 제약을 해소합니다.

**예상 문제 2 — Judge0 동시 실행 제한:**
Judge0 Docker 컨테이너의 Workers 수가 기본값(2~4개)이면, 100명 중 10명이 동시에 코드를 제출하면 큐잉 지연이 발생합니다. Polling 방식(500ms 간격)이므로 최악의 경우 사용자가 30초 이상 대기할 수 있습니다.

대응: (1) Workers 수를 서버 사양에 맞게 증가합니다. (2) Polling 대신 Judge0의 Webhook callback을 활용하여 서버 부하를 줄입니다. (3) 동시 제출 수 제한(rate limiting)을 도입합니다.

**예상 문제 3 — DB 쿼리 성능 저하:**
`quiz_attempts`, `code_submissions` 테이블의 행 수가 사용자 수에 비례하여 증가합니다. 현재 일부 테이블에 복합 인덱스가 누락되어 있어(04문서 5장), 쿼리 성능이 선형적으로 저하됩니다.

대응: (1) 04문서에서 제안한 7개 추가 인덱스를 적용합니다. (2) 페이지네이션이 미적용된 관리자 페이지에 커서 기반 페이지네이션을 도입합니다.

**예상 문제 4 — Supabase 무료 플랜 한계:**
무료 플랜의 DB 크기(500MB), API 요청 수, Auth 동시 세션 제한에 도달할 수 있습니다.

대응: Supabase Pro 플랜($25/월)으로 전환합니다. 08문서 8장에서 분석한 바에 따르면, 100명 규모에서의 월간 인프라 비용은 약 $50~100 수준으로 추정됩니다.

---

#### 시나리오 3: "Judge0에서 보안 침해가 발생했습니다. 원인 분석과 대응 방안을 설명해주세요."

**모범 답변:**

06_security_design.md와 05_network_and_infrastructure.md의 분석에 따르면, Judge0는 현재 **3가지 주요 보안 리스크**를 가지고 있습니다.

**1. 인증 미설정 (G1):**
`judge0/client.ts:L2`에서 Judge0 API 호출 시 인증 토큰이 설정되지 않았습니다. Judge0가 `localhost:2358`에서 리스닝하고 있으므로, 서버에 접근 가능한 모든 프로세스가 코드 실행을 요청할 수 있습니다.

**2. Docker privileged 모드 (G2):**
`judge0/docker-compose.yml`에서 `privileged: true`로 설정되어 있습니다. 이는 컨테이너가 호스트의 모든 디바이스에 접근할 수 있음을 의미하며, 컨테이너 탈출(container escape) 공격의 가능성을 열어둡니다.

**3. 코드 실행 샌드박스 신뢰도:**
사용자가 제출한 코드가 Judge0 Worker 내에서 실행되는데, `privileged: true` 모드에서는 Worker의 격리가 약화됩니다.

**침해 발생 시 대응 절차:**

**즉시 대응:** (1) Judge0 Docker 컨테이너를 즉시 중지합니다 (`docker-compose down`). (2) 호스트 서버의 프로세스 목록과 네트워크 연결을 확인하여 비정상 활동을 식별합니다. (3) Judge0 Postgres DB의 제출 이력을 확인하여 악성 코드 패턴을 분석합니다.

**근본 대응:** (1) `judge0.conf`에서 `AUTHN_TOKEN`과 `AUTHZ_TOKEN`을 설정하고, `judge0/client.ts`에서 인증 헤더를 추가합니다. (2) `docker-compose.yml`에서 `privileged: true`를 제거하고, 필요한 capability만 명시적으로 부여합니다 (`cap_add: [SYS_PTRACE]` 등). (3) Docker 네트워크를 분리하여 Judge0가 외부 네트워크에 접근하지 못하도록 합니다. (4) 코드 실행 시간 제한(timeout)과 메모리 제한(memory limit)을 엄격하게 설정합니다.

이러한 보안 강화는 06문서 7장의 Phase 1 "즉시 적용" 항목에 해당하며, 배포 전 반드시 적용해야 합니다.

---

#### 시나리오 4: "테스트 코드가 0건인 상황에서 리팩토링을 진행해야 합니다. 전략을 설명해주세요."

**모범 답변:**

현재 J-Bridge는 **테스트 프레임워크 미설치, 단위/통합/E2E 테스트 0건, CI/CD 미구성** 상태입니다 (08_scalability_analysis.md 1장, 테스트 용이성 갭 -3). 이 상태에서 무작정 리팩토링을 시작하면 회귀 버그를 감지할 수 없으므로, **테스트 → 리팩토링** 순서가 아닌 **리팩토링과 테스트를 동시에 점진적으로 진행**하는 전략이 필요합니다.

**Phase 1 (1~2주) — 안전망 구축:**

09_refactoring_candidates.md 6장의 10주 로드맵에서 Week 1~2에 해당합니다.

(1) Vitest를 설치하고 기본 설정을 구성합니다. (2) `next.config.ts`의 `ignoreBuildErrors: true`를 제거하고, 빌드 에러를 모두 수정합니다. 이것이 가장 시급한 Quick Win입니다. (3) 가장 리스크가 낮은 순수 함수부터 테스트를 작성합니다. `scores.ts` 내부의 `avg()` 헬퍼, `assessment-config.ts`의 상수 검증 등이 좋은 출발점입니다.

**Phase 2 (3~4주) — God Function 분리 + 단위 테스트:**

(1) `recalculateUserScores()` 245줄 함수를 scoring 모듈로 분리합니다(09문서 1.1절의 제안 구조). 분리 시 각 축별 계산 함수(axis-jlpt.ts, axis-it-japanese.ts 등)에 대한 단위 테스트를 **분리와 동시에** 작성합니다. (2) `admin.ts` 432줄/15함수를 도메인별로 분리합니다(user-management.ts, content-management.ts, task-management.ts).

**Phase 3 (5~6주) — 통합 테스트 + DB 리팩토링:**

(1) Server Action의 주요 흐름(퀴즈 제출 → 채점 → 점수 재계산)에 대한 통합 테스트를 작성합니다. (2) Supabase RPC 함수를 이용하여 `scores.ts`의 4개 쓰기 쿼리를 트랜잭션으로 래핑합니다. (3) 04문서에서 제안한 7개 추가 인덱스를 적용합니다.

핵심 원칙은 **"리팩토링할 코드에만 테스트를 작성한다"**입니다. 전체 코드베이스의 테스트 커버리지를 높이는 것이 아니라, 변경할 코드의 동작을 먼저 테스트로 고정(characterization test)한 후 리팩토링하는 것입니다.

---

#### 시나리오 5: "새 팀원이 합류했습니다. 이 시스템의 핵심 설계 의사결정 3가지를 설명해주세요."

**모범 답변:**

J-Bridge의 핵심 설계 의사결정 3가지를 근거와 함께 설명하겠습니다.

**의사결정 1 — Next.js App Router 모놀리스 + Supabase BaaS 조합 선택**

J-Bridge는 Next.js를 BFF로 사용하고, Supabase가 DB/Auth/Storage 전체를 담당하는 구조입니다. 별도의 백엔드 서버(Express, NestJS 등)를 두지 않았습니다.

이 결정의 장점은 (1) 소규모 팀(1~2명)으로도 풀스택 개발이 가능하고, (2) 인프라 관리 부담이 최소화되며, (3) Server Actions로 API 레이어 없이 직접 DB를 조작할 수 있어 개발 속도가 빠릅니다.

트레이드오프는 (1) Supabase에 대한 **단일 의존(vendor lock-in)**이 발생하고, (2) 복잡한 비즈니스 로직(점수 재계산 등)을 Server Action에 넣게 되어 **God Function 문제**가 발생했으며, (3) 테스트 환경 구축이 어려워졌습니다(Supabase 로컬 에뮬레이터 필요).

09_refactoring_candidates.md 4장에서도 분석한 바와 같이, 현재 규모(30명 이하)에서는 **모놀리스 유지가 올바른 선택**입니다.

**의사결정 2 — 5축 레이더 차트 + Paiza식 코딩 랭크 이중 평가 체계**

J-Bridge는 일반적인 LMS의 "합격/불합격" 방식이 아니라, 5축 레이더로 종합 역량을, Paiza식 등급(S~D)으로 코딩 역량을 **별도로** 측정합니다.

이 결정의 근거는 (1) 파견처 매칭 시 "이 엔지니어는 일본어는 강하지만 코딩은 보통"과 같은 **다차원 프로파일**이 필요하고, (2) Paiza(パイザ)는 일본 IT 업계에서 인지도가 높은 코딩 테스트 서비스로, 같은 등급 체계를 사용하면 파견처에서 직관적으로 이해할 수 있기 때문입니다.

구현상으로는 `recalculateUserScores()` 함수가 5축 전체를 한 번에 재계산하는 **monolithic scoring** 방식을 채택했습니다. 이로 인해 245줄 God Function이 되었지만, 5축 점수 간 정합성(같은 시점의 데이터로 계산)을 보장하는 장점이 있습니다.

**의사결정 3 — RLS 기반 행 단위 보안 + Server Action 역할 검증 이중 보안**

대부분의 웹 앱이 API 레벨에서만 권한 검사를 하는 것과 달리, J-Bridge는 PostgreSQL RLS 정책으로 DB 레벨에서도 접근 제어를 수행합니다.

이 결정의 장점은 (1) Server Action에서 실수로 권한 검사를 누락하더라도 RLS가 안전망 역할을 하고, (2) Supabase 클라이언트 라이브러리가 직접 DB에 접근하는 경우(Client Component에서의 실시간 쿼리 등)에도 보안이 유지됩니다.

트레이드오프는 (1) RLS 정책이 48개 마이그레이션에 분산되어 전체상을 파악하기 어렵고, (2) 06_security_design.md에서 분석한 바와 같이 **RLS 누락이 5개 테이블에서 발견**되었으며, (3) Service Role Key가 15곳에서 RLS를 우회하여 보안 경계가 불명확해지는 문제가 있습니다. 이 문서(06)에서 제안한 3-Phase 보안 로드맵을 따라 점진적으로 개선해야 합니다.

---

## 4. 학습 팁 & 리소스

### 4.1 효과적인 학습 방법

**1. "코드 먼저, 문서 다음" 원칙:**
아키텍처 문서를 읽은 후 반드시 해당 코드 파일을 열어서 직접 확인한다. 문서의 설명과 실제 코드가 다른 경우(CLAUDE.md의 "Next.js 14" vs 실제 16.x 등), 코드가 항상 정확하다(truth source). 문서에서 "확인"으로 표시된 항목은 코드에서 검증된 것이고, "추정"으로 표시된 항목은 반드시 코드로 재확인해야 한다.

**2. "3회 반복" 학습법:**
각 런타임 흐름(03문서)은 최소 3번 학습한다.
- 1회차: 문서의 시퀀스 다이어그램을 읽으며 전체 흐름을 파악한다
- 2회차: 코드를 열어 각 단계의 실제 구현을 확인한다
- 3회차: 문서와 코드 없이 화이트보드에 시퀀스를 직접 그려본다

**3. "설명할 수 없으면 이해한 것이 아니다" 원칙:**
각 주차의 완료 기준 질문에 대해, 혼자서(또는 동료에게) 소리 내어 답하는 연습을 한다. 막히는 부분이 이해가 부족한 지점이다.

**4. 핵심 숫자 암기:**
아래 숫자들은 인터뷰나 설계 논의에서 즉시 인용할 수 있어야 한다.

| 숫자 | 의미 | 출처 |
|:-----|:-----|:-----|
| 42 | 총 테이블 수 | 04문서 2장 |
| 48 | 총 마이그레이션 수 | 04문서 1장 |
| 17 | Server Action 파일 수 | 02문서 2.2절 |
| 60 | page.tsx (라우트) 수 | 02문서 2.1절 |
| 160 | src/ 내 ts/tsx 파일 수 | 02문서 1장 |
| 245 | recalculateUserScores() 줄 수 | 09문서 1.1절 |
| 8 | 점수 재계산 시 순차 DB 쿼리 수 | 03문서 6장 |
| 5 | 레이더 차트 축 수 | 07문서 4장 |
| 3 | 시험 시스템 종류 수 | 07문서 3장 |
| 12 | 식별된 보안 갭 수 | 06문서 5장 |
| 15 | Service Role Key 사용 지점 수 | 06문서 3장 |
| 30 | 최적 운영 사용자 수 (추정) | 08문서 4장 |
| 0 | 테스트 코드 수 | 08문서 1장 |

### 4.2 주요 파일 위치 가이드

학습 중 가장 자주 참조하게 될 파일들이다.

| 파일 | 역할 | 빈도 |
|:-----|:-----|:----:|
| `src/app/actions/scores.ts` | 5축 점수 재계산 (God Function) | 매우 높음 |
| `src/app/actions/comprehensive-exam.ts` | 종합시험 생명주기 | 높음 |
| `src/app/actions/admin.ts` | 관리자 CRUD (15함수) | 높음 |
| `src/middleware.ts` | 인증 + RBAC + 온보딩 분기 | 높음 |
| `src/lib/assessment-config.ts` | 등급/시험 설정 (허브 파일) | 높음 |
| `src/lib/supabase/client.ts` | Supabase SSR 클라이언트 생성 | 보통 |
| `src/lib/judge0/client.ts` | Judge0 API 클라이언트 + Polling | 보통 |
| `src/app/api/tts/route.ts` | TTS API Route (캐시 + 합성) | 보통 |
| `judge0/docker-compose.yml` | Judge0 Docker 구성 | 보통 |
| `supabase/migrations/` | DB 마이그레이션 전체 | 참조용 |

### 4.3 추가 학습 리소스

| 주제 | 리소스 | 용도 |
|:-----|:------|:-----|
| Next.js App Router | Next.js 공식 문서 (App Router 섹션) | Server Component, Server Action 패턴 이해 |
| Supabase RLS | Supabase 공식 문서 (Row Level Security) | RLS 정책 작성법, SECURITY DEFINER 이해 |
| Judge0 | Judge0 CE GitHub README + API Docs | API 엔드포인트, 설정 옵션, Webhook 지원 여부 |
| CQRS 패턴 | Martin Fowler "CQRS" 문서 | Command/Query 분리 원칙 |
| DDD | Eric Evans "Domain-Driven Design" 핵심 개념 | Aggregate, Bounded Context 이해 |
| PostgreSQL | PostgreSQL 공식 문서 (트랜잭션, 인덱스) | RPC 함수 트랜잭션, 인덱스 전략 |

---

## 5. 자기 진단 가이드

### 5.1 주차별 자기 진단 체크

각 주차 완료 시 아래 항목을 0~5점으로 자기 평가한다.

#### Week 1 진단 (시스템 전체상)

| # | 진단 항목 | 점수 (0-5) | 기준 |
|:-:|:---------|:----------:|:-----|
| 1 | Next.js App Router + BFF 아키텍처를 3분 이내에 설명할 수 있다 | _ / 5 | 5: 다이어그램 없이 완벽 설명, 3: 핵심은 설명 가능, 1: 용어만 알고 있음 |
| 2 | src/ 폴더 구조와 각 폴더의 역할을 열거할 수 있다 | _ / 5 | 5: 전체 구조 암기, 3: 주요 폴더 설명 가능, 1: 대략적 구조만 파악 |
| 3 | 6개 런타임 흐름 중 3개 이상을 시퀀스로 설명할 수 있다 | _ / 5 | 5: 6개 모두, 3: 3~4개, 1: 1~2개 |
| 4 | Server Component / Client Component / Server Action 구분을 설명할 수 있다 | _ / 5 | 5: 코드 예시와 함께 설명, 3: 개념 설명 가능, 1: 차이를 모호하게 알고 있음 |

**Week 1 합격 기준: 평균 3.5점 이상**

#### Week 2 진단 (데이터와 보안)

| # | 진단 항목 | 점수 (0-5) | 기준 |
|:-:|:---------|:----------:|:-----|
| 1 | 48개 마이그레이션의 6-Phase 진화를 설명할 수 있다 | _ / 5 | 5: 각 Phase의 핵심 변경사항까지, 3: Phase 명칭과 대략적 범위, 1: Phase 수만 알고 있음 |
| 2 | 3-Layer RBAC의 각 레이어 역할과 갭을 설명할 수 있다 | _ / 5 | 5: 갭까지 포함하여 설명, 3: 3개 레이어 역할 설명 가능, 1: RBAC 개념만 알고 있음 |
| 3 | 12개 보안 갭 중 상위 5개를 나열하고 대응 방안을 제시할 수 있다 | _ / 5 | 5: 5개 이상 + 대응 방안, 3: 3~4개 나열, 1: 보안 문제가 있다는 정도만 파악 |
| 4 | 네트워크 토폴로지를 화이트보드에 그릴 수 있다 | _ / 5 | 5: 프로토콜/포트까지 포함, 3: 주요 컴포넌트 연결, 1: 대략적 구조만 그림 |

**Week 2 합격 기준: 평균 3.5점 이상**

#### Week 3 진단 (도메인과 확장성)

| # | 진단 항목 | 점수 (0-5) | 기준 |
|:-:|:---------|:----------:|:-----|
| 1 | 4-Tier 도메인 계층과 각 계층의 핵심 엔티티를 설명할 수 있다 | _ / 5 | 5: 엔티티 + FK 관계까지, 3: 4개 계층 역할, 1: 계층 명칭만 알고 있음 |
| 2 | 5축 점수 산정 공식을 수식 수준으로 설명할 수 있다 | _ / 5 | 5: 가중치 + 입력 데이터 + 계산 로직, 3: 각 축의 입력 데이터, 1: 축 이름만 알고 있음 |
| 3 | 100명 확장 시 4대 병목과 대응 방안을 설명할 수 있다 | _ / 5 | 5: 수치 근거 포함 설명, 3: 병목 나열 + 대략적 대응, 1: "느려질 것이다" 수준 |
| 4 | 품질 속성 매트릭스 8개 항목의 현재/목표 수준을 설명할 수 있다 | _ / 5 | 5: 수치 + 근거, 3: 주요 항목 설명, 1: 매트릭스 존재만 인지 |

**Week 3 합격 기준: 평균 3.5점 이상**

#### Week 4 진단 (리팩토링과 종합)

| # | 진단 항목 | 점수 (0-5) | 기준 |
|:-:|:---------|:----------:|:-----|
| 1 | God Function 3개의 문제점과 리팩토링 방안을 설명할 수 있다 | _ / 5 | 5: Before/After 구조 포함, 3: 문제점 + 대략적 방안, 1: 파일명만 알고 있음 |
| 2 | 2분 시스템 소개를 타이머 내에 완료할 수 있다 | _ / 5 | 5: 2분 내 자연스러운 완료, 3: 3분 이내 완료, 1: 5분 이상 또는 중간에 막힘 |
| 3 | 5개 심화 시나리오 중 3개 이상에 구조화된 답변을 할 수 있다 | _ / 5 | 5: 5개 모두, 3: 3~4개, 1: 1~2개 |
| 4 | 체크리스트 20항목 중 16개 이상을 체크할 수 있다 | _ / 5 | 5: 18~20개, 3: 14~17개, 1: 10개 미만 |

**Week 4 합격 기준: 평균 4.0점 이상**

### 5.2 종합 점수 산출

```
총점 = (Week1 평균 + Week2 평균 + Week3 평균 + Week4 평균) / 4

판정:
  4.5 이상  →  아키텍트 인수인계 준비 완료 (Architect Ready)
  3.5 ~ 4.4 →  핵심은 파악, 심화 학습 필요 (Core Understanding, Needs Depth)
  2.5 ~ 3.4 →  기초 수준, 추가 1~2주 학습 필요 (Foundational, Needs More Time)
  2.5 미만  →  처음부터 재학습 필요 (Restart Recommended)
```

### 5.3 약점 보완 가이드

자기 진단에서 3점 미만인 항목이 있으면 아래 표에서 해당 영역의 보완 방법을 참고한다.

| 약점 영역 | 보완 방법 | 소요 시간 |
|:---------|:---------|:---------:|
| 아키텍처 스타일 | 01문서를 다시 읽고, Next.js App Router 공식 문서의 "Thinking in Server Components" 섹션을 추가 학습한다 | 2h |
| 폴더 구조 | 02문서의 라우트 맵을 인쇄하여 벽에 붙이고, 매일 5분씩 눈으로 스캔한다 | 1h |
| 런타임 흐름 | 03문서의 시퀀스 다이어그램을 종이에 3번 직접 그려본다 | 3h |
| 데이터 아키텍처 | 04문서의 ERD를 인쇄하고, Supabase Dashboard에서 실제 테이블을 조회하며 대조한다 | 2h |
| 보안 모델 | 06문서의 RLS 매트릭스를 인쇄하고, 마이그레이션 SQL을 직접 읽으며 정책을 확인한다 | 3h |
| 도메인/시험 | 07문서의 3개 시험 비교표를 직접 재작성하고, `scores.ts` 코드를 한 줄씩 따라간다 | 3h |
| 확장성 | 08문서의 수치(30/50/100명 시나리오)를 암기하고, 각 병목의 원인-결과를 인과 관계로 정리한다 | 2h |
| 리팩토링 | 09문서의 God Function 3개를 직접 코드로 열어보고, 제안된 분리 구조를 자신만의 방식으로 설계해본다 | 3h |

---

## 6. 교차 참조 인덱스

### 6.1 문서별 핵심 주제 인덱스

| 문서 | 핵심 주제 | 관련 문서 |
|:-----|:---------|:---------|
| **01. System Overview** | App Router BFF 모놀리스, CQRS-Lite 패턴, RSC/CC/Server Action 구분, 외부 시스템 통합(Supabase/Judge0/TTS), 기술 부채(ignoreBuildErrors, 테스트 0건) | 02(폴더 구조), 03(런타임 흐름), 05(네트워크), 08(기술 부채 상세) |
| **02. Folder Responsibility** | 프로젝트 루트/src 내부 구조, Route Group, 60개 라우트 맵, assessment-config.ts 허브, 파일별 Server/Client 분류, 변경 빈도 추정 | 01(아키텍처 스타일), 03(흐름별 파일 위치), 09(리팩토링 대상 파일) |
| **03. Runtime Flow** | 6개 시퀀스 다이어그램(로그인, 종합시험, Judge0, TTS, 점수 재계산, 퀴즈), 성능 병목, 에러 처리 경로 | 01(시스템 구조), 05(네트워크 경로), 07(시험 도메인), 08(성능 병목 수치) |
| **04. Data Architecture** | 48 마이그레이션 6-Phase, 42 테이블 인벤토리, ASCII ERD, 트랜잭션 부재, 28 인덱스 + 7 제안, 시드 구조, 스키마 갭 13개 | 06(RLS 정책), 07(도메인 엔티티), 09(DB 리팩토링) |
| **05. Network & Infrastructure** | ASCII 네트워크 토폴로지, 64 Server Action + 3 API Route 카탈로그, JWT 쿠키 인증, Judge0 네트워크 리스크, 장애 모드 분석, 환경 변수 카탈로그 | 01(외부 시스템), 03(통신 흐름), 06(네트워크 보안) |
| **06. Security Design** | RLS 매트릭스 42 테이블, 3-Layer RBAC, is_admin/is_mentor 헬퍼, Service Role Key 15 사용점, quiz_question_options_safe VIEW, 12 보안 갭(G1-G12), STRIDE 위협 모델, 3-Phase 보안 로드맵 | 04(RLS 마이그레이션), 05(Judge0 보안), 08(보안 품질 속성) |
| **07. Exam & Domain Model** | 4-Tier 도메인 계층, DDD 엔티티/Aggregate, 3개 시험 시스템 비교, 5축 점수 산정 공식(가중치/입력/계산), Paiza 코딩 랭크 D→S, 랭킹 시스템(3개월 시즌), 점수 갱신 트리거, 도메인 이벤트 | 03(시험 런타임), 04(시험 테이블), 09(scores.ts 리팩토링) |
| **08. Scalability Analysis** | 품질 속성 매트릭스 8항목(1-5), 4대 성능 병목, 확장 한계(30/50/100명), 모니터링 전략, 리스크 매트릭스, 3-Tier 확장 전략, 비용 최적화 | 03(병목 흐름), 05(인프라 제약), 09(개선 로드맵) |
| **09. Refactoring Candidates** | God Function 3개(scores 245줄, exam 462줄, admin 432줄), Quick Win 5개, 모듈 분리 3개(scoring/tts/notification), 마이크로서비스 불필요 근거, DB 리팩토링 5개, 10주 코드 품질 로드맵, 리스크 평가 매트릭스 | 03(God Function 런타임), 04(DB 리팩토링), 08(품질 갭) |
| **10. Learning Roadmap** (본 문서) | 4주 학습 로드맵, 20항목 체크리스트, 2분 인터뷰 스크립트, 5개 심화 시나리오, 자기 진단 가이드 | 전체 문서 종합 |

### 6.2 주제별 교차 참조 매트릭스

주요 기술 주제가 어떤 문서에서 다루어지는지를 보여준다.

| 주제 | 01 | 02 | 03 | 04 | 05 | 06 | 07 | 08 | 09 |
|:-----|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| App Router / BFF | **주** | 부 | 부 | - | - | - | - | - | - |
| Server Actions | 부 | **주** | **주** | - | 부 | 부 | - | - | **주** |
| Supabase 연동 | **주** | - | 부 | **주** | **주** | **주** | - | 부 | 부 |
| Judge0 | 부 | - | **주** | - | **주** | **주** | - | 부 | - |
| TTS | 부 | - | **주** | - | 부 | - | - | 부 | 부 |
| RLS / 보안 | - | - | - | 부 | 부 | **주** | - | 부 | - |
| 3-Layer RBAC | 부 | - | 부 | - | - | **주** | - | - | - |
| 5축 점수 | 부 | - | **주** | - | - | - | **주** | 부 | **주** |
| 시험 시스템 | - | - | **주** | 부 | - | - | **주** | - | - |
| Paiza 코딩 랭크 | 부 | - | - | 부 | - | - | **주** | - | - |
| 성능 병목 | - | - | **주** | 부 | - | - | - | **주** | **주** |
| 기술 부채 | **주** | 부 | - | 부 | - | 부 | - | **주** | **주** |
| 리팩토링 | - | - | - | 부 | - | - | - | 부 | **주** |

> **주** = 해당 주제의 주요 분석 문서, **부** = 부분적으로 언급, **-** = 미다룸

### 6.3 학습 경로 추천

학습 목적에 따라 문서 읽기 순서를 다르게 할 수 있다.

**경로 A: 전체상 우선 (권장, 본 로드맵 기본 경로)**
```
01 → 02 → 03 → 04 → 06 → 05 → 07 → 08 → 09
```
시스템 구조 → 코드 구조 → 런타임 → 데이터 → 보안 → 인프라 → 도메인 → 확장성 → 리팩토링

**경로 B: 보안 우선 (보안 감사가 급한 경우)**
```
06 → 05 → 01 → 04 → 03 → 07 → 08 → 09 → 02
```
보안 갭 먼저 파악 → 인프라 리스크 → 시스템 이해 → 데이터 → 나머지

**경로 C: 도메인 우선 (비즈니스 로직 이해가 급한 경우)**
```
07 → 03 → 04 → 01 → 02 → 09 → 08 → 06 → 05
```
도메인 모델 먼저 → 런타임 흐름 → 데이터 → 시스템 → 리팩토링 → 나머지

---

> **문서 끝.** 본 문서는 01~09 아키텍처 문서 시리즈의 최종 종합편이다. 4주 학습을 완료한 후에는 실제 코드 수정 경험을 통해 지식을 내재화하는 것을 권장한다. 첫 번째 실전 과제로는 09문서의 Quick Win #1 "에러 로깅 추가"가 적절하다.
