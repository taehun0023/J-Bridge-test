\pset format unaligned
\pset footer off
\t on
select coalesce(json_agg(json_build_object(
  'id', qq.id,
  'set', s.set_no,
  'sub', qq.question_subtype,
  'q', qq.question_text,
  'opts', (select json_agg(json_build_object('s',o.sort_order,'t',o.option_text,'c',o.is_correct) order by o.sort_order)
           from quiz_question_options o where o.question_id=qq.id)
) order by s.set_no, qq.sort_order)::text, '[]')
from quiz_questions qq
join jlpt_mock_set_questions m on m.question_id=qq.id
join jlpt_mock_sets s on s.id=m.set_id
where s.level='N1' and m.section='gengo_chishiki';
