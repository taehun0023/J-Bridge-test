# 01. 시스템 개요 (System Overview)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Tech Lead
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 1. 프로젝트 요약

J-Bridge는 한국인 IT 엔지니어를 교육하여 일본 기업에 파견(派遣/Haken)하기 위한 **사내 LMS(Learning Management System)**이다. Paiza(パイザ)식 코딩 등급제(S/A/B/C/D)를 사내용으로 도입하여, 5축 레이더 차트 기반의 **파견 준비도(Dispatch Readiness)**를 정량적으로 측정한다.

| 항목 | 내용 |
|------|------|
| **비즈니스 모델** | 교육 수료생의 일본 파견 계약 체결 시 수수료 수익 |
| **사용자** | 초대 전용 (Admin이 계정 생성, self-signup 불가) |
| **역할** | `admin` / `mentor` / `mentee` 3계층 RBAC |
| **등급 활용** | 사내 인사 평가 + 파견처 매칭 참고용 (외부 취업 연계 없음) |

---

## 2. 아키텍처 스타일 분석

### 2.1 App Router 기반 모놀리스 + BFF 패턴

J-Bridge는 **Next.js 16 (App Router)** 기반의 풀스택 모놀리스 아키텍처를 채택하고 있다. Next.js가 Backend For Frontend(BFF) 역할을 수행하며, Supabase가 실질적인 데이터 레이어를 담당한다.

```
┌────────────────────────────────────────────────────────────────┐
│                    Next.js Monolith (BFF)                       │
│                                                                │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────────────┐    │
│  │   Pages /    │  │   Server     │  │    API Routes      │    │
│  │   Layouts    │  │   Actions    │  │  (Route Handlers)  │    │
│  │  (RSC+CC)   │  │  ('use       │  │   /api/tts         │    │
│  │             │  │   server')   │  │   /api/admin/*     │    │
│  └──────┬──────┘  └──────┬───────┘  └────────┬───────────┘    │
│         │                │                    │                │
│         ▼                ▼                    ▼                │
│  ┌─────────────────────────────────────────────────────┐      │
│  │              Queries / Lib Layer                     │      │
│  │   queries/*.ts  │  judge0/client.ts  │  ranking.ts   │      │
│  └──────────────────────────┬──────────────────────────┘      │
│                             │                                  │
└─────────────────────────────┼──────────────────────────────────┘
                              │
              ┌───────────────┼───────────────┐
              ▼               ▼               ▼
      ┌──────────┐   ┌──────────────┐  ┌──────────┐
      │ Supabase │   │   Judge0     │  │ Google   │
      │ (DB/Auth │   │  (Code       │  │ Cloud    │
      │ /Storage)│   │  Execution)  │  │ TTS API  │
      └──────────┘   └──────────────┘  └──────────┘
```

**확인:** `package.json:L17` 기준 Next.js 16.1.6 (React 19.2.3) 사용. CLAUDE.md에는 "Next.js 14"로 기록되어 있으나, 실제 설치 버전은 **16.x**이다.

### 2.2 Server Components vs Client Components 구분

| 구분 | 역할 | 식별 방법 | 대표 파일 |
|------|------|-----------|-----------|
| **Server Component (RSC)** | 데이터 페칭, 인증 확인, 레이아웃 구성 | `'use client'` 미선언 | `src/app/(main)/layout.tsx`, `src/app/(main)/courses/[id]/page.tsx` |
| **Client Component (CC)** | 인터랙션, 상태 관리, 브라우저 API | `'use client'` 선언 | `src/app/providers.tsx`, `src/components/dashboard/RadarChart.tsx` |

**패턴 분석:**
- **Page (RSC)** 에서 Supabase 쿼리로 데이터를 가져온 뒤, **Client Component**에 props로 전달하는 전형적인 "data fetching at the page level" 패턴을 따른다.
- **`src/app/(main)/layout.tsx:L11-L26`** 에서 `createClient()` → `auth.getUser()` → `profiles` 쿼리를 실행하여, 인증 상태와 사용자 정보를 Server Component 단에서 확보한 뒤 `<MainShell>` Client Component에 전달한다.

