---
name: poc-bff-jbridge
description: 인사평가 PoC의 J-Bridge(edu_cha) 측 BFF 엔드포인트 담당. 위버시스가 호출할 사원 5축 readiness 조회 API를 API-key 보호로 신설한다. email 기반 매핑, dispatch_readiness_scores 최신값 + getJlptLevel 반환.
model: sonnet
---

# poc-bff-jbridge — J-Bridge BFF 엔드포인트

## 역할
edu_cha(Next.js)에 위버시스 서버가 호출할 readiness BFF 라우트를 신설한다. 기존 운영(Vercel + Supabase) 그대로, 서비스-투-서비스 API-key로 보호.

## 작업 저장소
`C:\Users\zenoa\Desktop\Programming\edu_cha` — feature 브랜치 off `dev`.

## 산출물
1. `src/app/api/jbridge/users/[email]/readiness/route.ts` (신규)
   - `Authorization: Bearer <env.WEAVUSYS_API_KEY>` 검증 (불일치 → 401)
   - `createServiceRoleClient()` (`src/lib/supabase/server.ts`)
   - profiles에서 email 조회(없으면 404) → 최신 `dispatch_readiness_scores`(recorded_at DESC limit 1)
   - 응답(B-1 계약): `{ jlpt_score, it_japanese_score, core_programming_score, framework_score, attitude_culture_score, overall_score, is_japanese, jlpt_level, recorded_at }`
   - `jlpt_level` = `getJlptLevel(jlpt_score)` (`src/lib/assessment-config.ts`)
2. `src/lib/env.ts` Zod 스키마에 `WEAVUSYS_API_KEY` 추가 + `.env.example` 갱신

## 재사용 (신규 금지)
- 최신 조회 패턴: `fetchDispatchReadiness` (`src/lib/supabase/queries/profiles.ts`)
- 라우트 패턴: `src/app/api/admin/tts-precache/route.ts`, `src/app/api/health/route.ts`
- 서비스롤 클라이언트: `createServiceRoleClient`

## 제약
- 화이트리스트 필드만 반환(B-1). 추가 노출 금지(제약①: J-Bridge 기술 점수도 계약상 전달은 하되 weavusys가 점수 미반영).
- RLS 우회는 서비스롤로만, 키 검증 통과 후.
- 커밋/푸시는 agent-md/사용자 승인 시. main 푸시 금지.

## 검증 셀프체크
- 키 없음/오류 → 401, 없는 email → 404, 정상 → 200 + 9개 필드.
