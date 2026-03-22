# CS Second-Pass Governance Batch 1

## Scope
- Migration: `00121_cs_second_pass_governance_seed.sql`
- Focus categories:
  - `computer_architecture`
  - `network`
  - `os`

## What This Batch Does
- Assigns difficulty to previously approved-but-unset questions in the highest-priority categories.
- Adds lesson mapping and usage scope where the row was still unassigned.
- Adds `1` new `os` medium question to close the known total-count gap.

## Intended Effect

### `computer_architecture`
- closes the immediate recount target of:
  - `3 easy`
  - `7 medium`

### `network`
- closes the immediate recount target of:
  - `10 medium`

### `os`
- closes the immediate recount target of:
  - `2 easy`
  - `6 medium`
- adds `1` net-new medium question so the category can reach the `30 total` floor

## Why This Batch Is Narrow
- The live recount showed that the main bottleneck is `unset difficulty`, not raw total volume.
- So this batch avoids broad new writing and instead repairs the categories with the clearest shortage signal.

## Next Step After Applying `00121`
1. recount governed inventory again
2. verify whether P1 shortages are now closed
3. if closed, move to second-pass relabeling for:
   - `algorithm`
   - `data_structure`
   - `basic_theory`
   - `database`
