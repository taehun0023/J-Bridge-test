# 08. 확장성 분석 (Scalability Analysis)

> **문서 버전:** 1.0
> **최종 갱신:** 2026-02-13
> **대상 독자:** Senior Architect / Tech Lead / SRE
> **프로젝트:** J-Bridge (Japan IT Engineer Dispatch Platform)

---

## 1. 품질 속성 매트릭스 (Quality Attribute Matrix)

현재 코드베이스 분석 기반으로 각 품질 속성을 1~5 스케일로 평가한다.

| 품질 속성 | 현재 수준 | 목표 수준 | 갭 | 근거 |
|-----------|:---------:|:---------:|:---:|------|
| **성능 (Performance)** | 2 | 4 | -2 | Judge0 순차 폴링(`judge0/client.ts:L89-97`), `recalculateUserScores()` 8회 순차 쿼리(`scores.ts:L18-262`), TTS 대화문 순차 합성(`tts/route.ts:L200-213`), Middleware 매 요청 2회 네트워크 호출(`middleware.ts:L28,55`) |
| **보안 (Security)** | 3 | 4 | -1 | 서버사이드 정답 검증, RLS 적용, Cookie JWT 인증은 적절. Judge0 인증 미설정(`judge0/client.ts:L2`), `privileged: true` Docker 모드, API Key를 query param으로 전송(`tts/route.ts:L116`) |
| **확장성 (Scalability)** | 2 | 4 | -2 | 모놀리스 아키텍처, 페이지네이션 부분 적용, 배치 재계산 순차 처리(`scores.ts:L286-289`), Supabase 단일 의존 |
| **신뢰성 (Reliability)** | 2 | 4 | -2 | fire-and-forget 에러 흡수(`.catch(() => {})`), 트랜잭션 미사용 순차 UPSERT(`scores.ts:L205-255`), circuit breaker 미구현, Supabase 단일 장애점(SPOF) |
| **유지보수성 (Maintainability)** | 3 | 4 | -1 | CQRS-Lite 패턴 적용, Server Actions/Queries 분리 적절. `scores.ts:recalculateUserScores()` 262줄 단일 함수, `admin.ts` 15개 함수 집중, 수동 타입 관리(`types.ts`) |
| **운영성 (Operability)** | 1 | 3 | -2 | 모니터링/로깅 인프라 부재, 헬스체크 미구현, 에러 추적 도구 미연동, 알림 체계 미구축 |
| **테스트 용이성 (Testability)** | 1 | 4 | -3 | 테스트 프레임워크 미설치(`package.json`에 Jest/Vitest 등 부재), 단위/통합/E2E 테스트 0건, CI/CD 파이프라인 미구성 |
| **배포 용이성 (Deployability)** | 2 | 4 | -2 | Dockerfile/CI 미구성, `ignoreBuildErrors: true`(`next.config.ts:L5`), 환경 변수 검증 레이어 부재 |

### 1.1 매트릭스 시각화

```
             성능    보안    확장성   신뢰성   유지보수  운영성   테스트   배포
          5 │
  목표    4 │  ****   ****   ****    ****    ****             ****    ****
          3 │         ████                   ████
  현재    2 │  ████          ████    ████                            ████
          1 │                                         ████   ████
          0 └──────────────────────────────────────────────────────────
               ██ 현재 수준    ** 목표 수준    갭이 클수록 개선 우선순위 높음
```

**최대 갭 항목:** 테스트 용이성(-3), 성능/확장성/신뢰성/운영성/배포 용이성(-2)

---

## 2. 성능 병목 분석 (Performance Bottleneck Analysis)

### 2.1 recalculateUserScores — N+1 순차 쿼리 문제

**파일:** `src/app/actions/scores.ts:L18-262`

`recalculateUserScores(userId)` 함수는 1명의 사용자에 대해 **8개의 순차 DB 쿼리**를 실행한다.

#### 쿼리별 상세 분석

| # | 쿼리 대상 | 유형 | 코드 위치 | 추정 소요 시간 | 비고 |
|---|-----------|------|-----------|:-----------:|------|
| Q1 | `profiles` | SELECT (single) | `scores.ts:L22-26` | ~5ms | PK 조회, 인덱스 적중 |
| Q2 | `quiz_attempts` JOIN `quizzes` | SELECT (multi) | `scores.ts:L31-36` | ~15-50ms | user_id 필터 + JOIN, 행 수 비례 |
| Q3 | `code_submissions` JOIN `coding_problems` | SELECT (multi) | `scores.ts:L121-124` | ~15-50ms | user_id 필터 + JOIN, 행 수 비례 |
| Q4 | `coding_exam_attempts` JOIN `coding_skill_exams` | SELECT (multi) | `scores.ts:L165-169` | ~5-15ms | user_id + passed=true 필터 |
| Q5 | `japanese_skills` | UPSERT | `scores.ts:L205-217` | ~10ms | onConflict: 'user_id' |
| Q6 | `coding_skills` | UPSERT | `scores.ts:L219-232` | ~10ms | onConflict: 'user_id' |
| Q7 | `attitude_culture_skills` | UPSERT | `scores.ts:L234-244` | ~10ms | onConflict: 'user_id' |
| Q8 | `dispatch_readiness_scores` | INSERT | `scores.ts:L247-255` | ~10ms | 스냅샷 레코드 삽입 |

#### 추정 총 Round-Trip 시간

