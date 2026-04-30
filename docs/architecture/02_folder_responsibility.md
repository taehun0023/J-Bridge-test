# 02. 폴더 책임 맵 (Folder Responsibility Map)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **검증 방법:** 실제 파일 시스템 탐색 기반 (확인)

---

## 1. 프로젝트 루트 구조

```
edu_cha/
├── src/              # 애플리케이션 소스 코드 (Next.js App Router)
├── supabase/         # DB 마이그레이션 + 시드 데이터
├── scripts/          # 운영 스크립트 (시드 배포, 데이터 임포트)
├── judge0/           # 코드 실행 엔진 Docker 구성
├── docs/             # 기술 문서 + 아키텍처 문서
├── data/             # 외부 데이터 소스 (CSV)
├── public/           # 정적 에셋 (이미지, 오디오 캐시)
├── node_modules/     # npm 의존성 (gitignore)
└── [설정 파일들]     # next.config.ts, tsconfig.json 등
```

| 폴더 | 역할 | 파일 수 | 주요 파일 |
|------|------|---------|----------|
| `src/` | Next.js 애플리케이션 전체 소스. App Router 기반 페이지, Server Actions, 공유 라이브러리, UI 컴포넌트 | 160 (ts/tsx) | `middleware.ts`, `app/layout.tsx`, `app/providers.tsx` |
| `supabase/` | Supabase DB 스키마 마이그레이션(16개)과 시드 SQL 파일(39개). `seed_parts/`에 분할 시드 포함 | 87+ | `migrations/00001_extensions.sql` ~ `00016_coding_exam_attempts.sql`, `all_seeds.sql` |
| `scripts/` | Node.js 운영 스크립트. 시드 파일 병합, 배포, JLPT 데이터 임포트 | 9 | `apply-seeds.js`, `merge-seeds.js`, `deploy-seeds.js` |
| `judge0/` | Judge0 CE 코드 실행 엔진의 Docker 환경 구성 | 5 | `docker-compose.yml`, `judge0.conf`, `Dockerfile` |
| `docs/` | 기술 학습 문서(Next.js, Supabase, Tailwind, TypeScript) + 아키텍처 문서 시리즈 | 13 | `content_strategy.md`, `architecture/` |
| `data/` | 외부 CSV 데이터 소스 (직원 일본어 어휘 데이터) | 1 | `WEAVUS_japanese.csv` |
| `public/` | 정적 에셋. SVG 아이콘 + TTS 오디오 캐시 파일 | 7 | `audio/*.mp3`, `icon.svg` |

### 루트 설정 파일

| 파일 | 역할 |
|------|------|
| `next.config.ts` | Next.js 빌드 설정 |
| `tsconfig.json` | TypeScript 컴파일러 설정 (`@/` 경로 alias 포함) |
| `postcss.config.mjs` | PostCSS 설정 (Tailwind CSS 처리) |
| `eslint.config.mjs` | ESLint 규칙 설정 |
| `package.json` | 의존성 + 스크립트 정의 |
| `CLAUDE.md` | AI 어시스턴트 프로젝트 컨텍스트 |
| `PRD.md` | 제품 요구사항 정의서 |
| `DB_Schema.md` | 데이터베이스 스키마 상세 문서 |
| `project_rules.md` | 프로젝트 개발 규칙 |

---

## 2. src 내부 구조 상세

