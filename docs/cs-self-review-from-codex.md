# CS Self Review From Codex

## Scope
- Author/reviewer: Codex
- Review target: CS static-content implementation added in this branch of work
- Review mode: self-check only, no fixes

## Reviewed Areas
- Static CS content structure
- CS content loader and route wiring
- Japanese default and Korean toggle behavior
- Reuse of existing site patterns
- Alignment with existing website flow

## Findings

### 1. The Japanese/Korean switching feature is now reflected in the lesson URL, but only for the CS static lesson flow
- Severity: low
- Evidence:
  - [LessonContentToggle.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\ui\LessonContentToggle.tsx)
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\lessons\[lessonId]\page.tsx)
  - [CsStaticLessonPage.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsStaticLessonPage.tsx)
- Explanation:
  - The selected lesson language is now reflected in `?lang=ja|ko`, so refresh and URL sharing preserve the CS lesson language state.
  - This improvement is scoped to the CS static lesson surface and is not a site-wide language-state model.
- Assessment:
  - The earlier CS-specific integration gap is resolved.
  - If the product later wants a global language-state pattern, that should be designed centrally rather than inferred from this feature.

### 2. The static CS hub and subject pages now link into the legacy quiz flow, but the overall product model is still dual-track
- Severity: low
- Evidence:
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\page.tsx)
  - [CsStaticSubjectPage.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsStaticSubjectPage.tsx)
  - [quiz/page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\quiz\page.tsx)
- Explanation:
  - The CS hub and each subject page now provide direct links into the quiz list, so the user no longer has to infer that the quiz surface exists separately.
  - Even so, the lesson surface and quiz surface still represent two adjacent models rather than one fully unified progression model.
- Assessment:
  - The bridge is now adequate for navigation.
  - A deeper product unification would still be a later design task, not a blocker.

### 3. Subject ordering in the CS loader is now explicit
- Severity: resolved
- Evidence:
  - [cs-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\cs-content.ts)
- Explanation:
  - The loader now uses an explicit `SUBJECT_ORDER` array instead of relying on JavaScript object entry order.
- Assessment:
  - This issue is closed.

### 4. Existing shared patterns were reused, but the CS layer is still not fully merged into the older course/progress architecture
- Severity: low
- Evidence:
  - [CsStaticSubjectPage.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsStaticSubjectPage.tsx)
  - [CsStaticLessonPage.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsStaticLessonPage.tsx)
  - [cs-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\cs-content.ts)
- Explanation:
  - The implementation reuses `Card`, `EmptyState`, and the shared markdown rendering path.
  - But it does not fully integrate with the older progress-aware or course-backed structures.
  - In practice this means the CS lesson system is a parallel static layer rather than a full conversion of the old CS product model.
- Assessment:
  - This was an intentional tradeoff for speed and separation.
  - It still means “existing website logic compliance” is partial, not complete.

## What Looks Correct
- Static CS content is now present across all intended subjects.
- The CS route structure is connected to filesystem-based lesson loading.
- Japanese lesson bodies and Korean alternate lesson bodies are both loaded correctly.
- CS lesson metadata now includes normalized extraction fields and difficulty values.
- CS lesson URLs can preserve `lang=ja|ko` state.
- Type-level verification passed:
  - `tsc --noEmit` completed successfully during self-check.
- The lesson toggle UI contains valid Japanese/Korean labels and the lesson files contain valid Japanese/Korean section headings.

## Self Assessment
- The implementation is functionally viable.
- The main correctness issues found in self-review are now resolved.
- The biggest remaining weakness is architectural rather than local implementation detail:
  - CS still lives as a parallel static lesson layer rather than a full course/progress integration.

## Suggested Follow-Up Order
1. Decide whether CS should remain a static sidecar system or be merged into the course/progress model.
2. Update the CS work-instruction document so its language/file-structure assumptions match the implemented direction.
3. If needed, add stronger progress-aware bridges between lesson reading and quiz-taking.