```
단일 사용자:
  네트워크 RTT (Supabase Cloud): ~20-30ms/쿼리 (추정)
  DB 처리 시간: ~5-50ms/쿼리
  총 추정: 8쿼리 x 25-80ms = 200-640ms

스케일별 영향 (recalculateAllScores 배치 실행):
  10명:   80쿼리  →  2-6초    (허용 범위)
  50명:  400쿼리  → 10-32초   (체감 지연)
  100명:  800쿼리  → 20-64초   (타임아웃 위험, Vercel 함수 기본 10초)
  500명: 4000쿼리  → 100-320초 (실행 불가)
```

**확인:** `recalculateAllScores()` (`scores.ts:L267-292`)는 전체 사용자에 대해 **순차적으로** `recalculateUserScores()`를 호출하며, 병렬 처리가 없다.

```typescript
// scores.ts:L286-289 — 순차 실행
for (const u of users ?? []) {
  await recalculateUserScores(u.id)
  processed++
}
```

#### 원자성 문제

Q5~Q8의 4개 쓰기 쿼리가 **트랜잭션 없이** 순차 실행된다. Q6에서 실패하면 Q5(japanese_skills)는 업데이트되고 Q6(coding_skills), Q7, Q8은 미업데이트 상태가 되어 **부분 업데이트(partial update)**가 발생한다.

#### 개선 방안

| 방안 | 난이도 | 효과 | 설명 |
|------|:------:|:----:|------|
| **PostgreSQL Function (RPC)** | 중 | 높음 | Q1-Q8을 단일 DB function으로 통합. 1회 네트워크 호출 + 트랜잭션 보장. `supabase.rpc('recalculate_scores', { p_user_id })` |
| **Promise.allSettled() 배치** | 하 | 중 | `recalculateAllScores()`에서 10명씩 병렬 처리. `Promise.allSettled(batch.map(u => recalculateUserScores(u.id)))` |
| **Materialized View** | 중 | 높음 | 점수 데이터를 Materialized View로 관리하고, `REFRESH MATERIALIZED VIEW CONCURRENTLY` 실행. 읽기 성능 대폭 개선 |
| **읽기 쿼리 병렬화** | 하 | 중 | Q1-Q4를 `Promise.all()`로 병렬 실행. 쓰기(Q5-Q8)는 순차 유지 |

---

### 2.2 Judge0 폴링 20초 문제

**파일:** `src/lib/judge0/client.ts:L89-97`, `src/app/actions/coding.ts:L45-69`

#### 현재 구현

```typescript
// judge0/client.ts:L89-97
export async function pollSubmissionResult(token: string, maxAttempts = 20) {
  for (let i = 0; i < maxAttempts; i++) {
    const result = await getSubmissionResult(token)
    if (result.status.id > 2) return result
    await new Promise((resolve) => setTimeout(resolve, 1000))  // 고정 1초 대기
  }
  throw new Error('Submission timed out')
}
```

#### 문제점 상세

| 항목 | 값 | 영향 |
|------|-----|------|
| 폴링 간격 | 고정 1,000ms | Judge0 서버에 불필요한 부하 (Exponential backoff 미적용) |
| 최대 대기 | 20초/테스트 케이스 | 10 TC 기준 최대 **200초** 대기 |
| 실행 방식 | 순차 (`for` 루프) | TC간 병렬 처리 없음 (`coding.ts:L45-69`) |
| 서버 리소스 | Server Action 스레드 점유 | Worker thread가 polling loop에서 블로킹 |
| 타임아웃 | Vercel 기본 10-60초 | 순차 폴링이 서버 타임아웃 초과 가능 |

#### Worst-Case 시나리오

```
사용자 A: 5 TC x 20초 폴링 = 100초 (Server Action 점유)
사용자 B: 동시 코드 제출 → 사용자 A의 Action 완료 대기 불필요하나,
          서버 Worker pool 고갈 시 대기 발생

동시 5명 코드 제출 (5 TC/문제):
  최악: 5명 x 100초 = 500초 분량의 Worker 블로킹
  Vercel Serverless: 동시 실행 가능하나 비용 증가
  자체 호스팅: Worker pool 고갈 → 전체 응답 지연
```

#### 대안 비교

| 방식 | 구현 난이도 | 지연 시간 | 서버 부하 | 비고 |
|------|:----------:|:---------:|:---------:|------|
| **현재 (Polling)** | - | 최대 N x 20초 | 높음 | Server Action 스레드 점유 |
| **Judge0 `?wait=true`** | 하 | ~5-10초 | 낮음 | Judge0가 결과 완료까지 대기 후 응답. `ENABLE_WAIT_RESULT=true` 이미 설정됨 (`judge0.conf`) |
| **Batch API** | 중 | ~최대 20초 | 낮음 | `POST /submissions/batch`로 TC 일괄 제출. `ENABLE_BATCHED_SUBMISSIONS=true` 이미 설정됨 |
| **Webhook + SSE** | 고 | 실시간 | 최소 | Judge0 webhook → Next.js API → SSE로 클라이언트 통지. 아키텍처 변경 필요 |
| **`Promise.all()` 병렬** | 하 | 최대 20초 | 중 | TC를 병렬 제출+폴링. 지연 시간 = 1TC 최대 대기 시간 |

**확인:** Judge0 설정(`judge0.conf`)에 `ENABLE_WAIT_RESULT=true`와 `ENABLE_BATCHED_SUBMISSIONS=true`가 이미 활성화되어 있으나, 클라이언트 코드에서 활용하지 않고 있다.

---

### 2.3 페이지네이션 부재 분석

코드베이스 전체를 분석하여 `.limit()` 또는 `.range()` 미적용 쿼리를 식별하였다.

#### 페이지네이션 적용 현황

