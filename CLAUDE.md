# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**J-Bridge** — Japan IT Engineer Dispatch Platform. 한국인 IT 엔지니어를 교육하여 일본 기업에 파견하기 위한 LMS.

**Core features:**
- Dispatch Readiness Dashboard (5축 레이더 차트)
- Japanese Curriculum (JLPT prep + IT/Business Japanese)
- Programming Curriculum (Algorithm + SI Project)
- Quiz & Coding Exercise system with auto-grading
- AI Code Review (Japan coding convention feedback)
- Login/signup with social login

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

## DB Schema Summary (23 tables)

| Category | Tables |
|---|---|
| User & Skills (7) | profiles, japanese_skills, coding_skills, attitude_culture_skills, dispatch_readiness_scores, enrollments, lesson_progress |
| Content (7) | courses, lessons, lesson_resources, coding_problems, coding_test_cases, projects, project_requirements |
| Quiz (5) | quizzes, quiz_questions, quiz_question_options, quiz_attempts, quiz_answers |
| Code Submission (2) | code_submissions, code_reviews |
| Japanese Content Bank (2) | jlpt_vocabulary, it_glossary |

**5-Axis Radar Chart:** JLPT → IT Japanese → Core Programming → Framework → Attitude/Culture

## Project Status

Pre-implementation phase — planning documents (PRD.md, DB_Schema.md, project_rules.md). No application code has been written yet.
