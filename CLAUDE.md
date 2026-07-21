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
- TTS Audio (Azure Cognitive Services Neural TTS, Supabase Storage caching)
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
- **TTS:** Azure Cognitive Services Neural TTS (`AZURE_TTS_KEY`/`AZURE_TTS_REGION`; 2026-06-29 Google Cloud TTS에서 교체 — 청해 회화의 화자별 음성(NanamiNeural·KeitaNeural·AoiNeural·DaichiNeural) 지원 목적)

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

**🚫 본방(prod) 마이그레이션 금지 (2026-07-03 사용자 확정).** 본방 DB에 스키마 변경(마이그레이션 = `ALTER TABLE`·`CREATE TABLE`·`DROP`·FK/제약 변경 등 DDL) **직접 적용 절대 금지.** 스키마 변경은 반드시 정규 배포 파이프라인(feature/dev→담당자 머지)·담당자를 통해서만 반영한다. `supabase/migrations/*.sql`을 psql로 본방에 `-f` 실행하지 말 것. (데이터 조작 — seed·값 수정·복원 등 — 은 명시적 지시가 있을 때만 가능하되, DDL은 예외 없이 금지.)

## Known Technical Debt

- Auth pattern uses `requireAuth`/`requireAdmin`/`requireAdminOrMentor` helpers (consolidated in Phase 1)

## Model Selection (cost)

- **콘텐츠 생성·검수(JLPT 어휘/문법/한자/독해/청해 시드·감사·교정 등) 서브에이전트는 Sonnet으로 돌린다** (Agent `model: sonnet`). content-curator 같은 대량 생성/검수 작업은 Opus 불필요 — 토큰 절감용. 정말 까다로운 정확성 판정만 필요시 Opus.
- **개발학습(/dev Java 등) 문제 저작·개선 에이전트 모델은 사용자 지시를 그대로 따른다(가변).** 기본은 Sonnet(2026-07-15 사용자가 Opus→Sonnet로 지시). 사용자가 "오퍼스로 해"/"소넷으로 해"라고 하면 그 즉시 해당 모델로 실행(실행 중이면 중지 후 재실행). 코드 정답·오답 유일성·개념 정확성이 특히 중요할 땐 Opus가 유리하나, 최종 결정은 사용자 지시.

## 확인창 금지 — 무조건 진행 (2026-07-15 사용자 확정)

**진행 방식·모델 선택·서브에이전트 실행 여부 등을 사용자에게 되묻지 말 것. `AskUserQuestion` 확인창 띄우지 말 것 — 사용자 답은 항상 "예스"다.** 합리적 기본값으로 바로 진행한다(콘텐츠 대량 생성·검수 = Sonnet content-curator 서브에이전트). 이전의 "에이전트 실행 전 무슨 작업·어떤 모델 물어보기" 방침은 이 규칙으로 **폐기**한다.

- 예외(기존 규칙 유지): **push·배포·prod DB 변경**은 여전히 명시 지시가 있을 때만(자동 push 금지·본방 마이그레이션 금지 규칙 그대로).
- 진행하며 "무슨 작업·어떤 모델"인지는 **묻지 말고 그냥 알려주고 실행**한다.

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

**N2 모의고사 구성 (2026-07-01 공식 PDF `jlpt.jp/guideline/pdf/n2.pdf` "N2 大問のねらい" 기준 조사):**
- **시험시간(공식):** 言語知識(文字·語彙·文법)·読解 **105분** + 聴解 **50분** = 155분 (N1과 동일한 2교시 방식; N1은 165분).
- **합격(공식):** 총 180점, 종합 90점↑ AND 각 구분(言語知識/読解/聴解) 19점↑.
- **大問 유형(공식):** N1과 거의 동일하나 文字·語彙에 **問題2 表記·問題3 語形成 추가**(N1엔 없음), 読解 大問번호 問題10~14.
- **문항수(공식 小問数 목安 — 출처: 공식 가이드북 `jlpt.jp/reference/pdf/guidebook1e.pdf` 「N2 大問のねらい」 표. 가이드북 명기: "毎回の試験で出題する小問数の目安で、実際の出題数は多少異なる場合がある"):**
  - 文字·語彙 Q1~32 (32문): 問題1 漢字読み 5 / 問題2 表記 5 / 問題3 語形成 5 / 問題4 文脈規定 7 / 問題5 言い換え類義 5 / 問題6 用法 5
  - 文法 (22문): 問題7 文法形式の判断 12 / 問題8 文の組み立て 5 / 問題9 文章の文法 5
  - 読解 (21문): 問題10 内容理解(短文,200字) 5 / 問題11 内容理解(中文,500字) 9 / 問題12 統合理解(計600字) 2 / 問題13 主張理解(長文,900字) 3 / 問題14 情報検索(700字) 2
  - 聴解 (32문): 問題1 課題理解 5 / 問題2 ポイント理解 6 / 問題3 概要理解 5 / 問題4 即時応答 12 / 問題5 統合理解 4
  - 대략 합계 ~107문 (회차별 변동). 무료 問題例集(샘플)은 유형별 예시만 있고 전체 문항수는 미기재 → 정확 문항수는 公式問題集(유료) 기준. 출처: [[jlpt-n1-exam-format]] 와 동일 방식.

