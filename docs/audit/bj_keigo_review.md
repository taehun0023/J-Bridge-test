# BJ Keigo Migration Review

**Migration**: `supabase/migrations/00151_fix_bj_keigo_length_bias.sql`
**Reviewed**: 2026-04-06
**Reviewer**: Reviewer Agent

---

## Checklist

### 1. SQL Safety -- PASS

- All statements are UPDATE only (no INSERT, DELETE, ALTER, DROP)
- Wrapped in BEGIN/COMMIT transaction
- B5-a updates target `quiz_question_options.id` (UUID primary key) -- precise single-row targeting
- B6 updates target `question_id` + `option_text` WHERE clause -- safe for the slash replacement pattern
- No correct answer option IDs are modified (verified all 18 questions against source JSON)

### 2. Character Count -- PASS (with minor comment fix applied)

All 35 UPDATE statements verified by manual character count of `option_text` values. Results match "After" comments except:

**Fixed during review:**
- Q8 (323d2841): opt3 `'そうなんですね、了解です'` = 12 chars, not 11. opt4 `'まあそうですよね、確かに'` = 12 chars, not 11. Comments corrected in migration file. Actual ratio 13/11 = 1.18x remains unchanged (opt1 is still the min at 11).

### 3. Japanese Naturalness -- PASS

All modified keigo expressions reviewed for grammatical correctness:

| Q | Modified Option | Assessment |
|---|----------------|------------|
| Q1 | 部長が拝読されている | Natural (謙譲+尊敬 混同 = valid error choice) |
| Q1 | 部長がお読みになった | Natural (past tense variant) |
| Q2 | 部長がおっしゃったのは正しいかと存じます | Natural (「かと存じます」 is polite) |
| Q2 | お客様がおっしゃった通りにご対応いたします | Natural (added に for specificity) |
| Q3 | この画面をご覧になれますか | Natural (こちら→この shortening) |
| Q3 | この画面をご覧いただけますか | Natural |
| Q4 | 田中部長を皆様にご紹介いたします | Natural (added 皆様に for padding) |
| Q4 | うちの田中部長をご紹介いたします | Natural (added いた to します) |
| Q5 | 佐藤課長はただいま外出中です | Natural (common phone expression) |
| Q6 | この件を知っておりますか | Natural (謙譲 used to others = error) |
| Q6 | この件はお知りでしょうか | Natural (slightly archaic but valid) |
| Q7 | 一点お聞きしたいのですが | Natural |
| Q7 | 一点聞かせてもらえますか | Natural (casual request form) |
| Q7 | 一点お聞かせ願えますか | Natural (formal request) |
| Q8 | 確かに、なるほどですね | Natural (casual agreement) |
| Q8 | そうなんですね、了解です | Natural (casual acknowledgment) |
| Q8 | まあそうですよね、確かに | Natural (informal agreement) |
| Q9 | お客様が先ほど参りました | Natural (謙譲 for customer = error) |
| Q9 | 先ほどお客様がおりました | Natural (おる for customer = error) |
| Q10 | ご苦労様です | Natural (上→下 expression = wrong for peer) |
| Q10 | ご無沙汰です | Natural (casual variant) |
| Q10 | お世話様でした | Natural (past tense = odd for opening) |
| Q11 | 弊社の鈴木がご説明になられます | Natural (二重敬語 = valid error) |
| Q11 | 当社の鈴木様からご説明されます | Natural (self-company 様 = error) |
| Q12 | 大変お疲れ様でございます | Natural (社内 greeting used to 取引先 = error) |
| Q12 | ご連絡ありがとうございます | Natural (reply opener, not initial = error) |
| Q13 | 御社の田中様が確認してくれました | Natural (くれました is casual) |
| Q13 | 御社の田中がご確認いたしました | Natural (missing 様 = error) |
| Q13 | 田中様が確認をしてあげたようです | Natural (あげた is condescending) |
| Q14 | 私がお客様をお案内いたす | Natural (古文的 but comprehensible) |
| Q14 | 私がお客様に案内をされます | Natural (受身 misuse = error) |
| Q15 | 資料をお渡しされます | Natural (incorrect 敬語 pattern) |
| Q15 | 資料を進呈いたします | Natural (formal 謙譲 expression) |
| Q16 | 担当の鈴木さんに確認いたして... | Natural (さん used for 自社 = error) |
| Q16 | 担当の鈴木が確認されまして... | Natural (受身 misuse = error) |
| Q17 | 部長にお教え申します | Natural (archaic 謙譲 form) |
| Q18 | 私が資料をお見えする | Natural (お見えする is incorrect form) |

### 4. B5-a Goal (ratio <= 1.2x) -- PASS

All 18 questions achieve target ratio after fix:

| Q | Before Ratio | After Ratio | Target Met |
|---|-------------|-------------|------------|
| Q1 | 1.38x | 1.10x | Yes |
| Q2 | 1.21x | 1.15x | Yes |
| Q3 | 1.33x | 1.17x | Yes |
| Q4 | 1.31x | 1.13x | Yes |
| Q5 | 1.50x | 1.17x | Yes |
| Q6 | 1.50x | 1.20x | Yes |
| Q7 | 1.60x | 1.20x | Yes |
| Q8 | 1.86x | 1.18x | Yes |
| Q9 | 1.44x | 1.08x | Yes |
| Q10 | 2.83x | 1.17x | Yes |
| Q11 | 1.21x | 1.13x | Yes |
| Q12 | 2.80x | 1.17x | Yes |
| Q13 | 1.31x | 1.13x | Yes |
| Q14 | 1.27x | 1.17x | Yes |
| Q15 | 1.56x | 1.11x | Yes |
| Q16 | 1.17x | 1.08x | Yes |
| Q17 | 1.22x | 1.10x | Yes |
| Q18 | 1.22x | 1.11x | Yes |

Note: Q6 and Q7 are exactly at 1.20x boundary -- acceptable per rubric (<=1.2x).

### 5. B6 Slash -- PASS

- Question db5c5de0: All 4 options had " / " (space-slash-space) separator
- Fixed by replacing with "・" (middle dot / nakaguro), standard Japanese list separator
- Each option reduced from 7 chars to 5 chars (consistent lengths)
- WHERE clause uses `question_id` + `option_text` matching (safe since slash text is unique)

### 6. Completeness -- PASS

- 18 CONFIRMED B5-a issues from validated report: all 18 addressed (Q1-Q18)
- 1 B6 slash issue: addressed (db5c5de0)
- 17 DISMISSED issues: correctly excluded from migration
- Total: 19/19 issues resolved

---

## Issues Found and Fixed

| # | Severity | Issue | Resolution |
|---|----------|-------|------------|
| 1 | Minor | Q8 comment: opt3 listed as 11 chars, actual is 12 | Fixed comment in migration |
| 2 | Minor | Q8 comment: opt4 listed as 11 chars, actual is 12 | Fixed comment in migration |

These were comment-only errors. The actual SQL `option_text` values and UPDATE targets were correct. The ratio calculation (1.18x) remains valid because opt1 (the true minimum at 11) was correctly counted.

---

## Overall Verdict: APPROVE

The migration is safe to apply. All 19 fixes are correct, complete, and achieve the B5-a/B6 rubric targets. Two minor comment inaccuracies were fixed during review.