| 구분 | 파일 수 | 쿼리 수 | 비고 |
|------|:-------:|:-------:|------|
| `.range()` 적용 | 13 | 22 | 학습 콘텐츠 목록 페이지 (vocabulary, grammar, coding problems 등) |
| `.limit()` 적용 | 8 | 21 | dashboard, profile, admin 등의 최근 항목 조회 |
| **미적용** | 5+ | 10+ | 전체 데이터 조회 쿼리 |

#### 페이지네이션 미적용 주요 쿼리

| 파일 | 쿼리 대상 | 위험도 | 행 수 예측 (추정) | 영향 |
|------|-----------|:------:|:-----------------:|------|
| `scores.ts:L31-36` | `quiz_attempts` (user별 전체) | 중 | 50-500행/사용자 | 점수 재계산 시 대량 데이터 로드 |
| `scores.ts:L121-124` | `code_submissions` (user별 전체) | 중 | 20-200행/사용자 | 동일 |
| `comprehensive-exam.ts:L239-242` | `quiz_questions` (quizIds IN) | 중 | 50-500행 | 시험 문제 전체 로드 후 셔플 |
| `admin.ts` (users 관리) | `profiles` (전체) | 고 | 사용자 수 비례 | Admin 사용자 관리 페이지 |
| `ranking` (관련 쿼리) | 전체 사용자 랭킹 | 고 | 사용자 수 비례 | 전체 데이터 메모리 로드 후 정렬 |

#### 이행 난이도 평가

| 쿼리 그룹 | 이행 난이도 | 이유 |
|-----------|:----------:|------|
| Admin 사용자 목록 | 하 | 단순 목록 → cursor/offset 추가 |
| 랭킹 목록 | 중 | 클라이언트 정렬 → DB ORDER BY + LIMIT로 전환 필요 |
| Score 재계산 내부 쿼리 | 고 | 비즈니스 로직이 전체 데이터에 의존 (평균/최고점 산출) |
| 시험 문제 로드 | 중 | DB 레벨 랜덤 샘플링으로 전환 필요 (`ORDER BY random() LIMIT N`) |

---

### 2.4 TTS 캐싱 효율 분석

**파일:** `src/app/api/tts/route.ts`

#### 현재 캐시 전략

```
┌──────────────────────────────────────────────────────────┐
│                TTS Cache Architecture                     │
│                                                          │
│  Request: { text, speed }                                │
│       │                                                  │
│       ▼                                                  │
│  SHA-256(text + '__' + speed)  →  cacheKey (hex)        │
│       │                                                  │
│       ▼                                                  │
│  Supabase Storage (tts-cache bucket)                     │
│  ┌────────────────────────────────────────┐              │
│  │  {cacheKey}.mp3                        │              │
│  │  Content-Addressable Storage           │              │
│  │  만료 정책: 없음 (영구 보존)            │              │
│  │  무효화 정책: 없음                      │              │
│  └────────────────────────────────────────┘              │
│       │                                                  │
│  HIT  → Buffer 반환 (X-TTS-Cache: hit)                  │
│  MISS → Google TTS API 호출 → 캐시 저장 (fire-and-forget)│
└──────────────────────────────────────────────────────────┘
```

#### 캐시 히트율 추정

| 시나리오 | 추정 히트율 | 근거 |
|----------|:----------:|------|
| 사전 캐시 실행 후 (`/api/admin/tts-precache`) | ~90-95% | JLPT vocabulary, IT glossary 등 정적 콘텐츠 사전 캐시 |
| 사전 캐시 미실행 | ~40-60% | 동일 레슨 반복 학습 사용자에 의한 자연 캐시 축적 |
| speed 파라미터 변경 시 | ~0% (해당 조합) | `SHA-256(text + '__' + speed)` — 속도 다르면 별도 캐시 |

#### Storage 용량 증가 추정

| 항목 | 추정 값 | 근거 |
|------|---------|------|
| MP3 평균 크기 (단문) | ~50-100KB | 일본어 1-2문장 기준 |
| MP3 평균 크기 (대화문) | ~200-500KB | 4-8세그먼트 대화 기준 |
| JLPT vocabulary 전체 | ~5,000건 x 75KB = **~375MB** | N5-N1 전체 단어 음성 |
| IT glossary 전체 | ~2,000건 x 75KB = **~150MB** | IT 용어 음성 |
| speed 변종 (0.7, 1.0, 1.3) | x3 배수 | 속도별 별도 캐시 |
| **총 예상** (사전 캐시 포함) | **~1.5-2GB** | 전체 콘텐츠 3속도 캐시 시 |

#### 캐시 관련 리스크

| 리스크 | 발생 조건 | 영향 | 현재 대응 |
|--------|-----------|------|-----------|
| Storage 용량 초과 | Supabase Free tier 1GB 제한 | 캐시 저장 실패 (음성은 정상 반환) | `saveToCache().catch(() => {})` fire-and-forget |
| 콘텐츠 변경 후 캐시 불일치 | DB 텍스트 수정 시 | 이전 음성 재생 | 무효화 정책 없음 — 수동 삭제 필요 |
| 캐시 저장 경합 | 동시 동일 요청 | 중복 저장 시도 | `upsert: true` (`tts/route.ts:L52`) |

---

## 3. 확장성 한계점 분석

### 3.1 사용자 스케일 한계

