-- 00150_fix_bj_sentence_pattern_length_bias.sql
-- ビジネス日本語 文型カテゴリ B5-a 길이편향 수정 (15件: 14 confirmed + 1 borderline)
-- 생성일: 2026-04-06
-- 근거: docs/audit/bj_sentence_pattern_validated.md
-- Rubric: docs/exam_quality_rubric.md v2 (B5-a: 1.2x, B5-b: 30%)
-- 방침: UPDATE only. 정답 텍스트 불변. 오답 길이 조정으로 편향 해소.

BEGIN;

-- ============================================================
-- Q1: b4fe906c — ビジネスメール定型表現（今後の関係継続）
-- correct(opt3)=20  opt1=22(keep)  opt2=23->20  opt4=25->21
-- Before: [22,23,20*,25] max/min=25/20=1.25
-- After:  [22,20,20*,21] max/min=22/20=1.10
-- ============================================================
UPDATE quiz_question_options SET option_text = '今後とも何卒よろしくお願い差し上げます。'
WHERE id = '745d6cc2-807b-45ab-82b4-212668e16596';
-- 23->20

UPDATE quiz_question_options SET option_text = '今後とも変わらぬお引き立てをお願いします。'
WHERE id = 'ecf42782-65e8-4568-b1fc-734d0feac3c9';
-- 25->21

-- ============================================================
-- Q2: 07900db5 — 「知りません」の敬語表現
-- correct(opt3)=11  opt1=14->12  opt2=12(keep)  opt4=13->12
-- Before: [14,12,11*,13] max/min=14/11=1.27
-- After:  [12,12,11*,12] max/min=12/11=1.09
-- ============================================================
UPDATE quiz_question_options SET option_text = 'お知りいたしかねません。'
WHERE id = 'f0c66ce7-4e9b-4874-af24-f5f4e05e498e';
-- 14->12

UPDATE quiz_question_options SET option_text = '存じておられませんです。'
WHERE id = '994d6daa-8193-4d36-8587-f4391166edd7';
-- 13->12

-- ============================================================
-- Q3: d25fa6d9 — ミーティング後のお礼メール書き出し
-- correct(opt1)=29  opt2=32->30  opt3=33->29  opt4=33->30
-- Before: [29*,32,33,33] max/min=33/29=1.14
-- After:  [29*,30,29,30] max/min=30/29=1.03
-- ============================================================
UPDATE quiz_question_options SET option_text = '先日はお忙しい中、お時間を頂戴くださりありがとうございます。'
WHERE id = '1cf265a9-91ff-4b73-8875-8a559b0639e7';
-- 32->30

UPDATE quiz_question_options SET option_text = '先日はご多忙の中、お時間をいただけまして感謝申し上げます。'
WHERE id = '16490817-2ef9-4b40-954e-50d13b636553';
-- 33->29

UPDATE quiz_question_options SET option_text = '先日はお忙しいところ、お時間をいただきありがとうございます。'
WHERE id = '522a061d-f8a4-413e-90e9-5f934f4f3bd8';
-- 33->30

-- ============================================================
-- Q4: 64e474e8 — 障害報告書の記述表現
-- correct(opt2)=57  opt1=71->64  opt3=65->62  opt4=69->62
-- Before: [71,57*,65,69] max/min=71/57=1.25
-- After:  [64,57*,62,62] max/min=64/57=1.12
-- ============================================================
UPDATE quiz_question_options SET option_text = '3月10日14時35分、受注処理において入力データの不備が発生いたしました。注文番号の重複が原因で、再採番にて対応いたしました。'
WHERE id = 'dcb7fecb-467c-4cec-86fe-096933328cf7';
-- 71->64

UPDATE quiz_question_options SET option_text = '3月10日の14時35分頃に受注処理の入力データに不備が発生されました。注文番号の重複が原因となり、再採番にて対応しました。'
WHERE id = '68221a3d-dbdd-4225-86be-4f41dd30183f';
-- 65->62

UPDATE quiz_question_options SET option_text = '3月10日14時35分、受注処理で入力データの不備が起きてしまいました。注文番号重複が原因で、番号の再採番にて対応済みです。'
WHERE id = 'cb291ad8-0a8d-4cfa-8425-ec24df64fbbb';
-- 69->62

-- ============================================================
-- Q5: e6ef6d36 — HTTPステータスコード404の名称
-- correct(opt4)=9  opt1=11->9  opt2=12->10  opt3=15->9
-- Before: [11,12,15,9*] max/min=15/9=1.67
-- After:  [9,10,9,9*] max/min=10/9=1.11
-- ============================================================
UPDATE quiz_question_options SET option_text = 'Forbidden'
WHERE id = 'e1365b68-f193-4393-b929-32f86d2bbb1b';
-- 11->9 (Bad Request -> Forbidden: HTTP 403, still wrong for 404)

