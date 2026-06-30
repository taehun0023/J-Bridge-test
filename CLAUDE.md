# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**J-Bridge** — Japan IT Engineer Dispatch Platform. 한국인 IT 엔지니어를 교육하여 일본 기업에 파견하기 위한 LMS.

**Core features:**
- Dispatch Readiness Dashboard (5축 레이더 차트 + Paiza식 코딩 등급 뱃지)
- Japanese Curriculum (JLPT prep + IT/Business Japanese)
- Coding Skill Assessment (Paiza-style S/A/B/C/D rank system)
- Quiz & Coding Exercise system with auto-grading (Judge0)
- Ranking System (3-month seasons, overall + per-category)
- Admin Dashboard (account management, content CRUD, task assignment, feedback)
- AI Code Review (Japan coding convention feedback)
- TTS Audio (Google Cloud TTS, Supabase Storage caching)
- Admin creates accounts for employees (invite-only, no self-signup)

**등급 결과 활용:** 사내 인사 평가 + 파견처 매칭 참고용 (외부 취업 연계 없음)

## Tech Stack

- **Framework:** Next.js 16 (App Router)
- **Language:** TypeScript
- **Runtime:** React 19
- **Styling:** Tailwind CSS 4
- **Backend/DB:** Supabase (Auth, DB, Storage)
- **Chart:** Recharts 3
- **Icons:** Lucide React
- **Supabase SSR:** @supabase/ssr
- **Validation:** Zod 4
- **Code Editor:** @monaco-editor/react
- **Code Execution:** Judge0 (self-hosted API)
- **Data Fetching:** @tanstack/react-query
- **TTS:** Google Cloud Text-to-Speech API

## Build & Dev Commands

```bash
npm install        # install dependencies
npm run dev        # start dev server (localhost:3000)
npm run build      # production build (strict TypeScript checking enabled)
npm run lint       # run linter (eslint 9)
```

## Architecture Guidelines

- Components should be small and separated
- Use intuitive, descriptive variable names
- DB naming: snake_case tables/columns, UUID PK, TIMESTAMPTZ timestamps
- Server Actions in `src/app/actions/` (36 files)
- Database schema details in DB_Schema.md, PRD in PRD.md
- Content sourcing strategy in docs/content_strategy.md
- Architecture analysis in docs/architecture/ (10-part series)

## Project Structure

```
src/
  app/
    (main)/          # 15 route groups (admin, dashboard, coding, japanese, exam, business-literacy, ranking, etc.)
    actions/         # Server Actions (admin/ 9, comprehensive-exam/ 5, root 24 — 36 files total)
    api/             # API routes (tts, admin/tts-precache, judge0 proxy)
  components/        # Shared UI components
  lib/
    supabase/        # Supabase client (server/client)
    judge0/          # Judge0 API client
    code-review/     # Automated code review analyzer
    auth-helpers.ts  # requireAuth, requireAdmin, requireAdminOrMentor
    action-types.ts  # ActionResult, ERR constants
    notification-helpers.ts  # notifyMentorsOf, notifyAdmins, etc.
    env.ts           # Zod-validated server environment variables
  modules/
    scoring/         # 5-axis score calculation (pure functions + DB fetch/write)
```

## DB Schema Summary (107 migrations, 48 tables)

| Category | Tables |
|---|---|
| User & Skills (9) | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress, personal_vocab, shared_vocab_submissions |
| Content (7) | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements |
| Quiz (5) | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers |
| Code Submission (2) | code_submissions, code_reviews |
| Japanese Content (6) | jlpt_vocabulary, jlpt_grammar, jlpt_reading_passages, jlpt_listening_scripts, jlpt_kanji, it_glossary |
| CS Knowledge (1) | cs_terms |
| Coding Rank Exams (3) | coding_skill_exams, coding_exam_problems (junction), coding_exam_attempts |
| Ranking System (2) | ranking_seasons, user_rankings |
| Admin/Mentor (4) | task_assignments, admin_feedbacks, feedback_replies, audit_log |
| Mentor-Mentee & Notifications (2) | mentor_mentee_assignments, notifications |
| Learning & Comprehensive Exam (4) | learning_assignments, exam_cycles, comprehensive_exams, comprehensive_exam_answers |
| Access & Interaction (3) | content_access_requests, question_claims, user_mastered_items |

**5-Axis Radar Chart:** JLPT → IT Japanese → Core Programming → Framework → Attitude/Culture

**Coding Rank:** S > A > B > C > D (Paiza-style, for internal HR evaluation)

## User Roles

| Role | Description |
|---|---|
| admin | 계정 생성/관리, 콘텐츠 CRUD, 과제 배정, 전 사원 조회, 피드백 |
| mentor | 학습 현황 조회, 코드 리뷰, 피드백 |
| mentee | 학습, 시험 응시, 본인 점수/랭킹 확인 |

## DB Connection Credentials

psql 실행 경로: `"C:/Program Files/PostgreSQL/17/bin/psql.exe"`  
항상 `-f <utf8파일>` 방식으로 실행 (일본어 직접 `-c` 전달 금지 → 인코딩 오류).  
**사용자가 psql 실행을 항상 승인함 — 매번 확인 불필요. `"C:/Program Files/PostgreSQL/17/bin/psql.exe" *` 패턴은 자동 허용.**

