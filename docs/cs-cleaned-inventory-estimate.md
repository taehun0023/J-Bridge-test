# CS Cleaned Inventory Estimate

## Purpose
- This document provides a conservative post-cleanup estimate before the full question-by-question review is complete.
- It is an operational planning artifact.
- It should be replaced later by a true counted inventory.

## Estimation Method
- Start from raw published inventory in `cs-comprehensive-baseline-audit.md`.
- Apply current review findings:
  - obvious `out_of_scope` removals
  - duplicate pruning
  - selective salvage of `unset`
- Use conservative assumptions:
  - do not count every `unset` as recoverable
  - do not count every `adaptable` question as approved
  - assume priority categories lose more questions during cleanup

## Interpretation
- `estimated approved` means likely reusable after first-pass cleanup.
- These are not final counts.
- The main goal is to understand where writing pressure will remain after cleanup.

## Estimated Post-Cleanup Readiness

| Category | Raw Published | Estimated Approved Total | Estimated Easy | Estimated Medium | Estimated Hard | Readiness | Main Risk |
| --- | ---: | ---: | ---: | ---: | ---: | --- | --- |
| `basic_theory` | 76 | 28-34 | 7-9 | 10-13 | 5-6 | borderline | severe category drift |
| `data_structure` | 65 | 26-32 | 8-9 | 10-13 | 5-6 | borderline | medium shortage after crossover removal |
| `algorithm` | 74 | 26-32 | 8-9 | 10-13 | 5-6 | borderline | medium shortage after advanced-topic removal |
| `computer_architecture` | 55 | 18-24 | 5-7 | 7-9 | 4-5 | weak | high out-of-scope contamination plus duplicates |
| `database` | 85 | 26-34 | 7-9 | 10-13 | 5-6 | borderline | broad syntax/theory drift |
| `network` | 65 | 18-24 | 5-7 | 7-9 | 4-5 | weak | heavy protocol-trivia removal |
| `os` | 31 | 18-22 | 5-7 | 7-9 | 4-5 | weak | thin bank after cleanup |
| `security` | 113 | 34-42 | 9-12 | 14-18 | 7-9 | strong | scope cleanup more than volume |

## Gap Against Comprehensive Floor
- Target floor per category:
  - total `30`
  - `easy 9`
  - `medium 15`
  - `hard 6`

### Likely still below floor after cleanup
- `computer_architecture`
- `network`
- `os`
- `algorithm`
- `data_structure`

### Possibly at or near floor after cleanup
- `basic_theory`
- `database`

### Likely above floor after cleanup
- `security`

## What The Estimate Changes

### 1. Writing pressure moves from raw totals to approved totals
- Several categories look healthy in raw published count.
- They stop looking healthy once current lesson boundaries are enforced.

### 2. Tier-1 writing priority is confirmed
- `computer_architecture`
- `network`
- `os`

These remain the categories most likely to require immediate new writing even after salvage.

### 3. `security` should stay out of the first writing batch
- Cleanup is still needed.
- But it is not the bottleneck for shipping the 80-question exam.

## Provisional Category Judgments

### `computer_architecture`
- Likely needs both cleanup and net-new writing.
- Expect shortage in easy and medium even after relabeling.

### `network`
- Cleanup will remove a large amount of non-course networking trivia.
- Expect meaningful rebuild work around diagnosis and role-distinction questions.

### `os`
- Bank is too thin to absorb many exclusions.
- This category should be treated as a likely guaranteed writing target.

### `algorithm`
- Can probably be stabilized by removing advanced topics and backfilling medium items.

### `data_structure`
- Similar to algorithm: cleanup first, medium rebuild second.

### `basic_theory`
- Enough raw volume exists, but only if the category is reset around representation topics.

### `database`
- Probably salvageable, but syntax-heavy rows should not be allowed to inflate readiness.

### `security`
- Strongest candidate to seed comprehensive-only hard questions after scope cleanup.

## Immediate Next Steps
1. Finish more rows in `cs-question-review-sheet.md`.
2. Resolve duplicate groups in `cs-duplicate-pruning-candidates.md`.
3. Convert estimated ranges into counted approved totals.
4. Update `cs-shortage-writing-plan.md` with the first post-cleanup numeric table.
