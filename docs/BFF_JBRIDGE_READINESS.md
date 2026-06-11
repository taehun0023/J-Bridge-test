# BFF — J-Bridge Readiness API (위버시스 인사평가 연동)

> 위버시스(weavusys) 인사평가 시스템이 J-Bridge(edu_cha)의 **사원 5축 파견 준비도(dispatch readiness)** 점수를 가져가기 위한 **BFF(Backend-for-Frontend) 엔드포인트** 문서.
> 작성: 인사평가 PoC (2026-06-07). 관련 설계 정본: `인사평가_체크시트_텍스트화.md` §L.

---

## 1. 배경 — 왜 BFF인가 (통합PoC 자료1 요약)

자료 원본: `C:\Users\zenoa\Desktop\통합PoC_자료1_전체개요.html` (발표 14슬라이드). 핵심 요약:

### 1.1 현재 상태
| | 위버시스 (Weavusys) | J-Bridge (edu_cha) |
|---|---|---|
| 스택 | Spring Boot 3.4 / Java 17 / MariaDB | Next.js 16 / Supabase Postgres |
| 역할 | 인사·근무·영수증·유급·권한 | JLPT 학습·코딩 평가·파견 준비도 |
| 인증 | JWT 2h + Spring Security 6.4 | Supabase SSR (쿠키 JWT) |

- **문제:** 인사담당자가 사원의 일본어·코딩 점수를 보려면 J-Bridge를 따로 열어야 함. 같은 사람 정보가 두 시스템에 분산.
- **인사정보 진실원(SoR) = 위버시스.** 사번을 단일 사용자 ID로 사용.

### 1.2 통합 방식 = BFF (채택)
- BFF = "한쪽 앱이 자기 화면을 그리려고 다른 쪽 API를 호출해 데이터를 받아오는 방식." 두 DB는 그대로 유지.
- 평가축 7개 비교: 방안1(DB통합) 20점 / **방안2(BFF) 29점 ← 채택** / 방안3(전면통합) 20점.
- 공수: 방안1 150~300h / **방안2 80~150h** / 방안3 400~600h.

### 1.3 1달 PoC 범위
- **Phase 0:** 사번 ↔ email 매핑 (정확도 ≥99%). *(PoC에서는 email 기반 매핑으로 단순화)*
- **Phase 1:** 사원 1명의 **5축 점수 조회 API 1개** + 인증(API Key) + 화면 임베드.

### 1.4 위험 대응 (자료1 §위험)
- 매핑 충돌(동명이인/재고용) → 백필 후 충돌 리포트.
- 네트워크 장애 → 타임아웃 + "조회 불가" 대체값(weavusys 측 graceful).
- **API Key 유출 → 환경변수/Secret만, 90일 회전, Rate Limit.**
- 권한 누락 → 응답 필드 **White List** 고정.

> 본 BFF는 위 Phase 1의 "5축 점수 조회 API 1개" 구현체다.

---

## 2. 엔드포인트 사양 (계약)

```
GET /api/jbridge/users/{email}/readiness
Header: Authorization: Bearer <WEAVUSYS_API_KEY>
```

| 상태 | 조건 | 본문 |
|---|---|---|
| 200 | 정상 | 아래 9필드 JSON |
| 401 | 키 누락/불일치 | `{ "error": "Unauthorized" }` |
| 404 | 해당 email의 profiles 없음 | `{ "error": "User not found" }` |
| 404 | readiness 점수 없음 | `{ "error": "No readiness score found" }` |
| 500 | 서비스롤 클라이언트 불가 | `{ "error": "Service role client unavailable" }` |

**200 응답 (White List 9필드, snake_case):**
```json
{
  "jlpt_score": 30,
  "it_japanese_score": 57,
  "core_programming_score": 68,
  "framework_score": 37,
  "attitude_culture_score": 60,
  "overall_score": 50,
  "is_japanese": false,
  "jlpt_level": "N5",
  "recorded_at": "2026-04-13T09:59:00.674355+00:00"
}
```
- `jlpt_level` = `getJlptLevel(jlpt_score)` (`src/lib/assessment-config.ts`): ≥90 N1 / ≥80 N2 / ≥70 N3 / ≥50 N4 / <50 N5.
- `overall_score` = 5축 평균 (DB GENERATED 컬럼).
- `recorded_at`은 timestamptz → ISO+offset. **소비측(weavusys)은 `OffsetDateTime`으로 파싱해야 함**(LocalDateTime은 오프셋 파싱 실패).

