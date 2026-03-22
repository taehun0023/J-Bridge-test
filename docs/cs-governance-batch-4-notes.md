# CS Governance Batch 4 Notes

## Scope
- Migration: `00125_cs_general_pool_cleanup_batch_4.sql`

## What This Batch Does
- Confirms the understanding-test pools do not have unset difficulty.
- Continues cleanup only in the general CS source banks.
- Applies a broad governance pass to:
  - `basic_theory`
  - `algorithm`
  - `data_structure`

## Intent
- Reduce the remaining unset banks without touching the dedicated understanding-test pools.
- Move obviously lesson-aligned rows into explicit governed states.
- Exclude rows that are clearly outside the current lesson flow.

## Follow-Up
1. apply `00125`
2. recount again
3. confirm no category floor was broken
4. continue with the remaining `network` and `computer_architecture` unset banks
