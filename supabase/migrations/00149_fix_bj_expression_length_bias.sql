-- 00149_fix_bj_expression_length_bias.sql
-- ビジネス日本語 表現カテゴリ B5-a 길이편향 수정 (17件: 13 confirmed + 4 borderline)
-- 생성일: 2026-04-06
-- 근거: docs/audit/bj_expression_validated.md
-- Rubric: docs/exam_quality_rubric.md v2 (B5-a: 1.2x, B5-b: 30%)
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 길이 조정으로 편향 해소.
-- 총 UPDATE: 32

BEGIN;

-- ============================================================
-- Q-ffa59c38: CONFIRMED — SHORTEST c=8 → target middle
-- Before: [8(c),10,10,11]  ratio=1.38
-- After:  [8(c),8,8,8]  ratio=1.00
-- ============================================================
UPDATE quiz_question_options SET option_text = 'お疲れさまでした'
WHERE id = 'c40334a8-227a-499b-a6f2-1d638ff30933';
-- opt2: お疲れ様でございます(10) → お疲れさまでした(8)

UPDATE quiz_question_options SET option_text = 'ご苦労さまでした'
WHERE id = 'd7476590-3cf1-4467-9208-a71ef4f3829e';
-- opt3: ご苦労様でございます(10) → ご苦労さまでした(8)

UPDATE quiz_question_options SET option_text = 'お世話になります'
WHERE id = '6db5e9e7-6feb-4fe4-a6ca-10ffe52060e2';
-- opt4: いつもお世話になります(11) → お世話になります(8)

-- ============================================================
-- Q-73619ca3: CONFIRMED — SHORTEST c=15 → target middle
-- Before: [17,15(c),19,18]  ratio=1.27
-- After:  [16,15(c),16,15]  ratio=1.07
-- ============================================================
UPDATE quiz_question_options SET option_text = '進捗のご報告をさせていただきます'
WHERE id = '7b24de50-36e9-49e3-9d6b-64ae07c2a04c';
-- opt1: 進捗状況についてご報告がございます(17) → 進捗のご報告をさせていただきます(16)

UPDATE quiz_question_options SET option_text = '仕様変更を確認させていただきます'
WHERE id = '1b690afb-3209-4999-8a2f-4fdfaca70b7c';
-- opt3: 仕様変更について確認させていただきます(19) → 仕様変更を確認させていただきます(16)

UPDATE quiz_question_options SET option_text = '追加費用の見積もりを提出します'
WHERE id = '96a5e976-f020-483b-b822-694852582436';
-- opt4: 追加費用のお見積もりを提出いたします(18) → 追加費用の見積もりを提出します(15)

-- ============================================================
-- Q-9fbf22b0: CONFIRMED — RATIO 1.29x
-- Before: [22,19(c),17,18]  ratio=1.29
-- After:  [19,19(c),19,18]  ratio=1.06
-- ============================================================
UPDATE quiz_question_options SET option_text = '本日の決定事項を共有させていただきます'
WHERE id = '62bc0059-f9b3-4d0c-8ceb-c84972b39a6f';
-- opt1: 本日の決定事項を改めて共有させていただきます(22) → 本日の決定事項を共有させていただきます(19)

UPDATE quiz_question_options SET option_text = '次回の宿題事項を確認させていただきます'
WHERE id = '7ab62cc7-7736-4c3c-8fed-b7617fb3466e';
-- opt3: 次回までの宿題事項を確認いたします(17) → 次回の宿題事項を確認させていただきます(19)

-- ============================================================
-- Q-72f6eb31: CONFIRMED — RATIO 1.22x
-- Before: [22,19,20(c),18]  ratio=1.22
-- After:  [20,19,20(c),20]  ratio=1.05
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ここまでの内容の整理をさせていただきます'
WHERE id = '6f805133-70f2-4144-a560-f4c443edbc5f';
-- opt1: ここまでの内容を改めて整理させていただきます(22) → ここまでの内容の整理をさせていただきます(20)

UPDATE quiz_question_options SET option_text = '本日の会議は以上とさせていただきますので'
WHERE id = 'e8827efe-6225-4234-9e89-29482cca555d';
-- opt4: 本日の会議は以上とさせていただきます(18) → 本日の会議は以上とさせていただきますので(20)

-- ============================================================
-- Q-203e35d7: CONFIRMED — RATIO 1.22x
-- Before: [28,26(c),23,23]  ratio=1.22
-- After:  [25,26(c),25,25]  ratio=1.04
-- ============================================================
UPDATE quiz_question_options SET option_text = '会議室の予約が完了いたしましたのでご連絡いたします'
WHERE id = '010364bf-4303-453c-8db5-fc9fad075bf4';
-- opt1: 会議室の予約が完了いたしましたので改めてご連絡いたします(28) → 改めて削除(25)

