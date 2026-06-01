# J-Bridge 팀 협업 워크플로 — 팀원 지침서

> 이 문서는 **J-Bridge 레포에 협업으로 참여하는 팀원**을 대상으로 작성되었습니다.
> 매일 어떻게 작업해야 하는지, 무엇을 절대 하면 안 되는지, 막혔을 때 어떻게 대처하는지까지
> "복붙 가능한 명령어" 수준으로 정리했습니다.
>
> 처음 한 번은 **9장까지 전부 통독**한 뒤 작업을 시작하세요.
> 이후로는 "4. 일상 작업 흐름"만 참고하면 됩니다.

---

## 목차

1. [이 문서의 사용법](#1-이-문서의-사용법)
2. [기본 원칙 — 절대 어기면 안 되는 것](#2-기본-원칙--절대-어기면-안-되는-것)
3. [초기 환경 셋업 (1회만)](#3-초기-환경-셋업-1회만)
4. [일상 작업 흐름 (매번 반복)](#4-일상-작업-흐름-매번-반복)
5. [Vercel Preview URL 사용법](#5-vercel-preview-url-사용법)
6. [자주 발생하는 실수와 해결법](#6-자주-발생하는-실수와-해결법)
7. [Claude 에게 작업 지시할 때 가이드](#7-claude-에게-작업-지시할-때-가이드)
8. [코딩 컨벤션 짧은 요약](#8-코딩-컨벤션-짧은-요약)
9. [도움 요청](#9-도움-요청)

부록: [🤖 Claude 에게 보내는 메타 지시 (복사용 박스)](#-claude-에게-보내는-메타-지시-복사용-박스)

---

## 1. 이 문서의 사용법

### 1-1. 너(팀원)의 역할

- **레포 URL**: https://github.com/LawrenceCha/J-Bridge
- **리뷰어/머지 담당**: Lawrence (@LawrenceCha) — 모든 PR은 Lawrence가 merge 합니다
- **너의 작업 범위**:
  - `feature/*` 브랜치에서 작업
  - `dev` 브랜치로 Pull Request (PR) 생성
  - Lawrence 의 리뷰를 받아 merge 되도록 준비
- **너의 작업 범위가 아닌 것**:
  - `main` / `dev` 브랜치에 직접 push (불가능. 막혀 있음)
  - 다른 사람 PR 을 본인이 merge
  - production 배포 (`main` 머지는 Lawrence 가 함)

### 1-2. Claude 에게 이 문서를 주는 법

이 문서 자체를 Claude 에게 첨부하거나, 다음과 같이 짧게 시작합니다:

```
# 너의 컨텍스트
나는 J-Bridge 레포 (https://github.com/LawrenceCha/J-Bridge) 의 팀원이다.
협업 워크플로는 docs/COLLABORATION_WORKFLOW.md 에 정의되어 있다.
특히 마지막 박스의 "Claude 에게 보내는 메타 지시"를 반드시 지켜라.

# 오늘의 작업
[여기에 구체적 요청]
```

→ 이렇게 하면 Claude 가 `main`/`dev` 직접 push 같은 실수를 안 합니다.

---

## 2. 기본 원칙 — 절대 어기면 안 되는 것

> 이 세 가지만 지키면 90% 의 사고가 예방됩니다.

### 원칙 1. `main` 과 `dev` 에는 **절대 직접 push 하지 않는다**

```bash
# ❌ 이런 거 절대 금지
git checkout main
git commit -m "fix"
git push origin main          # ← 막혀 있음. 시도해도 reject

git checkout dev
git push origin dev           # ← 동일. reject
```

이유:
- `main` / `dev` 는 GitHub Branch Protection 으로 잠겨 있음 → push 자체가 거절됨
- Vercel(배포 서비스)이 Lawrence 외 다른 사람의 commit 으로는 배포를 안 함

### 원칙 2. 모든 변경은 `feature/*` 브랜치에서 → `dev` 로 PR

```bash
# ✅ 항상 이 패턴
git checkout dev
git pull
git checkout -b feature/이번-작업-이름
# ... 작업 ...
git push origin feature/이번-작업-이름
# → GitHub UI 에서 PR 생성 (base: dev)
```

### 원칙 3. force push 금지

`git push --force` 또는 `git push --force-with-lease` 모두 **사용하지 않습니다**.
다른 사람 작업이 사라질 수 있어요.

머지/리베이스가 꼬여서 force push 가 필요해 보이면, **그 시점에 Lawrence 에게 물어보세요**.

---

## 3. 초기 환경 셋업 (1회만)

### 3-1. 사전 준비

- [ ] GitHub 계정 보유
- [ ] Lawrence 에게 본인 GitHub username 전달 → repo collaborator 권한 받기
- [ ] **승낙 메일**이 GitHub 에서 오면 수락 클릭
- [ ] Node.js **20.x** 설치 (https://nodejs.org/, LTS 권장)
- [ ] Git 설치 + 본인 이름/이메일 설정 (이미 했다면 스킵)
  ```bash
  git config --global user.name "본인 이름"
  git config --global user.email "본인@example.com"
  ```

### 3-2. 레포 clone

작업 폴더로 이동 후:

```bash
git clone https://github.com/LawrenceCha/J-Bridge.git
cd J-Bridge
```

### 3-3. 의존성 설치

```bash
npm install
```

→ 5~10 분 걸립니다.

### 3-4. 환경변수 받기

Lawrence 에게 **`.env.local` 파일**을 별도로 요청하세요 (보안 정보라 GitHub 에 안 올림).
받은 내용을 프로젝트 루트에 `.env.local` 이라는 이름으로 저장합니다.

> ⚠️ `.env.local` 은 절대 git 에 add 하면 안 됩니다. `.gitignore` 에 이미 포함돼 있으니 명령어로 add 하지만 마세요.

### 3-5. 로컬 동작 확인

```bash
npm run dev
```

→ 브라우저로 http://localhost:3000 접속. 로그인 화면이 보이면 성공.

빌드 한 번 돌려서 타입 에러 없는지도 확인:

```bash
npm run build
```

### 3-6. 검증

```bash
git status        # working tree clean
git branch        # * main 만 표시되면 OK
git remote -v     # origin 이 LawrenceCha/J-Bridge 가리키면 OK
```

---

## 4. 일상 작업 흐름 (매번 반복)

> **이 장이 가장 중요합니다.** 매 작업마다 1~6 단계를 그대로 반복하세요.

### 단계 1. `dev` 최신화

```bash
git checkout dev
git pull origin dev
```

> 처음 한 번은 `dev` 가 로컬에 없을 수 있어요. 그럴 땐:
> `git fetch && git checkout dev`

### 단계 2. `feature/*` 브랜치 생성

브랜치 이름은 작업 내용이 보이게:

```bash
git checkout -b feature/로그인-버그-수정
# 또는
git checkout -b feature/대시보드-차트-추가
```

### 단계 3. 작업 + 커밋

코드 작성 후:

```bash
git status                                # 어떤 파일이 바뀌었는지 확인
git add 변경된파일.tsx 변경된다른파일.ts   # 한 줄로 명시적으로
# (필요시 git add -p 로 부분 staging)
git commit -m "fix: 로그인 후 리다이렉트가 안 되던 문제 수정"
```

커밋 메시지 컨벤션:
- `feat:` 새 기능
- `fix:` 버그 수정
- `refactor:` 동작 변화 없이 코드 정리
- `chore:` 빌드/설정/의존성
- `docs:` 문서만
- `test:` 테스트만

한국어 OK. 영어 OK. 섞어도 OK.

### 단계 4. push 전 자체 검증

```bash
npm run lint           # ESLint 통과 확인
npm run build          # 타입 에러 없는지 확인
npm test               # (선택) 테스트 통과 확인
```

→ 이 3 가지가 **실패한 상태로 push 하지 마세요**. PR 만들어도 CI 에서 빨간색 떠서 어차피 머지 안 됩니다.

### 단계 5. push + PR 생성

```bash
git push origin feature/로그인-버그-수정
```

GitHub 가 출력하는 URL 클릭 → PR 생성 페이지로 이동.

PR 생성 시 **반드시 확인**:
- **base**: `dev` ← ⚠️ **main 이면 안 됨**
- **compare**: `feature/로그인-버그-수정` (본인 브랜치)
- 제목: 커밋 메시지처럼 prefix 사용 (`fix: ...`)
- 본문: 기존 PR 템플릿(`.github/PULL_REQUEST_TEMPLATE.md`)이 자동으로 채워짐 → 빈칸 채우기
- Reviewer: Lawrence(@LawrenceCha) — CODEOWNERS 로 자동 지정될 가능성 있음. 안 되면 수동 추가

### 단계 6. 리뷰 받고 머지 대기

- Lawrence 가 리뷰 → 코멘트 있으면 반영
- 추가 커밋이 필요하면 같은 브랜치에 push (자동으로 PR 에 반영됨)
- 승인되면 **Lawrence 가 merge 버튼을 누름** (본인이 누르지 말 것)

### 단계 7. 머지 후 로컬 정리

```bash
git checkout dev
git pull origin dev
git branch -d feature/로그인-버그-수정      # 로컬 브랜치 삭제
git remote prune origin                    # 원격에서 사라진 브랜치 참조 정리
```

→ 이제 새 작업은 다시 단계 1 부터.

---

## 5. Vercel 배포 환경

J-Bridge 는 **GitLab Flow (Environment Branches)** 방식으로 운영합니다.

| 브랜치 | 환경 | Vercel 프로젝트 | Supabase |
|---|---|---|---|
| `main` | Production (本番) | `edu-cha` (production) | production Supabase |
| `dev` | Staging (検証) | `edu-cha-staging` (test) | staging Supabase |
| `feature/*` | Preview | 각 PR 마다 자동 생성 | staging Supabase (dev 와 동일) |

### 5-1. PR 만들면 Preview 자동 생성됨

`feature/*` 브랜치를 push 하고 `dev` 로 PR 을 만들면, 1~3 분 뒤 PR 본문에 **Vercel bot 코멘트**가 달립니다:

```
✅ Preview deployed
Preview: https://j-bridge-git-feature-xxx-lawrence-chas-projects.vercel.app
```

이 URL 로 접속하면 본인 브랜치 코드가 실제 배포된 상태를 미리 볼 수 있어요.

### 5-2. staging Supabase 사용

`dev` 브랜치와 `feature/*` Preview 는 **staging 용 Supabase 프로젝트**에 연결돼 있습니다.
production 데이터가 아니므로 마음껏 테스트해도 됩니다.

> ⚠️ Preview URL 에서 본 데이터는 실제 사용자 데이터가 아닙니다. production 확인이 필요하면 Lawrence 에게 요청하세요.

### 5-3. dev 머지 후 staging 자동 배포

`feature/* → dev` PR 이 머지되면 `dev` 브랜치 자체가 staging Vercel 에 배포됩니다.
staging URL 에서 통합 확인을 한 뒤, Lawrence 가 `dev → main` PR 을 생성하여 production 으로 승격합니다.

### 5-4. Preview 가 생성 안 되면

- PR 본문에 Vercel 코멘트가 5 분 지나도 안 보임 → Lawrence 에게 핑
- 빌드 실패: PR 의 "Checks" 탭에 빨간색 → Vercel 빌드 로그 확인

---

## 6. 자주 발생하는 실수와 해결법

### ❌ 실수 1. 실수로 `main` 에서 작업했다

상황: `git checkout` 안 하고 그냥 코딩했더니 `main` 브랜치였음. 아직 commit 전.

```bash
git status                                  # 어떤 파일이 변경됐는지 확인
git stash                                   # 변경사항 임시 보관
git checkout dev
git pull origin dev
git checkout -b feature/원래-하려던-작업
git stash pop                               # 변경사항 복원
# 이제 정상 흐름대로 작업 계속
```

이미 commit 했다면:

```bash
# 마지막 1개 커밋만 다른 브랜치로 옮기는 경우
git branch feature/원래-하려던-작업          # 현재 위치(main)에 새 브랜치 표시
git reset --hard origin/main                # main 을 원격 상태로 되돌림
git checkout feature/원래-하려던-작업        # 옮긴 작업이 이 브랜치에 살아 있음
```

### ❌ 실수 2. 실수로 `dev` 에 직접 commit 했다

해결: 실수 1 과 동일한 절차. `main` → `dev` 로만 바꿔 읽으면 됨.

### ❌ 실수 3. push 하려는데 reject 됨 — "permission denied" 또는 "protected branch"

- 본인이 `main` 또는 `dev` 에 push 시도한 경우 → branch protection 작동. **이게 정상.**
- `feature/*` 인데도 reject → repo collaborator 권한이 안 받아진 것. Lawrence 에게 확인.

### ❌ 실수 4. 머지 충돌 (Conflict)

PR 페이지에서 "This branch has conflicts that must be resolved" 라고 뜸.

로컬에서 해결:

```bash
git checkout feature/내-브랜치
git fetch origin
git merge origin/dev                       # dev 최신을 내 브랜치로 가져오기
# 충돌 파일 표시됨 → 에디터로 열어서 <<<<<<< ======= >>>>>>> 마커 보고 정리
git add 해결한파일.tsx
git commit -m "chore: resolve conflict with dev"
git push origin feature/내-브랜치
```

> rebase 도 가능하지만 입문자에게는 `merge` 가 더 안전. 충돌 해결 후 push 가 깔끔하게 됩니다.

### ❌ 실수 5. `feature/*` 브랜치가 너무 오래 돼서 `dev` 와 많이 벌어짐

```bash
git checkout feature/내-브랜치
git fetch origin
git merge origin/dev
# 충돌 있으면 위 단계 4 처럼 해결
git push origin feature/내-브랜치
```

작업이 3~4 일 이상 길어지면 **하루에 한 번씩** 이렇게 dev 를 흡수하세요. 그러면 마지막에 한꺼번에 충돌 폭탄을 피할 수 있어요.

### ❌ 실수 6. `.env.local` 을 실수로 commit 했다

**즉시 Lawrence 에게 알리고**, 다음 명령으로 staging 에서 제거:

```bash
git rm --cached .env.local
git commit -m "chore: remove .env.local from tracking"
git push origin feature/내-브랜치
```

이미 push 했다면 Supabase / Google TTS API 키 회전이 필요할 수 있음. Lawrence 가 처리.

### ❌ 실수 7. `npm run build` 가 안 되는데 원인 모르겠음

1. `node --version` 으로 v20.x 인지 확인
2. `rm -rf node_modules .next && npm install` 로 초기화
3. 다시 `npm run build`

여전히 안 되면 에러 메시지 전체를 그대로 Lawrence 에게 공유.

---

## 7. Claude 에게 작업 지시할 때 가이드

### 7-1. 권장 프롬프트 패턴

```
# 컨텍스트
이 레포는 J-Bridge 입니다. 협업 워크플로는 docs/COLLABORATION_WORKFLOW.md 참고.
- main / dev 직접 push 금지
- 모든 작업은 feature/* 브랜치 → dev 로 PR
- force push 금지

# 작업
[구체적 요청. 예: "src/app/(main)/dashboard/page.tsx 의 차트 색상을 #4F46E5 로 변경해줘"]

# 검증
- npm run lint
- npm run build
- 변경 사항을 보여줘
```

### 7-2. Claude 에게 절대 시키면 안 되는 것

다음 동작은 **명확히 금지**하거나, 사용자 본인이 직접 실행하세요:

- `git push origin main` / `git push origin dev`
- `git push --force` / `git push -f`
- `git reset --hard origin/main` 같은 destructive 명령
- `.env*` 파일을 git add 하는 것
- DB 마이그레이션을 직접 SQL 로 실행 (반드시 `supabase/migrations/` 폴더에 마이그레이션 파일 추가)
- `npm run dev` 같은 장기 실행 명령을 background 로 띄우고 잊는 것

### 7-3. 작업 지시 시 항상 포함하면 좋은 것

- 변경할 파일의 **경로** (예: `src/app/(main)/dashboard/page.tsx`)
- 변경의 **의도** (왜 바꾸는지)
- 영향받는 다른 곳에 대한 **걱정** (예: "이 컴포넌트가 다른 페이지에서도 쓰이는지 먼저 확인해줘")

---

## 8. 코딩 컨벤션 짧은 요약

자세한 규칙은 `CLAUDE.md` 의 "Behavioral Guidelines" 섹션 참고. 핵심만:

| 항목 | 규칙 |
|---|---|
| 언어 | TypeScript strict mode (any 피하기) |
| 컴포넌트 | 작게 분리. 한 파일에 다 몰지 않기 |
| 코멘트 | 한국어 OK. **WHAT 설명 금지**, WHY 만 작성 |
| 폴더 | Server Actions → `src/app/actions/` |
| DB 네이밍 | snake_case 테이블/컬럼, UUID PK, TIMESTAMPTZ |
| DB 변경 | 반드시 `supabase/migrations/` 에 마이그레이션 파일로 |
| 환경변수 | 추가 시 `src/lib/env.ts` 의 Zod 스키마도 함께 수정 |
| 인증 헬퍼 | `src/lib/auth-helpers.ts` 의 `requireAuth` / `requireAdmin` 재사용 |
| 알림 헬퍼 | `src/lib/notification-helpers.ts` 의 `notifyMentorsOf` 등 재사용 |

테스트는 Vitest:
```bash
npm test               # 1회 실행
npm run test:watch     # watch 모드
npm run test:coverage  # 커버리지
```

---

## 9. 도움 요청

### 막혔을 때

1. **에러 메시지를 통째로** 복사해서 Claude / Lawrence 에게 공유
2. `git status`, `git log --oneline -5` 결과도 함께
3. 어떤 명령을 실행했고 무엇을 기대했는지 짧게

### PR 본문 질문 태그

PR 본문에 `[질문]` 또는 `[doubt]` 표기를 남기면 Lawrence 가 우선적으로 답합니다.

### 연락처

- GitHub: @LawrenceCha (이슈 또는 PR 멘션)
- (사내 채널은 별도 안내)

---

## 🤖 Claude 에게 보내는 메타 지시 (복사용 박스)

> 본 작업을 Claude 와 함께 진행할 때, 다음 박스를 그대로 복사해서 Claude 첫 메시지에 붙여 넣으세요.

```markdown
# 🤖 이 작업을 도와주는 Claude 에게

당신은 J-Bridge 레포에 협업으로 참여한 팀원의 작업을 도와야 합니다.
다음 규칙을 반드시 지키세요.

1. **`main` 또는 `dev` 브랜치에 직접 commit / push 금지**. 항상 `feature/*` 브랜치에서 작업.
2. **force push 금지** (`--force`, `--force-with-lease` 모두). 머지가 꼬이면 사용자에게 확인.
3. PR 생성은 항상 `base = dev` 로. main 으로 PR 만들지 말 것.
4. 커밋 메시지 접두어 컨벤션 준수: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`. 본문은 한국어 OK.
5. `.env*` 파일을 `git add` 하지 말 것. 비밀이 들어 있습니다.
6. 환경변수 추가/변경 시 `src/lib/env.ts` 의 Zod 스키마도 함께 수정.
7. push 전에 항상 `npm run lint` + `npm run build` 둘 다 통과 확인.
8. DB 스키마 변경은 `supabase/migrations/` 에 새 마이그레이션 파일 추가하는 방식으로만. 직접 SQL 실행 금지.
9. `git reset --hard`, `git clean -f`, `git branch -D` 같은 destructive 명령은 사용자에게 사전 확인.
10. 막혔거나 불확실하면 작업 중단하고 사용자에게 물어볼 것. 추측으로 진행하지 말 것.
11. `docs/COLLABORATION_WORKFLOW.md` 의 4 장 "일상 작업 흐름" 절차를 그대로 따르세요.
12. `CLAUDE.md` 의 Behavioral Guidelines (Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution) 도 함께 준수.
```

---

## 마치며

이 문서는 **시작 가이드**입니다. 운영하면서 새로운 시나리오(예: 핫픽스, 큰 리팩토링, 외부 라이브러리 도입)가 생기면 PR 로 이 문서를 보강해주세요.

질문/제안은 언제든 환영합니다. 좋은 협업 시작합시다!
