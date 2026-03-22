# CS Governance Batch 3 Notes

## Scope
- Migration: `00123_cs_duplicate_pruning_and_security_db_cleanup.sql`

## What This Batch Does
- Quarantines exact duplicate rows when a stronger canonical row already exists.
- Cleans a large part of the remaining `database` unset bank by:
  - keeping transaction/index-adjacent rows
  - excluding SQL-syntax and cross-category rows
- Cleans a large part of the remaining `security` unset bank by:
  - keeping auth/authz, hashing vs encryption, and web-vulnerability rows
  - excluding crypto-detail, malware, product-security, and legal/governance-adjacent rows

## Expected Effect
- fewer duplicate rows inside the approved CS pool
- lower `unset difficulty` counts in `database` and `security`
- smaller review surface for the remaining full-bank pass

## Follow-Up
1. recount after `00123`
2. confirm no category floor was broken by duplicate quarantine
3. continue with:
   - `algorithm`
   - `basic_theory`
   - `data_structure`
   unset cleanup
