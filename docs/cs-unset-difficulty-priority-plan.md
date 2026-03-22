# CS Unset Difficulty Priority Plan

## Purpose
- This document now tracks the remaining `unset difficulty` cleanup after counted shortages were closed.
- The goal is governance completeness, not shortage closure.

## Current Unset Counts

| Category | Approved Unset | Easy Gap | Medium Gap | Total Gap |
| --- | ---: | ---: | ---: | ---: |
| `database` | 47 | 0 | 0 | 0 |
| `security` | 43 | 0 | 0 | 0 |
| `algorithm` | 38 | 0 | 0 | 0 |
| `basic_theory` | 37 | 0 | 0 | 0 |
| `data_structure` | 30 | 0 | 0 | 0 |
| `network` | 29 | 0 | 0 | 0 |
| `computer_architecture` | 20 | 0 | 0 | 0 |
| `os` | 0 | 0 | 0 | 0 |

## Second-Pass Priority

### P1
- `database`
- `security`

Reason:
- They still have the largest unset banks.
- `database` should be reduced first because its remaining pool is more likely to affect comprehensive quality.

### P2
- `algorithm`
- `data_structure`

Reason:
- Both still have enough unset rows to hide drift and duplicates.

### P3
- `basic_theory`
- `network`

Reason:
- These are numerically safe, but still need category-boundary discipline and duplicate cleanup.

### P4
- `computer_architecture`

Reason:
- Shortage is closed, but a smaller unset bank still remains.
- Clean it after the higher-volume banks.

## Cleanup Target By Category

| Category | Immediate Relabel Goal |
| --- | --- |
| `basic_theory` | continue explicit governance on remaining `37` unset rows |
| `data_structure` | continue explicit governance on remaining `30` unset rows |
| `algorithm` | continue explicit governance on remaining `38` unset rows |
| `computer_architecture` | continue explicit governance on remaining `20` unset rows |
| `database` | continue explicit governance on remaining `47` unset rows |
| `network` | continue explicit governance on remaining `29` unset rows |
| `os` | no remaining unset rows |
| `security` | continue explicit governance on remaining `43` unset rows |

## Review Heuristics

### Easy
- single-definition checks
- direct concept recognition
- one-step factual distinctions

### Medium
- compare two adjacent concepts
- explain behavior in a bounded scenario
- identify one common misconception

### Hard
- keep hard assignment conservative
- do not use hard to solve an easy/medium shortage problem

## Execution Rule
1. Reduce remaining unset rows category by category.
2. Recount after each cleanup tier.
3. Only reopen new writing if duplicate pruning or later review creates a real deficit.
