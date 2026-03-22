# CS Governance Rollout Status

## Purpose
- Track which parts of the CS question governance rollout are already reflected in migrations.

## Applied In Code
- selector understands:
  - `curriculum_status`
  - `question_usage_scope`
- selector behavior:
  - excludes `exclude`
  - excludes `out_of_scope`
  - prioritizes `comprehensive_only`
  - then `shared`
  - then `understanding_only`

## Migration Sequence
- `00118_cs_question_governance.sql`
  - adds governance columns
- `00119_cs_first_pass_governance_seed.sql`
  - seeds first-pass decisions for priority categories
- `00120_cs_first_pass_governance_seed_part2.sql`
  - seeds first-pass decisions for the remaining reviewed representative categories
- `00121_cs_second_pass_governance_seed.sql`
  - closes the first shortage-driven relabeling batch for `computer_architecture`, `network`, and `os`
- `00122_cs_second_pass_governance_seed_part2.sql`
  - closes the remaining counted easy/medium shortages across the rest of the CS bank

## Covered By First-Pass Seeds
- `computer_architecture`
- `network`
- `os`
- `algorithm`
- `basic_theory`
- `database`
- `data_structure`
- `security`
- `computer_architecture` second-pass shortage relabeling
- `network` second-pass shortage relabeling
- `os` second-pass shortage relabeling + `1` net-new question
- `basic_theory` second-pass shortage relabeling
- `data_structure` second-pass shortage relabeling
- `algorithm` second-pass shortage relabeling
- `database` second-pass shortage relabeling

## Not Covered Yet
- full-bank review
- duplicate-pruning execution
- second-pass `adaptable` rewrite decisions
- final counted inventory after governance rollout was produced, but full-bank relabeling is not done yet

## Next Operational Step
1. use the live recount as the new baseline
2. review approved `unset difficulty` rows category by category
3. relabel enough rows to close easy/medium gaps
4. recount again
5. start net-new writing only where the relabeled pool still misses target