**Bash 명령에서 `cd` 사용 금지 — 항상 절대경로 사용.** 작업 디렉토리는 이미 프로젝트 루트(`C:/workspace/J-Bridge-test`)로 설정돼 있다. `cd ... && ...` 복합 명령(특히 출력 리다이렉션·`>`·`\o` 포함 시)은 Claude Code의 경로 우회 방지 안전장치 때문에 **매번 권한 프롬프트가 뜬다**(settings.json `permissions.allow`로 못 막음). `cd` 붙이지 말고 파일은 전부 절대경로로 지정할 것. 여러 명령 묶을 땐 `cd` 없이 `;`/`&&`만 사용.

| 환경 | Project ID | Connection String |
|---|---|---|
| **로컬** | `jpjvzlmwzeiyukqqbdit` | `postgresql://postgres:Weavus12345!!@db.jpjvzlmwzeiyukqqbdit.supabase.co:5432/postgres` |
| **테스트** | `nyymasirfrawsxobmfwi` | `postgresql://postgres:Weavus12345!!@db.nyymasirfrawsxobmfwi.supabase.co:5432/postgres` |
| **본서버(prod)** | `wxhyczlwdmeelcshqgci` | `postgresql://postgres:29qOe2JzAwejZ1R0@db.wxhyczlwdmeelcshqgci.supabase.co:5432/postgres` |

**본서버는 명시적 지시 전까지 절대 건드리지 말 것.**  
비밀번호 로테이트 금지 (사용자 정책: 기존 비번 고정 재사용).

## Known Technical Debt

- Auth pattern uses `requireAuth`/`requireAdmin`/`requireAdminOrMentor` helpers (consolidated in Phase 1)

## Model Selection (cost)

- **콘텐츠 생성·검수(JLPT 어휘/문법/한자/독해/청해 시드·감사·교정 등) 서브에이전트는 Sonnet으로 돌린다** (Agent `model: sonnet`). content-curator 같은 대량 생성/검수 작업은 Opus 불필요 — 토큰 절감용. 정말 까다로운 정확성 판정만 필요시 Opus.

## Pitfalls / Lessons (do NOT repeat)

**1. `comprehensive_exams` has NO `created_at` column.** Timestamp columns are `requested_at` (creation, DEFAULT NOW()), `approved_at`, `started_at`, `completed_at`. Querying `.gte('created_at', ...)` / `.order('created_at')` on this table **silently errors** (PostgREST returns `{ data: null }`, no throw) → looks like "0 rows". Use `requested_at` for "when assigned".

**2. Verify DB schema/columns before querying — and check the query `error`.** A select with a non-existent column returns null data, not an exception. A `head:true` count can succeed while a full select on the same table returns "0 rows" → that mismatch means a bad column, NOT empty data. Never report "0 rows / data missing / DB wiped" without confirming via `select('*')` or a count, and always destructure `{ data, error }` and check `error` in diagnostic scripts.

**3. Don't claim "confirmed / checked" from a query that may have silently failed.** If two independent checks disagree, suspect the query, not the data.

**4. Implement the user's stated spec exactly — don't re-interpret.** E.g. "count goes up only when the assigned exam is taken (after assignment)" means base done/total on the **latest assigned instance's status**, not "any completion this month". If the spec is ambiguous, ask one short question instead of guessing.

**5. JLPT 콘텐츠 레벨(N1~N5)은 Claude 임의 판단 금지 — 권위있는 출처 기준으로 정확히.** 단어/문법/한자의 JLPT 레벨은 추측하지 말고 **사전의 JLPT 태그(jisho.org 등)·공식 단어 리스트** 등 출처로 확정한다. 나쁜 사례: 교차레벨 중복정리 때 "N2 우선" 같은 **임의 규칙**으로 N1 단어(`遂げる`·`覆す`·`免れる`·`怠る` 등)를 N2로 잘못 내림. 레벨 배정·이동은 반드시 출처 확인 후.

**6. 콘텐츠 학습순서(`seq`)는 본방(honban/production) 출력 순서가 절대기준 — 임의 재정렬 금지.** 화면에 표시되는 순번은 콘텐츠별 `seq` 값이며, **본방 페이지에 출력되는 순서가 학습 우선순위**다. 규칙:
- **기존 콘텐츠의 seq·상대순서를 절대 바꾸지 말 것.** 본방 순서와 어긋나면 다음 커밋/배포 때 **학습순서가 전부 꼬인다.**
- **본방에 없는 새 콘텐츠를 추가할 땐 무조건 맨 뒤(현재 레벨 max(seq)+1, +2 …)에 append.** 중간 삽입·전체 재번호(`renumber_seq_gapless` 식 재정렬) 금지 — 이동/추가분이 중간에 끼어들어 기존 순서를 망친다.
- 레벨 이동(예: N2→N1)으로 새 레벨에 들어오는 단어도 "그 레벨에 새로 추가"이므로 **해당 레벨 맨 뒤로** 보낸다(중간 삽입 X).
- 본방 순서 동기화 시 **어휘인데 문법에 있거나 문법인데 어휘에 있는 오분류 항목은 제외**하고 비교한다.
- (교훈) 2026-06-27 중복통합 후 `renumber_seq_gapless.sql`로 전체 재번호 → 이동단어가 옛 seq값 기준으로 레벨 중간에 끼어듦. 이는 위 규칙 위반. 관련: 메모리 [[jlpt-vocab-level-dedup]].

