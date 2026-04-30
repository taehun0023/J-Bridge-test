# 03. 런타임 흐름 (Runtime Flow)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Tech Lead
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 1. 문서 목적

본 문서는 J-Bridge 시스템의 주요 런타임 흐름을 **시퀀스 다이어그램**으로 시각화하고, 각 단계의 구현 세부사항, 에러 처리 경로, 성능 병목 지점을 분석한다. [01_system_overview.md](./01_system_overview.md)의 3.2절(인증 흐름)과 9장(외부 시스템 통합)의 런타임 관점 심층 분석에 해당한다.

**분석 대상 흐름:**
1. 로그인 → Middleware → Dashboard (온보딩 분기 포함)
2. Comprehensive Exam 전체 생명주기
3. Code Submission + Judge0 채점
4. TTS Request → Cache → Google TTS → Storage
5. Score Recalculation Pipeline (5축)
6. Quiz 제출 + 채점

---

## 2. 로그인 → Middleware → Dashboard 흐름

### 2.1 시퀀스 다이어그램

```
Browser              Middleware                Supabase Auth        Supabase DB           Dashboard
  │                      │                         │                    │                     │
  │── POST /login ──────>│                         │                    │                     │
  │  (Server Action:     │                         │                    │                     │
  │   signIn)            │                         │                    │                     │
  │                      │                         │                    │                     │
  │  ┌─ signIn() ────────────────────────────────>│                    │                     │
  │  │  Zod validation   │                         │                    │                     │
  │  │  signInWithPassword(email, pw)              │                    │                     │
  │  │<───────────── session cookie set ──────────┤                    │                     │
  │  │  redirect('/dashboard')                     │                    │                     │
  │  └───────────────────│                         │                    │                     │
  │                      │                         │                    │                     │
  │── GET /dashboard ───>│                         │                    │                     │
  │                      │── auth.getUser() ──────>│                    │                     │
  │                      │<── user data ───────────┤                    │                     │
  │                      │                         │                    │                     │
  │                      │  [user == null]          │                    │                     │
  │                      │── redirect /login ──>X  │                    │                     │
  │                      │                         │                    │                     │
  │                      │  [user != null]          │                    │                     │
  │                      │── profiles.select ──────│───────────────────>│                     │
  │                      │   (is_onboarded, role)  │                    │                     │
  │                      │<── profile data ────────│────────────────────┤                     │
  │                      │                         │                    │                     │
  │                      │  [is_onboarded == false] │                    │                     │
  │                      │── redirect /onboarding ─│──>X               │                     │
  │                      │                         │                    │                     │
  │                      │  [path=/admin/* && RBAC] │                    │                     │
  │                      │── role check ───────────│                    │                     │
  │                      │  (admin/mentor/mentee)  │                    │                     │
  │                      │── redirect /dashboard ──│──>X (unauthorized) │                     │
  │                      │                         │                    │                     │
  │                      │  [all checks pass]      │                    │                     │
  │                      │── pass through ─────────│────────────────────│────────────────────>│
  │                      │                         │                    │                     │
  │                      │                         │                    │  ┌─ Layout (RSC) ──>│
  │                      │                         │                    │  │ createClient()   │
  │                      │                         │                    │  │ auth.getUser()   │
  │                      │                         │                    │  │ profiles.select  │
  │                      │                         │                    │  │  (full_name,     │
  │                      │                         │                    │  │   role,          │
  │                      │                         │                    │  │   avatar_url)    │
  │                      │                         │                    │  └─ render ────────>│
  │<──────────── HTML Response ──────────────────────────────────────────────────────────────┤
```

### 2.2 단계별 상세 분석

#### Step 1: 로그인 Server Action 실행

**파일:** `src/app/actions/auth.ts:L8-28`

1. `signIn(formData)` Server Action이 호출된다.
2. **Zod 검증** (`loginSchema.safeParse`): email/password 형식 검증 (`src/lib/validations/auth.ts`). 실패 시 `{ error: message }` 반환.
3. `supabase.auth.signInWithPassword(parsed.data)`: Supabase Auth에 인증 요청. 실패 시 일본어 에러 메시지 반환 (`メールアドレスまたはパスワードが正しくありません`).
4. 성공 시 `revalidatePath('/', 'layout')` → 전체 Layout 캐시 무효화.
5. `redirect('/dashboard')`: Next.js의 `redirect()`는 내부적으로 예외를 throw하여 리다이렉트를 수행한다.

**에러 처리:**
- Zod 검증 실패 → 클라이언트에 첫 번째 issue message 반환
- Supabase Auth 실패 → 일반화된 에러 메시지 반환 (보안상 구체적 원인 미노출)

#### Step 2: Middleware 인증 확인

**파일:** `src/middleware.ts:L4-98`

1. `createServerClient()`로 Supabase 클라이언트 생성 (L7-26). 쿠키 읽기/쓰기를 Request/Response 객체에 위임하는 SSR 패턴.
2. `auth.getUser()` 호출 (L28-30): JWT 토큰 검증 + 세션 갱신. 이 호출은 **매 요청마다** 발생하며, Supabase Auth 서버에 네트워크 요청을 보낸다.
3. 미인증 사용자 처리 (L39-43): `/login`, `/signup`, `/api/`, `/auth` 경로가 아닌 경우 `/login`으로 리다이렉트.
4. 인증 사용자의 Auth 페이지 접근 (L46-50): `/login` 또는 `/signup` 접근 시 `/dashboard`로 리다이렉트.

#### Step 3: 온보딩 확인 및 RBAC

**파일:** `src/middleware.ts:L52-95`

1. **온보딩 확인** (L54-65): `profiles.select('is_onboarded, role')` 쿼리 실행. `is_onboarded === false`인 경우 `/onboarding`으로 리다이렉트.
2. **RBAC 검증** (L67-94): `/admin/*` 경로에 대한 역할 기반 접근 제어.

**확인:** Middleware에서 `profiles` 테이블 쿼리가 **인증된 모든 요청**에서 실행된다 (Auth 페이지와 온보딩 페이지 제외). 이는 요청당 1회의 추가 DB 쿼리 오버헤드를 발생시킨다.

**잠재적 병목:** Middleware의 `auth.getUser()` + `profiles.select()`는 매 요청마다 2회의 네트워크 호출을 발생시킨다. 정적 자산은 `matcher` 패턴 (`src/middleware.ts:L100-103`)으로 제외되어 있으나, 페이지 네비게이션마다 이 비용이 발생한다.

#### Step 4: Main Layout 렌더링

**파일:** `src/app/(main)/layout.tsx:L6-33`

1. Server Component에서 다시 `createClient()` → `auth.getUser()` 호출 (L11-12). Middleware에서 이미 세션이 갱신되었으므로, 이 호출은 쿠키 기반 로컬 검증으로 처리될 수 있다.
2. `profiles.select('full_name, role, avatar_url')` 쿼리 (L18-22): Sidebar/Header에 표시할 사용자 정보 조회.
3. `<Providers>` → `<MainShell>` 렌더링: QueryClient + ThemeProvider 래핑 후 Sidebar/Header가 포함된 셸 구성.