### 2.3 Server Actions를 통한 뮤테이션 패턴

모든 데이터 변경(Command) 작업은 `'use server'` 지시자를 가진 **Server Actions** 파일에서 수행된다.

```
src/app/actions/
├── auth.ts                ← 로그인/로그아웃 (signIn, signOut)
├── coding.ts              ← 코드 제출/실행 (submitCode, runCode)
├── quiz.ts                ← 퀴즈 시작/제출 (startQuizAttempt, submitQuizAnswers)
├── scores.ts              ← 점수 재계산 (recalculateUserScores)
├── profile.ts             ← 프로필 수정
├── onboarding.ts          ← 온보딩 처리
├── admin.ts               ← 관리자 CRUD 작업
├── mentor.ts              ← 멘토 관련 작업
├── feedback.ts            ← 피드백 작업
├── assessment.ts          ← 등급 테스트 관리
├── comprehensive-exam.ts  ← 종합 시험 관리
├── learning-assignments.ts← 학습 과제 관리
├── notifications.ts       ← 알림 관리
├── mastery.ts             ← 마스터리 트래킹
├── range-quiz.ts          ← 범위 퀴즈
├── claims.ts              ← 문제 클레임
└── access-request.ts      ← 접근 요청
```

**확인:** 각 Server Action은 내부에서 `createClient()` (Supabase SSR)을 호출하여 인증 사용자 확인 후 DB 작업을 수행한다. `revalidatePath()`로 캐시 무효화를 처리하며, 이는 Next.js App Router의 표준 뮤테이션 패턴이다.

---

## 3. 의존성 방향 다이어그램

### 3.1 전체 레이어 흐름

```
                        ┌──────────┐
                        │ Browser  │
                        └────┬─────┘
                             │ HTTPS
                             ▼
                    ┌────────────────┐
                    │   Middleware    │  src/middleware.ts
                    │ (Auth + RBAC)  │  - 미인증 → /login 리다이렉트
                    └───┬───────┬────┘  - 온보딩 미완료 → /onboarding
                        │       │       - /admin RBAC 검증
            ┌───────────┘       └───────────┐
            ▼                               ▼
   ┌─────────────────┐            ┌──────────────────┐
   │   Route Groups   │            │   API Routes     │
   │  (auth)  (main)  │            │  /api/tts        │
   │                  │            │  /api/admin/*    │
   └────┬────────┬────┘            └────────┬─────────┘
        │        │                          │
        ▼        ▼                          │
   ┌─────────┐ ┌────────────┐              │
   │ Layouts  │ │   Pages    │              │
   │ (RSC)   │ │   (RSC)    │              │
   └────┬────┘ └─┬──────┬───┘              │
        │        │      │                  │
        │        │      ▼                  │
        │        │  ┌──────────────┐       │
        │        │  │   Client     │       │
        │        │  │  Components  │       │
        │        │  │   (CC)       │       │
        │        │  └──────┬───────┘       │
        │        │         │ (form action / │
        │        │         │  fetch)        │
        ▼        ▼         ▼               ▼
   ┌──────────────────────────────────────────┐
   │           Server Actions                  │
   │         src/app/actions/*.ts              │
   │         ('use server')                    │
   └──────────────────┬───────────────────────┘
                      │
                      ▼
   ┌──────────────────────────────────────────┐
   │          Shared Lib Layer                 │
   │  queries/*.ts │ judge0/client.ts │ ...   │
   └──────┬────────┬──────────┬───────────────┘
          │        │          │
          ▼        ▼          ▼
   ┌──────────┐ ┌──────┐ ┌──────────┐
   │ Supabase │ │Judge0│ │ Google   │
   │ (Auth/DB │ │ API  │ │ TTS API  │
   │ /Storage)│ │      │ │          │
   └──────────┘ └──────┘ └──────────┘
```