UPDATE quiz_question_options SET option_text = '前回の打ち合わせを踏まえてご報告させていただきます'
WHERE id = '89dbe074-db7d-40e8-9ffc-e4b8a2bcd6d4';
-- opt3: 前回の打ち合わせ内容を踏まえてご報告いたします(23) → 前回の打ち合わせを踏まえてご報告させていただきます(25)

UPDATE quiz_question_options SET option_text = '日程変更についてご連絡いただきありがとうございます'
WHERE id = 'bb34951c-5f64-4a52-a444-b9d68e2d7fcb';
-- opt4: 日程変更のご連絡をいただきありがとうございます(23) → 日程変更についてご連絡いただきありがとうございます(25)

-- ============================================================
-- Q-12d7e4c0: CONFIRMED — RATIO 1.21x
-- Before: [24,27(c),29,25]  ratio=1.21
-- After:  [26,27(c),26,27]  ratio=1.04
-- ============================================================
UPDATE quiz_question_options SET option_text = '恐れ入りますが、担当者はただいま席を外しておりますが'
WHERE id = '4ab1d172-3d13-4aae-85d1-e2dad5f18422';
-- opt1: 恐れ入りますが、担当者はただいま外出しております(24) → 恐れ入りますが、担当者はただいま席を外しておりますが(26)

UPDATE quiz_question_options SET option_text = 'お電話ありがとうございます。ご用件をお伺いいたします'
WHERE id = '7ed935dd-089d-4026-bc51-b9c181ee0be7';
-- opt3: お電話ありがとうございます。ご用件を改めてお伺いいたします(29) → 改めて削除(26)

UPDATE quiz_question_options SET option_text = '折り返しのお電話をさせていただいてもよろしいでしょうか'
WHERE id = '66f77ef3-3bb1-47b2-ab36-810d89dbbd6d';
-- opt4: 折り返しのお電話をさせていただいてもよろしいですか(25) → よろしいでしょうか(27)

-- ============================================================
-- Q-54a89ffa: CONFIRMED — RATIO 1.55x (most severe)
-- Before: [12,14(c),11,17]  ratio=1.55
-- After:  [13,14(c),13,14]  ratio=1.08
-- ============================================================
UPDATE quiz_question_options SET option_text = '大変お疲れ様でございますね'
WHERE id = '1ba1be20-a46a-481d-a063-c46d66245634';
-- opt1: 大変お疲れ様でございます(12) → 大変お疲れ様でございますね(13)

UPDATE quiz_question_options SET option_text = 'ご無沙汰いたしておりますが'
WHERE id = '50d576f0-4751-42ea-9a7c-4d3c43b9f172';
-- opt3: ご無沙汰しておりますが(11) → ご無沙汰いたしておりますが(13)

UPDATE quiz_question_options SET option_text = '平素はお世話になっております'
WHERE id = 'c1deec38-294d-4320-a612-7569b8fe6536';
-- opt4: 平素より大変お世話になっております(17) → 平素はお世話になっております(14)

-- ============================================================
-- Q-fe7dcf76: CONFIRMED — SHORTEST c=20, ratio=1.20
-- Before: [21,24,20(c),21]  ratio=1.20
-- After:  [21,21,20(c),21]  ratio=1.05
-- ============================================================
UPDATE quiz_question_options SET option_text = '申し訳ございませんが、お時間いただけますか'
WHERE id = '47c474ad-6b34-462e-bece-6a38444bc771';
-- opt2: 申し訳ございませんが、少しお時間をいただけますか(24) → 少しとを削除(21)

-- ============================================================
-- Q-7e3e90cf: CONFIRMED — RATIO 1.31x
-- Before: [21,19(c),18,16]  ratio=1.31
-- After:  [19,19(c),18,19]  ratio=1.06
-- ============================================================
UPDATE quiz_question_options SET option_text = '次回の打ち合わせの日程を調整いたします'
WHERE id = '9cb83d74-c023-49d2-967a-aa353fb4a35b';
-- opt1: 次回の打ち合わせ日程を改めて調整いたします(21) → 改めて削除+の追加(19)

UPDATE quiz_question_options SET option_text = '各自のタスク期限についてご確認ください'
WHERE id = '23ac18ea-8696-4686-aaba-a670fc970930';
-- opt4: 各自のタスク期限をご報告ください(16) → 各自のタスク期限についてご確認ください(19)

-- ============================================================
-- Q-4a7cb3b2: CONFIRMED — SHORTEST c=38, ratio=1.13
-- Before: [43,38(c),41,42]  ratio=1.13
-- After:  [40,38(c),41,39]  ratio=1.08
-- ============================================================
UPDATE quiz_question_options SET option_text = '先日ご依頼いただきました追加機能について、見積書を添付しましたのでご査収ください'
WHERE id = 'e57f773b-20ff-4dbb-852b-8477d1b93bbf';
-- opt1: 先日ご依頼いただきました追加機能について、お見積書を添付いたしましたのでご査収ください(43) → お・いた削除(40)

