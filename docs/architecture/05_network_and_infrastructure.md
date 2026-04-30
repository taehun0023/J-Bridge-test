# 05. 네트워크 및 인프라스트럭처 (Network & Infrastructure)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Infrastructure Engineer
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 1. ASCII 네트워크 토폴로지

### 1.1 전체 네트워크 구성도

```
                         ┌─────────────────────────────────────────┐
                         │          Internet / Public Zone          │
                         └────────────────┬────────────────────────┘
                                          │ HTTPS (443)
                                          ▼
                         ┌─────────────────────────────────────────┐
                         │        Browser (Client)                 │
                         │   React 19 Client Components            │
                         │   @supabase/ssr (Browser Client)        │
                         │   @tanstack/react-query (Cache)         │
                         │   Monaco Editor (Code Editor)           │
                         └────────┬───────────────┬────────────────┘
                                  │               │
                       HTTPS (443)│               │ HTTPS (443)
                     Server Actions│              │ Direct Client
                     API Routes    │              │ (Auth/Realtime)
                                  │               │
                  ┌───────────────▼───┐   ┌──────▼──────────────┐
                  │   Next.js 16      │   │   Supabase Cloud    │
                  │   (BFF Server)    │   │   *.supabase.co     │
                  │                   │   │                     │
                  │  ┌─────────────┐  │   │  ┌──────────────┐  │
                  │  │ Middleware   │  │   │  │ Auth (GoTrue)│  │
                  │  │ (Auth+RBAC) │  │   │  │ :443/auth/v1 │  │
                  │  └──────┬──────┘  │   │  └──────────────┘  │
                  │         ▼         │   │  ┌──────────────┐  │
                  │  ┌─────────────┐  │   │  │ PostgREST    │  │
                  │  │ Server      │──┼───┼─>│ :443/rest/v1 │  │
                  │  │ Actions     │  │   │  └──────────────┘  │
                  │  │ (17 files)  │  │   │  ┌──────────────┐  │
                  │  └─────────────┘  │   │  │ Storage      │  │
                  │  ┌─────────────┐  │   │  │ :443/storage │  │
                  │  │ API Routes  │──┼───┼─>│ /v1/object   │  │
                  │  │ /api/tts    │  │   │  └──────────────┘  │
                  │  │ /api/admin/ │  │   │  ┌──────────────┐  │
                  │  └──────┬──────┘  │   │  │ PostgreSQL   │  │
                  │         │         │   │  │ :5432        │  │
                  └─────────┼─────────┘   │  │ (internal)   │  │
                            │             │  └──────────────┘  │
              ┌─────────────┼─────────────┤                    │
              │             │             └────────────────────┘
              ▼             ▼
    ┌──────────────┐  ┌───────────────────────────┐
    │ Google Cloud  │  │ Judge0 (Docker Compose)   │
    │ TTS API       │  │ localhost:2358             │
    │               │  │                           │
    │ HTTPS (443)   │  │  ┌────────┐  ┌────────┐  │
    │ texttospeech  │  │  │ Server │  │Workers │  │
    │ .googleapis   │  │  │ :2358  │  │(isolate│  │
    │ .com/v1       │  │  └───┬────┘  └───┬────┘  │
    │               │  │      │           │        │
    │ API Key Auth  │  │  ┌───▼───┐  ┌───▼────┐   │
    │               │  │  │Redis  │  │Postgres│   │
    │               │  │  │:6379  │  │:5432   │   │
    │               │  │  └───────┘  └────────┘   │
    └──────────────┘  └───────────────────────────┘
```

### 1.2 통신 프로토콜 상세

```
  Browser ──── HTTPS/443 ─────> Next.js Server
                                    │
                                    ├── HTTPS/443 ──> Supabase Cloud (PostgREST + Auth + Storage)
                                    │                 [Authorization: Bearer <anon_key/jwt>]
                                    │
                                    ├── HTTP/2358 ──> Judge0 Server (localhost)
                                    │                 [X-Auth-Token: <api_key> (optional)]
                                    │
                                    └── HTTPS/443 ──> Google TTS API
                                                      [?key=<API_KEY> (query param)]

  Browser ──── HTTPS/443 ─────> Supabase Cloud (Direct Client Connection)
                                [Authorization: Bearer <anon_key>]
                                - Auth operations (signIn/signOut)
                                - RLS-protected reads (via createClient browser)
```

**확인:** Browser에서 Supabase Cloud로의 직접 연결은 `src/lib/supabase/client.ts`에서 `createBrowserClient()`를 통해 이루어지며, `NEXT_PUBLIC_SUPABASE_URL`과 `NEXT_PUBLIC_SUPABASE_ANON_KEY`를 사용한다. 이 키들은 `NEXT_PUBLIC_` 접두사로 클라이언트 번들에 포함된다.

---

## 2. API 경로 카탈로그

### 2.1 Server Actions (17 파일, 64개 함수)

Server Actions는 `'use server'` 지시자를 사용하며, Next.js가 내부적으로 POST 엔드포인트를 자동 생성한다. 클라이언트에서 직접 HTTP 호출이 아닌 함수 호출 형태로 사용된다.

