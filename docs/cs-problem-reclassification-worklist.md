# CS Problem Reclassification Worklist

## Purpose
- This document turns the baseline audit and classification matrix into an execution worklist.
- It is intended for the actual `question-by-question` review pass.
- It focuses on:
  - where the current bank is misaligned with lesson scope
  - which buckets can be salvaged fastest
  - which categories need new writing after reclassification

## Current Target
- Understanding tests remain lesson-aligned assets.
- Comprehensive exam target remains:
  - `8 categories`
  - `10 questions per category`
  - `80 total`
  - per category: `3 easy / 5 medium / 2 hard`
  - minimum pool target per category: `30 total`, `9 easy / 15 medium / 6 hard`

## Review Order
1. `computer_architecture`
2. `network`
3. `os`
4. `algorithm`
5. `basic_theory`
6. `database`
7. `data_structure`
8. `security`

## Action Labels
- `relabel_difficulty`
  - In-scope question, but difficulty must be set or corrected.
- `move_to_shared`
  - In-scope and reusable for understanding tests plus comprehensive exam.
- `move_to_comprehensive_only`
  - In-scope, but too integrative or too heavy for understanding tests.
- `exclude_out_of_scope`
  - Not aligned to the current lesson flow.
- `rewrite_from_existing`
  - Concept is near scope, but wording or framing should be rewritten.
- `write_new`
  - Missing lesson objective coverage after cleanup.

## Category Worklist

### 1. `computer_architecture`
**Current state**
- Published: `55`
- Explicit difficulty: `17`
- Unset: `38`
- Shortage against target: `easy -4`, `medium -9`

**Primary problem**
- This bank is mixing current lesson scope with older broad hardware/IT-fundamentals content.
- A large share of `unset` looks reclassifiable, but there is also clear out-of-scope contamination.

**Likely `shared` / `relabel_difficulty` candidates**
- `03e72e6e-2031-4780-88f0-3474798b4721`
  - "CPU is the central component that interprets and executes instructions"
- `151792e4-936a-4df6-a836-5bd2862ef8cd`
  - interrupt handling
- `21a5ccb3-15b4-4f90-8023-5b5e1668f89c`
  - clock frequency
- `24e4c27d-8945-4fa8-a6d3-557e512a2f41`
  - MIPS

**Likely `exclude_out_of_scope` candidates**
- `055d36e7-4f6c-4b30-b61e-5c26ca7951fe`
  - RAID1
- `095bfc34-3d01-4054-8080-c3b307d0825b`
  - indirect addressing mode
- `0d54e583-c7e0-4695-b5fd-b1d6c8b62fbf`
  - RISC processor characteristics
- `0e6d3ea6-a8bb-4f3a-b34d-51c965fb5072`
  - BIOS role
- `1a5013b6-bfd6-4fb7-b959-d4308a67fa81`
  - virtual memory
- `1f3c5959-f4a0-4d35-8af8-59136db213a1`
  - pipeline processing
- `2b2962e5-0528-47e7-b8ff-3d3d8d70c81a`
  - RAID5 parity

**Recommended actions**
- Review all `38 unset` first.
- Strip out storage redundancy, addressing modes, and microarchitecture topics.
- Rebuild the category around:
  - CPU / memory / storage roles
  - locality and cache
  - interrupt vs polling
  - throughput / latency / metric interpretation
- Expect meaningful `write_new` need even after relabeling.

### 2. `network`
**Current state**
- Published: `65`
- Explicit difficulty: `18`
- Unset: `47`
- Shortage against target: `easy -3`, `medium -9`

**Primary problem**
- This bank is still a full networking fundamentals pool, not the current 4-lesson network course.
- Current course scope is much narrower than the stored bank.

**Likely `shared` / `relabel_difficulty` candidates**
- `16f95438-6778-43a0-86f3-ac93e96c52c4`
  - DNS role
- `216a6a61-68a2-47ee-a22a-477539a26366`
  - router role
- `6637de53-593c-4282-82ae-cd19190032bd`
  - TCP vs UDP difference
- `677e3af3-2cef-4c9e-9394-29d3322522dc`
  - three-way handshake may be `rewrite_from_existing` if retained at all

**Likely `exclude_out_of_scope` candidates**
- `15a20286-3641-45e8-a2c6-f89c10bb4fdc`
  - SDN
- `23ea8a00-4d1c-4c63-a683-00b0f4c1f880`
  - OSI layer-number trivia
- `2e509566-eacf-4451-80b4-6877a7c5739a`
  - ARP