```
┌─────────────────────────────────────────────────────────────────┐
│              사용자 규모별 시스템 한계점 (추정)                      │
│                                                                 │
│  ~30명   ████████████████████ 현재 설계 적정 범위                 │
│  ~50명   ████████████████████████████ 성능 모니터링 필요            │
│  ~100명  ████████████████████████████████████ 병목 발생 시작        │
│  ~500명  ████████████████████████████████████████████ 아키텍처 한계  │
│                                                                 │
│  ── 단계별 병목 ──                                               │
│  30명: 정상 운영                                                 │
│  50명: recalculateAllScores 배치 30초+ (Vercel 타임아웃 근접)     │
│  100명: Middleware 프로필 쿼리 부하 체감, 랭킹 전체 조회 지연      │
│  500명: DB connection pool 고갈 위험, 배치 재계산 실행 불가        │
└─────────────────────────────────────────────────────────────────┘
```

**확인:** J-Bridge는 사내 LMS (invite-only)로, 초기 사용자 규모는 30-50명 수준으로 추정된다. 현재 아키텍처는 이 범위에서 기능적으로 동작하나, 50명 이상 시 배치 작업에서 병목이 발생할 수 있다.

### 3.2 데이터 증가 예측

| 테이블 | 증가 요인 | 월간 증가율 (추정, 30명 기준) | 1년 누적 (추정) | 비고 |
|--------|-----------|:----------------------------:|:---------------:|------|
| `quiz_attempts` | 퀴즈 응시 | ~300행/월 (10회/인/월) | ~3,600행 | 무제한 재시도 가능 |
| `quiz_answers` | 퀴즈 답안 | ~6,000행/월 (20문제/시도) | ~72,000행 | 시도당 문제 수 비례 |
| `code_submissions` | 코드 제출 | ~150행/월 (5회/인/월) | ~1,800행 | 소스 코드 TEXT 저장 |
| `code_reviews` | 자동 리뷰 | ~750행/월 (5리뷰/제출) | ~9,000행 | 제출당 최대 10개 리뷰 |
| `dispatch_readiness_scores` | 점수 스냅샷 | ~600행/월 (퀴즈/코드 완료 시) | ~7,200행 | INSERT only (삭제 없음) |
| `comprehensive_exam_answers` | 시험 답안 | ~100행/월 | ~1,200행 | 시험 빈도 낮음 |
| `notifications` | 알림 | ~300행/월 | ~3,600행 | 삭제 정책 미확인 |

**확인:** `dispatch_readiness_scores` 테이블은 `recalculateUserScores()` 호출 시마다 INSERT되므로 (`scores.ts:L247-255`), 삭제 정책 없이 지속 증가한다. 매 퀴즈 완료/코드 제출마다 fire-and-forget으로 호출되므로 예상보다 빠르게 증가할 수 있다.

### 3.3 동시 사용자 한계

| 시나리오 | 동시 사용자 (추정) | 병목 요인 | 한계 |
|----------|:-----------------:|-----------|------|
| 일반 학습 (페이지 조회) | ~50 | Middleware `auth.getUser()` + `profiles.select()` | Supabase Free tier connection limit (~50-60) |
| 퀴즈 동시 응시 | ~20 | 채점 + `recalculateUserScores()` fire-and-forget | DB 쿼리 집중 |
| 코드 동시 제출 | ~5 | Judge0 Worker 8개 (`judge0.conf:COUNT=8`) + Server Action 폴링 블로킹 | Judge0 처리량 제한 |
| 배치 재계산 실행 중 | 1 (admin) | 전체 사용자 순차 처리 | 다른 사용자 쿼리와 DB 경합 |
| TTS 동시 요청 (캐시 미스) | ~3-5 | Google TTS API rate limit + 순차 합성 | API 할당량 |

### 3.4 Storage 증가 예측

| 저장소 | 현재 크기 (추정) | 월간 증가 (추정) | 1년 후 (추정) |
|--------|:----------------:|:----------------:|:------------:|
| Supabase DB | ~50MB | ~5MB/월 | ~110MB |
| `tts-cache` 버킷 | ~0-500MB | 초기 캐시 구축 후 ~50MB/월 | ~1-2GB |
| `avatars` 버킷 | ~15MB (30명 x 5MB max) | ~5MB/월 | ~75MB |
| `code_submissions.source_code` (TEXT) | ~10MB | ~3MB/월 | ~46MB |

---

## 4. 모니터링 전략 제안

### 4.1 모니터링 아키텍처

```
┌──────────────────────────────────────────────────────────────────────────┐
│                        Monitoring Architecture                            │
│                                                                          │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────────┐   │
│  │  Application     │  │  Database         │  │  Infrastructure      │   │
│  │  Metrics         │  │  Metrics          │  │  Metrics             │   │
│  ├──────────────────┤  ├──────────────────┤  ├──────────────────────┤   │
│  │ Response Time    │  │ Query Time       │  │ CPU / Memory         │   │
│  │ Error Rate       │  │ Connection Pool  │  │ Disk Usage           │   │
│  │ Cache Hit Ratio  │  │ Row Count        │  │ Network I/O          │   │
│  │ Active Users     │  │ Dead Tuples      │  │ Container Status     │   │
│  │ Judge0 Latency   │  │ Index Usage      │  │ Process Count        │   │
│  │ TTS Cache Miss   │  │ RLS Policy Time  │  │ Docker Health        │   │
│  └────────┬─────────┘  └────────┬─────────┘  └──────────┬───────────┘   │
│           │                     │                        │               │
│           ▼                     ▼                        ▼               │
│  ┌────────────────────────────────────────────────────────────────┐      │
│  │                    Aggregation Layer                            │      │
│  │                                                                │      │
│  │  Vercel Analytics  │  Supabase Dashboard  │  UptimeRobot      │      │
│  │  (Web Vitals,      │  (DB Metrics,        │  (Availability,   │      │
│  │   API Latency,     │   Auth Metrics,      │   Response Time)  │      │
│  │   Error Tracking)  │   Storage Usage)     │                   │      │
│  └───────────────────────────────┬────────────────────────────────┘      │
│                                  │                                       │
│                                  ▼                                       │
│  ┌────────────────────────────────────────────────────────────────┐      │
│  │                    Alerting                                     │      │
│  │                                                                │      │
│  │  Slack / Discord       Email              SMS (Critical)       │      │
│  │  - Warning Level       - Daily Summary    - System Down        │      │
│  │  - Error Rate Spike    - Weekly Report    - Data Loss Risk     │      │
│  └────────────────────────────────────────────────────────────────┘      │
└──────────────────────────────────────────────────────────────────────────┘
```

