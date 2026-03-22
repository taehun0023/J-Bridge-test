# CS Problem Classification Matrix

## Purpose
- This document defines the classification standard for CS problems using actual lesson scope.
- It is the next execution artifact after the baseline audit.
- It is intended to support:
  - `aligned / adaptable / out_of_scope` review
  - understanding-test restructuring
  - comprehensive-exam pool construction

## Classification States
- `aligned`
  - Directly evaluates a concept explicitly covered by the current lesson set.
  - Can be used immediately after difficulty/wording quality review.
- `adaptable`
  - Concept is adjacent to current scope, but wording, difficulty, or framing must be adjusted.
  - Can be salvaged, but should not be used as-is.
- `out_of_scope`
  - Depends on knowledge not taught in the current content flow.
  - Exclude from understanding tests and comprehensive exam until curriculum expansion.

## Usage-Scope Labels
- `understanding_only`
  - Best used for `check-1`, `check-2`, `final`
- `comprehensive_only`
  - Better reserved for cross-lesson integrated verification
- `shared`
  - Valid for both understanding tests and comprehensive exam
- `exclude`
  - Not usable in current flow

## Subject Matrix

### 1. `basic_theory`
**Current lesson scope**
- `CSK-BT-01-01`: binary, bit, byte
- `CSK-BT-01-02`: character encoding, integer vs floating-point interpretation
- `CSK-BT-01-03`: signed/unsigned integers, two's complement, overflow
- `CSK-BT-01-04`: IEEE 754, rounding error, numeric comparison cautions

**Core learning objectives**
- Explain how binary representation maps to bit/byte units
- Distinguish character encoding from numeric representation
- Explain signed/unsigned interpretation and overflow
- Explain floating-point error and safe comparison behavior

**Use as `aligned` when**
- The problem asks about binary conversion, bit/byte meaning, encoding mismatch, two's complement, overflow, IEEE 754 basics, or rounding error

**Use as `adaptable` when**
- The problem is about numeric representation but uses language/runtime-specific details beyond the lesson explanation
- The problem is valid but too implementation-specific for current content

**Use as `out_of_scope` when**
- The problem requires advanced hardware arithmetic design, compiler internals, or numeric analysis beyond lesson scope

**Recommended usage scope**
- Fundamental factual questions: `understanding_only` or `shared`
- Cross-topic representation questions: `shared`
- Deep numerical edge-case puzzles: likely `adaptable` or `comprehensive_only`

### 2. `data_structure`
**Current lesson scope**
- `CSK-DS-01-01`: array vs linked list
- `CSK-DS-01-02`: stack vs queue
- `CSK-DS-01-03`: tree, BST, heap, priority queue
- `CSK-DS-01-04`: hash, collisions, hash table vs BST

**Core learning objectives**
- Compare contiguous vs pointer-based storage
- Distinguish LIFO vs FIFO use cases
- Explain BST vs heap structural differences
- Explain hash-table lookup, collision handling, and tradeoffs

**Use as `aligned` when**
- The problem tests structural differences, access/update tradeoffs, queue/stack use cases, heap insertion concept, or collision handling

**Use as `adaptable` when**
- The problem assumes advanced implementation details not taught explicitly, but the conceptual core matches current scope

**Use as `out_of_scope` when**
- The problem depends on balancing trees, advanced heap variants, amortized proof details, or non-covered structures

**Recommended usage scope**
- Basic compare/contrast questions: `understanding_only`
- Data-structure selection questions: `shared`
- Performance tradeoff scenarios: `shared` or `comprehensive_only`

### 3. `algorithm`
**Current lesson scope**
- `CSK-AL-01-01`: linear vs binary search
- `CSK-AL-01-02`: sorting selection, stability, cost tradeoffs
- `CSK-AL-01-03`: recursion, divide and conquer, BFS/DFS
- `CSK-AL-01-04`: Big-O, complexity classes, time-space tradeoff

**Core learning objectives**
- Explain search preconditions and selection criteria
- Compare sorting algorithms by stability and cost
- Explain recursion and graph traversal basics
- Interpret Big-O and basic tradeoffs

**Use as `aligned` when**
- The problem tests binary-search preconditions, stable sorting meaning, recursion base cases, BFS/DFS distinction, or complexity interpretation

**Use as `adaptable` when**
- The problem is broadly algorithmic but framed around formal proof or coding details beyond the lesson

**Use as `out_of_scope` when**
- The problem requires dynamic programming, greedy proof, shortest-path algorithms, NP-completeness, or advanced graph theory

**Recommended usage scope**
- Search/sort basics: `understanding_only`
- BFS/DFS and complexity comparison: `shared`
- Multi-step tradeoff questions: `comprehensive_only` candidate

### 4. `computer_architecture`
**Current lesson scope**
- `CSK-CA-01-01`: CPU, memory, storage roles
- `CSK-CA-01-02`: cache and locality
- `CSK-CA-01-03`: I/O, bus, interrupts, polling
- `CSK-CA-01-04`: performance metrics, throughput, latency, MIPS/FLOPS

**Core learning objectives**
- Distinguish compute, working memory, and persistent storage
- Explain cache value using temporal/spatial locality
- Explain interrupt vs polling and bus roles
- Interpret major performance metrics without over-trusting one metric

**Use as `aligned` when**
- The problem asks about CPU/memory/storage roles, locality, cache hit concepts, interrupt vs polling, or throughput vs latency

**Use as `adaptable` when**
- The concept is in scope but the wording assumes deeper hardware design than taught

**Use as `out_of_scope` when**
- The problem requires pipeline hazard analysis, superscalar execution, branch prediction internals, or microarchitecture design

