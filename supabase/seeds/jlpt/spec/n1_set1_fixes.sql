-- N1 set1 검수 확정 수정 (교차검증 통과 항목만)
BEGIN;

-- Q31 (ade10031): 정답 きり → が最後
UPDATE quiz_question_options SET is_correct=false WHERE question_id='ade10031-0000-0000-0000-000000000000';
UPDATE quiz_question_options SET is_correct=true  WHERE question_id='ade10031-0000-0000-0000-000000000000' AND sort_order=2;
UPDATE quiz_questions SET explanation='「〜たが最後」= 일단 …하면 돌이킬 수 없이 …하게 된다. 「一度見たが最後、忘れられない名作だ」가 자연스럽다. 「きり」는 그 이후 계속 …하지 않음의 뜻이라 부적합.' WHERE id='ade10031-0000-0000-0000-000000000000';

-- Q7 (ade10007): 「共感を引いた」는 부자연 → 「共感を呼んだ」
UPDATE quiz_questions SET question_text = replace(question_text, 'を引いた', 'を呼んだ') WHERE id='ade10007-0000-0000-0000-000000000000';

-- Q37 (ade10037): 어순 문항 재구성 (정답 보기 없던 문제) → 「環境問題は国境を越えて取り組むべき課題だ」
UPDATE quiz_question_options SET is_correct=false WHERE question_id='ade10037-0000-0000-0000-000000000000';
UPDATE quiz_question_options SET option_text='国境',         is_correct=false WHERE question_id='ade10037-0000-0000-0000-000000000000' AND sort_order=1;
UPDATE quiz_question_options SET option_text='を',           is_correct=false WHERE question_id='ade10037-0000-0000-0000-000000000000' AND sort_order=2;
UPDATE quiz_question_options SET option_text='越えて',       is_correct=true  WHERE question_id='ade10037-0000-0000-0000-000000000000' AND sort_order=3;
UPDATE quiz_question_options SET option_text='取り組むべき', is_correct=false WHERE question_id='ade10037-0000-0000-0000-000000000000' AND sort_order=4;
UPDATE quiz_questions SET
  question_text = E'次の文の＿＿の部分に語句を入れて文を完成させるとき、★に入るものを選びなさい。\n\n環境問題は　＿＿　＿＿　★　＿＿　課題だ。',
  explanation = '正しい語順: 環境問題は[国境][を][越えて★][取り組むべき]課題だ。★には「越えて」が入る。'
  WHERE id='ade10037-0000-0000-0000-000000000000';

-- Q21 (adc30001-...0021, 即時応答): 정답 모호 → 일의적 문항으로 교체
UPDATE quiz_questions SET
  question_text = E'すみません、この資料、もう一部いただけますか。\n\n最も適切な応答を選びなさい。',
  explanation = '자료 한 부를 더 달라는 요청 → 「はい、すぐにお持ちします」가 적절. 나머지는 요청에 대한 응답으로 부자연스럽다.'
  WHERE id='adc30001-0000-0000-0000-000000000021';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='adc30001-0000-0000-0000-000000000021';
UPDATE quiz_question_options SET option_text='はい、すぐにお持ちします。',             is_correct=true  WHERE question_id='adc30001-0000-0000-0000-000000000021' AND sort_order=1;
UPDATE quiz_question_options SET option_text='いいえ、まだ読んでいません。',           is_correct=false WHERE question_id='adc30001-0000-0000-0000-000000000021' AND sort_order=2;
UPDATE quiz_question_options SET option_text='ええ、こちらこそありがとうございます。', is_correct=false WHERE question_id='adc30001-0000-0000-0000-000000000021' AND sort_order=3;

COMMIT;