UPDATE quiz_question_options SET option_text = 'No Content'
WHERE id = '4c86ff67-7c5e-4028-a29e-e4562cb1ef90';
-- 12->10 (Unauthorized -> No Content: HTTP 204, still wrong for 404)

UPDATE quiz_question_options SET option_text = 'Timed Out'
WHERE id = '37b12997-b06f-424b-86c3-095151c043e4';
-- 15->9 (Internal Server -> Timed Out: HTTP 408 concept, wrong for 404)

-- ============================================================
-- Q6: aef6b750 — 「会いたい」の敬語表現
-- correct(opt3)=13  opt1=18->14  opt2=17->14  opt4=17->14
-- Before: [18,17,13*,17] max/min=18/13=1.38
-- After:  [14,14,13*,14] max/min=14/13=1.08
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご面会をしたく存じ上げます。'
WHERE id = '8edf7948-82e0-497d-ae39-40e68035d36d';
-- 18->14

UPDATE quiz_question_options SET option_text = 'お会いしたく思っております。'
WHERE id = 'c257b6c1-4857-4e57-89c6-329ae76fced8';
-- 17->14

UPDATE quiz_question_options SET option_text = 'お目にかかられたく存じます。'
WHERE id = '4ea31899-2ef9-4c82-aae5-c91f9fbfc182';
-- 17->14

-- ============================================================
-- Q7: cac7f957 — 作業の進め方の許可を求める表現
-- correct(opt2)=19  opt1=22->20  opt3=23->21  opt4=21(keep)
-- Before: [22,19*,23,21] max/min=23/19=1.21
-- After:  [20,19*,21,21] max/min=21/19=1.11
-- ============================================================
UPDATE quiz_question_options SET option_text = 'この方法で進めさせてもらってよいですか。'
WHERE id = '760539f7-23b9-4d69-8868-e245299bb906';
-- 22->20

UPDATE quiz_question_options SET option_text = 'この方法で進めさせていただいてよいですか。'
WHERE id = 'bb5d0cad-2243-41fa-9cba-5a997f22e92c';
-- 23->21

-- ============================================================
-- Q8: ba51f2d8 — 議事録の決定事項・次回アクション記述
-- correct(opt2)=74  opt1=79->73  opt3=78->72  opt4=78->74
-- Before: [79,74*,78,78] max/min=79/74=1.07
-- After:  [73,74*,72,74] max/min=74/72=1.03
-- ============================================================
UPDATE quiz_question_options SET option_text = '本日の決定事項をご報告します。①認証方式はOAuth2.0に決定されました。次回までにAPI設計書のドラフトを作成してあげます（田中、3/15）。'
WHERE id = '91f28793-60b7-4a39-8d5d-164d1f7a35f4';
-- 79->73

UPDATE quiz_question_options SET option_text = '本日の決定事項は以下となります。①認証方式はOAuth2.0を採用します。次回までにAPI設計書のドラフトを作成します（担当：田中、3/15）。'
WHERE id = 'fdf1030e-bc2d-4a05-b34c-4a2f2e19810b';
-- 78->72

UPDATE quiz_question_options SET option_text = '本日決定されました事項は以下です。①認証方式はOAuth2.0になります。次回までにAPI設計書のドラフトを作成する予定です（田中、期限3/15）。'
WHERE id = 'c69a0cca-5ec3-4a03-a1e6-a1b4d65bda91';
-- 78->74

-- ============================================================
-- Q9: a794b14f — 手順書の操作手順記述
-- correct(opt3)=70  opt1=79->73  opt2=79->76  opt4=74(keep)
-- Before: [79,79,70*,74] max/min=79/70=1.13
-- After:  [73,76,70*,74] max/min=76/70=1.09
-- ============================================================
UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインします。手順2: 勤怠管理メニューから出退勤一覧を選択します。手順3: 対象日を選択し、「申請」をクリックします。'
WHERE id = 'abc867d0-25b8-498b-926d-1c9fd1fd4286';
-- 79->73

UPDATE quiz_question_options SET option_text = '手順1: 社内システムにログインください。手順2: 勤怠管理メニューから出退勤一覧をお選びください。手順3: 対象日を選択し、「申請」を押してください。'
WHERE id = '34e86e0b-8092-48c9-8e8d-b16d7a2412a6';
-- 79->76

-- ============================================================
-- Q10: 27eaa5f3 — コードレビュー指摘事項の記録
-- correct(opt2)=76  opt1=87->74  opt3=86->74  opt4=79(keep)
-- Before: [87,76*,86,79] max/min=87/76=1.14
-- After:  [74,76*,74,79] max/min=79/74=1.07
-- ============================================================
UPDATE quiz_question_options SET option_text = '指摘事項：経費精算の承認漏れ。理由：月末処理で未承認の申請が残り、決算に影響するかもしれない。改善案：二重チェック体制を導入し、承認漏れを防止する。'
WHERE id = '00dfd907-ec2e-410f-a460-6a7e333bc3cc';
-- 87->74

