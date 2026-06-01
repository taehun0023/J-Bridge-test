# J-Bridge GitLab Flow — 셋업 가이드 (Lawrence 전용)

> 본 문서는 **저장소 운영자 (Lawrence)** 가 dev/main 환경 분리 + Vercel 다중 프로젝트 + GitHub Actions Secrets 를 한 번에 셋업하기 위한 체크리스트입니다.
> 팀원용 일상 가이드는 [docs/COLLABORATION_WORKFLOW.md](./COLLABORATION_WORKFLOW.md) 참조.

---

## 0. 전체 구조

```
feature/*  ──PR──►  dev (staging)  ──PR──►  main (production)
                       │                       │
                       ▼                       ▼
              Vercel "edu-cha-staging"   Vercel "edu-cha"
              Supabase staging project   Supabase production project
```

- **CI** (`.github/workflows/ci.yml`): `main`, `dev` push/PR 모두에서 lint + test + build 검증
- **Dependabot**: `dev` 브랜치로 PR 생성 (`.github/dependabot.yml`)
- **CODEOWNERS**: 모든 변경에 Lawrence 자동 reviewer 지정
- **NAS 배포**: 본 흐름과 별개 — 수동 (`docs/DEPLOYMENT_NAS.md`)

---

## 1. 브랜치 생성 & 보호 설정

### 1-1. dev 브랜치 생성 (1회만)

로컬에서:

```bash
git fetch origin
git checkout -b dev origin/main
git push -u origin dev
```

### 1-2. GitHub Branch Protection 룰

**GitHub → Settings → Branches → Add branch protection rule** 에서 다음 두 룰을 설정.

#### main 보호 룰
- Branch name pattern: `main`
- ☑ Require a pull request before merging
  - ☑ Require approvals: **1** (Lawrence)
  - ☑ Require review from Code Owners
  - ☑ Dismiss stale pull request approvals when new commits are pushed
- ☑ Require status checks to pass before merging
  - ☑ Require branches to be up to date before merging
  - Status checks: `lint-and-test`, `build`
- ☑ Require conversation resolution before merging
- ☑ Do not allow bypassing the above settings (admins 포함)
- ☐ Allow force pushes — **OFF**
- ☐ Allow deletions — **OFF**

#### dev 보호 룰
- Branch name pattern: `dev`
- 위 main 룰과 **동일하게** 설정
- ☑ Allow specified actors to bypass — **Lawrence 본인만** (긴급 hotfix용)

### 1-3. 옛 브랜치 정리

```bash
# 원격에 남은 feature/dev 삭제 (있다면)
git push origin --delete feature/dev

# 로컬에서 사라진 원격 브랜치 참조 정리
git remote prune origin
```

---

## 2. Vercel 프로젝트 셋업

### 2-1. Production (기존)

이미 운영 중인 `edu-cha` 프로젝트 — **Production Branch 가 `main` 인지 확인.**

Vercel Dashboard → Project `edu-cha` → Settings → Git:
- Production Branch: **`main`**
- Auto-deploy: ON
- (만약 "Staged" 상태로 멈춘다면) **Deployment Protection → Production Auto-promote** 활성화

### 2-2. Staging (신규) — 太勳 유저 담당

태훈 유저가 Vercel 에 새 프로젝트 생성:

1. Vercel Dashboard → **Add New** → **Project** → Import `LawrenceCha/J-Bridge`
2. Project Name: `edu-cha-staging` (또는 `j-bridge-staging`)
3. **Settings → Git → Production Branch**: `dev`
   - 이렇게 하면 `dev` 푸시가 staging 의 "production" 으로 배포됨
4. **Settings → Environment Variables** 에 staging Supabase 키 등록:

| Key | Environment | Value |
|---|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | Production, Preview | staging Supabase URL |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Production, Preview | staging anon JWT |
| `SUPABASE_SERVICE_ROLE_KEY` | Production, Preview | staging service role JWT |
| `JUDGE0_API_URL` | Production, Preview | staging Judge0 URL (또는 prod 공유) |
| `JUDGE0_API_KEY` | Production, Preview | (필요시) |
| `GOOGLE_CLOUD_TTS_API_KEY` | Production, Preview | (별도 키 또는 prod 공유) |

### 2-3. Preview 동작 확인

`feature/*` 브랜치를 push 후 PR(base: dev) 생성 → Vercel bot 이 Preview URL 코멘트.
이 Preview 는 staging 프로젝트의 환경변수를 사용 (= staging Supabase 사용).

---

## 3. GitHub Actions Secrets

### 3-1. 현재 사용 중인 시크릿 (CI 빌드 검증용)