| 파일 | 함수 수 | exported 함수 목록 | 인증 | 역할 제한 |
|------|---------|-------------------|------|-----------|
| `actions/auth.ts` | 2 | `signIn`, `signOut` | Supabase Auth | 전체 |
| `actions/coding.ts` | 2 | `submitCode`, `runCode` | JWT 필수 | 전체 |
| `actions/quiz.ts` | 2 | `startQuizAttempt`, `submitQuizAnswers` | JWT 필수 | 전체 |
| `actions/scores.ts` | 2 | `recalculateUserScores`, `recalculateAllScores` | JWT / ServiceRole | admin (batch) |
| `actions/profile.ts` | 2 | `uploadAvatar`, `removeAvatar` | JWT 필수 | 전체 |
| `actions/onboarding.ts` | 1 | `completeOnboarding` | JWT 필수 | 전체 |
| `actions/admin.ts` | 13 | `updateUserRole`, `createUserAccount`, `createTaskAssignment`, `deleteTaskAssignment`, `createFeedback`, `updateFeedback`, `deleteFeedback`, `approveRetakeRequest`, `denyRetakeRequest`, `updateCoursePublished`, `deleteCourse`, `createQuestion`, `updateQuestion`, `deleteQuestion`, `toggleQuestionPublished` | JWT + ServiceRole | admin |
| `actions/mentor.ts` | 3 | `assignMenteeToMentor`, `removeMenteeFromMentor`, `getMenteeProgress` | JWT 필수 | admin |
| `actions/feedback.ts` | 4 | `bulkDeleteFeedbacks`, `createFeedbackReply`, `updateFeedbackReply`, `deleteFeedbackReply` | JWT 필수 | admin/mentee |
| `actions/assessment.ts` | 5 | `savePreferences`, `getAssessmentForStep`, `submitAssessment`, `requestRetake`, `finalizeOnboarding` | JWT 필수 | 전체 |
| `actions/comprehensive-exam.ts` | 8 | `requestExam`, `approveExam`, `denyExam`, `startExam`, `submitExam`, `getExamStatus`, `requestRetakeExam` | JWT + ServiceRole | admin/mentor (approve/deny) |
| `actions/learning-assignments.ts` | 5 | `createLearningAssignment`, `getLearningAssignments`, `getMyLearningAssignments`, `checkAssignmentProgress`, `deleteLearningAssignment` | JWT + ServiceRole | admin/mentor (create) |
| `actions/notifications.ts` | 7 | `getUnreadNotificationCount`, `getNotifications`, `markAsRead`, `markAllAsRead`, `createNotification`, `getUnreadTaskCount`, `getTaskNotifications` | JWT 필수 | 전체 |
| `actions/mastery.ts` | 2 | `toggleMastery`, `getMasteredIds` | JWT 필수 | 전체 |
| `actions/range-quiz.ts` | 3 | `generateGlossaryQuiz`, `generateCsTermQuiz`, `generateVocabQuiz` | JWT 필수 | 전체 |
| `actions/claims.ts` | 1 | `submitQuestionClaim` | JWT 필수 | 전체 |
| `actions/access-request.ts` | 1 | `requestContentAccess` | JWT 필수 | 전체 |

### 2.2 API Routes (Route Handlers)

| 경로 | 메서드 | 인증 방식 | 역할 제한 | 설명 |
|------|--------|-----------|-----------|------|
| `POST /api/tts` | POST | Supabase JWT (cookie) | 인증된 사용자 전체 | Google Cloud TTS 음성 합성, Supabase Storage 캐시 |
| `GET /api/admin/tts-precache` | GET | Supabase JWT + profiles.role | admin | TTS 사전 캐시 대상 테이블별 총 건수 조회 |
| `POST /api/admin/tts-precache` | POST | Supabase JWT + profiles.role | admin | TTS 일괄 사전 캐시 실행 (batch 단위) |

### 2.3 Auth Callback

| 경로 | 메서드 | 인증 방식 | 설명 |
|------|--------|-----------|------|
| `GET /auth/callback` | GET | Authorization Code (PKCE) | Supabase Auth OAuth 콜백. `code` 파라미터로 세션 교환 후 redirect |

---

## 3. 인증 흐름 상세

### 3.1 JWT Cookie 기반 인증 (@supabase/ssr)

J-Bridge는 `@supabase/ssr ^0.8.0`을 사용하여 **HTTP-Only Cookie 기반 JWT 인증**을 구현한다. 세션 토큰이 Cookie에 저장되므로 XSS 공격에 대한 토큰 탈취 방어가 가능하다.

```
  Browser                 Next.js Middleware           Supabase Auth
    │                          │                            │
    │  1. POST /login          │                            │
    │  (Server Action: signIn) │                            │
    │─────────────────────────>│                            │
    │                          │  2. signInWithPassword()   │
    │                          │───────────────────────────>│
    │                          │  3. JWT + Refresh Token    │
    │                          │<───────────────────────────│
    │                          │                            │
    │  4. Set-Cookie:          │                            │
    │     sb-access-token      │                            │
    │     sb-refresh-token     │                            │
    │<─────────────────────────│                            │
    │                          │                            │
    │  5. Subsequent Request   │                            │
    │  (Cookie 자동 첨부)      │                            │
    │─────────────────────────>│                            │
    │                          │  6. getUser() (JWT 검증)   │
    │                          │───────────────────────────>│
    │                          │  7. User object or null    │
    │                          │<───────────────────────────│
    │                          │                            │
    │                          │  8. [JWT 만료 시]          │
    │                          │     Cookie 갱신            │
    │                          │     (setAll callback)      │
    │  9. Updated Set-Cookie   │                            │
    │<─────────────────────────│                            │
```

