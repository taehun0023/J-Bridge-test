-- 전수검토 2차: 문법 분류/의미 정정 + 교차레벨 중복 제거 + 누락 comprehension 1건
-- 분류(category) 정정
UPDATE jlpt_grammar SET category='manner' WHERE id IN (
  '8a4349a8-e19d-407e-88b7-4e5d8aa262cc',  -- 〜かたわら
  '132779e5-3760-4d98-b56d-e5b826bd7387'   -- 〜がてら
);
UPDATE jlpt_grammar SET category='conjecture' WHERE id='98ce0e32-bbbd-4038-af7b-f4f8505de5ab'; -- 〜わけだ

-- 의미(meaning_ko) 정정
UPDATE jlpt_grammar SET meaning_ko='(어쩔 수 없이) ~하게 되다, ~하도록 강요받다' WHERE id='e1c8e94b-5496-4dbf-8fe1-ac120f7267ce'; -- 〜させられる
UPDATE jlpt_grammar SET meaning_ko='~하기 시작하다 / ~하기를 마치다' WHERE id='cbf1673e-37d4-476e-81d1-b1583811deea'; -- 〜始める/終わる

-- 교차레벨 완전중복 제거 (상위/표준 레벨 유지)
DELETE FROM jlpt_grammar WHERE id IN (
  'b1c5ffc0-5d4b-42bb-8b33-5556248ff581',  -- N3 〜ことにする (N4 유지)
  '7e174e28-66e9-47d7-9f23-3c5303bd413f',  -- N3 〜ために (N4 유지)
  '4efdeeb5-2d05-47ce-a9ee-0adff20a28cc',  -- N3 〜てしまう (N4 유지)
  '8c1b1f0e-4bbd-43dd-82c0-f8a96fa072c6',  -- N3 〜ようにする (N4 유지)
  '63f41ad7-4f98-4f23-9ac1-0cad88908a07',  -- N3 〜ようになる (N4 유지)
  'cd171129-e6ed-41bc-bf04-6dacb953cdf2'   -- N1 〜なり〜なり (N2 유지)
);

-- fix3 누락분: 제목 오타(コンピータ→コンピュータ)
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='量子コンピュータの産業応用';