### 3.2 인증 흐름 상세

```
  Browser                Middleware              Supabase Auth
    │                        │                        │
    ├── Request ────────────>│                        │
    │                        ├── getUser() ──────────>│
    │                        │<── user | null ────────┤
    │                        │                        │
    │  [!user && !authPage]  │                        │
    │<── redirect /login ────┤                        │
    │                        │                        │
    │  [user && !onboarded]  │                        │
    │                        ├── profiles.select() ──>│
    │                        │<── {is_onboarded} ─────┤
    │<── redirect /onboarding┤                        │
    │                        │                        │
    │  [user && /admin/*]    │                        │
    │                        ├── RBAC role check ────>│
    │<── redirect /dashboard ┤  (if unauthorized)     │
    │     or pass through    │                        │
```

---

## 4. 관심사 분리 평가

### 4.1 Pages = 렌더링 (Presentation Layer)

**역할:** URL 경로에 대응하는 서버 렌더링 엔트리포인트. 데이터를 조회하여 UI Component에 위임한다.

| 파일 | 역할 | 평가 |
|------|------|------|
| `src/app/(main)/courses/[id]/page.tsx` | 코스 상세 페이지 렌더링 | 데이터 페칭 + 렌더링 병행 |
| `src/app/(main)/ranking/page.tsx` | 랭킹 페이지 | RSC에서 데이터 조회 후 Client에 전달 |
| `src/app/(main)/admin/users/page.tsx` | Admin 사용자 관리 | RSC → Client 분리 |
| `src/app/page.tsx` | 루트 — 인증 여부에 따라 리다이렉트만 수행 | 적절한 관심사 분리 |

**평가:** Pages는 대체로 "데이터 조회 → Client Component 위임" 패턴을 잘 따르고 있다. 일부 페이지에서 Server Component 내에 직접 Supabase 쿼리를 인라인하는 경우가 있으나, queries 레이어로의 분리가 점진적으로 이루어지고 있다.

### 4.2 Actions = 뮤테이션 (Command Layer)

**역할:** 모든 상태 변경(Create/Update/Delete) 로직을 집중 관리한다.

| 파일 | 역할 | 평가 |
|------|------|------|
| `src/app/actions/auth.ts` | 로그인/로그아웃 | Zod 검증 + Supabase Auth 호출 + redirect |
| `src/app/actions/coding.ts` | 코드 제출 → Judge0 채점 → 코드 리뷰 → 점수 계산 | **복합 로직이 하나의 함수에 집중** (기술 부채) |
| `src/app/actions/quiz.ts` | 퀴즈 시작/제출 채점 | 서버사이드 정답 검증 (보안 적절) |
| `src/app/actions/scores.ts` | 5축 점수 재계산 | **262줄의 단일 함수** — 분할 필요 |

**평가:** Server Actions 패턴은 적절하나, `coding.ts:submitCode()`와 `scores.ts:recalculateUserScores()`는 단일 함수 내에 과도한 로직이 집중되어 있어 분리 리팩토링이 필요하다.

### 4.3 Queries = 읽기 (Query Layer)

**역할:** Supabase 조회를 캡슐화하는 순수 데이터 접근 함수.

| 파일 | 역할 | 평가 |
|------|------|------|
| `src/lib/supabase/queries/courses.ts` | 코스/레슨 조회 | 깔끔한 단일 책임 |
| `src/lib/supabase/queries/profiles.ts` | 프로필/스킬 조회 | 관련 테이블 그룹핑 적절 |
| `src/lib/supabase/queries/coding.ts` | 코딩 문제/제출 조회 | |
| `src/lib/supabase/queries/quizzes.ts` | 퀴즈 데이터 조회 | |
| `src/lib/supabase/queries/vocabulary.ts` | 단어/용어 조회 | |
| `src/lib/supabase/queries/assessments.ts` | 등급 테스트 조회 | |

