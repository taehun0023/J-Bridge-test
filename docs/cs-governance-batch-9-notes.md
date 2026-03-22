# CS Governance Batch 9 Notes

## Intent
- Reflect the product decision that the remaining `difficulty = null` rows are not understanding-test items.
- Move category-relevant rows into the comprehensive track while assigning explicit difficulty.
- Leave only clear category-drift rows as `exclude`, but still remove their null difficulty.

## Migration
- `00130_cs_remaining_published_unset_cleanup.sql`

## Rule Applied
- `adaptable + comprehensive_only`
  - Used for general-bank questions that still fit the subject well enough for comprehensive coverage.
- `out_of_scope + exclude`
  - Used only for obvious drift rows such as:
    - `basic_theory` rows that are really network/security
    - `database` rows that are really array/hash/WAF drift
    - `network` ER-diagram drift
    - `os` GPU / B-tree drift
    - `security` chaining/collision rows that are really data-structure drift

## Coverage
- `basic_theory`
- `data_structure`
- `algorithm`
- `computer_architecture`
- `database`
- `network`
- `os`
- `security`

## Expected Effect
- The remaining admin-visible published-bank `unset` count should collapse sharply after this batch.
- Understanding-test pools remain untouched.
- The remaining review focus should shift from `difficulty = null` cleanup to:
  - duplicate pruning quality
  - category drift quality
  - comprehensive-bank balance and wording quality