UPDATE quiz_question_options SET option_text = '指摘事項：経費精算の承認漏れ。理由：月末処理で未承認の申請が残った場合、決算に影響する。改善案：二重チェック体制を導入し、承認漏れを防止いたします。'
WHERE id = '7a9a2cb1-f401-400a-a853-6e045cef07e1';
-- 86->74

-- ============================================================
-- Q11: e52e99bb — クライアントへのメール業務依頼
-- correct(opt3)=39  opt1=44->40  opt2=45->40  opt4=43->40
-- Before: [44,45,39*,43] max/min=45/39=1.15
-- After:  [40,40,39*,40] max/min=40/39=1.03
-- ============================================================
UPDATE quiz_question_options SET option_text = 'お忙しいところ恐縮ですが、添付資料をご確認してくださいますようお願いいたします。'
WHERE id = '31c7cc23-9ccc-45d0-a814-7ed861119820';
-- 44->40

UPDATE quiz_question_options SET option_text = 'ご多忙のところ恐縮ですが、添付資料のご確認をしていただけますと幸いでございます。'
WHERE id = 'd8a71c91-07a3-4385-b1a4-d89f128a89d6';
-- 45->40

UPDATE quiz_question_options SET option_text = 'お忙しいところ恐れ入りますが、添付資料の確認のほうをよろしくお願い申し上げます。'
WHERE id = '4ef68db1-25c9-40c5-8a64-023244ee4ec2';
-- 43->40

-- ============================================================
-- Q12: b7af762c — メール返信遅延のお詫び書き出し
-- correct(opt2)=21  opt1=25->22  opt3=25->23  opt4=25->22
-- Before: [25,21*,25,25] max/min=25/21=1.19
-- After:  [22,21*,23,22] max/min=23/21=1.10
-- ============================================================
UPDATE quiz_question_options SET option_text = 'ご返信が遅れてしまい、誠に失礼いたしました。'
WHERE id = '61cf1e4c-68ea-4ef1-89c3-68551cdbd87a';
-- 25->22

UPDATE quiz_question_options SET option_text = 'お返事が遅くなられまして、申し訳ございません。'
WHERE id = 'bcfc5af2-cbbe-448a-ad66-34b7c378b56d';
-- 25->23

UPDATE quiz_question_options SET option_text = 'ご返信のほうが遅くなり、申し訳なく存じます。'
WHERE id = 'dc331539-ea4d-419a-9e33-56401f9847f5';
-- 25->22

-- ============================================================
-- Q13: 3408b50e — メール添付資料の案内表現
-- correct(opt2)=38  opt1=43->39  opt3=40(keep)  opt4=40(keep)
-- Before: [43,38*,40,40] max/min=43/38=1.13
-- After:  [39,38*,40,40] max/min=40/38=1.05
-- ============================================================
UPDATE quiz_question_options SET option_text = '添付ファイルにてお送りさせていただき、ご査収してくださいますようお願いします。'
WHERE id = '7da4019a-6b60-4ac1-bdbb-bc038336fc9f';
-- 43->39

-- ============================================================
-- Q14: ee0b52b7 — 進捗報告書の完了作業記述
-- correct(opt2)=27  opt1=30->28  opt3=30->29  opt4=31->28
-- Before: [30,27*,30,31] max/min=31/27=1.15
-- After:  [28,27*,29,28] max/min=29/27=1.07
-- ============================================================
UPDATE quiz_question_options SET option_text = 'API設計を完了させていただき、結合テストに着手します。'
WHERE id = '4d2277f4-603c-43e2-b25a-f27cc07c65a7';
-- 30->28

UPDATE quiz_question_options SET option_text = 'API設計が完了されまして、結合テストに着手しております。'
WHERE id = '3213777f-0166-4836-92a6-ea4df7bc63bd';
-- 30->29

UPDATE quiz_question_options SET option_text = 'API設計が完了となり、結合テストを着手中でございます。'
WHERE id = 'aea0f81b-c36d-4551-a66b-23447e9171cf';
-- 31->28

-- ============================================================
-- Q15: cb87dd48 (borderline) — テスト結果報告書の記述
-- correct(opt2)=32  opt1=33(keep)  opt3=34->33  opt4=36->33
-- Before: [33,32*,34,36] max/min=36/32=1.13
-- After:  [33,32*,33,33] max/min=33/32=1.03
-- ============================================================
UPDATE quiz_question_options SET option_text = 'テスト項目150件の実施結果、145件は問題なく5件は不合格です。'
WHERE id = '5d44832a-cd11-4397-9d2a-59c453c27739';
-- 34->33

UPDATE quiz_question_options SET option_text = 'テスト項目150件を実施いたし、145件合格で5件が不合格でした。'
WHERE id = '7bc56f6e-c4f5-473c-bce7-adc7e69647e1';
-- 36->33

COMMIT;