**Recommended usage scope**
- Role distinction and locality basics: `understanding_only`
- I/O and metric interpretation: `shared`
- Multi-metric architecture scenario questions: `comprehensive_only`

### 5. `database`
**Current lesson scope**
- `CSK-DB-01-01`: index tradeoffs
- `CSK-DB-01-02`: transactions and ACID
- `CSK-DB-01-03`: isolation levels and anomalies
- `CSK-DB-01-04`: execution plans and optimizer behavior

**Core learning objectives**
- Explain index value vs write cost
- Explain ACID and transactional correctness
- Distinguish isolation levels and anomalies
- Read high-level execution-plan behavior

**Use as `aligned` when**
- The problem tests ACID meaning, dirty/non-repeatable/phantom reads, index tradeoffs, or scan type differences

**Use as `adaptable` when**
- The concept is in scope but the problem assumes vendor-specific SQL or optimizer detail not covered directly

**Use as `out_of_scope` when**
- The problem requires advanced normalization theory, distributed transactions, recovery internals, or query-planner internals beyond lesson scope

**Recommended usage scope**
- ACID and isolation basics: `understanding_only`
- index/plan tradeoff questions: `shared`
- anomaly diagnosis scenarios: `shared` or `comprehensive_only`

### 6. `network`
**Current lesson scope**
- `CSK-NW-01-01`: HTTP over TCP
- `CSK-NW-01-02`: DNS and routing
- `CSK-NW-01-03`: TCP vs UDP
- `CSK-NW-01-04`: HTTP status codes, DNS flow, failure diagnosis

**Core learning objectives**
- Distinguish application-layer and transport-layer roles
- Distinguish name resolution from packet routing
- Compare TCP and UDP by guarantees and use case
- Perform basic web-network failure reasoning

**Use as `aligned` when**
- The problem tests HTTP vs TCP role separation, DNS flow, TCP vs UDP selection, status code interpretation, or first-pass network diagnosis

**Use as `adaptable` when**
- The problem is in scope conceptually but over-indexes on packet-level detail not covered in lessons

**Use as `out_of_scope` when**
- The problem requires subnetting math, routing protocol internals, TLS handshake internals, or transport congestion-control analysis beyond current scope

**Recommended usage scope**
- Layer distinction and DNS basics: `understanding_only`
- protocol-choice and troubleshooting questions: `shared`
- mixed-failure scenario questions: `comprehensive_only`

### 7. `os`
**Current lesson scope**
- `CSK-OS-01-01`: process vs thread
- `CSK-OS-01-02`: scheduling and context switch
- `CSK-OS-01-03`: memory, virtual memory, paging, swap
- `CSK-OS-01-04`: filesystem, locks, deadlock

**Core learning objectives**
- Distinguish process isolation vs thread sharing
- Explain scheduling and context-switch cost
- Explain virtual memory and paging basics
- Explain lock semantics and deadlock preconditions

**Use as `aligned` when**
- The problem tests process/thread difference, context-switch tradeoff, page fault behavior, mutex vs semaphore, or deadlock conditions

**Use as `adaptable` when**
- The concept matches but the problem is too implementation-specific or too OS-vendor-specific

**Use as `out_of_scope` when**
- The problem requires kernel scheduling algorithms in detail, page-replacement theory, file-system journaling internals, or concurrency formalism beyond lesson scope

**Recommended usage scope**
- process/thread and lock basics: `understanding_only`
- virtual-memory and deadlock diagnosis: `shared`
- multi-concept OS scenarios: `comprehensive_only`

### 8. `security`
**Current lesson scope**
- `CSK-SC-01-01`: authentication vs authorization
- `CSK-SC-01-02`: hashing vs encryption
- `CSK-SC-01-03`: XSS, SQL injection, CSRF
- `CSK-SC-01-04`: logging and incident response

**Core learning objectives**
- Distinguish identity verification from permission control
- Distinguish irreversible verification from reversible secrecy
- Explain major web vulnerabilities and baseline defenses
- Explain logging/monitoring and incident-response flow

**Use as `aligned` when**
- The problem tests auth/authz distinction, hashing vs encryption, XSS/SQLi/CSRF defense logic, or incident-response phases

**Use as `adaptable` when**
- The concept is in scope but the framing assumes product-security depth beyond current lessons

**Use as `out_of_scope` when**
- The problem requires cryptographic protocol details, exploit development, secure coding frameworks beyond lesson content, or enterprise governance detail not taught

**Recommended usage scope**
- term distinction and defense basics: `understanding_only`
- applied web-security scenarios: `shared`
- multi-step incident and defense tradeoff cases: `comprehensive_only`

## Manual Review Queue Priorities

### Highest Priority
- `computer_architecture`
- `network`
- `os`

Reason:
- These categories have the largest explicit-difficulty shortages relative to the comprehensive target.
- They are also vulnerable to overusing questions that were written for current `check/final` pools.

### Second Priority
- `basic_theory`
- `database`
- `data_structure`
- `algorithm`

Reason:
- Total counts are adequate, but medium/easy rebalance and `unset` reclassification are still required.

### Lowest Priority
- `security`

Reason:
- Security is the only category that already clears the explicit comprehensive target floor.

## Review Instructions
- Start with the current `unset` bucket first.
- For each question, decide:
  - Is the concept explicitly taught?
  - If yes, is the wording level-appropriate?
  - If yes, should it be understanding-only, shared, or comprehensive-only?
- Do not reclassify by intuition alone.
- Every classification should point back to at least one lesson topic or key point.

## Expected Next Artifact
- A real problem spreadsheet or structured dataset containing:
  - question id
  - current category
  - current difficulty
  - proposed category
  - lesson/topic mapping
  - classification state
  - usage scope
  - action needed
