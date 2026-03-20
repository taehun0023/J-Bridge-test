# Development Practical Skills Implementation Instruction

## Summary
This document tells Claude Code how to rebuild `/dev` so it matches the CS category in product quality and learning flow, while still remaining a separate category.

The target state is:
- learning-first hub
- course-like subject pages
- step-based lesson pages
- subject-based quiz list
- progress-linked quiz unlock
- filesystem content remains the source of truth

This is not a request for a cosmetic refresh. It is a structural reorganization of the dev learning experience.

## Product Rules
- Keep `development practical skills` separate from `CS knowledge`.
- Do not introduce `dev` as a sub-mode of CS.
- Do not add a separate glossary or terms tab in this phase.
- Do not keep the current `java/javascript` track model for dev quizzes.
- Do not make tests the primary surface on the `/dev` hub.
- Do not stop at UI cleanup. Content flow, quiz flow, and progress flow must all be updated together.

## Target Experience

### 1. Hub: `/dev`
- The hub must mirror the CS hub in product role.
- Show:
  - page title and short description
  - dismissible guide card
  - subject cards for the 8 dev subjects
  - one separate `理解度テスト` button linking to `/dev/quiz`
- Remove:
  - `DevTestBlock` from the hub body
- Guide copy must explain:
  - start from a subject card
  - complete lessons to raise subject progress
  - tests unlock at `75%` subject progress

### 2. Subject pages: `/dev/{subject}`
- Convert each subject page into a course-like page, equivalent in density to the CS subject page.
- Required surface:
  - title
  - description
  - subject difficulty or level summary
  - completed lessons / total lessons
  - progress bar
  - `理解度テスト` button for that subject
  - lesson list with completion states
- Do not keep the current grouped module-card layout as the main learning UI.
- Modules may still exist in data, but the learner-facing page should feel like one subject course, not a static archive.

### 3. Lesson pages: `/dev/lessons/[lessonId]`
- Replace the current read-only markdown-first lesson layout with a guided lesson layout.
- Use the same stage-based lesson model already proven in CS.
- Each lesson should render:
  - short hook
  - concept step(s)
  - mini checks
  - worked example
  - apply check(s)
  - summary
- The long-form markdown body should become reference material, not the primary learning experience.
- The right column should be reduced to a compact summary card.
- Remove learner-facing rendering of:
  - `Misconceptions`
  - `Check Questions`
  - `Exam Extraction`
- Keep exam extraction metadata in content files and loaders for future internal use.

### 4. Quiz pages: `/dev/quiz` and `/dev/quiz/[quizId]`
- Replace the current two-track quiz listing with subject-based quiz listing.
- Required subject categories:
  - `common-workplace-fundamentals`
  - `java`
  - `javascript`
  - `python`
  - `sql`
  - `spring-boot`
  - `react`
  - `nextjs`
- The quiz list must align with the same subject structure shown on `/dev`.
- For mentees:
  - lock quizzes until the corresponding subject progress reaches `75%`
- For mentors and admins:
  - bypass subject locks
- The list page and direct quiz entry page must use the same unlock helper.
- The label should be `理解度テスト`, not `理解度テスト一覧`, on CTA buttons.

## Data and Progress Model

### 1. Content source
- Keep filesystem content under `data/training-content-factory/content/dev-practical-skills/**`.
- Keep `mdx` and `meta.json`.
- Add `stage.json` per lesson for the guided learning flow.

### 2. Lesson stage schema
- Use the same lesson-stage family as CS.
- Supported step types:
  - `concept`
  - `mini_check`
  - `worked_example`
  - `apply_check`
  - `summary`
- This must be explicit sidecar data, not inferred from markdown.

### 3. Progress persistence
- Do not force dev static lessons into legacy DB `courses/lessons`.
- Add a dev-specific progress layer equivalent in role to the CS virtual progress model.
- Recommended tables:
  - `dev_course_progress`
  - `dev_lesson_progress`
- Use one virtual course per dev subject.
- Completion is lesson-based.
- Subject progress is:
  - completed lessons / total lessons
- Quiz unlock is based on that subject progress.

### 4. Route and interface shape
- Keep `/dev/{subject}` as the main subject entry.
- Keep `/dev/lessons/[lessonId]` as the lesson detail route.
- Do not add a new parallel `/courses/dev-*` user-facing route in this phase.
- If a course-like adapter layer is needed internally, use it behind `/dev` routes.

## Content Expansion Rules
- Dev lessons must not remain prose-only.
- Each lesson needs a guided output loop, not just reading notes.
- Minimum lesson composition for converted lessons:
  - 2 concept steps
  - 3 mini checks
  - 1 worked example
  - 2 apply checks
  - 1 summary
- Extra content should go into problems and worked reasoning, not longer prose.
- Prioritize these subjects first:
  1. `common-workplace-fundamentals`
  2. `java`
  3. `javascript`
  4. `sql`
  5. `spring-boot`
  6. `react`
  7. `nextjs`
  8. `python`

## Required Implementation Order
1. Rebuild the `/dev` hub as a learning-first hub.
2. Add subject-level dev progress and unlock helpers.
3. Rebuild subject pages into course-like learning pages.
4. Rebuild dev quiz listing into subject-based test listing with `75%` unlock.
5. Convert dev lesson rendering to stage-based guided learning.
6. Add `stage.json` content files and extend the dev content loader.

## Acceptance Criteria
- `/dev` is a learning hub, not a test-forward hub.
- Every dev subject page shows progress, completion, and a clear lesson list.
- Every dev lesson page uses a guided lesson flow instead of metadata-heavy reading layout.
- Dev quizzes are organized by subject, not by the old two-track split.
- Mentees see subject tests locked below `75%` progress.
- Mentors and admins see no subject lock.
- Content remains filesystem-based and separate from CS.
- `Common Workplace Fundamentals` remains a full first-class subject.
