# CS Governance Live Recount

## Snapshot
- Date: `2026-03-21`
- Source: live Supabase recount after governance migrations through `00120`
- Scope: published CS pool questions in the 8 comprehensive categories only

## Key Outcome
- The main bottleneck is no longer raw total volume.
- The real bottleneck is `unset difficulty`.
- Only `os` is currently short on total approved count.
- Every other category can hit the `30-question` floor without net-new writing if difficulty cleanup is done well.

## Approved Inventory

| Category | Easy | Medium | Hard | Approved Total | Unset Difficulty |
| --- | ---: | ---: | ---: | ---: | ---: |
| `basic_theory` | 7 | 14 | 12 | 73 | 40 |
| `data_structure` | 10 | 11 | 8 | 63 | 34 |
| `algorithm` | 11 | 12 | 7 | 71 | 41 |
| `computer_architecture` | 6 | 8 | 6 | 51 | 31 |
| `database` | 7 | 13 | 12 | 83 | 51 |
| `network` | 10 | 5 | 6 | 61 | 40 |
| `os` | 7 | 9 | 6 | 29 | 7 |
| `security` | 14 | 27 | 27 | 111 | 43 |

## Target Gap
- Comprehensive target per category:
  - `easy 9`
  - `medium 15`
  - `hard 6`
  - `total 30`

| Category | Easy Gap | Medium Gap | Hard Gap | Total Gap |
| --- | ---: | ---: | ---: | ---: |
| `basic_theory` | 2 | 1 | 0 | 0 |
| `data_structure` | 0 | 4 | 0 | 0 |
| `algorithm` | 0 | 3 | 0 | 0 |
| `computer_architecture` | 3 | 7 | 0 | 0 |
| `database` | 2 | 2 | 0 | 0 |
| `network` | 0 | 10 | 0 | 0 |
| `os` | 2 | 6 | 0 | 1 |
| `security` | 0 | 0 | 0 | 0 |

## Usage Scope Snapshot

| Category | Shared | Comprehensive Only | Understanding Only | Excluded | Out of Scope |
| --- | ---: | ---: | ---: | ---: | ---: |
| `basic_theory` | 3 | 0 | 0 | 3 | 3 |
| `data_structure` | 2 | 0 | 1 | 2 | 2 |
| `algorithm` | 5 | 1 | 2 | 3 | 3 |
| `computer_architecture` | 3 | 1 | 0 | 4 | 4 |
| `database` | 2 | 2 | 0 | 2 | 2 |
| `network` | 3 | 0 | 3 | 4 | 4 |
| `os` | 4 | 1 | 1 | 2 | 2 |
| `security` | 1 | 1 | 1 | 2 | 2 |

## Interpretation
- `network` is the clearest `medium difficulty` bottleneck.
- `computer_architecture` is still the highest-risk category overall because both `easy` and `medium` are thin.
- `os` is the only category that still needs guaranteed net-new writing even if the remaining `unset` rows are assigned well.
- `security` is stable enough to deprioritize.
- `database`, `basic_theory`, `algorithm`, and `data_structure` look numerically healthy enough to solve with difficulty relabeling first.

## Immediate Next Step
1. Finish second-pass review of approved `unset` rows.
2. Reassign enough `unset` questions into the missing `easy` and `medium` slots per category.
3. Recount again.
4. Lock final net-new writing only for categories that still miss target after relabeling.

## Working Assumption For Writing
- Do not start bulk writing across all categories.
- Start with:
  - `os`: at least `1` guaranteed new approved question, likely `medium`
  - `computer_architecture`: reserve writing capacity if second-pass relabeling cannot close `3 easy / 7 medium`
  - `network`: reserve writing capacity if second-pass relabeling cannot close `10 medium`