**평가:** Query Layer는 관심사 분리가 잘 되어 있다. 도메인별로 파일이 분리되어 있으며, 각 함수는 단일 조회 책임을 갖는다.

### 4.4 Lib = 공유 로직 (Shared Layer)

| 파일 | 역할 | 평가 |
|------|------|------|
| `src/lib/supabase/server.ts` | Server-side Supabase 클라이언트 (일반 + ServiceRole) | 적절 |
| `src/lib/supabase/client.ts` | Browser-side Supabase 클라이언트 | 적절 |
| `src/lib/supabase/types.ts` | DB 타입 정의 (수동 관리) | `supabase gen types` 미사용 (추정) |
| `src/lib/judge0/client.ts` | Judge0 API 래퍼 | HTTP 호출 캡슐화 적절 |
| `src/lib/code-review/analyzer.ts` | 룰 기반 코드 리뷰 분석기 | Java/JS 지원 |
| `src/lib/validations/auth.ts` | Zod 스키마 정의 | |
| `src/lib/constants.ts` | 카테고리 라벨 상수 | |
| `src/lib/navigation.ts` | 네비게이션 구조 + RBAC 필터링 | |
| `src/lib/ranking.ts` | 랭킹 계산 로직 | |
| `src/lib/assessment-config.ts` | 등급 테스트 설정 | |
| `src/lib/assignment-categories.ts` | 과제 카테고리 정의 | |

**평가:** Lib Layer는 도메인별로 적절히 분리되어 있다. 다만, `src/lib/supabase/types.ts`가 179줄의 수동 타입 정의로 관리되고 있어, Supabase CLI의 자동 생성 타입과의 동기화 전략이 필요하다.

### 4.5 관심사 분리 종합 평가

```
┌──────────────────────────────────────────────────────┐
│                CQRS-Lite 패턴 평가                     │
│                                                      │
│  Command (Write)     Query (Read)      Render        │
│  ┌───────────┐      ┌────────────┐   ┌───────────┐  │
│  │  Actions   │      │  Queries   │   │  Pages /  │  │
│  │ (16 files) │      │ (6 files)  │   │ Components│  │
│  └───────────┘      └────────────┘   └───────────┘  │
│       ▲                   ▲               ▲          │
│       │                   │               │          │
│       └── 일부 Pages에서 직접 Supabase 쿼리 인라인   │
│           (queries 레이어 우회)                       │
│                                                      │
│  평가: B+ (양호)                                     │
│  - Command/Query 분리 명확                           │
│  - 일부 인라인 쿼리 존재하나 구조적 일관성 유지       │
│  - Server Actions 내 복합 로직 분리 필요              │
└──────────────────────────────────────────────────────┘
```

---

## 5. 기술 부채 분석

### 5.1 `ignoreBuildErrors: true` (심각도: HIGH)

> **[해결됨 — Phase 4, 2026-02-15]** `ignoreBuildErrors` 설정 완전 제거. `next.config.ts`에서 `typescript` 블록 자체를 삭제하여 기본 strict 모드 적용. TypeScript 빌드 에러 0건 달성.

```typescript
// next.config.ts:L3-6 (해결 전)
const nextConfig: NextConfig = {
  typescript: {
    ignoreBuildErrors: true,  // ← 프로덕션 배포 시 타입 에러 무시
  },
};
```

**영향:** TypeScript 타입 검사가 빌드 시 생략되므로, 런타임 에러를 사전에 감지할 수 없다. 프로덕션 환경에서 예기치 못한 타입 불일치로 인한 장애가 발생할 수 있다.

**권장:** `ignoreBuildErrors: false`로 전환하고, 기존 타입 에러를 순차적으로 해결해야 한다.

### 5.2 테스트 미존재 (심각도: HIGH)

> **[부분 해결됨 — Phase 3, 2026-02-15]** Vitest 4 설치 + `vitest.config.ts` 설정 완료. `src/modules/scoring/` 모듈에 33개 단위 테스트 작성 (axis-jlpt, axis-core-programming, axis-attitude, utils). `npm test` / `npm run test:watch` / `npm run test:coverage` 스크립트 추가. E2E 테스트는 미착수.