**확인:** Middleware와 Layout에서 `profiles` 쿼리가 **중복 실행**된다. Middleware는 `is_onboarded, role`을, Layout은 `full_name, role, avatar_url`을 조회한다. 단일 쿼리로 통합 가능하나, Next.js App Router의 Middleware → RSC 간 데이터 전달 메커니즘이 제한적이라 현재 구조가 불가피하다.

#### Step 5: 온보딩 분기

**파일:** `src/app/actions/onboarding.ts:L7-44`

온보딩 미완료 사용자가 `/onboarding` 페이지에서 `completeOnboarding(formData)` 제출 시:

1. `target_jlpt_level` (N5~N1)과 `target_coding_area` (java/javascript) 검증.
2. `profiles.update({ is_onboarded: true, ... })` 실행.
3. `redirect('/dashboard')`: 온보딩 완료 후 대시보드로 이동.

**에러 처리:**
- 유효하지 않은 JLPT 레벨/코딩 영역 → 일본어 에러 메시지 반환
- DB 업데이트 실패 → 일반 에러 메시지 반환

---

## 3. Comprehensive Exam 전체 흐름

### 3.1 시퀀스 다이어그램

```
Mentee              Admin/Mentor         Server Action              Supabase DB            Notification
  │                      │                     │                        │                      │
  │── requestExam() ────>│                     │                        │                      │
  │  (category,          │                     │                        │                      │
  │   subcategory,       │                     │                        │                      │
  │   contentLevel)      │                     │                        │                      │
  │                      │              ┌──────┤                        │                      │
  │                      │              │ 1. auth check                 │                      │
  │                      │              │ 2. duplicate check ──────────>│                      │
  │                      │              │    (pending/approved/         │                      │
  │                      │              │     in_progress)              │                      │
  │                      │              │ 3. insert comprehensive_exams>│                      │
  │                      │              │ 4. lookup mentors ───────────>│                      │
  │                      │              │ 5. lookup admins ────────────>│                      │
  │                      │              │ 6. createNotification ───────>│──────────────────────>│
  │                      │              └──────┤                        │                      │
  │<── { examId } ───────│                     │                        │                      │
  │                      │                     │                        │                      │
  │                      │<── notification ────│────────────────────────│──────────────────────┤
  │                      │   "○○さんが総合      │                        │                      │
  │                      │    試験をリクエスト"  │                        │                      │
  │                      │                     │                        │                      │
  │                      │── approveExam() ───>│                        │                      │
  │                      │                     │── role check ─────────>│                      │
  │                      │                     │── update status ──────>│                      │
  │                      │                     │   (requested→approved) │                      │
  │                      │                     │── notify mentee ──────>│──────────────────────>│
  │<── notification ─────│─────────────────────│────────────────────────│──────────────────────┤
  │   "総合試験が承認      │                     │                        │                      │
  │    されました"        │                     │                        │                      │
  │                      │                     │                        │                      │
  │── startExam() ──────>│                     │                        │                      │
  │                      │              ┌──────┤                        │                      │
  │                      │              │ 1. auth + ownership check     │                      │
  │                      │              │ 2. status == 'approved' ?     │                      │
  │                      │              │ 3. lookup quizType ────────── │(ASSIGNMENT_CATEGORIES)│
  │                      │              │ 4. fetch matching quizzes ───>│                      │
  │                      │              │ 5. fetch questions ──────────>│                      │
  │                      │              │ 6. shuffle + slice            │                      │
  │                      │              │ 7. update status→in_progress >│                      │
  │                      │              └──────┤                        │                      │
  │<── { questions,      │                     │                        │                      │
  │     timeLimit,       │                     │                        │                      │
  │     startedAt } ─────│                     │                        │                      │
  │                      │                     │                        │                      │
  │  [시험 응시 중...]     │                     │                        │                      │
  │                      │                     │                        │                      │
  │── submitExam() ─────>│                     │                        │                      │
  │  (answers[])         │              ┌──────┤                        │                      │
  │                      │              │ 1. auth + ownership check     │                      │
  │                      │              │ 2. status == 'in_progress' ?  │                      │
  │                      │              │ 3. fetch correct options ────>│                      │
  │                      │              │ 4. grade (compare answers)    │                      │
  │                      │              │ 5. insert exam_answers ──────>│                      │
  │                      │              │ 6. calc score (%)             │                      │
  │                      │              │ 7. update exam ──────────────>│                      │
  │                      │              │    (score, passed, status)    │                      │
  │                      │              │ 8. notify mentors ───────────>│──────────────────────>│
  │                      │              └──────┤                        │                      │
  │<── { score, passed,  │                     │                        │                      │
  │     correctCount } ──│                     │                        │                      │
  │                      │                     │                        │                      │
  │  [불합격 시]           │                     │                        │                      │
  │── requestRetakeExam()>                     │                        │                      │
  │                      │              ┌──────┤                        │                      │
  │                      │              │ 1. status == 'failed' ?       │                      │
  │                      │              │ 2. insert new exam ──────────>│                      │
  │                      │              │    (status: 'requested')      │                      │
  │                      │              │ 3. notify mentors+admins ────>│──────────────────────>│
  │                      │              └──────┤                        │                      │
  │<── { success } ──────│                     │                        │                      │
```

### 3.2 단계별 상세 분석

#### Phase 1: 시험 요청 (requestExam)

**파일:** `src/app/actions/comprehensive-exam.ts:L8-90`

1. **인증 확인** (L9-11): `createClient()` → `auth.getUser()`. 미인증 시 `認証が必要です` 반환.
2. **중복 검사** (L13-25): 동일 `category + subcategory` 조합으로 `requested`, `approved`, `in_progress` 상태인 시험이 존재하면 거부. 이는 동시 시험 요청을 방지한다.
3. **시험 레코드 생성** (L27-38): `comprehensive_exams` 테이블에 INSERT. 기본 상태는 `requested`.
4. **알림 발송** (L41-86): `createServiceRoleClient()`가 사용 가능한 경우에만 알림을 발송한다.
   - `mentor_mentee_assignments` 테이블에서 해당 mentee의 mentor(들) 조회
   - `profiles` 테이블에서 모든 admin 조회
   - 각 mentor와 admin에게 `createNotification()` 호출

**에러 처리:** Service role key가 미설정된 경우, 시험 레코드는 생성되나 알림은 발송되지 않는다. 이는 silent failure로, 운영 시 알림 누락 가능성이 있다.

#### Phase 2: 시험 승인 (approveExam)

**파일:** `src/app/actions/comprehensive-exam.ts:L92-143`

