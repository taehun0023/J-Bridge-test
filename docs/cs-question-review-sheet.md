# CS Question Review Sheet

## Purpose
- This is the working sheet for question-by-question classification.
- It starts with seeded rows from the highest-priority categories.
- Add rows continuously as the review proceeds.

## Column Rules
- `lesson_mapping`
  - use concrete lesson IDs such as `CSK-NW-01-02`
- `classification_state`
  - `aligned`
  - `adaptable`
  - `out_of_scope`
- `usage_scope`
  - `understanding_only`
  - `shared`
  - `comprehensive_only`
  - `exclude`
- `action_label`
  - `relabel_difficulty`
  - `move_to_shared`
  - `move_to_comprehensive_only`
  - `exclude_out_of_scope`
  - `rewrite_from_existing`
  - `write_new`

## Review Table

| question_id | current_category | current_difficulty | question_summary | lesson_mapping | classification_state | usage_scope | action_label | notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `03e72e6e-2031-4780-88f0-3474798b4721` | `computer_architecture` | `unset` | CPU role | `CSK-CA-01-01` | `aligned` | `shared` | `relabel_difficulty` | core role-distinction item; likely easy |
| `151792e4-936a-4df6-a836-5bd2862ef8cd` | `computer_architecture` | `unset` | interrupt handling | `CSK-CA-01-03` | `aligned` | `shared` | `relabel_difficulty` | in current I/O and interrupt scope; likely medium |
| `0fd26370-fd67-4c7a-a01d-259ddb57cc0f` | `computer_architecture` | `hard` | cache miss | `CSK-CA-01-02` | `aligned` | `comprehensive_only` | `move_to_comprehensive_only` | good integrated locality scenario if distractors stay lesson-bounded |
| `21a5ccb3-15b4-4f90-8023-5b5e1668f89c` | `computer_architecture` | `unset` | clock frequency | `CSK-CA-01-04` | `adaptable` | `understanding_only` | `rewrite_from_existing` | usable if phrasing stays metric-interpretation level, not hardware-detail trivia |
| `24e4c27d-8945-4fa8-a6d3-557e512a2f41` | `computer_architecture` | `unset` | MIPS metric | `CSK-CA-01-04` | `aligned` | `shared` | `relabel_difficulty` | strong candidate for metric interpretation pool; likely medium |
| `6bc2b9bb-eb5d-49fe-8877-16d88b4bf324` | `computer_architecture` | `medium` | bus role | `CSK-CA-01-03` | `aligned` | `shared` | `move_to_shared` | directly matches I/O and bus lesson objective |
| `43231cac-d469-4bc0-8d3d-e0bde37e671c` | `computer_architecture` | `hard` | large-file slowdown suspicion | `CSK-CA-01-04` | `adaptable` | `comprehensive_only` | `rewrite_from_existing` | useful if rewritten around throughput/latency and storage-path reasoning |
| `055d36e7-4f6c-4b30-b61e-5c26ca7951fe` | `computer_architecture` | `unset` | RAID1 |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | storage redundancy is outside current CA lesson scope |
| `095bfc34-3d01-4054-8080-c3b307d0825b` | `computer_architecture` | `unset` | indirect addressing mode |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | instruction/addressing detail not taught |
| `0d54e583-c7e0-4695-b5fd-b1d6c8b62fbf` | `computer_architecture` | `unset` | RISC characteristics |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | processor architecture taxonomy outside current lessons |
| `0e6d3ea6-a8bb-4f3a-b34d-51c965fb5072` | `computer_architecture` | `unset` | BIOS role |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | firmware boot role not in current CA module |
| `16f95438-6778-43a0-86f3-ac93e96c52c4` | `network` | `unset` | DNS role | `CSK-NW-01-02` | `aligned` | `shared` | `relabel_difficulty` | core scope item; likely easy |
| `3e2a1d63-6aad-4f1c-a869-46c0cfff7889` | `network` | `medium` | DNS main role | `CSK-NW-01-02` | `aligned` | `shared` | `move_to_shared` | duplicate theme but already difficulty-labeled; retain best phrasing only |
| `216a6a61-68a2-47ee-a22a-477539a26366` | `network` | `unset` | router role | `CSK-NW-01-02` | `aligned` | `shared` | `relabel_difficulty` | fits DNS vs routing role distinction; likely easy |
| `6637de53-593c-4282-82ae-cd19190032bd` | `network` | `unset` | TCP vs UDP | `CSK-NW-01-03` | `aligned` | `shared` | `relabel_difficulty` | core protocol-choice question; likely easy or medium |
| `4a95ffdb-046e-42d7-90df-6d9f0472710a` | `network` | `easy` | TCP vs UDP difference | `CSK-NW-01-03` | `aligned` | `understanding_only` | `move_to_shared` | keep only one best version with the unset duplicate above |
| `89bf300a-a74b-414f-98c8-a2d8d0848cc5` | `network` | `unset` | HTTP 404 meaning | `CSK-NW-01-04` | `aligned` | `understanding_only` | `relabel_difficulty` | direct status-code item; likely easy |
| `6ab8f9ee-b97a-4181-aef1-2af1cf0c43e1` | `network` | `unset` | HTTPS S meaning | `CSK-NW-01-01` | `adaptable` | `understanding_only` | `rewrite_from_existing` | acceptable if tied to HTTP over TCP/security baseline, not TLS deep dive |
| `677e3af3-2cef-4c9e-9394-29d3322522dc` | `network` | `unset` | three-way handshake | `CSK-NW-01-01` | `adaptable` | `understanding_only` | `rewrite_from_existing` | keep only if phrased as HTTP over TCP connection setup, not packet-detail memorization |
| `15a20286-3641-45e8-a2c6-f89c10bb4fdc` | `network` | `unset` | SDN |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | outside current network curriculum |
| `2e509566-eacf-4451-80b4-6877a7c5739a` | `network` | `unset` | ARP |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | protocol detail outside current 4-lesson flow |
| `4facfa87-5d0a-4f40-b57d-f1ecb5a2572f` | `network` | `unset` | DHCP |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | address assignment is not in current lesson scope |
| `146b4e91-f8e5-44c5-9a4f-63395a01ea43` | `network` | `medium` | subnet host-count math |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | subnet calculation is explicitly outside current network lessons |
| `032c0b44-1678-4962-8c01-228d5316f647` | `os` | `unset` | filesystem role | `CSK-OS-01-04` | `aligned` | `understanding_only` | `relabel_difficulty` | direct lesson-fit; likely easy |
| `24ac73b6-aa51-451c-a9a9-dacc4154e48a` | `os` | `unset` | thrashing term | `CSK-OS-01-03` | `adaptable` | `comprehensive_only` | `rewrite_from_existing` | current lesson covers paging/swap; keep only if explained through high-level symptom framing |
| `433a7e3c-9770-426f-9455-2eb547c19619` | `os` | `medium` | page-fault situation | `CSK-OS-01-03` | `aligned` | `shared` | `move_to_shared` | explicit page-fault coverage is needed in the core pool |
| `416543ee-3456-4134-819a-905828f72b35` | `os` | `unset` | semaphore | `CSK-OS-01-04` | `aligned` | `shared` | `relabel_difficulty` | lock semantics are in scope; likely medium |
| `50bba785-d14f-4526-a80c-9380918ef2fc` | `os` | `unset` | paging | `CSK-OS-01-03` | `aligned` | `shared` | `relabel_difficulty` | direct VM lesson item; likely medium |
| `8eed3b0e-44fb-479d-86d9-569cc8ca60b4` | `os` | `unset` | round-robin scheduling | `CSK-OS-01-02` | `aligned` | `shared` | `relabel_difficulty` | scheduling concept in current scope; likely medium |
| `92ff8bca-5a83-4b6c-af36-0b0e2dbfd61f` | `os` | `hard` | deadlock four conditions | `CSK-OS-01-04` | `aligned` | `comprehensive_only` | `move_to_comprehensive_only` | good hard pool candidate if wording stays within taught deadlock conditions |
| `6f913e4a-8c11-48d8-819b-3b52b4814389` | `os` | `unset` | B-tree use case |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | data-structure crossover, not OS lesson content |
| `ef47d31a-9cd7-4dab-9b93-2653f0c995dd` | `os` | `unset` | GPU use case |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | hardware crossover, not OS lesson content |
| `0ab0963c-2991-4689-9110-ade27562b21a` | `algorithm` | `unset` | selection sort | `CSK-AL-01-02` | `aligned` | `understanding_only` | `relabel_difficulty` | direct sort-basics item; likely easy |
| `18762e1c-81aa-4040-b4e6-13648c020f04` | `algorithm` | `unset` | binary search concept | `CSK-AL-01-01` | `aligned` | `shared` | `relabel_difficulty` | direct search-precondition content; likely easy |
| `4e94611d-cc3c-4cee-b97b-ff208accc3c0` | `algorithm` | `unset` | recursion | `CSK-AL-01-03` | `aligned` | `shared` | `relabel_difficulty` | recursion basics are explicitly taught; likely easy or medium |
| `43a5e112-3ef5-443d-bfd6-360049eae6fc` | `algorithm` | `medium` | BFS uses queue | `CSK-AL-01-03` | `aligned` | `shared` | `move_to_shared` | practical BFS implementation relation is in-scope |
| `546bda78-840e-40b5-8d2c-917e69f8e097` | `algorithm` | `unset` | DFS | `CSK-AL-01-03` | `aligned` | `shared` | `relabel_difficulty` | graph traversal basics are in scope; likely medium |
| `a52b3363-2185-41b4-9ad1-0bb100b8a12c` | `algorithm` | `unset` | BFS explanation | `CSK-AL-01-03` | `aligned` | `shared` | `relabel_difficulty` | pairs with DFS explanation; likely medium |
| `06a490a9-73a4-4ec9-b9e8-c35ef66ee630` | `algorithm` | `easy` | Big-O meaning | `CSK-AL-01-04` | `aligned` | `understanding_only` | `move_to_shared` | direct complexity interpretation starter item |
| `09f6329d-ebd5-4041-b7d5-fc30652dc5e1` | `algorithm` | `hard` | BFS vs DFS comparison | `CSK-AL-01-03` | `aligned` | `comprehensive_only` | `move_to_comprehensive_only` | good hard integrative item if distractors stay within lesson framing |
| `239e9278-3aaa-4fb5-bc58-1c946e9c2642` | `algorithm` | `unset` | dynamic programming |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | advanced algorithm topic beyond current lessons |
| `2cc4ffc2-3a06-4e95-b63f-8b9501349466` | `algorithm` | `hard` | topological sort |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | advanced graph topic beyond current lessons |
| `49a2dcd9-c7cc-4451-88af-bb894fdc1436` | `algorithm` | `hard` | amortized analysis |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | complexity formalism beyond current lessons |
| `039ebc96-91fb-4c33-a324-cf3ed7dba7cd` | `basic_theory` | `unset` | hex to decimal conversion | `CSK-BT-01-01` | `aligned` | `shared` | `relabel_difficulty` | direct number-representation item; likely easy |
| `07c97caf-5d45-44b7-a89e-16d4ff35febf` | `basic_theory` | `unset` | Unicode | `CSK-BT-01-02` | `aligned` | `shared` | `relabel_difficulty` | encoding topic is in current scope; likely medium |
| `0e0fb076-2dc8-4a5b-8777-a2cff715a534` | `basic_theory` | `unset` | complement | `CSK-BT-01-03` | `aligned` | `shared` | `relabel_difficulty` | maps to signed/unsigned and two's complement; likely medium |
| `0337b18c-cdee-42d7-a2cc-6a4f4f8377ab` | `basic_theory` | `unset` | NAND circuit composition |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | digital logic design outside current scope |
| `143e7810-7e86-40af-811e-52bf78cb9183` | `basic_theory` | `unset` | CIDR host-count math |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | networking math belongs nowhere in current BT lessons |
| `1e0725d7-ea3a-4faa-a68b-92be9abb9ea8` | `basic_theory` | `unset` | information entropy |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | too advanced and outside taught topics |
| `1833c5be-ffe5-4809-9a27-42785e45df6f` | `database` | `unset` | Atomicity | `CSK-DB-01-02` | `aligned` | `shared` | `relabel_difficulty` | direct ACID concept; likely easy |
| `1cfb75bc-dbbc-467a-ba3c-c376cf8f8567` | `database` | `unset` | rollback | `CSK-DB-01-02` | `aligned` | `shared` | `relabel_difficulty` | direct transaction control concept; likely easy or medium |
| `2b5cac44-6a92-4d26-bde2-f19fe25abf06` | `database` | `unset` | optimistic vs pessimistic lock | `CSK-DB-01-03` | `adaptable` | `comprehensive_only` | `rewrite_from_existing` | adjacent to isolation/anomaly content, but may be too implementation-leaning as-is |
| `07584d8a-6ce0-470a-a52c-7020a0eab51b` | `database` | `unset` | B+ tree index | `CSK-DB-01-01` | `adaptable` | `comprehensive_only` | `rewrite_from_existing` | keep only if framed as index tradeoff, not storage-engine detail |
| `00f25bd9-b6d1-4203-8bb6-644286cbf24f` | `database` | `unset` | HAVING clause |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | SQL syntax trivia outside current lesson boundary |
| `2600ac0d-c805-4d24-a1b6-e6625c8cd55f` | `database` | `unset` | normalization |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | relational design theory not in current DB lessons |
| `01c5885c-31aa-416f-b801-09d73c63f347` | `data_structure` | `unset` | stack push/pop order | `CSK-DS-01-02` | `aligned` | `understanding_only` | `relabel_difficulty` | direct stack-basics item; likely easy |
| `0437cdd6-66c4-4d19-98e1-272334585dea` | `data_structure` | `unset` | priority queue | `CSK-DS-01-03` | `aligned` | `shared` | `relabel_difficulty` | lesson-fit and reusable; likely medium |
| `3451d42b-ca79-4117-8534-5270b4b9f2e2` | `data_structure` | `unset` | heap | `CSK-DS-01-03` | `aligned` | `shared` | `relabel_difficulty` | core heap concept; likely medium |
| `4ca917cb-a7ba-4136-988d-fd1f72afa12e` | `data_structure` | `unset` | Trie use case |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | non-covered structure |
| `0ff946b9-a5f9-4433-bdd6-fddb505d74f5` | `data_structure` | `hard` | B-tree |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | advanced tree topic outside current lessons |
| `0a324bcd-96fc-4dee-9d50-1f778f7b304f` | `security` | `unset` | confidentiality | `CSK-SC-01-04` | `adaptable` | `understanding_only` | `rewrite_from_existing` | usable if tied to logging/incident context or CIA baseline framing |
| `12e83a12-f2fb-43c8-bf73-b07e676dfede` | `security` | `unset` | encryption explanation | `CSK-SC-01-02` | `aligned` | `shared` | `relabel_difficulty` | direct hash vs encryption lesson scope; likely easy |
| `283e8893-597e-436d-bea3-97dfc5b362d5` | `security` | `unset` | firewall role |  | `adaptable` | `comprehensive_only` | `rewrite_from_existing` | network security control adjacent but not directly taught in current 4-lesson flow |
| `072a76df-e7c2-40da-b5fb-297869e83481` | `security` | `unset` | AES |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | cryptographic algorithm detail beyond current lessons |
| `158ddbe8-e11a-4731-b6ee-9cd706b2d4fa` | `security` | `unset` | RSA |  | `out_of_scope` | `exclude` | `exclude_out_of_scope` | advanced crypto detail beyond current lessons |

## Next Rows To Add
- more `computer_architecture` rows from the `unset` bucket, especially cache/locality candidates
- more `network` rows tied to failure diagnosis rather than protocol trivia
- more `os` rows for mutex/deadlock wording variants
- duplicate-pruning decisions where one `unset` row overlaps an already-labeled explicit row
- second-pass rows for categories marked `adaptable`

## Working Rule
- Do not finalize shortage counts from this sheet until all priority categories are reviewed.
