# CS Published Unset Audit

## Snapshot
- Date: `2026-03-21`
- Scope: all published CS questions shown through admin-style category grouping

## Confirmed Fact
- Total published CS questions: `789`
- Total published CS questions with `difficulty = null`: `182`

## Root Breakdown

| Root Category | Total Published | Unset |
| --- | ---: | ---: |
| `basic_theory` | 104 | 25 |
| `data_structure` | 93 | 12 |
| `algorithm` | 102 | 26 |
| `computer_architecture` | 83 | 16 |
| `database` | 113 | 41 |
| `network` | 93 | 24 |
| `os` | 60 | 2 |
| `security` | 141 | 36 |

## Important Distinction
- Understanding-test pools:
  - `*_check_1`
  - `*_check_2`
  - `*_final`
  currently have `unset = 0`.
- The `182` unresolved rows are in the general published CS banks, not the dedicated understanding-test pools.

## Operational Meaning
- The admin-facing count of `182 unset` is real.
- Comprehensive-floor work and published-bank cleanup are different tracks.
- The next cleanup target should always be measured against the full published-bank count, not only the approved comprehensive pool.