1. **권한 확인** (L97-105): 요청자가 `admin` 또는 `mentor` 역할인지 확인.
2. **Service role 클라이언트 필수** (L107-108): 승인 작업은 `createServiceRoleClient()` 필수. 미설정 시 에러 반환.
3. **상태 전이 검증** (L117): `status !== 'requested'`이면 승인 거부. 이는 **낙관적 동시성 제어**의 일종이나, DB 레벨의 행 잠금은 없다.
4. **상태 업데이트** (L119-127): `requested` → `approved` + `approved_at`, `approved_by` 기록.
5. **Mentee 알림** (L131-138): 시험 시작 가능 알림 발송.

**Race condition 위험:** 두 admin이 동시에 동일 시험을 승인하는 경우, 상태 검증(L117)과 업데이트(L119-127) 사이에 시간차가 존재한다. PostgreSQL의 MVCC 특성상 둘 다 성공할 수 있으며, 결과적으로 중복 알림이 발생할 수 있다. 심각한 데이터 무결성 문제는 아니나, `UPDATE ... WHERE status = 'requested' RETURNING *` 패턴으로 원자적 처리가 가능하다.

#### Phase 3: 시험 시작 (startExam)

**파일:** `src/app/actions/comprehensive-exam.ts:L193-274`

1. **소유권 확인** (L201-206): `examId + user_id` 조합으로 시험 소유권 검증.
2. **상태 전이 검증** (L209): `status !== 'approved'`이면 시작 불가.
3. **문제 조합 구성** (L211-250):
   - `ASSIGNMENT_CATEGORIES` 설정에서 `quizType` 추출
   - 해당 `quiz_type + content_level`에 맞는 퀴즈 ID 목록 조회
   - 문제(`quiz_questions`) + 선택지(`quiz_question_options`) 조회
   - **`Math.random() - 0.5`** 기반 셔플 → `exam.total_questions`개 선택
4. **상태 업데이트** (L253-259): `approved` → `in_progress` + `started_at` 기록.

**보안 고려:** 문제 응답 시 정답(`is_correct`)은 포함하지 않고 `id, option_text`만 반환한다 (L263-270). 서버사이드 채점 패턴 준수.

**추정 (셔플 알고리즘):** `Array.sort(() => Math.random() - 0.5)` 방식은 **균등 분포가 아닌** 편향된 셔플이다. Fisher-Yates 셔플로 교체하면 공정성이 개선된다. 시험 공정성에 직접적 영향은 제한적이나, 일부 문제가 선택될 확률이 미세하게 달라질 수 있다.

#### Phase 4: 시험 제출 (submitExam)

**파일:** `src/app/actions/comprehensive-exam.ts:L276-367`

1. **채점** (L298-313): 서버에서 `quiz_question_options.is_correct = true`인 옵션 조회 후, 제출 답안과 비교.
2. **답안 저장** (L322): `comprehensive_exam_answers` 테이블에 일괄 INSERT.
3. **점수 계산** (L324): `Math.round((correctCount / answers.length) * 100)` — 백분율.
4. **합격 판정** (L325): `score >= exam.passing_score`.
5. **상태 결정** (L326): 합격 시 `completed`, 불합격 시 `failed`.
6. **결과 알림** (L339-361): 담당 mentor(들)에게 결과 알림 (점수 + 합격/불합격).

**확인:** `submitExam()`에서는 `recalculateUserScores()`가 호출되지 **않는다**. Comprehensive Exam은 직접적인 5축 점수 반영 대상이 아니며, 별도의 Assessment Quiz 시스템과 구분된다.

#### Phase 5: 재시험 요청 (requestRetakeExam)

**파일:** `src/app/actions/comprehensive-exam.ts:L382-461`

1. **상태 검증** (L399): `status !== 'failed'`이면 재시험 요청 불가.
2. **새 시험 레코드 생성** (L402-413): 기존 시험의 `category, subcategory, content_level`을 복사하여 새 `requested` 상태의 시험 생성.
3. **알림 발송** (L417-456): mentor + admin에게 재시험 요청 알림.

**확인:** 재시험은 기존 시험과 별개의 레코드로 관리된다. 시험 이력 추적이 가능하며, 중복 요청 방지는 `requestExam()`의 중복 검사 로직에 의존한다.

---

## 4. Code Submission + Judge0 채점 흐름

### 4.1 시퀀스 다이어그램

```
Browser           submitCode()        Judge0 Client           Judge0 API          Supabase DB       Code Review
  │                    │                    │                      │                   │                │
  │── submit ─────────>│                    │                      │                   │                │
  │  (problemId,       │                    │                      │                   │                │
  │   sourceCode,      │                    │                      │                   │                │
  │   language)        │                    │                      │                   │                │
  │                    │── auth check ──────│──────────────────────│──────────────────>│                │
  │                    │── fetch testCases ─│──────────────────────│──────────────────>│                │
  │                    │<── testCases[] ────│──────────────────────│───────────────────┤                │
  │                    │                    │                      │                   │                │
  │                    │── INSERT submission│──────────────────────│──────────────────>│                │
  │                    │   (status:'running')                      │                   │                │
  │                    │                    │                      │                   │                │
  │                    │  ┌─ for each testCase ──────────────────────────────────────────────────────┐ │
  │                    │  │                 │                      │                   │              │ │
  │                    │  │─ createSubmission│──────────────────── >│                   │              │ │
  │                    │  │  (source_code,  │  POST /submissions   │                   │              │ │
  │                    │  │   language_id,  │  ?wait=false         │                   │              │ │
  │                    │  │   stdin,        │                      │                   │              │ │
  │                    │  │   expected)     │                      │                   │              │ │
  │                    │  │<── token ───────│──────────────────────┤                   │              │ │
  │                    │  │                 │                      │                   │              │ │
  │                    │  │─ pollResult() ──│──────────────────── >│                   │              │ │
  │                    │  │  (max 20 polls, │  GET /submissions/   │                   │              │ │
  │                    │  │   1s interval)  │  {token}             │                   │              │ │
  │                    │  │                 │  ┌─ loop ───────────>│                   │              │ │
  │                    │  │                 │  │ status.id <= 2    │                   │              │ │
  │                    │  │                 │  │ (Queue/Processing)│                   │              │ │
  │                    │  │                 │  │ sleep 1000ms      │                   │              │ │
  │                    │  │                 │  └──────────────────>│                   │              │ │
  │                    │  │<── result ──────│──────────────────────┤                   │              │ │
  │                    │  │  (stdout,       │  status.id > 2      │                   │              │ │
  │                    │  │   stderr,       │  (completed)        │                   │              │ │
  │                    │  │   status)       │                      │                   │              │ │
  │                    │  │                 │                      │                   │              │ │
  │                    │  │─ mapJudge0Status()                     │                   │              │ │
  │                    │  │  3=accepted     │                      │                   │              │ │
  │                    │  │  4=wrong_answer │                      │                   │              │ │
  │                    │  │  5=time_limit   │                      │                   │              │ │
  │                    │  │  6=compile_error│                      │                   │              │ │
  │                    │  │  7-12=runtime   │                      │                   │              │ │
  │                    │  │  13-14=memory   │                      │                   │              │ │
  │                    │  │                 │                      │                   │              │ │
  │                    │  └─ end loop ──────│──────────────────────│───────────────────│──────────────┘ │
  │                    │                    │                      │                   │                │
  │                    │── UPDATE submission│──────────────────────│──────────────────>│                │
  │                    │   (status, passed) │                      │                   │                │
  │                    │                    │                      │                   │                │
  │                    │── analyzeCode() ───│──────────────────────│───────────────────│───────────────>│
  │                    │<── reviewItems[] ──│──────────────────────│───────────────────│────────────────┤
  │                    │── INSERT reviews ──│──────────────────────│──────────────────>│                │
  │                    │                    │                      │                   │                │
  │                    │── recalculateUserScores() (fire-and-forget)                   │                │
  │                    │                    │                      │                   │                │
  │<── { status,       │                    │                      │                   │                │
  │     passedCount,   │                    │                      │                   │                │
  │     results[],     │                    │                      │                   │                │
  │     reviews[] } ───│                    │                      │                   │                │
```