### 4.2 핵심 메트릭 및 임계값

| 카테고리 | 메트릭 | 수집 방법 | WARNING 임계값 | CRITICAL 임계값 |
|----------|--------|-----------|:--------------:|:---------------:|
| **API 응답** | Server Action P95 latency | Vercel Analytics | > 3초 | > 10초 |
| **API 응답** | Error rate (5xx) | Vercel Analytics | > 1% | > 5% |
| **Judge0** | 코드 제출 평균 대기 시간 | 커스텀 로깅 | > 15초 | > 30초 |
| **Judge0** | 타임아웃 비율 | 커스텀 로깅 | > 5% | > 20% |
| **TTS** | Cache miss rate | `X-TTS-Cache` 헤더 집계 | > 40% | > 70% |
| **TTS** | Storage 사용량 | Supabase Dashboard | > 500MB | > 800MB (Free 1GB) |
| **DB** | Connection pool 사용률 | Supabase Dashboard | > 70% | > 90% |
| **DB** | 쿼리 평균 실행 시간 | Supabase Dashboard | > 100ms | > 500ms |
| **DB** | `dispatch_readiness_scores` 행 수 | 커스텀 쿼리 | > 10,000행 | > 50,000행 |
| **Auth** | `auth.getUser()` 실패율 | 커스텀 로깅 | > 0.5% | > 2% |
| **Uptime** | 시스템 가용률 | UptimeRobot | < 99.5% | < 99% |

### 4.3 권장 도구 스택

| 계층 | 도구 | 비용 | 용도 |
|------|------|------|------|
| Application Performance | **Vercel Analytics** (내장) | Free (기본) | Web Vitals, API latency, error tracking |
| Application Performance | **Sentry** (선택) | Free tier 5K events/월 | 에러 추적, stack trace, 알림 |
| Database | **Supabase Dashboard** (내장) | 포함 | Query performance, connection pool, storage |
| Infrastructure | **UptimeRobot** | Free (50 monitors) | HTTP(S) 가용성 모니터링 |
| Custom Metrics | **console.log** + **Vercel Logs** | Free | Judge0 latency, cache hit/miss 로깅 |
| Alerting | **Slack Webhook** | Free | WARNING/CRITICAL 알림 채널 |

### 4.4 단기 로깅 개선 (즉시 적용 가능)

현재 fire-and-forget 패턴의 `.catch(() => {})`를 최소한 로깅으로 개선:

```typescript
// 현재 (scores.ts 호출부): 에러 완전 흡수
recalculateUserScores(user.id).catch(() => {})

// 개선: 최소 로깅 추가
recalculateUserScores(user.id).catch((err) =>
  console.error('[Score] recalculation failed:', user.id, err)
)
```

---

## 5. 리스크 관리 포인트

### 5.1 데이터 리스크

| 리스크 | 발생 확률 | 영향도 | 현재 대응 | 권장 대응 |
|--------|:---------:|:------:|-----------|-----------|
| 점수 부분 업데이트 (Q5-Q8 중간 실패) | 중 | 중 | 다음 재계산 시 전체 갱신 (최종적 일관성) | PostgreSQL Function으로 트랜잭션 보장 |
| `dispatch_readiness_scores` 무한 증가 | 고 | 저~중 | 없음 (삭제 정책 없음) | 90일 이상 스냅샷 자동 삭제 정책, 또는 사용자당 최근 N건만 보존 |
| TTS 캐시 콘텐츠 불일치 | 중 | 저 | 없음 (무효화 정책 없음) | 콘텐츠 수정 시 관련 캐시 키 삭제 로직 추가 |
| 퀴즈 답안 대량 축적 | 고 | 저 | 없음 | 아카이브 정책 (6개월 이상 → cold storage) |
| Supabase 데이터 유실 | 극저 | 극고 | Supabase Cloud 자동 백업 (추정) | Point-in-Time Recovery 설정 확인, 외부 백업 스크립트 구축 |

### 5.2 가용성 리스크

| 리스크 | 발생 확률 | 영향도 | 현재 대응 | 권장 대응 |
|--------|:---------:|:------:|-----------|-----------|
| Supabase Cloud 장애 | 극저 | 극고 (전체 다운) | 없음 (SPOF) | 헬스체크 API 구현, 정적 에러 페이지, 상태 페이지 모니터링 |
| Judge0 Docker 크래시 | 중 | 중 (코드 실행만) | `restart: unless-stopped` (`docker-compose.yml`) | 헬스체크 엔드포인트 모니터링, UI에 상태 표시 |
| Google TTS API 할당 초과 | 중 | 저~중 (음성만) | Supabase Storage 캐시 + Admin pre-cache | 사전 캐시 100% 커버리지 달성, graceful degradation UI |
| Vercel Serverless 콜드 스타트 | 중 | 저 | 없음 | Edge Runtime 검토 (Middleware는 이미 Edge) |
| `recalculateAllScores()` 타임아웃 | 고 (50명+) | 중 | 없음 | 배치 크기 제한 + 진행 상황 UI |