### 3.2 세션 갱신 메커니즘

**확인 (`src/middleware.ts:L7-26`, `src/lib/supabase/server.ts:L8-27`):**

Middleware와 Server Client 모두 동일한 Cookie 핸들링 패턴을 사용한다:

1. `getAll()`: 현재 요청의 모든 Cookie를 Supabase에 전달
2. `setAll()`: Supabase가 토큰 갱신 시 새로운 Cookie 값을 응답에 설정
3. Middleware에서는 `NextResponse.next({ request })`를 재생성하여 갱신된 Cookie를 전파

**핵심:** `@supabase/ssr`이 JWT 만료를 감지하면 자동으로 Refresh Token을 사용하여 새 Access Token을 발급하고, `setAll()` 콜백을 통해 Cookie를 갱신한다. 이 과정은 사용자에게 투명하게 이루어진다.

### 3.3 역할(Role) 추출 흐름

```
  Middleware / Server Action          Supabase
        │                                │
        ├── auth.getUser() ─────────────>│  JWT 검증
        │<── { user.id } ───────────────│
        │                                │
        ├── profiles.select('role')     │
        │   .eq('id', user.id) ────────>│  RLS-protected query
        │<── { role: 'admin'|'mentor'|  │
        │      'mentee' } ──────────────│
        │                                │
        ├── RBAC 검증                   │
        │   - Middleware: 경로별 접근 제어│
        │   - Server Action: 함수 내    │
        │     역할 검증                  │
```

**확인:** 역할 정보는 JWT claims가 아닌 **`profiles` 테이블**에서 매 요청마다 조회한다. 이는 역할 변경 시 즉시 반영되는 장점이 있지만, 모든 인증 요청마다 추가 DB 쿼리가 발생하는 비용이 있다.

### 3.4 Middleware 인증 체크 흐름

**확인 (`src/middleware.ts:L100-104`):**

```
Matcher: /((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)
```

| 단계 | 조건 | 동작 | 코드 위치 |
|------|------|------|-----------|
| 1 | `!user && !isAuthPage && !isApiRoute && !isAuthCallback` | `/login`으로 redirect | `middleware.ts:L39-42` |
| 2 | `user && isAuthPage` | `/dashboard`로 redirect | `middleware.ts:L46-49` |
| 3 | `user && !isOnboarded` | `/onboarding`으로 redirect | `middleware.ts:L54-65` |
| 4 | `user && /admin/users\|courses\|mentors` | admin 전용, 미충족 시 `/dashboard` | `middleware.ts:L72-76` |
| 5 | `user && /admin/tasks\|reports` | admin+mentor, mentee는 `/dashboard` | `middleware.ts:L79-85` |
| 6 | `user && /admin/*` (기타) | admin 전용 | `middleware.ts:L87-92` |
| 7 | 기타 | 통과 (supabaseResponse 반환) | `middleware.ts:L97` |

**주의:** `/api/*` 경로는 Middleware에서 RBAC 검증을 하지 않는다 (`isApiRoute` 조건으로 bypass). API Route 내부에서 자체 인증/인가를 처리한다.

---

## 4. 포트/프로토콜 테이블

### 4.1 서비스별 포트 매핑

| 서비스 | 포트 | 프로토콜 | 인증 방식 | 환경 | 비고 |
|--------|------|----------|-----------|------|------|
| **Next.js (dev)** | 3000 | HTTP | N/A (내부) | 개발 | `npm run dev` |
| **Next.js (prod)** | 3000 (기본) | HTTP/HTTPS | N/A (리버스 프록시 뒤) | 프로덕션 | `npm run start`, Vercel 배포 시 443 |
| **Supabase API** | 443 | HTTPS (TLS 1.2+) | Bearer JWT (anon_key / service_role_key) | 클라우드 | PostgREST + GoTrue |
| **Supabase Auth** | 443 | HTTPS | API Key + PKCE | 클라우드 | `/auth/v1/*` 경로 |
| **Supabase Storage** | 443 | HTTPS | Bearer JWT / Service Role | 클라우드 | `/storage/v1/*` 경로 |
| **Supabase DB** | 5432 | PostgreSQL (TCP) | Connection String | 클라우드 (내부) | 직접 연결 미사용, PostgREST 경유 |
| **Judge0 Server** | 2358 | HTTP | X-Auth-Token (optional) | 로컬 Docker | REST API |
| **Judge0 PostgreSQL** | 5432 | PostgreSQL | user/password | Docker 내부 | `judge0/judge0password` |
| **Judge0 Redis** | 6379 | Redis | 없음 | Docker 내부 | Worker 큐 관리 |
| **Google Cloud TTS** | 443 | HTTPS | API Key (query param) | 외부 SaaS | `texttospeech.googleapis.com` |

### 4.2 Judge0 Docker 내부 네트워크

**확인 (`judge0/docker-compose.yml`):**

```
┌──────────────────────────────────────────────────┐
│            Docker Compose Network (bridge)         │
│                                                    │
│  ┌────────────────┐      ┌────────────────────┐   │
│  │ server         │      │ workers            │   │
│  │ :2358 ────────>│ host │                    │   │
│  │ (privileged)   │      │ (privileged)       │   │
│  └───┬──────┬─────┘      └───┬──────┬─────────┘   │
│      │      │                │      │              │
│      │      └───────┐  ┌────┘      │              │
│      ▼              ▼  ▼           ▼              │
│  ┌────────┐     ┌──────────────────────┐          │
│  │ redis  │     │ db (postgres:16)     │          │
│  │ :6379  │     │ :5432                │          │
│  │        │     │ judge0/judge0password│          │
│  └────────┘     └──────────────────────┘          │
│                                                    │
│  Volume: judge0-postgres (persistent)              │
└──────────────────────────────────────────────────┘
```

