# BJ sentence_pattern Validated Issues

**Validator**: Claude Opus 4.6
**Date**: 2026-04-06 (재감사 - A1-a 규칙 추가)
**Input**: 1 High (A1-a) + 32 Medium (B5-a) + 1 B6 = 33건

## Criteria Applied
- **A1-a**: 기술지식 의존 여부 수동 검증 (false positive 포함)
- **B5-a (Rubric v2)**: correct is longest/shortest AND (diff >= 2 chars OR ratio > 1.2x) = CONFIRMED
- **DISMISSED**: diff 1 char + ratio < 1.2, OR correct tied with another option
- **BORDERLINE**: diff = 1 char but ratio close to threshold
- **B6 slash**: CONFIRMED if "/" separates alternatives (날짜 표기 제외)

## Summary

| Verdict | Count |
|---------|-------|
| CONFIRMED | 14 |
| DISMISSED | 18 |
| BORDERLINE | 1 |
| **Total** | **33** |

## A1-a High (1건) — DISMISSED

### Q-3104baa4 (上級, 종합시험 a0000002)
- "設計書やソースコード…検査し…作業を___という" → 정답 "レビュー"
- **판정**: DISMISSED (false positive)
- **근거**: 기술판단이 아닌 일본어 IT 용어의 穴埋め. 문맥에서 "レビュー"라는 단어를 아는지 테스트. "どの手法がある" 패턴은 부속 설명부에서 발생한 오탐.

## CONFIRMED Issues (14) -- Fixer action required

| # | qId (short) | Lengths (correct -> others) | Ratio | Tag | Fix Direction |
|---|-------------|---------------------------|-------|-----|---------------|
| 1 | b4fe906c | **20** -> 22,23,25 | 1.25 | SHORTEST | Pad correct +2 or trim opt1 to 20 |
| 2 | 07900db5 | **11** -> 14,12,13 | 1.27 | SHORTEST | Pad correct +1~2 or trim distractors toward 11 |
| 3 | d25fa6d9 | **29** -> 32,33,33 | 1.14 | SHORTEST | Pad correct +2~3 or trim distractors toward 29~30 |
| 4 | 64e474e8 | **57** -> 71,65,69 | 1.25 | SHORTEST | Trim distractors (especially opt1=71) closer to 57~60 range |
| 5 | e6ef6d36 | **9** -> 11,12,15 | 1.67 | SHORTEST | A2-exempt candidate (HTTP status codes are fixed terms); if not exempt, pad correct |
| 6 | aef6b750 | **13** -> 18,17,17 | 1.38 | SHORTEST | Pad correct +3~4 or trim distractors toward 13~15 |
| 7 | cac7f957 | **19** -> 22,23,21 | 1.21 | SHORTEST | Pad correct +2 or trim opt3=23 to 20~21 |
| 8 | ba51f2d8 | **74** -> 79,78,78 | 1.07 | SHORTEST+B6 | B5-a: pad correct +3~4; B6: "3/15" is date notation -- likely false B6 but check |
| 9 | a794b14f | **70** -> 79,79,74 | 1.13 | SHORTEST | Trim opt1/opt2 (79->73~74) or pad correct +3 |
| 10 | 27eaa5f3 | **76** -> 87,86,79 | 1.14 | SHORTEST | Trim opt1=87, opt3=86 closer to 76~80 range |
| 11 | e52e99bb | **39** -> 44,45,43 | 1.15 | SHORTEST | Pad correct +3~4 or trim distractors toward 40~41 |
| 12 | b7af762c | **21** -> 25,25,25 | 1.19 | SHORTEST | Pad correct +2~3 or trim all distractors from 25 to 22~23 |
| 13 | 3408b50e | **38** -> 43,40,40 | 1.13 | SHORTEST | Trim opt1=43 to 39~40 |
| 14 | ee0b52b7 | **27** -> 30,30,31 | 1.15 | SHORTEST | Pad correct +2 or trim distractors toward 28~29 |

## BORDERLINE Issues (1)

| # | qId (short) | Lengths | Ratio | Note |
|---|-------------|---------|-------|------|
| 1 | cb87dd48 | **32** -> 33,34,36 | 1.13 | diff=1 from nearest (33), but ratio 1.13 and all distractors longer. Low risk -- skip unless batch-fixing nearby questions in same quiz (b2000002). |

## DISMISSED Issues (17)

| # | qId (short) | Reason |
|---|-------------|--------|
| 1 | f8d1f21e | Correct (27) tied with opt4 (27) -- not uniquely longest |
| 2 | 82f911c0 | Correct (18) tied with opt4 (18) -- not uniquely shortest |
| 3 | 26b33584 | Correct (17) tied with opt1 (17) and opt3 (17) |
| 4 | 7068a5dd | Correct (34) tied with opt1 (34) and opt4 (34) |
| 5 | b7d2a035 | Correct (41) tied with opt4 (41) |
| 6 | 81069a9a | Diff = 1 (34 vs 35), ratio 1.09 |
| 7 | 1f8308c1 | Diff = 1 (77 vs 76), ratio 1.01 |
| 8 | 3c51a221 | Diff = 1 (62 vs 63), ratio 1.05 |
| 9 | 76853461 | Correct (9) tied with opt1 (9) |
| 10 | d5857aa6 | Correct (13) is not extreme -- opt2 (12) is shorter |
| 11 | 975ae5c6 | Diff = 1 (67 vs 68), ratio 1.04 |
| 12 | 24892f32 | Diff = 1 (29 vs 30), ratio 1.07 |
| 13 | 74d15d21 | Correct (61) tied with opt4 (61) |
| 14 | c061bb76 | Correct (26) tied with opt1 (26) and opt4 (26) |
| 15 | 63380dc1 | Diff = 1 (27 vs 28), ratio 1.07 |
| 16 | 78e42eaf | Correct (50) tied with opt1 (50) and opt3 (50) |
| 17 | 6dac5543 | Diff = 1 (18 vs 19), ratio 1.11 |

## B6 Slash Note

Q-ba51f2d8: The "/" in options (e.g., "3/15") is date notation, not a semantic slash separating alternatives. This is a **false B6** -- no fix needed for B6. The B5-a issue for this question is still CONFIRMED.

## B5-b Quiz-Level Note

All 4 quizzes FAIL B5-b (correct=shortest bias). After fixing the 14 confirmed B5-a issues, rerun B5-b stats to check if quiz-level distribution improves. If still failing, additional length rebalancing across non-flagged questions may be needed.