### 5.3 성능 리스크

| 리스크 | 발생 확률 | 영향도 | 현재 대응 | 권장 대응 |
|--------|:---------:|:------:|-----------|-----------|
| Middleware 응답 지연 (매 요청 2 DB 호출) | 고 | 중 | Matcher로 정적 자산 제외 (`middleware.ts:L100-103`) | 프로필 데이터 Cookie/Edge 캐싱 검토 |
| 코드 제출 타임아웃 (10+ TC) | 중 | 고 | `try-catch` + 에러 메시지 (`coding.ts:L113-128`) | Batch API 또는 `?wait=true` 모드 활용 |
| 랭킹 페이지 전체 로드 지연 | 중 (100명+) | 중 | 없음 (전체 데이터 메모리 로드) | DB 레벨 정렬 + 페이지네이션 |
| Admin 배치 재계산 서버 부하 | 고 | 고 | 없음 | 배치 사이즈 제한, 딜레이 삽입, 비동기 큐 |
| 동시 TTS 대화문 합성 지연 | 중 | 저 | 캐시 활용 | `Promise.all()` 세그먼트 병렬 합성 |

### 5.4 보안 리스크

| 리스크 | 발생 확률 | 영향도 | 현재 대응 | 권장 대응 |
|--------|:---------:|:------:|-----------|-----------|
| Judge0 무인증 코드 실행 | 중 | 고 | `isolate` 샌드박스 | `AUTHN_TOKEN` 설정 + 포트 바인딩 `127.0.0.1:2358` |
| Privileged Docker 컨테이너 탈출 | 저 | 극고 | `isolate` 격리 | `--cap-add` 개별 부여, 전용 VM에서 실행 |
| Service Role Key 유출 | 저 | 극고 | 서버 사이드 전용 (NEXT_PUBLIC_ 미사용) | 환경 변수 rotation 정책, Vault 도입 검토 |
| `ignoreBuildErrors: true` 타입 안전성 | 고 | 중 | 없음 | `false`로 전환 + CI에서 타입 체크 |

### 5.5 리스크 우선순위 매트릭스

```
영향도 (극고)
     │
     │  [Supabase 장애]     [Docker 컨테이너 탈출]
     │  [Service Role 유출]
     │
     │  [코드 제출 타임아웃]  [Judge0 무인증]
     │  [배치 재계산 타임아웃]
     │
     │  [Middleware 지연]    [ignoreBuildErrors]
     │  [점수 부분 업데이트]  [스냅샷 무한 증가]
     │
     │  [TTS 지연]          [캐시 불일치]
     │  [TTS 용량 초과]
     │
     └────────────────────────────────────── 발생 확률 (고)
          (극저)                    (고)
```

---

## 6. 스케일링 전략 제안

### 6.1 Short-term: 현재 아키텍처 내 최적화

> **대상 규모:** ~50명 / **타임프레임:** 즉시~1개월

| # | 작업 | 난이도 | 효과 | 대상 파일 |
|---|------|:------:|:----:|-----------|
| S1 | Judge0 `?wait=true` 모드 전환 | 하 | 높음 | `judge0/client.ts` — `createSubmission()` URL 파라미터 변경 |
| S2 | Judge0 Batch API 활용 | 중 | 높음 | `coding.ts` — TC 일괄 제출 |
| S3 | Score 읽기 쿼리 병렬화 (Q1-Q4) | 하 | 중 | `scores.ts` — `Promise.all([Q1, Q2, Q3, Q4])` |
| S4 | `recalculateAllScores()` 배치 병렬화 | 하 | 중 | `scores.ts` — 10명씩 `Promise.allSettled()` |
| S5 | fire-and-forget 에러 로깅 추가 | 하 | 중 | 전체 `.catch(() => {})` → `console.error` |
| S6 | TTS 세그먼트 병렬 합성 | 하 | 중 | `tts/route.ts` — `Promise.all(segments.map(synthesize))` |
| S7 | Judge0 `AUTHN_TOKEN` 설정 | 하 | 높음 | `judge0.conf`, 환경 변수 |
| S8 | `dispatch_readiness_scores` 정리 정책 | 하 | 중 | Supabase cron 또는 수동 삭제 쿼리 |

### 6.2 Mid-term: 아키텍처 일부 변경

> **대상 규모:** 50~200명 / **타임프레임:** 1~3개월

| # | 작업 | 난이도 | 효과 | 설명 |
|---|------|:------:|:----:|------|
| M1 | Score 재계산 PostgreSQL Function化 | 중 | 높음 | 8쿼리 → 1 RPC 호출. 트랜잭션 보장 + 네트워크 왕복 1회 |
| M2 | 랭킹 Materialized View | 중 | 높음 | 실시간 계산 → 정기 갱신 View. 랭킹 페이지 응답 시간 대폭 개선 |
| M3 | Middleware 프로필 캐싱 | 중 | 중 | Cookie에 role/is_onboarded 인코딩. DB 쿼리 제거 (단, 역할 변경 즉시 반영 안 됨) |
| M4 | 테스트 인프라 구축 | 중 | 높음 | Vitest + Testing Library 도입. scores.ts 단위 테스트 우선 |
| M5 | CI/CD 파이프라인 | 중 | 높음 | GitHub Actions: lint → type-check → test → build → deploy |
| M6 | `ignoreBuildErrors: false` 전환 | 중 | 높음 | 기존 타입 에러 해결 후 전환 |
| M7 | Sentry 에러 추적 도입 | 하 | 중 | `@sentry/nextjs` 설치 + DSN 설정 |
| M8 | Admin 사용자 목록 페이지네이션 | 하 | 중 | cursor 기반 페이지네이션 추가 |

