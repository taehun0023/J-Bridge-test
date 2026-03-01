# Dashboard 성능 최적화 기술 문서

## 1. 문제 진단

### 증상
대시보드 페이지(`/dashboard`)의 서버 렌더링(SSR)이 느림.
체감 로딩 2-3초 이상.

### 원인 분석: Waterfall 패턴 (폭포수 쿼리)

리팩토링 전 코드는 **15개 이상의 DB 쿼리가 순차 실행**되고 있었다.

```
시간 ──────────────────────────────────────────────────────►

[auth.getUser]─────►[profiles]────►[japanese_skills]────►[coding_skills]────►
[attitude_skills]────►[quiz_attempts]────►[comprehensive_exams]────►
[task_assignments]────►[completedAssessments]────►[rankProfiles]────►
[learningAssignments]────►[enrollments]────►[admin_feedbacks]────►
[userCompExams]────►[getCoursesWithProgress]────►[getMentorDashboardData]────►

총 시간 = 쿼리1 + 쿼리2 + ... + 쿼리15 ≈ 100ms × 15 = 1,500ms+
```

각 `await` 키워드마다 Node.js는 이전 쿼리의 응답을 **기다린 후** 다음 쿼리를 보냈다.
대부분의 쿼리는 서로 **의존관계가 없는데도** 하나씩 직렬로 실행되었다.

---

## 2. 핵심 개념: 의존 관계 그래프 (Dependency Graph)

성능 최적화의 첫 단계는 **각 쿼리 간 의존 관계를 파악**하는 것이다.

### 의존 관계 분석

```
auth.getUser()
    │
    ▼ user.id
    │
    ├─── profiles ──────────────────────────────┐
    ├─── japanese_skills                        │
    ├─── coding_skills                          │ profile 결과 필요
    ├─── attitude_culture_skills                │
    ├─── quiz_attempts (recent)                 ▼
    ├─── comprehensive_exams (recent)     ┌─── completedAssessments (isJapanese)
    ├─── task_assignments                 ├─── enrollments (role)
    ├─── rankProfiles (user.id 불필요!)   ├─── javaBadges (isAdmin)
    ├─── learning_assignments             └─── mentorData (role)
    ├─── admin_feedbacks
    └─── comprehensive_exams (retakes)
```

**핵심 발견:**
- 11개 쿼리는 `user.id`만 있으면 즉시 실행 가능
- 4개 쿼리만 `profile` 결과(role, is_japanese)에 의존
- `rankProfiles`는 아예 유저 정보 없이도 실행 가능

---

## 3. 해결: Promise.all 병렬화

### 리팩토링 후 구조

```
시간 ──────────────────────────────────────────────────────►

Phase 0: [auth.getUser]──►
                          │
Phase 1:                  ├── [profiles]──────────┐
(11개 동시)               ├── [japanese_skills]    │
                          ├── [coding_skills]      │
                          ├── [attitude_skills]    │
                          ├── [quiz_attempts]      │
                          ├── [comp_exams]         │
                          ├── [tasks]              │
                          ├── [rankProfiles]       │
                          ├── [learning_assign]    │
                          ├── [feedbacks]          │
                          └── [comp_retakes]───────┤
                                                   │
Phase 2:                  ├── [completedAssess]    │
(4개 동시)                ├── [enrollments]  ◄─────┘
                          ├── [javaBadges]
                          └── [mentorData]─────────►

총 시간 = max(Phase1 쿼리들) + max(Phase2 쿼리들) ≈ 100ms + 100ms = 200ms
```

### Before vs After

| 지표 | Before | After | 개선율 |
|------|--------|-------|--------|
| 네트워크 왕복 횟수 | 15회 (직렬) | 3회 (Phase 0→1→2) | **80% 감소** |
| 이론적 쿼리 시간 | ~1,500ms | ~300ms | **5배 빠름** |
| DB 커넥션 활용 | 1개씩 순차 | 11개 동시 | 병렬 처리 |

---