---

## 5. Judge0 네트워크 리스크 분석

### 5.1 Privileged Docker Mode (심각도: HIGH)

**확인 (`judge0/docker-compose.yml:L8, L33`):**

```yaml
services:
  server:
    privileged: true    # ← 전체 호스트 커널 접근 권한
  workers:
    privileged: true    # ← 동일
```

**리스크:** `privileged: true` 설정은 Docker 컨테이너에 호스트 시스템의 모든 디바이스와 커널 기능에 대한 접근 권한을 부여한다. Judge0가 사용자 코드를 실행하는 환경이므로, 악의적인 코드가 컨테이너를 탈출하여 호스트 시스템을 장악할 가능성이 있다.

**이유:** Judge0는 `isolate` 샌드박스를 사용하며, `isolate`는 Linux cgroups와 namespaces를 통한 프로세스 격리를 위해 privileged 권한이 필요하다. `Dockerfile:L9-12`에서 `ioi/isolate v2.0`을 빌드하여 사용한다.

**완화 전략:**
- Docker의 `--cap-add` 옵션으로 필요한 capability만 개별 부여 (SYS_ADMIN, NET_ADMIN 등)
- 프로덕션에서는 별도 VM 또는 전용 호스트에서 Judge0 실행
- Judge0 내부 네트워크를 호스트 네트워크와 완전히 격리

### 5.2 인증 설정 부재 (심각도: HIGH)

**확인 (`judge0/judge0.conf`):** Judge0 서버에 대한 인증 토큰(`AUTHN_TOKEN`)이 설정되어 있지 않다.

**확인 (`src/lib/judge0/client.ts:L2`):**

```typescript
const JUDGE0_API_KEY = process.env.JUDGE0_API_KEY ?? ''
```

기본값이 빈 문자열이며, `.env.local.example`에서도 `JUDGE0_API_KEY=`로 비어 있다.

**리스크:** Judge0 API가 인증 없이 `localhost:2358`에서 노출되므로, 같은 호스트의 다른 프로세스나 네트워크에 접근 가능한 모든 클라이언트가 임의 코드를 실행할 수 있다.

**완화 전략:**
- `judge0.conf`에 `AUTHN_TOKEN` 설정
- `JUDGE0_API_KEY` 환경 변수에 동일한 토큰 설정
- 방화벽 규칙으로 2358 포트 외부 접근 차단

### 5.3 Polling 기반 실행 모델 (심각도: MEDIUM)

**확인 (`src/lib/judge0/client.ts:L89-97`):**

```typescript
export async function pollSubmissionResult(token: string, maxAttempts = 20): Promise<Judge0Result> {
  for (let i = 0; i < maxAttempts; i++) {
    const result = await getSubmissionResult(token)
    if (result.status.id > 2) return result
    await new Promise((resolve) => setTimeout(resolve, 1000))
  }
  throw new Error('Submission timed out')
}
```

| 파라미터 | 값 | 설명 |
|----------|-----|------|
| 최대 시도 횟수 | 20 | `maxAttempts` 기본값 |
| 폴링 간격 | 1,000ms | 고정 1초 |
| 최대 대기 시간 | ~20초 | 20회 x 1초 |
| 타임아웃 처리 | `throw Error` | 클라이언트에 에러 반환 |

**리스크:**
- **Server Action 장시간 점유:** `submitCode()`는 모든 테스트케이스에 대해 순차적으로 제출+폴링을 수행한다. 테스트케이스가 N개이면 최대 `N x 20초`의 서버 리소스를 점유한다.
- **동시 사용자 증가 시 병목:** Next.js 서버 Worker가 pollingLoop에 의해 블로킹되어 다른 요청 처리가 지연될 수 있다.
- **Exponential backoff 미적용:** 고정 1초 간격은 Judge0 서버에 불필요한 부하를 가한다.

### 5.4 네트워크 격리 우려

**확인:** Judge0 Docker Compose에는 별도의 네트워크 정의가 없으며, 기본 bridge 네트워크를 사용한다.

```yaml
# docker-compose.yml — 네트워크 설정 부재
services:
  server:
    ports:
      - "2358:2358"   # ← 호스트의 모든 인터페이스에 바인딩
```

**리스크:** `0.0.0.0:2358`에 바인딩되어 호스트의 모든 네트워크 인터페이스에서 접근 가능. 클라우드 환경에서 보안 그룹 설정이 누락되면 외부에서 직접 접근 가능.

**권장:** `127.0.0.1:2358:2358`으로 변경하여 localhost 접근만 허용.

### 5.5 Judge0 내부 자격 증명 (심각도: MEDIUM)

**확인 (`judge0/docker-compose.yml:L18-19`, `judge0/judge0.conf:L7-8`):**

```yaml
POSTGRES_PASSWORD: judge0password    # 하드코딩된 기본 비밀번호
```

