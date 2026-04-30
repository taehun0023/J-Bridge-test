# 09. 리팩토링 후보 (Refactoring Candidates)

> **문서 버전:** 1.1
> **최종 갱신:** 2026-02-15
> **대상 독자:** Senior Architect / Tech Lead
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 목차

0. [Phase 1-4 해결 현황](#0-phase-1-4-해결-현황)
1. [God Function 분석](#1-god-function-분석)
2. [즉시 리팩토링 대상 (Quick Wins)](#2-즉시-리팩토링-대상-quick-wins)
3. [모듈 분리 후보 (Module Extraction)](#3-모듈-분리-후보-module-extraction)
4. [마이크로서비스 경계 분석](#4-마이크로서비스-경계-분석)
5. [DB 리팩토링 제안](#5-db-리팩토링-제안)
6. [코드 품질 개선 로드맵](#6-코드-품질-개선-로드맵)
7. [리팩토링 리스크 평가](#7-리팩토링-리스크-평가)
8. [타 문서 참조](#8-타-문서-참조)

---

## 0. Phase 1-4 해결 현황

> **2026-02-15 커밋 `b27cce0`에서 Phase 1-4 리팩토링이 완료되었다.**
> 66개 파일 변경 (+4,872 / -2,375). 아래 표는 본 문서에서 식별한 설계 결함과 해결 상태를 요약한다.

### 0.1 해결 완료 항목

| # | 식별 섹션 | 문제 | 해결 방법 | 관련 파일 |
|:-:|-----------|------|-----------|-----------|
| 1 | 1.1 | `scores.ts` God Function (245줄, 혼합된 Query+Compute+Write) | `src/modules/scoring/` 모듈로 분리 — 8개 파일 (index.ts 오케스트레이터, 축별 계산 3개, fetch/write 분리, utils, types) | `src/modules/scoring/*.ts` |
| 2 | 1.2 | `comprehensive-exam.ts` 462줄, 6함수 집중 | `src/app/actions/comprehensive-exam/` 디렉토리로 분리 — request.ts, approval.ts, execution.ts, status.ts + barrel index.ts | `src/app/actions/comprehensive-exam/` |
| 3 | 1.3 | `admin.ts` 432줄, 5개 도메인 혼합 | `src/app/actions/admin/` 디렉토리로 분리 — users.ts, tasks.ts, content.ts, questions.ts, retake.ts, feedback.ts + barrel index.ts | `src/app/actions/admin/` |
| 4 | 2.1 | 인증 패턴 42회 반복 | `src/lib/auth-helpers.ts` 생성 — `requireAuth()`, `requireAdmin()`, `requireAdminOrMentor()` 3개 헬퍼. 16개 action 파일에 적용 | `src/lib/auth-helpers.ts` |
| 5 | 2.3 | 알림 발송 패턴 중복 (4곳) | `src/lib/notification-helpers.ts` 생성 — `notifyMentorsOf()`, `notifyAdmins()`, `notifyMentorsAndAdmins()`. fallback 클라이언트 패턴 지원 | `src/lib/notification-helpers.ts` |
| 6 | 2.4 | Fire-and-Forget `.catch(() => {})` 에러 흡수 (4곳) | `.catch((err) => console.error(...))` 패턴으로 전환. 4곳 모두 적용 | `coding.ts`, `quiz.ts`, `tts/route.ts` |
| 7 | 5.2 | `DB_Schema.md` vs 마이그레이션 갭 (미기재 테이블 13건 등) | `DB_Schema.md`를 마이그레이션 00049 기준으로 전면 갱신 | `DB_Schema.md` |
| 8 | 5.3 | 누락 인덱스 (우선순위 상 3건) | `00049_add_missing_indexes.sql` 마이그레이션 생성 — 6개 인덱스 추가 (quiz_questions 2개, coding_exam_attempts 1개, quiz_attempts 1개, comprehensive_exams 1개, learning_assignments 1개) | `supabase/migrations/00049_add_missing_indexes.sql` |
| 9 | 6 Phase 1 | CLAUDE.md 정보 갱신 | Next.js 14 -> 16, Chart.js -> recharts 등 실제 코드와 동기화 완료 | `CLAUDE.md` |
| 10 | 6 Phase 3 | 에러 처리 표준화 (응답 타입 통일) | `src/lib/action-types.ts` 생성 — `ActionResult<T>`, `ActionError`, `ActionSuccess<T>` 타입 + `ERR` 상수 객체. 전 action 파일에 적용 | `src/lib/action-types.ts` |
| 11 | 6 Phase 3 | 테스트 인프라 부재 (0건) | Vitest 4 설치 + `vitest.config.ts` 설정. scoring 모듈 단위 테스트 33건 작성 (axis-jlpt, axis-core-programming, axis-attitude, utils) | `vitest.config.ts`, `src/modules/scoring/*.test.ts` |
| 12 | 6 Phase 4 | `ignoreBuildErrors: true` → TypeScript 타입 검사 생략 | `ignoreBuildErrors` 설정 제거. TypeScript strict 빌드 0 에러 달성 | `next.config.ts` |
| 13 | 6 Phase 4 | 환경 변수 `!` Non-null Assertion | `src/lib/env.ts` 생성 — Zod 기반 서버 환경 변수 검증 레이어. 필수/선택 구분, 시작 시 검증 | `src/lib/env.ts` |

### 0.2 미해결 / 향후 과제

| # | 식별 섹션 | 문제 | 현재 상태 | 비고 |
|:-:|-----------|------|-----------|------|
| 1 | 3.2 | TTS 모듈 추출 (`tts/route.ts` → `modules/tts/`) | 미착수 | 독립적으로 분리 가능, 우선순위 중간 |
| 2 | 3.2 | Notification 모듈 추출 (helpers → `modules/notification/`) | 부분 완료 | `notification-helpers.ts`는 추출했으나 `modules/` 이동은 미착수 |
| 3 | 5.4 | Enum 정리 (`quiz_type` CHECK → 참조 테이블) | 미착수 | 현재 12종 CHECK 제약으로 동작 중, 추가 시 마이그레이션 필요 |
| 4 | 5.5 | 트랜잭션 도입 (RPC `recalculate_user_scores`) | 미착수 | `write-scores.ts` 분리 완료로 RPC 전환 기반은 마련됨 |
| 5 | 6 Phase 3 | CI/CD 파이프라인 (GitHub Actions) | 미착수 | |
| 6 | 6 Phase 4 | 모니터링 도입 (Sentry 등) | 미착수 | |
| 7 | 6 Phase 4 | E2E 테스트 (Playwright) | 미착수 | |

### 0.3 해결 효과 요약

```
Before (Phase 1-4 이전):
  scores.ts       293줄, 1함수에 Query+Compute+Write 혼합
  admin.ts        432줄, 15함수, 5도메인 혼합
  comprehensive-exam.ts  462줄, 6함수, 알림 중복
  인증 패턴 42회 반복 (17개 파일)
  테스트 0건, ignoreBuildErrors: true
  환경 변수 ! assertion

After (Phase 1-4 완료):
  src/modules/scoring/    8개 파일, 축별 독립 테스트 가능 (33 tests)
  admin/                  7개 파일, 도메인별 분리
  comprehensive-exam/     5개 파일, 관심사 분리
  auth-helpers.ts         3개 헬퍼로 인증 통합
  action-types.ts         ActionResult<T> 표준 응답 타입
  notification-helpers.ts 알림 패턴 통합
  env.ts                  Zod 환경 변수 검증
  vitest.config.ts        33 단위 테스트
  ignoreBuildErrors 제거, TypeScript strict 0 에러
```

---

## 1. God Function 분석

### 1.1 scores.ts — recalculateUserScores()

> **[해결됨 — Phase 2]** `src/modules/scoring/` 모듈로 분리 완료. 오케스트레이터(index.ts ~30줄) + 축별 계산 함수 3개 + fetch/write 분리 + utils/types. 33개 단위 테스트 작성.

**파일:** `src/app/actions/scores.ts:L18-262`
**줄 수:** 245줄 (단일 함수)
**추정 Cyclomatic Complexity:** 18~22 (분기 14개 + 루프 4개)

#### 혼합된 책임 (Mixed Concerns)

```
recalculateUserScores()
  ├── [Query] profiles.select (is_japanese 확인)          L22-28
  ├── [Query] quiz_attempts.select + JOIN quizzes          L31-36
  ├── [Compute] Assessment vs Regular 분류                 L39-60
  ├── [Compute] Axis 1: 生活日本語 (가중 평균)              L76-99
  ├── [Compute] Axis 2: ビジネス日本語 (가중 평균)          L101-118
  ├── [Query] code_submissions.select + JOIN               L121-124
  ├── [Compute] Axis 3: CS知識 (코드 제출 분석)            L126-162
  ├── [Query] coding_exam_attempts.select + JOIN           L165-169
  ├── [Compute] Axis 4: 開発実務能力 (등급 기반)           L171-187
  ├── [Compute] Axis 5: ビジネスリテラシー                 L190-201
  ├── [Write] japanese_skills UPSERT                       L205-217
  ├── [Write] coding_skills UPSERT                         L219-232
  ├── [Write] attitude_culture_skills UPSERT               L234-244
  ├── [Write] dispatch_readiness_scores INSERT             L247-255
  └── [Cache] revalidatePath x3                            L257-259
```

**문제점:**
1. **단일 함수에 Query + Compute + Write 3개 관심사가 혼합**되어 있다
2. 8개 DB 쿼리가 **트랜잭션 없이** 순차 실행된다 (04_data_architecture.md 4.2절 참조)
3. 축별 계산 로직이 분리되지 않아 **개별 축 테스트가 불가능**하다
4. `avg()` 헬퍼가 함수 내부에 인라인 정의되어 있다 (L70-73)

#### 제안 분리안

```
src/
  modules/
    scoring/
      index.ts                    ← recalculateUserScores() (오케스트레이터)
      fetch-scoring-data.ts       ← Q1~Q4 읽기 쿼리 통합 (Promise.all)
      axis-jlpt.ts                ← Axis 1 계산 (生活日本語)
      axis-it-japanese.ts         ← Axis 2 계산 (ビジネス日本語)
      axis-core-programming.ts    ← Axis 3 계산 (CS知識)
      axis-framework.ts           ← Axis 4 계산 (開発実務能力)
      axis-attitude.ts            ← Axis 5 계산 (ビジネスリテラシー)
      write-scores.ts             ← Q5~Q8 쓰기 (향후 RPC 트랜잭션 대체 가능)
      utils.ts                    ← avg(), difficultyMultiplier 등 공통 유틸
```

#### Before/After 구조도

```
Before:
┌─────────────────────────────────────────────────────────────┐
│              recalculateUserScores() [245줄]                 │
│                                                             │
│  SELECT profiles ──> 분류 ──> Axis1 계산 ──> Axis2 계산 ──>│
│  SELECT submissions ──> Axis3 계산 ──> SELECT exams ──>     │
│  Axis4 계산 ──> Axis5 계산 ──> UPSERT x3 ──> INSERT x1    │
│                                                             │
│  (모든 로직이 단일 함수에 직렬 나열)                          │
└─────────────────────────────────────────────────────────────┘

After:
┌──────────────────────────────────────────────────────────────┐
│  recalculateUserScores() [~30줄, 오케스트레이터]              │
│                                                              │
│  const data = await fetchScoringData(userId)                 │
│       │                                                      │
│       ├──> calcJlptAxis(data)        ──┐                     │
│       ├──> calcItJapaneseAxis(data)  ──┤                     │
│       ├──> calcCoreAxis(data)        ──┼── AxisResults       │
│       ├──> calcFrameworkAxis(data)   ──┤                     │
│       └──> calcAttitudeAxis(data)    ──┘                     │
│                                          │                   │
│  await writeScores(userId, results)  <───┘                   │
│  revalidatePaths()                                           │
└──────────────────────────────────────────────────────────────┘
```

**효과:**
- 각 축 계산 함수를 **독립적으로 단위 테스트** 가능
- `fetchScoringData()`에서 Q1~Q4를 `Promise.all()`로 **병렬 실행** 가능 (~40% 속도 개선 추정)
- `writeScores()`를 향후 Supabase RPC로 대체하여 **트랜잭션 보장** 가능

---

### 1.2 comprehensive-exam.ts

> **[해결됨 — Phase 2]** `src/app/actions/comprehensive-exam/` 디렉토리로 분리 완료. request.ts, approval.ts, execution.ts, status.ts + barrel index.ts.

**파일:** `src/app/actions/comprehensive-exam.ts`
**줄 수:** 462줄
**함수 수:** 6개

#### 함수 인벤토리

| 함수 | 줄 범위 | 줄 수 | 책임 |
|------|---------|:-----:|------|
| `requestExam()` | L8-90 | 83 | 인증 + 중복 검사 + INSERT + mentor/admin 알림 |
| `approveExam()` | L92-143 | 52 | 인증 + 권한 + 상태 전이 + mentee 알림 |
| `denyExam()` | L145-191 | 47 | 인증 + 권한 + 상태 전이 + mentee 알림 |
| `startExam()` | L193-274 | 82 | 인증 + 소유권 + 문제 조합 + 상태 전이 |
| `submitExam()` | L276-367 | 92 | 인증 + 소유권 + 채점 + 답안 저장 + mentor 알림 |
| `requestRetakeExam()` | L382-461 | 80 | 인증 + 상태 검증 + 새 시험 생성 + mentor/admin 알림 |

#### 혼합된 관심사

```
requestExam():
  ├── [Auth] createClient() → auth.getUser()                인증
  ├── [Validation] 중복 시험 검사                             비즈니스 규칙
  ├── [Write] comprehensive_exams INSERT                     시험 생성
  ├── [Query] mentor_mentee_assignments.select               알림 대상 조회
  ├── [Query] profiles.select (full_name)                    알림 내용 구성
  ├── [Notification] createNotification() x N (mentors)      알림 발송
  └── [Notification] createNotification() x N (admins)       알림 발송
```

**문제점:**
1. **인증 패턴 반복**: 6개 함수 모두 동일한 `createClient() → auth.getUser() → if (!user)` 패턴 반복
2. **권한 검증 반복**: `approveExam`, `denyExam` 등에서 동일한 admin/mentor 역할 검증 반복
3. **알림 로직 인라인**: mentor/admin 조회 + 반복 알림 발송이 비즈니스 로직에 직접 포함
4. **파일 크기**: 462줄은 Server Action 파일로서 과도 (비교: `auth.ts` 35줄, `quiz.ts` 114줄)

#### 제안 분리안

```
현재:
  comprehensive-exam.ts [462줄, 6함수]

제안:
  comprehensive-exam/
    request.ts           ← requestExam(), requestRetakeExam()  [~120줄]
    approval.ts          ← approveExam(), denyExam()           [~80줄]
    execution.ts         ← startExam(), submitExam()           [~150줄]
    status.ts            ← getExamStatus()                     [~15줄]

  helpers/
    exam-notification.ts ← notifyMentorsAndAdmins(), notifyMentee()
```

#### 의존성 분석

```
comprehensive-exam.ts
  ├── @/lib/supabase/server        (createClient, createServiceRoleClient)
  ├── next/cache                   (revalidatePath)
  ├── ./notifications              (createNotification)
  └── @/lib/assignment-categories  (ASSIGNMENT_CATEGORIES)

의존하는 컴포넌트:
  ├── src/app/(main)/exam/[examId]/  (startExam, submitExam, getExamStatus)
  ├── src/app/(main)/admin/tasks/    (approveExam, denyExam)
  └── src/app/(main)/dashboard/      (requestExam, requestRetakeExam)
```

분리 시 import 경로 변경이 필요하나, barrel export (`index.ts`)로 **하위 호환성 유지** 가능.

---

### 1.3 admin.ts

> **[해결됨 — Phase 2]** `src/app/actions/admin/` 디렉토리로 분리 완료. users.ts, tasks.ts, content.ts, questions.ts, retake.ts, feedback.ts + barrel index.ts (7개 파일).

**파일:** `src/app/actions/admin.ts`
**줄 수:** 432줄
**함수 수:** 15개

#### 함수 인벤토리 (도메인별)

| 도메인 | 함수 | 줄 범위 | 줄 수 |
|--------|------|---------|:-----:|
| **Auth Helper** | `assertAdmin()` | L7-25 | 19 |
| **User Mgmt** | `updateUserRole()` | L29-40 | 12 |
| **User Mgmt** | `createUserAccount()` | L42-79 | 38 |
| **Task** | `createTaskAssignment()` | L83-108 | 26 |
| **Task** | `deleteTaskAssignment()` | L110-121 | 12 |
| **Feedback** | `createFeedback()` | L125-174 | 50 |
| **Feedback** | `updateFeedback()` | L176-191 | 16 |
| **Feedback** | `deleteFeedback()` | L193-208 | 16 |
| **Retake** | `approveRetakeRequest()` | L212-242 | 31 |
| **Retake** | `denyRetakeRequest()` | L244-273 | 30 |
| **Content** | `updateCoursePublished()` | L277-288 | 12 |
| **Content** | `deleteCourse()` | L290-301 | 12 |
| **Question** | `createQuestion()` | L320-367 | 48 |
| **Question** | `updateQuestion()` | L369-405 | 37 |
| **Question** | `deleteQuestion()` | L407-418 | 12 |
| **Question** | `toggleQuestionPublished()` | L420-431 | 12 |

#### 문제점

1. **5개 도메인이 단일 파일에 혼합**: User Management, Task Assignment, Feedback, Retake Management, Content/Question Management
2. `assertAdmin()` 패턴은 **이 파일 내에서만** 사용됨 — 다른 파일(`comprehensive-exam.ts`, `feedback.ts` 등)은 각자 인라인으로 인증/권한 검증을 반복
3. `createFeedback()`은 admin/mentor 모두 사용 가능하나 `admin.ts`에 배치되어 있어 명명이 부정확

#### 제안 분리안

```
현재:
  admin.ts [432줄, 15함수 + 1 helper]

제안:
  admin/
    users.ts              ← assertAdmin(), updateUserRole(), createUserAccount()    [~70줄]
    tasks.ts              ← createTaskAssignment(), deleteTaskAssignment()           [~45줄]
    content.ts            ← updateCoursePublished(), deleteCourse()                  [~30줄]
    questions.ts          ← createQuestion(), updateQuestion(),                      [~120줄]
                             deleteQuestion(), toggleQuestionPublished()
    retake.ts             ← approveRetakeRequest(), denyRetakeRequest()              [~65줄]

  feedback.ts (기존 파일에 통합):
    ← createFeedback(), updateFeedback(), deleteFeedback()
    (admin/mentor 공통이므로 admin 폴더 외부가 적절)
```

---

### 1.4 God Function 종합 비교

| 파일 | 줄 수 | 함수 수 | 혼합 관심사 | 분리 우선순위 |
|------|:-----:|:-------:|:-----------:|:------------:|
| `scores.ts` | 293 | 2 | Query+Compute+Write (3) | **최고** — 비즈니스 로직 핵심, 테스트 필수 |
| `comprehensive-exam.ts` | 462 | 6 | Auth+Logic+Notification (3) | **높음** — 가장 긴 파일, 알림 중복 |
| `admin.ts` | 432 | 16 | 5개 도메인 혼합 | **높음** — 도메인별 분리 용이 |
| `coding.ts` | 151 | 2 | Auth+Judge0+Review+Score (4) | 중간 — 복합이나 적정 크기 |
| `quiz.ts` | 114 | 2 | Auth+Grade+Score (3) | 낮음 — 적정 크기 |

---

## 2. 즉시 리팩토링 대상 (Quick Wins)

### 2.1 인증 헬퍼 추출

> **[해결됨 — Phase 1]** `src/lib/auth-helpers.ts` 생성. `requireAuth()`, `requireAdmin()`, `requireAdminOrMentor()` 3개 헬퍼로 16개 action 파일의 인증 패턴 통합 완료. `ERR` 상수(`src/lib/action-types.ts`)와 연동하여 에러 메시지도 표준화.

**현재 상태 (확인):** 17개 Server Action 파일에서 총 **42회** 동일한 인증 패턴이 반복된다.

```typescript
// 현재: 모든 Server Action 파일에서 반복되는 패턴
const supabase = await createClient()
const { data: { user } } = await supabase.auth.getUser()
if (!user) return { error: '認証が必要です' }

// 권한 검증이 필요한 경우 추가 반복
const { data: profile } = await supabase
  .from('profiles')
  .select('role')
  .eq('id', user.id)
  .single()
if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
  return { error: '権限がありません' }
```

**제안: `src/lib/auth-helpers.ts`**

```typescript
// 제안: 공통 인증 헬퍼
export async function requireAuth() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' } as const
  return { supabase, user } as const
}

export async function requireAdmin() {
  const result = await requireAuth()
  if ('error' in result) return result
  const { supabase, user } = result

  const { data: profile } = await supabase
    .from('profiles').select('role').eq('id', user.id).single()
  if (profile?.role !== 'admin') return { error: '権限がありません' } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' } as const

  return { supabase, serviceClient, user, profile } as const
}

export async function requireAdminOrMentor() {
  const result = await requireAuth()
  if ('error' in result) return result
  const { supabase, user } = result

  const { data: profile } = await supabase
    .from('profiles').select('role').eq('id', user.id).single()
  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
    return { error: '権限がありません' } as const

  return { supabase, user, profile } as const
}
```

**영향 범위:** 16개 action 파일, 42개 인증 호출 지점
**난이도:** 하 (기계적 치환)
**리스크:** 낮음 (기존 동작 보존)

---

### 2.2 admin.ts 도메인별 분리

> **[해결됨 — Phase 2]** 1.3절 참조. 제안대로 도메인별 분리 + barrel export(`admin/index.ts`) 적용 완료.

**현재:** 단일 파일에 5개 도메인 (User, Task, Feedback, Content, Question)
**제안:** 도메인별 파일 분리 + barrel export로 하위 호환 유지

```typescript
// admin/index.ts (barrel export - 기존 import 호환)
export { updateUserRole, createUserAccount } from './users'
export { createTaskAssignment, deleteTaskAssignment } from './tasks'
export { createFeedback, updateFeedback, deleteFeedback } from './feedback'
export { updateCoursePublished, deleteCourse } from './content'
export { createQuestion, updateQuestion, deleteQuestion, toggleQuestionPublished } from './questions'
export { approveRetakeRequest, denyRetakeRequest } from './retake'
```

**영향 범위:** admin.ts → 6개 파일로 분리
**난이도:** 하 (함수 이동 + re-export)
**리스크:** 낮음 (barrel export로 외부 영향 없음)

---

### 2.3 알림 발송 패턴 추출

> **[해결됨 — Phase 2]** `src/lib/notification-helpers.ts` 생성. `notifyMentorsOf()`, `notifyAdmins()`, `notifyMentorsAndAdmins()` 3개 헬퍼. Service role key 미설정 시 fallback 클라이언트 패턴 지원.

**현재 상태 (확인):** `comprehensive-exam.ts`와 `admin.ts`에서 mentor/admin 조회 + 반복 알림 발송 패턴이 3회 이상 중복된다.

```typescript
// 반복 패턴 1: mentor 조회 + 알림 (comprehensive-exam.ts:L43-68, L339-361, L417-456)
const { data: mentorAssignments } = await serviceClient
  .from('mentor_mentee_assignments')
  .select('mentor_id')
  .eq('mentee_id', user.id)

for (const assignment of mentorAssignments ?? []) {
  await createNotification(assignment.mentor_id, ...)
}

// 반복 패턴 2: admin 조회 + 알림 (comprehensive-exam.ts:L71-86, L442-456)
const { data: admins } = await serviceClient
  .from('profiles').select('id').eq('role', 'admin')

for (const admin of admins ?? []) {
  await createNotification(admin.id, ...)
}
```

**제안: `src/lib/notification-helpers.ts`**

```typescript
export async function notifyMentorsOf(
  menteeId: string,
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string
) { ... }

export async function notifyAdmins(
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string
) { ... }

export async function notifyMentorsAndAdmins(
  menteeId: string,
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string
) { ... }
```

**영향 범위:** `comprehensive-exam.ts` (3곳), `learning-assignments.ts` (1곳)
**난이도:** 하
**리스크:** 낮음

---

### 2.4 Fire-and-Forget 에러 로깅

> **[해결됨 — Phase 1]** 4곳 모두 `.catch((err) => console.error('[Context]', err))` 패턴으로 전환 완료.

**현재 상태 (확인):** 4곳에서 `.catch(() => {})` 패턴으로 에러를 완전 무시한다.

| 위치 | 호출 | 실패 시 영향 |
|------|------|-------------|
| `coding.ts:L98` | `recalculateUserScores().catch(() => {})` | 점수 미반영 |
| `quiz.ts:L101` | `recalculateUserScores().catch(() => {})` | 점수 미반영 |
| `quiz.ts:L105` | `checkAssignmentProgress().catch(() => {})` | 과제 진행률 미반영 |
| `tts/route.ts:L219` | `saveToCache().catch(() => {})` | 캐시 미저장 |

**제안:** 최소한 `console.error` 로깅 추가

```typescript
// Before
recalculateUserScores(user.id).catch(() => {})

// After
recalculateUserScores(user.id).catch((err) =>
  console.error('[Score Recalculation Failed]', user.id, err)
)
```

**영향 범위:** 4곳 (3개 파일)
**난이도:** 최하
**리스크:** 없음

---

### 2.5 Quick Wins 우선순위 정리

| # | 항목 | 난이도 | 리스크 | 소요 시간 (추정) | 효과 | 상태 |
|:-:|------|:------:|:------:|:-------:|------|:----:|
| 1 | Fire-and-Forget 에러 로깅 | 최하 | 없음 | 30분 | 운영 가시성 확보 | **해결됨** |
| 2 | 인증 헬퍼 추출 | 하 | 낮음 | 2시간 | 코드 중복 42곳 제거 | **해결됨** |
| 3 | 알림 발송 패턴 추출 | 하 | 낮음 | 1시간 | 중복 패턴 4곳 제거 | **해결됨** |
| 4 | admin.ts 도메인 분리 | 하 | 낮음 | 2시간 | 432줄 → 7개 파일 | **해결됨** |
| 5 | legacy 함수 제거 | 최하 | 없음 | 15분 | notifications.ts:L119-136 | 미착수 |

---

## 3. 모듈 분리 후보 (Module Extraction)

### 3.1 현재 구조 vs 제안 구조

> **[부분 해결됨 — Phase 2]** `scoring/` 모듈 추출 완료. `admin/`, `comprehensive-exam/` 디렉토리 분리 완료. `auth-helpers.ts`, `notification-helpers.ts` lib 레이어 추출 완료. TTS 모듈, Notification 모듈의 `modules/` 이동은 미착수.

```
현재:
  src/
    app/
      actions/                    ← 17개 Server Action 파일 (flat)
        scores.ts     [293줄]
        admin.ts      [432줄]
        comprehensive-exam.ts [462줄]
        coding.ts     [151줄]
        quiz.ts       [114줄]
        notifications.ts [137줄]
        feedback.ts   [110줄]
        ...
      api/
        tts/route.ts  [232줄]     ← TTS 로직 인라인
    lib/
      supabase/                   ← Supabase 클라이언트 + 쿼리
      judge0/                     ← Judge0 API 클라이언트
      code-review/                ← 코드 리뷰 분석기

제안:
  src/
    modules/
      scoring/                    ← 점수 계산 모듈
        index.ts                  ← recalculateUserScores() 오케스트레이터
        fetch-scoring-data.ts     ← DB 쿼리 (읽기)
        axis-jlpt.ts              ← Axis 1 계산
        axis-it-japanese.ts       ← Axis 2 계산
        axis-core-programming.ts  ← Axis 3 계산
        axis-framework.ts         ← Axis 4 계산
        axis-attitude.ts          ← Axis 5 계산
        write-scores.ts           ← DB 쓰기 (향후 RPC 대체)
        utils.ts                  ← 공통 유틸리티
        __tests__/                ← 단위 테스트
      tts/                        ← TTS 모듈
        synthesize.ts             ← Google TTS API 호출
        dialogue-parser.ts        ← 대화문 파싱 (parseDialogueScript)
        cache.ts                  ← Storage 캐시 (getFromCache, saveToCache)
        voice-pool.ts             ← 화자 음성 풀 설정
        route.ts                  ← HTTP 핸들러 (얇은 레이어)
      judge0/                     ← Judge0 모듈 (기존 lib/judge0 확장)
        client.ts                 ← API 클라이언트 (기존 유지)
        types.ts                  ← Judge0 타입 정의 추출
        batch-submit.ts           ← 향후 배치 제출 지원
      notification/               ← 알림 모듈
        create.ts                 ← createNotification()
        helpers.ts                ← notifyMentors(), notifyAdmins()
        types.ts                  ← NotificationType 등
    app/
      actions/                    ← 얇은 Server Action (인증 + 모듈 호출)
    lib/
      auth-helpers.ts             ← requireAuth(), requireAdmin()
      supabase/                   ← 기존 유지
```

### 3.2 모듈별 상세

#### scoring/ 모듈

**이동 대상:**
- `src/app/actions/scores.ts` → `src/modules/scoring/`
- `src/lib/assessment-config.ts`의 `ASSESSMENT_QUIZ_IDS`, `ASSESSMENT_ID_TO_STEP` → import로 참조 유지

**의존성:**
```
scoring/
  ├── 입력: @/lib/supabase/server (createClient, createServiceRoleClient)
  ├── 입력: @/lib/assessment-config (ASSESSMENT_QUIZ_IDS)
  ├── 출력: revalidatePath (next/cache)
  └── 호출원: coding.ts, quiz.ts, admin batch
```

**마이그레이션 전략:**
1. `scoring/` 모듈 생성, 축별 계산 함수 이동
2. `actions/scores.ts`는 모듈 호출 래퍼로 유지 (하위 호환)
3. 단위 테스트 추가 후 래퍼 제거

#### tts/ 모듈

**이동 대상:**
- `src/app/api/tts/route.ts`의 비즈니스 로직 → `src/modules/tts/`
- Route handler는 `src/app/api/tts/route.ts`에 얇은 레이어로 유지

**의존성:**
```
tts/
  ├── 입력: process.env.GOOGLE_CLOUD_TTS_API_KEY
  ├── 입력: @/lib/supabase/server (Storage 접근)
  ├── 출력: Buffer (audio/mpeg)
  └── 호출원: /api/tts route, /api/admin/tts-precache route
```

**마이그레이션 전략:**
1. `parseDialogueScript()`, `groupSegments()`, `synthesize()`, 캐시 함수를 모듈로 이동
2. Route handler는 인증 + 입력 검증 + 모듈 호출만 담당
3. `synthesize()` 함수를 `Promise.all()`로 병렬화 가능한 구조로 리팩토링

#### notification/ 모듈

**이동 대상:**
- `src/app/actions/notifications.ts`의 `createNotification()` → `src/modules/notification/create.ts`
- 2.3절의 알림 헬퍼 → `src/modules/notification/helpers.ts`

**마이그레이션 전략:**
1. `createNotification()` 함수 이동
2. 기존 import 경로를 barrel re-export로 유지
3. mentor/admin 알림 헬퍼 추가

---

## 4. 마이크로서비스 경계 분석

### 4.1 현재 규모 평가

| 항목 | 현재 | 비고 |
|------|------|------|
| 사용자 수 | ~50명 (추정) | 사내 LMS, 초대 전용 |
| 개발 팀 | 1명~소수 (추정) | CLAUDE.md 기반 |
| 동시 접속 | ~10-20명 (추정) | 사내 사용 |
| 데이터 볼륨 | ~14,400 콘텐츠 레코드 | Seed 기준 |
| 배포 빈도 | 미확인 | CI/CD 미구성 |

### 4.2 모놀리스 유지 권장

**결론:** 현재 규모에서는 **모놀리스 + 내부 모듈화**가 최적이다.

```
┌─────────────────────────────────────────────────────────────────┐
│                    Next.js Monolith                              │
│                                                                 │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────────┐   │
│  │ Scoring  │  │   TTS    │  │  Judge0  │  │ Notification │   │
│  │ Module   │  │  Module  │  │  Module  │  │   Module     │   │
│  └──────────┘  └──────────┘  └──────────┘  └──────────────┘   │
│       │              │             │              │             │
│       └──────────────┴─────────────┴──────────────┘             │
│                          │                                       │
│                    Shared Layer                                  │
│              (auth-helpers, supabase, types)                     │
└─────────────────────────────────────────────────────────────────┘
```

### 4.3 마이크로서비스가 필요한 조건 (if-then 분석)

| 조건 | 분리 후보 | 근거 |
|------|----------|------|
| 사용자 500명+ 또는 동시 접속 100명+ | **Judge0 Wrapper Service** | Judge0 폴링이 Server Action 스레드를 장시간 점유. 별도 Worker로 분리하면 메인 서버 부하 해소 |
| TTS 요청 초당 10건+ | **TTS Caching Service** | Google TTS API rate limit + Storage I/O 분리 |
| 점수 재계산 지연 5초+ | **Scoring Service** | 비동기 큐(BullMQ 등)로 백그라운드 처리 |
| 멀티 팀 (3팀+) 개발 | **도메인별 서비스 분리** | 팀 간 독립 배포가 필요한 경우 |

### 4.4 분리 시 의사결정 매트릭스

```
                  분리 복잡도 (HIGH)
                      │
    TTS Service ──────┤
    (중간 복잡도,      │
     독립적)           │
                      │
    Scoring Service ──┤
    (높은 복잡도,      │    Judge0 Worker ─────┤
     DB 의존)         │    (중간 복잡도,        │
                      │     네트워크 독립)      │
                      │                        │
                      └────────────────────────── 분리 효과 (HIGH)
```

**현재 권장:** 모놀리스 내 모듈 경계를 명확히 한 뒤, 필요 시 모듈 단위로 서비스 추출. 이는 [08_scalability_analysis.md](./08_scalability_analysis.md)의 권장 사항과 일치한다.

---

## 5. DB 리팩토링 제안

### 5.1 미사용 테이블 (추정)

[04_data_architecture.md](./04_data_architecture.md) 7.3절에서 식별된 미사용 추정 테이블:

| 테이블 | 상태 | 근거 | 제안 |
|--------|------|------|------|
| `ranking_seasons` | **미사용 추정** | Server Action 없음, 랭킹 계산은 `lib/ranking.ts`에서 별도 처리 | 향후 시즌제 도입 시까지 유지 (데이터 없으므로 비용 없음) |
| `user_rankings` | **미사용 추정** | `ranking_seasons`에 의존, Seed 데이터만 존재 | 동일 |
| `projects` | **미사용 추정** | Seed 데이터 없음, 관련 UI 미확인 | `code_submissions`의 `project_id` FK가 존재하므로 삭제 시 주의 |
| `project_requirements` | **미사용 추정** | `projects`에 의존 | 동일 |
| `lesson_resources` | **미사용 추정** | 관련 UI/쿼리 미확인 | 향후 학습 자료 첨부 시 활용 가능 |

**권장:** 미사용 테이블은 **삭제하지 않고 유지**한다. 데이터가 없으므로 스토리지 비용이 발생하지 않으며, 향후 기능 확장 시 재활용 가능하다. 다만 `DB_Schema.md`에 "미사용 (reserved)" 표시를 추가한다.

### 5.2 스키마 문서 갱신 갭

> **[해결됨 — Phase 3]** `DB_Schema.md`를 마이그레이션 00049 기준으로 전면 갱신 완료. 미기재 테이블 13건, 미기재 컬럼 12건, 제약조건 변경 3건 모두 반영.

**확인:** [04_data_architecture.md](./04_data_architecture.md) 7.1절에서 식별된 `DB_Schema.md` vs 실제 마이그레이션 갭:

| 갭 유형 | 건수 | 대표 사례 |
|---------|:----:|----------|
| 미기재 테이블 | 13 | `notifications`, `comprehensive_exams`, `cs_terms` 등 |
| 미기재 컬럼 | 12 | `profiles.is_japanese`, `quiz_questions.is_published` 등 |
| 제약조건 변경 | 3 | `quiz_type` CHECK (7종 → 12종) |

**제안:** `DB_Schema.md`를 **현재 마이그레이션(00048) 기준으로 전면 갱신**하거나, Supabase CLI `supabase gen types typescript`로 자동 생성 타입과 동기화한다.

### 5.3 인덱스 추가 제안

> **[해결됨 — Phase 3]** `supabase/migrations/00049_add_missing_indexes.sql` 마이그레이션 생성. 제안된 3개 + 추가 3개(retake_status, comprehensive_exams status, learning_assignments progress) = 총 6개 인덱스 추가.

[04_data_architecture.md](./04_data_architecture.md) 5.3절에서 식별된 누락 인덱스 중 **우선순위 상** 항목:

| # | 테이블 | 제안 인덱스 | 근거 |
|:-:|--------|------------|------|
| 1 | `quiz_questions` | `(quiz_id, is_published, difficulty)` | Assessment 핵심 쿼리 (`fetchAllQuestions()`) |
| 2 | `quiz_questions` | `(quiz_id, question_category)` | `fetchRandomByCategory()` 쿼리 |
| 3 | `coding_exam_attempts` | `(user_id, passed) WHERE passed = TRUE` | `recalculateUserScores()` 에서 passed=true만 조회 |

**제안 마이그레이션:**
```sql
-- 00049_add_missing_indexes.sql
CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_published_diff
  ON quiz_questions (quiz_id, is_published, difficulty);

CREATE INDEX IF NOT EXISTS idx_quiz_questions_quiz_category
  ON quiz_questions (quiz_id, question_category);

CREATE INDEX IF NOT EXISTS idx_coding_exam_attempts_user_passed
  ON coding_exam_attempts (user_id)
  WHERE passed = TRUE;
```

### 5.4 Enum 정리

**확인:** `quiz_type` CHECK 제약조건이 3회에 걸쳐 확장되었다 (00007 → 00025 → 00043/00046).

```
Phase 1 (00007): jlpt_vocab, jlpt_grammar, core_programming, framework, attitude_culture,
                 it_terminology, role_play_scenario
Phase 3 (00025): + jlpt_reading, jlpt_listening
Phase 6 (00043): + business_expression, sentence_pattern
Phase 6 (00046): + cs_knowledge
현재 총 12종
```

**제안:** 향후 타입 추가 시 마이그레이션으로 CHECK 제약을 수정하는 대신, PostgreSQL `ENUM` 타입 또는 별도 `quiz_types` 참조 테이블 도입을 검토한다. CHECK 제약 수정은 **DDL 변경**이므로, 참조 테이블 방식이 운영 중 추가에 더 유연하다.

### 5.5 트랜잭션 도입 제안

**현재 (확인):** `recalculateUserScores()`의 Q5~Q8 쓰기 쿼리가 트랜잭션 없이 순차 실행된다.

**제안:** Supabase RPC(PostgreSQL Function)로 쓰기 로직을 이전하여 원자성을 보장한다.

```sql
-- 제안: recalculate_user_scores RPC
CREATE OR REPLACE FUNCTION recalculate_user_scores(
  p_user_id UUID,
  p_jlpt_data JSONB,
  p_coding_data JSONB,
  p_attitude_data JSONB,
  p_readiness_data JSONB
) RETURNS VOID AS $$
BEGIN
  -- 단일 트랜잭션 내에서 4개 UPSERT/INSERT 실행
  INSERT INTO japanese_skills (...) VALUES (...) ON CONFLICT (user_id) DO UPDATE SET ...;
  INSERT INTO coding_skills (...) VALUES (...) ON CONFLICT (user_id) DO UPDATE SET ...;
  INSERT INTO attitude_culture_skills (...) VALUES (...) ON CONFLICT (user_id) DO UPDATE SET ...;
  INSERT INTO dispatch_readiness_scores (...) VALUES (...);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
```

이 방식은 [04_data_architecture.md](./04_data_architecture.md) 4.5절 및 [08_scalability_analysis.md](./08_scalability_analysis.md) 2.1절에서 권장한 접근 방식과 동일하다.

---

## 6. 코드 품질 개선 로드맵

### Phase 1 (1주): Quick Wins — 해결됨

```
Week 1: 즉시 실행 가능한 저리스크 개선 [전체 완료]
─────────────────────────────────────────────────

[1일차]
  ├── .catch(() => {}) → .catch(console.error) 변환 (4곳)
  ├── notifications.ts legacy 함수 제거 (L119-136)
  └── CLAUDE.md 정보 갱신 (Next.js 14 → 16, Chart.js → recharts)

[2일차]
  ├── lib/auth-helpers.ts 생성
  ├── auth-helpers 단위 테스트 작성
  └── 2개 파일에 시범 적용 (quiz.ts, coding.ts)

[3-4일차]
  ├── admin.ts 도메인별 분리 (→ 6개 파일)
  ├── barrel export 설정
  └── import 경로 검증

[5일차]
  ├── 알림 헬퍼 추출 (notification-helpers.ts)
  ├── comprehensive-exam.ts에 적용
  └── npm run build 검증 (ignoreBuildErrors가 true이므로 참고용)
```

### Phase 2 (2주): Module Extraction — 해결됨 (scoring, admin, comprehensive-exam, auth-helpers, notification-helpers)

```
Week 2-3: 모듈 분리 및 구조 개선 [scoring/admin/exam 완료, tts/notification 모듈 미착수]
─────────────────────────────────────────────────

[Week 2]
  ├── scoring/ 모듈 생성
  │   ├── 축별 계산 함수 분리 (5개 파일)
  │   ├── fetchScoringData() 읽기 쿼리 통합 (Promise.all)
  │   ├── writeScores() 쓰기 함수 분리
  │   └── 각 축 계산 함수 단위 테스트 작성
  │
  ├── auth-helpers 전체 action 파일 적용 (16개 파일)
  └── comprehensive-exam.ts 분리 (request/approval/execution)

[Week 3]
  ├── tts/ 모듈 생성
  │   ├── dialogue-parser.ts 추출
  │   ├── cache.ts 추출
  │   ├── synthesize.ts 추출 + Promise.all 병렬화 검토
  │   └── route.ts 얇은 레이어로 리팩토링
  │
  ├── notification/ 모듈 생성
  │   ├── create.ts (기존 createNotification 이동)
  │   └── helpers.ts (notifyMentors, notifyAdmins)
  └── judge0/types.ts 타입 분리
```

### Phase 3 (3주): Architecture Improvement — 부분 해결됨 (ActionResult, DB 인덱스, Vitest 33 tests, DB_Schema.md)

```
Week 4-6: 아키텍처 수준 개선 [에러 타입/인덱스/테스트/스키마 문서 완료, CI/RPC 미착수]
─────────────────────────────────────────────────

[Week 4]
  ├── 에러 처리 표준화
  │   ├── Server Action 에러 응답 타입 통일 ({ error: string } | { success: true, ... })
  │   ├── 에러 메시지 언어 통일 (일본어 or 한국어 — 현재 혼용)
  │   └── API Route 에러 응답 표준화 (HTTP status + JSON body)
  │
  └── DB 스키마 정비
      ├── DB_Schema.md 전면 갱신 (00048 기준)
      ├── 누락 인덱스 추가 (마이그레이션 00049)
      └── quiz_type Enum 정리 검토

[Week 5]
  ├── 테스트 인프라 구축
  │   ├── Vitest 설치 + 설정
  │   ├── scoring 모듈 단위 테스트 (축별 계산)
  │   ├── auth-helpers 단위 테스트
  │   └── TTS dialogue-parser 단위 테스트
  │
  └── CI 파이프라인 초안 (GitHub Actions)
      ├── lint + type-check + test
      └── build verification

[Week 6]
  ├── recalculateUserScores RPC 도입 (트랜잭션 보장)
  │   ├── PostgreSQL function 작성
  │   ├── supabase.rpc() 호출로 전환
  │   └── 기존 순차 UPSERT 제거
  │
  └── 수동 타입 → 자동 생성 타입 전환 검토
      ├── supabase gen types typescript 실행
      └── types.ts와 생성 타입 차이 분석
```

### Phase 4 (4주): Production Readiness — 부분 해결됨 (ignoreBuildErrors 제거, Zod env 검증)

```
Week 7-10: 프로덕션 준비 [빌드 체크+env 검증 완료, 모니터링/E2E 미착수]
─────────────────────────────────────────────────

[Week 7]
  ├── ignoreBuildErrors: false 전환
  │   ├── npm run build로 타입 에러 목록 확보
  │   ├── 에러 순차 해결 (추정 20-50건)
  │   └── 빌드 성공 확인
  │
  └── 환경 변수 검증 레이어 도입
      ├── Zod 기반 env validation (src/lib/env.ts)
      └── 서버 시작 시 필수 환경 변수 검증

[Week 8-9]
  ├── 모니터링 기초 구축
  │   ├── 에러 트래킹 도구 연동 (Sentry 등)
  │   ├── /api/health 헬스체크 엔드포인트
  │   └── Server Action 실행 시간 로깅
  │
  └── 보안 강화
      ├── Judge0 인증 설정 확인 (judge0.conf)
      ├── TTS API Key 전송 방식 검토 (query param → header)
      └── CSP 헤더 설정 검토

[Week 10]
  ├── E2E 테스트 초안 (Playwright)
  │   ├── 로그인 → 대시보드 플로우
  │   ├── 퀴즈 응시 → 채점 → 점수 반영 플로우
  │   └── 코드 제출 → Judge0 채점 플로우
  │
  └── 문서 갱신
      ├── CLAUDE.md 최종 갱신
      ├── DB_Schema.md 확정
      └── 아키텍처 문서 시리즈 10편 완성
```

---

## 7. 리팩토링 리스크 평가

### 7.1 리스크 매트릭스

| # | 항목 | 난이도 | 리스크 | 영향 범위 | 우선순위 | 예상 소요 | 상태 |
|:-:|------|:------:|:------:|:---------:|:--------:|:---------:|:----:|
| 1 | Fire-and-Forget 에러 로깅 | 최하 | 없음 | 3 파일 | **P0** | 30분 | **해결됨** |
| 2 | CLAUDE.md 갱신 | 최하 | 없음 | 1 파일 | **P0** | 15분 | **해결됨** |
| 3 | 인증 헬퍼 추출 | 하 | 낮음 | 16 파일 | **P1** | 4시간 | **해결됨** |
| 4 | 알림 헬퍼 추출 | 하 | 낮음 | 4 파일 | **P1** | 1시간 | **해결됨** |
| 5 | admin.ts 도메인 분리 | 하 | 낮음 | 1→7 파일 | **P1** | 2시간 | **해결됨** |
| 6 | comprehensive-exam.ts 분리 | 중 | 중간 | 1→5 파일 | **P2** | 4시간 | **해결됨** |
| 7 | scoring 모듈 추출 | 중 | 중간 | 3 파일 | **P2** | 8시간 | **해결됨** |
| 8 | TTS 모듈 추출 | 중 | 낮음 | 2 파일 | **P2** | 4시간 | 미착수 |
| 9 | 누락 인덱스 추가 | 하 | 낮음 | DB | **P2** | 1시간 | **해결됨** |
| 10 | 에러 처리 표준화 | 중 | 중간 | 17 파일 | **P3** | 8시간 | **해결됨** |
| 11 | DB_Schema.md 갱신 | 중 | 없음 | 문서 | **P3** | 4시간 | **해결됨** |
| 12 | 테스트 인프라 구축 | 중 | 낮음 | 프로젝트 전체 | **P3** | 8시간 | **해결됨** |
| 13 | RPC 트랜잭션 도입 | 상 | 높음 | scoring + DB | **P3** | 12시간 | 미착수 |
| 14 | ignoreBuildErrors 제거 | 상 | 높음 | 프로젝트 전체 | **P4** | 16시간 | **해결됨** |
| 15 | 환경 변수 검증 레이어 | 하 | 낮음 | 1 파일 | **P3** | 2시간 | **해결됨** |
| 16 | 모니터링 도입 | 중 | 낮음 | 프로젝트 전체 | **P4** | 8시간 | 미착수 |
| 17 | E2E 테스트 | 상 | 중간 | 프로젝트 전체 | **P4** | 16시간 | 미착수 |

### 7.2 리스크 시각화

```
리스크 (HIGH)
    │
    │  [ignoreBuildErrors 제거]   [RPC 트랜잭션 도입]
    │      (타입 에러 다수         (DB function 작성
    │       예상, 빌드 실패)       + 테스트 필요)
    │
    │  [comprehensive-exam 분리]  [scoring 모듈 추출]
    │  [에러 처리 표준화]          (비즈니스 로직 이동,
    │                              회귀 위험)
    │
    │  [인증 헬퍼 추출]            [테스트 인프라]
    │  [알림 헬퍼 추출]
    │  [admin.ts 분리]
    │
    │  [에러 로깅]  [인덱스]  [CLAUDE.md]  [env 검증]
    │
    └───────────────────────────────────── 효과 (HIGH)
         (LOW)                    (HIGH)
```

### 7.3 리스크 완화 전략

| 리팩토링 | 주요 리스크 | 완화 전략 |
|----------|-----------|----------|
| scoring 모듈 추출 | 계산 결과 불일치 | 기존 함수와 신규 모듈을 **병행 실행**하여 결과 비교 후 전환 |
| comprehensive-exam 분리 | Import 경로 깨짐 | Barrel export (`index.ts`)로 기존 경로 유지 |
| ignoreBuildErrors 제거 | 빌드 실패 | `// @ts-expect-error` 임시 적용 후 점진적 해결 |
| RPC 트랜잭션 도입 | DB function 버그 | 기존 순차 쓰기를 fallback으로 유지하면서 RPC 검증 |
| 에러 처리 표준화 | 클라이언트 호환 깨짐 | 응답 타입을 `ActionResult<T> = { error: string } | { success: true } & T`로 정의 후 점진 적용 |

### 7.4 테스트 부재에 대한 대응

**현재 상태 (확인):** 프로젝트 전체에 테스트가 0건이다 (`package.json`에 테스트 프레임워크 미설치).

**리팩토링 시 회귀 방지 전략:**

1. **Phase 1 (Quick Wins):** 기계적 치환이므로 `npm run build` 성공 여부로 검증
2. **Phase 2 (Module Extraction):** 모듈 추출과 동시에 **단위 테스트 작성**을 필수로 한다
3. **Phase 3 이후:** Vitest 설치 후 핵심 로직(scoring, grading)에 대한 테스트 커버리지 확보

**최소 테스트 대상:**
- `scoring/axis-*.ts` — 5축 각각의 계산 함수 (순수 함수로 추출 가능)
- `tts/dialogue-parser.ts` — `parseDialogueScript()`, `groupSegments()` (순수 함수)
- `lib/auth-helpers.ts` — `requireAuth()`, `requireAdmin()` (mock Supabase)
- `lib/ranking.ts` — 랭킹 계산 (이미 순수 함수)

---

## 8. 타 문서 참조

| 문서 | 참조 내용 |
|------|----------|
| [01_system_overview.md](./01_system_overview.md) | 5장 기술 부채 분석 — 본 문서의 리팩토링 후보는 01에서 식별된 기술 부채의 해결 방안이다. `ignoreBuildErrors` (5.1절), 테스트 미존재 (5.2절), 점수 계산 복잡도 (5.6절) 참조 |
| [02_folder_responsibility.md](./02_folder_responsibility.md) | 6.3절 개선 권장사항 — Server Action 그룹화, navigation.ts 역할 분리 제안은 본 문서 3장 모듈 분리와 연계. `actions/` 디렉토리 17개 파일의 도메인별 재구성 |
| [03_runtime_flow.md](./03_runtime_flow.md) | 6장 Score Recalculation Pipeline — `recalculateUserScores()`의 8개 쿼리 순차 실행 상세 분석. 8.1절 fire-and-forget 패턴 정리. 10장 성능 병목 식별 |
| [04_data_architecture.md](./04_data_architecture.md) | 4장 트랜잭션 경계 — 본 문서 5.5절 RPC 트랜잭션 도입 근거. 5.3절 누락 인덱스 → 본 문서 5.3절. 7장 스키마 갭 → 본 문서 5.2절 |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | Judge0/TTS 네트워크 토폴로지 — 본 문서 4장 마이크로서비스 경계 분석의 인프라 관점 |
| [06_security_design.md](./06_security_design.md) | RLS 정책 매트릭스 — admin.ts 분리 시 RLS 의존성 고려. Service Role 사용 패턴이 분리 후에도 유지되어야 함 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | 3종 시험 시스템 도메인 모델 — comprehensive-exam.ts 분리 시 도메인 경계 참조. 5축 점수 산정 로직 상세 |
| [08_scalability_analysis.md](./08_scalability_analysis.md) | 2장 성능 병목 분석 — `recalculateUserScores()` N+1 쿼리 문제, Judge0 순차 폴링, TTS 순차 합성. RPC/배치 개선 방안은 본 문서의 리팩토링 목표와 동일 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 리팩토링 실행을 위한 학습 경로 — Next.js Server Actions 패턴, Supabase RPC, 테스트 전략 |

---

## 부록 A: 인증 패턴 반복 현황 (확인)

17개 Server Action 파일에서 `auth.getUser()` 호출 횟수:

| 파일 | 호출 수 | 권한 검증 포함 |
|------|:-------:|:--------------:|
| `comprehensive-exam.ts` | 6 | 3 (admin/mentor) |
| `admin.ts` | 6 | 6 (assertAdmin) |
| `feedback.ts` | 4 | 1 (admin check) |
| `assessment.ts` | 4 | 0 |
| `notifications.ts` | 4 | 0 |
| `learning-assignments.ts` | 3 | 3 (admin/mentor) |
| `range-quiz.ts` | 3 | 0 |
| `profile.ts` | 2 | 0 |
| `quiz.ts` | 2 | 0 |
| `mastery.ts` | 2 | 0 |
| `coding.ts` | 1 | 0 |
| `scores.ts` | 1 | 1 (admin) |
| `mentor.ts` | 1 | 1 (admin) |
| `onboarding.ts` | 1 | 0 |
| `claims.ts` | 1 | 0 |
| `access-request.ts` | 1 | 0 |
| **합계** | **42** | **15** |

---

## 부록 B: 핵심 파일 Quick Reference

| 파일 | 줄 수 | 함수 수 | 본 문서 관련 섹션 |
|------|:-----:|:-------:|------------------|
| `src/app/actions/comprehensive-exam.ts` | 462 | 6 | 1.2 (God Function), 2.3 (알림 추출) |
| `src/app/actions/admin.ts` | 432 | 16 | 1.3 (God Function), 2.2 (도메인 분리) |
| `src/app/actions/scores.ts` | 293 | 2 | 1.1 (God Function), 3.2 (모듈), 5.5 (RPC) |
| `src/app/api/tts/route.ts` | 232 | 5+ | 3.2 (TTS 모듈) |
| `src/app/actions/coding.ts` | 151 | 2 | 2.4 (에러 로깅) |
| `src/app/actions/notifications.ts` | 137 | 7 | 2.3 (알림 헬퍼), 2.5 (legacy 제거) |
| `src/app/actions/quiz.ts` | 114 | 2 | 2.4 (에러 로깅) |
| `src/app/actions/feedback.ts` | 110 | 4 | 2.2 (admin에서 분리) |
| `src/lib/supabase/server.ts` | 50 | 2 | 2.1 (인증 헬퍼 기반) |
| `src/lib/judge0/client.ts` | 110 | 5 | 3.2 (Judge0 모듈) |
| `src/lib/assessment-config.ts` | 106 | 6+ | 3.2 (scoring 모듈 의존) |

---

> **확인/추정 구분:** 소스 코드에서 직접 검증된 수치와 구조는 "확인", 코드 패턴에서 유추한 효과와 소요 시간은 "추정"으로 명시하였다.
