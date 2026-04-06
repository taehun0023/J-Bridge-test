-- 00151_fix_bj_keigo_length_bias.sql
-- ビジネス日本語 敬語カテゴリ B5-a 길이편향 + B6 슬래시 수정 (19件: 18 B5-a + 1 B6)
-- 생성일: 2026-04-06
-- 근거: docs/audit/bj_keigo_validated.md
-- Rubric: docs/exam_quality_rubric.md v2 (B5-a: 1.2x, B5-b: 30%)
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 길이 조정으로 편향 해소.

BEGIN;

-- ============================================================
-- Q1: 23cbb68f — 二重敬語 (LONGEST, correct=11)
-- Before: opt1=9, correct=11, opt3=8, opt4=10 → ratio 1.38x
-- After:  opt1=10, correct=11, opt3=10, opt4=10 → ratio 1.10x
-- ============================================================
UPDATE quiz_question_options SET option_text = '部長が拝読されている'
WHERE id = 'f80a1d0c-eb3d-4acd-a20f-f1f7e3f525a3';
-- opt3: 8→10 "部長が拝読される" → "部長が拝読されている"

UPDATE quiz_question_options SET option_text = '部長がお読みになった'
WHERE id = '5c0c90b7-be8b-4151-ac07-12280c77f4bd';
-- opt1: 9→10 "部長がお読みになる" → "部長がお読みになった"

-- ============================================================
-- Q2: 27d8ca2e — 敬語の誤用 (LONGEST, correct=23)
-- Before: opt1=19, correct=23, opt3=22, opt4=20 → ratio 1.21x
-- After:  opt1=20, correct=23, opt3=22, opt4=21 → ratio 1.15x
-- ============================================================
UPDATE quiz_question_options SET option_text = '部長がおっしゃったのは正しいかと存じます'
WHERE id = '8de0881a-b80e-43de-a990-4fcf3a722375';
-- opt1: 19→20

UPDATE quiz_question_options SET option_text = 'お客様がおっしゃった通りにご対応いたします'
WHERE id = '6d8aeb95-c421-4d8e-831b-31515dfb5321';
-- opt4: 20→21

-- ============================================================
-- Q3: 3a8d0adb — ら抜き言葉 (SHORTEST, correct=12)
-- Before: opt1=13, correct=12, opt3=15, opt4=16 → ratio 1.33x
-- After:  opt1=13, correct=12, opt3=13, opt4=14 → ratio 1.17x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'この画面をご覧になれますか'
WHERE id = '2477446a-b4fa-40db-9ef0-abc5ec636b93';
-- opt3: 15→13 "こちらの画面をご覧になれますか" → "この画面をご覧になれますか"

UPDATE quiz_question_options SET option_text = 'この画面をご覧いただけますか'
WHERE id = '97140d76-335f-4111-8fb1-3912d89de76a';
-- opt4: 16→14 "こちらの画面をご覧いただけますか" → "この画面をご覧いただけますか"

-- ============================================================
-- Q4: cd449cbc — 社外で自社部長紹介 (LONGEST, correct=17)
-- Before: opt1=13, correct=17, opt3=14, opt4=15 → ratio 1.31x
-- After:  opt1=16, correct=17, opt3=16, opt4=15 → ratio 1.13x
-- ============================================================
UPDATE quiz_question_options SET option_text = '田中部長を皆様にご紹介いたします'
WHERE id = 'a2e3d4d5-74c4-4065-a794-3ca63c4cf7a4';
-- opt1: 13→16

UPDATE quiz_question_options SET option_text = 'うちの田中部長をご紹介いたします'
WHERE id = '6b627e45-975d-4781-9f54-c4b3b96ea8d7';
-- opt3: 14→16

-- ============================================================
-- Q5: 0d1d7d0c — 電話応対・不在 (SHORTEST, correct=12)
-- Before: opt1=18, correct=12, opt3=13, opt4=14 → ratio 1.50x
-- After:  opt1=14, correct=12, opt3=13, opt4=14 → ratio 1.17x
-- ============================================================
UPDATE quiz_question_options SET option_text = '佐藤課長はただいま外出中です'
WHERE id = '257759df-ea86-428d-a3fe-ee38e3dac812';
-- opt1: 18→14 "佐藤課長は席を外していらっしゃいます" → "佐藤課長はただいま外出中です"