## 4. 코드 패턴 상세

### 패턴 1: 기본 Promise.all 구조화 해체

```typescript
// ❌ Before: 순차 실행 (Waterfall)
const { data: profile } = await supabase.from('profiles').select('*').eq('id', user.id).single()
const { data: skills } = await supabase.from('japanese_skills').select('*').eq('user_id', user.id).single()
const { data: coding } = await supabase.from('coding_skills').select('*').eq('user_id', user.id).single()

// ✅ After: 병렬 실행
const [
  { data: profile },
  { data: skills },
  { data: coding },
] = await Promise.all([
  supabase.from('profiles').select('*').eq('id', user.id).single(),
  supabase.from('japanese_skills').select('*').eq('user_id', user.id).single(),
  supabase.from('coding_skills').select('*').eq('user_id', user.id).single(),
])
```

**원리:** `Promise.all`은 배열 안의 모든 Promise를 **동시에 시작**하고,
**가장 느린 것이 끝날 때까지** 대기한다. 3개가 각 100ms라면:
- 순차: 100 + 100 + 100 = 300ms
- 병렬: max(100, 100, 100) = 100ms

### 패턴 2: 조건부 쿼리를 Promise.all에 포함

```typescript
// 문제: role에 따라 실행 여부가 다른 쿼리
// ❌ Promise.all 밖에서 순차 처리
const enrolledCourses = []
if (profile?.role === 'mentee') {
  const { data } = await supabase.from('enrollments')...  // 여기서 또 대기
  enrolledCourses = data
}
const javaBadges = await getCoursesWithProgress(...)  // 여기서 또 대기

// ✅ 삼항 연산자로 Promise.all 안에 통합
const [enrolledResult, javaBadges] = await Promise.all([
  profile?.role === 'mentee'
    ? supabase.from('enrollments').select('...').eq('user_id', user.id)
    : Promise.resolve({ data: null }),  // 즉시 완료되는 빈 Promise
  getCoursesWithProgress(supabase, user.id, 'java', isAdmin),
])
```

**핵심:** 조건이 false일 때 `Promise.resolve({ data: null })`을 반환하면
Promise.all의 구조를 깨지 않으면서 불필요한 쿼리를 건너뛸 수 있다.

### 패턴 3: Phase 분리 (의존 관계가 있는 경우)

```typescript
// Phase 1: 독립적인 쿼리들
const [{ data: profile }, { data: skills }] = await Promise.all([
  fetchProfile(),
  fetchSkills(),
])

// Phase 2: Phase 1 결과에 의존하는 쿼리들
const isJapanese = profile?.is_japanese ?? false
const [assessments, courses] = await Promise.all([
  fetchAssessments(isJapanese),   // profile.is_japanese 필요
  fetchCourses(profile?.role),    // profile.role 필요
])
```

**규칙:** `await`은 의존 관계 경계에서만 사용한다.
같은 Phase 안에서는 절대 await을 쓰지 않는다.

---

## 5. 추가 최적화: Props 중복 제거

### Before: DashboardClient props를 2곳에서 복사

```typescript
// 멘토 렌더링
<DashboardClient profile={profile} radarScores={radarScores} recentResults={recentResults}
  tasks={tasks ?? []} pendingAssessments={pendingAssessments} ... 20개 props ... />

// 일반 렌더링 (동일한 props를 또 복사)
<DashboardClient profile={profile} radarScores={radarScores} recentResults={recentResults}
  tasks={tasks ?? []} pendingAssessments={pendingAssessments} ... 20개 props ... />
```

### After: 객체로 추출

```typescript
const dashboardProps = {
  profile, radarScores, recentResults,
  tasks: tasks ?? [], pendingAssessments, ...
}

// 멘토 렌더링
<DashboardClient {...dashboardProps} />

// 일반 렌더링
<DashboardClient {...dashboardProps} />
```

**장점:** props 변경 시 한 곳만 수정. 복사-붙여넣기 버그 방지.

---

