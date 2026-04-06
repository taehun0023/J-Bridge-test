# BJ business_expression B5-a Validated Report

**검증일**: 2026-04-06 (재감사 — A1-a 규칙 추가, A1-a 검출 0건으로 기존 검증 유효)
**입력**: 29건 (bj_business_expression_issues.md)
**Rubric**: B5-a v2 — real if correct=longest/shortest with diff>=2 chars, or ratio>1.2x

## Summary

| 판정 | 건수 |
|------|------|
| CONFIRMED | 13 |
| DISMISSED | 12 |
| BORDERLINE | 4 |
| **합계** | **29** |

---

## CONFIRMED (13건)

### 1. Q-ffa59c38 (初級) — ratio 1.38x, correct=SHORTEST
- **lengths**: correct=8, others=10,10,11
- **gap**: 2~3 chars, ratio 1.38x — highly conspicuous
- **fix direction**: pad opt1 "お先に失礼します" (+2~3 chars) or trim distractors

### 2. Q-73619ca3 (初級) — ratio 1.27x, correct=SHORTEST
- **lengths**: correct=15, others=17,19,18
- **gap**: 2~4 chars, ratio 1.27x
- **fix direction**: pad correct "納期についてご相談がございます" (+2~3 chars) or trim longest distractor (opt3: 19)

### 3. Q-9fbf22b0 (初級) — ratio 1.29x
- **lengths**: 22,19(correct),17,18 — wide spread
- **gap**: max-min=5 chars, ratio 1.29x
- **fix direction**: narrow spread — trim opt1 (22→19~20), pad opt3 (17→19~20)

### 4. Q-72f6eb31 (中級) — ratio 1.22x
- **lengths**: 22,19,20(correct),18 — wide spread
- **gap**: max-min=4 chars, ratio 1.22x
- **fix direction**: trim opt1 (22→20), pad opt4 (18→20)

### 5. Q-203e35d7 (中級) — ratio 1.22x
- **lengths**: 28,26(correct),23,23 — wide spread
- **gap**: max-min=5 chars, ratio 1.22x
- **fix direction**: trim opt1 (28→25~26), pad opt3/opt4 (23→25~26)

### 6. Q-12d7e4c0 (中級) — ratio 1.21x
- **lengths**: 24,27(correct),29,25 — wide spread
- **gap**: max-min=5 chars, ratio 1.21x
- **fix direction**: trim opt3 (29→26~27), pad opt1 (24→26~27)

### 7. Q-54a89ffa (中級) — ratio 1.55x
- **lengths**: 12,14(correct),11,17 — very wide spread
- **gap**: max-min=6 chars, ratio 1.55x — most severe case
- **fix direction**: major rewrite needed — trim opt4 "平素より大変お世話になっております" (17→13~14), pad opt3 "ご無沙汰しておりますが" (11→13~14)

### 8. Q-fe7dcf76 (中級) — ratio 1.20x, correct=SHORTEST
- **lengths**: 21,24,20(correct),21
- **gap**: 4 chars spread, correct is shortest by 1 from nearest but ratio=1.20x
- **fix direction**: pad correct slightly or trim opt2 (24→21)

### 9. Q-7e3e90cf (上級) — ratio 1.31x
- **lengths**: 21,19(correct),18,16 — descending pattern
- **gap**: max-min=5 chars, ratio 1.31x
- **fix direction**: pad opt4 (16→19), trim opt1 (21→19)

### 10. Q-4a7cb3b2 (上級) — correct=SHORTEST, ratio 1.13x
- **lengths**: 43,38(correct),41,42
- **gap**: correct is 3~5 chars shorter than all distractors — noticeable pattern
- **fix direction**: pad correct or trim distractors to ~40 range

### 11. Q-e7e66fbd (上級) — correct=SHORTEST, ratio 1.19x
- **lengths**: 23,21(correct),22,25
- **gap**: correct is shortest, 4 char spread
- **fix direction**: trim opt4 (25→22), pad correct slightly or leave if trimming opt4 is enough

### 12. Q-e6a95afb (中級) — correct=SHORTEST, ratio 1.07x
- **lengths**: 45,43,42(correct),44
- **gap**: correct is shortest by 1~3 chars. Diff=3 from longest. Despite low ratio, correct=shortest with gap of 3 is noticeable.
- **fix direction**: pad correct (+1~2) or trim opt1 (45→43)

### 13. Q-9d32d09c (上級) — correct=SHORTEST, ratio 1.08x
- **lengths**: 40,37(correct),39,37
- **gap**: correct tied for shortest, 3 chars from longest
- **fix direction**: trim opt1 (40→38) — minor adjustment

---

## BORDERLINE (4건)

### 1. Q-8c22791a — correct=SHORTEST but tied with 2 others
- **lengths**: 21,18,18(correct),18
- **ratio**: 1.17x — just under threshold from outlier opt1 (21)
- Only one distractor (opt1=21) is long; correct shares length with 2 others
- Fix if convenient: trim opt1 from 21→19

### 2. Q-5f1732f0 — correct=LONGEST, ratio 1.07x
- **lengths**: 44,45(correct),45,42
- Correct tied with opt3 at 45; not uniquely longest
- Fix if convenient: trim correct/opt3 or pad opt4

### 3. Q-0932ece5 — correct=LONGEST, ratio 1.07x
- **lengths**: 41,43,44(correct),44
- Correct tied with opt4 at 44; not uniquely longest
- Fix if convenient: pad opt1 (41→43)

### 4. Q-d6c3ee7e — correct=LONGEST, ratio 1.06x
- **lengths**: 34,36(correct),36,34
- Correct tied with opt3 at 36; symmetric 34/36/36/34
- Fix if convenient: pad one of the 34s to 35

---

## DISMISSED (12건)

| qId | Reason |
|-----|--------|
| Q-ba1c70bf | correct=18 tied with opt1=18; others only 19,20 — diff=1~2 from correct, ratio 1.11x |
| Q-89793a9e | correct=31 tied with opt1=31; others=28,28 — correct not uniquely longest, ratio 1.11x |
| Q-1ce9d669 | correct=17 tied with opt1=17, opt3=17; one outlier at 16 — diff=1, ratio 1.06x |
| Q-8e303048 | correct=45, others=46,46,45 — diff=1 from longest, ratio 1.02x |
| Q-308a6de8 | correct=30 tied with opt1=30; others=28,28 — diff=2 but correct not uniquely longest, ratio 1.07x |
| Q-645f2334 | correct=36 tied with opt1=36; others=33,35 — correct not uniquely longest, ratio 1.09x |
| Q-30764dc9 | correct=44 tied with opt3=44; others=43,42 — diff=1~2, ratio 1.05x |
| Q-9fe1930e | correct=46 tied with opt2=46; others=43,44 — correct not uniquely longest, ratio 1.07x |
| Q-cdba75ac | correct=44 tied with opt1=44; others=43,42 — diff=1~2, ratio 1.05x |
| Q-ed55ca74 | correct=24 tied with opt1=24, opt2=24; one outlier at 22 — diff=2 but correct not uniquely longest |
| Q-4fb82b1a | correct=42 tied with opt1=42, opt4=42; one outlier=44 — diff=2 but correct is majority length, ratio 1.05x |
| Q-b5a4409c | correct=64 tied with opt2=64; others=63,61 — correct not uniquely longest, ratio 1.05x |