-- ============================================================
-- Q6: 995d09a3 — 「知っていますか」尊敬語 (SHORTEST, correct=10)
-- Before: opt1=11, correct=10, opt3=13, opt4=15 → ratio 1.50x
-- After:  opt1=11, correct=10, opt3=12, opt4=12 → ratio 1.20x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'この件を知っておりますか'
WHERE id = '76f15530-fcbf-4ebe-ae8e-e3f3dad59315';
-- opt3: 13→12 "この件を知っておられますか" → "この件を知っておりますか"

UPDATE quiz_question_options SET option_text = 'この件はお知りでしょうか'
WHERE id = 'ddcd4b76-f529-4867-b0f3-bccf92a1d17d';
-- opt4: 15→12 "この件をお知りになっていますか" → "この件はお知りでしょうか"

-- ============================================================
-- Q7: 6f915355 — 「聞く」謙譲語 (SHORTEST, correct=10)
-- Before: opt1=14, correct=10, opt3=16, opt4=14 → ratio 1.60x
-- After:  opt1=12, correct=10, opt3=12, opt4=11 → ratio 1.20x
-- ============================================================
UPDATE quiz_question_options SET option_text = '一点お聞きしたいのですが'
WHERE id = 'c0afcf92-f4fa-4739-9d1f-7ee335a339ec';
-- opt1: 14→12 "一点お聞きになりたいのですが" → "一点お聞きしたいのですが"

UPDATE quiz_question_options SET option_text = '一点聞かせてもらえますか'
WHERE id = '261a89af-5de1-4572-a564-d6b31fedc54a';
-- opt3: 16→12 "一点聞かせていただきたいのですが" → "一点聞かせてもらえますか"

UPDATE quiz_question_options SET option_text = '一点お聞かせ願えますか'
WHERE id = 'b36c6e1c-1ec7-415d-8266-b55ebd07ce69';
-- opt4: 14→11 "一点お聞かせ願いたいのですが" → "一点お聞かせ願えますか"

-- ============================================================
-- Q8: 323d2841 — 上司への同意表現 (LONGEST, correct=13)
-- Before: opt1=7, correct=13, opt3=7, opt4=8 → ratio 1.86x
-- After:  opt1=11, correct=13, opt3=12, opt4=12 → ratio 1.18x
-- ============================================================
UPDATE quiz_question_options SET option_text = '確かに、なるほどですね'
WHERE id = '74a13431-7b2c-4970-b0f6-620087b7f412';
-- opt1: 7→11 "なるほどですね" → "確かに、なるほどですね"

UPDATE quiz_question_options SET option_text = 'そうなんですね、了解です'
WHERE id = 'cb3a1d0c-a99f-44ab-8f83-62b85284c05f';
-- opt3: 7→12 "そうなんですね" → "そうなんですね、了解です"

UPDATE quiz_question_options SET option_text = 'まあそうですよね、確かに'
WHERE id = '7257f22a-5e55-4b8f-8038-a334c9dc5a3f';
-- opt4: 8→12 "まあそうですよね" → "まあそうですよね、確かに"

-- ============================================================
-- Q9: 31d4db5e — 「お客様が来ました」敬語 (LONGEST, correct=13)
-- Before: opt1=9, correct=13, opt3=9, opt4=13 → ratio 1.44x
-- After:  opt1=12, correct=13, opt3=12, opt4=13 → ratio 1.08x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'お客様が先ほど参りました'
WHERE id = '74dff377-4dcc-486b-8691-a78b049baeea';
-- opt1: 9→12 "お客様が参りました" → "お客様が先ほど参りました"

UPDATE quiz_question_options SET option_text = '先ほどお客様がおりました'
WHERE id = '2857b4fc-e605-4c2d-96ea-1f5fce6e7b9e';
-- opt3: 9→12 "お客様がおりました" → "先ほどお客様がおりました"

