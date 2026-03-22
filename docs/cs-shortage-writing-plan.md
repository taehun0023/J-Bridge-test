# CS Shortage Writing Plan

## Purpose
- This document started as a writing plan.
- After the live recount through `00122`, it is now primarily a closure note.
- There is no current counted shortage that forces net-new writing.

## Fixed Goal
- Comprehensive exam target:
  - `8 categories`
  - `10 questions per category`
  - `80 total`
  - per category: `3 easy / 5 medium / 2 hard`
- Minimum comprehensive pool target per category:
  - `30 total`
  - `9 easy`
  - `15 medium`
  - `6 hard`

## Planning Principle
- Do not trust raw published totals.
- Use this sequence:
  1. remove `out_of_scope`
  2. relabel salvageable `unset`
  3. count approved reusable pool
  4. write to close the remaining gap

## Final Counted Difficulty Gaps

| Category | Easy Gap | Medium Gap | Hard Gap | Raw Risk |
| --- | ---: | ---: | ---: | --- |
| `basic_theory` | 0 | 0 | 0 | unset cleanup remains |
| `data_structure` | 0 | 0 | 0 | unset cleanup remains |
| `algorithm` | 0 | 0 | 0 | unset cleanup remains |
| `computer_architecture` | 0 | 0 | 0 | duplicate cleanup remains |
| `database` | 0 | 0 | 0 | unset cleanup remains |
| `network` | 0 | 0 | 0 | duplicate cleanup remains |
| `os` | 0 | 0 | 0 | stable after relabeling |
| `security` | 0 | 0 | 0 | cleanup only |

## Current Recount Takeaway
- All categories clear the `30 total` floor.
- All categories also clear the `9 / 15 / 6` difficulty floor.
- The immediate bottleneck is now `unset difficulty` and duplicate cleanup.
- New writing is no longer required by the current counted shortage table.

## Conservative Writing Priority

### Tier 1. Immediate relabeling and write-prep
- `computer_architecture`
- `network`
- `os`

Reason:
- These categories still miss easy/medium targets by the widest counted margin.
- `os` also remains short by `1 total approved question`.

### Tier 2. Cleanup first, then medium rebalance
- `algorithm`
- `data_structure`

Reason:
- They are numerically healthy, but both still need medium difficulty backfill from the `unset` bank.

### Tier 3. Cleanup and selective relabeling
- `basic_theory`
- `database`

Reason:
- They have enough approved total volume.
- New writing should wait until `unset` rows are classified into the missing easy/medium slots.

### Tier 4. Cleanup only for now
- `security`

Reason:
- This category already clears the numeric floor and difficulty floor.
- Do not spend writing time here until the narrower categories are stabilized.

## Recommended Writing Targets After Final Recount
- No mandatory net-new writing is currently locked.
- If future duplicate pruning or full-bank review reduces approved counts, reopen this file.

| Category | Easy | Medium | Hard | Initial New Count | Why |
| --- | ---: | ---: | ---: | ---: | --- |
| `computer_architecture` | 0 | 0 | 0 | 0 | shortage closed |
| `network` | 0 | 0 | 0 | 0 | shortage closed |
| `os` | 0 | 0 | 0 | 0 | shortage closed |
| `algorithm` | 0 | 0 | 0 | 0 | shortage closed |
| `data_structure` | 0 | 0 | 0 | 0 | shortage closed |
| `basic_theory` | 0 | 0 | 0 | 0 | shortage closed |
| `database` | 0 | 0 | 0 | 0 | shortage closed |
| `security` | 0 | 0 | 0 | 0 | cleanup only for now |

## Initial Writing Total
- Guaranteed net-new writing currently locked: `0`

## Writing Mix Guidance

### `easy`
- definition check
- core distinction
- direct concept identification
- basic lesson-aligned scenario

### `medium`
- compare two close concepts
- choose correct behavior under a realistic situation
- diagnose one-step misconception
- connect two lessons within one category

### `hard`
- integrated scenario
- tradeoff interpretation
- misleading but still lesson-bounded distractors
- comprehensive-only candidates

## Category Writing Notes

### `computer_architecture`
- Write around:
  - cache/locality
  - interrupt vs polling
  - throughput vs latency
  - CPU/memory/storage role confusion
- Avoid:
  - pipelines
  - addressing modes
  - RAID
  - BIOS trivia

### `network`
- Write around:
  - HTTP over TCP
  - DNS vs routing
  - TCP vs UDP selection
  - basic failure diagnosis
- Avoid:
  - subnet math
  - protocol internals
  - SDN
  - TLS handshake detail

### `os`
- Write around:
  - process vs thread
  - context switch cost
  - paging / swap / page fault
  - locks / deadlock
- Avoid:
  - B-tree
  - filesystem internals
  - GPU hardware crossover

### `algorithm`
- Write around:
  - search preconditions
  - sorting stability / tradeoffs
  - recursion and divide-and-conquer basics
  - BFS vs DFS
  - Big-O interpretation
- Avoid:
  - DP
  - topological sort
  - amortized analysis

### `data_structure`
- Write around:
  - array vs linked list
  - stack vs queue
  - BST vs heap
  - hash / collision / table vs BST
- Avoid:
  - graph representation
  - Trie
  - B-tree
  - sort-algorithm crossover

### `basic_theory`
- Write around:
  - binary / hexadecimal conversion
  - bit / byte
  - encoding
  - signed / unsigned
  - overflow
  - IEEE 754 basics
- Avoid:
  - digital logic design
  - network addressing
  - software design patterns

### `database`
- Write around:
  - index tradeoffs
  - ACID
  - isolation anomalies
  - execution-plan interpretation
- Avoid:
  - SQL syntax trivia as the main target
  - normalization theory
  - relational algebra

### `security`
- Write only after cleanup count proves a real gap.
- Keep focus on:
  - auth vs authz
  - hashing vs encryption
  - XSS / SQLi / CSRF
  - logging / incident response

## Execution Sequence
1. Continue full-bank review for remaining `unset` rows.
2. Execute duplicate pruning.
3. Recount again after duplicate cleanup.
4. Reopen writing only if a post-pruning recount creates a real deficit.

## Expected Next Artifact
- Final shortage table is now satisfied.
- The next artifact should be an `unset cleanup` and `duplicate pruning` completion report.