```
src/
├── app/                 # Next.js App Router (페이지 + Server Actions + API)
│   ├── (auth)/          # Route Group: 인증 페이지 (로그인)
│   ├── (main)/          # Route Group: 인증 후 메인 레이아웃
│   ├── actions/         # Server Actions (17개 파일)
│   ├── api/             # API Route Handlers (2개 엔드포인트)
│   ├── auth/            # Supabase Auth 콜백
│   ├── layout.tsx       # Root Layout (폰트, 메타데이터)
│   ├── page.tsx         # 루트 페이지 (/ → /dashboard 리다이렉트)
│   ├── providers.tsx    # Client Provider (React Query + Theme)
│   └── globals.css      # 전역 스타일
├── components/          # 재사용 UI 컴포넌트 (28개 파일)
│   ├── charts/          # 차트 컴포넌트 (빈 폴더 — 추정: 미구현)
│   ├── dashboard/       # 대시보드 전용 (RadarChart)
│   ├── editor/          # 코드 에디터 (빈 폴더 — 추정: 미구현)
│   ├── japanese/        # 일본어 학습 컴포넌트 (10개)
│   ├── quiz/            # 퀴즈 공통 컴포넌트 (2개)
│   ├── theme/           # 다크/라이트 테마 (1개)
│   └── ui/              # 공통 UI 프리미티브 (14개)
├── lib/                 # 공유 라이브러리 + 설정 (17개 파일)
│   ├── supabase/        # Supabase 클라이언트 + 쿼리 함수
│   ├── judge0/          # Judge0 API 클라이언트
│   ├── code-review/     # AI 코드 리뷰 분석기
│   └── validations/     # Zod 스키마 (입력 검증)
└── middleware.ts        # Edge Middleware (인증 + RBAC + 온보딩 체크)
```

---

### 2.1 src/app/ — 페이지와 라우트

**역할:** Next.js App Router 기반 전체 라우팅 구조. Route Group을 활용하여 인증 전/후 레이아웃 분리.

**책임:**
- 60개 page.tsx (라우트 엔드포인트)
- 4개 layout.tsx (중첩 레이아웃)
- 17개 Server Action 파일
- 2개 API Route Handler

**의존성:** `src/lib/` (설정, Supabase 쿼리), `src/components/` (UI)

**변경 영향:** 페이지 추가/수정 시 `navigation.ts`와 `middleware.ts`에 동기화 필요

**테스트 전략:** E2E 테스트 (라우팅 + 인증 플로우), Server Action 단위 테스트

---

### 2.2 src/app/actions/ — Server Actions

**역할:** 모든 서버 사이드 데이터 변경 로직을 집중 관리. `'use server'` 지시어 사용.

| 파일 | 책임 |
|------|------|
| `auth.ts` | 로그인, 로그아웃, 비밀번호 재설정 |
| `admin.ts` | 관리자 계정 생성, 역할 변경, 비밀번호 리셋 |
| `assessment.ts` | 온보딩 평가 시험 답안 제출 + 채점 |
| `scores.ts` | 5축 점수 계산 + dispatch_readiness_scores 기록 |
| `quiz.ts` | 일반 퀴즈 응시 + 채점 |
| `range-quiz.ts` | 범위 지정 퀴즈 (플래시카드 모드) |
| `coding.ts` | 코드 제출 → Judge0 실행 → 결과 저장 |
| `comprehensive-exam.ts` | 종합시험 요청/승인/응시 플로우 |
| `learning-assignments.ts` | 학습 과제 배정 + 상태 관리 |
| `feedback.ts` | 관리자/멘토 피드백 CRUD |
| `mentor.ts` | 멘토-멘티 배정 관리 |
| `notifications.ts` | 알림 읽음/생성 처리 |
| `profile.ts` | 프로필 수정, 아바타 업로드 |
| `onboarding.ts` | 온보딩 단계 진행 + 완료 처리 |
| `claims.ts` | Supabase JWT Custom Claims |
| `mastery.ts` | 학습 마스터리 진도 추적 |
| `access-request.ts` | 접근 요청 (시험 응시 승인 등) |

**의존성:** `lib/supabase/server.ts` (서버 클라이언트), `lib/assessment-config.ts` (시험 설정)

**변경 영향:** 높음 — 모든 데이터 변경이 이 폴더를 경유. DB 스키마 변경 시 직접 영향

**테스트 전략:** 단위 테스트 (mock Supabase), 통합 테스트 (실제 DB)

---

### 2.3 src/app/api/ — API Route Handlers

**역할:** REST API 엔드포인트. 외부 서비스 연동 또는 브라우저에서 직접 호출이 필요한 경우에 사용.

