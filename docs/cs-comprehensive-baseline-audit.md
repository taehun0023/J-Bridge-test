# CS Comprehensive Baseline Audit

## Purpose
- This document captures the current CS baseline before the full comprehensive overhaul.
- It is the first execution artifact requested by `docs/cs-comprehensive-overhaul-instruction.md`.
- It focuses on current structure, current question inventory, and gap analysis against the target comprehensive exam policy.

## Target Policy
- 8 categories
- 10 questions per category
- 80 questions total
- Per-category difficulty mix: `easy 3 / medium 5 / hard 2`
- Minimum pool target per category: `30 total`, `9 easy / 15 medium / 6 hard`

## Current Course Structure
- Each CS subject currently has 4 lessons.
- Subjects:
  - `basic_theory`
  - `data_structure`
  - `algorithm`
  - `computer_architecture`
  - `database`
  - `network`
  - `os`
  - `security`

| Category | Module ID | Lesson Count |
| --- | --- | ---: |
| `basic_theory` | `CSK-BT-01` | 4 |
| `data_structure` | `CSK-DS-01` | 4 |
| `algorithm` | `CSK-AL-01` | 4 |
| `computer_architecture` | `CSK-CA-01` | 4 |
| `database` | `CSK-DB-01` | 4 |
| `network` | `CSK-NW-01` | 4 |
| `os` | `CSK-OS-01` | 4 |
| `security` | `CSK-SC-01` | 4 |

## Current Understanding-Test Structure
- Current CS quiz sets are still organized as:
  - `check-1`
  - `check-2`
  - `final`
- All 8 subjects have these 3 sets.
- Current per-attempt counts:
  - `check-1`: 8
  - `check-2`: 8
  - `final`: 12
- Current runtime difficulty policy:
  - `check-1/check-2`: `30/50/20`
  - `final`: `20/40/40`

## Current Comprehensive-Exam Dependency
- CS comprehensive exam is not yet truly independent.
- It currently depends on the old `step 3` selection pipeline:
  - `src/lib/assessment-config.ts`
  - `src/lib/supabase/queries/assessments.ts`
  - `src/app/actions/comprehensive-exam/execution.ts`
- Current behavior is still tied to:
  - total questions: `30`
  - category-weighted step-3 selection
  - `STEP3_DIFFICULTY_RATIOS`
- This is the main implementation path that must be removed during overhaul.

## Current Question Inventory
- Data source: current `quiz_questions`
- Scope: CS categories and current CS check/final categories
- Counting rule used here:
  - `published` counts are the operative counts
  - `unset` means difficulty is not one of `easy / medium / hard`

### General Category Inventory
| Category | Published | Easy | Medium | Hard | Unset |
| --- | ---: | ---: | ---: | ---: | ---: |
| `basic_theory` | 76 | 6 | 12 | 12 | 46 |
| `data_structure` | 65 | 9 | 9 | 9 | 38 |
| `algorithm` | 74 | 9 | 9 | 9 | 47 |
| `computer_architecture` | 55 | 5 | 6 | 6 | 38 |
| `database` | 85 | 6 | 12 | 12 | 55 |
| `network` | 65 | 6 | 6 | 6 | 47 |
| `os` | 31 | 6 | 6 | 6 | 13 |
| `security` | 113 | 13 | 27 | 27 | 46 |

### Current Check/Final Set Inventory
| Category | Set | Published | Easy | Medium | Hard |
| --- | --- | ---: | ---: | ---: | ---: |
| `basic_theory` | `check_1` | 8 | 2 | 4 | 2 |
| `basic_theory` | `check_2` | 8 | 2 | 4 | 2 |
| `basic_theory` | `final` | 12 | 2 | 5 | 5 |
| `data_structure` | `check_1` | 8 | 2 | 4 | 2 |
| `data_structure` | `check_2` | 8 | 2 | 4 | 2 |
| `data_structure` | `final` | 12 | 2 | 5 | 5 |
| `algorithm` | `check_1` | 8 | 2 | 4 | 2 |
| `algorithm` | `check_2` | 8 | 2 | 4 | 2 |
| `algorithm` | `final` | 12 | 2 | 5 | 5 |
| `computer_architecture` | `check_1` | 8 | 2 | 4 | 2 |
| `computer_architecture` | `check_2` | 8 | 2 | 4 | 2 |
| `computer_architecture` | `final` | 12 | 3 | 4 | 5 |
| `database` | `check_1` | 8 | 2 | 4 | 2 |
| `database` | `check_2` | 8 | 2 | 4 | 2 |
| `database` | `final` | 12 | 2 | 5 | 5 |
| `network` | `check_1` | 8 | 2 | 4 | 2 |
| `network` | `check_2` | 8 | 2 | 4 | 2 |
| `network` | `final` | 12 | 2 | 5 | 5 |
| `os` | `check_1` | 8 | 2 | 4 | 2 |
| `os` | `check_2` | 8 | 2 | 4 | 2 |
| `os` | `final` | 12 | 2 | 5 | 5 |
| `security` | `check_1` | 8 | 2 | 4 | 2 |
| `security` | `check_2` | 8 | 2 | 4 | 2 |
| `security` | `final` | 12 | 2 | 5 | 5 |

## Gap Analysis Against Comprehensive Target
- Target per category:
  - total `30`
  - `easy 9`
  - `medium 15`
  - `hard 6`

| Category | Total Gap | Easy Gap | Medium Gap | Hard Gap | Notes |
| --- | ---: | ---: | ---: | ---: | --- |
| `basic_theory` | 0 | 3 | 3 | 0 | Large `unset` bucket can likely be reclassified before new writing |
| `data_structure` | 0 | 0 | 6 | 0 | Medium shortage despite total sufficiency |
| `algorithm` | 0 | 0 | 6 | 0 | Medium shortage despite total sufficiency |
| `computer_architecture` | 0 | 4 | 9 | 0 | Highest explicit-difficulty shortage |
| `database` | 0 | 3 | 3 | 0 | Heavy `unset` bucket |
| `network` | 0 | 3 | 9 | 0 | Same structural issue as computer architecture |
| `os` | 0 | 3 | 9 | 0 | Total barely clears the floor |
| `security` | 0 | 0 | 0 | 0 | Only category that already clears explicit target |

## Key Findings
- The current CS check/final pools are too small to be considered durable random pools.
- In many categories, current understanding-test sets are effectively fixed sets because inventory equals per-attempt count.
- The biggest structural problem is not total question count.
- The biggest structural problem is `difficulty assignment quality`.
- Most categories have enough total published questions to seed a comprehensive pool, but many are trapped in `unset`.
- `security` is the only category that already clears the comprehensive minimum without difficulty reassignment.
- `computer_architecture`, `network`, and `os` are the most urgent categories for explicit-difficulty remediation.

## Immediate Action Items
- Reclassify the `unset` bucket across all 8 categories before writing large volumes of new questions.
- Build the `aligned / adaptable / out_of_scope` matrix next.
- Separate comprehensive-exam design from the old step-3 pipeline.
- Treat current check/final sets as understanding-test assets, not as the future comprehensive pool.

## Recommended Next Deliverables
- `CS problem classification matrix`
- `CS category x difficulty x usage-scope table`
- `Category-level shortage writing plan`
- `New comprehensive selection spec`