**확인:** 프로젝트 전체에 단위 테스트, 통합 테스트, E2E 테스트가 존재하지 않는다. `package.json`에 테스트 관련 의존성(Jest, Vitest, Playwright 등)이 없고, `test` 스크립트도 미정의이다.

**영향:**
- 리팩토링 시 회귀 버그 감지 불가
- 점수 계산 로직(`scores.ts`) 같은 핵심 비즈니스 로직의 정확성 검증 수단 부재
- CI/CD 파이프라인에서 품질 게이트 부재

### 5.3 `"name": "temp_next"` (심각도: LOW)

```json
// package.json:L2
"name": "temp_next"
```

**영향:** 프로젝트명이 임시 값으로 설정되어 있다. 기능적 문제는 없으나, Docker 이미지 태깅, 로그 식별, 모니터링 대시보드 등에서 혼동을 초래할 수 있다.

**권장:** `"name": "j-bridge"` 또는 `"name": "@company/j-bridge"` 형식으로 변경.

### 5.4 CLAUDE.md와 실제 코드의 불일치 (심각도: MEDIUM)

| 항목 | CLAUDE.md 기술 | 실제 코드 |
|------|---------------|-----------|
| Next.js 버전 | "Next.js 14 with App Router" | Next.js **16.1.6** (`package.json:L17`) |
| Chart 라이브러리 | "Chart.js + react-chartjs-2" | **recharts** 3.7.0 (`package.json:L20`) |
| 프로젝트 상태 | "Pre-implementation phase" | 80+ 소스 파일의 **구현 완료 상태** |

**영향:** 온보딩되는 신규 개발자가 잘못된 문서를 기반으로 의사 결정을 내릴 위험이 있다.

### 5.5 수동 타입 관리 (심각도: MEDIUM)

`src/lib/supabase/types.ts` (179줄)에서 DB 스키마 타입을 수동으로 정의하고 있다. Supabase CLI의 `supabase gen types typescript` 명령으로 자동 생성된 타입을 사용하지 않는 것으로 **추정**된다. DB 스키마 변경 시 타입 정의 동기화 누락 위험이 존재한다.

### 5.6 점수 계산 함수 복잡도 (심각도: MEDIUM)

`src/app/actions/scores.ts:recalculateUserScores()` 함수가 262줄에 걸쳐 5축 전체의 점수 계산을 단일 함수로 처리한다. 축별 계산 로직을 분리하면 테스트 용이성과 유지보수성이 크게 개선될 것이다.

### 5.7 환경 변수 Non-null Assertion (심각도: LOW)

```typescript
// src/lib/supabase/server.ts:L9, src/middleware.ts:L8
process.env.NEXT_PUBLIC_SUPABASE_URL!
process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
```

환경 변수에 `!` (non-null assertion)을 사용하고 있어, 환경 변수 미설정 시 런타임에서 의미 없는 에러 메시지가 출력된다. Zod 등을 활용한 환경 변수 검증 레이어 도입을 권장한다.

### 5.8 기술 부채 우선순위 매트릭스

```
영향도 (HIGH)
    │
    │  [테스트 미존재]     [ignoreBuildErrors]
    │
    │  [CLAUDE.md 불일치]  [점수 계산 복잡도]
    │  [수동 타입 관리]
    │
    │  [env assertion]     [temp_next name]
    │
    └───────────────────────────────────── 해결 비용 (HIGH)
         (LOW)                    (HIGH)
```

---

## 6. 핵심 의존성 분석

### 6.1 프로덕션 의존성

