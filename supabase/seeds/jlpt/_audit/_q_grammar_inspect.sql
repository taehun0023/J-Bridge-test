\pset format unaligned
\pset fieldsep '|'
\pset footer off
select id, jlpt_level, pattern, category, meaning_ko
from jlpt_grammar
where pattern similar to '%(がてら|かたわら|わけだ|させられる|始める|終わる|なり|ようにする|ことにする|ようになる|てしまう|ために)%'
order by jlpt_level, pattern;
