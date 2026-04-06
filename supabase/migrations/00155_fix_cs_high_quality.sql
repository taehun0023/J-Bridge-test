-- 00155_fix_cs_high_quality.sql
-- CS知識 High 이슈 수정: A2 답안누설 + B8 한글혼용 + B5-a 길이편향
-- CONFIRMED: 8건 (OS 3, Security 2, basic_theory 2, computer_architecture 2 — 중 1건은 겸용)
-- 생성일: 2026-04-06
-- 근거: docs/audit/cs_*_issues.md + Validator 검증
-- Rubric: docs/exam_quality_rubric.md v2
-- 방침: UPDATE only. 문제 ID·수량·정답 불변.

BEGIN;

-- ============================================================
-- 1. OS: B8 한글 혼용 수정 (3건 — 동일 옵션의 중복 문제)
--    "운용" → "運用" in question_text
-- ============================================================

-- Q-21bfd1e6: "OS運용ケース12: 標本化..."
UPDATE quiz_questions SET question_text = 'OS運用ケース12: 標本化（サンプリング）の説明として正しいものはどれか。実運用上の影響まで踏まえて最も適切なものを選べ。'
WHERE id = '21bfd1e6-633e-41f6-8266-dd239df78849';

-- Q-5c4e9b76: "OS運용ケース13: ..."
UPDATE quiz_questions SET question_text = 'OS運用ケース13: 次のメモリ管理の観点から、標本化（サンプリング）の説明として正しいものはどれか。基本事項として最も適切なものを選べ。'
WHERE id = '5c4e9b76-c5c9-4a33-826e-38dbf08801fb';

-- Q-e54f82dc: "OS運용ケース14: ..."
UPDATE quiz_questions SET question_text = 'OS運用ケース14: 次のOS運用場面を想定するとき、標本化（サンプリング）の説明として正しいものはどれか。原因と結果の関係を踏まえて最も適切なものを選べ。'
WHERE id = 'e54f82dc-4134-47d9-bd38-a7628fea4075';

-- B5-a fix: 정답(18자)=최장 → 오답 길이 늘려서 균등화
-- 공통 옵션: 정답"アナログ信号を一定間隔で測定すること"(18) vs opt2(14)/opt3(11)/opt4(15)
-- opt3 "データを暗号化すること"(11) → pad to 16
-- opt2 "デジタルデータを圧縮すること"(14) → pad to 17
-- opt4 "ファイルをバックアップすること"(15) → pad to 17

-- Q-21bfd1e6 options
UPDATE quiz_question_options SET option_text = 'デジタルデータを一括で圧縮すること'
WHERE question_id = '21bfd1e6-633e-41f6-8266-dd239df78849' AND option_text = 'デジタルデータを圧縮すること';
UPDATE quiz_question_options SET option_text = 'データを定期的に暗号化して保存すること'
WHERE question_id = '21bfd1e6-633e-41f6-8266-dd239df78849' AND option_text = 'データを暗号化すること';
UPDATE quiz_question_options SET option_text = 'ファイルを定期的にバックアップすること'
WHERE question_id = '21bfd1e6-633e-41f6-8266-dd239df78849' AND option_text = 'ファイルをバックアップすること';

-- Q-5c4e9b76 options (same text, same fix)
UPDATE quiz_question_options SET option_text = 'デジタルデータを一括で圧縮すること'
WHERE question_id = '5c4e9b76-c5c9-4a33-826e-38dbf08801fb' AND option_text = 'デジタルデータを圧縮すること';
UPDATE quiz_question_options SET option_text = 'データを定期的に暗号化して保存すること'
WHERE question_id = '5c4e9b76-c5c9-4a33-826e-38dbf08801fb' AND option_text = 'データを暗号化すること';
UPDATE quiz_question_options SET option_text = 'ファイルを定期的にバックアップすること'
WHERE question_id = '5c4e9b76-c5c9-4a33-826e-38dbf08801fb' AND option_text = 'ファイルをバックアップすること';