**Mock exam (jlpt-mock) facts:** stored in `comprehensive_exams` with `category='jlpt-mock'`, `subcategory='mock'`, `mock_set_no`, optional `mock_session` (1=1教時 placeholder `passed=false`, 2=合算 final verdict; null=single-session admin-assigned final). JLPT radar axis = passed jlpt-mock level only (legacy `seikatsu` comp exams deprecated/deleted).

**N1 모의고사 구성 (고정 규격):**
- 총 100문항: 言語知識 45문항 + 読解 25문항 + 聴解 30문항
- 문항 번호: Q1~Q45 言語知識, Q46~Q70 読解, Q71~Q100 聴解 (고정)
- 聴解 내부 구성: 問題1 5문항 / 問題2 6문항 / 問題3 5문항 / 問題4 11문항 / 問題5 3문항 (2022.12 개정 기준; 개정 전 6/7/6/13/3=35문)
- 言語知識 내부 구성 (총 45문항):
  - 語彙 Q1~Q25 (25문항): 問題1 漢字読み Q1~Q6(6문) / 問題2 文脈規定 Q7~Q13(7문) / 問題3 言い換え類義 Q14~Q19(6문) / 問題4 用法 Q20~Q25(6문)
  - 文法 Q26~Q45 (20문항): 問題5 文法形式の判断 Q26~Q35(10문) / 問題6 文の組み立て Q36~Q40(5문) / 問題7 文章の文法 Q41~Q45(5문)
- 読解 내부 구성: 問題8 内容理解(短文) 4문 / 問題9 内容理解(中文) 9문(3지문×3문) / 問題10 内容理解(長文) 4문 / 問題11 統合理解 2문 / 問題12 主張理解(長文) 4문 / 問題13 情報検索 2문

## Testing

```bash
npm test           # run vitest unit tests
npm run test:watch # watch mode
npm run test:coverage # coverage report
```

- Vitest 4 configured (`vitest.config.ts`)
- Unit tests in `src/modules/scoring/` (33 tests for axis calculators + utils)

## Project Status

Implementation phase — core features functional. Refactoring Phases 1-4 complete.
- Phase 1 (Quick Wins): error logging, auth-helpers, CLAUDE.md — done
- Phase 2 (Module Extraction): admin/ split, notification-helpers, scoring/ module, comprehensive-exam/ split — done
- Phase 3 (Architecture): ActionResult types, DB indexes, tests, DB_Schema.md update — done
- Phase 4 (Production Readiness): TypeScript strict build (0 errors), Zod env validation, auth type leak fix — done

## Commit & Push Rules

**"커밋해줘" = 커밋 + 해당 환경 remote push까지 한 번에 수행.**  
환경별 push 대상:
- 로컬환경 커밋 → `git push local main`
- 테스트환경 커밋 → `git push testkankyou main`
- 본서버 커밋 → `git push honban main` (명시적 지시 시에만)

커밋만 하고 push를 생략하면 Vercel 배포가 안 되므로 반드시 push까지 완료할 것.

## Behavioral Guidelines

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

Tradeoff: These guidelines bias toward caution over speed. For trivial tasks, use judgment.

### 1. Think Before Coding
Don't assume. Don't hide confusion. Surface tradeoffs.

Before implementing:

State your assumptions explicitly. If uncertain, ask.
If multiple interpretations exist, present them - don't pick silently.
If a simpler approach exists, say so. Push back when warranted.
If something is unclear, stop. Name what's confusing. Ask.
### 2. Simplicity First
Minimum code that solves the problem. Nothing speculative.

No features beyond what was asked.
No abstractions for single-use code.
No "flexibility" or "configurability" that wasn't requested.
No error handling for impossible scenarios.
If you write 200 lines and it could be 50, rewrite it.
Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### 3. Surgical Changes
Touch only what you must. Clean up only your own mess.

When editing existing code:

Don't "improve" adjacent code, comments, or formatting.
Don't refactor things that aren't broken.
Match existing style, even if you'd do it differently.
If you notice unrelated dead code, mention it - don't delete it.
When your changes create orphans:

Remove imports/variables/functions that YOUR changes made unused.
Don't remove pre-existing dead code unless asked.
The test: Every changed line should trace directly to the user's request.

### 4. Goal-Driven Execution
Define success criteria. Loop until verified.

Transform tasks into verifiable goals:

"Add validation" → "Write tests for invalid inputs, then make them pass"
"Fix the bug" → "Write a test that reproduces it, then make it pass"
"Refactor X" → "Ensure tests pass before and after"
For multi-step tasks, state a brief plan:

1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

These guidelines are working if: fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.