# Development Practical Skills Cross Review

## Summary
- Review target: `development practical skills`
- Reviewer: Codex
- Review basis:
  - `docs/dev-practical-skills-implementation-instruction.md`
  - current implementation under `src/app/(main)/dev`, `src/components/dev`, `src/lib/dev-course.ts`, `src/lib/dev-content.ts`, `src/lib/dev-quiz.ts`
- Review purpose:
  - verify how far Claude Code brought `/dev` toward the intended CS-grade product structure
  - separate already-fixed areas from the remaining structural gaps

## Overall Verdict
- The rebuild is partially successful.
- `/dev` is no longer in its original mixed and under-structured state.
- Hub, subject-level progress, and mentee quiz unlock logic are substantially improved.
- The largest remaining gaps are:
  - lesson experience is still markdown-first instead of guided learning
  - quiz IA is still not fully subject-based across all 8 dev subjects

## What Improved Since Last Review

### 1. `/dev` hub is now learning-first enough
- Status: substantially improved
- Evidence:
  - `src/app/(main)/dev/page.tsx`
- What changed:
  - dismissible `GuideCard` exists
  - subject cards are the main surface
  - `/dev/quiz` is a separate CTA
  - `DevTestBlock` is no longer foregrounded on the hub
- Assessment:
  - This is directionally correct and much closer to the CS hub model.

### 2. Dev progress has a dedicated subject-based layer
- Status: fixed
- Evidence:
  - `src/lib/dev-course.ts`
  - `src/app/actions/dev-progress.ts`
- What changed:
  - `dev_course_progress`
  - `dev_lesson_progress`
  - subject progress is computed from lesson completion
- Assessment:
  - This matches the intended architecture and removes the need to force dev content into legacy course tables.

### 3. Subject pages are now course-like rather than raw grouped archives
- Status: substantially improved
- Evidence:
  - `src/components/dev/DevStaticSubjectPage.tsx`
- What changed:
  - title and description
  - progress bar
  - completed lessons / total lessons
  - lesson list with completion states
  - subject-level test CTA
- Assessment:
  - The page now behaves like a subject course surface.
  - This area is no longer the highest-priority problem.

### 4. Quiz unlock is now tied to dev subject progress
- Status: substantially improved
- Evidence:
  - `src/app/(main)/dev/quiz/page.tsx`
  - `src/app/(main)/dev/quiz/[quizId]/page.tsx`
  - `src/lib/dev-quiz.ts`
- What changed:
  - mentees are gated by `75%` subject progress
  - mentors/admins bypass the lock
  - list page and direct entry page both use unlock helpers
- Assessment:
  - The product rhythm is now closer to CS.
  - This was a major missing piece and is now mostly in place.

## Remaining Must Fix Findings

### 1. Lesson pages are still not stage-based guided learning pages
- Severity: high
- Evidence:
  - `src/components/dev/DevStaticLessonPage.tsx`
  - `src/app/(main)/dev/lessons/[lessonId]/page.tsx`
- Current problem:
  - lessons still render long-form markdown as the primary learning body
  - the page still exposes learner-facing metadata cards:
    - `Key Points`
    - `Misconceptions`
    - `Check Questions`
    - `Exam Extraction`
- Why it matters:
  - This is still a reading-heavy experience, not the CS-style guided lesson loop.
  - The biggest pedagogical issue from the original review is still unresolved.
- Required direction:
  - replace markdown-first rendering with a stage-based learning panel
  - move long-form markdown into reference/support role
  - reduce the sidebar to a compact summary card only

### 2. Dev content still lacks the `stage.json` lesson structure
- Severity: high
- Evidence:
  - `src/lib/dev-content.ts`
  - current content tree under `data/training-content-factory/content/dev-practical-skills`
- Current problem:
  - the loader reads `mdx` and `meta.json`, but no `stage.json`
  - current exploration did not find a working stage-content path wired into dev