| 패키지 | 버전 | 역할 | 비고 |
|--------|------|------|------|
| `next` | 16.1.6 | 풀스택 프레임워크 (App Router, RSC, Server Actions) | React 19 기반 |
| `react` / `react-dom` | 19.2.3 | UI 렌더링 엔진 | Server Components 지원 |
| `@supabase/ssr` | ^0.8.0 | Supabase SSR 통합 (쿠키 기반 인증) | Middleware + Server/Client 양쪽 지원 |
| `@supabase/supabase-js` | ^2.95.3 | Supabase 코어 클라이언트 | DB, Auth, Storage 접근 |
| ~~`@tanstack/react-query`~~ | — | 2026-06-11 제거 (마운트만 되고 사용처 0건) | — |
| `recharts` | ^3.7.0 | 차트 라이브러리 (Radar Chart 등) | D3 기반 React 차트 |
| `@monaco-editor/react` | ^4.7.0 | 코드 에디터 (Monaco Editor wrapper) | 코딩 문제 풀이용 |
| `zod` | ^4.3.6 | 런타임 스키마 검증 | Server Actions 입력 검증 |
| `lucide-react` | ^0.563.0 | 아이콘 라이브러리 | 네비게이션/UI 아이콘 |

### 6.2 개발 의존성

| 패키지 | 버전 | 역할 |
|--------|------|------|
| `typescript` | ^5 | 타입 시스템 |
| `tailwindcss` | ^4 | 유틸리티 CSS 프레임워크 |
| `@tailwindcss/postcss` | ^4 | Tailwind CSS PostCSS 플러그인 |
| `eslint` + `eslint-config-next` | ^9 / 16.1.6 | 린팅 |

### 6.3 외부 서비스 의존성

| 서비스 | 역할 | 통신 방식 | 환경 변수 |
|--------|------|-----------|-----------|
| **Supabase** | Auth, PostgreSQL DB, Storage | HTTPS (REST + Realtime) | `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY` |
| **Judge0** | 코드 실행/채점 엔진 | REST API (HTTP polling) | `JUDGE0_API_URL`, `JUDGE0_API_KEY` |
| **Google Cloud TTS** | 일본어 텍스트 음성 변환 | REST API | `GOOGLE_CLOUD_TTS_API_KEY` |

### 6.4 버전 관련 참고

- **Zod ^4.3.6**: Zod v4는 2025년 출시된 메이저 버전으로, v3와 API가 일부 상이하다. 커뮤니티 생태계(react-hook-form 등)와의 호환성 확인 필요.
- **Next.js 16.x**: Turbopack 안정화, Server Actions 개선 등을 포함한 최신 버전. CLAUDE.md의 "Next.js 14" 기술과 2세대 차이.
- **React 19**: use() hook, Server Components 정식 지원 등 포함. 기존 라이브러리 호환성 주의.

---

## 7. Route Group 구조와 렌더링 전략

### 7.1 Route Group 구성

```
src/app/
├── layout.tsx              ← Root Layout (HTML shell, 폰트, 메타데이터)
├── page.tsx                ← / → 인증 여부에 따라 redirect
├── providers.tsx           ← QueryClient + ThemeProvider (Client)
├── (auth)/                 ← 비인증 사용자용 Route Group
│   ├── layout.tsx          ← Canvas 배경 애니메이션 (Client)
│   └── login/page.tsx      ← 로그인 페이지
├── (main)/                 ← 인증 사용자용 Route Group
│   ├── layout.tsx          ← MainShell (Sidebar + Header, Server)
│   ├── admin/              ← 관리자 전용 (이중 RBAC: Middleware + Layout)
│   │   ├── layout.tsx      ← admin/mentor 역할 검증 (Server)
│   │   ├── users/          ← 사용자 관리 (admin only)
│   │   ├── mentors/        ← 멘토 관리 (admin only)
│   │   ├── courses/        ← 콘텐츠 관리 (admin only)
│   │   ├── tasks/          ← 과제 배정 (admin + mentor)
│   │   └── reports/        ← 리포트 (admin + mentor)
│   ├── dashboard/          ← 메인 대시보드
│   ├── japanese/           ← 일본어 학습 (JLPT + Business)
│   ├── dev/                ← 개발 실무 능력
│   ├── cs/                 ← CS 지식
│   ├── coding/             ← 코딩 문제/시험
│   ├── ranking/            ← 랭킹 보드
│   ├── onboarding/         ← 온보딩 (초기 등급 측정)
│   ├── exam/               ← 종합 시험
│   ├── feedback/           ← 피드백
│   └── profile/            ← 프로필
├── auth/callback/          ← Supabase Auth 콜백 (Route Handler)
└── api/                    ← API Routes
    ├── tts/route.ts        ← TTS 음성 합성 (Google Cloud TTS)
    └── admin/tts-precache/ ← TTS 사전 캐시 (admin용)
```