## 개발 학습 문제(/dev Java 등) 제작 규칙

`data/training-content-factory/content/dev-practical-skills/modules/*/lessons/*.stage.json`(문제)·`*.mdx`/`*.ko.mdx`(참고노트) 작성·수정 시 **반드시 준수**. 추출본: `exports/DEV-JAVA-01_...md`.

**핵심 원칙 — 참고노트에서 가르친 건 문제로 출제한다.**
- 학습 목표·번호 붙은 본문·`참고:` 항목·`자주 하는 실수` 핵심·예제에서 새로 소개한 문법/메서드는 **모두 최소 1회 확인 문제의 정답 대상**으로 등장시킨다.
- **출제 인정**: 객관식 정답 직접 선택 / 코드 빈칸 직접 입력 / 실행결과·오류 직접 판단 / 개념 차이 직접 선택. **불인정**: 해설·오답보기·완성 예제 코드·다른 파트에만 등장, 정답 몰라도 풀리는 장식성 코드.
- 비슷한 기능의 차이(toUpperCase↔toLowerCase, nextInt↔nextLine, indexOf 찾음↔-1 등)는 각각 출제. 오류 발생조건·종류, 반환값·자료형·유효범위 규칙도 출제.

**문제 구성**: 파트당 **최소 8문제**, 코딩+객관식 혼합(문법작성·실행결과예측·오류판단·개념비교 균형). 한 문제=한 핵심 포인트(과도한 결합 금지, 기초↔응용은 별도 문제 가능). 문제 추가 시 이후 번호·**파트 상단 문제수(코딩·객관식)**·**문서 상단 총문제수** 전부 갱신(추출본 헤더는 동적계산이라 자동).

**문제 순서**: 참고노트 수업 순서와 동일(개념→기본문법→코드작성→결과예측→오류→응용→종합). **아직 설명 안 한 문법을 앞 파트 문제에 먼저 내지 않는다**(필요하면 참고노트에 먼저 설명·예제 추가).

**중복 방지**: 코드·정답·질문목적이 같으면 중복 → 삭제하거나 다른 학습포인트로 변경. 같은 메서드 같은 동작 반복 금지. 유지하려면 학습목적이 명확히 달라야.

**객관식**: 정답 하나만. 선택지는 비교가능 형태. 예외 있는 규칙 단정 금지(❌"정수 담는 기본형은?" → ✅"일반적인 정수 20을 담을 때 주로 쓰는 기본형은?" = int).
- **해설에서 선택지를 A/B/C letter로 지칭 금지 — 내용으로 지칭한다.** 앱은 선택지를 화면에서 무작위 셔플하고 라벨을 **표시 위치**(`OPTION_LABELS[optIdx]`) 기준으로 붙이므로, 저장된 `id`(A/B/C)는 학습자가 보는 라벨과 다르다. ❌"A처럼 자동 제공되는 것도 아니다" → ✅"기본 생성자가 자동 제공되는 것도 아니다". (정답 분산으로 옵션 순서를 섞으면 letter 참조 해설이 전부 어긋난다.)
- **원본 정답 위치를 A/B/C로 분산**(셔플 실패 대비 안전장치). 정답 옵션 텍스트는 correctOptionId가 가리키는 것으로, ja/ko 동일 순열·동일 correctOptionId 유지.

**코딩 문제**: 빈칸 정답 하나로 결정, 토큰 중 정답 정확히 하나. 정답 넣은 코드가 실제 Java로 컴파일·실행되고 출력이 정확한지 **반드시 실제 실행 검증**(로컬 JDK: `javac -encoding UTF-8`, `java -Dstdout.encoding=UTF-8 -Dfile.encoding=UTF-8`; 스니펫은 `public class Main{...}`로 감싸 실행, Scanner는 stdin 주입). import/class/main/static 확인.