**리스크:** 기본 비밀번호가 소스 코드에 하드코딩되어 있다. Judge0 내부용이므로 외부 노출 위험은 낮으나, Docker 네트워크 내에서의 수평 이동(lateral movement) 시 악용 가능.

---

## 6. 장애 모드 분석 (Failure Mode Analysis)

### 6.1 Supabase 장애 시

| 항목 | 상세 |
|------|------|
| **영향 범위** | **전체 시스템 다운 (Critical)** |
| **영향 서비스** | 인증, 데이터 조회, 데이터 저장, 파일 스토리지, TTS 캐시 |
| **증상** | 로그인 불가, 페이지 로드 실패, Server Action 전체 실패, 프로필/점수 조회 불가 |
| **감지 방법** | Supabase 응답 상태 코드 (503/504), `auth.getUser()` 실패, DB 쿼리 타임아웃 |
| **현재 완화** | 없음 (circuit breaker, 헬스체크, fallback 미구현) |
| **권장 대응** | (1) Supabase 상태 페이지 모니터링 (2) 정적 에러 페이지 표시 (3) 핵심 데이터 로컬 캐시 검토 |

**확인:** 모든 Server Action과 API Route가 `createClient()` → Supabase 호출로 시작하므로, Supabase 장애는 곧 전체 시스템 장애를 의미한다. 단일 장애점(Single Point of Failure).

### 6.2 Judge0 장애 시

| 항목 | 상세 |
|------|------|
| **영향 범위** | **코드 실행 기능 불가 (High)** |
| **영향 서비스** | `submitCode()`, `runCode()` |
| **비영향 서비스** | 로그인, 일본어 학습, 퀴즈, 대시보드, 랭킹 등 |
| **증상** | 코드 제출 시 "コード実行サーバー接続失敗" 에러 메시지 |
| **감지 방법** | `createSubmission()` HTTP 응답 실패, `pollSubmissionResult()` 타임아웃 |
| **현재 완화** | 에러 메시지에 Judge0 관련 문구 포함 시 구분된 에러 반환 (`coding.ts:L121-125`) |
| **권장 대응** | (1) Judge0 헬스체크 엔드포인트 모니터링 (`/health`) (2) Docker restart policy 활용 (이미 `unless-stopped` 설정) (3) UI에 Judge0 상태 표시 |

**확인 (`judge0/docker-compose.yml:L9,L35`):** `restart: unless-stopped` 설정으로 Docker 데몬 재시작 시 자동 복구된다.

### 6.3 Google Cloud TTS 장애 시

| 항목 | 상세 |
|------|------|
| **영향 범위** | **TTS 음성 재생 불가 (Medium)** |
| **영향 서비스** | `/api/tts`, `/api/admin/tts-precache` |
| **비영향 서비스** | 텍스트 콘텐츠 표시, 학습 진도, 퀴즈 등 |
| **증상** | TTS 버튼 클릭 시 500 에러, 음성 재생 없음 |
| **감지 방법** | TTS API 응답 `!response.ok` (`tts/route.ts:L128`) |
| **현재 완화** | Supabase Storage 기반 캐시 (`tts-cache` 버킷). 이전에 생성된 음성은 캐시에서 서비스 가능 |
| **권장 대응** | (1) Admin TTS pre-cache 기능으로 주요 콘텐츠 사전 캐시 (이미 구현) (2) TTS 실패 시 텍스트만 표시하는 graceful degradation |

**확인 (`src/app/api/tts/route.ts:L174-176`):** `getFromCache()`로 캐시 히트 시 Google API를 호출하지 않으므로, 사전 캐시된 콘텐츠는 TTS API 장애에 영향받지 않는다. 응답 헤더 `X-TTS-Cache: hit/miss`로 캐시 사용 여부를 추적할 수 있다.

### 6.4 네트워크 파티션 시나리오

| 시나리오 | 영향 | 복구 방법 |
|----------|------|-----------|
| Next.js <-> Supabase 단절 | 전체 시스템 다운 | Supabase 네트워크 복구 대기 |
| Next.js <-> Judge0 단절 | 코드 실행 불가 | Docker 컨테이너/네트워크 확인 |
| Next.js <-> Google TTS 단절 | 미캐시 TTS 불가 | DNS/방화벽 확인, 캐시된 콘텐츠는 정상 |
| Browser <-> Next.js 단절 | 전체 접근 불가 | CDN/로드밸런서/DNS 확인 |
| Browser <-> Supabase 직접 연결 단절 | Client Component에서 직접 Supabase 호출 실패 | Server-side 경유로 우회 가능 (추정) |

### 6.5 장애 영향도 매트릭스

```
영향도 (전체 다운)
    │
    │  ● Supabase 장애
    │
    │                    ● Judge0 장애
    │                      (코드 실행만)
    │
    │                              ● TTS 장애
    │                                (음성만, 캐시 완화)
    │
    └────────────────────────────────────── 발생 확률
         (Supabase Cloud:     (Docker local:    (Google Cloud:
          매우 낮음)            중간)              낮음)
```

---

## 7. 환경 변수 카탈로그

### 7.1 필수 환경 변수