- Why it matters:
  - without explicit stage content, Claude Code improved shell structure but not the core learning design
- Required direction:
  - add `stage.json` per lesson
  - extend `dev-content.ts` to load it
  - render the same instructional step family proven in CS

### 3. Quiz IA is still incomplete and not truly aligned to all 8 dev subjects
- Severity: high
- Evidence:
  - `src/app/(main)/dev/quiz/page.tsx`
  - `src/lib/dev-quiz.ts`
  - `src/app/(main)/dev/quiz/[quizId]/page.tsx`
- Current problem:
  - quiz listing still queries only `quiz_type in ('core_programming', 'framework')`
  - subject mapping currently covers:
    - `java`
    - `javascript`
    - `sql`
    - `spring-boot`
    - `react`
  - it does not yet treat these as first-class quiz subjects:
    - `common-workplace-fundamentals`
    - `python`
    - `nextjs`
- Why it matters:
  - the IA is better than before, but it is still not the promised 8-subject structure
  - learners still do not see a complete subject-by-subject assessment surface
- Required direction:
  - complete the subject-based quiz set for all 8 dev subjects
  - make the list page truly reflect the same subject taxonomy as `/dev`

### 4. Dev quiz subject detection is still title-parsing based
- Severity: medium
- Evidence:
  - `src/lib/dev-quiz.ts`
  - `src/app/(main)/dev/quiz/[quizId]/page.tsx`
- Current problem:
  - `getDevQuizCategoryFromTitle()` and local title parsing are still used to infer category
- Why it matters:
  - this is brittle and can silently break if quiz titles change
  - the product structure should not depend on display strings
- Required direction:
  - move to explicit subject/category mapping driven by stable metadata, not title keywords

## Secondary Findings

### 5. Some `/dev` UI text is still visibly broken
- Severity: medium
- Evidence:
  - `src/app/(main)/dev/page.tsx`
  - `src/components/dev/DevStaticSubjectPage.tsx`
  - `src/app/(main)/dev/quiz/page.tsx`
  - `src/lib/dev-quiz.ts`
- Current problem:
  - several Japanese labels still contain mojibake
- Why it matters:
  - even where structure improved, presentation quality still falls below the CS standard
- Required direction:
  - run a dedicated text-quality pass across `/dev` hub, subject, lesson, and quiz surfaces

### 6. Subject pages are improved, but the CTA still points to a not-yet-complete quiz IA
- Severity: medium
- Evidence:
  - `src/components/dev/DevStaticSubjectPage.tsx`
- Current problem:
  - the subject page now feels like a course, but its test CTA leads into a quiz system that is only partially subject-complete
- Why it matters:
  - the course shell and the assessment shell are not yet fully symmetrical

## Instruction Compliance Check
- `hub`: mostly satisfied
- `subject page`: mostly satisfied
- `progress layer`: satisfied
- `75% unlock`: mostly satisfied
- `lesson stage-based flow`: not satisfied
- `filesystem stage content`: not satisfied
- `subject-based quiz IA across all 8 subjects`: not satisfied
- `UI text quality`: not satisfied

## What Should Be Preserved
- Keep `development practical skills` separate from `CS knowledge`.
- Keep the 8-subject structure:
  - `common-workplace-fundamentals`
  - `java`
  - `javascript`
  - `python`
  - `sql`
  - `spring-boot`
  - `react`
  - `nextjs`
- Keep the dev-specific progress model.
- Keep mentee `75%` unlock and mentor/admin bypass.
- Keep filesystem content as the source of truth.

## Recommended Next Fix Order
1. Convert dev lessons to the same stage-based guided learning model as CS.
2. Add `stage.json` content and extend the dev content loader accordingly.
3. Complete subject-based quiz IA for all 8 dev subjects.
4. Remove title-parsing dependence from dev quiz subject/category mapping.
5. Run a full `/dev` Japanese text cleanup pass.
