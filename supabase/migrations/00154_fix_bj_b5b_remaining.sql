-- 00154_fix_bj_b5b_remaining.sql
-- B5-b 잔존 수정: sentence_pattern + keigo 퀴즈별 정답=최단 비율 30% 이하로
-- 생성일: 2026-04-06
-- 근거: docs/audit/bj_remaining_data.json
-- Rubric: docs/exam_quality_rubric.md v2 (B5-b: ≤30%)
-- 방침: UPDATE only. 정답 텍스트 불변. 오답(distractor) 길이 축소로 편향 해소.

BEGIN;

-- ============================================================
-- Quiz b2000001: sentence_pattern — 5/10 shortest → target ≤3/10 (fix 2)
-- ============================================================

-- Q1: 6dac5543 — 会議での意見表明
-- correct(opt2)=18  opt1=20  opt3=20  opt4=19
-- Fix: trim opt4(19→18) remove honorific prefix お
-- Before: [20,18*,20,19] → After: [20,18*,20,18]
UPDATE quiz_question_options SET option_text = '私の見解ですが、〜と思いいたします。'
WHERE id = '3ff0bdb0-8561-4c4e-8874-5a784a95f3a4';

-- Q2: 82f911c0 — クライアントに資料確認依頼
-- correct(opt2)=18  opt1=20  opt3=21  opt4=18
-- Fix: trim opt1(20→17) restructure phrase — opt1 now shorter than correct
-- Before: [20,18*,21,18] → After: [17,18*,21,18]
UPDATE quiz_question_options SET option_text = '資料のご確認をしてくださいますか。'
WHERE id = '8c372a4f-d85d-4180-a569-d266ffe9678e';

-- ============================================================
-- Quiz b2000002: sentence_pattern — 5/10 shortest → target ≤3/10 (fix 2)
-- ============================================================

-- Q3: cb87dd48 — テスト結果報告
-- correct(opt2)=32  opt1=33  opt3=34  opt4=36
-- Fix: trim opt3(34→32) 実施結果→結果
-- Before: [33,32*,34,36] → After: [33,32*,32,36]
UPDATE quiz_question_options SET option_text = 'テスト項目150件の結果、145件は問題なく、5件は不合格です。'
WHERE id = '5d44832a-cd11-4397-9d2a-59c453c27739';

-- Q4: b7d2a035 — 設計書「目的」セクション
-- correct(opt1)=41  opt2=45  opt3=43  opt4=41
-- Fix: trim opt3(43→41) remove 2x の
-- Before: [41*,45,43,41] → After: [41*,45,41,41]
UPDATE quiz_question_options SET option_text = '本システムは社内勤怠管理を目的としており、出退勤記録機能を提供させていただきます。'
WHERE id = '9ed92551-3706-4aec-bd1c-2144ad8b94d2';

-- ============================================================
-- Quiz b2000003: sentence_pattern — 7/15 shortest → target ≤4/15 (fix 3)
-- ============================================================

-- Q5: 78e42eaf — プロジェクト進捗報告メール書き出し
-- correct(opt2)=50  opt1=50  opt3=50  opt4=51
-- Fix: trim opt4(51→49) remove より — opt4 now shorter than correct
-- Before: [50,50*,50,51] → After: [50,50*,50,49]
UPDATE quiz_question_options SET option_text = '平素お世話になっております。受注管理システムプロジェクトの進捗について、ご報告されていただきます。'
WHERE id = '502865a9-61e5-4b6e-9578-6cf10640c41b';

-- Q6: 81069a9a — システム障害謝罪メール書き出し
-- correct(opt2)=34  opt1=36  opt3=35  opt4=37
-- Fix: trim opt3(35→33) remove の件
-- Before: [36,34*,35,37] → After: [36,34*,33,37] correct no longer shortest
UPDATE quiz_question_options SET option_text = 'この度はシステム障害でご迷惑をおかけされ、大変申し訳ございません。'
WHERE id = '681ee723-5f3b-462b-b83d-fd60c20d5c7a';

-- Q7: 24892f32 — ビジネスメール末尾定型表現
-- correct(opt3)=29  opt1=30  opt2=30  opt4=31
-- Fix: trim opt1(30→28) remove して
-- Before: [30,30,29*,31] → After: [28,30,29*,31] correct no longer shortest
UPDATE quiz_question_options SET option_text = 'ご不明な点がございましたら、お気軽にお申し付けください。'
WHERE id = 'f63af2d1-85b7-4ae1-b3c1-1f00d341deb3';

-- ============================================================
-- Quiz b4000001: keigo — 5/14 shortest → target ≤4/14 (fix 1)
-- ============================================================

-- Q8: 995d09a3 — 「知っていますか」の尊敬語
-- correct(opt2)=10  opt1=11  opt3=12  opt4=14
-- Fix: trim opt1(11→10) contract ていま→てま
-- Before: [11,10*,12,14] → After: [10,10*,12,14]
UPDATE quiz_question_options SET option_text = 'この件を存じてますか'
WHERE id = 'b8af186a-b1a2-4769-8b8e-874baaf92b76';

-- ============================================================
-- Quiz b4000003: keigo — 4/12 shortest → target ≤3/12 (fix 1)
-- ============================================================

-- Q9: 18b00feb — 自社の部長の発言を取引先に伝える
-- correct(opt2)=14  opt1=15  opt3=15  opt4=15
-- Fix: trim opt1(15→14) contract ていま→てま
-- Before: [15,14*,15,15] → After: [14,14*,15,15]
UPDATE quiz_question_options SET option_text = '田中部長がおっしゃってました'
WHERE id = '6fc6cb27-619c-474f-a474-2ed3b2b260a0';

COMMIT;