| 변수명 | 용도 | 사용 파일 | 클라이언트 노출 | 필수 여부 |
|--------|------|-----------|----------------|-----------|
| `NEXT_PUBLIC_SUPABASE_URL` | Supabase 프로젝트 URL | `server.ts`, `client.ts`, `middleware.ts` | O (`NEXT_PUBLIC_`) | **필수** |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Supabase Anonymous Key (RLS 적용) | `server.ts`, `client.ts`, `middleware.ts` | O (`NEXT_PUBLIC_`) | **필수** |
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase Service Role Key (RLS 우회) | `server.ts:L35` | X | **조건부** (admin 기능, 점수 계산에 필요) |
| `JUDGE0_API_URL` | Judge0 API 엔드포인트 URL | `judge0/client.ts:L1` | X | **조건부** (기본값: `http://localhost:2358`) |
| `JUDGE0_API_KEY` | Judge0 인증 토큰 | `judge0/client.ts:L2` | X | **선택** (기본값: 빈 문자열) |
| `GOOGLE_CLOUD_TTS_API_KEY` | Google Cloud Text-to-Speech API Key | `tts/route.ts:L145`, `tts-precache/route.ts:L59` | X | **조건부** (TTS 기능에 필요) |

### 7.2 환경 변수 사용 패턴 분석

| 패턴 | 변수 | 처리 방식 | 리스크 |
|------|------|-----------|--------|
| Non-null assertion (`!`) | `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY` | 런타임 에러 (의미 없는 메시지) | 환경 변수 미설정 시 디버깅 어려움 |
| Nullish coalescing (`??`) | `JUDGE0_API_URL`, `JUDGE0_API_KEY` | fallback 값 사용 | 설정 누락을 인지하기 어려움 |
| Explicit null check | `SUPABASE_SERVICE_ROLE_KEY`, `GOOGLE_CLOUD_TTS_API_KEY` | `null` 반환 또는 500 에러 | 적절한 처리 |

**확인 (`.env.local.example`):** 6개 변수 중 4개만 예시 파일에 포함되어 있다. `SUPABASE_SERVICE_ROLE_KEY`와 `GOOGLE_CLOUD_TTS_API_KEY`는 예시 파일에 없다.

### 7.3 Judge0 Docker 내부 환경 변수

**확인 (`judge0/judge0.conf`):**

| 변수명 | 값 | 용도 |
|--------|-----|------|
| `REDIS_HOST` | `redis` | Docker 서비스명 |
| `REDIS_PORT` | `6379` | Redis 포트 |
| `POSTGRES_HOST` | `db` | Docker 서비스명 |
| `POSTGRES_PORT` | `5432` | PostgreSQL 포트 |
| `POSTGRES_DB` | `judge0` | DB명 |
| `POSTGRES_USER` | `judge0` | DB 유저 |
| `POSTGRES_PASSWORD` | `judge0password` | DB 비밀번호 (하드코딩) |
| `RAILS_MAX_THREADS` | `8` | Judge0 서버 스레드 |
| `RAILS_ENV` | `production` | Rails 환경 |
| `INTERVAL` | `0.1` | Worker 폴링 간격 (초) |
| `COUNT` | `8` | Worker 수 |
| `ENABLE_BATCHED_SUBMISSIONS` | `true` | 일괄 제출 지원 |
| `ENABLE_WAIT_RESULT` | `true` | 동기 결과 대기 지원 |
| `ENABLE_COMPILER_OPTIONS` | `true` | 컴파일러 옵션 지원 |

---

## 8. 배포 구성 분석

### 8.1 현재 배포 구성 (추정)

코드베이스에 Dockerfile, Vercel 설정, CI/CD 파이프라인 파일이 존재하지 않으므로, 배포 구성에 대해 확정적인 분석은 불가하다. 다만 기술 스택으로부터 다음을 추정한다:

| 컴포넌트 | 배포 방식 (추정) | 근거 |
|----------|-----------------|------|
| **Next.js 앱** | Vercel 또는 `npm run start` | `package.json`에 Vercel 외 배포 설정 없음 |
| **Supabase** | Supabase Cloud (호스팅) | `NEXT_PUBLIC_SUPABASE_URL`이 `*.supabase.co` 형식 (`.env.local.example`) |
| **Judge0** | 로컬/온프레미스 Docker | `docker-compose.yml` 기반, `localhost:2358` 기본값 |
| **Google TTS** | Google Cloud SaaS | API Key 기반 호출 |

### 8.2 배포 토폴로지 (추정)