### 7.2 Middleware RBAC 매트릭스

**확인 (`src/middleware.ts:L67-93`):**

| 경로 | admin | mentor | mentee |
|------|-------|--------|--------|
| `/admin/users` | O | X (→ /dashboard) | X (→ /dashboard) |
| `/admin/courses` | O | X | X |
| `/admin/mentors` | O | X | X |
| `/admin/tasks` | O | O | X (→ /dashboard) |
| `/admin/reports` | O | O | X (→ /dashboard) |
| `/admin/*` (기타) | O | X | X |
| 일반 페이지 | O | O | O |

---

## 8. 클라이언트 Provider 구조

```typescript
// src/app/providers.tsx
<QueryClientProvider client={queryClient}>    // React Query v5
  <ThemeProvider>                              // Dark/Light 테마 관리
    {children}
  </ThemeProvider>
</QueryClientProvider>
```

**확인 (`src/app/providers.tsx:L8-15`):**
- `staleTime: 60 * 1000` (1분) — 쿼리 결과를 1분간 신선하게 유지
- `refetchOnWindowFocus: false` — 창 포커스 시 재페칭 비활성화 (LMS 특성상 적절)

**확인 (`src/components/theme/ThemeProvider.tsx`):**
- `localStorage` 기반 테마 지속화
- 기본값: `dark`
- `MutationObserver`를 통한 실시간 테마 감지 (RadarChart 등에서 활용)

---

## 9. 외부 시스템 통합 상세

### 9.1 Supabase 클라이언트 이중 구조

| 클라이언트 | 파일 | 사용처 | 권한 |
|-----------|------|--------|------|
| `createClient()` (Server) | `src/lib/supabase/server.ts:L5` | Server Components, Server Actions | RLS 적용 (anon key) |
| `createServiceRoleClient()` | `src/lib/supabase/server.ts:L34` | 관리자 작업 (Storage, 점수 계산) | RLS 우회 (service role key) |
| `createClient()` (Browser) | `src/lib/supabase/client.ts:L3` | Client Components | RLS 적용 (anon key) |

**확인:** `createServiceRoleClient()`는 `SUPABASE_SERVICE_ROLE_KEY` 미설정 시 `null`을 반환하며, 호출부에서 fallback으로 일반 클라이언트를 사용한다 (`src/app/actions/scores.ts:L19`).

### 9.2 Judge0 통합 패턴

```
submitCode()                    Judge0 API
    │                               │
    ├── createSubmission() ────────>│  POST /submissions
    │<── token ─────────────────────┤
    │                               │
    ├── pollSubmissionResult() ────>│  GET /submissions/{token}
    │   (최대 20회, 1초 간격)       │  status.id > 2 까지 반복
    │<── result ────────────────────┤
    │                               │
    ├── mapJudge0Status()           │
    │   3=accepted, 4=wrong_answer  │
    │   5=time_limit, 6=compile_error
    │   7-12=runtime_error          │
    │   13-14=memory_limit          │
```

**확인:** RapidAPI 호스팅과 self-hosted 양쪽을 지원하며, `IS_RAPIDAPI` 플래그로 자동 판별한다 (`src/lib/judge0/client.ts:L3`).

### 9.3 Google Cloud TTS 통합

