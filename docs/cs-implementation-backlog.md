# CS Implementation Backlog

## Purpose
- This document translates the overhaul docs into implementation tasks.
- It is the bridge from content cleanup to code changes.

## Goal
- Ship a CS comprehensive exam that:
  - uses the new `80-question` policy
  - no longer depends on the old step-3 assessment path
  - persists the selected question set for exam integrity

## Phase 1. Content/Data Preparation

### Task 1. Finish question-level review
- Source:
  - `cs-question-review-sheet.md`
- Done when:
  - top 4 categories have a meaningful first-pass table
  - second 4 categories have representative decisions
  - `adaptable` rows are reduced by rewrite/exclude decisions

### Task 2. Duplicate pruning
- Source:
  - `cs-duplicate-pruning-candidates.md`
- Done when:
  - exact duplicates are reduced to one preferred row each
  - duplicate counts are removed from readiness estimates

### Task 3. First cleaned inventory recount
- Source:
  - `cs-cleaned-inventory-estimate.md`
- Done when:
  - each category has counted approved totals by difficulty
  - actual shortage table replaces estimate ranges

### Task 4. Lock first writing batch
- Source:
  - `cs-shortage-writing-plan.md`
- Done when:
  - shortage-driven writing is either confirmed or proven unnecessary
  - write-new counts reflect approved inventory, not raw inventory

## Phase 2. Runtime Design Split

### Task 5. Remove CS comprehensive dependence on step 3
- File:
  - `src/lib/assessment-config.ts`
- Required changes:
  - stop treating CS comprehensive as step 3
  - add CS-specific comprehensive config constants
  - keep legacy step config only for other areas that still need it

### Task 6. Add dedicated CS selector
- File:
  - `src/lib/supabase/queries/assessments.ts`
- Required changes:
  - add `fetchCsComprehensiveQuestions(...)`
  - category-by-category `3/5/2` selection
  - same-category fallback only
  - support `shared` and `comprehensive_only` pool rules once metadata is available

### Task 7. Stop re-randomizing in-progress CS comprehensive exams
- File:
  - `src/app/actions/comprehensive-exam/execution.ts`
- Required changes:
  - create and persist selected question set when exam starts
  - reload from persisted question IDs in `loadExamQuestions`
  - stop rebuilding CS comprehensive sets on refresh

### Task 8. Persist presented question IDs
- Files:
  - schema/migration target to be defined
  - `src/app/actions/comprehensive-exam/execution.ts`
  - review/report query paths as needed
- Required changes:
  - store `exam_id + question_id + category + difficulty + sort_order`
  - ensure review and grading use the persisted set

## Phase 3. Review/Reporting Integration

### Task 9. Review flow compatibility
- Likely files:
  - `src/app/(main)/exam/[examId]/page.tsx`
  - `src/app/(main)/exam/[examId]/ExamClient.tsx`
- Required changes:
  - confirm 80-question rendering behavior
  - confirm timing and navigation still work
  - confirm review screen reads the original presented set

### Task 10. Weakness reporting compatibility
- Likely files:
  - `src/app/actions/admin/weakness-report.ts`
  - any score/radar aggregation that assumes shorter exams
- Required changes:
  - verify no assumption breaks at 80 questions
  - keep `question_category` aggregation stable

## Phase 4. Verification

### Task 11. Selector tests
- Add tests for:
  - exact `80` output
  - exact `10` per category
  - `3/5/2` selection within category
  - same-category-only fallback

### Task 12. Persistence tests
- Add tests for:
  - refresh returns same question set
  - submit grades against persisted set
  - review sees original questions

### Task 13. Regression checks
- Verify:
  - non-CS comprehensive exams still start correctly
  - understanding tests still work
  - admin question management still reflects current categories

## Suggested Execution Order
1. close shortage-driven relabeling
2. continue unset cleanup and duplicate pruning
3. implement persistence model
4. implement CS selector
5. wire execution flow
6. test selector and reload integrity
7. then keep cleaning the pool while using the new floor-safe bank

## Blocking Dependencies
- final question metadata model for `shared / comprehensive_only / exclude`
- counted approved inventory is available
- schema decision for persisted exam-question set

## Non-Goals For First Implementation
- do not redesign the entire admin UI first
- do not mass-refactor non-CS comprehensive flows unless required
- do not write all new questions before the cleaned inventory is counted