```
┌───────────────────────────────────────────────────────────┐
│                    Production (추정)                        │
│                                                           │
│  ┌─────────────┐     ┌──────────────────────────┐        │
│  │   Vercel     │     │   On-Premise / VPS       │        │
│  │   (Edge)     │     │                          │        │
│  │             │     │  ┌────────────────────┐  │        │
│  │  Next.js    │─────│─>│ Judge0 (Docker)    │  │        │
│  │  App        │     │  │ :2358              │  │        │
│  │             │     │  └────────────────────┘  │        │
│  └──────┬──────┘     └──────────────────────────┘        │
│         │                                                 │
│         │ HTTPS                                           │
│         ▼                                                 │
│  ┌──────────────┐    ┌──────────────┐                    │
│  │ Supabase     │    │ Google Cloud │                    │
│  │ Cloud        │    │ TTS API      │                    │
│  └──────────────┘    └──────────────┘                    │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

**주의:** Vercel Edge Function에서 Judge0 `localhost:2358`에 직접 접근할 수 없다. 프로덕션에서는 Judge0를 외부 접근 가능한 엔드포인트로 설정하거나, RapidAPI 호스팅을 사용해야 한다. 코드는 이미 RapidAPI 지원을 포함하고 있다 (`IS_RAPIDAPI` 플래그, `client.ts:L3`).

---

## 9. 네트워크 보안 경계

### 9.1 Trust Boundary 다이어그램

```
 ┌─── Untrusted Zone ────────────────────────────────────────────────┐
 │                                                                    │
 │   Browser (사용자 코드 입력 포함)                                   │
 │                                                                    │
 └────────────────────────────┬───────────────────────────────────────┘
                              │ HTTPS (TLS 1.2+)
                              │ Cookies (HTTP-Only)
 ┌────── Trust Boundary ──────┼───────────────────────────────────────┐
 │                            ▼                                       │
 │   ┌──────────────────────────────────────────┐                    │
 │   │         Next.js Server                    │                    │
 │   │                                          │                    │
 │   │   Middleware:  JWT 검증 + RBAC            │                    │
 │   │   Server Actions: 인증 + 인가 + 입력 검증  │                    │
 │   │   API Routes: 인증 + 역할 검증             │                    │
 │   └──────────┬──────────┬──────────┬─────────┘                    │
 │              │          │          │                               │
 │   ┌─── Semi-Trusted ──┐│┌── Trusted (SaaS) ──┐                   │
 │   │                    │││                     │                   │
 │   │  Judge0 Docker     │││  Supabase Cloud     │                   │
 │   │  (사용자 코드 실행) │││  (RLS + Auth)       │                   │
 │   │  isolate sandbox   │││                     │                   │
 │   │                    │││  Google TTS API     │                   │
 │   └────────────────────┘│└─────────────────────┘                   │
 │                          │                                         │
 └──────────────────────────┼─────────────────────────────────────────┘
```

### 9.2 데이터 흐름별 보안 분석

| 경로 | 전송 데이터 | 암호화 | 인증 | 리스크 |
|------|------------|--------|------|--------|
| Browser -> Next.js | 사용자 입력, 소스 코드 | TLS | Cookie JWT | 정상 |
| Next.js -> Supabase | DB 쿼리, JWT | TLS | Bearer Token | 정상 |
| Next.js -> Judge0 | **사용자 소스 코드** | **평문 HTTP** | **없음 (기본)** | **HIGH** |
| Next.js -> Google TTS | 일본어 텍스트 | TLS | API Key | 정상 |
| Browser -> Supabase | Auth 요청 | TLS | Anon Key | 정상 |

**확인:** Next.js와 Judge0 간 통신은 `http://localhost:2358`으로 평문 HTTP를 사용한다. 같은 호스트 내 통신이므로 네트워크 스니핑 리스크는 낮으나, 프로덕션에서 Judge0를 별도 서버에 배치할 경우 TLS 적용이 필요하다.

---

## 10. Supabase Storage 버킷 구성

**확인 (코드 분석 기반):**

| 버킷명 | 용도 | 접근 권한 | 파일 제한 | 사용 파일 |
|--------|------|-----------|-----------|-----------|
| `avatars` | 프로필 사진 | public | 5MB, 이미지만 | `profile.ts:L19-22` |
| `tts-cache` | TTS 음성 캐시 (MP3) | private (추정) | 제한 없음 | `tts/route.ts:L8`, `tts-precache/route.ts:L5` |

**확인 (`profile.ts:L17-22`):** `avatars` 버킷은 `ensureAvatarsBucket()` 함수에서 존재하지 않을 경우 자동 생성된다. Service Role Client가 있으면 그것을 사용하고, 없으면 일반 클라이언트로 시도한다.

---

## 11. 타 문서 참조

| 문서 | 관련 내용 | 본 문서와의 관계 |
|------|-----------|-----------------|
| [01_system_overview.md](./01_system_overview.md) | 아키텍처 스타일, 기술 스택, 의존성 분석 | 본 문서의 네트워크 토폴로지가 시스템 개요의 아키텍처를 인프라 관점에서 상세화 |
| [02_folder_responsibility.md](./02_folder_responsibility.md) | 디렉토리 구조, 파일별 책임 | Server Actions/API Routes 경로와 폴더 매핑 참조 |
| [03_runtime_flow.md](./03_runtime_flow.md) | 요청 처리 흐름, Middleware 파이프라인 | 본 문서 3장 인증 흐름과 상호 보완 |
| [04_data_architecture.md](./04_data_architecture.md) | DB 스키마, RLS 정책, 마이그레이션 | Supabase 계층의 데이터 보안과 연계 |
| [06_security_design.md](./06_security_design.md) | 인증/인가, RLS, 보안 설계 | 본 문서 9장 네트워크 보안 경계의 심층 분석 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | 시험/등급 도메인 모델 | Judge0 통합이 시험 도메인에 미치는 영향 |
| [08_scalability_analysis.md](./08_scalability_analysis.md) | 확장성 분석, 병목 지점 | 본 문서 5.3 Polling 모델과 6장 장애 분석의 확장성 관점 |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | 리팩토링 후보 | 본 문서에서 식별된 Judge0 인증/격리 개선, Polling 최적화 등 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 아키텍트 학습 로드맵 | 인프라/네트워크 보안 관련 학습 경로 |

---

## 부록 A: Server Action 함수 Quick Reference (전체 목록)