### 4.2 단계별 상세 분석

#### Step 1: 제출 초기화

**파일:** `src/app/actions/coding.ts:L9-38`

1. 인증 확인 후 `coding_test_cases` 테이블에서 해당 문제의 테스트 케이스 조회 (정렬: `sort_order ASC`).
2. `code_submissions` 테이블에 초기 레코드 생성 (`status: 'running'`). 이는 제출 추적을 위한 것으로, 채점 완료 전에도 사용자에게 제출 상태를 표시할 수 있다.

#### Step 2: Judge0 제출 + 폴링 루프

**파일:** `src/lib/judge0/client.ts:L57-97`, `src/app/actions/coding.ts:L45-69`

테스트 케이스 **각각에 대해 순차적으로**:

1. `createSubmission()` (L57-71): `POST /submissions?base64_encoded=false&wait=false`. `wait=false`로 비동기 제출.
2. `pollSubmissionResult()` (L89-97): 최대 20회, 1초 간격으로 폴링.
   - `status.id <= 2` (In Queue / Processing): 계속 대기
   - `status.id > 2`: 결과 반환
   - 20회 초과 시 `Submission timed out` 에러
3. `mapJudge0Status()` (L100-110): Judge0 상태 코드를 애플리케이션 상태로 매핑.

**성능 병목 (확인):** 테스트 케이스 N개에 대해 **순차 실행**한다. 각 테스트 케이스당 최대 20초(20회 x 1초) 대기 가능하므로, 이론적 최대 대기 시간은 `N x 20초`이다. 10개 테스트 케이스 기준 최대 200초.

**개선 가능성:** `Promise.all()` 또는 배치 제출 (`POST /submissions/batch`)을 활용하면 병렬 처리가 가능하다. 단, Judge0 서버 자원 제한 및 RapidAPI 요금 정책을 고려해야 한다.

**확인 (Judge0 호스팅):** `src/lib/judge0/client.ts:L3`의 `IS_RAPIDAPI` 플래그에 따라 RapidAPI 호스팅과 self-hosted를 자동 판별한다. 헤더 구성이 달라지며 (`X-RapidAPI-Key` vs `X-Auth-Token`), 이는 `getHeaders()` (L38-55)에서 처리한다.

#### Step 3: 결과 저장 + 코드 리뷰

**파일:** `src/app/actions/coding.ts:L72-93`

1. `code_submissions` 업데이트: 전체 테스트 케이스 통과 시 `accepted`, 아니면 첫 번째 실패 상태.
2. `analyzeCode()` 호출 (`src/lib/code-review/analyzer.ts:L159-168`): 언어별 룰 기반 정적 분석.
   - **Java**: 변수 명명, 들여쓰기, 일본어 코멘트, 성능(String 결합), 빈 catch, 매직 넘버, 줄 길이 (최대 10개 리뷰 항목)
   - **JavaScript**: var 사용, == vs ===, console.log (최대 10개 리뷰 항목)
3. `code_reviews` 테이블에 리뷰 항목 INSERT.

#### Step 4: 점수 재계산 (Fire-and-Forget)

**파일:** `src/app/actions/coding.ts:L98`

```typescript
recalculateUserScores(user.id).catch(() => {})
```

**확인:** `recalculateUserScores()`는 **fire-and-forget** 패턴으로 호출된다. `.catch(() => {})`로 에러를 무시하므로, 점수 재계산 실패 시 사용자에게 알림 없이 실패한다. 제출 결과 반환은 점수 재계산 완료를 기다리지 않는다.

**에러 전파:** 점수 재계산 실패는 사용자 응답에 영향을 주지 않으나, 대시보드의 레이더 차트가 최신 상태를 반영하지 못할 수 있다. 다음 성공적 재계산 시 누적 반영되므로, 데이터 정합성은 **최종적 일관성(eventual consistency)** 모델이다.

#### Step 5: 에러 처리 (Judge0 장애)

**파일:** `src/app/actions/coding.ts:L113-128`

Judge0 API 호출 중 예외 발생 시:
1. `code_submissions` 상태를 `runtime_error`로 업데이트.
2. 에러 메시지에서 Judge0 관련 여부 판별 → 맞춤형 일본어 에러 메시지 반환.

**확인:** Judge0 서버 연결 실패와 실제 코드 런타임 에러를 구분하여 메시지를 제공한다 (`コード実行サーバー接続失敗` vs `コード実行中にエラーが発生しました`).

---

## 5. TTS Request → Cache → Google TTS → Storage

### 5.1 시퀀스 다이어그램

