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

### 1. The CS hub still depends on broken navigation copy for visible category labels and descriptions
- Severity: medium
- Evidence:
  - [navigation.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\navigation.ts)
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\page.tsx:7)
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\page.tsx:16)
- Explanation:
  - The CS hub uses `categoryChildren['cs']` as its source of title, description, and child-card labels.
  - That reuse is structurally correct, but the existing navigation copy is already corrupted, so the new CS hub inherits the same visible text issues.
- Assessment:
  - This is not a loader bug.
  - It is still a user-facing quality issue in the CS implementation because the new surface was left dependent on broken source text.

### 2. The Japanese/Korean switching feature works, but it is only local UI state
- Severity: medium
- Evidence:
  - [LessonContentToggle.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\ui\LessonContentToggle.tsx)
  - [CsStaticLessonPage.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsStaticLessonPage.tsx:32)
- Explanation:
  - The language toggle switches the rendered lesson body between `contentJa` and `contentKo`.
  - However, the selected language is not reflected in URL params, search params, or persisted state.
  - Refreshing the page or sharing the lesson URL does not preserve the chosen language.
- Assessment:
  - The feature is implemented and usable.
  - But from a website-flow perspective it is still a lightweight toggle, not a fully integrated language state.

### 3. The static CS hub was introduced, but the relationship with the legacy quiz flow is still only partially organized
- Severity: medium
- Evidence:
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\page.tsx)
  - [CsTestBlock.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\components\cs\CsTestBlock.tsx)
  - [quiz/page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\cs\quiz\page.tsx)
- Explanation:
  - The CS hub is now lesson-centric.
  - The older quiz system still exists and is still reachable as a separate assessment flow.
  - This is not a direct contradiction, but the user-facing information architecture is not fully explained or unified yet.
- Assessment:
  - No immediate functional conflict is visible.
  - The product flow is still split between “static lesson learning” and “legacy quiz surface” without a strong bridge.

### 4. Subject ordering in the CS loader is currently implicit
- Severity: low
- Evidence:
  - [cs-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\cs-content.ts:155)
- Explanation:
  - `getAllCsSubjectContents()` relies on the object order of `SUBJECT_CONFIG`.
  - The content track already has explicit module ordering in `track.yaml`, but that order is not read by the loader.
- Assessment:
  - This is not a current runtime problem.
  - It is a structural weakness if the content set grows or ordering rules change later.

### 5. Existing shared patterns were reused, but the CS layer was not fully merged into the older course/progress architecture
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
- Type-level verification passed:
  - `tsc --noEmit` completed successfully during self-check.
- The lesson toggle UI contains valid Japanese/Korean labels and the lesson files contain valid Japanese/Korean section headings.

## Self Assessment
- The implementation is functionally viable.
- It is not yet the final polished version of the CS product surface.
- The biggest remaining weaknesses are not loader correctness but:
  - broken inherited navigation copy
  - incomplete language-state integration
  - incomplete explanation of the static lesson flow versus legacy quiz flow

## Suggested Follow-Up Order
1. Fix the CS-visible navigation copy and hub-facing text sources.
2. Decide whether lesson language should be reflected in URL/search params.
3. Clarify or redesign the relationship between static CS lessons and the legacy quiz entry flow.
