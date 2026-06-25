\pset format unaligned
\pset fieldsep '|'
\pset footer off
\echo === set2 dokkai 社会関係資本 (最も強調) ===
select qq.id, left(qq.question_text,40) from quiz_questions qq
 join jlpt_mock_set_questions m on m.question_id=qq.id
 join jlpt_mock_sets s on s.id=m.set_id
 where s.level='N1' and s.set_no=2 and m.section='dokkai'
   and qq.question_text like '%社会関係資本%' and qq.question_text like '%最も%';
\echo === options of those ===
select o.question_id, o.sort_order, o.is_correct, left(o.option_text,50) from quiz_question_options o
 where o.question_id in (select qq.id from quiz_questions qq join jlpt_mock_set_questions m on m.question_id=qq.id join jlpt_mock_sets s on s.id=m.set_id where s.level='N1' and s.set_no=2 and m.section='dokkai' and qq.question_text like '%社会関係資本%' and qq.question_text like '%最も%')
 order by o.question_id, o.sort_order;
\echo === set2 SENTENCE_ORDER all (id + text) ===
select qq.id, qq.question_text from quiz_questions qq
 join jlpt_mock_set_questions m on m.question_id=qq.id
 join jlpt_mock_sets s on s.id=m.set_id
 where s.level='N1' and s.set_no=2 and qq.question_subtype='SENTENCE_ORDER'
 order by qq.sort_order;