-- ============================================================
-- Q10: 01937a63 — 社内メール書き出し (SHORTEST, correct=6)
-- Before: opt1=14, correct=6, opt3=10, opt4=17 → ratio 2.83x
-- After:  opt1=6, correct=6, opt3=6, opt4=7 → ratio 1.17x
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご苦労様です'
WHERE id = '22aa5282-27c2-41cf-a489-9c5179d1b51a';
-- opt1: 14→6 "いつもお世話になっております" → "ご苦労様です" (上→下の表現で誤り)

UPDATE quiz_question_options SET option_text = 'ご無沙汰です'
WHERE id = 'cdec9335-3ed9-4289-81c6-2c6013da2f0e';
-- opt3: 10→6 "ご無沙汰しております" → "ご無沙汰です" (社外向けで誤り)

UPDATE quiz_question_options SET option_text = 'お世話様でした'
WHERE id = 'd1d2fc81-743f-4acd-8ccd-991134d8ac61';
-- opt4: 17→7 "平素より大変お世話になっております" → "お世話様でした" (過去形で誤り)

-- ============================================================
-- Q11: 12884872 — 取引先に自社担当者紹介 (LONGEST, correct=17)
-- Before: opt1=16, correct=17, opt3=14, opt4=14 → ratio 1.21x
-- After:  opt1=16, correct=17, opt3=15, opt4=15 → ratio 1.13x
-- ============================================================
UPDATE quiz_question_options SET option_text = '弊社の鈴木がご説明になられます'
WHERE id = '72014573-d2ed-4d2c-bd9e-8c733ccba438';
-- opt3: 14→15 "弊社の鈴木がご説明になります" → "弊社の鈴木がご説明になられます"

UPDATE quiz_question_options SET option_text = '当社の鈴木様からご説明されます'
WHERE id = '1f799f65-f045-4f13-9071-4945a0756530';
-- opt4: 14→15 "当社の鈴木様がご説明されます" → "当社の鈴木様からご説明されます"

-- ============================================================
-- Q12: d97673f0 — 取引先メール書き出し (LONGEST, correct=14)
-- Before: opt1=6, correct=14, opt3=5, opt4=12 → ratio 2.80x
-- After:  opt1=12, correct=14, opt3=13, opt4=12 → ratio 1.17x
-- ============================================================
UPDATE quiz_question_options SET option_text = '大変お疲れ様でございます'
WHERE id = '6a5ad734-62bf-4690-8c2d-360ea045ef4f';
-- opt1: 6→12 "お疲れ様です" → "大変お疲れ様でございます" (社内向けで誤り)

UPDATE quiz_question_options SET option_text = 'ご連絡ありがとうございます'
WHERE id = '9122ef46-ecc3-45f7-ab47-f715003f6c27';
-- opt3: 5→13 "こんにちは" → "ご連絡ありがとうございます" (書き出しとして不適切)

-- ============================================================
-- Q13: 02611999 — 取引先担当者の確認伝達 (LONGEST, correct=17)
-- Before: opt1=13, correct=17, opt3=14, opt4=13 → ratio 1.31x
-- After:  opt1=16, correct=17, opt3=15, opt4=16 → ratio 1.12x
-- ============================================================
UPDATE quiz_question_options SET option_text = '御社の田中様が確認してくれました'
WHERE id = 'fa6366b9-77c2-406e-a5a3-6c2796cd2f92';
-- opt1: 13→16

UPDATE quiz_question_options SET option_text = '御社の田中がご確認いたしました'
WHERE id = 'e89bd295-56fa-4059-aa3f-e21dbb01c043';
-- opt3: 14→15

UPDATE quiz_question_options SET option_text = '田中様が確認をしてあげたようです'
WHERE id = '726d15fa-6089-48c6-996a-91e00fd12723';
-- opt4: 13→16

-- ============================================================
-- Q14: 904c5fd5 — 「お/ご〜する」謙譲語 (LONGEST, correct=14)
-- Before: opt1=11, correct=14, opt3=14, opt4=12 → ratio 1.27x
-- After:  opt1=12, correct=14, opt3=14, opt4=13 → ratio 1.17x
-- ============================================================
UPDATE quiz_question_options SET option_text = '私がお客様をお案内いたす'
WHERE id = 'c3c6e547-639a-43d8-94a8-639f073b94df';
-- opt1: 11→12 "私がお客様をお案内する" → "私がお客様をお案内いたす"

