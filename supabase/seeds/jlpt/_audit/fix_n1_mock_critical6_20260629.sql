-- =============================================================
-- N1 모의고사 즉시수정 6건 (2026-06-29)
-- =============================================================

-- 1. SET3 언지 34번: をきっかけに → に反して (정답 2개 문제 해소)
UPDATE quiz_question_options
SET option_text = 'に反して'
WHERE id = '38ea78f1-4556-4182-a35c-60e3f4f0e7ed';

-- 2. SET2 언지 40번: 称賛に → 称賛して (称賛に余りある 비문 수정)
UPDATE quiz_question_options
SET option_text = '称賛して'
WHERE id = '3f74c9a7-1980-4afd-b9d5-d7f22dd974c0';

-- 3. SET3 언지 39번: 今の組織に → 今の組織には (助詞 修正)
UPDATE quiz_questions
SET question_text = '次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

この難局を打開できる人材は、今の組織には　_　_　★　_　いないだろう。'
WHERE id = '547e402a-2733-4653-8cb1-2391980afece';

-- 4. SET1 언지 30번: の指針に → の弊害に (오답이 정답에 너무 가까운 문제 해소)
UPDATE quiz_question_options
SET option_text = 'の弊害に'
WHERE id = '47dc6fa3-b738-4184-bf58-a57142c2af41';

-- 5. SET1 언지 32번: 生きることになった → 発揮されることになった (자연도 개선)
UPDATE quiz_questions
SET question_text = '次の文の（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

子供のころから培ってきた語学力が、海外勤務という機会（　　）発揮されることになった。'
WHERE id = 'aee10032-0000-0000-0000-000000000001';

-- 6. SET3 6번: 矜持 → 逡巡 (SET1 6번 중복 해소)
-- 문제 본문 교체
UPDATE quiz_questions
SET question_text = '_の言葉の読み方として最もよいものを、１・２・３・４から一つ選びなさい。

大事な局面でも<u>逡巡</u>せず即座に行動できる人こそ、真のリーダーと呼べるだろう。'
WHERE id = '20a4a407-e53f-4863-9d47-6ecd752ef9ec';

-- 선택지 교체 (矜持 읽기 → 逡巡 읽기)
UPDATE quiz_question_options SET option_text = 'しゅんじゅん', is_correct = true
WHERE id = 'da31faf9-fcea-4605-ae23-ff8bd92eec69';   -- sort_order 1 → 정답으로

UPDATE quiz_question_options SET option_text = 'じゅんしゅん', is_correct = false
WHERE id = '895a883c-bdf0-4541-9f7b-24415efcf46e';   -- sort_order 2

UPDATE quiz_question_options SET option_text = 'しゅんじん', is_correct = false
WHERE id = 'b6d766da-d576-47fb-a0ba-12a071f809d3';   -- sort_order 3

UPDATE quiz_question_options SET option_text = 'じゅんじん', is_correct = false
WHERE id = '64f11e40-e567-45d1-ba16-67f0f5d5ed43';   -- sort_order 4 (기존 정답 → 오답)
