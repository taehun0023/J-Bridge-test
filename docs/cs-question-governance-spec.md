# CS Question Governance Spec

## Purpose
- This document defines how CS questions are governed after the overhaul.
- It formalizes the rule that understanding-test-only relevance and comprehensive relevance are different concerns.

## Core Rule
- Questions that do not belong in understanding tests should **not** automatically be discarded.
- They should be handled as follows:
  - still in current curriculum scope: move to comprehensive usage
  - outside current curriculum scope: exclude

## Governance Fields
- `curriculum_status`
  - `aligned`
  - `adaptable`
  - `out_of_scope`
- `question_usage_scope`
  - `understanding_only`
  - `shared`
  - `comprehensive_only`
  - `exclude`
- `lesson_mapping`
  - current lesson anchor such as `CSK-NW-01-02`

## Interpretation

### `aligned + understanding_only`
- best for `check-1`, `check-2`, `final`
- direct lesson confirmation

### `aligned + shared`
- valid for both understanding tests and comprehensive exam
- should form the backbone of the reusable pool

### `aligned/adaptable + comprehensive_only`
- not ideal for lesson-by-lesson checks
- still valid for category-wide accumulated verification

### `out_of_scope + exclude`
- remove from both understanding tests and comprehensive exam

## Difficulty Policy
- `difficulty` must always be one of:
  - `easy`
  - `medium`
  - `hard`
- `unset` is considered temporary invalid state during cleanup
- no question should stay in the final comprehensive-ready pool with null difficulty

## Runtime Rule
- CS comprehensive selector should:
  - ignore `exclude`
  - ignore `out_of_scope`
  - prefer `comprehensive_only`
  - then prefer `shared`
  - then allow `understanding_only` as same-category fallback

## Current Status
- schema migration added in:
  - `00118_cs_question_governance.sql`
- first-pass seed updates added in:
  - `00119_cs_first_pass_governance_seed.sql`

## Next Work
1. extend first-pass seed to the remaining reviewed categories
2. finish question-level review sheet
3. recount by:
   - category
   - difficulty
   - usage scope
4. then update shortage-writing targets
