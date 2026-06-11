# 06. 보안 설계 (Security Design)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Security Engineer
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)
>
> **갱신 노트 (2026-06-11):** 본문이 지적한 최대 갭 **G2(퀴즈 정답 직접 조회)는 마이그레이션 00178로 해결**되었다 — `quiz_question_options` SELECT를 `is_admin_or_mentor()`로 제한하고 채점·리뷰 경로를 service role로 전환. 아울러 `'use server'` 모듈의 무인증 service-role 함수 노출 차단, CSV 수식 인젝션 대응, BFF 키 비교 timingSafeEqual화, `server-only` 가드, 답안 UNIQUE 제약(00180)이 적용되었다 (CHANGELOG 참조). §4~§8의 G2 관련 서술은 작성 시점(2026-02) 기준이다.

---

## 1. RLS 정책 매트릭스

J-Bridge는 Supabase의 **Row Level Security (RLS)**를 전 테이블에 적용하여, DB 레벨에서 접근 제어를 수행한다. 아래 매트릭스는 48개 마이그레이션 파일 분석 결과를 종합한 것이다.

### 1.1 헬퍼 함수

RLS 정책 조건에 사용되는 PostgreSQL 함수들이다. 모두 `SECURITY DEFINER`로 정의되어, 함수 소유자 권한으로 실행된다.

| 함수 | 정의 위치 | 반환 | 용도 |
|------|-----------|------|------|
| `is_admin()` | `00019:L4-9`, `00035:L12-16` (재정의) | `BOOLEAN` | 현재 사용자가 admin 역할인지 확인 |
| `is_mentor()` | `00030:L4-9`, `00038:L9-14` (재정의) | `BOOLEAN` | 현재 사용자가 mentor 역할인지 확인 |
| `is_admin_or_mentor()` | `00030:L11-16` | `BOOLEAN` | admin 또는 mentor 역할 확인 |
| `is_mentor_of(target_user_id)` | `00035:L2-8` | `BOOLEAN` | 특정 사용자의 담당 멘토인지 확인 |

### 1.2 사용자/스킬 테이블 (7 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **profiles** | 본인 + Admin + Mentor | (trigger) | 본인 + Admin | - | `Users can view own profile`, `Admins can view/update all profiles`, `Mentors can view all profiles` | INSERT는 `handle_new_user` trigger가 처리 |
| **japanese_skills** | 본인 + Admin + Mentor | 본인 | 본인 | - | `Users can view/insert/update own` | `00022`에서 INSERT/UPDATE 추가 |
| **coding_skills** | 본인 + Admin + Mentor | 본인 | 본인 | - | `Users can view/insert/update own` | `00022`에서 INSERT/UPDATE 추가 |
| **attitude_culture_skills** | 본인 + Admin + Mentor | 본인 | 본인 | - | `Users can view/insert/update own` | `00022`에서 INSERT/UPDATE 추가 |
| **dispatch_readiness_scores** | 본인 + Admin + Mentor | 본인 | - | - | `Users can view/insert own` | 스냅샷 테이블, UPDATE 불필요 |
| **enrollments** | 본인 | 본인 | - | - | `Users can view/insert own enrollments` | |
| **lesson_progress** | 본인 | 본인 | 본인 | - | enrollment 소유 기반 조회 (`enrollment_id IN (SELECT ...)`) | `00022`에서 INSERT 추가 |

### 1.3 콘텐츠 테이블 (7 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **courses** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage courses` | `FOR ALL` 정책 |
| **lessons** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage lessons` | |
| **lesson_resources** | authenticated | - | - | - | SELECT만 존재 | **Admin INSERT/UPDATE 정책 누락** |
| **coding_problems** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage coding_problems` | |
| **coding_test_cases** | authenticated + Admin(ALL) | Admin | Admin | Admin | `00022`에서 sample 제한 해제 → 전체 조회 가능 | Server Action이 결과 필터링 담당 |
| **projects** | authenticated | - | - | - | SELECT만 존재 | **Admin CRUD 정책 누락** |
| **project_requirements** | authenticated | - | - | - | SELECT만 존재 | **Admin CRUD 정책 누락** |

