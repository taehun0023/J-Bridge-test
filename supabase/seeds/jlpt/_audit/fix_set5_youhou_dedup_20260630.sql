-- fix_set5_youhou_dedup_20260630.sql
-- N1 Set5 問題4 用法 Q21(払拭)・Q22(失墜) → 高揚・顕著 に교체
-- 사유: Set1/Set4 중복 단어 → 새 어휘로 교체
-- 적용: local DB (jpjvzlmwzeiyukqqbdit)
-- 작성: 2026-06-30

BEGIN;

-- ============================================================
-- Q21 (sort_order=21): 払拭 → 高揚（こうよう）
-- question_id: 5a6250f4-2807-445a-9417-931ad52954fd
-- ============================================================

-- 1) question_text 교체
UPDATE quiz_questions
SET question_text = '高揚'
WHERE id = '5a6250f4-2807-445a-9417-931ad52954fd';

-- 2) 정답 option (is_correct=true, sort_order=1)
UPDATE quiz_question_options
SET option_text = '長年の努力が実り、チーム全体の士気が高揚した。'
WHERE id = '980a741f-8144-4371-af86-912edda19495';

-- 3) 오답 option (is_correct=false, sort_order 오름차순 순서대로)
-- sort_order=2
UPDATE quiz_question_options
SET option_text = '彼は辞書を高揚して、難しい単語を調べた。'
WHERE id = '6ee12d1f-a02f-4615-ba25-b9c52d3fbc5c';

-- sort_order=3
UPDATE quiz_question_options
SET option_text = '高揚な成績を収めるため、毎日勉強した。'
WHERE id = '00e1e45e-8169-425a-b62c-f93f92afc523';

-- sort_order=4
UPDATE quiz_question_options
SET option_text = '会議室の高揚を整理してから、発表を始めた。'
WHERE id = '28ef1a08-bb8c-4012-8c30-64226c1a1955';


-- ============================================================
-- Q22 (sort_order=22): 失墜 → 顕著（けんちょ）
-- question_id: f4326bf9-cbf1-47f2-a8a0-c7a9c489c32d
-- ============================================================

-- 1) question_text 교체
UPDATE quiz_questions
SET question_text = '顕著'
WHERE id = 'f4326bf9-cbf1-47f2-a8a0-c7a9c489c32d';

-- 2) 정답 option (is_correct=true, sort_order=2)
UPDATE quiz_question_options
SET option_text = '新しい政策の効果が顕著に表れ、失業率が大幅に低下した。'
WHERE id = 'ee4b55ce-988c-4e51-ae0a-09223f8d7dae';

-- 3) 오답 option (is_correct=false, sort_order 오름차순)
-- sort_order=1
UPDATE quiz_question_options
SET option_text = '彼は顕著に走り、先頭に立った。'
WHERE id = '74024551-f0a8-4494-be9e-5be3537ac756';

-- sort_order=3
UPDATE quiz_question_options
SET option_text = '顕著な天気が続き、農作物に影響が出た。'
WHERE id = '7609aa06-38b1-4e6b-afd7-310828ae73fd';

-- sort_order=4
UPDATE quiz_question_options
SET option_text = '報告書を顕著にまとめ、上司に提出した。'
WHERE id = 'f0cfa811-1235-4047-b9df-af059a1c3bd4';

COMMIT;
