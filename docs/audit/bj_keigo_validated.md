# BJ Keigo B5-a Validation Report

**Validated**: 2026-04-06 (재감사 — A1-a 규칙 추가, A1-a 검출 0건으로 기존 검증 유효)
**Input**: 35 B5-a flags + 1 B6 flag across 36 questions (4 A2-exempt noted)
**Rubric**: B5-a v2 — CONFIRMED if correct is longest/shortest AND diff >= 2 chars. DISMISSED if diff <= 1 char, correct tied at same length as non-extreme, or correct is in the middle (not longest/shortest).

## Summary

| Verdict | Count |
|---------|-------|
| CONFIRMED | 18 |
| DISMISSED | 17 |
| BORDERLINE | 0 |
| B6 (always real) | 1 |
| **Total** | **36** |

---

## CONFIRMED (18 questions -- need fix)

| # | qId (short) | Tag | Correct Len | All Opt Lengths | Ratio | Fix Direction |
|---|-------------|-----|-------------|-----------------|-------|---------------|
| 1 | 23cbb68f | LONGEST | 11 | 9, **11**, 8, 10 | 1.38x | Pad opt3(8) to 10+; trim correct by 1 |
| 2 | 27d8ca2e | LONGEST | 23 | 19, **23**, 22, 20 | 1.21x | Trim correct or pad opt1(19); diff=4 |
| 3 | 3a8d0adb | SHORTEST | 12 | 13, **12**, 15, 16 | 1.33x | Pad correct or trim opt3/4; diff=4 from max |
| 4 | cd449cbc | LONGEST | 17 | 13, **17**, 14, 15 | 1.31x | Trim correct or pad opt1(13); diff=4 |
| 5 | 0d1d7d0c | SHORTEST | 12 | 18, **12**, 13, 14 | 1.50x | Pad correct or trim opt1(18); diff=6 |
| 6 | 995d09a3 | SHORTEST | 10 | 11, **10**, 13, 15 | 1.50x | Pad correct or trim opt3/4; diff=5 |
| 7 | 6f915355 | SHORTEST | 10 | 14, **10**, 16, 14 | 1.60x | Pad correct or trim opt3(16); diff=6 |
| 8 | 323d2841 | LONGEST | 13 | 7, **13**, 7, 8 | 1.86x | Pad all distractors; diff=6 from min |
| 9 | 31d4db5e | LONGEST | 13 | 9, **13**, 9, 13 | 1.44x | Correct tied with opt4 at 13, still longest group; pad opt1/3(9); diff=4 |
| 10 | 01937a63 | SHORTEST | 6 | 14, **6**, 10, 17 | 2.83x | Pad correct significantly; diff=11 from max |
| 11 | 12884872 | LONGEST | 17 | 16, **17**, 14, 14 | 1.21x | Trim correct or pad opt3/4(14); diff=3 |
| 12 | d97673f0 | LONGEST | 14 | 6, **14**, 5, 12 | 2.80x | Pad opt1(6)/opt3(5); diff=9 from min |
| 13 | 02611999 | LONGEST | 17 | 13, **17**, 14, 13 | 1.31x | Trim correct or pad opt1/4(13); diff=4 |
| 14 | 904c5fd5 | LONGEST | 14 | 11, **14**, 14, 12 | 1.27x | Correct tied with opt3; pad opt1(11); diff=3 |
| 15 | 473fd455 | SHORTEST | 9 | 11, 14, **9**, 9 | 1.56x | Correct tied with opt4; pad or trim opt2(14); diff=5 |
| 16 | ea2958d0 | LONGEST | 27 | 23, **27**, 26, 23 | 1.17x | Correct is longest; diff=4; trim correct or pad opt1/4 |
| 17 | 98a9d727 | LONGEST | 11 | 10, 9, **11**, 11 | 1.22x | Correct tied with opt4(11); pad opt2(9); diff=2 from min |
| 18 | 24a4aca3 | SHORTEST | 9 | 10, **9**, 9, 11 | 1.22x | Correct tied with opt3(9); pad one of them or trim opt4(11); diff=2 |

---

## DISMISSED (17 questions)

| # | qId (short) | Reason |
|---|-------------|--------|
| 1 | 5b962c24 | Ratio 1.09x < 1.2x. Diff from max only 1 char. Three opts at 11. |
| 2 | 4b2fd683 | Ratio 1.18x < 1.2x. Diff from nearest only 1 char. |
| 3 | 18b00feb | Ratio 1.07x < 1.2x. Diff only 1 char from others (all 15). |
| 4 | f12285a5 | A2-exempt. Correct=15, not longest (opt4=16). Middle position. |
| 5 | 327aebb7 | Correct=14, tied with two others at 14. Ratio 1.14x. Not uniquely shortest. |
| 6 | e857d9c5 | Correct=12, middle (range 10-15). Not longest/shortest. |
| 7 | 126abada | Correct=14, middle (range 11-17). Not longest/shortest. |
| 8 | e61c9966 | Correct=13, tied with opt1 and opt4 at 13. Only opt3 at 15. Ratio 1.15x. |
| 9 | bed36c51 | Correct=14, tied with opt1 at 14. Ratio 1.17x. Not uniquely longest. |
| 10 | f7ad59c4 | Correct=21, middle (range 16-22). Not longest/shortest. |
| 11 | 6d4a4074 | Correct=9, tied with opt1 at 9. Not uniquely shortest (opt4=5 is shorter). |
| 12 | c89ee2de | Correct=20, middle (range 13-24). Not longest/shortest. |
| 13 | 1c297f0d | Correct=20, middle (range 18-25). Not longest/shortest. |
| 14 | 6bc84fcb | Correct=12, middle (range 11-15). Not longest/shortest. |
| 15 | 676f7397 | Correct=11, middle (range 9-12). Not longest/shortest. |
| 16 | fa13f8d0 | Correct=12, middle (range 11-15). Not longest/shortest. |
| 17 | 65657640 | Correct=20, middle (range 19-24). Not longest/shortest. |

---

## B6 -- Slash in Option (1 question, always CONFIRMED)

| qId (short) | Issue |
|-------------|-------|
| db5c5de0 | All 4 options contain " / " slash separator (e.g., "弊社 / 御社"). Fix: replace slash with middot or rewrite as single phrase. |

---

## Fix Priority for Fixer

**High priority (ratio >= 1.5x or diff >= 5, 7 questions):**
0d1d7d0c (1.50x), 995d09a3 (1.50x), 6f915355 (1.60x), 323d2841 (1.86x), 01937a63 (2.83x), d97673f0 (2.80x), 473fd455 (1.56x)

**Medium priority (ratio 1.2x--1.5x, 11 questions):**
23cbb68f, 27d8ca2e, 3a8d0adb, cd449cbc, 31d4db5e, 12884872, 02611999, 904c5fd5, ea2958d0, 98a9d727, 24a4aca3

**B6 (1 question):** db5c5de0