| 경로 | 역할 |
|------|------|
| `api/tts/route.ts` | TTS(Text-to-Speech) 음성 합성 API. 일본어 텍스트를 오디오로 변환 |
| `api/admin/tts-precache/route.ts` | 관리자용 TTS 일괄 캐시 생성 API |

**의존성:** Supabase Storage (오디오 파일 저장)

**변경 영향:** 낮음 — 독립적 엔드포인트

---

### 2.4 src/components/ — UI 컴포넌트

**역할:** 재사용 가능한 React 컴포넌트. 도메인별로 하위 폴더 분리.

```
components/
├── ui/           # 14개 — 범용 UI 프리미티브
├── japanese/     # 10개 — 일본어 학습 도메인
├── quiz/         #  2개 — 퀴즈 공통
├── dashboard/    #  1개 — 대시보드 (RadarChart)
├── theme/        #  1개 — ThemeProvider
├── charts/       #  0개 — 미구현 (빈 폴더)
└── editor/       #  0개 — 미구현 (빈 폴더)
```

#### components/ui/ (공통 UI)

| 파일 | 책임 |
|------|------|
| `MainShell.tsx` | 메인 레이아웃 쉘 (Sidebar + Header + MobileNav 조합) |
| `Sidebar.tsx` | 데스크톱 사이드바 내비게이션 |
| `MobileNav.tsx` | 모바일 하단/슬라이드 내비게이션 |
| `Header.tsx` | 상단 헤더 (사용자 정보, 알림) |
| `NotificationBell.tsx` | 알림 벨 아이콘 + 드롭다운 |
| `ProfileAvatar.tsx` | 사용자 아바타 컴포넌트 |
| `CategoryHubPage.tsx` | 카테고리 허브 페이지 템플릿 (`navigation.ts` 기반) |
| `PlaceholderPage.tsx` | 미구현 페이지 플레이스홀더 |
| `Card.tsx` | 카드 UI 프리미티브 |
| `Badge.tsx` | 뱃지 UI (코딩 등급 등) |
| `Skeleton.tsx` | 로딩 스켈레톤 |
| `Pagination.tsx` | 페이지네이션 |
| `TabBar.tsx` | 탭 바 |
| `EmptyState.tsx` | 빈 상태 표시 |

**의존성:** `lib/navigation.ts` (카테고리 설정), `lib/supabase/types.ts` (타입)

**변경 영향:** 높음 — 거의 모든 페이지에서 사용. `MainShell` 변경 시 전체 레이아웃 영향

#### components/japanese/ (일본어 학습)

| 파일 | 책임 |
|------|------|
| `VocabularyList.tsx` | JLPT 단어 목록 표시 |
| `FlashcardMode.tsx` | 플래시카드 학습 모드 |
| `GrammarList.tsx` | 문법 패턴 목록 |
| `GrammarFlashcard.tsx` | 문법 플래시카드 |
| `ReadingPassageList.tsx` | 독해 지문 목록 |
| `ListeningScriptList.tsx` | 청해 스크립트 목록 |
| `GlossaryTable.tsx` | IT 용어집 테이블 |
| `QuizTaker.tsx` | 퀴즈 응시 클라이언트 (공통) |
| `RangeQuizModal.tsx` | 범위 지정 퀴즈 모달 |
| `TtsButton.tsx` | TTS 재생 버튼 |

**의존성:** `lib/supabase/types.ts` (데이터 타입), `api/tts/` (음성 합성)

**변경 영향:** 중간 — 일본어 학습 관련 페이지에만 영향

---

### 2.5 src/lib/ — 공유 라이브러리

**역할:** 애플리케이션 전반에서 공유하는 설정, 유틸리티, 외부 서비스 클라이언트.