- `4c9943f6-3c8c-4ef1-8576-fac3f9faf845`
  - IPv4 vs IPv6
- `4facfa87-5d0a-4f40-b57d-f1ecb5a2572f`
  - DHCP
- `564ee84f-7eda-46f8-823d-35ede3a0ae81`
  - proxy server
- `677eb171-baf0-4cf1-a455-cde153753bdd`
  - Bluetooth
- `146b4e91-f8e5-44c5-9a4f-63395a01ea43`
  - subnet host-count math
- `3f1d5530-80d4-4569-83d5-801ae13902f8`
  - VPN tunneling
- `6f42211a-1ef3-466f-9c42-1d032c2428cf`
  - recursive vs iterative DNS query detail

**Recommended actions**
- Treat this as one of the highest cleanup priorities.
- Keep only items that support:
  - HTTP over TCP
  - DNS vs routing role distinction
  - TCP vs UDP use-case selection
  - basic status-code / failure diagnosis
- Plan for aggressive exclusion and rewrite.
- Expect substantial `write_new` demand in `easy` and `medium`.

### 3. `os`
**Current state**
- Published: `31`
- Explicit difficulty: `18`
- Unset: `13`
- Shortage against target: `easy -3`, `medium -9`

**Primary problem**
- Total count barely clears the comprehensive minimum.
- This means any out-of-scope removal will create immediate writing pressure.

**Likely `shared` / `relabel_difficulty` candidates**
- `032c0b44-1678-4962-8c01-228d5316f647`
  - filesystem role
- `24ac73b6-aa51-451c-a9a9-dacc4154e48a`
  - thrashing
- `29063da6-e6f0-4714-8181-c0be4984111a`
  - thrashing explanation
- `416543ee-3456-4134-819a-905828f72b35`
  - semaphore
- `41ddb427-9b7f-49d2-8c0a-96c4698996ba`
  - deadlock
- `50bba785-d14f-4526-a80c-9380918ef2fc`
  - paging
- `8eed3b0e-44fb-479d-86d9-569cc8ca60b4`
  - round-robin scheduling
- `dd996a7e-3fc3-4ff1-8a50-abfabc02eaba`
  - process vs thread

**Likely `exclude_out_of_scope` candidates**
- `6f913e4a-8c11-48d8-819b-3b52b4814389`
  - B-tree use case
- `8fe9e9f4-956d-49bb-b0f5-f23c44bb2265`
  - sampling
- `ef47d31a-9cd7-4dab-9b93-2653f0c995dd`
  - GPU use case
- `69eaec02-12cd-4d1e-90d4-98e54d8c16cc`
  - page-replacement algorithm detail
- `9badd323-59f9-44bf-96b2-31bb14635104`
  - i-node internals

**Recommended actions**
- Reclassify all `13 unset` immediately.
- Keep deadlock, paging, scheduling, process/thread, lock semantics.
- Remove data-structure crossover and hardware crossover.
- After cleanup, this category will almost certainly need `write_new`.

### 4. `algorithm`
**Current state**
- Published: `74`
- Explicit difficulty: `27`
- Unset: `47`
- Shortage against target: `medium -6`

**Primary problem**
- This pool mixes current course topics with advanced algorithm/data-structure content from a wider fundamentals bank.

**Likely `shared` / `relabel_difficulty` candidates**
- `0ab0963c-2991-4689-9110-ade27562b21a`
  - selection sort
- `18762e1c-81aa-4040-b4e6-13648c020f04`
  - binary search concept
- `2f032201-b165-4f60-9126-c900995605f3`
  - linear search
- `4e94611d-cc3c-4cee-b97b-ff208accc3c0`
  - recursion
- `546bda78-840e-40b5-8d2c-917e69f8e097`
  - DFS

**Likely `exclude_out_of_scope` candidates**
- `0e11e446-d114-4510-80fb-64693c391701`
  - BST relation
- `239e9278-3aaa-4fb5-bc58-1c946e9c2642`
  - dynamic programming
- `35b6187b-988b-4c0b-8211-3e23a62fd41b`
  - BST average complexity
- `2cc4ffc2-3a06-4e95-b63f-8b9501349466`
  - topological sort
- `49a2dcd9-c7cc-4451-88af-bb894fdc1436`
  - amortized analysis
- `503b2a5e-4d2d-4dc1-b7cc-f50821ee8e7e`
  - hash collision

**Recommended actions**
- Remove data-structure crossover first.
- Keep search, sort, recursion, BFS/DFS, Big-O interpretation.
- This category is salvageable mostly by cleanup plus medium-difficulty rebuild.

