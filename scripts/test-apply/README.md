# test-apply — PROD → test RLS 全体同期スクリプト

本섭(PROD) Supabase の RLS 정책 + 활성화 상태를 덤프 서버(test)에 1:1 동기화하기 위한 일회성 SQL 스크립트 모음.

**중요**: 본 디렉터리는 통상 마이그레이션 흐름(`supabase/migrations/`)과 별개. 1회성 동기화 / 응급 보정용.

---

## 배경

test 환경은 PROD 를 `pg_dump` 로 복제했으나, 일부 테이블의 RLS 활성화 / 정책이 누락된 흔적이 발견됨 (`supabase/migrations/00176_enable_missing_rls.sql` 주석 참고). 따라서 다음을 보장하기 위해 본 스크립트를 사용:

- 전체 48 테이블 (`public` 스키마) + `storage.objects` 정책의 동기화
- PROD 의 실제 상태를 진실의 원천으로 삼음
- 멱등 (반복 실행 안전)

---

## 실행 순서 (총 3 단계)

### Step 0 — 선행 조건: PROD 에 보정 스크립트 적용

> **이 단계를 건너뛰면 test 도 PROD 의 누락 상태를 그대로 복제합니다.**

`scripts/prod-apply/2026-05-28_announcement_fix_and_rls.sql` 을 **PROD Supabase Dashboard → SQL Editor** 에서 실행.

→ 이 스크립트는 9개 테이블의 RLS 활성화 + 정책을 정상화 (멱등).

---

### Step 1 — PROD 에서 RLS 추출

1. **PROD Supabase Dashboard → SQL Editor** 열기
2. `01_extract_rls_from_prod.sql` 의 전체 내용을 붙여넣고 실행
3. 결과는 한 컬럼 (`sql`)에 ~수백 줄의 SQL 문자열로 나옴
4. **결과를 모두 선택 → 복사**
   - Dashboard 결과창에서 컬럼 헤더 클릭 → 전체 선택 → Ctrl+C
   - 또는 결과를 CSV/JSON 으로 다운로드 후 컬럼만 추출

추출되는 내용:
- `ALTER TABLE ... ENABLE ROW LEVEL SECURITY;` — RLS 활성 테이블 전체
- `DROP POLICY IF EXISTS ... ON ...;` — 각 정책 (멱등성)
- `CREATE POLICY ... ON ... FOR ... TO ... USING (...) WITH CHECK (...);` — 정책 본문

---

### Step 2 — test 에 적용

1. `02_apply_rls_to_test.sql` 을 에디터로 열기
2. `-- >>> PASTE_BEGIN >>>` 와 `-- <<< PASTE_END <<<` 사이에 Step 1 의 결과를 붙여넣음
3. **test Supabase Dashboard → SQL Editor** 에서 본 파일 전체를 실행
4. 에러 없이 COMMIT 되면 적용 완료

본 파일은 BEGIN/COMMIT 으로 감싸져 있어 중간 실패 시 자동 롤백.

⚠️ **헬퍼 함수** (`is_admin` / `is_mentor` / `is_admin_or_mentor`) 는 본 파일의 `(0)` 섹션에서 `CREATE OR REPLACE` 로 보장됨. PROD 추출 결과에는 포함되지 않으므로 본 파일에 미리 포함.

---

### Step 3 — 앱 동작 확인

test 환경에 적용 후, 다음 시나리오를 로컬 앱 (`npm run dev`) 에서 검증:

| 시나리오 | 기대 결과 |
|---------|-----------|
| 멘티 로그인 → `/dashboard` 진입 | 본인 데이터 표시 |
| 멘티가 다른 멘티의 점수 직접 조회 시도 | RLS 차단 (0 행) |
| 멘티가 `/admin/*` 접근 시도 | 미들웨어/RLS 로 차단 |
| admin 로그인 → `/admin/announcements/new` 에서 공지 작성 | 정상 작성 |
| mentor 로그인 → `/mentor` 멘티 목록 조회 | 본인 담당 멘티 표시 |
| 회귀 점검 | `npm test` 75개 모두 통과 |

---

## 파일 일람

| 파일 | 실행 위치 | 역할 |
|------|----------|------|
| `01_extract_rls_from_prod.sql` | **PROD** | `pg_class` / `pg_policies` 에서 RLS 상태 추출 → 재현 SQL 생성 |
| `02_apply_rls_to_test.sql`     | **test** | 헬퍼 함수 보장 + 추출 결과 적용 (BEGIN/COMMIT) |
| `README.md`                    | —        | 본 문서 |

---

## 알려진 제약 사항

1. **`storage.objects` 정책 권한** — Supabase 가 일부 storage 스키마 권한을 제한할 수 있어, SQL Editor 에서 `CREATE POLICY ON storage.objects` 가 권한 에러로 실패할 수 있음. 실패 시 → Supabase Dashboard → Storage → Policies UI 에서 수동 동기화.

2. **헬퍼 함수 시그니처 변경 위험** — 본 파일의 `is_admin` / `is_mentor` / `is_admin_or_mentor` 정의가 기존과 달라지면 다른 정책이 깨질 수 있음. `scripts/prod-apply/2026-05-28_announcement_fix_and_rls.sql:22-41` 의 정의와 1:1 일치 유지 필수.

3. **트랜잭션 길이** — 정책 수가 많을 경우 (>200개) 단일 BEGIN/COMMIT 으로 묶여 락 시간이 길어질 수 있으나, test 환경이라 영향 미미.

4. **마이그레이션 트래킹 외부** — 본 스크립트는 `supabase/migrations/` 에 포함되지 않음. 동기화 후 추가 마이그레이션은 정상적으로 진행 가능.

5. **재실행 안전성** — 모든 명령이 멱등하므로 반복 실행 가능. 단, PROD 의 정책이 바뀐 후 다시 동기화하려면 Step 1 부터 새로 추출 필요.

---

## 후속 작업 제안 (선택)

본 동기화 후 PROD ↔ test 의 RLS 가 어긋난 원인을 근본적으로 해소하려면:

- **마이그레이션 일원화**: `supabase/migrations/00001~00177` 중 RLS 관련 부분을 점검 → 누락된 `ENABLE ROW LEVEL SECURITY` 가 있다면 신규 마이그레이션으로 보강
- **CI 검증 추가**: PR 시 `pg_policies` 카운트가 마이그레이션 적용 후 예상치와 일치하는지 자동 점검
- **Supabase CLI 도입**: `supabase db diff` 로 마이그레이션 ↔ 실제 DB 의 RLS 차이를 사전 감지
