\a
\t on
\pset footer off
\f '\t'

\o C:/workspace/J-Bridge-test/_export/N1_01_vocab.tsv
select word, reading, meaning_ko, part_of_speech from jlpt_vocabulary where jlpt_level='N1' order by reading;

\o C:/workspace/J-Bridge-test/_export/N1_02_kanji.tsv
select kanji, coalesce(reading_on,''), coalesce(reading_kun,''), meaning_ko from jlpt_kanji where jlpt_level='N1' order by kanji;

\o C:/workspace/J-Bridge-test/_export/N1_03_grammar.tsv
select pattern, meaning_ko, coalesce(formation,''), category from jlpt_grammar where jlpt_level='N1' order by pattern;

\o C:/workspace/J-Bridge-test/_export/N1_04_reading.txt
select string_agg(blk, E'\n\n========================================\n\n' order by so)
from (
  select sort_order so,
    '【'||title||'】'||E'\n'||passage||
    coalesce(E'\n\n[理解チェック] '||(comprehension->>'question')||E'\n'||
      (select string_agg('  ('||ord||') '||(case when (ord-1)=(comprehension->>'answer')::int then '★正解 ' else '' end)||elem, E'\n')
       from jsonb_array_elements_text(comprehension->'options') with ordinality as o(elem,ord)), '') as blk
  from jlpt_reading_passages where jlpt_level='N1'
) t;

\o C:/workspace/J-Bridge-test/_export/N1_05_listening.txt
select string_agg(blk, E'\n\n========================================\n\n' order by so)
from (
  select sort_order so,
    '【'||title||'】'||coalesce(' ('||situation||')','')||E'\n'||script||
    coalesce(E'\n\n[理解チェック] '||(comprehension->>'question')||E'\n'||
      (select string_agg('  ('||ord||') '||(case when (ord-1)=(comprehension->>'answer')::int then '★正解 ' else '' end)||elem, E'\n')
       from jsonb_array_elements_text(comprehension->'options') with ordinality as o(elem,ord)), '') as blk
  from jlpt_listening_scripts where jlpt_level='N1'
) t;

\o C:/workspace/J-Bridge-test/_export/N1_06_mock.txt
select string_agg(blk, E'\n\n' order by set_no, sort_order)
from (
  select ms.set_no, msq.sort_order,
    'set'||ms.set_no||' ['||msq.section||'] '||q.question_text||E'\n'||
    (select string_agg('   '||(case when qo.is_correct then '★ ' else '・ ' end)||qo.option_text, E'\n' order by qo.sort_order)
     from quiz_question_options qo where qo.question_id=q.id) as blk
  from jlpt_mock_sets ms
  join jlpt_mock_set_questions msq on msq.set_id=ms.id
  join quiz_questions q on q.id=msq.question_id
  where ms.level='N1'
) t;

\o