### 6.3 Long-term: 아키텍처 전면 재설계 시

> **대상 규모:** 200명+ / **타임프레임:** 3~6개월+

| # | 작업 | 난이도 | 효과 | 설명 |
|---|------|:------:|:----:|------|
| L1 | 코드 실행 비동기 큐 전환 | 고 | 높음 | Judge0 폴링 → Webhook + SSE/WebSocket. Background Job Queue (BullMQ 등) 도입 |
| L2 | Score 이벤트 기반 재계산 | 고 | 높음 | Supabase Database Webhooks → Edge Function → 점수 재계산. 실시간 반영 |
| L3 | 마이크로서비스 분리 | 고 | 중 | 코드 실행 서비스, TTS 서비스 분리. API Gateway 도입 |
| L4 | Redis 캐싱 레이어 | 중 | 높음 | 세션, 프로필, 랭킹 데이터 캐싱. Middleware 성능 개선 |
| L5 | Supabase Pro tier 또는 self-hosted | 중 | 높음 | Connection pool 확대, 대용량 Storage, 더 나은 백업 |
| L6 | CDN 기반 TTS 배포 | 중 | 높음 | 정적 TTS MP3를 CDN에 배포. Supabase Storage 부하 감소 |
| L7 | 수동 타입 → 자동 생성 전환 | 중 | 중 | `supabase gen types typescript` CI 자동화 |

### 6.4 스케일링 로드맵 타임라인

```
현재                 1개월              3개월              6개월
 │                    │                  │                  │
 │  [S1] wait=true    │  [M1] RPC化      │  [L1] 비동기 큐   │
 │  [S2] Batch API    │  [M2] Mat.View   │  [L2] Event 기반  │
 │  [S3] Query 병렬화  │  [M3] MW 캐싱    │  [L4] Redis       │
 │  [S4] Batch 병렬화  │  [M4] 테스트     │  [L5] Supabase Pro│
 │  [S5] 에러 로깅     │  [M5] CI/CD      │                  │
 │  [S6] TTS 병렬화    │  [M6] Build 체크  │                  │
 │  [S7] Auth 설정     │  [M7] Sentry     │                  │
 │  [S8] 스냅샷 정리   │  [M8] Pagination │                  │
 │                    │                  │                  │
 ▼────────────────────▼──────────────────▼──────────────────▼
   ~30명 안정         ~50명 안정          ~100명 안정        ~200명+
```

---

## 7. 비용 최적화 분석

### 7.1 Supabase 티어 비교

| 항목 | Free | Pro ($25/월) | Team ($599/월) |
|------|------|-------------|---------------|
| Database | 500MB | 8GB | 16GB+ |
| Storage | 1GB | 100GB | 100GB+ |
| Auth MAU | 50,000 | 100,000 | 100,000+ |
| Edge Functions | 500K invocations | 2M invocations | 2M+ |
| Realtime | 200 connections | 500 connections | 500+ |
| Point-in-Time Recovery | X | O (7일) | O (28일) |
| Daily Backups | X | O | O |
| **추정 적합도** | **~30명까지** | **30-200명** | **200명+** |

**현재 비용 영향:**
- Free tier Storage 1GB → TTS 사전 캐시 실행 시 초과 가능 (추정 1.5-2GB 필요)
- Free tier DB 500MB → 1년 운영 시 ~110MB (충분)
- Free tier 50K MAU → 사내 LMS 30-50명 (충분)

### 7.2 Vercel 호스팅 비용

| 항목 | Hobby (Free) | Pro ($20/월) |
|------|--------------|-------------|
| Serverless 함수 실행 | 100GB-hr | 1000GB-hr |
| 함수 타임아웃 | 10초 | 60초 |
| 대역폭 | 100GB | 1TB |
| 빌드 시간 | 6000분/월 | 24000분/월 |
| **추정 적합도** | **개발 환경** | **프로덕션** |

**핵심 제약:** Hobby tier의 **10초 함수 타임아웃**은 Judge0 순차 폴링(최대 200초) 및 배치 재계산과 호환되지 않는다. Pro tier (60초)에서도 10+ TC 순차 폴링은 타임아웃 위험이 있다.

### 7.3 Judge0 호스팅 비용

| 방식 | 월 비용 (추정) | 장점 | 단점 |
|------|:-------------:|------|------|
| **Self-hosted (VPS)** | $10-30/월 (2-4GB VPS) | 무제한 실행, 완전 제어 | 운영 부담, 보안 관리 |
| **RapidAPI (Basic)** | $0 (50 req/일) | 무운영 | 일일 50건 제한 — 사내 LMS로는 부족할 수 있음 |
| **RapidAPI (Pro)** | $10/월 (1000 req/일) | 무운영, 적절한 할당량 | 응답 지연 가능 (네트워크 경유) |
| **RapidAPI (Ultra)** | $25/월 (10000 req/일) | 충분한 할당량 | 비용 |

**권장:** 30명 규모에서는 self-hosted VPS ($10-20/월)가 비용 대비 가장 효율적이다. RapidAPI는 운영 편의성이 높으나 네트워크 지연과 일일 할당량 제한이 있다.

### 7.4 Google Cloud TTS 비용

| 음성 유형 | 무료 | 유료 |
|-----------|------|------|
| Standard | 400만 문자/월 | $4/100만 문자 |
| Neural2 (WaveNet) | 100만 문자/월 | $16/100만 문자 |