### 5. `basic_theory`
**Current state**
- Published: `76`
- Explicit difficulty: `30`
- Unset: `46`
- Shortage against target: `easy -3`, `medium -3`

**Primary problem**
- This category contains the heaviest taxonomy drift in the entire bank.
- It mixes representation theory with digital logic, networking math, security, and even programming-language/design-pattern content.

**Likely `shared` / `relabel_difficulty` candidates**
- `039ebc96-91fb-4c33-a324-cf3ed7dba7cd`
  - hex to decimal conversion
- `07c97caf-5d45-44b7-a89e-16d4ff35febf`
  - Unicode
- `09c44c88-8577-442f-9a4d-ca3d217452be`
  - KB size
- `0e0fb076-2dc8-4a5b-8777-a2cff715a534`
  - complement
- `11ea907a-9ad9-4a85-be3b-dd4408695c2e`
  - left shift meaning
- `1ce77ee1-1f22-4a9f-9323-783b83099e24`
  - decimal to binary

**Likely `exclude_out_of_scope` candidates**
- `0337b18c-cdee-42d7-a2cc-6a4f4f8377ab`
  - NAND circuit composition
- `143e7810-7e86-40af-811e-52bf78cb9183`
  - CIDR host-count math
- `1b2e3149-beec-4026-bcdd-9ca597ed07ca`
  - parity bit
- `1e0725d7-ea3a-4faa-a68b-92be9abb9ea8`
  - information entropy
- `204f8eb2-d46b-4c4c-90d6-951efd01f333`
  - Karnaugh map
- `2c1e4c0d-75be-4d35-a8f3-fa84f8b002b0`
  - buffer overflow
- `18754247-bf1a-4fd0-abcc-19c827097d34`
  - GC memory leak
- `1c054534-6690-4e34-9a0a-9ddd7bbfd011`
  - Strategy pattern
- `1f781b40-67d7-4cd3-9dbc-00fbd2077b70`
  - Abstract Factory
- `311e4b47-af7e-42b5-84b6-3d2c6c7ef71d`
  - Java type erasure
- `3e509652-1e69-4d09-b535-de845b5a8ac9`
  - SOLID DIP

**Recommended actions**
- This category needs a hard reset around the 4 current lessons.
- Reuse only number representation, encoding, signed/unsigned, overflow, IEEE 754 questions.
- Do not try to salvage unrelated IT-fundamentals or software-engineering content into this category.

### 6. `database`
**Current state**
- Published: `85`
- Explicit difficulty: `30`
- Unset: `55`
- Shortage against target: `easy -3`, `medium -3`

**Primary problem**
- Strong total inventory, but broad scope drift.
- Current course is not a general SQL/RDBMS survey; it is narrower and centered on indexes, ACID, isolation, and execution plans.

**Likely `shared` / `relabel_difficulty` candidates**
- `1833c5be-ffe5-4809-9a27-42785e45df6f`
  - Atomicity
- `1cfb75bc-dbbc-467a-ba3c-c376cf8f8567`
  - rollback
- `2b5cac44-6a92-4d26-bde2-f19fe25abf06`
  - optimistic vs pessimistic lock
- `07584d8a-6ce0-470a-a52c-7020a0eab51b`
  - B+ tree index

**Likely `exclude_out_of_scope` candidates**
- `00f25bd9-b6d1-4203-8bb6-644286cbf24f`
  - HAVING clause
- `0f2afa04-2f24-442c-87c9-80f9646e2e01`
  - INNER JOIN
- `10f7e87c-2916-4a75-b9fe-2699b8461faf`
  - LEFT OUTER JOIN
- `16604894-477a-4ffa-9793-0b233a716cac`
  - DELETE statement
- `1893de19-ef11-466b-9e84-a5ece87054c4`
  - ORDER BY
- `1d5c7995-c7a7-4fbb-8d44-9ec75dd14b24`
  - NULL
- `21e6ec52-718c-4af8-84b5-9deede0bcaa7`
  - NoSQL
- `2600ac0d-c805-4d24-a1b6-e6625c8cd55f`
  - normalization
- `3290312f-a4ab-4b97-ac4c-7799cbd5ad91`
  - relational algebra projection
- `32f98074-6006-4e74-8214-0009521afc02`
  - primary key

**Recommended actions**
- Keep transaction/isolation/index/plan content first.
- Rewrite some SQL syntax questions into plan or tradeoff questions if possible.
- Remove broad introductory database trivia from the core category.