UPDATE quiz_question_options SET option_text = '私がお客様に案内をされます'
WHERE id = '5cf7804e-0458-4b14-901c-d7b934c68ad7';
-- opt4: 12→13 "私がお客様を案内されます" → "私がお客様に案内をされます"

-- ============================================================
-- Q15: 473fd455 — 「あげる」謙譲語 (SHORTEST, correct=9, opt4=9)
-- Before: opt1=11, opt2=14, correct=9, opt4=9 → ratio 1.56x
-- After:  opt1=10, opt2=10, correct=9, opt4=9 → ratio 1.11x
-- ============================================================
UPDATE quiz_question_options SET option_text = '資料をお渡しされます'
WHERE id = '01f46d5c-20e4-480e-bf43-84d8b1df50e4';
-- opt1: 11→10 "資料をお渡しになります" → "資料をお渡しされます"

UPDATE quiz_question_options SET option_text = '資料を進呈いたします'
WHERE id = '17816062-82f0-40db-bca5-313d6747cf6c';
-- opt2: 14→10 "資料をあげさせていただきます" → "資料を進呈いたします"

-- ============================================================
-- Q16: ea2958d0 — 電話で確認+折り返し (LONGEST, correct=27)
-- Before: opt1=23, correct=27, opt3=26, opt4=23 → ratio 1.17x
-- After:  opt1=25, correct=27, opt3=26, opt4=26 → ratio 1.08x
-- ============================================================
UPDATE quiz_question_options SET option_text = '担当の鈴木さんに確認いたして、折り返しご連絡します'
WHERE id = 'f2dd5355-694c-46c0-818f-ce1fa48ef48b';
-- opt1: 23→25

UPDATE quiz_question_options SET option_text = '担当の鈴木が確認されまして、折り返しご連絡いたします'
WHERE id = 'd5f6385f-b11c-424c-b703-48ee105c2d99';
-- opt4: 23→26

-- ============================================================
-- Q17: 98a9d727 — 上司に情報伝達 (LONGEST, correct=11, opt4=11)
-- Before: opt1=10, opt2=9, correct=11, opt4=11 → ratio 1.22x
-- After:  opt1=10, opt2=10, correct=11, opt4=11 → ratio 1.10x
-- ============================================================
UPDATE quiz_question_options SET option_text = '部長にお教え申します'
WHERE id = 'c9c8c676-5b61-45d5-864a-30cbdc84ed1e';
-- opt2: 9→10 "部長にお教えします" → "部長にお教え申します"

-- ============================================================
-- Q18: 24a4aca3 — 「見る」謙譲語 (SHORTEST, correct=9, opt3=9)
-- Before: opt1=10, correct=9, opt3=9, opt4=11 → ratio 1.22x
-- After:  opt1=10, correct=9, opt3=9, opt4=10 → ratio 1.11x
-- ============================================================
UPDATE quiz_question_options SET option_text = '私が資料をお見えする'
WHERE id = 'fb07e960-cbd1-4256-8135-4a54e876870e';
-- opt4: 11→10 "私が資料をお見えになる" → "私が資料をお見えする"

-- ============================================================
-- B6: db5c5de0 — スラッシュ表記修正
-- Before: "弊社 / 御社", "貴社 / 弊社", "当社 / 御社", "御社 / 当社" (各7字)
-- After:  "弊社・御社", "貴社・弊社", "当社・御社", "御社・当社" (各5字, 中黒に統一)
-- ============================================================
UPDATE quiz_question_options SET option_text = '弊社・御社'
WHERE question_id = 'db5c5de0-4867-468f-8def-ee8bce643eba'
  AND option_text = '弊社 / 御社';

UPDATE quiz_question_options SET option_text = '貴社・弊社'
WHERE question_id = 'db5c5de0-4867-468f-8def-ee8bce643eba'
  AND option_text = '貴社 / 弊社';

UPDATE quiz_question_options SET option_text = '当社・御社'
WHERE question_id = 'db5c5de0-4867-468f-8def-ee8bce643eba'
  AND option_text = '当社 / 御社';

UPDATE quiz_question_options SET option_text = '御社・当社'
WHERE question_id = 'db5c5de0-4867-468f-8def-ee8bce643eba'
  AND option_text = '御社 / 当社';

COMMIT;
