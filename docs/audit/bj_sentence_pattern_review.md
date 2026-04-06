# BJ sentence_pattern Migration Review

**Reviewer**: Claude Opus 4.6
**Date**: 2026-04-06
**Migration**: `00150_fix_bj_sentence_pattern_length_bias.sql`
**Source**: `bj_sentence_pattern_validated.md` (14 CONFIRMED + 1 BORDERLINE)

---

## Checklist

### 1. SQL Safety — PASS

- All statements are UPDATE only, wrapped in BEGIN/COMMIT
- Every UPDATE targets `quiz_question_options.id` with a full UUID
- 33 UPDATE statements total across 15 questions
- **No correct answers modified**: All 33 UUIDs verified against `bj_sentence_pattern_b5a_data.json` — every targeted option has `isCorrect: false`
- No DELETE, INSERT, ALTER, or DDL statements present

### 2. Character Count — PASS

Every new `option_text` was manually character-counted and cross-referenced against the migration's inline comments. All 33 counts match.

| Q# | Option | Claimed | Actual | Match |
|----|--------|---------|--------|-------|
| Q1 | opt2 | 20 | 20 | OK |
| Q1 | opt4 | 21 | 21 | OK |
| Q2 | opt1 | 12 | 12 | OK |
| Q2 | opt4 | 12 | 12 | OK |
| Q3 | opt2 | 30 | 30 | OK |
| Q3 | opt3 | 29 | 29 | OK |
| Q3 | opt4 | 30 | 30 | OK |
| Q4 | opt1 | 64 | 64 | OK |
| Q4 | opt3 | 62 | 62 | OK |
| Q4 | opt4 | 62 | 62 | OK |
| Q5 | opt1 | 9 | 9 | OK |
| Q5 | opt2 | 10 | 10 | OK |
| Q5 | opt3 | 9 | 9 | OK |
| Q6 | opt1 | 14 | 14 | OK |
| Q6 | opt2 | 14 | 14 | OK |
| Q6 | opt3 | 14 | 14 | OK |
| Q7 | opt1 | 20 | 20 | OK |
| Q7 | opt3 | 21 | 21 | OK |
| Q8 | opt1 | 73 | 73 | OK |
| Q8 | opt3 | 72 | 72 | OK |
| Q8 | opt4 | 74 | 74 | OK |
| Q9 | opt1 | 73 | 73 | OK |
| Q9 | opt2 | 76 | 76 | OK |
| Q10 | opt1 | 74 | 74 | OK |
| Q10 | opt3 | 74 | 74 | OK |
| Q11 | opt1 | 40 | 40 | OK |
| Q11 | opt2 | 40 | 40 | OK |
| Q11 | opt4 | 40 | 40 | OK |
| Q12 | opt1 | 22 | 22 | OK |
| Q12 | opt3 | 23 | 23 | OK |
| Q12 | opt4 | 22 | 22 | OK |
| Q13 | opt1 | 39 | 39 | OK |
| Q14 | opt1 | 28 | 28 | OK |
| Q14 | opt3 | 29 | 29 | OK |
| Q14 | opt4 | 28 | 28 | OK |
| Q15 | opt3 | 33 | 33 | OK |
| Q15 | opt4 | 33 | 33 | OK |

### 3. Japanese Naturalness — PASS

All modified texts are grammatically sound as **distractor options** (intentionally incorrect keigo). Key observations:

- **Q2-opt1** `お知りいたしかねません` — double-humble + double-negative, intentionally wrong keigo. Plausible distractor.
- **Q5** Replaced HTTP status code names (Bad Request -> Forbidden, Unauthorized -> No Content, Internal Server -> Timed Out). All are real HTTP concepts, all wrong for 404. Good distractors with balanced length.
- **Q6-opt3** `お目にかかられたく` — passive applied to humble form (double honorific error). Intentional distractor.
- **Q8-opt1** `作成してあげます` — inappropriate "giving" nuance in business context. Intentional distractor.
- **Q9-opt2** `ログインください` — missing "して". Intentional distractor.
- **Q12-opt3** `遅くなられまして` — honorific applied to own action. Intentional distractor.

No unnatural modifications found. All texts maintain their diagnostic value as incorrect-but-plausible options.

### 4. B5-a Goal (ratio <= 1.2x) — PASS

All 15 questions now have max/min ratio within the 1.2x threshold:

| Q# | Before Ratio | After Ratio | Within 1.2x |
|----|-------------|-------------|-------------|
| Q1 | 1.25 | 1.10 | OK |
| Q2 | 1.27 | 1.09 | OK |
| Q3 | 1.14 | 1.03 | OK |
| Q4 | 1.25 | 1.12 | OK |
| Q5 | 1.67 | 1.11 | OK |
| Q6 | 1.38 | 1.08 | OK |
| Q7 | 1.21 | 1.11 | OK |
| Q8 | 1.07 | 1.03 | OK |
| Q9 | 1.13 | 1.09 | OK |
| Q10 | 1.14 | 1.07 | OK |
| Q11 | 1.15 | 1.03 | OK |
| Q12 | 1.19 | 1.10 | OK |
| Q13 | 1.13 | 1.05 | OK |
| Q14 | 1.15 | 1.07 | OK |
| Q15 | 1.13 | 1.03 | OK |

Correct answer is no longer the unique shortest in any question.

### 5. Completeness — PASS

- 14 CONFIRMED issues from validated report: All addressed (Q1-Q14)
- 1 BORDERLINE issue (cb87dd48): Addressed as Q15
- 17 DISMISSED issues: Correctly excluded from migration
- Total fixes: 15 questions, 33 UPDATE statements

---

## Issues Found

None. Migration is clean and correct.

---

## Overall Verdict: APPROVE

The migration is safe to apply. All character counts are accurate, no correct answers are modified, all post-fix ratios fall within the 1.2x rubric threshold, and the modified Japanese text maintains appropriate distractor quality.