- **경로:** `POST /api/tts` (`src/app/api/tts/route.ts`)
- **캐싱:** Supabase Storage (`tts-cache` 버킷)에 SHA-256 해시 기반 MP3 캐시
- **다화자 지원:** 대화문(`田中：セリフ` 형식) 자동 감지 후 화자별 음성 할당
- **인증:** Supabase Auth 필수 (미인증 시 401)

---

## 10. DB 마이그레이션 현황

**확인:** `supabase/migrations/` 디렉토리에 48개의 마이그레이션 파일이 존재한다.

| 범위 | 마이그레이션 | 내용 |
|------|-------------|------|
| 00001-00011 | 초기 스키마 | extensions, profiles, skills, content, coding, quiz, attempts, submissions, japanese content, enrollments |
| 00012-00014 | 트리거/뷰/RLS | triggers, RLS policies, views |
| 00015-00019 | 코딩 시험/랭킹 | coding skill exams, exam attempts, ranking system, admin features, admin RLS |
| 00020-00030 | 기능 확장 | new table triggers, missing policies, comprehensive fixes, avatars, assessment, mentor system |
| 00031-00048 | 콘텐츠/기능 추가 | JLPT grammar/reading/listening, claims, content management, feedback, IT glossary, mastery, TTS cache |

---

## 11. 타 문서 참조

| 문서 | 내용 | 관련 섹션 |
|------|------|-----------|
| [02_folder_responsibility.md](./02_folder_responsibility.md) | 디렉토리별 책임과 파일 구조 상세 | 본 문서 3, 4장의 상세 풀이 |
| [03_runtime_flow.md](./03_runtime_flow.md) | 요청 처리 흐름과 렌더링 파이프라인 | 본 문서 3.2 인증 흐름의 런타임 상세 |
| [04_data_architecture.md](./04_data_architecture.md) | DB 스키마, RLS, 마이그레이션 전략 | 본 문서 10장의 상세 풀이 |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | 네트워크 토폴로지와 배포 구성 | 본 문서 9장 외부 시스템 통합의 인프라 관점 |
| [06_security_design.md](./06_security_design.md) | 인증/인가, RLS, 보안 설계 | 본 문서 3.2, 7.2 RBAC의 보안 심층 분석 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | 시험/등급 도메인 모델 | 본 문서 2.3 Server Actions 내 채점 로직 |
| [08_scalability_analysis.md](./08_scalability_analysis.md) | 확장성 분석과 병목 지점 | 본 문서 9.2 Judge0 polling 패턴의 확장성 |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | 리팩토링 후보와 우선순위 | 본 문서 5장 기술 부채의 해결 방안 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 아키텍트 학습 로드맵 | 본 문서 전체의 학습 가이드 |

---

## 부록 A: 핵심 파일 Quick Reference

| 파일 | 줄 수 (추정) | 핵심 역할 |
|------|-------------|-----------|
| `src/middleware.ts` | 104 | Auth + RBAC + 온보딩 라우팅 |
| `src/app/(main)/layout.tsx` | 33 | Main Shell 구성 (RSC) |
| `src/app/providers.tsx` | 25 | React Query + Theme Provider |
| `src/app/actions/scores.ts` | 262 | 5축 점수 재계산 엔진 |
| `src/app/actions/coding.ts` | 150 | Judge0 코드 제출/채점 |
| `src/lib/supabase/server.ts` | 50 | Server Supabase 클라이언트 (일반 + ServiceRole) |
| `src/lib/supabase/types.ts` | 179 | DB 타입 정의 (수동) |
| `src/lib/judge0/client.ts` | 110 | Judge0 API 래퍼 |
| `src/lib/code-review/analyzer.ts` | 168 | 룰 기반 코드 리뷰 (Java/JS) |
| `src/lib/navigation.ts` | 123 | 네비게이션 구조 + RBAC 필터 |
| `src/app/api/tts/route.ts` | 232 | Google TTS + Supabase Storage 캐시 |
| `next.config.ts` | 9 | 빌드 설정 (ignoreBuildErrors: true) |