```
lib/
├── assessment-config.ts      # 5축 평가 시스템 핵심 설정 (허브 파일)
├── assignment-categories.ts  # 학습 과제 카테고리 정의
├── navigation.ts             # 내비게이션 구조 + 카테고리 자식 설정
├── constants.ts              # 카테고리 라벨 상수
├── ranking.ts                # 랭킹 계산 로직
├── supabase/
│   ├── client.ts             # 브라우저 Supabase 클라이언트
│   ├── server.ts             # 서버 Supabase 클라이언트 + Service Role
│   ├── types.ts              # 전체 도메인 타입 정의 (50+ 타입/인터페이스)
│   └── queries/
│       ├── assessments.ts    # 평가 시험 쿼리 (난이도 균형 랜덤 추출)
│       ├── coding.ts         # 코딩 문제/시험 쿼리
│       ├── courses.ts        # 코스/레슨 쿼리
│       ├── profiles.ts       # 프로필 쿼리
│       ├── quizzes.ts        # 퀴즈 쿼리
│       └── vocabulary.ts     # 어휘 쿼리
├── judge0/
│   └── client.ts             # Judge0 API 클라이언트 (코드 제출/결과 조회)
├── code-review/
│   └── analyzer.ts           # 규칙 기반 코드 리뷰 (Java/JavaScript)
└── validations/
    └── auth.ts               # Zod 인증 스키마
```

**변경 영향 분석:**

| 파일 | 의존하는 파일 수 | 영향 범위 |
|------|----------------|----------|
| `supabase/types.ts` | 거의 전체 | **매우 높음** — 타입 변경 시 전파 범위 최대 |
| `assessment-config.ts` | 11개 파일 | **높음** — 대시보드, 온보딩, 관리자 기능 |
| `navigation.ts` | 42개 파일 (간접 포함) | **높음** — UI 구조 전체 |
| `assignment-categories.ts` | 6개 파일 | **중간** — 과제 배정 관련 |
| `ranking.ts` | 2개 파일 | **낮음** — 랭킹 페이지만 |
| `constants.ts` | 2개 파일 | **낮음** — 대시보드, 코스 |

**테스트 전략:** 순수 함수 단위 테스트 (특히 `ranking.ts`, `assessment-config.ts`의 계산 로직)

---

## 3. assessment-config.ts 허브 의존성 그래프

`assessment-config.ts`는 5축 평가 시스템의 핵심 설정 파일로, 시험 ID/라벨/시간제한/등급 시스템/축 정의를 모두 포함한다.

```
                    ┌─────────────────────────┐
                    │  assessment-config.ts    │
                    │                         │
                    │  ASSESSMENT_QUIZ_IDS    │
                    │  ASSESSMENT_LABELS      │
                    │  ASSESSMENT_TIME_LIMITS │
                    │  getGrade()             │
                    │  getGradeColor()        │
                    │  ALL_AXES               │
                    │  AXIS_DISPLAY_LABELS    │
                    │  getRelevantAxes()      │
                    │  getRelevantSteps()     │
                    │  getMaxTotalScore()     │
                    │  getLanguageCategories()│
                    │  CS_KNOWLEDGE_WEIGHTS   │
                    └────────────┬────────────┘
                                 │
            ┌────────────────────┼─────────────────────┐
            │                    │                      │
     ┌──────▼──────┐    ┌───────▼───────┐    ┌────────▼────────┐
     │  Dashboard   │    │  Onboarding   │    │     Admin       │
     │  영역        │    │  영역         │    │     영역        │
     └──────┬──────┘    └───────┬───────┘    └────────┬────────┘
            │                    │                      │
  ┌─────────┼──────────┐   ┌────┼─────────┐    ┌──────┼──────┐
  │         │          │   │    │         │    │      │      │
  ▼         ▼          ▼   ▼    ▼         ▼    ▼      ▼      ▼
page.tsx  Dashboard  Radar  [step]/  results/  results/  reports/ courses/
          Client.tsx Chart  page    page      Summary  Client   page
```

### 상세 import 관계

**ASSESSMENT_QUIZ_IDS를 사용하는 파일:**
- `src/app/actions/assessment.ts` — 시험 답안 제출 시 퀴즈 ID 조회
- `src/app/actions/scores.ts` — 점수 계산 시 퀴즈 ID 매핑
- `src/app/(main)/dashboard/page.tsx` — 대시보드에서 시험 상태 확인
- `src/app/(main)/onboarding/assessment/[step]/page.tsx` — 온보딩 시험 페이지
- `src/app/(main)/admin/courses/page.tsx` — 관리자 코스 관리

