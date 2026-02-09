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
- Admin creates accounts for employees (invite-only, no self-signup)

**등급 결과 활용:** 사내 인사 평가 + 파견처 매칭 참고용 (외부 취업 연계 없음)

## Tech Stack

- **Framework:** Next.js 14 with App Router
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **Backend/DB:** Supabase (Auth, DB, Storage)
- **Chart:** Chart.js + react-chartjs-2
- **Supabase SSR:** @supabase/ssr
- **Validation:** zod
- **Code Editor:** @monaco-editor/react
- **Code Execution:** Judge0 (API)
- **Data Fetching:** @tanstack/react-query

## Build & Dev Commands

```bash
npm install        # install dependencies
npm run dev        # start dev server (localhost:3000)
npm run build      # production build
npm run lint       # run linter
```

## Architecture Guidelines

- Components should be small and separated
- Use intuitive, descriptive variable names
- DB naming: snake_case tables/columns, UUID PK, TIMESTAMPTZ timestamps
- Database schema details in DB_Schema.md, PRD in PRD.md
- Content sourcing strategy in docs/content_strategy.md

## DB Schema Summary (29 tables)

| Category | Tables |
|---|---|
| User & Skills (7) | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress |
| Content (7) | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements |
| Quiz (5) | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers |
| Code Submission (2) | code_submissions, code_reviews |
| Japanese Content Bank (2) | jlpt_vocabulary, it_glossary |
| Coding Rank Exams (2) | coding_skill_exams, coding_exam_attempts (+coding_exam_problems junction) |
| Ranking System (2) | ranking_seasons, user_rankings |
| Admin Features (2) | task_assignments, admin_feedbacks |

**5-Axis Radar Chart:** JLPT → IT Japanese → Core Programming → Framework → Attitude/Culture

**Coding Rank:** S > A > B > C > D (Paiza-style, for internal HR evaluation)

## User Roles

| Role | Description |
|---|---|
| admin | 계정 생성/관리, 콘텐츠 CRUD, 과제 배정, 전 사원 조회, 피드백 |
| mentor | 학습 현황 조회, 코드 리뷰, 피드백 |
| mentee | 학습, 시험 응시, 본인 점수/랭킹 확인 |

## Project Status

Pre-implementation phase — planning documents (PRD.md, DB_Schema.md, project_rules.md, docs/content_strategy.md). DB migrations written, no application code yet.
