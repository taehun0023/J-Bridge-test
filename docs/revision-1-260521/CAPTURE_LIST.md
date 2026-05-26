# J-Bridge 수정 1차 (260521) — BEFORE 캡처 가이드

## 목적
노션 [제이브릿지 수정 방안 1차 260521] 작업 전/후 비교용 스크린샷.
이 단계는 **BEFORE (수정 전 현재 상태)** 캡처.

## 저장 위치
```
c:\workspace\J-Bridge\docs\revision-1-260521\screenshots\
  before\   ← 이번 작업에서 채움
  after\    ← 코드 수정 후 채움
  new\      ← 공지사항 등 신규 화면용
```

## 테스트 계정
모두 비밀번호 동일: **`Operation2025!`**

| 역할 | 이메일 |
|---|---|
| 멘티 (mentee) | `operation-menti@jbridge.test` |
| 멘토 (mentor) | `operation-mento@jbridge.test` |
| 공통관리자 (admin) | `operation-kanri@jbridge.test` |

> Supabase 운영 대시보드에서 직접 생성한 계정. `profiles.is_onboarded = true`로 세팅되어 있어야 `/onboarding` 리다이렉트 안 됨.

## 사전 점검 (캡처 시작 전)
- [ ] `npm run dev`가 localhost:3000에서 실행 중인가
- [ ] `.env.local` 환경변수 누락 에러 없는가
- [ ] 위 3개 계정으로 로그인 가능한가 (수동 1회 확인)
- [ ] 멘티 계정에 학습 과제 1건 이상 배정되어 있는가 (`/dashboard/assignments`에서 데이터 보여야 함)
- [ ] 듣기 문제 포함 종합시험이 1건 이상 존재하는가
- [ ] 멘티 계정이 완료한 퀴즈 attempt 1건 이상 있는가 (재시험 버튼 캡처용)

## 캡처 대상 9장

### 1. `01-admin-tasks.png`
- **URL**: `http://localhost:3000/admin/tasks`
- **로그인**: `operation-kanri@jbridge.test` (admin)
- **상태**: 기존 학습 과제 목록이 보이는 상태
- **목적**: #1 학습과제 복수 배포 — 현재 단일 사용자만 받는 화면 캡처
- **뷰포트**: 풀 페이지 (스크롤 포함)

### 2. `02-admin-tasks-form-open.png`
- **URL**: `http://localhost:3000/admin/tasks`
- **로그인**: admin
- **상태**: 페이지 상단 "+ 学習課題配信" (또는 유사) 버튼 클릭하여 **과제 생성 폼/모달이 열린 상태**
- **목적**: 현재 "配分対象"이 **단일선택**임을 보여줘야 함 (복수선택 X)
- **주의**: 폼 안에 보이는 셀렉트박스에 포커스 가도록 캡처

### 3. `03-admin-users.png`
- **URL**: `http://localhost:3000/admin/users`
- **로그인**: admin
- **상태**: 사원 목록 테이블이 보이는 상태
- **목적**: #2-a (멘티 옆 멘토 지정 컬럼 없음), #2-b (자격증 컬럼 없음) 두 가지 누락 동시 캡처

### 4. `04-exam-listening.png`
- **URL**: `http://localhost:3000/exam/[examId]` — 듣기 포함 시험
- **로그인**: `operation-menti@jbridge.test` (mentee)
- **상태**: **시험 시작 직전 화면** 또는 듣기 문제가 등장한 첫 화면
- **목적**: #3 "듣기는 1회만 시청 가능" 경고가 **없는** 상태 캡처
- **examId 찾는 법**:
  - admin으로 `/admin/courses` 또는 종합시험 관리 페이지 진입
  - 또는 DB 직접 조회: `select id, title from comprehensive_exams where ...listening 포함...`

### 5. `05-dashboard-mentee.png`
- **URL**: `http://localhost:3000/dashboard`
- **로그인**: `operation-menti@jbridge.test` (mentee)
- **상태**: 대시보드 메인 진입 직후 (5축 레이더 + 랭킹 카드 둘 다 보이도록 풀스크롤)
- **목적**: #4-b (현재 5축 레이더 표시), #5-c (현재 랭킹 카드 표시) 동시 캡처

### 6. `06-dashboard-admin.png`
- **URL**: `http://localhost:3000/dashboard`
- **로그인**: `operation-kanri@jbridge.test` (admin)
- **상태**: 풀 스크롤
- **목적**: #4-b — 관리자도 현재는 5축 오각형 보이는 상태 캡처 (수정 후엔 제거됨)

### 7. `07-ranking-mentee.png`
- **URL**: `http://localhost:3000/ranking`
- **로그인**: `operation-menti@jbridge.test` (mentee)
- **상태**: 랭킹 페이지 풀 스크롤
- **목적**: #5-a — 현재는 멘티도 랭킹 페이지 접근 가능함을 보여줌 (수정 후 차단)

### 8. `08-assignments-retake-button.png`
- **URL**: `http://localhost:3000/dashboard/assignments`
- **로그인**: mentee
- **상태**: 재시험 요청 버튼이 보이는 화면
- **목적**: #7 — 재시험 요청 기능이 있는 현재 UI 캡처
- **주의**: 재시험 버튼이 안 보이면 mentee가 한 시험을 한번 완료한 상태여야 함

### 9. `09-history-retake-request.png`
- **URL**: `http://localhost:3000/dashboard/history/[attemptId]`
- **로그인**: mentee
- **상태**: 완료된 퀴즈 attempt 상세 화면 (재시험 요청 UI 보이는 상태)
- **목적**: #7 — 재시험 요청 UI 모든 진입점 캡처
- **attemptId 찾는 법**: `select id from quiz_attempts where user_id = (mentee uuid) and completed_at is not null limit 1;`

---

## Playwright MCP 캡처 절차 (Claude가 실행할 때)

1. 브라우저 실행: `playwright_browser_navigate` 또는 동등 도구
2. **뷰포트 1920×1080** (또는 사용자가 보는 일반 데스크탑 사이즈)
3. 각 URL 진입 → 페이지 로딩 완료 대기 (`networkidle`) → 풀 페이지 스크린샷
4. 파일명은 위 표의 이름 그대로
5. 캡처 후 사용자에게 한 장씩 미리보기 가능하면 좋음

## 캡처 실패 시 처리
- 특정 URL에서 데이터가 없어 빈 화면이면 → 캡처 스킵하고 사용자에게 "데이터 부족" 보고
- 로그인 안 되면 → 비밀번호/계정 상태 사용자에게 보고
- 임의로 스킵하지 말고 끝나면 누락 목록 보고

## AFTER 캡처는 별도 단계
이 문서는 **BEFORE 전용**. 코드 수정이 끝난 시점에 동일한 URL/계정으로 `after/` 폴더에 다시 캡처할 예정.
파일명은 `01-admin-tasks.png` 같은 동일한 번호 유지 (비교 쉽게).