### 1.4 퀴즈 테이블 (5 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **quizzes** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage quizzes` | |
| **quiz_questions** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage quiz_questions` | |
| **quiz_question_options** | authenticated + Admin(ALL) | Admin | Admin | Admin | `Admins can manage quiz_question_options` | |
| **quiz_attempts** | 본인 + Admin + Mentor | 본인 | 본인 + Admin + Mentor(담당) | - | `00047`에서 Admin/Mentor UPDATE 추가 | DELETE 정책 부재 (service role 우회) |
| **quiz_answers** | 본인 | 본인 | - | - | attempt 소유 기반 (`attempt_id IN ...`) | |

### 1.5 코드 제출 테이블 (2 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **code_submissions** | 본인 + Admin | 본인 | 본인 | - | `00021`에서 UPDATE 추가 | |
| **code_reviews** | 본인(submission 소유) + Admin | 본인(submission 소유) | - | - | `00022`에서 INSERT 추가 | |

### 1.6 일본어 콘텐츠 테이블 (6 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **jlpt_vocabulary** | authenticated | - | - | - | | Admin CRUD 누락 |
| **it_glossary** | authenticated | - | - | - | | Admin CRUD 누락 |
| **jlpt_grammar** | `USING (true)` (전체 공개) + Admin(ALL) | Admin | Admin | Admin | `00031` | 비인증 사용자도 조회 가능 (추정: 의도적) |
| **jlpt_reading_passages** | `USING (true)` + Admin(ALL) | Admin | Admin | Admin | `00032` | |
| **jlpt_listening_scripts** | `USING (true)` + Admin(ALL) | Admin | Admin | Admin | `00033` | |
| **cs_terms** | authenticated + Admin(INSERT/UPDATE/DELETE) | Admin | Admin | Admin | `00046` | `TO authenticated` 문법 사용 |

### 1.7 코딩 랭크/시험 테이블 (4 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **coding_skill_exams** | authenticated(published만) + Admin(ALL) | Admin | Admin | Admin | | |
| **coding_exam_problems** | authenticated + Admin(ALL) | Admin | Admin | Admin | | |
| **coding_exam_attempts** | 본인 + Admin | 본인 | 본인 | - | `00021`에서 UPDATE 추가 | |
| **ranking_seasons** | authenticated + Admin(ALL) | Admin | Admin | Admin | | |
| **user_rankings** | authenticated + Admin(ALL) | Admin | Admin | Admin | | |

### 1.8 관리 기능 테이블 (6 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **task_assignments** | 본인(assigned_to) + Admin(ALL) + Mentor(ALL) | Admin + Mentor(본인 배정) | 본인(assigned_to) + Admin | Admin | | |
| **admin_feedbacks** | 본인(user_id) + Admin(ALL) + Mentor(ALL) + 작성자(admin_id) | Admin + Mentor(본인 작성) | Mentor(본인 작성) | 본인(user_id) + Mentor(본인 작성) | `00038`, `00039`에서 확장 | |
| **feedback_replies** | 당사자(admin_id/user_id) + Admin(ALL) | 당사자 | 본인 | 본인 + Admin | `00038` | |
| **content_access_requests** | 본인 + Admin(ALL) + Mentor(ALL) | 본인 | Admin + Mentor | Admin | `00029`, `00030` | |
| **question_claims** | 본인 + Admin + Mentor | 본인 | - | - | `00036` | DELETE 정책 부재 |
| **user_mastered_items** | 본인 | 본인 | - | 본인 | `00041` | |

### 1.9 멘토/알림/과제/시험 테이블 (5 tables)

| 테이블 | SELECT | INSERT | UPDATE | DELETE | 주요 정책 | 비고 |
|--------|--------|--------|--------|--------|-----------|------|
| **mentor_mentee_assignments** | Admin(ALL) + mentor(본인) + mentee(본인) | Admin | Admin | Admin | `00035` | |
| **notifications** | 본인 | Admin + Admin/Mentor | 본인 | - | `00035` | DELETE 정책 부재 |
| **learning_assignments** | Admin(ALL) + Mentor(본인 배정/담당) + mentee(본인) | Admin + Mentor | Admin + Mentor | Admin + Mentor | `00035` | |
| **comprehensive_exams** | Admin(ALL) + Mentor(담당) + 본인 | 본인 | Admin + Mentor(담당) + 본인 | Admin | `00035` | user_own은 `FOR ALL` |
| **comprehensive_exam_answers** | Admin + 본인(exam 소유) | 본인(exam 소유) | 본인 | - | `00035` | |

### 1.10 Storage Bucket 정책

| Bucket | 공개 | SELECT | INSERT | UPDATE | DELETE | 비고 |
|--------|------|--------|--------|--------|--------|------|
| **avatars** | `true` | 전체 공개 | authenticated | authenticated | authenticated | **소유자 검증 없음** (타인 파일 덮어쓰기 가능) |
| **tts-cache** | `true` | 전체 공개 | authenticated | - | - | 캐시 파일 삭제 불가 (정리 메커니즘 필요) |

### 1.11 RLS 정책이 없는 테이블 (보안 갭)

> **확인:** `jlpt_vocabulary`, `it_glossary`에 Admin CRUD 정책이 누락되어 있다. seed 데이터 관리 시 service role key를 사용해야 한다.

> **확인:** `lesson_resources`, `projects`, `project_requirements`에 Admin CRUD 정책이 누락되어 있다. 현재는 seed 스크립트 또는 Supabase Dashboard에서만 관리 가능하다.

---

## 2. 3계층 RBAC 분석

J-Bridge는 세 개의 독립적인 보안 레이어를 거쳐 접근 제어를 수행한다.

```
┌─────────────────────────────────────────────────────────────────┐
│                        Browser Request                          │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  Layer 1: Middleware (Route Protection)                          │
│  파일: src/middleware.ts                                         │
│                                                                 │
│  - 미인증 사용자 → /login 리다이렉트                             │
│  - 온보딩 미완료 → /onboarding 리다이렉트                        │
│  - /admin/* 경로 RBAC 검증                                      │
│    - /admin/users, /admin/courses, /admin/mentors → admin only  │
│    - /admin/tasks, /admin/reports → admin + mentor               │
│    - /admin/* (기타) → admin only                                │
│                                                                 │
│  검증 방식: Supabase auth.getUser() + profiles.role 조회         │
│  우회 시나리오: API Route / Server Action 직접 호출 시 무관        │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  Layer 2: Server Action (Role Check)                            │
│  파일: src/app/actions/*.ts                                     │
│                                                                 │
│  각 Action 함수 내부에서 독립적으로 역할 검증:                    │
│                                                                 │
│  패턴 A - assertAdmin() 함수 (admin.ts:L7-25)                  │
│    auth.getUser() → profiles.role === 'admin' 확인              │
│    실패 시 throw new Error('Not authorized')                    │
│                                                                 │
│  패턴 B - 인라인 역할 검증 (comprehensive-exam.ts:L92-105)      │
│    auth.getUser() → profiles.role 확인                          │
│    admin + mentor 허용, return { error } 패턴                   │
│                                                                 │
│  패턴 C - 인증만 확인 (coding.ts:L12)                           │
│    auth.getUser()만 확인, 역할 검증 없음                         │
│    RLS에 의존하여 데이터 접근 범위 제한                           │
│                                                                 │
│  우회 시나리오: 직접 DB 접근 시 Layer 3만 적용                    │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│  Layer 3: RLS (Row-Level Security)                              │
│  정의: supabase/migrations/00013, 00019, 00022, 00027,          │
│        00029, 00030, 00035, 00036, 00038-00048                  │
│                                                                 │
│  PostgreSQL 레벨에서 행 단위 접근 제어:                           │
│  - auth.uid() = user_id 패턴 (본인 데이터)                      │
│  - is_admin() / is_mentor() 헬퍼 함수 (역할 기반)               │
│  - is_mentor_of(target_user_id) (관계 기반)                     │
│                                                                 │
│  우회 시나리오: Service Role Key 사용 시 완전 우회                │
│                                                                 │
│  최종 방어선 - DB 수준에서 동작하므로 모든 클라이언트에 적용       │
└─────────────────────────────────────────────────────────────────┘
```

### 2.1 Layer 간 정합성 분석

| 검증 항목 | Layer 1 (Middleware) | Layer 2 (Action) | Layer 3 (RLS) | 평가 |
|-----------|---------------------|------------------|---------------|------|
| 미인증 사용자 차단 | O (redirect) | O (getUser() 확인) | O (auth.uid() = null) | 3중 보호 |
| admin 전용 기능 | O (/admin/* 경로) | O (assertAdmin / 인라인) | O (is_admin()) | 3중 보호 |
| mentor 전용 기능 | O (/admin/tasks, reports) | O (인라인 검증) | O (is_mentor()) | 3중 보호 |
| mentee 데이터 격리 | - (경로 무관) | 부분적 (패턴 C) | O (user_id 기반) | **Layer 2 부분 부재, RLS에 의존** |
| Storage 접근 | - | - | 버킷 정책 | **Layer 1/2 미적용** |

### 2.2 보안 갭 분석

**갭 1: Middleware가 API Route에 적용되지 않음**

`src/middleware.ts:L36`에서 `isApiRoute` 판별 후, API 경로는 미인증 리다이렉트에서 제외된다. `/api/tts`와 `/api/admin/tts-precache`는 내부에서 자체 인증 검사를 수행하지만, 새로운 API Route 추가 시 인증 누락 위험이 있다.

```
// src/middleware.ts:L39
if (!user && !isAuthPage && !isApiRoute && !request.nextUrl.pathname.startsWith('/auth')) {
```

**갭 2: Server Action 직접 호출**

Next.js Server Actions는 HTTP POST 엔드포인트로 노출되므로, Middleware의 경로 기반 RBAC을 우회하여 직접 호출이 가능하다. Layer 2의 역할 검증이 각 함수 내에서 수행되므로, 함수별 검증 누락 시 보안 홀이 될 수 있다.

**갭 3: Storage 버킷 소유자 검증 부재**

`avatars` 버킷의 INSERT/UPDATE/DELETE 정책이 `auth.role() = 'authenticated'`만 확인하고, 파일 경로에 대한 소유자 검증이 없다. 인증된 사용자가 타인의 아바타를 덮어쓸 수 있다.

```sql
-- 00024_create_avatars_bucket.sql:L23-26
CREATE POLICY "Users can upload own avatar"
  ON storage.objects FOR INSERT
  WITH CHECK (
    bucket_id = 'avatars'
    AND auth.role() = 'authenticated'
  );
-- 소유자 검증 조건 없음 (예: (storage.foldername(name))[1] = auth.uid()::text)
```

---

## 3. Service Role Key 사용 감사

`createServiceRoleClient()` (`src/lib/supabase/server.ts:L34-50`)는 `SUPABASE_SERVICE_ROLE_KEY`를 사용하여 **RLS를 완전히 우회하는** 클라이언트를 생성한다. 키 미설정 시 `null`을 반환하는 안전장치가 있다.

### 3.1 Service Role Key 사용 파일 목록

| # | 파일 | 함수 | 용도 | 위험도 | 대안 |
|---|------|------|------|--------|------|
| 1 | `src/app/actions/admin.ts:L21-24` | `assertAdmin()` | Admin 작업 (사용자 생성, 역할 변경, 문제 CRUD 등). RLS 우회로 전체 profiles 접근 | 중간 | Admin RLS 정책이 이미 존재하므로 일반 클라이언트 사용 가능 (단, `auth.admin.createUser` 제외) |
| 2 | `src/app/actions/admin.ts:L139,226,258` | `createFeedback()`, `approveRetakeRequest()`, `denyRetakeRequest()` | 피드백 생성 (타인 user_id에 INSERT), 재시험 승인/거부 | 중간 | fallback으로 일반 클라이언트 지원 (`serviceClient ?? supabase`) |
| 3 | `src/app/actions/comprehensive-exam.ts:L41,107,160,198,284,388` | `requestExam()`, `approveExam()`, `denyExam()`, `startExam()`, `submitExam()`, `requestRetakeExam()` | 종합 시험 전체 라이프사이클. 멘토 조회, 정답 채점, 알림 전송 | **높음** | 6개 함수가 모두 service role 사용. 일부는 fallback 지원 |
| 4 | `src/app/actions/assessment.ts:L74,190` | `submitAssessment()`, `requestRetake()` | 등급 테스트 이전 시도 삭제, 재시험 요청 시 멘토 알림 | **높음** | `quiz_attempts` DELETE 정책이 없어 service role 필수 |
| 5 | `src/app/actions/scores.ts:L19` | `recalculateUserScores()` | 전 사용자 스킬 테이블 upsert. 타인 데이터도 갱신 가능 | **높음** | Admin 전용 호출이므로 service role 필요 |
| 6 | `src/app/actions/learning-assignments.ts:L46,150` | `createLearningAssignment()`, `checkAssignmentProgress()` | 퀴즈 조회 및 과제 진행 상황 업데이트 | 중간 | RLS로 대체 가능 (멘토 정책 존재) |
| 7 | `src/app/actions/notifications.ts:L80` | `createNotification()` | 타인에게 알림 INSERT (RLS INSERT 정책 우회) | 중간 | fallback 패턴 구현됨 (`serviceClient ?? supabase`) |
| 8 | `src/app/actions/feedback.ts:L21` | `bulkDeleteFeedbacks()` | Admin 전체 피드백 삭제 | 중간 | Admin DELETE 정책으로 대체 가능 |
| 9 | `src/app/actions/profile.ts:L17` | `ensureAvatarsBucket()` | Storage 버킷 생성 (관리자 작업) | 낮음 | 배포 시 마이그레이션으로 버킷 생성 (이미 `00024`에 존재) |
| 10 | `src/app/api/tts/route.ts:L171` | `POST /api/tts` | TTS 캐시 Storage 업로드 | 낮음 | `tts-cache` 버킷에 authenticated INSERT 정책 존재 |
| 11 | `src/app/api/admin/tts-precache/route.ts:L77` | `POST /api/admin/tts-precache` | 일괄 TTS 사전 캐싱 (Admin 전용) | 낮음 | Admin 인증 후 Storage 업로드 |
| 12 | `src/app/(main)/feedback/page.tsx:L22` | `FeedbackPage()` (Server Component) | 1개월 이상 오래된 피드백 자동 삭제 | 중간 | cron job 또는 DB function으로 이전 권장 |
| 13 | `src/app/(main)/admin/courses/page.tsx:L21` | `AdminCoursesPage()` (Server Component) | 문제 클레임 조회 시 전체 사용자 정보 접근 | 낮음 | Admin RLS 정책으로 대체 가능 |
| 14 | `src/app/(main)/admin/reports/page.tsx:L18` | `AdminReportsPage()` | 전체 사용자 리포트 데이터 조회 | 낮음 | Admin RLS 정책으로 대체 가능 |
| 15 | `src/app/(main)/admin/tasks/page.tsx:L33` | `AdminTasksPage()` | 전체 과제 및 시험 데이터 조회 | 낮음 | Admin/Mentor RLS 정책으로 대체 가능 |

### 3.2 Service Role Key 사용 위험 분석

```
위험도 분포:

  높음 ████████ 3건 (comprehensive-exam, assessment, scores)
  중간 ████████████ 5건 (admin, feedback, notifications, learning-assignments, feedback-page)
  낮음 ████████████████████ 7건 (profile, tts, admin-pages)
```

**높음 위험도 상세:**
- `comprehensive-exam.ts`: 6개 함수가 service role을 사용하며, 정답 조회/채점/상태 변경 등 시험 무결성에 직접적 영향. 서비스 키 노출 시 시험 조작 가능.
- `assessment.ts:submitAssessment()`: `quiz_attempts` DELETE 후 재생성 패턴. DELETE RLS 정책이 없어 service role이 필수.
- `scores.ts:recalculateUserScores()`: 타인의 스킬 점수를 직접 갱신. 호출 컨텍스트에 대한 검증이 느슨.

---

## 4. quiz_question_options_safe VIEW 분석

### 4.1 목적

퀴즈 정답 유출을 방지하기 위해, `is_correct` 컬럼을 제외한 안전한 뷰를 제공한다.

### 4.2 정의

```sql
-- supabase/migrations/00014_views.sql
CREATE VIEW quiz_question_options_safe AS
SELECT id, question_id, option_text, sort_order
FROM quiz_question_options;
```

**제외된 컬럼:** `is_correct` (정답 여부)

### 4.3 사용 현황

클라이언트에 노출되는 모든 퀴즈 문제 조회에서 이 뷰를 사용한다:

| 파일 | 용도 |
|------|------|
| `src/lib/supabase/queries/quizzes.ts:L32` | 퀴즈 문제 조회 (일반 학습) |
| `src/lib/supabase/queries/assessments.ts:L44` | 등급 테스트 문제 조회 |
| `src/app/(main)/cs/quiz/[quizId]/page.tsx:L32` | CS 퀴즈 페이지 |
| `src/app/(main)/japanese/jlpt/quiz/[quizId]/page.tsx:L33` | JLPT 퀴즈 페이지 |
| `src/app/(main)/japanese/business/quiz/[quizId]/page.tsx:L33` | 비즈니스 일본어 퀴즈 |
| `src/app/(main)/onboarding/assessment/[step]/page.tsx:L96` | 온보딩 등급 테스트 |
| `src/components/japanese/QuizTaker.tsx:L21` | 퀴즈 UI 컴포넌트 |

### 4.4 채점 시 정답 접근 방식

채점은 **Server Action** 내에서 `quiz_question_options` 원본 테이블에 직접 접근하여 수행:

```typescript
// src/app/actions/assessment.ts:L93-98
const { data: correctOptions } = await supabase
  .from('quiz_question_options')  // 원본 테이블 (is_correct 포함)
  .select('id, question_id, is_correct')
  .in('question_id', questionIds)
  .eq('is_correct', true)
```

**확인:** `quiz_question_options` 테이블에 `authenticated` SELECT 정책이 존재하므로(`00013:L86`), 일반 사용자도 원본 테이블을 직접 조회하면 `is_correct` 값에 접근할 수 있다. 이는 **잠재적 보안 갭**이다.

### 4.5 보안 갭: 정답 직접 조회 가능

```
위협 시나리오:
1. 인증된 사용자가 Supabase anon key를 사용하여
2. quiz_question_options 테이블에 직접 SELECT 쿼리 실행
3. is_correct = true 필터로 정답 목록 획득
4. 퀴즈/시험 부정 행위

대응 방안:
- quiz_question_options 테이블의 일반 사용자 SELECT 정책을 제거하고
- quiz_question_options_safe 뷰만 접근 가능하도록 변경
- 또는 SECURITY DEFINER 뷰로 전환하여 기저 테이블 직접 접근 차단
```

---

## 5. 인증 보안 분석

### 5.1 인증 아키텍처

```
┌──────────────┐     ┌────────────────┐     ┌──────────────────┐
│   Browser    │     │   Next.js      │     │   Supabase Auth  │
│              │     │   Middleware    │     │   (GoTrue)       │
│  JWT Cookie  │────>│  getUser()     │────>│  JWT 검증         │
│  (HttpOnly)  │     │  역할 확인      │     │  세션 관리         │
└──────────────┘     └────────────────┘     └──────────────────┘
```

### 5.2 JWT 토큰 관리

| 항목 | 현황 | 비고 |
|------|------|------|
| 토큰 저장 | 쿠키 (Supabase SSR `@supabase/ssr`) | HttpOnly 쿠키를 통해 XSS로부터 보호 |
| 토큰 갱신 | Supabase 내장 자동 갱신 | Middleware에서 `getUser()` 호출 시 자동 갱신 |
| 토큰 검증 | 매 요청마다 `supabase.auth.getUser()` | 서버 사이드에서 검증 (클라이언트 토큰 복호화 아님) |
| 세션 만료 | Supabase 기본값 (1시간 Access Token, 무한 Refresh Token) | **추정** - 커스텀 설정 확인 불가 |

### 5.3 계정 관리 보안

| 항목 | 현황 | 비고 |
|------|------|------|
| 계정 생성 | Admin 전용 (`createUserAccount()`, `src/app/actions/admin.ts:L42-79`) | `auth.admin.createUser()` API 사용 (service role 필수) |
| Self-signup | **비활성화** (설계상 비허용) | /signup 경로는 Middleware에서 auth 페이지로 분류되나, 실제 signup 페이지/로직 미구현 |
| 비밀번호 정책 | Zod 스키마: 6자 이상 (`src/lib/validations/auth.ts:L5`) | **최소 요건만 충족, 복잡성 규칙 없음** |
| 이메일 확인 | `email_confirm: true` (계정 생성 시 자동 확인) | Admin이 생성 시 바로 확인 처리 |
| 비밀번호 재설정 | **미구현 (추정)** | 비밀번호 재설정 관련 Action/UI 미발견 |
| MFA/2FA | **미구현** | |
| 로그인 시도 제한 | **미구현 (추정)** | Supabase 기본 제한에 의존 |

### 5.4 인증 흐름

```
  Admin (계정 생성)                  New User (로그인)
       │                                 │
       ▼                                 ▼
  createUserAccount()                signIn()
  admin.ts:L42-79                    auth.ts:L8-28
       │                                 │
       ├── auth.admin.createUser()       ├── loginSchema.safeParse()
       │   (service role key)            │   (Zod 검증)
       │                                 │
       ├── email_confirm: true           ├── signInWithPassword()
       │   (즉시 인증)                   │   (Supabase Auth)
       │                                 │
       ├── trigger: handle_new_user()    ├── 성공 → revalidatePath + redirect
       │   (profiles + skills 자동 생성) │
       │                                 ├── 실패 → 에러 메시지 반환
       └── role 업데이트 (필요 시)       │   (email/password 불일치만 안내)
                                         │
                                         ▼
                                    Middleware
                                    is_onboarded 확인
                                         │
                              ┌──────────┴──────────┐
                              ▼                     ▼
                         /onboarding            /dashboard
                         (초기 등급 측정)        (메인 화면)
```

---

## 6. 보안 갭 분석

### 6.1 종합 보안 갭 매트릭스

| # | 보안 갭 | 심각도 | 현황 | 설명 |
|---|---------|--------|------|------|
| G1 | 레이트 리밋 부재 | **높음** | 미구현 | Server Actions, API Routes에 레이트 리밋 없음. 브루트포스 로그인, 대량 퀴즈 제출 등 남용 가능 |
| G2 | 퀴즈 정답 직접 조회 | **높음** | **해결됨 (2026-06-11, 00178)** | ~~`quiz_question_options` 테이블 SELECT 정책이 authenticated 전체 허용~~ → SELECT를 admin/mentor로 제한, 채점·리뷰는 service role 경유 |
| G3 | Judge0 privileged 모드 | **높음** | 확인 | `docker-compose.yml:L8,33`에서 `privileged: true` 설정. 컨테이너 탈출 위험 |
| G4 | Storage 소유자 검증 부재 | 중간 | 취약 | avatars 버킷에서 타인 파일 덮어쓰기 가능 |
| G5 | CSP 헤더 미설정 | 중간 | 미구현 | Content-Security-Policy 헤더 없음. XSS 2차 방어선 부재 |
| G6 | 보안 헤더 미설정 | 중간 | 미구현 | X-Frame-Options, X-Content-Type-Options, Referrer-Policy 등 미설정 |
| G7 | Service Role Key 과다 사용 | 중간 | 확인 | 15곳에서 사용. 일부는 RLS 정책으로 대체 가능 |
| G8 | quiz_attempts DELETE 정책 부재 | 중간 | 확인 | assessment.ts에서 service role로 DELETE 수행. 정책 추가로 해결 가능 |
| G9 | 비밀번호 복잡성 규칙 미흡 | 중간 | 확인 | 6자 이상만 검증. 대문자/소문자/숫자/특수문자 조합 미요구 |
| G10 | CORS 설정 미확인 | 낮음 | 추정 | Supabase 기본 CORS 정책에 의존. 커스텀 설정 미확인 |
| G11 | 환경 변수 검증 부재 | 낮음 | 확인 | `process.env.*!` (non-null assertion) 사용. 런타임 에러 메시지 불명확 |
| G12 | Judge0 기본 비밀번호 | 중간 | 확인 | `judge0.conf`에 `judge0password` 하드코딩 |

### 6.2 상세 분석

#### G1: 레이트 리밋 부재 (심각도: 높음)

**영향 범위:**
- 로그인 시도 (`signIn` — `src/app/actions/auth.ts:L8`)
- 퀴즈 제출 (`submitQuizAnswers`)
- 코드 제출 (`submitCode` — `src/app/actions/coding.ts:L9`)
- TTS API (`/api/tts/route.ts`)
- 종합 시험 요청 (`requestExam` — `src/app/actions/comprehensive-exam.ts:L8`)

**위협:**
- 브루트포스 로그인 공격
- Judge0 서버 과부하 (무한 코드 제출)
- Google TTS API 비용 폭증 (TTS 요청 폭탄)
- 퀴즈 반복 제출을 통한 채점 패턴 분석

**대응 방안:**
```
권장 구현:
1. Next.js Middleware에 IP 기반 레이트 리밋 (upstash/ratelimit 등)
2. Server Action별 사용자 기반 레이트 리밋
3. Judge0 호출에 대한 동시 실행 제한
```

#### G2: 퀴즈 정답 직접 조회 가능 (심각도: 높음)

`quiz_question_options` 테이블에 `authenticated` SELECT 정책이 적용되어 있어, 인증된 사용자가 Supabase REST API를 직접 호출하면 `is_correct` 컬럼을 조회할 수 있다.

```
현재 상태:
quiz_question_options → SELECT (authenticated) → is_correct 노출
quiz_question_options_safe VIEW → SELECT (authenticated) → is_correct 제외

문제점: VIEW를 사용하더라도 원본 테이블에 직접 접근 가능
```

**대응 방안:**
1. `quiz_question_options`의 일반 사용자 SELECT 정책 제거
2. Admin/Service Role만 원본 테이블 접근 가능하도록 변경
3. 채점 로직을 DB Function (SECURITY DEFINER)으로 이전

#### G3: Judge0 privileged 모드 (심각도: 높음)

```yaml
# judge0/docker-compose.yml:L8, L33
services:
  server:
    privileged: true     # 전체 호스트 디바이스 접근 가능
  workers:
    privileged: true     # 사용자 코드 실행 컨테이너
```

`privileged: true`는 Docker 컨테이너에 호스트의 모든 디바이스에 대한 접근 권한을 부여한다. Judge0 workers는 사용자가 제출한 **임의의 코드**를 실행하므로, 악의적 코드가 컨테이너를 탈출하여 호스트 시스템에 접근할 위험이 있다.

**대응 방안:**
- Judge0의 isolate sandbox (기본 제공)에 의존하되
- `privileged: true`를 제거하고 필요한 capabilities만 부여 (예: `SYS_PTRACE`)
- 또는 gVisor/kata-containers 등의 추가 격리 레이어 도입

#### G4: Storage 소유자 검증 부재 (심각도: 중간)

```sql
-- avatars 버킷 INSERT 정책 (00024:L23-26)
CREATE POLICY "Users can upload own avatar"
  WITH CHECK (
    bucket_id = 'avatars'
    AND auth.role() = 'authenticated'   -- 인증만 확인, 경로 미검증
  );
```

**확인:** 애플리케이션 레벨에서 `{user.id}-{timestamp}.{ext}` 형식의 파일명을 사용(`src/app/actions/profile.ts:L75`)하여 충돌을 방지하나, DB 정책 레벨에서는 타인 파일 덮어쓰기가 가능하다.

### 6.3 CSRF 보호 현황

| 요소 | 보호 현황 | 설명 |
|------|-----------|------|
| Server Actions | **내장 보호** | Next.js Server Actions는 POST 요청 + 고유 Action ID를 사용하며, Origin 헤더 검증을 내장. CSRF 토큰과 동등한 보호 제공 |
| API Routes | **부분 보호** | Next.js가 Origin 헤더를 기본 검증하나, 명시적 CSRF 토큰 미사용 |
| Supabase Auth | **JWT 기반** | 쿠키 내 JWT 토큰 검증. SameSite 속성에 따라 보호 수준 결정 |

### 6.4 SQL Injection 보호

**확인:** Supabase JavaScript 클라이언트는 내부적으로 **PostgREST** API를 사용하며, 모든 쿼리 파라미터는 자동으로 파라미터화(parameterized)된다. 직접적인 SQL 문자열 연결은 수행되지 않는다.

```typescript
// 안전한 패턴 (전체 코드베이스에서 일관 사용)
const { data } = await supabase
  .from('profiles')
  .select('role')
  .eq('id', user.id)     // 자동 파라미터화
  .single()
```

**확인:** 마이그레이션 파일의 `SECURITY DEFINER` 함수에서도 동적 SQL 미사용.

### 6.5 XSS 보호

| 보호 레이어 | 현황 | 비고 |
|------------|------|------|
| React 자동 이스케이프 | **적용** | JSX 내 `{variable}` 삽입 시 자동 이스케이프 |
| `dangerouslySetInnerHTML` | **미사용 (추정)** | 코드베이스에서 발견되지 않음 |
| CSP 헤더 | **미설정** | XSS 2차 방어선 부재 |
| Monaco Editor | **위험 가능성** | 코드 에디터의 출력이 DOM에 삽입되는 경로 확인 필요 |

### 6.6 Input Validation 현황

| 입력 지점 | 검증 방식 | 커버리지 |
|-----------|-----------|----------|
| 로그인 | Zod 스키마 (`loginSchema`) | O |
| 사용자 생성 | 필수 필드 확인 (문자열 존재 여부) | 부분적 (Zod 미사용) |
| 퀴즈 답안 | 배열 구조 확인 | 부분적 |
| 코드 제출 | 문자열 존재 확인만 | 부분적 (코드 길이 제한 없음) |
| TTS 텍스트 | `MAX_TEXT_LENGTH = 5000` 제한 | O |
| 프로필 이미지 | 파일 타입 + 크기 제한 (5MB) | O |
| 피드백 내용 | `.trim()` 확인만 | 부분적 |

---

## 7. 위협 모델링 (STRIDE 기반)

### 7.1 STRIDE 분석 매트릭스

| 위협 | 대상 자산 | 시나리오 | 현재 보호 | 잔여 위험 |
|------|-----------|----------|-----------|-----------|
| **S** (Spoofing) | 인증 세션 | JWT 토큰 탈취, 세션 하이재킹 | Supabase Auth + HttpOnly 쿠키 + getUser() 서버 검증 | 낮음 |
| **T** (Tampering) | 퀴즈 점수 | 클라이언트에서 채점 결과 조작 | 서버 사이드 채점 (Server Actions) | 낮음 |
| **T** (Tampering) | 코드 제출 결과 | Judge0 응답 조작 | Judge0 서버 직접 통신 (클라이언트 미경유) | 낮음 |
| **T** (Tampering) | 퀴즈 정답 DB | 정답 데이터 변경 | RLS (admin만 수정 가능) + Service Role 보호 | 낮음 |
| **R** (Repudiation) | 시험 제출 기록 | 시험 응시 사실 부인 | DB 타임스탬프 기록 + audit trail 없음 | **중간** (감사 로그 부재) |
| **I** (Information Disclosure) | 퀴즈 정답 | `quiz_question_options.is_correct` 직접 조회 | safe VIEW 제공 (원본 접근 차단 안 됨) | **높음** |
| **I** (Information Disclosure) | 타인 프로필 | mentee가 다른 mentee 정보 조회 | RLS (본인만 조회) | 낮음 |
| **I** (Information Disclosure) | Service Role Key | 환경 변수 노출 | 서버 사이드 전용 (`NEXT_PUBLIC_` 미접두) | 낮음 |
| **D** (Denial of Service) | Judge0 서버 | 대량 코드 제출 | 레이트 리밋 없음 | **높음** |
| **D** (Denial of Service) | TTS API | 대량 TTS 요청 | 캐싱 존재하나 레이트 리밋 없음 | **중간** |
| **E** (Elevation of Privilege) | Admin 기능 | mentee가 admin 기능 접근 | 3계층 RBAC (Middleware + Action + RLS) | 낮음 |
| **E** (Elevation of Privilege) | Judge0 호스트 | 악성 코드가 컨테이너 탈출 | privileged 모드 사용 중 | **높음** |

### 7.2 위험 히트맵

```
발생 가능성
   높음  │ [G1: Rate Limit]     [G2: 정답 노출]
         │
   중간  │ [G3: Judge0]         [G4: Storage]
         │ [G12: 기본 PW]
         │
   낮음  │ [G5: CSP]            [G6: 보안 헤더]
         │ [G9: PW 복잡성]
         │
         └─────────────────────────────────────
              낮음              중간           높음
                               영향도
```

---

## 8. 보안 개선 로드맵

### Phase 1: 즉시 대응 (1-2주)

| # | 개선 항목 | 위험 대응 | 작업량 |
|---|-----------|-----------|--------|
| 1 | `quiz_question_options` SELECT 정책 변경 (admin/service role만 허용) | G2 | 마이그레이션 1개 |
| 2 | avatars 버킷 Storage 정책에 소유자 검증 추가 | G4 | 마이그레이션 1개 |
| 3 | Judge0 `privileged: true` 제거 및 최소 capabilities 설정 | G3 | docker-compose 수정 |
| 4 | Judge0 DB 비밀번호 변경 (`judge0password` → 강력한 비밀번호) | G12 | 설정 파일 수정 |
| 5 | `quiz_attempts` DELETE 정책 추가 (본인 데이터) | G8 | 마이그레이션 1개 |

### Phase 2: 단기 개선 (1-2개월)

| # | 개선 항목 | 위험 대응 | 작업량 |
|---|-----------|-----------|--------|
| 6 | Server Actions 레이트 리밋 도입 (upstash/ratelimit 등) | G1 | 미들웨어 + 유틸리티 |
| 7 | 보안 헤더 추가 (`next.config.ts`의 `headers()`) | G5, G6 | 설정 변경 |
| 8 | 비밀번호 복잡성 규칙 강화 (8자+, 대소문자+숫자+특수문자) | G9 | Zod 스키마 수정 |
| 9 | Service Role Key 사용 최소화 (RLS 정책으로 대체 가능한 곳 정리) | G7 | 리팩토링 |
| 10 | 환경 변수 Zod 검증 레이어 도입 | G11 | 유틸리티 추가 |

### Phase 3: 중장기 개선 (3-6개월)

| # | 개선 항목 | 위험 대응 | 작업량 |
|---|-----------|-----------|--------|
| 11 | 감사 로그(Audit Log) 시스템 도입 | STRIDE-R | 테이블 + 트리거 + UI |
| 12 | 퀴즈 채점 로직을 DB Function (SECURITY DEFINER)으로 이전 | G2 강화 | DB 함수 + Action 리팩토링 |
| 13 | 비밀번호 재설정 기능 구현 | 인증 완성도 | UI + Action + 이메일 |
| 14 | IP 기반 로그인 이력/이상 탐지 | Spoofing 방어 | 로깅 + 분석 |
| 15 | MFA/2FA 도입 (특히 admin 계정) | Spoofing 방어 | Supabase MFA API 통합 |
| 16 | gVisor/kata-containers를 통한 Judge0 추가 격리 | G3 강화 | 인프라 변경 |

### 개선 우선순위 다이어그램

```
긴급도 (높음)
    │
    │  Phase 1             Phase 2
    │  [정답 노출 차단]     [레이트 리밋]
    │  [Judge0 특권 제거]   [보안 헤더]
    │  [Storage 소유자]     [PW 강화]
    │  [기본 PW 변경]
    │
    │                       Phase 3
    │                       [감사 로그]
    │                       [MFA]
    │                       [PW 재설정]
    │
    └─────────────────────────────────── 작업량 (높음)
         (낮음)                   (높음)
```

---

## 9. 타 문서 참조

| 문서 | 관련 내용 | 참조 섹션 |
|------|-----------|-----------|
| [01_system_overview.md](./01_system_overview.md) | 3계층 RBAC 개요, Middleware RBAC 매트릭스, Supabase 클라이언트 이중 구조 | 본 문서 2장(RBAC 분석), 3장(Service Role), 5장(인증) |
| [02_folder_responsibility.md](./02_folder_responsibility.md) | Server Actions 파일 구조, Lib 레이어 구성 | 본 문서 2.1장(Layer 2 Action 목록) |
| [03_runtime_flow.md](./03_runtime_flow.md) | 요청 처리 흐름에서의 인증/인가 단계 | 본 문서 2장(3계층 RBAC 흐름) |
| [04_data_architecture.md](./04_data_architecture.md) | DB 스키마, RLS 정책, 마이그레이션 전략 | 본 문서 1장(RLS 매트릭스) |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | Judge0 Docker 구성, 네트워크 격리, HTTPS 통신 | 본 문서 6.2장 G3(Judge0 보안) |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | 시험/채점 도메인 모델과 정답 보호 전략 | 본 문서 4장(VIEW 분석), 7장(STRIDE) |
| [08_scalability_analysis.md](./08_scalability_analysis.md) | 레이트 리밋/부하 분산 관점의 보안 분석 | 본 문서 6.2장 G1(레이트 리밋) |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | Service Role Key 과다 사용 리팩토링 후보 | 본 문서 3장(Service Role 감사), 8장(Phase 2) |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 보안 설계 학습 가이드 | 본 문서 전체 |

---

## 부록 A: RLS 헬퍼 함수 SECURITY DEFINER 위험

`is_admin()`, `is_mentor()`, `is_mentor_of()` 함수는 모두 `SECURITY DEFINER`로 정의되어 있다. 이는 함수 실행 시 **함수 소유자(보통 postgres superuser)의 권한**으로 실행됨을 의미한다. 함수 내부에서 `profiles` 테이블을 조회하므로, RLS 정책을 우회하여 프로필 데이터에 접근한다.

**이것이 필요한 이유:** RLS 정책 조건 내에서 다른 테이블(profiles)을 조회해야 하므로, SECURITY DEFINER가 아니면 무한 재귀(profiles 조회 → profiles RLS 평가 → profiles 조회 ...)가 발생할 수 있다.

**위험:** 함수 로직에 SQL Injection 취약점이 있을 경우, 상승된 권한으로 악용될 수 있다. 현재 구현에서는 `auth.uid()`만 사용하고 동적 SQL을 구성하지 않으므로, 이 위험은 **낮음**으로 평가된다.

## 부록 B: 핵심 보안 파일 Quick Reference

| 파일 | 역할 | 주요 보안 기능 |
|------|------|----------------|
| `src/middleware.ts` (104줄) | Route 보호, RBAC | 인증 검증, 역할 기반 라우팅 |
| `src/lib/supabase/server.ts` (50줄) | Supabase 클라이언트 팩토리 | 일반/Service Role 분리 |
| `src/app/actions/admin.ts` (432줄) | Admin 작업 | `assertAdmin()` 패턴, service role 사용 |
| `src/app/actions/auth.ts` (35줄) | 인증 | Zod 검증, signIn/signOut |
| `src/app/actions/comprehensive-exam.ts` (462줄) | 종합 시험 | 6개 함수 service role 사용 |
| `src/app/actions/assessment.ts` (263줄) | 등급 테스트 | 서버 사이드 채점, 재시험 관리 |
| `src/app/actions/scores.ts` (293줄) | 점수 재계산 | 전 사용자 스킬 upsert |
| `src/lib/validations/auth.ts` (8줄) | 입력 검증 | 로그인 Zod 스키마 |
| `supabase/migrations/00013_rls_policies.sql` | 기본 RLS | 전 테이블 RLS 활성화 + 기본 정책 |
| `supabase/migrations/00019_admin_rls_policies.sql` | Admin RLS | `is_admin()` 함수 + Admin 정책 |
| `supabase/migrations/00035_mentor_mentee_rls.sql` | 멘토 시스템 RLS | 멘토-멘티 관계 기반 접근 제어 |
| `supabase/migrations/00014_views.sql` | 정답 보호 VIEW | `quiz_question_options_safe` |
| `judge0/docker-compose.yml` (40줄) | Judge0 설정 | privileged 모드 (보안 위험) |
| `judge0/judge0.conf` (18줄) | Judge0 런타임 설정 | DB 인증 정보 하드코딩 |