---

## 3. 구현 (어떻게 추가했나)

### 3.1 신규/수정 파일
| 파일 | 내용 |
|---|---|
| `src/app/api/jbridge/users/[email]/readiness/route.ts` | **신규** — BFF 라우트 본체 (GET) |
| `src/lib/env.ts` | `WEAVUSYS_API_KEY: z.string().min(1).optional()` 추가 |
| `.env.example` | `WEAVUSYS_API_KEY=` 항목 추가 |
| `src/app/api/.../readiness/route.test.ts` | vitest 계약 테스트 (401/404/200·9필드) |
| `scripts/bff-readiness-contract-smoke.ps1` | 라이브 curl 스모크 스크립트 |

### 3.2 route.ts 로직 (요지)
1. `Authorization: Bearer <token>` 추출 → SHA-256 해시 후 `timingSafeEqual`로 `env.WEAVUSYS_API_KEY`와 상수시간 비교, 불일치면 **401**. (키 미설정 시에도 항상 401 = 엔드포인트 잠금. 2026-06-11 `!==` 비교에서 타이밍 세이프로 강화)
2. `createServiceRoleClient()` (`src/lib/supabase/server.ts`) — null이면 500. (RLS 우회는 서비스롤 + 키 통과 후에만)
3. `decodeURIComponent(email)` 로 `profiles` 조회 → 없으면 404.
4. 그 `user_id`로 `dispatch_readiness_scores` 최신 1건(`recorded_at DESC limit 1`) → 없으면 404. (`fetchDispatchReadiness` 패턴 재사용)
5. White List 9필드만 골라 200 반환.

> 기존 라우트 패턴(`src/app/api/admin/tts-precache/route.ts`, `health/route.ts`)과 `createServiceRoleClient`를 재사용. 과잉 노출 방지 위해 `select`를 9필드로 명시.

### 3.3 환경변수 / 인증
- **`WEAVUSYS_API_KEY`** = 위버시스와 공유하는 무작위 시크릿(서비스-투-서비스). 양쪽 동일 값:
  - edu_cha: Vercel 프로젝트 → Settings → Environment Variables → `WEAVUSYS_API_KEY` (Production)
  - weavusys: `JBRIDGE_API_KEY` (서버 env / GitHub Secret)
- 비교 방식: BFF가 수신 Bearer 토큰을 `WEAVUSYS_API_KEY`와 **타이밍 세이프 비교**(SHA-256 + `timingSafeEqual`)해 통과. (위버시스는 `JBRIDGE_API_KEY`를 그 Bearer로 전송 — 위버시스 측 변경 불요)
- **edu_cha는 스키마 변경 없음** — 기존 `profiles`(email) + `dispatch_readiness_scores` 조회만. 사번 컬럼 추가 없이 **email 기반 매핑**(PoC).

### 3.4 배포 (Vercel + Supabase)
- edu_cha는 **Vercel ↔ GitHub 연동**으로 자동 배포. `main` push → **Production 배포**.
- BFF는 `main`에 cherry-pick 후 push → 라이브: **`https://edu-cha.vercel.app/api/jbridge/users/{email}/readiness`**
- Vercel에 `WEAVUSYS_API_KEY` env 등록 필수(없으면 401 잠금).

---

## 4. 검증 (라이브 확인됨 · 2026-06-07)

```bash
KEY=<WEAVUSYS_API_KEY>
BASE=https://edu-cha.vercel.app
# 401
curl -i "$BASE/api/jbridge/users/x@x.com/readiness"
# 404 (없는 유저)
curl -i -H "Authorization: Bearer $KEY" "$BASE/api/jbridge/users/nobody@x.com/readiness"
# 200 (실유저)
curl -s -H "Authorization: Bearer $KEY" "$BASE/api/jbridge/users/sscha@weavus-group.com/readiness"
# → {"jlpt_score":30,"it_japanese_score":57,...,"jlpt_level":"N5",...}
```
- 라이브에서 401/404/200(실 5축) 전부 확인. 위버시스 `JBridgeClient`가 이 응답을 받아 §L 점수계산에 사용함을 E2E로 확증.

전체 PoC 진척/인계는 `인사평가_체크시트_텍스트화.md` §M 참조.
