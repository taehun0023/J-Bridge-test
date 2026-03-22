# CS Governance Batch 8 Notes

## Scope
- Migration: `00129_cs_comprehensive_migration_db_security.sql`

## Intent
- Treat remaining unset database/security source-bank questions as comprehensive-track candidates.
- Assign explicit difficulty even when they are not suitable for understanding tests.
- Reduce the admin-visible published unset count directly.

## Rule Applied
- understanding-test irrelevant but category-relevant:
  - move to `comprehensive_only`
  - set `difficulty`
- only obviously wrong-category or unusable rows should remain on the exclusion track