### 7. `data_structure`
**Current state**
- Published: `65`
- Explicit difficulty: `27`
- Unset: `38`
- Shortage against target: `medium -6`

**Primary problem**
- This bank is relatively salvageable, but it still contains spillover from algorithm/graph/advanced-tree topics.

**Likely `shared` / `relabel_difficulty` candidates**
- `01c5885c-31aa-416f-b801-09d73c63f347`
  - stack push/pop order
- `0437cdd6-66c4-4d19-98e1-272334585dea`
  - priority queue
- `0b2e3540-e45c-4592-9feb-afd967aa410b`
  - FIFO
- `1424846f-27dd-4183-ad88-e8004332934a`
  - circular list
- `248deab1-9e65-4829-8adc-f2af2965bd2c`
  - stack overflow
- `3451d42b-ca79-4117-8534-5270b4b9f2e2`
  - heap
- `357d01f7-be9b-4321-990e-8f3e083da33d`
  - queue
- `3f49c18b-4213-4a1c-80a8-115a74908236`
  - list insertion complexity

**Likely `exclude_out_of_scope` candidates**
- `05f4ef1b-4af0-464c-9f4f-79424d0d9374`
  - adjacency list graph advantage
- `32f9f115-fd68-4406-9cd0-38c376a175ea`
  - stable sort
- `4ca917cb-a7ba-4136-988d-fd1f72afa12e`
  - Trie use case
- `4f4db782-5129-4c29-8264-600445cf8aee`
  - postfix expression evaluation
- `0ff946b9-a5f9-4433-bdd6-fddb505d74f5`
  - B-tree

**Recommended actions**
- Keep this category tightly on:
  - array vs linked list
  - stack vs queue
  - BST / heap / priority queue
  - hash / collision / tradeoffs
- Rebuild missing `medium` after removing graph/sort crossover.

### 8. `security`
**Current state**
- Published: `113`
- Explicit difficulty: `67`
- Unset: `46`
- Shortage against target: none

**Primary problem**
- This is the strongest category by raw volume, but it is also broader than the current 4 lessons.
- The main job here is scope cleanup, not immediate shortage repair.

**Likely `shared` / `relabel_difficulty` candidates**
- `0a324bcd-96fc-4dee-9d50-1f778f7b304f`
  - confidentiality
- `12e83a12-f2fb-43c8-bf73-b07e676dfede`
  - encryption explanation
- `283e8893-597e-436d-bea3-97dfc5b362d5`
  - firewall role
- `2881d971-0dc6-4983-9d61-72b25475c5e7`
  - social engineering
- `3fe46a92-541c-47e1-8031-694c8ac99c44`
  - ransomware

**Likely `exclude_out_of_scope` candidates**
- `072a76df-e7c2-40da-b5fb-297869e83481`
  - AES
- `0909aee6-e229-487d-89e6-ce7db0524f08`
  - access prohibition law
- `158ddbe8-e11a-4731-b6ee-9cd706b2d4fa`
  - RSA
- `1e200014-e752-4437-97fb-b34b19d5f9c9`
  - public-key pair terminology
- `1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642`
  - digital signature
- `17f32ec7-df21-49a5-8387-38ba011e1f66`
  - OAuth 2.0
- `18e107e1-5065-4bfa-9a55-03f584a48cee`
  - TLS 1.3

**Recommended actions**
- Use this category as the model for pool sizing, not as the model for scope.
- Preserve auth/authz, hashing vs encryption, XSS/SQLi/CSRF, logging/incident response.
- Move advanced crypto and policy/compliance material to backlog.

## Cross-Category Findings
- Current banks were not written against one stable curriculum boundary.
- `basic_theory` has the worst category drift.
- `computer_architecture`, `network`, and `os` are the most urgent because they combine scope drift with explicit-difficulty shortage.
- `security` has the healthiest volume but still needs scope cleanup.

## Immediate Execution Steps
1. Review all `unset` items in the top 4 priority categories first.
2. Assign each reviewed question:
   - lesson mapping
   - classification state
   - usage scope
   - action label
3. Remove or quarantine `exclude_out_of_scope` items before counting comprehensive readiness.
4. Recalculate category inventory after cleanup.
5. Derive the actual `write_new` shortage from the cleaned inventory, not the current raw inventory.

## Expected Next Artifact
- A structured CSV or markdown table with:
  - `question_id`
  - `current_category`
  - `current_difficulty`
  - `lesson_mapping`
  - `classification_state`
  - `usage_scope`
  - `action_label`
  - `notes`