```
Client              POST /api/tts          Supabase Storage       Google Cloud TTS
  │                      │                       │                      │
  │── POST { text,       │                       │                      │
  │    speed } ─────────>│                       │                      │
  │                      │                       │                      │
  │                      │── auth check ─────────│                      │
  │                      │   (auth.getUser)      │                      │
  │                      │   [!user → 401]       │                      │
  │                      │                       │                      │
  │                      │── validate ───────────│                      │
  │                      │   (!text → 400)       │                      │
  │                      │   (>5000 chars → 400) │                      │
  │                      │                       │                      │
  │                      │── getCacheKey() ──────│                      │
  │                      │   SHA-256(text+speed)  │                      │
  │                      │                       │                      │
  │                      │── getFromCache() ────>│                      │
  │                      │   download(hash.mp3)  │                      │
  │                      │                       │                      │
  │               ┌──────│── [CACHE HIT] ────────┤                      │
  │               │      │<── Buffer ────────────┤                      │
  │               │      │                       │                      │
  │<── audio/mpeg │      │   X-TTS-Cache: hit    │                      │
  │    (cached)   │      │                       │                      │
  │               └──────│                       │                      │
  │                      │                       │                      │
  │               ┌──────│── [CACHE MISS] ───────┤                      │
  │               │      │                       │                      │
  │               │      │── parseDialogueScript()                      │
  │               │      │                       │                      │
  │               │  ┌───│── [NON-DIALOGUE] ─────│─────────────────────>│
  │               │  │   │   synthesize(全文,     │  POST text:synthesize│
  │               │  │   │    narratorVoice)      │  ?key=API_KEY       │
  │               │  │   │<── audioBuffer ────────│──────────────────────┤
  │               │  └───│                       │                      │
  │               │      │                       │                      │
  │               │  ┌───│── [DIALOGUE MODE] ────│                      │
  │               │  │   │   groupSegments()     │                      │
  │               │  │   │   speakerVoiceMap     │                      │
  │               │  │   │                       │                      │
  │               │  │   │  ┌─ for each segment ─│─────────────────────>│
  │               │  │   │  │  synthesize(text,  │  POST text:synthesize│
  │               │  │   │  │   voice[speaker])  │                      │
  │               │  │   │  │<── partial audio ──│──────────────────────┤
  │               │  │   │  └─ end loop ─────────│                      │
  │               │  │   │                       │                      │
  │               │  │   │   Buffer.concat(all)  │                      │
  │               │  └───│                       │                      │
  │               │      │                       │                      │
  │               │      │── saveToCache() ─────>│  (fire-and-forget)   │
  │               │      │   upload(hash.mp3)    │                      │
  │               │      │                       │                      │
  │<── audio/mpeg │      │   X-TTS-Cache: miss   │                      │
  │    (fresh)    │      │                       │                      │
  │               └──────│                       │                      │
```

### 5.2 단계별 상세 분석

#### Step 1: 인증 + 입력 검증

**파일:** `src/app/api/tts/route.ts:L137-168`

1. **인증** (L139-143): `createClient()` → `auth.getUser()`. 미인증 시 HTTP 401.
2. **API Key 확인** (L145-148): `GOOGLE_CLOUD_TTS_API_KEY` 미설정 시 HTTP 500.
3. **입력 검증** (L150-165):
   - JSON 파싱 실패 → HTTP 400
   - `text` 미입력 / 빈 문자열 → HTTP 400
   - `text.length > 5000` → HTTP 400
   - `speed` 범위 클램핑: `Math.max(0.5, Math.min(2.0, speed))`

#### Step 2: 캐시 확인

**파일:** `src/app/api/tts/route.ts:L168-183`

1. **캐시 키 생성** (L168): `SHA-256(text + '__' + speed)` → hex 문자열.
2. **Storage 클라이언트** (L171): `createServiceRoleClient() ?? supabase` — Service role 우선, fallback으로 일반 클라이언트 사용.
3. **캐시 조회** (L174): `tts-cache` 버킷에서 `{hash}.mp3` 파일 다운로드 시도.
4. **캐시 히트** (L175-183): `X-TTS-Cache: hit` 헤더와 함께 즉시 반환.

**확인:** 캐시 전략은 **content-addressable** 방식으로, 동일 텍스트+속도 조합은 항상 동일 캐시 키를 생성한다. 캐시 만료/무효화 정책은 존재하지 않으며, 한번 생성된 캐시는 영구 보존된다.

#### Step 3: 대화문 감지 + 음성 합성

**파일:** `src/app/api/tts/route.ts:L61-88` (파싱), `L186-216` (합성)

1. **대화문 파싱** (`parseDialogueScript()`): `田中：セリフ` 형식(전각 콜론 `：`) 감지. 2줄 이상 대화 형식이면 dialogue 모드.
2. **비대화 모드** (L189-191): 내레이터 음성(`ja-JP-Neural2-B`, FEMALE) 단일 합성.
3. **대화 모드** (L193-216):
   - `groupSegments()`: 연속 동일 화자 세그먼트 병합
   - 화자별 음성 할당: voicePool에서 순차 배정 (4개 음성 순환)
   - **세그먼트별 순차 합성**: 각 세그먼트에 대해 Google TTS API 호출
   - `Buffer.concat()`: 모든 오디오 버퍼 연결

**성능 병목:** 대화문 N개 세그먼트에 대해 Google TTS API를 **순차 호출**한다. 각 API 호출에 200~500ms 소요되므로, 10개 세그먼트 기준 2~5초 지연. `Promise.all()` 병렬 처리로 개선 가능하나, Google TTS API의 rate limit 고려 필요.

#### Step 4: 캐시 저장 (Fire-and-Forget)

**파일:** `src/app/api/tts/route.ts:L219`

```typescript
saveToCache(storageClient, cacheKey, audioBuffer).catch(() => {})
```

**확인:** 캐시 저장은 fire-and-forget 패턴. 저장 실패 시에도 음성은 정상 반환. Storage 업로드 실패(용량 초과, 네트워크 장애 등) 시 다음 동일 요청에서 다시 TTS API를 호출하게 된다.

**에러 처리** (L228-231): TTS 합성 과정의 모든 예외는 `console.error`로 로깅 후 HTTP 500 반환.

---

## 6. Score Recalculation Pipeline (5축)

### 6.1 시퀀스 다이어그램