| # | 파일 | 함수명 | 주요 외부 호출 |
|---|------|--------|---------------|
| 1 | `auth.ts` | `signIn` | Supabase Auth |
| 2 | `auth.ts` | `signOut` | Supabase Auth |
| 3 | `coding.ts` | `submitCode` | Judge0 + Supabase + Code Review |
| 4 | `coding.ts` | `runCode` | Judge0 |
| 5 | `quiz.ts` | `startQuizAttempt` | Supabase |
| 6 | `quiz.ts` | `submitQuizAnswers` | Supabase |
| 7 | `scores.ts` | `recalculateUserScores` | Supabase (ServiceRole) |
| 8 | `scores.ts` | `recalculateAllScores` | Supabase |
| 9 | `profile.ts` | `uploadAvatar` | Supabase Storage |
| 10 | `profile.ts` | `removeAvatar` | Supabase Storage |
| 11 | `onboarding.ts` | `completeOnboarding` | Supabase |
| 12 | `admin.ts` | `updateUserRole` | Supabase (ServiceRole) |
| 13 | `admin.ts` | `createUserAccount` | Supabase Auth Admin API |
| 14 | `admin.ts` | `createTaskAssignment` | Supabase |
| 15 | `admin.ts` | `deleteTaskAssignment` | Supabase |
| 16 | `admin.ts` | `createFeedback` | Supabase (ServiceRole) + Notification |
| 17 | `admin.ts` | `updateFeedback` | Supabase |
| 18 | `admin.ts` | `deleteFeedback` | Supabase |
| 19 | `admin.ts` | `approveRetakeRequest` | Supabase (ServiceRole) |
| 20 | `admin.ts` | `denyRetakeRequest` | Supabase (ServiceRole) |
| 21 | `admin.ts` | `updateCoursePublished` | Supabase |
| 22 | `admin.ts` | `deleteCourse` | Supabase |
| 23 | `admin.ts` | `createQuestion` | Supabase (ServiceRole) |
| 24 | `admin.ts` | `updateQuestion` | Supabase (ServiceRole) |
| 25 | `admin.ts` | `deleteQuestion` | Supabase (ServiceRole) |
| 26 | `admin.ts` | `toggleQuestionPublished` | Supabase (ServiceRole) |
| 27 | `mentor.ts` | `assignMenteeToMentor` | Supabase |
| 28 | `mentor.ts` | `removeMenteeFromMentor` | Supabase |
| 29 | `mentor.ts` | `getMenteeProgress` | Supabase |
| 30 | `feedback.ts` | `bulkDeleteFeedbacks` | Supabase (ServiceRole) |
| 31 | `feedback.ts` | `createFeedbackReply` | Supabase + Notification |
| 32 | `feedback.ts` | `updateFeedbackReply` | Supabase |
| 33 | `feedback.ts` | `deleteFeedbackReply` | Supabase |
| 34 | `assessment.ts` | `savePreferences` | Supabase |
| 35 | `assessment.ts` | `getAssessmentForStep` | Supabase |
| 36 | `assessment.ts` | `submitAssessment` | Supabase (ServiceRole) + Scores |
| 37 | `assessment.ts` | `requestRetake` | Supabase + Notification |
| 38 | `assessment.ts` | `finalizeOnboarding` | Supabase |
| 39 | `comprehensive-exam.ts` | `requestExam` | Supabase (ServiceRole) + Notification |
| 40 | `comprehensive-exam.ts` | `approveExam` | Supabase (ServiceRole) + Notification |
| 41 | `comprehensive-exam.ts` | `denyExam` | Supabase (ServiceRole) + Notification |
| 42 | `comprehensive-exam.ts` | `startExam` | Supabase (ServiceRole) |
| 43 | `comprehensive-exam.ts` | `submitExam` | Supabase (ServiceRole) + Notification |
| 44 | `comprehensive-exam.ts` | `getExamStatus` | Supabase |
| 45 | `comprehensive-exam.ts` | `requestRetakeExam` | Supabase (ServiceRole) + Notification |
| 46 | `learning-assignments.ts` | `createLearningAssignment` | Supabase (ServiceRole) + Notification |
| 47 | `learning-assignments.ts` | `getLearningAssignments` | Supabase |
| 48 | `learning-assignments.ts` | `getMyLearningAssignments` | Supabase |
| 49 | `learning-assignments.ts` | `checkAssignmentProgress` | Supabase (ServiceRole) |
| 50 | `learning-assignments.ts` | `deleteLearningAssignment` | Supabase |
| 51 | `notifications.ts` | `getUnreadNotificationCount` | Supabase |
| 52 | `notifications.ts` | `getNotifications` | Supabase |
| 53 | `notifications.ts` | `markAsRead` | Supabase |
| 54 | `notifications.ts` | `markAllAsRead` | Supabase |
| 55 | `notifications.ts` | `createNotification` | Supabase (ServiceRole fallback) |
| 56 | `notifications.ts` | `getUnreadTaskCount` | (wrapper) |
| 57 | `notifications.ts` | `getTaskNotifications` | (wrapper) |
| 58 | `mastery.ts` | `toggleMastery` | Supabase |
| 59 | `mastery.ts` | `getMasteredIds` | Supabase |
| 60 | `range-quiz.ts` | `generateGlossaryQuiz` | Supabase |
| 61 | `range-quiz.ts` | `generateCsTermQuiz` | Supabase |
| 62 | `range-quiz.ts` | `generateVocabQuiz` | Supabase |
| 63 | `claims.ts` | `submitQuestionClaim` | Supabase |
| 64 | `access-request.ts` | `requestContentAccess` | Supabase |