**getGrade/getGradeColor를 사용하는 파일:**
- `src/app/(main)/dashboard/DashboardClient.tsx` — 등급 뱃지 표시
- `src/app/(main)/onboarding/results/ResultsSummary.tsx` — 결과 등급 표시
- `src/components/dashboard/RadarChart.tsx` — 레이더 차트 등급 색상

**AXIS 관련 (getRelevantAxes, AXIS_DISPLAY_LABELS)을 사용하는 파일:**
- `src/app/(main)/dashboard/DashboardClient.tsx` — 5축 레이더 차트
- `src/app/(main)/dashboard/page.tsx` — 대시보드 서버 데이터 페칭
- `src/app/(main)/onboarding/results/page.tsx` — 결과 페이지 서버
- `src/app/(main)/onboarding/results/ResultsSummary.tsx` — 결과 요약 UI
- `src/app/(main)/admin/reports/AdminReportsClient.tsx` — 관리자 보고서
- `src/components/dashboard/RadarChart.tsx` — 레이더 차트

**CS_KNOWLEDGE_WEIGHTS, getLanguageCategories를 사용하는 파일:**
- `src/lib/supabase/queries/assessments.ts` — 난이도 균형 문제 추출 (dynamic import)

---

## 4. 라우트 맵

### Route Group 구조