```
Trigger              recalculateUserScores()                Supabase DB
(submitCode,              │                                      │
 submitQuiz,              │                                      │
 admin batch)             │                                      │
  │                       │                                      │
  │── invoke(userId) ────>│                                      │
  │                       │── createServiceRoleClient()          │
  │                       │   ?? createClient()                  │
  │                       │                                      │
  │                       │══ Q1: profiles.select(*) ═══════════>│
  │                       │<══ { is_japanese, ... } ═════════════┤
  │                       │                                      │
  │                       │══ Q2: quiz_attempts.select ═════════>│
  │                       │   (score, passed, quiz_id,           │
  │                       │    quizzes.quiz_type)                │
  │                       │   WHERE user_id, completed_at!=null  │
  │                       │<══ attempts[] ═══════════════════════┤
  │                       │                                      │
  │                       │── separate assessment vs regular ────│
  │                       │   ASSESSMENT_ID_TO_STEP mapping      │
  │                       │   assessmentScores[step] = best      │
  │                       │   regularBestPerQuiz[type:id] = best │
  │                       │                                      │
  │                       │── Axis 1: 生活日本語 ────────────────│
  │                       │   vocabMastery = avg(jlpt_vocab)     │
  │                       │   grammarMastery = avg(jlpt_grammar) │
  │                       │   readingMastery = avg(jlpt_reading) │
  │                       │   listeningMastery = avg(jlpt_listening)
  │                       │   weighted avg (30/30/25/15)         │
  │                       │   Math.max(assessment[1], learning)  │
  │                       │   [skip if is_japanese]              │
  │                       │                                      │
  │                       │── Axis 2: ビジネス日本語 ────────────│
  │                       │   itTermScore = avg(it_terminology)  │
  │                       │   businessConvScore = avg(role_play)  │
  │                       │   docReadingScore = itTermScore*0.8  │
  │                       │   weighted avg (40/30/30)            │
  │                       │   Math.max(assessment[2], learning)  │
  │                       │   [skip if is_japanese]              │
  │                       │                                      │
  │                       │══ Q3: code_submissions.select ══════>│
  │                       │   (problem_id, language, status,     │
  │                       │    passed/total, difficulty)         │
  │                       │<══ submissions[] ════════════════════┤
  │                       │                                      │
  │                       │── Axis 3: CS知識 ────────────────────│
  │                       │   bestByProblem (per language)       │
  │                       │   difficultyMultiplier               │
  │                       │   (easy=0.6, medium=0.8, hard=1.0)  │
  │                       │   javaScore, jsScore, algorithmScore │
  │                       │   coreQuizAvg (core_programming)    │
  │                       │   Math.max(assessment[3], learning)  │
  │                       │                                      │
  │                       │══ Q4: coding_exam_attempts.select ══>│
  │                       │   (score, passed, target_rank)       │
  │                       │   WHERE passed=true                  │
  │                       │<══ examAttempts[] ═══════════════════┤
  │                       │                                      │
  │                       │── Axis 4: 開発実務能力 ──────────────│
  │                       │   highestRankScore                   │
  │                       │   (D=20,C=40,B=60,A=80,S=100)      │
  │                       │   springBoot = rank*0.8              │
  │                       │   react = rank*0.7                   │
  │                       │   dbDesign = langAvg*0.9             │
  │                       │   project = rank*0.6                 │
  │                       │   Math.max(assessment[4], learning)  │
  │                       │                                      │
  │                       │── Axis 5: ビジネスリテラシー ────────│
  │                       │   avg(attitude_culture quizzes)      │
  │                       │   Math.max(assessment[5], learning)  │
  │                       │                                      │
  │                       │══ Q5: japanese_skills.upsert ═══════>│
  │                       │   (10 fields)                        │
  │                       │══ Q6: coding_skills.upsert ═════════>│
  │                       │   (11 fields)                        │
  │                       │══ Q7: attitude_culture_skills.upsert>│
  │                       │   (7 fields)                         │
  │                       │══ Q8: dispatch_readiness.insert ════>│
  │                       │   (snapshot record)                  │
  │                       │                                      │
  │                       │── revalidatePath('/dashboard')       │
  │                       │── revalidatePath('/profile')         │
  │                       │── revalidatePath('/admin/reports')   │
  │                       │                                      │
  │<── { success } ───────│                                      │
```

### 6.2 단계별 상세 분석

#### DB 쿼리 실행 순서 (8+ 쿼리)

**파일:** `src/app/actions/scores.ts:L18-262`

| 순서 | 쿼리 대상 | 행 | 목적 |
|------|-----------|------|------|
| Q1 | `profiles` | L22-26 | `is_japanese` 플래그 확인 (일본인은 Axis 1,2 스킵) |
| Q2 | `quiz_attempts` + `quizzes` (JOIN) | L31-36 | 완료된 전체 퀴즈 시도 조회 |
| Q3 | `code_submissions` + `coding_problems` (JOIN) | L121-124 | 코드 제출 이력 조회 |
| Q4 | `coding_exam_attempts` + `coding_skill_exams` (JOIN) | L165-169 | 합격한 코딩 등급 시험 조회 |
| Q5 | `japanese_skills` UPSERT | L205-217 | Axis 1,2 스킬 저장 |
| Q6 | `coding_skills` UPSERT | L219-232 | Axis 3,4 스킬 저장 |
| Q7 | `attitude_culture_skills` UPSERT | L234-244 | Axis 5 스킬 저장 |
| Q8 | `dispatch_readiness_scores` INSERT | L247-255 | 파견 준비도 스냅샷 기록 |

**확인:** 총 **8개 쿼리**가 순차 실행된다. Q1~Q4는 읽기(SELECT), Q5~Q8은 쓰기(UPSERT/INSERT)이다.

#### 5축 계산 로직 상세

**Assessment vs Regular Quiz 이중 구조** (L37-60):

```
assessmentScores[step]  →  등급테스ト(Assessment Quiz) 최고 점수 (직접 레이더 축 매핑)
regularBestPerQuiz[type:id] → 일반 학습 퀴즈 최고 점수 (보조 지표)
```

각 축의 최종 normalized 값은 `Math.max(assessment, learning)`으로 결정된다. Assessment Quiz 결과가 학습 퀴즈보다 항상 우선하거나 같다.

**Axis 1: 生活日本語** (L75-99)
- 가중치: vocab(30%) + grammar(30%) + reading(25%) + listening(15%)
- 활성 파트만 가중 평균 계산 (0점 파트 제외)
- `is_japanese == true`인 경우 전체 스킵 (L79)

**Axis 2: ビジネス日本語** (L101-118)
- `docReadingScore = itTermScore * 0.8` — IT 용어 점수에서 파생 (L109)
- 가중치: it_terminology(40%) + doc_reading(30%) + business_conv(30%)
- `is_japanese == true`인 경우 전체 스킵

**Axis 3: CS知識** (L120-162)
- 코드 제출의 문제별 최고 통과율 기반
- `difficultyMultiplier`: easy=0.6, medium=0.8, hard=1.0
- Java/JavaScript 별도 점수 + algorithm(medium/hard만) + core_programming 퀴즈 평균

**Axis 4: 開発実務能力** (L164-187)
- 코딩 등급 시험(`coding_skill_exams`) 최고 합격 등급 기반
- D=20, C=40, B=60, A=80, S=100점으로 매핑
- 파생 점수: Spring Boot(80%), React(70%), DB설계(90%), Project(60%)

**Axis 5: ビジネスリテラシー** (L189-201)
- `attitude_culture` 타입 퀴즈 평균
- 단일 normalized 값이 6개 하위 항목에 동일하게 적용됨 (L195-200)

#### 원자성 (Atomicity) 분석

**확인:** Q5~Q8의 4개 쓰기 쿼리가 **트랜잭션 없이** 순차 실행된다. 중간에 실패하면 부분 업데이트 상태가 된다.

**시나리오:**
- Q5 (japanese_skills) 성공 → Q6 (coding_skills) 실패 → Q7, Q8 미실행
- 결과: Axis 1,2는 최신, Axis 3,4,5는 이전 값 유지, 스냅샷 미생성

**영향:** 다음 성공적 재계산 시 전체 축이 갱신되므로, 최종적 일관성은 보장된다. 다만, 부분 업데이트 상태에서 대시보드에 비일관적 데이터가 일시적으로 표시될 수 있다.

**권장:** Supabase의 `rpc()` (PostgreSQL function)를 활용한 단일 트랜잭션 처리가 이상적이나, 현재 구조에서의 영향도는 낮다.

#### 배치 재계산

**파일:** `src/app/actions/scores.ts:L267-292`

`recalculateAllScores()`는 admin 전용으로, 전체 사용자에 대해 **순차적으로** `recalculateUserScores()`를 호출한다.

