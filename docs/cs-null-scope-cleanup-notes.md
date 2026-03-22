# CS Null Scope Cleanup Notes

## Meaning
- `null_scope` was not a real question type.
- It meant `question_usage_scope` had never been classified.

## Decision
- CS question usage must end up as one of:
  - `comprehensive_only`
  - `shared`
  - `understanding_only`
- For the real CS comprehensive path, the remaining null-scope rows were legacy comprehensive-bank rows, not understanding-test rows.

## Migration
- `00131_cs_null_scope_cleanup.sql`

## What This Batch Does
- Reclassifies the remaining CS comprehensive-path null-scope rows to:
  - `curriculum_status = aligned` when null
  - `question_usage_scope = comprehensive_only`
- Tightens the selector so future `question_usage_scope = null` rows are ignored instead of silently used.

## Scope
- Step 3 CS comprehensive assessment quiz:
  - `a0000003-0000-0000-0000-000000000003`
- leftover computer architecture source quiz:
  - `61000001-0000-0000-0000-000000000006`

## Follow-up
- Business literacy security rows inside `a0000005-...` were intentionally not changed here because they are outside the CS comprehensive path.