```
src/app/
├── page.tsx                          # /  (루트 → /dashboard 리다이렉트)
├── layout.tsx                        # Root Layout (폰트, HTML)
│
├── (auth)/                           # Route Group: 인증 전 레이아웃
│   ├── layout.tsx                    # Canvas 애니메이션 배경
│   └── login/page.tsx                # /login
│
├── (main)/                           # Route Group: 인증 후 레이아웃
│   ├── layout.tsx                    # MainShell (Sidebar + Header)
│   ├── loading.tsx                   # 전역 로딩 UI
│   ├── error.tsx                     # 전역 에러 경계
│   ├── not-found.tsx                 # 404 페이지
│   │
│   ├── dashboard/                    # 대시보드 메인
│   │   ├── page.tsx                  # /dashboard
│   │   ├── DashboardClient.tsx       # 5축 레이더 차트 + 등급 뱃지
│   │   ├── assignments/page.tsx      # /dashboard/assignments
│   │   └── history/page.tsx          # /dashboard/history
│   │
│   ├── onboarding/                   # 온보딩 플로우
│   │   ├── page.tsx                  # /onboarding (시작)
│   │   ├── assessment/[step]/        # /onboarding/assessment/:step
│   │   └── results/                  # /onboarding/results
│   │
│   ├── japanese/                     # 일본어 학습
│   │   ├── jlpt/                     # /japanese/jlpt (JLPT 준비)
│   │   │   ├── vocabulary/           # /japanese/jlpt/vocabulary
│   │   │   ├── grammar/              # /japanese/jlpt/grammar
│   │   │   ├── reading/              # /japanese/jlpt/reading
│   │   │   ├── listening/            # /japanese/jlpt/listening
│   │   │   └── quiz/[quizId]/        # /japanese/jlpt/quiz/:quizId
│   │   └── business/                 # /japanese/business (비즈니스 일본어)
│   │       ├── glossary/             # /japanese/business/glossary
│   │       ├── sentence-patterns/    # /japanese/business/sentence-patterns
│   │       ├── expressions/          # /japanese/business/expressions
│   │       └── quiz/[quizId]/        # /japanese/business/quiz/:quizId
│   │
│   ├── cs/                           # CS 지식
│   │   ├── page.tsx                  # /cs (허브)
│   │   ├── basic-theory/             # /cs/basic-theory
│   │   ├── algorithms/               # /cs/algorithms
│   │   ├── data-structures/          # /cs/data-structures
│   │   ├── computer-architecture/    # /cs/computer-architecture
│   │   ├── database/                 # /cs/database
│   │   ├── networking/               # /cs/networking
│   │   ├── security/                 # /cs/security
│   │   └── quiz/[quizId]/            # /cs/quiz/:quizId
│   │
│   ├── dev/                          # 개발 실무 능력
│   │   ├── page.tsx                  # /dev (허브)
│   │   ├── java/                     # /dev/java
│   │   ├── javascript/               # /dev/javascript
│   │   ├── python/                   # /dev/python
│   │   ├── sql/                      # /dev/sql
│   │   ├── spring-boot/              # /dev/spring-boot
│   │   ├── react/                    # /dev/react
│   │   └── nextjs/                   # /dev/nextjs
│   │
│   ├── business-literacy/            # 비즈니스 리터러시
│   │   ├── page.tsx                  # /business-literacy (허브)
│   │   ├── attitude/                 # /business-literacy/attitude
│   │   ├── culture/                  # /business-literacy/culture
│   │   └── security/                 # /business-literacy/security
│   │
│   ├── coding/                       # 코딩 평가
│   │   ├── problems/                 # /coding/problems (문제 목록)
│   │   │   └── [problemId]/          # /coding/problems/:id (에디터)
│   │   └── exams/                    # /coding/exams (코딩 시험)
│   │       └── [examId]/             # /coding/exams/:id (시험 응시)
│   │
│   ├── exam/[examId]/                # /exam/:id (종합시험 응시)
│   ├── courses/                      # /courses (코스 목록)
│   │   └── [id]/                     # /courses/:id
│   │       └── lessons/[lessonId]/   # /courses/:id/lessons/:lessonId
│   │
│   ├── ranking/                      # /ranking (랭킹)
│   ├── feedback/                     # /feedback (피드백)
│   ├── profile/                      # /profile (프로필)
│   │
│   └── admin/                        # 관리자 영역 (RBAC 제어)
│       ├── layout.tsx                # 관리자 레이아웃
│       ├── users/                    # /admin/users (계정 관리) [admin]
│       ├── mentors/                  # /admin/mentors (멘토 관리) [admin]
│       ├── courses/                  # /admin/courses (콘텐츠 관리) [admin]
│       ├── tasks/                    # /admin/tasks (과제 배정) [admin,mentor]
│       ├── reports/                  # /admin/reports (보고서) [admin,mentor]
│       └── tts-cache/                # /admin/tts-cache (TTS 캐시) [admin]
│
├── actions/                          # Server Actions (17개)
├── api/                              # API Route Handlers
│   ├── tts/route.ts                  # /api/tts
│   └── admin/tts-precache/route.ts   # /api/admin/tts-precache
└── auth/                             # Supabase Auth 콜백
```

### Dynamic Route 패턴

| 패턴 | 경로 | 용도 |
|------|------|------|
| `[step]` | `/onboarding/assessment/:step` | 5축 평가 단계 (1~5) |
| `[quizId]` | `/japanese/jlpt/quiz/:quizId`, `/cs/quiz/:quizId` 등 | 퀴즈 응시 |
| `[problemId]` | `/coding/problems/:problemId` | 코딩 문제 풀이 |
| `[examId]` | `/coding/exams/:examId`, `/exam/:examId` | 코딩 시험 / 종합시험 |
| `[id]` | `/courses/:id` | 코스 상세 |
| `[lessonId]` | `/courses/:id/lessons/:lessonId` | 레슨 상세 |

---

## 5. 파일 유형별 분류

### 5.1 Server Components vs Client Components

**Server Components (기본값):** `'use client'` 지시어가 없는 모든 파일

주요 Server Component 파일:
- 모든 `page.tsx` 파일 (데이터 페칭 후 Client Component에 전달)
- `src/app/(main)/layout.tsx` — 사용자 프로필 조회 후 MainShell에 전달
- `src/components/ui/CategoryHubPage.tsx` — 서버에서 카테고리 설정 렌더링

**Client Components:** `'use client'` 지시어가 있는 파일 (53개 확인)