UPDATE quiz_question_options SET option_text = '議事録を添付いたしましたので、ご不明な点がございましたらお気軽にご連絡ください'
WHERE id = '1e04ad05-d7e7-49d1-96f7-296d3a8c9fe0';
-- opt4: 議事録を添付いたしましたので、内容にご不明な点がございましたらお気軽にご連絡ください(42) → 内容に削除(39)

-- ============================================================
-- Q-e7e66fbd: CONFIRMED — SHORTEST c=21, ratio=1.19
-- Before: [23,21(c),22,25]  ratio=1.19
-- After:  [23,21(c),22,23]  ratio=1.10
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご質問ありがとうございます。即答は差し控えます'
WHERE id = '4db0b31c-1849-4041-bd69-a701aa7e0846';
-- opt4: ご質問いただきありがとうございます。即答は控えます(25) → いただき削除+差し追加(23)

-- ============================================================
-- Q-e6a95afb: CONFIRMED — SHORTEST c=42, ratio=1.07
-- Before: [45,43,42(c),44]  ratio=1.07
-- After:  [43,43,42(c),43]  ratio=1.02
-- ============================================================
UPDATE quiz_question_options SET option_text = '本件につきましては、仕様書記載の通りの動作となっておりますので、ご確認お願いいたします'
WHERE id = '1eed9aa1-c120-48c6-b2a5-ceba30478a26';
-- opt1: 本件につきましては、仕様書に記載の通りの動作となっておりますので、ご確認をお願いいたします(45) → に・を削除(43)

UPDATE quiz_question_options SET option_text = '次回リリースにて改修対応を予定しておりますので、今しばらくお待ちいただけますでしょうか'
WHERE id = 'bbfeb074-c790-418e-ad70-8f9b43779fd0';
-- opt4: 次回のリリースにて改修対応を予定しておりますので、今しばらくお待ちいただけますでしょうか(44) → の削除(43)

-- ============================================================
-- Q-9d32d09c: CONFIRMED — SHORTEST c=37, ratio=1.08
-- Before: [40,37(c),39,37]  ratio=1.08
-- After:  [38,37(c),39,37]  ratio=1.05
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご指摘の反映が完了いたしましたので、お手数ですが再度ご確認をお願いいたします'
WHERE id = 'c27cfdb7-1eb5-4df2-8588-385b21d26e85';
-- opt1: いただいたご指摘を反映いたしましたので、お手数ですが再度ご確認をお願いいたします(40) → 再構成(38)

-- ============================================================
-- BORDERLINE Q-8c22791a: correct=SHORTEST tied with 2 others
-- Before: [21,18,18(c),18]  ratio=1.17
-- After:  [19,18,18(c),18]  ratio=1.06
-- ============================================================
UPDATE quiz_question_options SET option_text = '次の議題に移らせていただきたいのですが'
WHERE id = 'fe35d061-432c-4984-bbe6-7ad18b5337cb';
-- opt1: 次の議題に移らせていただいてよろしいですか(21) → 次の議題に移らせていただきたいのですが(19)

-- ============================================================
-- BORDERLINE Q-5f1732f0: correct=LONGEST tied with opt3, ratio=1.07
-- Before: [44,45(c),45,42]  ratio=1.07
-- After:  [44,45(c),45,44]  ratio=1.02
-- ============================================================
UPDATE quiz_question_options SET option_text = '本日の作業予定でございますが、見積書の作成と提出資料の確認整理を優先的に進めてまいります'
WHERE id = '24674f74-3623-48ee-beae-f6363de52665';
-- opt4: 本日の作業予定でございますが、見積書の作成と提出資料の整理を優先的に進めてまいります(42) → 確認追加(44)

-- ============================================================
-- BORDERLINE Q-0932ece5: correct=LONGEST tied with opt4, ratio=1.07
-- Before: [41,43,44(c),44]  ratio=1.07
-- After:  [43,43,44(c),44]  ratio=1.02
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご要望の機能につきましては、次期バージョンでの対応をぜひ前向きに検討させていただきます'
WHERE id = 'e052f986-1af2-41dc-9b00-addf1628dd29';
-- opt1: ご要望の機能につきましては、次期バージョンでの対応を前向きに検討させていただきます(41) → ぜひ追加(43)

-- ============================================================
-- BORDERLINE Q-d6c3ee7e: correct=LONGEST tied with opt3, ratio=1.06
-- Before: [34,36(c),36,34]  ratio=1.06
-- After:  [35,36(c),36,34]  ratio=1.06
-- ============================================================
UPDATE quiz_question_options SET option_text = '先日の障害の対応につきまして、原因調査の結果をご報告させていただきます'
WHERE id = '513fb15f-f198-4e59-9725-a82a6aaaa43b';
-- opt1: 先日の障害対応につきまして、原因調査の結果をご報告させていただきます(34) → の追加(35)

COMMIT;