`.github/workflows/ci.yml` 이 빌드시 사용:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`

이 두 키는 **production Supabase 값** 으로 등록돼 있어도 무방 (CI 는 컴파일만 검증).

### 3-2. 시크릿 추가가 필요한 경우

만약 향후 다음 워크플로를 추가한다면 시크릿이 더 필요해집니다:

- **Staging 통합 테스트** (CI 에서 staging Supabase 에 실제 SQL 던지기): `TEST_SUPABASE_URL`, `TEST_SUPABASE_ANON_KEY`, `TEST_SUPABASE_SERVICE_ROLE_KEY`
- **자동 배포 워크플로** (Vercel CLI 로 push): `VERCEL_TOKEN`, `VERCEL_ORG_ID`, `VERCEL_PROJECT_ID`

> 현재는 Vercel Git Integration 이 자동 배포를 처리하므로 위 시크릿들은 **불필요**.
> 즉, 태훈 유저의 staging Supabase 키는 **Vercel Environment Variables 에만** 넣으면 충분 (GitHub Secrets 에는 추가 불필요).

### 3-3. 시크릿 추가 절차

(만약 위 3-2 케이스가 필요해질 때):

GitHub → Settings → Secrets and variables → Actions → **New repository secret**

- Name: `TEST_SUPABASE_URL`
- Value: (태훈 유저 제공)

이후 `ci.yml` 에 해당 시크릿을 참조하는 step 추가.

---

## 4. Dependabot 설정 확인

`.github/dependabot.yml` 은 이미 `target-branch: "dev"` 설정.
**dev 브랜치 생성 직후** dependabot 이 정상 동작하는지 확인:

- GitHub → Insights → Dependency graph → Dependabot 탭
- 다음 월요일 09:00 JST 자동 실행, 또는 수동 트리거 가능

---

## 5. CODEOWNERS

`.github/CODEOWNERS` 는 이미 `* @LawrenceCha` 로 설정 — 추가 작업 없음.

Branch protection 의 "Require review from Code Owners" 와 함께 작동하면, 모든 PR 이 자동으로 Lawrence 에게 리뷰 요청됩니다.

---

## 6. 검증 절차

셋업 완료 후 다음 시나리오로 동작 확인:

### 6-1. feature → dev 흐름

1. 로컬에서 `git checkout -b feature/test-flow dev` (dev 기반 분기)
2. 더미 변경 (예: README 1줄 추가) → 커밋 → push
3. GitHub UI 에서 PR 생성, **base: `dev`**, compare: `feature/test-flow`
4. Vercel bot 이 1~3분 내 Preview URL 코멘트 ← **여기서 staging Supabase 연결 확인**
5. CI 가 lint-and-test + build 통과
6. Lawrence 머지 (Squash and merge 권장)
7. 머지 직후 `edu-cha-staging` Vercel 이 dev 빌드 → staging URL 갱신 확인

### 6-2. dev → main 흐름

1. dev 에 변경이 누적된 시점에 GitHub UI 에서 PR 생성
   - base: `main`, compare: `dev`
2. PR 본문에 릴리스 노트 작성
3. Vercel Preview 가 또 한 번 생성될 수 있음 (production env로)
4. CI 통과 + 본인 승인 후 머지
5. main 의 Vercel 이 production 빌드 → production URL 갱신 확인

### 6-3. 직접 push 차단 확인

```bash
# 일부러 시도 — reject 되어야 정상
git checkout main
echo "test" > test.txt
git add test.txt
git commit -m "should fail"
git push origin main   # ← rejected: protected branch
```

reject 메시지가 안 나오면 branch protection 설정이 안 된 것 — 1-2 절 재확인.

---

## 7. 트러블슈팅

### Vercel 빌드는 됐는데 production URL 이 옛 코드

→ "Production: Staged" 상태로 멈춘 것. Vercel Dashboard → Deployments → 해당 빌드 → **Promote to Production** 클릭.
근본 해결: Settings → Deployment Protection 에서 auto-promote 활성화.

### Dependabot 이 PR 을 안 만듦

→ `dev` 브랜치가 실제로 존재하는지 확인 (`git branch -r | grep dev`).
없으면 본 가이드 1-1 다시.

### feature 브랜치를 main 으로 PR 만들었음

→ GitHub PR 페이지에서 **Edit** 버튼 → base branch 를 `dev` 로 변경. 변경 안 되면 PR 닫고 다시 만들기.

---

## 8. 운영 체크리스트 (월 1회 점검)

- [ ] dev 와 main 의 diff 가 너무 벌어지지 않았는가? (1주 이상이면 dev → main 머지 검토)
- [ ] staging Vercel 의 Supabase 키가 prod 와 섞이지 않았는가?
- [ ] dependabot PR 이 dev 로 잘 들어오고 있는가?
- [ ] 직접 main push 흔적이 git log 에 없는가? (`git log main --first-parent --oneline -20` 의 모든 항목이 "Merge pull request" 로 시작해야 정상)
