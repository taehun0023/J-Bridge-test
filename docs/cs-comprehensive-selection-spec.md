# CS Comprehensive Selection Spec

## Purpose
- This document defines the target runtime behavior for the rebuilt CS comprehensive exam.
- It replaces the current `step 3 assessment` dependency for CS.
- It is intentionally implementation-oriented and should drive the code rewrite.

## Current Problem
- Current CS comprehensive exam still routes through:
  - `src/lib/assessment-config.ts`
  - `src/lib/supabase/queries/assessments.ts`
  - `src/app/actions/comprehensive-exam/execution.ts`
- That path is built around the old step-based assessment model:
  - `30 total questions`
  - weighted category mix
  - `easy 20% / medium 40% / hard 40%`
- This directly conflicts with the new CS policy.

## Target Policy
- Exam type: `CS comprehensive`
- Category count: `8`
- Questions per category: `10`
- Total questions: `80`
- Per-category difficulty target:
  - `easy 3`
  - `medium 5`
  - `hard 2`
- Minimum pool target per category:
  - `30 total`
  - `9 easy`
  - `15 medium`
  - `6 hard`

## Category Set
- `basic_theory`
- `data_structure`
- `algorithm`
- `computer_architecture`
- `database`
- `network`
- `os`
- `security`

## Pool Policy
- Primary source: category-specific comprehensive pool
- Secondary source: lesson-aligned understanding-test questions approved for reuse
- Reuse strategy: `partial reuse`

## Required Question Metadata
- `question_category`
- `difficulty`
- `is_published`
- lesson mapping or equivalent curriculum mapping
- usage scope:
  - `understanding_only`
  - `shared`
  - `comprehensive_only`
  - `exclude`

## Selection Rules

### Rule 1. Category isolation
- Each category must contribute exactly `10` questions.
- Shortage in one category must not be filled by another category.

### Rule 2. Difficulty target
- The selector should attempt:
  - `3 easy`
  - `5 medium`
  - `2 hard`
- This target is enforced independently inside each category.

### Rule 3. Source priority
1. `comprehensive_only`
2. `shared`
3. fallback from same-category lesson-aligned reusable questions

### Rule 4. Exclusion policy
- `exclude`
- `out_of_scope`
- unpublished questions
- missing option integrity
- questions without usable answer data

### Rule 5. Shortfall fill
- If a category cannot meet one difficulty bucket:
  - fill from remaining same-category approved questions only
- If same-category approved pool is still insufficient:
  - either fail exam generation with a diagnostic error
  - or generate with a structured shortage flag
- Recommendation:
  - in admin/staging: fail loudly
  - in production: allow fallback but store a shortage diagnostic

## Recommended Runtime Algorithm

### Step A. Build candidate pools
- Load all published CS comprehensive candidates.
- Partition by:
  - category
  - difficulty
  - usage scope

### Step B. Select primary quota per category
- For each category:
  - pick `3 easy`
  - pick `5 medium`
  - pick `2 hard`
- Shuffle within bucket before slicing.

### Step C. Fill shortfall inside same category
- If any bucket is short:
  - use remaining same-category approved questions
  - prefer `shared` before broader fallback

### Step D. Persist the selected set
- Store the actual selected question IDs for the exam attempt.
- This is required before the exam starts.

### Step E. Render from persisted IDs
- `startExam` and `loadExamQuestions` must both read from the persisted question set.
- Do not regenerate the set on refresh.

## Why Persistence Is Required
- Current `loadExamQuestions` explicitly re-randomizes questions for in-progress exams.
- That behavior is tolerable for older small assessments, but it is not acceptable for the new CS comprehensive exam.
- Without persistence:
  - a refresh can change the user's exam
  - answer review can mismatch the original presented questions
  - fairness and auditability are broken

## Required Implementation Changes

### 1. `src/lib/assessment-config.ts`
- Remove CS comprehensive dependency on:
  - `COMP_EXAM_CATEGORY_TO_STEP.cs`
  - `ASSESSMENT_TOTAL_QUESTIONS[3]`
  - `STEP3_DIFFICULTY_RATIOS`
  - `CS_KNOWLEDGE_WEIGHTS`
- Add dedicated CS comprehensive config, for example:
  - `CS_COMPREHENSIVE_CATEGORIES`
  - `CS_COMPREHENSIVE_CATEGORY_COUNT = 10`
  - `CS_COMPREHENSIVE_TOTAL_QUESTIONS = 80`
  - `CS_COMPREHENSIVE_DIFFICULTY_COUNTS`

### 2. `src/lib/supabase/queries/assessments.ts`
- Do not use `fetchStep3CsStyle` for CS comprehensive.
- Add a dedicated selector, for example:
  - `fetchCsComprehensiveQuestions(...)`
- Keep old step-based code only if still needed by non-CS flows.

### 3. `src/app/actions/comprehensive-exam/execution.ts`
- Stop mapping CS comprehensive through step `3`.
- For `exam.category === 'cs' && exam.subcategory === 'comprehensive'`:
  - call the dedicated CS selector
  - persist selected question IDs
  - use persisted question IDs on reload

### 4. Persistence model
- Current system stores answers, but not the original presented question set.
- Add one of:
  - a dedicated join table such as `comprehensive_exam_questions`
  - or a persisted JSON question-id list on `comprehensive_exams`
- Preferred shape:
  - `exam_id`
  - `question_id`
  - `category`
  - `difficulty`
  - `sort_order`

### 5. Review / report impact
- Review pages and weakness reports should rely on persisted presented questions.
- Weakness aggregation should remain by `question_category`, but must assume `80` presented questions.
- Time limits and UI pagination should be reviewed for a much longer exam.

## Diagnostics To Store
- `category_shortage`
- `difficulty_shortage`
- `fallback_used`
- `source_mix`
- `generation_version`

## Validation Requirements
- Returns exactly `80` questions
- Returns exactly `10` per category
- Returns `3/5/2` per category when inventory allows
- Never fills category shortage from another category
- Never includes `exclude` or unpublished questions
- Reload of in-progress exam returns the identical question set

## Recommended Test Cases
- happy path with full pool
- missing `easy` in one category
- missing `medium` in one category
- category shortage below `10`
- persisted reload after refresh
- answer grading against persisted set
- review rendering after submit

## Deliverables After Spec Adoption
- cleaned category inventory
- reusable/shared pool map
- CS comprehensive selector implementation
- exam-question persistence layer
- integration tests for `startExam`, `loadExamQuestions`, and submit flow
