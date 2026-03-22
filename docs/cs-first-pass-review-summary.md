# CS First-Pass Review Summary

## Purpose
- This document summarizes the first seeded review pass completed in `cs-question-review-sheet.md`.
- It is not the final classification result.
- It exists to lock in early decisions before the full-table review expands.

## Scope Of This Pass
- Categories reviewed with seeded rows:
  - `computer_architecture`
  - `network`
  - `os`
  - `algorithm`
  - `basic_theory`
  - `database`
  - `data_structure`
  - `security`

## Strong Early Decisions

### 1. `computer_architecture`
- Keep:
  - CPU role
  - interrupt handling
  - bus role
  - cache-miss/locality scenario
  - MIPS/metric interpretation
- Exclude:
  - RAID
  - addressing modes
  - RISC taxonomy
  - BIOS

### 2. `network`
- Keep:
  - DNS role
  - router role
  - TCP vs UDP
  - HTTP status basics
- Rewrite carefully:
  - three-way handshake
  - HTTPS meaning
- Exclude:
  - SDN
  - ARP
  - DHCP
  - subnet math

### 3. `os`
- Keep:
  - filesystem role
  - paging
  - page fault
  - round-robin
  - semaphore
  - deadlock conditions
- Rewrite carefully:
  - thrashing
- Exclude:
  - B-tree
  - GPU crossover

### 4. `algorithm`
- Keep:
  - selection sort
  - binary search
  - recursion
  - BFS/DFS basics
  - Big-O meaning
- Exclude:
  - dynamic programming
  - topological sort
  - amortized analysis

### 5. `basic_theory`
- Keep:
  - binary/hex conversion
  - Unicode/encoding
  - complement / signed representation
- Exclude:
  - NAND logic
  - CIDR math
  - entropy

### 6. `database`
- Keep:
  - Atomicity
  - rollback
- Rewrite carefully:
  - optimistic vs pessimistic lock
  - B+ tree index if framed as index tradeoff
- Exclude:
  - HAVING syntax trivia
  - normalization

### 7. `data_structure`
- Keep:
  - stack basics
  - priority queue
  - heap
- Exclude:
  - Trie
  - B-tree

### 8. `security`
- Keep:
  - encryption explanation within hash-vs-encryption lesson scope
- Rewrite carefully:
  - confidentiality framing
  - firewall role
- Exclude:
  - AES
  - RSA

## Cross-Cutting Findings
- `aligned` salvage is already visible in every category except the clearly excluded legacy tails.
- The biggest damage is still category drift, not absolute lack of raw published questions.
- `adaptable` is appearing most often where the concept is near scope but phrased too deeply.
- Duplicate cleanup will matter:
  - several categories contain both `unset` and already-labeled explicit variants of nearly the same question.

## What This Means For The Next Pass
- Next review should focus on:
  - finishing priority-category rows from the `unset` bucket
  - pruning duplicate variants
  - separating `understanding_only` from `shared`
  - turning `adaptable` rows into either rewritten keepers or exclusions

## Immediate Follow-Up
1. Extend the review sheet with more rows from the top 4 categories.
2. Count provisional keepers by:
   - `aligned + shared`
   - `aligned + understanding_only`
   - `adaptable`
3. Build the first cleaned-inventory estimate.
4. Then update the shortage-writing plan with post-cleanup numbers.
