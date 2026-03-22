# CS Floor Repair After Duplicate Pruning

## Scope
- Migration: `00124_cs_floor_repair_after_duplicate_pruning.sql`

## Why This Exists
- `00123` improved pool cleanliness, but it also dropped the minimum floor in:
  - `computer_architecture`
  - `os`
- This repair batch restores the floor immediately so the comprehensive exam bank stays valid.

## Repair Strategy

### `computer_architecture`
- Promote three remaining unique rows into explicit governed rows:
  - `2 easy`
  - `1 medium`

### `os`
- Temporarily restore three duplicate-but-in-scope rows:
  - `1 easy`
  - `2 medium`

## Operational Note
- The `os` restoration is a temporary floor-protection move.
- A later cleanup pass should replace these restored duplicates with unique approved rows before final content freeze.
