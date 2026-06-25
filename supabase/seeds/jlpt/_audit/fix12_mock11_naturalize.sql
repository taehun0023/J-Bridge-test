-- #11 aee20040-...002: 완성문 부자연(誰もが讃えるに余りある) 교정.
-- B안: 〜に余りある 유지 → 완성문 「彼女の功績は称賛に余りあるほどだ」
--   고정부에서 余りある 제거(타일화), 語群 4개·정답 교체.
--   배열: 功績は → 称賛に → ★余りある → ほどだ
-- 문제문: 끝의 고정 余りある 제거
UPDATE quiz_questions
SET question_text = replace(question_text, '余りある。', '。')
WHERE id = 'aee20040-0000-0000-0000-000000000002';

-- 語群(보기) 교체: sort_order 1~4 = 功績は / 称賛に / 余りある(정답) / ほどだ
UPDATE quiz_question_options SET option_text='功績は', is_correct=false
  WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='称賛に', is_correct=false
  WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='余りある', is_correct=true
  WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='ほどだ', is_correct=false
  WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=4;