**현재 사용:** Neural2 음성 (`ja-JP-Neural2-B/C/D`) → 100만 문자/월 무료.

**비용 추정 (추정):**
- JLPT vocabulary ~5,000건 x 평균 20문자 = 100,000문자
- IT glossary ~2,000건 x 평균 30문자 = 60,000문자
- 학습 대화문 ~500건 x 평균 200문자 = 100,000문자
- **월간 총 추정:** ~260,000문자 (무료 범위 내)
- 캐시 히트 시 API 호출 안 함 → 실제 비용 더 낮음

**결론:** 현재 규모에서 Google TTS 비용은 **무료 범위** 내에서 운영 가능. 사전 캐시 전략이 비용 절감에 크게 기여한다.

### 7.5 월간 총 비용 추정

| 항목 | 현재 (Free) | 권장 (Pro) |
|------|:-----------:|:----------:|
| Supabase | $0 | $25 |
| Vercel | $0 | $20 |
| Judge0 VPS | $10-20 | $10-20 |
| Google TTS | $0 | $0 |
| 모니터링 (UptimeRobot + Sentry Free) | $0 | $0 |
| **월 합계** | **$10-20** | **$55-65** |

---

## 8. 타 문서 참조

| 문서 | 관련 내용 | 본 문서와의 관계 |
|------|-----------|-----------------|
| [01_system_overview.md](./01_system_overview.md) | 기술 스택, 기술 부채 분석, 의존성 방향 | 본 문서 1장 품질 속성의 기반 정보. 5장 기술 부채가 확장성에 미치는 영향 |
| [02_folder_responsibility.md](./02_folder_responsibility.md) | 디렉토리 구조, 파일별 책임 | 병목 지점 파일의 정확한 위치와 책임 범위 |
| [03_runtime_flow.md](./03_runtime_flow.md) | 요청 처리 흐름, 성능 병목 포인트 식별 | 본 문서 2장 병목 분석의 런타임 시퀀스 상세. 10장 병목 요약이 본 문서의 출발점 |
| [04_data_architecture.md](./04_data_architecture.md) | DB 스키마, RLS, 인덱스, 마이그레이션 | 3장 데이터 증가 예측의 스키마 기반. 페이지네이션 전략의 인덱스 의존성 |
| [05_network_and_infrastructure.md](./05_network_and_infrastructure.md) | 네트워크 토폴로지, 장애 모드 분석 | 5장 가용성 리스크와 본 문서의 인프라 제약 연계. Judge0 Docker 보안 이슈 |
| [06_security_design.md](./06_security_design.md) | 인증/인가, RLS, 보안 설계 | 5.4 보안 리스크의 상세 분석. Service Role Key 관리 전략 |
| [07_exam_and_domain_model.md](./07_exam_and_domain_model.md) | 시험/등급 도메인 모델 | 종합 시험 흐름의 확장성 (N개 알림 순차 발송 등) |
| [09_refactoring_candidates.md](./09_refactoring_candidates.md) | 리팩토링 후보와 우선순위 | 본 문서 6장 스케일링 전략의 구현 상세. scores.ts 분할, 트랜잭션 도입 등 |
| [10_learning_roadmap_for_architect.md](./10_learning_roadmap_for_architect.md) | 아키텍트 학습 로드맵 | 확장성 설계 역량 강화를 위한 학습 경로 |

---

## 부록 A: 병목 지점 Quick Reference

| 병목 | 파일:줄 | 현재 동작 | 최악 지연 | 우선순위 |
|------|---------|-----------|:---------:|:--------:|
| Judge0 순차 폴링 | `judge0/client.ts:L89-97` | 1초 간격 최대 20회 폴링 | N x 20초/TC | **P0** |
| Judge0 순차 TC 실행 | `coding.ts:L45-69` | TC별 순차 submit + poll | 10TC = 200초 | **P0** |
| Score 8연속 쿼리 | `scores.ts:L18-262` | 8개 쿼리 순차 실행 | ~640ms/사용자 | **P1** |
| Score 배치 순차 | `scores.ts:L286-289` | 사용자별 순차 실행 | 50명 = 32초 | **P1** |
| Middleware 2회 DB | `middleware.ts:L28,55` | 매 요청 auth + profile 조회 | ~60ms/요청 | **P2** |
| TTS 순차 합성 | `tts/route.ts:L200-213` | 세그먼트별 순차 API 호출 | N x 500ms | **P2** |
| 알림 순차 발송 | `comprehensive-exam.ts:L59-85` | mentor/admin별 순차 호출 | N x 50ms | **P3** |

## 부록 B: 쿼리 페이지네이션 상태 매트릭스

| 파일 | 쿼리 대상 | `.limit()` | `.range()` | 위험도 |
|------|-----------|:----------:|:----------:|:------:|
| `scores.ts:L31` | `quiz_attempts` (user) | X | X | 중 |
| `scores.ts:L121` | `code_submissions` (user) | X | X | 중 |
| `scores.ts:L165` | `coding_exam_attempts` (user) | X | X | 저 |
| `comprehensive-exam.ts:L239` | `quiz_questions` (quiz IDs) | X | X | 중 |
| `admin/users` 관련 | `profiles` (전체) | X | X | 고 |
| Ranking 관련 | 전체 사용자 스킬 | X | X | 고 |
| `vocabulary.ts:L22` | vocabulary (paginated) | O | O | - |
| `coding.ts:L23` | coding problems (paginated) | O | O | - |
| `dashboard/page.tsx:L52` | 최근 활동 | O (limit 5) | X | - |
| `notifications.ts:L34` | 알림 목록 | O | X | - |
