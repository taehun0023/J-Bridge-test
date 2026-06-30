-- fix_set3_mondai5_20260630.sql
-- N1 Set3 問題5 文法形式の判断 Q27/Q31/Q32/Q34
-- 意味選択型 → 빈칸형（　　）に変換
-- 対象 sort_order: 27, 31, 32, 34
-- 実行日: 2026-06-30

BEGIN;

-- ============================================================
-- Q27 (sort_order=27): いかんによっては
-- 旧: 意味説明を選ぶ形式
-- 新: 交渉の結果（　　）、計画全体を見直す必要がある。
-- ============================================================
UPDATE quiz_questions
  SET question_text = '交渉の結果（　　）、計画全体を見直す必要がある。'
  WHERE id = 'd5c47f95-aacf-4d11-9618-8b95bfde3f81';

-- so=1: 정답 いかんによっては (is_correct 유지)
UPDATE quiz_question_options
  SET option_text = 'いかんによっては'
  WHERE id = 'db19c77a-109c-4088-afc4-076a24f4fe6a';

-- so=2: 오답 → にもかかわらず
UPDATE quiz_question_options
  SET option_text = 'にもかかわらず'
  WHERE id = '7f81f7ce-5112-485a-ac6f-a6b1e8ac2336';

-- so=3: 오답 → によらず
UPDATE quiz_question_options
  SET option_text = 'によらず'
  WHERE id = '0e4f046b-7b5a-4a06-8d15-6154f778a225';

-- so=4: 오답 → をよそに
UPDATE quiz_question_options
  SET option_text = 'をよそに'
  WHERE id = '2a9a3348-1005-4019-81e3-9e7c70cc43b7';


-- ============================================================
-- Q31 (sort_order=31): なり（直後の動作）
-- 旧: 意味ラベルを選ぶ形式
-- 新: 家に帰る（　　）、倒れてしまった。
-- ============================================================
UPDATE quiz_questions
  SET question_text = '家に帰る（　　）、倒れてしまった。'
  WHERE id = '5875bc4e-7f34-445b-894b-3990e85b91ef';

-- so=1: 오답 → とともに
UPDATE quiz_question_options
  SET option_text = 'とともに'
  WHERE id = '1295c9db-09cc-4422-bc14-aa9c19d8cbc5';

-- so=2: 정답 → なり (is_correct 유지)
UPDATE quiz_question_options
  SET option_text = 'なり'
  WHERE id = '6a5f0668-e348-48e8-9ca3-a6fc5ac35fbc';

-- so=3: 오답 → ついでに
UPDATE quiz_question_options
  SET option_text = 'ついでに'
  WHERE id = '6aea649c-c6aa-4dd2-8a74-be27bd53437e';

-- so=4: 오답 → かたわら
UPDATE quiz_question_options
  SET option_text = 'かたわら'
  WHERE id = '309488d4-63d4-4207-9ed3-eb7f71ab3ac4';


-- ============================================================
-- Q32 (sort_order=32): てやまない (文法ポイント全面置換)
-- 旧: をおいて → Q30 と重複するため別文法に変更
-- 新: 被災した地域の一日も早い復興を（　　）。
-- ============================================================
UPDATE quiz_questions
  SET question_text = '被災した地域の一日も早い復興を（　　）。'
  WHERE id = 'eb71350b-3198-4d31-b49e-3c50966ec91a';

-- so=1: 오답 → 願うのみだ
UPDATE quiz_question_options
  SET option_text = '願うのみだ', is_correct = false
  WHERE id = '2bf7bc4e-227f-4bff-8c50-90d55df590fb';

-- so=2: 오답 → 願うほかない
UPDATE quiz_question_options
  SET option_text = '願うほかない', is_correct = false
  WHERE id = 'd17c5523-3854-4ff2-8546-a5423e0c0fd4';

-- so=3: 오답 → 願いたい限りだ
UPDATE quiz_question_options
  SET option_text = '願いたい限りだ', is_correct = false
  WHERE id = 'b174af35-6661-40df-b158-5c6c9daec5d6';

-- so=4: 정답 → 願ってやまない (is_correct=true 유지)
UPDATE quiz_question_options
  SET option_text = '願ってやまない', is_correct = true
  WHERE id = '1d12a882-dcf9-400f-be95-8573a21821eb';


-- ============================================================
-- Q34 (sort_order=34): にあって
-- 旧: 意味説明を選ぶ形式
-- 新: 激動の時代（　　）、彼は冷静さを保ち続けた。
-- ============================================================
UPDATE quiz_questions
  SET question_text = '激動の時代（　　）、彼は冷静さを保ち続けた。'
  WHERE id = '037fbad7-1965-4605-8eee-197727db0990';

-- so=1: 오답 → において
UPDATE quiz_question_options
  SET option_text = 'において'
  WHERE id = '87c083c6-9a1f-424a-8d99-4132cbe18600';

-- so=2: 정답 → にあって (is_correct 유지)
UPDATE quiz_question_options
  SET option_text = 'にあって'
  WHERE id = '2b62c521-7f65-424d-88e2-e87534b281ca';

-- so=3: 오답 → のもとで
UPDATE quiz_question_options
  SET option_text = 'のもとで'
  WHERE id = 'ed16f17c-cabd-4deb-bc78-be6c3080d994';

-- so=4: 오답 → をもって
UPDATE quiz_question_options
  SET option_text = 'をもって'
  WHERE id = '71537a0b-72d3-4fd5-871d-ffa6ae3e049c';

COMMIT;