**🔴 검수 필수 3축 — 정답만 실행하지 말 것 (2026-07-13, 반복 발생 교훈).** 코딩 문제 QA는 "정답이 실행돼 정답 출력이 나온다" **한 축만으로 불충분**. 아래를 **매번** 자동 검사:
1. **정답 유일성 — 오답 토큰 전수 실행.** 모든 오답 토큰을 빈칸에 넣어 실제 실행해서, **오답이 정답과 같은 출력을 내면(=복수정답) 반드시 오답 교체.** 자주 새는 계열:
   - `print`/`println`/`printf`/`System.out.format` — **한 줄 출력에선 결과가 사실상 동일**(줄바꿈만 다르고 저장 output은 trim). 구분 문제가 아니면 오답은 **컴파일오류 토큰**(`Println`·`printLine`)으로. `System.out.format`은 `printf`와 동일 출력(≠ `String.format`은 반환만).
   - `(int)`/`(char)`/`(short)` 캐스트는 소수버림 결과가 같을 수 있음 → 오답은 `(double)`·`(long)`(int 대입 컴파일오류).
   - `break`/`return`/`System.exit` 은 "루프 뒤 출력 없음"이면 결과 동일 → 루프 뒤 문장(`println("end")`)을 둬 구분하거나 오답 교체.
   - `equals`/`equalsIgnoreCase`/`matches`/`startsWith` 등은 같은 인자엔 다 `true` → 오답은 정수 반환(`compareTo`·`indexOf`)·컴파일오류로.
   - 빈 문자열 `""`·`import java.util.*` 처럼 **문법상 유효한 대체 답**을 오답 토큰으로 두지 말 것.
2. **문구↔코드 정합.** prompt의 "빈칸 N곳/N개/Nつ"가 실제 `[[]]` 개수와 일치. **빈칸 수를 바꾸면 prompt·해설·result.output 동반 갱신**(빈칸 되돌리며 prompt 안 고치는 실수 잦음).
3. **해설 사실성.** 해설의 단정(예: "format은 출력 안 함")이 실제 동작과 일치하는지, 오답 토큰 설명이 그 토큰을 실제 넣은 결과와 맞는지 확인.

**해설**: 정답 이유+주요 오답 이유+실행 흐름+형변환/반환값+오류종류(컴파일/실행중). 해설에 새 핵심개념 도입 금지(도입 시 참고노트+별도문제로).

**오류 표현**: 문법·타입·반환 = `컴파일 오류` / 배열범위·null호출 = `실행 중 오류`(`ArrayIndexOutOfBoundsException`·`NullPointerException`). ko는 전부 `오류`로 통일(`에러` 금지), ja는 `エラー`·`NG` 관용 허용.

**Java 정확성 필수**: 내용비교=`.equals()`·`==`=참조, String 불변(메서드는 새 문자열 반환), 배열 `length`(필드,괄호X)/문자열 `length()`(메서드,괄호O), 첨자 0부터·마지막 `length-1`, int/int=소수버림, double→int 캐스트, float=`F`·큰 long=`L`, printf 정수 `%d`/문자열 `%s`·자동줄바꿈X, `split()`=정규식(특수문자 이스케이프 `"\\."`), nextInt 뒤 nextLine 줄바꿈, 비-void는 모든 경로 return·void는 값반환 불가, 오버로딩=매개변수 개수·타입·**순서**(반환형만 다르면 불가), 로컬변수=선언블록 안에서만.

**참고 내용**: 기본적으로 평가범위 → 출제 안 할 거면 `심화`/`평가 제외`/`이후 과정에서 학습`으로 명시. 표시 없으면 출제.

**파트 연결**: 각 파트 `다음으로`는 실제 다음 파트와 일치. 파트 남았는데 과정종료 문구 금지(종료 문구는 마지막 파트만). 목차=실제 순서.

**ja/ko 이중언어**: 스텝 `id`·순서 ja=ko 일치. **각 문제에 개념(理論) 페어 필수**(모바일 理論↔問題 index 짝). 출력 텍스트는 로케일별(ja 일본어/ko 한국어), 숫자·boolean은 공용.

**변경 후 보고**: 수정 파트, 추가/삭제/교체 문제수, 전후 파트별·전체 문제수, 새 학습개념, 중복제거 여부, 최종 검수결과(구조·수업내용 대응·문제품질 체크리스트).

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

**🚫 자동 push 절대 금지 (2026-07-06 사용자 확정).** 어떤 경우에도 사용자가 명시적으로 **"푸쉬해줘"**라고 할 때만 push한다. "커밋해줘"는 **커밋만** 수행하고 push는 하지 않는다. 코드 변경·커밋·머지 등 어떤 작업이든 끝에 push를 임의로 붙이지 말 것.

**"푸쉬해줘"라고 지시받았을 때만** 해당 환경 remote로 push:
- 로컬환경 → `git push local main`
- 테스트환경 → `git push testkankyou main`
- 본서버 → `git push honban main`

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