**성능 고려:** 사용자 N명 x 쿼리 8개 = **8N개 DB 쿼리**. 50명 기준 400개 쿼리. 현재 규모에서는 문제없으나, 사용자 증가 시 타임아웃 위험.

---

## 7. Quiz 제출 + 채점 흐름

### 7.1 시퀀스 다이어그램

```
Browser           startQuizAttempt()    submitQuizAnswers()      Supabase DB        Score Pipeline
  │                     │                      │                     │                    │
  │── start quiz ──────>│                      │                     │                    │
  │  (quizId)           │                      │                     │                    │
  │                     │── auth check ────────│────────────────────>│                    │
  │                     │── INSERT attempt ────│────────────────────>│                    │
  │                     │   (user_id, quiz_id) │                     │                    │
  │<── { attemptId } ───│                      │                     │                    │
  │                     │                      │                     │                    │
  │  [사용자가 퀴즈 풀이 중...]                 │                     │                    │
  │                     │                      │                     │                    │
  │── submit answers ──────────────────────────>                     │                    │
  │  (attemptId,        │                      │                     │                    │
  │   answers[])        │                      │                     │                    │
  │                     │               ┌──────┤                     │                    │
  │                     │               │ 1. auth check              │                    │
  │                     │               │ 2. verify attempt ────────>│                    │
  │                     │               │    (ownership + !completed)│                    │
  │                     │               │                            │                    │
  │                     │               │ 3. fetch correct options ─>│                    │
  │                     │               │    quiz_question_options   │                    │
  │                     │               │    WHERE is_correct=true   │                    │
  │                     │               │<── correctMap ─────────────┤                    │
  │                     │               │                            │                    │
  │                     │               │ 4. grade answers           │                    │
  │                     │               │    for each answer:        │                    │
  │                     │               │      correctMap.get(qId)   │                    │
  │                     │               │      == selectedOptionId?  │                    │
  │                     │               │                            │                    │
  │                     │               │ 5. INSERT quiz_answers ───>│                    │
  │                     │               │    (attempt_id, question_id│                    │
  │                     │               │     selected, is_correct)  │                    │
  │                     │               │                            │                    │
  │                     │               │ 6. calc score (%)          │                    │
  │                     │               │    round(correct/total*100)│                    │
  │                     │               │                            │                    │
  │                     │               │ 7. fetch passing_score ───>│                    │
  │                     │               │    quizzes.passing_score   │                    │
  │                     │               │<── { passing_score: 70 } ──┤                    │
  │                     │               │                            │                    │
  │                     │               │ 8. passed = score >= 70    │                    │
  │                     │               │                            │                    │
  │                     │               │ 9. UPDATE attempt ────────>│                    │
  │                     │               │    (score, passed,         │                    │
  │                     │               │     completed_at)          │                    │
  │                     │               │                            │                    │
  │                     │               │ 10. recalculateUserScores()│───────────────────>│
  │                     │               │     (fire-and-forget)      │                    │
  │                     │               │                            │                    │
  │                     │               │ 11. [if passed]            │                    │
  │                     │               │     checkAssignmentProgress()                   │
  │                     │               │     (fire-and-forget)      │                    │
  │                     │               └──────┤                     │                    │
  │                     │                      │                     │                    │
  │<── { score, passed, │                      │                     │                    │
  │     correctCount,   │                      │                     │                    │
  │     totalCount } ───│                      │                     │                    │
```

### 7.2 단계별 상세 분석

#### Phase 1: 퀴즈 시작 (startQuizAttempt)

**파일:** `src/app/actions/quiz.ts:L8-23`

1. 인증 확인 후 `quiz_attempts` 테이블에 새 시도 레코드 INSERT.
2. 반환: `{ attemptId }` — 이후 답안 제출 시 이 ID 사용.

**확인:** 동일 퀴즈에 대한 중복 시도 제한이 없다. 사용자는 동일 퀴즈를 무제한 재시도 가능하며, 점수 계산 시 **최고 점수**만 반영된다 (`recalculateUserScores`의 로직).

#### Phase 2: 답안 제출 + 채점 (submitQuizAnswers)

**파일:** `src/app/actions/quiz.ts:L25-114`

1. **시도 소유권 확인** (L35-43): `attempt_id + user_id + completed_at IS NULL` 조건으로 유효한 시도인지 검증. 이미 완료된 시도에 대한 재제출 방지.
2. **서버사이드 정답 검증** (L46-55): `quiz_question_options` 테이블에서 `is_correct = true`인 옵션만 조회. 정답 정보는 클라이언트에 노출되지 않는다.
3. **채점** (L58-68): `correctMap.get(questionId) === selectedOptionId` 비교.
4. **답안 저장** (L70-71): `quiz_answers` 테이블에 일괄 INSERT.
5. **합격 판정** (L74-85): `quizzes.passing_score` 조회 (기본값 70), `score >= passing_score`로 판정.
6. **시도 업데이트** (L87-96): `score, passed, completed_at` 기록.

#### Phase 3: 후속 처리 (Fire-and-Forget)

**파일:** `src/app/actions/quiz.ts:L100-106`

1. `recalculateUserScores(user.id).catch(() => {})` — 5축 점수 재계산 (Section 6 참조).
2. `checkAssignmentProgress(user.id, attempt.quiz_id).catch(() => {})` — 학습 과제 진행률 업데이트 (합격 시에만).

**확인 (`src/app/actions/learning-assignments.ts:L149-186`):** `checkAssignmentProgress()`는:
1. `learning_assignments` 테이블에서 해당 `quiz_id`를 `required_quiz_ids`에 포함하는 미완료 과제 조회.
2. `passed_quiz_ids`에 현재 퀴즈 ID 추가.
3. 모든 필수 퀴즈 합격 시 과제 상태를 `completed`로 변경.

이 로직은 Service role 클라이언트가 필요하며 (`L150-151`), 미설정 시 즉시 반환한다 (과제 진행률 미반영).

---

## 8. 비동기 처리 패턴 정리

### 8.1 Fire-and-Forget 패턴 사용처

| 위치 | 호출 | 실패 시 영향 |
|------|------|-------------|
| `coding.ts:L98` | `recalculateUserScores().catch(() => {})` | 대시보드 점수 미반영 (최종적 일관성) |
| `quiz.ts:L101` | `recalculateUserScores().catch(() => {})` | 동일 |
| `quiz.ts:L105` | `checkAssignmentProgress().catch(() => {})` | 학습 과제 진행률 미반영 |
| `tts/route.ts:L219` | `saveToCache().catch(() => {})` | 캐시 미저장 (다음 요청 시 재생성) |

**평가:** 모든 fire-and-forget 호출이 비핵심 후속 처리에 사용되고 있어, 패턴 자체는 적절하다. 다만, `.catch(() => {})`로 에러를 **완전 무시**하므로, 에러 모니터링이 불가능하다. 최소한 `console.error` 로깅 추가를 권장한다.

