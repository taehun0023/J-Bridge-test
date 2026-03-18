# Development Practical Skills Cross Review

## Scope
- Reviewer: Codex
- Review target: `development practical skills`
- Basis:
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md)
  - [agent-a-project-analysis.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\agent-a-project-analysis.md)
- Review mode: no code or content changes, findings only

## Findings

### 1. All lesson metadata are missing required `estimated_read_minutes` and `difficulty`
- Severity: high
- Instruction basis:
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L72)
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L75)
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L76)
- Evidence:
  - [DEV-CWF-01-01.meta.json](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\modules\DEV-CWF-01\lessons\DEV-CWF-01-01.meta.json#L1) contains `lesson_id`, `category`, `subject`, `topic`, `summary`, etc., but not `estimated_read_minutes` or `difficulty`.
  - The loader type [dev-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\dev-content.ts#L16) also does not model those two fields in `DevLessonMeta`.
- Impact:
  - The current metadata does not meet the draft contract for a standard content unit.
  - Later review, filtering, or exam-item curation by difficulty/read-time will require reconstruction from frontmatter or module data.

### 2. Every reviewed lesson fails the required `4 to 6` check-question rule
- Severity: high
- Instruction basis:
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L115)
- Evidence:
  - [DEV-CWF-01-01.meta.json](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\modules\DEV-CWF-01\lessons\DEV-CWF-01-01.meta.json#L17) has only 3 `check_questions`.
  - Repository-wide check across 28 `*.meta.json` files found `min=3`, `max=3`, `badCount=28`.
- Impact:
  - The lessons do not currently satisfy the draft’s embedded question density requirement.
  - This weakens later exam extraction and reduces internal comprehension checks.

### 3. The hub page still foregrounds a separate dev test block instead of making static lessons the primary surface
- Severity: medium
- Instruction basis:
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L8)
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L16)
  - [agent-a-project-analysis.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\agent-a-project-analysis.md#L137)
- Evidence:
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\dev\page.tsx#L4) imports `DevTestBlock`.
  - [page.tsx](C:\Users\zenoa\Desktop\Programming\edu_cha\src\app\(main)\dev\page.tsx#L29) renders that block directly on the hub.
- Impact:
  - This does not create an `understanding test` subject, so it is not a direct hard violation.
  - But it does conflict with the stated direction that static explanatory lessons should be the primary learning surface.

### 4. The implementation language policy has diverged from the original draft, and the draft itself is now stale
- Severity: medium
- Instruction basis:
  - [dev-practical-skills-work-instruction-draft.md](C:\Users\zenoa\Desktop\Programming\edu_cha\docs\dev-practical-skills-work-instruction-draft.md#L155)
- Evidence:
  - The draft says `Use Korean explanatory prose with practical examples`.
  - The actual track and lesson metadata are primarily English-labeled:
    - [track.yaml](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\track.yaml#L3)
    - [track.yaml](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\track.yaml#L12)
    - [DEV-CWF-01-01.meta.json](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\modules\DEV-CWF-01\lessons\DEV-CWF-01-01.meta.json#L6)
  - The lesson bodies are Japanese-first with Korean variants, which matches the later product-wide language directive but not the original draft wording.
- Impact:
  - This is best treated as a documentation drift issue, not a pure implementation defect.
  - Reviewers using only the original draft will judge the implementation inconsistently unless the draft is updated.

## What Looks Correct
- `Common Workplace Fundamentals` is present as a full subject with eight topic families reflected in modules:
  - [track.yaml](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\track.yaml#L11)
  - [track.yaml](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\track.yaml#L39)
- The category remains separate from CS:
  - No `cs-knowledge`, `CS knowledge`, or `computer science` references were found in dev lesson files or dev meta files.
- The content is static and explanation-first:
  - Files are MDX/JSON under `data/training-content-factory/content/dev-practical-skills/**`
  - Exam extraction metadata is present and uses practical-skills-specific keys:
    - [DEV-CWF-01-01.meta.json](C:\Users\zenoa\Desktop\Programming\edu_cha\data\training-content-factory\content\dev-practical-skills\modules\DEV-CWF-01\lessons\DEV-CWF-01-01.meta.json#L22)
- The dev side has a filesystem loader and routed subject pages:
  - [dev-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\dev-content.ts#L201)
  - [dev-content.ts](C:\Users\zenoa\Desktop\Programming\edu_cha\src\lib\dev-content.ts#L212)

## Suggested Fix Order
1. Add `estimated_read_minutes` and `difficulty` to every dev lesson meta file and the corresponding loader type.
2. Expand every lesson’s `check_questions` to the required `4 to 6` range.
3. Decide whether the dev hub should continue exposing `DevTestBlock`; if static lessons are meant to be primary, demote or remove that block from the hub.
4. Update the work instruction draft so its language rule matches the actual Japanese-default, Korean-switchable product policy.

## Review Summary
- The dev work is structurally substantial and broadly aligned with the intended category split, static content model, and mandatory `Common Workplace Fundamentals` subject.
- The main conformance gaps are not in topic coverage but in contract precision:
  - missing required metadata fields
  - insufficient embedded check-question count
  - stale language guidance in the draft
