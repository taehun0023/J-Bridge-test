# CS Governance Recount Spec

## Purpose
- Define the first real recount after governance metadata is applied.
- Replace estimate-based planning with counted approved inventory.

## Count Dimensions
- `category`
- `difficulty`
- `question_usage_scope`
- `curriculum_status`

## Approved Count Rule
- include:
  - `aligned`
  - `adaptable`
- exclude:
  - `out_of_scope`
  - `question_usage_scope = exclude`

## Output Table
- `approvedEasy`
- `approvedMedium`
- `approvedHard`
- `approvedTotal`
- `understandingOnly`
- `shared`
- `comprehensiveOnly`
- `excluded`
- `outOfScope`
- `unsetDifficulty`

## Shortage Table
- target floor:
  - easy `9`
  - medium `15`
  - hard `6`
  - total `30`
- output:
  - `easyShortage`
  - `mediumShortage`
  - `hardShortage`
  - `totalShortage`
  - `unsetDifficulty`

## Implementation
- pure helpers:
  - `src/lib/cs-governance-inventory.ts`
- tests:
  - `src/lib/cs-governance-inventory.test.ts`

## Operational Sequence
1. apply migrations `00118` to `00120`
2. fetch governed CS rows from `quiz_questions`
3. run recount using `buildCsGovernanceInventory`
4. run shortage calculation using `buildCsShortageTable`
5. update writing targets with counted numbers