-- Q-e54f82dc options (same text, same fix)
UPDATE quiz_question_options SET option_text = 'デジタルデータを一括で圧縮すること'
WHERE question_id = 'e54f82dc-4134-47d9-bd38-a7628fea4075' AND option_text = 'デジタルデータを圧縮すること';
UPDATE quiz_question_options SET option_text = 'データを定期的に暗号化して保存すること'
WHERE question_id = 'e54f82dc-4134-47d9-bd38-a7628fea4075' AND option_text = 'データを暗号化すること';
UPDATE quiz_question_options SET option_text = 'ファイルを定期的にバックアップすること'
WHERE question_id = 'e54f82dc-4134-47d9-bd38-a7628fea4075' AND option_text = 'ファイルをバックアップすること';

-- ============================================================
-- 2. Security: A2 답안누설 수정 (2건)
-- ============================================================

-- Q-3d4a0758: "公衆Wi-Fiの利用に関するルール" → 정답 "公衆Wi-Fiの利用は禁止"
-- Fix: 질문에서 "公衆Wi-Fi" 제거 → 네트워크 접속 일반 규칙으로
UPDATE quiz_questions SET question_text = '社外ネットワーク接続に関するセキュリティルールとして正しいものはどれか。'
WHERE id = '3d4a0758-eb97-4c37-ada8-4dbbb61cf404';

-- Q-0c55e93c: "重要な情報を業務遂行に必要な範囲を超えて複製する" → 정답 "必要な範囲を超えて複製しない"
-- Fix: 질문 재작성 — 정답 키워드 제거
UPDATE quiz_questions SET question_text = '業務上の重要情報の取り扱いについて、正しいものはどれか。'
WHERE id = '0c55e93c-5435-4179-9855-eb1bf7640f4c';

-- ============================================================
-- 3. basic_theory: B5-a 길이편향 수정 (2건, A2는 DISMISSED)
-- ============================================================

-- Q-36d95ad4: 積集合 — 정답{2,3}(6자), opt2{1,2,3,4}(12자), ratio 2x
-- Fix: 모든 옵션을 같은 형식으로 (중괄호+공백 통일)
-- 정답 "{2, 3}" → OK
-- opt2 "{1, 2, 3, 4}" → "{1, 4}" length 6 — 하지만 이미 opt3이 {1,4}
-- 대신: 긴 오답 축소. {1,2,3,4}(12) → {3,4}(6), {1,2,3}(9) → {1,3}(6)
UPDATE quiz_question_options SET option_text = '{3, 4}'
WHERE question_id = '36d95ad4-54b4-4527-88b7-64d72ce8486b' AND option_text = '{1, 2, 3, 4}';
UPDATE quiz_question_options SET option_text = '{1, 3}'
WHERE question_id = '36d95ad4-54b4-4527-88b7-64d72ce8486b' AND option_text = '{1, 2, 3}';

-- Q-c67b80a7: 和集合 — 정답{1,2,3,4}(12자), opt2{2,3}(6자), ratio 2x
-- Fix: 오답 길이 확대. {2,3}(6)→{1,2,4}(9), {1,4}(6)→{2,3,4}(9), {1,2,3}(9)→OK
UPDATE quiz_question_options SET option_text = '{1, 2, 4}'
WHERE question_id = 'c67b80a7-a638-4d2f-aae0-720adb6968d4' AND option_text = '{2, 3}';
UPDATE quiz_question_options SET option_text = '{2, 3, 4}'
WHERE question_id = 'c67b80a7-a638-4d2f-aae0-720adb6968d4' AND option_text = '{1, 4}';

-- ============================================================
-- 4. computer_architecture: A2 답안누설 수정 (2건 — 중복 문제)
-- ============================================================

-- Q-94e43820: "次のCPU動作の文脈で、命令を主に実行する装置はどれか。"
-- Fix: "CPU" 제거 → 일반적 표현
UPDATE quiz_questions SET question_text = 'コンピュータにおいて、命令を主に実行する装置はどれか。実装や運用上の含意まで含めて最も適切なものを選べ。'
WHERE id = '94e43820-fde2-478c-8a46-47cb77cced0c';

-- Q-7e8bec44: 동일 패턴 — 차별화 (다른 질문으로)
UPDATE quiz_questions SET question_text = 'コンピュータの五大装置のうち、演算と制御を担う装置はどれか。前提条件を踏まえて最も適切なものを選べ。'
WHERE id = '7e8bec44-cdf2-4e6d-88d8-7b921cf0ef44';

COMMIT;