## 6. 왜 CDN(Cloudflare)은 해결책이 아닌가?

```
유저 브라우저 → CDN Edge → Vercel Serverless → Supabase DB
                 │                    │
              정적 에셋            SSR 페이지
              (이미 캐시됨)        (매 요청마다 실행)
```

| 구분 | CDN이 캐시 가능? | 설명 |
|------|-----------------|------|
| JS/CSS/이미지 | O | Vercel이 이미 CDN 제공 중 |
| SSR 페이지 | X | 유저별 데이터가 다름 → 캐시 불가 |
| API 응답 | X | 인증 필요 → 캐시 불가 |

대시보드는 **유저별 개인 데이터**를 보여주는 SSR 페이지이므로,
CDN 레이어를 추가해도 병목 구간(Serverless → DB)은 변하지 않는다.

**Vercel + Cloudflare 이중 프록시의 위험:**
- DNS 해석 추가 hop → 오히려 느려질 수 있음
- SSL 이중 종료 (Cloudflare SSL + Vercel SSL) → 레이턴시 증가
- WebSocket/Streaming 호환성 문제

---

## 7. 아키텍처 레벨에서의 추가 개선 방향

현재 리팩토링은 **코드 레벨 최적화**이다.
더 큰 규모에서 고려할 수 있는 전략들:

### 7-1. 서버 컴포넌트 스트리밍 (React Suspense)

```tsx
// 느린 섹션을 Suspense로 감싸면 나머지가 먼저 렌더링됨
<Suspense fallback={<RankingSkeleton />}>
  <RankingSection userId={user.id} />
</Suspense>
```

**효과:** 전체 페이지가 가장 느린 쿼리를 기다리지 않고,
준비된 부분부터 사용자에게 보여줌 (Progressive Rendering)

### 7-2. React Query 캐싱 (클라이언트)

현재 프로젝트에 `@tanstack/react-query`가 이미 설치되어 있다.
자주 변경되지 않는 데이터(랭킹, 코스 목록)를 클라이언트에서 캐싱하면
네비게이션 시 재요청을 줄일 수 있다.

### 7-3. Supabase 리전 최적화

```
현재: Vercel (미국) ──── 100ms RTT ────► Supabase (미국)
최적: Vercel (도쿄) ────  10ms RTT ────► Supabase (도쿄)
```

Supabase 프로젝트 리전을 `ap-northeast-1` (도쿄)로 설정하고,
Vercel 배포도 도쿄 리전으로 맞추면 DB 왕복 시간이 10배 감소한다.

### 7-4. DB 뷰 또는 RPC로 쿼리 통합

```sql
-- 11개 쿼리를 1개 DB 함수로 통합
CREATE FUNCTION get_dashboard_data(p_user_id UUID)
RETURNS JSON AS $$
  SELECT json_build_object(
    'profile', (SELECT row_to_json(p) FROM profiles p WHERE id = p_user_id),
    'skills', (SELECT row_to_json(s) FROM japanese_skills s WHERE user_id = p_user_id),
    ...
  )
$$ LANGUAGE SQL;
```

**효과:** 11개의 네트워크 왕복 → 1개로 줄임.
단, 복잡도가 높아지므로 필요할 때만 적용.

---

## 8. 핵심 교훈 요약

| 원칙 | 설명 |
|------|------|
| **측정 먼저** | "느리다"는 체감이 아닌 실제 병목을 찾아라 |
| **의존 그래프 그리기** | 쿼리 간 관계를 파악해야 어디를 병렬화할지 알 수 있다 |
| **await은 의존 경계에서만** | 불필요한 await = 불필요한 대기 |
| **CDN ≠ 만능** | SSR/개인화 데이터에는 CDN이 무의미 |
| **레이어별 최적화** | 코드 → 인프라 → DB 순으로 비용 대비 효과를 따져라 |

---

## 적용된 커밋 파일

- `src/app/(main)/dashboard/page.tsx` — 15개 순차 쿼리 → 2-Phase 병렬화
