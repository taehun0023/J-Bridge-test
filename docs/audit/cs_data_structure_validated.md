# CS data_structure B5-a Validation Report

**Date**: 2026-04-06
**Migration**: `00157_fix_cs_data_structure_b5a.sql`
**Category**: data_structure
**Issue**: B5-a length bias (correct answer disproportionately longest)

## Summary

| Metric | Count |
|--------|-------|
| Total flagged | 41 |
| CONFIRMED (fixed) | 40 |
| DISMISSED | 0 |
| ACCEPTED (unfixable) | 1 |
| UPDATE statements | 88 |

## Dismiss / Accept Reasons

- **Q40 (ab8c6de8)**: ACCEPTED — スタックからデータを取り出す操作を何というか。Terminology question with inherent length constraints (ポップ/プッシュ/デキュー/ピーク). Correct answer ポップ（pop）at 8 chars is sole shortest, but the 1-char difference from ピーク（peek）at 9 chars is trivially small. No natural padding possible without breaking the operation name format.

## Fix Strategy

All fixes follow the standard approach:
1. **Never modify correct answer text** — only distractor options are changed
2. **Pad short distractors** with plausible technical detail to bring lengths closer to the correct answer
3. **Target**: correct answer should not be sole longest or sole shortest after fix
4. All padded text remains natural Japanese and still WRONG as an answer

## Fix Categories

| Fix Type | Count | Description |
|----------|-------|-------------|
| Pad distractors to exceed correct | 28 | Made one or more distractors longer than correct |
| Pad distractors to tie with correct | 8 | Made one or more distractors equal length to correct |
| Shorten distractor below correct | 3 | Made a distractor shorter so correct is no longer sole shortest |
| Multiple strategy | 1 | Combined padding and shortening |

## Post-Fix Validation

After applying all fixes:
- **40/41 questions**: correct answer is NOT sole longest/shortest
- **1/41 question (Q40)**: accepted exception — terminology naming constraint
- All padded distractors maintain plausible-but-wrong content
- No correct answers were modified
