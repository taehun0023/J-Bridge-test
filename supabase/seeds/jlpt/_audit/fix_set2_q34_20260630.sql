UPDATE quiz_question_options
  SET option_text = E'に反して'
  WHERE question_id = (
    SELECT msq.question_id FROM jlpt_mock_sets ms
    JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
    WHERE ms.level='N1' AND ms.set_no=2 AND msq.section='gengo_chishiki' AND msq.sort_order=34
  ) AND is_correct=false AND option_text = E'からこそ';