### 8.2 Polling 패턴

**위치:** `src/lib/judge0/client.ts:L89-97`

```typescript
// 최대 20회, 1초 간격, status.id > 2 까지
for (let i = 0; i < maxAttempts; i++) {
  const result = await getSubmissionResult(token)
  if (result.status.id > 2) return result
  await new Promise((resolve) => setTimeout(resolve, 1000))
}
throw new Error('Submission timed out')
```

**확인:** Server Action 내에서 실행되므로, 요청 타임아웃(Next.js 기본값: `serverActionsBodySizeLimit` 기반 / Vercel: 10~60초)에 의해 중단될 수 있다. 특히 순차 테스트 케이스 실행 시 전체 대기 시간이 서버 타임아웃을 초과할 위험이 있다.

---

## 9. 에러 전파 경로

### 9.1 에러 전파 다이어그램

```
                    ┌─────────────────────────────────────────────┐
                    │              에러 발생 지점                    │
                    │                                             │
  Judge0 API 장애 ──>│  coding.ts:L113-128                        │
                    │  → submission status='runtime_error'         │
                    │  → { error: 'コード実行サーバー接続失敗...' }  │
                    │                                             │
  TTS API 장애 ────>│  tts/route.ts:L228-231                     │
                    │  → console.error                            │
                    │  → HTTP 500 { error: 'Internal server error'}│
                    │                                             │
  Supabase 장애 ───>│  각 action 파일                              │
                    │  → { error: 'DB error message' }            │
                    │                                             │
  인증 만료 ───────>│  middleware.ts:L39-43                       │
                    │  → redirect('/login')                       │
                    │                                             │
  Score 재계산 실패 >│  .catch(() => {}) — 에러 흡수                │
                    │  → 사용자 미통지, 다음 재계산 시 복구          │
                    └─────────────────────────────────────────────┘
```

### 9.2 에러 처리 패턴 비교

| 패턴 | 사용처 | 장점 | 단점 |
|------|--------|------|------|
| `return { error }` | Server Actions 전반 | 클라이언트에서 에러 표시 가능 | 표준화되지 않음 (일부 일본어, 일부 영어) |
| `NextResponse.json({ error }, { status })` | API Routes (TTS) | HTTP 표준 에러 코드 사용 | 클라이언트 에러 핸들링 필요 |
| `redirect()` | Auth 관련 | 사용자 흐름 자동 전환 | 에러 원인 미전달 |
| `.catch(() => {})` | Fire-and-forget | 메인 흐름 미차단 | 에러 추적 불가 |

---

## 10. 성능 병목 포인트 식별

### 10.1 요약

```
심각도 (HIGH)
    │
    │  [Judge0 순차 폴링]        [Middleware DB쿼리/요청당]
    │  N TC x 20s worst-case     auth.getUser() + profiles.select()
    │
    │  [TTS 대화문 순차합성]      [Score 배치 재계산]
    │  N segments x API latency  N users x 8 queries
    │
    │  [Score 4연속 UPSERT]
    │  트랜잭션 없는 순차 쓰기
    │
    └───────────────────────────────── 개선 비용 (HIGH)
         (LOW)                    (HIGH)
```

### 10.2 상세

| 병목 | 위치 | 현재 동작 | 영향 | 개선 방안 |
|------|------|----------|------|----------|
| Judge0 순차 폴링 | `coding.ts:L45-69` | TC당 순차 submit + poll | TC 10개 시 최대 200초 | `Promise.all()` 병렬 처리 또는 batch API |
| Middleware 중복 쿼리 | `middleware.ts:L28,55` | 매 요청당 2회 네트워크 호출 | 체감 latency 증가 | 쿠키 기반 캐싱 또는 edge function |
| TTS 순차 합성 | `tts/route.ts:L200-213` | 세그먼트당 순차 API 호출 | 대화문 길수록 지연 | `Promise.all()` 병렬 합성 |
| Score 배치 재계산 | `scores.ts:L286-289` | 사용자당 순차 실행 | N명 x 8쿼리 = 8N DB 호출 | `Promise.allSettled()` + DB function |
| Layout 중복 쿼리 | `layout.tsx:L12,18` | Middleware와 동일 테이블 재조회 | 추가 DB 호출 1회 | Next.js 데이터 캐싱 활용 |

---

## 11. 타 문서 참조

| 문서 | 관련 섹션 |
|------|-----------|
| [01_system_overview.md](./01_system_overview.md) | 2.3 Server Actions 패턴, 3.2 인증 흐름, 9장 외부 시스템 통합 |
| [02_folder_responsibility.md](./02_folder_responsibility.md) | actions/ 디렉토리 책임, lib/ 레이어 구조 |
| [04_data_architecture.md](./04_data_architecture.md) | 테이블 관계, UPSERT 전략, RLS 정책 |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | Judge0/TTS API 네트워크 경로, 타임아웃 설정 |
| [06_security_design.md](./06_security_design.md) | Middleware RBAC, 서버사이드 정답 검증, Service Role 사용 패턴 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | Comprehensive Exam 상태 기계, Assessment Quiz 매핑 |
| [08_scalability_analysis.md](./08_scalability_analysis.md) | Judge0 폴링 확장성, Score 배치 재계산 확장성 |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | scores.ts 분할, 트랜잭션 도입, 에러 로깅 개선 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 런타임 흐름 이해를 위한 학습 경로 |

---

## 부록 A: 핵심 파일 Quick Reference

| 파일 | 줄 수 | 본 문서 관련 섹션 |
|------|------|------------------|
| `src/middleware.ts` | 104 | Section 2 (로그인/Middleware) |
| `src/app/actions/auth.ts` | 35 | Section 2 (로그인) |
| `src/app/actions/onboarding.ts` | 44 | Section 2 (온보딩 분기) |
| `src/app/(main)/layout.tsx` | 33 | Section 2 (Layout 렌더링) |
| `src/app/actions/comprehensive-exam.ts` | 461 | Section 3 (종합 시험) |
| `src/app/actions/coding.ts` | 150 | Section 4 (코드 제출) |
| `src/lib/judge0/client.ts` | 110 | Section 4 (Judge0 통합) |
| `src/lib/code-review/analyzer.ts` | 168 | Section 4 (코드 리뷰) |
| `src/app/api/tts/route.ts` | 232 | Section 5 (TTS) |
| `src/app/actions/scores.ts` | 292 | Section 6 (점수 재계산) |
| `src/app/actions/quiz.ts` | 114 | Section 7 (퀴즈) |
| `src/app/actions/notifications.ts` | 136 | Section 3 (알림 발송) |
| `src/app/actions/learning-assignments.ts` | 202 | Section 7 (과제 진행률) |
| `src/lib/supabase/server.ts` | 50 | 전 섹션 (클라이언트 생성) |
| `src/lib/assessment-config.ts` | 106 | Section 6 (축/등급 설정) |
