# CS Governance Admin Action

## Purpose
- This document records the admin-side action that can be used after the CS governance migrations are applied.

## Action
- `getCsGovernanceInventory`

## Location
- `src/app/actions/admin/cs-governance.ts`

## Returns
- `inventory`
  - per-category approved counts by difficulty
  - usage-scope counts
  - excluded/out-of-scope counts
  - unset-difficulty counts
- `shortages`
  - shortage against:
    - easy `9`
    - medium `15`
    - hard `6`
    - total `30`

## Intended Use
1. apply CS governance migrations
2. call `getCsGovernanceInventory`
3. lock the real shortage table
4. update writing targets from counted numbers, not estimates

## Current Limitation
- This action is available on the server side, but no admin UI has been wired to render it yet.
- That is intentional for now; the priority was to make the recount logic callable and stable first.