주요 Client Component 파일:
- `*Client.tsx` 명명 패턴 — `DashboardClient.tsx`, `RankingClient.tsx`, `AdminUsersClient.tsx` 등
- 전체 `components/japanese/` — 10개 모두 Client Component
- 전체 `components/ui/` — 대부분 Client Component (인터랙션 필요)
- `src/app/providers.tsx` — React Query + Theme Provider

### 5.2 Server Actions

**`'use server'` 지시어 파일:** 17개 (모두 `src/app/actions/` 디렉토리)

```
actions/
├── auth.ts                 # 인증 (로그인/로그아웃)
├── admin.ts                # 관리자 기능
├── assessment.ts           # 평가 시험
├── scores.ts               # 점수 계산
├── quiz.ts                 # 퀴즈
├── range-quiz.ts           # 범위 퀴즈
├── coding.ts               # 코딩 제출
├── comprehensive-exam.ts   # 종합시험
├── learning-assignments.ts # 학습 과제
├── feedback.ts             # 피드백
├── mentor.ts               # 멘토 관리
├── notifications.ts        # 알림
├── profile.ts              # 프로필
├── onboarding.ts           # 온보딩
├── claims.ts               # JWT Claims
├── mastery.ts              # 마스터리
└── access-request.ts       # 접근 요청
```

### 5.3 유틸리티/설정 파일

| 파일 | 유형 | 역할 |
|------|------|------|
| `lib/assessment-config.ts` | 설정 + 유틸리티 | 5축 평가 시스템 전체 설정 |
| `lib/assignment-categories.ts` | 설정 | 학습 과제 카테고리 + QuizType 매핑 |
| `lib/navigation.ts` | 설정 | 내비게이션 구조 (메뉴, 카테고리 자식) |
| `lib/constants.ts` | 상수 | 카테고리 라벨 상수 |
| `lib/ranking.ts` | 유틸리티 | 랭킹 계산 순수 함수 |
| `lib/judge0/client.ts` | 클라이언트 | Judge0 API 래퍼 |
| `lib/code-review/analyzer.ts` | 유틸리티 | 규칙 기반 코드 리뷰 |
| `lib/supabase/client.ts` | 클라이언트 | 브라우저 Supabase |
| `lib/supabase/server.ts` | 클라이언트 | 서버 Supabase + Service Role |
| `lib/validations/auth.ts` | 검증 | Zod 로그인 스키마 |

### 5.4 타입 정의 파일

| 파일 | 정의 수 | 주요 내용 |
|------|---------|----------|
| `lib/supabase/types.ts` | 30+ type/interface | 전체 도메인 모델 (UserRole, Profile, Course, Quiz 등) |
| `lib/assessment-config.ts` | 3 type | SkillGrade, AxisKey, TargetCodingArea |
| `lib/navigation.ts` | 3 interface | NavItem, AdminNavItem, CategoryChild |
| `lib/assignment-categories.ts` | 2 interface | SubcategoryConfig, CategoryConfig |
| `lib/ranking.ts` | 3 type/interface | RankingUserData, ComputedRankingEntry, RankingCategory |

### 5.5 Supabase 쿼리 모듈

```
lib/supabase/queries/
├── assessments.ts    # 평가 시험 문제 추출 (난이도 균형, 카테고리 가중치)
├── coding.ts         # 코딩 문제/시험 목록 조회
├── courses.ts        # 코스/레슨 조회
├── profiles.ts       # 프로필/스킬 데이터 조회
├── quizzes.ts        # 일반 퀴즈 문제 조회
└── vocabulary.ts     # JLPT 어휘/용어집 조회
```

---

## 6. 변경 영향 분석

### 6.1 결합도 (Coupling) 분석

```
높은 결합도 (High Coupling):
┌─────────────────────────┐
│  lib/supabase/types.ts  │ ←── 거의 모든 파일이 의존
│  (전체 도메인 타입)       │     변경 시 전파 범위: 160+ 파일
└─────────────────────────┘

┌─────────────────────────┐
│  lib/navigation.ts      │ ←── UI 컴포넌트 전체가 의존
│  (내비게이션 설정)        │     변경 시 전파 범위: Sidebar, MobileNav,
└─────────────────────────┘     CategoryHubPage, 다수 page.tsx

┌──────────────────────────┐
│  lib/assessment-config.ts│ ←── 대시보드 + 온보딩 + 관리자 핵심
│  (5축 평가 허브)          │     변경 시 전파 범위: 11개 파일
└──────────────────────────┘

중간 결합도 (Medium Coupling):
  lib/supabase/server.ts     ←── 모든 Server Component + Server Action
  lib/supabase/client.ts     ←── 모든 Client Component (Supabase 직접 사용)
  components/ui/MainShell.tsx ←── (main) 전체 레이아웃

낮은 결합도 (Low Coupling):
  lib/judge0/client.ts       ←── coding 관련 Action만
  lib/code-review/analyzer.ts←── 코드 리뷰 Action만
  lib/ranking.ts             ←── ranking 페이지만
```

### 6.2 변경 빈도 추정

| 순위 | 폴더/파일 | 변경 빈도 | 이유 |
|------|----------|----------|------|
| 1 | `supabase/seed_*.sql` | 매우 높음 | 콘텐츠 추가/수정이 지속적 |
| 2 | `src/app/actions/` | 높음 | 비즈니스 로직 변경 시 직접 수정 |
| 3 | `src/app/(main)/` 페이지들 | 높음 | UI/UX 개선, 기능 추가 |
| 4 | `src/components/japanese/` | 중간 | 일본어 학습 기능 확장 |
| 5 | `src/lib/assessment-config.ts` | 중간 | 평가 체계 조정 시 |
| 6 | `src/components/ui/` | 낮음 | 안정화 단계 이후 변경 적음 |
| 7 | `supabase/migrations/` | 낮음 | 스키마 확정 후 변경 적음 |

### 6.3 개선 권장사항

**1. 타입 파일 분리 (lib/supabase/types.ts)**
- 현재 30+ 타입이 단일 파일에 집중. 도메인별 분리 권장:
  - `types/auth.ts` — UserRole, Profile
  - `types/quiz.ts` — QuizType, Quiz 관련
  - `types/coding.ts` — CodingRank, CodingProblem 관련
  - `types/japanese.ts` — JlptLevel, JlptGrammar 관련

**2. 빈 컴포넌트 폴더 정리**
- `components/charts/`와 `components/editor/`가 빈 상태. 구현 예정이 아니면 삭제 권장

**3. Server Action 그룹화**
- 17개 파일이 평탄 구조. 도메인별 하위 폴더 고려:
  - `actions/auth/` — auth, claims, access-request
  - `actions/assessment/` — assessment, scores, comprehensive-exam
  - `actions/learning/` — quiz, coding, mastery, learning-assignments

**4. navigation.ts 역할 과부하**
- 현재 내비게이션 구조 + 카테고리 자식 설정이 혼합. 분리 고려:
  - `navigation.ts` — 메뉴 아이템만
  - `category-config.ts` — 카테고리 자식 설정

---

## 7. 타 문서 참조

| 문서 | 참조 이유 |
|------|----------|
| [01_system_overview.md](./01_system_overview.md) | 시스템 전체 구조와 기술 스택 맥락 |
| [03_runtime_flow.md](./03_runtime_flow.md) | 폴더 간 실행 흐름 (요청 → middleware → page → action) |
| [04_data_architecture.md](./04_data_architecture.md) | `lib/supabase/` 폴더의 DB 레이어 상세 |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | `judge0/` 폴더의 인프라 구성 |
| [06_security_design.md](./06_security_design.md) | `middleware.ts`의 인증/RBAC 설계 상세 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | `assessment-config.ts` 도메인 모델 상세 |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | 6.3절 개선 권장사항의 구체적 리팩토링 계획 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 폴더 구조 이해를 위한 학습 순서 |

---

> **범례:** "확인" = 실제 파일 시스템 탐색으로 검증 완료 / "추정" = 파일 내용이나 명명 패턴에서 유추
